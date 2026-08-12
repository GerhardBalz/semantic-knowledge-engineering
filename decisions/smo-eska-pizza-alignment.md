# SMO–ESKA–Pizza alignment recommendation

## Status

**Cross-repository architecture recommendation — for review before implementation.**

This decision records the evidence-based recommendation requested by `GerhardBalz/semantic-modeling-ontology#11`. It does not itself change ESKA, SMO, or Pizza ontology semantics.

The publication gate is satisfied: SMO is `version-active`, `smo-v0.1.0` is immutable, and both current and immutable W3ID routes are live-verified.

## Decision summary

```text
canonical conceptual ownership   smo:SemanticModel
ESKA compatibility surface       preserve eska:SemanticModel
recommended semantic bridge      owl:equivalentClass
ESKA deprecation initially       no
rdfs:subClassOf instead           no evidence for narrowing
second ESKA namespace migration  no
SMO v0.1 change                  none
ESKA dependency expression       dcterms:requires SMO v0.1.0
owl:imports by symmetry          no
implementation boundary          next governed ESKA core minor version
```

The key recommendation is:

```turtle
eska:SemanticModel owl:equivalentClass smo:SemanticModel .
```

This is a compatibility bridge, not a transfer or rewrite of the already-published ESKA identifier.

## Why equivalence is justified

### 1. The published definitions are identical

Current ESKA defines `eska:SemanticModel` as:

> A formal representation that gives knowledge explicit machine-interpretable meaning through concepts, relationships, constraints, axioms, or equivalent semantic structures.

Published SMO v0.1.0 defines `smo:SemanticModel` with exactly the same wording.

The definitions therefore provide no textual evidence that the ESKA class is narrower, broader, or materially different from the SMO class.

### 2. Seven ESKA execution modes do not introduce an ESKA-specific narrowing

ESKA has exercised `SemanticModel` across seven materially different operational semantics:

- OWL class reasoning;
- SHACL validation;
- SPARQL rule evaluation;
- DMN decision evaluation;
- OpenMath calculation;
- semantic mapping;
- BPMN workflow execution.

The concrete ESKA examples type formal representations from all of these formalisms as `eska:SemanticModel`. The class is not restricted to executable artifacts, ESKA Capabilities, ESKA Results, ESKA Services, Agents, or Deployments.

The mapping mode strengthens this conclusion because source, mapping, and target formal representations are all `SemanticModel` instances even though they occupy materially different roles.

### 3. ESKA already made this ownership decision conditionally

ESKA #57 concluded that `SemanticModel` is conceptually broader than ESKA and should ultimately be owned by a reusable Semantic Modeling vocabulary. It explicitly identified `owl:equivalentClass` as the preferred compatibility bridge if the final external definition remained semantically equivalent.

SMO has now been published with the same definition, satisfying that condition.

## Why subclassing is not recommended

A bridge such as:

```turtle
eska:SemanticModel rdfs:subClassOf smo:SemanticModel .
```

would claim that ESKA's class denotes a semantically narrower category. Current definition and usage provide no evidence for that restriction.

If a future ESKA version intentionally specializes the concept with execution-specific criteria, a narrower class should be modeled explicitly rather than retroactively reading that restriction into the published compatibility term.

## Why `eska:SemanticModel` should not be deprecated now

`https://w3id.org/eska#SemanticModel` is part of the governed ESKA compatibility surface and the immutable `eska-v0.1.0` release.

Conceptual ownership moving to SMO does not make existing ESKA statements false. Immediate deprecation would create migration pressure without semantic benefit.

Therefore:

- preserve `eska:SemanticModel` as an explicit compatibility class;
- do not rename or repurpose it;
- do not modify immutable `eska-v0.1.0`;
- allow existing ESKA consumers to continue using it;
- make SMO the canonical conceptual owner going forward.

Where non-reasoning validators or queries still require an explicit ESKA type, transition examples may retain or add both types rather than relying on OWL inference alone.

## ESKA implementation recommendation

Implement the bridge only in the **next governed ESKA core minor version** because the equivalence axiom is a backward-compatible additive semantic statement, not a patch-only documentation correction and not a breaking change.

Recommended sequence:

1. create the next ESKA core minor-version work item;
2. add the `smo:` namespace and the compatibility equivalence axiom;
3. record the dependency on the immutable SMO v0.1.0 ontology with `dcterms:requires <https://w3id.org/smo/0.1.0>`;
4. do **not** add `owl:imports` merely because the two ontologies are aligned;
5. keep `eska:usesSemanticModel` and its existing `rdfs:range eska:SemanticModel` unchanged initially;
6. update executable verification so the compatibility axiom is machine-checked;
7. update current documentation to identify SMO as the canonical conceptual owner;
8. retain explicit ESKA compatibility typing where existing non-inference tests require it;
9. publish the new ESKA core version and repository release through the governed publication lifecycle;
10. preserve all immutable ESKA v0.1.0 artifacts and routes unchanged.

Changing the range of `eska:usesSemanticModel` directly to `smo:SemanticModel` is not needed for the first bridge. Equivalence already makes the range semantically compatible while minimizing disruption to existing consumers and verification queries.

## Concrete artifact classification

The following classification is supported by existing repository evidence.

| Artifact / role | Recommended SMO classification | Reason |
| --- | --- | --- |
| Pizza Ontology 2.0 | `smo:SemanticModel` | Authoritative formal domain model. |
| Pizza OWL reasoning module/slice | `smo:SemanticModel` | Formal OWL representation used for entailment. |
| Pizza SHACL shapes graph | `smo:SemanticModel` | Formal machine-interpretable constraint model. |
| Pizza SPARQL rule specification | `smo:SemanticModel` | Formal rule model with machine-interpretable result semantics. |
| Pizza DMN decision table | `smo:SemanticModel` | Formal machine-interpretable decision model. |
| Pizza OpenMath formula | `smo:SemanticModel` | Formal machine-interpretable calculation model. |
| Pizza mapping source semantic role | `smo:SemanticModel` | Source semantics remain formally represented. |
| Menu target vocabulary/model | `smo:SemanticModel` | Target graph meaning is governed by an explicit semantic model. |
| Pizza→Menu SPARQL mapping model | `smo:SemanticModel` | Formal mapping semantics connecting source and target models. |
| Pizza BPMN workflow model | `smo:SemanticModel` | Formal orchestration semantics. |
| Pizza workflow outcome vocabulary | `smo:SemanticModel` | Formal vocabulary defining machine-interpretable operations/outcomes. |
| Pizza concept JSON catalog | `smo:ImplementationProjection` | Non-authoritative selected-semantics implementation representation with explicit preservation policy and source traceability. |
| Pizza OpenAPI 3.1 contract | `smo:ImplementationProjection` | Non-authoritative implementation-facing contract combining selected source semantics with API-specific concerns. |

## Important negative classifications

Naming or derivation alone is insufficient to make something an `ImplementationProjection`.

The following should **not** be typed as `smo:ImplementationProjection` merely by analogy:

- the ESKA Menu mapping `Result` / `MenuProjectionGraph` — it is the result of a semantic transformation governed by source, mapping, and target Semantic Models; the Pizza architecture explicitly distinguishes this pattern from Implementation Projection;
- preservation `.ofn` / `.ttl` files — these are representations/distributions of a semantic source, not implementation projections;
- OAK query or traversal results — these are access/query views over a source, and the OAK reference explicitly avoids treating them as application projections;
- an `eska:Result` in general — execution output does not imply implementation-projection semantics;
- ESKA executable artifacts, Services, Agents, Deployments, or Capabilities — their ESKA roles remain distinct;
- Applications and UX resources — they consume projections/contracts but do not thereby become projections;
- PROF profiles or SHACL validation reports — profile/conformance and validation evidence have their own semantics.

## Pizza adoption recommendation

Pizza should adopt SMO through **current provenance/evidence metadata**, not by rewriting the historical Pizza 2.0 ontology.

First implementation slice:

1. in the existing Pizza concept-projection evidence sidecar, type the historical Pizza Ontology 2.0 resource as `smo:SemanticModel`;
2. type the JSON projection resource as `smo:ImplementationProjection` while retaining its existing `eska:Result` and `prov:Entity` runtime/evidence roles;
3. retain `prov:wasDerivedFrom`, `dcterms:conformsTo`, and the existing profile/preservation evidence rather than minting a new SMO relationship;
4. add equivalent SMO typing for the OpenAPI projection in an existing or narrowly scoped evidence sidecar;
5. do not edit historical Pizza ontology IRIs or semantics;
6. do not type preservation distributions, OAK views, mapping results, applications, or UX as Implementation Projections without separate evidence.

This demonstrates that SMO and ESKA answer different questions about the same artifact:

```text
smo:ImplementationProjection
    what kind of semantic-modeling artifact it is

eska:Result
    what runtime/execution role it played

prov:Entity / prov:wasDerivedFrom
    its provenance role and lineage
```

Those classifications are complementary rather than competing.

## SMO boundary

No SMO v0.1 vocabulary change is required by this alignment.

The existing two-class model plus established vocabularies is sufficient:

- class ownership → SMO;
- derivation / usage / roles → PROV-O;
- source / relation / conformance metadata → Dublin Core Terms;
- distributions → DCAT;
- formal ontology semantics → OWL and the source formalism.

Do not mint a new SMO `projectionOf`, `sourceSemanticModel`, or authority relation merely to make the examples look more uniform.

## Implementation gates

This recommendation must be reviewed before semantic implementation PRs are opened.

After review:

1. create an ESKA issue for the next governed core minor compatibility bridge;
2. implement and verify the ESKA `owl:equivalentClass` bridge without modifying `eska-v0.1.0`;
3. create a focused Pizza issue/PR adding current evidence-sidecar SMO typing for the proven JSON and OpenAPI Implementation Projections;
4. keep SMO v0.1.0 unchanged;
5. update SMO #11 with implementation evidence and close it only when both downstream adoption paths are reviewed and complete.

## Non-goals

This recommendation does not:

- reopen SMO v0.1 vocabulary design;
- deprecate `eska:SemanticModel`;
- change the meaning of `eska:usesSemanticModel`;
- introduce a second ESKA namespace migration;
- modify immutable ESKA, SMO, or Pizza releases;
- collapse Semantic Mapping / Transformation into `ImplementationProjection`;
- type every derived or serialized artifact as an `ImplementationProjection`;
- make SKE a semantic vocabulary owner.
