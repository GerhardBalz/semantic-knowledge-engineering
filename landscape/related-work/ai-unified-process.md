# AI Unified Process / Spec-Driven Development as SKE related work

## Purpose

This note compares Simon Martinelli's **AI Unified Process (AIUP)** / **Spec-Driven Development** with Semantic Knowledge Engineering (SKE), Semantic Modeling Ontology (SMO), and Executable Semantic Knowledge Architecture (ESKA).

AIUP is treated as **external related methodology**, not as an SKE component, vocabulary, tool, or initiative reference example.

The comparison follows the SKE [concept and responsibility map](../concept-map.md): preserve the source approach's own terminology first, then compare by **kind**, **architectural concern**, and **evidence status**.

## Sources

Reviewed sources include:

- [AI Unified Process](https://unifiedprocess.ai/)
- [AIUP methodology](https://unifiedprocess.ai/methodology.html)
- [AIUP tutorial](https://unifiedprocess.ai/tutorial.html)
- [AIUP tools](https://unifiedprocess.ai/tools.html)
- [AIUP Marketplace](https://github.com/AI-Unified-Process/marketplace)
- [AIUP Book Library reference](https://github.com/AI-Unified-Process/book-library)
- Martinelli, Simon. *Spec-Driven Development: From Specs to Code with AI Agents*. Apress Pocket Guides, 2026. Electronic ISBN `979-8-8688-2851-5`; DOI `10.1007/979-8-8688-2851-5`.

The current Marketplace operationalizes AIUP as a structured workflow from written vision through requirements, entity modeling, use cases, implementation, and tests, with stable identifiers and reviewable repository artifacts.

## AIUP in its own terms

The reviewed book frames a deliberately small **Specification Core** around:

1. **Requirements Catalog** — functional requirements, non-functional requirements, constraints, and stable requirement identities;
2. **Entity Model** — core application/domain concepts, relationships, attributes, selected constraints, and shared vocabulary;
3. **System Use Cases** — observable behavioral contracts and the main executable specifications.

The current public Marketplace adds supporting workflow artifacts such as the initial vision and use-case diagram around that core.

The central source-authority rule is specification-driven:

```text
specification
    ↓
implementation
    ↓
verification
```

rather than treating generated code as the only durable representation of intended behavior.

### Executable does not imply formal semantics

AIUP's use of **executable specification** is broader than formal semantic modeling. Structured natural language and Markdown can be executable when they are precise enough to drive implementation, synchronization, and tests.

Therefore AIUP is **specification-driven**, not ontology-driven.

Nothing in the reviewed AIUP core requires RDF, OWL, SHACL, or a formal ontology.

## Artifact responsibilities

| AIUP concern/artifact | Primary responsibility | SKE interpretation |
| --- | --- | --- |
| Requirements Catalog | structured intent, requirements, constraints | behavioral/product authority; not semantic ontology by default |
| Entity Model | shared application/domain vocabulary and structure | application structural specification; not automatically a `SemanticModel` or `ImplementationProjection` |
| System Use Cases | observable behavioral contracts | behavioral authority for the specified interaction/change |
| code | implementation view | implementation realization; not durable behavioral authority by itself |
| tests | verification view of behavior | executable verification evidence; not semantic authority merely because executable |
| guideline files | project/architecture memory and conventions | engineering/project knowledge |
| Agent Skills / plugins | repeatable methodology and stack-specific workflows | workflow/tooling concern |
| Git repository/history | persistence, reviewable change history, shared project memory | engineering/version evidence; not semantic provenance by itself |
| MCP | current external technical context/tool access | external protocol/tool-context mechanism; not behavioral or semantic authority |

This separation is already useful without introducing semantic-web technology.

## Central comparison

The strongest distinction is between two different continuity concerns:

> **AIUP:** specifications should remain authoritative and alive while AI agents generate and evolve implementation.
>
> **SKE / SMO / ESKA:** semantics relevant to execution should remain explicit, traceable, and connected to authoritative meaning through any projections, runtime behavior, results, and evidence.

These concerns are complementary rather than competing universal sources of truth.

A side-by-side responsibility model is more accurate than a hierarchy:

```text
AIUP behavioral / specification authority       Semantic authority — where justified

Requirements Catalog                            Semantic Model
intent / constraints                            stable meaning / identity / selected semantics
        │                                               │
        ├──────── references / shared concepts ─────────┤
        │                                               │
System Use Cases                                 selected semantic projection
observable behavioral contracts                 only when a projection is actually needed
        │                                               │
        └─────────────────────┬─────────────────────────┘
                              ↓
                  implementation realizations
                              ↓
                    tests / execution / evidence
```

The term **authority by concern** is an SKE interpretation. It is not AIUP terminology.

## Entity Model versus Semantic Model

AIUP's Entity Model is intentionally lightweight and application-oriented. It can define:

- entities;
- relationships;
- cardinalities;
- attributes;
- application validation rules;
- shared terminology.

That does not make it a formal ontology or an authoritative semantic model in the SKE sense.

A separate `smo:SemanticModel` would be justified only if a project needs independently governed machine-interpretable meaning, identity, semantic constraints, mappings, interoperability, or reasoning beyond what the AIUP specification artifacts already provide.

### `ImplementationProjection` remains conditional

An AIUP Entity Model becomes an `smo:ImplementationProjection` only for a **deliberately derived semantic surface**, for example when:

- a separate authoritative Semantic Model exists;
- selected semantics are projected into application structure;
- preservation, transformation, or omission is explicit;
- source semantic identity remains traceable.

Implementation-only structure remains locally owned by the AIUP/application design.

Therefore:

```text
AIUP Entity Model
    ≠ automatically smo:ImplementationProjection
```

and:

```text
smo:ImplementationProjection
    ≠ every generated artifact
```

## Where explicit semantics could add independent value

SKE should add semantic machinery only where it contributes something AIUP does not already handle adequately.

Potential examples include:

### Stable domain identity across artifacts

A concept may appear in requirements, Entity Model, use-case prose, APIs, schemas, code, and tests. Stable semantic identifiers can make selected cross-artifact identity explicit without forcing every artifact into RDF.

### Domain meaning versus application structure

A separately governed semantic model can distinguish reusable domain meaning from implementation-facing attributes, persistence choices, or local validation detail.

### Cross-context semantic contracts

AIUP scales through bounded contexts with separate specification ownership. Explicit semantic identities or mappings may help when contexts exchange concepts that are genuinely shared, mapped, or easily confused by similar names.

### Formal semantic constraints or reasoning

OWL, SHACL, SPARQL, rules, mappings, or other semantic mechanisms may be useful when classification, graph validation, interoperability, or reasoning has independent value.

The mechanism should follow the concern being tested; no technology is privileged merely because the experiment is semantic.

### Provenance beyond engineering history

Git can answer what changed, when, and through which review history. Explicit semantic provenance can answer a different question, such as:

> Which authoritative semantic concept or constraint was this projected structure intended to preserve?

These evidence systems are complementary.

## Where semantic machinery would be overhead

Do **not** introduce a semantic layer merely to duplicate concerns AIUP already handles clearly, such as:

- requirement and use-case numbering;
- use-case scenario sequencing;
- ordinary Markdown status/project metadata;
- UI details;
- straightforward field/key/length validation;
- implementation technology choices;
- test navigation and traceability already carried by AIUP artifacts;
- project conventions already represented in guideline files.

A successful SKE comparison may therefore conclude that some concerns need **no additional semantic machinery**.

That is useful negative/falsification evidence, not failure.

## Bounded contexts and distributed authority

AIUP's bounded-context scaling model is compatible with an important SKE guardrail:

> **Coherent integration does not require centralized semantic ownership.**

Each bounded context may own its own specification core and, where independently useful, its own source-owned semantic model. Cross-context contracts or mappings can be explicit without requiring one giant enterprise ontology.

## Agent context and MCP

AIUP separates several agent-consumed knowledge concerns:

```text
Specifications
    intended behavior / application structure

Guidelines
    project and architecture memory

Skills / plugins
    repeatable methodology and implementation workflows

MCP
    current external technical knowledge / tool context

Git
    durable project artifacts and change history
```

This aligns with the SKE concept map's distinction between specifications, tooling, protocols, and semantic authority.

MCP may improve implementation accuracy, but it does not replace the Specification Core, become semantic authority, or represent the whole agent architecture.

## Relationship to ESKA

AIUP already provides useful separation among:

- source specification;
- implementation realization;
- tests as verification evidence.

ESKA becomes relevant only when **machine-interpretable semantic knowledge** participates in execution and its connection to authoritative meaning must remain explicit through execution, result, verification, and provenance.

Do not import ESKA execution vocabulary into ordinary AIUP software execution merely because code and tests run.

## Candidate integration experiment

A future experiment could test whether a very small semantic layer adds measurable value to AIUP without displacing its Specification Core.

The reviewed primary-source **Simple Task Manager** is a strong principal candidate, with the public Book Library tutorial as corroborating evidence.

The experiment should ask, in order:

1. Which meanings are already owned adequately by AIUP artifacts?
2. Does any selected concept need a distinct stable semantic identity?
3. Is a separate Semantic Model justified?
4. Is an `ImplementationProjection` needed, or is direct semantic use simpler?
5. Which mechanism actually fits the concern: OWL reasoning, SHACL validation, SPARQL, mapping, ordinary tests, or none?
6. Does explicit semantic lineage add information beyond Git and AIUP traceability?
7. If semantics participate in runtime behavior, do they remain explicit through result and verification evidence?
8. Which proposed semantic additions are redundant and should be rejected?

This experiment remains **candidate evidence**, not a demonstrated SKE/AIUP integration result.

## Evidence status

| Item | Status in SKE |
| --- | --- |
| AIUP methodology / public Marketplace / book | external source authority / related work |
| AIUP Specification Core | externally evidenced; preserve source framing |
| SKE `authority by concern` interpretation | SKE analytical framing |
| RDF/OWL/SHACL as AIUP requirements | not evidenced |
| separate Semantic Model in an AIUP project | candidate design only |
| Entity Model as `ImplementationProjection` | conditional candidate only |
| Task Manager semantic integration | candidate future experiment |
| AIUP as an SKE dependency | no |

## Conclusion

AIUP is valuable adjacent work because it addresses a continuity problem SKE should not reinvent:

> preserve explicit, reviewable specification authority while AI agents generate and evolve software.

SKE's complementary question is narrower and semantic:

> when independently governed domain meaning matters, how does that meaning remain explicit across representation, projection when used, execution, result, and evidence?

The useful integration is therefore **selective composition**, not replacement:

- preserve AIUP's own behavioral/specification authority;
- introduce explicit semantic authority only where it adds independent value;
- keep `ImplementationProjection` optional;
- select standards/tools by concern;
- treat negative evidence against unnecessary semantic machinery as a valid result.

This comparison introduces no new SKE/SMO/ESKA vocabulary, dependency, or repository.