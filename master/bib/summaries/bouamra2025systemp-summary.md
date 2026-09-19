# SysTemp: A Multi-Agent System for Template-Based Generation of SysML v2

**Bib:** `bouamra2025systemp` · **Type:** 1 scientific (peer-reviewed, was preprint) · **Verified:** HAL + Springer 19.09.2026
**Metadata:** Bouamra, Yasmine (Siemens Digital Industries Software / Univ. Claude Bernard Lyon 1); Yun, Bruno; Poisson, Alexandre (Siemens); Armetta, Frédéric · *Advances in Practical Applications of Agents, Multi-Agent Systems, and Computational Social Science: The PAAMS Collection* — 23rd International Conference, PAAMS 2025, Lille, France, 25–27 June 2025 · Springer LNCS (LNAI) vol. 16031, pp. 41–52 · DOI 10.1007/978-3-032-07638-0_4 · published 23.11.2025.
**Supersedes:** arXiv:2506.21608 [cs.AI] (June 2025) — same content, now peer-reviewed. Per this repo's preprint policy, the published version replaces the preprint.
**Tags:** #MultiAgent #Templates #Generation #Gap #Erstellen

## Topic
Automatic generation of SysML v2 textual-syntax models from natural-language specifications, motivated by (1) SysML v2's dual abstract/concrete syntax, (2) severe training-data scarcity, and (3) poor zero-shot performance of GPT-4/Llama-3.1-70B/Mistral-7B/Gemma on the task (per the authors' own preliminary tests, footnote 6, using their own repo `github.com/yasminebouamra/SysMLv2-Benchmark`).

## Method
Four-agent pipeline, one shared LLM used in different roles:
1. **SpecificationGeneratorAgent** — NL spec → structured Python dict (few-shot).
2. **TemplateGeneratorAgent** — dict → syntactically valid SysML v2 *skeleton*, via a Jinja2 rule-based template tool (not the LLM directly).
3. **WriterAgent** — skeleton + dict → completed SysML v2 model (fills attributes/values).
4. **ParserAgent** — Java-based grammar checker; returns error report to WriterAgent for iterative repair.

**Ablation:** with vs. without the TemplateGeneratorAgent skeleton, on 5 hand-written bicycle-component scenarios (mountain bike, e-bike, tire, drivetrain, fork), using GPT-4 Turbo and Claude 3.5 Sonnet. **Result: with the skeleton, 4/5 scenarios converge to zero syntax errors within the repair loop; without it, only 1/5 do.** This is a real (if small) quantitative result — but it measures **syntax convergence only**, not semantic correctness, and there is no ground truth or ratable ground truth model.

## Relevance
**Still the gap citation — now stronger, because it is peer-reviewed and the exact wording is confirmed.** Conclusion, verbatim: *"assessing the quality of generated SysML v2 models remains constrained by the absence of standard benchmarks, highlighting the need to develop specific evaluation metrics tailored to this task."* This directly grounds the thesis's benchmark contribution — not just for *Erstellen*, but as a citation for the whole evaluation-framework gap.

Three additional, newly-confirmed points from the full text:
1. **Corpus scarcity is corroborated independently.** The paper states the *only* two available SysML v2 example sources are the Pilot-Implementation test suite and `GfSE/SysML-v2-Models`, together <150 scenarios — matches this thesis's own primary/secondary model choice (Apollo 11 as the large instrument precisely *because* nothing else at scale exists; GfSE as the secondary/generalisation set because it's one of the only two corpora period).
2. **Cites DeHart 2024** (`dehart2024llm`, already in our bib) as the one prior SysML v2 + LLM work, framing it as requiring an existing model as input (API-edit only) — consistent with our own framing of DeHart as "vision, no measurement, no from-scratch generation."
3. **Naming nuance to flag, not necessarily cite:** the authors' own preliminary-test repo is literally named `SysMLv2-Benchmark`, yet their conclusion says no benchmark exists. Read charitably: that repo is a small zero-shot pass/fail smoke test, not a ground-truth semantic benchmark — consistent with, not contradicting, the gap claim. Worth a one-line acknowledgement in related work if we want to preempt an examiner citing it back at us.

## Status
Full text read (HAL PDF, `hal.science/hal-05249466/document`) 19.09.2026. Bib entry in `pool-verified.bib` upgraded from arXiv `@misc` to the peer-reviewed Springer `@inproceedings`. Not yet promoted into `quellen.bib` (live bibliography) — pending same decision as the other TOP-3 promotions (see `.pi/context/05-related-work.md` open item).
