# SEI/CMU — Native AI Integration for MBSE: Three Layers that Make It Work

**Type:** institutional engineering blog (Carnegie Mellon Software Engineering Institute)
**Source:** https://www.sei.cmu.edu/blog/native-ai-integration-for-model-based-systems-engineering-three-layers-that-make-it-work/
**Author:** Colin Dempsey · **Published:** 2 September 2026 (verified from page metadata, `sei_author`/`sei_date_published`)
**Bib key:** `sei-native-ai` · **Status:** 🔴 **[TOP 3] — closest evaluated work (full text read 19.09.2026)**

## Why a blog post is citable here
The result is a controlled experiment with a reported design, arms, task counts and quantitative outcomes — it functions as a technical report. It is also the *only* published controlled SysML v2 agent-tooling benchmark found to date. Excluding it because of the publication venue would misrepresent the state of the art. This is the central example for the exposé's "non-scientific sources" justification.

## Architecture (three layers)
1. **AI coding assistant** — model/vendor-agnostic; implementation uses VS Code + Claude Code / OpenAI Codex / Continue, all against the same repo and tools.
2. **Language-aware modeling toolchain** — Sensmetry's **Syside** (SysML v2 language server) for interactive LSP support *and* a noninteractive `syside check` CLI that assistants and CI both call. Syside is the sole authority for syntax/semantic diagnostics; the assistant only reacts to its output.
3. **Knowledge and workflow layer** — a version-controlled Markdown knowledge base (language rules, patterns, examples) exposed through a **repository-local MCP server** with stable topic-based retrieval tools — explicitly *not* an LLM or a knowledge graph, just curated-document retrieval — plus 10 file-based **skill** definitions (`knowledge-primer-sysml`, `model-sysml`, `fix-sysml`, `review-sysml`, `analyze-sysml`, `explain-sysml`, `reverse-engineer-sysml`, `views-sysml`, `codegen-sysml`, `docgen-sysml`) that encode retrieve→edit→check workflows.

## Experiment
**Three arms, same 8 tasks, two scales, one model (Claude Opus 4.6):**

| Arm | Mechanism |
|---|---|
| Baseline | single-pass generation, no tools |
| CLI-only | generation + `syside check` feedback loop, no knowledge/skills |
| Full tooling | + MCP knowledge server + skills, same validation loop |

**Results (n=40 small-task outputs, n=24 large-task outputs per arm):**
- Baseline: 3.7 errors/100 lines (small), 25.6 (large).
- CLI-only and full tooling: **0 errors/warnings at both scales** — validation loop eliminates syntax errors entirely.
- Project-defined "pattern measure" (29 measures: structure/richness/connectivity, traceability/patterns/organization, task-specific acceptance), 0–100: baseline 78.3, CLI-only **71.7** (slightly *worse* than baseline — validation alone doesn't help modeling quality), full tooling **94.1** on large tasks. Curated knowledge/skills, not the validator, drive the quality gain.
- Token cost scales sharply with tooling: ~59K (baseline) → 106K (CLI-only) → 143K (full tooling) on large tasks.

**Worked example (4-drone aerial survey swarm, full-tooling arm):** 8 coordinated files, 3186 lines, 0 validator errors after 2 iterations, 97.2/100 pattern score — but manual review found the model's separation distances (30 m/10 m) and lost-link timing (3 s + 60 s loiter) **do not match the prompt** (50 m/20 m, 30 s), several requested components are missing, analysis/verification blocks are structurally present but **not executable/evaluated** (no bound calculation results, no verdict expressions). This is the paper's own strongest quote for the "syntactic validity ≠ semantic/engineering correctness" argument: *"A clean validation run therefore shows only that the model passes the tool's syntax and semantic checks."*

## Relevance / how this thesis differs
- **Supports H2** directly: tool design (validation alone vs. validation + curated knowledge) measurably shifts capability boundaries, with a clean separation of *which* layer buys *which* gain (syntax vs. modeling-pattern quality) — this is close to the exact ablation logic in `04-evaluation-design.md`.
- **Direct methodological template**: the thesis's 3-arm design (no tool / thin bridge / semantic bridge) mirrors this paper's arms one-to-one.
- **Precedent for single-model evaluation** (Claude Opus 4.6 only) → supports D9 (Claude-only) as a defensible, precedented choice; also precedent for stating it as a threat to validity.
- **The 4-drone worked example is a ready-made illustration** for this thesis's "collateral damage" / "silent semantic drift" failure category — a model that validates cleanly while silently deviating from the stated requirement.
- **Differentiation, confirmed by full text:** entirely file-based (textual notation + Syside LSP/CLI, version-controlled Markdown + MCP-served retrieval). No industrial modeling tool, no live in-session model state in a running MBSE server, no tool-native validation/evaluation beyond a language-server check, no graph traversal. This thesis works against a **live model inside MSoSA**, and its MCP server is a retrieval-only service, not a model-editing/model-repository interface — sharpens the "thin CRUD bridge vs. semantic bridge with tool-native validation" distinction this thesis tests.

## Status
Full text read 19.09.2026. Bib entry (`pool-verified.bib`) corrected: proper author (Colin Dempsey, not the institution) and exact publication date (2 Sept 2026), note rewritten with verified detail (was previously summarised only from a landscape scan). Not yet promoted into `quellen.bib` (live bibliography) — same open item as Apollo 11 and Bazzal.
