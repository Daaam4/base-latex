# Using Large Language Models for System Modeling: Current State and Future Implications

**Source:** [IEEE Xplore (arXiv 11369978)](https://ieeexplore.ieee.org/stampPDF/getPDF.jsp?tp=&arnumber=11369978&ref=aHR0cHM6Ly9pZWVleHBsb3JlLmllZWUub3JnL2RvY3VtZW50LzExMzY5OTc4) · [Find in Scholar](https://scholar.google.com/scholar?lookup_url=https%3A%2F%2Fieeexplore.ieee.org%2FstampPDF%2FgetPDF.jsp%3Ftp%3D%26arnumber%3D11369978%26ref%3DaHR0cHM6Ly9pZWVleHBsb3JlLmllZWUub3JnL2RvY3VtZW50LzExMzY5OTc4&q=Using%20Large%20Language%20Models%20for%20System%20Modeling%3A%20Current%20State%20and%20Future%20Implications&pi=cade2119166ac71007c231df84940001,118bf6504bad5affe83a736a8e5ee9fc)

**Tags:** #LLM #MBSE #SysML #SysMLv2 #PromptEngineering #MCP #LiteratureReview

---

## Introduction

- Describes Model-Based Systems Engineering (MBSE) and its importance for efficient system development.
- Highlights the challenges of applying MBSE, including the significant expertise and manual effort required.
- Discusses Large Language Models (LLMs) and their potential to support system modeling tasks.
- Presents three key research questions about the current state and future implications of using LLMs in MBSE, particularly with semi-formal languages like SysML.

## Overview of the Current State of Research

- Defines four key MBSE tasks that LLMs could potentially support: creation, analysis, modification, and reformulation of system models.
- Reviews related approaches and highlights their limitations in adapting to complex models and incorporating semantic understanding.
- Discusses techniques to improve LLM output, including prompt engineering, few-shot prompting, Retrieval Augmented Generation (RAG), fine-tuning, and post-processing.
- Presents a structured literature review of 20 publications using LLMs for system modeling tasks, examining the modeling tasks addressed, improvement strategies, and evaluation methods.
- Notes that most reviewed papers focus on SysML (v1 and v2) and UML, often utilizing serialization formats like XMI or JSON.

## Description of an LLM-based SysML Translation Approach

- Discusses the challenge of translating existing SysML v1 models to the new SysML v2 standard.
- Presents a modular prompting framework for translating SysML v1 to v2 structure diagrams, including Block Definition Diagrams (BDDs) and Internal Block Diagrams (IBDs).
- Explains the five core modules of the prompt strategy: conversion objective and context, syntax rules and modeling logic, model structure conventions, reference example, and output requirements.

## Future Implications

- Discusses the future of LLM systems and their potential for supporting system modeling, particularly with the emergence of modular architectures and the Model Context Protocol (MCP).
- Highlights the potential of the MCP for providing extended engineering context and supporting more complicated models, potentially surpassing the limitations of current prompting methods.
- Notes that the textual notation, APIs, and improved machine readability of SysML v2 provide a better fit for LLM technologies.
- Discusses the increased model complexity resulting from SysML v2's features and the potential for LLMs to generate complete system-representing models.

## Conclusions and Future Research

- Summarizes the findings, emphasizing the potential of LLMs for efficient and high-quality system modeling with proper contextual enhancement.
- Proposes the development of commonly agreed evaluation criteria for AI-based modeling support to address the lack of standardization and comparability observed in the literature review.
- Discusses the limitations of current system model evaluation methods and the potential for adapting automated quality evaluation models from computer science, combined with qualitative user perception tools.
- Outlines future research directions including detailed evaluation of the proposed SysML translation approach, implementation and evaluation of the MCP approach, and development of standardized evaluation metrics for system modeling tasks.
