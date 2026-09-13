# Technical backlog (post-exposé sequence)

> Agent context for the Master's thesis. Human-facing status lives in `0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

### Technical setup (parallel) — **the spike is now the top technical priority**

> Do the spike **before the exposé promises an architecture.** Everything downstream depends on whether SysML v2 is reachable through the MSoSA Java OpenAPI.

- [ ] **Obtain + install MSoSA 2026x** (access granted by Prof. Voss 13.09 — D14). Fill in `06-tooling-msosa.md` A.0: exact build from `Help > About`, JDK, plugin set, whether `-Dmd.sysml2.enabled` is still needed (expected: no). The 2024x recipe in A.1 is fallback only.
- [ ] Connect to the FH VPN and confirm licence checkout (assume 149.201.140.104:1101; verify for 2026x)
- [ ] Check 2026x for a **desktop REST API** for SysML v2 ("enhanced REST APIs" in release notes) — if present, candidate backend for the thin-CRUD arm
- [ ] Import **one small GfSE model** via the SysML v2 Textual Editor → does textual import work at all?
- [ ] **🔴 Spike (on 2026x):** hello-world MagicDraw OpenAPI Java plugin (target the JDK 2026x ships with) — can it *see* and *create* SysML v2 elements, or only UML/SysML v1? → decides whether Option B is viable
- [ ] Try the **SysML v2 Evaluation** plugin on an expression (feasibility for *Verifizierung*)
- [ ] Add `models/` submodules: `airbus/apollo-11-sysml-v2`, `GfSE/SysML-v2-Models`
- [ ] Parse both with the pilot-implementation jar (reuse GfSE `CI/parse.py`) → baseline syntactic validity = ground truth
- [ ] Import **Apollo 11** into MSoSA; log every import problem (**first data point for *Validierung*** and a real finding about tool readiness)
- [ ] Create the separate code repo for the MCP bridge; language: **Java 17 plugin** + a thin MCP process (Python/TS) talking to it over local socket/HTTP
- [ ] Write down the exact tool build + plugins + feature flag for the reproducibility appendix

### Reading
- [ ] Read **Helle & Schramm 2026** (Apollo 11) fully → summary in `bib/literature/1-scientific/`, register in `bib/literature/0. Index.md`
- [ ] Read the **SEI/CMU** "Native AI Integration for MBSE" post in full (closest competing work — 3-arm design template)
- [ ] Read **arXiv 2608.26199** (hardware-design MCP benchmark — closest methodological sibling)
- [ ] Read **arXiv 2609.03718** (CAE generic harness — counter-evidence, must engage in discussion)
- [ ] Read **DLR DASC 2025** (elib.dlr.de/214792 — graph traversal limitation; technical motivation for a cache layer)
- [ ] Skim **arXiv 2608.23653** (Pufibara/Modelica — external evaluator principle) and **2609.03230** (requirements-quality LLM benchmark — supports expert criteria over LLM-as-judge)
- [ ] Inspect `Open-MBEE/flexo-mms-sysmlv2-mcp` (35 tools) and `ajhcs/cameo-mcp-bridge` (162 tools, v1/UML) to argue "thin wrapper" concretely

### Later (sequence, not yet dated — dates come after the exposé)
- [ ] Use-case task catalogue v1 with 3 difficulty tiers (local / cross-package / cross-layer)
- [ ] Fault-injection script for *Korrektur* (dangling refs, wrong types, broken `satisfy`)
- [ ] Evaluation harness + external evaluator (outside agent loop) — **must support unattended batch runs with deterministic model reset** (`.pi/context/04-evaluation-design.md` (statistical design)); this is now a hard requirement, not a nicety
- [ ] Metric implementation: task success, syntactic validity, semantic correctness, collateral damage (model diff), tool-call count / tokens, failure code
- [ ] Chapter scaffolding `pages/2xx-*.tex`

---
