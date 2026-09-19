# MCP Tool Descriptions Are Smelly! Towards Improving AI Agent Efficiency with Augmented MCP Tool Descriptions

**Bib:** `hasan2026mcpsmells` · **Type:** 1 scientific (preprint) · **Verified:** arXiv 15.09.2026
**Metadata:** Hasan, Mohammed Mehedi; Li, Hao; Rajbahadur, Gopi Krishnan; Adams, Bram; Hassan, Ahmed E. (Queen's University) · arXiv:2602.14878, 16 Feb 2026
**Tags:** #MCP #ToolDescriptions #Confound #Efficiency

## Topic
Quality of natural-language tool descriptions in the MCP ecosystem and its effect on agent performance.

## Method
Empirical study of 856 tools across 103 MCP servers; six description components from the literature → scoring rubric → formalised "smells", operationalised by an FM-based scanner. 97.1 % of descriptions have ≥ 1 smell, 56 % fail to state purpose. Augmenting all components: median +5.85 pp task success, +15 % partial completion, but +67 % execution steps and regressions in 17 % of cases; compact component combinations often keep reliability at lower token cost.

## Relevance
(1) Supplies a rubric for writing the bridge's tool descriptions. (2) Identifies a **confound between arms**: the semantic arm must not win merely because its tools are better described — description quality has to be held constant (same rubric, same components) across thin and semantic bridges. Complements Liparulo & Pierri's finding on description detail.

## Status
Full text read (arXiv). PDF at `bib/papers/hasan2026mcpsmells.pdf`.
