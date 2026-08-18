---
pursuit: <Pursuit name>
issuer: <Issuing organization>
due_date: <Submission due date>
created_date: <auto: today's date>
---

# Mandatory Requirements Register

Every must-meet, pass/fail, or eligibility requirement in the RFx, as its own row — this is the canonical, itemized list `/decompose`, `/deliberate`, `/refine`, and `/assemble` check against. It is produced by `/analyse` and does not replace the narrative discussion in `analysis.md`'s **A-04: Mandatory Requirements** — that section covers strategic implications and risk; this register covers exhaustive, trackable coverage.

A requirement belongs here if failing it disqualifies the bid outright or triggers a pass/fail gate — not merely a scored weakness (those belong in `scoring-criteria.md` instead). If a requirement is genuinely both a gate and a scored dimension, list it here and cross-reference the matching `C-XX` row.

## How to use this list

- **Owning Item** links a requirement to the `workspaces/<slug>/backlog.md` item that carries the written response proving compliance (e.g. an insurance certificate requirement might be answered inside the "Corporate Qualifications" item). Not every requirement needs a written response — administrative/procedural gates (e.g. "submit in the specified file format") have no owning item; mark those `— (administrative)`.
- **Status** starts at `Not Verified` for every row and is updated as the pursuit progresses — by `/deliberate` and `/design` when a response approach is committed, by `/refine` when the owning item's response is confirmed to satisfy the requirement, and manually for administrative rows once the team confirms compliance.
- Before `/assemble` produces a final submission, every row should be `Compliant`. Any row still `Not Verified`, `At Risk`, or `Non-Compliant` is a live disqualification risk and should be flagged to the user.

---

## Register

| ID | Requirement | RFx Ref | Category | Consequence if Unmet | Owning Item | Status | Notes |
|----|-------------|---------|----------|----------------------|-------------|--------|-------|
| M-01 | [Exact requirement, paraphrased for clarity but faithful to the RFx wording] | [Section X.X, p. X] | [Eligibility \| Certification \| Insurance \| Financial \| Security Clearance \| Past Performance Threshold \| Format / Administrative \| Other] | [Disqualification \| Rejection of item \| Clarification requested \| Other stated consequence] | [Item XX, or "— (administrative)"] | Not Verified | [Compliance approach, evidence to cite, or open question] |

<!-- Add one row per distinct mandatory requirement — there is no maximum. Number sequentially
     (M-01, M-02, ...) in the order requirements appear across the RFx, grouping only if the RFx
     itself groups them (e.g. all insurance minimums under one clause). Do not compress multiple
     distinct pass/fail gates into a single row — an evaluator (and this register) treats each as
     independently disqualifying.

     Category is illustrative, not exhaustive — use whatever label best fits the requirement; add
     new categories freely.

     Remove this comment once the register is populated for the actual pursuit. -->

---

## Summary

**N mandatory requirements** identified — N with an owning backlog item, N administrative/procedural. Status: N Compliant / N Not Verified / N At Risk / N Non-Compliant.
