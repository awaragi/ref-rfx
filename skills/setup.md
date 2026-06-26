---
name: Setup
description: Initialize the workspace folder structure and starter files for a new pursuit
command: /setup
---

# Skill: Setup

## Purpose

Set up the `workspace/` folder structure for a new pursuit and copy starter files from `templates/`. Setup is idempotent — it never overwrites files that already exist, so it is safe to run at any time.

## Steps

### 1. Scaffold the workspace

Check for each required directory. Create it if missing:
- `workspace/intake/rfx/`
- `workspace/intake/client/`
- `workspace/intake/supporting/`
- `workspace/items/`

Check for each required starter file. Copy from `templates/` only if the file does not yet exist in `workspace/`:
- `templates/backlog.md` → `workspace/backlog.md`
- `templates/registry.md` → `workspace/registry.md`
- `templates/evidences.md` → `workspace/evidences.md`
- `templates/assumptions.md` → `workspace/assumptions.md`

### 2. Fill in placeholders

For each file that was just copied, scan for `<...>` placeholders and resolve them:

- `<auto: description>` — fill automatically using the description, no question needed
- Any placeholder that relates to pursuit metadata (pursuit name, issuer, due date, etc.) — leave as-is; these will be populated automatically by `/decompose` when the RFx documents are parsed
- `<anything else>` — ask the user one question at a time, using the placeholder text as the basis for the question

Replace all resolved placeholders and write the file. Do not ask the user for pursuit metadata.

### 3. Confirm and prompt next step

Show the user the filled-in content for each updated file and ask if it looks correct. Then:

> "Workspace is ready. Populate `workspace/intake/` with your RFx documents and supporting materials, then run `/decompose`. Pursuit metadata (name, issuer, due date) will be filled in automatically from the RFx documents."

## Output

- `workspace/` directory structure (created if missing)
- Starter files copied from `templates/` with all `<...>` placeholders resolved
