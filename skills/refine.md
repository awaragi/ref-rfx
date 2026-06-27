---
name: Refine
description: Review and finalize a drafted item response
command: /refine
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Refine

## Backlog Awareness

Read `workspace/backlog.md`. Without an explicit item argument, work on the first item with status `Drafted`. With an explicit item number (e.g. `/refine item-03`), work on that item regardless of status.

Read `workspace/items/item-XX-decisions.md`, `workspace/items/item-XX-design.md`, and `workspace/items/item-XX-response.md` for the active item.

Status stays `Drafted` throughout the loop. Only transitions to `Approved` on sign-off.

## Purpose

Review and finalize the item response. Refine is a loop — review, apply changes, repeat — until the user signs off. It absorbs both automated critique and manual feedback in a single iterative cycle.

## Step 1 — Choose Review Mode

Ask the user:

> "How would you like to refine this draft?
> 1. Automated AI review — I'll critique the response across 8 dimensions and propose improvements.
> 2. Manual — share your feedback directly and I'll apply it."

Wait for the user's choice before proceeding.

## Step 2A — Automated AI Review

Re-read the relevant RFx section, the decisions file, the design file, and the response draft, then produce a structured review covering:

1. **Compliance** — does the response address every stated RFx requirement for this item?
2. **Decision alignment** — does the response reflect every decision in the decisions file?
3. **Design alignment** — does the response follow the structure and section direction in the design file?
4. **Evidence coverage** — are all selected evidence items used? Are claims substantiated?
5. **QVA completeness** — are all QVAs present and explicit?
6. **Evaluator alignment** — would an evaluator reading this score it highly? Flag weak areas.
7. **Cross-item consistency** — flag any terminology or claims that conflict with other completed response files.
8. **Suggested edits** — specific, actionable changes (not general feedback).

After presenting the review, ask: *"Would you like to add any notes before I apply these changes?"* Incorporate any additional user notes, then apply all changes to `workspace/items/item-XX-response.md`.

## Step 2B — Manual Review

Ask: *"Please share your feedback and I'll apply it to the draft."*

Apply all changes to `workspace/items/item-XX-response.md`.

## Step 3 — Iterate

After applying changes, ask: *"Would you like another review pass, or are you ready to approve?"*

- If another pass: return to Step 1. The user may switch between automated and manual between passes.
- If approved: proceed to sign-off.

## Sign-Off

Add `**Status: APPROVED**` to the top of `workspace/items/item-XX-response.md` and update `workspace/backlog.md` item status to `Approved`.

## Output

- Updated `workspace/items/item-XX-response.md`
- Updated `workspace/backlog.md`
