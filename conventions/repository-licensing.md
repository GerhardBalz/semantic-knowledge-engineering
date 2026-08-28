# Repository licensing and third-party rights

## Convention

Every participating repository must have a deliberate rights position based on the material it actually contains. Public visibility, organization ownership, a repository name, or a licence used by another participating repository does not grant or imply reuse rights.

This convention does not relicense any repository or artifact. Existing grants already made remain effective under their terms. A reviewed change may make new or additional grants only for material the relevant rights holders are authorized to license; contributor rights, upstream terms, and contractual restrictions continue to apply unless lawfully changed by the relevant parties.

A missing licence is therefore a valid but restrictive state: ordinary copyright defaults apply. GitHub documents that without a licence the copyright holder retains the relevant rights and others generally may not reproduce, distribute, or create derivative works, apart from GitHub's platform terms for viewing and forking public repositories.

## Recommended starting points

These are defaults for evaluation, not automatic grants.

| Repository or artifact class | Recommended starting point | Required qualification |
| --- | --- | --- |
| New public initiative-authored software, executable examples, and mixed engineering repositories | **MIT** for continuity with the existing public initiative baseline | Prefer **Apache-2.0** instead when an express patent grant, Apache-style notice handling, or downstream ecosystem fit is a concrete requirement. Do not switch an existing licence merely for visual uniformity. |
| Standalone public architecture, governance, educational, or other documentation | **CC BY 4.0** | If executable code or configuration is material, either use a software licence for the whole authored package or state a precise split boundary. |
| Newly authored standalone ontology, vocabulary, or data publication | **CC BY 4.0** when attribution is intended | Consider **CC0-1.0** only as a deliberate maximum-reuse waiver. A mixed ontology-and-tooling repository may instead retain a software licence for authored engineering material and state a separate semantic-content boundary. |
| Private, commercial, client-specific, personal, or pre-publication work | No public grant by default | State the rights position before granting external access or publishing. Jointly developed or client-derived material remains gated by the applicable agreement and authority. |
| Third-party, derived, pinned, cached, or mirrored material | Upstream terms | Never flatten it under the repository default. Preserve provenance, attribution, version, transformations, and redistribution limits. |
| External working fork or upstream contribution vehicle | Upstream governance and terms | Do not add an initiative blanket licence merely because the fork is organization-owned. |

The existing Apache-2.0 choice in Semantic Federated Biomedical Evidence is a reviewed repository-specific decision and is not reopened by this convention.

## Scope patterns

Use the smallest pattern that describes the repository truthfully.

### Uniform authored repository

- place the standard licence text in a root `LICENSE`, `LICENSE.md`, or `LICENSE.txt`;
- identify the SPDX licence ID in the README or relevant package metadata;
- do not add a `NOTICE` file unless the chosen licence, included material, or attribution record makes it useful.

### Mixed authored and third-party repository

- state exactly which material the root licence covers;
- keep third-party provenance and terms in `NOTICE.md`, `THIRD_PARTY_NOTICES.md`, or a purpose-specific equivalent;
- place additional standard licence texts under `LICENSES/` when the repository redistributes material under more than one licence;
- use per-directory or file-level `SPDX-License-Identifier` declarations when a reader or automated tool could otherwise misclassify the boundary;
- record whether a third-party artifact is copied, transformed, generated, fetched at runtime, or merely referenced.

A generated artifact does not automatically inherit the licence of the tool that generated it. Its applicable terms depend on the rights-bearing material it contains.

### Referenced-only external material

If a repository cites an external ontology, dataset, standard, paper, API, or implementation without copying it, record the external authority and make clear that the repository licence does not claim ownership of the referenced work. Do not manufacture a redistribution licence for a reference.

### Unclear or custom upstream terms

Treat uncertainty as a publication or redistribution gate. Retain the material privately or replace the packaging approach until the concrete intended use has been reviewed. Attribution alone is not evidence of redistribution authority.

## Live public baseline

Verified on **2026-08-27**. This table is an inventory checkpoint, not a substitute for newer repository state.

| Repository | Live rights state | Disposition |
| --- | --- | --- |
| `semantic-knowledge-engineering` | MIT for SKE-authored material; external references and evidence remain upstream-governed through `NOTICE.md` | Retain the uniform software licence for the mixed documentation, scripts, workflow configuration, and executable experiments, with the explicit third-party boundary. |
| `semantic-modeling-ontology` | MIT | Retain. Treat the existing mixed ontology/engineering package as an established exception rather than mechanically relicensing it. |
| `executable-semantic-knowledge-architecture` | MIT, with example-local Pizza and LUBM notices | Retain the root licence and explicit local third-party boundaries. |
| `pizza-ontology` | Split: historical Pizza semantic content CC BY 3.0; new software/engineering MIT; new documentation CC BY 4.0 | Retain the explicit `LICENSE.md`, `NOTICE.md`, and provenance boundary. |
| `semantic-modeling-pizza` | MIT for repository-authored work; Pizza CC BY 3.0 recorded in `NOTICE.md` | Retain. The top-level MIT licence must not be read as relicensing Pizza content. |
| `semantic-modeling-wine-food` | MIT for repository-authored work; W3C Wine/Food material referenced, not redistributed | Retain the reference-only notice and re-evaluate before caching or preserving upstream files. |
| `w3id.org` working fork | No initiative root licence; upstream contribution vehicle | Do not add an initiative blanket licence. Follow upstream governance and terms. |

Private retained repositories are inventoried in the private governance tracker rather than named in the public convention. Their default state is no public grant unless their own reviewed source says otherwise. A private repository that serves a public website still requires an explicit rights decision for the published assets; deployment does not create a licence.

## Adoption procedure

For each repository-level change:

1. verify the live default branch, visibility, current licence files, README claims, package metadata, and third-party content;
2. classify the repository and identify who has authority to grant rights over each material class;
3. choose a standard licence or an explicit no-grant/defer state, documenting any exception to the defaults above;
4. draft the exact coverage and third-party boundary in the affected repository;
5. use that repository's normal branch → Ready PR → explicit review → merge path;
6. after merge, verify the rendered files, GitHub licence detection where applicable, and any release or publication surface;
7. keep publication, provider mutation, external access, contractual, and billing decisions behind their separate gates.

Do not bulk-apply licence files across repositories. Do not treat this convention, an inventory, or a merged policy PR as authority to mutate another repository.

## Maintenance triggers

Re-inventory a repository when:

- visibility or ownership changes;
- external collaborators receive access;
- a public release, website, package, dataset, ontology, or documentation artifact is introduced;
- copied, cached, generated, transformed, or pinned third-party material is added;
- a contributor agreement, client restriction, patent concern, or commercialization plan changes;
- the upstream terms or concrete redistribution form changes.

Live repository and provider state wins over an older inventory checkpoint.

## Reference guidance

- [GitHub: Licensing a repository](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)
- [SPDX: Handling licence information](https://spdx.dev/learn/handling-license-info/)
- [Creative Commons FAQ: software, documentation, data, and databases](https://creativecommons.org/faq/)
- [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)
- [Apache guidance for applying Apache-2.0](https://www.apache.org/legal/apply-license.html)

This convention is engineering and governance guidance, not legal advice. Seek qualified legal review when ownership, contracts, patents, trademarks, privacy, or redistribution authority is uncertain.
