---
name: Refine
description: Review and finalize a drafted item response
command: /refine
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Refine

## Backlog Awareness

Read `workspaces/<slug>/backlog.md`. Without an explicit item argument, work on the first item with status `Drafted` (in `both` mode, the first item with either format track at that status — then resolve which track per Output Format Awareness below). With an explicit item number (e.g. `/refine item-03`), work on that item regardless of status.

## Output Format Awareness

Read `output_format` from `workspaces/<slug>/backlog.md` frontmatter (`word`, `powerpoint`, or `both`; treat a missing field as `word`).

- **`word` or `powerpoint`:** operate on that single track — `workspaces/<slug>/items/word/item-XX-*.md` or `workspaces/<slug>/items/powerpoint/item-XX-*.md` respectively.
- **`both`:** a track qualifier is required, e.g. `/refine item-03 word` or `/refine item-03 powerpoint`. If the invocation doesn't include one, ask which track to refine rather than assuming — the two tracks are refined and signed off independently, each against its own `Status (Word)` / `Status (PowerPoint)` column.

Read `workspaces/<slug>/items/item-XX-decisions.md` (shared across tracks), `workspaces/<slug>/items/<format>/item-XX-design.md`, and `workspaces/<slug>/items/<format>/item-XX-response.md` for the active item and track. Also check the item's "Mapped Criteria" (in the decisions file) against `workspaces/<slug>/mandatory-requirements.md` and `workspaces/<slug>/scoring-criteria.md`, if they exist.

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

1. **Compliance** — for every `M-XX` mapped to this item, does the response demonstrably satisfy it? (Fall back to checking every stated RFx requirement for this item if the register doesn't exist.)
2. **Decision alignment** — does the response reflect every decision in the decisions file?
3. **Design alignment** — does the response follow the structure and section direction in the design file?
4. **Evidence coverage** — are all selected evidence items used? Are claims substantiated?
5. **Scoring coverage** — for every `C-XX` mapped to this item, is it explicitly and substantively addressed, not just mentioned? Flag any that are weak or missing. (Fall back to checking QVA completeness generally if the register doesn't exist.)
6. **Evaluator alignment** — would an evaluator reading this score it highly against the rubric language in `scoring-criteria.md` (if present)? Flag weak areas.
7. **Cross-item consistency** — flag any terminology or claims that conflict with other completed response files.
8. **Suggested edits** — specific, actionable changes (not general feedback).

After presenting the review, ask: *"Would you like to add any notes before I apply these changes?"* Incorporate any additional user notes, then apply all changes to `workspaces/<slug>/items/<format>/item-XX-response.md`.

If `workspaces/<slug>/mandatory-requirements.md` and/or `workspaces/<slug>/scoring-criteria.md` exist, update the `Status` field for every row mapped to this item: `Compliant`/`Addressed` if the review confirms coverage, or leave/set `At Risk` with a note if a gap remains after changes are applied.

## Step 2B — Manual Review

Ask: *"Please share your feedback and I'll apply it to the draft."*

Apply all changes to `workspaces/<slug>/items/<format>/item-XX-response.md`.

## Step 3 — Iterate

After applying changes, ask: *"Would you like another review pass, or are you ready to approve?"*

- If another pass: return to Step 1. The user may switch between automated and manual between passes.
- If approved: proceed to sign-off.

## Sign-Off

Update the `status` field in the YAML frontmatter of `workspaces/<slug>/items/<format>/item-XX-response.md` to `approved` and update the item's status for that track in `workspaces/<slug>/backlog.md` to `Approved`. If the two registers exist, set every `M-XX`/`C-XX` row mapped to this item to `Compliant`/`Verified` at this point, provided the review confirmed coverage — do not mark a row `Compliant`/`Verified` if a known gap was carried forward.

## Output

- Updated `workspaces/<slug>/items/<format>/item-XX-response.md`
- Updated `workspaces/<slug>/backlog.md`
- Updated `workspaces/<slug>/mandatory-requirements.md` and/or `workspaces/<slug>/scoring-criteria.md` (if they exist)
