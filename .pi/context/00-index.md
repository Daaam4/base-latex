# Agent context index — Master's thesis (branch `master-thesis`)

**Read order:** `AGENTS.md` → `master/0. OVERVIEW.md` (human status, milestone-structured) → these files as needed.
**Used by:** pi and Claude Code (Claude loads `AGENTS.md` via the `CLAUDE.md` symlink). Skills live in `.pi/skills/`; `.claude/skills/` symlinks to them. Work only on branch `master-thesis`.

| File | Contains |
|---|---|
| `01-requirements.md` | Hard constraints (≥40 pp., dates), thesis premise + RQ (no hypotheses, D19), write-while-working process, per-chapter page budget |
| `02-decisions.md` | **D1–D19** decision record + bridge options A/A′/B/C/C′ and why B is locked + implementation log |
| `03-open-questions.md` | What is open / settled; questions for Prof. Voss; consequences of the Anthropic-Max decision |
| `04-evaluation-design.md` | Use cases (D15) × difficulty tiers (D16) × metrics, quantitative vs. qualitative split, statistical design — **partly stale (3-arm), re-cut after the bare bridge is built** |
| `05-related-work.md` | Landscape (file-based vs. API-based), closest competing work, anticipated pushback → answers |
| `06-tooling-msosa.md` | MSoSA install recipe + feature flag + plugins, verified release train, model candidate table |
| `07-deferred-design.md` | L1–L6 taxonomy, superseded pre-kickoff framing (do not repeat) |
| `08-repo-conventions.md` | Repo layout, build, bibliography rules, style, session checklist |
| `09-technical-backlog.md` | Technical setup sequence: MSoSA install → OpenAPI spike → bare MCP bridge |
| `10-schedule.md` | **Working rhythm & capacity** — job days Mon/Wed + Thu morning; thesis on Tue, Thu PM, Fri, one weekend day (~28 h/week); one protected day off |

## Rules
1. **`master/0. OVERVIEW.md` is the user's document** — milestone-structured, short, checkbox-driven. Do not move reference detail back into it.
2. These files hold **stable context**, not status. Status and progress live in the Overview.
3. Update the relevant file when a decision changes, and add a one-line row to the Overview's log.
4. Never invent bibliographic metadata — leave `TODO` and verify from PDF/DOI.
5. **Respect the schedule in `10-schedule.md`**: plan long technical work for full days (Tue/Fri/weekend), bounded work for Thu afternoon, nothing for Mon/Wed/Thu-morning, and never into the protected day off.
