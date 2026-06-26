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

## Explore Loop

For each dimension below, ask **one question per turn**. Present the question with three recommended options (A / B / C, one sentence each, ranked by strategic fit) plus D. Other. Wait for the user's selection before moving to the next question.

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

```markdown
# Item [XX] — [Title] — Decisions

**Status:** Deliberate Complete  
**RFP Reference:** [Section X.X]

---

## Evaluator Intent

[What the evaluator is buying and the risk they are managing]

## Positioning

[The chosen narrative angle and rationale]

## Differentiators

- [Differentiator 1]
- [Differentiator 2]

## Quantifiable Value Adds (QVAs)

- [QVA 1 — measurable commitment]
- [QVA 2]

## Evidence Selected

- [Evidence item from workspace/evidences.md]

## Risks to Avoid

- [Risk or landmine 1]

## Decisions

| ID | Decision |
|----|----------|
| D[XX]-01 | [Decision text] |
| D[XX]-02 | [Decision text] |
```
