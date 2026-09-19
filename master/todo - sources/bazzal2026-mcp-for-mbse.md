# Model Context Protocol for MBSE: A Unified Interoperable Agentic Framework for Systems Modelling

**Bib:** `bazzal2026mcpmbse` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026 · 🔴 **TOP-3 candidate — closest scientific competing work**
**Metadata:** Bazzal, Mahmoud; Schleifer, Simon; Lungu, Adriana; Kruse, Benjamin; Goetz, Stefan; Koldewey, Christian; Tissen, Denis; Wartzack, Sandro J.; Dumitrescu, Roman (Fraunhofer IEM, FAU Erlangen, Uni Paderborn) · *Proceedings of the Design Society* 6 (DESIGN 2026), pp. 2721–2730, July 2026 · DOI 10.1017/pds.2026.10630 · CC BY-NC-ND · open access on publica.fraunhofer.de (bitstream 8869342b-…)
**Tags:** #MCP #SysMLv2API #Framework #Interoperability #CompetingWork

## Topic
A framework for implementing MCP servers on top of the standard SysML v2 API so that LLMs can interact with system models in a tool-agnostic way. Motivation (abstract): existing LLM approaches lack interoperability because they cannot handle "complex SysML v2 API operations".

## Method (from abstract; full text pending)
Framework/architecture contribution. Position: "foundation for agentic MBSE by allowing automation of modeling tasks while maintaining interoperability across tools". No evaluation is mentioned in the abstract.

## Relevance
This is the paper an examiner will hold up and ask "what's new?". Answer, on three axes:
1. **Contribution type** — they deliver the *artifact class*; the thesis delivers the *capability evaluation* (benchmark, ablation, failure taxonomy). SysTemp's "no benchmark exists" still holds after this paper.
2. **Attachment point** — they sit on the standard REST API (Option A, no graph traversal per Ahlbrecht et al.); the thesis attaches inside the industrial tool (Option B, MSoSA OpenAPI) and can expose tool-native validation/evaluation. The thin-vs-semantic ablation directly tests whether that matters.
3. **Scale** — evaluation on a ~2 000-element model with ground truth vs. (presumably) a demonstrator.
Also a strong argument *for* the topic: Fraunhofer IEM (Dumitrescu) is investing in exactly this direction.

## Status
Abstract only (Crossref). **Action:** download the open-access PDF from publica.fraunhofer.de (server unreachable from the dev machine on 15.09; try browser/VPN) and fill in: which repository they connect to, tool count, any evaluation. Update `.pi/context/05-related-work.md` afterwards.
