<div align="center">

# 🛠️ Engineer

**PowerShell scripts, administrative tools, and dashboards for IT Administrators, Cloud, Microsoft 365, Azure, Intune, SCCM, AVD, Entra ID, Security, and Automation.**

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?logo=powershell&logoColor=white)](https://github.com/PowerShell/PowerShell)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/<your-github-username>/Engineer)](../../releases)
[![GitHub issues](https://img.shields.io/github/issues/<your-github-username>/Engineer)](../../issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/<your-github-username>/Engineer)](../../commits/main)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Maintained by Benson Lam](https://img.shields.io/badge/Maintained%20by-Benson%20Lam-informational)](https://www.linkedin.com/in/bensonlam/)

</div>

---

## 📖 Project Overview

**Engineer** is a curated, growing collection of PowerShell scripts, administrative utilities, and dashboards built to solve real, everyday problems faced by IT Administrators and Cloud Engineers working across **Microsoft 365, Azure, Microsoft Intune, SCCM (Configuration Manager), Azure Virtual Desktop (AVD), Microsoft Entra ID**, and broader enterprise automation and security workflows.

Every tool in this repository is written from hands-on operational experience — the goal is not to publish theoretical scripts, but **production-tested, reusable automation** that reduces manual effort, improves consistency, and strengthens the security posture of the environments it's used in.

This repository is maintained by **Benson Lam, Cloud Technical Lead at cubesys Pty Ltd**, and is released under the **Apache License 2.0** to encourage community use, contribution, and collaboration — while preserving author attribution and patent protection.

---

## ✨ Features

- 🔹 **PowerShell-first** — modular, well-commented scripts designed to be read, understood, and safely adapted.
- 🔹 **Microsoft 365 & Entra ID tooling** — user lifecycle, licensing, reporting, and hygiene scripts.
- 🔹 **Azure automation** — resource management, cost/utilization helpers, and governance scripts.
- 🔹 **Intune & SCCM (Configuration Manager)** — device compliance, application deployment, and reporting tools.
- 🔹 **Azure Virtual Desktop (AVD)** — session host management and environment health scripts.
- 🔹 **Security & Automation** — hardening checks, audit scripts, and scheduled automation helpers.
- 🔹 **Dashboards** — lightweight reporting/dashboard tooling for operational visibility.
- 🔹 **Consistent script headers** — every script is traceable to its author, license, and version.
- 🔹 **Community-first structure** — issue templates, contribution guidelines, and a clear roadmap.

---

## 📸 Screenshots

> Screenshots and demo GIFs for each tool are stored in [`/images`](./images) and linked from each tool's own README where applicable.

| Tool | Preview |
|---|---|
| _Example Dashboard_ | ![Dashboard Preview](./images/dashboard-preview-placeholder.png) |
| _Example Script Output_ | ![Script Output Preview](./images/script-output-placeholder.png) |

*(Add tool-specific screenshots as new tools are published.)*

---

## 📦 Installation

### Option 1 — Clone the repository

```powershell
git clone https://github.com/Benson-Lam/Engineer.git
cd Engineer
```

### Option 2 — Download a specific release

Download a versioned, tested release from the [Releases](../../releases) page rather than the `main` branch if you want stability.

### Option 3 — Download a single script

Each script is self-contained where possible. You can download an individual `.ps1` file directly from the relevant `/scripts`, `/tools`, or `/dashboards` subfolder.

### Requirements check

Before running any script, review its header block and the [Requirements](#-requirements) section below for required PowerShell version and modules.

---

## 🚀 Usage

1. Browse the relevant category folder (`/scripts`, `/tools`, `/dashboards`) or use the repository search to find the tool you need.
2. Open the script and read the header block — it documents purpose, parameters, and prerequisites.
3. Review the script fully before running it in any production environment (see [Disclaimer](#-disclaimer)).
4. Run with appropriate administrative/Graph/Azure permissions as documented per script, for example:

```powershell
.\Get-IntuneDeviceComplianceReport.ps1 -TenantId "<tenant-id>" -ExportPath "C:\Reports"
```

5. Each tool folder may contain its own `README.md` with tool-specific usage instructions, parameters, and examples.

---

## 🧰 Requirements

- **PowerShell 5.1** (Windows PowerShell) or **PowerShell 7+** (cross-platform), as specified per script.
- Relevant **Microsoft modules**, depending on the tool, which may include:
  - `Microsoft.Graph` / `Microsoft.Graph.Intune`
  - `Az` / `Az.Accounts` / `Az.Resources`
  - `ExchangeOnlineManagement`
  - `Microsoft.Online.SharePoint.PowerShell`
  - SCCM/ConfigMgr console PowerShell module (`ConfigurationManager.psd1`)
- Appropriate **role-based access** (e.g., Intune Administrator, Global Reader, Azure RBAC roles) as documented per script.
- Network access to the relevant Microsoft 365 / Azure endpoints.

Individual scripts will list their exact dependencies in the script header and/or an accompanying `README.md`.

---

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome and genuinely encouraged — this project grows through community input.

Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) before submitting a pull request. In short:

- Fork the repository and create a feature branch.
- Follow the existing script header and folder conventions.
- Test your script/tool before submitting.
- Open a pull request using the provided [PR template](.github/PULL_REQUEST_TEMPLATE.md).

All contributions are accepted under the terms of the [Apache License 2.0](LICENSE).

---

## 💬 Support

- 🐛 **Found a bug?** Open a [Bug Report](../../issues/new?template=bug_report.md).
- 💡 **Have an idea?** Open a [Feature Request](../../issues/new?template=feature_request.md).
- 💭 **General questions or ideas?** Use [GitHub Discussions](../../discussions) (if enabled) for open-ended conversation.
- 🔒 **Security concern?** Please follow the process in [`SECURITY.md`](SECURITY.md) — do **not** open a public issue for vulnerabilities.

---

## 🗺️ Roadmap

- [ ] Expand Intune device compliance & reporting scripts.
- [ ] Add Entra ID conditional access audit and reporting tools.
- [ ] Add SCCM/ConfigMgr application deployment health-check scripts.
- [ ] Build a lightweight web-based dashboard for aggregated reporting.
- [ ] Add Pester-based automated testing for core scripts.
- [ ] Publish contribution "good first issue" labels to encourage community involvement.
- [ ] Expand AVD session host and FSLogix diagnostic tooling.

See the [Issues](../../issues) board for the live, up-to-date roadmap and progress.

---

## 🔖 Versioning

This project follows [Semantic Versioning (SemVer)](https://semver.org/) — `MAJOR.MINOR.PATCH`:

- **MAJOR** — breaking changes to script parameters/behaviour.
- **MINOR** — new tools/scripts or backward-compatible functionality.
- **PATCH** — bug fixes and non-breaking improvements.

See [`CHANGELOG.md`](CHANGELOG.md) for a full history of changes, and [`/releases`](./releases) / the GitHub [Releases](../../releases) page for packaged versions.

---

## ⚖️ License

This project is licensed under the **Apache License, Version 2.0** — see [`LICENSE`](LICENSE) for full details.

You are free to use, modify, and redistribute this software (including commercially), provided that you retain the original copyright notice, license text, and attribution notices as required by the Apache 2.0 license. See the [`NOTICE`](NOTICE) file for attribution requirements.

> ⚠️ Also see the [Disclaimer](#-disclaimer) below regarding use in production environments.

---

## ⚠️ Disclaimer

The scripts and tools in this repository interact with administrative and production systems, including **Microsoft 365, Azure, Intune, SCCM, AVD, and Entra ID**. They are provided **"AS IS"**, without warranty of any kind.

- Always **review and test scripts in a non-production environment first**.
- You are responsible for validating that a script is appropriate for your environment before running it.
- The author and contributors accept **no liability** for data loss, downtime, misconfiguration, or any other damage resulting from the use of these tools.
- Some scripts may require **highly privileged access** (e.g., Global Administrator, Intune Administrator). Apply the principle of least privilege wherever possible.

See the full [`DISCLAIMER.md`](DISCLAIMER.md) for complete terms.

---

## 👤 Author

**Benson Lam**
Cloud Technical Lead @ [cubesys Pty Ltd](https://cubesys.com.au)

- 🔗 LinkedIn: [linkedin.com/in/bensonl](https://www.linkedin.com/in/bensonl/)
- 💻 GitHub: [@Benson-Lam](https://github.com/Benson-Lam)

If this project has helped you, please consider ⭐ **starring the repository** — it helps others discover the project and supports continued development.

---

<div align="center">

Copyright © 2026 **Benson Lam** — Released under the [Apache License 2.0](LICENSE)

</div>
