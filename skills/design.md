---
name: Design
description: Convert item decisions into a response blueprint
command: /design
---

# Skill: Design

## Backlog Awareness

Read `workspace/backlog.md`. Without an explicit item argument, work on the first item with status `Deliberate Complete`. With an explicit item number (e.g. `/design item-03`), work on that item regardless of status.

Read `workspace/items/item-XX-decisions.md` for the active item before proceeding.

Update the item status to `Designing` in `workspace/backlog.md` before proceeding.

## Purpose

Convert the item's decisions into a concrete response blueprint. Design defines structure, narrative arc, evidence mapping, and section-level content direction — without writing the response prose.

## Steps

1. Read the item decisions file (`workspace/items/item-XX-decisions.md`) in full.
2. Read `workspace/registry.md` to ensure the design is consistent with global decisions.
3. Propose a design to the user covering:
   - **Core narrative** — one-sentence theme for the response
   - **Proposed structure** — ordered list of sections and subheadings
   - **Section-level direction** — for each section, what point it makes and which evidence or QVA it uses
   - **What to avoid** — language, claims, or approaches that would weaken the response
4. Review the proposed design with the user. Adjust based on feedback.
5. Once the user confirms, write `workspace/items/item-XX-design.md`.
6. Update item status in `workspace/backlog.md` to `Design Complete`.

## Output

- `workspace/items/item-XX-design.md`
- Updated `workspace/backlog.md`

## item-XX-design.md Format

```markdown
# Item [XX] — [Title] — Design

**Status:** Design Complete  
**Based on:** `workspace/items/item-XX-decisions.md`

---

## Core Narrative

[One sentence: the central theme of this response]

## Proposed Structure

1. [Section title] — [what this section establishes]
2. [Section title] — [evidence or QVA anchored here]
3. ...

## Section Direction

### [Section 1 title]
[What to argue, which evidence to use, any QVA to place here]

### [Section 2 title]
[...]

## What to Avoid

- [Claim or approach to exclude]
```
