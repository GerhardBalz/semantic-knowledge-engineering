# Reference Ontology Corpus

## Purpose

This note establishes a small empirical corpus of ontology examples for Semantic Knowledge Engineering (SKE).

The corpus exists to prevent architectural conclusions from being inferred from the Pizza Ontology alone. Different reference artifacts expose different failure modes and engineering concerns:

```text
teaching ontology
    ≠ benchmark ontology
    ≠ standards-engineered reusable ontology
    ≠ production ontology ecosystem
```

The first deep comparison covers:

1. the W3C OWL **Wine + Food** ontologies;
2. the Protégé **Travel** ontology;
3. the existing Pizza preservation/reference project as the comparison baseline.

The goal is evidence, not modernization. Historical identifiers, authorship, stewardship and semantics remain with their original authorities.

Last empirical URL check: **2026-08-12**.

## Reference-corpus taxonomy

A useful corpus should classify artifacts by the role for which they were created rather than treating every published ontology as the same kind of reference.

| Role | Examples | Primary value to SKE / SMO / ESKA |
|---|---|---|
| Teaching / explanatory | Pizza, Wine + Food, OWL 2 Families, Travel, Koala | modeling constructs, historical practice, identity/import/publishing lessons |
| Benchmark / executable | LUBM, UOBM, Lehigh Wine Benchmark (LWBM) | repeatable data, queries, expected results, reasoning/query verification |
| Standards-engineered reusable ontology | PROV-O, OWL-Time, SSN/SOSA | governance, modularity, namespace discipline, specification + ontology alignment |
| Production ontology ecosystem | OBO Foundry / Gene Ontology and related systems | long-lived governance, release engineering, dependency management, community stewardship |

This taxonomy is descriptive only. It does not introduce an SKE ontology or vocabulary.

---

# W3C OWL Wine + Food

## Role and authority

The OWL Web Ontology Language Guide, published as a W3C Recommendation on 10 February 2004, explicitly says that the Working Group created a **wine and food ontology** to provide a consistent set of examples throughout the Guide.

The pair is therefore better treated as:

```text
Wine
  imports
Food
```

rather than as a standalone Wine example.

The Guide states that the example is OWL DL and that, unless explicitly marked otherwise, its examples are drawn from the `wine.rdf` and `food.rdf` artifacts.

Authority for this reference case is the W3C Recommendation publication and associated Web Ontology Working Group material. Later copies or GitHub mirrors are not automatically authoritative.

## Historical lineage

The Guide records a deeper provenance chain:

```text
CLASSIC description-logic example
        ↓
description-logic tutorial
        ↓
ontology tutorial / DAML ontology library
        ↓ substantial modification
W3C OWL Wine + Food example
```

The Guide attributes the original CLASSIC example to Deborah McGuinness and describes the OWL Wine/Food ontology as a significant modification of a DAML ontology-library element with a long history.

This makes Wine + Food valuable as a **preservation and provenance** reference, not only as a syntax tutorial.

## Semantic identity and namespaces

The final Recommendation uses dated W3C identifiers. The Guide shows the Wine namespace/base as:

```text
http://www.w3.org/TR/2004/REC-owl-guide-20040210/wine#
```

and the Food namespace as:

```text
http://www.w3.org/TR/2004/REC-owl-guide-20040210/food#
```

The Wine ontology header shown by the Guide records both version lineage and its dependency on Food:

```text
owl:priorVersion
    http://www.w3.org/TR/2003/PR-owl-guide-20031215/wine

owl:imports
    http://www.w3.org/TR/2004/REC-owl-guide-20040210/food
```

The key architectural point is that the Wine example is explicitly **versioned and modular**. Reasoning over Wine may require resolving the Food import closure.

## Import semantics are part of the example

The Guide describes `owl:imports` as an include-style mechanism and uses Food as the supporting ontology from which Wine obtains concepts needed by the example.

This is materially different from the current Pizza proving ground:

```text
Pizza
    one historically governed semantic source

Wine + Food
    multiple semantic documents
    explicit import dependency
    dated version lineage
```

Wine + Food can therefore test whether executable semantic work preserves not just source identity, but also the **identity and role of imported semantic dependencies**.

## The canonical example itself had identity/publication corrections

W3C Web Ontology Working Group archives are valuable evidence that the example did not emerge with perfect URI/import mechanics.

During 2003 review and validation work, the editors discussed and corrected issues including:

- explicit `xml:base` values so relative identifiers resolved as intended;
- explicit import locations;
- `.owl` versus `.rdf` document suffixes and their interaction with ontology/import identity;
- legacy DAML+OIL constructs that had to be converted to OWL constructs;
- validation/species issues in the evolving Wine/Food files.

This matters because it demonstrates a broader historical pattern:

> Even a W3C reference ontology can require engineering work to keep semantic identity, document location, imports, syntax and publication behavior aligned.

That is the same *class* of concern that motivated the Pizza preservation work, although the authority and exact technical history are different.

## Current publication check

The current W3C Guide remains available at its W3C Technical Report location.

The current auxiliary Wine RDF route:

```text
https://www.w3.org/TR/owl-guide/wine.rdf
```

was reached during the 2026-08-12 check and was served as RDF/XML (`application/rdf+xml`). The research client could not render that media type, which is evidence of an RDF response rather than evidence of a missing resource.

The corresponding Food route:

```text
https://www.w3.org/TR/owl-guide/food.rdf
```

also reached the W3C endpoint, but the research client did not produce a parseable page representation.

Direct verification of every historical dated Recommendation artifact URL was not completed by this check. Therefore this note does **not** claim that every historical document URL has been independently verified in 2026.

Status should be stated precisely:

```text
W3C Guide                              verified available
current Wine auxiliary RDF route       endpoint reached; RDF/XML served
current Food auxiliary RDF route       endpoint reached; client parse inconclusive
all dated 2004 artifact URLs            not independently verified here
```

## Canonical version-control availability

No canonical W3C Git repository containing the 2004 OWL Guide Wine/Food source artifacts was identified in the W3C GitHub organization during this investigation.

That is a negative search result, not proof that no historical version-control repository ever existed.

For preservation purposes the authoritative evidence identified here remains:

- W3C Recommendation snapshots;
- the W3C-hosted Guide and RDF auxiliary artifacts;
- Web Ontology Working Group archives and change history.

A later GitHub mirror must not silently become semantic authority.

## Executable evidence already present in the Guide

The Guide does more than define terms. Its Wine Agent example describes an executable use case in which ontology knowledge supports wine recommendations for meal courses.

That makes the pair suitable for ESKA experiments, but the Guide's narrative recommendation examples should not be mistaken for a formal benchmark answer set.

For repeatable query/result testing, the **Lehigh Wine Benchmark (LWBM)** is a stronger companion.

---

# Lehigh Wine Benchmark (LWBM)

## Why it belongs beside W3C Wine + Food

Lehigh University's Semantic Web and Agent Technologies (SWAT) lab publishes the Lehigh Wine Benchmark as an example benchmark associated with its Semantic Web knowledge-base benchmarking research.

The benchmark page provides:

- a Wine ontology;
- a dataset of approximately 4,000 triples;
- queries in SPARQL, RDQL and RQL;
- benchmark results.

This creates a useful bridge:

```text
W3C Wine + Food
    canonical teaching / lineage / import case
        ↓ related domain
LWBM
    executable query / result benchmark case
```

LWBM should not be presented as the canonical W3C Wine/Food artifact. It is a separate Lehigh benchmark with its own authority and purpose.

## Architectural opportunity

A later ESKA proving ground could use a preserved LWBM snapshot to demonstrate:

```text
SemanticModel
    ↓
query/reasoning executable artifact
    ↓
Execution
    ↓
Result
    ↓
Verification against benchmark expectation
```

This would extend current OAK and ROBOT examples from small purpose-built fixtures to an independently published reference benchmark.

---

# Protégé Travel

## Role and provenance

Travel is a historical Protégé teaching/application ontology associated with Stanford Protégé material and examples by Holger Knublauch.

The currently retrievable Stanford test copy describes itself as:

```text
version 1.0
by Holger Knublauch
An example ontology for tutorial purposes
```

Protégé documentation uses Travel for API tutorials and Semantic Web application examples involving destinations, accommodation, activities and related classes/instances.

## The identity/location mismatch is explicit documentation, not inference

Protégé documentation distinguishes the ontology's semantic name from locations from which the document was loaded.

One documented physical location was:

```text
http://protege.cim3.net/file/pub/ontologies/travel/travel.owl
```

while Protégé calculated the ontology name as:

```text
http://www.owl-ontologies.com/travel.owl
```

The import documentation explicitly states that the ontology could not in that example be found at its ontology-name location, so the physical-location form had to be used.

Another Protégé imports note uses a Stanford test location:

```text
http://protege.stanford.edu/junitOntologies/testset/travel.owl
```

and again states that the ontology found there is named:

```text
http://www.owl-ontologies.com/travel.owl
```

This is an unusually clean historical demonstration of the distinction:

```text
semantic identity
    http://www.owl-ontologies.com/travel.owl

physical retrieval location
    protege.../travel.owl
```

## OWL 1 import behavior exposed the mismatch

Protégé's `How Owl Imports Work` documentation explains the OWL 1 interpretation in which an imported ontology is identified by the ontology name, while the intended Web practice expected the name to correspond to a retrievable location.

For the Travel example, Protégé describes the consequence of retrieving a document from one URI whose ontology name is another URI. Strict name-based handling would regard the requested import as missing/wrong; Protégé 3 and 4 used a pragmatic compromise that loaded the assertions but visually marked the import as broken.

This is highly relevant to SKE because it shows that:

```text
successful byte retrieval
    ≠ automatically correct ontology identity/import semantics
```

and conversely:

```text
stable semantic identity
    should not require one permanent physical backend
```

## OWL 2 and catalogs / IRI mapping

Protégé's later import documentation discusses OWL 2's document-access model and states that ontology/version IRIs should normally provide access to the corresponding ontology document.

It also describes XML catalogs as a mechanism for redirecting ontology identifiers to local or alternative physical copies, including offline use.

This makes Travel an especially strong reference for a **backend-independent semantic identity** experiment.

The conceptual architecture is:

```text
ontology IRI
    stable semantic identity
        ↓ resolver / catalog / IRI mapper
physical document
    replaceable retrieval backend
```

The catalog or mapping is infrastructure. It must not silently redefine the ontology's identity.

## Current publication check

On 2026-08-12, the Stanford test copy was directly retrievable at:

```text
https://protege.stanford.edu/junitOntologies/testset/travel.owl
```

The research client successfully retrieved content identifying the tutorial ontology.

The following historical locations were tested but were not retrievable by the research client in this session:

```text
http://www.owl-ontologies.com/travel.owl
http://protege.cim3.net/file/pub/ontologies/travel/travel.owl
```

The client returned a cache-miss/fetch failure rather than an authoritative HTTP-status determination. Therefore this note records their state as:

```text
not verified/retrievable in this research session
```

and does **not** make the stronger claim that either identifier is permanently dead.

## Canonical version-control availability

A search of the current `protegeproject/protege` GitHub repository did not identify the Travel ontology itself as a canonical tracked ontology artifact. The repository does contain historical/code references to Travel-style URI handling, but no authoritative Git lineage for the ontology was established by this search.

The Stanford-hosted test copy and primary Protégé documentation are therefore the strongest identified evidence for this investigation.

As with Wine/Food, GitHub mirrors or third-party copies should be treated as mirrors unless provenance establishes otherwise.

---

# Comparison with Pizza

## Shared problem family

Pizza, Wine/Food and Travel all demonstrate that ontology engineering has at least two identities to manage correctly:

```text
semantic identity
    ontology/entity IRIs

publication/retrieval identity
    document locations, repository paths, mirrors, redirects, catalogs
```

They differ in how the problem appears.

| Concern | Pizza | Wine + Food | Travel |
|---|---|---|---|
| Teaching/reference origin | Protégé / Manchester lineage | W3C OWL Guide | Protégé tutorial/application example |
| Primary model shape | single rich OWL ontology | explicit Wine → Food import system | single ontology used to expose import/location behavior |
| Historical identity problem | namespace/ontology IRIs no longer match current hosting | bases/import/document suffixes were actively corrected during W3C editing | ontology name differs from physical retrieval locations |
| Version lineage | historical Pizza 2.0 preservation baseline | dated W3C Recommendation + `owl:priorVersion` | tutorial version 1.0; no comparable governed series identified |
| Canonical Git history identified | modern preservation repo exists, historical source provenance external | no canonical W3C Git source identified | no canonical current Protégé Git source identified |
| Strong next test | projection/preservation already demonstrated | import closure + reasoning/query verification | resolver/catalog/IRI-mapper backend independence |

## What generalizes beyond Pizza

The three cases support several SKE principles with independent evidence.

### Semantic identity is not a backend URL

Travel demonstrates the distinction explicitly. Pizza demonstrates its operational consequence. Wine/Food demonstrates that bases/imports and physical document naming must be engineered carefully even during standards publication.

### Imports are governed semantic dependencies

Wine + Food adds evidence that a semantic model may depend on another independently identifiable semantic model. Executable processing should retain that dependency rather than flatten it into an opaque file bundle without provenance.

### Preservation is different from repair

A historical ontology may have imperfect or obsolete publication mechanics. Preserving the semantic artifact and recording those mechanics is different from claiming authority to change the historical ontology IRI.

### Resolution infrastructure is replaceable

Travel's catalog/physical-location discussion strongly supports an architecture in which resolvers, catalogs, local caches and repositories are replaceable infrastructure beneath stable semantic identity.

### Verification should use externally meaningful evidence

LWBM and LUBM provide stronger verification opportunities than self-authored toy fixtures because they supply independently defined queries/results or benchmark expectations.

---

# Recommended proving grounds

## 1. Wine + Food import-closure proving ground

### Hypothesis

An executable semantic workflow can process a multi-ontology import closure while preserving the independent identity of Wine and Food and without treating the physical retrieval mechanism as semantic authority.

### Candidate experiment

1. record immutable reference snapshots of the authoritative W3C Wine/Food artifacts with source provenance;
2. preserve their historical identifiers unchanged;
3. resolve Wine's Food dependency through an explicit local catalog/IRI mapping for reproducibility;
4. run an OWL reasoner or a selected deterministic query over the import closure;
5. verify an expected entailment/result that depends on imported Food semantics;
6. record the Execution, Result and Verification using existing ESKA/PROV mechanisms;
7. repeat with a different physical backend while holding semantic identifiers constant.

### Falsification condition

If execution requires changing the historical semantic identifiers merely to switch retrieval backends, the current backend-independence architecture is insufficient.

### Vocabulary expectation

No new SMO or ESKA term is expected. Wine and Food can remain semantic models; PROV-O can record usage/lineage; ESKA can record execution/verification; catalog behavior remains implementation infrastructure.

## 2. Travel identity/location proving ground

### Hypothesis

A historical ontology whose ontology identity differs from its available physical copy can be loaded and processed reproducibly through explicit IRI mapping without changing its semantic identity.

### Candidate experiment

1. preserve the currently available Stanford Travel test artifact as a provenance-recorded reference snapshot;
2. assert no authority to change its ontology IRI;
3. configure an OWL API IRI mapper, XML catalog or equivalent resolver mapping from the historical ontology identity to the preserved local copy;
4. load/classify/query Travel through the semantic identifier;
5. replace the physical backend with a second byte-equivalent/local copy;
6. verify that semantic identity and selected results remain stable;
7. record backend/provenance evidence separately from ontology identity.

### Falsification condition

If physical relocation changes semantic identity or application-visible ontology semantics without an explicit semantic change, the architecture has severed semantic identity from its governance contract.

### Vocabulary expectation

Again, no new SMO/ESKA vocabulary is expected. The test is primarily about publication/resolution infrastructure and provenance.

## 3. LWBM / LUBM executable-reference follow-up

After the historical preservation cases, the strongest next step is an independently defined benchmark.

### LWBM

Use Wine-domain benchmark data/query/results to connect the canonical Wine research lineage with executable result verification.

### LUBM

LUBM is broader and more systematic. Its official site describes:

- the Univ-Bench university-domain ontology;
- repeatable synthetic data generation;
- 14 SPARQL test queries;
- reference query answers;
- queries deliberately chosen to exercise different inference requirements.

A later ESKA experiment can test not merely that a reasoner or SPARQL engine runs, but that a replaceable implementation produces the expected benchmark answer set under an explicit semantic contract.

UOBM should follow LUBM if more expressive reasoning stress is needed; Oxford describes UOBM as an extension of LUBM with a more complex ontology including disjunctive axioms and negation.

---

# Prioritization of further corpus work

Recommended sequence:

```text
1. Wine + Food
   multi-model import closure + historical W3C lineage

2. Travel
   ontology identity vs physical retrieval / catalog mapping

3. LWBM
   wine-domain executable benchmark bridge

4. LUBM
   systematic query/inference benchmark with reference answers

5. OWL 2 Families
   modern W3C OWL 2 language-demonstration corpus

6. OWL-Time / SSN-SOSA / PROV-O
   standards-engineered ontology governance/publication comparison

7. OBO / GO ecosystem
   production-scale governance and dependency lifecycle

8. UOBM
   higher-expressivity benchmark stress test
```

The ordering is architectural, not a quality ranking. Each case is selected to introduce a new kind of evidence.

---

# Architectural conclusions

## The reference corpus is more valuable than a single canonical example

There is no single ontology that should serve as *the* model for SKE.

Pizza is useful because it is familiar, semantically rich and historically imperfect in ways that force preservation decisions.

Wine + Food is useful because it adds:

- W3C Recommendation provenance;
- explicit ontology imports;
- explicit version lineage;
- documented historical URI/base/import corrections.

Travel is useful because it isolates:

- ontology identity versus physical location;
- import-resolution ambiguity;
- resolver/catalog/IRI-mapper responsibilities.

LWBM/LUBM are useful because they add:

- externally supplied executable expectations;
- repeatability;
- a path from semantic model to measurable result verification.

Together they provide substantially stronger architectural evidence than Pizza alone.

## No vocabulary change is justified by this investigation

Nothing in the current evidence requires new SKE, SMO or ESKA ontology terms.

The strongest result is instead a set of empirical architecture tests:

```text
semantic identity survives backend relocation
imports remain explicit semantic dependencies
execution preserves model/dependency identity
results are verifiable against independent expectations
provenance records physical artifacts without promoting them to semantic authority
```

Those are the properties the next proving grounds should test.

---

# Source discipline

Primary authority was preferred throughout this investigation.

## W3C Wine + Food

- OWL Web Ontology Language Guide, W3C Recommendation 10 February 2004:
  https://www.w3.org/TR/owl-guide/
- Dated Recommendation snapshot:
  https://www.w3.org/TR/2004/REC-owl-guide-20040210/
- Web Ontology Working Group archive — review of Wine/Food, 31 July 2003:
  https://lists.w3.org/Archives/Public/www-webont-wg/2003Jul/0347.html
- Web Ontology Working Group archive — Wine/Food `xml:base` discussion, 8 May 2003:
  https://lists.w3.org/Archives/Public/www-webont-wg/2003May/0103.html
- Web Ontology Working Group archive — validation / explicit import / base corrections, 5 June 2003:
  https://lists.w3.org/Archives/Public/www-webont-wg/2003Jun/0052.html
- Web Ontology Working Group home / Recommendation history:
  https://www.w3.org/2001/sw/WebOnt/

## Protégé Travel

- Importing Ontologies in P4.1:
  https://protegewiki.stanford.edu/wiki/Importing_Ontologies_in_P41
- How OWL Imports Work:
  https://protegewiki.stanford.edu/wiki/How_Owl_Imports_Work
- How OWL 2.0 Imports Work:
  https://protegewiki.stanford.edu/wiki/How_Owl_2.0_Imports_Work
- ProtégéOWL API Advanced Topics:
  https://protegewiki.stanford.edu/wiki/ProtegeOWL_API_Advanced_Topics
- Currently retrievable Stanford Travel test artifact checked 2026-08-12:
  https://protege.stanford.edu/junitOntologies/testset/travel.owl

## Benchmarks

- Lehigh Wine Benchmark:
  https://swat.cse.lehigh.edu/projects/benchmarks/lwbm/
- Lehigh University Benchmark:
  https://swat.cse.lehigh.edu/projects/lubm/
- LUBM query descriptions:
  https://swat.cse.lehigh.edu/projects/lubm/query.htm
- Oxford UOBM Generator:
  https://www.cs.ox.ac.uk/isg/tools/UOBMGenerator/

## Relationship to existing SKE evidence

- modern ontology-engineering landscape: `ontology-engineering.md`;
- SMO standards alignment: `smo-v0.1-standards-alignment.md`;
- ESKA standards/tooling alignment: `eska-standards-tooling-alignment.md`;
- conformance terminology: `conformance-terminology.md`;
- concrete Pizza proving ground: `GerhardBalz/pizza-ontology`.

This note implements SKE #15.