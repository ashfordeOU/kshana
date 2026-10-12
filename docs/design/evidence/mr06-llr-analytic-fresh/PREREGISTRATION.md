# Pre-registration: the LLR frame datum on the analytic Moon, on fresh 2025 normal points

Written 2026-10-12 and committed alone, before any normal point of the slice below was fetched,
listed or opened, and before the comparison is run.

## Row and claim

Row "Lunar frame datum from a REAL observing campaign" (`kind = "lunar-llr-datum"`, the default
analytic Moon centre, no `planetary_kernel_path`). Its text says it stays MODELLED "until a
pre-registered fresh-data run of the analytic path". This is that run.

Claim, stated narrowly: the analytic-path datum covariance (seven Helmert sigmas, three norms,
condition number, per-array across/along ratios, bookkeeping, ranks, coupling) agrees with an
independent SPICE light-time and NumPy oracle on normal points no one on this project has
compared. It is a Library check of the covariance computation on measured schedules and
weights. It is not an LLR accuracy (a Cramér-Rao bound for a reduced parameter set), and, as the
kernel-Moon row already found, the 1 % bars do not discriminate Moon models; a pass is not
evidence that the analytic Moon is accurate (its bound is a separate row).

## Slice (fixed now)

Years already used anywhere in the repository: 2015 (Q2, `tests/fixtures/lunar_llr`), 2019
(Q2, `tests/fixtures/llr_datum_kernel_moon_fresh`) and 2024 (Q2,
`tests/fixtures/lunar_llr_geometry_range_oracle`). The fresh slice is **2025-04, 2025-05,
2025-06**, five targets `apollo11`, `apollo14`, `apollo15`, `luna17`, `luna21`, from the
EUROLAS Data Center (EDC, DGFI-TUM), open, no login. The CRD v1 tree ends at 2023 (recorded in
`tests/fixtures/lunar_llr_geometry_range_oracle/NOTICE.md`), so the files are the CRD v2 monthly
files `https://edc.dgfi.tum.de/pub/slr/data/npt_crd_v2/<target>/2025/<target>_2025<mm>.np2`.
No leap second falls in 2025.

* Committed byte for byte. Because both the engine reader (`realdata::llr_crd::read_crd_dir`)
  and the oracle read `*.npt`, each file is stored as `<target>_2025<mm>.npt` with its content
  unchanged; `SHA256SUMS` and the fixture's `NOTICE.md` record the upstream name, URL, retrieval
  date and digest. That rename is the only transform. Both readers accept CRD v2 (the record-11
  leading fields are those of v1; the engine reader accepts h1 versions 1 and 2).
* A file that does not exist upstream is absent and recorded as such.
* **Sufficiency rule.** If the engine uses fewer than 100 normal points, or either side's
  Helmert rank is below 7, the quarter is INSUFFICIENT, nothing is compared, and the slice moves
  to 2025-07..09, then 2025-10..12, under the same rules; any move is recorded. If all three
  are insufficient, the run is recorded as not possible and the row stays MODELLED.

## Engine configuration

`lunar-llr-datum` with `normal_points_dir` set to the fresh slice and nothing else: the analytic
Moon, the IAU 2015 lunar orientation, the committed ITRF2020 station catalogue (Grasse 7845,
Matera 7941; any other station skipped and counted, never given a substituted coordinate), the
DE430 Table 7 reflector catalogue, the engine's selection rules, weights
`1 / (bin_rms / sqrt(n_raw))^2` and relative eigenvalue threshold 1e-9. No engine code changes.

## Oracle (unchanged code)

`tests/fixtures/llr_datum_spice/gen_llr_datum_spice.py`, imported unmodified by a wrapper that
only changes its input and output directories (the same pattern as
`tests/fixtures/llr_datum_kernel_moon_fresh/run_oracle.py`): NAIF SPICE Toolkit (CSPICE N0067
through spiceypy) two-way light times with `naif0012.tls`, `de440.bsp`,
`earth_latest_high_prec.bpc` (ITRF93), `moon_pa_de440_200625.bpc` and `moon_de440_250416.tf`
(MOON_ME), 100 m finite-difference partials, and NumPy (LAPACK) for the information matrix,
Helmert design and inverse. Kernel SHA-256 digests are written into the reference header.
Pre-stated self-check, unchanged: SPICE's own observed-minus-computed one-way range RMS must be
under 100 m, or the oracle is void and nothing is compared.

## Quantities and bars (the original comparison's, 6b27964a, unchanged)

* the seven Helmert sigmas and the three `datum_accuracy` norms within **1 %** relative;
* the Helmert condition number within **2 %**;
* each observed array's across/along sigma ratio within **2 %**;
* the bookkeeping (parsed, used, skipped for an uncatalogued station), both ranks and each
  array's observation count **equal** between engine and oracle; the inter-array coupling
  **exactly 0** on both sides.

## Outcome rule

All hold: the analytic-default row is proposed VALIDATED on this evidence, with the narrow
claim above. Any fails: a finding; the strict test stays ignored with the recorded gaps, a gated
test pins them, and the row stays MODELLED. Bars are not moved.

Information only (no bar): the analytic-path residual RMS, and the same slice on the kernel Moon
(a `de440s.bsp` cut covering 2025-03-31..2025-07-02, made by the existing cutting script).
