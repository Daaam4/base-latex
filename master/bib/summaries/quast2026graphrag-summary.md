# Enabling Humans and AI Systems to Retrieve Information from System Architectures in Model-Based Systems Engineering

**Bib:** `quast2026graphrag` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026
**Metadata:** Quast, Vincent; Jacobs, Georg; Dehn, Simon; Höpfner, Gregor (RWTH Aachen, MSE) · *Systems* (MDPI) 14(1):83, Jan 2026 · DOI 10.3390/systems14010083 (preprint: 10.20944/preprints202512.0439.v1, Dec 2025)
**Tags:** #LLM #MBSE #SysMLv2 #GraphRAG #KnowledgeGraph #MultiAgent #RFLP #InformationRetrieval

## Topic
Enabling both human stakeholders and AI systems to retrieve information from SysML v2 system architectures, via a preprocessing pipeline that converts models into a queryable knowledge graph and a multi-agent system that answers natural-language questions over it.

## Method
Four-phase pipeline: (1) a custom Python parser converts SysML v2 textual notation into a Neo4j knowledge graph, schema'd by the RFLP methodology; (2) a **Supervisor Agent** decomposes incoming questions and a **Graph Query Agent** executes semantic search + Cypher queries against the graph, following Peng et al.'s GraphRAG framework (hybrid graph+vector indexing, iterative/adaptive retrieval); (3)–(4) demonstration and evaluation on a synthetic battery-electric-vehicle reference model (4 abstraction levels: Requirements, Functional, Logical, Physical) against a purpose-built QA dataset split into zero/one-hop and multi-hop questions. Four LLMs compared (LLaMA-3.3-70B, Gemini-2.0-flash-lite, Gemini-2.0-flash, Gemini-2.5-flash-preview); best model (Gemini-2.5-flash-preview) reaches **93% overall accuracy, 90% on multi-hop questions**. Authors' own stated limitations: parser specific to the chosen metamodel, evaluation on a synthetic (not industrial-scale) model, no user studies, and an explicit "lack of standardized benchmarks" for QA-over-MBSE.

## Relevance
**Primary reference for the *Abfragen* use case, and the most rigorously evaluated related work in the corpus** — real ground truth, multiple models compared, a genuine accuracy metric, unlike most other CRUD-leaf sources which are demonstrations without evaluation. Provides the accuracy-metric template this thesis adopts for *Abfragen*. Their own "lack of standardized benchmarks" statement is a second, independent gap citation alongside SysTemp's, from an unrelated group, specific to the query/retrieval task. Key architectural difference: they query a **derived, pre-built graph**, not the live model/tool state — the thesis queries MSoSA directly, so no separate extraction/graph-maintenance step is needed and results reflect the model's current state rather than a snapshot.

## Status
Full text read (RWTH/MDPI open access). Bib entry live in `quellen.bib`; PDF at `bib/papers/quast2026graphrag.pdf`.
