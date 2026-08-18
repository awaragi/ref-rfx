---
name: Help
description: Explain the REF-RFX workflow, diagnose the active pursuit's current status, and recommend the next command to run
command: /help
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Help

## Purpose

Orient the user in the REF-RFX lifecycle: explain what the framework does, show where the active pursuit currently stands, and recommend the next command to run. Help is **read-only** — it never writes or modifies any workspace file, and never changes an item's status.

Every command name in this file (`/deliberate`, `/catalogue`, etc.) is the short, tool-agnostic form. Before saying it out loud to the user, apply the Command Naming by Surface rule in `INSTRUCTIONS.md`: in Claude Code, Cursor, or GitHub Copilot, say the registered `ref-rfx-` form instead (e.g. **`/ref-rfx-catalogue`**, not `/catalogue`); use the short form as-is only under the stateless `AI-CHAT.md` contract.

## Step 1 — Resolve the workspace

Follow the Workspace Resolution section of `INSTRUCTIONS.md`, with one difference: where that section says to "stop," Help instead treats that as its answer.

- **No `workspaces/` directory, or it's empty** — this *is* the diagnosis. Briefly explain what `/setup` does (scaffolds the workspace and starter files) and recommend running it. Do not read further files.
- **Multiple workspace subdirectories and no `.workspace` file** — ask the user which one they mean, exactly as INSTRUCTIONS.md specifies. Do not guess.
- **Exactly one workspace resolved** (via `.workspace` or by being the only subdirectory) — continue to Step 2.

## Step 2 — Read the current state

Read whichever of these exist under `workspaces/<slug>/`; silently skip any that don't (a missing file is signal, not an error):

- `backlog.md`, `registry.md`, `evidences.md`, `analysis.md`, `mandatory-requirements.md`, `scoring-criteria.md`, `questions.md`, `assumptions.md`
- `intake/rfx/`, `intake/client/`, `intake/supporting/` (list contents, don't read every document in full)
- `items/item-XX-decisions.md` (shared), plus `items/<format>/item-XX-design.md` and `items/<format>/item-XX-response.md` for each active format track — read `output_format` in `backlog.md` frontmatter (`word`, `powerpoint`, or `both`; treat a missing field as `word`) to know which folder(s) to check
- `final-submission-word.md` (if `word`/`both` is active), `final-submission-powerpoint.md` (if `powerpoint`/`both` is active) — note that `.docx`/`.pptx` conversion is intentionally out of scope for this framework, so their absence is not a gap to flag

## Step 3 — Diagnose lifecycle position

Judge completion from file *content*, not just presence — a freshly copied template file is not "done." Work through in order:

| Stage | Complete when |
|---|---|
| Setup | `workspaces/<slug>/` scaffolding and starter files exist |
| Intake | at least one file exists in `intake/rfx/` |
| Analyse *(optional)* | `analysis.md` has populated A-xx entries, not placeholder text; `mandatory-requirements.md` and `scoring-criteria.md` have populated M-xx/C-xx rows |
| Catalogue | `evidences.md` has one or more E-xx entries, not just the template header |
| Decompose | `backlog.md` has real item rows, not the template's `[Item title]` placeholders |
| Strategise | `registry.md` Global Decisions (G-01+) are filled in, not bracketed placeholders — including at least one real row in the Win Theme Pillars table |
| Deliberate / Design / Draft / Refine *(per item, per active format track)* | read the Status column(s) in `backlog.md` for each row — a single `Status` column when `output_format` is `word` or `powerpoint`, or `Status (Word)` / `Status (PowerPoint)` when `both`: `Not Started` → `Deliberate Complete` → `Design Complete` → `Drafted` → `Approved`. Cross-check against the presence of the item's `items/<format>/item-XX-*.md` files — flag any mismatch (e.g. status says `Drafted` but no response file exists) rather than silently trusting one source. |
| Assemble | `final-submission-<format>.md` exists for each active track (`.docx`/`.pptx` conversion is left to the user by design, so it's not part of this diagnosis) |

## Step 4 — Present status and recommend the next step

Give a compact, scannable answer, not a wall of text:

1. **One-line overall position** — e.g. "Strategise is done; 8 items are still `Not Started`, 2 are `Approved`."
2. **Per-item table** (only if a backlog exists): `# | Title | Status | Next action`.
3. **One clear recommendation** — the exact next command to run and why, in the surface-appropriate form (see above). If several items are ready for the same next skill, name the first and note the others can follow the same way (e.g. `/deliberate item-02` — items 03–05 are also `Not Started` and can follow the same command once 02 is done).
4. **Path check** — the moment every item first reaches `Design Complete` with none yet `Drafted`, the Standard and Big Bang paths diverge. Ask the user which they intend to follow (Standard: `/draft` then `/refine` per item; Big Bang: skip straight to `/assemble`, which drafts and finalizes in one pass) rather than assuming.
5. **Compliance snapshot** (only if `mandatory-requirements.md` and/or `scoring-criteria.md` exist): count of `M-XX` rows not yet `Compliant` and `C-XX` rows not yet `Addressed`/`Verified`. Surface this whenever it's non-zero, even outside `/assemble` — it's the fastest signal of live disqualification or scoring risk.

Map backlog item status to next action:

| Status | Next command |
|---|---|
| *(no backlog yet)* | `/decompose` |
| `Not Started` | `/deliberate item-XX` |
| `Deliberate Complete` | `/design item-XX` |
| `Design Complete` | `/draft item-XX` (Standard) or hold for `/assemble` (Big Bang) |
| `Drafted` | `/refine item-XX` |
| `Approved` | nothing — ready to be included in `/assemble` |

In `both` mode, apply this mapping to each of `Status (Word)` and `Status (PowerPoint)` independently, and recommend the track-qualified command where one is needed (e.g. `/design item-03 word`, `/refine item-03 powerpoint`) rather than the bare form — the two tracks routinely sit at different stages.

Map pursuit-level gaps to next action:

| Gap | Next command |
|---|---|
| No workspace | `/setup` |
| Workspace exists, `intake/rfx/` empty | add RFx documents to `intake/` (manual, no command) |
| Intake present, no `analysis.md` (and no registers) | `/analyse` (recommended, optional) — also produces `mandatory-requirements.md` and `scoring-criteria.md` |
| `evidences.md` not populated | `/catalogue` |
| `backlog.md` not populated | `/decompose` |
| Backlog exists, Global Decisions not set | `/strategise` |
| All items `Approved` (or Standard Path complete) | `/assemble` |

## Step 5 — Answer specific questions

If the invocation includes an item reference (e.g. `/help item-03`), a question about a specific skill (e.g. `/help what does deliberate do`), or a question about an ID prefix (e.g. `/help what is C-05` or `/help what does M- mean`), answer that directly instead of dumping the full pursuit overview:

- **Item reference** — report that item's current status, which files exist for it, and the single next action.
- **Skill question** — summarize the referenced skill's purpose, inputs, and outputs by reading the corresponding `skills/<name>.md`, in plain language.
- **ID / prefix question** — look up the prefix in the Identifier Reference table below, then, if a specific ID was named (not just the prefix in the abstract), read the row itself from the relevant file and report its content directly (e.g. `/help what is M-05` reads that row from `mandatory-requirements.md`).

## Identifier Reference

Every registry in REF-RFX uses a short, prefixed, sequential ID (`XX` = zero-padded, `01`, `02`, ...) so items can be cited unambiguously across files. Use this table to resolve any prefix a user asks about:

| Prefix | Meaning | Lives in | Set by | Scope |
|---|---|---|---|---|
| `A-XX` | Analysis finding item (Procurement Overview, Scope Summary, Evaluation Framework, Mandatory Requirements, Submission Requirements, Key Risks and Constraints, plus any pursuit-specific additions) | `analysis.md` | `/analyse` | Pursuit-wide, narrative |
| `P-XX` | Assumption entry (scope, delivery, client, or technical assumption) — "P" for Premise, chosen to avoid colliding with `analysis.md`'s `A-XX` above | `assumptions.md` | `/deliberate` (as assumptions surface), or added manually | Pursuit-wide |
| `M-XX` | Mandatory / pass-fail requirement | `mandatory-requirements.md` | Created by `/analyse`; cross-linked to a backlog item by `/decompose`; `Status` updated by `/refine` | Pursuit-wide, one row per requirement |
| `C-XX` | Scored / weighted evaluation criterion | `scoring-criteria.md` | Created by `/analyse`; cross-linked to a backlog item by `/decompose`; `Status` updated by `/refine` | Pursuit-wide, one row per criterion |
| `E-XX` | Evidence registry entry (past performance, certification, framework, etc.) | `evidences.md` | `/catalogue` | Pursuit-wide, reusable across items |
| `S-XX` | Standing Decision — fixed voice/quality rule that applies to every pursuit and item, never overridden | `registry.md` | Pre-set; not authored per pursuit | Global, fixed |
| `G-XX` | Global Decision — pursuit-wide strategic choice (win theme, delivery posture, security posture, etc.) | `registry.md` | `/strategise` | Pursuit-wide strategic |
| `D<item>-NN` (e.g. `D04-01`) | Item-level decision — `<item>` is the backlog item number, `NN` is sequential within that item | `items/item-XX-decisions.md` | `/deliberate` | Scoped to one backlog item |
| Item `#` (e.g. `01`, `02`) | Backlog item number — no letter prefix, just the zero-padded number | `backlog.md` | `/decompose` | One per backlog item, referenced everywhere else as `item-XX` |
| `X.Y` (e.g. `4.3`) | Clarification question — section number `.` question number within that section | `questions.md` | `/questions` | Working list; re-sorted and renumbered as questions are added, removed, or reprioritized |
| `Batch N` | A group of questions actually sent to the issuer together | `questions.md` | `/questions`, only on user confirmation a batch was sent | One per submission round |

Cross-reference fields tie these together: `backlog.md`'s `Criteria Ref` column and `item-XX-decisions.md`'s "Mapped Criteria" section both cite `M-XX`/`C-XX`; `mandatory-requirements.md`/`scoring-criteria.md`'s `Owning Item` fields cite the backlog item number back.

## Lifecycle Reference

Use this to explain the flow when the user is new to the framework or asks "what's next" in general terms:

```
/setup → intake (manual) → /analyse → /catalogue → /decompose → /strategise
    → [per item: /deliberate → /design → /draft → /refine]
    → /assemble
```

- `/analyse` is optional but recommended before `/decompose`.
- `/questions` is not part of this sequence — it can be run at any time, but is recommended right after `/analyse`, to generate a candidate list of clarification questions for the issuer.
- `/catalogue` runs after `/analyse` to populate the evidence registry before deliberation.
- **Standard Path**: each item is fully cycled through Deliberate → Design → Draft → Refine independently, then `/assemble` concatenates everything.
- **Big Bang**: every item completes Deliberate → Design first; `/assemble` then drafts any item that has a design but no response, and produces the final submission in one pass. Refine is optional and can still be applied per item afterward, followed by a re-`/assemble`.
- `/refine` can be re-run at any point on a `Drafted` item.

| Skill | Command | One-line purpose |
|---|---|---|
| Setup | `/setup` | Scaffold `workspaces/<slug>/` and copy starter files |
| Intake | *(manual)* | Drop RFx, client background, and supporting materials into `intake/` |
| Analyse | `/analyse` | Produce `analysis.md`, `mandatory-requirements.md`, and `scoring-criteria.md` from the RFx documents |
| Questions | `/questions` | Generate a candidate list of clarification questions for the issuer (`questions.md`) — optional, any time |
| Catalogue | `/catalogue` | Scan intake and populate the evidence registry (`evidences.md`) |
| Decompose | `/decompose` | Break the solicitation into backlog items (`backlog.md`) |
| Strategise | `/strategise` | Set pursuit-wide global decisions (`registry.md`) |
| Deliberate | `/deliberate item-XX` | Explore options and record decisions for one item |
| Design | `/design item-XX` | Turn an item's decisions into a response blueprint |
| Draft | `/draft item-XX` | Generate draft response content for one item (Standard Path) |
| Refine | `/refine item-XX` | Review, critique, and finalize an item's response |
| Assemble | `/assemble` | Produce `final-submission-<format>.md` from all item responses, per active format track (`.docx`/`.pptx` conversion is left to the user) |

## Output

None. Help only reads files and reports — it never writes to the workspace or changes any item's status.
