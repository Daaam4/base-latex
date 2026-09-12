# AGENT.md — Master's Thesis Workspace (branch `master-thesis`)

> Persistent context for the AI assistant. This folder replaces the Obsidian vault as the working location.
> Update when decisions change.

## Student / supervision
- **Nassim Awabdy**, Master FB5, FH Aachen. Supervisor **Prof. Dr. Sebastian Voss** (MBSE). Second examiner **Prof. Hüner**.
- Official start 01.09.2026, 20 weeks → submission **≈19.01.2027**. Weekly group meeting from end Sep/early Oct.
- Language: English (as the WS seminar paper). Template: `fh-template` (scrreprt, `unsrtdineng` annotated bib).

## Topic (settled at kickoff 07.09.2026 — see `notes/03-kickoff-results.md`)
**Evaluating AI agent capabilities in SysML v2 modeling via an MCP bridge to Magic Systems of Systems Architect (MSoSA).**
- **Model under test:** Airbus **Apollo 11** SysML v2 model (`airbus/apollo-11-sysml-v2`, Helle & Schramm 2026). Secondary: **GfSE SysML-v2-Models**. Details: `notes/04-model-candidates.md`.
- **Use cases:** Abfragen · Validierung · Verifizierung · Korrektur · Erstellen (+ optional Erklären/Refactoring).
- **Bridge:** MCP server → MSoSA. Option A = Teamwork Cloud SysML v2 REST API; Option B = MagicDraw OpenAPI Java plugin. Decision pending FH licence check.
- **Evaluation:** ablation arms (no tool / thin bridge / semantic bridge), task benchmark with ground truth, fault injection, external evaluator.

## Layout
| Path | Purpose |
|---|---|
| `000report.tex` | main document for milestones (M1 = Exposé). `make` / `make open` / `make watch` |
| `pages/001titlepage.tex` | title page |
| `pages/101expose.tex` | **Exposé (M1, due 30.09.2026, max 2 pages)** — outline with word budgets in comments |
| `bib/quellen.bib` | annotated bibliography; entries marked `TODO` need metadata verification |
| `milestones/` | exported PDFs per milestone |
| `notes/01-thesis-idea.md` | original full idea write-up (pre-kickoff; REST-API-pilot framing is superseded by MSoSA) |
| `notes/02-kickoff-prep.md` | kickoff preparation (timeline, descoping levers) |
| `notes/03-kickoff-results.md` | decisions + open questions |
| `notes/04-model-candidates.md` | model comparison, MSoSA API facts, bridge options, prior art |
| `notes/literature/` | paper summaries + Sep-2026 landscape update (`0. Index.md` is the index) |

## Working conventions
- Commit small, message prefix `feat:`/`fix:`/`docs:` as in earlier branches.
- Never invent bibliographic metadata; leave `TODO` and verify against the PDF/DOI.
- Keep the exposé ≤ 2 pages of body text (check with `pdfinfo`/`pdftotext`).

## Immediate next steps
- [ ] Fill exposé sections (Motivation, Problem, Approach prose, Evaluation) → draft by ~20.09, send to Prof. Voss before 30.09.
- [ ] Verify the 5 `TODO` bib entries (authors/venues) from the PDFs.
- [ ] Clarify FH MSoSA version + Teamwork Cloud availability (decides bridge option A/B).
- [ ] Add models as submodules under `MA Thesis/models/`, parse with pilot-impl jar.
- [ ] Read Helle & Schramm 2026 in full.
