# AGENTS.md — Master Prompt for the Master's Thesis (branch `master-thesis`)

> **Read order:** this file → `master/0. OVERVIEW.md` → `.pi/context/` as needed.
> - **`master/0. OVERVIEW.md` is the user's document:** milestone-structured, short, checkbox-driven. M1 (Exposé) is detailed; M2–M5 are placeholders until agreed with Prof. Voss. **Keep it lean — do not move reference detail back into it.**
> - **`.pi/context/`** holds the agent-facing detail: decisions (D1…, the living decision record), requirements, evaluation + statistical design, tooling, related work, conventions. Index: `.pi/context/00-index.md`.
> - **Decisions evolve.** `.pi/context/02-decisions.md` is the source of truth for what was decided; `master/0. OVERVIEW.md` is the source of truth for current status. Do not hardcode decision content elsewhere (including this file).
> - At the end of a session: tick the Overview checkboxes, add one log row, update `.pi/context/02-decisions.md` (or the relevant `.pi/context/` file) if a decision changed.
> The Obsidian vault (`~/Documents/Obsidian Vault/Master Arbeit`) is **deprecated** — do not read from or write to it. Everything lives in this repo; **all thesis files live under `master/`**.

---

## 1. Who / what / when

| | |
|---|---|
| Student | **Nassim Awabdy**, Matr. 3196909, Master FB5 (Elektrotechnik & Informationstechnik), FH Aachen |
| Supervisor | **Prof. Dr. rer. nat. Sebastian Voss** — FB5, Lehrgebiet Modellgetriebene Systementwicklung, Verifikation und Testen · s.voss@fh-aachen.de · +49 241 6009 52129 |
| Second examiner | **M. Eng. Tim Höner** — wissenschaftlicher Mitarbeiter, FB5, Lehrgebiet Datennetze / IT-Sicherheit / IT-Forensik · hoener@fh-aachen.de · +49 241 6009 52122 |
| Thesis | *Evaluating AI Agent Capabilities in SysML v2 Modeling via an MCP Bridge to Magic Systems of Systems Architect* |
| Timeline | official start **01.09.2026**, 20 weeks → submission **≈ 19.01.2027** |
| Fixed dates | **Exposé sent to Prof. Voss by 20.09.2026** (formal due 30.09) · **practical work done by 10.12.2026** · submission ≈ 19.01.2027. Further milestones are defined *after* the exposé. Weekly group meetings with Prof. Voss from end Sep / early Oct. |
| Language | **English** (confirmed). Template: `fh-template` (KOMA `scrreprt`, annotated bibliography via `unsrtdineng.bst`) |
| Length | **min. 40 pages** thesis body (confirmed hard requirement) |
| Tooling | FH licence covers **MSoSA only** — **2026x** (access granted by Prof. Voss 13.09.2026; exact build TBD, native SysML v2), VPN-gated licence server; no Teamwork Cloud known. LLMs: **own Anthropic Max subscription** → Claude family only. |
| Prior work | WS seminar paper (grade 1.3): *Mechanisms for Model Consistency — SysML v1 vs v2 guidelines* (`0. Seminar/WS Paper/`), on branch `SysML-modeling-guidelines` |

## 2. Scope (kickoff 07.09.2026)

Decisions evolve — this file gives static context only, not the decision record. **Current decisions live in `.pi/context/02-decisions.md` (D1…); current status, open items and checkboxes live in `master/0. OVERVIEW.md`.** Do not hardcode decision content here — it goes stale.

Kickoff with Prof. Voss fixed the thesis scope: a system under test (an open-source SysML v2 model), a benchmark of tasks with ground truth across ablation arms, an MCP bridge to MSoSA as the interface, fault injection for correction-style tasks, and an evaluator outside the agent loop. Research question + H1–H3 are in `master/pages/101expose.tex`.

**Open questions:** tracked in `master/0. OVERVIEW.md` §"Open with Prof. Voss" — do not duplicate the list here.

## 3. Repository layout

**`master/` is the thesis workspace** — everything belonging to the Master's thesis lives there. Agent context, templates and the old seminar paper sit beside it at the root.

```
base-latex/
├── AGENTS.md                  ← this file (master prompt); CLAUDE.md is a symlink to it
├── Makefile                   ← thin wrapper: forwards all/clean/open/watch to master/
├── .pi/context/               ← agent context: decisions, requirements, eval design, tooling (00-index.md)
├── master/                    ← ★ the Master's thesis
│   ├── 0. OVERVIEW.md         ← user-facing status: milestones + checklists (keep lean!)
│   ├── 000report.tex          ← main file for milestone documents (currently the Exposé)
│   ├── Makefile               ← make | make open | make watch | make clean
│   ├── unsrtdineng.bst        ← bib style (must sit next to 000report.tex)
│   ├── pages/001titlepage.tex
│   ├── pages/101expose.tex    ← Exposé (outline + word budgets in comments)
│   ├── bib/
│   │   ├── quellen.bib         ← bibliography used by 000report.tex
│   │   ├── pool-verified.bib   ← annotated verified entry pool
│   │   ├── mindmap.md          ← working literature mind map (Mermaid)
│   │   └── papers/             ← PDFs of cited sources (named by bib key)
│   ├── todo - sources/        ← source summaries (flat, one .md per source):
│   │   ├── 0. Index.md         ← index + source-type policy
│   │   └── 0.landscape-sep-2026.md
│   ├── pic/                   ← figures (FHAC.jpg logo)
│   └── milestones/            ← exported PDFs (Expose-draft.pdf, …)
├── templates/
│   ├── fh-template/           ← FH Aachen report template (do not edit; copy from it)
│   └── conference-template/   ← IEEEtran template
└── wissenschaftliche seminar/
    ├── WS Paper/              ← previous seminar paper (reference only)
    └── WS Milestones/         ← its exposé / concept PDFs
```

Later additions (planned): `master/models/` (git submodules for Apollo 11 + GfSE), `master/pages/2xx-*.tex` (thesis chapters), and a separate code repo for the MCP bridge.

## 4. How to work in this repo

- **Branch:** `master-thesis`. Commit small with prefixes `feat:` / `fix:` / `docs:`. Do not commit build artefacts (see `.gitignore`); `master/000report.pdf` and `master/milestones/*.pdf` are committed on purpose.
- **Build:** `make` in the repo root (wrapper) or inside `master/` (latexmk, TeX Live 2025 is installed). Check page count with `pdfinfo master/000report.pdf`; extract text with `pdftotext -layout`.
- **Bibliography:** every entry carries a `note = {…}` annotation (topic · method · relevance, 2–3 sentences); the three most important get `[TOP 3]`. **Never invent authors/venues/years** — leave `TODO` and verify from the PDF/DOI. Sources are classified by type: **1 scientific** (primary, carries the argument) · **2 blogs** (adoption/tool facts; claims marked unvalidated) · **3 repos** (artifact state of the art; cite with commit + access date).
- **Exposé rules (official brief):** ½–1 page body — Themendefinition · Relevanz · erste grobe Forschungsfrage/Hypothese · Überlegungen zu Quellenarten — **plus** an annotated literature list of ~15 entries (IEEE style, 2–3 sentences each on topic/method/relevance, 3 most important highlighted). The "max 2 pages" figure from the kickoff conflicts with this — confirm with Prof. Voss.
- **Notes:** there is no `notes/` directory. Status + reference detail live in `master/0. OVERVIEW.md` (§11 appendices); decisions go in `master/decisions-log.md` (dated: what, why, alternatives rejected); source summaries go in `master/todo - sources/` (flat, one file per source, type recorded in `0. Index.md`) and are registered in `master/todo - sources/0. Index.md`; PDFs go in `master/bib/papers/<bibkey>.pdf`; the literature mind map is `master/bib/mindmap.md`.
- **Working process — write while working:** every practical phase (bridge, benchmark, evaluation) is written up into `master/pages/2xx-*.tex` **as soon as it is done**, while the next phase's implementation continues. A phase is not finished until its prose exists. See `master/0. OVERVIEW.md` §2.1 for the page budget.
- **Implementation is vibe-coded** (MCP bridge / MBSE harness, evaluation framework, fault injection, run harness): favour speed, but log design decisions, dead ends and limitations as they happen — that log becomes the Design and Discussion chapters. Capture tool output/errors/screenshots into `pic/` immediately.
- **Web research:** configured search providers may be unavailable; `anysearch`/`duckduckgo` work as explicit fallbacks.
- **Style:** concise, academic English; **English-only terminology** (D17): use cases are Create · Query · Patch · Delete · Verification · Validation, composed scenarios are fault correction / explanation / refactoring. No German use-case terms in any thesis file.

## 5. Session start checklist

1. `git status && git log --oneline -5` on `master-thesis`.
2. Read **`master/0. OVERVIEW.md`** (current milestone + open items), then the relevant `.pi/context/` file.
3. Ask the user what today's goal is if not stated; otherwise proceed.
4. At the end: tick the Overview checkboxes, add a log row, update `.pi/context/` if a decision changed, and commit.

## 6. Next steps

Tracked in **`master/0. OVERVIEW.md`** (current milestone) — single place, do not duplicate here.

## 7. Log

| Date | Event |
|---|---|
| 07.09.2026 | Kickoff with Prof. Voss — decisions above |
| 12.09.2026 | Branch `master-thesis` created; model research (Apollo 11 chosen), MSoSA API facts, exposé outline + bib seed; Obsidian vault retired |
| 12.09.2026 | Repo reorganised: thesis files moved to root, templates → `templates/`, seminar paper → `Seminar/` |
| 13.09.2026 | Prof. Voss granted access to **MSoSA 2026x** → D14; 2024x-specific caveats dropped |
| 19.09.2026 | Repo restructured: all thesis files moved under `master/`; root keeps `AGENTS.md`, `.pi/context/`, a wrapper `Makefile`, `templates/`, `wissenschaftliche seminar/` |
