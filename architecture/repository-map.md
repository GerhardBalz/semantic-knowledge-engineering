# SKE initiative repository map

This document is the authoritative initiative-level map of repositories participating in Semantic Knowledge Engineering (SKE).

SKE owns this cross-repository view: roles, boundaries, sequencing and links to local backlogs. Each participating repository remains authoritative for its own semantics, implementation, publication state and repository-local work.

## Initiative / governance

### `GerhardBalz/semantic-knowledge-engineering`

**Purpose:** Initiative-level architecture, shared conventions, cross-repository decisions, dependency view and roadmap.

**Semantic ownership:** None by default. SKE does not mint an `ske:` vocabulary merely to describe initiative governance.

**Lifecycle/status:** Public; governance baseline and repository map established. The original SKE #22 execution sequence is complete. SKE #25 is the current cross-example semantic-modeling evidence review.

**Backlog:**

- [SKE #22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22) — durable handover checkpoint;
- [SKE #25](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/25) — active Pizza ↔ Wine/Food evidence review before any further SMO expansion.

## Semantic foundations

### `GerhardBalz/semantic-modeling-ontology`

**Purpose:** A small, standards-aligned ontology for authoritative semantic models and their non-authoritative implementation projections.

**Semantic ownership:** Governed SMO v0.1 currently owns `smo:SemanticModel` and `smo:ImplementationProjection`. Additional vocabulary requires explicit evidence and governance.

**Important relationships:** ESKA uses `smo:SemanticModel` as the canonical reusable concept while preserving its compatibility surface. Reference examples must distinguish published SMO terms from local experiments.

**Lifecycle/status:** Public; v0.1.0 and immutable W3ID publication complete; downstream alignment through completed SMO #11 is complete. No active implementation issue currently justifies vocabulary expansion.

## Execution architecture

### `GerhardBalz/executable-semantic-knowledge-architecture`

**Purpose:** Define and demonstrate an architecture in which execution, validation, inference, services, agents and deployment remain connected to authoritative semantics.

**Semantic ownership:** ESKA execution architecture and ESKA-owned concepts. Execution signatures or evidence structures must not migrate into SMO merely for cross-repository symmetry.

**Lifecycle/status:** Public; core 0.2.0 SMO compatibility bridge, governed release, immutable W3ID routes and external verification are complete. No active implementation issue currently requires work.

## Reference / preservation projects

### `GerhardBalz/pizza-ontology`

**Purpose:** Preserve and reference the historical Pizza ontology, recover useful engineering evidence around it, and provide a proving ground for publication, resolution, validation and execution concerns.

**Semantic ownership:** Historical Pizza semantics remain source-owned. The repository does not claim authority over `co-ode.org` and does not rewrite Pizza 2.0 ontology/version/entity identity merely to improve resolution.

**Lifecycle/status:** Public; preservation/reference implementation is complete through PR #76. The stewardship/provenance gate recorded in Pizza #72 still requires external feedback before any W3ID submission. GitHub currently shows #72 closed even though its own lifecycle is incomplete; a backlog-integrity comment was added and a manual reopen is required because the automated reopen action was blocked.

**Backlog:**

- [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) — **should be open**; external stewardship/provenance and W3ID lifecycle gate;
- [Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) — parked trigger-based evaluation of a separate successor ontology lineage; revisit only on a concrete semantic modernization requirement.

## Semantic modeling reference examples

### `GerhardBalz/semantic-modeling-pizza`

**Purpose:** Demonstrate semantic-modeling distinctions using Pizza as a concrete reference domain without becoming the authority for the historical Pizza ontology.

**Important relationships:** The example distinguishes semantic models, purpose-specific modeling, runtime data, validation/inference evidence and operational artifacts. Reusable findings are reviewed through SKE before promotion into SMO or ESKA.

**Lifecycle/status:** Private; formal SKE reference-example baseline complete. A live integrity issue remains: current artifacts still contain pre-governance experimental `smo:` terms under the old GitHub namespace while governed SMO v0.1 uses `https://w3id.org/smo#` with a deliberately minimal vocabulary.

**Backlog:**

- [Semantic Modeling Pizza #6](https://github.com/GerhardBalz/semantic-modeling-pizza/issues/6) — active; align current artifacts with governed SMO v0.1 and isolate experimental vocabulary;
- repository `BACKLOG.md` — candidate cross-example questions on competency questions, projection scope, signatures, evidence/provenance and visibility.

### `GerhardBalz/semantic-modeling-wine-food`

**Purpose:** Test the semantic-modeling reference-example pattern against the W3C OWL Wine and Food teaching/reference domain while preserving external authority and identity.

**Important relationships:** The purpose-specific Wine/Food model derives from two external semantic models and therefore provides independent evidence for source-lineage and competency-question questions raised by Pizza.

**Lifecycle/status:** Private; bootstrap complete. It correctly uses governed `https://w3id.org/smo#` and currently introduces only `smo:SemanticModel`. No implementation projection or executable recommendation proving ground exists yet.

**Backlog:** No open issue. The next proposed local experiment is to make the existing meal-course competency question machine-checkable, exercise one deterministic recommendation/query/validation path, test whether explicit projection exclusions are useful, and report the evidence to SKE #25. The automated attempt to create that issue was blocked, so it is not yet a GitHub issue.

## Supporting publication infrastructure

### `GerhardBalz/w3id.org`

**Purpose:** Working fork for redirect changes destined for upstream `perma-id/w3id.org`.

**Semantic ownership:** None. This is supporting infrastructure, not a conceptual SKE repository.

**Lifecycle/status:** ESKA core 0.2.0 upstream routing is merged and externally verified. Future publication work remains governed by the repository that owns each identifier lifecycle.

## Boundary: Pizza Ontology vs Semantic Modeling Pizza

The separation is intentional:

- `pizza-ontology` owns preservation/reference engineering around historical Pizza identity;
- `semantic-modeling-pizza` owns example-local semantic-modeling experiments and must not become the authority for historical Pizza semantics.

A local cache, implementation projection, runtime artifact or agent contract never becomes the historical ontology merely because it is derived from it.

## Current backlog anchors

```text
SKE
  #22  durable handover checkpoint
  #25  ACTIVE — cross-example Pizza ↔ Wine/Food evidence review

SMO
  no active implementation issue

ESKA
  no active implementation issue

Pizza Ontology
  #72  SHOULD BE OPEN — stewardship/W3ID external gate; manual reopen required
  #4   PARKED — successor ontology only on concrete semantic trigger

Semantic Modeling Pizza
  #6   ACTIVE — governed SMO alignment / experimental vocabulary isolation

Semantic Modeling Wine/Food
  no open issue; second-domain executable evidence issue proposed
```

## Evidence rule

Do not create reusable SMO or ESKA vocabulary merely because a concept appears in one reference example. Prefer established standards first, require independent cross-domain evidence, and keep ownership boundaries explicit.

See [the current sequence](../roadmap/current-sequence.md) and [the Pizza ↔ Wine/Food evidence review](../analysis/semantic-modeling-cross-example.md).
