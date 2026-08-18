---
pursuit: <Pursuit name>
issuer: <Issuing organization>
due_date: <Submission due date>
created_date: <auto: today's date>
---

# RFx Analysis

## Table of Contents

<!-- Regenerate this list to match the items actually written below, in order.
     Anchors must be plain GitHub/Cursor-style slugs of the heading text
     (lowercase, spaces -> hyphens, punctuation stripped) — do not use custom
     <a id> anchors, they are not honored by Cursor's or GitHub's link navigation. -->

- [A-01: Procurement Overview](#a-01-procurement-overview)
- [A-02: Scope Summary](#a-02-scope-summary)
- [A-03: Evaluation Framework](#a-03-evaluation-framework)
- [A-04: Mandatory Requirements](#a-04-mandatory-requirements)
- [A-05: Submission Requirements](#a-05-submission-requirements)
- [A-06: Key Risks and Constraints](#a-06-key-risks-and-constraints)

---

### A-01: Procurement Overview

1. [Procurement type (RFx, RFQ, RFSO, IDIQ call-up, etc.), issuing organization, and contract vehicle. Cite the relevant RFx section.]
2. [Estimated contract value, contract term, and any renewal/extension options.]
3. [Submission deadline and other key dates (info sessions, Q&A cutoff, addenda cutoff, closing).]
4. [Issuing authority and any co-issuing, partnering, or benefiting departments.]
5. [Stated purpose of the solicitation, in the issuer's own framing.]
6. [Add further numbered points for any other procurement-overview facts material to the pursuit — e.g. addenda issued to date, interested-suppliers/competitive-field signal, irrevocability period. No maximum.]

---

### A-02: Scope Summary

1. [Key deliverables and major service or solution areas.]
2. [Geographic scope and user population served.]
3. [Notable exclusions or explicitly out-of-scope items, with the relevant RFx section cited.]
4. [What "done" looks like from the client's perspective — the target end state.]
5. [Add further numbered points for any other scope facts material to the pursuit — e.g. scope segmentation, phasing, data/technology constraints threading through scope. No maximum.]

---

### A-03: Evaluation Framework

_The full itemized list of scored criteria and their weights lives in `workspaces/<slug>/scoring-criteria.md` (one `C-XX` row per criterion) — do not duplicate that list here. This item covers methodology and strategic implications only._

1. [Evaluation methodology and overall structure — stages/gates, pass-fail elements, total points.]
2. [Minimum thresholds to advance between stages, and consequence of falling short.]
3. [Which criteria carry the most weight, and what the evaluator appears to value most — reference the relevant `C-XX` IDs from `scoring-criteria.md` rather than restating them.]
4. [How the scoring methodology rewards differentiation versus mere compliance — e.g. rubric language on "excellent" vs. "acceptable."]
5. [Add further numbered points for any other evaluation-mechanics facts material to the pursuit — e.g. reserved rights, tie-breaking rules. No maximum.]

---

### A-04: Mandatory Requirements

_The full itemized list of pass/fail requirements lives in `workspaces/<slug>/mandatory-requirements.md` (one `M-XX` row per requirement) — do not duplicate that list here. This item covers implications and risk only._

1. [Which mandatory requirements are straightforward versus which warrant a pursuit-level decision — reference the relevant `M-XX` IDs from `mandatory-requirements.md` rather than restating them.]
2. [Highlight any requirement that is unusual, potentially disqualifying, or requires specific certifications, security clearances, insurance coverage, or past-performance thresholds.]
3. [Add further numbered points as needed — one per distinct implication or risk theme, not one per requirement (that granularity belongs in the register). No maximum.]

---

### A-05: Submission Requirements

1. [Submission channel and structure — number of volumes/envelopes, what each contains.]
2. [Format requirements: page or word limits (per section and in total), file format, font, margin, upload/file-size constraints.]
3. [Hard deadlines for questions, clarifications, addenda, and final submission, and the channel(s) permitted for each.]
4. [Any unusual procedural requirements — oral presentations, site visits, reference checks, financial disclosures, live demos.]
5. [Add further numbered points for any other submission-mechanics facts material to the pursuit. No maximum.]

---

### A-06: Key Risks and Constraints

1. [Each material risk, ambiguity, or red flag as its own numbered point — unrealistic timelines, vague scope, restrictive mandatory requirements, tight pricing constraints, unusual contract terms, bid-and-proposal cost constraints, etc.]
2. [For each risk, state the potential impact and any mitigation options in the same point.]
3. [Flag anything that requires a pursuit-level decision before responding.]
4. [Add further numbered points as needed — one per distinct risk or constraint. No maximum.]

---

## Adding Additional Items

A-01 through A-06 above are the required baseline — they must always be present. Add as many further items as warranted by the specific RFx (A-07, A-08, A-09, ...); **there is no maximum**. Additional items are just as welcome for RFx-specific findings that don't fit the baseline six as they are for splitting an overloaded baseline topic into more focused ones.

Format every additional item exactly like the baseline: a single `### A-xx: Topic Name` heading followed by a numbered list of detailed points — not a prose paragraph. Each numbered point should still be substantive (a full sentence or several), cite RFx sections where relevant, and surface implications or recommendations where clear. Numbering resets per item (1, 2, 3, ...), and there is no maximum number of points per item — split sub-findings into their own numbered point rather than compressing them into one dense sentence.

Every time an item is added, renamed, or reordered, update the **Table of Contents** at the top to match — one entry per item, in document order, linking to that item's heading anchor.

The following are illustrative starting points only — add, rename, or omit based on what the specific RFx actually raises. Number each one sequentially as the next available A-xx (A-07, A-08, ...) based on where it lands among the items actually written, not the order listed here:

- Incumbent and Competitive Landscape
- Client Strategic Priorities
- Technical Environment
- Transition Requirements
- Key Personnel Requirements
- Pricing Structure and Constraints
- Timeline and Milestones
- Onshore / Offshore and Location Requirements
- Resource and Staffing Restrictions
- Delivery Constraints
- Penalties, Liquidated Damages, and SLAs
- Questioning Period and Clarification Procedure

Remove this "Adding Additional Items" guidance section itself once the analysis is finalized — it is scaffolding for populating the document, not part of the delivered analysis.
