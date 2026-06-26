---
name: Analyse
description: Validate intake materials and produce a structured RFx analysis document
command: /analyse
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**

# Skill: Analyse

## Purpose

Validate that RFx documents are present, read all intake materials in full, and produce a structured `workspace/analysis.md` that captures the key intelligence from the solicitation.

Analyse is a standalone research step. Its output is for the team's strategic understanding before Decompose breaks the solicitation into backlog items. Decompose reads the raw RFx files independently and does not depend on the analysis document.

## Steps

### 1. Validate Intake

1. Check that `workspace/intake/rfx/` exists and contains at least one file.
   - If empty or missing, stop and ask the user to add RFx documents before continuing.
2. List all files found in each intake folder and present them to the user:
   - `workspace/intake/rfx/`
   - `workspace/intake/client/`
   - `workspace/intake/supporting/`

### 2. Read All Documents

Read every file in `workspace/intake/rfx/` in full. Also read available files in `workspace/intake/client/` and `workspace/intake/supporting/` to enrich context.

### 3. Write the Analysis Document

If `workspace/analysis.md` does not exist, copy `templates/analysis.md` to `workspace/analysis.md` and populate it in place. If it already exists, read it first and update it in place rather than overwriting unchanged sections.

`templates/analysis.md` defines the required baseline items and the per-item format. Each item must be substantive paragraph-form analysis — not a bullet summary. Write for a pursuit team member making strategic positioning decisions; be specific, cite RFx sections where relevant, and surface implications and recommendations where they are clear.

Add as many additional A-xx items as warranted by the specific RFx — there is no maximum. The following are illustrative; add, rename, or omit based on what the solicitation actually contains:

| Example ID | Example Topic |
|------------|---------------|
| A-07 | Incumbent and Competitive Landscape |
| A-08 | Client Strategic Priorities |
| A-09 | Technical Environment |
| A-10 | Transition Requirements |
| A-11 | Key Personnel Requirements |
| A-12 | Pricing Structure and Constraints |
| A-13 | Timeline and Milestones |
| A-14 | Onshore / Offshore and Location Requirements |
| A-15 | Resource and Staffing Restrictions |
| A-16 | Delivery Constraints |
| A-17 | Penalties, Liquidated Damages, and SLAs |
| A-18 | Questioning Period and Clarification Procedure |

### 4. Update Pursuit Metadata

Extract the pursuit name, issuer, and due date from the RFx documents. Update the YAML frontmatter of `workspace/analysis.md`. Confirm these values are consistent with `workspace/backlog.md` — flag any discrepancy to the user.

### 5. Confirm and Prompt Next Step

Present a brief summary of the analysis items written.

## Output

- `workspace/analysis.md` — structured RFx analysis document
