# Literature Update — 06.09.2026 (post-May search)

> New MCP servers and research published/found after the May 2026 deep dive. Sorted by relevance to the thesis.

---

## 🔴 Highly relevant — must engage in related work

### 1. SEI/CMU: "Native AI Integration for MBSE: Three Layers that Make It Work"
**Source:** [sei.cmu.edu blog](https://www.sei.cmu.edu/blog/native-ai-integration-for-model-based-systems-engineering-three-layers-that-make-it-work/)
**The closest competing work found to date.** A controlled SysML v2 benchmark with three experimental arms:
- Baseline (one-shot, no tools) / CLI-only (Syside validation loop) / Full tooling (+ MCP knowledge server + skills)
- 8 tasks, 40 small + 24 large outputs per arm, Claude Opus 4.6
- Results: iterative validation eliminates syntax errors (25.6 → 0 errors/100 lines on large tasks); curated knowledge raises their pattern measure from 71.7 → 94.1
- **Their MCP server is a knowledge-retrieval service (curated Markdown), NOT a model-repository interface**

**Differentiation:** SEI works file-based (textual notation + Syside LSP validation). No live SysML v2 repository, no REST API, no persistent model state across sessions, no graph traversal. Their ablation design (3 arms) is a strong methodological template to cite AND their results *support* the thesis hypothesis (tooling shapes capability boundaries). The evaluation of *interactive agents against a live model repository* remains open.

### 2. arXiv 2608.26199 — Benchmarking AI Agents for Hardware Design Automation via MCP Tool Calling (25.08.2026)
**The closest methodological sibling.** They do for hardware design exactly what the thesis does for MBSE: build an MCP server replicating a stateful design tool, construct a benchmark (single-op edits, multi-step dependency chains, invalid requests, misspelled prompts, multi-server contexts), evaluate 7 models with ablations (tool-description detail, context scope, single- vs multi-agent).
**Key findings to reuse:** comprehensive tool descriptions consistently reduce failures; few-shot prompting can cause severe inaction; cumulative context harms constrained models.
**Differentiation:** different domain (hardware/embedded), local-only models, no semantic graph layer. Validates the thesis method pattern — cite as parallel work in an adjacent domain.

### 3. arXiv 2609.03718 — What Do CAE Simulation Agents Really Need Beyond a Generic Harness? (03.09.2026)
**⚠️ Potential counter-evidence to the semantic-server hypothesis.** Finds that with a modern generic harness, single-agent setups match/beat specialized multi-agent systems; scripted reflection adds nothing; the biggest gain is domain knowledge (tutorials), not specialized machinery.
**Implication:** must be prepared for the outcome "thin wrapper + good model ≈ semantic server". This is exactly why the ablation matters — and either result is publishable. Engage this paper directly in the discussion chapter.

### 4. chouswei/codebase-sysmledgraph — SysML v2 knowledge graph MCP server
**A competitor to the semantic-navigation idea — but file-based.** Indexes SysML v2 *textual files* (via sysml-v2-lsp) into a Kuzu graph DB; MCP tools: `cypher`, `context` (360° symbol view), `impact` (blast radius), `rename`. Publisher/subscriber architecture.
**Differentiation:** builds its graph from parsed text files, not from a live repository via the standard REST API. No commits/branches, no CRUD against a model server, no task-oriented MBSE abstractions (requirement tracing etc.). Confirms the demand for graph-layer navigation — cite it, and position the thesis graph cache as the *API-side* counterpart.

---

## 🟡 New MCP servers — update the server landscape table

| Server | Type | Tools | Status |
|---|---|---|---|
| **daltskin/sysml-v2-lsp** (`sysml-mcp` on npm) | Textual notation / ANTLR4 parser | 7: parse, validate, getSymbols, getDefinition, getReferences, getHierarchy, getModelSummary | Active, MIT, ~162 weekly downloads |
| **elan8/spec42** (`spec42-mcp`) | Rust language server for SysML v2/KerML | Validation, model-summary; CLI + HTTP API + MCP | Active, commercial-grade tooling |
| **sysml2kit** (John Hodge, PyPI, Aug 2026) | Python toolkit: object model, API JSON interchange, validation, verification runner | MCP server with 9 tools + HTTP client for the standard API | Pre-alpha but pip-installable; blog documents SysML v2 tooling landscape as of 08/2026 |
| **chouswei/codebase-sysmledgraph** | Kuzu graph over textual files | cypher, context, impact, rename, indexDbGraph | Active (see above) |
| **JamieD.sysml-v2-support** (VS Code ext.) | VS Code extension with built-in MCP server for Copilot agent mode | n/a | Marketplace |

**Landscape shift:** most new servers are **textual-notation/LSP-based** (parse & validate files). The **REST-API/live-repository** side (flexo-mms, sysmod, redsteve) has NOT gained a semantic layer. → The thesis niche (semantic interface over the *standard repository API* + systematic evaluation) is still open, and the file-based vs. API-based split is now a useful axis for the related-work chapter.

---

## 🟢 Relevant context / methodology

- **arXiv 2608.23653 — Pufibara + Modelica Agent Workflow Benchmark (24.08.2026):** 232-task benchmark (repair/generation/tuning) for physical-system modeling agents; benchmark-owned evaluator *outside* the agent loop; persistent engineering state across revisions. Strong evaluation-design precedent for formal-modeling agents.
- **arXiv 2609.03230 — Benchmarking LLMs for Requirements Quality Assessment (03.09.2026):** 10 models vs INCOSE-based expert ground truth; best model finds only 47% of expert issues; degrades where SE judgment needed. Supports "LLM-as-judge insufficient → expert acceptance criteria" in the eval framework.
- **arXiv 2608.26546 — DuMateBench (27.08.2026):** real-session agent benchmark with environmental perturbations (insufficient/unstable/noisy); hybrid deterministic + LLM-as-judge protocol. General agent-eval background.
- **arXiv 2606.29006 (June 2026):** SysML v2 academic work mentioned in the sysml2kit blog (no runnable tooling published) — check abstract.
- **Note:** the standards status matters for framing — textual syntax + REST API are formal OMG standards since **September 2025** (per sysml2kit blog).

---

## Consequences for the thesis

1. **The gap is still open but closing fast.** SEI ran a controlled SysML v2 tooling benchmark; hardware-design MCP benchmarking exists. Nobody has yet evaluated agents against a **live SysML v2 repository (REST API) with persistent state**. Timeliness cuts both ways: strong motivation, but publish-or-be-scooped pressure.
2. **New positioning axis:** file-based (LSP/textual) vs. API-based (repository) agent interfaces. The thesis sits firmly on the API side; all recent semantic-layer activity is on the file side.
3. **The ablation gains importance:** CAE paper (2609.03718) suggests generic harnesses may suffice — the thin-wrapper vs. semantic-server comparison directly tests whether that transfers to MBSE. Either outcome is a contribution.
4. **Reusable methodology:** SEI's 3-arm design, hardware-MCP's task categories (incl. invalid/misspelled requests), Pufibara's external evaluator, and 2608.26199's tool-description findings should all inform benchmark + server design.
