---
name: Decompose
description: Validate intake materials, then break the solicitation into backlog items
command: /decompose
---

# Skill: Decompose

## Backlog Awareness

Read `workspace/backlog.md` before proceeding.

## Purpose

Validate available materials, analyze the solicitation, and break it into discrete, independently manageable backlog items.

## Step 1 — Intake Pre-Flight

1. Verify the following intake folders exist (create any that are missing):
   - `workspace/intake/rfp/` — RFP documents, appendices, SOW, evaluation criteria, mandatory requirements, submission instructions
   - `workspace/intake/client/` — client background, prior RFPs, prior responses, annual reports, strategic plans, org charts
   - `workspace/intake/supporting/` — corporate IPs, frameworks, platforms, certifications, case studies, past performance references

2. List all files found in each folder and present to the user.

3. For any folder that is empty or missing expected materials, flag it and ask the user whether:
   - Materials will be added later (note as pending), or
   - The category is not applicable for this pursuit

4. `workspace/intake/rfp/` must contain at least one document to proceed. If it is empty, stop and ask the user to add RFP documents before continuing.

## Step 2 — Decompose into Backlog Items

1. Read all documents in `workspace/intake/rfp/` in full.
2. Identify all response sections, evaluation criteria, mandatory requirements, and any other components that require a written response.
3. Surface any submission constraints (due date, page/word limits, file format) in conversation so the user is aware before backlog items are created.
4. Compare any pursuit metadata extracted from the RFP documents (pursuit name, issuer, due date, etc.) against the values currently in `workspace/backlog.md`. If any values differ or were previously unknown, confirm the correct values with the user and then propagate the updates to the YAML frontmatter of every `.md` file in `workspace/` that contains the affected field.
5. Propose a backlog item list to the user. For each item include:
   - Item number (zero-padded: `01`, `02`, ...)
   - Item title
   - RFP reference (section, page)
   - Word or page limit (if specified)
   - Evaluation weighting (if specified)
6. Always include standard RFP response documents in the proposed list if they are not already required by the solicitation. Suggest any that are appropriate for the pursuit and flag them as recommended additions:
   - Cover / transmittal letter
   - Executive summary
   - Table of contents
   - Acronyms and definitions
   - Assumptions and constraints
   - Exceptions and deviations
7. Review the proposed list with the user. Adjust based on feedback — items may be merged, split, reordered, or removed.
8. Once the user confirms the list, write `workspace/backlog.md`.

## Output

- `workspace/backlog.md` — full backlog with all items at status `Not Started`

## workspace/backlog.md Format

```markdown
---
pursuit: [Pursuit name]
issuer: [Issuing organization]
due_date: [Submission due date]
created_date: [Today's date]
---

# Backlog

| # | Title | RFP Ref | Limit | Weight | Status |
|---|-------|---------|-------|--------|--------|
| 01 | [Title] | [Section X.X] | [X words] | [X%] | Not Started |
| 02 | [Title] | [Section X.X] | — | [X%] | Not Started |
```
