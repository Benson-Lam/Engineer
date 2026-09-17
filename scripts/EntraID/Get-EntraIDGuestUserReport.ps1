<#
.SYNOPSIS
    Exports a report of all guest (B2B) users in a Microsoft Entra ID tenant.

.DESCRIPTION
    Connects to Microsoft Graph and retrieves all guest user accounts in the
    tenant, including sign-in activity and account creation date, then exports
    the results to CSV. Useful for periodic guest access reviews and security
    hygiene.

.PARAMETER ExportPath
    Folder path where the CSV report will be saved. Defaults to the current directory.

.PARAMETER IncludeSignInActivity
    Switch to include last sign-in date/time for each guest user. Requires
    AuditLog.Read.All Graph permission.

.EXAMPLE
    .\Get-EntraIDGuestUserReport.ps1 -ExportPath "C:\Reports" -IncludeSignInActivity
    Exports a full guest user report, including sign-in activity, to C:\Reports.

.NOTES
    ===========================================================================
    Script Name : Get-EntraIDGuestUserReport.ps1
    Author      : Benson Lam
    Company     : cubesys Pty Ltd
    Copyright   : (c) 2026 Benson Lam. All rights reserved.
    License     : Apache License 2.0 - https://www.apache.org/licenses/LICENSE-2.0
    Version     : 1.0.0
    Date        : 2026-09-16
    GitHub      : https://github.com/Benson-Lam/Engineer
    LinkedIn    : https://www.linkedin.com/in/bensonl/
    ===========================================================================

    CHANGE LOG:
    1.0.0 - 2026-09-16 - Benson Lam - Initial release.

    REQUIRED MODULES:
    - Microsoft.Graph.Users
    - Microsoft.Graph.Reports (if -IncludeSignInActivity is used)

    REQUIRED PERMISSIONS (Microsoft Graph, delegated or app):
    - User.Read.All
    - AuditLog.Read.All (only if -IncludeSignInActivity is used)

    DISCLAIMER:
    This script is provided "AS IS", without warranty of any kind. Test in a
    non-production environment before use. See LICENSE and DISCLAIMER.md in
    the root of this repository for full terms. This is a documentation
    example included to demonstrate the repository's script header and
    structure conventions — validate and extend it for your environment
    before production use.
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param (
    [Parameter(Mandatory = $false)]
    [string]$ExportPath = (Get-Location).Path,

    [Parameter(Mandatory = $false)]
    [switch]$IncludeSignInActivity
)

begin {
    $ErrorActionPreference = 'Stop'
    Write-Verbose "Starting Entra ID guest user report generation..."

    try {
        if (-not (Get-MgContext)) {
            Connect-MgGraph -Scopes "User.Read.All", "AuditLog.Read.All" -NoWelcome
        }
    }
    catch {
        throw "Failed to connect to Microsoft Graph: $($_.Exception.Message)"
    }

    if (-not (Test-Path -Path $ExportPath)) {
        New-Item -Path $ExportPath -ItemType Directory -Force | Out-Null
    }
}

process {
    try {
        Write-Verbose "Retrieving guest users..."
        $guestUsers = Get-MgUser -Filter "userType eq 'Guest'" -All -Property Id, DisplayName, Mail, UserPrincipalName, CreatedDateTime, AccountEnabled

        $report = foreach ($user in $guestUsers) {
            $lastSignIn = $null
            if ($IncludeSignInActivity) {
                try {
                    $signInLog = Get-MgAuditLogSignIn -Filter "userId eq '$($user.Id)'" -Top 1 -ErrorAction SilentlyContinue
                    $lastSignIn = $signInLog.CreatedDateTime
                }
                catch {
                    Write-Warning "Could not retrieve sign-in activity for $($user.UserPrincipalName): $($_.Exception.Message)"
                }
            }

            [PSCustomObject]@{
                DisplayName       = $user.DisplayName
                Mail              = $user.Mail
                UserPrincipalName = $user.UserPrincipalName
                AccountEnabled    = $user.AccountEnabled
                CreatedDateTime   = $user.CreatedDateTime
                LastSignInDateTime = $lastSignIn
            }
        }
    }
    catch {
        throw "Failed to retrieve guest user data: $($_.Exception.Message)"
    }
}

end {
    $fileName = "EntraID-GuestUserReport-$(Get-Date -Format 'yyyyMMdd-HHmmss').csv"
    $fullPath = Join-Path -Path $ExportPath -ChildPath $fileName

    if ($PSCmdlet.ShouldProcess($fullPath, "Export guest user report")) {
        $report | Export-Csv -Path $fullPath -NoTypeInformation -Encoding UTF8
        Write-Host "Guest user report exported to: $fullPath" -ForegroundColor Green
    }
}
