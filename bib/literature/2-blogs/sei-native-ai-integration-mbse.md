# SEI/CMU — Native AI Integration for MBSE: Three Layers that Make It Work

**Type:** institutional engineering blog (Carnegie Mellon Software Engineering Institute)
**Source:** https://www.sei.cmu.edu/blog/native-ai-integration-for-model-based-systems-engineering-three-layers-that-make-it-work/
**Bib key:** `sei-native-ai` · **Status:** 🔴 **TOP-3 candidate — closest competing work**

---

## Why a blog post is citable here
The result is a controlled experiment with a reported design, arms, task counts and quantitative outcomes — it functions as a technical report. It is also the *only* published controlled SysML v2 agent-tooling benchmark found to date. Excluding it because of the publication venue would misrepresent the state of the art. This is the central example for the exposé's "non-scientific sources" justification.

## Content
Controlled SysML v2 benchmark with **three experimental arms**:
1. **Baseline** — one-shot generation, no tools
2. **CLI-only** — Syside validation loop
3. **Full tooling** — + MCP knowledge server + skills

- 8 tasks; 40 small + 24 large outputs per arm; **Claude Opus 4.6**
- Iterative validation **eliminates syntax errors**: 25.6 → 0 errors per 100 lines on large tasks
- Curated knowledge raises their pattern measure **71.7 → 94.1**
- Their MCP server is a **knowledge-retrieval service over curated Markdown** — *not* a model-repository or tool interface

## Relevance / how this thesis differs
- **Supports H2:** tool design measurably shifts capability boundaries.
- **Methodological template:** the 3-arm ablation is directly mirrored by this thesis (no tool / thin bridge / semantic bridge).
- **Precedent for single-model evaluation** (they also ran one model) → supports D9 (Claude-only) as a defensible choice.
- **Differentiation:** entirely **file-based** (textual notation + Syside LSP). No industrial modeling tool, no live in-session model state, no tool-native validation/evaluation, no graph traversal. This thesis works against a **live model inside MSoSA**.

## TODO
- [ ] Read in full (currently summarised from the landscape scan)
- [ ] Extract exact task list and scoring rubric for comparison with our task catalogue
- [ ] Verify author names + publication date for the bib entry
