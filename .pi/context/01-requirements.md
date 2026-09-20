# Requirements & working process

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

### Hard constraints
- **≥ 40 pages** thesis body → budget pages per chapter early; never let a finished phase go unwritten.
- Practical work must be complete by **10.12.2026**, leaving ~5 weeks for concentrated writing (§3).
- Tooling is fixed: **MSoSA 2026x** (D14; exact build TBD after install — native SysML v2, no feature flag expected), VPN-gated licence, **no TWC** → bridge **Option B** locked (D13). All ~810 runs go through a GUI desktop app → harness must run unattended (`.pi/context/04-evaluation-design.md` (statistical design)). See `.pi/context/06-tooling-msosa.md`.

---

## The thesis in one paragraph

Prior research on LLMs + SysML v2 is almost entirely **one-shot generation** from natural language, evaluated on small hand-made models, working on **text files**. Nobody has measured what an agent can and cannot do when it works **interactively against a live model inside an industrial modeling tool**, on a **large** model, across the full task spectrum. This thesis builds an **MCP bridge to Magic Systems of Systems Architect (MSoSA)**, uses the **Airbus Apollo 11 SysML v2 model** as system under test, and produces a **capability-and-failure map** across six CRUD+V+V use cases (Create · Query/Read · Patch · Delete · Validation · Verification, D15) — composed scenarios like *fault correction* (correction) are built from these, not scored separately. *The bridge is the instrument — the evaluation is the contribution.*

**Research question (as in `master/pages/101expose.tex`):**
> Which SysML v2 modeling tasks can an LLM-based agent perform reliably in an industrial modeling environment (MSoSA) when connected through an MCP bridge, and where do its capabilities break down?

**Hypotheses**
- **H1 (task asymmetry)** — read-only tasks (Query/Read, Validation) are reliable; write tasks (Create, Patch, Delete, and composed correction scenarios) and Verification degrade with model size and cross-layer dependency depth.
- **H2 (tool semantics)** — exposing tool-native capabilities (validation suites, expression evaluation) as MCP tools beats a thin CRUD wrapper over the SysML v2 API.
- **H3 (model scale)** — findings from small teaching models (GfSE) do not transfer to a large multi-layer model (Apollo 11) without a semantic navigation layer.

> ⚠️ **Keep honest:** arXiv 2609.03718 (CAE agents) found a *generic* harness matches specialized machinery. H2 may well be falsified — that is a valid result and must not be designed away.

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
- Keep a running `decisions-log.md` in the repo root (dated: what, why, alternatives rejected). Cheap now, impossible to reconstruct in January.
- Capture tool output, error messages and screenshots into `pic/` immediately — they become figures.

**Page budget sketch (≥ 40 pp.)**

| Chapter | Written during | Target pp. |
|---|---|---|
| 1 Introduction & Motivation | grown from the exposé, Sep | 4 |
| 2 Background (SysML v2/KerML, MSoSA/TWC, MCP, LLM agents) | early, while tooling is being set up | 7 |
| 3 Related Work (from §8) | early, from the literature base | 6 |
| 4 Design of the MCP bridge / MBSE harness | **as built** | 8 |
| 5 Benchmark & Evaluation Framework | **as built** | 7 |
| 6 Results | right after the runs, before 10.12 | 6 |
| 7 Discussion, Threats to Validity, Limitations | writing month (10.12 → 19.01) | 5 |
| 8 Conclusion & Future Work | writing month | 2 |
| | **total** | **~45** |

- [ ] Create the `master/pages/2xx-*.tex` skeleton with these headings right after the exposé, so every finished phase has a place to be written into

---
