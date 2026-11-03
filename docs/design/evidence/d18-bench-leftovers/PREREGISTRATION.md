<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D18 (0.41): two open items from the 0.38 benchmark and observatory work: no pre-registered bar needed

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.**

## The two items

1. **The almanac-HDOP scorer is not implemented.** `docs/observatory/METHOD.md` cites a published method that compares
   the position error implied by an aircraft's ADS-B NACp with the HDOP of the GPS constellation from almanac data
   (The Aeronautical Journal 129 (1331), 2025, doi 10.1017/aer.2024.67), and says the scorer is not implemented because
   only the abstract was available to the project.
2. **TEXBAT has no pinned hash.** `bench/manifests/b-iq.json` lists TEXBAT as reference-only with `"sha256_pinned": false`.

## Why no bar

Neither item asks an evidence question in 0.41:

- The scorer is a tool. Building it decides nothing about any detector or any day. **Any scoring of real data with it**
  (for example comparing it with the observatory's base method on a set of days) is an evidence question and gets its own
  pre-registration, committed before that run.
- Pinning a hash is bookkeeping.

## Item 1: what is built, and its acceptance test

Built from public material only, and labelled as Kshana's own method, not a reproduction of the cited paper:

- HDOP at each aircraft report's position and time from the public GPS almanac of that day (YUMA or SEM files from the
  U.S. Coast Guard Navigation Center, <https://www.navcen.uscg.gov/>), with a stated elevation mask;
- the NACp category's 95 % horizontal position bound (EPU) as published in public aviation guidance, quoted with its
  source in the code;
- a flag when the implied error is larger than a stated multiple of the HDOP-predicted error. The multiple is a
  parameter, documented, with no default chosen from real data.

**Acceptance (unit tests, not a bar):**

1. HDOP from the almanac equals an independent computation (a numpy script propagating the same almanac with the
   IS-GPS-200 equations) to 1e-9 at 20 stated epochs and positions.
2. The NACp-to-EPU mapping equals the quoted table for every category.
3. The flag logic is exact on a hand-written fixture of 12 reports.
4. `METHOD.md` is updated to say what was built, from which public sources, and that it does not reproduce the paper.

If the owner obtains the paper's full text lawfully and wants its exact method, that is a separate change with its own
registration (owner decision 1).

## Item 2: acceptance

The first fetch of TEXBAT after sign-off records the SHA-256 of each file used by task (b) in a manifest revision, with
the URL (<https://radionavlab.ae.utexas.edu/texbat>), retrieval date and byte counts; `"sha256_pinned"` becomes `true`; a
test checks that the manifest's hashes are well formed and that the bench refuses a TEXBAT file whose hash differs. The
licence handling in `bench/LICENCES.md` is unchanged (reference only; files are not vendored).

## Owner decisions at sign-off

1. Build the HDOP scorer from public sources as above (proposed), or wait for lawful access to the paper's full text.
