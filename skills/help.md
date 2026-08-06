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

- `backlog.md`, `registry.md`, `evidences.md`, `analysis.md`, `questions.md`, `assumptions.md`
- `intake/rfx/`, `intake/client/`, `intake/supporting/` (list contents, don't read every document in full)
- `items/item-XX-decisions.md`, `items/item-XX-design.md`, `items/item-XX-response.md`
- `final-submission.md`, `final-submission.docx`

## Step 3 — Diagnose lifecycle position

Judge completion from file *content*, not just presence — a freshly copied template file is not "done." Work through in order:

| Stage | Complete when |
|---|---|
| Setup | `workspaces/<slug>/` scaffolding and starter files exist |
| Intake | at least one file exists in `intake/rfx/` |
| Analyse *(optional)* | `analysis.md` has populated A-xx entries, not placeholder text |
| Catalogue | `evidences.md` has one or more E-xx entries, not just the template header |
| Decompose | `backlog.md` has real item rows, not the template's `[Item title]` placeholders |
| Strategise | `registry.md` Global Decisions (G-01+) are filled in, not bracketed placeholders |
| Deliberate / Design / Draft / Refine *(per item)* | read the Status column in `backlog.md` for each row: `Not Started` → `Deliberate Complete` → `Design Complete` → `Drafted` → `Approved`. Cross-check against the presence of the item's `items/item-XX-*.md` files — flag any mismatch (e.g. status says `Drafted` but no response file exists) rather than silently trusting one source. |
| Assemble | `final-submission.md` / `.docx` exist |

## Step 4 — Present status and recommend the next step

Give a compact, scannable answer, not a wall of text:

1. **One-line overall position** — e.g. "Strategise is done; 8 items are still `Not Started`, 2 are `Approved`."
2. **Per-item table** (only if a backlog exists): `# | Title | Status | Next action`.
3. **One clear recommendation** — the exact next command to run and why, in the surface-appropriate form (see above). If several items are ready for the same next skill, name the first and note the others can follow the same way (e.g. `/deliberate item-02` — items 03–05 are also `Not Started` and can follow the same command once 02 is done).
4. **Path check** — the moment every item first reaches `Design Complete` with none yet `Drafted`, the Standard and Big Bang paths diverge. Ask the user which they intend to follow (Standard: `/draft` then `/refine` per item; Big Bang: skip straight to `/assemble`, which drafts and finalizes in one pass) rather than assuming.

Map backlog item status to next action:

| Status | Next command |
|---|---|
| *(no backlog yet)* | `/decompose` |
| `Not Started` | `/deliberate item-XX` |
| `Deliberate Complete` | `/design item-XX` |
| `Design Complete` | `/draft item-XX` (Standard) or hold for `/assemble` (Big Bang) |
| `Drafted` | `/refine item-XX` |
| `Approved` | nothing — ready to be included in `/assemble` |

Map pursuit-level gaps to next action:

| Gap | Next command |
|---|---|
| No workspace | `/setup` |
| Workspace exists, `intake/rfx/` empty | add RFx documents to `intake/` (manual, no command) |
| Intake present, no `analysis.md` | `/analyse` (recommended, optional) |
| `evidences.md` not populated | `/catalogue` |
| `backlog.md` not populated | `/decompose` |
| Backlog exists, Global Decisions not set | `/strategise` |
| All items `Approved` (or Standard Path complete) | `/assemble` |

## Step 5 — Answer specific questions

If the invocation includes an item reference (e.g. `/help item-03`) or a question about a specific skill (e.g. `/help what does deliberate do`), answer that directly instead of dumping the full pursuit overview:

- **Item reference** — report that item's current status, which files exist for it, and the single next action.
- **Skill question** — summarize the referenced skill's purpose, inputs, and outputs by reading the corresponding `skills/<name>.md`, in plain language.

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
| Analyse | `/analyse` | Produce a structured `analysis.md` from the RFx documents |
| Questions | `/questions` | Generate a candidate list of clarification questions for the issuer (`questions.md`) — optional, any time |
| Catalogue | `/catalogue` | Scan intake and populate the evidence registry (`evidences.md`) |
| Decompose | `/decompose` | Break the solicitation into backlog items (`backlog.md`) |
| Strategise | `/strategise` | Set pursuit-wide global decisions (`registry.md`) |
| Deliberate | `/deliberate item-XX` | Explore options and record decisions for one item |
| Design | `/design item-XX` | Turn an item's decisions into a response blueprint |
| Draft | `/draft item-XX` | Generate draft response content for one item (Standard Path) |
| Refine | `/refine item-XX` | Review, critique, and finalize an item's response |
| Assemble | `/assemble` | Produce `final-submission.md` / `.docx` from all item responses |

## Output

None. Help only reads files and reports — it never writes to the workspace or changes any item's status.
