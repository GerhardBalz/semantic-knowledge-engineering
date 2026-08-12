# Conformance terminology across semantic, validation, and implementation concerns

Status: analysis for SKE #13

## Decision

SKE should **not** introduce a three-part ontology taxonomy called `SemanticConformance`, `ValidationConformance`, and `ImplementationConformance` at this stage.

The three phrases refer to materially different kinds of relationship, and established standards already provide more precise mechanisms for most of them.

The preferred pattern is:

1. use **entailment, consistency/satisfiability, or equivalence** for formal semantic relationships;
2. use **SHACL validation/conformance** and `sh:ValidationReport` / `sh:conforms` for SHACL validation outcomes;
3. use **`dcterms:conformsTo`** for a resource or system claiming conformance to an explicit standard/profile/contract;
4. use **W3C PROF** when that conformance target is a profile composed of constraints, schemas, validation resources, mappings, guidance, or related artifacts;
5. use **ESKA Verification** and **PROV-O** to record how a conformance or preservation claim was checked and what evidence/result was produced;
6. require an explicit **projection/preservation contract** before calling an implementation projection conformant.

This keeps the conformance target, the validation mechanism, the formal semantic relation, and the verification evidence separate.

## Why one generic taxonomy would be misleading

The word *conformance* appears across semantic-web standards, but it does not denote one universal semantic relation.

| Concern | Established mechanism | What it means | What it does not mean |
|---|---|---|---|
| Formal semantic relationship | RDF/OWL entailment, consistency/satisfiability, equivalence | Logical relationship under a defined entailment regime | Generic acceptance against an engineering contract |
| SHACL validation | `sh:ValidationReport`, `sh:conforms` | Outcome of validating a data graph/focus node against shapes | Logical equivalence to the ontology or implementation fidelity |
| OWL language/tool conformance | OWL 2 Conformance | Whether documents/tools satisfy OWL 2 conformance conditions | Whether one semantic model preserves another model's meaning |
| Generic standard/profile conformance | `dcterms:conformsTo` | Resource claims conformance to an explicit standard/profile | How conformance was tested or which individual constraints passed |
| Profile-based conformance | PROF + `dcterms:conformsTo` | Resource conforms to an explicitly described profile/specification | Automatic proof of conformance; communities define the test semantics |
| Verification evidence | ESKA `Verification` + PROV-O | Activity/result/provenance showing how a claim was checked | The conformance target itself |

A symmetric SKE taxonomy would hide these distinctions and risk asserting stronger semantics than the underlying standards provide.

## 1. Formal semantics: prefer logical relations to “semantic conformance”

### RDF

RDF semantics defines **entailment** and **satisfiability/unsatisfiability**. RDF 1.2 Concepts also explains graph **equivalence** in terms of mutual entailment.

These are explicit logical relationships:

```text
A entails B
A equivalent-to B  ⇔  A entails B and B entails A
A inconsistent / unsatisfiable
```

They answer questions about what follows from represented meaning under an entailment regime.

They do not answer whether an implementation artifact satisfies a business, API, serialization, validation, or projection contract.

### OWL

OWL 2 similarly separates formal semantics from specification conformance. The OWL 2 Conformance Recommendation defines conformance for OWL documents and tools, including entailment checkers and query-answering tools.

Historical OWL 1 test material used a section called **Semantic Conformance** in connection with consistency of OWL documents. That terminology is historically relevant but is not a good generic SKE umbrella for model-to-model or model-to-implementation preservation.

### SKE recommendation

Avoid statements such as:

```text
Projection X semantically conforms to Model Y
```

unless the phrase is explicitly defined by a concrete contract.

Prefer precise statements such as:

```text
Projection X preserves entailment E
Projection X is equivalent to Model Y under regime R
Model Y entails assertion A
Projection X passed verification V for preservation contract P
```

Most implementation projections will intentionally omit, transform, or introduce structure. Full semantic equivalence is therefore often neither true nor required.

## 2. SHACL: validation conformance already has precise semantics

SHACL validation takes a data graph and a shapes graph and produces a validation report.

A conforming validation report contains exactly one `sh:conforms` boolean. In the SHACL Recommendation, `sh:conforms true` means that validation produced no validation results; `false` means that validation produced results.

This is already a precise notion of validation conformance.

For SKE/ESKA:

```text
Data graph
    + Shapes graph
        ↓ SHACL validation
sh:ValidationReport
    sh:conforms true|false
```

ESKA can represent the validation run as an `eska:Verification` and the report as an `eska:Result` without redefining `sh:conforms`.

Therefore:

- do not create `eska:ValidationConformance` merely to mirror SHACL;
- do not treat every `eska:Verification` as SHACL validation;
- do not treat `sh:conforms` as a generic relation between arbitrary implementation artifacts and semantic models.

SHACL 1.2 remains active Recommendation-track work; this analysis relies on the stable SHACL conformance model and does not require draft-only features.

## 3. OWL document/tool conformance is not model preservation

OWL 2 Conformance explicitly defines conformance criteria for:

- ontology documents;
- tools processing OWL 2;
- entailment checkers;
- query-answering tools.

This is specification/language implementation conformance.

It should not be reinterpreted as:

```text
implementation projection conforms semantically to authoritative model
```

Those are different relations with different subjects, targets, and evidence requirements.

## 4. `dcterms:conformsTo`: reuse the generic conformance relation

DCMI defines:

```text
dcterms:conformsTo
```

as relating a described resource to an established standard to which it conforms.

This is a strong reuse candidate whenever SKE has an explicit conformance target.

Examples:

```turtle
<implementation-artifact>
    dcterms:conformsTo <implementation-profile> .

<service>
    dcterms:conformsTo <service-contract-profile> .
```

The property states the conformance claim. It does not itself explain:

- which constraints were evaluated;
- which validator was used;
- whether semantic entailments were preserved;
- what evidence supports the claim;
- whether the claim applies to all or selected model semantics.

Those remain separate concerns.

## 5. PROF: useful structure for explicit conformance targets

The W3C Profiles Vocabulary provides a useful pattern for SKE because a `prof:Profile` can describe a specification that constrains or specializes another specification.

PROF explicitly uses `dcterms:conformsTo` for resources conforming to profiles/specifications and provides roles for profile resources such as:

- constraints;
- validation;
- schema;
- mapping;
- vocabulary;
- specification;
- guidance.

PROF also explicitly leaves communities to define what conformance to their profiles means and how it is tested.

That is useful for implementation projections.

Instead of inventing a generic `ImplementationConformance` relation, SKE can first test a pattern such as:

```text
Authoritative Semantic Model
          ↓
Projection / Implementation Profile
    ├── preservation constraints
    ├── validation rules
    ├── mapping rules
    └── required representation contract
          ↓
Implementation Artifact
    dcterms:conformsTo Profile
          ↓
ESKA Verification + PROV evidence
```

This turns “implementation conformance” from a vague category into conformance to an explicit machine-addressable contract.

## 6. Implementation projection conformance requires a target contract

SMO's `ImplementationProjection` deliberately allows an implementation-facing artifact to be non-authoritative and to omit, transform, or introduce aspects.

Therefore derivation alone cannot imply conformance:

```text
prov:wasDerivedFrom
    ≠
conforms to preservation policy
```

Likewise, `prov:specializationOf` is not a generic conformance relation.

Before asserting implementation conformance, the project must state *what must be preserved*.

A projection contract/profile could specify, for example:

- required semantic identities;
- required entailments;
- permitted omissions;
- permitted introduced implementation structure;
- mapping rules;
- representation constraints;
- validation rules;
- traceability requirements.

Only then is a conformance claim meaningful.

## 7. Evidence is not the conformance relation

A useful separation is:

```text
Conformance target
    prof:Profile / dcterms:Standard / explicit contract

Conformance claim
    dcterms:conformsTo

Validation outcome
    sh:ValidationReport + sh:conforms          when SHACL is the validator

Verification activity
    eska:Verification

Evidence provenance
    PROV-O
```

This distinction prevents a common modeling error: turning a test result into the semantic definition of the contract itself.

ESKA Verification can support evidence for many kinds of checks, including:

- SHACL validation;
- OWL entailment checks;
- ROBOT verification rules;
- generated-artifact comparison;
- mapping invariants;
- API/service contract tests;
- domain-specific executable checks.

The ESKA abstraction therefore remains broader than any one conformance mechanism.

## 8. Recommended terminology for SKE documentation

Use the following language unless a domain-specific specification defines otherwise.

### Semantic reasoning

Prefer:

- **entails**;
- **is consistent / satisfiable**;
- **is equivalent under entailment regime ...**;
- **preserves entailment ...**;
- **preserves selected semantics defined by contract/profile ...**.

Avoid generic **semantic conformance** as a standalone formal relation.

### SHACL validation

Prefer:

- **conforms to the SHACL shapes graph**;
- **SHACL validation conforms / does not conform**;
- `sh:ValidationReport` + `sh:conforms`.

### Specification/profile conformance

Prefer:

- **conforms to standard/profile/contract ...**;
- `dcterms:conformsTo`;
- PROF when the target needs machine-readable profile structure.

### Implementation projections

Prefer:

- **conforms to projection profile/implementation contract ...**;
- **preserves required semantics ...**;
- **verified against ...**.

Treat **implementation conformance** as an informal category label only when the explicit conformance target is named.

## 9. Implications for SMO

No SMO v0.1 change is justified by this analysis.

For future SMO evolution:

- do not add a generic `conformsTo` property that duplicates DCMI;
- do not add a `SemanticConformance` class merely to classify logical relationships;
- do not add a `ValidationConformance` class that duplicates SHACL validation semantics;
- do not make `ImplementationProjection` imply conformance merely because it derives from an authoritative model;
- investigate a projection/preservation profile only when a concrete executable use case needs one.

A future SMO term may still be justified for a relationship that existing standards cannot express—for example, explicitly identifying the authoritative semantic model from which a projection contract derives—but that is a separate question from generic conformance.

## 10. Implications for ESKA

No ESKA ontology change is justified by this analysis.

ESKA should continue to:

- use `Verification` for the checking activity;
- use `Result` for machine-interpretable outcomes;
- reuse PROV-O for evidence lineage;
- reuse SHACL reports when SHACL performs validation;
- allow a verified artifact to claim `dcterms:conformsTo` an explicit profile/contract where appropriate;
- avoid turning validator/tool semantics into core ESKA vocabulary.

The OAK and ROBOT proving grounds reinforce this separation: executable tools can provide evidence while stable ESKA semantic contracts remain tool-independent.

## 11. Implications for Pizza

Pizza is the right next proving ground for this terminology because it can exercise all three concerns without requiring new vocabulary first.

A useful future Pizza experiment would distinguish:

1. **semantic reasoning evidence** — an OWL entailment expected from the Pizza model;
2. **validation conformance** — a Pizza data graph validated by SHACL with a `sh:ValidationReport`;
3. **implementation/profile conformance** — a generated or projected artifact claiming `dcterms:conformsTo` an explicit profile whose constraints/preservation rules are testable.

The same exercise should record ESKA Verification/PROV evidence for each check.

If that proving ground reveals that PROF/DCMI/SHACL plus precise logical relations are insufficient, the missing relation can then be specified from concrete evidence.

## Recommendation

**Do not mint new conformance vocabulary now.**

Use established terms according to their actual semantic scope and make conformance targets explicit.

The remaining genuinely interesting problem is not naming three kinds of conformance. It is defining a **machine-readable projection/preservation contract** that says which semantics an implementation projection must preserve, may transform, may omit, or may introduce.

That should be tested on Pizza before SMO or ESKA vocabulary is extended.

## References

- RDF 1.2 Concepts and Abstract Data Model: https://www.w3.org/TR/rdf12-concepts/
- RDF 1.2 Semantics: https://www.w3.org/TR/rdf12-semantics/
- OWL 2 Conformance (Second Edition): https://www.w3.org/TR/owl2-conformance/
- OWL Web Ontology Language Test Cases (historical OWL 1 semantic-conformance terminology): https://www.w3.org/TR/owl-test/
- SHACL Recommendation: https://www.w3.org/TR/shacl/
- SHACL 1.2 Core: https://www.w3.org/TR/shacl12-core/
- DCMI Metadata Terms — `dcterms:conformsTo`: https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/conformsTo/
- W3C Profiles Vocabulary: https://www.w3.org/TR/dx-prof/
- SKE ontology-engineering reference landscape: `ontology-engineering.md`
- SKE SMO v0.1 standards alignment: `smo-v0.1-standards-alignment.md`
- SKE ESKA standards/tooling alignment: `eska-standards-tooling-alignment.md`
