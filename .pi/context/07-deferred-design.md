# Deferred / superseded design material

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Appendix C — Deferred design material (pre-kickoff framing)

Reusable, but it predates the kickoff decisions (D1–D4, D13).

**L1–L6 task taxonomy** — superseded as the *primary* structure by the five German use cases, but it is the rationale behind the difficulty tiers in §7:
L1 retrieval (fetch/describe an element) · L2 structural query (multi-hop traversal) · L3 authoring (create valid elements) · L4 consistency (detect violations) · L5 conditional reasoning (branch logic) · L6 multi-step workflow (compose operations).
→ local ≈ L1/L3 · cross-package ≈ L2/L4 · cross-layer ≈ L5/L6.

**Superseded framing — do not repeat:** the original plan was a *semantic MCP server over the pilot REST API* with a SQLite graph cache synced via `diffCommits()`, benchmarked against `flexo-mms-sysmlv2-mcp` as the thin-wrapper baseline. D3/D13 replaced this with the MSoSA bridge. Consequences: no commits/branches → write "live in-session model state", never "repository"; the thin arm is **our own** thin CRUD tier, not a third-party server; the graph cache is only needed if traversal performance actually bites (then see `DLR-FT/sysml-v2-sql`).

**Still valid from that phase:** the 8-dimension metric table (→ §7), the failure-mode list (→ §7), the "instrument vs. contribution" framing (→ §2), the pushback answers (→ §9).

---
