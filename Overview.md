# Overview — Master's Thesis Dashboard

> **Single source of status truth.** Update the checkboxes here whenever something moves.
> Deep detail lives in `notes/` (see §11); this file is the entry point and should always be current.
> Last updated: **12.09.2026**

---

## 1. At a glance

| | |
|---|---|
| **Title** | *Evaluating AI Agent Capabilities in SysML v2 Modeling via an MCP Bridge to Magic Systems of Systems Architect* |
| **Student** | Nassim Awabdy · Matr. 3196909 · FB5 (Elektrotechnik & Informationstechnik), FH Aachen |
| **Supervisor** | Prof. Dr. rer. nat. Sebastian Voss — Modellgetriebene Systementwicklung, Verifikation & Testen · s.voss@fh-aachen.de · +49 241 6009 52129 |
| **Second examiner** | M. Eng. Tim Höner — Datennetze / IT-Sicherheit / IT-Forensik · hoener@fh-aachen.de · +49 241 6009 52122 |
| **Official start** | 01.09.2026 · kickoff meeting 07.09.2026 |
| **Duration** | 20 weeks → **submission ≈ 19.01.2027** |
| **Language** | English (confirm with Prof. Voss) |
| **Repo / branch** | `base-latex` @ `master-thesis` · thesis files at repo root |
| **Template** | `fh-template` (KOMA `scrreprt`), annotated bibliography via `unsrtdineng.bst` |
| **Prior work** | WS seminar paper (1.3): *Mechanisms for Model Consistency — SysML v1 vs v2 guidelines* (`0. Seminar/WS Paper/`, branch `SysML-modeling-guidelines`) |

**Current phase:** Weeks 1–4 — Setup & Exposé.
**Next hard deadline:** **M1 Exposé, 30.09.2026** (max 2 pages body).

---

## 2. The thesis in one paragraph

Prior research on LLMs + SysML v2 is almost entirely **one-shot generation** from natural language, evaluated on small hand-made models, working on **text files**. Nobody has measured what an agent can and cannot do when it works **interactively against a live model inside an industrial modeling tool**, on a **large** model, across the full task spectrum. This thesis builds an **MCP bridge to Magic Systems of Systems Architect (MSoSA)**, uses the **Airbus Apollo 11 SysML v2 model** as system under test, and produces a **capability-and-failure map** across five use cases (Abfragen · Validierung · Verifizierung · Korrektur · Erstellen). *The bridge is the instrument — the evaluation is the contribution.*

**Research question (as in `pages/101expose.tex`):**
> Which SysML v2 modeling tasks can an LLM-based agent perform reliably in an industrial modeling environment (MSoSA) when connected through an MCP bridge, and where do its capabilities break down?

**Hypotheses**
- **H1 (task asymmetry)** — read-only tasks (Abfragen, Validierung) are reliable; write tasks (Korrektur, Erstellen) and Verifizierung degrade with model size and cross-layer dependency depth.
- **H2 (tool semantics)** — exposing tool-native capabilities (validation suites, expression evaluation) as MCP tools beats a thin CRUD wrapper over the SysML v2 API.
- **H3 (model scale)** — findings from small teaching models (GfSE) do not transfer to a large multi-layer model (Apollo 11) without a semantic navigation layer.

> ⚠️ **Keep honest:** arXiv 2609.03718 (CAE agents) found a *generic* harness matches specialized machinery. H2 may well be falsified — that is a valid result and must not be designed away.

---

## 3. Milestones & deadlines

| # | Milestone | Due | Status |
|---|---|---|---|
| M0 | Kickoff with Prof. Voss | 07.09.2026 | ✅ done |
| M1 | **Exposé** (max 2 pages) → `pages/101expose.tex`, PDF to `milestones/` | **30.09.2026** | 🟡 outline done, prose `[TODO]` |
| — | Draft exposé sent to Prof. Voss | ~20.09.2026 | ⬜ |
| — | Weekly group meetings with Prof. Voss start | end Sep / early Oct | ⬜ |
| M2 | Concept / architecture document + bridge decision (A vs B) | ~mid Oct | ⬜ |
| M3 | Working MCP bridge (thin tier + semantic tier) | ~week 9 (≈08.11) | ⬜ |
| M4 | Benchmark with ground truth + fault injection | ~week 13 (≈06.12) | ⬜ |
| M5 | Evaluation runs complete, failure taxonomy coded | ~week 16 (≈27.12) | ⬜ |
| M6 | **Thesis submission** | **≈19.01.2027** | ⬜ |

### Work plan (20 weeks)

| Weeks | Dates | Phase | Deliverable |
|---|---|---|---|
| 1–4 | 07.09 – 04.10 | Setup | Exposé; Apollo 11 imported into MSoSA; MSoSA/TWC API access; literature base |
| 5–9 | 05.10 – 08.11 | Bridge | MCP server (thin + semantic tier); use-case task catalogue v1 |
| 10–13 | 09.11 – 06.12 | Benchmark | task set with ground truth; fault injection; evaluation harness |
| 14–16 | 07.12 – 27.12 | Experiments | runs across arms and LLMs; failure analysis |
| 17–20 | 28.12 – 19.01 | Writing | thesis text, discussion, submission |

> **No slack.** Every week of implementation overrun eats evaluation or write-up. Mitigation: draft related-work + methodology chapters from week 1; Christmas window is for **writing**, not for runs.

**Descoping levers (agreed order of sacrifice):**
1. pass^k with k=3 instead of k=5
2. 1 LLM family instead of 2–3
3. Fewer difficulty levels (drop cross-layer tier for some use cases)
4. Drop optional use cases *Erklären* / *Refactoring* (already optional)
5. Drop the GfSE generalisation set (weakens H3)
6. *Last resort:* drop the thin-vs-semantic ablation (guts H2 — avoid)

---

## 4. Decisions made

| # | Decision | Where decided |
|---|---|---|
| D1 | **System under test:** Airbus **Apollo 11 SysML v2** model (`airbus/apollo-11-sysml-v2`, MPL-2.0, ~7.2 kLOC / 28 files / ~2 000 elements, 5 CoSMA layers). Paper: Helle & Schramm 2026, *Systems Engineering*, DOI 10.1002/sys.70074 | kickoff + `04-model-candidates.md` |
| D2 | **Secondary / generalisation set:** GfSE `SysML-v2-Models` (BSD-3, ~5.1 kLOC across ~15 small models); also source of "bad examples" | same |
| D3 | **Interface:** MCP server bridging LLM agents to **MSoSA** (FH has a licence) — replaces the earlier "wrap the pilot REST API" framing | kickoff |
| D4 | **Use cases:** Abfragen · Validierung · Verifizierung · Korrektur · Erstellen (optional: Erklären, Refactoring) | kickoff |
| D5 | **Evaluation design:** ablation arms (0) no tool / (1) thin CRUD bridge / (2) semantic bridge with tool-native validation & evaluation; fault injection for Korrektur; **evaluator outside the agent loop**; 2–3 LLMs | kickoff + lit. |
| D6 | Second examiner: **Tim Höner** | kickoff |
| D7 | Obsidian vault retired — everything lives in this repo | 12.09.2026 |
| D8 | German use-case names kept as terms (Prof. Voss uses them) | convention |

### Pending decision: bridge option

| Option | Path | Pros | Cons |
|---|---|---|---|
| **A** | MCP → **Teamwork Cloud SysML v2 REST API** (standard endpoints: projects/commits/branches/elements/query) | standard-conformant, tool-agnostic, commits/branches give persistence | needs a TWC licence/instance at FH; generic element-level JSON → semantic layer required |
| **B** | MCP ↔ **MagicDraw OpenAPI Java plugin** in MSoSA (local socket/HTTP) | works with desktop licence only; direct access to validation, evaluation, simulation, diagrams | proprietary; more Java work; prior art exists (`ajhcs/cameo-mcp-bridge`) |
| **C** | Hybrid: B for validation/simulation, A for CRUD/query | best use-case coverage | most effort |

- [ ] **Decide A / B / C** — blocked on the FH licence check (§5)

---

## 5. Blockers & open questions

Ask Prof. Voss / FH IT (ideally at the first weekly meeting):

- [ ] Which **MSoSA version** does the FH have? (SysML v2 needs 2024x Refresh / **2025x+**)
- [ ] Is a **Teamwork Cloud** instance available? (decides bridge A vs B — the SysML v2 REST API is served by TWC, *not* by the desktop client)
- [ ] Is **CATIA Magic SysML v2 Community Edition** (500-element cap) acceptable for development? Apollo 11 has ~2 000 elements → full licence needed for the real model
- [ ] **LLM access / budget** — which providers (OpenAI / Anthropic API vs. local open-weight models)?
- [ ] Confirm **thesis language = English**
- [ ] Page-count expectations for the thesis?
- [ ] Rigour expectation: well-argued framework + pilot evaluation, or statistically solid (pass^k, multiple models)?
- [ ] Any prior/parallel work in his group not to duplicate (MCP, SysML v2 API, agent evaluation)?
- [ ] Is **SysIDE Automator** (Sensmetry, Python API for SysML v2) allowed/available as a helper?

---

## 6. Task board — what I have to do

### 6.1 Now (before 30.09 — Exposé)
- [ ] Write prose for all `[TODO]` sections in `pages/101expose.tex`: Motivation (~150 w), Problem Statement (~150 w), Approach (~150 w around the table), Evaluation Methodology (~150 w)
- [ ] Keep body ≤ 2 pages — verify with `pdfinfo 000report.pdf` (currently **6** pages incl. title + bibliography)
- [ ] Verify the 5 `TODO` bib entries (authors, venue, year) against PDFs/DOIs — `bib/quellen.bib` lines ~78–124: `llm-system-modeling-review`, `nl2sysml`, `kg-hallucination`, `sysforge`, `graphrag-mbse`
- [ ] Verify remaining `TODO` authors: `hw-mcp-benchmark`, `cae-agents`
- [ ] Mark the `[TOP 3]` bib annotations
- [ ] Export to `milestones/Expose-draft.pdf` and send to Prof. Voss (~20.09)

### 6.2 Technical setup (parallel)
- [ ] Add `models/` submodules: `airbus/apollo-11-sysml-v2`, `GfSE/SysML-v2-Models`
- [ ] Parse both with the pilot-implementation jar (reuse GfSE `CI/parse.py`) → baseline syntactic validity = ground truth
- [ ] Clarify MSoSA version / TWC availability → close the A/B/C decision
- [ ] Import Apollo 11 into MSoSA; log every import problem (**first data point for *Validierung***)
- [ ] Spike: reach the model programmatically (TWC REST call *or* MagicDraw OpenAPI hello-world plugin)
- [ ] Create the separate code repo for the MCP bridge; decide language (Python/FastMCP for A, Java-side shim for B)

### 6.3 Reading
- [ ] Read **Helle & Schramm 2026** (Apollo 11) fully → summary in `notes/literature/`, register in `0. Index.md`
- [ ] Read the **SEI/CMU** "Native AI Integration for MBSE" post in full (closest competing work — 3-arm design template)
- [ ] Read **arXiv 2608.26199** (hardware-design MCP benchmark — closest methodological sibling)
- [ ] Read **arXiv 2609.03718** (CAE generic harness — counter-evidence, must engage in discussion)
- [ ] Read **DLR DASC 2025** (elib.dlr.de/214792 — graph traversal limitation; technical motivation for a cache layer)
- [ ] Skim **arXiv 2608.23653** (Pufibara/Modelica — external evaluator principle) and **2609.03230** (requirements-quality LLM benchmark — supports expert criteria over LLM-as-judge)
- [ ] Inspect `Open-MBEE/flexo-mms-sysmlv2-mcp` (35 tools) and `ajhcs/cameo-mcp-bridge` (162 tools, v1/UML) to argue "thin wrapper" concretely

### 6.4 Later (after M1)
- [ ] Use-case task catalogue v1 with 3 difficulty tiers (local / cross-package / cross-layer)
- [ ] Fault-injection script for *Korrektur* (dangling refs, wrong types, broken `satisfy`)
- [ ] Evaluation harness + external evaluator (outside agent loop)
- [ ] Metric implementation: task success, syntactic validity, semantic correctness, collateral damage (model diff), tool-call count / tokens, failure code
- [ ] Chapter scaffolding `pages/2xx-*.tex`

---

## 7. Design: use cases, tasks & metrics

| Use case | Example task on Apollo 11 | Ground truth / metric | Apollo 11 hook |
|---|---|---|---|
| **Abfragen** (query) | "Which technical components satisfy requirement X?" | exact set match vs. model query | 5 layers, cross-layer chains: need → mission req → functional req → function → logical → technical |
| **Validierung** (validation) | "Is package P well-formed and CoSMA-conformant?" | tool validation suite results | large enough to hide well-formedness issues; CoSMA base types (`:>`) give guideline checks |
| **Verifizierung** (verification) | "Is mass-budget requirement R satisfied by current values?" | expression evaluation in tool | `requirement` + `satisfy`/`verify`; `Analysis/CalculationsPackage.sysml` |
| **Korrektur** (correction) | repair injected faults | fault-repair rate, no collateral change | inject faults into a copy → measure repair |
| **Erstellen** (creation) | add missing technical component with ports + satisfy links | syntactic validity + expert rubric | model is deliberately a "scaffold" with intended gaps |
| *Erklären* (optional) | summarise a subsystem for a stakeholder | expert rubric | — |
| *Refactoring* (optional) | move/rename elements consistently | diff + validation | — |

### Evaluation arms (ablation, cf. SEI 3-arm design)
- **Arm 0** — no tool, textual file in context only
- **Arm 1** — thin CRUD bridge over the SysML v2 API
- **Arm 2** — semantic bridge: tool-native validation + expression evaluation + task-oriented tools

### Metric set
task success (binary) · pass^k (k=5, degrade to 3) · syntactic validity (metamodel conformance) · semantic correctness (expert acceptance criteria + ground-truth diff) · trace preservation (no orphaned requirements / broken satisfy) · collateral damage (model diff / edit distance) · tool efficiency (call overhead ratio) · failure code (diagnostic, unscored)

### Failure modes to watch for
conditional-reasoning inversion · multi-step degradation (silent stop) · semantic distractor · parameter hallucination · tool over-calling · traversal exhaustion · few-shot inaction (arXiv 2608.26199) · context-accumulation degradation

---

## 8. Landscape — what already exists (related work)

**Nothing bridges agents to SysML v2 *in MSoSA/TWC*, and nothing evaluates agent capability systematically across use cases on a large model.** That is the gap.

**API / live-repository side (thin, unevaluated):**
`Open-MBEE/flexo-mms-sysmlv2-mcp` (35 tools, 1:1 OpenAPI) · `Open-MBEE/sysmod-sysmlv2-api` (17 SYSMOD tools, WIP) · `redsteve/SysML-v2-API-MCP-Server` (C++, early) · Dassault commercial CATIA MBSE MCP ("200% productivity", unvalidated)

**File / LSP side (where all semantic-layer activity is):**
`daltskin/sysml-v2-lsp` (`sysml-mcp`, 7 tools) · `elan8/spec42` · `sysml2kit` (PyPI, 9 MCP tools) · `chouswei/codebase-sysmledgraph` (Kuzu graph: cypher/context/impact) · `JamieD.sysml-v2-support` VS Code extension

**v1/UML bridges (prior art to cite):**
`ajhcs/cameo-mcp-bridge` (162 tools via Cameo Java API) · `msatyendraece4444/compLete_ms` (ChatGPT ↔ MagicDraw via Python RAG + Java plugin)

**Closest competing / parallel work:**
| Work | Why it matters | How we differ |
|---|---|---|
| **SEI/CMU** "Native AI Integration for MBSE" | Controlled 3-arm SysML v2 benchmark (baseline / validation loop / full tooling); validation loop → 0 syntax errors; knowledge tooling 71.7 → 94.1 pattern score | Entirely **file-based** (textual + Syside LSP); their MCP server is a *knowledge-retrieval* service, not a model repository. No live state, no commits, no traversal |
| **arXiv 2608.26199** (hardware MCP benchmark) | Methodological sibling: purpose-built MCP server + benchmark + ablations, 7 models | Different domain; no semantic graph layer |
| **arXiv 2609.03718** (CAE agents) | ⚠️ Counter-evidence: generic harness ≈ specialized machinery; domain knowledge > scaffolding | Directly tested by our Arm 1 vs Arm 2 ablation |
| **arXiv 2608.23653** (Pufibara/Modelica) | 232-task benchmark, evaluator outside agent loop, persistent state | Adopt the external-evaluator principle |
| **DLR DASC 2025** | SysML v2 API cannot traverse relationships (>10 s/query at 200K elements / 16M relations) | Technical motivation for the semantic/cache layer; `DLR-FT/sysml-v2-sql` is a reference implementation |

**Read papers (summaries in `notes/literature/`):**
1. LLMs for System Modeling: Current State (SLR of 20 papers; SysML v1→v2 prompting; MCP)
2. Generating SysML v2 from NL Requirements (4-component prompting; automotive)
3. Mitigating Hallucinations via Tri-Layered KG (satellite case study)
4. SysForge — knowledge-augmented conversational multi-agent generation + refinement
5. Enabling Humans and AI to Retrieve Information from System Architectures (GraphRAG + Neo4j + RFLP; 93% accuracy)

---

## 9. Anticipated pushback → answers

| Question | Answer |
|---|---|
| "MCP servers already exist — what's novel?" | The gap is the **evaluation**, not the server. None of the existing servers has been benchmarked, and none targets SysML v2 in an industrial tool (MSoSA/TWC). |
| "Is ~4.5 months enough to build *and* evaluate?" | Yes with descoping (§3): reuse Apollo 11 instead of authoring models, fewer difficulty tiers, one LLM family if needed. Writing overlaps from week 1. |
| "How do you measure semantic correctness?" | Expert-defined acceptance criteria per task + tool-native metamodel/validation conformance + diff against ground truth. Not LLM-as-judge alone (cf. arXiv 2609.03230: best model finds only 47% of expert issues). |
| "What if the agent fails/succeeds at everything?" | Either outcome is the result — the contribution is the capability map + failure taxonomy. Difficulty tiers exist precisely to locate the boundary. |
| "Why interactive agents and not generation?" | Generation is well covered. Persistent tool-using agents on live models is what industry is deploying, with zero published evidence. |

---

## 10. Repo & workflow

```
base-latex/                    ← repo root IS the thesis workspace (branch: master-thesis)
├── Overview.md                ← THIS FILE — status dashboard, keep current
├── AGENTS.md                  ← master prompt / context (CLAUDE.md is a symlink)
├── 000report.tex              ← main file for milestone documents (M1 = Exposé)
├── Makefile                   ← make | make open | make watch | make clean
├── unsrtdineng.bst            ← bib style (must sit next to 000report.tex)
├── pages/001titlepage.tex
├── pages/101expose.tex        ← Exposé (outline + word budgets in comments)
├── bib/quellen.bib            ← annotated bibliography (entries with TODO need verification)
├── pic/                       ← figures (FHAC.jpg)
├── milestones/                ← exported PDFs (Expose-draft.pdf, …)
├── notes/                     ← detail notes (see §11)
├── 0. Templates/              ← fh-template (do not edit; copy from it), conference-template
└── 0. Seminar/                ← previous seminar paper + its milestones (reference only)
```
*Planned:* `models/` (Apollo 11 + GfSE submodules), `pages/2xx-*.tex` (thesis chapters), separate repo for the MCP bridge.

**Conventions**
- Commit small, prefixes `feat:` / `fix:` / `docs:`. `000report.pdf` and `milestones/*.pdf` are committed on purpose; other build artefacts are ignored.
- Build: `make` (latexmk, TeX Live 2025). Page count: `pdfinfo 000report.pdf`. Text: `pdftotext -layout`.
- Bibliography: every entry has a `note = {…}` annotation (1–3 sentences on relevance); top three get `[TOP 3]`. **Never invent authors/venues/years** — leave `TODO` and verify from PDF/DOI.
- Exposé: ≤ 2 pages body (title page + bibliography excluded). Structure: Motivation → Problem → RQ & hypotheses → Approach → Evaluation → Work plan.
- Style: concise academic English; German use-case names kept as terms.
- Web research: configured search providers may be down; `anysearch` / `duckduckgo` work as explicit fallbacks.

**Session start checklist**
1. `git status && git log --oneline -5` on `master-thesis`
2. Read this file (§5 blockers, §6 task board)
3. Do the work; then update §6 / §12 and commit

---

## 11. Source notes (archive / deep dives)

This file consolidates everything actionable. The originals stay for detail and citations:

| File | Contains |
|---|---|
| `notes/01-thesis-idea.md` | Full pre-kickoff idea write-up: repositioned contribution, L1–L6 task taxonomy, 8-dimension evaluation framework, literature anchors. *Note: the "semantic MCP server over the pilot REST API" framing is superseded by the MSoSA bridge (D3); the taxonomy and metrics remain valid input.* |
| `notes/02-kickoff-prep.md` | German plain-language pitch, compressed timeline proposal, descoping levers, questions for Prof. Voss, anticipated pushback |
| `notes/03-kickoff-results.md` | Kickoff decisions + open questions (source for §4/§5) |
| `notes/04-model-candidates.md` | Full 6-model comparison table, MSoSA/TWC API facts, bridge options A/B/C, prior art |
| `notes/literature/0. Index.md` | Index of paper summaries — register every new summary here |
| `notes/literature/update-sep-2026-new-servers-and-research.md` | Sep-2026 landscape update: SEI, hardware-MCP, CAE counter-evidence, new servers |
| `notes/literature/*.md` | Individual paper summaries (5 read so far) |

---

## 12. Log

| Date | Event |
|---|---|
| 07.09.2026 | Kickoff with Prof. Voss — D1–D6 decided |
| 12.09.2026 | Branch `master-thesis` created; model research (Apollo 11 chosen); MSoSA API facts; exposé outline + bib seed; Obsidian vault retired |
| 12.09.2026 | Repo reorganised: thesis files → root, templates → `0. Templates/`, seminar paper → `0. Seminar/` |
| 12.09.2026 | All notes consolidated into `Overview.md` (this dashboard) |
