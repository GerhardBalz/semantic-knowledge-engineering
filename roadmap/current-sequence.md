# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

The current durable public handover checkpoint is [SKE #32](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/32). SKE #27 and #22 are superseded historical handovers.

## 1. Active independent P1 — semantic-continuity principle

[SKE #39](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/39) is active independent initiative-level work to refine the primary continuity principle to:

> **Semantics must remain explicit through execution.**

The principle should make preservation, traceability, inspectability and provenance explicit while avoiding a requirement that every runtime artifact reproduce the complete authoritative semantic model.

The earlier wording **“Execution must not sever semantics”** may remain as explanatory shorthand, but should not remain the normative definition after #39 is reviewed and adopted.

Do not introduce new SMO or ESKA vocabulary merely because the principle wording changes. Historical issues and immutable releases remain historical rather than being rewritten.

## 2. Active external P1 — Pizza preservation/reference stewardship gate

[Pizza #72](https://github.com/GerhardBalz/pizza-ontology/issues/72) remains externally blocked on stewardship/provenance feedback.

The repository-side preservation/reference implementation is substantially prepared, but the proposed `https://w3id.org/pizza-ontology/` namespace remains gated by that external feedback.

Until feedback is received and assessed:

- do not submit a Pizza W3ID PR;
- do not name an external maintainer without explicit agreement;
- do not alter historical Pizza 2.0 ontology/version/entity identifiers;
- keep `w3id.org/pizza-ontology/` strictly proposed as a preservation/reference PID, not a replacement Pizza ontology namespace.

When publication-safe feedback or a stewardship outcome is available, assess and record the technical/governance consequence in Pizza #72 before any W3ID submission. One-to-one contact and follow-up status are not part of the public initiative backlog.

## 3. Semantic Agentic Network Operations baseline — complete

The public [`semantic-agentic-network-operations`](https://github.com/GerhardBalz/semantic-agentic-network-operations) repository is the seventh initiative/reference repository.

Its reviewed bootstrap baseline was merged via SANO PR #1. It provides an industrial architecture/reference-evidence case for testing semantic continuity through:

```text
intent
  ↓
translation / orchestration
  ↓
governed tool plane
  ↓
validation / enforcement
  ↓
execution
  ↓
evidence / provenance
```

The repository deliberately treats MCP primarily as one possible realization of the governed agent tool plane / mediation boundary rather than as the whole Agentic Network Operations Platform. It is not a telecom ontology or standards proposal.

No repository-local SANO issue is currently open.

## 4. Public semantic-modeling reference baseline — complete

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

## 5. Completed cross-example + standards cycle

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

## 6. Parked / trigger-based work

[Pizza #4](https://github.com/GerhardBalz/pizza-ontology/issues/4) remains parked P2 until a concrete semantic-modernization requirement justifies a successor ontology lineage.

No active issue exists in SMO, ESKA, Semantic Modeling Pizza, Semantic Modeling Wine/Food, or Semantic Agentic Network Operations.

## Current backlog anchors

```text
SKE
  #39  ACTIVE P1 — semantic-continuity principle refinement
  #32  ACTIVE — durable public handover checkpoint
  #29  COMPLETE — reference visibility decision
  #27  SUPERSEDED — historical handover
  #22  SUPERSEDED — historical handover

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

Semantic Agentic Network Operations
  no open issues — reviewed bootstrap baseline merged
```

## Sequencing rule

Check Pizza #72 only for a changed external gate before any W3ID action. While that gate remains blocked, continue with independent publication-safe work such as SKE #39 rather than inventing vocabulary, repositories, or successor semantics.

After the initiative-level semantic-continuity definition is reviewed, reconcile downstream ESKA wording without modifying immutable releases. Do not create additional SMO or ESKA vocabulary issues unless a distinct cross-domain requirement is demonstrated and established standards are first shown insufficient.
