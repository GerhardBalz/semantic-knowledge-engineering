# Semantic identity is independent of publication backend

## Principle

Persistent semantic identifiers identify semantic resources. Repository hosts, raw-content URLs, release assets, and other publication locations are replaceable backend targets and must not become semantic identity merely because they are convenient to serve.

## Why this is shared

The ESKA publication sequence demonstrated the distinction operationally:

- the permanent semantic namespace uses W3ID identifiers;
- GitHub serves governed HTML and RDF publication targets behind the resolver;
- immutable semantic version routes resolve to immutable repository release targets;
- backend locations can change without requiring semantic consumers to adopt a new identifier namespace.

SMO is intentionally following the same staged pattern. Pizza likewise distinguishes historical ontology/entity identity from repository releases and distribution locations.

## Consequences

Use persistent identifiers for semantic identity and treat concrete hosting URLs as publication infrastructure. Machine-readable publication contracts should keep ontology/resource identity, repository release identity, distribution location, and immutable source identity distinct.

A change of publication backend should not, by itself, require a change to semantic identifiers.

## Provenance

The principle is based on the implemented ESKA W3ID publication lifecycle and the publication/versioning boundaries established in SMO and Pizza.
