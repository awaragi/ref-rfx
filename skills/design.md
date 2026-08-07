---
name: Design
description: Convert item decisions into a response blueprint
command: /design
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**

# Skill: Design

## Backlog Awareness

Read `workspaces/<slug>/backlog.md`. Without an explicit item argument, work on the first item with status `Deliberate Complete` (in `both` mode, the first item with either format track at that status). With an explicit item number (e.g. `/design item-03`), work on that item regardless of status.

Read `workspaces/<slug>/items/item-XX-decisions.md` for the active item before proceeding — this file is shared across format tracks and does not move.

Update the item's status to `Designing` in `workspaces/<slug>/backlog.md` before proceeding (the `Status` column, or the relevant `Status (Word)` / `Status (PowerPoint)` column in `both` mode).

## Output Format Awareness

Read `output_format` from `workspaces/<slug>/backlog.md` frontmatter (`word`, `powerpoint`, or `both`; treat a missing field as `word`). It determines which template and file location to use:

| `output_format` | Template | Item design file |
|---|---|---|
| `word` | `templates/word/item-design.md` | `workspaces/<slug>/items/word/item-XX-design.md` |
| `powerpoint` | `templates/powerpoint/item-design.md` | `workspaces/<slug>/items/powerpoint/item-XX-design.md` |
| `both` | both, run independently | both |

**In `both` mode**, if the invocation doesn't name a track (e.g. `/design item-03` rather than `/design item-03 word`), ask the user which track to design first rather than assuming. The two tracks are designed and confirmed separately — each with its own review loop — even though both draw on the same `item-XX-decisions.md`.

## Purpose

Convert the item's decisions into a concrete response blueprint. Design defines structure, narrative arc, evidence mapping, and section- or slide-level content direction — without writing the response prose.

## Steps

1. Read the item decisions file (`workspaces/<slug>/items/item-XX-decisions.md`) in full.
2. Read `workspaces/<slug>/registry.md` to ensure the design is consistent with global decisions.
3. **PowerPoint track only:** check `workspaces/<slug>/intake/` (particularly `supporting/` and `client/`) for an existing PowerPoint template or a previous deck/response. If one exists, treat it as the primary reference for slide structure, layout naming, and visual style — mirror it rather than inventing a new convention. If none exists, say so and proceed with full discretion: this framework does not impose a slide count, layout taxonomy, bullet density, or visual requirement of any kind for PowerPoint — that is entirely the author's (and the user's) call.
4. Propose a design to the user in the shape defined by the active track's template (see Output Format Awareness):
   - **Word:** core narrative, proposed section structure, section-level direction (what point each section makes and which evidence/QVA it uses), what to avoid.
   - **PowerPoint:** core narrative, reference material found (if any, per Step 3), proposed slide sequence, slide-level direction (what to argue, which evidence/QVA anchors it, whatever structure/layout/visual approach fits), what to avoid.
5. Review the proposed design with the user. Adjust based on feedback.
6. Once the user confirms, write the item design file at the path from the table above, using the matching template.
7. Update the item's status for that track in `workspaces/<slug>/backlog.md` to `Design Complete`.

## Output

- `workspaces/<slug>/items/<format>/item-XX-design.md`
- Updated `workspaces/<slug>/backlog.md`
