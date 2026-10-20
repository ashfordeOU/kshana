# Pre-registration: lunar orbit and surface as navigation and geodetic infrastructure (0.38 WS-H, H2)

Committed alone, before the `lunar-infrastructure` kind exists and before any study has been scored. The five
studies, their inputs and their bars are fixed here. Bars may be tightened later, never loosened; a miss is recorded
with its numbers and pinned by a test that asserts the miss. Every figure the kind reports is MODELLED. A bar that is
MET against an independent numerical program (numpy, scipy) checks the implementation of the stated formulas, not
the physics, and moves no ledger row to VALIDATED: no public external oracle for these quantities exists in the
repository.

## What this is and is not

Five studies of the Moon as infrastructure, in one kind (`kind = "lunar-infrastructure"`, field `study`):

| `study` | Question | Core method |
|---|---|---|
| `od-consistency` | Does orbit determination from an onboard receiver of Earth-GNSS signals in lunar orbit (NRHO, ELFO) agree with independent ground radiometric orbit determination, in the sense of their own covariances? | Linearised batch least squares on a reference CR3BP orbit, two measurement sets, Monte Carlo normalised-difference statistics |
| `carrier-phase` | Can the integer ambiguities of double-differenced carrier phase between a lunar surface station and an orbiter be resolved, and what does fixing buy? | Float normal equations by Schur complement, LAMBDA (`lambda::resolve`), bootstrapped and Monte Carlo success rates |
| `frame-coestimation` | What does a surface station plus orbiters add to the information about the seven-parameter lunar frame datum? | Fisher information of the Helmert datum from Earth-station ranging plus orbiter-to-surface ranging (`lunar_datum`, `fim`) |
| `space-tie` | What frame-tie precision does one spacecraft carrying GNSS, VLBI and laser-ranging payloads give, as a function of the local-tie error? | Fisher information of inter-technique Helmert offsets with the local tie as a marginalised nuisance |
| `geodesy-sensitivity` | How sensitive are lunar laser ranging, orbiter tracking, a surface gravimeter and a surface clock to the Love numbers h2, k2, l2 and to the physical libration? | Fisher information from analytic partials, checked by finite differences |

It is not a statement about any mission's performance, it uses no non-public information, and it is not affiliated
with or endorsed by any agency. No hardware is driven and nothing is transmitted. Advisory only.

## Sources (public; what was verified, and how)

Every value used from a source is an **input stated in the scenario**, labelled with its source or as ILLUSTRATIVE.
A value that could not be checked against the source is not used as if it were measured.

| Item | Source | Checked how |
|---|---|---|
| Lunar tidal Love number k2 = 0.024116 ± 0.000108 | F. G. Lemoine et al., "GRGM900C: A degree 900 lunar gravity model from GRAIL primary and extended mission data", Geophys. Res. Lett. 41(10), 3382 to 3389 (2014), doi 10.1002/2014GL060027 | Read on the PMC record (PMC4459205): the sentence "the degree 2 potential Love number k2 is 0.024116 ± 0.000108". Reference radius 1738 km (the expansion radius; the paper does not tie it to k2 specifically) |
| k2 = 0.02416 ± 0.00022 at one month, R = 1738 km (JPL and GSFC average) | J. G. Williams et al., "Lunar interior properties from the GRAIL mission", J. Geophys. Res. Planets 119 (2014) | Seen in the abstract text returned by a search; the full paper was not read |
| h2 and l2 | Lunar laser ranging analyses by Williams and co-workers solve for them; one 2020 geodesy paper states a model-derived h2 = 0.0424 and a seismic-model l2 of about 0.0106 | **Not verified against the papers** (the page could not be fetched). They are therefore used only as the **linearisation point** of ILLUSTRATIVE nominal values; the Fisher information of a linear tide model does not depend on the nominal h2 or l2, and no result is stated as a measurement of them |
| Earth-station positions DSS-14, DSS-63, DSS-43 | NAIF generic kernel comments `earthstns_fx_*.cmt` (naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/stations/), ITRF93, citing DSN document 810-005 module 301 | ITRF93 Cartesian values read from a search summary of the kernel listing: DSS-14 (-2353621.420, -4641341.472, 3677052.318) m, DSS-63 (4849092.518, -360180.348, 4115109.251) m, DSS-43 (-4460894.917, 2682361.507, -3674748.152) m |
| Two-way radiometric accuracy | Public summaries report X-band Doppler of about 0.03 to 0.1 mm/s at 60 s and range of about 1 to 10 m (a Caltech KISS workshop presentation; ISSFD 23 OD1_6; an LRO range requirement of 10 m 1σ in a NASA report) | Seen in search summaries only. The inputs below (5 m, 0.05 mm/s) lie inside those bands and are labelled ILLUSTRATIVE |
| Code-tracking variance | E. D. Kaplan and C. J. Hegarty (eds.), *Understanding GPS/GNSS: Principles and Applications*, 3rd ed. (2017), the DLL and PLL thermal-noise expressions | Textbook formula, implemented as stated |
| LAMBDA, bootstrapped success rate | P. J. G. Teunissen, "The least-squares ambiguity decorrelation adjustment", J. Geodesy 70 (1995) 65 to 82; "Success probability of integer GPS ambiguity rounding and bootstrapping", J. Geodesy 72 (1998) 606 to 616 | `lambda.rs` already implements both; the bootstrapped rate is a lower bound of the integer-least-squares rate |
| Earth-GNSS reception at lunar distance | `src/earth_gnss_lunar.rs` (its own sources) | Reused as is |
| Space-tie concept | Y. Bar-Sever et al., the GRASP concept: GNSS, SLR, VLBI and DORIS on one spacecraft with a 1 mm local-tie goal (COSPAR paper); the ESA Genesis mission (Delva et al. 2023), same four techniques, 1 mm and 0.1 mm/yr goals | Seen in search summaries. Used for the concept and the 1 mm local-tie scale of the baseline scenario, not for any computed number |
| Tidal displacement with Love numbers | IERS Conventions (2010), chapter 7 (the Earth form: radial displacement h2 times the tidal potential over g, horizontal l2 times its gradient over g) | Applied by analogy to the Moon with a stated radius and gravity; the Moon's tidal potential is `GM_E R² / d³ · P2(cos ψ)` |
| Gravimetric and tilt factors | Standard Earth-tide theory: gravimetric factor 1 + h2 − (3/2) k2, tilt factor 1 + k2 − h2 | Textbook identities, checked in code against independent evaluation |

No personal names appear in any shipped file; sources are cited as agencies, programmes and publications.

## What was seen before this was written (disclosed)

- The public code and documentation of the modules reused (`cr3bp`, `earth_gnss_lunar`, `lambda`, `fim`,
  `lunar_datum`, `lunar_identifiability`, `lunar_vlbi_fim`, `lunar_llr`, `lunar_time`, `lunar_gauge`).
- The numerical content of the verified source statements above.
- **Not seen:** any output of the new studies. The default scenarios below were chosen from the physics and the cited
  scales, not from a computed result.

## Common model and its stated simplifications

- Dynamics: the circular restricted three-body problem (`cr3bp`), Earth and Moon point masses, normalised units
  (length 384,400 km, time `SIDEREAL_MONTH_DAYS · 86400 / 2π` s). A reference orbit is a 9:2 southern NRHO
  (`differential_correct_halo` from the seed (x0, z0, ẏ0) = (1.0220, -0.1800, -0.1020), as the crate's own NRHO
  test) or an ELFO (a Moon-centred ellipse given by perilune altitude, apolune altitude and inclination, propagated
  in the CR3BP). No Sun, no lunar gravity harmonics, no ephemeris: stated, and the reason the `od-consistency`
  model-error case exists.
- Earth rotation axis is taken along the Earth-Moon orbit normal (no obliquity, no inclination of the lunar orbit);
  Earth rotates at 7.2921159e-5 rad/s inertially, the rotating frame at the lunar mean motion. A stated
  simplification of the ground geometry.
- The Moon is a sphere of radius 1737.4 km (occultation and horizon tests); the lunar body-fixed frame equals the
  CR3BP rotating frame (synchronous rotation, no libration) except in `geodesy-sensitivity`, where libration is a
  parameter.
- All stochastic draws use `ChaCha8` and the portable normal sampler; all new numerics use the portable math route so
  native and WebAssembly agree.

## Study 1: `od-consistency`

Truth: the reference orbit over `arc_days` from apolune (NRHO) or perilune (ELFO). Estimators, both linearised about the
reference orbit (a single Gauss-Newton step; the iterated estimator is the same to first order):

- **G, onboard Earth-GNSS:** pseudoranges to every Walker-constellation satellite that is trackable (the
  `earth_gnss_lunar` link rule: not occulted by the Earth, not behind the aperture, C/N0 ≥ threshold), every
  `sample_s`. Noise: code-tracking sigma from C/N0 by the Kaplan-Hegarty DLL expression with loop bandwidth `dll_bn_hz`,
  early-late spacing 1 chip, coherent time 20 ms, plus a signal-in-space error `sis_sigma_m`. Nuisance: receiver clock
  bias and drift, estimated.
- **R, independent ground radiometric:** two-way range and range-rate from DSS-14, DSS-63 and DSS-43 whenever the
  spacecraft is above `min_elevation_deg` and not occulted by the Moon, every `sample_s`, one station at a time.

The state is the six-vector at the arc start. Reported: the formal covariance of each estimate (position and velocity,
and the radial-transverse-normal position sigmas about the Moon), the difference of the two estimates, and over
`trials` seeded Monte Carlo draws the statistic `q = dᵀ (P_G + P_R)⁻¹ d` with `d = x̂_G − x̂_R`.

Default configuration (the committed example `lunar-infrastructure-od-consistency`):

```toml
kind = "lunar-infrastructure"
study = "od-consistency"
seed = 20261019

[orbit]
family = "nrho"
x0 = 1.0220
z0 = -0.1800
vy0 = -0.1020
arc_days = 3.0
sample_s = 600.0

[gnss]
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 2.0
tx_power_dbw = 13.4
tx_diameter_m = 0.35
tx_efficiency = 0.6
freq_hz = 1575.42e6
rx_gain_dbi = 12.0
system_temp_k = 290.0
tracking_threshold_dbhz = 25.0
dll_bn_hz = 0.25
sis_sigma_m = 1.0

[ground]
stations = ["DSS-14", "DSS-63", "DSS-43"]
range_sigma_m = 5.0
doppler_sigma_mm_s = 0.05
min_elevation_deg = 10.0
earth_rotation_phase_deg = 0.0

[monte_carlo]
trials = 400
model_error_accel_m_s2 = 0.0
```

The model-error example is the same with `model_error_accel_m_s2 = 3.0e-10` (a constant acceleration along the
rotating-frame +y axis that the estimators do not model, about 10 m of displacement over three days).

Bars (the example above; N = 400):

- **O1 (numerics oracle).** The 6×6 state-transition matrix of the corrected NRHO after 3 days and after one
  period equals the variational solution of an independent scipy DOP853 integration (rtol 1e-12, atol 1e-14) to a
  relative maximum entry error ≤ 1e-6.
- **C1 (statistical consistency, matched model).** The mean of `q` over the trials lies in [5.2, 6.8] (the
  expectation of χ²(6) is 6; the interval is about ±3 standard errors of the mean), and the fraction of trials with
  `q` ≤ 12.592 (the 95 % point of χ²(6)) lies in [0.925, 0.975].
- **C2 (formal covariance against the sample covariance).** For each estimator, the trace of the sample covariance of
  the six-vector error over the trials divided by the trace of its formal covariance lies in [0.85, 1.15].
- **C3 (the statistic detects an unmodelled acceleration).** In the model-error example the fraction of trials with
  `q` > 12.592 is at least 0.5.

Not claimed: that the formal sigmas are those of a real orbit determination; no number here is compared with a
published orbit determination result.

## Study 2: `carrier-phase`

A lunar surface station fixed in the rotating frame at a stated selenographic position and an orbiter on the reference
orbit both track the Earth-GNSS signals. Double differences between the two receivers cancel the receiver clocks and
most of the satellite clock and orbit error. Unknowns: the station position (3, body-fixed), the orbiter initial state
(6) and the double-difference ambiguities (one per satellite pair against the reference satellite). Observations:
double-difference carrier phase (sigma from the PLL thermal-noise expression with bandwidth `phase_bn_hz`) and
double-difference code (as study 1). The float ambiguity covariance is the Schur complement of the stacked normal
equations. LAMBDA gives the integer solution; the closed-form bootstrapped success rate and a Monte Carlo
integer-least-squares success rate (seeded draws from the float distribution) are reported per arc length, with
the baseline sigma before and after fixing.

```toml
kind = "lunar-infrastructure"
study = "carrier-phase"
seed = 20261019

[orbit]
family = "nrho"
x0 = 1.0220
z0 = -0.1800
vy0 = -0.1020
sample_s = 600.0
arcs_days = [1.0, 2.0, 3.0]

[surface]
lat_deg = 0.0
lon_deg = 0.0

[gnss]
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 2.0
tx_power_dbw = 13.4
tx_diameter_m = 0.35
tx_efficiency = 0.6
freq_hz = 1575.42e6
rx_gain_dbi = 12.0
system_temp_k = 290.0
tracking_threshold_dbhz = 25.0
dll_bn_hz = 0.25
phase_bn_hz = 1.0
sis_sigma_m = 0.5

[monte_carlo]
trials = 2000
```

Bars:

- **Q1 (bootstrapping is a lower bound).** For every arc, the Monte Carlo integer-least-squares success rate is
  ≥ the bootstrapped success rate minus three binomial standard errors.
- **Q2 (more data does not hurt).** The Monte Carlo success rate is non-decreasing in arc length within three
  binomial standard errors across the arcs of the example.
- **Q3 (linear-algebra oracle).** For the float design exported by the study, an independent numpy program
  recomputes the ambiguity covariance, the baseline covariance and the bootstrapped success rate (scipy.stats.norm);
  they agree with the Rust values to a relative 1e-9.
- **Q4 (search oracle).** For 200 random draws from the study's float distribution, the LAMBDA integer solution
  equals a brute-force enumeration over a box of ±6 integers around the rounded float solution (dimension ≤ 5).

Not claimed: that ambiguities can be resolved in practice. Whether the success rate is high or low in the example is
reported as found; the geometry changes slowly, so a low rate is a plausible result and is not a failure of a bar.

## Study 3: `frame-coestimation`

The seven-parameter Helmert datum of the lunar frame (`lunar_datum`: translation 3, scale 1, rotation 3) is estimated
from three technique families whose information is added:

1. **Earth-station ranging** to the five lunar retroreflectors (the existing `lunar_llr_geometry` stations and
   reflectors, per-observation sigma `llr_sigma_m`, `llr_epochs`).
2. **Surface stations** at stated selenographic positions (`stations`), each ranged by
3. **orbiters** (the reference orbit) whenever in line of sight, `orbiter_range_sigma_m`, `orbiter_epochs`.

The partial of a range with respect to the datum is `û · R · J_point` (`lunar_datum`), as in the existing LLR
identifiability code. Reported: the 7×7 information matrix with and without the orbiter links, its rank, the CRLB
sigma of each parameter, and the degeneracy metric of `lunar_identifiability`.

```toml
kind = "lunar-infrastructure"
study = "frame-coestimation"
seed = 20261019

[orbit]
family = "nrho"
x0 = 1.0220
z0 = -0.1800
vy0 = -0.1020
arc_days = 6.56
sample_s = 900.0

[llr]
sigma_m = 0.05
epochs = 200

[surface]
stations = [[-89.0, 0.0], [-45.0, 90.0], [0.0, 0.0], [30.0, -60.0]]
orbiter_range_sigma_m = 1.0
```

Bars:

- **F1 (information adds).** For the example and for each of 20 seeded random surface-station sets, the trace of the
  CRLB (inverse information, pseudo-inverse on the observable subspace) with the orbiter links is ≤ the trace without
  them, and the smallest eigenvalue of the information does not decrease.
- **F2 (partials oracle).** The analytic datum partials of the orbiter-to-surface range equal a central finite
  difference of the forward model computed by an independent numpy program (relative 1e-6) on 50 random geometries.
- **F3 (the orbiter links matter).** The smallest eigenvalue of the 7×7 information with the orbiter links is at
  least 2.0 times that without them in the example. (A hypothesis; a miss is recorded as NOT MET.)

## Study 4: `space-tie`

One spacecraft on the reference orbit carries a GNSS receiver, a VLBI beacon and a laser retroreflector; the local
vectors between their reference points are known to `local_tie_sigma_m` per axis (an ILLUSTRATIVE 1 mm in the
baseline, the scale of the public GRASP and Genesis goals). Each technique k observes the spacecraft position in its
own frame, `p_k(t) = (1 + s_k) R(θ_k) x(t) + t_k + local_k + noise`, with noise sigma `gnss_sigma_m`, `vlbi_sigma_m`,
`slr_sigma_m` per epoch. The unknowns are the seven Helmert offsets of each technique frame relative to the first
(14 parameters) and the three local-tie vectors (9 nuisance parameters, prior `local_tie_sigma_m`); the common
spacecraft position is eliminated. Reported: the CRLB sigma of every inter-technique offset (translations, scale,
rotations) and how it varies with the local-tie sigma and the arc.

```toml
kind = "lunar-infrastructure"
study = "space-tie"
seed = 20261019

[orbit]
family = "nrho"
x0 = 1.0220
z0 = -0.1800
vy0 = -0.1020
arc_days = 6.56
sample_s = 900.0

[techniques]
gnss_sigma_m = 10.0
vlbi_sigma_m = 1.0
slr_sigma_m = 0.1
local_tie_sigma_m = 0.001
```

Bars:

- **T1 (monotone in the local tie).** For `local_tie_sigma_m` in {0.001, 0.01, 0.1, 1.0} m every inter-technique
  translation sigma is non-decreasing.
- **T2 (floor).** With every technique sigma scaled by 1e-6, the translation sigma of each technique pair is
  within 1 % of the local-tie floor (the combined local-tie sigma of the pair, `√2 · local_tie_sigma_m`).
- **T3 (information oracle).** The information matrix of the example equals one assembled by an independent numpy
  program from the exported geometry, to a relative 1e-9.

## Study 5: `geodesy-sensitivity`

Parameters: h2, k2, l2 and two physical-libration amplitudes (longitude and latitude, one lunar month, radians).
Observable families, each with a stated sigma and epochs:

1. **Lunar laser ranging** to four reflectors from Earth stations: range change from the radial tidal displacement
   (`h2 · W2 / g`), the horizontal one (`l2`), and the libration rotation of the reflector position.
2. **Orbiter tracking:** the k2 tidal acceleration of the Earth's tide on an orbiter (the degree-2 formula of
   `lunar_od`), seen as a range-rate signature over the arc.
3. **Surface gravimeter:** tidal gravity with gravimetric factor `1 + h2 − 1.5 k2`.
4. **Surface clock rate:** the fractional rate change `(1 + k2 − h2) · W2 / c²` (the tie to the lunar time modules,
   `lunar_time` constants), of order `GM_E R² / (d³ c²)`.

```toml
kind = "lunar-infrastructure"
study = "geodesy-sensitivity"
seed = 20261019

[nominal]
h2 = 0.0424
k2 = 0.024116
l2 = 0.0106

[llr]
sigma_m = 0.05
epochs = 400

[orbiter]
sigma_mm_s = 0.05
arc_days = 27.3
sample_s = 3600.0

[gravimeter]
sigma_nm_s2 = 10.0
epochs = 1000

[clock]
sigma_fractional = 1.0e-16
epochs = 100
```

Bars:

- **G1 (partials).** Each analytic partial equals a central finite difference of its forward model to a relative
  1e-8 (on 50 random geometries and epochs).
- **G2 (information oracle).** The 5×5 information matrix of the example equals one assembled by an independent
  numpy program (finite-difference partials of its own forward model) to a relative 1e-6.
- **G3 (information adds).** Adding each observable family never decreases the smallest eigenvalue of the information
  and never increases the CRLB trace (all 15 subsets of the four families).
- **G4 (clock tie).** The amplitude of the tidal term of the surface-clock rate computed by the module equals the
  value from an independent numpy evaluation of `GM_E R² / (d³ c²)` for the stated constants to a relative 1e-9,
  and the module's rate sensitivity to `k2` equals `W2 / c²` and to `h2` equals `−W2 / c²`.

Not claimed: the nominal h2 and l2 are linearisation points; the study says what an observable is sensitive to, not
what the Love numbers are.

## Ledger and label

Each study gets a verification-matrix row, MODELLED. The rows say what the oracle bars check (numerics of the stated
formulas against an independent program) and that no measurement of any lunar quantity is compared with.
