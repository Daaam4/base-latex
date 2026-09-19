# Decisions (D1–D14)

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Decisions made

| # | Decision | Where decided |
|---|---|---|
| D1 | **System under test:** Airbus **Apollo 11 SysML v2** model (`airbus/apollo-11-sysml-v2`, MPL-2.0, ~7.2 kLOC / 28 files / ~2 000 elements, 5 CoSMA layers). Paper: Helle & Schramm 2026, *Systems Engineering*, DOI 10.1002/sys.70074 | kickoff + `06-tooling-msosa.md` |
| D2 | **Secondary / generalisation set:** GfSE `SysML-v2-Models` (BSD-3, ~5.1 kLOC across ~15 small models); also source of "bad examples" | same |
| D3 | **Interface:** MCP server bridging LLM agents to **MSoSA** (FH has a licence) — replaces the earlier "wrap the pilot REST API" framing | kickoff |
| D4 | **Use cases:** Abfragen · Validierung · Verifizierung · Korrektur · Erstellen (optional: Erklären, Refactoring) | kickoff |
| D5 | **Evaluation design:** ablation arms (0) no tool / (1) thin CRUD bridge / (2) semantic bridge with tool-native validation & evaluation; fault injection for Korrektur; **evaluator outside the agent loop** | kickoff + lit. |
| D6 | Second examiner: **Tim Höner** | kickoff |
| D7 | Obsidian vault retired — everything lives in this repo | 12.09.2026 |
| D8 | German use-case names kept as terms (Prof. Voss uses them) | convention |
| D9 | **LLM access: own Anthropic Max subscription** → Claude family. Evaluation is single-family; a capability-tier contrast (e.g. Opus vs. Sonnet) replaces cross-vendor comparison. Written up as a threat to validity (§5.3) | 13.09.2026 |
| D10 | **Thesis language English**; **min. 40 pages** | confirmed 13.09.2026 |
| D13 | **Bridge = Option B** (MCP ↔ MagicDraw OpenAPI Java plugin in MSoSA) — the exposé is written for this. Standing instruction: work with what the FH has access to. TWC availability asked *after* the exposé (upgrade path, not a replan); A′ = emergency fallback only | 13.09.2026 |
| D12 | **Rigour target: statistically solid results**, not a pilot study → paired design across arms, k=5, 36-task target, pre-registration, inter-rater kappa (`.pi/context/04-evaluation-design.md` (statistical design)). Cost: task breadth + a mandatory unattended batch harness | 13.09.2026 |
| D11 | **Tooling licence scope: MSoSA only.** No TWC, no SysIDE licence assumed. SysIDE Automator only if essential / clearly advantageous — decided later, not designed into the exposé | 13.09.2026 |
| D14 | **Tool build = MSoSA 2026x** (access granted by Prof. Voss, 13.09.2026) — supersedes the seminar-era 2024x Refresh2 HF1. Native SysML v2; 2024x-specific caveats (feature flag, incubator-grade v2) dropped. Exact build + API surface recorded in `06-tooling-msosa.md` A.0 after install. The exposé names 2026x as the tool version. Alternatives rejected: staying on 2024x (two generations behind on the feature under test) | 13.09.2026 |

### Pending decision: bridge option

| Option | Path | Pros | Cons |
|---|---|---|---|
| **A** | MCP → **Teamwork Cloud SysML v2 REST API** (standard endpoints: projects/commits/branches/elements/query) | standard-conformant, tool-agnostic, commits/branches give persistence | needs a TWC licence/instance at FH; generic element-level JSON → semantic layer required |
| **B** | MCP ↔ **MagicDraw OpenAPI Java plugin** in MSoSA (local socket/HTTP) | works with desktop licence only; direct access to validation, evaluation, simulation, diagrams | proprietary; more Java work; prior art exists (`ajhcs/cameo-mcp-bridge`) |
| **A′** | MCP → **OMG pilot-implementation API server** (`Systems-Modeling/SysML-v2-API-Services`, local, free, Dockerable) | standard-conformant **without any licence**; **headless → ideal for 810 unattended runs** (`.pi/context/04-evaluation-design.md` (statistical design)); no VPN/licence flakiness | ⚠️ **abandons the industrial-tool premise (D3)** — no MSoSA validation suites / expression evaluation, so the H2 "tool-native semantics" arm loses its content |
| **C** | Hybrid: B for validation/simulation, A for CRUD/query | best use-case coverage | most effort |
| **C′** | Hybrid: A′ for the bulk statistics (headless, fast) + MSoSA (B) for a smaller tool-native case study | rescues throughput *and* keeps the industrial-tool angle | two bridges to build; two result sets to reconcile |

**→ Option B is the working assumption** (13.09.2026, from the seminar tool material — §11): the FH has a **desktop/portable MSoSA 2024x Refresh2 HF1 (Academic)**, and **no Teamwork Cloud is mentioned**.

⚠️ **Correction (13.09.2026):** "the standard SysML v2 REST API requires TWC" is **only true within the CATIA Magic product line**. The **OMG pilot implementation** ships a free, local API server implementing the same *API and Services* standard → a standard-API MCP bridge is perfectly possible **without TWC** (Option A′), and file-based servers need no server at all. What TWC uniquely provides is the standard API **over an MSoSA-hosted model**.
→ Therefore TWC is not a precondition for "an MCP server for SysML v2"; it is only a precondition for **reaching the live MSoSA model through the standard API** instead of through the Java OpenAPI. Keep this distinction precise in the exposé — it is exactly the kind of claim a reviewer will check.

### ✅ Locked for the exposé: **Option B** (13.09.2026)
Prof. Voss's standing instruction is to **work with what the FH has access to** → the exposé is written for an **MCP server ↔ MagicDraw/Cameo OpenAPI Java plugin inside MSoSA**. The TWC availability question is **deferred to after the exposé** (`.pi/context/03-open-questions.md` (deferred)); if it turns out to exist, it is an upgrade path, not a replan.

**What this settles**
- Option A (TWC standard API) → related work / future work only; argue tool-agnosticism conceptually, do not build it.
- Option A′ (local pilot-implementation server) → kept only as an **emergency fallback** if the the OpenAPI spike (`.pi/context/09-technical-backlog.md`) shows SysML v2 is unreachable through the Java OpenAPI. It would abandon the industrial-tool premise (D3), so it is a last resort, not a plan.
- Framing: **live in-session model state in an industrial tool** — not "repository", no commits/branches.
- H2's semantic arm draws on the tool-native capabilities we *do* have: **validation suites** + the **SysML v2 Evaluation** plugin.

⚠️ **Unavoidable consequence:** all ~810 evaluation runs (`.pi/context/04-evaluation-design.md` (statistical design)) must go through a **GUI desktop application behind a VPN-gated floating licence**. The throughput bottleneck cannot be engineered away by switching backends — it can only be managed (unattended batch runs, deterministic reset, resumability) or absorbed by descoping. This is now the top risk to the 10.12 cutoff.

- [ ] **Validate Option B is feasible at all** — the 2024x Java OpenAPI was built for the UML/SysML v1 metamodel; whether it exposes **SysML v2** elements is the single biggest technical unknown (the OpenAPI spike (`.pi/context/09-technical-backlog.md`))

**Consequence for the framing:** without TWC there are no commits/branches, so "persistent *repository* state" becomes **live in-session model state**. That still differentiates cleanly from all the file-based prior work — which is the actual contribution axis — but the wording in the exposé must be precise.

---
