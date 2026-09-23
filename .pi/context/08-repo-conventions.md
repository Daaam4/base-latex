# Repo layout & conventions

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Repo & workflow

```
base-latex/                    ← repo root — work ONLY on branch master-thesis
├── AGENTS.md                  ← master prompt / context (CLAUDE.md is a symlink to it)
├── Makefile                   ← thin wrapper → forwards all targets to master/
├── .pi/
│   ├── context/               ← THIS FILE lives here — agent context (pi + Claude Code)
│   └── skills/                ← agent skills (single source; e.g. qualify-paper)
├── .claude/skills/            ← symlinks into .pi/skills/ so Claude Code sees the same skills
├── master/                    ← the Master's thesis workspace (everything thesis-related)
│   ├── 0. OVERVIEW.md         ← status dashboard, keep current
│   ├── 000report.tex          ← main file for milestone documents (currently the Exposé)
│   ├── Makefile               ← make | make open | make watch | make clean
│   ├── unsrtdineng.bst        ← bib style (must sit next to 000report.tex)
│   ├── pages/001titlepage.tex
│   ├── pages/101expose.tex    ← Exposé (sent)
│   ├── bib/
│   │   ├── quellen.bib         ← bibliography used by 000report.tex
│   │   ├── mindmap.md          ← working literature mind map (Mermaid)
│   │   ├── summaries/          ← <bibkey>-summary.md for Type 1 (scientific) sources
│   │   └── papers/             ← PDFs of cited sources, named by bib key
│   ├── todo - sources/        ← index + summaries of Type 2/3 sources (blogs, repos) and unqualified candidates
│   │   ├── 0. Index.md         ← index + source-type policy
│   │   └── 0.landscape-sep-2026.md
│   ├── pic/                   ← figures (FHAC.jpg)
│   └── milestones/            ← exported milestone PDFs (Expose.pdf, …)
├── templates/                 ← fh-template (do not edit; copy from it), conference-template
└── wissenschaftliche seminar/ ← previous seminar paper + its milestones (reference only)
```
*Planned:* `master/models/` (Apollo 11 + GfSE submodules), `master/pages/2xx-*.tex` (thesis chapters), separate repo for the MCP bridge.

**Conventions**
- **Branch:** all work happens on `master-thesis` — no feature branches, no other branches. `main` is only the bare LaTeX template.
- Commit small, prefixes `feat:` / `fix:` / `docs:`. `master/000report.pdf` and `master/milestones/*.pdf` are committed on purpose; other build artefacts are ignored.
- Build: `make` from the repo root (wrapper) or from `master/` directly (latexmk, TeX Live 2025). Page count: `pdfinfo master/000report.pdf`. Text: `pdftotext -layout`.
- Bibliography: every entry has a `note = {…}` annotation (1–2 sentences: topic · method · relevance); top three get `[TOP 3]`. **Never invent authors/venues/years** — leave `TODO` and verify from PDF/DOI.
- Style: concise academic English; **English-only terminology** (D17).
- Web research: configured search providers may be down; `anysearch` / `duckduckgo` work as explicit fallbacks.

**Session start checklist**
1. `git status && git log --oneline -5` on `master-thesis`
2. Read `master/0. OVERVIEW.md` (current milestone + open items), then the relevant `.pi/context/` file
3. Do the work; then tick the Overview checkboxes, add a log row, update `.pi/context/` if a decision changed, and commit

---
