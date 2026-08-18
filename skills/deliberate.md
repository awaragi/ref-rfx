---
name: Deliberate
description: Explore options and record decisions for a backlog item
command: /deliberate
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Deliberate

## Backlog Awareness

Read `workspaces/<slug>/backlog.md`.

- **With an explicit item argument** (e.g. `/deliberate item-03`): work on that item regardless of status.
- **Without an explicit item argument**: identify the first item with status `Not Started` or `Deliberating` and ask the user to confirm before proceeding — e.g. *"I'll work on **Item 03 – Team Structure** (status: Not Started). Shall I proceed, or would you like to work on a different item?"* Wait for confirmation.

Update the item status to `Deliberating` in `workspaces/<slug>/backlog.md` before proceeding. In `both` mode, update both `Status (Word)` and `Status (PowerPoint)` identically — Deliberate produces one shared decisions file (`item-XX-decisions.md`) regardless of `output_format`, so the two format tracks only begin to diverge once `/design` starts.

## Purpose

Explore all material angles for a backlog item and record the decisions that will govern its design and response. Deliberate loops — one angle at a time — until the user is satisfied that all decisions are captured.

Global cross-cutting decisions (win theme, delivery model, technology posture, alliances, etc.) are set by `/strategise` and stored in `workspaces/<slug>/registry.md`. Read them before starting — they are authoritative and should not be contradicted at the item level.

If `workspaces/<slug>/mandatory-requirements.md` and/or `workspaces/<slug>/scoring-criteria.md` exist, read the rows whose `Owning Item`/`Owning Item(s)` reference this item (cross-check against the `Criteria Ref` column in `backlog.md`) — these are the exact gates and weighted criteria this item's decisions must satisfy.

## Explore Loop

Follow the interaction pattern in INSTRUCTIONS.md: ask **one question per turn**, present **3–5 numbered suggestions** ranked by strategic fit, add **Other** as the final option, and wait for the user's response before proceeding.

Dimensions to work through:

1. **Evaluator intent** — what is the evaluator actually buying? What risk are they trying to mitigate?
2. **Differentiators** — which specific engagements, tools, credentials, or approaches are most relevant?
3. **Positioning** — what is the single strongest narrative angle for this item?
4. **Mandatory coverage** — for each `M-XX` mapped to this item, how will the response demonstrate compliance? (Skip if none map.)
5. **QVAs** — for each `C-XX` mapped to this item, what measurable value add beyond the mandatory baseline could win maximum score on that specific criterion? (Fall back to a general QVA pass if the registers don't exist.)
6. **Evidence** — which evidence items from `workspaces/<slug>/evidences.md` best support this response?
7. **Risks / landmines** — what would a weak response look like? What could cost marks — reference specific `C-XX`/`M-XX` IDs at risk, if applicable?

Continue asking until all dimensions are covered. Only then ask: *"I have enough to write up the decisions. Is there anything else you'd like to add before I do?"*

## Output

Once the user confirms, write the decisions file:

- `workspaces/<slug>/items/item-XX-decisions.md`
- Update `workspaces/<slug>/registry.md` with any global decisions surfaced during deliberation
- Update item status in `workspaces/<slug>/backlog.md` to `Deliberate Complete` (both `Status (Word)` and `Status (PowerPoint)` in `both` mode — see Backlog Awareness above)

## item-XX-decisions.md Format

Use `templates/item-decisions.md` as the file template. Populate all fields from the deliberation outcomes and set the YAML front matter (`item`, `title`, `rfx_reference`) accordingly.
