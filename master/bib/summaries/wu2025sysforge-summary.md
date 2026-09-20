# Knowledge-Augmented Conversational Agents for Dependency-Aware SysML v2 Model Generation and Refinement

**Bib:** `wu2025sysforge` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026
**Metadata:** Wu, Rui; Wen, Guangwei; Zhang, XiaoNing; Liang, Xiaojun; Yang, Chunhua; Gui, Weihua · *2025 IEEE 26th China Conf. on System Simulation Technology and its Applications (CCSSTA)*, Jul 2025, pp. 581–586 · DOI 10.1109/IEEECONF65522.2025.11137199
**Tags:** #LLM #MBSE #SysMLv2 #KnowledgeGraph #RAG #ConversationalAgent #SysForge #MultiAgent

## Topic
SysForge: a multi-agent framework that turns an LLM into a collaborative design partner for generating and refining SysML v2 models, addressing the failure of basic RAG to capture cross-element dependencies in a novel, training-data-scarce modeling language.

## Method
Four agents — Conversational Agent, Context Synthesizer Agent, Designer Agent, Validator Agent — around a SysML Knowledge Base (SysML-KB). Three stages: (1) dependency-aware knowledge-graph construction and hybrid (vector + graph) retrieval, (2) structured context synthesis from retrieved elements, (3) iterative generate–validate–refine loop until the Validator Agent accepts the output. Evaluated against a plain-LLM baseline and a semantic-RAG baseline on Pass@1 and BLEU; SysForge wins both, with the dependency-aware retrieval and the refinement loop identified as the main contributors.

## Relevance
Closest prior work for the *Korrektur* (and, via its generation stage, *Erstellen*) use cases: a generate-validate-refine loop structurally comparable to the semantic-bridge arm this thesis evaluates. File-based (no industrial modeling tool in the loop) — the thesis differentiates on the live-tool/MSoSA attachment point, with tool-native validation replacing SysForge's own Validator Agent. Its dependency-aware KG retrieval is a competing design to this thesis's "query the live model" approach (cf. `qualis2025hallucination`'s static KG, which this paper's retrieval mechanism resembles more directly than Quast's GraphRAG).

## Status
PDF filed at `bib/papers/wu2025sysforge.pdf`. Bib entry promoted to `bib/quellen.bib` (Subject 4: LLM x SysML v2). Already referenced in `bib/mindmap.md`'s CRUD Operations / *Patch* leaf; entry left as-is (already correctly placed).
