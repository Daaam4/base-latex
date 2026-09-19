# Generating SysML v2 Models from Natural Language Requirements Using Large Language Models

**Bib:** `dehn2025nl2sysml` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026
**Metadata:** Dehn, Simon; Schnürer, Simon; Jacobs, Georg; Höpfner, Gregor (RWTH Aachen, MSE) · *2025 IEEE International Symposium on Systems Engineering (ISSE)*, Oct 2025, pp. 1–7 · DOI 10.1109/ISSE65546.2025.11369988
**Tags:** #LLM #MBSE #SysMLv2 #NaturalLanguage #PromptEngineering #Automotive #Requirements

## Topic
Automating the transformation of natural-language automotive requirements into SysML v2 models via LLMs. Motivated by rising automotive system complexity, the effort barrier of manual MBSE modeling, and the fact that requirements still arrive as prose. Positions itself against prior SysML-based generation work (traditional NLP pipelines, template-driven approaches) that targeted SysML v1 diagrams and lacked traceability, and against generic LLM-for-RE work that struggles with consistency and semantic fidelity — the gap addressed is *semantically correct, ontologically consistent, syntactically valid* SysML v2 output.

## Method
A four-component structured prompt: (1) role/goal description, (2) ontology description (the system meta-model), (3) few-shot examples (modeling conventions), (4) the natural-language requirements set — designed to reduce the LLM's interpretive freedom. Evaluated on an automotive electric-window-opener use case (chosen for complexity, modularity, safety-criticality) across four incremental prompting setups (minimal → full structure), 3 runs each. Metrics: precision/recall/F1 for information extraction, coverage for traceability, pass/fail for syntax, qualitative rating for semantics, plus token usage/runtime.

## Relevance
LLMs extract system elements with high precision/good recall; the ontology component improves traceability but needs few-shot examples to reach syntactic correctness; few-shot examples are essential for syntactically valid SysML v2 output; structured prompting trades higher accuracy for higher token usage/runtime. Remaining weakness: unstable mapping of logical elements to physical parts. Primary reference point for the thesis's *Erstellen* use case and its element-level metrics; file-based generation without a modeling tool, unlike this thesis's live-tool/MSoSA attachment point.

## Status
Full text read (IEEE Xplore). PDF at `bib/papers/dehn2025nl2sysml.pdf`.
