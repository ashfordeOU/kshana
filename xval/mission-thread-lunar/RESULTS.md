# Results: the lunar segment of the Artemis-class mission thread

Advisory software, not certified navigation equipment. **Everything here is MODELLED.** The two external-oracle
rows (A1, A2) test the propagator the lunar kinds share; they test no navigation filter, signal or error budget,
and no label of any kind rests on them. The pre-registration is `PREREGISTRATION.md` (committed before any run) and
its six amendments; the kinds were renamed after it was written, so the pre-registration's `lunar-rendezvous`,
`lunar-landing-dispersion` and `lunar-surface-pnt-map` are `lunar-orbit-rendezvous`, `lunar-descent` and
`lunar-surface` here (and `lunar-ascent` is new). No bar was loosened; every miss is below.

## Verdicts

| Row | Bar (as registered) | Result | Verdict |
|---|---|---|---|
| **A1** the propagator against LRO (Horizons), 24 h | max 3-D difference at most 500 m; 24 h RMS radial at most 60 m | **33.1 m**; **2.39 m** | MET |
| **A2** the propagator against CAPSTONE (Horizons), 156 h | end position at most 25 km; osculating periapsis radius at most 10 km | **136.8 km**; **28.4 km** | **NOT MET** |
| **B1** rendezvous NEES, both orbits, C/N0 35 and 45 dB-Hz | mean NEES in [5.2, 6.8] | 5.854, 5.855, 5.931, 5.929 | MET, on the fourth estimator design (history below) |
| **B2** closed-form Hill propagation against the numerical relative orbit, 1 orbit, circular, 1 km | at most 1 % of the separation plus 1 m (11 m) | **10.26 m** | MET, with little margin |
| **B3** landing ellipse calibration, 2000 landings | fraction inside the 3-sigma ellipse in [0.975, 0.999] | 0.9860 (mean NEES 2.03, 2 expected) | MET |
| **B4** descent reduces to the reused kinds | exact to 1e-9 relative | the no-aid error equals the closed form to 1e-9; the differential range sigma and the LTC offset equal `lunar-differential-pnt`'s and `lunar-time-offset`'s values exactly; the terrain term equals `terrain-nav`'s matched error exactly | MET |
| **B5** surface map equals `moonlight-service-volume` | exact | equal to the bit (`mine * 100 == coverage_pct`), flat mask and with the LOLA terrain, two sites | MET |
| **B6** handover without a measurement only propagates | at most 1e-12 relative | within 1e-12 of the scale of the covariance | MET |
| **B7** determinism | byte-identical documents | identical for all four kinds | MET |
| **B8** advisory line and MODELLED label | present | present in every document and every phase outcome | MET |

A1, A2 and the pinned recorded verdicts are in `results_oracles.json` and `tests/mission_thread_lunar_oracles.rs`.

## A1 and A2 in detail

- **A1** (LRO, JPL Horizons `-85`, 2025-01-01 00:00 to 2025-01-02 00:00 UTC, 145 states, 144 comparisons): GL0660B to degree and
  order 150, the DE440 lunar orientation, Earth and Sun, the relativistic term, no drag or radiation pressure. Maximum 3-D
  difference 33.1 m, RMS radial 2.39 m. With the analytic orientation instead (reported without a bar, Amendment 3): 33.8 m and
  2.47 m, so the choice of orientation moves the result by under a metre. **The registered bars (500 m and 60 m) were
  far looser than what the propagator achieves**; they stay as registered, and a tighter figure would be a new
  pre-registration.
- **A2** (CAPSTONE, Horizons `-1176`, 2023-01-01 00:00 to 2023-03-31 00:00 UTC, 2137 states): 13 of 2136 hours were maneuver hours
  by the dynamical-consistency rule (Amendment 2, more than 100 m over an hour); the first run of 156 maneuver-free hours
  starts at sample 145 (JD TDB 2459951.5417). One revolution later the propagated end position differs from the reference
  by **136.8 km** (bar 25 km) and the osculating periapsis radius by **28.4 km** (bar 10 km): **both bars are missed**. The analytic
  orientation gives the same figures (136.8 km, 28.4 km). The row stays MODELLED.
  The causes were **not isolated**. Candidates, none tested: the omitted radiation pressure and albedo (no public
  area-to-mass is registered for the spacecraft); the sensitivity of a near rectilinear halo orbit to the initial
  state, which grows over a revolution; the accuracy of the analytic Earth and Sun series in the Earth's tide, the
  dominant perturbation near apolune; and small maneuvers below the 100 m per hour test. The bar of 25 km was my own
  margin on a published figure (a 1.4 km RMS for a full-force 150x150 propagation over 6.5 days, arXiv 2410.03372, which
  states no maximum or growth), not a published end-of-revolution error, and the miss is by a factor of 5.5.

**Amendment 6** corrects an arithmetic error of mine and is the only amendment made after the data was fetched: Amendment 2
gave 2161 states for the A2 request, which is the count for 90 days; the 89-day request returns 2137. The first run of the
runner reported "not run" for that reason; before the correction only the row count and the first and last epoch of the A2
response had been looked at, and no A2 state value or result. The run was repeated after the correction, and the number
above is from that run.

## B1: the history, every design tried

B1 is the check that the rendezvous estimate is consistent with its own model (mean normalised estimation error squared of
the 6-dimensional relative state, expected value 6). It was **not met first time**; it was met on the fourth design.
Nothing about the bar changed; the estimator did.

| Design | Result (mean NEES; position 3 and velocity 3 expected) | Note |
|---|---|---|
| 1. Extended Kalman filter, 3rd-order series state-transition matrix about a frozen Jacobian, white absolute fixes every step | **99.5** (position 18.2, velocity 45.2), LLO, 40 dB-Hz, 100 m prior | far too optimistic |
| 2. As 1, with an iterated update for the crosslink range | **30.8** (9.6, 15.0) | better, not consistent |
| 3. As 2, with the variational equations integrated alongside the state, so the transition matrix is the one consistent with the propagation | **21.5** (8.6, 10.1); with no measurements 5.82 and with position fixes only 5.86, so the crosslink range was the source | the range shell curves away from its tangent plane by metres against a sub-metre range |
| 3b. As 3, with a truncated second-order correction of the range (quadratic-form mean and variance) | LLO 35 dB-Hz **6.47** (met), LLO 45 **9.05**, ELFO 35 **6.26** (met), ELFO 45 **7.63** | **NOT MET** at 45 dB-Hz in both orbits |
| 3c. Diagnostics of 3b | prior 1 m: 5.6 to 5.9; 10 m: 7.4; 30 m: 8.3; 100 m: 9.05; crosslink sigma 12.8, 4.1, 0.72, 0.13 m: 5.8, 6.0, 6.5, 21.5 (before the second-order term) | the inconsistency grows with the width of the prior and the precision of the range: a limit of an extended filter, not a coding error |
| 3d. Attempts to model the persistence of the signal-in-space error in the filter: fixes only every 600 s; variance inflated by the correlation time over the step | NEES **142 to 2e7**; **19 to 11 315** | range-only regimes made the filter far worse |
| **4. Batch Gauss-Newton estimate over the arc, signal-in-space error as persistent bias parameters (common and independent)** | **5.854, 5.855, 5.931, 5.929** (both orbits, both C/N0) | **MET** |

The batch estimate is the design the kind uses. The persistence model (constant biases over the arc) is conservative about
averaging; the truth and the estimator share a force model, so B1 says nothing about model error. The `point-mass` option
shows what ignoring the harmonics costs and is not expected to be consistent.

## What the kinds' own numbers are, and are not

- The rendezvous example (35 dB-Hz, 2 km, 100 km circular polar, default priors) gives a formal relative position 1-sigma of a
  fraction of a metre after the first orbit with the default relay set; **this depends on the truth and the estimator sharing
  the same force model, on an unperturbed coast, and on the illustrative relay set and error budget**. It is not a statement
  about any vehicle or a docking accuracy. With signals alone the relative position across the line of sight is limited by the
  independent signal-in-space error and the dynamics; a relative sensor is needed at docking range, and the report compares them.
- The descent dispersion is dominated by the assumed guidance term and the south-polar sites differ little; lunar time matters
  through the clock only when the relay geometry degrades to three relays.
- The `terrain-nav` mode runs on a synthetic relief and an Earth metre scale; the `lola-crlb` mode is a bound on the DEM's own
  1200 m resolution, not a camera.
- The surface relay figure does not change with the season in this model; the Earth and Sun figures do.

## Reproduce

```
bash xval/mission-thread-lunar/fetch_data.sh <dir>
cargo run --example mission_thread_lunar_oracles -- <dir> <dir>/results_oracles.json
KSHANA_RECOMPUTE_LUNAR_ORACLES=1 cargo test --release --test mission_thread_lunar_oracles
cargo test --lib -- lunar_rendezvous lunar_landing lunar_surface_map lunar_ascent mission_thread
```

The first run of the runner printed a figure that depends on the data fetched on 2026-10-24; the committed fixtures
(`tests/fixtures/mission_thread_lunar/`, with `NOTICE.md`) are those responses, and the test recomputes A1 and the end of the A2
window from them to a millimetre when gated on `KSHANA_RECOMPUTE_LUNAR_ORACLES`.
