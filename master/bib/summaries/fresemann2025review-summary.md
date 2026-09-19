# Using Large Language Models for System Modeling: Current State and Future Implications

**Bib:** `fresemann2025review` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026
**Metadata:** Fresemann, Carina; Ellsel, Claudius; Grunenwald, Carl-Philipp; Stark, Rainer (TU Berlin) · *2025 IEEE International Symposium on Systems Engineering (ISSE)*, Oct 2025, pp. 1–8 · DOI 10.1109/ISSE65546.2025.11369978
**Tags:** #LLM #MBSE #SysML #SysMLv2 #PromptEngineering #MCP #LiteratureReview

## Topic
Current state and future implications of using LLMs to support Model-Based Systems Engineering (MBSE), particularly semi-formal modeling languages like SysML, given the significant expertise and manual effort MBSE otherwise requires.

## Method
Structured literature review of 20 publications on LLMs for system modeling, organised around four MBSE tasks LLMs could support — creation, analysis, modification, reformulation — and around improvement techniques (prompt engineering, few-shot prompting, RAG, fine-tuning, post-processing). Most reviewed papers target SysML (v1/v2) or UML via serialization formats (XMI/JSON). Complements the review with its own modular prompting framework for translating SysML v1 structure diagrams (BDD, IBD) to SysML v2, built from five prompt modules (conversion objective/context, syntax rules/modeling logic, model structure conventions, reference example, output requirements).

## Relevance
Provides the task taxonomy (creation/analysis/modification/reformulation) on which the thesis's use-case catalogue (Abfragen, Validierung, Verifizierung, Korrektur, Erstellen) is mapped. Names MCP as the emerging mechanism for supplying extended engineering context, potentially surpassing current prompting-only methods — the review's forward-looking argument for exactly the kind of bridge this thesis builds. Also flags the field's lack of standardized, comparable evaluation criteria as an open problem, which this thesis's benchmark design directly addresses.

## Status
Full text read (IEEE Xplore). PDF at `bib/papers/fresemann2025review.pdf`.
