---
name: Deliberate
description: Explore options and record decisions for a backlog item
command: /deliberate
---

# Skill: Deliberate

## Backlog Awareness

Read `workspace/backlog.md`. Without an explicit item argument, work on the first item with status `Not Started` or `Deliberating`. With an explicit item number (e.g. `/deliberate item-03`), work on that item regardless of status.

Update the item status to `Deliberating` in `workspace/backlog.md` before proceeding.

## Purpose

Explore all material angles for a backlog item and record the decisions that will govern its design and response. Deliberate loops — one angle at a time — until the user is satisfied that all decisions are captured.

Global cross-cutting decisions (win theme, delivery model, technology posture, alliances, etc.) are set by `/strategise` and stored in `workspace/registry.md`. Read them before starting — they are authoritative and must not be contradicted at the item level.

## Explore Loop

Follow the interaction pattern in INSTRUCTIONS.md: ask **one question per turn**, present **3–5 numbered suggestions** ranked by strategic fit, add **Other** as the final option, and wait for the user's response before proceeding.

Dimensions to work through:

1. **Evaluator intent** — what is the evaluator actually buying? What risk are they trying to mitigate?
2. **Differentiators** — which specific engagements, tools, credentials, or approaches are most relevant?
3. **Positioning** — what is the single strongest narrative angle for this item?
4. **QVAs** — what measurable value adds beyond mandatory requirements could be offered?
5. **Evidence** — which evidence items from `workspace/evidences.md` best support this response?
6. **Risks / landmines** — what would a weak response look like? What could cost marks?

Continue asking until all dimensions are covered. Only then ask: *"I have enough to write up the decisions. Is there anything else you'd like to add before I do?"*

## Output

Once the user confirms, write the decisions file:

- `workspace/items/item-XX-decisions.md`
- Update `workspace/registry.md` with any global decisions surfaced during deliberation
- Update item status in `workspace/backlog.md` to `Deliberate Complete`

## item-XX-decisions.md Format

Use `templates/item-decisions.md` as the file template. Populate all fields from the deliberation outcomes and set the YAML front matter (`item`, `title`, `rfx_reference`) accordingly.
