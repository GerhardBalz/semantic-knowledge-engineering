# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The current durable handover checkpoint is [SKE #27](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/27). SKE #22 is historical and superseded.

## 1. Active independent P1 — SMO #22

[SMO #22](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/22) evaluates whether the independently recurring semantic-model → competency-question relationship warrants one narrowly governed SMO relation.

Pizza and Wine/Food now independently exercise a machine-expressible local `answersQuestion` relation. SMO #22 is standards-first evaluation work; no term name or vocabulary outcome is predetermined.

## 2. Pizza preservation/reference lifecycle — external gate

[Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) is reopened and active. Until stewardship/provenance feedback is received and assessed, do not submit a Pizza W3ID PR, name an external maintainer without agreement, or alter historical Pizza 2.0 identifiers.

This external gate does not block SMO #22.

## 3. Completed cross-example evidence cycle

- SKE #25 / PR #26 — initial Pizza ↔ Wine/Food decision matrix — **complete**.
- Semantic Modeling Pizza #6 / PR #7 — governed SMO v0.1 cleanup — **complete**.
- Semantic Modeling Wine/Food #3 / PR #4 — executable second-domain evidence — **complete**.

Result:

- authority/identity and source lineage are SKE conventions using established vocabularies;
- competency-question semantics recur independently and justify SMO #22 evaluation;
- explicit exclusions do not recur and remain Pizza-local;
- `smo:ImplementationProjection` remains deliberately narrow;
- operation signatures, runtime context and agent contracts remain local/ESKA-adjacent;
- no broad SMO or ESKA vocabulary expansion is justified.

See [`analysis/semantic-modeling-cross-example.md`](../analysis/semantic-modeling-cross-example.md).

## 4. Parked / trigger-based work

[Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) remains parked until a concrete semantic-modernization requirement justifies a successor ontology lineage.

No active ESKA implementation issue is justified by the current evidence cycle.

## Current backlog anchors

```text
SKE
  #27  ACTIVE — durable handover checkpoint
  #25  COMPLETE — cross-example evidence review

SMO
  #22  ACTIVE — evaluate SemanticModel ↔ competency-question relation

ESKA
  no active implementation issue from this evidence cycle

Pizza Ontology
  #72  ACTIVE — external stewardship/W3ID lifecycle gate
  #4   PARKED — successor ontology only on concrete semantic trigger

Semantic Modeling Pizza
  #6   COMPLETE — governed SMO v0.1 alignment

Semantic Modeling Wine/Food
  #3   COMPLETE — executable recommendation evidence
```

## Sequencing rule

Proceed with SMO #22 independently of Pizza #72. Do not create additional SMO or ESKA vocabulary issues unless a distinct cross-domain requirement is demonstrated and established standards are first shown insufficient.