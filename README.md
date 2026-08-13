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

| Repository | Category | Role | Semantic ownership |
| --- | --- | --- | --- |
| [Semantic Knowledge Engineering](https://github.com/GerhardBalz/semantic-knowledge-engineering) | Initiative / governance | Initiative architecture, governance, shared conventions, roadmap and ecosystem map | No initiative vocabulary by default |
| [Semantic Modeling Ontology](https://github.com/GerhardBalz/semantic-modeling-ontology) | Semantic foundations | Small reusable semantic-modeling vocabulary | `SemanticModel`, `ImplementationProjection` |
| [Executable Semantic Knowledge Architecture](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture) | Execution architecture | Architecture for semantic continuity through execution, result, verification, service, agent and deployment concerns | ESKA execution architecture |
| [Pizza Ontology](https://github.com/GerhardBalz/pizza-ontology) | Reference / preservation project | Preservation/reference project and proving ground for the historical Pizza ontology and repository-authored evidence | Pizza domain semantics remain source-owned; repository owns preservation/reference evidence |
| [Semantic Modeling Pizza](https://github.com/GerhardBalz/semantic-modeling-pizza) | Semantic modeling reference example | SMO-oriented reference example using Pizza without taking ownership of the Pizza ontology | Example-local modeling and projection evidence only |
| [Semantic Modeling Wine/Food](https://github.com/GerhardBalz/semantic-modeling-wine-food) | Semantic modeling reference example | Bootstrap-pending Wine/Food reference example built from existing SKE/ESKA evidence | Example-local modeling evidence only; original Wine/Food authority remains external |
| [GerhardBalz/w3id.org](https://github.com/GerhardBalz/w3id.org) | Supporting publication infrastructure | Working fork used to prepare persistent identifier redirect changes for upstream `perma-id/w3id.org` | None; infrastructure only |

The repositories are related but independently governed. Shared conventions are adopted by participating repositories; they are not silently imposed by SKE.

The detailed repository responsibilities, lifecycle state and local backlog anchors are maintained in [architecture/repository-map.md](architecture/repository-map.md).

### Pizza preservation vs semantic-modeling reference example

`pizza-ontology` and `semantic-modeling-pizza` deliberately serve different purposes:

- **Pizza Ontology** preserves, references and tests the historical Pizza ontology and its repository-authored evidence without rewriting historical identity or claiming authority over upstream namespaces.
- **Semantic Modeling Pizza** is an SKE reference example for applying SMO-oriented modeling distinctions such as semantic model, implementation projection, runtime data, validation/inference evidence and agent contract.

Reusable findings should flow upward to SKE or SMO through explicit review rather than by silently generalizing example-specific choices.

## Initial principles and conventions

The first SKE baseline contains only material already supported by implemented cross-repository evidence:

- [Execution must not sever semantics](principles/execution-must-not-sever-semantics.md)
- [Semantic identity is independent of publication backend](principles/semantic-identity-independent-of-publication-backend.md)
- [Publication lifecycle](conventions/publication-lifecycle.md)
- [Semantic Markdown](conventions/semantic-markdown.md)

## Cross-repository decisions

SKE records decisions here only when the evidence and consequences genuinely span participating repositories. Semantic ownership remains with the owning repositories.

- [SMO–ESKA–Pizza alignment recommendation](decisions/smo-eska-pizza-alignment.md) — reviewed cross-repository alignment decision now implemented in downstream repositories, with final publication closure still gated by immutable ESKA W3ID activation.

## Current sequence

The active initiative sequence is maintained in [roadmap/current-sequence.md](roadmap/current-sequence.md). The durable handover checkpoint is [SKE #22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22), while [SKE #21](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/21) governs synchronization of this initiative map and roadmap.

Repository-local work remains authoritative in the relevant repository backlog; SKE links and sequences that work rather than duplicating it.

## Status

SKE is public and the bootstrap governance baseline is complete. Current independent work focuses on maintaining the authoritative initiative map, reconciling Pizza preservation/reference work, formalizing semantic-modeling reference examples, and completing publication gates only when their external dependencies are satisfied.
