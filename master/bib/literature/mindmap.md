# Literature mind map — main subjects

> Working diagram (not thesis content). One root, two main points (MBSE, AI), each with their
> own children. Source-level leaves (theme → bib key) get added under each branch as literature
> research is grouped — see the "Quick reference by theme" table in `0. Index.md` for the current
> theme → source mapping to fold in here branch by branch.
>
> Renders directly in any Mermaid-aware viewer (VS Code Markdown preview with a Mermaid
> extension, GitHub, GitLab, Obsidian, mermaid.live). This file is the single source of truth.

```mermaid
flowchart TD
    Root(["AI Agents in SysML v2 Modeling<br/>MCP Bridge to MSoSA"])

    Root --> MBSE["MBSE"]
    Root --> AI["AI"]

    MBSE --> SysMLv2["SysML v2"]
    MBSE --> MSoSA["MSoSA"]
    MBSE --> EvalFW["MBSE / SysML v2<br/>Evaluation Framework"]

    EvalFW --> Create["Create"]
    EvalFW --> Patch["Patch"]
    EvalFW --> Delete["Delete<br/>(flag - drop if trivial)"]
    EvalFW --> Query["Query"]
    EvalFW --> Verification["Verification<br/>(ISO 15288)"]
    EvalFW --> Validation["Validation<br/>(ISO 15288)"]

    AI --> MCP["MCP"]
    AI --> Harness["AI Harness"]

    classDef root fill:#ffffff,stroke:#757575,stroke-width:2px,color:#1a1a1a,font-weight:bold;
    classDef mbse fill:#FFB575,stroke:#CC7830,stroke-width:2px,color:#542700,font-weight:bold;
    classDef mbseChild fill:#FFE6D1,stroke:#CC7830,stroke-width:1.5px,color:#542700;
    classDef mbseLeaf fill:#FFF1E5,stroke:#CC7830,stroke-width:1px,color:#542700;
    classDef ai fill:#9CE6FF,stroke:#2C97BB,stroke-width:2px,color:#1C4657,font-weight:bold;
    classDef aiChild fill:#D6F5FF,stroke:#2C97BB,stroke-width:1.5px,color:#1C4657;

    class Root root;
    class MBSE mbse;
    class AI ai;
    class SysMLv2,MSoSA,EvalFW mbseChild;
    class Create,Patch,Delete,Query,Verification,Validation mbseLeaf;
    class MCP,Harness aiChild;
```

**Open item:** "Delete" under Evaluation Framework is flagged — keep only if it turns out to be
a non-trivial capability to evaluate; drop otherwise.
