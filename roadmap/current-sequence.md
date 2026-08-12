# Current initiative sequence

This file records the current cross-repository dependency sequence. Repository-local backlogs remain authoritative for their own work.

## 1. Bootstrap and review SKE

Complete [SKE #1](https://github.com/GerhardBalz/semantic-knowledge-engineering/issues/1):

1. review initiative purpose and repository boundaries;
2. review the initial evidence-backed principles;
3. review the publication and Semantic Markdown conventions;
4. review the contribution/adoption model;
5. keep SKE private until the bootstrap baseline is accepted.

## 2. Adopt the Semantic Markdown convention

After the SKE baseline is reviewed:

1. complete [ESKA #72](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/72) as the first adoption case;
2. adopt the convention in SMO contributor/documentation guidance and review equivalent cases;
3. review Pizza documentation for equivalent cases;
4. keep repository-specific rules and exceptions in their owning repositories.

## 3. Resume SMO publication

Continue [SMO #5](https://github.com/GerhardBalz/semantic-modeling-ontology/issues/5) without broadening the minimal v0.1 ontology:

1. submit the prepared current-only upstream W3ID request for `https://w3id.org/smo`;
2. externally verify HTML and Turtle resolution after upstream merge;
3. make live resolver verification executable in SMO CI;
4. mark publication active only after live verification succeeds;
5. publish immutable `smo-v0.1.0`;
6. add immutable `https://w3id.org/smo/0.1.0` routing only after the tag exists;
7. verify current and immutable routes end to end.

## 4. Align ESKA and Pizza to stable SMO identity

Only after SMO has a stable live semantic identity:

1. implement the ESKA compatibility bridge for `SemanticModel` based on the final published SMO semantics;
2. preserve immutable `eska-v0.1.0` unchanged;
3. align Pizza references/adoption to SMO where the implemented evidence warrants it.

## Independent Pizza work

Pizza continues its own backlog independently. Broader OAK access, preservation releases, and other repository-local work do not need to wait for SKE unless they explicitly depend on an SKE convention or SMO identity.

The successor Pizza ontology lineage remains dormant until a concrete semantic-change requirement exists.
