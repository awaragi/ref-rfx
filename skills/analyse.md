---
name: Analyse
description: Validate intake materials and produce a structured RFx analysis document
command: /analyse
---

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

If `workspace/analysis.md` already exists, read it first and update it in place rather than overwriting unchanged sections.

If it does not exist, create it using `templates/analysis.md` as the base.

Always include the six common baseline items A-01 through A-06. Add as many additional A-xx items as warranted by the specific RFx — there is no maximum. Each item must be substantive paragraph-form analysis, not a bullet summary. Write for a pursuit team member who will use this to make strategic positioning decisions. Be specific, cite RFx sections where relevant, and surface implications and recommendations where they are clear.

**Common baseline items (always required):**

| ID | Topic |
|----|-------|
| A-01 | Procurement Overview |
| A-02 | Scope Summary |
| A-03 | Evaluation Framework |
| A-04 | Mandatory Requirements |
| A-05 | Submission Requirements |
| A-06 | Key Risks and Constraints |

**Additional items — add as applicable to the specific RFx:**

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

The list above is illustrative. Add, rename, or omit additional items based on what the solicitation actually contains.

Each A-xx item must follow this format:

```
### A-XX
**Topic:** [Topic name]

[One or more paragraphs of substantive analysis.]

---
```

### 4. Update Pursuit Metadata

Extract the pursuit name, issuer, and due date from the RFx documents. Update the YAML frontmatter of `workspace/analysis.md`. Confirm these values are consistent with `workspace/backlog.md` — flag any discrepancy to the user.

### 5. Confirm and Prompt Next Step

Present a brief summary of the analysis items written. Then:

> "Analysis complete. Review `workspace/analysis.md` for accuracy and add any comments before proceeding. When ready, run `/decompose` to break the solicitation into backlog items."

## Output

- `workspace/analysis.md` — structured RFx analysis document
