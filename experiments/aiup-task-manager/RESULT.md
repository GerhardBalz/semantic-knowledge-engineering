# Result — AIUP Task Manager semantic falsification

## Outcome

**Negative / falsification evidence.**

For the current public AIUP Task Manager slice pinned at upstream commit
`784988b700c8369cc1a05bda7d42d8481cd87c17`, the experiment found no independent requirement that justifies introducing a production Semantic Model or `smo:ImplementationProjection`.

The experiment intentionally used the currently reproducible `UC-006 View Team Tasks` slice rather than the earlier book-era `Assign Task` candidate, because the live upstream repository currently exposes only `UC-006_View_Team_Tasks.md` under `docs/use_cases/`.

## Executable evidence

The probe verifies both a conforming and a deliberately violating synthetic RDF graph.

Expected verifier output:

```text
valid: PASS
invalid: EXPECTED FAIL
- ...: invalid task status
- ...: viewer is not a member of the task's owning team
experiment: PASS
```

The invalid graph is rejected for two concerns already owned by the current AIUP artifacts:

1. task status validity, already represented by the Entity Model/application constraints;
2. team-membership access, already represented by UC-006 BR-001 and exercised by application tests.

Therefore successful semantic restatement does not by itself demonstrate independent semantic value.

## Architectural conclusion

The result supports the selective-composition rule:

> **Do not add semantic machinery where specification authority, application constraints, and tests already own the concern adequately.**

The experiment-owned `model.ttl` is a `smo:SemanticModel` only for the synthetic experiment data. It is not authority for the upstream AIUP application.

The upstream AIUP Entity Model is not an `smo:ImplementationProjection`: it was not deliberately derived from the experiment Semantic Model, and post-hoc conceptual correspondence is not derivation.

## Reconsideration triggers

Revisit a separate semantic model only if a concern appears that the current AIUP specification core does not already own adequately, for example:

- stable concept identity across independently governed systems or bounded contexts;
- explicit mappings or semantic interoperability;
- reusable domain semantics independent of one application;
- formal reasoning/classification;
- semantic constraints that add guarantees beyond application/database/tests;
- semantic lineage whose provenance meaning is independent of Git/specification traceability.

## Non-effects

This experiment:

- introduces no new SMO or ESKA vocabulary;
- does not reclassify the AIUP Entity Model as an implementation projection;
- does not make RDF, OWL, SHACL, or SKE dependencies of AIUP;
- does not authorize or initiate contact with Simon Martinelli.
