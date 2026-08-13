---
name: Strategise
description: Explore pursuit-level options and record global cross-cutting decisions before item-level work begins
command: /strategise
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**


# Skill: Strategise

## Purpose

Set the pursuit-wide strategic foundation before any item-level work begins. Strategise explores the key cross-cutting dimensions of the pursuit and records the global decisions that will govern all subsequent Deliberate, Design, and Draft steps.

Strategise runs once per pursuit, after Decompose and before item-level Deliberate.

## Explore Loop

Also read `workspaces/<slug>/analysis.md` (if it exists) and all files in `workspaces/<slug>/intake/` before exploring dimensions. Then work through the dimensions below **one question at a time**, following the interaction pattern in INSTRUCTIONS.md.

Dimensions to cover:

- **Win theme** — First establish the single overarching narrative the evaluator should be left with after reading the full submission (this becomes G-01). Then identify 3–5 supporting win theme pillars that prove it — explore them one at a time, each with: a short label, a one-sentence core message, why it matters for this specific RFx (tied to a stated evaluation criterion or a named client pain point, not a generic claim), and where it should be threaded (which backlog items/sections must carry this pillar). These become rows in the **Win Theme Pillars** table.
- **Competitive positioning** — How to frame against the likely competition: incumbent-challenger, specialist, transformation leader, low-risk safe pair of hands, or other?
- **Delivery model** — Onshore, offshore, nearshore, or hybrid staffing posture? Any location commitments or transition considerations?
- **Technology environment** — Which platforms, tools, or tech stack to lead with? Any proprietary IP, partnerships, or preferred technology narrative?
- **Alliances and partnerships** — Any teaming arrangements, JVs, named subcontractors, or strategic partners to highlight and how to position them?
- **Response format and medium** — Document only, oral presentation, both? How to structure the submission for maximum evaluator impact? Confirm `output_format` (`word`, `powerpoint`, or `both`) in `workspaces/<slug>/backlog.md` frontmatter — this is normally set during `/decompose`, but revisit it here if the strategic conversation surfaces a reason to change it (e.g. deciding to add an orals deck alongside the written response). If it changes, update `backlog.md` directly as part of this dimension rather than waiting for Output. If the change is to or from `both`, also update the `Status` column(s) to match: splitting a single `Status` column into `Status (Word)` / `Status (PowerPoint)` (copying the current value into both, since any Deliberate work already done applies to both tracks equally), or merging them back into one if dropping `both`.
- **Pricing posture** — Competitive on price, value-based premium, cost-optimization focus, or fixed-price confidence?
- **Risk posture** — What is the firm's risk appetite for this pursuit? Any performance guarantees, risk-sharing arrangements, or risk mitigation commitments to establish upfront?

After all dimensions are covered, ask: *"I have covered all strategic dimensions. Is there anything else — an additional constraint, an alliance, a client relationship, or a competitive intelligence item — you want captured before I write up the global decisions?"*

## Output

Once the user confirms, update `workspaces/<slug>/registry.md`:

- Populate or update the **Global Decisions** section with one G-XX entry per confirmed decision
- Populate or update the **Win Theme Pillars** table with one row per confirmed pillar
- Preserve all existing Standing Decisions (S-XX entries) unchanged
- If the registry already contains G-XX entries or pillar rows, update them in place rather than duplicating

Then confirm to the user: *"Global decisions recorded in workspaces/<slug>/registry.md. You are ready to begin item-level Deliberate."*

## G-XX Entry Format and Win Theme Pillars

Use the G-XX entry format defined in `templates/registry.md` for single-value decisions (Delivery posture, Security posture, Pricing narrative, etc.). Populate **Category**, **Decision**, and **Rationale** from the confirmed strategic choices.

The win theme itself is two-tiered: G-01 holds the single overarching narrative; the **Win Theme Pillars** table (immediately below G-01 in `registry.md`) holds the 3–5 supporting pillars, one row each, with **Pillar**, **Core Message**, **Why It Matters For This RFx**, and **Where To Apply**. The last column is what lets Deliberate and Design check, per item, which pillars that item must carry.

## Notes

- Strategise does not create or modify backlog items.
- Strategise can be re-run at any point to revisit or extend global decisions; re-running does not reset item-level work.
