# Release Management Strategy

A lightweight, sustainable release process appropriate for a solo-maintained, community-contributed open-source project.

---

## 1. Versioning Model

This project uses **Semantic Versioning 2.0.0** (`MAJOR.MINOR.PATCH`) at the **repository level**:

- **MAJOR** (`v2.0.0`) — Breaking changes: renamed/removed scripts, changed required parameters, restructured folders.
- **MINOR** (`v1.1.0`) — New scripts/tools/dashboards added, or backward-compatible enhancements.
- **PATCH** (`v1.0.1`) — Bug fixes, documentation corrections, non-breaking tweaks.

Individual scripts also carry their **own** version number in their header (see [`SCRIPT_HEADER_TEMPLATE.md`](SCRIPT_HEADER_TEMPLATE.md)), since scripts will naturally evolve at different rates than the repository as a whole.

---

## 2. Branching Model

A simplified **trunk-based** model, suitable for a project of this scale:

- **`main`** — Always stable, always usable. This is what most users will clone/download.
- **Feature branches** (`feature/...`, `fix/...`, `docs/...`) — Created from `main` for all changes, merged back via Pull Request.
- No long-lived `develop` branch is required at this project's current scale — keep it simple. Introduce a `develop` branch only if release cadence and contributor volume grow significantly.

---

## 3. Release Cadence

- **No fixed schedule required.** Releases are cut when there is a meaningful, coherent set of changes (a new tool category, several new scripts, or an important fix).
- As a guideline:
  - **Patch releases** — as needed, immediately for anything security-relevant.
  - **Minor releases** — roughly whenever 3–5 new scripts/tools have been merged, or monthly, whichever comes first.
  - **Major releases** — only when a breaking/structural change is unavoidable, with advance notice via a pinned Discussion/Issue where practical.

---

## 4. Release Process

1. Ensure `CHANGELOG.md`'s **[Unreleased]** section accurately reflects all merged changes since the last release.
2. Move the `[Unreleased]` content into a new dated version heading (e.g., `## [1.1.0] - 2026-10-01`), and start a fresh empty `[Unreleased]` section.
3. Update the version compare links at the bottom of `CHANGELOG.md`.
4. Commit: `chore(release): v1.1.0`.
5. Create an annotated Git tag:
   ```powershell
   git tag -a v1.1.0 -m "Release v1.1.0"
   git push origin v1.1.0
   ```
6. Draft a new **GitHub Release** from the tag:
   - Title: `v1.1.0`
   - Body: Summary copied/adapted from `CHANGELOG.md`.
   - Attach any packaged assets if relevant (e.g., a zipped "stable tools" bundle).
   - Mark as **Pre-release** if the content is still stabilising, otherwise mark as the **Latest release**.
7. Announce in [Discussions → Announcements] (if enabled).

---

## 5. Pre-Release / Beta Tags

For experimental tools not yet considered stable, use pre-release tags:

- `v1.2.0-beta.1`
- `v1.2.0-rc.1`

These allow early adopters to test new tools (e.g., a new dashboard) without affecting the perceived stability of the main release line.

---

## 6. Deprecation Policy

When a script is superseded or removed:

1. Mark it as deprecated in its header and tool-level README for at least one **MINOR** release cycle before removal, with a pointer to its replacement.
2. Note the deprecation clearly in `CHANGELOG.md` under **Deprecated**.
3. Remove it only in a **MAJOR** version bump, noted under **Removed**.

---

## 7. Long-Term Support

Given the solo/community-maintained nature of this project, only the **latest MAJOR version line** receives active support and security fixes. Critical security fixes may be backported to the previous major version on a best-effort basis (see [`SECURITY.md`](../SECURITY.md)).
