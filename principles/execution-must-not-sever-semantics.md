# Execution must not sever semantics

## Principle

**Execution must not sever semantics.**

When formal knowledge becomes executable, its semantic identity, meaning, applicability, inputs, outputs, results, and provenance should remain explicitly traceable rather than being reconstructed from implementation code after the fact.

## Why this is shared

This principle originated as a defining ESKA invariant, but the implemented Pizza → ESKA boundary shows that it has initiative-level relevance:

- Pizza remains authoritative for domain semantic artifacts;
- ESKA consumes those artifacts through immutable source bindings rather than copying and re-owning them;
- execution records connect capabilities, semantic models, executable artifacts, results, verification, and provenance;
- operational Service, Agent, and Deployment layers remain separable from the semantic source.

The principle therefore governs the relationship between semantic modeling and execution without moving ESKA's detailed execution semantics into SKE.

## Consequences

Architectures following this principle should prefer explicit machine-readable continuity from semantic source to operational result. Implementation convenience alone is not sufficient justification for replacing semantic identifiers, duplicating semantic ownership, or reducing meaning to undocumented runtime behavior.

Detailed execution concepts and their formal vocabulary remain owned by ESKA.

## Provenance

Primary implemented evidence: [Executable Semantic Knowledge Architecture](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture) and its source-owned Pizza integration with [pizza-ontology](https://github.com/GerhardBalz/pizza-ontology).
