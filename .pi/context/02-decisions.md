# Decisions (D1–D19)

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Decisions made

| # | Decision | Where decided |
|---|---|---|
| D1 | **System under test:** Airbus **Apollo 11 SysML v2** model (`airbus/apollo-11-sysml-v2`, MPL-2.0, ~7.2 kLOC / 28 files / ~2 000 elements, 5 CoSMA layers). Paper: Helle & Schramm 2026, *Systems Engineering*, DOI 10.1002/sys.70074 — bib key `helle2026apollo`, Crossref-verified, `[TOP 3]` (20.09.2026, replaces INCOSE) | kickoff + `06-tooling-msosa.md` |
| D2 | **Secondary / generalisation set:** GfSE `SysML-v2-Models` (BSD-3, ~5.1 kLOC across ~15 small models); also source of "bad examples" | same |
| D3 | **Interface:** MCP server bridging LLM agents to **MSoSA** (FH has a licence) — replaces the earlier "wrap the pilot REST API" framing | kickoff |
| D4 | **Evaluation design** (arms superseded by D18)**:** ablation arms (0) no tool / (1) thin CRUD bridge / (2) semantic bridge with tool-native validation & evaluation; fault injection for Korrektur; **evaluator outside the agent loop** | kickoff + lit. |
| D5 | Second examiner: **Tim Höner** | kickoff |
| D6 | Obsidian vault retired — everything lives in this repo | 12.09.2026 |
| D7 | ~~German use-case names kept as terms (Prof. Voss uses them)~~ **Superseded by D17 (21.09.2026): English only.** | convention |
| D8 | **LLM access: own Anthropic Max subscription** → Claude family. Evaluation is single-family; a capability-tier contrast (e.g. Opus vs. Sonnet) replaces cross-vendor comparison. Written up as a threat to validity (§5.3) | 13.09.2026 |
| D9 | **Thesis language English**; **min. 40 pages** | confirmed 13.09.2026 |
| D11 | **Tooling licence scope: MSoSA only.** No TWC, no SysIDE licence assumed. SysIDE Automator only if essential / clearly advantageous — decided later, not designed into the exposé | 13.09.2026 |
| D12 | **Rigour target: statistically solid results**, not a pilot study → paired design across arms, k=5, 36-task target, pre-registration, inter-rater kappa (`.pi/context/04-evaluation-design.md` (statistical design)). Cost: task breadth + a mandatory unattended batch harness | 13.09.2026 |
| D13 | **Bridge = Option B** (MCP ↔ MagicDraw OpenAPI Java plugin in MSoSA) — the exposé is written for this. Standing instruction: work with what the FH has access to. TWC availability asked *after* the exposé (upgrade path, not a replan); A′ = emergency fallback only | 13.09.2026 |
| D14 | **Tool build = MSoSA 2026x** (access granted by Prof. Voss, 13.09.2026) — supersedes the seminar-era 2024x Refresh2 HF1. Native SysML v2; 2024x-specific caveats (feature flag, incubator-grade v2) dropped. Exact build + API surface recorded in `06-tooling-msosa.md` A.0 after install. The exposé names 2026x as the tool version. Alternatives rejected: staying on 2024x (two generations behind on the feature under test) | 13.09.2026 |
| D15 | **Use cases narrowed to six primitives:** Create · Query/Read · Patch · Delete · Validation · Verification. All six are named in English (German terms dropped, see D17). **Fault correction, explanation and refactoring (formerly Korrektur/Erklären/Refactoring) are no longer separately scored** — they become *composed scenarios* built from the six primitives (fault correction = Query → Patch/Delete → re-check Validation/Verification against an injected fault). Rationale: every other use case decomposes into these six, so scoring the primitives directly gives atomic, cleaner ground truth and lines up with the ablation arms (Arm 1 thin-CRUD bridge → Create/Read/Patch/Delete; Arm 2 semantic bridge → adds tool-native Validation/Verification). Supersedes D4; detail in `04-evaluation-design.md` | 20.09.2026 |
| D16 | **Difficulty tiers = Local / Cross-package / Cross-layer**, operationalized by relationship-hop count + files touched + CoSMA layers spanned (1 file/0–1 hop/1 layer · 2–3 files/2–4 hops/1 layer · 3+ files/≥3 hops/≥3 layers), verified against the real Apollo 11 package structure (cloned + inspected 20.09.2026; chain confirmed via `#refinement dependency`, `satisfy 'REQ' by ...`, `perform action` relationships). Validation is scope-based instead of hop-based (single element → package/cluster → whole model) since it checks a scope, not a traversal. Detail + worked examples in `04-evaluation-design.md` | 20.09.2026 |
| D17 | **English-only terminology:** use-case names are Create · Query · Patch · Delete · Verification · Validation, composed scenarios are *fault correction* / *explanation* / *refactoring*. No German terms in the exposé, thesis or bib annotations. Supersedes D7 and the German-term clause of D15. | 21.09.2026 |
| D18 | **Two-phase design replaces the 3-arm ablation:** Phase 1 benchmarks the agent through the **bare MCP bridge** (raw API as tools, no knowledge base / guardrails) to establish a baseline. The failure data from Phase 1 drives the design of the **harness** inside the bridge (knowledge base, guardrails, encoded best practices). Phase 2 repeats the same benchmark with the harness to measure the improvement. No 'no-tool' arm. Supersedes the arm structure of D4/D12/D15; the paired design (same tasks, same k) is kept across the two phases. Statistical design in `04-evaluation-design.md` must be re-cut for 2 conditions (paired Wilcoxon instead of Friedman). | 21.09.2026 |
| D19 | **No hypotheses.** H1 (task asymmetry), H2 (tool semantics) and H3 (model scale) are dropped — they did not follow from the research question. The thesis is driven by the RQ alone (as stated in the exposé). Anything that was justified by H1–H3 (e.g. the GfSE set as an H3 comparison, the model-tier contrast) needs its own RQ-based justification or gets dropped when the evaluation framework is re-cut. | 21.09.2026 (exposé), recorded 23.09.2026 |

### Bridge options (decided: **B**, D13)

| Option | Path | Pros | Cons |
|---|---|---|---|
| **A** | MCP → **Teamwork Cloud SysML v2 REST API** (standard endpoints: projects/commits/branches/elements/query) | standard-conformant, tool-agnostic, commits/branches give persistence | needs a TWC licence/instance at FH; generic element-level JSON → semantic layer required |
| **B** | MCP ↔ **MagicDraw OpenAPI Java plugin** in MSoSA (local socket/HTTP) | works with desktop licence only; direct access to validation, evaluation, simulation, diagrams | proprietary; more Java work; prior art exists (`ajhcs/cameo-mcp-bridge`) |
| **A′** | MCP → **OMG pilot-implementation API server** (`Systems-Modeling/SysML-v2-API-Services`, local, free, Dockerable) | standard-conformant **without any licence**; **headless → ideal for unattended batch runs**; no VPN/licence flakiness | ⚠️ **abandons the industrial-tool premise (D3)** — no MSoSA validation suites / expression evaluation |
| **C** | Hybrid: B for validation/simulation, A for CRUD/query | best use-case coverage | most effort |
| **C′** | Hybrid: A′ for the bulk statistics (headless, fast) + MSoSA (B) for a smaller tool-native case study | rescues throughput *and* keeps the industrial-tool angle | two bridges to build; two result sets to reconcile |

**→ Option B** (13.09.2026): the FH licence covers the **MSoSA desktop tool** (now 2026x, D14) and **no Teamwork Cloud** is known.

⚠️ **Correction (13.09.2026):** "the standard SysML v2 REST API requires TWC" is **only true within the CATIA Magic product line**. The **OMG pilot implementation** ships a free, local API server implementing the same *API and Services* standard → a standard-API MCP bridge is perfectly possible **without TWC** (Option A′), and file-based servers need no server at all. What TWC uniquely provides is the standard API **over an MSoSA-hosted model**.
→ Therefore TWC is not a precondition for "an MCP server for SysML v2"; it is only a precondition for **reaching the live MSoSA model through the standard API** instead of through the Java OpenAPI. Keep this distinction precise in the thesis — it is exactly the kind of claim a reviewer will check.

### ✅ Locked: **Option B** (13.09.2026)
Prof. Voss's standing instruction is to **work with what the FH has access to** → the exposé (sent) and the build target are an **MCP server ↔ MagicDraw/Cameo OpenAPI Java plugin inside MSoSA**. TWC availability is still an open question for Prof. Voss (`03-open-questions.md`); if it turns out to exist, it is an upgrade path, not a replan.

**What this settles**
- Option A (TWC standard API) → related work / future work only; argue tool-agnosticism conceptually, do not build it.
- Option A′ (local pilot-implementation server) → kept only as an **emergency fallback** if the OpenAPI spike (`09-technical-backlog.md`) shows SysML v2 is unreachable through the Java OpenAPI. It would abandon the industrial-tool premise (D3), so it is a last resort, not a plan.
- Framing: **live in-session model state in an industrial tool** — not "repository", no commits/branches.
- Tool-native capabilities available for Validation/Verification and the Phase 2 harness: **validation suites** + the **SysML v2 Evaluation** plugin.

⚠️ **Unavoidable consequence:** every evaluation run (`04-evaluation-design.md`) must go through a **GUI desktop application behind a VPN-gated floating licence**. The throughput bottleneck cannot be engineered away by switching backends — it can only be managed (unattended batch runs, deterministic reset, resumability) or absorbed by descoping. This is now the top risk to the 10.12 cutoff.

- [ ] **Validate Option B is feasible at all** — the Java OpenAPI was built for the UML/SysML v1 metamodel; whether it exposes **SysML v2** elements in 2026x is the single biggest technical unknown (the OpenAPI spike, `09-technical-backlog.md`)

**Consequence for the framing:** without TWC there are no commits/branches, so "persistent *repository* state" becomes **live in-session model state**. That still differentiates cleanly from all the file-based prior work — which is the actual contribution axis — but the wording in the thesis must be precise.

---

## Implementation log (dead ends, limitations, surprises)

Dated entries while building the bridge, harness and benchmark — raw material for the Design and Discussion chapters. One line each: date · what happened · consequence.

| Date | Entry |
|---|---|
