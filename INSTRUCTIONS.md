# REF-RFX — Process Rules

Cross-cutting rules that apply to all skills and all AI agents working in this repository.

## Session Start

Before taking any action, read these files in order:

1. `workspace/backlog.md` — current status of all items
2. `workspace/registry.md` — all decisions already made
3. The skill file for the current step
4. When working on a specific item, read the item's design and decisions files in `workspace/items/` if they exist

**Files are the single source of truth. Do not rely on prior conversation context.**

## Interaction Pattern

When exploring options or making any decision during Strategise or Deliberate steps:

- Ask **one question at a time**. Never present multiple questions in a single turn.
- For each question, present **3–5 numbered suggestions** (ranked by recommended strategic fit), each in one sentence.
- Always add a final option: **[N+1]. Other** — allow the user to provide their own answer.
- Wait for the user's response before moving to the next question.

## Incremental Writing

Decisions are written to files **as they are made** — not batched at the end of the conversation.

- After each confirmed decision during Strategise, write it to `workspace/registry.md` immediately.
- After each confirmed decision during Deliberate, write it to the item's decisions file immediately.
- Do not wait until all dimensions are explored before writing anything.
- If a decision is revised later in the conversation, update the file immediately — do not defer.
- Files are always the current source of truth. The conversation is not.

## Skill Order

`/setup` → `/analyse` → `/catalogue` → `/decompose` → `/strategise` → `/deliberate` → `/design` → `/draft` → `/refine` → `/assemble`

`/analyse` is optional but recommended before `/decompose`. `/catalogue` runs after `/analyse` to populate the evidence registry from intake files before deliberation begins. `/refine` can be re-run at any point on a `Drafted` item.

## Skill Completion

When a skill finishes, briefly confirm what was produced and name the next skill to run. Do not include a hardcoded script — adapt the message to what actually happened.

## Guiding Principles

1. **File-first.** Every decision, design, and draft lives in a file — never in conversation memory.
2. **Skill-gated.** Do not begin a step until explicitly triggered. Do not combine steps.
3. **Backlog-driven.** Always read `workspace/backlog.md` to determine the current active item before acting.
4. **Criteria-driven.** Every response must trace back to a specific requirement or evaluation criterion.
5. **Iterative.** Review is a loop, not a gate. Expect multiple revision cycles.

## Content Standards
Update `workspace/backlog.md` at every phase transition. Log every significant pursuit-level decision in `workspace/registry.md` as soon as it is determined and confirmed by user.

## Backlog Items Status Values
`Not Started` →  `Deliberate Complete` → `Design Complete` → `Drafted` → `Approved`

## File Naming Conventions

| Artifact | Path |
|----------|------|
| Backlog | `workspace/backlog.md` |
| RFx analysis | `workspace/analysis.md` |
| Global decisions | `workspace/registry.md` |
| Evidence | `workspace/evidences.md` |
| Assumptions | `workspace/assumptions.md` |
| Per-item decisions | `workspace/items/item-XX-decisions.md` |
| Per-item design | `workspace/items/item-XX-design.md` |
| Per-item response | `workspace/items/item-XX-response.md` |
| Final submission | `workspace/final-submission.md` / `workspace/final-submission.docx` |
