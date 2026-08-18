---
name: Assemble
description: Produce the final submission from all item response files
command: /assemble
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**

# Skill: Assemble

## Backlog Awareness

Read `workspaces/<slug>/backlog.md` in full before proceeding. Assemble operates on the entire pursuit, not a single item. It includes all items with a response file regardless of status.

## Output Format Awareness

Read `output_format` from `workspaces/<slug>/backlog.md` frontmatter (`word`, `powerpoint`, or `both`; treat a missing field as `word`). Assemble runs Stages 1–3 once per active track, independently:

| `output_format` | Active track(s) | Item files read from | Compiled Markdown output |
|---|---|---|---|
| `word` | Word | `workspaces/<slug>/items/word/` | `workspaces/<slug>/final-submission-word.md` |
| `powerpoint` | PowerPoint | `workspaces/<slug>/items/powerpoint/` | `workspaces/<slug>/final-submission-powerpoint.md` |
| `both` | Word and PowerPoint | both folders | both files |

## Purpose

Produce the final submission Markdown for each active track. Assemble is safe to run at any point — it generates responses for items with a design but no response, then compiles all responses in order, per track. Converting the compiled Markdown into a final `.docx` or `.pptx` is intentionally left to the user (see Conversion below) — Assemble's job ends at Markdown.

## Stage 1 — Auto-generate missing item responses

For every item in `workspaces/<slug>/backlog.md`, and for each active track, if the item has a design file (`workspaces/<slug>/items/<format>/item-XX-design.md`) but no response file (`workspaces/<slug>/items/<format>/item-XX-response.md`):

1. Apply the Draft skill logic (for that track) to generate the response.
2. Write `workspaces/<slug>/items/<format>/item-XX-response.md`.
3. Update the item's status for that track in `workspaces/<slug>/backlog.md` to `Drafted`.

Items that already have a response file for a given track are left untouched.

## Stage 2 — Assemble the final submission Markdown

For each active track:

1. Read all item response files for that track, in backlog order, regardless of status.
2. Strip YAML frontmatter from each file.
3. Concatenate responses into `workspaces/<slug>/final-submission-<format>.md` (i.e. `final-submission-word.md` and/or `final-submission-powerpoint.md`).
4. For any item with no response file and no design file for that track, insert a labelled placeholder:
   ```
   [RESPONSE PENDING: Item XX — Title]
   ```

## Stage 3 — Compliance Gate

If `workspaces/<slug>/mandatory-requirements.md` and/or `workspaces/<slug>/scoring-criteria.md` exist, check them after Stage 2 completes for each active track:

1. List every `M-XX` row not at `Compliant` — these are live disqualification risks. Include administrative rows (`Owning Item: — (administrative)`), since Assemble has no way to verify those itself.
2. List every `C-XX` row not at `Addressed` or `Verified`, ordered by `Weight` descending — these are scoring exposure, worst first.
3. Present both lists to the user as a compliance summary, even if empty (report "No open gaps" explicitly rather than staying silent). Do not block assembly on open gaps — Assemble stays safe to run at any point per its Purpose — but the summary must be impossible to miss, e.g. placed immediately after the per-track file list in Assemble's final confirmation message.

This gate is advisory, not a rewrite of the registers themselves — `/refine` remains the place where `Status` values actually change.

## Conversion to `.docx` / `.pptx` — out of scope, by design

This framework deliberately stops at Markdown. Turning `final-submission-word.md` into a `.docx`, or `final-submission-powerpoint.md` into a `.pptx`, is left to whatever conversion tool the user has available — a coding agent with code execution (local or cloud), pasting the Markdown into a chatbot and asking for the converted file, Pandoc, or any other converter. This keeps the toolkit dependency-free (no bundled runtime, no scripts to install or maintain) and fully portable across every AI surface this framework supports.

Whoever performs the conversion should preserve these conventions so the result is predictable:

**Word, from `final-submission-word.md`:**

| Markdown element | Word style |
|---|---|
| `# Heading` | Heading 1 |
| `## Heading` | Heading 2 |
| `### Heading` | Heading 3 |
| Body text | Normal |
| Bullet list | List Bullet |
| Numbered list | List Number |
| Table | Table Grid |
| Bold inline | Strong |
| Code / verbatim | Verbatim Char |

**PowerPoint, from `final-submission-powerpoint.md`:**

| Markdown element | PPTX mapping |
|---|---|
| `## Slide N — Title` (or whatever heading convention the response actually used) | New slide; text becomes the Title placeholder |
| `**Layout:** ...` (if present) | Slide layout to use — whatever the author specified, or an equivalent inferred from a reference template if one was used. This framework doesn't mandate a fixed layout set, so there's no default to fall back on if it's absent — use judgment. |
| Bullet list | Content placeholder bullets |
| `> Speaker notes: ...` (if present) | Notes pane — not visible on the slide itself |
| Table | Table shape |
| `![alt](path)` | Picture placeholder / embedded image |

None of this is mandatory structure — a response may use bullets, prose, tables, or any mix per slide, since the framework places no restriction on PowerPoint visuals or organization (see `/design`). Convert what's actually there rather than expecting a fixed shape.

In both formats, any text matching `[PLACEHOLDER TEXT]` or `[RESPONSE PENDING: ...]` should be flagged distinctly in the converted output (e.g. highlighted yellow in Word; bold red text in PowerPoint, since highlight-run support is inconsistent there) so unfilled placeholders stay visible right up to submission.

## Output

- `workspaces/<slug>/items/<format>/item-XX-response.md` (any newly generated item responses, per active track)
- `workspaces/<slug>/final-submission-word.md` (if `output_format` is `word` or `both`)
- `workspaces/<slug>/final-submission-powerpoint.md` (if `output_format` is `powerpoint` or `both`)
- A compliance summary in conversation (Stage 3) — no file is written by this stage
