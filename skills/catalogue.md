---
name: Catalogue
description: Scan intake folders and catalogue all supporting evidence files into the evidence registry
command: /catalogue
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Catalogue

## Purpose

Scan all intake folders, read every file, and produce a populated `workspaces/<slug>/evidences.md` that catalogues available evidence with a brief summary of each file and a direct reference to its path. Catalogue runs after Analyse so the team knows what supporting material is available before deliberation begins.

## Steps

### 1. Validate Intake

1. Check that `workspaces/<slug>/intake/` exists and contains at least one of:
   - `workspaces/<slug>/intake/rfx/`
   - `workspaces/<slug>/intake/client/`
   - `workspaces/<slug>/intake/supporting/`
2. List all files found across all intake folders and present them to the user before proceeding.
3. If all intake folders are empty, stop and ask the user to add materials before continuing.

### 2. Read All Intake Files

Read every file across all intake folders:

For each file, capture:
- File path (relative to the repository root)
- Evidence type — valid types are defined in `templates/evidences.md`
- A concise summary: what the file contains, its scope, key facts or metrics, and its relevance to the pursuit

### 3. Write the Evidence Registry

If `workspaces/<slug>/evidences.md` does not exist, copy `templates/evidences.md` to `workspaces/<slug>/evidences.md` and populate it. If it already exists, read it first and append new entries only — do not overwrite or remove existing entries.

Read `templates/evidences.md` to understand the required entry format and field structure.

Assign each new entry a sequential identifier continuing from the highest existing entry number. Process files in order: rfx/ first, then client/, then supporting/.

### 4. Confirm and Prompt Next Step

After writing the evidence registry, present:
- Total number of entries written
- A brief table: E-XX | Title | Type | File

## Output

- `workspaces/<slug>/evidences.md` — populated evidence registry with one entry per intake file
