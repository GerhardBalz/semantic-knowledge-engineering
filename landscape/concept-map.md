# SKE concept and responsibility map

## Purpose

This document is a compact orientation map for the Semantic Knowledge Engineering (SKE) initiative.

It answers three different questions that should not be collapsed into one taxonomy:

1. **What kind of thing is this?** — standard, vocabulary, syntax, protocol, tool, infrastructure, SKE-owned architecture/concept, related work, or reference evidence.
2. **What architectural concern does it serve?** — identity, semantic modeling, execution, provenance, publication, tooling, agent/application integration, and related evidence.
3. **What is its status here?** — used/exercised, referenced/compared, candidate, or externally owned.

The central rule is:

> **Do not infer architectural equivalence from a flat technology list.**

For example, OWL, OAK, W3ID and PROV-O are not peers: they are different kinds of things serving different concerns.

This map is intentionally concise. Detailed standards status, reuse decisions, and alignment analysis remain in the existing SKE landscape documents.

## 1. Kind of thing

| Kind | Examples | SKE interpretation |
| --- | --- | --- |
| Foundational data model / semantic standard / vocabulary | IRI, RDF, RDFS, OWL, SKOS, SHACL, SPARQL, PROV-O, DCTERMS, DCAT, MOD | Reuse established semantics rather than minting SKE replacements |
| Concrete syntax / serialization | Turtle, RDF/XML, JSON-LD, OWL Functional Syntax | Representation format; not semantic identity or authority |
| Protocol / interface contract | MCP, HTTP, OpenAPI | May expose or mediate capabilities; not semantic authority by itself |
| Tool / library / runtime | Protégé, ODK, ROBOT, OAK, HermiT, RDFLib, pySHACL | Replaceable implementation choices that may satisfy architecture contracts |
| Engineering / publication infrastructure | Git, GitHub, CI, releases, W3ID, content negotiation | Supports reproducibility, review and stable resolution; does not own meaning |
| SKE-owned architecture / semantic concept | SKE, SMO, ESKA, `SemanticModel`, optional `ImplementationProjection` | Exists only where established standards do not already own the concern |
| Related work / adjacent architecture | independently developed methodologies and architectures | Compare in their own terms before drawing SKE conclusions |
| Reference / falsification evidence | Pizza, Semantic Modeling Pizza, Wine/Food, SANO, bounded ESKA specimens | Tests whether SKE ideas survive concrete use; does not automatically create reusable vocabulary |

## 2. Architectural concerns

### 2.1 Identity and graph substrate

Question:

> How are semantic resources identified and represented at the graph level?

Includes:

- URI / IRI;
- namespaces;
- RDF and RDF datasets;
- RDFS;
- concrete RDF serializations such as Turtle, RDF/XML and JSON-LD.

Guardrail:

> **Identity, graph model and serialization are separate concerns.**

A semantic model is not identical to a file format, repository path or hosting URL.

### 2.2 Semantic meaning, schema, concepts and constraints

Question:

> How is machine-interpretable meaning represented?

Keep these roles distinct:

```text
OWL   → formal ontology semantics / entailment
SKOS  → concept schemes / knowledge organization
SHACL → RDF graph constraints / validation descriptions
SMO   → SKE role for governed semantic-model artifacts and optional projections
```

A concrete resource may legitimately carry more than one role. For example, an OWL ontology may also be treated as an `smo:SemanticModel` when the SKE role is useful.

Guardrail:

> **SMO does not replace OWL, SKOS or SHACL.**

### 2.3 Requirements and modeling practice

Question:

> What should a semantic model answer or cover?

Includes:

- scope and competency questions as modeling practice;
- MOD `mod:competencyQuestion` where textual competency questions are recorded as ontology metadata.

Guardrail:

> **Competency questions are a modeling/requirements technique; MOD is ontology metadata.**

### 2.4 Query and operational / executable semantics

Question:

> What operation is performed on semantic knowledge?

The current evidence supports a deliberately polymorphic view:

```text
Ontology        → reason
Knowledge graph → query
Constraint      → validate
Rule            → evaluate
Decision        → decide
Calculation     → calculate
Mapping         → transform
Workflow        → execute
Capability      → invoke
```

Representative mechanisms include:

- SPARQL;
- OWL reasoners;
- SHACL validation;
- rule evaluation;
- DMN;
- OpenMath;
- semantic mappings;
- BPMN.

ESKA provides architecture around heterogeneous execution mechanisms. It does not require one universal executable representation.

### 2.5 Provenance, metadata, cataloguing and evidence description

Question:

> How are artifacts described, related and traced?

Keep these concerns distinct:

```text
DCTERMS → describe and relate artifacts
DCAT    → catalog datasets and distributions
MOD     → describe ontologies and ontology-specific metadata
PROV-O  → describe derivation, activities, generation and lineage
Git     → record engineering changes and review history
```

Guardrail:

> **Engineering history is not automatically semantic provenance.**

Use established metadata/provenance vocabularies when their semantics fit; do not mint generic SKE replacements.

### 2.6 Persistent publication and resolution

Question:

> How does stable semantic identity remain resolvable independently of replaceable hosting?

Includes:

- ontology, version and term IRIs;
- W3ID;
- content negotiation;
- Git tags and GitHub Releases as governed publication artifacts;
- checksums and immutable release assets where needed.

Guardrail:

> **W3ID is resolution infrastructure, not semantic authority. GitHub hosting is not semantic identity.**

### 2.7 Ontology engineering, access, validation and runtime tooling

Question:

> Which replaceable tools implement authoring, lifecycle, access, inference and validation?

Current initiative evidence includes:

- Protégé — ontology authoring/exploration;
- ODK — ontology development/build/release lifecycle;
- ROBOT — command-line ontology operations, QC, reasoning and verification;
- OAK — ontology access/query/analysis abstraction;
- HermiT — OWL reasoning;
- RDFLib — RDF parsing/query/transformation/runtime support;
- pySHACL — SHACL validation runtime.

A useful distinction is:

```text
ODK → ontology production / development / release
OAK → ontology consumption / access / query / analysis
```

Tools may realize SKE/ESKA contracts; they do not become the contract or semantic authority.

### 2.8 SKE semantic-modeling and execution architecture

Question:

> What does SKE add after established standards and tooling are reused?

Current responsibility split:

```text
SKE
  initiative architecture / governance / responsibility map

SMO
  SemanticModel
  ImplementationProjection — optional

ESKA
  executable semantic knowledge
  capability / applicability
  execution
  result
  verification
  service / agent / deployment concerns
```

Key invariants:

- **Projection or derivation does not transfer semantic authority.**
- **Semantics must remain explicit through execution.**
- `ImplementationProjection` is optional; a source-owned semantic artifact may participate directly in execution.

### 2.9 Agent and application integration

Question:

> How do applications and agents discover, invoke, mediate and govern semantic capabilities?

Includes:

- ESKA service/operation/access/deployment/agent concerns;
- APIs and OpenAPI where they are application/interface contracts or deliberate implementation projections;
- MCP where it is a suitable protocol/tool-mediation realization;
- SANO as industrial architecture/reference evidence around governed agent tool access, intent translation, validation, observability and audit.

Guardrail:

> **MCP is not semantic authority and not the whole agent architecture.**

### 2.10 Related work and evidence

Question:

> What independently developed work or concrete evidence challenges, complements or falsifies the SKE architecture?

Keep two categories separate:

**Related work / adjacent methodology**

- independently developed semantic, executable-knowledge, specification-driven or agentic architectures;
- public related-work notes only after source-grounded review.

**Reference / falsification evidence**

- Pizza Ontology;
- Semantic Modeling Pizza;
- Semantic Modeling Wine/Food;
- Semantic Agentic Network Operations;
- bounded ESKA executable specimens covering reasoning, validation, rules, decisions, calculations, mappings, workflows and related tooling experiments.

Guardrails:

- related work is not evidence that SKE is correct;
- a reference example is not automatically a source of reusable vocabulary;
- negative evidence is useful when a proposed abstraction or technology is unnecessary.

## 3. Evidence status

A concept appearing in this map does not imply initiative adoption.

Use these status distinctions when reading SKE material:

| Status | Meaning |
| --- | --- |
| **used / exercised** | Present in current governed artifacts or executable evidence |
| **referenced / compared** | Deliberately analyzed but not an implementation dependency |
| **candidate / experiment** | Proposed for future evidence and not yet demonstrated |
| **external source authority** | Standard, semantics or domain material is owned elsewhere and consumed or referenced by SKE |

Examples of currently exercised concerns include RDF/RDFS/IRI, OWL, SHACL, SPARQL, PROV-O, DCTERMS, DCAT, MOD, W3ID and several ontology-engineering/runtime tools.

Some broader ecosystem tools or related architectures may be discussed without being current initiative dependencies. Treat that distinction as intentional.

## 4. A compact responsibility view

```text
Identity / graph substrate
        ↓
Semantic meaning / constraints
        ↓
Semantic Model — when a governed aggregate role is useful
        ↓
Implementation Projection — only when a projection is actually needed
        ↓
Executable semantic mechanisms
        ↓
Execution / Result / Verification
        ↓
Service / Agent / Application integration
        ↓
Evidence / provenance / publication
```

This is a **responsibility path**, not a mandatory technology stack.

A source-owned semantic artifact may skip the projection step and participate directly in execution. Likewise, an application may need only a subset of the concerns shown here.

## 5. What this map is not

This document does not:

- define a new SKE taxonomy or ontology;
- make every listed technology a dependency;
- promote ecosystem tools merely because they are relevant in principle;
- centralize semantic authority under SKE;
- require every domain to use RDF/OWL/SHACL;
- require an `ImplementationProjection` in every execution path;
- turn reference examples into normative architecture;
- replace the detailed standards and tooling analysis already maintained elsewhere.

## 6. Deeper references

Use this map for orientation, then follow the concern into the detailed source:

- [Modern ontology-engineering reference landscape](ontology-engineering.md)
- [SMO v0.1 standards-alignment assessment](smo-v0.1-standards-alignment.md)
- [ESKA standards and tooling alignment](eska-standards-tooling-alignment.md)
- [Conformance terminology](conformance-terminology.md)
- [Reference ontology corpus](reference-ontology-corpus.md)
- [SKE repository map](../architecture/repository-map.md)
- [SKE current sequence](../roadmap/current-sequence.md)

For execution-specific related work and evidence, also see the [ESKA repository](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture).

## Decision rule

When evaluating a new standard, tool, methodology, architecture or reference domain, ask in this order:

1. **What kind of thing is it?**
2. **Which architectural concern does it actually serve?**
3. **Who owns its semantics or authority?**
4. **What evidence status does it have here?**
5. **Does an established standard already own the needed semantics?**
6. **What independent value would adopting or modeling it add?**
7. **What should remain deliberately absent?**

That discipline is more important than maximizing the number of concepts shown in the map.