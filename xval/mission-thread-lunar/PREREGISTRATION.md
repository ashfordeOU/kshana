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

---

# Amendment 1 (2026-10-24): A1 and A2 bars tightened, with the reason for each; still before any run

Made before any oracle data was fetched or any number computed. It only tightens. The original A1 and A2 rows above
are left as written and are superseded by this amendment for A1 and A2 only; nothing else changes.

## Why the original bars were too loose

The original bars (5 km / 1 km for LRO, 200 km / 100 km for CAPSTONE) were set before the literature was read. Public
sources say the method should do clearly better:

- **LRO requirements.** The flight-dynamics orbit requirements are 500 m total-position RMS and 18 m radial RMS for the
  definitive orbit, and 800 m root-sum-square over an 84-hour prediction; operationally the 84-hour requirement was
  violated three times in two years, mostly in full-Sun periods where radiation pressure dominates (ISSFD 24 abstract,
  "Lunar Reconnaissance Orbiter Orbit Determination Accuracy Analysis", https://issfd.org/ISSFD_2014/ISSFD24_abstract_S5-4_Slojkowski.pdf).
- **LRO with a GRAIL-derived field.** A 2.5-day laser-ranging-only prediction with the GRAIL GL0420 field differs from a
  definitive orbit by less than 80 m total and less than 10 m radial (ILRS Laser Workshop 18 poster 13-Po26,
  https://ilrs.gsfc.nasa.gov/lw18/docs/posters/13-Po26-Mao.pdf). That is a fitted state, a degree-420 field and modelled
  radiation pressure, so it is the best case for the method, not the expectation for ours.
- **CAPSTONE.** A published high-precision propagation of the CAPSTONE NRHO over 6.5 days from 2022-11-25 against the
  Horizons ephemeris, with a 150 x 150 lunar field, Earth harmonics, Sun, Jupiter, radiation pressure, albedo and
  relativity, gives an RMSE of 1.443 km (arXiv 2410.03372, section 4.4.1, Table 9). Its position error is not stated as a
  maximum or as growth in time.

## Method change (more faithful, not looser)

The original text said the field is "already in the crate". Only degree-20 crops of the GRAIL GL0660B table are committed;
the full table is public (PDS) and is checked in CI only when `KSHANA_GRAIL_SHA` is set. For A1 and A2 the lunar field is
therefore **GL0660B truncated to degree and order 150**, read from the PDS table, with the file's SHA-256 recorded in the
result. If the table cannot be fetched, A1 and A2 are "not run" and stay MODELLED. The force model otherwise stays as in
the table, with the crate's relativistic term added. Radiation pressure and albedo are not modelled, because no public
area-to-mass value for either spacecraft is registered here.

## Bars as amended

| Id | Bar (replaces the original) | Why this bar |
|---|---|---|
| A1 | maximum 3-D position difference over the 24 h window is at most **500 m**, and the 24 h RMS radial difference is at most **60 m** | 500 m is LRO's own total-position requirement. The best published prediction with a high-degree field is under 80 m total and 10 m radial over 2.5 days; allowing about a factor of six for a degree-150 field, no radiation pressure and a single reference state gives 60 m radial. |
| A2 | position difference at the end of the revolution is at most **25 km**, and the perilune radius differs by at most **10 km** | A full-force published propagation reaches 1.4 km RMS over 6.5 days. Omitting radiation pressure and albedo, and ending at the maximum of a growing error rather than its RMS, justifies about an order of magnitude on top; NRHO error growth is steepest after perilune. |

Everything else in section A applies unchanged: reachability, window choice by rule, "not run" when a source or the
field table is missing, the result recording URLs, hashes and commit, and the statement that A1 and A2 test the shared
propagator only. A miss is published and the row stays MODELLED.

---

# Amendment 2 (2026-10-24): fetch spans and a usable maneuver test for A1 and A2; still before any fetch

Made before any oracle data was fetched or inspected, and before any propagation was run against it. It changes
no bar. It fixes two things the original text left open or got wrong.

## What was open: the fetch spans

Rule 2 of section A picks the window "from the first day available in the fetched span" without saying what the
span is, which would leave the span to be chosen after the fact. They are fixed here.

| Id | Target and reference | Request (fixed now) |
|---|---|---|
| A1 | JPL Horizons, spacecraft LRO (NAIF id -85), centre Moon (`500@301`), ICRF, kilometres and seconds, state vectors, TDB | 2025-01-01 00:00 to 2025-01-02 00:00 UTC, step 10 minutes (145 states) |
| A2 | JPL Horizons, spacecraft CAPSTONE (NAIF id -1176), centre Moon (`500@301`), ICRF, kilometres and seconds, state vectors, TDB | 2023-01-01 00:00 to 2023-03-31 00:00 UTC, step 1 hour (2161 states) |

If Horizons does not carry a target over its span, or the response is not parseable state vectors, the row is
"not run" (rule 1). No other span or target is tried afterwards.

## What was wrong: the maneuver test of A2

Rule 3 judged a window maneuver-free by a jump in osculating energy above 1e-6 of its mean. In a near
rectilinear halo orbit the Earth's tide moves the osculating energy by about a percent per hour near apolune, so
that test would flag every sample and make A2 "not run" whatever the spacecraft did. It is replaced.

**Replacement rule (dynamical consistency).** For every pair of consecutive reference samples one hour apart,
the crate's force model (the A2 model of section A, as amended) propagates the earlier reference state across the
hour and the result is compared with the later reference state. The hour is a **maneuver hour** if the position
difference exceeds **100 m**, which a velocity change of about 28 mm/s produces over an hour and which the model
error of an hour-long arc is far below (an acceleration error of 1e-8 m/s^2 gives 0.07 m). The window is the first
run of consecutive hours with no maneuver hour that is at least one revolution long, one revolution being the
osculating period of the first sample of the run, from the 9:2 resonant orbit's published value of about 6.5 days.
If the run needed is not found in the fetched span, A2 is "not run". The test uses the propagator under test only
to choose the window, and the bar is applied to the propagation from the window's first sample; this is stated in
the result.

Nothing else in section A or in Amendment 1 changes. A miss is published and the row stays MODELLED.

---

# Amendment 3 (2026-10-24): the lunar orientation used for A1 and A2; still before any fetch

Made before any oracle data was fetched or inspected. It changes no bar.

Sections A and the two amendments before this one name "the crate's lunar force model" but not the frame inputs
behind it. The crate has two: the kernel-free analytic lunar orientation (the default), and the embedded daily DE440
principal-axis orientation series, 2014 to 2030, that the same force model takes through
`De440LunarEnvironment::orientation_only` (Sun and Moon stay the analytic series). The two differ by tens of
arc-seconds (the crate's own cross-check against ANISE, `xval/anise-lunar-od`), which is some hundreds of metres of
where the body-fixed gravity field sits at the surface: not negligible against the A1 bar.

**Primary (the bars apply):** the DE440 orientation, because it is the more accurate input the crate has and the
whole of the A1 and A2 spans (2023 and 2025) lie inside its coverage. **Secondary (reported, no bar applies, no
label rests on it):** the analytic orientation, to show how much the choice moves the result. The relativistic
(Schwarzschild) term of the force model is on in both. Nothing else changes.

If the DE440 orientation cannot be built for the span (outside its coverage), A1 and A2 are "not run"; the analytic
orientation does not stand in for them.

---

# Amendment 4 (2026-10-24): what the A1 and A2 quantities are, exactly; still before any fetch

Made before any oracle data was fetched or inspected. It changes no bar; it defines the quantities the bars name,
because "radial difference" and "perilune radius" cannot be computed from the sampled references as the earlier
text left them.

- **A1 differences.** The propagation starts from the first reference state (00:00 UTC) and is compared with the
  reference at each later 10-minute sample (144 comparisons; the first sample is the initial condition). The 3-D
  difference is the Euclidean norm of the position difference; the radial difference is its component along the
  unit position vector of the *reference* from the Moon's centre; the RMS radial difference is the root mean
  square of those 144 values. The bar on the maximum is taken over the 144 3-D differences.
- **A2 perilune.** The reference is sampled hourly, which cannot resolve a perilune passage (about 2.4 km/s, so
  8600 km of path in an hour). The perilune radius of a state is therefore its **osculating periapsis radius**
  about the Moon, `a (1 - e)` from the state's vis-viva energy and angular momentum. The bar compares the
  osculating periapsis radius of the propagated state at the end of the window with that of the reference state at
  the end of the window (the window is one revolution long, so both lie at the same orbital phase as the start).
- **A2 revolution length.** The window is as long as the osculating Keplerian period of its first sample,
  rounded up to a whole number of hours, and the end-of-window position bar is applied at that time.
- **Integration.** A Dormand-Prince driver with a relative tolerance of 1e-12 and an absolute tolerance of
  1e-9 (metres and seconds); the result records both and the step count. The integration error this leaves is far
  below a metre.
- **Reference states as given.** The reference position and velocity are taken from the Horizons response
  unaltered, kilometres converted to metres; no fitting, smoothing or time shift is applied to either side.

Nothing else changes. The bars stay as Amendment 1 set them.

---

# Amendment 5 (2026-10-24): the A2 window length, and the remaining loose ends of A1 and A2; still before any fetch

Made before any oracle data was fetched or inspected. It changes no bar. Reading Amendment 4 again, its
"osculating Keplerian period of the first sample" is undefined for the part of a near rectilinear halo orbit where
the osculating orbit is hyperbolic (near perilune the speed, about 2.4 km/s at a radius of about 3300 km, exceeds
the escape speed there, about 1.7 km/s), so it cannot decide a window length. The rule is replaced, and the other
points a run would otherwise have to settle by judgement are fixed with it.

- **A2 window length.** 156 hours, which is 6.5 days: the published period of the orbit, "about 6.5 days" (the
  figure Amendment 2 already cited). The window is the first run of 156 consecutive hours, that is 157 consecutive
  reference samples with no maneuver hour between any two of them, and the end-of-window bars are applied at +156
  h. Amendment 4's length rule is withdrawn and everything else in it stands.
- **Periapsis of a hyperbolic state.** The osculating periapsis radius `p / (1 + e)` is defined for any conic,
  hyperbolic included, and is the quantity used whatever the state's energy.
- **Model for the maneuver test.** The primary model of Amendment 3 (the DE440 orientation), with the field,
  relativity and tolerances of Amendments 1, 3 and 4, evaluated with the epoch of the earlier sample of each pair.
- **Identifiers checked, not data.** The Horizons lookup service names `-85` as `LRO (spacecraft)`, designator
  2009-031A, and `-1176` as `CAPSTONE (spacecraft)`, designator 2022-070A; the requests of Amendment 2 use them.
- **Coverage.** If Horizons returns fewer states than the request spans (it stops where its ephemeris stops), or
  an error, the row is "not run"; the span is not shortened and no other is tried (rule 1). The moon-centred ICRF
  vectors and their Barycentric Dynamical Time stamps are used as returned (the Julian Date of each row is the
  epoch, so no leap-second handling enters).
- **Secondary orientation.** The analytic-orientation propagation of Amendment 3 is run from the same initial
  states, over the window the primary selected for A2, and is reported without a bar.

Nothing else changes. The bars stay as Amendment 1 set them.
