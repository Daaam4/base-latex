# Vendor & practitioner posts (grey literature)

**Type:** vendor marketing / practitioner blogs / product documentation
**Role in the thesis:** evidence of **industrial adoption and motivation**, never evidence of capability. Every claim here is cited as a *claim*, explicitly marked as unvalidated.

---

## 1. Dassault Systèmes — MCP integration for CATIA MBSE
- Commercial MCP integration announced for CATIA/MBSE.
- Claims ~**"200 % productivity"** — **no published evidence, no methodology, no benchmark**.
- **Relevance:** the strongest single motivation sentence for the thesis — industry is deploying exactly this integration pattern while the evidence base is empty. Cite for motivation and then explicitly note the absence of validation.
- [ ] Locate a stable citable URL + date

## 2. Dassault 3DSwym — "SysML v2 REST API Demo – Querying"
- Demonstrates an MBSE + AI workflow against the Teamwork Cloud SysML v2 API.
- **Relevance:** shows the vendor's own framing of API-driven agent access; background for why Option A exists as a paradigm (not used here — D13 locks Option B).

## 3. No Magic / CATIA Magic — SysML v2 Solution product documentation
- Claims **100 % metamodel conformance**, two-way textual ⇄ graphical sync, **model validation suites** (KerML/SysML rules + custom rules), **model evaluation** (expression language, requirement verification), simulation.
- **Teamwork Cloud** serves the standard SysML v2 REST API; the desktop client does not. **MagicLab** (2026x) is a web-based read-only SysML v2 reader.
- Free **Community Edition** capped at 500 major elements.
- **Relevance:** the factual basis for the bridge design and for H2's "tool-native semantics" arm — the validation suites and expression evaluation we exploit are documented here. **Bib key:** `nomagic-sysml2`
- ⚠️ Vendor claims (esp. "100 % conformance") must be reported as claims, and ideally spot-checked in the spike.

## 4. Stephan Roth — roth-soft.de
- Practitioner framing of MCP + SysML v2.
- **Relevance:** community context; shows the idea is circulating outside academia. Low evidential weight.

## 5. sysml2kit blog (John Hodge, 08/2026)
- Documents the SysML v2 tooling landscape as of August 2026.
- Notes that the **textual syntax and REST API have been formal OMG standards since September 2025** — useful for framing the timeliness argument.
- **Relevance:** landscape orientation + a datable standardisation fact.

---

## Citation policy for this folder
1. Used for **motivation, adoption, and tool facts** — never as evidence of agent capability.
2. Every performance claim is attributed and marked unvalidated.
3. Product documentation is preferred over marketing posts where both exist.
4. Access dates recorded (these pages change without notice).
