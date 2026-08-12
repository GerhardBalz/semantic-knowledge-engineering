# ESKA standards and tooling alignment

Status: analysis for SKE #11

## Purpose

This note assesses the current Executable Semantic Knowledge Architecture (ESKA) against SHACL, PROV-O, the Ontology Access Kit (OAK), the Ontology Development Kit (ODK), and ROBOT.

The purpose is not to maximize reuse by replacing every ESKA term with something broader. The purpose is to determine, concern by concern, whether an established standard or tool already owns the semantics, whether ESKA adds a distinct architectural meaning, and where existing tools can implement ESKA capability contracts without becoming architectural authorities.

## Executive conclusion

The current ESKA direction is substantially aligned with the reference landscape already.

The analysis does **not** justify changing the current ESKA semantic model.

The strongest conclusions are:

1. ESKA's existing PROV-O reuse is semantically appropriate and should remain deliberately selective.
2. Generic ESKA design-time relations such as `usesSemanticModel` and `usesExecutableArtifact` should **not** become subproperties of `prov:used`, because PROV usage is specifically an Activity-to-Entity runtime/provenance relation.
3. ESKA `Verification` is broader than SHACL validation, and ESKA `Result` is correctly broad enough for a result instance that may also be a `sh:ValidationReport`.
4. `ApplicabilityCondition` is broader than a SHACL shape or constraint; SHACL is one possible representation where the condition is an RDF graph validation condition.
5. OAK is a strong implementation precedent for backend-independent ontology access, but it does not replace ESKA's semantic Capability, Service, access-contract, Agent, or Deployment distinctions.
6. ROBOT commands can implement concrete ESKA Executions and Verifications without requiring ROBOT-specific ESKA classes.
7. ODK primarily addresses ontology-development lifecycle, CI, quality control, releases, and imports. It is complementary engineering infrastructure rather than ESKA runtime semantics.
8. Active SHACL 1.2 work is relevant to watch and potentially exercise, but draft capabilities should not become normative ESKA dependencies merely because they are newer.

The architectural principle that emerges is:

> **Model the semantic/execution contract in ESKA; represent generic provenance in PROV-O; represent concrete validation semantics in SHACL where applicable; allow OAK, ROBOT, ODK, reasoners, APIs, or other tools to satisfy the contract without becoming the contract.**

## Current ESKA baseline

The current core contains:

- `SemanticModel`;
- `ExecutableSemanticKnowledgeArtifact`;
- `Capability` and `SemanticCapability`;
- `ApplicabilityCondition`;
- `Execution`;
- `Result`;
- `Verification`.

The current core already states:

```turtle
eska:Execution
    rdfs:subClassOf prov:Activity .

eska:Result
    rdfs:subClassOf prov:Entity .

eska:Verification
    rdfs:subClassOf prov:Activity .

eska:generatesResult
    rdfs:subPropertyOf prov:generated .
```

The executable evidence has exercised this core through OWL reasoning, SHACL validation, SPARQL rule evaluation, DMN decision evaluation, OpenMath calculation, semantic mapping, and BPMN workflow execution.

The composite workflow evidence additionally reuses:

- `dcterms:hasPart` / `dcterms:isPartOf` for composition;
- `prov:wasInformedBy` for activity ordering/dependency;
- `prov:wasDerivedFrom` for result lineage.

This is an important starting point: the question is not whether ESKA should start using existing vocabularies. It already does. The question is where further reuse preserves meaning and where it would erase useful ESKA distinctions.

## Responsibility map

| ESKA concern | Existing standard/tool | Assessment | Decision |
|---|---|---|---|
| Execution provenance | PROV-O `Activity` | Direct semantic fit | Keep `Execution` as `prov:Activity` specialization |
| Verification provenance | PROV-O `Activity` | Direct fit for the fact that verification occurs as an activity; ESKA adds verification-specific purpose | Keep `Verification` specialization; do not replace with generic PROV activity alone |
| Result provenance | PROV-O `Entity` | Direct fit for generated machine-interpretable results | Keep `Result` as `prov:Entity` specialization |
| Generation | PROV-O `generated` / `wasGeneratedBy` | Direct fit | Keep `generatesResult` as a semantic refinement of `prov:generated` |
| Runtime usage | PROV-O `used` / qualified Usage | Appropriate for concrete Execution evidence | Reuse at runtime; do not make generic design-time ESKA use-properties subproperties |
| Activity dependency | PROV-O `wasInformedBy` | Direct fit for execution-to-execution influence/communication | Continue reuse in runtime evidence |
| Result lineage | PROV-O `wasDerivedFrom` | Direct fit for generic derivation | Continue reuse; qualify with PROV roles/activity when detail is needed |
| Validation | SHACL | Direct fit when the verification mode is RDF graph validation | Reuse SHACL shapes, validation semantics and validation reports |
| Generic verification | SHACL | Too narrow; ESKA also covers reasoning, calculation, decision, mapping, workflow and other checks | Keep ESKA `Verification` broader than SHACL validation |
| Applicability | SHACL shapes/constraints | Useful only when applicability is expressible as RDF graph conditions | Keep generic `ApplicabilityCondition`; allow SHACL representation by multiple typing/linking |
| Ontology access | OAK interfaces/adapters | Strong implementation fit for backend-independent ontology operations | Treat OAK as replaceable implementation of some Semantic Capabilities |
| Semantic service contract | OAK | Partial operational overlap, but OAK interfaces do not define ESKA capability authority, result relation, service contract, or deployment separation | Keep ESKA abstractions; use OAK underneath where useful |
| Ontology lifecycle | ODK | Strong engineering overlap with CI, QC, releases and imports | Reuse ODK patterns/tools where useful; do not make them ESKA runtime semantics |
| Reasoning execution | ROBOT `reason` | Concrete implementation of an ESKA-style Execution and some verification behavior | Use as possible executable backend, not a vocabulary dependency |
| Rule/QC verification | ROBOT `verify` / `report` | Concrete implementation of Verification with machine-readable reports and failure semantics | Strong proving-ground candidate, not ESKA semantic authority |
| OWL profile validation | ROBOT profile validation | Concrete verification capability | Implementable under existing ESKA core without new classes |

## PROV-O assessment

### Existing class specializations are appropriate

`Execution` and `Verification` are computational activities. Modeling them as subclasses of `prov:Activity` provides generic provenance semantics while ESKA supplies the more specific architectural meaning.

`Result` and `ServiceDeployment` are identifiable entities that may be generated, used, versioned, derived, or referenced by activities. Their existing `prov:Entity` specializations are similarly appropriate.

No evidence suggests replacing these ESKA terms with the PROV terms themselves. Doing so would lose the distinction between any provenance Activity and an ESKA Execution or Verification.

### `generatesResult` is an appropriate refinement

PROV-O defines `prov:generated` as an Activity-to-Entity relation representing completion of production of a new Entity by an Activity.

ESKA's relation:

```turtle
Execution --generatesResult--> Result
```

is therefore a valid semantic narrowing of:

```turtle
Activity --prov:generated--> Entity
```

The existing `rdfs:subPropertyOf prov:generated` statement is justified.

### Do not make generic ESKA `uses*` properties subproperties of `prov:used`

PROV-O defines `prov:used` with:

- domain `prov:Activity`;
- range `prov:Entity`.

Its meaning is runtime provenance: an Activity begins utilizing an Entity.

By contrast, ESKA properties such as:

```text
usesSemanticModel
usesExecutableArtifact
```

can describe declarative architectural relationships for a Capability, artifact, or execution contract, not only observations about an actual runtime Activity.

If either generic property became a subproperty of `prov:used`, normal RDFS/OWL entailment could type every subject using it as a `prov:Activity`. That would incorrectly collapse design-time capability/artifact descriptions into runtime activity provenance.

Decision:

- retain the generic ESKA relations as architectural relations;
- assert `prov:used` separately on concrete `Execution` or `Verification` instances when recording runtime provenance;
- use qualified PROV `Usage` and `prov:hadRole` when runtime role distinctions matter.

This preserves the important distinction:

```text
contract says what an execution/capability depends on
                    ≠
provenance records what a particular activity actually used
```

### Verification relations are not redundant with generic influence

`verifiesExecution` and `verifiesResult` encode the purpose/subject of a Verification.

A broad provenance relation such as `prov:wasInfluencedBy` can state influence, but it does not state that the influence is the object of a verification claim.

The ESKA relations therefore carry additional architectural meaning and should not be replaced by a generic provenance relation.

Runtime evidence may additionally assert PROV usage/influence relations where useful.

### Continue using PROV at runtime rather than extending ESKA for every lineage need

The current mapping/workflow evidence already demonstrates a good pattern:

- use ESKA to identify the semantic execution concepts;
- use PROV-O for generic lineage and activity relationships;
- use qualified PROV when a role or additional context must be attached.

This reduces pressure to add ESKA-specific terms such as `derivedResultFrom`, `previousExecution`, `usedInput`, or generic provenance-role classes.

## SHACL assessment

### Stable baseline and active development

The latest stable SHACL Recommendation remains the 20 July 2017 Recommendation.

As of August 2026, SHACL 1.2 is active Recommendation-track work. The current SHACL 1.2 Core Working Draft explicitly points to the 2017 Recommendation as the latest Recommendation and to related 1.2 drafts such as Node Expressions and SPARQL Extensions.

ESKA should therefore distinguish:

- **SHACL Recommendation semantics** — stable baseline suitable for normative reuse;
- **SHACL 1.2 draft capabilities** — relevant implementation/research candidates whose status may still change.

### `Verification` is intentionally broader than SHACL validation

A SHACL validation run evaluates a data graph against shapes and produces validation results/report semantics.

ESKA `Verification` includes checks over:

- semantic knowledge;
- executions;
- results;
- multiple execution modes beyond RDF graph validation.

Examples include verifying reasoning results, decisions, calculations, mappings, workflow results, publication invariants, or other explicit criteria.

Therefore:

```text
SHACL validation ⊂ ESKA Verification
```

conceptually, but no schema-level subclass relation is required unless a concrete ESKA SHACL-specific verification class is eventually justified.

### `Result` is correctly generic

The validation example returns a JSON-LD representation of a `sh:ValidationReport` graph.

That does not require ESKA to define a parallel `ValidationReport` class.

A concrete result may be typed or semantically identified as both:

```text
eska:Result
sh:ValidationReport
```

where appropriate, or the Capability output type can identify `sh:ValidationReport` without requiring all validation-report instances to be globally asserted as ESKA Results.

This is the same composition principle established by the SMO standards-alignment analysis: use multiple typing/relationships to combine generic initiative semantics with technology-specific semantics rather than redefining the technology vocabulary.

### `ApplicabilityCondition` is broader than SHACL

A SHACL shape or constraint can express applicability conditions when the relevant question is whether an RDF graph/node satisfies graph constraints.

ESKA applicability can also depend on:

- execution mode;
- supported semantic input/output type;
- capability contract;
- decision/calculation preconditions;
- mapping source/target assumptions;
- runtime/service constraints;
- conditions expressed in other formal languages.

Therefore `ApplicabilityCondition` should remain representation-neutral.

For a SHACL-backed capability, a concrete condition may link to or be represented by SHACL shapes. ESKA should not define a new constraint language.

### SHACL 1.2 Rules are a candidate mode, not a dependency

SHACL 1.2 Rules is active Working Draft work. It may eventually provide an additional standards-based executable rule mechanism relevant to ESKA.

That is worth testing when useful, especially because ESKA already demonstrates SPARQL rule evaluation and SHACL validation as distinct modes.

However, draft status plus lack of a concrete unmet requirement means no core dependency or new ESKA term is justified now.

A future experiment can ask whether SHACL 1.2 Rules is simply another artifact/capability implementation under the existing core. The current hypothesis is that it is.

## OAK assessment

### OAK's strongest architectural relevance is interface/backend separation

OAK provides interfaces that abstract away from implementation details so clients can perform coherent ontology operations without knowing whether the implementation is a local file, relational database, remote service, or another adapter/backend.

This is closely aligned with a central ESKA principle:

> semantic meaning and capability contracts should not be coupled to one storage or runtime backend.

OAK is therefore a strong implementation precedent and proving-ground candidate.

### OAK does not replace `SemanticCapability`

An OAK interface defines operations available through OAK implementations.

An ESKA `SemanticCapability` additionally describes an architecture-level bounded ability whose input type, output type, produced semantic relation, applicability and semantics are explicitly machine-interpretable.

These can be related operationally:

```text
ESKA SemanticCapability
        ↓ realized by
implementation using an OAK interface/adapter
```

but they are not equivalent concepts.

The same OAK operation could potentially realize different application capabilities depending on semantic contract, scope, policy, or result interpretation.

### OAK does not replace Knowledge Service / Access Binding / Deployment Binding

OAK adapter selectors and implementations determine how OAK accesses an ontology or knowledge source.

ESKA separates three other concerns:

1. **SemanticCapability** — what semantic operation means;
2. **ServiceOperation + AccessBinding** — how a stable operational interface exposes the capability;
3. **ServiceDeployment + DeploymentBinding** — where a concrete runtime instance is reachable.

An OAK adapter may sit underneath a service implementation, or an Agent could conceivably use OAK directly for a local capability. But OAK does not by itself encode ESKA's semantic authority, result relation, service contract, access-representation mapping, or deployment-environment semantics.

Therefore OAK is complementary rather than substitutive.

### OAK is a high-value proving-ground candidate

A useful experiment would implement an existing or small ontology-access Semantic Capability through OAK and demonstrate that:

- the ESKA capability contract remains stable;
- the OAK backend/adapter can change;
- semantic result interpretation remains independent of backend selection;
- an Agent can operate on the contract rather than hard-coded backend knowledge.

This directly tests the architecture rather than adding vocabulary.

## ROBOT assessment

ROBOT is especially interesting because several commands map naturally to existing ESKA runtime concepts without requiring any new ESKA class.

### `robot reason`

ROBOT reasoning can:

- consume an ontology;
- run a selected reasoner;
- perform logical validation;
- materialize selected inferred axioms;
- produce an output ontology or fail on logical problems.

An execution can therefore be represented with the existing pattern:

```text
SemanticModel / ontology input
        ↓ used by
ExecutableSemanticKnowledgeArtifact / ROBOT command configuration
        ↓
SemanticCapability / reasoning capability
        ↓
Execution
        ↓ generates
Result / reasoned ontology or inferred statements
        ↓
Verification / expected entailments, coherence, publication contract, etc.
```

No `RobotExecution`, `RobotReasoner`, or tool-specific core class is required.

### `robot verify`

ROBOT `verify` checks an ontology against SPARQL SELECT queries representing rules; query results represent violations and the command can fail with a non-zero status when violations exist.

This is a concrete implementation of an ESKA Verification capability:

- explicit criteria: SPARQL verification queries;
- subject/input: ontology;
- machine-detectable result: violations / generated files / process status;
- deterministic pass/fail behavior.

Again, existing ESKA `Verification`, `Result`, Capability and artifact concepts are sufficient.

### `robot report`

ROBOT `report` runs quality-control SPARQL queries and creates structured reports with severity levels such as ERROR, WARN and INFO; it supports machine-readable output formats including CSV, JSON, YAML and others and can fail according to configured severity.

This is another useful Verification implementation, particularly for engineering/governance quality gates.

It should not be confused with SHACL validation merely because both produce validation-like reports. The semantics of the criteria are different and the output vocabularies/contracts differ.

ESKA's technology-neutral `Verification → Result` structure is useful precisely because it can represent both.

### ROBOT should remain a replaceable implementation

ROBOT commands provide executable behavior, but they do not define ESKA's architecture.

A capability contract should be able to be satisfied by ROBOT today and another compliant implementation later.

This suggests a reusable test principle:

> changing the execution engine should not require changing semantic capability identity when the semantic contract and behavior remain equivalent.

## ODK assessment

ODK describes itself as both:

- a toolbox bundling ontology-related tools including ROBOT and others; and
- executable workflows for ontology continuous integration, quality control, releases and dynamic imports.

This places ODK primarily in the **ontology-engineering lifecycle** layer established by the SKE landscape.

ODK can implement important SKE/ESKA engineering concerns, for example:

- repeatable builds;
- validation and QC gates;
- release creation;
- import management;
- CI workflows.

But these functions do not make ODK the semantic authority for an ontology, model, capability or execution architecture.

### Relationship to ESKA

ODK workflows may contain activities that can be observed as ESKA Executions/Verifications when that traceability is useful.

For example:

```text
ODK release workflow
    ├── ROBOT reason        → Execution
    ├── ROBOT report        → Verification
    ├── ontology build      → generated Entity/artifact
    └── release publication → engineering lifecycle action
```

But ESKA should not model the entire ODK workflow system as part of its core.

The valuable reuse direction is implementation and evidence, not vocabulary duplication.

## Service and deployment assessment

The current ESKA Service model separates:

```text
Semantic Capability
        ↓ realized by
Service Operation
        ↓ invoked through
Access Binding
```

and the Deployment model separately represents:

```text
Service Deployment
        ↓ deployment binding
runtime location
```

This separation remains useful after comparison with OAK/ODK/ROBOT.

None of those tools provides an equivalent semantic distinction between:

- stable meaning of a capability;
- stable service operation/access contract;
- replaceable runtime deployment location.

OAK's adapter abstraction is a strong implementation analogue for backend independence, but it does not remove the need for these architecture-level distinctions when capabilities are exposed as services or discovered by agents.

No change is recommended.

## Agent assessment

The current ESKA Agent model describes deterministic agents that discover semantic capability contracts and use semantic invocation adapters to encode inputs and interpret results.

OAK could be used by such an Agent in at least two ways:

1. as a direct backend-independent ontology-operation library for locally available capabilities;
2. inside a Knowledge Service implementation discovered by the Agent.

This creates a useful architecture test:

```text
Agent knowledge of semantic contract
        should remain stable
while
OAK adapter / backend / service deployment
        changes
```

If that works without changing Agent semantic logic, it is evidence that semantic execution has not been coupled to a backend.

## Explicit non-equivalences

The following equivalences should **not** be asserted based on current evidence:

```text
eska:Verification              ≡ SHACL validation
eska:Result                    ≡ sh:ValidationReport
eska:ApplicabilityCondition    ≡ sh:Shape
eska:SemanticCapability        ≡ OAK interface
eska:KnowledgeService          ≡ OAK adapter
eska:AccessBinding             ≡ OAK selector
eska:ServiceDeployment         ≡ OAK backend
eska:Execution                 ≡ ROBOT command
eska:Verification              ≡ ROBOT verify/report
ESKA runtime architecture      ≡ ODK workflow
```

These technologies can instantiate, implement, or specialize ESKA patterns without being synonymous with them.

## No-change recommendation for current ESKA semantics

This assessment finds no evidence requiring a semantic-model change now.

In particular, do **not** currently:

- add `rdfs:subPropertyOf prov:used` to generic ESKA design-time use-properties;
- replace verification relations with generic PROV influence relations;
- add SHACL-specific validation classes to core;
- replace `ApplicabilityCondition` with SHACL concepts;
- create OAK-, ODK-, or ROBOT-specific ESKA classes;
- make SHACL 1.2 Working Draft terms normative dependencies;
- modify immutable `eska-v0.1.0`;
- resolve `eska:SemanticModel` versus SMO early; that remains dependency-governed downstream alignment work.

## Concrete follow-up opportunities

The analysis does identify **implementation experiments**, rather than ontology changes, that can create stronger evidence.

### Candidate A — OAK backend-independence proving ground

Implement one ontology-access Semantic Capability using OAK, with at least two interchangeable adapters/backends if practical.

Acceptance hypothesis:

- same semantic capability identity and contract;
- same semantic result meaning;
- different backend implementation;
- no Agent contract change.

This directly tests the principle that execution/access must not sever or capture semantic authority.

### Candidate B — ROBOT execution/verification proving ground

Represent deterministic ROBOT `reason` plus `verify` or `report` steps through existing ESKA Execution/Result/Verification semantics.

Acceptance hypothesis:

- no new core classes are required;
- PROV runtime usage/generation can record execution evidence;
- ROBOT remains a replaceable execution engine;
- result semantics are explicit rather than inferred from exit code alone.

### Candidate C — SHACL 1.2 Rules watch/experiment

When the draft is sufficiently stable or a concrete requirement exists, exercise a SHACL 1.2 Rules example as another executable-semantic mode.

Acceptance hypothesis:

- existing core survives unchanged;
- SHACL-specific semantics remain owned by SHACL;
- ESKA only describes capability, execution, result and verification continuity.

This candidate should remain non-normative while SHACL 1.2 is a Working Draft.

## Architectural implications

The standards/tool comparison reinforces rather than weakens ESKA's central hypothesis.

There are mature standards for:

- graph/ontology semantics;
- graph validation;
- generic provenance;
- ontology access operations;
- ontology build/release automation;
- reasoning and ontology quality-control execution.

The gap ESKA addresses is not the absence of those functions. It is the **architecture that keeps semantic authority, capability meaning, execution, results, verification, access and deployment explicitly connected while allowing each implementation technology to remain replaceable**.

The most useful future ESKA work should therefore continue to test that cross-layer continuity rather than adding vocabulary for capabilities already owned by the standards and tools above.

## References

### W3C

- PROV-O: https://www.w3.org/TR/prov-o/
- SHACL Recommendation: https://www.w3.org/TR/shacl/
- SHACL 1.2 Core: https://www.w3.org/TR/shacl12-core/
- SHACL 1.2 Rules: https://www.w3.org/TR/shacl12-rules/
- SHACL 1.2 SPARQL Extensions: https://www.w3.org/TR/shacl12-sparql/
- SHACL 1.2 Node Expressions: https://www.w3.org/TR/shacl12-node-expr/

### INCATools / OBO tooling

- OAK documentation: https://incatools.github.io/ontology-access-kit/
- OAK interfaces: https://incatools.github.io/ontology-access-kit/packages/interfaces/
- ODK documentation: https://incatools.github.io/ontology-development-kit/
- ROBOT: https://robot.obolibrary.org/
- ROBOT reason: https://robot.obolibrary.org/reason.html
- ROBOT verify: https://robot.obolibrary.org/verify.html
- ROBOT report: https://robot.obolibrary.org/report.html

## Decision summary

| Question | Decision |
|---|---|
| Is current PROV-O reuse appropriate? | Yes |
| Should generic ESKA `uses*` properties specialize `prov:used`? | No; use PROV usage on concrete runtime activities |
| Is ESKA Verification equivalent to SHACL validation? | No; SHACL validation is one verification mode |
| Is ESKA Result equivalent to SHACL ValidationReport? | No; a SHACL ValidationReport is one possible concrete result type |
| Is ApplicabilityCondition equivalent to SHACL Shape? | No; SHACL can implement some conditions |
| Does OAK replace ESKA service/agent/deployment semantics? | No; it is a strong backend-independent implementation mechanism |
| Does ROBOT justify tool-specific ESKA vocabulary? | No |
| Does ODK define ESKA runtime semantics? | No; it primarily owns engineering lifecycle workflows |
| Should SHACL 1.2 draft features be normative ESKA dependencies now? | No |
| Should current ESKA ontology semantics change? | No |
| Best next evidence? | OAK backend-independence and/or ROBOT execution/verification experiments |