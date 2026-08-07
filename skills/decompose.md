---
name: Decompose
description: Validate intake materials, then break the solicitation into backlog items
command: /decompose
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Decompose

## Purpose

Validate available materials, analyze the solicitation, and break it into discrete, independently manageable backlog items.

## Step 1 — Intake Pre-Flight

1. Verify the following intake folders exist; create any that are missing:
   - `workspaces/<slug>/intake/rfx/`
   - `workspaces/<slug>/intake/client/`
   - `workspaces/<slug>/intake/supporting/`
2. List all files found in each folder and present to the user.
3. For any non-rfx folder that is empty, flag it and ask whether materials will be added later or the category is not applicable.
4. If `workspaces/<slug>/intake/rfx/` is empty, stop and ask the user to add RFx documents before continuing.

## Step 2 — Decompose into Backlog Items

1. Read all documents in `workspaces/<slug>/intake/rfx/` in full.
2. Identify all response sections, evaluation criteria, mandatory requirements, and any other components that require a written response.
3. Surface any submission constraints (due date, page/word limits, file format) in conversation so the user is aware before backlog items are created.
4. Determine `output_format` for the pursuit: does the solicitation require a written narrative response (Word), a slide deck (e.g. for an oral presentation or orals defense), or both? If the RFx is explicit about this, state the detected value and confirm it with the user; if it's silent or leaves it to the offeror's discretion, ask directly. Record the confirmed value (`word`, `powerpoint`, or `both`) in the `output_format` field of `workspaces/<slug>/backlog.md` frontmatter. If it isn't already clear from context, this is also worth flagging as a candidate for `/questions` to the issuer.
5. Compare any pursuit metadata extracted from the RFx documents (pursuit name, issuer, due date, etc.) against the values currently in `workspaces/<slug>/backlog.md`. If any values differ or were previously unknown, confirm the correct values with the user and then propagate the updates to the YAML frontmatter of every `.md` file in `workspaces/<slug>/` that contains the affected field.
6. Propose a backlog item list to the user. For each item include:
   - Item number (zero-padded: `01`, `02`, ...)
   - Item title
   - RFx reference (section, page)
   - Word or page limit (if specified)
   - Evaluation weighting (if specified)
   - Owner (the bid-team role responsible for the item — see Step 3 below)
7. Always include standard RFx response documents in the proposed list if they are not already required by the solicitation. Suggest any that are appropriate for the pursuit and flag them as recommended additions:
   - Cover / transmittal letter
   - Executive summary
   - Table of contents
   - Acronyms and definitions
   - Assumptions and constraints
   - Exceptions and deviations
8. Review the proposed list with the user. Adjust based on feedback — items may be merged, split, reordered, or removed.
9. Once the user confirms the list, write `workspaces/<slug>/backlog.md`, including the confirmed `output_format`. If `output_format` is `both`, split the table's `Status` column into `Status (Word)` and `Status (PowerPoint)`, both initialized to `Not Started` — see `templates/backlog.md` for the exact convention.

## Step 3 — Assign an Owner to Each Item

Every backlog item is assigned to a bid-team **role** (not necessarily a named individual) responsible for producing that response. Bid team composition varies by pursuit — there is no fixed role list. For each item:

1. Infer the most plausible owning role from the nature of the requirement and any team/roles information present in the RFx or client intake documents (e.g. a security questionnaire implies a Security Lead; a pricing schedule implies a Pricing/Commercial Lead; a delivery methodology section implies a Delivery/Technical Lead; a legal terms redline implies Legal/Contracts; standard boilerplate like the cover letter or table of contents implies the Proposal/Bid Manager).
2. Do not force items into a predefined taxonomy — name the role in whatever terms fit this pursuit's team (e.g. `Technical Lead`, `Pricing Lead`, `Security Lead`, `Legal/Contracts`, `Delivery/PM`, `Bid Manager`, `SME – <domain>`).
3. If the correct owner isn't reasonably clear from context, do not guess silently — ask the user which role (or person) should own that item.
4. Present the inferred/assigned owner alongside each item in the Step 2 review so the user can correct any of them before the list is confirmed.

## Output

- `workspaces/<slug>/backlog.md` — full backlog with all items at status `Not Started`

Copy `templates/backlog.md` to `workspaces/<slug>/backlog.md` (if it does not already exist), then populate the YAML frontmatter and table rows from the confirmed item list.
