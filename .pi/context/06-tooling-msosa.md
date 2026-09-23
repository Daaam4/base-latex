# Tooling: MSoSA setup, versions, models

> Agent context for the Master's thesis. Human-facing status lives in `master/0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Appendix A — MSoSA setup

### A.0 — Current: MSoSA **2026x** (granted by Prof. Voss, 13.09.2026 — D14)

> **This is the build the thesis is done on.** Fill in on first launch; goes into the reproducibility appendix verbatim.
> **Status (23.09.2026):** install in progress. Fill in this table on first launch — before any bridge work starts.

| Item | Value |
|---|---|
| Exact build (`Help > About`) | TODO — 2026x / 2026x HF1 / 2026x Refresh1 ? |
| Edition / distribution | TODO (Academic? portable zip vs. installer?) |
| Delivery channel | **sciebo FH Aachen**, password-protected share `/s/L3kBaQZr3tY7dHS` (link 19.09.2026, password obtained) |
| Licence server | TODO — assume 149.201.140.104:1101 via FH VPN until proven otherwise |
| Java | TODO (2026x ships with its own JDK? version?) |
| SysML v2 plugins needed | TODO — 2026x ships SysML v2 natively; check whether *SysML v2 Evaluation* / *Textual Editor* are still separate plugins |
| Feature flag `-Dmd.sysml2.enabled` | TODO — expected **not required** in 2026x |
| OpenAPI: SysML v2 metaclasses exposed? | TODO — **the spike** (`09-technical-backlog.md`) |
| REST API ("enhanced REST APIs" per release notes)? | TODO — if 2026x exposes a SysML v2 REST API on the desktop, Option A-style access may exist *without* TWC → re-evaluate bridge design |

**What changes vs. 2024x (from vendor release notes, to be verified hands-on):** native, "100 % standard-compliant" SysML v2; synchronised textual ⇄ graphical syntax; query-based views; enhanced REST APIs; (Refresh1) SysML v2 project migration.

### A.1 — Fallback / historical: 2024x Refresh2 HF1 (seminar-era)

> Source: FH ILIAS course folder "SysMLv2 Tool" (WS seminar); recipe below re-confirmed against that page 19.09.2026 (screenshot) — unchanged, still advertises 2024x. **Superseded by A.0** — kept for the fallback path and to document the delta. Do not mistake the stale ILIAS page for the 2026x delivery.

**Artifact:** `No_Magic_2024x_Refresh2_HF1.AM_NM_Academic.AllOS.2-5.zip` — *Magic Systems of Systems Architect* **2024x Refresh2 HF1**, **Academic**, all-OS, **portable (no_install)**, 3.4 GB, via sciebo FH Aachen.

**Install recipe**
1. Unpack `No_Magic_2024x_Refresh2_HF1.AM_NM_Academic.AllOS.2-5.zip`.
2. Inside, unpack `AM_NM_Academic.AllOS\2\Magic Systems of Systems Architect (Application)\Magic_Systems_of_Systems_Architect_2024x_Refresh2_HF1_no_install.zip` → this directory is **MSOSA**.
3. In `MSOSA/bin/msosa.properties`, append to the `JAVA_ARGS` line: `-Dmd.sysml2.enabled\=d69e2255-b8f5`
4. Run `MSOSA/bin/msosa.exe`. On error: install **OpenJDK 17** and select it when prompted.
5. Menu: **Help > Resource/Plugin Manager**.
6. If unset, choose resource location `MSOSA\data\resourcemanager\distribution\core.rdzip`.
7. Under **"Plugins (no cost)"** install **SysML v2**, **SysML v2 Evaluation**, **SysML v2 Textual Editor** → restart.

**Licence:** floating licence server **149.201.140.104 : 1101** — **requires the FH VPN**.

**Consequences (updated for 2026x)**
- Apollo 11 import: with native SysML v2 in 2026x, a clean import is now the *expectation*; any residual failures remain a *finding* (tool readiness; first *Validation* data point).
- The Java OpenAPI was designed for the UML/SysML v1 metamodel → whether 2026x exposes SysML v2 metaclasses through it is **still the top technical unknown**, just with much better odds (the OpenAPI spike (`09-technical-backlog.md`)).
- Bridge plugin must target the JDK 2026x ships with (verify; 2024x was Java 17).
- Possible bonus: 2026x's "enhanced REST APIs" may provide a standard SysML v2 API endpoint on the desktop — if so, CRUD/query tools of the bare bridge could be built on it and the Java plugin reserved for tool-native validation/evaluation. Check during the spike.
- VPN + licence-server dependency → threat to reproducibility, and a failure mode the batch runner must retry on (`04-evaluation-design.md`).
- **SysML v2 Evaluation** plugin exists → *Verification* (and the Phase 2 harness) have real tool-native capability to expose.

---

## Appendix B — Model candidates (decision record)

| Model | Origin | Size | Licence | Verdict |
|---|---|---|---|---|
| **Apollo 11 Mission** — `airbus/apollo-11-sysml-v2` | Airbus Central R&T (Helle, Schramm); INCOSE *Systems Engineering*, DOI 10.1002/sys.70074 | 28 files, ~7 200 LOC, ~2 000 defs/usages | MPL-2.0 | ✅ **Primary (D1).** 5-layer CoSMA framework (Purpose/Operational/Functional/Logical/Technical): stakeholders, needs, mission+functional+technical requirements, capabilities, mission phases (states), operations, functions, logical+technical components, ports, individuals, analysis/calc packages, views. Explicitly built as a "benchmark for next-generation MBSE tools"; citable journal paper; deliberately incomplete "scaffold" → natural source of *Create*/*fault correction* tasks |
| **GfSE SysML-v2-Models** | GfSE / RWTH SE | ~5 100 LOC over ~15 small models (VehicleModel 598 LOC, DroneModelLogical 455, EveOnline Mining Frigate ~2 500/17 files) | BSD-3 | ✅ **Secondary (D2).** Explicitly meant to "help train LLMs"; small self-contained models for unit-level tasks, generalisation checks, and "bad examples". Ships `CI/parse.py` + pilot-impl jar → reused as validity oracle |
| GfSE MBSE-WG robot-vacuum model | GfSE MBSE working group | small | ? | ⚠️ likely too small |
| OMG SysML-v2-Release examples | OMG pilot implementation | many small (Vehicle, Camera, Rover…) | LGPL | 🟡 syntax reference / few-shot material, **not** system under test |
| Elan8 examples | Elan8 (spec42 vendor) | medium | ? | 🟡 backup |
| Open-MBEE spacecraft example | OpenMBEE / JPL | small, notebook-based | Apache | 🟡 backup |

Both chosen sets are pure `.sysml` textual notation → must be **imported into MSoSA** (`09-technical-backlog.md`).

---
