<!-- SPDX-License-Identifier: Apache-2.0 -->
# Kshana governance

This document states how Kshana is governed: who makes decisions, how, and what
the project will and will not absorb. It is deliberately **light** — proportional
to the project's current size — and is honest about the present single-maintainer
reality and the path to broader governance as the community grows.

## Mission and scope

Kshana is a **neutral, reproducible, honestly-validated reference for hybrid
quantum/classical PNT performance and resilience**. The mission sets the bar for
every decision: correctness, citations, and reproducibility over breadth. The
honest scope is documented in [`docs/CAPABILITY.md`](docs/CAPABILITY.md) and the
validation status in [`docs/VALIDATION.md`](docs/VALIDATION.md); proposals are
weighed against that scope, not against feature-count.

## Roles

- **Maintainer.** Kshana is currently maintained by its founder, Ashforde OÜ
  (contact: `contact@ashforde.org`). The maintainer is the final decision-maker
  on scope, design, releases, and what is merged. This is a benevolent-maintainer
  model, stated plainly rather than dressed up as a committee that does not exist.
- **Contributors.** Anyone who opens an issue or pull request. Contributions are
  held to the bar in [`CONTRIBUTING.md`](CONTRIBUTING.md) — provenance for every
  numeric parameter, validation against a published relation, and honesty about
  maturity.
- **Future committers.** As sustained, high-quality contribution warrants it,
  commit rights will be extended to trusted contributors, and this document will
  be updated to a multi-maintainer model (decisions by lazy consensus, with the
  maintainer group resolving disagreements). Until then, the path is: contribute,
  build a track record, and be invited.

## How decisions are made

1. **Discussion in the open.** Substantive changes start as a GitHub issue so the
   rationale, alternatives, and trade-offs are on the record.
2. **Lazy consensus.** A proposal with no sustained objection after reasonable
   time, and which passes the technical bar below, proceeds.
3. **Maintainer decides on disagreement.** Where consensus is not reached, the
   maintainer decides, and records the reason. Disagreement is resolved by the
   mission and the technical bar, not by seniority or volume.

## The technical bar (non-negotiable)

These are hard invariants, enforced by CI and review, that no decision overrides:

- **Reproducibility.** `(scenario, seed, engine_version)` must reproduce a run
  bit-for-bit. A change that makes this non-deterministic is a bug, not a feature.
- **Provenance.** No anonymous numeric constants — every parameter cites a source.
- **Validation honesty.** Each capability is labelled `validated` (against an
  external oracle) or `modelled` / `not modeled`. Nothing is asserted beyond its
  evidence. See the machine-checked matrix in `src/verification.rs`.
- **Hygiene.** No automated-tool attribution anywhere in commits, content, or
  history (enforced by `scripts/check-no-attribution.sh`).

A change that cannot meet the bar is declined, however useful it would be.

## The open / closed boundary

Kshana is **open-core**. This repository is, and stays, the complete open
Apache-2.0 engine — the neutral reference. The project will **not** accept into
the open repository:

- **Export-controlled or dual-use depth** — real threat libraries, adversary
  waveforms, or anti-jam/anti-spoof performance parameters. The public repo keeps
  to generic, published models and methods (see `CONTRIBUTING.md` → Export
  control). If unsure, ask *before* contributing.
- **Customer- or partner-confidential data or calibration.**
- **Copyleft (GPL/AGPL/LGPL) dependencies** — they are incompatible with the
  licence model and with downstream procurement terms.

Conversely, the project will **not** hollow out the open core to push proprietary
value: the validated engine, the public validation anchors, the honesty ledger,
the interchange/standard format, and the distribution channels stay open. Starving
the open core is the one fatal mistake in open-core, and it is off the table.

## Releases

- **Semantic Versioning.** Pre-1.0 the scenario/result schema may change; breaking
  changes are called out, and the interchange schema version
  (`src/interchange.rs::SCHEMA_VERSION`) is the single source of truth for
  artifact compatibility.
- **Release authority.** Publishing (e.g. `cargo publish`) is a manual maintainer
  step requiring a registry token. CI and the tag-gated Release workflow **never**
  publish to external registries automatically — they only re-run all checks and
  attach a build artifact. See `CONTRIBUTING.md` → Commits and versioning.

## Code of conduct and security

- Conduct is governed by [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md).
- Security issues follow the private disclosure process in
  [`SECURITY.md`](SECURITY.md) — do not open a public issue for a vulnerability.

## Trademark

The Kshana name and logo are trademarks of Ashforde OÜ. The Apache-2.0 licence
covers the **code**, not the marks: a fork may use the code under the licence, but
not the Kshana name or the canonical distribution identity. This keeps Ashforde the
cited source of truth and is part of how the open core stays a neutral reference.

## Amending this document

Changes to governance are themselves proposed as a pull request and decided by the
process above. As the project's scale changes, expect this document to grow a
multi-maintainer decision model; it will not shrink the technical bar.

_Light by design. Honest about today, with a stated path for tomorrow._
