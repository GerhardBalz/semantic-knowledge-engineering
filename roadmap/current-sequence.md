# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The durable handover checkpoint remains [SKE #22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22). The original execution sequence recorded there is complete. The sequence below is based on a fresh live backlog review after the Wine/Food bootstrap and ESKA/SMO publication closure.

## 1. Backlog integrity — Pizza #72

[Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) contains the authoritative stewardship/provenance gate for the proposed Pizza preservation/reference W3ID namespace.

Its own lifecycle requires:

```text
receive and assess external stewardship/provenance feedback
    ↓
finalize W3ID registration decision
    ↓
upstream activation if adopted
    ↓
external verification
    ↓
publication/policy state active
    ↓
final regression
    ↓
close #72
```

The issue is currently closed even though this external lifecycle is not complete. A backlog-integrity comment records the discrepancy. The automated reopen action was blocked, so a manual **Reopen** action is required.

Until feedback is received and assessed:

- do not submit a Pizza W3ID PR;
- do not name an external maintainer without explicit agreement;
- keep `https://w3id.org/pizza-ontology/` strictly a preservation/reference PID proposal;
- do not rewrite historical Pizza 2.0 ontology/version/entity IRIs.

## 2. Cross-example semantic-modeling evidence — SKE #25

[SKE #25](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/25) is the current first independent P1 initiative item.

It compares Semantic Modeling Pizza and Semantic Modeling Wine/Food before any additional SMO vocabulary is proposed.

The review is captured in [`analysis/semantic-modeling-cross-example.md`](../analysis/semantic-modeling-cross-example.md).

Current decision direction:

- no general SMO vocabulary expansion is justified yet;
- semantic authority/identity and source lineage recur across both domains and should be treated as SKE conventions using established vocabularies;
- purpose/competency-question semantics recur conceptually, but Wine/Food still needs executable second-domain evidence before an SMO relation is considered;
- explicit projection exclusions remain Pizza-only evidence;
- operation signatures and evidence semantics remain execution-adjacent and must not be moved into SMO merely for symmetry;
- `smo:ImplementationProjection` retains its narrow governed meaning and must not be inferred from derivation alone.

## 3. Semantic Modeling Pizza integrity — Pizza reference example #6

[Semantic Modeling Pizza #6](https://github.com/GerhardBalz/semantic-modeling-pizza/issues/6) is active.

The Pizza reference example still contains pre-governance experimental `smo:` terms under:

```text
https://github.com/GerhardBalz/semantic-modeling-ontology#
```

while governed SMO v0.1 is:

```text
https://w3id.org/smo#
```

with the deliberately minimal published classes `smo:SemanticModel` and `smo:ImplementationProjection`.

The repository-local cleanup must:

- use the governed SMO namespace only for governed terms;
- move still-useful experimental concepts to a local namespace or established vocabularies;
- protect the distinction with validation/tests;
- feed reusable evidence back to SKE #25 rather than expanding SMO implicitly.

## 4. Wine/Food second-domain executable evidence — proposed next local item

The Wine/Food bootstrap is complete, but it has not yet implemented the executable evidence needed to resolve the recurring questions in SKE #25.

The next local experiment should:

- make the existing meal-course recommendation competency question machine-checkable;
- exercise a purpose-specific pairing model in one deterministic query/validation/reasoning example;
- test whether explicit projection exclusions are useful in this domain;
- preserve lineage to both W3C Wine and Food source semantic models;
- make an explicit positive or negative `smo:ImplementationProjection` decision;
- report findings back to SKE #25.

An automated attempt to create this Wine/Food issue was blocked by the GitHub write safety layer, so it is **proposed, not yet created**.

## 5. Parked / trigger-based work

### Pizza successor ontology — Pizza #4

[Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) remains open but intentionally parked. Revisit only when a concrete semantic modernization requirement requires changing ontology semantics, identity, or a governed successor namespace.

Do not create a successor ontology merely to improve tooling or publication UX.

### SMO

No open SMO issue currently requires implementation. Do not expand the vocabulary until SKE #25 or another evidence review produces a narrow, standards-checked requirement.

### ESKA

No open ESKA issue currently requires implementation. Core 0.2.0 SMO alignment and immutable W3ID publication are complete.

## Current backlog anchors

```text
SKE
  #22  durable handover checkpoint
  #25  ACTIVE — Pizza ↔ Wine/Food cross-example evidence review

SMO
  no active implementation issue

ESKA
  no active implementation issue

Pizza Ontology
  #72  SHOULD BE OPEN — external stewardship/W3ID lifecycle gate; manual reopen required
  #4   PARKED — successor ontology only on concrete semantic trigger

Semantic Modeling Pizza
  #6   ACTIVE — align experimental SMO references with governed v0.1

Semantic Modeling Wine/Food
  no open issue; second-domain executable evidence issue proposed
```

## Sequencing rule

Proceed with SKE #25 and Semantic Modeling Pizza #6 independently of the Pizza #72 external gate.

Do not manufacture new SMO or ESKA vocabulary while waiting. The next reusable vocabulary decision must come from demonstrated cross-domain evidence and an explicit check that established standards are insufficient.
