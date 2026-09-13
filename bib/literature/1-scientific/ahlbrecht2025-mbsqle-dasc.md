# MBSqlE: Enabling SQL as Powerful Query Language for SysML v2 in Aviation

**Bib:** `ahlbrecht2025mbsqle` · **Type:** 1 scientific · **Verified:** DLR elib 15.09.2026
**Metadata:** Ahlbrecht, Alexander; Zaeske, Wanja Marlo Moritz; Durak, Umut (DLR Institute of Flight Systems, Braunschweig) · *44th AIAA DATC/IEEE Digital Avionics Systems Conference (DASC 2025)*, Montreal, 14 Sep 2025 · ISBN 979-833152519-4 · ISSN 2155-7195 · refereed · elib.dlr.de/214792 · code: `DLR-FT/sysml-v2-sql`
**Tags:** #SysMLv2API #Traversal #Performance #SQL #Aviation

## Topic
Data accessibility of MBSE tools as a barrier to collaboration and automation; the SysML v2 standard API as the intended remedy and its query-model limitation.

## Method
Analysis of the API query model — **no direct graph traversal is featured, leading to performance bottlenecks** — followed by a design proposal: SQLite as an intermediate, traversable model representation with SQL as query language, with an eye on tool qualification in safety-critical domains. Open-source implementation.

## Relevance
Technical motivation for the bridge's semantic/cache layer and for querying *inside* the tool rather than through the REST API. Also supports Option B over Option A independently of licence questions. Pairs with Bazzal et al.: the standard API is interoperable but cannot traverse; the thesis's bridge trades interoperability for traversal + tool-native semantics.

## Status
Abstract verified. The specific figures quoted earlier in the repo (≈200 K elements / 16 M relations, > 10 s per traversal query) come from the full text / talk — **verify against the PDF before citing numbers**; the abstract only says "performance bottlenecks".
