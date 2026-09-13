# Generating SysML v2 Models from Natural Language Requirements Using Large Language Models

**Bib:** `dehn2025nl2sysml` · **Type:** 1 scientific · **Verified:** Crossref 15.09.2026
**Metadata:** Dehn, Simon; Schnürer, Simon; Jacobs, Georg; Höpfner, Gregor (RWTH Aachen, MSE) · *2025 IEEE International Symposium on Systems Engineering (ISSE)*, Oct 2025, pp. 1–7 · DOI 10.1109/ISSE65546.2025.11369988

**Source:** [IEEE Xplore (arXiv 11369988)](https://ieeexplore.ieee.org/stampPDF/getPDF.jsp?tp=&arnumber=11369988&ref=aHR0cHM6Ly9pZWVleHBsb3JlLmllZWUub3JnL2Fic3RyYWN0L2RvY3VtZW50LzExMzY5OTg4) · [Find in Scholar](https://scholar.google.com/scholar?lookup_url=https%3A%2F%2Fieeexplore.ieee.org%2FstampPDF%2FgetPDF.jsp%3Ftp%3D%26arnumber%3D11369988%26ref%3DaHR0cHM6Ly9pZWVleHBsb3JlLmllZWUub3JnL2Fic3RyYWN0L2RvY3VtZW50LzExMzY5OTg4&q=Generating%20SysML%20v2%20Models%20from%20Natural%20Language%20Requirements%20Using%20Large%20Language%20Models&pi=060f981e11b233a589f0511091f16103,b0c964fe436dc2eb3201a3d66a87d56e)

**Tags:** #LLM #MBSE #SysMLv2 #NaturalLanguage #PromptEngineering #Automotive #Requirements

---

## Introduction

- Describes the rising complexity of automotive systems and the need for Model-Based Systems Engineering (MBSE) methods.
- Mentions the challenges of MBSE adoption due to the effort required for manual modeling and the prevalence of natural language requirements.
- Highlights the opportunity to use Large Language Models (LLMs) to automate the transformation of natural language requirements into SysML v2 models.
- Presents a structured approach for instructing LLMs to generate SysML v2 models and outlines the paper's structure.

## State of Research

- Reviews existing work on SysML-based model generation, including traditional NLP pipelines and template-driven approaches.
- Discusses the limitations of previous methods, particularly their focus on SysML v1 diagrams and lack of comprehensive traceability.
- Highlights the potential of LLMs for Requirements Engineering (RE) tasks, including model generation, but notes challenges in consistency and semantic fidelity.
- Summarizes the research gap addressed by the paper, focusing on the need for semantically correct, ontologically consistent, and syntactically valid SysML v2 models.

## Problem Statement

- Reiterates the need for efficient MBSE methodologies in the context of automotive system complexity.
- Notes the shortcomings of existing LLM-based approaches, including lack of semantic correctness, ontological consistency, and syntactic correctness in SysML v2 generation.
- Presents the research questions addressed in the paper: how to reliably extract system elements from requirements using LLMs, achieve ontological consistency in generated models, and ensure syntactically correct SysML v2 output.

## Methodology

- Introduces a structured prompting approach for guiding LLMs to generate accurate and consistent SysML v2 models.
- Details the prompt components: role and goal description, ontology description, few-shot examples, and natural language requirements set.
- Explains the role of each component: providing context, defining the system meta-model, demonstrating modeling conventions, and presenting the input requirements.
- Emphasizes the rationale for this structured approach: reducing interpretive freedom for the LLM and promoting accurate model generation.

## Evaluation

- Describes the use case: an electric window opener system, chosen for its complexity, modularity, and relevance to safety-critical automotive systems.
- Presents the evaluation criteria: information extraction, traceability, syntax, semantics, robustness, and operational metrics (token usage and runtime).
- Briefly explains the metrics used for each criterion: precision, recall, F1-score for information extraction; coverage for traceability; pass/fail for syntax; qualitative rating for semantics.
- Outlines the four prompting setups compared in the evaluation: from minimal prompting to the full structured prompt, highlighting the incremental addition of structure.

## Results

- Presents the results for each prompting setup, focusing on average scores across three runs for each criterion: information extraction, traceability, syntax, and semantics.
- Notes the variance observed across runs for each setup, highlighting the robustness or instability of the outputs.
- Summarizes the findings in terms of the research questions: LLMs can extract system elements with high precision and good recall, ontology improves traceability but requires few-shot examples for syntactic correctness, and few-shot examples are essential for achieving syntactically valid SysML v2 output.
- Mentions the trade-off between quality and operational costs: structured prompting improves accuracy but increases token usage and runtime.

## Discussion

- Interprets the results in detail, analyzing the impact of each prompt component on the model quality and stability.
- Emphasizes the importance of the combined ontology and few-shot examples approach for achieving the desired level of correctness, consistency, and traceability.
- Discusses the remaining challenges, particularly in mapping logical elements to physical parts and the trade-offs between quality gains and computational costs.
- Suggests practical strategies for integrating LLM-based model generation into engineering workflows, considering the cost and robustness aspects.

## Conclusion and Outlook

- Summarizes the contributions of the study: demonstrating the potential of structured prompting for generating accurate and traceable SysML v2 models from natural language requirements using LLMs.
- Acknowledges the limitations: remaining variability in logical-to-physical mapping and the increased computational cost of structured prompting.
- Proposes future research directions: extending the evaluation to industrial-scale data, investigating methods to further improve robustness, and integrating the approach into MBSE toolchains for practical application.
