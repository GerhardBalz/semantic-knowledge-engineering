# Contributing

Semantic Knowledge Engineering coordinates shared architecture, principles, conventions, and sequencing across independently governed repositories.

## What belongs here

Propose material in SKE when it is cross-repository by nature and supported by concrete evidence from participating work. Typical candidates are:

- a principle demonstrated across repository boundaries;
- an engineering or documentation convention worth adopting consistently;
- a publication/governance pattern established by implemented work;
- a decision whose consequences span more than one repository;
- a dependency or adoption sequence that needs one visible coordination point.

Keep repository-specific semantic concepts, implementation details, tests, and local governance in the repository that owns them.

## Evidence before abstraction

Do not add framework surface area merely for symmetry. A shared principle, convention, or decision should identify the implemented evidence or external feedback that motivated it.

When an existing standard already owns the required semantics, prefer the standard rather than minting a new SKE construct.

## Adoption model

A shared SKE convention becomes effective in a participating repository only when that repository adopts it. Adoption may be explicit in contributor guidance, documentation, an architecture decision, or an issue/PR that applies the convention.

Repository-local rules may specialize or override an SKE convention when there is a concrete local reason. The local repository remains authoritative for its own content and semantics.

## Documentation convention

Contributions should follow the [Semantic Markdown convention](conventions/semantic-markdown.md):

1. use ordered Markdown lists for procedural or sequential instructions;
2. use unordered Markdown lists for non-sequential collections;
3. reserve fenced blocks for content whose literal/preformatted representation is semantically significant.

## Review

Changes should be reviewable and narrowly scoped. Cross-repository adoption should normally follow this order:

1. establish or refine the shared principle/convention in SKE;
2. review the SKE formulation and its provenance;
3. adopt it explicitly in participating repositories where applicable;
4. keep repository-specific exceptions or specializations local.
