---
name: Validate
description: Validate an item response against its requirements and decisions
command: /validate
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Validate

## Backlog Awareness

Read `workspace/backlog.md`. Without an explicit item argument, work on the first item with status `Validating`. With an explicit item number (e.g. `/validate item-03`), work on that item regardless of status.

Read `workspace/items/item-XX-decisions.md`, `workspace/items/item-XX-design.md`, and `workspace/items/item-XX-response.md` for the active item.

## Purpose

Produce a structured critique of the item response. Validation is a loop — AI review first, then human review notes, then revision. Repeat until sign-off.

## AI Automated Review

Re-read the relevant RFx section, the decisions file, the design file, and the response draft, then produce a structured review covering:

1. **Compliance** — does the response address every stated RFx requirement for this item?
2. **Decision alignment** — does the response reflect every decision in the decisions file?
3. **Design alignment** — does the response follow the structure and section direction in the design file?
4. **Evidence coverage** — are all selected evidence items used? Are claims substantiated?
5. **QVA completeness** — are all QVAs present and explicit?
6. **Evaluator alignment** — would an evaluator reading this score it highly? Flag weak areas.
7. **Cross-item consistency** — flag any terminology or claims that conflict with other completed response files.
8. **Suggested edits** — specific, actionable changes (not general feedback).

## Human Review

After the AI review, prompt the user: *"Please add your review notes below. I will incorporate them and re-run the automated review."*

Record human notes in `## Human Review Notes` of the response file.

## Iteration

Incorporate all notes, update the draft, re-run the automated review. Repeat until the user confirms sign-off.

## Sign-Off

When the user approves, add `**Status: APPROVED**` to the top of `workspace/items/item-XX-response.md` and update `workspace/backlog.md` item status to `Approved`.

## Output

- Updated `workspace/items/item-XX-response.md` (with review sections and final approved draft)
- Updated `workspace/backlog.md`
