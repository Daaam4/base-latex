# Repo layout & conventions

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Repo & workflow

```
base-latex/                    ← repo root (branch: master-thesis)
├── AGENTS.md                  ← master prompt / context (CLAUDE.md is a symlink)
├── Makefile                   ← thin wrapper → forwards all targets to master/
├── .pi/context/               ← THIS FILE lives here — agent context
├── master/                    ← the Master's thesis workspace (everything thesis-related)
│   ├── 0. OVERVIEW.md         ← status dashboard, keep current
│   ├── 000report.tex          ← main file for milestone documents (currently the Exposé)
│   ├── Makefile               ← make | make open | make watch | make clean
│   ├── unsrtdineng.bst        ← bib style (must sit next to 000report.tex)
│   ├── pages/001titlepage.tex
│   ├── pages/101expose.tex    ← Exposé (outline + word budgets in comments)
│   ├── bib/
│   │   ├── quellen.bib         ← bibliography used by 000report.tex
│   │   ├── pool-verified.bib   ← annotated verified entry pool
│   │   └── literature/         ← source summaries, sorted by type:
│   │       ├── 0. Index.md     ← index + source-type policy (feeds the exposé's "Quellenarten")
│   │       ├── 1-scientific/   ← papers, preprints, standards
│   │       ├── 2-blogs/        ← institutional / vendor / practitioner posts
│   │       ├── 3-repos/        ← open-source repos, packages, tooling
│   │       └── landscape-sep-2026.md
│   ├── pic/                   ← figures (FHAC.jpg)
│   └── milestones/            ← exported PDFs (Expose-draft.pdf, …)
├── templates/                 ← fh-template (do not edit; copy from it), conference-template
└── wissenschaftliche seminar/ ← previous seminar paper + its milestones (reference only)
```
*Planned:* `master/models/` (Apollo 11 + GfSE submodules), `master/pages/2xx-*.tex` (thesis chapters), separate repo for the MCP bridge.

**Conventions**
- Commit small, prefixes `feat:` / `fix:` / `docs:`. `master/000report.pdf` and `master/milestones/*.pdf` are committed on purpose; other build artefacts are ignored.
- Build: `make` from the repo root (wrapper) or from `master/` directly (latexmk, TeX Live 2025). Page count: `pdfinfo master/000report.pdf`. Text: `pdftotext -layout`.
- Bibliography: every entry has a `note = {…}` annotation (1–3 sentences on relevance); top three get `[TOP 3]`. **Never invent authors/venues/years** — leave `TODO` and verify from PDF/DOI.
- Exposé: ≤ 2 pages body (title page + bibliography excluded). Structure: Motivation → Problem → RQ & hypotheses → Approach → Evaluation → Work plan.
- Style: concise academic English; German use-case names kept as terms.
- Web research: configured search providers may be down; `anysearch` / `duckduckgo` work as explicit fallbacks.

**Session start checklist**
1. `git status && git log --oneline -5` on `master-thesis`
2. Read this file (§5 blockers, §6 task board)
3. Do the work; then update §6 / §12 and commit

---
