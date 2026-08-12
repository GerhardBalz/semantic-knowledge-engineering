# SMO v0.1 standards-alignment assessment

Status: analysis for SKE #6

## Purpose

This note tests the deliberately minimal Semantic Modeling Ontology (SMO) v0.1 surface against established semantic-web standards before any future vocabulary expansion.

The current SMO v0.1 surface contains only two classes:

- `smo:SemanticModel`;
- `smo:ImplementationProjection`.

SMO v0.1 defines no SMO properties.

The purpose of this assessment is therefore not to find places to add terms. It is to determine whether the two existing terms duplicate established semantics, what existing vocabularies should be reused alongside them, and whether the governed v0.1 release should change.

## Conclusion

**No SMO v0.1 vocabulary change is justified by this assessment.**

Neither existing class is equivalent to a baseline RDF/RDFS/OWL/SKOS/SHACL/PROV-O term:

- `smo:SemanticModel` is intentionally technology-neutral and is broader than `owl:Ontology`, `skos:ConceptScheme`, or a SHACL shapes graph;
- `smo:ImplementationProjection` expresses an implementation-facing, explicitly non-authoritative role that is not supplied by PROV-O, although PROV-O should be reused to express derivation and transformation provenance.

The preferred reuse pattern is **multiple typing plus established relations**, not technology-specific SMO subclasses and not replacement of established vocabularies.

## Term-by-term assessment

### `smo:SemanticModel`

Current SMO meaning:

> A formal representation that gives knowledge explicit machine-interpretable meaning through concepts, relationships, constraints, axioms, or equivalent semantic structures.

This definition is intentionally broader than any one semantic representation technology.

#### Not equivalent to `owl:Ontology`

OWL 2 defines an ontology as an OWL ontology structure with optional ontology IRI and version IRI. OWL 2 also defines a specific ontology language, semantics, axioms, profiles, and RDF mapping.

An OWL ontology can therefore be a semantic model, but a semantic model need not be an OWL ontology.

Examples of semantic artifacts that may reasonably be treated as semantic models without being OWL ontologies include:

- a SKOS concept scheme;
- a SHACL shapes graph used as a formal structural/constraint model;
- a semantic model combining several standards or artifacts under one governed identity;
- a future formalism not represented as OWL.

Therefore SMO should not assert either:

- `smo:SemanticModel owl:equivalentClass owl:Ontology`; or
- `smo:SemanticModel rdfs:subClassOf owl:Ontology`.

The opposite subclass relation would also be too broad as a normative global claim: not every resource typed `owl:Ontology` necessarily satisfies the governance and modeling intent that SKE may require when it calls something a semantic model.

The safer pattern is instance-level multiple typing where the roles genuinely apply.

Example:

```turtle
ex:authoritativeModel
    a smo:SemanticModel,
      owl:Ontology .
```

This states both the SKE modeling role and the concrete OWL technology role without redefining either.

#### Relationship to SKOS

SKOS defines `skos:ConceptScheme` for knowledge-organization systems. A concept scheme may itself also be typed as an OWL ontology; the SKOS Recommendation explicitly permits this combination.

SMO should follow the same compositional approach rather than introducing a `SmoSkosModel` or similar technology-specific subclass.

Example:

```turtle
ex:classification
    a smo:SemanticModel,
      skos:ConceptScheme .
```

The SKOS vocabulary continues to own concept-scheme semantics. SMO contributes only the broader governed semantic-model role when that role is useful.

#### Relationship to SHACL

SHACL 2017 remains the current W3C Recommendation baseline. The active SHACL 1.2 Working Draft family broadens and clarifies SHACL's graph-modeling surface; SHACL 1.2 Core includes role classes such as `sh:ShapesGraph` and `sh:DataGraph` and explicitly permits a graph to have more than one graph role.

This reinforces the multiple-typing pattern rather than creating SHACL-specific SMO classes.

An emerging SHACL 1.2 example would be:

```turtle
ex:contractShapes
    a smo:SemanticModel,
      sh:ShapesGraph .
```

Because SHACL 1.2 is work in progress, SMO v0.1 must not depend normatively on these draft terms. The example demonstrates the architectural composition pattern only.

#### Relationship to RDF/RDFS

RDF and RDFS provide the representation and basic schema substrate. They do not provide a class equivalent to the SKE notion of a governed semantic-model artifact.

SMO should continue to reuse RDF/RDFS directly and should not create replacements for graph, class, property, domain/range, or subclass semantics.

#### Relationship to PROV-O

A semantic model can naturally be described as a `prov:Entity` when provenance is being recorded. PROV-O defines Entity broadly enough to include digital and conceptual things with fixed aspects.

Two patterns are possible:

```turtle
ex:model
    a smo:SemanticModel,
      prov:Entity .
```

or a future schema-level statement such as:

```turtle
smo:SemanticModel rdfs:subClassOf prov:Entity .
```

The first pattern is sufficient for current use and avoids introducing a mandatory PROV-O dependency merely for classification. A global subclass axiom should be added only if an actual reasoning/interoperability requirement justifies it.

**Recommendation for v0.1: no PROV-O superclass axiom.**

### `smo:ImplementationProjection`

Current SMO meaning:

> A non-authoritative implementation-facing projection derived from selected semantics of a Semantic Model, preserving explicit semantic identity and relationships according to a declared preservation, transformation, introduction, and omission policy while allowing target-specific implementation concerns.

The key semantic content is not just derivation. It is the combination of:

- implementation-facing role;
- non-authoritative status;
- selection from authoritative semantics;
- explicit preservation/transformation/introduction/omission policy;
- continued traceability to semantic authority;
- allowance for target-specific implementation concerns.

No baseline standard supplies this combination as a class.

#### Reuse `prov:wasDerivedFrom` for generic derivation

PROV-O defines `prov:wasDerivedFrom` as derivation/transformation from one Entity to another. This is directly useful for a projection created from a semantic model.

Example:

```turtle
ex:authoritativeModel
    a smo:SemanticModel,
      prov:Entity .

ex:sqlSchema
    a smo:ImplementationProjection,
      prov:Entity ;
    prov:wasDerivedFrom ex:authoritativeModel .
```

This should be preferred over minting an SMO property whose only meaning is generic derivation.

PROV-O qualified derivation can also record the transformation Activity and additional details where needed.

However, `prov:wasDerivedFrom` does **not** express that the source is semantically authoritative, that the target is non-authoritative, or which semantics were preserved, transformed, introduced, or omitted. SMO/ESKA still have a distinct concern there.

#### Do not use `prov:specializationOf` as the defining projection relation

PROV-O states that an Entity that specializes another shares all aspects of the more general Entity and additionally presents more specific aspects of the same thing.

That is too strong for `smo:ImplementationProjection` in general.

An implementation projection may deliberately:

- omit semantics that the target cannot represent;
- transform semantics into implementation constructs;
- introduce technical concerns not present in the authoritative model;
- preserve only a declared subset of meaning.

Such a projection is not guaranteed to share **all** aspects of the authoritative model. Therefore:

**`prov:specializationOf` must not become the generic SMO projection relation.**

It may still be used for a particular artifact if that artifact independently satisfies PROV-O's specialization semantics.

#### Do not use `prov:hadPrimarySource` to mean semantic authority

PROV-O's primary-source relation has a provenance-specific meaning concerning a preceding Entity with direct experience or knowledge of a topic. That is not equivalent to SKE's concept of an authoritative semantic source.

Semantic authority should therefore not be encoded by relabeling `prov:hadPrimarySource`.

#### `prov:Entity` is complementary, not equivalent

An implementation projection is naturally a provenance Entity when provenance is modeled, but `prov:Entity` is vastly broader and carries none of the implementation-projection semantics.

Therefore:

- `smo:ImplementationProjection owl:equivalentClass prov:Entity` would be incorrect;
- multiple typing is appropriate;
- a future `rdfs:subClassOf prov:Entity` statement is possible but not required for v0.1.

## Responsibility mapping

| SMO concept | Existing term | Decision | Rationale |
|---|---|---|---|
| `smo:SemanticModel` | RDF/RDFS graph/schema constructs | Complement | RDF/RDFS provide substrate, not the governed aggregate model role |
| `smo:SemanticModel` | `owl:Ontology` | Overlap, not equivalence | OWL ontology is one concrete semantic-model technology |
| `smo:SemanticModel` | `skos:ConceptScheme` | Overlap, not equivalence | Concept scheme is one concrete knowledge-organization artifact |
| `smo:SemanticModel` | SHACL shapes graph / emerging `sh:ShapesGraph` | Overlap, not equivalence | SHACL owns shape/constraint graph semantics; a shapes graph may play a semantic-model role |
| `smo:SemanticModel` | `prov:Entity` | Generic superclass candidate only | PROV Entity is broad enough for provenance but does not express semantic-model meaning |
| `smo:ImplementationProjection` | `prov:Entity` | Generic superclass candidate only | Projection is an Entity when provenance is modeled, but Entity carries no projection semantics |
| `smo:ImplementationProjection` | `prov:wasDerivedFrom` | Reuse relation | Correct generic derivation relation; does not express authority or preservation policy |
| `smo:ImplementationProjection` | `prov:qualifiedDerivation` / `prov:Derivation` | Reuse when details matter | Can describe transformation provenance and Activity details |
| `smo:ImplementationProjection` | `prov:specializationOf` | Not generic | Requires shared aspects of the same thing; projection may omit/transform/introduce aspects |
| semantic authority | `prov:hadPrimarySource` | Not equivalent | PROV primary-source semantics are not semantic-governance authority |

## Preferred composition pattern

The architectural pattern should be:

```text
SMO role/classification
        +
concrete semantic technology typing
        +
PROV-O provenance when needed
        +
SHACL/OWL/SKOS semantics owned by their standards
```

not:

```text
SMO redefines OWL/SKOS/SHACL/PROV concepts
```

This keeps SMO small while allowing a resource to carry all applicable meanings.

## Implications for future SMO evolution

### Keep v0.1 unchanged

The governed first release should preserve exactly the current two-class, zero-property surface.

The assessment found no duplicate class that should replace either term and no missing external axiom that is necessary for v0.1 interoperability.

### Prefer usage patterns before new vocabulary

Before adding a dedicated SMO projection relation, test whether the following composition is sufficient in Pizza/ESKA experiments:

```turtle
ex:projection
    a smo:ImplementationProjection,
      prov:Entity ;
    prov:wasDerivedFrom ex:model .
```

If later use cases need a relation whose semantics are specifically “implementation projection of authoritative semantic model”, that requirement should be demonstrated separately. Such a relation could then specialize or coexist with PROV-O derivation rather than replacing it.

### Treat authority as a separate concern from provenance

PROV-O answers questions such as how an Entity was generated, derived, attributed, or specialized. SKE's notion of semantic authority answers a governance/interpretation question: which model is normative for meaning versus which artifacts are implementation projections.

Those concerns interact but are not identical.

Future SMO/ESKA work should preserve that distinction explicitly.

### Do not create technology-specific SMO subclasses without evidence

Avoid classes such as:

- `OwlSemanticModel`;
- `SkosSemanticModel`;
- `ShaclSemanticModel`.

Multiple typing already composes SMO with the established standard vocabularies without creating a parallel taxonomy.

## Standards-status note: SHACL 1.2

The original SKE ontology-engineering landscape recorded SHACL 2017 as the current Recommendation, which remains correct, but omitted active next-generation work.

As of August 2026:

- SHACL 2017 remains the latest W3C Recommendation;
- SHACL 1.2 is an active Recommendation-track Working Draft family;
- SHACL 1.2 Core has Working Draft publications through June 2026;
- draft 1.2 work includes Core, SPARQL extensions, Node Expressions, Rules, UI, Compact Syntax, and Profiling.

SKE should therefore use the same status pattern already used for RDF 1.2:

**stable Recommendation baseline + explicitly labeled emerging next-version work**.

No SMO v0.1 normative dependency on SHACL 1.2 is proposed.

## References

### W3C

- OWL 2 Structural Specification and Functional-Style Syntax: https://www.w3.org/TR/owl2-syntax/
- OWL 2 Overview: https://www.w3.org/TR/owl2-overview/
- SKOS Reference: https://www.w3.org/TR/skos-reference/
- SHACL Recommendation: https://www.w3.org/TR/shacl/
- SHACL 1.2 Core (Working Draft): https://www.w3.org/TR/shacl12-core/
- SHACL 1.2 Core publication history: https://www.w3.org/standards/history/shacl12-core/
- PROV-O: https://www.w3.org/TR/prov-o/

### Initiative sources

- SKE ontology-engineering landscape: `ontology-engineering.md`
- SMO v0.1 ontology: `GerhardBalz/semantic-modeling-ontology/model/smo.ttl`
- SMO publication boundary: `GerhardBalz/semantic-modeling-ontology#5`

## Decision

For SKE #6:

- retain `smo:SemanticModel`;
- retain `smo:ImplementationProjection`;
- keep SMO v0.1 unchanged;
- reuse technology-specific typing through multiple RDF types;
- reuse PROV-O derivation for generic provenance;
- reject `prov:specializationOf` as a universal projection relation;
- do not equate provenance primary-source semantics with semantic authority;
- defer any schema-level PROV superclass axioms until a concrete reasoning requirement exists;
- correct SKE's landscape to record active SHACL 1.2 work.
