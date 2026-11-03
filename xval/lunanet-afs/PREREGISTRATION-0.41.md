<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D7 (0.41): the LunaNet AFS printed G2 column: no pre-registered bar needed

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**

## Why this row

Bar B1b of [`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory claimed that the printed G2 initial state of each
AFS-I code in LSIS-AFS V1.0 (29 January 2025) is the state reached by advancing the all-ones G2 register by the printed
delay. It is **NOT MET (0 of 210)**, pinned. The relation that holds, recorded post hoc, is 2047 minus the delay
(210 of 210). The specification marks these tables {LSIS-TBC}. Roadmap item D7 is to recheck this at the
specification's next issue.

## Why no new bar

There is no new evidence question and nothing to tune. B1b is an exact statement about a printed table: it holds for a
given edition or it does not. A recheck at a later edition is the same exact check against a new oracle, and a later
edition is a different pin, as the original file already says.

## What will be done (the acceptance test)

When the publisher issues a new edition of LSIS-AFS (checked at each Kshana minor release, starting with 0.41):

1. The new edition is fetched from its public URL and pinned by SHA-256 in a new oracle directory; V1.0's pin and
   results stay as they are.
2. The existing extractor reads the new edition's printed columns. The existing tests are run against them unchanged:
   B1 to B4 (codes), B1b as originally written, and the post-hoc relation.
3. The result is recorded per edition: for example "B1b (V1.x): met / not met, n of 210". If the new edition changes the
   printed G2 column, prints a different convention, or states the relation in words, that is recorded with a quote.

No result for a later edition changes V1.0's recorded B1b miss. If no new edition has been issued by the 0.41 release,
D7 records "no new edition as of <date>" and stays open.

## Owner decisions at sign-off

None.

## Sign-off (3 November 2026)

No bar: the same exact check at the specification's next issue.
