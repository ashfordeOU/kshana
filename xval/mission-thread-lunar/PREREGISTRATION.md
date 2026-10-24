# Pre-registration: lunar segment of the Artemis-class mission thread (0.40 workstream I)

Advisory software, not certified navigation equipment.

**Status: committed alone, before any code for it exists and before any number it would produce has been computed.**
Nothing here has been run. No data named below has been downloaded or inspected. A change after this commit is a new
pre-registration file; no bar is loosened, and a miss is published as a miss.

## What is registered

Three standalone scenario kinds, each also usable as a phase of the mission thread: `lunar-rendezvous`,
`lunar-landing-dispersion`, `lunar-surface-pnt-map`. Everything they compute is **MODELLED**. A kind earns VALIDATED only
through a row in section A below whose oracle is independent and public and whose bar is met as written; otherwise the
row stays MODELLED whether it passes or not. Section B bars are consistency and regression checks of the implementation
against its own stated model; passing them moves nothing to VALIDATED.

All seeds are 20261024. Trial counts are as stated. Results are written to new files under `xval/mission-thread-lunar/`
and pinned by tests that assert the verdict, a miss included. No `#[ignore]`.

## A. External oracles (public data only)

| Id | Oracle | Source | What is compared | Bar (fixed now) |
|---|---|---|---|---|
| A1 | LRO reconstructed trajectory | JPL Horizons (spacecraft ephemeris for the LRO target) and/or the public PDS SPICE reconstructed kernels | The crate's lunar force model (GRAIL-derived field already in the crate, degree and order 50, point-mass Earth and Sun, no drag, no SRP) propagates the osculating state at the start of a 24 h window; compared with the reference state every 10 min | maximum 3-D position difference over the window is at most 5.0 km, and 24 h RMS radial difference is at most 1.0 km |
| A2 | CAPSTONE NRHO | JPL Horizons (spacecraft ephemeris for the CAPSTONE target), public paper values for the orbit's period | The crate's Earth-Moon propagation (lunar force model, ephemeris-driven Earth and Sun) of the osculating state at the start of a maneuver-free window, one revolution long | position difference at the end of the revolution is at most 200 km, and the perilune radius differs by at most 100 km |

Rules for section A:

1. **Reachability.** If a source is not reachable from the run environment, or does not carry the target, the row is
   "not run" and stays MODELLED. It is not replaced by another source after the fact.
2. **Window choice (A1).** The window is the first 24 h window, starting at 00:00 UTC of the first day available in the
   fetched span, that contains no gap in the reference ephemeris. It is chosen by that rule only, not by the result.
3. **Window choice (A2).** A maneuver-free window is one in which the reference ephemeris shows no discontinuity in
   osculating energy above 1e-6 of its mean. The window is the first one of one revolution (about 6.5 days) found in the
   fetched span. If none exists, A2 is "not run".
4. **Reported regardless.** The state used, the fetch URL, the SHA-256 of each fetched file and the commit of the code
   are recorded in the result. A fail is published and the row stays MODELLED.
5. A1 and A2 test the propagator the rendezvous, landing and map kinds share; they do not test any navigation filter,
   signal or error budget, and no sentence in any doc may say they do.

## B. Consistency and regression checks (MODELLED)

| Id | Kind | Check | Bar |
|---|---|---|---|
| B1 | rendezvous | Relative-state estimate against truth over 200 Monte Carlo trials, circular low lunar orbit and elliptical polar orbit configurations both: mean normalised estimation error squared (6 degrees of freedom, expectation 6) | mean NEES in [5.2, 6.8] for each configuration |
| B2 | rendezvous | Closed-form check of the relative-motion core: the crate's Hill/CW propagation against the same relative orbit propagated by the numerical two-body integrator, 1 orbit, circular case, separation at most 1 km | relative position difference at most 1.0 % of the separation, plus 1.0 m |
| B3 | landing | Landing ellipse calibration: 2000 Monte Carlo landings; fraction inside the reported 3-sigma ellipse (analytic expectation 0.989) | fraction in [0.975, 0.999] |
| B4 | landing | Reduces to the existing kinds: with terrain aid, AFS aid and time aid each switched off, the landing error equals the dead-reckoned inertial drift of the inputs; with each switched on alone, the contribution equals what `terrain-nav`, `lunar-differential-pnt` and `lunar-time-offset` give for the same inputs | exact to 1e-9 relative |
| B5 | map | Single-site, single-epoch result equals the existing `lunar-station-coverage-terrain` and `moonlight-service-volume` results for the same inputs | exact (availability fraction and PDOP equal bit for bit) |
| B6 | all | Handover without a measurement: output covariance equals the input covariance propagated through the state-transition matrix (plus stated process noise); the thread's rule, not the phase, inflates on lost observability | difference at most 1e-12 relative |
| B7 | all | Determinism: two runs with the same seed give byte-identical result documents | identical |
| B8 | all | Every result document carries the advisory line and a MODELLED label unless A-row evidence says otherwise | present |

## Fixed inputs for the examples

- Rendezvous: circular case 100 km altitude, 90 deg inclination; elliptical polar case 100 km by 3000 km, 90 deg,
  argument of periapsis chosen over the south pole. Initial separation 2 km. Ranging 1-sigma from the crate's LunaNet AFS
  parameters at the stated C/N0 of 35 dB-Hz and 45 dB-Hz.
- Landing sites (south-polar, "Artemis-class"): latitudes -89.9, -89.5, -88.5, -85.0 deg at longitude 0 deg, using the
  crate's bundled polar DEM tile. These are illustrative sites, not candidate-site claims.
- Seasons: four epochs 91.3 days apart starting 2028-01-01 00:00 UTC.
- Horizon mask 5 deg; availability means at least four satellites in view and PDOP below 6.

## Not claimed

No agreement with any agency product, no flight heritage, no endorsement, no certification. The ILLUSTRATIVE
constellation and error budgets are inputs to be varied, not measurements.
