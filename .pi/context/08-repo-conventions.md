# Repo layout & conventions

> Agent context for the Master's thesis. Human-facing status lives in `0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Repo & workflow

```
base-latex/                    ← repo root IS the thesis workspace (branch: master-thesis)
├── 0. OVERVIEW.md             ← THIS FILE — status dashboard, keep current
├── AGENTS.md                  ← master prompt / context (CLAUDE.md is a symlink)
├── 000report.tex              ← main file for milestone documents (currently the Exposé)
├── Makefile                   ← make | make open | make watch | make clean
├── unsrtdineng.bst            ← bib style (must sit next to 000report.tex)
├── pages/001titlepage.tex
├── pages/101expose.tex        ← Exposé (outline + word budgets in comments)
├── bib/
│   ├── quellen.bib             ← annotated bibliography (entries with TODO need verification)
│   └── literature/             ← source summaries, sorted by type:
│       ├── 0. Index.md         ← index + source-type policy (feeds the exposé's "Quellenarten")
│       ├── 1-scientific/       ← papers, preprints, standards
│       ├── 2-blogs/            ← institutional / vendor / practitioner posts
│       ├── 3-repos/            ← open-source repos, packages, tooling
│       └── landscape-sep-2026.md
├── pic/                       ← figures (FHAC.jpg)
├── milestones/                ← exported PDFs (Expose-draft.pdf, …)
├── 0. Templates/              ← fh-template (do not edit; copy from it), conference-template
└── 0. Seminar/                ← previous seminar paper + its milestones (reference only)
```
*Planned:* `models/` (Apollo 11 + GfSE submodules), `pages/2xx-*.tex` (thesis chapters), separate repo for the MCP bridge.

**Conventions**
- Commit small, prefixes `feat:` / `fix:` / `docs:`. `000report.pdf` and `milestones/*.pdf` are committed on purpose; other build artefacts are ignored.
- Build: `make` (latexmk, TeX Live 2025). Page count: `pdfinfo 000report.pdf`. Text: `pdftotext -layout`.
- Bibliography: every entry has a `note = {…}` annotation (1–3 sentences on relevance); top three get `[TOP 3]`. **Never invent authors/venues/years** — leave `TODO` and verify from PDF/DOI.
- Exposé: ≤ 2 pages body (title page + bibliography excluded). Structure: Motivation → Problem → RQ & hypotheses → Approach → Evaluation → Work plan.
- Style: concise academic English; German use-case names kept as terms.
- Web research: configured search providers may be down; `anysearch` / `duckduckgo` work as explicit fallbacks.

**Session start checklist**
1. `git status && git log --oneline -5` on `master-thesis`
2. Read this file (§5 blockers, §6 task board)
3. Do the work; then update §6 / §12 and commit

---
