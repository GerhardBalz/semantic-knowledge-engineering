# LWBM recovery and executable-reuse gate

Status: recovery gate satisfied for a selected 4k / Query 6 case; SKE #17 remains open until this evidence is reviewed and merged.  
Observation date: 2026-08-13 (Europe/Zurich)

## Purpose

The Lehigh Wine Benchmark (LWBM) is the natural benchmark continuation of the W3C Wine + Food reference case already used by ESKA. It can connect a historically important ontology domain with an externally defined benchmark workload, but only if benchmark authority and provenance remain explicit.

This note records a successful live recovery of the Lehigh-authored artifacts and identifies one narrowly governed query/result pair that now satisfies the executable-reuse gate.

## Authority

The authoritative public description remains the Lehigh SWAT LWBM page:

- `https://swat.cse.lehigh.edu/projects/benchmarks/lwbm/`

The page identifies LWBM as the example benchmark used with:

- Yuanbo Guo, Abir Qasem, Zhengxiang Pan and Jeff Heflin, *A Requirements Driven Framework for Benchmarking Semantic Web Knowledge Base Systems*, IEEE Transactions on Knowledge and Data Engineering 19(2), 2007, pp. 297–309;
- DOI `10.1109/TKDE.2007.19`.

The benchmark page links the ontology, 4k data, SPARQL/RDQL/RQL workloads, and 4k/10k result tables.

## Exact original targets

The live Lehigh page identifies these historical HTTP targets:

```text
ontology  http://swat.cse.lehigh.edu/onto/wine.owl
data      http://swat.cse.lehigh.edu/data/wine-data.owl
SPARQL    http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/query-spq.html
RDQL      http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/rdql.txt
RQL       http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/rql.txt
4k result http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/tkde-4t.gif
10k result http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/tkde-10t.gif
```

These identifiers are preserved as the source/publication identities. The recovery process does not replace them with GitHub, cache, or archive identities.

## Governed network recovery

SKE PR #20 adds a credential-free GitHub Actions probe that starts from each original HTTP target, follows redirects, does not rewrite payloads, records response metadata and SHA-256, and uploads the recovered bytes only as a short-lived workflow artifact.

Observed workflow run:

```text
run        31673627053
observed   2026-08-13T06:23:09Z
result     success
```

All seven Lehigh targets returned HTTP 200 and resolved to the corresponding HTTPS path.

| Artifact | Bytes | SHA-256 |
| --- | ---: | --- |
| Wine ontology | 55,705 | `30da3cd5f8c3df59c83cbc309750292ed83e990157028f044be347b5240d1775` |
| 4k data | 309,178 | `df22414d20d97937b84bce63665df791720025276350a64fa97e7b37db723b71` |
| SPARQL workload | 2,210 | `f981639d0257a7a96c2e475902969322b0943ddf0a4b3d5405aeb6eacb9f1428` |
| RDQL workload | 1,808 | `e355e3bb67ad022cb7cbd48f8b279dcb39c71448dfb229cecedae54e944becf3` |
| RQL workload | 1,390 | `3667600c639fed7c9efb087096bf6cc7ac453c2c200588f1a0435a99cb37752e` |
| 4k result table | 10,612 | `7496ef4db76e91228dac73314227817f10345402a5f55305fa38ce303b520c11` |
| 10k result table | 7,592 | `b4d9fe32aaeeba0ddda7791f670a7c67069c8333d8f83db46f9851e03bc4375a` |

The RDF/XML ontology and data are currently served with `text/html; charset=iso-8859-1`; that HTTP media type is recorded as publication evidence but does not alter the RDF document content or semantic identity.

The uploaded recovery ZIP itself had SHA-256:

```text
4811b4f5ea92af5a499194fdbf12b2c60eaeffb9fa1ac97f69fc9e566a2fce02
```

Recovered third-party bytes are not committed into SKE by this work.

## Exact SPARQL workload

The recovered Lehigh SPARQL page contains nine numbered queries.

It uses historical tuple-style `WHERE` syntax predating current SPARQL 1.1 syntax. That historical text is evidence and must be preserved as such. A later executable form may transform the syntax explicitly, but must not silently replace the Lehigh-authored query text.

### Selected Query 6

The exact semantic surface published by Lehigh is:

```text
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX wine: <http://swat.cse.lehigh.edu/onto/wine.owl#>

SELECT ?X

WHERE (?X, rdf:type, wine:Wine) ,
 (?X, wine:locatedIn, wine:CaliforniaRegion)
```

The source page containing this query is pinned by:

```text
SHA-256 f981639d0257a7a96c2e475902969322b0943ddf0a4b3d5405aeb6eacb9f1428
```

## Independent semantic oracle

The recovered Lehigh 4k result table is not merely a timing plot. It reports, per query and system:

```text
time
result
completeness
```

For **Query 6**, all three systems shown independently report the same outcome:

| System | Result count | Completeness |
| --- | ---: | ---: |
| OWLim | 23 | 100 |
| Jena | 23 | 100 |
| Pellet | 23 | 100 |

The source table is the Lehigh artifact:

```text
http://swat.cse.lehigh.edu/projects/benchmarks/lwbm/tkde-4t.gif
SHA-256 7496ef4db76e91228dac73314227817f10345402a5f55305fa38ce303b520c11
```

This gives a benchmark-author-published correctness target for the selected case:

```text
dataset       Lehigh 4k wine-data.owl
query         LWBM Query 6
expected      23 results
evidence      three result columns agree; completeness = 100 for each
```

This is independent of any result that ESKA might later compute.

## Executable-reuse gate

The original gate was:

```text
selected benchmark data
        +
exact Lehigh-authored query text
        +
independently defined semantic correctness oracle
```

For the selected **4k / Query 6** case, all three components are now governed:

```text
data
  df22414d20d97937b84bce63665df791720025276350a64fa97e7b37db723b71

query source
  f981639d0257a7a96c2e475902969322b0943ddf0a4b3d5405aeb6eacb9f1428

oracle source
  7496ef4db76e91228dac73314227817f10345402a5f55305fa38ce303b520c11

expected result count
  23
```

Therefore the preservation/reproducibility gate is **satisfied for this selected case**.

## Constraints on an ESKA implementation

A future ESKA proving ground should:

1. Fetch the Lehigh ontology, 4k data, SPARQL workload and 4k result evidence from their original Lehigh identities.
2. Verify the governed hashes before treating retrieved bytes as the benchmark inputs/evidence.
3. Preserve the historical Query 6 text separately from any executable transformation.
4. Declare any SPARQL 1.1 translation as an implementation-facing syntax transformation, not as the original Lehigh query.
5. Execute the query with sufficient semantics to return the benchmark-author result.
6. Require exactly 23 normalized answers.
7. Keep physical retrieval and execution tooling non-authoritative.
8. Avoid adding LWBM-specific ESKA vocabulary unless the execution exposes a genuine semantic gap.

## What is still deliberately not claimed

This recovery does not establish:

- that every one of the nine queries has an unambiguous single answer-count oracle across every system;
- that the historical tuple-style query syntax can be executed unchanged by modern SPARQL 1.1 engines;
- that the Lehigh server's current HTTP media types are ideal RDF publication metadata;
- redistribution permission for committing the recovered third-party payloads into SKE or ESKA;
- a need for a separate LWBM repository.

Those are independent questions.

## Relation to the reference corpus

The evidence chain is now:

```text
W3C Wine + Food
    → historical teaching/import system

ESKA Wine/Food import proof
    → import identity and replaceable retrieval

LWBM
    → exact live Lehigh workload recovered and hash-pinned
    → Query 6 external result oracle established
    → eligible for a narrowly scoped ESKA proving ground

LUBM Query 11
    → external-oracle ESKA benchmark already proven
```

## Architectural conclusion

This recovery provides another concrete instance of the SKE principle:

> Semantic authority should survive publication mechanics.

The browser/cache path could not retrieve the legacy assets, but the original Lehigh identities remained valid and a clean external runner recovered the exact payloads by following their publication redirects. The appropriate response was not to rewrite identity or use a mirror, but to change the retrieval mechanism and preserve the evidence chain.

## Primary sources

- Lehigh SWAT, `LWBM: Lehigh Wine Benchmark`;
- Lehigh SWAT hosted `wine.owl`;
- Lehigh SWAT hosted `wine-data.owl`;
- Lehigh SWAT `query-spq.html`, `rdql.txt`, and `rql.txt`;
- Lehigh SWAT `tkde-4t.gif` and `tkde-10t.gif`;
- Lehigh SWAT publications index;
- Guo, Qasem, Pan and Heflin, *A Requirements Driven Framework for Benchmarking Semantic Web Knowledge Base Systems*, IEEE TKDE 19(2), 2007, DOI `10.1109/TKDE.2007.19`.

## Issue status

After this recovery evidence is reviewed and merged, SKE #17 can be completed for the selected Query 6 executable-reuse gate.
