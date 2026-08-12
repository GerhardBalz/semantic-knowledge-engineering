# Semantic Knowledge Engineering

**Semantic Knowledge Engineering (SKE)** is an open initiative for authoritative semantic modeling, implementation projection, persistent publication, and executable knowledge without severing semantics.

SKE is an initiative and governance/architecture repository. It is **not an ontology** and does not mint an `ske:` vocabulary merely to describe itself.

## Scope

SKE owns cross-repository material that is useful precisely because it spans more than one participating repository:

- initiative-level architecture and ecosystem relationships;
- evidence-backed shared principles;
- shared engineering, documentation, and publication conventions;
- cross-repository decisions when a decision genuinely spans repository boundaries;
- dependency and adoption sequencing.

SKE does **not** become authoritative for semantic concepts owned by participating repositories. Repository-local rules may specialize or override shared conventions when the local reason is explicit.

## Initiative map

| Repository | Role | Semantic ownership |
| --- | --- | --- |
| [Semantic Knowledge Engineering](https://github.com/GerhardBalz/semantic-knowledge-engineering) | Initiative architecture, governance, shared conventions, roadmap and ecosystem map | No initiative vocabulary by default |
| [Semantic Modeling Ontology](https://github.com/GerhardBalz/semantic-modeling-ontology) | Small reusable semantic-modeling vocabulary | `SemanticModel`, `ImplementationProjection` after stable publication |
| [Executable Semantic Knowledge Architecture](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture) | Architecture for semantic continuity through execution, result, verification, service, agent and deployment concerns | ESKA execution architecture |
| [Pizza Ontology](https://github.com/GerhardBalz/pizza-ontology) | Preservation/reference project and proving ground | Pizza domain semantics and source-owned semantic artifacts |

The repositories are related but independently governed. Shared conventions are adopted by participating repositories; they are not silently imposed by SKE.

## Initial principles and conventions

The first SKE baseline contains only material already supported by implemented cross-repository evidence:

- [Execution must not sever semantics](principles/execution-must-not-sever-semantics.md)
- [Semantic identity is independent of publication backend](principles/semantic-identity-independent-of-publication-backend.md)
- [Publication lifecycle](conventions/publication-lifecycle.md)
- [Semantic Markdown](conventions/semantic-markdown.md)

## Current sequence

The active initiative sequence is maintained in [roadmap/current-sequence.md](roadmap/current-sequence.md). The bootstrap and acceptance contract are tracked in [SKE #1](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/1).

## Status

SKE is private during bootstrap review. Public visibility is a governance milestone after the initiative boundaries, first principles, and first shared conventions have been reviewed.
