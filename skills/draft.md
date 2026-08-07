---
name: Draft
description: Generate draft response content for a backlog item
command: /draft
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**

# Skill: Draft

## Backlog Awareness

Read `workspaces/<slug>/backlog.md`. Without an explicit item argument, work on the first item with status `Design Complete` (in `both` mode, the first item with either format track at that status). With an explicit item number (e.g. `/draft item-03`), work on that item regardless of status.

Read `workspaces/<slug>/items/item-XX-decisions.md` (shared across format tracks) and the active track's design file for the active item before writing a single word.

Update the item's status to `Drafting` in `workspaces/<slug>/backlog.md` before proceeding (the `Status` column, or the relevant `Status (Word)` / `Status (PowerPoint)` column in `both` mode).

## Output Format Awareness

Read `output_format` from `workspaces/<slug>/backlog.md` frontmatter (`word`, `powerpoint`, or `both`; treat a missing field as `word`). It determines which template and file location to use:

| `output_format` | Template | Item design file (input) | Item response file (output) |
|---|---|---|---|
| `word` | `templates/word/item-response.md` | `workspaces/<slug>/items/word/item-XX-design.md` | `workspaces/<slug>/items/word/item-XX-response.md` |
| `powerpoint` | `templates/powerpoint/item-response.md` | `workspaces/<slug>/items/powerpoint/item-XX-design.md` | `workspaces/<slug>/items/powerpoint/item-XX-response.md` |
| `both` | both, drafted independently | both | both |

**In `both` mode**, if the invocation doesn't name a track (e.g. `/draft item-03` rather than `/draft item-03 word`), ask the user which track to draft first rather than assuming.

## Purpose

Generate the draft response body for the item, working strictly from the design file. No new themes or structural changes during drafting — update the design file first if a change is needed.

## Rules

Apply to every track:

- Write in first-person plural ("we")
- Every significant claim must be backed by a named project, metric, methodology, or RFx-aligned outcome
- Forbidden phrases: "world-class", "cutting-edge", "seamless", "robust", "synergies", "leveraging"
- Follow the structure defined in the design file exactly
- Place QVAs explicitly within the relevant section or slide

Word track only:

- Respect word or page limits identified during Deliberate
- Prose, organized under the section headings from the design file

PowerPoint track only:

- Respect slide-count limits identified during Deliberate (or the target set in the design file), if any were stated
- Follow whatever slide structure, bullet density, prose-vs-bullet mix, and visual treatment the design file called for. If the design references an existing template or previous deck (see `/design`), mirror it. This framework does not impose a structural or stylistic convention of its own on PowerPoint responses.
- Speaker notes are optional, not required — use them if useful, skip them otherwise

## Steps

1. Read the design file and decisions file in full.
2. Draft the response following the design structure — section by section (Word) or slide by slide (PowerPoint).
3. Write the item response file at the path from the table above immediately — do not wait for user confirmation.
4. Update the item's status for that track in `workspaces/<slug>/backlog.md` to `Drafted`.
5. Notify the user that the draft has been written and suggest running `/refine` to review and finalize it.

## Output

- `workspaces/<slug>/items/<format>/item-XX-response.md`
- Updated `workspaces/<slug>/backlog.md`
