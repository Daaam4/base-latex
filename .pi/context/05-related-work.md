# Related work landscape & anticipated pushback

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Landscape — what already exists (related work)

**Nothing bridges agents to SysML v2 *in MSoSA/TWC*, and nothing evaluates agent capability systematically across use cases on a large model.** That is the gap.

**API / live-repository side (thin, unevaluated):**
`Open-MBEE/flexo-mms-sysmlv2-mcp` (35 tools, 1:1 OpenAPI) · `Open-MBEE/sysmod-sysmlv2-api` (17 SYSMOD tools, WIP) · `redsteve/SysML-v2-API-MCP-Server` (C++, early) · Dassault commercial CATIA MBSE MCP ("200% productivity", unvalidated)

**File / LSP side (where all semantic-layer activity is):**
`daltskin/sysml-v2-lsp` (`sysml-mcp`, 7 tools) · `elan8/spec42` · `sysml2kit` (PyPI, 9 MCP tools) · `chouswei/codebase-sysmledgraph` (Kuzu graph: cypher/context/impact) · `JamieD.sysml-v2-support` VS Code extension

**v1/UML bridges (prior art to cite):**
`ajhcs/cameo-mcp-bridge` (162 tools via Cameo Java API) · `msatyendraece4444/compLete_ms` (ChatGPT ↔ MagicDraw via Python RAG + Java plugin)

**Closest competing / parallel work:**
| Work | Why it matters | How we differ |
|---|---|---|
| **Bazzal et al. 2026** (Fraunhofer IEM/HNI Paderborn/FAU/Audi), *MCP for MBSE*, Proc. Design Society, DOI 10.1017/pds.2026.10630 — **[TOP 3]** | **Closest scientific competitor**: a C#.NET framework for building MCP servers directly on the standard SysML v2 API (open source, `github.com/hni-ase/SysMLV2-mcp`), published July 2026. Three tool classes — creation/modification/analysis — map onto our Create/Patch/Query use cases. The artifact class the thesis builds on. | (1) They contribute the *framework*; confirmed by full text (read 19.09.2026): two qualitative DSRM case studies, no ground truth, no metrics. We contribute the *capability evaluation* — SysTemp's "no benchmark exists" still holds. (2) They sit on the standard REST API (Option A, no traversal per Ahlbrecht); we attach inside MSoSA (Option B) and expose tool-native validation. (3) Scale: hand-built demo cases vs. Apollo 11 (~2 000 elements) with ground truth. |
| **Al-Shami et al. 2026** (Aalto), INCOSE IS, DOI 10.1002/iis2.70189 | Semantic-vs-syntactic fault distinction, KG-driven systematic fault injection, diff-patch repair; plain LLM < 3 % → fine-tuned > 91 % | Precedent for the *fault correction* fault taxonomy and injection method. They fine-tune a small model on files; we use a frontier agent with live-model tools, no fine-tuning. |
| **SEI/CMU** "Native AI Integration for MBSE" | Controlled 3-arm SysML v2 benchmark (baseline / validation loop / full tooling); validation loop → 0 syntax errors; knowledge tooling 71.7 → 94.1 pattern score | Entirely **file-based** (textual + Syside LSP); their MCP server is a *knowledge-retrieval* service, not a model repository. No live state, no commits, no traversal |
| **arXiv 2608.26199** (hardware MCP benchmark) | Methodological sibling: purpose-built MCP server + benchmark + ablations, 7 models | Different domain; no semantic graph layer |
| **arXiv 2609.03718** (CAE agents) | ⚠️ Counter-evidence: generic harness ≈ specialized machinery; domain knowledge > scaffolding | Directly tested by our Arm 1 vs Arm 2 ablation |
| **arXiv 2608.23653** (Pufibara/Modelica) | 232-task benchmark, evaluator outside agent loop, persistent state | Adopt the external-evaluator principle |
| **DLR DASC 2025** | SysML v2 API cannot traverse relationships (>10 s/query at 200K elements / 16M relations) | Technical motivation for the semantic/cache layer; `DLR-FT/sysml-v2-sql` is a reference implementation |

**Corpus (17 scientific sources, all metadata verified 15.09.2026; summaries in `master/todo - sources/`, table in `master/todo - sources/0. Index.md`):**
A. LLM × SysML v2: DeHart 2024 (origin) · Fresemann 2025 (SLR) · Dehn 2025 (NL→v2) · Qualis 2025 (KG) · Wu 2025 (SysForge) · Quast 2026 (GraphRAG) · Bouamra 2025 (SysTemp, gap) · Al-Shami 2026 (fault localisation) · Bazzal 2026 (MCP for MBSE) · Ahlbrecht 2025 (DASC)
B. Agent evaluation: Liparulo 2026 (hw-MCP) · Shi 2026 (CAE, counter) · Wang 2026 (Pufibara) · Shefa 2026 (47 %) · Pradas-Gomez 2026 (DUCTILE) · Molinari 2026 (EngiAI) · Hasan 2026 (MCP smells)

**Design principles imported from the corpus:** evaluator outside the agent loop (Wang) · expert acceptance criteria + human second rater, no LLM-as-judge (Shefa, DUCTILE) · per-capability scores, traces as evidence (Molinari) · repeated runs / pass^k (DUCTILE) · tool-description quality held constant across arms (Hasan, Liparulo) · validation-feedback loop in every tool arm so the semantic layer is isolated from the repair-loop effect (Shi, SEI).

---

## Anticipated pushback → answers

| Question | Answer |
|---|---|
| "MCP servers already exist — what's novel?" | The gap is the **evaluation**, not the server. None of the existing servers has been benchmarked, and none targets SysML v2 in an industrial tool (MSoSA/TWC). |
| "Fraunhofer already published *MCP for MBSE* (Bazzal 2026) — isn't that your thesis?" | No: they contribute a framework on the standard API with two qualitative demo case studies, confirmed by full text — no ground truth, no metrics, no benchmark. We contribute the benchmark, ablation and failure taxonomy — and test whether a tool-internal bridge with traversal + native validation beats the API-level design. Bazzal is the strongest argument that the topic is timely. |
| "Is ~4.5 months enough to build *and* evaluate?" | Yes with descoping (§3): reuse Apollo 11 instead of authoring models, fewer difficulty tiers, one model family (Claude) with two capability tiers. Writing overlaps from week 1. |
| "How do you measure semantic correctness?" | Expert-defined acceptance criteria per task + tool-native metamodel/validation conformance + diff against ground truth. Not LLM-as-judge alone (cf. arXiv 2609.03230: best model finds only 47% of expert issues). |
| "What if the agent fails/succeeds at everything?" | Either outcome is the result — the contribution is the capability map + failure taxonomy. Difficulty tiers exist precisely to locate the boundary. |
| "Why interactive agents and not generation?" | Generation is well covered. Persistent tool-using agents on live models is what industry is deploying, with zero published evidence. |

---
