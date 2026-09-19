# EngiAI: Capability-Based Evaluation of Tool-Connected LLM Agents for Engineering Design

**Bib:** `molinari2026engiai` · **Type:** 1 scientific (preprint; extended IDETC-CIE 2026 paper) · **Verified:** arXiv 15.09.2026
**Metadata:** Molinari, Gioele; Felten, Florian; Massoudi, Soheyl; Fuge, Mark (ETH Zürich) · arXiv:2605.19743, 19 May 2026 · 42 pp. · submitted to ASME J. Mech. Des.
**Tags:** #CapabilityEvaluation #ToolConnectedAgents #EngiBench #FailureModes

## Topic
Engineering-agent demonstrations are hard to compare and failures hard to diagnose because tasks, tools and success criteria differ.

## Method
Capability-based framework that scores distinct skills separately — workflow execution, retrieval-assisted parameter selection, HPC orchestration, training-code authoring — from execution traces and resulting artifacts. Four LLM backends on EngiBench Beams2D and Photonics2D via EngiAI (LangGraph reference implementation). Proprietary models 96–97 % vs open-source 55–78 % on workflow tasks; tool-based decision-making tasks much lower (20–53 %).

## Relevance
The rationale for evaluating **per capability / use case** (Abfragen, Validierung, …) with separate scores rather than one end-to-end success rate, and for using execution traces (tool-call logs) as evaluation evidence alongside the artifact (the model diff). Its structured failure-mechanism reporting is the model for the thesis's failure taxonomy.
