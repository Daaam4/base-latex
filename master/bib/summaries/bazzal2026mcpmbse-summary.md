# Model Context Protocol for MBSE: A Unified Interoperable Agentic Framework for Systems Modelling

**Bib:** `bazzal2026mcpmbse` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026 · 🔴 **[TOP 3] — closest scientific competing work (confirmed, full text read 19.09.2026)**
**Metadata:** Bazzal, Mahmoud; Schleifer, Simon; Lungu, Adriana; Kruse, Benjamin; Goetz, Stefan; Koldewey, Christian; Tissen, Denis; Wartzack, Sandro J.; Dumitrescu, Roman (Fraunhofer IEM, FAU Erlangen, Uni Paderborn) · *Proceedings of the Design Society* 6 (DESIGN 2026), pp. 2721–2730, July 2026 · DOI 10.1017/pds.2026.10630 · CC BY-NC-ND · open access on publica.fraunhofer.de (bitstream 8869342b-…)
**Tags:** #MCP #SysMLv2API #Framework #Interoperability #CompetingWork

## Topic
A framework for implementing MCP servers on top of the standard SysML v2 API so that LLMs can interact with system models in a tool-agnostic way. Motivation (abstract): existing LLM approaches lack interoperability because they cannot handle "complex SysML v2 API operations".

## Method (full text)
Framework/architecture contribution, developed per Design Science Research Methodology (DSRM, Peffers et al. 2007). Implements MCP servers directly on the standard SysML v2 API: C#.NET, official reference API + database in a Docker container, open-source at `github.com/hni-ase/SysMLV2-mcp`. Defines three tool classes — **model creation, model modification, model analysis** (maps cleanly onto this thesis's Create/Patch/Query use cases) — plus non-modelling tools for branching/commits. Design principles: tools should be task-tailored, split across multiple MCP servers by architectural aspect once the metamodel gets large (SysML v2 has 450+ metamodel elements), and elements sharing an ancestor type should share one generic tool.

Demonstrated, **not benchmarked**, via two qualitative DSRM case studies adapted from the authors' own prior workflow-based (non-agentic) papers: (1) agentic use-case-diagram generation (create use case → query/create actor → create association), (2) agentic signal-redundancy optimisation in vehicle architectures (query vector-DB context → detect duplicate/merge/split signals → modify model). No ground truth, no quantitative metrics, no baseline comparison — purely an architecture/feasibility demonstration. Their own discussion names the tool-count-vs-LLM-reasoning tradeoff and single-agent-per-task scope as open limitations.

## Relevance
This is the paper an examiner will hold up and ask "what's new?". Answer, on three axes, all confirmed by the full text:
1. **Contribution type** — they deliver the *artifact class* (an MCP-on-REST-API framework); the thesis delivers the *capability evaluation* (benchmark, ablation, failure taxonomy). Confirmed: their own two case studies are qualitative feasibility demonstrations with no ground truth or metrics. SysTemp's "no benchmark exists" still holds after this paper.
2. **Attachment point** — they sit on the standard REST API (Option A, no graph traversal per Ahlbrecht et al.); the thesis attaches inside the industrial tool (Option B, MSoSA OpenAPI) and can expose tool-native validation/evaluation. The thin-vs-semantic ablation directly tests whether that matters.
3. **Scale** — two small hand-built case studies (a handful of elements each) vs. the Apollo 11 model (~2 000 elements) with ground truth.
Bonus structural gift: their three tool classes (creation/modification/analysis) line up almost 1:1 with this thesis's Create/Patch/Query use cases — good vocabulary to borrow or explicitly contrast against in the design chapter.
Also a strong argument *for* the topic: Fraunhofer IEM (Dumitrescu) + Audi + FAU are investing in exactly this direction — it is not a niche question.

## Status
**Full text read 19.09.2026** (PDF in `bib/papers/bazzal2026mcpmbse.pdf`). Bib entry live in `quellen.bib` with `[TOP 3]` flag. `.pi/context/05-related-work.md` updated to drop the "full text pending" caveat.
