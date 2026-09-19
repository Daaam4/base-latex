# Open questions, settled facts, constraints

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Blockers & open questions

> **Rule:** before the exposé, only §5.1's two questions go to Prof. Voss. Everything else waits for `.pi/context/03-open-questions.md` (deferred).

### Ask Prof. Voss **now** — resolved

Nothing else goes to him before the exposé.

- [x] **MSoSA version** — asked via Webex 13.09.2026, **answered same day: access to MSoSA 2026x granted** (D14). Exact build (2026x base / HF1 / Refresh1) unknown until installed → read `Help > About`, record in `06-tooling-msosa.md`.
- [ ] After install: record exact build, plugin set, and whether the `-Dmd.sysml2.enabled` flag is still required in 2026x (expected: **no** — SysML v2 is native there)

**Verified release train (13.09.2026, docs.nomagic.com — there is no 2025x):**

| Release | Date | Why it matters |
|---|---|---|
| **2026x** | 28.11.2025 | **what we have now (exact build TBD)** — **the SysML v2 release**: vendor claims a "100 % standard-compliant SysML v2 solution", synchronised textual ⇄ graphical syntax, query-based views, enhanced REST APIs |
| 2026x Hot Fix 1 | 19.12.2025 | *"focused primarily on two key areas of the SysML v2 implementation"* |
| **2026x Refresh1** | 26.06.2026 | **current latest**; adds SysML v2 project migration |

→ **Resolved in our favour:** we are on the 2026x train. This de-risks the OpenAPI spike (`.pi/context/09-technical-backlog.md`), the Apollo 11 import, and H2's tool-native arm simultaneously — but none of the three is *proven* until the spike runs on 2026x. The 2024x-specific caveats (feature flag, incubator-grade SysML v2) no longer apply; the seminar install recipe in `06-tooling-msosa.md` is kept only as a fallback.

**Teamwork Cloud → deferred to `.pi/context/03-open-questions.md` (deferred)** (after the exposé). His standing instruction is to **work with what we have access to**, so the exposé is written for **Option B** (§4) — asking now would invite a scope discussion we do not need before 20.09. If a TWC instance turns out to exist later, it becomes an *upgrade*, not a replan.

**🟡 Resolve myself (technical, no one to ask):**
- [ ] Does the MSoSA **Java OpenAPI expose SysML v2 elements**? → the OpenAPI spike (`.pi/context/09-technical-backlog.md`). If not, Option B collapses.

### Deferred — discuss **after** the exposé is sent

Deliberately parked. Not blocking, and raising them now would only dilute the exposé conversation.

- [ ] **Teamwork Cloud** — is an instance available (even eval/trial)? Would allow the *standard* SysML v2 REST API over an MSoSA-hosted model (Option A) instead of the Java OpenAPI. Not a blocker: Option B is locked and the exposé assumes it; a yes would be an upgrade / future-work note
- [ ] Confirm the **statistical design** (`.pi/context/04-evaluation-design.md` (statistical design)) matches his expectations
- [ ] Confirm that evaluating on an **own Anthropic Max subscription** (non-metered, opaque rate limits) is acceptable for the formal work
- [ ] Ask whether he or Höner can act as **second rater** on a ~20% subsample (inter-rater reliability / Cohen's kappa — `.pi/context/04-evaluation-design.md` (statistical design))
- [ ] **Detailed milestones** for the remaining work (§3)
- [ ] Prior/parallel work in his group not to duplicate (MCP, SysML v2 API, agent evaluation)
- [ ] **SysIDE Automator** (Sensmetry, Python API for SysML v2): FH licence covers **MSoSA only**. Use only if essential or clearly advantageous — decide at a later stage; do not design it into the exposé.
- [ ] Exposé page limit: official brief says ½–1 page, kickoff note said "max 2 pages" (§6.0) — can be raised *with* the exposé rather than before it

### Settled

- [x] **MSoSA version (seminar-era):** **2024x Refresh2 HF1, Academic**, portable zip, OpenJDK 17, SysML v2 behind `-Dmd.sysml2.enabled` + plugins *SysML v2* / *SysML v2 Evaluation* / *SysML v2 Textual Editor*; licence server 149.201.140.104:1101 **via FH VPN** → `.pi/context/06-tooling-msosa.md`
- [x] **500-element Community Edition cap:** not a problem — full Academic licence
- [x] **Thesis language: English**
- [x] **Page count: minimum 40 pages** (§2.1 page budget)
- [x] **LLM access: Anthropic Max subscription** (own account) → Claude models. Consequences in §5.3.
- [x] **Tooling licence scope:** FH licence covers **MSoSA only** — no TWC licence, no SysIDE licence assumed
- [x] **Rigour target: statistically solid results** (not a pilot) → full design in `.pi/context/04-evaluation-design.md` (statistical design); consequences: protected k and arms, breadth as the lever, unattended batch harness is mandatory

### Consequences of the Anthropic-Max decision

The evaluation runs on a **Claude Max subscription**, not on metered API keys. That is a real methodological constraint, so treat it explicitly rather than hiding it:

- **H2 (tool semantics) stays fully testable** — the ablation is arms × tasks within *one* model family, which is exactly what a single subscription supports well.
- **Cross-model comparison becomes the weak axis.** "2–3 LLMs" was always a descoping lever (§3, lever 2); with one provider it should be **planned as single-family from the start**: e.g. Claude Opus vs. a smaller Claude (Sonnet/Haiku) as the *capability-tier* contrast instead of a cross-vendor contrast. Cheaper, still answers "does model strength or tool design dominate?".
- **Write it up as a threat to validity:** findings are demonstrated for one model family; generalisation across vendors is future work. Defensible — the SEI study also ran a single model (Claude Opus 4.6).
- **Subscription limits, not cost, are the budget.** pass^k × tasks × arms × models multiplies fast → compute the run matrix *before* the runs and keep k and task count as the adjustable terms. Rate limits become a scheduling problem, so batch runs and log every rejected/throttled attempt.
- **Reproducibility:** pin and report exact model IDs + dates (subscription models change silently under the same name).
- [ ] Compute the run matrix: `tasks × arms(3) × models(2 tiers) × k` → sanity-check against realistic session limits
- [ ] Decide the model tier pair (Opus + Sonnet?) and record it as a decision

---
