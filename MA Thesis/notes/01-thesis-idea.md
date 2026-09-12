**Track:** 🔨 Explorative / Implementation (PoC + Evaluation)
**Topics:** Topic 2 (AI-Assisted Modeling) + Topic 3 (Interoperability / REST API)

---

### Research Aim

Systematically evaluate what AI agents can and cannot reliably do when given structured, persistent access to a live SysML v2 modeling environment — and identify the task types, failure modes, and tool design decisions that determine the boundaries of effective AI assistance in MBSE.

> **Scope qualifier:** This evaluation is scoped to the persistent, interactive agent paradigm — where an agent maintains context across multiple tool calls within a modeling session — as distinct from the one-shot generation paradigm that dominates current literature.

---

### What Changed After the Research Deep Dive

> ⚠️ The original framing ("build an MCP server") is partially obsolete. Multiple MCP servers for SysML v2 already exist. The landscape splits into two paradigms (updated 09/2026 — see [[update-sep-2026-new-servers-and-research]]):
>
> **API-based (live repository via standard REST API):**
> - **Open-MBEE/flexo-mms-sysmlv2-mcp** — 35 tools, thin REST wrapper (Python/FastMCP; literally 2 files, 1:1 OpenAPI mapping — verified 09/2026)
> - **Open-MBEE/sysmod-sysmlv2-api** — 17 domain-level SYSMOD methodology tools (WIP, partly dummy data)
> - **redsteve/SysML-v2-API-MCP-Server** — C++ implementation (early stage)
> - **Dassault Systèmes** — Commercial MCP integration for CATIA MBSE
>
> **File-based (textual notation, parsed locally — all appeared mid-2026):**
> - **daltskin/sysml-v2-lsp** (`sysml-mcp` on npm) — 7 tools: parse, validate, getSymbols, getReferences, getHierarchy, getModelSummary
> - **elan8/spec42** (`spec42-mcp`) — Rust language server, validation + model-summary tools
> - **sysml2kit** (PyPI, 08/2026) — Python toolkit, 9 MCP tools + verification runner
> - **chouswei/codebase-sysmledgraph** — Kuzu graph DB over parsed text files; cypher/context/impact tools — the closest thing to a "semantic layer", but file-based, no repository state
>
> Simply building another wrapper is not a novel contribution. **The critical gap is not the server — it is the evaluation.** None of these implementations have been studied, benchmarked, or assessed against a live repository. Notably: all recent semantic-layer activity is on the *file* side; the *API/repository* side has gained nothing beyond thin wrappers. No task taxonomy, ground-truth benchmark, or evaluation methodology for persistent SysML v2 repository-agent tasks exists in the literature.

---

### Repositioned Contribution

The thesis makes **two coupled contributions**:

1. **A semantic MCP server** — not another thin REST wrapper, but a richer interface that adds three layers of agent-oriented capability on top of the raw SysML v2 REST API:
   - **Semantic navigation:** pre-materialised graph layer (SQLite cache + incremental `diffCommits()` sync) that enables multi-hop relationship traversal without repeated round-trips — addressing the fundamental scalability limitation confirmed by DLR DASC 2025 (200K elements / 16M relations, >10s per traversal query).
   - **Task-oriented abstractions:** composite tools (`trace_requirement`, `get_dependency_tree`) that map to MBSE reasoning patterns rather than raw CRUD operations.
   - **Agent-friendly retrieval:** context-bounded responses, typed result schemas, and progressive disclosure so agents can navigate the model graph without being overwhelmed by flat element dumps.

   The novelty is not traversal per se (any sufficiently rich wrapper could add caching or pagination) but the combination of semantic navigation, task-oriented tool design, and agent-optimised information retrieval as a coherent interface layer.

2. **One of the first evaluation frameworks and benchmarks for repository-based MBSE agent tasks** — a structured task taxonomy with ground-truth SysML v2 models and a multi-dimensional scoring methodology, used to measure agent performance on the implemented server and answer the research question.

   > **Scope sharpened (09/2026):** SEI/CMU published a controlled SysML v2 tooling benchmark (3 arms: baseline / validation-loop / full MCP tooling) — but entirely *file-based* (textual notation + Syside LSP; their MCP server is a curated-knowledge retrieval service, not a model-repository interface). The claim is therefore no longer "first MBSE agent evaluation" but **"first systematic evaluation of persistent agents against a live SysML v2 repository (REST API paradigm)"** — which remains unclaimed.

The server is the **instrument**. The evaluation framework and results are the **contribution**.

**Baseline decision (09/2026):** the ablation uses **flexo-mms-sysmlv2-mcp as condition A** (thin wrapper) vs. the semantic server as condition B. Evaluating a real, community-deployed artifact as baseline strengthens external validity and neutralises the "strawman baseline" objection. Consequence: the ablation is promoted from "cut-if-needed" to **core experiment**; the flexible scope lever is instead the breadth of the semantic server (number of composite tools, task levels covered).

---

### Research Question

*What are the capabilities and failure modes of AI agents performing representative MBSE tasks through a semantic MCP interface to a SysML v2 modeling environment, and how does tool design (semantic navigation, task-oriented abstractions, agent-friendly retrieval) shape those boundaries?*

---

### Core Gaps Addressed

| Gap | Source | Confidence |
|-----|--------|------------|
| No systematic evaluation of persistent agent interaction with a live SysML v2 **repository** (REST API paradigm) | SysTemp (arXiv 2506.21608); DUCTILE (arXiv 2603.10249); Task 4 findings; confirmed still open 09/2026 (SEI benchmark is file-based) | High — multiple sources call for this explicitly |
| Existing API-based MCP servers are unvalidated thin REST wrappers; semantic-layer work exists only on the file side (sysmledgraph) | Deep dive finding + 09/2026 landscape update | High — confirmed by inspecting repos |
| SysML v2 API cannot traverse relationships — kills non-trivial agent tasks | DLR DASC 2025 (elib.dlr.de/214792) | High — empirically demonstrated |
| AI-assisted MBSE evaluation covers only syntax, never semantics | SysTemp conclusion; TUM arXiv 2503.22587; partially narrowed by SEI pattern measure (still file-based, rubric-scored) | Moderate — generation studies exist; interactive repository evaluation is the under-explored axis |
| No published agent failure modes in formal modeling contexts | EngiAI (arXiv 2605.19743); DUCTILE; hardware-MCP benchmark (arXiv 2608.26199) documents adjacent-domain failure modes | Moderate — adjacent domains now covered; MBSE still open |

> ⚠️ **Open question the thesis must engage (09/2026):** arXiv 2609.03718 finds that for CAE agents a *generic* harness matches specialized machinery — domain knowledge helped, scaffolding didn't. The thin-wrapper vs. semantic-server ablation directly tests whether this transfers to MBSE. **Either outcome is a valid contribution** — the design must not presuppose the semantic server wins.

---

### MBSE Task Taxonomy (Draft)

Inspired by the EngiAI cognitive demand framework and SysML v2 operation types:

| Level                      | Task Type                          | Example                                                            |
| -------------------------- | ---------------------------------- | ------------------------------------------------------------------ |
| L1 — Retrieval             | Fetch and describe a model element | "What are the attributes of `VehiclePowerSystem`?"                 |
| L2 — Structural query      | Multi-hop traversal                | "List all parts owned by `Engine` transitively"                    |
| L3 — Authoring             | Create valid new elements          | "Add a `BatteryPack` part to the system with correct metadata"     |
| L4 — Consistency           | Detect and flag violations         | "Find requirements with no allocated component"                    |
| L5 — Conditional reasoning | Branch logic in model queries      | "If `maxPower > 150kW`, trace safety requirements"                 |
| L6 — Multi-step workflow   | Compose multiple operations        | "Decompose a subsystem, allocate requirements, validate structure" |

---

### Evaluation Framework (Draft)

Adapted from DUCTILE (arXiv 2603.10249) and EngiAI (arXiv 2605.19743):

| Dimension | Metric | What it measures | Success definition |
|-----------|--------|------------------|-------------------|
| Task Completion | TC (binary per run) | Did the agent complete the task? | All required outputs produced, no abandoned steps |
| Statistical reliability | pass^k (k=5) | Consistent success across repeated runs | ≥4/5 passes for "reliable", ≥3/5 for "fragile" |
| Syntactic validity | Metamodel conformance check | Are produced elements valid SysML v2? | Zero metamodel violations in created/modified elements |
| Semantic correctness | Expert-defined acceptance criteria per task | Does the output mean the right thing? | Matches ground-truth element relationships, types, and multiplicities |
| Trace preservation | Requirement-to-element allocation intact | Are cross-cutting concerns maintained? | No orphaned requirements, no broken satisfy/allocate links |
| Model edit quality | Diff against ground truth | Minimal, precise changes vs. over-modification | Edit distance within threshold; no unintended side effects |
| Tool efficiency | Call overhead ratio | Redundant vs. necessary tool calls | ≤1.5× optimal call count for the task |
| Failure taxonomy | Coded failure category | Which failure mode triggered? | N/A (diagnostic, not scored) |

---

### Key Failure Modes to Test (from EngiAI + DUCTILE)

- **Conditional reasoning inversion** — agent inverts branch logic under domain unfamiliarity
- **Multi-step degradation** — agent stops issuing calls mid-workflow without error
- **Semantic distractor failure** — two plausible values, agent picks wrong one
- **Parameter hallucination** — agent invents element properties not in the model
- **Tool over-calling** — redundant calls without improving output
- **Traversal exhaustion** — agent fails when graph depth exceeds what thin wrapper can serve
- **Few-shot inaction** — few-shot examples in tool descriptions cause some models to stop issuing calls entirely (arXiv 2608.26199)
- **Context accumulation degradation** — cumulative session context harms constrained models over long workflows (arXiv 2608.26199)

> **Server design input (arXiv 2608.26199):** comprehensive tool descriptions consistently reduce failures — aligns with the tool-description-smells findings (arXiv 2602.14878) and should be treated as a controlled design variable, not an afterthought.

---

### Literature Anchors

**AI-assisted MBSE:**
- SysTemp — arXiv 2506.21608 (multi-agent SysML v2 generation; explicit gap: no semantic eval, no benchmark)
- UC3M agent-based generation — e-archivo.uc3m.es (industrial RAG+validation pipeline)
- AI Co-Design Agenda — arXiv 2604.25526 (three co-design principles; "tool vertex" intervention is insufficient)
- MBSE-Graph-RAG — Fraunhofer/Cambridge Proceedings of the Design Society
- NPS SysEngBench — dair.nps.edu (benchmark development in progress)

**MCP + MBSE implementations:**
- Open-MBEE/flexo-mms-sysmlv2-mcp — 35-tool REST wrapper (**ablation baseline, condition A**)
- Open-MBEE/sysmod-sysmlv2-api — SYSMOD methodology layer
- Stephan Roth blog — roth-soft.de (practitioner framing of MCP+SysML v2)
- Dassault 3DS post — commercial adoption ("200% productivity" claim, unvalidated)
- *New 09/2026 (file-based):* daltskin/sysml-v2-lsp, elan8/spec42, sysml2kit, chouswei/codebase-sysmledgraph — see [[update-sep-2026-new-servers-and-research]]

**Closest competing/parallel work (new 09/2026):**
- SEI/CMU — "Native AI Integration for MBSE" (sei.cmu.edu blog) — controlled 3-arm SysML v2 tooling benchmark, file-based; strongest related work, must differentiate on repository/API paradigm; its results (validation loop → 0 syntax errors; knowledge tooling → pattern score 71.7→94.1) *support* the tool-design hypothesis
- Hardware-design MCP benchmark — arXiv 2608.26199 (methodological sibling in adjacent domain: purpose-built MCP server + benchmark + ablations)
- Pufibara / Modelica Agent Workflow Benchmark — arXiv 2608.23653 (232 tasks; benchmark-owned evaluator outside the agent loop — adopt this principle)
- CAE generic-harness study — arXiv 2609.03718 (counter-evidence: generic harness may suffice — engage in discussion)
- Requirements-quality LLM benchmark — arXiv 2609.03230 (best model finds only 47% of expert issues → supports expert acceptance criteria over LLM-as-judge)

**SysML v2 API limitations:**
- DLR DASC 2025 — elib.dlr.de/214792 (graph traversal problem, 200K elements / 16M relations)
- DLR-FT/sysml-v2-sql — SQLite graph cache approach (reference implementation for the cache layer)

**Evaluation frameworks:**
- DUCTILE — arXiv 2603.10249 (pass^k, expert acceptance criteria, LLM-as-judge; aerospace context)
- EngiAI — arXiv 2605.19743 (7 cognitive demand styles, composite scoring, 6 failure modes documented)
- CORE/DFA — arXiv 2509.20998 (full-path intermediate tool-call evaluation)
- BFCL — ICML 2025 (standard function-calling baseline)
- MCP tool description quality — arXiv 2602.14878 (tool description smells; directly applicable to server design)

---

### Synthesis

AI-assisted MBSE is an active and rapidly growing field, but it has so far been studied predominantly as a *generation* problem: given a natural language description, produce a SysML v2 model in one shot. The question of what happens when an AI agent is given persistent, structured, interactive access to a live modeling environment — maintaining context across multiple tool calls within a session — has received far less systematic attention. While generation studies and early MCP integrations exist, a rigorous evaluation of persistent, interactive agent behavior in a live SysML v2 environment appears substantially less established in the reviewed literature.

MCP servers that connect AI agents to SysML v2 already exist, and by mid-2026 the landscape splits into two paradigms: file-based servers that parse the textual notation locally (where all recent semantic-layer activity is concentrated, including the SEI/CMU benchmark and the sysmledgraph knowledge-graph server), and API-based servers exposing the standard repository REST API — which remain thin, unvalidated wrappers. Commercial tools claim productivity gains without published evidence. The academic literature explicitly calls for benchmarks and semantic evaluation frameworks; for the repository paradigm — persistent model state, commits, branches, live CRUD — none exist.

This thesis addresses that gap directly. It implements a semantic MCP server — one that goes beyond existing thin REST wrappers not merely by adding traversal (any sufficiently rich wrapper could add caching), but by providing semantic navigation over the SysML v2 graph, task-oriented tool abstractions that map to MBSE reasoning patterns, and agent-friendly retrieval that enables progressive exploration of large models. This server serves as a controlled environment for one of the first systematic evaluations of AI agent performance on interactive MBSE tasks. The evaluation framework, adapted from rigorous engineering agent benchmarks (DUCTILE, EngiAI), produces a structured task taxonomy, ground-truth model scenarios, and a scoring methodology with concrete success criteria: syntactic validity, semantic correctness, trace preservation, model edit quality, and task completion reliability.

The result is not just a working tool. It provides empirical evidence — the first of its kind for the repository paradigm in the sources reviewed — of what AI agents can and cannot reliably do against a live SysML v2 model repository: which task types succeed, which fail, and why. The thin-wrapper ablation additionally tests whether the recent CAE finding that "generic harnesses suffice" (arXiv 2609.03718) transfers to MBSE — making either outcome a substantive result. This gives the MBSE community a principled foundation for understanding where AI assistance is ready to be adopted, and where the open problems still lie.
