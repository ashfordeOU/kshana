# Pre-registration: Mars short-arc orbit determination from the MRO ODF (CAP-30, stage 2)

Committed on its own on 2026-10-14, before Kshana has a Doppler model for these data or an orbit
determination on them, and before any predicted Doppler has been computed for any part of the
file. The bars are not loosened after a run. A miss is recorded with its numbers as a FINDING
and pinned by a test that asserts the recorded miss.

Stage 1 (the TRK-2-18 reader) was registered in `xval/mro-odf/PREREGISTRATION.md`.

## What has been looked at before this commit

Only the layout of the ODF, through the stage 1 reader: data types, stations, pass times,
compression times, reference frequencies and the ramp tables (sky-level X-band uplink near
7.1828 GHz, rates of tens of Hz/s). No predicted observable and no residual has been formed.

The 2-way X-band Doppler (data type 12, transmitting station = receiving station, uplink and
downlink band X, 1 s count time) is in three passes (UTC, receive time):

| Pass | Station | Span | 1-s points |
|---|---|---|---|
| D | DSS 43 | 2007-304T16:07 to 21:56 | 12 743 |
| S1 | DSS 63 | 2007-304T23:03 to 2007-305T06:59 | 16 938 |
| S2 | DSS 14 | 2007-305T06:57 to 12:43 | 11 133 |

## Development and scoring split

- **Development window: pass D (DSS 43) only.** It may be used, as often as needed, to debug
  the measurement model against the reconstruction (sign and scale conventions of the ramped
  observable, time tags, frames, light time) and to exercise the estimator. Nothing measured on
  it is scored.
- **Scored arc: passes S1 and S2**, every 2-way point received from 2007-304T23:00:00 to
  2007-305T12:45:00 UTC (13.75 h, about seven MRO orbits). The scored run is made once the
  model is frozen; no setting below is changed after it.

## Data

| File | Source | SHA-256 |
|---|---|---|
| `mromagr2007_304_1424xmmmv1.odf` | PDS Geosciences Node, MRO-M-RSS-1-MAGR-V1.0 (vendored, `tests/fixtures/mro_odf/`) | b3b781b9731a7ce33c1787601a9afb19cbc8b3c6e75822327bbb86b861d332dc |
| `mro_psp5.bsp` | NAIF, MRO-M-SPICE-6-V1.0, `mrosp_1000/data/spk/` (MRO NAV team reconstruction, 2007-10-01 to 2008-01-01) | 9c26069bcdfca2ef42e5afd3baebb721ffb9dfc22096fcffd59aef430b676c75 |
| `de440s.bsp` | NAIF generic kernels | c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2 |
| `earthstns_itrf93_260814.cmt` | NAIF generic kernels (DSN 810-005 module 301 rev. P coordinates and velocities, ITRF93, epoch 2003.0) | 567f9516452b849a58c3ff75fa6cec8a81cc336cb7726238c49fe265f294dff5 |
| `gmm3_120_sha.tab` | PDS Geosciences Node, MRO-M-RSS-5-SDP-V1.0, `mrors_1xxx/data/shadr/` (GMM-3, Genova et al. 2016) | eb4913b1afb6682406e6a9dad5be7918a162fa8462473c9a2e7aae258d4c2c9c |
| `gmm3_120_sha.lbl` | same directory | 097f9989fc87bc9adbf04be754734349160228de940f9a242164f3be1b80bb7d |
| `finals2000A_54401_54408.txt` | IERS finals2000A.all, eight verbatim rows, MJD 54401-54408 (vendored, `tests/fixtures/mro_od/`) | 7c672ff206aea2755ccdd733662c7567b38b772273d7b6130694b020af9c8a1c |

The non-vendored files are fetched by `scripts/fetch_mro_od.sh`, which checks each SHA-256 and
deletes a mismatching file. The test fails on a mismatch, skips when the files are absent, and
fails when they are absent under `KSHANA_REQUIRE_REALDATA=1` (the CI path).

## Oracle

`mro_psp5.bsp`, the reconstructed MRO trajectory produced by the JPL MRO navigation team from
the full DSN tracking with their own (MONTE/DPTRAJ-class) models. Kshana reads it with its own
SPK type 1 reader; that reader is checked separately against CSPICE (an engineering check, not
evidence for this row).

## Measurement model (fixed here)

- Observable: 2-way ramped Doppler (Moyer, *Formulation for Observed and Computed Values of Deep
  Space Network Data Types for Navigation*, JPL 2000, ch. 13). With `f_T(t)` the uplink sky
  frequency from the station's ramp table and `M2 = 880/749`, the count over the receive
  interval `[t3s, t3e]` of length `Tc` is predicted as
  `F = (M2 / Tc) · [ ∫_{t3e−τe}^{t3e} f_T dt − ∫_{t3s−τs}^{t3s} f_T dt ]`,
  `τ` being the round-trip light time ending at that receive time. The sign convention of the
  ODF observable relative to this expression is settled on pass D.
- Compression: 60 consecutive 1-s points (consecutive time tags, all valid) are averaged into
  one 60-s point; incomplete blocks are dropped.
- Light time: Newtonian light time in the solar-system barycentric frame, iterated, plus the
  Sun's Shapiro delay on each leg. Times: ODF UTC → TAI → TT → TDB.
- Station: ITRF93 coordinates at epoch 2003.0 plus the listed velocities, rotated to GCRS with
  the IAU 2006/2000A CIO chain and the IERS EOP above.
- Troposphere: the existing `radiometric::tropo_delay` model, applied on both legs. Ionosphere,
  solar plasma and spacecraft antenna offset are not modelled.
- Editing: receive elevation ≥ 15°; then, iterated to a fixed point (at most 10 times), points
  whose residual exceeds 5 × 1.4826 × the median absolute deviation of the residuals are
  removed.

## Dynamics and estimation (fixed here)

- Mars-centred J2000 integration of MRO; GMM-3 gravity to degree and order 80 in the Mars
  body-fixed frame of `mars_frame` (IAU 2009; GMM-3 is referenced to the Konopliv et al. 2006
  frame, which differs from it by far less than this test resolves); Sun, Earth-Moon barycentre
  and Jupiter barycentre point masses with the indirect term (DE440s); solar radiation pressure
  as a Sun-line cannonball with Mars's shadow (cylindrical); drag with the `mars_atmos`
  density.
- Estimated: the initial position and velocity at 2007-304T23:00:00 UTC, an SRP coefficient
  and a drag scale factor (8 parameters), by Gauss-Newton batch least squares, unweighted.
- Initial guess: the `mro_psp5` state at the arc start plus (+1 km, +1 km, +1 km) in position
  and (+1 m/s, +1 m/s, +1 m/s) in velocity; SRP coefficient and drag scale start at their
  nominal values.

## Bars

| Id | Quantity, on the scored arc | Bar |
|---|---|---|
| B1 | RMS of observed minus predicted 2-way Doppler, prediction from the `mro_psp5` trajectory (no estimation), after editing | ≤ 0.030 Hz |
| B2 | post-fit RMS of the 2-way Doppler residuals of the orbit determination | ≤ 0.030 Hz |
| B3 | RMS of the 3-D position difference, estimated trajectory minus `mro_psp5`, sampled every 60 s over the scored arc | ≤ 1.0 km |
| B4 | maximum of that 3-D difference | ≤ 2.5 km |
| B5 | fraction of the scored 60-s points removed by the outlier rule (after the elevation cut), in the B2 fit | ≤ 5 % |

0.030 Hz of 2-way X-band Doppler is about 0.53 mm/s of range rate. The bars allow for the
unmodelled ionosphere, the simple troposphere and Doppler-only tracking without range.

## Outcome rule

If B1-B5 all hold, the ledger row for Mars real-tracking orbit determination is VALIDATED
against the MRO navigation team reconstruction (ExternalDataset), with data-gated wording: the
inputs are fetched at test time with pinned SHA-256s, and a monthly CI job runs the test with
`KSHANA_REQUIRE_REALDATA=1`. If any bar misses, the miss is recorded here with its numbers as a
FINDING, pinned by a test asserting the recorded values, and the row stays MODELLED.
