# Modern ontology-engineering reference landscape

Status: initial architectural baseline for SKE #4

## Purpose

This document maps established semantic-web standards, ontology-engineering practices, and operational tooling before SKE, SMO, or ESKA introduce overlapping concepts.

It is deliberately a **responsibility and reuse map**, not a new ontology-development methodology.

## Status matters

The semantic-web stack does not move as one versioned product. Some components are stable W3C Recommendations while others are active next-generation work.

As of August 2026:

- **RDF 1.1** remains the latest W3C Recommendation for the RDF abstract data model, while **RDF 1.2** is progressing on the Recommendation track; RDF 1.2 Concepts reached Candidate Recommendation Snapshot on 7 April 2026.
- **Turtle 1.1** remains the latest W3C Recommendation, while **RDF 1.2 Turtle** is a Working Draft.
- **OWL 2 Second Edition** remains the current W3C Recommendation family for OWL; the OWL 2 Primer Second Edition is dated 11 December 2012.
- **SKOS** remains a W3C Recommendation from 18 August 2009.
- **PROV-O** remains a W3C Recommendation from 30 April 2013.
- **SHACL** remains a W3C Recommendation from 20 July 2017.

SKE documentation should therefore distinguish **stable normative baseline** from **emerging next-version work** instead of treating publication date as a proxy for relevance.

## Layered view

1. **Identification and graph substrate** — IRIs, RDF, RDF datasets, Turtle and other RDF syntaxes.
2. **Semantic schema and inference** — RDFS and OWL 2.
3. **Knowledge organization** — SKOS for concept schemes, thesauri, taxonomies, classifications, and mappings.
4. **Constraints and validation** — SHACL for describing and validating conditions over RDF graphs.
5. **Provenance and metadata** — PROV-O and established metadata vocabularies rather than project-specific reinvention.
6. **Ontology-engineering lifecycle** — scope, competency questions, design patterns, testing, collaboration, governance, versioning, identifiers, releases, and documentation.
7. **Operational tooling and automation** — Protégé/WebProtégé, ROBOT, ODK, OAK, reasoners, query engines, CI, and publication infrastructure.
8. **Semantic modeling and execution architecture** — SMO and ESKA only where concerns remain after reuse of the layers above.

The layers are conceptual responsibilities, not a mandatory technology stack.

## Responsibility matrix

| Component | Category | Primary responsibility | Authority / status | Relationship to SMO | Relationship to ESKA | Reuse / gap |
|---|---|---|---|---|---|---|
| RDF 1.1 / emerging RDF 1.2 | Standard / data model | Graph and dataset data model, IRIs, literals, blank nodes, RDF terms and semantics | W3C Recommendation baseline; RDF 1.2 in Recommendation-track development | Reuse as representation substrate; SMO should not redefine graph semantics | Reuse for exchange, traceability and semantic artifacts | No SKE vocabulary needed for RDF fundamentals |
| Turtle 1.1 / emerging Turtle 1.2 | Standard / syntax | Human-oriented concrete RDF syntax | W3C Recommendation baseline; Turtle 1.2 Working Draft | Useful serialization for SMO artifacts, not SMO semantics | Useful publication/exchange syntax, not execution semantics | Treat syntax separately from model identity |
| RDFS | Standard / semantic schema | Classes, properties, subclass/subproperty and basic domain/range semantics | W3C RDF Schema | Reuse directly for basic schema semantics | Consume rather than redefine | No SKE replacement |
| OWL 2 | Standard / ontology language | Formally defined ontology semantics, axioms, inference, profiles | W3C Recommendation, Second Edition | Reuse for formal semantic-model axioms; SMO should describe model artifacts/relations rather than replace OWL semantics | ESKA should preserve/consume OWL semantics through implementation and execution | Gap is lifecycle/projection/execution architecture, not ontology-language semantics |
| SKOS | Standard / vocabulary | Knowledge organization systems, concept schemes, labels, semantic relations and mappings | W3C Recommendation | Reuse where a semantic model contains concept schemes or controlled terminology | Usually an input semantic artifact rather than execution architecture | Do not model taxonomy/thesaurus semantics anew |
| SHACL | Standard / constraint language | RDF graph constraints, validation, shapes and validation reports | W3C Recommendation | Strong candidate for concrete constraint artifacts associated with semantic models | Strong candidate for executable validation gates and data contracts | Distinguish OWL inference from closed-world/data-quality validation |
| PROV-O | Standard / provenance ontology | Interchangeable provenance over entities, activities and agents | W3C Recommendation | Reuse for provenance of model artifacts, projections, versions and transformations where applicable | Reuse for execution/transformation/result provenance where applicable | SMO/ESKA should specialize or relate to PROV-O rather than invent generic provenance |
| Protégé / WebProtégé | Tooling / modeling environment | OWL ontology authoring, reasoning, querying and collaborative ontology development | Stanford Protégé project | Authoring and inspection environment for SMO and models using SMO | Useful for authoritative semantic sources, not an execution architecture | Tool choice must remain replaceable |
| Protégé ontology-engineering practice | Methodology / training practice | Domain/scope, competency questions, domain terms, design patterns, testing and validation strategies | Current Stanford Protégé Short Course, June 2026 | Useful methodology; should not be encoded as SMO semantics merely because it is good practice | Provides source-engineering discipline before execution | Reuse as practice, not normative SKE invention |
| OBO Foundry principles | Governance / engineering practice | Openness, format, identifier space, versioning, scope, definitions, relations, documentation, authority, naming, change notification, maintenance and semantic stability | Normative for OBO Foundry ontologies; generally recommended by OBO beyond Foundry submission | Useful evidence for governance patterns; biomedical-specific rules are not automatically universal | Useful precedent for persistent identifiers, authority and semantic stability | Adopt principles selectively with provenance, not wholesale |
| ROBOT | Tooling / automation | Command-line ontology workflows such as reasoning, reporting, conversion and related automation | OBO/ROBOT ecosystem | Potential CI/build tool for OWL-based SMO artifacts | Potential validation/build component, not architectural authority | Replaceable implementation tool |
| ODK | Engineering framework / tooling | Reproducible ontology lifecycle workflows, CI, quality control, releases and dynamic imports | INCATools Ontology Development Kit | Strong reference for repository and release engineering | Useful source-side automation; may implement ESKA checks but does not define ESKA | Reuse workflow ideas before creating bespoke lifecycle machinery |
| OAK | Library / access abstraction | Common ontology operations across multiple storage/access backends | INCATools Ontology Access Kit | Potential programmatic access to semantic-model elements and ontology sources | Especially relevant to agent/service access without binding architecture to one backend | Strong precedent for separating ontology operations from backend implementation |
| Git + CI + releases | Engineering infrastructure | Reviewable change history, automated checks, immutable release points | General software-engineering infrastructure | Supports governed model lifecycle | Supports verifiable transformation and deployment pipelines | Infrastructure is not semantic authority |
| Persistent identifiers | Publication infrastructure / governance | Stable semantic identity independent of replaceable hosting backend | Web architecture plus chosen PID governance, e.g. W3ID in this initiative | Stable identity for SMO vocabulary/model artifacts | Stable reference to authoritative semantic resources through execution | Central SKE convention; do not equate GitHub URLs with semantic identity |
| SMO | SKE semantic vocabulary | Describe semantic-model artifacts and relationships not adequately covered by reused standards | SKE initiative repository with independent semantic governance | Own concern | Provides model/projection vocabulary consumed by ESKA where useful | Must stay intentionally small and reuse RDF/OWL/SKOS/SHACL/PROV concepts |
| ESKA | Architecture | Preserve authoritative semantics through projection, implementation, execution, verification, service and agent access | SKE initiative architecture repository with independent governance | Consume SMO where stable and useful | Own concern | Gap is architectural continuity from semantics to execution, not a replacement ontology language or toolchain |
| Pizza reference | Reference implementation / proving ground | Exercise semantic-model, publication, projection and executable-semantic patterns concretely | Initiative reference repository | Demonstrate SMO applicability | Demonstrate ESKA applicability | Evidence generator; not normative architecture by itself |

## Important distinctions

### OWL semantics are not SHACL validation

OWL provides formally defined ontology semantics and entailment. SHACL describes conditions over RDF graphs and produces validation results. They can complement one another, but neither should be presented as a drop-in replacement for the other.

For SKE this suggests a useful distinction between:

- **semantic axioms** that state what follows from the modeled meaning; and
- **validation constraints** that determine whether a graph is acceptable for a particular contract or process.

SMO may need to relate a semantic model to both kinds of artifact without collapsing them into one concept.

### Semantic identity is not serialization or hosting

An ontology/model identity, an RDF serialization, a repository file, a Git tag, and a public download URL are different concerns.

This reinforces the SKE principle that semantic identity is independent of publication backend. Persistent identifiers should remain stable while concrete serialization and hosting targets can change.

### Methodology is not ontology semantics

The 2026 Protégé Short Course explicitly teaches ontology-engineering practices such as defining scope, competency questions, design patterns and testing. OBO Foundry adds mature governance principles, while ODK makes lifecycle automation executable.

These are valuable references for *how to engineer ontologies*. Their existence is evidence against making SMO a new ontology-development methodology.

### Tools are replaceable implementation choices

Protégé, ROBOT, ODK and OAK are strong references and useful implementation candidates, but SKE architecture should describe the capability or contract before naming one tool as mandatory.

OAK is especially relevant architecturally because its interfaces are separated from particular ontology backends. That is closely aligned with the SKE goal of preserving semantic access without coupling semantic identity to one storage or serving technology.

## Boundary conclusions for SMO

SMO should prefer reuse over invention.

Candidate SMO responsibility:

- identify a semantic model as a governed artifact;
- relate a model to model elements when such an aggregate notion is useful;
- describe authoritative versus non-authoritative implementation projections;
- relate mappings, constraints, projections and operational artifacts where existing vocabularies do not already express the required relationship;
- reuse PROV-O for generic provenance rather than duplicating Entity/Activity/Agent concepts;
- reuse SHACL for RDF validation constraints rather than inventing a parallel constraint language;
- reuse OWL/RDFS/SKOS semantics for ontology and concept-model content.

Non-goals should include defining RDF graph semantics, replacing OWL, replacing SHACL, replacing SKOS, defining generic provenance, or prescribing a complete ontology-development methodology.

## Boundary conclusions for ESKA

ESKA's strongest non-duplicative territory is architectural continuity between authoritative semantics and executable systems.

Candidate ESKA responsibility:

- trace authoritative semantic sources into implementation projections;
- make transformation/projection steps explicit and verifiable;
- preserve links from executable artifacts and results back to semantic authority;
- expose semantic knowledge to services and agents without treating an implementation backend as the semantic source of truth;
- make validation/reasoning/provenance capabilities composable parts of execution where appropriate;
- define contracts that tools such as OAK, ROBOT, reasoners, SHACL engines, APIs or generated artifacts can satisfy without making one tool mandatory.

ESKA should not redefine ontology-language semantics, generic graph validation, generic provenance, or ontology-authoring methodology.

## What SKE should own

SKE should own the cross-repository architectural map and conventions needed to keep responsibilities coherent, including:

- responsibility boundaries and reuse decisions;
- shared persistent-identity and publication principles;
- shared documentation/engineering conventions where genuinely cross-repository;
- evidence-backed architecture decisions;
- the initiative roadmap and dependency map.

SKE should not become the semantic authority for SMO or ESKA vocabularies.

## Pizza as proving ground

Pizza should be used to test whether the landscape survives concrete implementation. Useful experiments include:

1. represent the Pizza ontology in stable RDF/OWL with resolvable persistent identity;
2. introduce SHACL only for constraints that are truly validation concerns rather than OWL semantics;
3. record model/release/transformation provenance with PROV-O where useful;
4. use SMO to describe authoritative model and implementation projections only after the SMO concepts are justified by the landscape;
5. use ESKA patterns to trace generated or executable artifacts back to authoritative Pizza semantics;
6. test OAK/ROBOT/ODK capabilities where they reduce bespoke implementation work.

## Architectural gaps worth investigating

The initial landscape suggests that the most promising gaps are **relationships across layers**, not missing replacements for the standards themselves.

In particular:

- how to state that one semantic model is authoritative while a generated implementation artifact is a non-authoritative projection;
- how to preserve traceability across semantic source → transformation → projection → executable artifact → execution/result;
- how to distinguish semantic conformance, validation conformance and implementation conformance;
- how to expose semantic knowledge to agents/services through replaceable access mechanisms;
- how to make these relationships machine-interpretable without creating a vocabulary for concepts already owned by OWL, SHACL, SKOS or PROV-O.

These gaps are stronger candidates for SMO/ESKA work than generic ontology-engineering concepts.

## References

### W3C

- RDF 1.1 Concepts and Abstract Syntax: https://www.w3.org/TR/rdf11-concepts/
- RDF 1.2 Concepts and Abstract Data Model: https://www.w3.org/TR/rdf12-concepts/
- RDF 1.2 Turtle: https://www.w3.org/TR/rdf12-turtle/
- RDF Schema: https://www.w3.org/TR/rdf-schema/
- OWL 2 Document Overview: https://www.w3.org/TR/owl2-overview/
- OWL 2 Primer: https://www.w3.org/TR/owl2-primer/
- OWL 2 Structural Specification and Functional-Style Syntax: https://www.w3.org/TR/owl2-syntax/
- OWL 2 Profiles: https://www.w3.org/TR/owl2-profiles/
- OWL 2 Mapping to RDF Graphs: https://www.w3.org/TR/owl2-mapping-to-rdf/
- OWL 2 Quick Reference Guide: https://www.w3.org/TR/owl2-quick-reference/
- SKOS Reference: https://www.w3.org/TR/skos-reference/
- SHACL: https://www.w3.org/TR/shacl/
- PROV-O: https://www.w3.org/TR/prov-o/

### Stanford Protégé

- Protégé: https://protege.stanford.edu/
- Protégé Short Course 2026: https://protege.stanford.edu/shortcourse/

### OBO / INCATools

- OBO Foundry principles: https://obofoundry.org/principles/fp-000-summary.html
- Ontology Development Kit: https://incatools.github.io/ontology-development-kit/
- Ontology Access Kit: https://incatools.github.io/ontology-access-kit/
- ROBOT: https://robot.obolibrary.org/

## Follow-up candidates

The landscape itself should not trigger speculative changes. Repository-specific issues should be opened only when evidence identifies a concrete requirement.

High-value next investigations are:

1. map current SMO v0.1 terms against RDF/RDFS/OWL/SKOS/SHACL/PROV-O and identify actual duplication or gaps;
2. map current ESKA concepts against SHACL validation, PROV-O provenance, OAK access abstractions and ODK/ROBOT lifecycle automation;
3. define a small terminology distinction for **semantic conformance**, **validation conformance**, and **implementation conformance** if the existing standards do not already provide adequate terms;
4. exercise the result on Pizza before extending the vocabularies.
