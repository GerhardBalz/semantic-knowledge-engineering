# Semantics must remain explicit through execution

## Principle

**Semantics must remain explicit through execution.**

When formal knowledge participates in execution — directly or through implementation projections — the semantics relevant to that execution should remain available, inspectable, and traceable to their authoritative source rather than becoming recoverable only by reverse-engineering code, configuration, mappings, prompts, APIs, or runtime behavior.

This is a continuity requirement, not a requirement to reproduce the complete authoritative semantic model inside every implementation artifact.

## Derived requirements

The principle implies at least four engineering requirements:

- **preservation** — execution must not change or lose the meaning relevant to the operation;
- **traceability** — executable constructs and runtime evidence remain traceable to the semantic constructs and authoritative sources from which they derive;
- **explicitness / inspectability** — relevant semantics remain accessible rather than existing only implicitly in implementation detail;
- **provenance** — projections, transformations, executions, and results retain enough evidence to understand their semantic lineage.

## Continuity test

A useful conceptual test is whether the path remains navigable from authoritative meaning into execution:

```text
Authoritative semantics
        ↓
Semantic Model
        ↓
Implementation Projection — when used
        ↓
Executable Semantic Knowledge
        ↓
Execution / result / evidence
```

and back again for inspection and explanation:

```text
Execution / result / evidence
        ↑
Executable Semantic Knowledge
        ↑
Implementation Projection — when used
        ↑
Semantic Model
        ↑
Authoritative semantics
```

An implementation projection, when used, may deliberately contain only the subset of semantics required for its purpose. A semantic artifact may also participate in execution directly. In either case, the relevant meaning and its lineage must remain explicit and traceable through the representation and execution chain.

## Why this is shared

This principle originated as a defining ESKA invariant, but implemented and reference evidence shows that it has initiative-level relevance:

- Pizza remains authoritative for domain semantic artifacts;
- ESKA consumes those artifacts through immutable source bindings rather than copying and re-owning them;
- execution records connect capabilities, semantic models, executable artifacts, results, verification, and provenance;
- operational Service, Agent, and Deployment layers remain separable from the semantic source;
- the Semantic Agentic Network Operations reference case tests the same continuity question across intent translation, tool execution, validation, and evidence without turning telecom concepts into SKE vocabulary.

The principle therefore governs the relationship between semantic modeling and execution without moving ESKA's detailed execution semantics into SKE or expanding SMO for symmetry.

## Relationship to the previous wording

The earlier formulation:

> **Execution must not sever semantics.**

remains useful as a memorable explanatory shorthand. It describes an important failure to avoid, but it is no longer the normative initiative-level definition.

The preferred hierarchy is:

1. **Semantics must remain explicit through execution.** — primary principle;
2. preservation, traceability, inspectability, and provenance — derived engineering requirements;
3. **Execution must not sever semantics.** — optional explanatory shorthand.

The historical filename of this document is retained so existing links remain stable; the title and content above define the current principle.

## Informal illustration: 42

As a deliberately non-normative intuition:

> **“42” is data; the missing question is semantics.**

An answer may be computed successfully and still be unusable as knowledge when the question, context, and trace of how the answer was produced have been lost. In architectural terms, the relevant semantic context needs to remain explicit and traceable through execution to the result.

This is only an explanatory aside—not evidence for the principle, not a formal data-to-knowledge model, and not new SKE/SMO/ESKA vocabulary.

## Consequences

Architectures following this principle should prefer explicit machine-readable continuity from semantic source to operational result. Implementation convenience alone is not sufficient justification for replacing semantic identifiers, duplicating semantic ownership, or reducing meaning to undocumented runtime behavior.

The principle does not require one universal runtime representation. RDF/OWL, SHACL, APIs, JSON, code, configuration, tool contracts, and other implementation forms may each play different roles as long as authority, relevant meaning, projection boundaries where projections exist, and lineage remain clear.

Detailed execution concepts and their formal vocabulary remain owned by ESKA.

## Provenance

Primary implemented evidence remains the [Executable Semantic Knowledge Architecture](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture) and its source-owned Pizza integration with [Pizza Ontology](https://github.com/GerhardBalz/pizza-ontology). The [Semantic Agentic Network Operations](https://github.com/GerhardBalz/semantic-agentic-network-operations) repository provides an additional industrial architecture/reference-evidence case for testing the continuity requirement.
