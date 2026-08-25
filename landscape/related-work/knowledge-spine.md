# Knowledge Spine ↔ SKE / SMO / ESKA

## Purpose

This note compares Bojan Ćirić's **Knowledge Spine** architecture with Semantic Knowledge Engineering (SKE), the Semantic Modeling Ontology (SMO), and the Executable Semantic Knowledge Architecture (ESKA).

Knowledge Spine is treated here as **independently developed related work**. Its own terminology and architecture come first; SKE terms are used only as a comparison lens.

A related-work comparison does not imply adoption, endorsement, dependency, or proof that SKE is correct.

## Public sources reviewed

Primary public material reviewed for this comparison includes:

- [Bojan Ćirić — Thinking](https://bojanciric.com/thinking)
- [The Knowledge Spine: Why Your Ontology Needs to Grow a Backbone](https://bojanciric.com/thinking/knowledge-spine-part-1)
- [The Knowledge Spine, Part 2 — The Blitz: A Backbone in Six Months, Not Two Years](https://bojanciric.com/thinking/knowledge-spine-part-2-the-blitz)
- [The Knowledge Spine, Part 3: The Living Spine](https://bojanciric.com/thinking/knowledge-spine-part-3-the-living-spine)
- [The Knowledge Spine, Part 4: The Spine's Balance Sheet](https://bojanciric.com/thinking/knowledge-spine-part-4-the-spines-balance-sheet)
- [The Knowledge Spine, Part 5: The Agentic Spine](https://bojanciric.com/thinking/knowledge-spine-part-5-the-agentic-spine)
- [The Knowledge Spine, Bonus: The Field Manual](https://bojanciric.com/thinking/knowledge-spine-bonus-the-field-manual)
- [The Comprehensive Guide to Agentic AI: 2026 Edition](https://bojanciric.com/thinking/the-comprehensive-guide-to-agentic-ai-2026)

This note summarizes and compares the reviewed material; it does not reproduce the source series.

## Source architecture first

The Knowledge Spine can be understood as the **operationalization of a governed enterprise ontology** so that shared meaning becomes usable infrastructure for data, applications, analytics, and agents.

The reviewed material emphasizes a set of connected concerns:

```text
Governed ontology / shared meaning
        ↓
Semantic platform
(reasoning + validation + query)
        ↓
Mappings / federation / source connections
        ↓
Consumption interfaces
(APIs + query surfaces + agent tools)
        ↓
Lifecycle feedback and stewardship
```

### Governed ontology and semantic identity

The architecture gives explicit authority to governed semantic meaning and recommends practices such as:

- RDF/OWL for formal representation;
- SHACL constraints;
- stable IRIs under controlled namespaces;
- versioning and deprecation discipline;
- domain modules with explicit stewardship;
- a shared or upper core only where cross-domain evidence justifies it.

A particularly compatible design discipline is to begin from a real question and resist adding semantic scope that the question does not require.

### Operational semantic platform

The ontology is not treated as documentation only. The semantic platform makes it operational through concerns such as:

- reasoning;
- SHACL validation;
- SPARQL/query;
- federation;
- security and deployment;
- APIs for applications and agents.

### Mapping rather than forced data migration

A key architecture boundary is that enterprise data can remain governed in existing systems while mappings, federation, or extraction connect those sources to the governed semantic layer.

This separates **semantic authority** from **storage authority**.

### Agent-facing semantic access

The reviewed material also describes a narrow governed MCP surface for agent access to semantic capabilities, for example lookup, query, explanation, and validation operations.

MCP remains a **protocol/tool-mediation mechanism**. It is not the semantic authority and not the entire agent architecture.

### Living semantic lifecycle

The Knowledge Spine is designed to evolve through explicit governance and feedback. Relevant signals include validation failures, unanswered questions, source/schema changes, usage patterns, and compatibility evidence. Human stewards remain responsible for approving semantic changes.

## Main overlap with SKE

The strongest shared concern is explicit semantic authority.

Both approaches reject the idea that durable meaning should be reconstructed only from implementation details, data shape, or model behavior.

Common architectural themes include:

- governed meaning;
- stable semantic identity;
- standards-based formal semantics;
- explicit source mappings;
- semantic validation;
- versioned lifecycle and deprecation;
- lineage and explainability;
- agent-accessible semantic services;
- human stewardship of meaning.

## Main non-equivalence: the execution boundary

The useful distinction is not that one approach has semantics and the other does not. It is where the architecture places its primary boundary.

A simplified Knowledge Spine path is:

```text
Governed meaning
        ↓
Semantic platform + mappings
        ↓
query / grounding / validation / semantic tools
        ↓
consumer
```

ESKA additionally models the question of what happens **after semantic knowledge participates in an action**:

```text
Authoritative semantics
        ↓
Semantic Model
        ↓
Implementation Projection — when used
        ↓
Executable Semantic Knowledge
        ↓
Execution
        ↓
Result
        ↓
Verification / evidence / provenance
```

This should not be read as a claim that Knowledge Spine lacks execution lineage. The reviewed Knowledge Spine material simply places its strongest architectural emphasis on governed semantic grounding, query, validation, lifecycle, and agent access, whereas ESKA makes semantic continuity through subsequent execution/result/evidence an explicit architecture object.

## Semantic authority: central backbone vs potentially distributed authority

Knowledge Spine intentionally argues for a governed semantic backbone at enterprise scope while allowing data and domain systems to remain distributed.

SKE should preserve a broader governance possibility:

> **Coherent integration does not require centralized semantic ownership.**

Different source-owned semantic models may legitimately remain authoritative for different domains or concerns. Shared discovery, mappings, and integration do not automatically transfer authority to one enterprise-wide model.

This is a scope difference, not necessarily a contradiction.

## Mapping Knowledge Spine concerns to SKE

| Knowledge Spine concern | Closest SKE / SMO / ESKA concern | Important boundary |
| --- | --- | --- |
| governed enterprise ontology | authoritative semantics / `smo:SemanticModel` comparison role | Knowledge Spine retains its own ontology/backbone terminology; SKE does not require one enterprise semantic authority |
| domain/core modules | source-owned semantic models / governance | shared core should not silently acquire authority over source-owned meaning |
| semantic platform | runtime semantic infrastructure | runtime platform is not semantic authority merely because it hosts the model |
| mappings / federation | mapping evidence; sometimes a projection concern | mappings are **not automatically** `smo:ImplementationProjection` |
| SHACL constraints | semantic validation | SHACL remains an external standard and fit-for-purpose mechanism |
| compatibility queries | compatibility / verification evidence | ESKA verification can extend beyond query compatibility into executions/results |
| APIs / semantic services | service/capability surface | ESKA is broader than one service or query mechanism |
| MCP tools | agent-facing protocol/tool plane | MCP is one realization, not semantic authority |
| lineage / explanation | provenance and evidence | do not infer PROV-O specifically unless a concrete implementation uses it |
| stewards / governance | semantic authority and lifecycle governance | governance organization remains deployment-specific |

## Complete-landscape guardrails

Using the [SKE concept and responsibility map](../concept-map.md), the comparison should keep **kind × architectural concern × evidence status** distinct.

### Source-evidenced Knowledge Spine concerns

The reviewed public material provides direct support for concerns including:

- stable IRIs / namespaces;
- RDF / OWL;
- SHACL;
- reasoning;
- SPARQL/query;
- semantic mappings and federation;
- version/deprecation lifecycle;
- lineage concerns;
- repository/governance-as-code practices;
- APIs and query-oriented consumption surfaces;
- narrow agent-facing MCP tools.

### Do not over-attribute implementation choices

The comparison does **not** treat the following as Knowledge Spine source claims unless independently evidenced in a concrete implementation:

- PROV-O, DCTERMS, DCAT, MOD, or W3C PROF;
- W3ID;
- HermiT, pySHACL, ODK, ROBOT, OAK, RDFLib, OWLAPI, or FaCT++;
- DMN, OpenMath, or BPMN;
- particular GitHub publication mechanisms;
- SKE/SMO/ESKA terminology.

These may be useful SKE standards/tooling references, but relevance in the wider landscape is not evidence that Knowledge Spine depends on them.

## `ImplementationProjection` remains conditional

Knowledge Spine includes mappings, federation, endpoints, materialized structures, and other downstream artifacts.

SKE should **not** label all such artifacts as `smo:ImplementationProjection`.

That role applies only when a deliberately selected semantic surface is derived into an implementation-facing representation while preserving explicit source lineage, including what is preserved, transformed, or omitted.

A source-owned semantic artifact may also participate directly in query, reasoning, validation, or other execution without any projection step.

## Agent grounding and semantic continuity

Knowledge Spine offers a strong architecture for giving agents governed semantic grounding before and during semantic tool use.

SKE/ESKA adds a complementary question:

> When a grounded agent translates meaning into a tool call, transaction, decision, transformation, or other action, can the relevant semantics and lineage remain explicit through the resulting execution and evidence?

That gives a useful combined research path:

```text
meaning
  ↓
grounding / query / validation
  ↓
action
  ↓
result
  ↓
evidence / verification
```

The comparison is therefore complementary rather than competitive.

## Lessons SKE should retain

### Start from a real question

A semantic model should earn its scope. This reinforces SKE's evidence-first resistance to vocabulary growth for symmetry.

### Separate semantic authority from data location

Mapping and federation demonstrate that shared semantics do not require moving all source data into one graph or platform.

### Treat semantic systems as lifecycle-managed infrastructure

Compatibility tests, deprecation, stewardship, and usage feedback are part of semantic engineering—not optional documentation afterthoughts.

### Keep agent access governed

A narrow semantic tool surface is preferable to treating agents as unrestricted semantic administrators. Agent consumption does not transfer semantic authority.

### Preserve the execution distinction

Grounding an agent correctly is valuable but does not by itself answer the full semantic-continuity question through action, result, verification, and evidence.

## What this comparison does not imply

This note does not imply that SKE should:

- adopt the Knowledge Spine name or metaphor;
- create one enterprise-wide ontology by default;
- centralize all semantic authority;
- classify every mapping as `ImplementationProjection`;
- standardize a specific semantic platform;
- require MCP;
- mint new SKE/SMO/ESKA vocabulary to mirror Knowledge Spine concepts.

The value of the comparison is architectural clarification, not terminology acquisition.

## Evidence status

Knowledge Spine is **related work / adjacent architecture** for SKE.

It is not initiative reference evidence in the same sense as Pizza, Wine/Food, SANO, or bounded ESKA specimens. Its public material is evidence for claims about **Knowledge Spine itself**; SKE conclusions drawn from it remain comparative interpretation.

## Related SKE material

- [SKE concept and responsibility map](../concept-map.md)
- [Modern ontology-engineering reference landscape](../ontology-engineering.md)
- [ESKA standards and tooling alignment](../eska-standards-tooling-alignment.md)
- [AI Unified Process / Spec-Driven Development](ai-unified-process.md)
- [Executable Semantic Knowledge Architecture](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture)
