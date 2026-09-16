# Contributing to Engineer

First off — thank you for considering a contribution. This project exists to give IT Administrators and Cloud Engineers a reliable, growing library of real-world automation, and community contributions are what make that possible.

This document outlines how to contribute effectively and what to expect from the review process.

---

## 📜 Code of Conduct

By participating in this project, you agree to uphold the standards set out in [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md). Please read it before contributing.

---

## 🧭 Ways to Contribute

- **Report a bug** using the [Bug Report template](.github/ISSUE_TEMPLATE/bug_report.md).
- **Suggest a feature or new tool** using the [Feature Request template](.github/ISSUE_TEMPLATE/feature_request.md).
- **Submit a new script/tool** that fits the scope of this repository (Microsoft 365, Azure, Intune, SCCM, AVD, Entra ID, PowerShell, Security, Automation, Dashboards).
- **Improve documentation** — README clarity, usage examples, and inline comments are always welcome.
- **Review open pull requests** and provide constructive feedback.

---

## 🌱 Getting Started

1. **Fork** the repository to your own GitHub account.
2. **Clone** your fork locally:
   ```powershell
   git clone https://github.com/<your-username>/Engineer.git
   cd Engineer
   ```
3. **Create a feature branch** off `main`:
   ```powershell
   git checkout -b feature/short-description
   ```
   Use a clear prefix: `feature/`, `fix/`, `docs/`, or `chore/`.
4. Make your changes, following the [Script Standards](#-script-standards) below.
5. **Commit** with a clear, descriptive message:
   ```powershell
   git commit -m "Add: Intune device compliance export script"
   ```
6. **Push** your branch and open a **Pull Request** against `main` using the [PR template](.github/PULL_REQUEST_TEMPLATE.md).

---

## 🧱 Script Standards

To keep the repository consistent, professional, and safe to use, all submitted scripts must:

1. **Use the standard script header** — see [`docs/SCRIPT_HEADER_TEMPLATE.md`](docs/SCRIPT_HEADER_TEMPLATE.md). This includes Author, Copyright, License, Version, Date, GitHub link, and Description.
2. **Include comment-based help** (`.SYNOPSIS`, `.DESCRIPTION`, `.PARAMETER`, `.EXAMPLE`) using standard PowerShell conventions.
3. **Avoid hardcoded secrets, credentials, tenant IDs, or environment-specific values.** Use parameters, environment variables, or secure credential stores instead.
4. **Use approved PowerShell verbs** (`Get-`, `Set-`, `New-`, `Remove-`, etc. — see `Get-Verb`).
5. **Include error handling** (`try/catch`, meaningful terminating/non-terminating error messages) rather than silently failing.
6. **Be idempotent where practical** — running a script twice should not cause unintended side effects.
7. **Avoid destructive defaults.** Any script capable of deleting, disabling, or modifying production resources should support a `-WhatIf` / `-Confirm` pattern or a `-DryRun` switch, and should default to the safest behaviour.
8. **Be placed in the correct folder**:
   - `/scripts` — general-purpose administrative scripts.
   - `/tools` — larger multi-file utilities.
   - `/dashboards` — reporting/dashboard tooling.
   - `/examples` — sample usage, configs, or reference implementations.
   - `/docs` — documentation supporting a tool.
9. **Include a short tool-level README.md** for anything beyond a single simple script.

---

## ✅ Pull Request Checklist

Before submitting, please confirm:

- [ ] My script follows the standard header template.
- [ ] I have tested this in a non-production/lab environment.
- [ ] I have not committed any secrets, credentials, or tenant-specific data.
- [ ] I have added/updated documentation (tool README and/or comment-based help).
- [ ] I have updated `CHANGELOG.md` under the "Unreleased" section, where appropriate.
- [ ] My changes do not duplicate an existing tool without adding meaningful value (if unsure, open an issue first to discuss).

---

## 🔍 Review Process

- All pull requests are reviewed by the maintainer (or designated reviewers) before merging.
- You may be asked to make changes for clarity, safety, consistency, or scope.
- Large or architecturally significant contributions are best discussed via an issue **before** submitting a PR, to avoid duplicated effort.
- By submitting a contribution, you agree that it is licensed under the [Apache License 2.0](LICENSE), consistent with the rest of the repository.

---

## 🙋 Questions

If you're unsure whether something fits the scope of this repository, or want feedback on an idea before building it, please open a [Discussion](../../discussions) or a [Feature Request issue](.github/ISSUE_TEMPLATE/feature_request.md) first.

Thank you for helping improve **Engineer** for the wider IT/Cloud community.
