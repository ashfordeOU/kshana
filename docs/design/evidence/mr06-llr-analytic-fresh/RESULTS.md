# LLR frame datum on the analytic Moon, fresh 2025 normal points: results

Pre-registration: `PREREGISTRATION.md` (committed alone at `31f5283`, 2026-10-12 19:44 UTC,
before any normal point of the slice was fetched). Fixture:
`tests/fixtures/llr_datum_analytic_fresh_2025/` (committed in `990dee43`; provenance in its
`NOTICE.md`, committed before this run). Run: 2026-10-13,
`cargo test --release --test validate_llr_datum_analytic_fresh_2025 -- --include-ignored --nocapture`.

## Independent checks of the fixture before the run

* All 15 EDC files fetched again on 2026-10-13: byte-identical to the committed ones.
* The oracle (`run_oracle.py`, the unchanged `gen_llr_datum_spice.py`) re-run on 2026-10-13 from
  kernels downloaded again from NAIF: identical bookkeeping and ranks, every figure within
  4.4e-8 relative of the committed `reference.txt` (only `earth_latest_high_prec.bpc`, which NAIF
  updates daily, differs).
* The de440s cut regenerated: byte-identical.

## Sufficiency

First quarter 2025-04..06: 209 normal points parsed, 151 used (>= 100), 58 skipped because the
station is not in the ITRF2020 catalogue, Helmert rank 7 on both sides. The slice did not move.
Oracle self-check: SPICE O-C RMS 10.79 m (< 100 m).

## Against the bars (analytic Moon, the verdict)

| Quantity | Engine | SPICE + NumPy | Relative gap | Bar |
|---|---|---|---|---|
| sigma tx | 2.625000e-3 | 2.624052e-3 | 3.61e-4 | 1e-2 |
| sigma ty | 4.793735e-3 | 4.790930e-3 | 5.85e-4 | 1e-2 |
| sigma tz | 4.626260e-3 | 4.621135e-3 | 1.11e-3 | 1e-2 |
| sigma theta_x | 5.064079e-3 | 5.063452e-3 | 1.24e-4 | 1e-2 |
| sigma theta_y | 8.754355e-4 | 8.751834e-4 | 2.88e-4 | 1e-2 |
| sigma theta_z | 4.646053e-4 | 4.645226e-4 | 1.78e-4 | 1e-2 |
| sigma scale | 1.537051e-3 | 1.536538e-3 | 3.34e-4 | 1e-2 |
| translation norm (m) | 7.160503e-3 | 7.154967e-3 | 7.74e-4 | 1e-2 |
| rotation norm (rad) | 5.160149e-9 | 5.159483e-9 | 1.29e-4 | 1e-2 |
| scale (ppb) | 1.537051 | 1.536538 | 3.34e-4 | 1e-2 |
| Helmert condition | 3.478105e3 | 3.474995e3 | 8.95e-4 | 2e-2 |
| apollo11 across/along | 18.39694 | 18.36907 | 1.52e-3 | 2e-2 |
| apollo14 across/along | 16.17910 | 16.15610 | 1.42e-3 | 2e-2 |
| apollo15 across/along | 17.00276 | 16.98637 | 9.65e-4 | 2e-2 |
| luna17 across/along | 17.68285 | 17.65130 | 1.79e-3 | 2e-2 |
| luna21 across/along | 15.90005 | 15.87662 | 1.48e-3 | 2e-2 |

Parsed, used and skipped counts, reflector rank 15/15, Helmert rank 7, per-array counts
(16, 19, 61, 35, 20) equal; inter-array coupling exactly 0 on both sides. **All bars hold.**

## Information only (no bar)

* Analytic-path residual RMS 222 424 m: the analytic Moon centre is far from DE440 at the
  range level, yet the covariance agrees within 1.8e-3. As the kernel-Moon row found, these
  bars do not discriminate Moon models.
* The same slice on the kernel Moon (de440s cut): every quantity within 1.97e-4, residual RMS
  27 m.

## Outcome

Under the pre-registered rule, the analytic-default row is VALIDATED with the narrow claim:
a Library check of the datum covariance computation on measured schedules and weights
against SPICE light times and NumPy. It is not an LLR accuracy (it is a Cramér-Rao bound
for a reduced parameter set), and it is not evidence that the analytic Moon is accurate. That
bound is a separate row.
