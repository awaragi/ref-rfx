---
name: Draft
description: Generate draft response content for a backlog item
command: /draft
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Draft

## Backlog Awareness

Read `workspace/backlog.md`. Without an explicit item argument, work on the first item with status `Design Complete`. With an explicit item number (e.g. `/draft item-03`), work on that item regardless of status.

Read `workspace/items/item-XX-decisions.md` and `workspace/items/item-XX-design.md` for the active item before writing a single word.

Update the item status to `Drafting` in `workspace/backlog.md` before proceeding.

## Purpose

Generate the draft response body for the item, working strictly from the design file. No new themes or structural changes during drafting — update the design file first if a change is needed.

## Rules

- Write in first-person plural ("we")
- Respect word or page limits identified during Deliberate
- Every significant claim must be backed by a named project, metric, methodology, or RFx-aligned outcome
- Forbidden phrases: "world-class", "cutting-edge", "seamless", "robust", "synergies", "leveraging"
- Follow the structure defined in the design file exactly
- Place QVAs explicitly within the relevant section

## Steps

1. Read the design file and decisions file in full.
2. Draft the response following the design structure section by section.
3. Present the draft to the user for review.
4. Write `workspace/items/item-XX-response.md` once the user confirms the draft is ready for formal review.
5. Update item status in `workspace/backlog.md` to `Validating`.

## Output

- `workspace/items/item-XX-response.md`
- Updated `workspace/backlog.md`

## item-XX-response.md Format

```markdown
---
item: "[XX]"
title: "[Item title]"
status: draft
decisions: [D[XX]-01, D[XX]-02]
evidence: [E-XX, E-XX]
qvas:
  - "[QVA text]"
word_count_target: [N]
section_reference: "[Section X.X]"
---

[Response body — prose only, no metadata]
```
