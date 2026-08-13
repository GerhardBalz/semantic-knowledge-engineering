# Pizza ↔ Wine/Food semantic-modeling evidence review

This review implements and completes the evidence cycle started in SKE #25. It compares the Pizza and Wine/Food semantic-modeling reference examples before reusable vocabulary is promoted into SMO or ESKA.

The governing rule is:

```text
single-example observation
    ↓
independent second-domain evidence
    ↓
check established vocabularies and ownership
    ↓
only then consider reusable vocabulary
```

## Final executive decision

The completed two-domain cycle does **not** justify any new SMO or ESKA vocabulary.

The one concept that independently recurred — semantic-model competency questions — was evaluated standards-first in SMO #22 / PR #23. The result was to reuse established MOD vocabulary rather than mint a new SMO property:

```text
mod:competencyQuestion
https://w3id.org/mod#competencyQuestion
```

`mod:designedForTask` remains available where an identified task is the better purpose abstraction.

SMO therefore remains unchanged at v0.1 with its governed classes:

```text
smo:SemanticModel
smo:ImplementationProjection
```

No SMO version, immutable tag, or W3ID publication change was required.

## Evidence sequence completed

### Semantic Modeling Pizza

- #6 / PR #7 removed the pre-governance experimental SMO surface from current artifacts.
- Current governed SMO usage is limited to published v0.1 terms.
- Source, derivation, representation and conformance relationships use established vocabularies where sufficient.
- #8 / PR #9 replaced literal `smp:answersQuestion` usage with `mod:competencyQuestion` and added regression protection against reintroducing the superseded local textual relation.
- Explicit exclusion semantics remain local Pizza evidence.

### Semantic Modeling Wine/Food

- #3 / PR #4 created the independent executable second-domain recommendation experiment.
- The model preserves lineage to both historical W3C Wine and Food semantic models and produces a deterministic recommendation result.
- The experiment requires no explicit exclusion relation and no `smo:ImplementationProjection`.
- #5 / PR #6 adopted `mod:competencyQuestion` and removed the local first-class competency-question resource because the example demonstrated no additional identity/provenance value for that resource.

That removal is useful negative evidence against introducing a resource-valued SMO competency-question relation from the current examples.

## Final decision matrix

| Candidate concept / relationship | Cross-domain result | Standards / ownership result | Final decision |
|---|---|---|---|
| Semantic model competency question / purpose | Positive recurrence in Pizza and Wine/Food | MOD provides `mod:competencyQuestion`; `mod:designedForTask` may cover task-oriented purpose | **Reuse MOD; no SMO term** |
| Explicit projection exclusions | Pizza requires it; Wine/Food does not | No universal need demonstrated | **Keep Pizza-local** |
| Source lineage / multiple authoritative sources | Recurs | `dcterms:source` + `prov:wasDerivedFrom` sufficient | **SKE convention; no SMO term** |
| Semantic authority / identity vs representation | Strong recurrence | Existing OWL/DCTERMS/PROV/DCAT-style metadata sufficient | **SKE convention** |
| Cache / reproducible representation | Useful in Pizza, unnecessary in Wine/Food | Conditional engineering concern | **Keep repository-local** |
| `smo:ImplementationProjection` | Both examples reinforce the negative boundary that derivation alone is insufficient | Current governed class is adequate | **No change** |
| Operation signatures / input-output semantics | Pizza-only | Execution/interface concern | **Local / ESKA-adjacent; not SMO** |
| Runtime context / agent contract | Pizza-only | Execution concern | **Local / ESKA-adjacent** |
| Recommendation evidence graph | Not independently required | PROV-O likely covers part of any future need | **Defer pending independent evidence** |

## Initiative conventions supported by evidence

### Preserve semantic authority and identity

A repository representation, cache, purpose-specific model, executable artifact or implementation projection must not silently become the authority for an external semantic model.

### Use established vocabularies first

DCTERMS, PROV-O and MOD resolved the reusable relations demonstrated in this cycle without expanding SMO.

### Do not infer `ImplementationProjection` from derivation alone

A derived artifact qualifies only when it satisfies the governed implementation-facing projection definition.

### Negative evidence matters

The absence of exclusion semantics in Wine/Food and the removal of its unnecessary first-class competency-question resource are evidence against generalizing local Pizza/Wine-Food structures merely for symmetry.

### Demonstrate before generalizing

Independent recurrence opens an evaluation; it does not authorize a vocabulary term. The competency-question cycle demonstrates the intended process end-to-end: recurrence → standards review → reuse MOD → downstream adoption.

## Current backlog outcome

Completed:

- SKE #25 / PR #26 — initial cross-example evidence review;
- SKE PR #28 — post-experiment evidence/roadmap synchronization;
- Semantic Modeling Pizza #6 / PR #7 — governed SMO alignment;
- Semantic Modeling Wine/Food #3 / PR #4 — executable second-domain evidence;
- SMO #22 / PR #23 — standards-first competency-question evaluation;
- Semantic Modeling Pizza #8 / PR #9 — MOD adoption;
- Semantic Modeling Wine/Food #5 / PR #6 — MOD adoption and removal of unnecessary first-class question structure.

Active:

- SKE #29 — decide public visibility of the two semantic-modeling reference examples;
- Pizza Ontology #72 — external stewardship/provenance gate before any Pizza preservation/reference W3ID submission.

Parked:

- Pizza Ontology #4 — successor ontology only on a concrete semantic-modernization trigger.

No active SMO or ESKA implementation issue is justified by this evidence cycle.

The current durable handover remains SKE #27.
