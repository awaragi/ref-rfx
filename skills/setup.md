---
name: Setup
description: Initialize the workspace folder structure and starter files for a new pursuit
command: /setup
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Setup

## Purpose

Set up the `workspaces/<slug>/` folder structure for a new pursuit and copy starter files from `templates/`. Setup is idempotent — it never overwrites files that already exist, so it is safe to run at any time.

## Steps

### 1. Determine the workspace slug

Ask the user for a short, URL-friendly slug that identifies this pursuit (e.g. `acme-cloud-2026`). Suggest a slug derived from the client name and year if the user hasn't provided one. Rules:
- Lowercase letters, digits, and hyphens only
- No spaces or special characters
- Concise — 2–4 words joined by hyphens

Once confirmed, write the slug as a single line to `.workspace` at the repository root (overwriting any prior value). All subsequent file operations in this skill use `workspaces/<slug>/` as the base path.

### 2. Scaffold the workspace

Check for each required directory. Create it if missing:
- `workspaces/<slug>/intake/rfx/`
- `workspaces/<slug>/intake/client/`
- `workspaces/<slug>/intake/supporting/`
- `workspaces/<slug>/items/`

Check for each required starter file. Copy from `templates/` only if the file does not yet exist in `workspaces/<slug>/`:
- `templates/backlog.md` → `workspaces/<slug>/backlog.md`
- `templates/registry.md` → `workspaces/<slug>/registry.md`
- `templates/evidences.md` → `workspaces/<slug>/evidences.md`
- `templates/assumptions.md` → `workspaces/<slug>/assumptions.md`

### 3. Fill in placeholders

For each file that was just copied, scan for `<...>` placeholders and resolve them:

- `<auto: description>` — fill automatically using the description, no question needed
- Any placeholder that relates to pursuit metadata (pursuit name, issuer, due date, etc.) — leave as-is; these will be populated automatically by `/decompose` when the RFx documents are parsed
- `<anything else>` — ask the user one question at a time, using the placeholder text as the basis for the question

Replace all resolved placeholders and write the file. Do not ask the user for pursuit metadata.

### 4. Confirm and prompt next step

Show the user the filled-in content for each updated file and ask if it looks correct.

## Output

- `.workspace` — active workspace slug
- `workspaces/<slug>/` directory structure (created if missing)
- Starter files copied from `templates/` with all `<...>` placeholders resolved
