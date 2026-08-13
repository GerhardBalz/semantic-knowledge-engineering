# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The current durable handover checkpoint is [SKE #32](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/32). SKE #27 and #22 are superseded historical handovers.

## 1. Active P1 — Pizza preservation/reference stewardship gate

[Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) is the only active P1 in the audited initiative backlog.

The repository-side preservation/reference implementation is substantially prepared, but the proposed `https://w3id.org/pizza-ontology/` namespace remains gated by external stewardship/provenance feedback.

Initial outreach to Matthew Horridge was sent on 12 August 2026. A connected-mailbox check on 13 August 2026 found the sent outreach and no reply concerning Pizza provenance, present-day stewardship, or the proposed preservation/reference W3ID namespace.

Until external feedback is received and assessed:

- do not submit a Pizza W3ID PR;
- do not name an external maintainer without explicit agreement;
- do not alter historical Pizza 2.0 ontology/version/entity identifiers;
- keep `w3id.org/pizza-ontology/` strictly proposed as a preservation/reference PID, not a replacement Pizza ontology namespace.

When feedback arrives, assess and record it in Pizza #72 before any W3ID submission.

## 2. Public semantic-modeling reference baseline — complete

[SKE #29](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/29) decided to publish both semantic-modeling reference examples together.

Completed publication path:

- Semantic Modeling Pizza PR #10 — final public-facing semantic/documentation cleanup;
- Semantic Modeling Wine/Food PR #7 — final public-facing semantic/documentation cleanup;
- both repositories changed deliberately to public;
- GitHub visibility verified as `public` for both repositories.

The public repositories are:

- `GerhardBalz/semantic-modeling-pizza`;
- `GerhardBalz/semantic-modeling-wine-food`.

Visibility does not imply authority over historical Pizza or W3C Wine/Food namespaces, endorsement by their original projects, or standardization of local experimental concepts.

## 3. Completed cross-example + standards cycle

The following sequence is complete:

- SKE #25 / PR #26 — initial Pizza ↔ Wine/Food evidence review;
- SKE PR #28 — post-experiment evidence/roadmap synchronization;
- Semantic Modeling Pizza #6 / PR #7 — governed SMO v0.1 cleanup;
- Semantic Modeling Wine/Food #3 / PR #4 — executable second-domain evidence;
- SMO #22 / PR #23 — standards-first competency-question evaluation;
- Semantic Modeling Pizza #8 / PR #9 — adopt MOD `mod:competencyQuestion`;
- Semantic Modeling Wine/Food #5 / PR #6 — adopt MOD `mod:competencyQuestion` and remove unnecessary first-class question structure;
- SKE PR #31 — synchronize initiative after MOD adoption.

Final result:

- no new SMO or ESKA vocabulary is justified;
- competency questions reuse MOD rather than introducing `smo:answersQuestion`;
- source lineage uses DCTERMS/PROV-O;
- explicit exclusions remain Pizza-local;
- `smo:ImplementationProjection` remains deliberately narrow;
- operation signatures, runtime context and agent contracts remain local/ESKA-adjacent;
- negative evidence remains part of the governance record.

See [`analysis/semantic-modeling-cross-example.md`](../analysis/semantic-modeling-cross-example.md).

## 4. Parked / trigger-based work

[Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) remains parked P2 until a concrete semantic-modernization requirement justifies a successor ontology lineage.

No active issue exists in SMO, ESKA, Semantic Modeling Pizza, or Semantic Modeling Wine/Food.

## Current backlog anchors

```text
SKE
  #32  ACTIVE — durable handover checkpoint
  #29  COMPLETE after this final synchronization
  #27  SUPERSEDED — close after this synchronization
  #22  SUPERSEDED — close after this synchronization

SMO
  no open issues

ESKA
  no open issues

Pizza Ontology
  #72  ACTIVE P1 — external stewardship/W3ID lifecycle gate
  #4   PARKED P2 — successor ontology only on concrete semantic trigger

Semantic Modeling Pizza
  no open issues

Semantic Modeling Wine/Food
  no open issues
```

## Sequencing rule

Start with Pizza #72 by checking for new external stewardship feedback. If feedback exists, assess it before any W3ID action. If #72 remains externally blocked, audit the live initiative/repository backlogs for newly opened independent work rather than inventing vocabulary, repositories, or successor semantics.

Do not create additional SMO or ESKA vocabulary issues unless a distinct cross-domain requirement is demonstrated and established standards are first shown insufficient.
