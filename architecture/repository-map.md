# SKE initiative repository map

This document is the authoritative initiative-level map of repositories participating in Semantic Knowledge Engineering (SKE).

SKE owns this cross-repository view: roles, boundaries, sequencing and links to local backlogs. Each participating repository remains authoritative for its own semantics, implementation, publication state and repository-local work.

## Repository categories

### Initiative / governance

#### `GerhardBalz/semantic-knowledge-engineering`

**Purpose:** Provide the initiative-level architecture, shared conventions, cross-repository decisions, dependency view and roadmap.

**Semantic ownership:** None by default. SKE does not mint an `ske:` vocabulary merely to describe initiative governance.

**Important relationships:** Coordinates SMO, ESKA, preservation/reference projects and semantic-modeling examples without taking their local ownership.

**Lifecycle/status:** Public; governance baseline and authoritative repository map established. SKE #22 remains the durable handover checkpoint while the roadmap records current state.

**Authoritative backlog:** [SKE issues](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues), with [#22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22) as the current durable handover checkpoint.

### Semantic foundations

#### `GerhardBalz/semantic-modeling-ontology`

**Purpose:** Provide a small, standards-aligned ontology for authoritative semantic models and their non-authoritative implementation projections.

**Semantic ownership:** `smo:SemanticModel` and `smo:ImplementationProjection`, plus any future vocabulary added only when justified by evidence.

**Important relationships:** Canonical reusable semantic-modeling concepts are consumed by ESKA and reference examples. ESKA preserves its compatibility surface through `eska:SemanticModel owl:equivalentClass smo:SemanticModel`.

**Lifecycle/status:** Public; v0.1.0 current and immutable W3ID publication complete. Downstream Pizza and ESKA alignment work tracked by SMO #11 is complete.

**Authoritative backlog:** [SMO issues](https://github.com/GerhardBalz/semantic-modeling-ontology/issues). Completed alignment record: [#11](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/11).

### Execution architecture

#### `GerhardBalz/executable-semantic-knowledge-architecture`

**Purpose:** Define and demonstrate an architecture in which execution, validation, inference, services, agents and deployment remain connected to authoritative semantics.

**Semantic ownership:** ESKA execution architecture and ESKA-owned concepts. It does not duplicate reusable semantic-modeling concepts merely for symmetry.

**Important relationships:** Uses SMO for the canonical reusable `SemanticModel` concept while preserving ESKA compatibility. Pizza and Wine/Food provide proving-ground evidence.

**Lifecycle/status:** Public; core 0.2.0 compatibility bridge, governed `eska-v0.2.0` release, immutable W3ID routes and external route verification are complete.

**Authoritative backlog:** [ESKA issues](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues). Completed alignment/publication gates: [#84](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/84) and [#87](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/87).

### Reference / preservation projects

#### `GerhardBalz/pizza-ontology`

**Purpose:** Preserve and reference the historical Pizza ontology, recover useful engineering evidence around it, and provide a proving ground for publication, resolution, validation and execution concerns.

**Semantic ownership:** Historical Pizza semantics remain source-owned. Repository-authored preservation, provenance, validation and implementation evidence is owned locally. The repository does not claim authority over `co-ode.org` and does not rewrite historical Pizza 2.0 identity merely to improve resolution.

**Important relationships:** Supplies source material and evidence to ESKA and to the separate Semantic Modeling Pizza reference example. Proposed W3ID identifiers are preservation/reference PIDs, not replacement Pizza ontology namespaces.

**Lifecycle/status:** Public; SMO evidence-sidecar adoption and preservation/reference implementation are complete. Pizza #72 remains active solely around the external stewardship/provenance feedback gate and subsequent W3ID lifecycle decision. PR #73 is closed as superseded; PR #76 is merged.

**Authoritative backlog:** [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72). No Pizza W3ID registration should be submitted until external feedback is received and assessed.

### Semantic modeling reference examples

#### `GerhardBalz/semantic-modeling-pizza`

**Purpose:** Demonstrate SKE/SMO semantic-modeling distinctions using Pizza as a concrete reference domain.

**Semantic ownership:** Example-local modeling and projection evidence only. It does not own or replace the historical Pizza ontology.

**Important relationships:** Explicitly consumes ideas and artifacts from SKE, SMO and Pizza Ontology while keeping semantic model, implementation projection, runtime data, validation/inference evidence and agent contract distinct. Reusable findings should be surfaced upward through explicit SKE/SMO review.

**Lifecycle/status:** Formal SKE reference-example baseline complete via Semantic Modeling Pizza #4 / reviewed PR #5. Repository visibility remains a deliberate governance decision.

**Authoritative backlog:** [Semantic Modeling Pizza issues](https://github.com/GerhardBalz/semantic-modeling-pizza/issues). Completed formalization record: [#4](https://github.com/GerhardBalz/semantic-modeling-pizza/issues/4).

#### `GerhardBalz/semantic-modeling-wine-food`

**Purpose:** Provide a semantic-modeling reference example based primarily on the W3C OWL Wine and Food teaching/reference material while preserving original authority and identity.

**Semantic ownership:** Example-local modeling evidence only. Original Wine/Food semantic authority remains external. Repository representations must not be confused with semantic authority.

**Important relationships:** Builds on existing SKE reference-corpus research and ESKA Wine/Food import-closure evidence. Lehigh Wine Benchmark material remains benchmark/execution evidence distinct from the historical Wine/Food teaching/reference model.

**Lifecycle/status:** Bootstrap complete via Wine/Food #1 / reviewed PR #2. The baseline records provenance and licensing boundaries without redistributing historical ontology bytes, includes a minimal SMO-oriented model and deterministic validation, and deliberately keeps repository visibility private for now.

**Authoritative backlog:** [Semantic Modeling Wine/Food issues](https://github.com/GerhardBalz/semantic-modeling-wine-food/issues). Completed bootstrap record: [#1](https://github.com/GerhardBalz/semantic-modeling-wine-food/issues/1).

### Supporting publication infrastructure

#### `GerhardBalz/w3id.org`

**Purpose:** Provide a working fork for preparing redirect changes destined for the upstream `perma-id/w3id.org` service.

**Semantic ownership:** None. This repository is infrastructure and is not a conceptual SKE initiative repository.

**Important relationships:** Supports persistent publication for SMO, ESKA and potentially other initiative artifacts after repository-local governance gates are satisfied.

**Lifecycle/status:** Supporting fork. ESKA core 0.2.0 upstream routing is merged and externally verified. Future publication work remains governed by the repository that owns each identifier lifecycle.

**Authoritative backlog:** Publication work remains governed by the repository that owns the identifier lifecycle and by the corresponding upstream W3ID pull request.

## Boundary: Pizza Ontology vs Semantic Modeling Pizza

The separation is intentional and should remain explicit.

`pizza-ontology` is concerned with preservation, referenceability, historical identity, provenance and proving-ground engineering around the Pizza ontology. It must avoid silently modernizing or replacing source-owned semantics.

`semantic-modeling-pizza` is concerned with the modeling architecture demonstrated using Pizza: which artifact is authoritative semantic content, which artifacts are implementation projections, which data is runtime evidence, and how validation, inference and agent-facing contracts remain distinct.

The reference example may consume Pizza artifacts, but it does not become their semantic authority.

## Current backlog anchors

The initiative-level sequence points to repository-owned items rather than duplicating their implementation detail:

- durable handover checkpoint — [SKE #22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22)
- Pizza preservation/reference lifecycle — [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) — active external-feedback gate
- completed SMO downstream alignment — [SMO #11](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/11)
- completed ESKA SemanticModel alignment — [ESKA #84](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/84)
- completed ESKA core 0.2.0 W3ID activation — [ESKA #87](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/87)
- completed Semantic Modeling Pizza formalization — [Semantic Modeling Pizza #4](https://github.com/GerhardBalz/semantic-modeling-pizza/issues/4)
- completed Semantic Modeling Wine/Food bootstrap — [Semantic Modeling Wine/Food #1](https://github.com/GerhardBalz/semantic-modeling-wine-food/issues/1)

Possible future examples such as Travel remain candidates only. They are not part of the repository map until a repository actually exists and has an explicit initiative role.
