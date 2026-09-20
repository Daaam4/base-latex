# What Do CAE Simulation Agents Really Need Beyond a Generic Harness?

**Bib:** `shi2026cae` · **Type:** 1 scientific (preprint) · **Verified:** arXiv 15.09.2026 · ⚠️ counter-evidence to H2
**Metadata:** Shi, Jiasheng; Zhang, Tianhan · arXiv:2609.03718 [cs.CE], 3 Sep 2026
**Tags:** #Harness #Ablation #CounterEvidence #DomainKnowledge #CAE

## Topic
Whether specialised agent machinery (multi-agent decomposition, domain retrieval, scripted reflection) still adds value for CAE simulation setup now that generic harnesses provide multi-turn reasoning, tool use and execution feedback.

## Method
Controlled comparison with information access and repair budget held fixed. Single-agent generic harness vs. specialised multi-agent systems on FoamBench (96.4 % vs 88.2 %). Ablations: no repair round 71.8 % → with execution-feedback repair 96.4 %; scripted reflection adds nothing; domain knowledge as solver tutorials is the largest single gain (80.9 % → 96.4 %).

## Relevance
**Direct challenge to H2** (semantic bridge > thin CRUD bridge): if their result transfers, a thin bridge plus tool-native validation feedback plus good SysML v2 reference material may already capture most of the gain, and the semantic layer adds little. The Arm 1 vs Arm 2 ablation is designed to test exactly this; the discussion must engage the result either way. Also supports including a validation-feedback loop in *every* tool arm so that the semantic layer's effect is isolated from the repair-loop effect (cf. SEI arm 2 vs arm 3).

## Status
PDF filed at `bib/papers/shi2026cae.pdf`. Bib entry promoted to `bib/quellen.bib` (Subject 5). Added to `bib/mindmap.md` under the EvalFW node level.
