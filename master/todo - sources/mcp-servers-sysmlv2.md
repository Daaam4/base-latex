# MCP servers for SysML v2 — the artifact landscape

**Type:** open-source repositories / package registries
**Role in the thesis:** this *is* the state of the art for the artifact side. The gap argument rests on inspecting these repos directly, because none of them is described in any paper.

---

## The central positioning axis: file-based vs. API-based

| | **File-based** (parse textual notation locally) | **API-based** (live repository via REST) |
|---|---|---|
| Servers | sysml-v2-lsp, spec42, sysml2kit, codebase-sysmledgraph, VS Code ext. | flexo-mms-sysmlv2-mcp, sysmod-sysmlv2-api, redsteve |
| Semantic layer | **yes** — this is where all recent activity is | **no** — thin 1:1 REST wrappers only |
| Live model state | no | yes (commits/branches) |
| **This thesis** | — | **neither**: live in-session model state inside an *industrial tool* (MSoSA) |

**→ The niche:** no MCP bridge exists for **SysML v2 inside MSoSA/Teamwork Cloud**, and **none of these servers has ever been systematically evaluated**.

---

## API / live-repository side

| Repo | Detail | Verdict |
|---|---|---|
| **Open-MBEE/flexo-mms-sysmlv2-mcp** | **35 tools**, Python/FastMCP, literally 2 files, 1:1 OpenAPI mapping (verified 09/2026) | The canonical "thin wrapper". Was the planned ablation baseline in the pre-kickoff framing; now cited as evidence that the API side has no semantic layer |
| **Open-MBEE/sysmod-sysmlv2-api** | 17 domain-level **SYSMOD** methodology tools; WIP, partly dummy data | Closest thing to task-oriented tools on the API side — but methodology-specific and incomplete |
| **redsteve/SysML-v2-API-MCP-Server** | C++ implementation, early stage | Completeness of the landscape survey |

## File / LSP side

| Repo | Detail |
|---|---|
| **daltskin/sysml-v2-lsp** (`sysml-mcp`, npm) | ANTLR4 parser; **7 tools**: parse, validate, getSymbols, getDefinition, getReferences, getHierarchy, getModelSummary. MIT, ~162 weekly downloads |
| **elan8/spec42** (`spec42-mcp`) | Rust language server for SysML v2/KerML; validation + model summary; CLI + HTTP + MCP |
| **sysml2kit** (PyPI, 08/2026) | Python toolkit: object model, API JSON interchange, validation, **verification runner**; 9 MCP tools + HTTP client for the standard API. Pre-alpha but pip-installable |
| **chouswei/codebase-sysmledgraph** | **Kuzu graph DB** over parsed text files; tools: `cypher`, `context` (360° symbol view), `impact` (blast radius), `rename`, `indexDbGraph`. Publisher/subscriber architecture |
| **JamieD.sysml-v2-support** | VS Code extension with a built-in MCP server for Copilot agent mode |

**On `codebase-sysmledgraph`:** the closest competitor to the semantic-navigation idea, and it confirms demand for graph-layer navigation — but it builds its graph from *parsed text files*, with no live model, no commits, no tool-native validation, and no MBSE task abstractions.

## Prior art — v1/UML tool bridges (structural template)

| Repo | Detail | Why it matters |
|---|---|---|
| **ajhcs/cameo-mcp-bridge** | MCP server ↔ Cameo **Java API** via embedded plugin; **162 tools** (query, create, modify, validate, visualise) — **SysML v1/UML** | **The structural template for Option B (D13).** Proves the desktop-plugin bridge pattern works; differentiates because it is v1/UML and unevaluated. Its README itself lists a separate "SysML v2 API MCP Server — early". **Bib key:** `cameo-mcp-bridge` |
| **msatyendraece4444/compLete_ms** | ChatGPT ↔ MagicDraw/Cameo via Python middleware (RAG) + Java MCP plugin: validate, complete, accelerate models (v1) | Second data point that the pattern is being attempted; also v1 |
| **DLR-FT/sysml-v2-sql** | SQLite graph cache over the SysML v2 API | Reference implementation for a cache/traversal layer, should traversal performance become a problem |

## Ground-truth tooling (not related work — instruments)

| Repo | Use |
|---|---|
| **Systems-Modeling/SysML-v2-Release** | Pilot implementation + canonical example models; the **parser jar** is our syntactic ground-truth oracle. Syntax reference / few-shot material |
| **Systems-Modeling/SysML-v2-API-Services** | Free local standard-API server. **Emergency fallback only** (Option A′) — would abandon the industrial-tool premise |
| **GfSE/SysML-v2-Models** | Secondary model set; its `CI/parse.py` is reused for validity checking. **Bib key:** `gfse-models` |
| **airbus/apollo-11-sysml-v2** | **System under test.** MPL-2.0 · 28 files · ~7 200 LOC · ~2 000 elements · 5 CoSMA layers. **Bib key:** `helle2026apollo` (journal paper) |

---

## Citation policy for this folder
1. Cite with **repo URL + commit/version + access date** — repos move fast (all the file-based ones appeared mid-2026).
2. Claims about a repo must come from **inspecting it**, not from its README's self-description. Tool counts above were verified by inspection where marked.
3. These are the *state of the art of artifacts*; the absence of any evaluation of them is the thesis gap.

## TODO
- [ ] Re-verify tool counts and activity before submission (the landscape shifts monthly)
- [ ] Record exact commit hashes for every repo cited
