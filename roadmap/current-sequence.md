# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The durable handover checkpoint for the current state is [SKE #22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22). This sequence should remain synchronized with that checkpoint and with the actual repository-local backlog state.

## 1. Initiative map and roadmap synchronization — current

[SKE #21](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/21) is the initiative-level housekeeping gate.

Required outcome:

- keep the README initiative map complete;
- maintain [the authoritative repository map](../architecture/repository-map.md);
- distinguish conceptual repositories, reference examples and publication infrastructure;
- keep `pizza-ontology` and `semantic-modeling-pizza` responsibilities explicit;
- represent `semantic-modeling-wine-food` accurately while its bootstrap is incomplete;
- point to repository-local backlog anchors rather than duplicating their implementation detail.

Once this synchronization is reviewed and merged, #21 can be closed and the roadmap should continue to be maintained as repository state changes.

## 2. ESKA core 0.2.0 publication dependency — externally gated

The ESKA semantic and release work behind the SMO compatibility bridge is complete:

- the core `0.2.0` SMO compatibility bridge was merged;
- governed release `eska-v0.2.0` was published;
- release evidence was recorded;
- immutable historical releases remain untouched.

The remaining publication dependency is upstream:

```text
perma-id/w3id.org#6543
Add immutable ESKA core 0.2.0 redirects
```

Repository-local completion gate: [ESKA #87](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/87).

Dependent issues [ESKA #84](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/84) and [SMO #11](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/11) remain open until the immutable route is merged and externally live-verified.

Do not create additional ESKA or SMO semantic work merely while waiting for this external dependency.

## 3. Pizza preservation/reference reconciliation — next independent work

Current parent backlog: [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72).

Two implementation lines are open:

- [Pizza PR #73](https://github.com/GerhardBalz/pizza-ontology/pull/73) — older divergent URL/IRI classification line;
- [Pizza PR #76](https://github.com/GerhardBalz/pizza-ontology/pull/76) — newer, more complete preservation/reference resolution line.

Expected reconciliation:

1. compare unique #73 content with #76;
2. retain the stewardship/provenance governance gate recorded in Pizza #72;
3. prefer #76 as the implementation line if no substantive #73 implementation is missing;
4. close #73 as superseded only after unique requirements are safely retained;
5. review and merge #76 when satisfied.

Important publication gate:

- initial stewardship/provenance outreach to Matthew Horridge has been sent;
- wait for external feedback and assess it before submitting any Pizza W3ID registration;
- `https://w3id.org/pizza-ontology/` must remain a preservation/reference PID, not a replacement Pizza ontology namespace;
- do not name an external maintainer without explicit agreement.

## 4. Semantic Modeling Pizza formalization — independent

Proceed with [Semantic Modeling Pizza #4](https://github.com/GerhardBalz/semantic-modeling-pizza/issues/4) independently of the ESKA W3ID dependency.

Required direction:

- align README and architecture with the SKE initiative map;
- link SKE, SMO, Pizza Ontology and Wine/Food explicitly;
- make ownership and non-ownership boundaries clear;
- keep semantic model, implementation projection, runtime data, validation/inference evidence and agent contract distinct;
- surface reusable findings upward to SKE/SMO through explicit review rather than silently generalizing them.

## 5. Semantic Modeling Wine/Food bootstrap — independent

Proceed with [Semantic Modeling Wine/Food #1](https://github.com/GerhardBalz/semantic-modeling-wine-food/issues/1) after the higher-priority independent items above, or in parallel when useful.

The repository exists but is bootstrap-pending. Bootstrap should reuse existing initiative evidence rather than restart research from zero.

Recommended focus:

- W3C OWL Wine + Food as the primary historical semantic-modeling reference pair;
- preserve original authority and identity;
- distinguish repository representations from semantic authority;
- use SMO only where semantically justified;
- keep Lehigh Wine Benchmark material as benchmark/execution evidence distinct from the Wine/Food teaching/reference model;
- establish README, provenance/licensing baseline, minimal structure, one concrete SMO-oriented modeling path and deterministic validation.

## 6. Preserve immutable and historical boundaries

Across all current work:

- do not modify or retag immutable `eska-v0.1.0`, `eska-v0.2.0` or `smo-v0.1.0`;
- do not reopen SMO vocabulary merely because additional repositories exist;
- do not add ESKA semantic terms merely while waiting for W3ID publication;
- do not rewrite historical Pizza 2.0 ontology/version/entity IRIs;
- do not claim authority over `co-ode.org`;
- do not submit Pizza W3ID registration before stewardship feedback is assessed;
- do not create a Travel repository merely because Travel exists in the reference corpus or ESKA examples;
- do not treat `GerhardBalz/w3id.org` as a conceptual initiative repository.

## Current backlog anchors

```text
SKE
  #21  initiative repository map / roadmap synchronization
  #22  active durable handover checkpoint

SMO
  #11  downstream SMO alignment completion gate

ESKA
  #84  parent SemanticModel alignment — semantic/release work complete
  #87  immutable core 0.2.0 W3ID activation — waiting on upstream #6543

Pizza Ontology
  #72  preservation/reference identifiers and stewardship/W3ID lifecycle
  PR #73 older divergent URL/IRI implementation line
  PR #76 newer preservation/reference implementation line

Semantic Modeling Pizza
  #4   formalize as SKE reference example

Semantic Modeling Wine/Food
  #1   bootstrap repository
```
