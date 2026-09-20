# Two Truths and A Lie? Benchmarking Off-the-Shelf LLMs for Requirements Quality Assessment

**Bib:** `shefa2026reqquality` · **Type:** 1 scientific (preprint) · **Verified:** arXiv 15.09.2026
**Metadata:** Shefa, Jannatul; Salado, Alejandro; Wach, Paul; Topcu, Taylan G. · arXiv:2609.03230 [cs.SE], 3 Sep 2026
**Tags:** #LLMasJudge #Evaluation #Requirements #INCOSE #FalseNegatives

## Topic
Can off-the-shelf LLMs be trusted to assess requirement quality against INCOSE criteria?

## Method
Ten models (OpenAI + Anthropic, five generations each), 100 independent runs, two requirement sets, five temperatures, expert-derived ground truth. Asymmetric error profile: best Anthropic model detects a median of only **47 %** of expert-identified issues while false-flagging 11 %; necessity/correctness issues (SE judgement) almost always missed; generational progress non-monotonic; temperature changes little.

## Relevance
Justifies two evaluation-design decisions: (1) **expert-defined acceptance criteria + human second rater** instead of LLM-as-judge for semantic correctness; (2) reporting repeated runs (k ≥ 5) rather than single-shot results. Its warning that agentic architectures may *compound* rather than correct LLM deficiencies is relevant to the *Validierung* and *Verifizierung* use cases, where the agent judges model quality.

## Status
PDF filed at `bib/papers/shefa2026reqquality.pdf`. Bib entry promoted to `bib/quellen.bib` (Subject 5). Added to `bib/mindmap.md` under the EvalFW node level.
