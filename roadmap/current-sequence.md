# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

## 1. SKE bootstrap — complete

The initial SKE governance baseline was reviewed and merged in [PR #2](https://github.com/GerhardBalz/semantic-knowledge-engineering/pull/2), and the repository is public.

SKE remains an initiative/governance layer rather than an ontology or semantic owner of ESKA, SMO, or Pizza concepts.

## 2. Shared documentation convention — complete

The SKE Semantic Markdown convention has been adopted across the participating repositories:

- ESKA through #72 / PR #73;
- SMO through PR #7;
- Pizza through PR #69.

Repository-specific documentation rules and justified literal/preformatted specimens remain owned locally.

## 3. SMO persistent publication — complete

The governed SMO v0.1.0 publication sequence tracked by SKE #3 is complete:

1. current `https://w3id.org/smo` routing activated through `perma-id/w3id.org#6538`;
2. current route externally verified in SMO CI;
3. governed immutable repository release `smo-v0.1.0` published;
4. immutable `https://w3id.org/smo/0.1.0` routing activated through `perma-id/w3id.org#6541`;
5. current and immutable routes verified together;
6. SMO publication state advanced to `version-active` only after successful live evidence;
7. SMO #5, #9, #10 and SKE #3 closed complete.

The published v0.1 ontology remains deliberately minimal:

```text
smo:SemanticModel
smo:ImplementationProjection
SMO-owned object properties: 0
SMO-owned datatype properties: 0
```

No immutable SMO or ESKA release was modified during publication.

## 4. Cross-repository alignment decision — complete

SMO #11 performed evidence-first analysis after publication became stable. The reviewed recommendation was merged in SKE PR #18.

The decision is:

```text
canonical reusable concept        smo:SemanticModel
ESKA compatibility surface        eska:SemanticModel
bridge                            owl:equivalentClass
initial ESKA deprecation          no
second namespace migration        no
proven Pizza projections          JSON + OpenAPI
projection class                  smo:ImplementationProjection
```

Important negative boundary: semantic Mapping/Transformation, preservation distributions, OAK views, Applications/UX, generic ESKA Results and validation/profile artifacts do not become `smo:ImplementationProjection` merely because they are derived or implementation-facing.

## 5. Repository-owned downstream adoption — current

Two independent implementation tracks are now active.

### ESKA #84 — next core minor compatibility bridge

Implement the reviewed bridge only in the next governed ESKA core minor version:

```turtle
eska:SemanticModel owl:equivalentClass smo:SemanticModel .
```

Requirements:

- preserve `eska:SemanticModel` and keep it non-deprecated initially;
- keep `eska:usesSemanticModel` unchanged;
- record the dependency on immutable SMO v0.1.0 with `dcterms:requires`;
- do not add `owl:imports` merely by symmetry;
- bump and publish the ESKA core version through the existing governed publication lifecycle;
- keep immutable `eska-v0.1.0` untouched.

### Pizza #74 — evidence-sidecar SMO adoption

Adopt SMO typing in current repository-authored evidence/provenance only:

- historical Pizza semantic source → `smo:SemanticModel`;
- JSON concept catalog → `smo:ImplementationProjection`;
- OpenAPI contract → `smo:ImplementationProjection`.

Retain complementary ESKA, PROV-O, DCTERMS, PROF and SHACL evidence where already applicable. Do not edit the historical Pizza ontology or published preservation release assets merely to add architectural typing.

## 6. SMO #11 completion gate

SMO #11 remains open until both ESKA #84 and Pizza #74 are reviewed and complete.

Only then close the downstream-alignment work and reassess whether any further reusable semantic-modeling vocabulary is justified by new evidence.

## 7. Preserve immutable and historical boundaries

During downstream implementation:

- do not modify immutable `smo-v0.1.0`;
- do not modify immutable `eska-v0.1.0`;
- do not rewrite historical Pizza 2.0 semantics merely for symmetry;
- keep Pizza successor-lineage issue #4 dormant until a genuine semantic-modernization requirement appears;
- keep semantic ownership in the repository that owns the relevant concept or artifact.

## Independent Pizza and ESKA work

Repository-local proving grounds, tooling, publication, and preservation work continue independently unless they explicitly depend on this SMO alignment sequence.
