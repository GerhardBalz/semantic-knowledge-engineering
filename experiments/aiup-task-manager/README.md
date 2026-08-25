# AIUP Task Manager semantic falsification experiment

## Purpose

This experiment tests a deliberately narrow question raised by the SKE comparison with Simon Martinelli's AI Unified Process (AIUP):

> Does a separate semantic layer add independent value to the current AIUP Task Manager, or would it merely duplicate authority already expressed by AIUP specifications, implementation constraints, and tests?

The experiment is **not** an extension of AIUP, does not claim endorsement by Simon Martinelli or the AIUP project, and does not modify the upstream application.

## Reproducible upstream baseline

The live upstream baseline reviewed for this experiment is:

- repository: `AI-Unified-Process/task-manager`
- commit: `784988b700c8369cc1a05bda7d42d8481cd87c17`
- AIUP specifications: `docs/vision.md`, `docs/requirements.md`, `docs/entity_model.md`, `docs/use_cases.puml`, and `docs/use_cases/UC-006_View_Team_Tasks.md`
- implementation/test evidence: `src/test/java/ch/martinelli/demo/aiup/task/ui/TaskViewTest.java`

Exact source:
- https://github.com/AI-Unified-Process/task-manager/tree/784988b700c8369cc1a05bda7d42d8481cd87c17
- https://github.com/AI-Unified-Process/task-manager/blob/784988b700c8369cc1a05bda7d42d8481cd87c17/docs/entity_model.md
- https://github.com/AI-Unified-Process/task-manager/blob/784988b700c8369cc1a05bda7d42d8481cd87c17/docs/requirements.md
- https://github.com/AI-Unified-Process/task-manager/blob/784988b700c8369cc1a05bda7d42d8481cd87c17/docs/use_cases/UC-006_View_Team_Tasks.md
- https://github.com/AI-Unified-Process/task-manager/blob/784988b700c8369cc1a05bda7d42d8481cd87c17/src/test/java/ch/martinelli/demo/aiup/task/ui/TaskViewTest.java

The upstream repository currently does not declare a repository license. This experiment therefore references upstream artifacts and reconstructs only the minimal concepts needed for independent analysis; it does not copy upstream source code or specifications.

## Why UC-006

An earlier design preferred an `Assign Task` use case from the book-era case study. The current public repository no longer contains that use-case specification. The only current file under `docs/use_cases/` is `UC-006_View_Team_Tasks.md`, so this experiment follows live, reproducible state rather than an older snapshot.

UC-006 is still a useful falsification slice because it includes:

- `USER`, `TEAM`, `TEAM_MEMBERSHIP`, and `TASK` structure;
- an explicit membership-based access rule;
- task lifecycle/status values;
- observable behavior and alternative flows;
- direct browserless tests that cite UC-006 and its business rules.

## Hypotheses

**H0 — duplication:** AIUP already owns the relevant meaning adequately for this single application, so OWL/RDF/SHACL-like machinery would add representation cost without independent semantic value.

**H1 — independent semantic value:** a small semantic model contributes at least one of the following beyond the existing AIUP artifacts:

- stable domain identity needed across independently governed artifacts or systems;
- semantic constraints not adequately represented by the Entity Model, use cases, database constraints, or tests;
- interoperability/mapping requirements;
- reasoning/classification requirements;
- semantic lineage that is meaningful independently of Git/specification traceability.

The experiment accepts H0 as a valid result.

## Authority boundaries

The probe deliberately preserves **authority by concern**:

| Concern | Authority in the current case |
| --- | --- |
| product intent / scope | AIUP Vision + Requirements Catalog |
| application structure | AIUP Entity Model |
| observable behavior | AIUP System Use Case UC-006 |
| implementation | application code/database |
| behavioral verification | AIUP tests |
| experimental semantic probe | files in this directory only |

`model.ttl` is an **experiment-owned** `smo:SemanticModel`. It is authoritative only for the synthetic RDF data used by this experiment. It is **not** asserted as authoritative for the upstream AIUP Task Manager.

The upstream AIUP Entity Model is **not** classified as `smo:ImplementationProjection`, because it was not deliberately derived from this Semantic Model. Similarity or post-hoc alignment is not derivation.

## Semantic probe

The probe intentionally models only:

- `User`
- `Team`
- `Task`
- team membership
- task ownership by team
- task status
- a synthetic `TaskAccess` relation used to test the UC-006 membership rule

`shapes.ttl` expresses:

1. task structural/status constraints; and
2. a membership rule requiring a viewer to be a member of the team owning the task being accessed.

The two sample graphs are:

- `data-valid.ttl` — satisfies the probe constraints;
- `data-invalid.ttl` — contains an invalid task status and a viewer/team-membership mismatch.

`verify.py` parses all RDF, checks the structural/status constraint set, and executes the membership rule. It is a small experiment verifier, **not a general SHACL implementation**.

Run:

```bash
python -m pip install -r requirements.txt
python verify.py
```

Expected result:

```text
valid: PASS
invalid: EXPECTED FAIL
- invalid task status
- viewer is not a member of the task's owning team
experiment: PASS
```

## Results

| Candidate semantic contribution | Existing AIUP coverage | Probe result |
| --- | --- | --- |
| stable identity for `User` / `Team` / `Task` | stable specification terms and repository-local artifact structure; one application | semantic IRIs are possible, but no independent cross-system identity requirement is demonstrated |
| entity relationships/cardinality | Entity Model + relational schema | RDF/OWL representation duplicates existing structure for this slice |
| task status constraint | Entity Model + database/application/test behavior | semantic enumeration is redundant |
| team-membership access rule | UC-006 BR-001 + implementation + tests | semantic validation can restate the rule, but does not add a new authority or guarantee in this case |
| semantic lineage to implementation | no upstream Semantic Model exists | adding lineage after the fact would be circular; existing Entity Model is not an `ImplementationProjection` |
| interoperability/mapping | requirement C-008 explicitly excludes external integrations | no current evidence justifies a semantic interoperability layer |
| reasoning/classification | no demonstrated requirement | not justified |

## Conclusion

For the current AIUP Task Manager / UC-006 slice, the experiment finds **no independent requirement that justifies adopting a separate Semantic Model or Implementation Projection**.

The probe proves that the same concepts and access rule *can* be represented and checked semantically. That is not enough. AIUP already expresses the relevant application structure, behavior, and verification clearly, and the application explicitly excludes external integrations.

Therefore the useful SKE result is negative/falsification evidence:

> **Do not add semantic machinery where specification authority, application constraints, and tests already own the concern adequately.**

A separate semantic model should be reconsidered only if a new concern appears that AIUP's current artifacts do not own adequately—for example cross-system concept identity, independently governed mappings, semantic interoperability, formal reasoning, or reusable domain semantics across bounded contexts.

This result does not change SMO or ESKA vocabulary and does not authorize contact with Simon Martinelli.
