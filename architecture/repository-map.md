# SKE initiative repository map

This document is the authoritative initiative-level map of repositories participating in Semantic Knowledge Engineering (SKE).

SKE owns the cross-repository roles, boundaries, sequencing and backlog links. Each participating repository remains authoritative for its own semantics, implementation and publication state.

## Initiative / governance

### `GerhardBalz/semantic-knowledge-engineering`

**Purpose:** Initiative architecture, shared conventions, cross-repository decisions, dependency view and roadmap.

**Semantic ownership:** None by default. SKE does not mint an `ske:` vocabulary merely to describe governance.

**Lifecycle/status:** Public. SKE #27 is the current durable handover. SKE #25 / PR #26 completed the first Pizza ↔ Wine/Food evidence review; the post-experiment conclusions are recorded in `analysis/semantic-modeling-cross-example.md`.

## Semantic foundations

### `GerhardBalz/semantic-modeling-ontology`

**Purpose:** A small, standards-aligned ontology for authoritative semantic models and their non-authoritative implementation projections.

**Semantic ownership:** Governed SMO v0.1 owns `smo:SemanticModel` and `smo:ImplementationProjection`. Additional vocabulary requires standards-first evidence and governance.

**Lifecycle/status:** Public; v0.1.0 and immutable W3ID publication complete. [SMO #22](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/22) is the active evidence-backed evaluation of whether a semantic-model → competency-question relation belongs in SMO.

**Boundary:** SMO #22 is evaluation work, not authorization for broad vocabulary expansion.

## Execution architecture

### `GerhardBalz/executable-semantic-knowledge-architecture`

**Purpose:** Define and demonstrate an architecture in which execution, validation, inference, services, agents and deployment remain connected to authoritative semantics.

**Semantic ownership:** ESKA execution architecture and ESKA-owned concepts. Execution signatures and evidence structures do not migrate into SMO merely for symmetry.

**Lifecycle/status:** Public; core 0.2.0 SMO alignment and immutable W3ID publication complete. No active ESKA issue is justified by the current Pizza/Wine-Food evidence cycle.

## Reference / preservation projects

### `GerhardBalz/pizza-ontology`

**Purpose:** Preserve and reference the historical Pizza ontology and provide a proving ground for publication, resolution, validation and execution concerns.

**Semantic ownership:** Historical Pizza semantics remain source-owned. The repository does not claim authority over `co-ode.org` or rewrite Pizza 2.0 ontology/version/entity identity merely to improve resolution.

**Lifecycle/status:** Public. [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) is reopened and remains the active stewardship/provenance + W3ID lifecycle gate. No Pizza W3ID submission occurs before external feedback is received and assessed.

**Backlog:** [Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) remains parked until a concrete semantic-modernization requirement justifies a successor ontology lineage.

## Semantic modeling reference examples

### `GerhardBalz/semantic-modeling-pizza`

**Purpose:** Demonstrate semantic-modeling distinctions using Pizza without becoming authority for the historical Pizza ontology.

**Lifecycle/status:** Private; formal reference-example baseline complete. Semantic Modeling Pizza #6 / PR #7 completed governed SMO v0.1 alignment, removing the misleading pre-governance SMO surface from current artifacts.

**Current evidence:** competency-question semantics are useful locally; explicit exclusions remain Pizza-local; source/derivation/representation relationships prefer established vocabularies.

### `GerhardBalz/semantic-modeling-wine-food`

**Purpose:** Test the semantic-modeling reference-example pattern against W3C OWL Wine and Food while preserving external authority and identity.

**Lifecycle/status:** Private; bootstrap plus executable second-domain evidence are complete. Wine/Food #3 / PR #4 added a deterministic recommendation path, explicit dual-source lineage and a machine-expressible competency question.

**Current evidence:** competency-question semantics recur independently; explicit exclusions were not needed; no `smo:ImplementationProjection` was justified; no reusable operation-signature or recommendation-evidence abstraction was required.

## Supporting publication infrastructure

### `GerhardBalz/w3id.org`

**Purpose:** Working fork for redirect changes destined for upstream `perma-id/w3id.org`.

**Semantic ownership:** None. This is supporting infrastructure, not a conceptual SKE repository.

**Lifecycle/status:** ESKA core 0.2.0 routing is merged and externally verified. Future identifier publication remains governed by the repository owning each lifecycle.

## Boundary: Pizza Ontology vs Semantic Modeling Pizza

`pizza-ontology` owns preservation/reference engineering around historical Pizza identity. `semantic-modeling-pizza` owns example-local semantic-modeling experiments. A cache, purpose-specific model, implementation projection, runtime artifact or agent contract never becomes the historical ontology merely because it is derived from it.

## Current backlog anchors

```text
SKE
  #27  ACTIVE — durable handover
  #25  COMPLETE — Pizza ↔ Wine/Food evidence review

SMO
  #22  ACTIVE — evaluate SemanticModel ↔ competency-question relation

ESKA
  no active implementation item from this evidence cycle

Pizza Ontology
  #72  ACTIVE — stewardship/W3ID external gate
  #4   PARKED — successor ontology on concrete semantic trigger only

Semantic Modeling Pizza
  #6   COMPLETE — governed SMO alignment

Semantic Modeling Wine/Food
  #3   COMPLETE — executable second-domain recommendation evidence
```

## Evidence rule

Do not create reusable SMO or ESKA vocabulary merely because a concept appears in one reference example. Prefer established standards first, require independent cross-domain evidence, and preserve ownership boundaries.

See [the current sequence](../roadmap/current-sequence.md) and [the Pizza ↔ Wine/Food evidence review](../analysis/semantic-modeling-cross-example.md).