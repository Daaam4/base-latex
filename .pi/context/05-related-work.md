# Related work landscape & anticipated pushback

> Agent context for the Master's thesis. Human-facing status lives in `0. OVERVIEW.md`.
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
| **SEI/CMU** "Native AI Integration for MBSE" | Controlled 3-arm SysML v2 benchmark (baseline / validation loop / full tooling); validation loop → 0 syntax errors; knowledge tooling 71.7 → 94.1 pattern score | Entirely **file-based** (textual + Syside LSP); their MCP server is a *knowledge-retrieval* service, not a model repository. No live state, no commits, no traversal |
| **arXiv 2608.26199** (hardware MCP benchmark) | Methodological sibling: purpose-built MCP server + benchmark + ablations, 7 models | Different domain; no semantic graph layer |
| **arXiv 2609.03718** (CAE agents) | ⚠️ Counter-evidence: generic harness ≈ specialized machinery; domain knowledge > scaffolding | Directly tested by our Arm 1 vs Arm 2 ablation |
| **arXiv 2608.23653** (Pufibara/Modelica) | 232-task benchmark, evaluator outside agent loop, persistent state | Adopt the external-evaluator principle |
| **DLR DASC 2025** | SysML v2 API cannot traverse relationships (>10 s/query at 200K elements / 16M relations) | Technical motivation for the semantic/cache layer; `DLR-FT/sysml-v2-sql` is a reference implementation |

**Read papers (summaries in `bib/literature/1-scientific/`):**
1. LLMs for System Modeling: Current State (SLR of 20 papers; SysML v1→v2 prompting; MCP)
2. Generating SysML v2 from NL Requirements (4-component prompting; automotive)
3. Mitigating Hallucinations via Tri-Layered KG (satellite case study)
4. SysForge — knowledge-augmented conversational multi-agent generation + refinement
5. Enabling Humans and AI to Retrieve Information from System Architectures (GraphRAG + Neo4j + RFLP; 93% accuracy)

---

## Anticipated pushback → answers

| Question | Answer |
|---|---|
| "MCP servers already exist — what's novel?" | The gap is the **evaluation**, not the server. None of the existing servers has been benchmarked, and none targets SysML v2 in an industrial tool (MSoSA/TWC). |
| "Is ~4.5 months enough to build *and* evaluate?" | Yes with descoping (§3): reuse Apollo 11 instead of authoring models, fewer difficulty tiers, one model family (Claude) with two capability tiers. Writing overlaps from week 1. |
| "How do you measure semantic correctness?" | Expert-defined acceptance criteria per task + tool-native metamodel/validation conformance + diff against ground truth. Not LLM-as-judge alone (cf. arXiv 2609.03230: best model finds only 47% of expert issues). |
| "What if the agent fails/succeeds at everything?" | Either outcome is the result — the contribution is the capability map + failure taxonomy. Difficulty tiers exist precisely to locate the boundary. |
| "Why interactive agents and not generation?" | Generation is well covered. Persistent tool-using agents on live models is what industry is deploying, with zero published evidence. |

---
