# MBSqlE: Enabling SQL as Powerful Query Language for SysML v2 in Aviation

**Bib:** `ahlbrecht2025mbsqle` · **Type:** 1 scientific · **Verified:** full text read 19.09.2026
**Metadata:** Ahlbrecht, Alexander; Zaeske, Wanja; Durak, Umut (DLR Institute of Flight Systems, Braunschweig) · *44th AIAA DATC/IEEE Digital Avionics Systems Conference (DASC 2025)*, September 2025 · DOI (see `quellen.bib`, no direct DOI listed; DLR elib record https://elib.dlr.de/214792/)
**Tags:** #SysMLv2 #API #SQL #GraphTraversal #MBSE #Avionics #Tooling

## Topic
The paper addresses a concrete limitation of the standardized SysML v2 API: its query model can filter elements by property but has no mechanism for graph traversal, even though a SysML v2 model is a highly connected graph (the authors report ~200,000 elements and ~16,000,000 relations for the standard library alone, i.e. roughly 80× more relations than elements). It positions itself against prior tool- or vendor-specific APIs and domain-specific query languages (OCL, EOQ, ACQL, SPARQL-based RACK), arguing that although the new standardized SysML v2 API is a major step for interoperability, it "does not yet solve all problems effectively" for graph-heavy queries relevant to avionics activities (V&V, optimization, configuration, simulation).

## Method
The authors propose MBSqlE: fetch a SysML v2 model via the standard API and import it into an embedded SQLite database using a "skeleton" relational schema (elements, relations, extended_properties tables) auto-generated from the SysML v2 JSON-Schema, so SQL (via recursive Common Table Expressions) can perform arbitrary-depth graph traversal in a single query instead of one API round-trip per hop. They implement this as an open-source importer (`DLR-FT/sysml-v2-sql`) and demonstrate it on a small ATA-chapter aircraft library/model example (29 elements, 270 relations), showing sub-second import and query times, plus report that for a large synthetic case (2×10^5 elements, 1.6×10^7 relations) import throughput averaged ~113 µs/element and ~62 µs/relation, while comparable graph-traversal queries via the standard SysML v2 REST API were observed to take over 10 seconds due to one HTTP request per traversal hop (>10 ms/request). A closing FAQ section explicitly notes that MBSqlE does not currently enforce SysML soundness/correctness beyond basic foreign-key constraints (triggers/checks are future work).

## Relevance
This is the direct technical motivation and prior-art precedent for the thesis's argument that a thin, tool-agnostic wrapper over the raw SysML v2 REST API is a poor querying substrate — corroborating the "no graph traversal, performance bottleneck" premise cited in `quellen.bib` and used to justify a semantic/cache layer for the *Abfragen* use case. It is also useful as a concrete illustration of the query-model limitation an MCP bridge to MSoSA would face if it merely proxied the standard API rather than querying inside the tool (or via an intermediate representation); however, note that MBSqlE targets read-only, offline model analysis (SQLite as a queryable cache) rather than live agentic interaction with a running modeling tool, so its performance numbers are not directly comparable to interactive agent-loop latencies.

## Status
Full text read 19.09.2026. PDF at `bib/papers/ahlbrecht2025mbsqle.pdf`.
