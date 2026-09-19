# Evaluation design: use cases, metrics, statistics

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Design: use cases, tasks & metrics

| Use case | Example task on Apollo 11 | Ground truth / metric | Apollo 11 hook |
|---|---|---|---|
| **Abfragen** (query) | "Which technical components satisfy requirement X?" | exact set match vs. model query | 5 layers, cross-layer chains: need → mission req → functional req → function → logical → technical |
| **Validierung** (validation) | "Is package P well-formed and CoSMA-conformant?" | tool validation suite results | large enough to hide well-formedness issues; CoSMA base types (`:>`) give guideline checks |
| **Verifizierung** (verification) | "Is mass-budget requirement R satisfied by current values?" | expression evaluation in tool | `requirement` + `satisfy`/`verify`; `Analysis/CalculationsPackage.sysml` |
| **Korrektur** (correction) | repair injected faults | fault-repair rate, no collateral change | inject faults into a copy → measure repair |
| **Erstellen** (creation) | add missing technical component with ports + satisfy links | syntactic validity + expert rubric | model is deliberately a "scaffold" with intended gaps |
| *Erklären* (optional) | summarise a subsystem for a stakeholder | expert rubric | — |
| *Refactoring* (optional) | move/rename elements consistently | diff + validation | — |

### Evaluation arms (ablation, cf. SEI 3-arm design)
- **Arm 0** — no tool, textual file in context only
- **Arm 1** — thin CRUD bridge over the SysML v2 API
- **Arm 2** — semantic bridge: tool-native validation + expression evaluation + task-oriented tools

### Metric set
task success (binary) · pass^k (k=5, degrade to 3) · syntactic validity (metamodel conformance) · semantic correctness (expert acceptance criteria + ground-truth diff) · trace preservation (no orphaned requirements / broken satisfy) · collateral damage (model diff / edit distance) · tool efficiency (call overhead ratio) · failure code (diagnostic, unscored)

### Evaluation framework: quantitative vs. qualitative

Two complementary halves. The quantitative half locates the capability boundary; the qualitative half explains *why* it sits there. Both are needed — a pure success-rate table would not answer the RQ.

| | **Quantitative** (measured automatically, per run) | **Qualitative** (coded / judged by the author, per run or per task) |
|---|---|---|
| **Question** | *How often* and *how well*? | *Why* does it fail, and *what kind* of failure is it? |
| **Unit** | task × arm × model tier × repetition (pass^k); Claude family only (D9) | failure instance; task family |
| **Measures** | task success rate · pass^k (k=5→3) · syntactic validity (MSoSA validation suite: #violations) · semantic correctness vs. ground truth (exact-set match / precision-recall for Abfragen; expression result for Verifizierung) · fault-repair rate (Korrektur) · collateral damage = model diff size / unintended element changes · trace preservation (#orphaned requirements, #broken satisfy) · tool-call count, redundant-call ratio, token cost, wall-clock | **failure taxonomy** (§7 list: parameter hallucination, silent mid-workflow stop, traversal exhaustion, conditional inversion, semantic distractor, over-calling …) · **expert rubric** for open-ended output (Erstellen, Erklären): correctness / completeness / conformance to CoSMA guidelines / idiomatic SysML v2, scored 0–3 each with written justification · interaction-trace analysis: what the agent *tried* before succeeding/failing · observed limitations of the bridge itself |
| **Statistics** | descriptive + per-arm comparison; effect direction over significance claims (n is small); one model family only (D9) | thematic coding, frequency counts per failure category, illustrative excerpts |
| **Ground truth** | Apollo 11 as-is + pilot-implementation parser + injected-fault manifest | expert acceptance criteria defined **per task, before the runs** |
| **Who judges** | **external evaluator script, outside the agent loop** (cf. Pufibara) | the author, against pre-registered criteria; LLM-as-judge only as a secondary cross-check (arXiv 2609.03230: best model catches only 47% of expert issues) |
| **Feeds** | H1 (task asymmetry), H2 (arm comparison), H3 (Apollo 11 vs GfSE) | the capability-and-failure map — the actual contribution |

**Design rules**
- Acceptance criteria and fault manifests are written **before** any run → no post-hoc goalpost moving.
- Every metric must be computable without human judgement, or be explicitly declared qualitative. No grey zone.
- Log the full interaction trace (all tool calls + arguments + responses) for every run; it is the raw material for both halves.

- [ ] Turn this table into the skeleton of `master/pages/2xx-evaluation.tex`

### Statistical design — target: **statistically solid results** (decided 13.09.2026)

This is a deliberate raising of the bar from "well-argued framework + pilot". It is achievable, but it is **bought with task breadth and with engineering effort in the harness** — not for free. The design below is what makes the claim defensible.

#### Analysis unit and test
- **Unit of analysis = the task, not the run.** Each task is run **k times per arm**; its outcome is a **pass rate in [0,1]** (e.g. 4/5). Graded outcomes carry far more information than a single binary run → more power from the same number of tasks.
- **Fully paired design:** *every* task is executed in *every* arm. Pairing is the single biggest power lever available — it removes between-task variance, which dominates here (tasks differ enormously in difficulty).
- **Primary test (H2, arm effect):** Friedman test across the 3 arms → if significant, pairwise **Wilcoxon signed-rank** with **Holm correction**. Nonparametric because per-task pass rates are bounded, discrete and non-normal.
- **Secondary / richer model:** **GLMM** on per-run binary outcomes, `success ~ arm + difficulty_tier + use_case + model_tier + (1|task)` — random intercept per task handles the clustering of the k repetitions. Report as a robustness check, not the headline.
- **H1 (task asymmetry):** compare use-case families and difficulty tiers — Kruskal-Wallis / ordered contrast across tiers (local → cross-package → cross-layer).
- **H3 (model scale):** Apollo 11 vs. GfSE on a **matched task subset** (same task types, both models) → paired comparison.
- **Always report effect sizes + CIs**, not just p-values: Wilson or Clopper-Pearson intervals for proportions, Cliff's delta or rank-biserial r for the paired tests, bootstrap CIs for aggregate rates. With this n, **effect sizes with CIs are the real result**; p-values are supporting.

#### Sample size
With per-task pass rates and a paired design, detecting a moderate arm effect (roughly 0.50 → 0.75 mean pass rate) at ~80% power needs on the order of **25–40 tasks**. Target:

| | Target | Minimum acceptable |
|---|---|---|
| Tasks (paired across arms) | **36** (5 use cases × 3 difficulty tiers × ~2–3 instances) | 24 |
| Repetitions k | **5** | 3 |
| Arms | 3 (no tool / thin / semantic) | 3 — **not negotiable**, H2 depends on it |
| Model tiers | 2 (Opus + Sonnet), 2nd tier on a **~50% subset** | 1 |

#### Throughput reality check (computed)
Runs = `tasks × 3 arms × k` + `half-subset × 3 × k` for the second tier:

| Tasks | k | Total runs | @3 min | @6 min | @10 min |
|---|---|---|---|---|---|
| 24 | 3 | 324 | 16 h | 32 h | 54 h |
| **36** | **5** | **810** | **41 h** | **81 h** | **135 h** |
| 45 | 5 | 1005 | 50 h | 101 h | 168 h |

⚠️ **The bottleneck is not the LLM — it is MSoSA.** A GUI desktop application, single instance, VPN-gated floating licence, with model load/reset between runs. At 10 min/run the target matrix is ~135 h of serial wall-clock. That is only survivable as **unattended overnight batch execution**, which turns statistical rigour into an **engineering requirement on the harness**:

- [ ] **Deterministic environment reset** between runs (restore a pristine model snapshot; verify with a hash/diff before each run) — without this, runs are not independent and the statistics are void
- [ ] **Unattended batch runner**: queue, resumable after crash, per-run timeout, retry on licence/VPN failure, full structured log per run
- [ ] **Measure minutes-per-run in the pilot** and recompute this table before locking the matrix
- [ ] Keep MSoSA startup out of the inner loop (one instance, many runs) if the tool permits it

#### Preconditions for the claim "statistically solid"
- [ ] **Pre-register** before any scored run: hypotheses, task set, acceptance criteria per task, fault manifests, primary test, correction method, exclusion rules. Commit it to git with a date → that timestamp *is* the pre-registration.
- [ ] **Fix and report the sampling configuration** (temperature, top-p, max turns, system prompt, exact model IDs + dates). k>1 requires stochastic sampling — temperature 0 would make repetitions meaningless.
- [ ] **Separate a pilot set from the scored set.** Tasks used to debug the harness must not appear in the final statistics.
- [ ] **Inter-rater reliability for the qualitative half:** a single rater is a validity hole. Have a second rater (peer / Prof. Voss / Höner) independently score a **~20% subsample** and report **Cohen's kappa**. Optionally an LLM second rater, with kappa against the human reported — never as the sole judge.
- [ ] **Report every excluded / failed / throttled run** with reason. Silent dropping of rate-limited runs is a bias.
- [ ] Publish the run-level data table (anonymised if needed) as an appendix/artifact.

#### What this costs — revised descoping order
Repetitions and arms are now **protected**; breadth pays instead:
1. Second model tier → smaller subset, or drop (H2 survives; the tier contrast does not)
2. Task **instances** per cell: 3 → 2 → 1 (keep all 5 use cases × 3 tiers for coverage)
3. GfSE generalisation set → drop (costs H3)
4. Optional use cases *Erklären* / *Refactoring* → drop
5. k: 5 → 3 (**last** — directly attacks the statistical claim)
6. Arms: never

### Failure modes to watch for
conditional-reasoning inversion · multi-step degradation (silent stop) · semantic distractor · parameter hallucination · tool over-calling · traversal exhaustion · few-shot inaction (arXiv 2608.26199) · context-accumulation degradation

---
