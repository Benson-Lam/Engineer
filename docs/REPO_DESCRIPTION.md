# Repository Description & "About" Section

## Short Description (GitHub repo tagline — under 350 characters)

Use this in the GitHub repository's top-level **Description** field (Settings → General, or the "Edit" gear icon next to About on the repo homepage):

> **Engineer** — A curated collection of PowerShell scripts and admin tools for Microsoft 365, Azure, Intune, SCCM, AVD, and Entra ID. Built by a Cloud Technical Lead for real-world IT automation, security, and reporting. Apache 2.0 licensed — free for personal and commercial use.

*(318 characters — within the 350 character limit.)*

### Alternative shorter version (for tighter UI contexts)

> PowerShell scripts and admin tools for Microsoft 365, Azure, Intune, SCCM, AVD & Entra ID — automation, security, and dashboards, built from real-world IT operations. Apache 2.0 licensed.

*(196 characters.)*

---

## GitHub "About" Sidebar Configuration

When editing the About section on the repository homepage:

| Field | Value |
|---|---|
| **Description** | Use the short description above. |
| **Website** | `https://www.linkedin.com/in/bensonlam/` (or a future project landing page) |
| **Topics** | See [`GITHUB_TOPICS.md`](GITHUB_TOPICS.md) |
| ☑️ **Releases** | Enabled |
| ☑️ **Packages** | Leave disabled unless you publish a PowerShell Gallery module later |
| ☑️ **Deployments** | Leave disabled (not applicable to this project type) |

---

## Suggested "Social Preview" Image

GitHub allows a custom social preview image (Settings → General → Social preview) shown when the repo is linked on LinkedIn/Twitter/Slack. Recommended:

- Dimensions: **1280×640px**
- Content: "Engineer" wordmark/logo, a short tagline ("PowerShell & Cloud Admin Tools"), and optionally the Microsoft 365 / Azure / Intune icon set (used descriptively, not as an implied Microsoft endorsement).
- Store the source design in `/images/social-preview.png`.
