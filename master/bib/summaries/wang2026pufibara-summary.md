# Beyond Executable Models: The Pufibara Agent Harness and the Modelica Agent Workflow Benchmark

**Bib:** `wang2026pufibara` · **Type:** 1 scientific (preprint) · **Verified:** arXiv 15.09.2026
**Metadata:** Wang, Zizhe · arXiv:2608.23653 [cs.SE], 24 Aug 2026
**Tags:** #Benchmark #Modelica #ExternalEvaluator #Harness #PersistentState

## Topic
Agent evaluation for physical-system modelling, where a model may compile and simulate yet violate intended physics — the analogue of a SysML v2 model that validates yet is semantically wrong.

## Method
(1) Pufibara harness: persistent engineering state across revisions, evidence bound to the candidate that produced it, explicit submit action. (2) Source-grounded method for constructing realistic, independently evaluable tasks → 232-task Modelica Agent Workflow Benchmark across Model Repair, Model Generation, Model Tuning. (3) **Each candidate scored by a benchmark-owned evaluator outside the agent loop.** Compared against Claude Code under matched backends (DeepSeek v4 Flash, Claude Sonnet 5): 202 vs 185/187 passes, 76–83 % fewer tokens.

## Relevance
Three design principles adopted for the SysML v2 benchmark: evaluator outside the agent loop; task construction grounded in an existing source model (Apollo 11) rather than authored from scratch; the repair / generation / tuning split maps onto *Korrektur* / *Erstellen* / *Validierung–Verifizierung*. Also evidence that harness design alone shifts results under identical models — a confound to keep constant across arms.

## Status
PDF filed at `bib/papers/wang2026pufibara.pdf`. Bib entry promoted to `bib/quellen.bib` (Subject 5). Added to `bib/mindmap.md` under the EvalFW node level.
