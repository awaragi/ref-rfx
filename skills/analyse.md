---
name: Analyse
description: Validate intake materials and produce a structured RFx analysis document
command: /analyse
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Analyse

## Purpose

Validate that RFx documents are present, read all intake materials in full, and produce a structured `workspaces/<slug>/analysis.md` that captures the key intelligence from the solicitation.

Analyse is a standalone research step. Its output is for the team's strategic understanding before Decompose breaks the solicitation into backlog items. Decompose reads the raw RFx files independently and does not depend on the analysis document.

## Steps

### 1. Validate Intake

1. Check that `workspaces/<slug>/intake/rfx/` exists and contains at least one file.
   - If empty or missing, stop and ask the user to add RFx documents before continuing.
2. List all files found in each intake folder and present them to the user:
   - `workspaces/<slug>/intake/rfx/`
   - `workspaces/<slug>/intake/client/`
   - `workspaces/<slug>/intake/supporting/`

### 2. Read All Documents

Read every file in `workspaces/<slug>/intake/rfx/` in full. Also read available files in `workspaces/<slug>/intake/client/` and `workspaces/<slug>/intake/supporting/` to enrich context.

### 3. Write the Analysis Document

If `workspaces/<slug>/analysis.md` does not exist, copy `templates/analysis.md` to `workspaces/<slug>/analysis.md` and populate it in place. If it already exists, read it first and update it in place rather than overwriting unchanged sections.

`templates/analysis.md` defines the required baseline items (A-01 through A-06) and the per-item format. Each item must be a numbered list of detailed points — not a single dense paragraph, and not a shallow bullet summary. Each numbered point should still be substantive (a full sentence or several) and cover one discrete fact, finding, or implication; split sub-findings into their own numbered point rather than compressing them together. Write for a pursuit team member making strategic positioning decisions; be specific, cite RFx sections where relevant, and surface implications and recommendations where they are clear.

The template's own "Adding Additional Items" section explains how and when to add further A-xx items beyond the baseline (there is no maximum) and lists illustrative example topics — follow it, and remove that scaffolding section from the workspace copy once the analysis is finalized. Keep the Table of Contents in sync with whatever items exist at the end of this step.

### 4. Update Pursuit Metadata

Extract the pursuit name, issuer, and due date from the RFx documents. Update the YAML frontmatter of `workspaces/<slug>/analysis.md`. Confirm these values are consistent with `workspaces/<slug>/backlog.md` — flag any discrepancy to the user.

### 5. Confirm and Prompt Next Step

Present a brief summary of the analysis items written.

## Output

- `workspaces/<slug>/analysis.md` — structured RFx analysis document
