# Recommended GitHub Repository Settings

This document captures the recommended configuration for the **Engineer** repository. Apply these under **Settings** in GitHub after the repository is created.

---

## 1. General

- **Repository visibility:** Public
- **Default branch:** `main`
- **Features to enable:**
  - ✅ Issues
  - ✅ Discussions *(recommended — see below)*
  - ✅ Projects *(optional, useful for roadmap tracking)*
  - ⬜ Wiki *(see recommendation below)*
  - ✅ Preserve this repository (GitHub Archive Program opt-in — optional but good for long-term community projects)
  - ✅ Sponsorships *(optional, if you want to enable GitHub Sponsors later)*

---

## 2. Branch Protection Rules (for `main`)

Go to **Settings → Branches → Add branch protection rule**:

- **Branch name pattern:** `main`
- ✅ Require a pull request before merging
  - ✅ Require approvals: **1** (yourself or a trusted maintainer, minimum)
  - ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Require status checks to pass before merging *(once CI/PSScriptAnalyzer workflow is added)*
  - ✅ Require branches to be up to date before merging
- ✅ Require conversation resolution before merging
- ✅ Require signed commits *(optional, recommended for higher trust/security posture)*
- ✅ Do not allow bypassing the above settings *(applies rules to admins too — optional but good practice for a security-focused repo)*
- ⬜ Allow force pushes: **Disabled**
- ⬜ Allow deletions: **Disabled**

---

## 3. Discussions

**Recommendation: Enable.**

Discussions are well suited to this project because:
- Users will have tenant-specific questions ("does this work with X licensing tier?") that don't belong as bug reports.
- It provides a space for community Q&A, ideas, and "show and tell" (users sharing how they've adapted a script) without cluttering the Issues board.

Suggested categories: `Announcements`, `Q&A`, `Ideas`, `Show and Tell`, `General`.

---

## 4. Wiki

**Recommendation: Disabled initially.**

Keep documentation inside the repository itself (`/docs`, tool-level `README.md` files) so it is version-controlled, reviewable via pull request, and stays in sync with code changes. Enable the Wiki later only if the project grows to need long-form, loosely-structured community documentation that doesn't fit the PR review model.

---

## 5. Releases

**Recommendation: Enable and use actively.**

- Tag releases using **SemVer** (`v1.0.0`, `v1.1.0`, etc.) — see [`CHANGELOG.md`](../CHANGELOG.md).
- Each release should include:
  - A summary of changes (can be copied from `CHANGELOG.md`).
  - Any breaking changes clearly flagged.
  - Optionally, a zipped snapshot of stable tools if you want to offer a "tested bundle" separate from `main`.
- Mark early releases as **Pre-release** if the tool set is still stabilising.

---

## 6. Security Alerts & Dependabot

Go to **Settings → Code security and analysis**:

- ✅ **Dependency graph** — Enable
- ✅ **Dependabot alerts** — Enable
- ✅ **Dependabot security updates** — Enable
- ✅ **Secret scanning** — Enable (important given this repo touches credentials/tenant automation)
- ✅ **Secret scanning push protection** — Enable (blocks commits containing detectable secrets before they land in history)
- ✅ **Code scanning (CodeQL)** — Enable if/when the repository grows beyond PowerShell-only content, or use PSScriptAnalyzer via a GitHub Action instead (PowerShell isn't natively covered by CodeQL).

A sample Dependabot configuration is provided at [`.github/dependabot.yml`](../.github/dependabot.yml) to keep GitHub Actions dependencies current.

---

## 7. About Section (sidebar)

- **Description:** (see [`docs/REPO_DESCRIPTION.md`](REPO_DESCRIPTION.md))
- **Website:** Link to your LinkedIn or a future project site.
- **Topics:** (see [`docs/GITHUB_TOPICS.md`](GITHUB_TOPICS.md))
- ✅ Check "Releases", "Packages" (if used), and "Environments" visibility as relevant.

---

## 8. Community Standards Checklist

GitHub scores repositories against a "Community Standards" checklist (**Insights → Community Standards**). This repository is structured to satisfy all of them out of the box:

- [x] Description
- [x] README
- [x] Code of Conduct
- [x] Contributing guidelines
- [x] License
- [x] Security policy
- [x] Issue templates
- [x] Pull request template
