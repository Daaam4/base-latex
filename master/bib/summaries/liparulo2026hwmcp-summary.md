# Benchmarking AI Agents for Hardware Design Automation via MCP Tool Calling

**Bib:** `liparulo2026hwmcp` · **Type:** 1 scientific (preprint) · **Verified:** arXiv 15.09.2026
**Metadata:** Liparulo, Leonardo; Pierri, Francesco · arXiv:2608.26199 [cs.AI], 25 Aug 2026
**Tags:** #MCP #Benchmark #Ablation #StatefulTool #LocalLLM #MethodologicalSibling

## Topic
Can locally deployed LLM agents reliably automate dependency-ordered hardware-design workflows (create component → add ports → wire) through a stateful tool exposed via MCP?

## Method
Build an MCP server that reproduces the state and dependency logic of a proprietary hardware-design tool; construct a benchmark covering single-operation edits, multi-step dependency chains, invalid requests, misspelled prompts and multi-server contexts; evaluate seven open-source models under ablations of system prompt, tool-description detail, context scope and single- vs multi-agent architecture. Metric: expected-call coverage.

## Relevance
The closest **methodological** sibling: same recipe (purpose-built MCP server + task benchmark + configuration ablations), different domain, no semantic graph layer. Its task categories (single-op / chain / invalid / misspelled) map onto the difficulty tiers of the SysML v2 benchmark. Findings to carry over: comprehensive tool descriptions consistently reduce failures (design the bridge's tool surface deliberately; cf. Hasan et al.); few-shot prompting can cause severe *inaction* in some models; cumulative context harms constrained models → bound context per task; multi-agent decomposition helps weak workers/long sessions at the cost of extra calls.

## Status
Full text read (arXiv). PDF at `bib/papers/liparulo2026hwmcp.pdf`.
