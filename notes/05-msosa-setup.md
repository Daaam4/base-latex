# MSoSA at the FH — what we actually have (source: Seminar course material)

> Source: FH ILIAS course folder "SysMLv2 Tool" (provided during the WS seminar).
> ⚠️ **This is the seminar-era version — it may have been updated since.** Confirm with Prof. Voss / FH IT whether a newer build (2025x / 2026x) is available.

---

## 1. Facts from the course page

**Download:** `SysMLv2 Tool - MSOSA` — *Magic System of Systems Architect* (3.4 GB), via sciebo FH Aachen.

**Artifact:** `No_Magic_2024x_Refresh2_HF1.AM_NM_Academic.AllOS.2-5.zip`
→ **version 2024x Refresh2 HF1**, **Academic** licence, all-OS, **portable (no_install) zip**.

**Installation recipe (verbatim steps):**
1. Unpack `No_Magic_2024x_Refresh2_HF1.AM_NM_Academic.AllOS.2-5.zip`.
2. Inside, unpack `AM_NM_Academic.AllOS\2\Magic Systems of Systems Architect (Application)\Magic_Systems_of_Systems_Architect_2024x_Refresh2_HF1_no_install.zip` → this directory is called **MSOSA**.
3. Edit `MSOSA/bin/msosa.properties`: append to the `JAVA_ARGS` line the feature flag
   `-Dmd.sysml2.enabled\=d69e2255-b8f5`
4. Run `MSOSA/bin/msosa.exe`. On error: install **OpenJDK 17** and select it when prompted.
5. Menu bar → **Help > Resource/Plugin Manager**.
6. If not already set, choose resource location `MSOSA\data\resourcemanager\distribution\core.rdzip`.
7. Under **"Plugins (no cost)"** install: **SysML v2**, **SysML v2 Evaluation**, **SysML v2 Textual Editor** → restart `msosa.exe`.

**Licence:** floating licence server **149.201.140.104 : 1101** — **requires the FH VPN**.

---

## 2. What this answers

| Open question | Answer |
|---|---|
| Which MSoSA version does the FH have? | **2024x Refresh2 HF1** (seminar-era; possibly newer now) |
| Community Edition 500-element limit a problem? | **No** — we have the full **Academic** licence via the FH licence server. Apollo 11 (~2 000 elements) is not blocked by a licence cap. |
| Is SysML v2 available at all? | **Yes**, but only behind a **feature flag** (`-Dmd.sysml2.enabled`) plus three "no cost" plugins: SysML v2, SysML v2 **Evaluation**, SysML v2 **Textual Editor**. |
| Does the SysML v2 *Evaluation* capability exist? | **Yes** — the `SysML v2 Evaluation` plugin is installable → relevant for the **Verifizierung** use case (expression evaluation). |
| Teamwork Cloud? | **Not mentioned.** Only a desktop/portable install + a floating licence server. → assume **no TWC** until proven otherwise. |

---

## 3. Consequences for the thesis

### 3.1 Bridge option: B becomes the default
No Teamwork Cloud ⇒ **no standard SysML v2 REST API endpoint** (that API is served by TWC, not by the desktop client).
→ **Option B (MagicDraw/Cameo OpenAPI Java plugin inside MSoSA)** is the realistic path; Option A stays as related work / future work, and as an argument about tool-agnosticism.

Implications to write up:
- The bridge talks to the **live in-tool model** via the Java OpenAPI, not to a repository over HTTP.
- No commits/branches ⇒ "persistent repository state" framing weakens; reframe as **live in-session model state** (still distinct from all file-based work, which is the actual differentiator).
- Prior art `ajhcs/cameo-mcp-bridge` does exactly this for **SysML v1/UML** → it becomes the *structural* template and the closest prior art to differentiate from (we do SysML v2 + systematic evaluation).
- The 2024x plugin set gives us the two tool-native capabilities H2 depends on: **validation suites** + **SysML v2 Evaluation**.

### 3.2 Version risk: 2024x Refresh2 is early SysML v2
SysML v2 support in 2024x is feature-flagged and plugin-based — i.e. **incubator-grade**. Risks:
- Textual import of a 7 kLOC / ~2 000-element model (Apollo 11) may partially fail or be slow.
- The Java OpenAPI may not expose SysML v2 elements as first-class objects (it was designed for the UML/SysML v1 metamodel). **This is the single biggest technical unknown.** If SysML v2 elements are not reachable through the OpenAPI, Option B collapses and we need a rethink (e.g. drive the Textual Editor, or reconsider the file-based paradigm).
- **Mitigation / silver lining:** whatever fails is a *finding*. Import problems and API gaps are legitimate results about industrial SysML v2 tool readiness, and the first data points for *Validierung*.

- [ ] **Priority spike (do before the exposé promises anything):** install MSoSA, enable the flag, install the three plugins, import one small GfSE model, then check in a trivial Java plugin whether SysML v2 elements are visible/creatable through the OpenAPI.
- [ ] Ask whether a **newer MSoSA build (2025x / 2026x)** is available — SysML v2 support improved substantially and is no longer feature-flagged in later releases.
- [ ] Ask explicitly about **Teamwork Cloud** (even a trial/eval instance would unlock Option A and the standard-API framing).

### 3.3 Practical / operational
- **FH VPN is required for the licence** ⇒ every evaluation run depends on VPN + licence-server availability. Plan for: batch runs, retry on licence checkout failure, and document this as a threat to reproducibility.
- Portable zip ⇒ easy to version-pin the exact tool build in the thesis (good for reproducibility: state `2024x Refresh2 HF1` + plugin versions + the feature flag).
- OpenJDK 17 is the runtime ⇒ the bridge plugin must target **Java 17**.
- 3.4 GB download; note the exact archive name in the thesis setup appendix.

---

## 4. To state in the thesis (reproducibility appendix)

Tool: Magic Systems of Systems Architect **2024x Refresh2 HF1** (Academic), portable distribution, OpenJDK 17,
SysML v2 support enabled via `-Dmd.sysml2.enabled` with plugins *SysML v2*, *SysML v2 Evaluation*, *SysML v2 Textual Editor*;
floating licence from the FH licence server (VPN-gated). No Teamwork Cloud instance available.
