# Mechanisms for Model Consistency: A Comparative Analysis of Guideline Implementation in SysML v1 and SysML v2

## Abstract

This paper conducts a comparative analysis of guideline implementation mechanisms in SysML v1 and SysML v2, focusing on their impact on automated verification. SysML v1 relies on **extrinsic mechanisms**—Profiles and Object Constraint Language (OCL)—requiring models to be **transformed** into external formalisms, which introduces semantic gaps. SysML v2 fundamentally shifts this paradigm by leveraging the Kernel Modeling Language (KerML) to enforce guidelines **intrinsically**. Through Metadata Definitions and the Definition/Usage separation, guidelines become native logical assertions. Verification evolves from model **transformation** to mathematical **reformulation**, enabling models to be solved directly as **Constraint Satisfaction Problems (CSPs)**. This formalization resolves v1's semantic ambiguities but shifts the burden of consistency from manual mapping accuracy to the computational management of NP-hard solution spaces.

---

## 1. Introduction

Modern Cyber-Physical Systems (CPS) combine mechanical, electronic, and software subsystems, making their development increasingly complex. Model-Based Systems Engineering (MBSE) addresses this complexity by using a centralized system model as the primary information source throughout the system lifecycle.

SysML v1, built as a UML extension, became the standard for CPS modeling but inherited limitations affecting expressiveness. SysML v2, built upon the Kernel Modeling Language (KerML), represents a complete overhaul with a formal semantic foundation crucial for precision and automation. However, abstract language capabilities still require mechanisms for implementing and enforcing modeling guidelines to ensure consistency across engineering teams.

The paper distinguishes between **verification** (proving design conformance to architectural/technical standards via requirements traceability and syntactic checking) and **validation** (proving system fulfillment of stakeholder requirements via behavioral simulation). The central research question asks: *How do the mechanisms for implementing modeling guidelines differ between SysML v1 and SysML v2, and how do these differences impact automated verification capabilities?*

---

## 2. Theoretical Background

### 2.1 SysML v1 Foundations

SysML v1 is a graphical, general-purpose modeling language adopted by OMG in 2007, serving as a foundational tool for specifying, analyzing, designing, and verifying complex multidisciplinary systems. It provides capabilities for formally capturing system requirements, structure, behavior, and parametric relationships. The language organizes constructs into four categories: **Structure** (BDDs for black-box definitions, IBDs for white-box internal structure), **Behavior** (State Machine, Sequence, Activity Diagrams), **Requirements** (natural language with logical links to model elements), and **Parametric** (mathematical constraints and equations, often requiring external tools for complex evaluations).

SysML v1 enables customization through UML **Profiles** and **Stereotypes**, which function as distinct metaclasses for tailoring the language to domain-specific needs. **Object Constraint Language (OCL)** provides formal expression of rules and invariants but only identifies valid states without calculating variables to reach them.

### 2.2 SysML v2 Foundations

SysML v2 was engineered independently from UML to overcome inherited limitations, focusing on precision, expressiveness, consistency, and extensibility. Its foundation is **KerML**, built on a three-layered architecture:

- **Root Layer**: Establishes syntactic scaffolding (Elements, Namespaces, Relationships) without model-level semantics.
- **Core Layer**: Introduces semantic foundation based on classification via first-order logic axioms, with Type as the central primitive.
- **Kernel Layer**: Adds specialized constructs (Data Types, Classes, Structures, Behaviors) for common modeling applications.

KerML achieves consistent semantics through formal mathematical logic and library-based ontological modeling. The Kernel Semantic Library is itself expressed in KerML, meaning all concepts are ultimately grounded in the same formal framework. Key SysML v2 features include: **Textual Notations** for interoperability and model exchange, **Standardized API** (SysML API) for Model-as-Code workflows, **Metadata Definitions** that define schemas (properties and constraints) extending the language's metaclasses to enable domain-specific modeling languages (DSMLs), **Constraints** via KerML constructs (assert, invariant, requirement) enabling models to be treated as solvable mathematical systems, and **Cases** (Analysis Case for quantitative analysis, Verification Case for qualitative analysis) for executable correctness checking.

### 2.3 Computational Solvers

Computational solvers automate the search for valid configurations within a design space by processing declarative constraints. Their utility differs fundamentally between versions due to the architectural shift from UML-based profiles to KerML's formal foundation.

---

## 3. Mechanisms for Guideline Implementation

### 3.1 SysML v1: Profile-Based Implementation

SysML v1 implements domain-specific guidelines through a multi-layer approach using **Stereotypes** to build custom profiles overlaying the native metamodel, introducing semantic labeling and domain terminology. The application of elements is restricted to stereotyped palettes ensuring domain-specific semantics.

- *Example*: Beers et al. extended the CallBehaviorAction metaclass to create a Process Operator stereotype for standardized system functions.

Since UML profiles cannot fully represent model constraints, **OCL** is layered onto profiles to specify invariants and complex relationships.

- *Example*: Enforcing VDI/VDE 3682's Product-Process-Resource concept required an OCL invariant attached to the Flow stereotype to prevent direct State-to-State connections.

### 3.2 SysML v2: Intrinsic Enforcement via Metamodel Definitions

SysML v2 implements guidelines **intrinsically** by allowing modelers to extend the language's ontology directly using KerML, removing the separation between model and rules.

#### Metamodel-Driven Guidelines

**Metadata Definitions** construct domain-specific metamodel hierarchies by specializing standard KerML constructs.

- *Code Listing 1 demonstrates the definition of a domain-specific metamodel for mechanical elements. Abstract metadata definitions (SolutionElementDef, ActiveSurfaceSetDef, ActiveSurfaceDef) are derived as specializations of SysML::PartDefinition, while PhyEffectDef specializes SysML::ConstraintDefinition. Corresponding metadata definitions for PartUsage and ConstraintUsage enable instantiation within system models.*

Enforcement occurs when components are instantiated using specific metadata definitions, guiding modelers to include required sub-elements.

- *Code Listing 2 demonstrates instantiation of a "Lubricated Mechanical Line Rolling Contact" using #SolutionElementDef, showing how physical effects, active surfaces, and materials are structured with explicit parameter bindings.*

#### Usage Definition Separation

SysML v2 distinguishes between **Definition** (reusable template with features/constraints acting as library elements) and **Usage** (occurrence within systems inheriting from definitions). This enables:

- **Structural Inheritance**: Usages automatically include all required internal structures mandated by guidelines.
- **Restricted Customization**: Internal structure is defined once in libraries; engineers interact only with exposed parameters while relying on validated internal logic.

This separation treats Definitions as the "Single Point of Truth" (SPOT), with Usages as pointers preventing redundant modeling and diverse formalization.

---

## 4. Mechanisms for Model Verification

### 4.1 SysML v1: Constraint Checking via Profiles and Model Transformation

SysML v1's verification capabilities are inherently limited by its UML-based architecture. While stereotypes provide structural consistency, they lack foundations for formal verification. OCL adds formal constraints, but native tools only verify syntactic correctness, not semantic validity.

**Semantic verification** requires external solvers, necessitating **transformation** of diagrams into compatible formats (OWL, SMT-LIB). Lu et al. demonstrated this by showing native SysML v1 tools passed models containing semantic contradictions; only after mapping to OWL DL axioms and applying an external inference engine (Pellet) was the logical inconsistency identified.

### 4.2 SysML v2: Formal Verification via Constraint Satisfaction

SysML v2's native constraints are built upon KerML's first-order logic foundation, allowing models to be directly interpreted as mathematical systems. Verification objectives encapsulated within the model ensure traceability independent of external tools. Models can be **reformulated** into **Constraint Satisfaction Problems (CSPs)**.

This process begins with compilation into a KerML abstract representation. The abstract syntax is then "flattened" to represent specific instances rather than generic types—cloning features from general definitions to specialized usages. KerML binding relationships identify set-intersections between variables and their constraints, producing a mathematically rigorous CSP with finite variable sets and domains (Boolean, Integer, Real).

- *Code Listing 3 demonstrates range-based semantics verification using a Tank part definition with oneOf operators for permissible dimensions, and a tankBigEnough requirement constraining derived volume. Constraint propagation algorithms reduce the design space, formally verifying design solutions against technical requirements through intrinsic SysML v2 semantics.*

Ratzke et al. introduced three range-based constraint operators: **oneOf** (exactly one value for variation), **anyOf** (any value for approximations/tolerances), and **allOf** (all values for operational envelopes).

---

## 5. Discussion

### 5.1 The Shift from Extrinsic to Native Constraints

#### From Transformation to Reformulation

SysML v1 requires a disjointed workflow: define model structure, annotate with **extrinsic** OCL constraints, then **transform** artifacts into formal languages (OWL, Alloy). This creates a "semantic gap" where discrepancies between the semi-formal UML metamodel and target logic corrupt design intent.

SysML v2 grounds the language in KerML (first-order logic), merging model definition and constraint specification into a single, natively formal step. A single SysML v2 model can act as a "formal base ontology" verifiable across diverse mathematical domains—from theorem proving (Imandra) to model checking (Gamma)—without the ambiguity of profile-based transformation. However, native declarative constraints (e.g., anyOf ranges) must still be **reformulated** into solver-specific inputs (e.g., Linear Programming) for analysis. Thus, the burden shifts from transforming the model to generate meaning to reformulating the mathematical definition for computational efficiency.

### 5.2 Scalability and Complexity

In SysML v1, the primary bottleneck was the **fidelity** of mapping between modeling tools and external solvers. In SysML v2, where concepts are native logical assertions, the bottleneck shifts to the **solvability** of resulting mathematical structures.

Compiling SysML v2 models into inequality systems structures analysis as CSPs, exposing verification to computational limits—CSP solvers are classified as NP-hard in best cases and NP-complete in others. The "cost" of consistency is no longer paid in manual transformation effort but in algorithmic runtime. Verification time can grow non-linearly with model size due to logical dependency graph depth, contrasting with SysML v1's computationally lightweight (though semantically shallow) OCL-based checks.

To manage complexity, reformulated systems must adhere to strict compositional refinement. Decomposing high-level requirements into independent component architectures enables verification on atomic blocks rather than monolithic systems, ensuring proof complexity grows linearly with structural decomposition rather than exponentially with state space.

---

## 6. Conclusion and Outlook

The comparative analysis reveals a fundamental paradigm shift from **extrinsic** constraint application in SysML v1 to **intrinsic** semantic definition in SysML v2.

**SysML v1** relies on extrinsic constraints via stereotypes and OCL. Verification requires **transforming** models into external formalisms (e.g., OWL)—a disjointed process susceptible to semantic gaps where design intent is often lost.

**SysML v2** utilizes a metamodel-driven approach grounded in KerML. Guidelines become intrinsic properties inherited through Definition/Usage separation. The first-order logic foundation shifts verification from **transformation** to **reformulation**, allowing models to be solved directly as **Constraint Satisfaction Problems (CSPs)**.

While semantic formalization enhances consistency, it introduces scalability challenges as verification becomes bound by NP-hard CSP computational limits. Future research priorities include:

- Decomposition strategies to manage state-space growth
- Standardized semantic libraries replacing ad-hoc constraint definitions
- Metamodel-driven tools automating consistency checking against formal ontology
- "Model as Code" workflows enabling transpilation for theorem provers and model checkers (Imandra, Gamma)
- Bridging static structural verification and dynamic behavioral validation
