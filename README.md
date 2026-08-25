# Semantic Knowledge Engineering

**Semantic Knowledge Engineering (SKE)** is an open initiative for authoritative semantic modeling, implementation projection, persistent publication, and executable knowledge in which **semantics remain explicit through execution**.

SKE is an initiative and governance/architecture repository. It is **not an ontology** and does not mint an `ske:` vocabulary merely to describe itself.

## Start here

SKE is easiest to understand as one connected path through several deliberately separate repositories:

```text
Authoritative semantic source / meaning
        ↓ represented and governed as
Semantic Model
        ↓ optionally projected into
Implementation Projection
        ↓ operationalized while preserving semantic lineage
Executable Semantic Knowledge Architecture
        ↓ tested against concrete evidence
Reference domains + industrial architecture cases
```

The repositories keep different ownership boundaries even when they participate in the same path:

1. **Start with SKE** for the initiative architecture, shared principles, repository map, and current sequencing.
2. **Read [SMO](https://github.com/GerhardBalz/semantic-modeling-ontology)** for the deliberately small reusable distinction between an authoritative `SemanticModel` and a non-authoritative `ImplementationProjection`.
3. **Read [ESKA](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture)** for the execution architecture under the principle that **semantics must remain explicit through execution**.
4. **Use [Pizza Ontology](https://github.com/GerhardBalz/pizza-ontology)** as the concrete preservation/reference and executable proving ground, then [Semantic Modeling Pizza](https://github.com/GerhardBalz/semantic-modeling-pizza) for the SMO-oriented reference path.
5. **Use [Semantic Modeling Wine/Food](https://github.com/GerhardBalz/semantic-modeling-wine-food)** as independent cross-domain evidence that tests which patterns actually generalize and which should remain local.
6. **Use [Semantic Agentic Network Operations](https://github.com/GerhardBalz/semantic-agentic-network-operations)** as an industrial architecture/reference-evidence case for testing semantic continuity from intent through governed tool execution to evidence without introducing a telecom ontology by default.

Useful shortcuts:

- **Ontology / Semantic Web / knowledge-graph practitioners:** Pizza Ontology → SMO → Semantic Modeling Pizza → Wine/Food.
- **Solution / enterprise / knowledge architects:** SKE principles → SMO → ESKA → reference evidence.
- **AI / agent architecture practitioners:** ESKA → Semantic Agentic Network Operations → Pizza executable evidence → SKE semantic-ownership and provenance boundaries.
- **Developers seeking a reproducible path:** Pizza Ontology and ESKA provide the densest executable examples and verification contracts.

The common rule is that a repository may consume, project, operationalize, or test semantics without silently becoming their authority.

For a cross-cutting orientation across standards, tooling, SKE concepts, related work and evidence, see the [SKE concept and responsibility map](landscape/concept-map.md). For source-grounded comparisons with independently developed approaches, see the [SKE related-work index](landscape/related-work/README.md).

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
| [Semantic Modeling Wine/Food](https://github.com/GerhardBalz/semantic-modeling-wine-food) | Semantic modeling reference example | Cross-domain SMO-oriented Wine/Food reference example built from historical W3C teaching-domain semantics | Example-local modeling evidence only; original Wine/Food authority remains external |
| [Semantic Agentic Network Operations](https://github.com/GerhardBalz/semantic-agentic-network-operations) | Industrial architecture / reference evidence | Technology-neutral agentic network-operations case testing semantic continuity across intent, tools, validation and evidence | No telecom ontology; cited telecom/standards concepts remain externally owned |
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

- [Semantics must remain explicit through execution](principles/execution-must-not-sever-semantics.md)
- [Semantic identity is independent of publication backend](principles/semantic-identity-independent-of-publication-backend.md)
- [Publication lifecycle](conventions/publication-lifecycle.md)
- [Semantic Markdown](conventions/semantic-markdown.md)

## Cross-repository decisions

SKE records decisions here only when the evidence and consequences genuinely span participating repositories. Semantic ownership remains with the owning repositories.

- [SMO–ESKA–Pizza alignment recommendation](decisions/smo-eska-pizza-alignment.md) — reviewed cross-repository alignment decision implemented in downstream repositories; the governed SMO and ESKA publication steps described by that cycle are complete.

## Current sequence

The active public initiative sequence is maintained in [roadmap/current-sequence.md](roadmap/current-sequence.md). The durable public handover checkpoint is [SKE #32](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/32).

Repository-local work remains authoritative in the relevant repository backlog; SKE links and sequences that work rather than duplicating it.

## Status

The public initiative/reference baseline now spans SKE, SMO, ESKA, Pizza Ontology, Semantic Modeling Pizza, Semantic Modeling Wine/Food, and Semantic Agentic Network Operations.

The initiative-level semantic-continuity work is complete: [SKE #39](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/39) was implemented through SKE PR #40 and reconciled downstream through ESKA PR #95.

Recent cross-cutting publication work is also complete: the concept/responsibility map was published through SKE PR #41, and reviewed related-work notes for AI Unified Process / Spec-Driven Development and Knowledge Spine were published through SKE PRs #42 and #43.

The only active public P1 gate is:

- [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) — external stewardship/provenance gate before any preservation/reference W3ID submission.

Pizza #4 remains parked until a concrete semantic-modernization requirement exists. SMO, ESKA, Semantic Modeling Pizza, Semantic Modeling Wine/Food, and Semantic Agentic Network Operations currently have no open repository-local issues.
