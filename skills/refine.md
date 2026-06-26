---
name: Refine
description: Apply review feedback and finalize an item response
command: /refine
---

# Skill: Refine

## Backlog Awareness

Read `workspace/backlog.md`. Without an explicit item argument, work on the first item with status `Refining`. With an explicit item number (e.g. `/refine item-03`), work on that item regardless of status.

Read `workspace/items/item-XX-response.md` for the active item, including any review notes present.

Update item status to `Refining` before proceeding.

## Purpose

Address validation findings and finalize the item response. Refine is the implementation step that follows Validate — it applies human and AI review notes to produce the final approved response.

## Steps

1. Read all review notes in `workspace/items/item-XX-response.md` (`## Review` and `## Human Review Notes` sections).
2. Summarize the changes you will make and confirm with the user before editing.
3. Apply all changes to the response draft.
4. Re-read the RFx requirements, decisions file, and design file to verify nothing was inadvertently dropped.
5. Present the refined draft to the user.
6. If the user approves, add `**Status: APPROVED**` to the top of the response file and update `workspace/backlog.md` to `Approved`.
7. If the user has further feedback, iterate — repeat from step 2.

## Output

- Updated `workspace/items/item-XX-response.md` (refined draft, status APPROVED on sign-off)
- Updated `workspace/backlog.md`
