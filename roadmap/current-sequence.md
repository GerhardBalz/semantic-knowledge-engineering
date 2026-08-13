# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The durable handover checkpoint is [SKE #22](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/22). The execution sequence originally recorded there has now been completed through the Wine/Food bootstrap; this file records the resulting current state and the next unresolved dependency.

## 1. Completed handover sequence

The independent sequence from SKE #22 is complete:

1. SKE #21 — initiative repository map / roadmap synchronization — **complete** via reviewed SKE PR #23.
2. Pizza PR #73 / #76 reconciliation — **complete**: #73 closed as superseded, #76 reviewed and merged; the stewardship gate remains in Pizza #72.
3. Semantic Modeling Pizza #4 — **complete** via reviewed PR #5.
4. Semantic Modeling Wine/Food #1 — **complete** via reviewed PR #2.

The external ESKA dependency also resolved while this sequence was in progress:

- upstream `perma-id/w3id.org#6543` merged;
- ESKA core 0.2.0 immutable routes were externally verified;
- ESKA PR #93 synchronized the active publication evidence and was reviewed and merged;
- ESKA #87 and #84 are complete;
- SMO #11 is complete.

## 2. Current active cross-repository dependency — Pizza stewardship feedback

The remaining explicitly gated initiative work is [Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72).

Repository-side preservation/reference preparation is complete enough to wait for external evidence. The governance gate remains:

- initial stewardship/provenance outreach to Matthew Horridge has been sent;
- wait for external feedback and assess it before submitting any Pizza W3ID registration;
- `https://w3id.org/pizza-ontology/` remains a preservation/reference PID, not a replacement Pizza ontology namespace;
- do not name an external maintainer without explicit agreement.

Do not create a Pizza W3ID pull request merely because the local implementation is ready.

## 3. Reference-example state

### Semantic Modeling Pizza

The repository is now a formal SKE reference example. Its architecture and ownership boundaries distinguish semantic models, implementation projections, runtime data, validation/inference evidence and agent contracts. Reusable findings should continue to be surfaced upward through explicit SKE/SMO review rather than silently generalized.

### Semantic Modeling Wine/Food

The repository bootstrap is complete. It now has:

- an explicit SKE/SMO role and authority boundary;
- historical W3C Wine/Food provenance without claiming ownership or redistributing source bytes;
- a minimal machine-expressible SMO modeling path;
- deterministic offline validation;
- explicit repository-authored vs external-material licensing treatment;
- a deliberate private-visibility decision.

Future Wine/Food work should be driven by a concrete modeling or executable question rather than bootstrap symmetry.

## 4. Preserve immutable and historical boundaries

Across subsequent work:

- do not modify or retag immutable `eska-v0.1.0`, `eska-v0.2.0` or `smo-v0.1.0`;
- do not reopen SMO vocabulary without new semantic evidence;
- do not add ESKA terms merely for cross-repository symmetry;
- do not rewrite historical Pizza 2.0 ontology/version/entity IRIs;
- do not claim authority over `co-ode.org` or the historical W3C Wine/Food namespaces;
- do not submit Pizza W3ID registration before stewardship feedback is assessed;
- do not create a Travel repository merely because Travel exists in the reference corpus or ESKA examples;
- do not treat `GerhardBalz/w3id.org` as a conceptual initiative repository.

## Current backlog anchors

```text
SKE
  #22  durable handover checkpoint; original execution sequence completed

SMO
  #11  COMPLETE

ESKA
  #84  COMPLETE
  #87  COMPLETE

Pizza Ontology
  #72  ACTIVE — external stewardship/provenance feedback gate before W3ID submission
  PR #73 CLOSED superseded
  PR #76 MERGED

Semantic Modeling Pizza
  #4   COMPLETE

Semantic Modeling Wine/Food
  #1   COMPLETE
```

## Next sequencing decision

There is no longer an incomplete independent implementation item in the sequence originally recorded by SKE #22.

Until new evidence arrives on Pizza #72, the next initiative work should be selected deliberately from repository-local backlogs or from a newly justified cross-repository question. Do not manufacture work solely to keep the sequence moving.
