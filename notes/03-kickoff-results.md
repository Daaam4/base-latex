# Kickoff Meeting — Results (07.09.2026, Prof. Voss)

## Decisions

1. **Model:** use an existing, sufficiently large **open-source SysML v2 model** — not a self-built toy model.
   Prof. Voss pointed to the **Airbus** model and the **GfSE (Gesellschaft für Systems Engineering)** collection.
   → Candidates evaluated in `04-model-candidates.md`. Primary pick: **Airbus Apollo 11** (`airbus/apollo-11-sysml-v2`).
2. **Use cases + evaluation:** define a clear catalogue of agent use cases and evaluate each. Named by Prof. Voss:
   - *Korrektur* (correction / repair of faulty model elements)
   - *Abfragen* (querying / information retrieval from the model)
   - *Validierung* (validation — is the model well-formed / consistent / guideline-conformant?)
   - *Verifizierung* (verification — does the model satisfy its requirements / constraints?)
   - *Erstellen* (creation — add new elements / packages from NL input)
   - "etc." → we may add e.g. *Erklären* (explain/summarise) and *Refactoring* if scope allows.
3. **Interface:** build an **MCP server / bridge to Magic Systems of Systems Architect (MSoSA)** — industry standard, FH has a licence.
   → Replaces the earlier plan of wrapping the *pilot* SysML v2 REST API. See `04-model-candidates.md` §3 for the API options.
4. **Zweitprüfer:** Prof. Hüner.

## Next steps (agreed)

| When | What |
|---|---|
| **by 30.09.2026** | Exposé (max. 2 pages) → `pages/101expose.tex` |
| from end Sep / early Oct | weekly status meeting for all Bachelor/Master students of Prof. Voss |
| parallel | first technical implementation (bridge to MSoSA + load model) |

## Open questions to clarify with Prof. Voss / FH IT

- [ ] Which MSoSA version does the FH have? (SysML v2 support requires **2024x Refresh / 2025x+**; SysML v2 REST API is served by **Teamwork Cloud (TWC)**, not by the desktop tool alone.)
- [ ] Is a **Teamwork Cloud** instance available? If not → bridge via **MagicDraw OpenAPI (Java plugin)** instead of REST API.
- [ ] Is the free **CATIA Magic SysML v2 Community Edition** (500-element limit) an acceptable fallback for development? (Apollo 11 has ~2 000 elements → exceeds limit → need the full licence for the real model.)
- [ ] LLM access: which providers/budget may be used (OpenAI/Anthropic API vs. local models)?
- [ ] Language of the thesis: English (as the seminar paper) — confirm.
