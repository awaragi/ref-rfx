---
name: Init
description: Initialize the workspace folder structure and starter files for a new pursuit
command: /init
---

# Skill: Init

## Purpose

Set up the `workspace/` folder structure for a new pursuit and copy starter files from `templates/`. Init is idempotent — it never overwrites files that already exist, so it is safe to run at any time.

## Steps

1. Check for each required directory. Create it if missing:
   - `workspace/intake/rfp/`
   - `workspace/intake/client/`
   - `workspace/intake/supporting/`
   - `workspace/items/`

2. Check for each required starter file. Copy from `templates/` only if the file does not yet exist in `workspace/`:
   - `templates/backlog.md` → `workspace/backlog.md`
   - `templates/registry.md` → `workspace/registry.md`
   - `templates/evidences.md` → `workspace/evidences.md`
   - `templates/assumptions.md` → `workspace/assumptions.md`

3. Report what was created and what was already in place. Never overwrite existing files.

4. Prompt the user to fill in the pursuit details at the top of `workspace/backlog.md` (pursuit name, issuer, due date).

5. Remind the user: populate `workspace/intake/` with RFP materials, then run `/intake`.

## Output

- `workspace/` directory structure (created if missing)
- `workspace/backlog.md`, `workspace/registry.md`, `workspace/evidences.md`, `workspace/assumptions.md` (copied from templates if missing)
- A summary of what was created vs. already present
