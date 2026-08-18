---
pursuit: <Pursuit name>
issuer: <Issuing organization>
due_date: <Submission due date>
created_date: <auto: today's date>
total_points: <auto: total points or 100% if the RFx states a points-based or percentage-based scale; leave as "Not stated" if the RFx does not quantify total points>
---

# Scoring Criteria Register

Every rated / weighted evaluation criterion in the RFx, as its own row — this is the canonical, itemized list `/decompose`, `/deliberate`, `/refine`, and `/assemble` check against. It is produced by `/analyse` and does not replace the narrative discussion in `analysis.md`'s **A-03: Evaluation Framework** — that section covers methodology, stages, and strategic implications; this register covers exhaustive, itemized weight and coverage tracking.

A criterion belongs here if the evaluator awards a score or points against it — not a simple pass/fail gate (those belong in `mandatory-requirements.md` instead). If a criterion is both scored and carries a minimum threshold to pass, list it here and cross-reference the matching `M-XX` row.

## How to use this list

- **Weight** is the criterion's share of the total score, in whatever unit the RFx uses (%, points, or a relative ranking if the RFx doesn't quantify it — state "Not quantified" rather than guessing).
- **Owning Item(s)** links a criterion to the `workspaces/<slug>/backlog.md` item(s) whose response addresses it. A criterion may map to more than one item (list all); an item may address more than one criterion.
- **Sub-Criteria** captures any stated breakdown within a criterion (e.g. a "Technical Approach" criterion split into methodology, risk management, and innovation sub-scores). Leave blank if the RFx doesn't break the criterion down further.
- **Status** starts at `Not Addressed` and moves to `Addressed` once `/design` or `/draft` commits content against it, then `Verified` once `/refine` confirms the response substantively covers it (not just mentions it).
- Before `/assemble` produces a final submission, every row should be at least `Addressed`, ideally `Verified`. Any row still `Not Addressed` — especially a high-weight one — is a scoring risk and should be flagged to the user.
- `/deliberate`'s QVA dimension (Standing Decision S-05) and `/refine`'s evaluator-alignment review both work against this register: QVAs should specifically target the highest-weighted, least-differentiated criteria first.

---

## Register

| ID | Criterion | RFx Ref | Weight | Sub-Criteria | Owning Item(s) | Status | Notes |
|----|-----------|---------|--------|---------------|-----------------|--------|-------|
| C-01 | [Exact criterion name/label as used by the RFx] | [Section X.X, p. X] | [X% or X points] | [Sub-criterion breakdown, or "—"] | [Item XX, Item YY] | Not Addressed | [What "excellent" looks like per the rubric language, if stated; differentiation angle] |

<!-- Add one row per distinct scored criterion — there is no maximum. Number sequentially (C-01,
     C-02, ...) in the order criteria appear in the RFx's evaluation section. Weights should sum to
     100% (or the stated total points) across all rows — flag to the user if they don't, since that
     signals either a missed criterion or a misread weight.

     Remove this comment once the register is populated for the actual pursuit. -->

---

## Summary

**N scoring criteria** identified, totaling [N% / N points / "Not fully quantified — see Notes"]. Status: N Verified / N Addressed / N Not Addressed. Highest-weighted unaddressed criterion: [ID and name, or "None — full coverage"].
