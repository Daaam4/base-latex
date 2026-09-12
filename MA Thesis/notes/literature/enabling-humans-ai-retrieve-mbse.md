# Enabling Humans and AI Systems to Retrieve Information from System Architectures in Model-Based Systems Engineering

**Source:** [ProQuest](https://media.proquest.com/media/hms/PFT/1/JCOLf?_s=Equ4XP7m%2BxIoBjEg27N3gn1CGks%3D#view=FitV) · [Find in Scholar](https://scholar.google.com/scholar?lookup_url=https%3A%2F%2Fmedia.proquest.com%2Fmedia%2Fhms%2FPFT%2F1%2FJCOLf%3F_s%3DEqu4XP7m%252BxIoBjEg27N3gn1CGks%253D%23view%3DFitV&q=Enabling%20Humans%20and%20AI%20Systems%20to%20Retrieve%20Information%20from%20System%20Architectures%20in%20Model-Based%20Systems%20Engineering&pi=f0bc658faa6c01960f68b39ccd1f740e,2a13af333442d78178f6b690acd18c5d)

**Tags:** #LLM #MBSE #SysMLv2 #GraphRAG #KnowledgeGraph #MultiAgent #RFLP #InformationRetrieval

---

## Introduction

- Describes the limitations of traditional document-centric systems engineering, particularly for complex cyber-physical systems.
- Presents Model-Based Systems Engineering (MBSE) as a solution and highlights its potential benefits, such as traceability, consistency, and collaboration.
- Discusses the challenges of MBSE adoption, including the introduction phase and the operational use phase.
- Highlights the potential of generative AI, specifically Large Language Models (LLMs), to enhance MBSE, particularly in the operational use phase.
- Introduces a study that aims to develop an LLM-based multi-agent system for accessing information stored in MBSE system models.
- Mentions the structure of the paper and the specific research questions addressed.

## State of the Art

- Briefly defines MBSE and its key elements: modeling language, methodology, and supporting tools.
- Discusses the perceived benefits and adoption challenges of MBSE based on a review of existing research.
- Reviews the current state of research on generative AI in MBSE, particularly focusing on LLM applications for model generation, requirement analysis, and automated consistency checking.
- Highlights the need for research on enabling both human stakeholders and AI systems to access and leverage information stored in MBSE system models.
- Mentions Retrieval-Augmented Generation (RAG) and GraphRAG as promising techniques for enabling LLM interaction with system models.

## Materials and Methods

- Describes the four phases of the proposed methodology.
- Presents a preprocessing pipeline that converts SysML v2 system models into knowledge graphs:
  - Notes the distinction between classical GraphRAG and the proposed MBSE use case.
  - Explains the construction of a graph schema based on the RFLP methodology.
  - Mentions the development of a custom Python-based parser for SysML v2 textual notation and its role in populating the Neo4j graph database.
- Explains the multi-agent system architecture:
  - Describes the roles and responsibilities of the **Supervisor Agent** and the **Graph Query Agent**.
  - Highlights the use of semantic search and Cypher queries for navigating the knowledge graph.
- Positions the developed methodology within Peng et al.'s GraphRAG framework:
  - Notes the use of hybrid indexing (graph and vector indices).
  - Highlights the LM-based retriever, iterative and adaptive retrieval paradigm, and hybrid retrieval granularity.
  - Mentions query decomposition by the Supervisor Agent and the code-like graph format (Cypher and JSON).
- Introduces a reference model of a battery electric vehicle architecture developed in SysML v2 textual notation to demonstrate and evaluate the methodology:
  - Briefly describes the four abstraction levels (Requirements, Functional, Logical, Physical) of the reference model and the number of elements at each level.
- Describes the structure of the question-and-answer dataset:
  - Mentions the categorization of questions into zero-to-one-hop and multi-hop types.
  - Notes the total number of questions in the dataset.

## Results

- Presents the final architecture, consisting of the SysML v2 layer, a graph layer, and the multi-agent system.
- Shows the evaluation results, comparing four large language models (LLaMA-3.3-70B, Gemini-2.0-flash-lite, Gemini-2.0-flash, and Gemini-2.5-flash-preview) on zero-to-one-hop and multi-hop questions.
- Highlights the superior performance of **Gemini-2.5-flash-preview**, achieving **93% overall accuracy** and **90% on multi-hop questions**.
- Presents the average response times of the evaluated LLMs and notes the factors influencing response time variations.
- Provides an illustrative example of a multi-hop question being answered by the system, showcasing the collaboration between the agents and the graph traversal process.

## Discussion

- Analyzes the impact of language model selection on performance, particularly for multi-hop reasoning tasks, highlighting the importance of model size and training data.
- Discusses response time considerations and factors beyond model inference speed.
- Examines the influence of model characteristics on accuracy.
- Considers the impact of graph complexity and the RFLP modeling approach.
- Acknowledges limitations related to the controlled nature of the reference model and question dataset.
- Explores potential integration into MBSE development practice:
  - Highlights possible use cases during requirements engineering, design reviews, and documentation.
  - Notes the need for user studies to validate usability and stakeholder acceptance.
- Discusses the limitations of the study:
  - Mentions the parser's specificity to the chosen metamodel.
  - Acknowledges the evaluation was performed on a synthetic model, potentially not reflecting the heterogeneity and scale of real-world industrial models.
  - Notes the absence of user studies and lack of standardized benchmarks.

## Summary and Outlook

- Summarizes the key contributions of the work.
- Outlines several directions for future work:
  - Mentions the need for evaluation on larger-scale industrial models and alternative graph representations.
  - Highlights the potential for exploring different context engineering approaches and agent architectures.
  - Suggests the development of standardized benchmarks for question-answering over MBSE systems.
  - Notes the importance of integrating graph database support directly into MBSE tools.
