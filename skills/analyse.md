---
name: Analyse
description: Validate intake materials and produce a structured RFx analysis document
command: /analyse
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Analyse

## Purpose

Validate that RFx documents are present, read all intake materials in full, and produce a structured `workspaces/<slug>/analysis.md` that captures the key intelligence from the solicitation, alongside two itemized registers: `workspaces/<slug>/mandatory-requirements.md` (every pass/fail gate) and `workspaces/<slug>/scoring-criteria.md` (every rated/weighted criterion). `analysis.md` covers narrative strategic understanding (A-03/A-04); the two registers cover exhaustive, trackable, one-row-per-requirement coverage that later skills check against.

Analyse is a standalone research step. Its output is for the team's strategic understanding before Decompose breaks the solicitation into backlog items. Decompose reads the raw RFx files independently and does not depend on the analysis document, but does read the two registers if they exist, to cross-link backlog items to `M-XX`/`C-XX` IDs.

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

### 4. Write the Mandatory Requirements Register

While reading the RFx documents (Step 2), separately track every must-meet, pass/fail, or eligibility requirement — anything that gates the bid outright rather than merely earning or losing points. This is the same material A-04 discusses narratively, but here it becomes an exhaustive, itemized, trackable list.

If `workspaces/<slug>/mandatory-requirements.md` does not exist, copy `templates/mandatory-requirements.md` and populate it. If it already exists, read it first and update it in place — add newly found requirements, correct any invalidated by an addendum, and preserve existing `Status` values and notes rather than resetting them.

`templates/mandatory-requirements.md` defines the required register format (one `M-XX` row per requirement) and explains the `Owning Item` and `Status` fields. Follow it exactly. Leave `Owning Item` as `— (administrative)` for requirements that don't need a written response; `/decompose` will fill in real item numbers where one is assigned.

### 5. Write the Scoring Criteria Register

Likewise, track every rated/weighted evaluation criterion the RFx scores the bid against — this is the same material A-03 discusses narratively, but here it becomes an exhaustive, itemized register with weights.

If `workspaces/<slug>/scoring-criteria.md` does not exist, copy `templates/scoring-criteria.md` and populate it. If it already exists, read it first and update it in place — add newly found criteria, correct any invalidated by an addendum, and preserve existing `Status` values and notes rather than resetting them.

`templates/scoring-criteria.md` defines the required register format (one `C-XX` row per criterion) and explains the `Weight`, `Sub-Criteria`, `Owning Item(s)`, and `Status` fields. Follow it exactly. Flag to the user if the weights don't sum to the stated total (100% or the RFx's stated points scale) — that usually signals a missed or misread criterion. Leave `Owning Item(s)` empty for now; `/decompose` will fill in real item numbers.

### 6. Update Pursuit Metadata

Extract the pursuit name, issuer, and due date from the RFx documents. Update the YAML frontmatter of `workspaces/<slug>/analysis.md`, `workspaces/<slug>/mandatory-requirements.md`, and `workspaces/<slug>/scoring-criteria.md`. Confirm these values are consistent with `workspaces/<slug>/backlog.md` — flag any discrepancy to the user.

### 7. Confirm and Prompt Next Step

Present a brief summary of the analysis items written, plus the counts from the Mandatory Requirements and Scoring Criteria registers (total rows, and weights sum for the latter).

## Output

- `workspaces/<slug>/analysis.md` — structured RFx analysis document
- `workspaces/<slug>/mandatory-requirements.md` — itemized register of pass/fail requirements
- `workspaces/<slug>/scoring-criteria.md` — itemized register of rated/weighted criteria
