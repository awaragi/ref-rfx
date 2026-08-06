---
name: Questions
description: Generate a candidate list of clarification questions to send back to the RFx issuer
command: /questions
---

**Before taking any action, read [`INSTRUCTIONS.md`](../INSTRUCTIONS.md) from the repository root (if not already read).**
**Resolve the active workspace slug per the Workspace Resolution section of INSTRUCTIONS.md before accessing any `workspaces/<slug>/` paths.**

# Skill: Questions

## Purpose

Produce an exhaustive, unfiltered brainstorm of clarification questions to send back to the RFx issuer, capturing every ambiguity, gap, inconsistency, and risk-worthy detail surfaced in the solicitation.

Questions is a standalone research step — it is not gated by, and does not gate, any other skill. It can be run at any point in the pursuit, but is **recommended after `/analyse`**, since `analysis.md` (particularly its Key Risks and Constraints item) is a strong source of leads. Questions still reads the raw RFx files directly and does not require `analysis.md` to exist. It is also safe to re-run at any point — e.g. after an addendum is issued — to add new questions and correct anything the addendum invalidated.

Questions produces a working list, not a submission-ready set — the pursuit team triages it down before anything is actually sent to the issuer.

## Steps

### 1. Validate Intake

1. Check that `workspaces/<slug>/intake/rfx/` exists and contains at least one file.
   - If empty or missing, stop and ask the user to add RFx documents before continuing.
2. If `workspaces/<slug>/analysis.md` exists, read it first — it's the fastest source of already-identified risks, ambiguities, and gaps (see especially the Key Risks and Constraints item).

### 2. Read All Documents

Read every file in `workspaces/<slug>/intake/rfx/` in full, including any addenda. Also read available files in `workspaces/<slug>/intake/client/` and `workspaces/<slug>/intake/supporting/` to enrich context. Pay particular attention to:
- The submission instructions section — the exact channel, named contact, and hard deadline for submitting questions
- Whether Q&A responses (addenda) are distributed to all bidders or only to the asker
- Module/scope inventories, pricing tables, and requirement lists, cross-checked for internal inconsistencies (missing items, mismatched counts, contradictory statements between sections)
- Anything the RFx itself flags as unreliable, non-binding, or "for information only"

### 3. Identify Candidate Questions

Systematically scan for every genuine ambiguity, missing piece of information, internal inconsistency, and risk-worthy clarification. For each candidate question, determine:
- Which topic category it belongs to (group logically — see the illustrative categories in `templates/questions.md`; add, rename, or omit categories based on what this RFx actually raises)
- Whether asking it would reveal the team's specific technical approach, pricing strategy, partnership plans, or differentiators to competitors (relevant if the RFx distributes Q&A responses to all bidders) — flag these with a **Sensitivity** value such as `Sensitive` or `Sensitive-light`
- Any internal-only rationale worth preserving alongside the question (why it matters, what it protects against) — this becomes the question's `> [!NOTE]` callout, never part of the question text itself

Wherever there is any credible basis for it — a compressed timeline, scope/document complexity, an addendum that already pushed other dates, etc. — always include a request for additional time to respond as a candidate question. It costs little to ask and can materially help the pursuit team, so default to including it as the first question in the Procurement Process / Timeline category unless the RFx timeline is genuinely generous.

There is no minimum or maximum question count — be exhaustive. It is the pursuit team's job to triage down, not the model's job to pre-filter.

### 4. Write the Questions Document

If `workspaces/<slug>/questions.md` does not exist, copy `templates/questions.md` to `workspaces/<slug>/questions.md` and populate it in place. If it already exists, read it first and update it in place — add new questions, renumber only where a new question is inserted ahead of existing ones, and correct any content invalidated by newly issued addenda — rather than regenerating the whole file from scratch.

`templates/questions.md` defines the required structure — table of contents, section/question numbering, per-question fields, and the closing summary — and carries inline guidance for each part. Follow it exactly.

### 5. Update Metadata and Confirm

Update the YAML frontmatter (`pursuit`, `issuer`, `submission_deadline` — including the exact channel) from the RFx documents. Confirm these are consistent with `workspaces/<slug>/analysis.md` and `workspaces/<slug>/backlog.md` if they exist — flag any discrepancy to the user.

Present a brief summary: total questions written, category breakdown, and a reminder that this is a working list requiring triage before submission.

## Output

- `workspaces/<slug>/questions.md` — candidate clarification questions, grouped by category, ready for triage
