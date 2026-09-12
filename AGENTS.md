# AGENTS.md — Master Prompt for the Master's Thesis (branch `master-thesis`)

> **Read this first in every session.** It is the single source of truth for context.
> The Obsidian vault (`~/Documents/Obsidian Vault/Master Arbeit`) is **deprecated** — do not read from or write to it. Everything lives in this repo; thesis files are at the repository root.

---

## 1. Who / what / when

| | |
|---|---|
| Student | **Nassim Awabdy**, Matr. 3196909, Master FB5 (Elektrotechnik & Informationstechnik), FH Aachen |
| Supervisor | **Prof. Dr. Sebastian Voss** (MBSE) |
| Second examiner | **Prof. Hüner** |
| Thesis | *Evaluating AI Agent Capabilities in SysML v2 Modeling via an MCP Bridge to Magic Systems of Systems Architect* |
| Timeline | official start **01.09.2026**, 20 weeks → submission **≈ 19.01.2027** |
| Milestones | **M1 Exposé — due 30.09.2026, max 2 pages** · weekly group meetings with Prof. Voss from end Sep / early Oct |
| Language | English. Template: `fh-template` (KOMA `scrreprt`, annotated bibliography via `unsrtdineng.bst`) |
| Prior work | WS seminar paper (grade 1.3): *Mechanisms for Model Consistency — SysML v1 vs v2 guidelines* (`Seminar/WS Paper/`), on branch `SysML-modeling-guidelines` |

## 2. Decisions so far (kickoff 07.09.2026)

1. **Model under test:** Airbus **Apollo 11 SysML v2 model** (`github.com/airbus/apollo-11-sysml-v2`; Helle & Schramm 2026, *Systems Engineering*, DOI 10.1002/sys.70074; ~7 kLOC, ~2 000 elements, 5 CoSMA layers, MPL-2.0). Secondary/generalisation set: **GfSE SysML-v2-Models** (`github.com/GfSE/SysML-v2-Models`, BSD-3).
2. **Use cases to evaluate:** *Abfragen* (query) · *Validierung* (validation) · *Verifizierung* (verification) · *Korrektur* (correction) · *Erstellen* (creation). Optional: *Erklären*, *Refactoring*.
3. **Interface:** an **MCP server bridging LLM agents to Magic Systems of Systems Architect (MSoSA)** — the FH has a licence.
   - Option A: Teamwork Cloud **SysML v2 REST API** (standard, tool-agnostic) — requires a TWC instance.
   - Option B: **MagicDraw OpenAPI Java plugin** (works with desktop licence only).
   - Decision pending the FH licence check (see open questions).
4. **Evaluation design:** benchmark of tasks per use case with ground truth; ablation arms (no tool / thin CRUD bridge / semantic bridge with tool-native validation & evaluation); fault injection for *Korrektur*; evaluator outside the agent loop; 2–3 LLMs.
5. Research question + H1–H3 are in `pages/101expose.tex`.

**Open questions (ask Prof. Voss / FH IT):** MSoSA version (SysML v2 needs 2025x+)? Teamwork Cloud available? LLM API budget? — full list in `notes/03-kickoff-results.md`.

## 3. Repository layout

The repository root **is** the thesis workspace. Templates and the old seminar paper are tucked away in subfolders.

```
base-latex/
├── AGENTS.md                  ← this file (master prompt); CLAUDE.md is a symlink to it
├── 000report.tex              ← main file for milestone documents (M1 = Exposé)
├── Makefile                   ← make | make open | make watch | make clean
├── unsrtdineng.bst            ← bib style (must sit next to 000report.tex)
├── pages/001titlepage.tex
├── pages/101expose.tex        ← Exposé (outline + word budgets in comments)
├── bib/quellen.bib            ← annotated bibliography (entries with TODO need verification)
├── pic/                       ← figures (FHAC.jpg logo)
├── milestones/                ← exported PDFs (Expose-draft.pdf, …)
├── notes/
│   ├── 01-thesis-idea.md          original idea write-up (pre-kickoff; pilot-REST-API framing superseded)
│   ├── 02-kickoff-prep.md         timeline compression, descoping levers
│   ├── 03-kickoff-results.md      decisions + open questions
│   ├── 04-model-candidates.md     model comparison, MSoSA API facts, bridge options, prior art
│   └── literature/                paper summaries; `0. Index.md` is the index; `update-sep-2026-*.md` = landscape
├── templates/
│   ├── fh-template/           ← FH Aachen report template (do not edit; copy from it)
│   └── conference-template/   ← IEEEtran template
└── Seminar/
    ├── WS Paper/              ← previous seminar paper (reference only)
    └── WS Milestones/         ← its exposé / concept PDFs
```

Later additions (planned): `models/` (git submodules for Apollo 11 + GfSE), `pages/2xx-*.tex` (M2 concept / thesis chapters), and a separate code repo for the MCP bridge.

## 4. How to work in this repo

- **Branch:** `master-thesis`. Commit small with prefixes `feat:` / `fix:` / `docs:`. Do not commit build artefacts (see `.gitignore`); `000report.pdf` and `milestones/*.pdf` are committed on purpose.
- **Build:** `make` in the repo root (latexmk, TeX Live 2025 is installed). Check page count with `pdfinfo 000report.pdf`; extract text with `pdftotext -layout`.
- **Bibliography:** every entry carries a `note = {…}` annotation (1–3 sentences on relevance); the three most important get `[TOP 3]`. **Never invent authors/venues/years** — leave `TODO` and verify from the PDF/DOI.
- **Exposé rules:** ≤ 2 pages body text (title page + bibliography excluded). Structure mirrors the WS exposé: Motivation → Problem → RQ & hypotheses → Approach → Evaluation → Work plan.
- **Notes:** keep decisions in `notes/03-kickoff-results.md` / new numbered notes; keep literature summaries in `notes/literature/` and register them in `0. Index.md`.
- **Web research:** configured search providers may be unavailable; `anysearch`/`duckduckgo` work as explicit fallbacks.
- **Style:** concise, academic English; German use-case names (Abfragen, Validierung, …) are kept as terms because Prof. Voss uses them.

## 5. Session start checklist

1. `git status && git log --oneline -5` on `master-thesis`.
2. Skim `notes/03-kickoff-results.md` (open questions) and the *Next steps* below.
3. Ask the user what today's goal is if not stated; otherwise proceed.
4. At the end: update *Next steps* here and commit.

## 6. Next steps (keep current)

- [ ] Draft prose for all `[TODO]` sections in `pages/101expose.tex`; target draft by ~20.09, send to Prof. Voss before 30.09.
- [ ] Verify the 5 `TODO` bib entries (authors, venue) against the PDFs.
- [ ] Clarify FH MSoSA version + Teamwork Cloud availability → decide bridge option A/B.
- [ ] Add Apollo 11 + GfSE as submodules under `models/`; parse with the pilot-implementation jar (GfSE `CI/parse.py`) as ground-truth validity check.
- [ ] Read Helle & Schramm 2026 fully; write summary in `notes/literature/`.
- [ ] Try importing Apollo 11 into MSoSA (Community Edition is limited to 500 elements — full licence needed).

## 7. Log

| Date | Event |
|---|---|
| 07.09.2026 | Kickoff with Prof. Voss — decisions above |
| 12.09.2026 | Branch `master-thesis` created; model research (Apollo 11 chosen), MSoSA API facts, exposé outline + bib seed; Obsidian vault retired |
| 12.09.2026 | Repo reorganised: thesis files moved to root, templates → `templates/`, seminar paper → `Seminar/` |
