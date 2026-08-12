# Publication lifecycle

## Convention

For a persistent semantic namespace backed by replaceable publication infrastructure, use a staged lifecycle that never points an immutable semantic route at a mutable or nonexistent target.

1. prepare the governed publication backend and resolver payload;
2. request or activate the persistent namespace;
3. externally verify the live resolver and negotiated representations;
4. publish the immutable governed repository release;
5. add immutable version routes only after the immutable release target exists;
6. verify current and immutable routes end to end.

## Rationale

This sequence separates semantic identity from publication backend while ensuring that every externally visible route has a real target when activated.

The important ordering constraint is that immutable version routes come **after** the immutable repository target exists. A planned tag or release is not an immutable publication target.

## Evidence

ESKA established this lifecycle during its first governed W3ID publication:

- current W3ID routes were activated and externally verified;
- the ESKA semantic namespace was migrated only after the resolver was live;
- `eska-v0.1.0` was then published as an immutable governed repository release;
- immutable W3ID version routes were added only after that tag existed;
- current and immutable routes were finally verified in executable CI.

SMO issue #5 adopts the same staged sequence for its first governed publication.

## Local specialization

A repository may add publication-specific verification, formats, or release requirements. It should preserve the lifecycle ordering unless a concrete publication mechanism provides equivalent guarantees.
