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

## 4. Evaluate downstream SMO alignment — current

The next cross-repository activity is [SMO #11](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/11).

Proceed evidence-first:

1. inspect the existing `eska:SemanticModel` definition and its concrete use across ESKA execution modes;
2. compare that evidence with published `smo:SemanticModel` semantics rather than assuming equivalence from naming;
3. classify concrete ESKA and Pizza artifacts as authoritative semantic models, implementation projections, preservation artifacts, or other roles based on actual authority/projection evidence;
4. evaluate compatibility options from least to most semantically invasive;
5. record the cross-repository recommendation before implementation changes;
6. introduce ontology axioms, deprecations, or canonical SMO typing only if the evidence justifies them and only in a new governed version where required.

The default preference is the least invasive alignment that is semantically true and machine-expressible.

## 5. Preserve immutable and historical boundaries

During downstream analysis and any later implementation:

- do not modify immutable `smo-v0.1.0`;
- do not modify immutable `eska-v0.1.0`;
- do not rewrite historical Pizza 2.0 semantics merely for symmetry;
- keep Pizza successor-lineage issue #4 dormant until a genuine semantic-modernization requirement appears;
- keep semantic ownership in the repository that owns the relevant concept or artifact.

## Independent Pizza work

Pizza continues its own backlog independently. Broader OAK access, preservation releases, and other repository-local work do not need to wait for SKE unless they explicitly depend on an SKE convention or an SMO/ESKA cross-repository decision.
