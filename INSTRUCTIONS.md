# REF-RFX — Process Rules

Cross-cutting rules that apply to all skills and all AI agents working in this repository.

## Session Start

Before taking any action, read these files in order:

1. `workspace/backlog.md` — current status of all items
2. `workspace/registry.md` — all decisions already made
3. The skill file for the current step
4. When working on a specific item, read the item's design and decisions files in `workspace/items/` if they exist

**Files are the single source of truth. Do not rely on prior conversation context.**

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
