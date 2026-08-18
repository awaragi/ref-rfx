---
pursuit: <Pursuit name>
issuer: <Issuing organization>
due_date: <Submission due date>
created_date: <auto: today's date>
output_format: word   # word | powerpoint | both
---

# Backlog

<!-- If output_format is "both", split the last column into "Status (Word)" and "Status (PowerPoint)"
     so each format track is tracked independently — every other column stays shared. Both columns
     start at "Not Started" and move together through Deliberate (decisions are shared across
     tracks, so there's only ever one Deliberate pass per item); they only begin to diverge once
     Design starts, since Design/Draft/Refine run independently per track.

     "Criteria Ref" cross-links to workspaces/<slug>/mandatory-requirements.md (M-XX) and
     scoring-criteria.md (C-XX), if those registers exist (produced by /analyse). List every ID
     this item addresses, comma-separated (e.g. "M-03, C-05, C-06"). Leave "—" if the registers
     don't exist yet or genuinely no ID maps to this item (e.g. a standard boilerplate item like
     the cover letter). -->

| # | Title | RFx Ref | Limit | Weight | Criteria Ref | Owner | Status |
|---|-------|---------|-------|--------|--------------|-------|--------|
| 01 | [Item title] | [Section X.X, p. X] | [X words] | [X%] | [M-XX, C-XX] | [Role] | Not Started |
| 02 | [Item title] | [Section X.X, p. X] | — | [X%] | [M-XX, C-XX] | [Role] | Not Started |
