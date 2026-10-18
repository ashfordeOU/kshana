<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# DRAFT: oracle-registry process

**Status: DRAFT for owner approval. Not adopted.**

Rule already in force: nothing is labelled VALIDATED without an external oracle
(`GOVERNANCE.md`, validation honesty). This draft says what counts as an oracle and how
one is recorded.

## What an oracle is

An independent source of the expected answer that Kshana did not produce and could not
have tuned against: a published table, a reference implementation run by someone else,
a measured dataset with provenance, or a standard's own worked example.

## Registry entry (one file per oracle, `xval/<name>/ORACLE.md`)

| Field | Content |
|---|---|
| id | `xval` directory name |
| kind | table / reference implementation / dataset / worked example |
| source | exact citation, edition, version or release, retrieval date |
| licence | the oracle's licence and whether data may be vendored (default: manifest + fetch script with pinned SHA-256, never vendored) |
| independence | why Kshana's authors did not produce or tune to it |
| scope | which quantities it covers and which it does not |
| bar | link to `PREREGISTRATION.md`, committed before any scored run |
| status | proposed / registered / retired |

## Process

1. **Propose** by pull request adding `ORACLE.md` and `PREREGISTRATION.md` only. No
   scored run yet.
2. **Check** (maintainer, or the TSC once seated): independence, licence, scope,
   and that the bar was written before any run.
3. **Register** by merge. The pre-registration commit must precede the first scoring
   commit in history; the check is mechanical (`git log --follow`).
4. **Run** and record the result as MET or NOT MET. A NOT MET is pinned by a test that
   asserts the miss. Bars are never loosened after a run.
5. **Retire** an oracle when its source is withdrawn, superseded or found not
   independent. Rows that rested on it revert to MODELLED in the same change.

## Out of scope

Paid standards are never implemented from unofficial copies. Where only a paid text
defines the oracle, the entry records "not registered: paid source".
