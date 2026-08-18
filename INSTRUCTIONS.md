# REF-RFX — Process Rules

Cross-cutting rules that apply to all skills and all AI agents working in this repository.

## Workspace Resolution

Every skill operates inside a pursuit-specific workspace folder under `workspaces/`. To determine the active workspace (`<slug>`) before taking any action:

1. Read `.workspace` at the repository root. If the file exists, its first non-empty line is the active slug (e.g. `acme-rfp-2026`). Use `workspaces/<slug>/` as the base path for all file operations.
2. If `.workspace` does not exist, list the contents of the `workspaces/` directory:
   - **Exactly one subdirectory** — use it automatically and write its name to `.workspace`.
   - **More than one subdirectory** — ask the user: *"Multiple workspaces found: [list them]. Which workspace are you working on?"* Once confirmed, write the chosen slug to `.workspace`.
   - **Empty or missing `workspaces/`** — stop and tell the user to run `/setup` first.

Throughout all skills and instructions, `workspaces/<slug>/` refers to the resolved active workspace path.

## Session Start

Before taking any action, read these files in order:

1. Resolve the active workspace slug (see **Workspace Resolution** above)
2. `workspaces/<slug>/backlog.md` — current status of all items
3. `workspaces/<slug>/registry.md` — all decisions already made
4. The skill file for the current step
5. When working on a specific item, read the item's design and decisions files in `workspaces/<slug>/items/` if they exist

**Files are the single source of truth. Do not rely on prior conversation context.**

## Interaction Pattern

When exploring options or making any decision during Strategise or Deliberate steps:

- Ask **one question at a time**. Never present multiple questions in a single turn.
- For each question, present **3–5 numbered suggestions** (ranked by recommended strategic fit), each in one sentence.
- Always add a final option: **[N+1]. Other** — allow the user to provide their own answer.
- Wait for the user's response before moving to the next question.

## Incremental Writing

Decisions are written to files **as they are made** — not batched at the end of the conversation.

- After each confirmed decision during Strategise, write it to `workspaces/<slug>/registry.md` immediately.
- After each confirmed decision during Deliberate, write it to the item's decisions file immediately.
- Do not wait until all dimensions are explored before writing anything.
- If a decision is revised later in the conversation, update the file immediately — do not defer.
- Files are always the current source of truth. The conversation is not.

## Skill Order

`/setup` → `/analyse` → `/catalogue` → `/decompose` → `/strategise` → `/deliberate` → `/design` → `/draft` → `/refine` → `/assemble`

`/analyse` is optional but recommended before `/decompose` — besides `analysis.md`, it also produces `mandatory-requirements.md` and `scoring-criteria.md`, the itemized registers that `/decompose`, `/deliberate`, `/refine`, and `/assemble` cross-check against. `/catalogue` runs after `/analyse` to populate the evidence registry from intake files before deliberation begins. `/refine` can be re-run at any point on a `Drafted` item.

`/help` is not part of this sequence — it can be run at any time to explain the framework, diagnose the active pursuit's status, and recommend the next command. It is read-only.

`/questions` is also not part of this sequence — it can be run at any time to generate a candidate list of clarification questions for the issuer, but is recommended after `/analyse`, since `analysis.md` is a strong source of leads. It does not gate, and is not gated by, any other skill.

`/bin` is a utility, not a lifecycle step — it discovers the local automation scripts under `bin/` (backups, workspace syncing, and any scripts added later), shows each one's `--help` usage, and runs them on request. It can be invoked at any time and never touches pursuit content.

## Command Naming by Surface

Skill files in `skills/` refer to each other using the short name (`/deliberate`, `/catalogue`, etc.) because that same text is read verbatim in the stateless chat contract (`AI-CHAT.md`), which has no command registry and no naming collisions to avoid.

Claude Code, Cursor, and GitHub Copilot are different: they register each skill as an actual slash command prefixed `ref-rfx-` (e.g. `/ref-rfx-catalogue`), to namespace it against other projects' commands. The short form is **not** a valid command in any of them.

So when confirming what was produced or recommending the next step to a user in Claude Code, Cursor, or GitHub Copilot, always say the registered form — `/ref-rfx-catalogue`, not `/catalogue`. Only use the short form verbatim when operating under the stateless `AI-CHAT.md` contract.

## Skill Completion

When a skill finishes, briefly confirm what was produced and name the next skill to run. Do not include a hardcoded script — adapt the message to what actually happened.

## Guiding Principles

1. **File-first.** Every decision, design, and draft lives in a file — never in conversation memory.
2. **Skill-gated.** Do not begin a step until explicitly triggered. Do not combine steps.
3. **Backlog-driven.** Always read `workspaces/<slug>/backlog.md` to determine the current active item before acting.
4. **Criteria-driven.** Every response must trace back to a specific requirement or evaluation criterion — `mandatory-requirements.md` and `scoring-criteria.md` are the itemized registers that make this traceable rather than aspirational.
5. **Iterative.** Review is a loop, not a gate. Expect multiple revision cycles.

## Content Standards
Update `workspaces/<slug>/backlog.md` at every phase transition. Log every significant pursuit-level decision in `workspaces/<slug>/registry.md` as soon as it is determined and confirmed by user.

## Backlog Items Status Values
`Not Started` →  `Deliberate Complete` → `Design Complete` → `Drafted` → `Approved`

## File Naming Conventions

| Artifact | Path |
|----------|------|
| Backlog | `workspaces/<slug>/backlog.md` |
| RFx analysis | `workspaces/<slug>/analysis.md` |
| Mandatory requirements register | `workspaces/<slug>/mandatory-requirements.md` |
| Scoring criteria register | `workspaces/<slug>/scoring-criteria.md` |
| Clarification questions | `workspaces/<slug>/questions.md` |
| Global decisions | `workspaces/<slug>/registry.md` |
| Evidence | `workspaces/<slug>/evidences.md` |
| Assumptions | `workspaces/<slug>/assumptions.md` |
| Per-item decisions | `workspaces/<slug>/items/item-XX-decisions.md` (shared across format tracks) |
| Per-item design | `workspaces/<slug>/items/<format>/item-XX-design.md` (`<format>` is `word` and/or `powerpoint`, per `output_format` in `backlog.md`) |
| Per-item response | `workspaces/<slug>/items/<format>/item-XX-response.md` |
| Final submission | `workspaces/<slug>/final-submission-word.md` and/or `workspaces/<slug>/final-submission-powerpoint.md`, per `output_format`. Converting these to `.docx`/`.pptx` is left to the user — Assemble's output stops at Markdown. |
