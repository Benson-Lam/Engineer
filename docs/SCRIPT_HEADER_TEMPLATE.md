# Standard PowerShell Script Header Template

Every script in this repository **must** begin with this header block. It ensures consistent attribution, licensing clarity, and traceability across the entire project. Copy the template below into new scripts and fill in the fields.

## Template

```powershell
<#
.SYNOPSIS
    Short one-line description of what this script does.

.DESCRIPTION
    A more detailed description of the script's purpose, behaviour,
    and any important context an administrator should know before running it.

.PARAMETER ExampleParameter
    Description of the parameter.

.EXAMPLE
    .\Verb-Noun.ps1 -ExampleParameter "Value"
    Description of what this example does.

.NOTES
    ===========================================================================
    Script Name : Verb-Noun.ps1
    Author      : Benson Lam
    Company     : cubesys Pty Ltd
    Copyright   : (c) 2026 Benson Lam. All rights reserved.
    License     : Apache License 2.0 - https://www.apache.org/licenses/LICENSE-2.0
    Version     : 1.0.0
    Date        : 2026-09-16
    GitHub      : https://github.com/Benson-Lam/Engineer
    LinkedIn    : https://www.linkedin.com/in/bensonlam/
    ===========================================================================

    CHANGE LOG:
    1.0.0 - 2026-09-16 - Benson Lam - Initial release.

    DISCLAIMER:
    This script is provided "AS IS", without warranty of any kind. Test in a
    non-production environment before use. See LICENSE and DISCLAIMER.md in
    the root of this repository for full terms.
#>

[CmdletBinding(SupportsShouldProcess = $true)]
param (
    [Parameter(Mandatory = $true)]
    [string]$ExampleParameter
)

# Script body starts here
```

## Field Reference

| Field | Description |
|---|---|
| **Script Name** | The actual filename, using `Verb-Noun.ps1` PowerShell naming convention. |
| **Author** | Benson Lam (or the contributor's name, if submitted via PR — see below). |
| **Company** | cubesys Pty Ltd (only include if directly relevant/professionally authored; optional for community contributions). |
| **Copyright** | `(c) <year> Benson Lam. All rights reserved.` — reflects the Apache 2.0 copyright retention. |
| **License** | Always Apache License 2.0, with link. |
| **Version** | SemVer version of this individual script, independent of the overall repo release version. |
| **Date** | Date of initial authorship or last major revision (`YYYY-MM-DD`). |
| **GitHub** | Link to the repository. |
| **LinkedIn** | Author's LinkedIn profile, for professional attribution. |

## Notes on Community Contributions

If a script is contributed by someone other than the repository owner, retain the original `Author`/`Copyright` fields for the contributor (consistent with Apache 2.0, which permits contributors to retain their own copyright on their contribution), and add a line such as:

```powershell
    Contributed to the "Engineer" project by <Repository Owner Name>
    Repository maintained by Benson Lam - https://github.com/Benson-Lam/Engineer
```

This keeps individual authorship accurate while maintaining clear project-level attribution.
