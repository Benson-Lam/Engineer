# Recommended Repository Badges

These badges are already embedded at the top of [`README.md`](../README.md). Reference list below in case you want to reuse, rearrange, or add to them (e.g., in tool-specific READMEs).

Replace `Benson-Lam` with your actual GitHub username/org once the repository is published.

```markdown
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%20%7C%207%2B-5391FE?logo=powershell&logoColor=white)](https://github.com/PowerShell/PowerShell)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/Benson-Lam/Engineer)](../../releases)
[![GitHub issues](https://img.shields.io/github/issues/Benson-Lam/Engineer)](../../issues)
[![GitHub last commit](https://img.shields.io/github/last-commit/Benson-Lam/Engineer)](../../commits/main)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)
[![Maintained by Benson Lam](https://img.shields.io/badge/Maintained%20by-Benson%20Lam-informational)](https://www.linkedin.com/in/bensonlam/)
```

## Optional Additional Badges

Add these once relevant (e.g., once CI is active, or once the repo has meaningful star/fork counts):

```markdown
[![GitHub stars](https://img.shields.io/github/stars/Benson-Lam/Engineer?style=social)](../../stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Benson-Lam/Engineer?style=social)](../../network/members)
[![CI - PSScriptAnalyzer](https://github.com/Benson-Lam/Engineer/actions/workflows/psscriptanalyzer.yml/badge.svg)](../../actions/workflows/psscriptanalyzer.yml)
[![Contributors](https://img.shields.io/github/contributors/Benson-Lam/Engineer)](../../graphs/contributors)
[![GitHub repo size](https://img.shields.io/github/repo-size/Benson-Lam/Engineer)](.)
```

## Badge Style Guidance

- Keep badges consistent in style (all `flat` or all `flat-square` via `?style=flat-square` query param) — don't mix styles.
- Limit to 6–9 badges max in the main README to avoid visual clutter.
- License and PowerShell version badges should always appear first — they answer the two questions a visiting engineer asks fastest: *"Can I use this?"* and *"Does this apply to my environment?"*
