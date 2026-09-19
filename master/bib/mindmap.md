# Literature mind map — main subjects

> Working diagram (not thesis content). One root, two main points (MBSE, AI), each with their
> own children. Source-level leaves (theme → bib key) get added under each branch as literature
> research is grouped — see the "Quick reference by theme" table in `0. Index.md` for the current
> theme → source mapping to fold in here branch by branch.
>
> Renders directly in any Mermaid-aware viewer (VS Code Markdown preview with a Mermaid
> extension, GitHub, GitLab, Obsidian, mermaid.live). This file is the single source of truth.

```mermaid
flowchart TD
    Root(["AI Agents in SysML v2 Modeling<br/>MCP Bridge to MSoSA"])

    Root --> MBSE["MBSE"]
    Root --> AI["AI"]

    MBSE --> SysMLv2["SysML v2"]
    MBSE --> MSoSA["MSoSA"]
    MBSE --> EvalFW["MBSE / SysML v2<br/>Evaluation Framework"]

    SysMLv2 --> APIQuery["API Query Limits"]

    EvalFW --> CRUDOps["CRUD Operations"]
    EvalFW --> Verification["Verification<br/>(ISO 15288)"]
    EvalFW --> Validation["Validation<br/>(ISO 15288)"]

    AI --> MCP["MCP"]
    AI --> Harness["AI Harness"]

    classDef root fill:#ffffff,stroke:#757575,stroke-width:2px,color:#1a1a1a,font-weight:bold;
    classDef mbse fill:#FFB575,stroke:#CC7830,stroke-width:2px,color:#542700,font-weight:bold;
    classDef mbseChild fill:#FFE6D1,stroke:#CC7830,stroke-width:1.5px,color:#542700;
    classDef mbseLeaf fill:#FFF1E5,stroke:#CC7830,stroke-width:1px,color:#542700;
    classDef ai fill:#9CE6FF,stroke:#2C97BB,stroke-width:2px,color:#1C4657,font-weight:bold;
    classDef aiChild fill:#D6F5FF,stroke:#2C97BB,stroke-width:1.5px,color:#1C4657;

    class Root root;
    class MBSE mbse;
    class AI ai;
    class SysMLv2,MSoSA,EvalFW mbseChild;
    class CRUDOps,Verification,Validation,APIQuery mbseLeaf;
    class MCP,Harness aiChild;
```

**Open item:** "Delete" within CRUD Operations is flagged — keep as a sub-case only if it turns
out to be a non-trivial capability to evaluate; drop otherwise.

## Sources per leaf (so far)

- **MBSE** (node): `incose2007mbsevision` — canonical MBSE definition (INCOSE SE Vision 2020).
- **AI** (node): `dehart2024llm` — origin paper of the whole LLM x SysML v2 topic (July 2024): SysML v2's
  English-like textual syntax + concurrent LLM maturation make conversational model interaction
  feasible, LLM as interpretive layer replacing API expertise. Three OpenAI Assistants-API case
  studies (beam-model edit via LLM-generated regex/Python directly on the text file, no structured
  tool call; Flask `/ask` endpoint for conversational querying, e.g.\ von Mises stress from prose
  boundary conditions; Jupyter-notebook requirement validation against a block model, correctly
  traversing Definition/Usage and flagging a failed requirement) — single-run proofs of concept,
  no ground truth, explicit warning on automation bias/overreliance. Predates MCP, so sits above
  the MCP/Harness leaves rather than in either; also the earliest instance of the "no structured
  tool, LLM edits text directly" pattern the thesis's no-tool/thin-bridge ablation arms contrast
  against.
- **MBSE / SysML v2 Evaluation Framework** (EvalFW, node level — closest *evaluated* work, direct
  ablation template): `fresemann2025review` — structured literature review of 20 LLM-for-
  system-modeling publications; supplies the **task taxonomy** (creation/analysis/modification/
  reformulation) this whole EvalFW node and its CRUD/Verification/Validation children are mapped
  onto, points to MCP as the emerging mechanism for supplying engineering context beyond
  prompting-only methods, and explicitly flags the field's lack of standardized, comparable
  evaluation criteria — the same gap `bouamra2025systemp`/`quast2026graphrag` independently name
  below. `sei-native-ai` — controlled 3-arm SysML v2 benchmark (baseline / CLI
  validation loop / full MCP-knowledge + skills tooling), 8 tasks x 2 scales, Claude Opus 4.6.
  Validation alone kills syntax errors but barely moves a modeling-pattern score (78.3→ 71.7);
  curated knowledge + skills raises it 71.7→94.1. This thesis's own no-tool/thin-bridge/semantic-
  bridge arms mirror this design directly. File-based (Syside LSP), so the thesis differentiates
  on the live-model / industrial-tool axis. [TOP 3]
- **SysML v2** (child): `boelsen2025guidelines`, `omg-kerml` — foundations. `bouamra2025systemp`
  independently corroborates the corpus-scarcity fact that shapes our model choice: the only two
  available SysML v2 example sources are the Pilot-Implementation test suite and
  `GfSE/SysML-v2-Models`, <150 scenarios total — supports using Apollo 11 (large instrument,
  because nothing comparable at scale exists) with GfSE as the secondary/generalisation set.
- **API Query Limits** (leaf under SysML v2): `ahlbrecht2025mbsqle` — the standard
  SysML v2 API query model features no direct graph traversal, leading to performance
  bottlenecks; proposes SQLite as a traversable intermediate representation. Motivates querying
  inside the tool / a semantic layer in the bridge rather than going through the REST API.
  `bazzal2026mcpmbse` — builds its MCP framework directly on this same standard API (no
  traversal layer added); pairs with Ahlbrecht as the "Option A" contrast to this thesis's
  MSoSA-internal "Option B" attachment point.
- **Verification (ISO 15288)**: `iso-15288`, `molnar2024formalverification`, `cibrian2025validation`,
  `ratzke2025constraints`. All six non-ISO candidates were independently audited (evidence-auditor
  subagents, 19.09.2026) against the ISO 15288 definitions and unanimously verdicted
  **Verification**, despite four of them self-labeling their method "validation" in the title,
  abstract, or body. Curated down 19.09.2026 to the 3 most valuable: Molnar (broadest tool
  landscape), Cibrian (practical tool + clearest conflation example), Ratzke (explains the native
  KerML-CSP mechanism, complements `omg-kerml`/`boelsen2025guidelines`). Removed: Zavada
  (redundant conflation example), Kausch (Isabelle theorem-proving, tangential to an agent/MCP
  workflow), Lu (SysML v1, not v2). See `bib/quellen.bib` notes for per-paper quotes/rationale.
- **Validation (ISO 15288)**: `iso-15288` only. **Open gap** — no reviewed source performs actual
  ISO-validation (behavioral simulation or operational-scenario execution against
  stakeholder/business objectives). Worth stating explicitly in related work, or finding a
  genuine validation source before the thesis leans on this leaf.
- **CRUD Operations** (leaf under EvalFW; merges the former Create/Patch/Delete/Query leaves —
  19.09.2026, since all four are just verbs on the same model-element API and the source overlap
  between them was already heavy). Also carries the branch's **gap citation**: `bouamra2025systemp`
  concludes verbatim that "assessing the quality of generated SysML v2 models remains constrained
  by the absence of standard benchmarks" — the reason this whole EvalFW node exists.
  `quast2026graphrag` independently states the same gap for QA-over-MBSE specifically ("lack of
  standardized benchmarks") — a second, unrelated group reaching the same conclusion.
  - *Create* (= *Erstellen*): `dehn2025nl2sysml` — **primary reference for this leaf.**
    Four-component structured prompting (role/goal, ontology description, few-shot examples,
    NL requirements set) for NL→SysML v2 generation, evaluated on an automotive electric-window-
    opener case across four incremental prompting setups with precision/recall/F1 (information
    extraction), traceability coverage, syntax pass/fail, and qualitative semantics scores,
    averaged over 3 runs each. Ontology improves traceability but needs few-shot examples for
    syntactic correctness; few-shot examples are essential for valid SysML v2 output; structured
    prompting trades quality for token/runtime cost. Weak spot: logical-to-physical element
    mapping stays unstable. File-based generation without a modelling tool — the thesis's
    element-level metric template for *Erstellen*, contrasted against the live-tool/MSoSA
    attachment point. `qualis2025hallucination` — tri-layer knowledge graph (SysML pattern KG /
    domain-specific KG / auto-generated system-specific KG) feeding reusable prompt templates to
    ground generation against hallucinated constructs; satellite-system case study, manually
    curated ground-truth dataset (Average Structure/Semantic Scores, Consistency Ratio).
    Structurally valid models reliably, but semantic fidelity/determinism remain limited —
    motivates grounding the agent in the *live* model/tool state rather than a hand-built static
    KG, the design choice this thesis makes instead. `bazzal2026mcpmbse` — "model creation tools" class + case study 1
    (agentic use-case-diagram generation: create use case → query/create actor → create
    association). Demonstration only, no ground truth or metrics. `bouamra2025systemp` —
    four-agent NL→SysML-v2 pipeline (spec extraction → template skeleton → completion →
    parse-repair loop); ablation shows template scaffolding lifts syntax convergence from 1/5 to
    4/5 scenarios. Syntax-only, no semantic ground truth — this is exactly the gap the thesis's
    *Erstellen* metric (syntactic validity + expert rubric) closes. `sei-native-ai` — the 8-task
    generation benchmark itself (worked 4-drone-swarm example: 0 syntax errors, 97.2/100 pattern
    score, yet separation/lost-link parameters and requested components silently drift from the
    prompt) — the clearest available illustration of "syntactically valid but wrong", directly
    motivating the expert-rubric half of the *Erstellen* metric alongside syntactic validity.
  - *Patch* (= *Korrektur*): `alshami2026faultloc` — syntactic-vs-semantic fault distinction +
    KG-driven systematic fault injection is the model for our fault taxonomy/injection method on
    Apollo 11; plain-LLM repair rate <3 % is the no-tool-arm baseline expectation.
    `wu2025sysforge` — multi-agent generate-validate-refine repair loop, Pass@1/BLEU.
    `bazzal2026mcpmbse` — "model modification tools" class + case study 2 (signal-redundancy
    optimization); architecture citation only (no fault-repair evaluation), weaker fit than the
    above two.
  - *Query* (= *Abfragen*): `quast2026graphrag` — **primary reference for this leaf.** GraphRAG
    multi-agent system (Supervisor + Graph Query Agent) over a Neo4j graph parsed from SysML v2
    text, schema'd by RFLP; hybrid graph+vector indexing, Cypher queries. Evaluated on a synthetic
    battery-EV model with a zero/one-hop vs.\ multi-hop QA dataset across 4 LLMs — best model
    (Gemini-2.5-flash-preview) reaches **93\% overall / 90\% multi-hop accuracy**. Real ground-
    truth evaluation, unlike the other CRUD entries so far — the accuracy-metric template for the
    *Abfragen* use case. Own stated limits: synthetic (not industrial-scale) model, metamodel-
    specific parser, no user studies. The thesis queries the live tool/model state directly rather
    than a derived, pre-built graph. `bazzal2026mcpmbse` — "model analysis tools" class + case
    study 2's query-vector-DB / query-model steps. Demonstration only, weaker fit than Quast.
  - *Delete*: no sources yet — open item, see above.
- **MCP** (child under AI): `bazzal2026mcpmbse` — Fraunhofer
  IEM/HNI/FAU/Audi framework implementing MCP servers directly on the standard SysML v2 API
  (C#.NET, open source at `github.com/hni-ase/SysMLV2-mcp`); closest scientific competing work.
  [TOP 3] `sei-native-ai` — contrasting MCP design point: their repository-local MCP server is a
  **knowledge-retrieval** service over curated Markdown, not a model-editing/model-repository
  interface. Good pairing with Bazzal to frame the design space: MCP-as-model-CRUD (Bazzal) vs.
  MCP-as-knowledge-base (SEI) vs. this thesis's MCP-as-live-tool-bridge (both CRUD *and*
  tool-native validation, inside MSoSA). [TOP 3] `hasan2026mcpsmells` — empirical study of 856
  MCP tools across 103 servers: 97.1\% of tool descriptions carry at least one "smell" (56\%
  fail to state purpose); augmenting all description components lifts task success by a median
  5.85 pp but costs +67\% execution steps, with 17\% regressions. Supplies the description-
  quality rubric for the bridge's own tools, and flags a **confound to control** between the
  thin- and semantic-bridge ablation arms — description quality must be held constant so the
  semantic arm doesn't win merely on better-written tool text.
- **AI Harness** (child under AI — first source in this leaf): `bouamra2025systemp` — four
  specialised agents (spec extraction, template generation via a rule-based Jinja2 tool, writing,
  Java-parser-backed error feedback) orchestrated as a fixed pipeline with one iterative
  writer↔parser repair loop; not MCP, but a directly comparable harness-design precedent for
  structuring our own agent's tool-use loop, and for the no-tool vs.\ tool-arm ablation (their
  own ablation is structurally the same idea: scaffolding present vs.\ absent). `sei-native-ai` —
  10 version-controlled "skill" files (retrieve → edit → check orchestration instructions, not
  tools themselves) layered on top of a fixed validation loop; a second, more elaborate harness-
  design precedent, and the source of this thesis's planned no-tool/thin-bridge/semantic-bridge
  ablation structure. [TOP 3] `quast2026graphrag` — Supervisor Agent (query decomposition) +
  Graph Query Agent (Cypher/semantic search execution) two-agent split; a third harness-design
  precedent, specifically for read-only/query-decomposition orchestration rather than generation
  or repair loops. `liparulo2026hwmcp` — **closest methodological sibling** (adjacent domain,
  not SysML v2): purpose-built MCP server reproducing a stateful hardware-design tool + task
  benchmark (single-op/chain/invalid/misspelled) + ablations of system prompt, tool-description
  detail, context scope, and single- vs.\ multi-agent architecture across 7 open models. Directly
  transferable findings: comprehensive tool descriptions reduce failures (pairs with
  `hasan2026mcpsmells`), few-shot prompting can cause severe inaction, cumulative context hurts
  constrained models, multi-agent decomposition helps weak workers at extra call cost. Its task
  taxonomy maps onto the SysML v2 benchmark's planned difficulty tiers.
