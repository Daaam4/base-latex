# Automated Semantic Fault Localization in SysML v2: A Human-in-the-Loop Framework Using Knowledge-Graph Augmented LLMs

**Bib:** `alshami2026faultloc` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026
**Metadata:** Al-Shami, Haitham; Malik, Rohail; Ala-Laurinaho, Riku; Vepsäläinen, Jari; Viitala, Raine (Aalto) · *INCOSE International Symposium* 36(1), pp. 1274–1286, July 2026 · DOI 10.1002/iis2.70189
**Tags:** #FaultInjection #Korrektur #KnowledgeGraph #FineTuning #SemanticFaults

## Topic
Semantic faults in SysML v2 models — faults that pass syntax validation but violate domain physics (incompatible mechanical/electrical/fluid/signal connections) — and their automated localisation and repair.

## Method
Fine-tuned small language model + domain knowledge graph of physical compatibility rules. The KG is used twice: to generate synthetic training data by systematically **injecting plausible domain violations**, and at inference to ground repair suggestions. Output: unified-diff patches for engineer review. Vehicle-systems domain, 1 184 test samples; fine-tuning raises semantic repair from < 3 % to > 91 %; patch output halves token length.

## Relevance
**Direct methodological precedent for the *Korrektur* use case.** (1) Their syntactic-vs-semantic fault distinction becomes the fault taxonomy for injection. (2) KG-driven systematic fault injection is a model for generating our fault set on Apollo 11. (3) Their result that plain LLMs repair < 3 % of semantic faults is the baseline expectation for the no-tool arm. Differences: they fine-tune a small model on files; the thesis uses a frontier agent with tool access on a live model, without fine-tuning.

## Status
Abstract read (Crossref). Full text: INCOSE library — check FH access. High priority to read in full before designing fault injection.
