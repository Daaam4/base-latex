# Tooling: MSoSA setup, versions, models

> Agent context for the Master's thesis. Human-facing status lives in `0. OVERVIEW.md`.
> Do not duplicate status here; this file holds stable context.

## Appendix A — MSoSA setup (what the FH has)

> Source: FH ILIAS course folder "SysMLv2 Tool" (WS seminar). ⚠️ Seminar-era — a newer build may exist (§5.1).
> Goes into the thesis reproducibility appendix verbatim.

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

**Consequences already acted on**
- SysML v2 is **feature-flagged / incubator-grade** in 2024x → Apollo 11 import may partially fail. Whatever fails is a *finding* (tool readiness; first *Validierung* data point), not only a setback.
- The Java OpenAPI was designed for the UML/SysML v1 metamodel → whether it exposes SysML v2 is the **top technical unknown** (the OpenAPI spike (`.pi/context/09-technical-backlog.md`)).
- Bridge plugin must target **Java 17**.
- VPN + licence-server dependency → threat to reproducibility, and a failure mode the batch runner must retry on (`.pi/context/04-evaluation-design.md` (statistical design)).
- **SysML v2 Evaluation** plugin exists → *Verifizierung* and H2's semantic arm have real tool-native capability to expose.

---

## Appendix B — Model candidates (decision record)

| Model | Origin | Size | Licence | Verdict |
|---|---|---|---|---|
| **Apollo 11 Mission** — `airbus/apollo-11-sysml-v2` | Airbus Central R&T (Helle, Schramm); INCOSE *Systems Engineering*, DOI 10.1002/sys.70074 | 28 files, ~7 200 LOC, ~2 000 defs/usages | MPL-2.0 | ✅ **Primary (D1).** 5-layer CoSMA framework (Purpose/Operational/Functional/Logical/Technical): stakeholders, needs, mission+functional+technical requirements, capabilities, mission phases (states), operations, functions, logical+technical components, ports, individuals, analysis/calc packages, views. Explicitly built as a "benchmark for next-generation MBSE tools"; citable journal paper; deliberately incomplete "scaffold" → natural source of *Erstellen*/*Korrektur* tasks |
| **GfSE SysML-v2-Models** | GfSE / RWTH SE | ~5 100 LOC over ~15 small models (VehicleModel 598 LOC, DroneModelLogical 455, EveOnline Mining Frigate ~2 500/17 files) | BSD-3 | ✅ **Secondary (D2).** Explicitly meant to "help train LLMs"; small self-contained models for unit-level tasks, H3 generalisation, and "bad examples". Ships `CI/parse.py` + pilot-impl jar → reused as validity oracle |
| GfSE MBSE-WG robot-vacuum model | GfSE MBSE working group | small | ? | ⚠️ likely too small |
| OMG SysML-v2-Release examples | OMG pilot implementation | many small (Vehicle, Camera, Rover…) | LGPL | 🟡 syntax reference / few-shot material, **not** system under test |
| Elan8 examples | Elan8 (spec42 vendor) | medium | ? | 🟡 backup |
| Open-MBEE spacecraft example | OpenMBEE / JPL | small, notebook-based | Apache | 🟡 backup |

Both chosen sets are pure `.sysml` textual notation → must be **imported into MSoSA** (§6.2).

---
