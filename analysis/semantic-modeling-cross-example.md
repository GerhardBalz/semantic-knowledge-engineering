# Pizza ↔ Wine/Food semantic-modeling evidence review

This review implements and completes the evidence cycle started in SKE #25. It compares the Pizza and Wine/Food semantic-modeling reference examples before reusable vocabulary is promoted into SMO or ESKA.

The governing rule remains conservative:

```text
single-example observation
    ↓
independent second-domain evidence
    ↓
check established vocabularies and ownership
    ↓
only then open a narrow reusable-vocabulary evaluation
```

## Executive decision

The completed two-domain experiment still does **not** justify broad SMO vocabulary expansion.

It now supports exactly one focused reusable-vocabulary evaluation:

- **semantic model → competency question / purpose** recurs independently and is machine-expressible in both domains, so SMO #22 now evaluates whether a narrowly governed relation is justified.

Other candidate concepts remain local or are already covered by established vocabularies:

- semantic authority, identity and source lineage: SKE convention using established vocabularies;
- explicit exclusion scope: Pizza-local; Wine/Food provides useful negative evidence;
- representation/cache/reproducibility: repository engineering concern, not universal SMO semantics;
- `smo:ImplementationProjection`: current governed boundary remains adequate;
- operation signatures, runtime context and agent contracts: execution-adjacent and local/ESKA-owned;
- recommendation-evidence structure: not independently demonstrated as a reusable semantic-modeling abstraction.

## Completed integrity correction — Semantic Modeling Pizza #6

Semantic Modeling Pizza previously used the pre-governance namespace:

```text
https://github.com/GerhardBalz/semantic-modeling-ontology#
```

with unpublished experimental terms.

Semantic Modeling Pizza #6 / PR #7 corrected that boundary. Current artifacts now use governed SMO only at:

```text
https://w3id.org/smo#
```

and restrict governed SMO usage to the published v0.1 surface. Experimental competency-question, exclusion, runtime-context and agent-contract concepts remain local; source/derivation/representation relationships use established vocabularies where sufficient.

This is evidence that local experiments can be preserved without retroactively enlarging SMO.

## Completed second-domain experiment — Wine/Food #3

Semantic Modeling Wine/Food #3 / PR #4 introduced a bounded executable recommendation model and deterministic SPARQL test.

The experiment demonstrates:

- a purpose-specific `smo:SemanticModel`;
- a machine-expressible local `smwf:answersQuestion` relationship;
- explicit lineage to both historical W3C Wine and Food semantic models;
- a deterministic recommendation result;
- no explicit exclusion relation;
- no `smo:ImplementationProjection` classification;
- no operation-signature or recommendation-evidence abstraction at the SMO level.

This provides the independent evidence that SKE #25 originally required.

## Updated decision matrix

| Candidate concept / relationship | Pizza evidence | Wine/Food evidence | Cross-domain recurrence | Established vocabulary sufficient? | Owner / decision | Recommended action |
|---|---|---|---|---|---|---|
| Semantic model purpose / competency question | Pizza Menu Semantic Model uses local `smp:answersQuestion` for four competency questions | Executable recommendation model independently uses local `smwf:answersQuestion` and tests the relation | **Yes — conceptual and machine-expressible recurrence** | DCTERMS can document purpose generically, but the examples need a more precise “model is intended to answer/support this question” relation | **Focused SMO candidate** | **Evaluate via SMO #22**; do not preselect the term name or outcome |
| Projection scope / excluded elements | Pizza explicitly records `smp:excludesElement` | Wine/Food executable experiment needs no exclusion relation | **No positive recurrence; useful negative evidence** | Positive selection + provenance are sufficient in Wine/Food | Example-local | **Keep local**; do not add exclusion vocabulary to SMO |
| Multiple authoritative source semantic models | One primary historical Pizza source | Wine/Food derives from both historical Wine and Food models | Source-lineage pattern recurs | **Yes**: `dcterms:source` + `prov:wasDerivedFrom` | SKE convention | **No SMO term needed** |
| Semantic authority / identity vs repository representation | Historical Pizza identity remains external while local/cache representations are distinguished | Historical W3C Wine/Food identities remain external while repository-authored model is local | **Strong recurrence** | **Yes**: OWL/DCTERMS/PROV/DCAT-style metadata as appropriate | SKE convention | **No SMO expansion** |
| Local cache / reproducible representation | Pizza has a byte-for-byte cache and integrity verification | Wine/Food executable example remains deterministic without a source cache | **Conditional, not universal** | Existing metadata/integrity vocabularies sufficient when needed | Repository engineering | **Keep local** |
| `smo:ImplementationProjection` classification | Pizza cleanup deliberately avoids classifying generic derived artifacts as projections | Wine/Food test explicitly asserts no implementation projection exists | **Boundary recurrence, not new vocabulary recurrence** | Current governed class is sufficient | SMO boundary already adequate | **Preserve current narrow definition** |
| Operation signatures / semantic inputs and outputs | Pizza agent contract uses local operation/input/output concepts | Wine/Food executable query requires no operation-signature model | **Pizza-only** | Execution/interface approaches remain more appropriate | ESKA / local | **Do not move into SMO** |
| Recommendation evidence / explanation provenance | Pizza exposes a local open question | Wine/Food proves a deterministic result but does not require a reusable evidence graph | **Insufficient recurrence** | PROV-O likely covers part of future need | Collect evidence | **Defer** |
| Published vs experimental semantic-modeling vocabulary | Former integrity discrepancy corrected by Pizza #6/PR #7 | Wine/Food used governed SMO from bootstrap | Resolved governance issue | N/A | Repository governance | **Complete** |

## SKE conventions now supported by two-domain evidence

### Preserve semantic authority and identity

Repository representations, caches, purpose-specific models and executable examples must not silently become the authority for external source semantic models.

### Make source lineage explicit with established vocabularies first

Use DCTERMS / PROV-O before creating reusable semantic-modeling relations. Wine/Food demonstrates that multiple sources do not require a new SMO relation.

### Do not infer `ImplementationProjection` from derivation alone

A derived artifact is not automatically an `smo:ImplementationProjection`. Both domains now provide evidence for preserving this negative boundary.

### Negative evidence matters

A concept need not recur structurally across reference examples. Wine/Food's lack of a need for explicit exclusions is evidence **against** promoting Pizza's local exclusion relation.

### Demonstrate before generalizing

Independent machine-expressible recurrence is a prerequisite for a reusable-vocabulary evaluation, not automatic authorization to mint a term.

## Focused reusable-vocabulary follow-up

### SMO #22 — competency-question relation evaluation

The only candidate that now passes the cross-domain evidence threshold is the relation between a semantic model and the competency question or purpose it is intentionally designed to answer/support.

SMO #22 must remain standards-first and may still conclude that:

```text
existing vocabulary is sufficient
or
SKE convention only is sufficient
or
one narrowly scoped SMO relation is justified
```

No other SMO or ESKA vocabulary issue is justified by the current evidence.

## Current backlog outcome

Completed:

- SKE #25 — first cross-example evidence review;
- Semantic Modeling Pizza #6 / PR #7 — governed SMO v0.1 alignment;
- Semantic Modeling Wine/Food #3 / PR #4 — executable second-domain evidence.

Active:

- SMO #22 — evaluate the competency-question relation;
- Pizza Ontology #72 — reopened and waiting on stewardship/provenance feedback before any W3ID submission.

Parked:

- Pizza Ontology #4 — successor ontology only on a concrete semantic-modernization trigger.

The current durable handover is SKE #27.