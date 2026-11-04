<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAP-30 run 2: the values portable maths moved (a late addendum to the STUDIO-15 batch-4 re-baseline)

**Programme rule R4:** a changed published number is a revision. Two published run-2 numbers change here;
no verdict, bar, tolerance or threshold changes.

## What happened

The monthly real-data job (`.github/workflows/realdata-mro-od.yml`) ran for the first time since run 2 was
pinned, on 4 November 2026, and failed on the iteration-count pin. The STUDIO-15 batch-4 re-baseline
([`STUDIO15-batch4-rebaseline.md`](STUDIO15-batch4-rebaseline.md)) did not list this test. It is data-gated:
without the fetched MRO inputs it prints a skip notice and passes, so the full-suite run behind that
re-baseline never executed it.

## Where it moved (release builds, the same SHA-256-checked inputs, `scripts/fetch_mro_od.sh`)

| Tree | Iterations | B1 (Hz) | B2 (Hz) | B3 (km) | B4 (km) | B5 |
|---|---|---|---|---|---|---|
| `0576185b` (run 2 pinned) | 12 | 0.01253 | 0.04856 | 0.3617 | 0.5270 | 0.0291 |
| `36dc5ba9` (batch 3b, host maths) | 12 | 0.01253 | 0.04856 | 0.3617 | 0.5270 | 0.0291 |
| `054fa552` (STUDIO-15 merged) | 11 | 0.01253 | 0.04856 | 0.3587 | 0.5228 | 0.0291 |
| `99d06a73` (main, 4 Nov 2026) | 11 | 0.01253 | 0.04856 | 0.3587 | 0.5228 | 0.0291 |

The move happens at the STUDIO-15 merge itself, through the shared modules it routed through
`PortableFloat` (frames, precession, Earth orientation and others). It does not come from `ab4fbe09`'s
rewrite of `src/mars_od.rs`, which changes nothing further.

## Cells

| Item | was | is |
|---|---|---|
| Run-2 Jacobian evaluations | 12 | 11 |
| B3 (scored-arc RMS against `mro_psp5`) | MET 0.3617 km (published 0.362) | MET 0.3587 km (0.359) |
| B4 (maximum) | MET 0.5270 km (published 0.527) | MET 0.5228 km (0.523) |
| B1, B2, B5 | unchanged | unchanged; B2 NOT MET 0.04856 Hz stays pinned |
| TRK-2-18 status | MODELLED | MODELLED (unchanged) |

The test now pins the new values. Run 2's recorded result in `xval/mro-od/PREREGISTRATION-RUN2.md` stands as
recorded at the time, with a pointer to this file.
