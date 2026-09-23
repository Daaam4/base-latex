# Open questions, settled facts, constraints

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Blockers & open questions

> The exposé has been sent. Weekly group meetings with Prof. Voss have **not started yet** (as of 23.09.2026); the questions below go to him once they do.

### MSoSA 2026x — install in progress (23.09.2026)

- [x] **MSoSA version** — asked via Webex 13.09.2026, **answered same day: access to MSoSA 2026x granted** (D14).
- [x] **sciebo share password** (19.09.2026) — resolved; download available.
- [ ] After install: record exact build (`Help > About`: 2026x base / HF1 / Refresh1), plugin set, and whether the `-Dmd.sysml2.enabled` flag is still required (expected: **no** — SysML v2 is native) → `06-tooling-msosa.md` A.0

**Verified release train (13.09.2026, docs.nomagic.com — there is no 2025x):**

| Release | Date | Why it matters |
|---|---|---|
| **2026x** | 28.11.2025 | **the SysML v2 release**: vendor claims a "100 % standard-compliant SysML v2 solution", synchronised textual ⇄ graphical syntax, query-based views, enhanced REST APIs |
| 2026x Hot Fix 1 | 19.12.2025 | *"focused primarily on two key areas of the SysML v2 implementation"* |
| **2026x Refresh1** | 26.06.2026 | **current latest**; adds SysML v2 project migration |

→ Being on the 2026x train de-risks the OpenAPI spike (`09-technical-backlog.md`), the Apollo 11 import and the tool-native Validation/Verification capabilities — but none of the three is *proven* until the spike runs on 2026x. The 2024x install recipe in `06-tooling-msosa.md` is kept only as a fallback.

**🟡 Resolve myself (technical, no one to ask):**
- [ ] Does the MSoSA **Java OpenAPI expose SysML v2 elements**? → the OpenAPI spike (`09-technical-backlog.md`). If not, Option B collapses.

### Open with Prof. Voss (once group meetings start)

- [ ] **Detailed milestones** for M2–M5
- [ ] **Teamwork Cloud** — is an instance available (even eval/trial)? Would allow the *standard* SysML v2 REST API over an MSoSA-hosted model (Option A) instead of the Java OpenAPI. Not a blocker: Option B is locked; a yes would be an upgrade / future-work note
- [ ] Confirm the **statistical design** matches his expectations — *after* the evaluation framework is re-cut (that happens once the bare MCP bridge is built, see `04-evaluation-design.md`)
- [ ] Confirm that evaluating on an **own Anthropic Max subscription** (non-metered, opaque rate limits) is acceptable for the formal work
- [ ] Ask whether he or Höner can act as **second rater** on a ~20% subsample (inter-rater reliability / Cohen's kappa — `04-evaluation-design.md`)
- [ ] Prior/parallel work in his group not to duplicate (MCP, SysML v2 API, agent evaluation)

### Parked (decide later, not with Prof. Voss)
- [ ] **SysIDE Automator** (Sensmetry, Python API for SysML v2): FH licence covers **MSoSA only**. Use only if essential or clearly advantageous.

### Settled

- [x] **Exposé sent** to Prof. Voss (RQ only, no hypotheses — D19)
- [x] **MSoSA version (seminar-era, fallback only):** 2024x Refresh2 HF1, Academic → `06-tooling-msosa.md` A.1
- [x] **500-element Community Edition cap:** not a problem — full Academic licence
- [x] **Thesis language: English**
- [x] **Page count: minimum 40 pages** (page budget in `01-requirements.md`)
- [x] **LLM access: Anthropic Max subscription** (own account) → Claude models. Consequences below.
- [x] **Tooling licence scope:** FH licence covers **MSoSA only** — no TWC licence, no SysIDE licence assumed
- [x] **Rigour target: statistically solid results** (not a pilot, D12) → `04-evaluation-design.md`; unattended batch harness is mandatory

### Consequences of the Anthropic-Max decision

The evaluation runs on a **Claude Max subscription**, not on metered API keys. That is a real methodological constraint, so treat it explicitly rather than hiding it:

- **The two-phase comparison (D18) stays fully testable** — bare bridge vs. harness × tasks within *one* model family, which is exactly what a single subscription supports well.
- **Cross-model comparison is the weak axis** → planned as single-family from the start. A capability-tier contrast (Claude Opus vs. a smaller Claude) is optional and decided with the evaluation-framework re-cut.
- **Write it up as a threat to validity:** findings are demonstrated for one model family; generalisation across vendors is future work. Defensible — the SEI study also ran a single model (Claude Opus 4.6).
- **Subscription limits, not cost, are the budget.** tasks × 2 phases × k (× model tiers) multiplies fast → compute the run matrix *before* the runs and keep k and task count as the adjustable terms. Rate limits become a scheduling problem, so batch runs and log every rejected/throttled attempt.
- **Reproducibility:** pin and report exact model IDs + dates (subscription models change silently under the same name).

---
