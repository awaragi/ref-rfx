# Response Engineering Framework (REF) for RFxs

## Framework Purpose

REF-RFX is a specialized Response Engineering Framework designed to transform solicitation requirements into high-quality, compliant, differentiated, and evidence-based responses.

The framework addresses a common challenge in response development: teams often move directly from requirements analysis to drafting. This results in inconsistent positioning, weak differentiators, contradictory responses, and loss of institutional knowledge across pursuits.

REF-RFX introduces a structured decision-making process between requirements and drafting. Rather than immediately writing a response, teams first explore options, evaluate alternatives, document decisions, establish a response strategy, and then generate response content based on those decisions.

The primary objectives of REF-RFX are to:

- Improve response quality and consistency.
- Increase evaluator alignment and scoring potential.
- Capture and reuse institutional knowledge.
- Create traceability between requirements, decisions, and responses.
- Enable repeatable response development across pursuits.
- Reduce pursuit risk through structured decision management.
- Build reusable libraries of evidence, patterns, and differentiators.

REF-RFX treats response development as an engineering discipline rather than a document-writing exercise.

## Framework Approach

### Core Principle

The foundation of REF-RFX is simple:

> Good responses are produced by good decisions.

Most response processes follow:

```text
Requirements
    ↓
Draft Response
```

REF-RFX applies a structured decision layer at the **item level** — each backlog item goes through its own Deliberate and Design cycle before response content is produced. The framework supports two execution paths. The lifecycle steps referenced in the diagrams below are defined in full under Framework Lifecycle.

### Standard Path

Each backlog item is fully cycled through Deliberate, Design, Draft, and Refine independently.

```text
Intake
    ↓
Analyse
    ↓
Catalogue → Evidence Registry
    ↓
Decompose → Backlog Items
    ↓
Strategise → Global Decisions
    ↓
┌──────────────────────────────────────────┐
│  Per Item  (repeated for each item)      │
│                                          │
│  Deliberate ◄────────────────────────┐   │
│      ↓                               │   │
│  (continue until decisions complete) ─┘   │
│      ↓                                   │
│  Design                                  │
│      ↓                                   │
│  Draft                                   │
│      ↓                                   │
│  Refine                                  │
└──────────────────────────────────────────┘
    ↓
Assemble Final Submission
(auto-draft from design; placeholders for unstarted)
    ↓
final-submission.md · final-submission.docx
```

### Big Bang

All backlog items complete their Deliberate and Design cycles first. Refine is not a mandatory separate step. Draft is embedded within Assemble — the Assemble step generates responses for any items that have a design but no response file, then produces the final submission, inserting placeholders for any items with no design.

```text
Intake
    ↓
Analyse
    ↓
Catalogue → Evidence Registry
    ↓
Decompose → Backlog Items
    ↓
Strategise → Global Decisions
    ↓
┌──────────────────────────────────────────┐
│  Per Item                                │
│                                          │
│  Deliberate ◄────────────────────────┐   │
│      ↓                               │   │
│  (continue until decisions complete) ─┘   │
│      ↓                                   │
│  Design                                  │
└──────────────────────────────────────────┘
    ↓
Assemble Final Submission
(auto-draft from design; placeholders for unstarted)
    ↓
final-submission.md · final-submission.docx
```

Big Bang preserves decision quality while consolidating drafting and refinement into a single pursuit-level pass.

### Framework Lifecycle

#### Setup

Set up the `workspace/` folder structure and copy starter files from `templates/`. Run once at the start of every new pursuit.

Setup creates the following if they do not already exist:

```text
workspace/
├── intake/
│   ├── rfx/
│   ├── client/
│   └── supporting/
├── items/
├── backlog.md        ← copied from templates/backlog.md
├── registry.md       ← copied from templates/registry.md
├── evidences.md      ← copied from templates/evidences.md
└── assumptions.md    ← copied from templates/assumptions.md
```

Setup is idempotent — it never overwrites files that already exist.

Output:

- Initialized `workspace/` structure
- Starter files ready to populate

#### Intake

Capture and organize solicitation materials.

**RFx documents** (`workspace/intake/rfx/`):

- RFx documents
- Appendices
- Statements of Work
- Evaluation criteria
- Mandatory requirements
- Submission instructions

**Client background** (`workspace/intake/client/`):

Background materials about the client organization to inform evaluator-centric thinking during Deliberate. Can include previous RFxs, previous responses, winning submissions from prior pursuits, annual reports, strategic plans, org charts, press releases, or any other client-relevant research.

**Supporting documentation** (`workspace/intake/supporting/`):

Corporate assets relevant to the RFx that will support deliberation — proprietary intellectual property, frameworks, methodologies, platforms, capability statements, certifications, accreditations, case studies, past performance references, and reusable delivery accelerators.

Once intake materials are in place, the pursuit is ready for Analyse.

#### Analyse

Read and analyse all RFx documents in full, then produce a structured `workspace/analysis.md` that captures the key intelligence from the solicitation.

Analyse validates that `workspace/intake/rfx/` contains at least one document before proceeding.

Analysis items are written in paragraph form as A-xx entries. Six common baseline items are always required:

```text
A-01 – Procurement Overview
A-02 – Scope Summary
A-03 – Evaluation Framework
A-04 – Mandatory Requirements
A-05 – Submission Requirements
A-06 – Key Risks and Constraints
```

Additional A-xx items are added based on what the specific RFx contains — there is no maximum. Each item is substantive paragraph-form analysis written for strategic decision-making, not a bullet summary.

Output:

- `workspace/analysis.md`

#### Catalogue

Scan all intake folders and catalogue available supporting evidence into `workspace/evidences.md`.

Catalogue reads every file in `workspace/intake/`. For each file it writes one E-XX entry containing a brief summary, evidence type, and a direct reference to the file path, giving the team a searchable registry of available evidence before deliberation begins.

Catalogue validates that at least one intake folder contains files before proceeding.

Output:

- `workspace/evidences.md` — populated evidence registry with one entry per intake file

#### Decompose

Break the solicitation into manageable backlog items.

Typical outputs:

```text
Item 01 – Corporate Qualifications
Item 02 – Delivery Methodology
Item 03 – Team Structure
Item 04 – Architecture
Item 05 – Security
...
```

Each item becomes an independently managed work package.

Output:

- `workspace/backlog.md`

#### Strategise

Set the pursuit-wide strategic foundation before any item-level work begins. Strategise explores the key cross-cutting dimensions of the pursuit and records the global decisions that will govern all subsequent Deliberate, Design, Draft, and Refine steps.

Sample dimensions to work through:

- **Win theme** — the single overarching message the evaluator should be left with
- **Competitive positioning** — how to frame against likely competition
- **Delivery model** — onshore, offshore, nearshore, or hybrid staffing posture
- **Technology environment** — which platforms, tools, or tech stack to lead with
- **Alliances and partnerships** — teaming arrangements, JVs, named subcontractors
- **Response format and medium** — document only, oral presentation, or both
- **Pricing posture** — competitive, value-based, or cost-optimization focus
- **Risk posture** — performance guarantees, risk-sharing, or mitigation commitments

Output:

- `workspace/registry.md` (Global Decisions section, G-XX entries)

#### Deliberate *(per backlog item)*

Explore options and record decisions for each backlog item. Deliberate loops — examining one angle, committing a decision, then re-entering to investigate the next — until the user is satisfied that all material decisions for the item are captured and complete.

Key activities:

- Analyze evaluator intent for the item
- Identify buying signals
- Evaluate positioning options
- Consider differentiators
- Define Quantifiable Value Adds (QVAs)
- Assess risks
- Select evidence strategies
- Record decisions at global and item levels

AI assistance is applicable throughout Deliberate. Based on the item requirements, the Global Decision Registry, previously made item decisions, and best industry practices, AI can propose:

- Positioning options and recommended approach
- Differentiators aligned with the pursuit's win themes
- QVA candidates with supporting rationale
- Risk flags and mitigation strategies
- Evidence and pattern recommendations from prior pursuits

Proposed recommendations are reviewed and refined by the user before decisions are recorded.

**Global decisions** are typically established early to anchor all item-level work, but can be introduced or revised at any point during the pursuit. When a new or updated global decision is added, it should be reapplied to any previously completed items to ensure consistency across the full response.

Examples:

```text
G-01 – Lead with cloud-native modernization positioning
G-02 – Differentiate on integrated delivery model
G-03 – Zero trust as the cross-cutting security posture
```

**Item decisions** are scoped to a specific backlog item and made as each item is deliberated.

Examples:

```text
D04-01 – Cloud-first architecture
D05-03 – Zero trust security positioning
D07-02 – Progressive transition model
```

All decisions become authoritative guidance for all subsequent drafting activities.

Output:

- `workspace/registry.md` (global decisions)
- `workspace/items/item-XX-decisions.md` (per-item decisions)

#### Design *(per backlog item)*

Convert each item's decisions into a response blueprint.

Key activities:

- Define narrative for the item
- Establish structure
- Select evidence
- Create differentiators
- Define QVAs
- Map requirements to response sections

Output:

- `workspace/items/item-XX-design.md`

#### Draft *(Standard Path only)*

Generate the draft response content for each backlog item.

In the **Big Bang** path, this step is not a standalone activity — item responses are generated by Assemble Stage 1 for any items that have a design but no response file.

In the **Standard Path**, each item is drafted individually as its Deliberate/Design cycle completes. Response authors work from:

- Backlog item
- Global Decision Registry
- Item Decision Registry (`workspace/items/item-XX-decisions.md`)
- Design document (`workspace/items/item-XX-design.md`)
- Evidence Registry

Response files contain only the response body. All metadata is stored in the YAML frontmatter, including item reference, linked decisions, evidence citations, QVAs, word count target, and submission section mapping. Example:

```yaml
---
item: "01"
title: "Corporate Qualifications"
status: draft
decisions: [D01-01, D01-02]
evidence: [E-15, E-22]
qvas:
  - "20% faster onboarding through structured knowledge transfer"
word_count_target: 800
section_reference: "Section 4.2"
---
```

Output:

- `workspace/items/item-XX-response.md`

#### Refine *(per backlog item)*

Review and finalize each item's response. Refine absorbs the full review loop — choose between automated AI critique across 8 dimensions (compliance, decision alignment, design alignment, evidence coverage, QVA completeness, evaluator alignment, cross-item consistency, suggested edits) or manual feedback. Apply changes and iterate until sign-off. Item status stays `Drafted` throughout and transitions to `Approved` on sign-off.

In the **Big Bang** path, Refine is not a mandatory separate step — teams refine directly on the generated final submission. However, Refine can be applied to individual items at any point, followed by a re-Assemble to incorporate updates.

Output:

- `workspace/items/item-XX-response.md` (approved)

#### Assemble *(full pursuit)*

Produce the final submission through three sequential stages.

**Stage 1 — Auto-generate missing item responses**

For every item in `workspace/backlog.md` that has a design document (`workspace/items/item-XX-design.md`) but no response file yet, the Draft skill logic is applied to generate `workspace/items/item-XX-response.md`. Items that already have a response are left untouched.

**Stage 2 — Assemble `workspace/final-submission.md`**

All item response files are concatenated in backlog order into `workspace/final-submission.md`. YAML frontmatter is stripped from each file before inclusion. Items that have no response and no design receive a labelled placeholder:

```text
[RESPONSE PENDING: Item 01 – Corporate Qualifications]
```

**Stage 3 — Convert to `workspace/final-submission.docx`**

`workspace/final-submission.md` is converted to Word. All `[PLACEHOLDER TEXT]` spans are highlighted in yellow. Standard built-in Word styles are used throughout so the document can be copied directly into any corporate RFx template without reformatting.

Assemble is safe to run at any point in the pursuit. In the **Standard Path** it can be run incrementally at any stage to produce a draft submission reflecting work done so far. In the **Big Bang** path, Assemble is the terminal step — Draft runs embedded within it, and Refine is not a mandatory separate step. Teams work through Deliberate and Design for each item, then run Assemble once to produce the complete response and refine directly on the generated documents. Refine can still be applied to individual items at any point, with Assemble re-run to incorporate the refined responses into an updated submission.

Output:

- `workspace/items/item-XX-response.md` (any newly generated item responses)
- `workspace/final-submission.md`
- `workspace/final-submission.docx`

## AI Integration

REF-RFX is designed to be driven by AI agents. Each lifecycle step is implemented as a discrete **skill** — a self-contained instruction set that an AI agent executes when invoked.

### Skill Model

Each lifecycle step maps to a skill file in `skills/`:

| Lifecycle Step | Skill file | Command |
|---|---|---|
| Setup | `skills/setup.md` | `/setup` |
| Intake | — | — |
| Analyse | `skills/analyse.md` | `/analyse` |
| Catalogue | `skills/catalogue.md` | `/catalogue` |
| Decompose | `skills/decompose.md` | `/decompose` |
| Strategise | `skills/strategise.md` | `/strategise` |
| Deliberate | `skills/deliberate.md` | `/deliberate` |
| Design | `skills/design.md` | `/design` |
| Draft | `skills/draft.md` | `/draft` |
| Refine | `skills/refine.md` | `/refine` |
| Assemble | `skills/assemble.md` | `/assemble` |

Skills are backlog-aware. Each skill reads `backlog.md` at invocation to identify the current active item. Passing an explicit item number (e.g., `/deliberate item-03`) overrides this.

### AI Modes

REF-RFX supports two AI execution modes.

#### File-Based AI Agents

Claude Code, Cursor, and GitHub Copilot can access the repository filesystem directly. These agents read and write files as part of the workflow — decisions, designs, and responses are persisted to disk automatically across sessions. The AI picks up where it left off by reading the backlog and working files at the start of each session.

Each tool reads from its own skills folder, synced from the canonical `skills/` via `scripts/sync-skills.sh`:

| Tool | Skills path | Entry point |
|---|---|---|
| Claude Code | `.claude/skills/` | `CLAUDE.md` |
| Cursor | `.cursor/skills/` | (reads `.cursor/skills/` directly) |
| GitHub Copilot | `.github/skills/` | `AGENTS.md` |

#### Stateless AI Chat

Claude.ai, ChatGPT, GitHub Copilot Chat, and similar web interfaces have no filesystem access. State must be carried manually via file attachments between turns.

Drop `AI-CHAT.md` into any chat window to activate the agent operating contract. Then attach the files relevant to your current task:

- `INSTRUCTIONS.md` — always include
- `backlog.md` — always include
- `registry.md` — always include
- `skills/[step].md` — the skill for the current step
- Working files for the active item (`outputs/item-XX-decisions.md`, etc.)

The `AI-CHAT.md` contract governs how the AI interacts: it prompts for any missing files and outputs all file changes as copy-paste-ready blocks with explicit instructions on where to apply them.

## Repository Structure

The repository is designed as a downloadable starter kit. Teams clone or download a zip, run `/setup` to scaffold the workspace, populate `workspace/intake/` with their RFx materials, and work through the framework step by step using the skills.

```text
ref-rfx/
│
├── README.md
├── INSTRUCTIONS.md              ← cross-cutting rules (voice, evidence, file conventions)
├── CLAUDE.md                    ← Claude Code agent entry point
├── AGENTS.md                    ← GitHub Copilot agent entry point
├── AI-CHAT.md                   ← stateless chat AI operating contract
│
├── skills/                      ← canonical skill definitions (one per lifecycle step)
│   ├── analyse.md
│   ├── catalogue.md
│   ├── decompose.md
│   ├── deliberate.md
│   ├── design.md
│   ├── draft.md
│   ├── refine.md
│   └── assemble.md
│
├── .claude/
│   └── skills/                  ← Claude Code slash commands (synced from skills/)
├── .cursor/
│   └── skills/                  ← Cursor skills (synced from skills/)
├── .github/
│   └── skills/                  ← GitHub Copilot skills (synced from skills/)
││
├── workspace/                   ← all pursuit working files and outputs
│   ├── intake/
│   │   ├── rfx/                 ← RFx documents, appendices, SOW, evaluation criteria
│   │   ├── client/              ← client background, previous RFxs/responses, research
│   │   └── supporting/          ← corporate IPs, frameworks, platforms, capabilities, certifications
│   ├── backlog.md               ← full pursuit backlog
│   ├── analysis.md              ← RFx analysis (produced by /analyse)
│   ├── registry.md              ← global decision registry
│   ├── evidences.md             ← evidence registry
│   ├── assumptions.md           ← assumptions registry
│   ├── final-submission.md      ← assembled final response
│   ├── final-submission.docx    ← Word document for submission
│   └── items/                   ← per-item working artifacts (sorted by item number)
│       ├── item-01-decisions.md ← item decisions
│       ├── item-01-design.md    ← item design/blueprint
│       ├── item-01-response.md  ← item response (body + frontmatter)
│       ├── item-02-decisions.md
│       ├── item-02-design.md
│       ├── item-02-response.md
│       └── ...
│
└── templates/
    ├── backlog.md               ← backlog template
    ├── analysis.md              ← RFx analysis template
    ├── registry.md              ← global decision registry template (includes guiding principles)
    ├── evidences.md             ← evidence registry template
    ├── assumptions.md           ← assumptions registry template
    ├── item-decisions.md        ← per-item decisions template
    ├── item-design.md           ← per-item design template
    └── item-response.md         ← per-item response template (body + frontmatter)
```

## RFx-Specific Features

REF-RFX contains practices specifically optimized for competitive procurement responses.

### Evaluator-Centric Thinking

Responses are designed around evaluator buying signals rather than supplier capabilities alone.

Questions addressed include:

- What is the evaluator actually buying?
- What risks are they trying to avoid?
- What proof do they need to see?
- What would earn full scoring?

### Quantifiable Value Add (QVA) Strategy

REF-RFX encourages identification of measurable value commitments that exceed mandatory requirements.

Examples:

- Operational readiness measures
- Service-level improvements
- Automation outcomes
- Knowledge transfer commitments
- Performance commitments

QVAs provide additional evaluator value and differentiation.

### Decision Registry

The Decision Registry is a core REF-RFX artifact operating at two levels.

**Global Decisions** capture pursuit-wide choices that apply across all items:

- Overall win theme and positioning
- Firm-level differentiators
- Cross-cutting architectural or delivery approaches
- Pursuit-level risk and assumption positions

Global decisions are not restricted to the start of a pursuit. They can be introduced or revised at any time as the team's understanding of the opportunity evolves. When a global decision is added or changed, it triggers a reapplication pass across all previously completed items to ensure the full response remains consistent.

**Item Decisions** are scoped to a specific backlog item and stored as individual files in the `outputs/` folder (`outputs/item-XX-decisions.md`), keeping all item-level outputs together and naturally sorted by item number:

- Item narrative and positioning
- Item-specific differentiators and QVAs
- Evidence selections
- Structural and formatting choices

The registry provides:

- Traceability
- Consistency
- Reusability
- Governance

Decisions at both levels become organizational intellectual property that can be reused across future pursuits.

### Evidence Registry

REF-RFX distinguishes between:

- Claims
- Evidence
- Differentiators

The framework encourages every significant claim to be supported by one or more evidence sources. All evidence is captured in a single `evidence.md` registry, making it easy to search, reuse, and reference across items.

Typical evidence types:

- Project experience and past performance
- Delivery assets and accelerators
- Proprietary frameworks and platforms
- Certifications and accreditations
- Metrics and outcomes
- Client references

During Design, response authors select the most relevant evidence items from the registry and map them to specific response sections.

### Assumption Registry

Assumptions that underpin response content are captured in a single `assumptions.md` registry.

Assumptions may be:

- Scope assumptions (what is and is not included)
- Delivery assumptions (staffing, timeline, environment)
- Client assumptions (access, decisions, dependencies)
- Technical assumptions (existing infrastructure, integrations)

The registry ensures assumptions are visible, traceable, and consistently applied across all items. Unvalidated assumptions are flagged during Refine.

### Word Document Generation

`final-submission.docx` is generated from `final-submission.md`.

**Placeholder highlighting**

Any text matching the placeholder convention `[PLACEHOLDER TEXT]` is automatically highlighted in yellow in the generated Word document, making unfilled placeholders immediately visible for review before submission.

Example placeholders:

```text
[CLIENT AGENCY NAME]
[CONTRACT NUMBER]
[SUBMISSION DATE]
[OFFEROR LEGAL NAME]
[POINT OF CONTACT]
```

**Standard Word styles**

All content uses standard built-in Word style names. This means the document can be copied directly into any corporate RFx template and the content will adopt the template's styles automatically without manual reformatting.

| Markdown element | Word style    |
|------------------|---------------|
| `# Heading`      | Heading 1     |
| `## Heading`     | Heading 2     |
| `### Heading`    | Heading 3     |
| Body text        | Normal        |
| Bullet list      | List Bullet   |
| Numbered list    | List Number   |
| Table            | Table Grid    |
| Bold inline      | Strong        |
| Code / verbatim  | Verbatim Char |

## Family Frameworks

REF-RFX is intended to be part of a broader family of Response Engineering Frameworks.

Each framework shares the same core lifecycle:

```text
Intake
↓
Analyse
↓
Catalogue
↓
Decompose
↓
Strategise
↓
Deliberate
↓
Design
↓
Draft
↓
Refine
↓
Assemble
```

but specializes for a specific document type or business outcome.

This document describes REF-RFX in full. The sibling frameworks below share the same lifecycle.

### REF-SOW

**Purpose**

Statement of Work development and negotiation.

**Primary Outputs**

- Statements of Work
- Service definitions
- Scope documentation
- Assumptions and dependencies
- Delivery commitments

### REF-EA

**Purpose**

Architecture and technology decision documentation.

**Primary Outputs**

- Architecture recommendations
- Solution designs
- ADRs
- Technology assessments
- Modernization strategies

### REF-Strategy

**Purpose**

Strategic business and transformation recommendations.

**Primary Outputs**

- Business cases
- Transformation roadmaps
- Operating models
- Strategic assessments
- Executive recommendations

### REF-Procurement

**Purpose**

Procurement planning and sourcing strategies.

**Primary Outputs**

- Procurement strategies
- Evaluation frameworks
- Market assessments
- Vendor selection approaches

## Guiding Philosophy

REF-RFX is built on a simple belief:

> Strong responses are not written.
>
> Strong responses are engineered.

By systematically exploring options, documenting decisions, designing response strategies, and validating outcomes, organizations can produce higher-quality, more consistent, and more reusable responses while continuously building institutional knowledge for future pursuits.
