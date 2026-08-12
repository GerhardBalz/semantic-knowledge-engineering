# Semantic Markdown

## Convention

Choose Markdown structures according to the meaning of the content rather than using fenced blocks as generic visual containers.

- Use ordered Markdown lists for procedural or sequential instructions where order matters.
- Use unordered Markdown lists for non-sequential collections.
- Reserve fenced blocks for literal or preformatted content such as code, syntax, identifiers, diagrams, command output, or other material whose formatting is semantically significant.

## Why

Native Markdown structure communicates intent to readers, renderers, accessibility tools, and downstream processors. A procedure represented as an ordered list is explicitly a sequence; the same procedure inside a fenced `text` block is only preformatted text.

This is a semantic documentation convention, not a prohibition on fenced blocks. Use a fenced block whenever literal formatting is part of the content being communicated.

## Provenance

The convention was prompted by review feedback from @TallTed on [perma-id/w3id.org#6530](https://github.com/perma-id/w3id.org/pull/6530), where a procedural sequence in ESKA's W3ID material was represented as a fenced `text` block and a native ordered list was suggested instead.

The specific pre-activation text was later removed as the ESKA namespace became active, but the feedback exposed a reusable cross-repository documentation principle. ESKA issue [#72](https://github.com/GerhardBalz/executable-semantic-knowledge-architecture/issues/72) tracks the first adoption case.

## Adoption

After this SKE convention is reviewed:

1. ESKA #72 should review current procedural documentation and adopt the convention;
2. SMO contributor/documentation guidance should adopt it and review equivalent cases;
3. Pizza documentation should be reviewed for equivalent cases;
4. repository-specific formatting requirements should remain local.
