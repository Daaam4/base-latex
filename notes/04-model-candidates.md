# Model Candidates & Tool Bridge — Research 12.09.2026

## 1. Candidate SysML v2 models (open source, textual notation)

| # | Model | Origin | Size | Licence | Content | Verdict |
|---|---|---|---|---|---|---|
| **1** | **Apollo 11 Mission** — `github.com/airbus/apollo-11-sysml-v2` | Airbus Central R&T (Philipp Helle, Gerrit Schramm). Paper: *"Fly me to the Moon – Modeling Apollo 11 Using SysML v2"*, INCOSE **Systems Engineering** journal, DOI 10.1002/sys.70074 | **28 files, ~7 200 LOC, ~2 000 definitions/usages** | MPL-2.0 | 5-layer CoSMA framework (Purpose / Operational / Functional / Logical / Technical): stakeholders, needs, mission & functional & technical requirements, capabilities, mission phases (states), operations, functions, logical & technical components, ports, individuals, analysis/calc packages, views | ✅ **Primary choice.** Explicitly built as a "benchmark for next-generation MBSE tools"; contains requirements + satisfy/verify traceability + states + calcs → covers all five use cases. Citable journal paper. Deliberately incomplete "scaffold" → natural source of *Erstellen*/*Korrektur* tasks. |
| 2 | **GfSE SysML-v2-Models** — `github.com/GfSE/SysML-v2-Models` | GfSE / RWTH SE (contact tautz@se-rwth.de) | ~5 100 LOC total, spread over ~15 small models (largest: VehicleModel 598 LOC, DroneModelLogical 455, EveOnline Mining Frigate ~2 500 over 17 files) | BSD-3 | Curated collection; explicitly meant "to help train LLMs" and "for tool creators to apply smart algorithms" | ✅ **Secondary / control set.** Small, self-contained models — good for (a) unit-level test cases, (b) checking that findings generalise beyond Apollo 11, (c) "bad examples" for Korrektur. Has a CI parser (`CI/parse.py` with pilot-impl jar) we can reuse for ground-truth validity. |
| 3 | GfSE MBSE-WG example model (Staubsaugroboter / robot vacuum) — `mbse.gfse.org/sysml-v2.html` | GfSE working group MBSE | small | ? | working-group teaching model | ⚠️ check size/licence; likely too small |
| 4 | OMG SysML-v2-Release example models (`Systems-Modeling/SysML-v2-Release/sysml/src/examples`) | OMG / pilot implementation | many small examples (Vehicle, Camera, Rover…) | LGPL | canonical language examples | 🟡 use as **syntax reference / few-shot** material, not as system-under-test |
| 5 | Elan8 examples (robot vacuum reference model, astronomy model) | Elan8 (commercial spec42 vendor) | medium | ? | reference + simulation | 🟡 backup |
| 6 | Open-MBEE spacecraft example (`SysML-v2-Applications-and-Examples`) | OpenMBEE / JPL | small notebook-based | Apache | | 🟡 backup |

**Decision proposal:** Apollo 11 as the *system under test* for all use-case experiments; GfSE collection as secondary/generalisation set.
Both are pure `.sysml` textual notation → must be **imported into MSoSA** (2025x supports textual import) and pushed to Teamwork Cloud.

### Why Apollo 11 fits the use cases

| Use case (Prof. Voss) | Apollo 11 hook |
|---|---|
| Abfragen | 5 layers, cross-layer traceability chains (need → mission req → functional req → function → logical → technical) |
| Validierung | large enough to hide well-formedness/consistency issues; CoSMA base types (`:>`) give guideline-conformance checks |
| Verifizierung | `requirement` + `satisfy`/`verify` relations; `Analysis/CalculationsPackage.sysml` for constraint evaluation |
| Korrektur | inject faults (dangling references, wrong types, broken satisfy) into a copy → measure repair |
| Erstellen | model is explicitly a "scaffold" with intended gaps → ask agent to fill (e.g. missing Technical components, new requirements) |

## 2. Tool bridge: Magic Systems of Systems Architect (MSoSA)

Facts from No Magic documentation (SysML v2 Solution page, 2026x Refresh1):

- CATIA Magic / Cameo (incl. MSoSA) SysML v2 solution claims **100 % metamodel conformance**, two-way textual ⇄ graphical sync, **model validation suites** (KerML/SysML rules + custom rules), **model evaluation** (expression language, requirement verification), **simulation** (state machines).
- **Standard SysML v2 REST API** ("API and Services" spec) is exposed by **Teamwork Cloud (TWC)** — *not* by the desktop client alone. TWC also keeps the legacy server REST API. Extra "Model Evaluation services" API is home-grown.
- **MagicLab** (2026x) = web-based read-only SysML v2 model reader with REST APIs.
- Free **Community Edition** (max 500 major elements) exists for learning — useful for dev, too small for Apollo 11.
- Desktop tool has the classic **MagicDraw OpenAPI (Java)** — plugins can read/write the live model in the running client.

### Bridge options

| Option | Path | Pros | Cons |
|---|---|---|---|
| **A** | MCP server → **TWC SysML v2 REST API** (standard endpoints: projects/commits/branches/elements/query) | standard-conformant → tool-agnostic; matches original thesis idea; commits/branches give persistence | needs TWC licence/instance at FH; API is generic (element-level JSON) → thin wrapper is "dumb", semantic layer needed |
| **B** | MCP server ↔ **Java plugin in MSoSA (OpenAPI)** via local socket/HTTP | works with desktop licence only; access to validation, evaluation, simulation, diagrams | proprietary; more Java work; prior art exists (see below) |
| **C** | Hybrid: B for validation/simulation, A for CRUD/query | best coverage of use cases | most effort |

### Prior art (must cite in related work)

- **`ajhcs/cameo-mcp-bridge`** — MCP server talking to Cameo's Java API via embedded plugin; 162 tools (query, create, modify, validate, visualise) — **SysML v1/UML**. Its README lists a "SysML v2 API MCP Server (connects to SysML v2 REST API, tool-agnostic) — early" as a separate item.
- **`msatyendraece4444/compLete_ms`** — ChatGPT ↔ MagicDraw/Cameo via Python middleware (RAG) + Java MCP plugin: validate, complete, accelerate models (v1).
- Dassault 3DSwym post "SysML v2 REST API Demo – Querying" (MBSE + AI workflow using the TWC SysML v2 API).
- File-based servers (sysml-v2-lsp/sysml-mcp, spec42, sysml2kit, codebase-sysmledgraph) — see `literature/update-sep-2026-new-servers-and-research.md`.

→ **Gap:** no MCP bridge exists for **SysML v2 in MSoSA/TWC**, and none evaluates agent capabilities systematically across use cases on a large model.

## 3. Immediate TODOs

- [ ] Clone Apollo 11 + GfSE repos into `models/` (git submodules) and parse both with the pilot-implementation jar (GfSE `CI/parse.py`) → confirm syntactic validity as ground truth.
- [ ] Confirm FH MSoSA version + TWC availability (→ decides option A vs B).
- [ ] Import Apollo 11 into MSoSA; note import problems (first data point for *Validierung*).
- [ ] Read Helle & Schramm (2026) fully; add to bib.
