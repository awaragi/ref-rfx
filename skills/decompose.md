---
name: Decompose
description: Break the solicitation into backlog items
command: /decompose
---

# Skill: Decompose

## Backlog Awareness

Read `workspace/backlog.md`. Decompose should only run when pursuit status is `Intake Complete`. If it is not, flag this to the user before proceeding.

## Purpose

Analyze the RFP materials and break the solicitation into discrete, independently manageable backlog items. Each item becomes a separate work package that will be deliberated, designed, and responded to individually.

## Steps

1. Read all files in `workspace/intake/rfp/`.
2. Identify all response sections, evaluation criteria, mandatory requirements, and any other components that require a written response.
3. Propose a backlog item list to the user. For each item include:
   - Item number (zero-padded: `01`, `02`, ...)
   - Item title
   - RFP reference (section, page)
   - Word or page limit (if specified)
   - Evaluation weighting (if specified)
4. Review the proposed list with the user. Adjust based on feedback — items may be merged, split, or reordered.
5. Once the user confirms the list, write `workspace/backlog.md`.
6. Update pursuit status in `workspace/backlog.md` to `Decomposed`.

## Output

- `workspace/backlog.md` — full backlog with all items at status `Not Started`

## workspace/backlog.md Format

```markdown
# Backlog

**Pursuit:** [Pursuit name]  
**Status:** Decomposed  
**Last updated:** [Date]

---

| # | Title | RFP Ref | Limit | Weight | Status |
|---|-------|---------|-------|--------|--------|
| 01 | [Title] | [Section X.X] | [X words] | [X%] | Not Started |
| 02 | [Title] | [Section X.X] | — | [X%] | Not Started |
```
