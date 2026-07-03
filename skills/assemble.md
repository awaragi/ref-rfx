---
name: Assemble
description: Produce the final submission from all item response files
command: /assemble
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Assemble

## Backlog Awareness

Read `workspaces/<slug>/backlog.md` in full before proceeding. Assemble operates on the entire pursuit, not a single item. It includes all items with a response file regardless of status.

## Purpose

Produce the final submission document through three sequential stages. Assemble is safe to run at any point — it generates responses for items with a design but no response, compiles all responses in order, and optionally converts the result to Word.

## Stage 1 — Auto-generate missing item responses

For every item in `workspaces/<slug>/backlog.md` that has a design file (`workspaces/<slug>/items/item-XX-design.md`) but no response file (`workspaces/<slug>/items/item-XX-response.md`):

1. Apply the Draft skill logic to generate the response.
2. Write `workspaces/<slug>/items/item-XX-response.md`.
3. Update the item status in `workspaces/<slug>/backlog.md` to `Drafted`.

Items that already have a response file are left untouched.

## Stage 2 — Assemble `workspaces/<slug>/final-submission.md`

1. Read all item response files in backlog order, regardless of status.
2. Strip YAML frontmatter from each file.
3. Concatenate responses into `workspaces/<slug>/final-submission.md`.
4. For any item with no response file and no design file, insert a labelled placeholder:
   ```
   [RESPONSE PENDING: Item XX — Title]
   ```

## Stage 3 — Convert to `workspaces/<slug>/final-submission.docx` *(optional)*

After completing Stage 2, ask the user: *"Would you like to also generate the Word document (`final-submission.docx`)?"* Only proceed with this stage if the user confirms.

Convert `workspaces/<slug>/final-submission.md` to Word using the following conventions:

| Markdown element | Word style |
|---|---|
| `# Heading` | Heading 1 |
| `## Heading` | Heading 2 |
| `### Heading` | Heading 3 |
| Body text | Normal |
| Bullet list | List Bullet |
| Numbered list | List Number |
| Table | Table Grid |
| Bold inline | Strong |
| Code / verbatim | Verbatim Char |

Any text matching `[PLACEHOLDER TEXT]` or `[RESPONSE PENDING: ...]` must be highlighted in yellow in the Word output.

## Output

- `workspaces/<slug>/items/item-XX-response.md` (any newly generated item responses)
- `workspaces/<slug>/final-submission.md`
- `workspaces/<slug>/final-submission.docx` (if the user opted in)
