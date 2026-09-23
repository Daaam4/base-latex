# Requirements & working process

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

### Hard constraints
- **≥ 40 pages** thesis body → budget pages per chapter early; never let a finished phase go unwritten.
- Practical work must be complete by **10.12.2026**, leaving ~5 weeks for concentrated writing (see `10-schedule.md`).
- Tooling is fixed: **MSoSA 2026x** (D14; being installed 23.09.2026, exact build recorded in `06-tooling-msosa.md` A.0), VPN-gated licence, **no TWC** → bridge **Option B** locked (D13). Every evaluation run goes through a GUI desktop app → the run harness must work unattended (`04-evaluation-design.md`).

---

## The thesis in one paragraph

Prior research on LLMs + SysML v2 is almost entirely **one-shot generation** from natural language, evaluated on small hand-made models, working on **text files**. Nobody has measured what an agent can and cannot do when it works **interactively against a live model inside an industrial modeling tool**, on a **large** model, across the full task spectrum. This thesis builds an **MCP bridge to Magic Systems of Systems Architect (MSoSA)**, uses the **Airbus Apollo 11 SysML v2 model** as system under test, and produces a **capability-and-failure map** across six CRUD+V+V use cases (Create · Query/Read · Patch · Delete · Validation · Verification, D15) — composed scenarios like *fault correction* (correction) are built from these, not scored separately. *The bridge is the instrument — the evaluation is the contribution.*

**Research question (as in `master/pages/101expose.tex`):**
> Which SysML v2 modeling tasks can an LLM-based agent perform reliably in an industrial modeling environment (MSoSA) when connected through an MCP bridge, and where do its capabilities break down?

**No hypotheses (D19).** The exposé states the RQ only; H1–H3 were dropped because they did not follow from the research question. Do not reintroduce them.

> ⚠️ **Keep honest:** arXiv 2609.03718 (CAE agents) found a *generic* harness matches specialized machinery. The Phase 2 harness (D18) may show little or no improvement over the bare bridge — that is a valid result and must not be designed away.

---

## Working process (how this thesis gets built)

**Write while working — never batch the writing at the end.** Each phase produces an artifact *and* its chapter text. This is also how the 40-page minimum is reached without padding.

```
phase N practical work ──done─▶ write chapter N
                                   ║  (in parallel)
                     phase N+1 practical work starts
```

**Rules**
- A phase is not "done" until its section exists in `master/pages/2xx-*.tex` as readable prose — not bullet notes.
- Implementation is **vibe-coded** (MCP bridge / MBSE harness, evaluation framework, fault injection, run harness): speed over craftsmanship. But every design decision, dead end and limitation is logged *as it happens* — that log becomes the Design and Discussion chapters.
- Decisions go into `02-decisions.md` (numbered D-rows); dead ends and limitations go into its dated **Implementation log** section. Cheap now, impossible to reconstruct in January.
- Capture tool output, error messages and screenshots into `pic/` immediately — they become figures.

**Page budget sketch (≥ 40 pp.)**

| Chapter | Written during | Target pp. |
|---|---|---|
| 1 Introduction & Motivation | grown from the exposé, Sep | 4 |
| 2 Background (SysML v2/KerML, MSoSA/TWC, MCP, LLM agents) | early, while tooling is being set up | 7 |
| 3 Related Work (from `05-related-work.md`) | early, from the literature base | 6 |
| 4 Design of the MCP bridge / MBSE harness | **as built** | 8 |
| 5 Benchmark & Evaluation Framework | **as built** | 7 |
| 6 Results | right after the runs, before 10.12 | 6 |
| 7 Discussion, Threats to Validity, Limitations | writing month (10.12 → 19.01) | 5 |
| 8 Conclusion & Future Work | writing month | 2 |
| | **total** | **~45** |

- [ ] Create the `master/pages/2xx-*.tex` skeleton with these headings now that the exposé is sent, so every finished phase has a place to be written into

---
