# Pre-registration: opt-in DE440 lunar environment in the crate (FUT-05, CAP-29c, DS-LRO-08)

Written 2026-10-13 and committed alone, before the code it describes exists and before any
comparison below is run.

## What is built (opt-in; no default changes)

* `lunar_frame::try_icrf_to_moon_pa_de440(jd_tdb)`: the ICRF to Moon principal-axis rotation of
  DE440, the transpose of `lunar_orientation::try_de440_moon_pa` (embedded daily DE440 PA
  fixture, 2014-01-01..2030-12-31, already checked against SPICE in
  `tests/lunar_pa_orientation_spice_oracle.rs` at <= 1.7e-6 rad). The epoch argument is read as
  TT (TDB - TT <= 1.7 ms, i.e. <= 5e-9 rad of lunar rotation). Outside the span it returns the
  span error; it never clamps and never falls back silently.
* `lunar::try_mci_to_mcmf_de440(r, jd_tdb)`: an epoch-anchored variant of `mci_to_mcmf` into the
  DE440 principal-axis frame (MCI axes = ICRF).
* `lunar_od::De440LunarEnvironment`: a `LunarEnvironment` whose orientation is the function
  above and whose geocentric Sun and Moon come from a `KernelEphemeris` (a DE440 SPK the user
  supplies). Opt-in and labelled; `AnalyticLunarEnvironment` stays the default.

Unchanged by design: `lunar_frame::icrf_to_moon_pa` (analytic IAU 2015 + DE421 ME->PA),
`lunar::mci_to_mcmf` (mean rotation), the `Body::moon()` pole (IAU_MOON, which is what the
SPICE body-orientation oracle compares) and every default output. Routing the defaults would
change published numbers owned by other rows. This is recorded as a decision, not a deferral.

## Oracle

ANISE 0.10 (`AniseLunarEnvironment` of `xval/anise-lunar-od`, an independent pure-Rust NAIF
reader, MPL-2.0, confined to that workspace-excluded crate), reading `de440s.bsp` (SHA-256
`c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`) and
`moon_pa_de440_200625.bpc` (SHA-256
`60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f`). The in-crate side reads the
same `de440s.bsp` through `KernelEphemeris`. The harness lives in the xval crate, because only
that crate may depend on ANISE.

Known before writing (disclosed): the xval crate's recorded DE-grade LRO fit (raw overlap
41.5 m, dynamic 12.0 m, reduced-dynamic 6.67 m) and the analytic one (53.8, 12.6, 6.65 m).

## Comparisons and bars (fixed now)

At the 241 epochs of the LRO arc (`tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv`):

1. **Orientation:** the rotation angle between the in-crate `try_icrf_to_moon_pa_de440` and
   ANISE `rotate(EME2000, MOON_PA_DE440)` is at most **2.0e-6 rad** at every epoch (the stated
   interpolation accuracy of the embedded fixture is 1.7e-6 rad).
2. **Ephemeris:** the in-crate geocentric Moon is within **0.1 m**, and the geocentric Sun within
   **2 m**, of ANISE's at every epoch. The bars allow for the two libraries' TDB conversions: a
   30 microsecond difference moves the Sun's geocentric position by about 0.9 m.
3. **LRO fit:** the same estimator, field (GRGM660PRIM d/o 100), tolerances and configuration
   as `tests/agency_lro.rs`, run once with `De440LunarEnvironment` and once with
   `AniseLunarEnvironment`. Both fits converge, and the 3-D post-fit RMS of each tier (dynamic,
   reduced-dynamic) agrees within **0.10 m**, as does the raw overlap.

## Outcome rule

1 and 2 hold: a new row "Opt-in DE440 lunar environment for the Moon-centred force model" is
VALIDATED as a Library check against ANISE. It covers only the environment inputs, not any
orbit accuracy. 3 holds: the LRO row records the in-crate DE-grade numbers, and stays as it is
(the LRO fit is not validated by this). 3 is not a validation of anything; it shows the
in-crate path reproduces the cross-validation. Any of 1 or 2 fails: no new row, the finding is
recorded with its numbers. 3 fails: recorded as a finding on the LRO row. No bar is moved.

## Information only

The in-crate DE440 LRO numbers against the analytic default, and an in-crate main-repo test
that runs the opt-in fit on a committed de440s cut covering the arc (bit-for-bit records of
segments 10, 3, 301 and 399 over 2021-12-31..2022-01-02, made with the existing cutting
script), so the opt-in path is exercised without network access.
