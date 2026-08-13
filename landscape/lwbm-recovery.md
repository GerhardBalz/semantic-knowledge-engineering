# LWBM recovery and executable-reuse gate

Status: investigation in progress under SKE #17  
Observation date: 2026-08-13 (Europe/Zurich)

## Purpose

The Lehigh Wine Benchmark (LWBM) is the natural benchmark continuation of the W3C Wine + Food reference case already used by ESKA. It is potentially valuable because it could connect a historically important ontology domain with an externally defined benchmark workload.

That value depends on preserving benchmark authority and provenance. An executable example must not silently reconstruct missing Lehigh queries or expected results from later mirrors and then present those reconstructions as the original LWBM workload.

This note records what can currently be established from Lehigh-owned publication surfaces, what remains unrecovered, and the gate that must be satisfied before an ESKA LWBM execution claim is justified.

## Authority

The authoritative public description remains the Lehigh SWAT LWBM page:

- `https://swat.cse.lehigh.edu/projects/benchmarks/lwbm/`

The page identifies LWBM as the example benchmark used with:

- Yuanbo Guo, Abir Qasem, Zhengxiang Pan and Jeff Heflin, *A Requirements Driven Framework for Benchmarking Semantic Web Knowledge Base Systems*, IEEE Transactions on Knowledge and Data Engineering 19(2), 2007, pp. 297–309;
- DOI `10.1109/TKDE.2007.19`.

The Lehigh SWAT publications page independently records the same paper and bibliographic relationship.

The benchmark page declares four relevant artifact groups:

- ontology;
- 4k-triple data;
- queries in SPARQL, RDQL and RQL;
- result plots for 4,000 and 10,000 triples.

## Artifact register

### Ontology

Declared URI:

```text
http://swat.cse.lehigh.edu/onto/wine.owl
```

Current HTTPS retrieval:

```text
https://swat.cse.lehigh.edu/onto/wine.owl
```

Observed status: **content retrievable**.

The retrieved Lehigh document declares:

```text
xml:base="http://swat.cse.lehigh.edu/onto/wine.owl"
xmlns:wine="http://swat.cse.lehigh.edu/onto/wine.owl#"
```

and identifies itself as the Wine Ontology. It records a prior version at the 18 August 2003 W3C OWL Guide Wine ontology and states lineage from the earlier DAML Wine ontology.

The Lehigh `/onto/` directory index also lists `wine.owl` as a hosted artifact, with the server directory metadata showing a 2021-11-16 timestamp and approximately 54 KB size. That directory timestamp is publication-host metadata and is not an ontology version identifier.

Current conclusion: the ontology component is sufficiently identified for provenance work, although direct byte hashing still needs to be captured through a governed retrieval path before a complete artifact manifest can be declared.

### 4k data

Declared URI:

```text
http://swat.cse.lehigh.edu/data/wine-data.owl
```

The LWBM page explicitly labels this as:

```text
Data (4k triples)
```

Observed status: **Lehigh identity confirmed; bytes not yet recovered through a governed retrieval path**.

The current HTTPS-oriented retrieval path used during this investigation does not return the data bytes. This must not be interpreted as evidence that every possible direct or archival retrieval route is permanently unavailable.

No substitute dataset has been accepted.

### SPARQL workload

The Lehigh LWBM page exposes a link labelled `SPARQL` alongside RDQL and RQL.

Observed status: **Lehigh workload existence confirmed; exact SPARQL bytes and link target not yet governed/pinned**.

The current client could not follow the legacy query target successfully. Search-engine discovery did not establish a second Lehigh-owned copy containing the exact query text.

No query text from a mirror, paper paraphrase or self-authored reconstruction is accepted as the LWBM SPARQL workload at this stage.

### RDQL and RQL workloads

Observed status: **declared by Lehigh; not recovered**.

These are secondary for an initial modern executable example because SPARQL would be the preferred workload, but they remain part of the historical benchmark record and should be included in archival recovery where possible.

### Result plots

The Lehigh page declares results for:

```text
4,000 triples
10,000 triples
```

Observed status: **result-plot links declared; image bytes not yet governed/pinned**.

Even if recovered, performance plots alone are not a sufficient semantic answer oracle. They can support historical performance provenance, but an ESKA `Verification` of semantic correctness needs independently defined expected rows, counts, entailments, or another correctness contract.

## Current evidence table

| Artifact | Lehigh authority | Identity established | Content recovered | Hash pinned | Sufficient for executable semantic verification |
| --- | --- | --- | --- | --- | --- |
| LWBM landing page | yes | yes | yes | not required as benchmark payload | contextual only |
| Wine ontology | yes | yes | yes | pending | source/model evidence only |
| 4k data | yes | yes | no | no | no |
| SPARQL workload | yes | existence only | no | no | no |
| RDQL workload | yes | existence only | no | no | no |
| RQL workload | yes | existence only | no | no | no |
| 4k result plot | yes | existence only | no | no | no |
| 10k result plot | yes | existence only | no | no | no |
| semantic expected-answer oracle | not yet established | no | no | no | no |

## What was deliberately not done

The investigation did not:

- replace the declared Lehigh 4k data with a later Wine dataset;
- derive a new benchmark dataset from the live ontology;
- infer the missing SPARQL workload from the 2007 paper;
- take a GitHub copy as authoritative merely because it is convenient to fetch;
- treat performance graphs as semantic correctness answers;
- modernize the Wine ontology IRI;
- create a separate Wine/LWBM repository;
- create an ESKA LWBM execution issue before the evidence gate is met;
- add SKE, SMO or ESKA vocabulary.

## Recovery strategy

The next recovery sequence is:

1. Recover the exact historical link targets from the original LWBM page or an independently verifiable capture of that page.
2. Recover `wine-data.owl` from Lehigh directly or from a web archive capture that preserves the original Lehigh URL and capture metadata.
3. Recover the Lehigh-authored SPARQL workload from the same authority chain.
4. Record for every recovered payload:
   - original Lehigh URL;
   - retrieval URL or archive capture URL;
   - capture/retrieval timestamp;
   - media type where available;
   - byte length;
   - SHA-256;
   - authority classification;
   - whether redistribution in SKE/ESKA is permitted or whether CI must fetch it externally.
5. Compare multiple recovered copies, if available, by cryptographic digest rather than assuming mirrors are identical.
6. Determine whether Lehigh published semantic expected answers/counts for the LWBM queries. If no such oracle exists, document that limitation explicitly rather than inventing one.

## Executable-reuse gate

An ESKA LWBM proving ground may be opened only when all three of the following are governed:

```text
selected benchmark data
        +
exact Lehigh-authored query text
        +
independently defined semantic correctness oracle
```

The oracle can be an expected result set, expected result count, entailment expectation, or another Lehigh-defined correctness criterion. A performance timing/plot by itself is insufficient.

If the data and query can be recovered but no independent correctness oracle can be established, LWBM should remain a preservation/reference case rather than being presented as an external-oracle ESKA verification benchmark.

## Relation to the reference corpus

The current evidence chain is:

```text
W3C Wine + Food
    → historical teaching/import system

ESKA Wine/Food import proof
    → import identity and replaceable retrieval

LWBM
    → Lehigh benchmark identity and workload declaration
    → preservation gate still open

LUBM Query 11
    → external-oracle ESKA benchmark already proven
```

This difference is useful. LUBM demonstrates that ESKA can verify an externally defined benchmark oracle. LWBM now tests whether historical benchmark publication can be reconstructed with enough provenance to support the same standard of evidence.

## Architectural conclusion so far

The absence of conveniently retrievable workload bytes is **not** a reason to sever semantics or authority.

The correct response is:

```text
preserve original benchmark identity
        ↓
recover physical artifacts through evidence-bearing routes
        ↓
record provenance and hashes
        ↓
do not promote mirrors to semantic authority
        ↓
execute only when the benchmark contract is independently recoverable
```

This is consistent with the existing SKE principles that semantic identity is independent of publication backend and that execution must not sever semantics.

## Primary sources

- Lehigh SWAT, `LWBM: Lehigh Wine Benchmark`;
- Lehigh SWAT hosted `wine.owl`;
- Lehigh SWAT `/onto/` directory index;
- Lehigh SWAT publications index;
- Guo, Qasem, Pan and Heflin, *A Requirements Driven Framework for Benchmarking Semantic Web Knowledge Base Systems*, IEEE TKDE 19(2), 2007, DOI `10.1109/TKDE.2007.19`.

## Issue status

SKE #17 remains **open**.

The preservation/reproducibility gate is not yet satisfied, and no ESKA LWBM executable issue should be created from this evidence alone.
