---
name: Intake
description: Capture and organize proposal materials into the intake folder structure
command: /intake
---

# Skill: Intake

## Backlog Awareness

Read `workspace/backlog.md`. If the pursuit has not yet been initialized, initialize it. Update the pursuit status to `Intake` before proceeding.

## Purpose

Verify and organize all incoming proposal materials. Intake is complete when all available materials are in the correct folders and any gaps are documented.

## Steps

1. Verify the folder structure exists:
   - `workspace/intake/rfp/` — RFP documents, appendices, SOW, evaluation criteria, mandatory requirements, submission instructions
   - `workspace/intake/client/` — client background, prior RFPs, prior responses, annual reports, strategic plans, org charts
   - `workspace/intake/supporting/` — corporate IPs, frameworks, platforms, certifications, case studies, past performance references
2. List all files found in each folder and present to the user.
3. Flag any missing material categories and ask the user whether they will be added later or are not applicable.
4. Note any submission constraints identified in the RFP (due date, page/word limits, format requirements).
5. Update `workspace/backlog.md` pursuit status to `Intake Complete` when the user confirms materials are in place.

## Output

- Updated `workspace/backlog.md` pursuit status
- A summary of intake materials and any flagged gaps (in conversation)
