# SizeScope Changelog

All notable changes to the **SizeScope** tool — both `index.html` (the viewer) and its paired `Get-FolderSizeReport.ps1` (the discovery script) — are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this tool follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html). `index.html` and `Get-FolderSizeReport.ps1` are versioned independently (see each file's own header block).

---

## [Unreleased]

### Added
- Placeholder for upcoming changes.

---

## index.html

### [3.0.6] - 2026-09-17

#### Added
- In-app **change log** modal, giving users visibility into recent fixes without leaving the tool.
- **Collapsible panes** for a more flexible layout.
- Header **logo** embedded directly in the page (as a base64 image, keeping the tool fully self-contained/offline).

#### Fixed
- Auto-resize behaviour for the file/folder tree view.
- A view-sorting bug.
- A broken placeholder in the embedded discovery-script modal (`$outputFolder` was missing its closing `>`).
- Incorrect LinkedIn URL in the page header attribution and the embedded discovery script (was pointing to the wrong handle).

#### Changed
- Standardized the author/copyright/license/version header block at the top of the page and script, consistent with the rest of the [Engineer](../../) repository's script header convention.
- `localStorage` calls (theme preference only) wrapped in `try/catch` for robustness in restricted browser contexts.

#### Security
- Confirmed and documented: the tool makes no network requests of any kind. All CSV parsing and rendering happens locally in the browser; `localStorage` is used only to remember the light/dark theme choice.

---

## Get-FolderSizeReport.ps1

### [1.0.0] - 2026-09-16

#### Added
- Initial release. Recursively scans a target folder, calculates cumulative folder sizes and per-file details, and exports a CSV report compatible with the SizeScope viewer.
- Full comment-based help (`.SYNOPSIS`, `.DESCRIPTION`, `.PARAMETER`, `.EXAMPLE`, `.NOTES`) and standard script header (Author, Copyright, License, Version, Date, GitHub, LinkedIn).
