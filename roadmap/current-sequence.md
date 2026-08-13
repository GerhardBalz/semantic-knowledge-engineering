# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The current durable handover checkpoint is [SKE #27](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/27). SKE #22 is historical and superseded.

## 1. Active independent P1 — SKE #29 visibility decision

[SKE #29](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/29) is the current first independent initiative item.

It decides whether the two semantic-modeling reference-example repositories should now become public:

- `GerhardBalz/semantic-modeling-pizza`
- `GerhardBalz/semantic-modeling-wine-food`

The evidence prerequisites are substantially complete. The recommended direction is to make both public together after one final public-facing documentation review, while preserving explicit authority, identity and licensing boundaries.

Visibility is a governance/publication decision and does not establish semantic maturity or standardization.

## 2. Pizza preservation/reference lifecycle — external gate

[Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) remains reopened and active. Until stewardship/provenance feedback is received and assessed:

- do not submit a Pizza W3ID PR;
- do not name an external maintainer without explicit agreement;
- do not alter historical Pizza 2.0 ontology/version/entity identifiers;
- keep any proposed `w3id.org/pizza-ontology/` namespace strictly a preservation/reference PID proposal.

This external gate does not block SKE #29.

## 3. Completed cross-example + standards cycle

The following sequence is complete:

- SKE #25 / PR #26 — initial Pizza ↔ Wine/Food decision matrix;
- Semantic Modeling Pizza #6 / PR #7 — governed SMO v0.1 cleanup;
- Semantic Modeling Wine/Food #3 / PR #4 — executable second-domain evidence;
- SKE PR #28 — post-experiment evidence/roadmap synchronization;
- SMO #22 / PR #23 — standards-first competency-question evaluation;
- Semantic Modeling Pizza #8 / PR #9 — adopt MOD `mod:competencyQuestion`;
- Semantic Modeling Wine/Food #5 / PR #6 — adopt MOD `mod:competencyQuestion` and remove unnecessary first-class question structure.

Final result:

- no new SMO or ESKA vocabulary is justified;
- competency questions reuse MOD rather than introducing `smo:answersQuestion`;
- source lineage uses DCTERMS/PROV-O;
- explicit exclusions remain Pizza-local;
- `smo:ImplementationProjection` remains deliberately narrow;
- operation signatures, runtime context and agent contracts remain local/ESKA-adjacent;
- negative evidence is retained as part of the governance record.

See [`analysis/semantic-modeling-cross-example.md`](../analysis/semantic-modeling-cross-example.md).

## 4. Parked / trigger-based work

[Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) remains parked until a concrete semantic-modernization requirement justifies a successor ontology lineage.

No active SMO or ESKA implementation issue is justified by the completed evidence cycle.

## Current backlog anchors

```text
SKE
  #27  ACTIVE — durable handover checkpoint
  #29  ACTIVE — public visibility decision for reference examples
  #25  COMPLETE — cross-example evidence review

SMO
  #22  COMPLETE — standards-first competency-question evaluation
  no active implementation issue

ESKA
  no active implementation issue from this evidence cycle

Pizza Ontology
  #72  ACTIVE — external stewardship/W3ID lifecycle gate
  #4   PARKED — successor ontology only on concrete semantic trigger

Semantic Modeling Pizza
  #6   COMPLETE — governed SMO v0.1 alignment
  #8   COMPLETE — MOD competency-question adoption

Semantic Modeling Wine/Food
  #3   COMPLETE — executable recommendation evidence
  #5   COMPLETE — MOD competency-question adoption
```

## Sequencing rule

Proceed with SKE #29 independently of Pizza #72. If the visibility decision is public, perform the final documentation review, change both repositories deliberately, verify their public URLs, and then synchronize this roadmap/repository map again.

Do not create additional SMO or ESKA vocabulary issues unless a distinct cross-domain requirement is demonstrated and established standards are first shown insufficient.
