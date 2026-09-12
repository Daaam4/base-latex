
***Evaluating AI Agent Capabilities in SysML v2 Modeling via a Semantic MCP Interface***

## 1. Was ich mache & was das Ziel ist

### Die Kernidee in einem Satz

> Ich finde **empirisch** heraus, was KI-Agenten in einer echten SysML-v2-Modellierungsumgebung zuverlässig können und was nicht — und wie das Design der Werkzeuge, die man ihnen gibt, diese Grenze verschiebt.

### Das Problem

1. Bisherige Forschung testet fast nur **One-Shot-Generierung**: „Hier ist eine Anforderungsbeschreibung, erzeuge ein SysML-v2-Modell.“ Fertig.
2. Was **niemand** systematisch untersucht hat: Ein Agent, der über viele Tool-Aufrufe hinweg mit einem **lebenden Modell-Repository** arbeitet — Elemente abfragen, navigieren, ändern, validieren, über Commits und Branches hinweg.
3. Es gibt zwar schon MCP-Server, die Agenten an die SysML-v2-REST-API anbinden — aber sie sind **dünne Wrapper** (1 Tool = 1 REST-Endpoint) und **keiner wurde je evaluiert**. 
   Dassault behauptet „200 % Produktivität“ — ohne jeden Beleg.
4. Technisches Grundproblem obendrauf: Die Standard-API kann **keine Beziehungen traversieren** (DLR: >10 s pro Traversierungsquery bei großen Modellen). Damit scheitern nicht-triviale Agentenaufgaben schon an der Infrastruktur.

### Was ich konkret mache (4 Arbeitspakete)

**1. Semantischer MCP-Server (das Instrument, ~5 Wochen)**
Ein MCP-Server über der SysML-v2-REST-API mit drei Schichten, die dünne Wrapper nicht haben:
- **Graph-Cache** (SQLite, Sync via `diffCommits()`) → löst das Traversierungsproblem
- **Aufgabenorientierte Tools** (`trace_requirement`, `get_dependency_tree`) statt roher CRUD-Endpoints
- **Agentenfreundliche Antworten** (begrenzte Kontextgrößen, typisierte Schemas, schrittweise Erkundung)

**2. Benchmark (~3 Wochen)**
Eine Aufgabensammlung mit 6 Schwierigkeitsstufen — von L1 „Was sind die Attribute von X?“ bis L6 „Zerlege das Subsystem, alloziere Anforderungen, validiere“ — jeweils mit Ground-Truth-Modellen und definierten Erfolgskriterien.

**3. Evaluation (das Herzstück, ~4 Wochen)**
KI-Agenten lösen die Benchmark-Aufgaben — **in zwei Bedingungen**:
- **Bedingung A:** dünner Wrapper (der existierende Open-MBEE-Server)
- **Bedingung B:** mein semantischer Server

Gemessen wird mehrdimensional: Aufgabenerfolg, Wiederholbarkeit (pass^k), syntaktische Validität, semantische Korrektheit, Traceability-Erhalt, Edit-Qualität, Tool-Effizienz — plus eine **Katalogisierung der Fehlermodi** (halluzinierte Parameter, Abbruch mitten im Workflow, invertierte Bedingungslogik …).

**4. Schriftliche Arbeit** (parallel ab Woche 1, intensiv ab Dezember)

### Das Ziel / Ergebnis

Am Ende steht eine **Fähigkeits- und Grenzkarte**:

- *Welche* Aufgabentypen schaffen Agenten zuverlässig, welche fragil, welche gar nicht?
- *Woran* scheitern sie genau (Fehlertaxonomie)?
- *Wie viel* davon liegt am Tool-Design? → Das beantwortet der A/B-Vergleich. Und wichtig: **beide Ausgänge sind ein Ergebnis.** Hilft der semantische Server → Tool-Design ist der Hebel. Hilft er nicht → dünne Wrapper reichen (würde den aktuellen CAE-Befund bestätigen). Ich kann nicht „verlieren“.

**Merksatz:** *Der Server ist das Instrument — die Evaluation ist der Beitrag.* Ich baue kein Produkt, ich baue einen Messapparat und liefere die erste systematische Vermessung von KI-Agenten am lebenden SysML-v2-Repository.

**Warum es relevant ist:** Industrie rollt genau solche Integrationen gerade aus (Dassault), die Literatur fordert explizit Benchmarks, und die drei nächstverwandten Arbeiten (SEI, Hardware-MCP-Benchmark, CAE-Studie) sind alle aus den letzten Wochen — ich besetze eine Lücke, die sich gerade schließt: die **Repository-Seite** hat noch niemand vermessen.

---

## 2. Compressed Timeline Proposal (~19 working weeks: 07.09 → 19.01)

| Phase | Weeks | Dates | Deliverable |
|-------|-------|-------|-------------|
| Literature + design | 1–4 | 07.09 – 04.10 | Related-work draft, task taxonomy v1, server architecture, exposé |
| Server implementation | 5–9 | 05.10 – 08.11 | Working MCP server: graph cache, CRUD, traversal + validity tools |
| Benchmark construction | 9–11 | 02.11 – 22.11 | Ground-truth model scenarios per task level (overlaps server hardening) |
| Evaluation runs | 12–15 | 23.11 – 20.12 | Agent runs, scoring, failure coding; thin-wrapper ablation *if time allows* |
| Write-up | 15–19 | 14.12 – 19.01 | Full thesis; Christmas window = writing, not evaluation runs |

> Structure mapping from the 6-month plan: Months 1–2 → 4 weeks, Months 3–4 → 7 weeks, Month 5 → 4 weeks, Month 6 → 5 weeks. **No slack** — every week of implementation overrun comes directly out of evaluation or write-up. Mitigation: write continuously from week 1 (related work + methodology chapters can be drafted before results exist).

**Descoping levers (discuss which are acceptable):**
- Evaluate 1 agent/model family instead of 2–3 (drop Claude vs. GPT comparison)
- Reduce task taxonomy from 6 levels to 4 (drop L5 conditional reasoning, merge L6)
- Drop the thin-wrapper ablation (biggest cut — but ablation is the strongest evidence for the "semantic" design claims)
- Reuse an existing open reference model (e.g., SysML v2 release examples) instead of authoring ground-truth models from scratch
- pass^k with k=3 instead of k=5

---

## 3. Fragen an Prof. Voss

### Umfang & Erwartungen
1. Passt die aktuelle Ausrichtung für Sie — die Evaluation als Kernbeitrag, der Server als Instrument? Oder erwarten Sie, dass das Software-Artefakt stärker im Vordergrund steht?
   
2. Wie rigoros muss die Evaluation für eine Masterarbeit sein — reicht ein gut begründetes Framework mit einer Pilot-Evaluation, oder erwarten Sie statistisch belastbare Ergebnisse (pass^k, mehrere Modelle)?
   
3. Welche der Descoping-Optionen (siehe oben) halten Sie angesichts der 20 Wochen für vertretbar?
   
4. Welche Anwendungsdomäne soll den Benchmark verankern — Automotive, Avionik — oder gibt es in Ihrer Gruppe ein Referenzmodell, das ich nutzen sollte?
   
5. Gibt es laufende oder frühere Arbeiten in Ihrer Gruppe, auf denen ich aufbauen sollte bzw. die ich nicht duplizieren darf (MCP, SysML-v2-API, Agenten-Evaluation)?

### Formalitäten & Organisation
6. Gibt es Vorgaben zum Seitenumfang?
   
7. Meilensteinen?
   
8. Wie sollen wir uns abstimmen — regelmäßige Meetings (z. B. alle zwei Wochen)?
   
9. Wer übernimmt die Zweitprüfung — und muss ich mich selbst darum kümmern?

### Ressourcen
9. Im Seminar hatten wir Zugang zu **Magic System of Systems Architect** — steht der auch zur Verfügung, bzw. gibt es andere relevante Tools? 
   (**SysIDE Automator** - Python library developed by [Sensmetry](https://sensmetry.com/syside/) that allows you to programmatically access, analyze, validate, and optimize SysML v2 models)
   
10. Gibt es bestehende SysML-v2-Modelle aus Ihrer Gruppe oder von Industriepartnern, die ich als Benchmark-Material verwenden darf?

---

## 4. Things to Confirm Before Leaving the Meeting

- [ ] Scope agreed: which descoping levers apply
- [ ] Use-case domain decided
- [ ] Target SysML v2 platform decided
- [ ] Meeting cadence agreed
- [ ] Next concrete milestone + date (e.g., "Exposé / detailed outline in 2 weeks")

---

## 5. What to Skim Tonight (priority order)

1. [[1. Evaluating AI Agent Capabilities in SysML v2 Modeling via a Semantic MCP Interface|Idea 1 write-up]] — re-read fully; this is your script
2. **DLR DASC 2025** (elib.dlr.de/214792) — the traversal-limitation paper; it's your technical motivation for the graph cache
3. **SysTemp** (arXiv 2506.21608) — the "no benchmark exists" gap citation
4. Skim your own [[0. Index|literature index]] — be able to name the 5 papers and their gaps in one sentence each
5. Glance at Open-MBEE flexo-mms-sysmlv2-mcp repo README — so you can say concretely why it's a "thin wrapper"

---

## 6. Anticipated Pushback & Answers

| Likely question | Your answer |
|---|---|
| "MCP servers already exist — what's novel?" | The gap isn't the server, it's the evaluation. None of the existing servers have been benchmarked. Plus: semantic layer (traversal, task-oriented tools) addresses the DLR-documented API limitation that thin wrappers can't. |
| "Is 4.5 months enough to build AND evaluate?" | Yes with descoping: reuse reference models, limit to 4 task levels, 1 agent family. Ablation is stretch goal. Writing overlaps with evaluation from week 11. |
| "How do you measure 'semantic correctness'?" | Expert-defined acceptance criteria per task (DUCTILE approach) + metamodel conformance + diff against ground-truth models. Not LLM-as-judge alone. |
| "What if the agent just fails at everything / succeeds at everything?" | Either outcome is a valid result — the contribution is the capability map and failure taxonomy, not a success story. Task levels L1–L6 are graded in difficulty precisely to locate the boundary. |
| "Why interactive agents and not generation?" | Generation is well-covered (SysTemp, SysForge, my 5 lit-index papers). Persistent tool-using agents on live models is what industry is deploying (Dassault) with zero published evidence. |
 