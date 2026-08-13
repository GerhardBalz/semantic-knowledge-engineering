# Pizza ↔ Wine/Food semantic-modeling evidence review

This review implements SKE #25. It compares the two current semantic-modeling reference examples before any new reusable SMO vocabulary is proposed.

The decision rule is deliberately conservative:

```text
single-example observation
    ↓
second-domain evidence
    ↓
check established vocabularies and ownership
    ↓
only then consider reusable SKE / SMO / ESKA treatment
```

## Executive decision

The comparison does **not** currently justify a general SMO vocabulary expansion.

It does justify:

1. a repository-local correction in Semantic Modeling Pizza so current artifacts stop presenting pre-governance experimental terms as published SMO;
2. an SKE convention around semantic authority, identity, provenance and source relationships using established vocabularies;
3. a second-domain Wine/Food executable experiment before deciding whether purpose/competency-question or projection-scope relationships belong in SMO;
4. continued separation of semantic-modeling concerns from ESKA-owned execution signatures and evidence structures.

## Important integrity finding

Semantic Modeling Pizza predates the governed SMO v0.1 publication boundary.

Its current `models/pizza-model-description.ttl` still uses:

```turtle
@prefix smo: <https://github.com/GerhardBalz/semantic-modeling-ontology#> .
```

with experimental terms including `smo:Model`, `smo:ModelRepresentation`, `smo:ModelElement`, `smo:Artifact`, `smo:hasModelKind`, `smo:usesLanguage`, `smo:hasRepresentation`, and `smo:containsElement`.

Governed SMO v0.1 is published at:

```text
https://w3id.org/smo#
```

and intentionally contains only `smo:SemanticModel` and `smo:ImplementationProjection`.

This is repository-local semantic integrity work, not evidence that those older terms should be added to SMO. Semantic Modeling Pizza #6 owns the cleanup.

## Decision matrix

| Candidate concept / relationship | Pizza evidence | Wine/Food evidence | Cross-domain recurrence | Existing vocabulary sufficient? | Owner / decision | Recommended action |
|---|---|---|---|---|---|---|
| Semantic model purpose / competency question | Pizza Menu Semantic Model has four competency questions and experimental `smp:answersQuestion` | Wine/Food has an explicit meal-course recommendation competency question, but it is documentation-only so far | **Conceptual recurrence yes; executable recurrence not yet** | DCTERMS can document purpose, but there is no tested dedicated machine relation in the current examples | SKE convention / possible future SMO candidate | **Collect more evidence**: exercise this relation in Wine/Food locally before opening SMO vocabulary work |
| Projection scope / included elements | Pizza explicitly selects source concepts and experimentally records excluded concepts via `smp:excludesElement` | Wine/Food explicitly asks whether projection scope is needed but has not yet required exclusions | **Partial recurrence** | Standard provenance/source relations help lineage but do not by themselves express an explicit exclusion contract | Example-local for now | **Keep local / collect more evidence**; do not add `excludesElement` to SMO yet |
| Multiple authoritative source semantic models | Pizza has one primary historical source ontology | Wine/Food purpose-specific model derives from both historical Wine and Food models | Domain pattern differs, but source lineage is common | **Yes**: `dcterms:source` + `prov:wasDerivedFrom` currently express the Wine/Food case | SKE convention | **Adopt existing-vocabulary convention; no SMO term needed** |
| Semantic authority / identity vs repository representation | Pizza preserves external ontology identity while distinguishing published and cached representations | Wine/Food preserves W3C source identities and explicitly avoids claiming ownership or redistributing source bytes | **Strong recurrence** | **Yes**: OWL identity plus DCTERMS/PROV/DCAT-style metadata as appropriate | SKE convention | **Adopt as cross-repository convention; no SMO expansion** |
| Local cache / reproducible representation | Pizza has a concrete byte-for-byte cache, manifest, hash verification and upstream comparison | Wine/Food deliberately has no cache yet because no concrete executable need justifies it | **No requirement recurrence yet** | DCTERMS/PROV plus artifact/integrity vocabularies can cover much of this when needed | Repository engineering | **Keep local**; representation/cache is conditional, not a universal semantic-model concept |
| `smo:ImplementationProjection` classification | Pizza-related initiative evidence has explicit implementation-facing projections, while generic derived results are deliberately excluded from that class | Wine/Food bootstrap introduces no implementation projection | **Not yet cross-domain** | Current governed SMO class is sufficient for cases that meet its definition | SMO boundary already adequate | **Collect more evidence**; do not broaden the class or type derived outputs for symmetry |
| Operation signatures / semantic inputs and outputs | Pizza has a `find_suitable_pizzas` agent contract and experimental operation/input/output concepts | Wine/Food has no operational contract yet | **Pizza-only** | Execution/interface vocabularies or ESKA may own these concerns; SMO evidence is insufficient | ESKA / repository-local | **Do not move into SMO**; compare with ESKA only after a second executable example exists |
| Recommendation evidence / explanation provenance | Pizza exposes recommendation evidence as an open local modeling question | Wine/Food recommendation is only a competency question; no executable evidence graph exists yet | **Potential, not demonstrated** | PROV-O is likely part of the solution, but the required structure is not yet evidenced | Collect evidence | **Defer** until Wine/Food has an executable recommendation example |
| Published vs experimental semantic-modeling vocabulary | Pizza still contains a pre-governance experimental `smo:` surface | Wine/Food uses governed `https://w3id.org/smo#` and only `smo:SemanticModel` | **Not a reusable concept; it is an integrity discrepancy** | N/A | Semantic Modeling Pizza | **Fix via Pizza #6**; localize or replace experimental terms rather than expanding SMO |

## SKE conventions supported by two-domain evidence

The following are now sufficiently supported as **initiative conventions**, without requiring new vocabulary:

### Preserve semantic authority and identity

A repository representation, local cache, preserved distribution or purpose-specific model must not silently become the semantic authority for an external source model.

### Make source lineage explicit

Use established metadata/provenance vocabularies first. Wine/Food demonstrates that multiple source semantic models can already be expressed with `dcterms:source` and `prov:wasDerivedFrom` without a new SMO relation.

### Do not infer `ImplementationProjection` from derivation alone

Being derived from a semantic model is insufficient. `smo:ImplementationProjection` remains reserved for non-authoritative, target-specific implementation-facing projections that satisfy its governed definition.

### Demonstrate before generalizing

Local experimental vocabulary should remain local until a second domain independently needs the same semantic distinction and existing standards are insufficient.

## Evidence still required before SMO expansion

### Purpose / competency-question relation

The concept recurs in both examples, but only Pizza currently makes it machine-expressible. Wine/Food should exercise the relation in a deterministic example using local or established vocabulary first.

### Explicit projection exclusions

Pizza benefits from explicit exclusions (`Country`, `IceCream`) for its task-oriented menu model. Wine/Food has not yet shown that an exclusion relation is useful. Negative second-domain evidence would be valuable too.

### Operational signature and evidence semantics

These remain execution-adjacent and currently Pizza-only. They should be tested against ESKA ownership and a second executable domain before any reusable semantic-modeling abstraction is considered.

## Resulting backlog

### Created

- SKE #25 — this cross-example evidence review.
- Semantic Modeling Pizza #6 — align current Pizza artifacts with governed SMO v0.1 and isolate experimental vocabulary.

### Recommended next local experiment

Create a focused Semantic Modeling Wine/Food issue that:

- makes the existing competency question machine-checkable;
- exercises a purpose-specific pairing model in one deterministic query/validation/reasoning example;
- tests whether explicit projection exclusions are useful;
- preserves lineage to both W3C Wine and Food models;
- records an explicit positive or negative `smo:ImplementationProjection` decision;
- reports evidence back to SKE #25.

The attempt to create that issue during this review was blocked by the GitHub write safety layer, so it is a recommendation, not an existing issue.

## Pizza preservation gate

Pizza Ontology #72 contains an external stewardship/provenance gate that its own acceptance criteria require before W3ID submission. The issue is currently closed even though that external lifecycle is not complete. A backlog-integrity comment has been added; a manual reopen is still required because the automated reopen action was blocked.

Pizza #4 remains separate and parked until a concrete semantic modernization requirement justifies a successor ontology lineage.
