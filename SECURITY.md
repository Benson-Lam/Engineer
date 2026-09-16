# Security Policy

## ⚠️ Nature of This Repository

This repository contains PowerShell scripts and administrative tools that interact with **Microsoft 365, Azure, Intune, SCCM, AVD, and Entra ID** environments. Some scripts may require elevated/administrative permissions to function. Security is treated as a first-class concern for this project.

---

## 📋 Supported Versions

Security fixes are applied to the following:

| Version | Supported |
|---|---|
| Latest release (`main`) | ✅ |
| Previous major release | ✅ (critical fixes only) |
| Older releases | ❌ |

Always pull the latest release from the [Releases](../../releases) page to ensure you have the most current, patched version of any tool.

---

## 🔒 Reporting a Vulnerability

**Please do not open a public GitHub issue for security vulnerabilities.**

If you discover a security vulnerability, credential exposure risk, logic flaw with security implications, or unsafe default behaviour in any script or tool in this repository, please report it privately using one of the following methods:

1. **GitHub Private Vulnerability Reporting** (preferred): Use the **"Report a vulnerability"** option under the repository's **Security** tab, if enabled.
2. **Direct contact**: Reach out via [LinkedIn](https://www.linkedin.com/in/bensonlam/) with a clear subject line such as "Security Report — Engineer Repository."

Please include:

- A clear description of the vulnerability or concern.
- The affected script(s)/tool(s) and version/commit.
- Steps to reproduce, if applicable.
- Potential impact (e.g., privilege escalation, credential exposure, data disclosure).

### What to expect

- **Acknowledgement** within a reasonable timeframe.
- An assessment of the issue and, where confirmed, a plan and estimated timeframe for a fix.
- Credit in the `CHANGELOG.md` and/or release notes, if desired by the reporter, once resolved.
- Coordinated disclosure — please allow time for a fix to be published before public disclosure.

---

## 🛡️ Security Best Practices for Users

Because these tools can interact with production identity, device, and cloud management systems, users should:

- **Review all script contents** before execution — never run a script from this or any repository blindly against a production tenant.
- **Test in a non-production/lab tenant** first.
- **Apply least-privilege access** — use scoped app registrations, Conditional Access, and role-based access control rather than global admin accounts wherever possible.
- **Never commit secrets** (API keys, client secrets, certificates, passwords, tenant-specific identifiers) when contributing or forking.
- **Keep dependencies current** — PowerShell modules (e.g., `Microsoft.Graph`, `Az`) should be kept up to date to receive upstream security fixes.
- **Enable auditing/logging** in your tenant when running administrative automation, so actions can be traced.

---

## 🔁 Dependency & Module Security

This repository relies on official Microsoft PowerShell modules (e.g., `Microsoft.Graph`, `Az`, `ExchangeOnlineManagement`). Users are responsible for sourcing these modules from the official [PowerShell Gallery](https://www.powershellgallery.com/) and keeping them updated. Where applicable, Dependabot and GitHub security alerts are enabled on this repository (see repository settings) to flag known vulnerabilities in workflow dependencies.

---

## 📄 Related Documents

- [`DISCLAIMER.md`](DISCLAIMER.md) — liability and "as is" terms.
- [`CONTRIBUTING.md`](CONTRIBUTING.md) — contribution and script safety standards.

Thank you for helping keep this project and its users secure.
