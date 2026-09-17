<#
.SYNOPSIS
    Recursively scans a target folder and exports a size/inventory report to CSV for use with the SizeScope visualisation tool.

.DESCRIPTION
    Walks a target folder and all of its subfolders, recording per-item size, type,
    extension, file counts, and timestamps. Folder sizes are calculated cumulatively
    (including every nested file). The resulting CSV can be opened directly in the
    SizeScope HTML tool (drag-and-drop, or the "Open CSV" button) to visualise
    storage usage, or used on its own as a general-purpose folder/file inventory
    report.

.PARAMETER folderPath
    The root folder to scan. Update the placeholder value below before running.

.PARAMETER outputFolder
    Folder where the CSV report will be saved. Update the placeholder value below
    before running. Created automatically if it does not already exist.

.PARAMETER outputCsvFile
    Filename for the generated CSV report. Update the placeholder value below
    before running.

.EXAMPLE
    After updating the three placeholder values below, run:
    .\Get-FolderSizeReport.ps1
    This scans the configured folder and writes the CSV report to the configured
    output path, ready to open in SizeScope.

.NOTES
    ===========================================================================
    Script Name : Get-FolderSizeReport.ps1
    Author      : Benson Lam
    Company     : cubesys Pty Ltd
    Copyright   : (c) 2026 Benson Lam. All rights reserved.
    License     : Apache License 2.0 - https://www.apache.org/licenses/LICENSE-2.0
    Version     : 1.0.0
    Date        : 2026-09-16
    GitHub      : https://github.com/Benson-Lam/Engineer
    LinkedIn    : https://www.linkedin.com/in/bensonl/
    ===========================================================================

    Part of the SizeScope toolset — this script is the data-discovery half,
    paired with the SizeScope HTML report viewer. Run this against the folder
    you want to analyse, then open the generated CSV in SizeScope.

    DISCLAIMER:
    Provided "AS IS", without warranty of any kind. Recursive scans of very
    large volumes or network shares may take significant time and generate
    meaningful disk/network I/O — test against a small folder first. See
    LICENSE and DISCLAIMER.md in the root of the "Engineer" repository for
    full terms.
#>

# ---------------------------------------------------------------------------
# STEP 1: Update these three values before running
# ---------------------------------------------------------------------------
$folderPath    = "<PROVIDE THE SOURCE PATH>"
$outputFolder  = "<PROVIDE THE OUTPUT FOLDER PATH>"
$outputCsvFile = "<PROVIDE THE OUTPUT FILENAME>.csv"
$outputCsv = "$outputFolder\$outputCsvFile"

# Create the output folder if it does not exist
if (-not (Test-Path -LiteralPath $outputFolder))
{
    New-Item -Path $outputFolder -ItemType Directory -Force | Out-Null
}

# Confirm the source folder exists
if (-not (Test-Path -LiteralPath $folderPath))
{
    throw "The source folder does not exist or is not accessible: $folderPath"
}

Write-Host "Scanning files and folders under: $folderPath"

# Include the root folder itself, followed by all child files and folders
$items = @(
    Get-Item -LiteralPath $folderPath -Force -ErrorAction Stop

    Get-ChildItem `
        -LiteralPath $folderPath `
        -Recurse `
        -Force `
        -ErrorAction SilentlyContinue
)

$report = foreach ($item in $items)
{
    if ($item.PSIsContainer)
    {
        # Calculate cumulative folder size, including all files in subfolders
        $folderMeasurement = Get-ChildItem `
            -LiteralPath $item.FullName `
            -Recurse `
            -Force `
            -File `
            -ErrorAction SilentlyContinue |
            Measure-Object -Property Length -Sum

        $sizeBytes = if ($null -eq $folderMeasurement.Sum)
        {
            0
        }
        else
        {
            [long]$folderMeasurement.Sum
        }

        $fileCount = $folderMeasurement.Count
        $itemType = "Folder"
        $extension = $null
    }
    else
    {
        $sizeBytes = [long]$item.Length
        $fileCount = 1
        $itemType = "File"
        $extension = $item.Extension
    }

    [PSCustomObject]@{
        FullName      = $item.FullName
        Name          = $item.Name
        ItemType      = $itemType
        Extension     = $extension
        SizeBytes     = $sizeBytes
        SizeMB        = [math]::Round(($sizeBytes / 1MB), 2)
        SizeGB        = [math]::Round(($sizeBytes / 1GB), 4)
        FileCount     = $fileCount
        Attributes    = $item.Attributes
        CreationTime  = $item.CreationTime
        LastWriteTime = $item.LastWriteTime
        LastAccessTime = $item.LastAccessTime
        DirectoryName = if ($item.PSIsContainer)
        {
            $item.Parent.FullName
        }
        else
        {
            $item.DirectoryName
        }
    }
}

# Export the report to CSV, largest items first
$report |
    Sort-Object -Property SizeBytes -Descending |
    Export-Csv `
        -Path $outputCsv `
        -NoTypeInformation `
        -Encoding UTF8

Write-Host "CSV report generated at: $outputCsv"
Write-Host "Items reported: $($report.Count)"
