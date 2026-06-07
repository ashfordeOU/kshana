# Changelog

All notable changes to Kshana are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
While the project is pre-1.0, the public scenario/result schema may still change;
breaking changes are called out explicitly.

## [Unreleased]

### Fixed
- **`raim::chi2_quantile` and the RAIM Stanford-noise sampler are now panic-free on
  out-of-range / non-finite inputs** (a `read_dir`-order-dependent fuzz finding from
  the new ARAIM scenarios). `chi2_quantile` now guards `p`/`k` like `normal_quantile`
  (returning a boundary value instead of `assert!`-panicking), and the availability
  Stanford-noise `Normal` clamps to a strictly-positive σ — so the integrity/ARAIM
  stack never panics on mutated or mis-configured scenarios.

### Added
- **First-class output frames for propagators (`src/orbit.rs` `Frame` enum +
  `position_in_frame` + `state_gcrs`).** Any `Propagator` (Kepler, SGP4, RINEX,
  GLONASS, SP3) can now emit its position in TEME, **GCRS** (≈ J2000), or **ITRS**
  (Earth-fixed) — TEME native, GCRS via the validated TEME→GCRS reduction, ITRS by
  chaining that into the IAU 2006/2000A CIO `gcrs_to_itrs` rotation — and its full
  GCRS state (position + velocity) via `state_gcrs`. The of-date inertial output is
  no longer TEME-only.
- **CIO-based IAU 2006/2000A celestial-to-terrestrial reduction (`src/cio.rs`).**
  The modern, equinox-free GCRS↔CIRS↔ITRS chain: CIP coordinates `X, Y` read off
  the IAU 2006/2000A bias-precession-nutation matrix (reusing the validated FW
  precession + 2000A nutation with the `eraNut06a` P03 adjustment), the 66-term
  CIO-locator `s` series (`eraS06`, machine-generated from the ERFA reference by
  `tools/gen_s06.py` into `src/cio_s06_data.rs`, bit-for-bit reproducible), the
  GCRS→CIRS matrix (`eraC2ixys`), the Earth rotation angle (`eraEra00`), and the
  full GCRS→ITRS rotation (`eraC2tcio`, composed with the existing IERS polar
  motion). Validated **bit-for-bit** against the published `eraXys06a`
  (X=0.5791308482835292617e-3, Y=0.4020580099454020310e-4,
  s=-0.1220032294164579896e-7 at JD_TT 2453736.5), `eraC2ixys`, and `eraEra00`
  test vectors. The CIO chain and the legacy equinox/GMST-1982 TEME reduction are
  shown to agree up to their documented ≈2·(equation of equinoxes) sidereal-time
  convention difference. This is the rigorous reduction the equinox/GMST path
  approximated.
- **Full IAU 2000A nutation series (`src/nutation.rs` `nutation_iau2000a`,
  `nutation_matrix_2000a`).** The complete MHB2000 model — 678 luni-solar + 687
  planetary terms — accurate to < 0.1 mas, alongside the existing 77-term 2000B
  truncation. The tables are machine-generated from the IAU SOFA / ERFA `nut00a`
  reference by `tools/gen_nut00a.py` into `src/nutation_iau2000a_data.rs` (the
  generator reproduces the committed file bit-for-bit), and the whole series —
  both the IERS-2003 and MHB2000 fundamental-argument sets and the planetary
  longitudes — is validated **bit-for-bit** against the published `eraNut00a`
  test vector (Δψ = −0.9630909107115518e-5, Δε = 0.4063239174001679e-4 at
  JD_TT 2453736.5, to 1e-13 rad). The default TEME→GCRS reduction keeps the 2000B
  series (~1 mas, below the chain's velocity-frame-rotation simplification);
  `nutation_matrix_2000a` exposes the < 0.1 mas of-date matrix for callers that
  need it.
- **Runnable lunar-integrity scenario (`kind = "lunar-integrity"`, `scenarios/lunanet-araim.toml`).**
  Wires the lunar south-pole protection-level pass (`src/lunar.rs` `LunarScenario` →
  `south_pole_hpl_pass`) into the scenario runner with a JSON `LunarReport` and an SVG
  HPL-vs-time chart, so the cislunar integrity case is reachable straight from the CLI.
  It honestly surfaces the gap: with the 30 m LANS σ_URE the south-pole HPL (≈ 260–450 m)
  exceeds a 50 m alert limit (0 % available) — lunar PNT integrity is not yet met.
- **Dual-constellation ARAIM availability on real GPS+Galileo TLEs, and scenario-runner
  wiring (`src/raim.rs`, `src/orbit.rs`, `scenarios/araim-gps-galileo.toml`).** Adds
  `araim_dual_constellation_availability` (the advanced ARAIM engine —
  single-satellite *and* constellation-wide faults — run over a time grid) and
  `visible_positions_labeled`, and wires it into the `IntegrityScenario` runner via an
  `araim_dual` flag so a multi-GNSS ARAIM study is reachable straight from TOML. A
  real-data test (`tests/araim_dual_real_data.rs`) on vendored 2026-06-07 Celestrak
  GPS+Galileo snapshots shows pooling Galileo lifts ARAIM availability from 0.21 to
  0.67 under a demanding 12 m VAL (10.5→21.8 satellites in view), while the
  constellation-fault-robust mode is fundamentally limited with only two constellations
  — the quantitative reason robust dual-constellation integrity drives toward a third
  constellation or SBAS. Honest residual: the numerically exact EU ARAIM TN Table A-3
  reproduction against a single version-locked epoch, and a Zenodo fixture record.
- **Circular restricted three-body problem (CR3BP) for the Earth–Moon system
  (`src/cr3bp.rs`).** A new cislunar-dynamics core the two-body/SGP4 propagators
  cannot provide: rotating-frame equations of motion (`cr3bp_accel`), an RK4
  propagator (`propagate_cr3bp`), the Jacobi-constant integral (`jacobi_constant`),
  and the five Lagrange points (`lagrange_points`). Validated against closed-form /
  published anchors: the Earth–Moon collinear points (L1 ≈ 0.83692, L2 ≈ 1.15568,
  L3 ≈ −1.00506), the exact equilateral L4/L5 = (½−μ, ±√3/2, 0), all five confirmed
  as field equilibria, Jacobi conserved to integrator precision under propagation,
  and the out-of-plane restoring force that makes halo/NRHO orbits possible. This is
  the foundation for representing a real NRHO. Honest residual: differential-corrected
  periodic 9:2 NRHO initial conditions, the eccentric/ephemeris (DE) model, and the
  de-normalised transform into the selenocentric frames of `src/lunar.rs`.
- **IERS polar motion and the TEME→ITRF reduction (`src/frames.rs`).** Adds
  `polar_motion_matrix` (SOFA `iauPom00`: `W = Rx(−y_p)·Ry(−x_p)·Rz(s′)` with the TIO
  locator `s′`), `pef_to_itrf` / `itrf_to_pef`, and `teme_to_itrf` — the GMST-based
  TEME→PEF rotation followed by polar motion — completing an ITRF-precise Earth-fixed
  position on top of the GMST-only `teme_to_ecef` (polar motion is a tens-of-metres
  effect at orbital radius). `x_p`/`y_p` are observed IERS quantities the caller
  supplies. Honest residual: a fully CIO-based (X, Y, s) chain and an ANISE/SPICE
  <10 m numerical cross-check remain follow-ons.
- **Cold-atom-interferometer systematics, drift sweep, and a published-device
  validation (`src/inertial/quantum_imu.rs`, `docs/QUANTUM.md`).** Extends the
  first-principles CAI accelerometer with the two leading deterministic systematics:
  the **Coriolis/rotation** phase `Φ_cor = 2·k_eff·v_⊥·Ω·T²` (`coriolis_phase`, with
  the equivalent acceleration bias `2·Ω×v` via `coriolis_accel_bias`) and the
  **AC-Stark light-shift** phase `Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff` (`ac_stark_phase`,
  which cancels by π/2–π–π/2 symmetry for a constant shift). Adds `cai_drift_sweep`
  (dead-reckoning position drift vs cycle time — the core of a quantum-vs-classical
  comparison) and a validation test against the Freier et al. 2016 mobile gravimeter
  (arXiv:1512.05660): the modelled quantum-projection-noise floor lies below, and
  within ~2 orders of, the published 96 nm/s²/√Hz short-term noise. `docs/QUANTUM.md`
  updated. Honest residual: wavefront/beam-pointing systematics, fringe-ambiguity
  resolution, the exact CARIOQA-PMP / Boeing-AOSense flight-test reproduction (needs
  published platform PSDs), and a JS playground preset.
- **Cislunar frame reduction and a lunar south-pole integrity pass (`src/lunar.rs`).**
  Extends the lunar ARAIM engine with the MCI↔MCMF (Moon-centered inertial ↔
  Moon-fixed) rotation (`mci_to_mcmf` / `mcmf_to_mci`, a simplified mean-rotation
  model at the lunar sidereal rate), selenographic latitude/longitude/altitude
  (`mcmf_to_selenographic` / `selenographic_to_mcmf`), and `south_pole_hpl_pass` —
  a landed Artemis-region receiver against a representative LunaNet relay set over a
  24 h pass, which honestly quantifies the integrity gap: with the nominal 30 m LANS
  σ_URE the protection level is finite but exceeds a 50 m surface-ops alert limit.
  Honest residual: the precise LANS NRHO ephemeris (a 3-body cislunar orbit), the
  physical libration / precessing lunar pole (DE421/SPICE), and a LunaNet TOML
  scenario remain follow-ons.
- **ARAIM integrity support message, Stanford-diagram SVG, and the open ARAIM
  reference (`src/raim.rs`, `docs/ARAIM_REFERENCE.md`).** Adds an explicit
  `IntegritySupportMessage` (σ_URA / σ_URE / b_nom / P_sat / P_const, with the WG-C
  GPS+Galileo reference values and `.fault_priors()` / `.dual_fault_priors()`
  converters into the single-fault `araim_raim` and constellation-wide
  `araim_dual_raim` engines), a standalone `stanford_svg` renderer of the Stanford
  integrity diagram (the four zones, the `PL = error` boundary, the alert-limit
  guides, one colour-coded marker per epoch), and `docs/ARAIM_REFERENCE.md`
  documenting the algorithm, the ISM, the fault hypotheses, the protection-level
  contract, and the dual-constellation benefit. Tests demonstrate the
  geometry/redundancy gain (pooling a second constellation tightens the single-fault
  HPL) and constellation-fault tolerance (the dual user survives losing a whole
  constellation; a single-constellation user cannot). Honest residual: numerically
  reproducing the EU ARAIM TN Table A-3 / the 15–25 % availability figure against a
  version-locked real TLE snapshot, a Zenodo fixture record, and wiring
  `araim_dual_raim` into the scenario-file runner.
- **IAU 2000B nutation and the full TEME→GCRS/J2000 inertial reduction
  (`src/nutation.rs`).** Adds the second and third pieces of a true inertial frame
  reduction on top of the shipped IAU 2006 precession: the 77-term luni-solar MHB2000
  nutation series (`nutation_iau2000b`, the standard IAU 2000B truncation accurate to
  ~1 mas) with the Delaunay fundamental arguments and the SOFA `iauNumat` nutation
  matrix, and the Vallado AIAA-2006-6980 chain TEME→TOD (equation of the equinoxes) →
  TOD→MOD (nutation) → MOD→GCRS (bias-precession) exposed as `teme_to_gcrs(r, v, jd_tt)`
  / `gcrs_to_teme`. The series, arguments and unit constants are transcribed from the
  IAU SOFA / ERFA `nut00b` reference and validated **bit-for-bit** against the published
  `eraNut00b` test vector (Δψ, Δε to 1e-13 rad). Honest residual: the full IAU 2000A
  678-term series (<0.1 mas), an ANISE/SPICE <10 m numerical cross-check, and polar
  motion remain follow-ons (see `ROADMAP.md`).

## [0.12.0] - 2026-06-06

This release lands Kshana's first **non-analytic orbit propagator** — a Cowell
integrator with a hierarchical six-perturbation force model (two-body + J2–J6 zonal +
epoch-driven Sun/Moon third body + solar-radiation pressure with a conical
umbra/penumbra shadow + atmospheric drag + the post-Newtonian Schwarzschild relativistic
correction) driven by a choice of two adaptive integrators (RK4 step-doubling and the
Dormand–Prince RK5(4) embedded pair) — alongside a maneuver / trajectory-design layer
(impulsive and finite burns, an Izzo Lambert solver, and a porkchop sweep), a
gravity-map-matching alt-PNT layer that recovers a 60-minute GPS-denied track to under
500 m, a batch + sequential orbit-determination pipeline, and a full 17-state
tightly-coupled GNSS/INS UKF with quantum-CAI dead-reckoning. Every numerical capability
is pinned against analytic truth or a hand-derived closed form; the off-by-default
perturbations leave the released goldens untouched.

### Added
- **Post-Newtonian (Schwarzschild) relativistic correction (`forces::relativistic_accel` +
  `propagator::ForceModel::relativity`).** Adds the dominant general-relativistic perturbation on a
  near-Earth orbit — the leading driver of the relativistic perigee advance — in the IERS /
  Montenbruck–Gill `β = γ = 1` form `a = (μ/c²r³)·{[4μ/r − v²]·r + 4(r·v)·v}`. Like atmospheric
  drag it is **velocity-dependent**, so it rides the `(r, v)` integrator RHS via
  [`accel_rv`], opt-in and off by default. Validated self-contained: on a circular orbit it
  collapses to the closed form `3μ²/(c²r³)·r̂` (purely radial and **outward**, off-axis components
  exactly zero); its **ratio to two-body is the textbook `≈1.9·10⁻⁹` at LEO** (the `μ/(c²r)`
  signature); a radial-velocity case matches the hand-simplified `μ(4μ + 3v²r)/(c²r³)`; and in the
  propagator it **perturbs the orbit without dissipating it** — the semi-major axis is conserved to
  well under a metre/day, the structural opposite of drag's monotonic decay. Because it is off by
  default the two-body/J2/zonal goldens are untouched. PPN-parameter (`β`,`γ`) tuning and the
  Lense–Thirring frame-dragging term remain follow-ons.
- **Conical umbra+penumbra shadow model (`forces::conical_shadow`), now used by solar-radiation
  pressure.** Upgrades the binary umbral-cylinder eclipse to a smooth `ν ∈ [0,1]` factor: the Sun
  and Earth are modelled as disks of apparent angular radii `a = asin(R☉/d☉)`, `b = asin(Rₑ/|r|)`
  with apparent centre separation `c`, and `ν` is one minus the fraction of the Sun's disk occulted
  by the Earth's disk (the circle–circle lens-overlap area) — full sun for `c ≥ a+b`, total umbra
  for `c ≤ b−a`, annular for `c ≤ a−b`, and a continuous penumbra in between. `srp_accel` now uses
  it, so the SRP force tapers smoothly through eclipse instead of switching on/off. Adds the IAU
  nominal `forces::SOLAR_RADIUS`. Validated self-contained: `ν = 1` in full sun and `ν = 0` deep in
  the umbra (exact), a **smooth monotonic penumbra** (`ν` rises 0 → ~½ at `c = b` → 1 across the
  `[b−a, b+a]` band), and the conical penumbra **extends beyond the umbral cylinder** (a point the
  binary cylinder calls fully lit is `0 < ν < 1` for the cone). The simpler `cylindrical_shadow`
  remains available; solar limb darkening and the oblate-Earth shadow remain follow-ons.
- **Dormand–Prince RK5(4) embedded integrator (`integrator::dopri54_step` /
  `integrator::integrate_dopri` + `propagator::propagate_dopri`).** Adds the standard
  Dormand–Prince (1980) embedded Butcher-tableau pair alongside the existing RK4 step-doubling
  driver: seven FSAL stages yield a 5th-order solution and a 4th-order error estimate from one set
  of evaluations (7 vs 11 function calls per step), a cheaper local-error estimate. The adaptive
  driver reuses the same RMS-error norm and `0.9·(1/err)^(1/5)` step controller, so it is a drop-in
  alternative; `propagator::propagate_dopri` exposes it on the orbit force model. Validated
  self-contained: the embedded error estimate is **O(h⁵)** (halving the step cuts it ~32×); DP5(4)
  integrates `y' = y` to `e` and the harmonic oscillator over 50 periods conserving energy to
  <1e-6; it reaches the same endpoint at the same tolerance in **fewer function evaluations** than
  step doubling (without sacrificing accuracy); and `propagate_dopri` clears the same analytic-truth
  gate as the RK4 path — **sub-metre against the exact universal-variable Kepler solution over a
  24 h LEO orbit** — while the two drivers agree to <1 m on a J2..J6 orbit (no closed form). Higher
  embedded pairs (RKF7(8) / DOP853) remain a follow-on.
- **Atmospheric drag wired into the propagator as its first velocity-dependent force
  (`forces::atmospheric_density` + `forces::drag_accel` + `propagator::ForceModel::drag`).** Adds
  the **Vallado Table 8-4 piecewise-exponential** atmosphere `ρ = ρ0·exp(−(h−h0)/H)` (28 bands from
  sea level past 1000 km, clamped below the surface) and the quadratic drag
  `a = −½ · ρ(h) · (C_D·A/m) · |v_rel| · v_rel` against the **co-rotating atmosphere**
  `v_rel = v − ωₑ ẑ × r` (`forces::EARTH_ROTATION_RATE = 7.2921151467e-5`). Because drag depends on
  velocity, `ForceModel` gains a new `accel_rv(t, r, v)` and the integrator RHS now passes velocity
  (`f(t,[r;v]) = [v; a(t,r,v)]`); the position-only `accel_at` is unchanged, so the conservative
  terms and goldens are untouched. Validated self-contained: the density **anchors at the
  1.225 kg/m³ sea-level value**, clamps below the surface, **decreases monotonically** through LEO,
  sits in the solar-mean ~1e-12 kg/m³ band at 400 km, and its **recovered local scale height
  (≈ 58 km at 400 km)** is physical; drag **opposes the co-rotating relative velocity** at the
  ~2e-6 m/s² LEO magnitude for `C_D·A/m = 0.02 m²/kg`; and — the key signature — drag is
  **dissipative**: a 300 km orbit loses specific energy **monotonically** and its semi-major axis
  **decays a bounded ~km/day**, where the vacuum baseline conserves energy to <1e-9. The
  NRLMSISE-00 thermospheric density (the < 5 % drag-density clause) remains a follow-on.
- **Solar-radiation pressure wired epoch-driven into the propagator force model
  (`forces::srp_accel` + `propagator::ForceModel::solar_radiation`).** Adds the **cannonball SRP
  model** `a = ν · P☉ · cᵣ · (A/m) · (AU/d)² · d̂` with a **cylindrical-shadow eclipse factor**
  (`forces::cylindrical_shadow`, ν ∈ {0,1}): the radiation pressure `P☉ = Φ☉/c` from the modern
  1361 W/m² total solar irradiance (≈ 4.5398·10⁻⁶ N/m²), the inverse-square `(AU/d)²` flux fall-off,
  and the radial push **away from the Sun**. It rides the **same epoch-driven RHS** as the third
  body, sampling the `ephem` Sun once at the advanced epoch `epoch_jd_tt + t/86400` shared between
  the Sun third body and SRP. Composable:
  `with_zonals_j2_j6().third_body(true, true, epoch).solar_radiation(1.5, 0.02)`. Validated
  self-contained against hand-derived signatures: the **1-AU radiation pressure pins to its textbook
  ≈ 4.5398·10⁻⁶ N/m²**; a fully-lit LEO sat's SRP is **bit-identical** to the cannonball formula,
  points **away from the Sun**, and sits in the **~1.36·10⁻⁷ m/s² band** for cᵣ = 1.5, A/m = 0.02
  m²/kg; **doubling the Sun distance quarters the magnitude** (inverse-square); the **cylindrical
  shadow eclipses only the umbral cylinder** (anti-sunward *and* within one Earth radius of the
  Earth–Sun line) and yields **exactly zero** SRP in eclipse; and in the propagator SRP **perturbs
  a LEO orbit by a small bounded amount that scales ~linearly with A/m** — while a model with no
  perturbations stays bit-for-bit time-independent, leaving the two-body/J2/zonal goldens untouched.
  The conical umbra/penumbra (smooth ν ∈ [0,1]), atmospheric drag, and external GMAT/Orekit
  cross-validation remain follow-ons.
- **Epoch-driven Sun/Moon third body wired into the time-varying propagator RHS
  (`propagator::ForceModel::third_body` / `accel_at`).** The third-body perturbation is no longer a
  standalone force term — it is now integrated by the Cowell propagator as a genuinely *time-varying*
  force: each RHS evaluation samples the `ephem` Sun/Moon positions at the **advanced epoch
  `epoch_jd_tt + t/86400`** (reusing `precession::julian_centuries_tt` for the day↔century
  conversion), so the perturbers move along their orbits during the integration rather than being
  frozen at the start. Composable with any gravity model
  (`ForceModel::with_zonals_j2_j6().third_body(true, true, epoch)`). Validated self-contained:
  the RHS Sun term is **bit-identical** to `third_body_accel` evaluated at the ephemeris position for
  that instant at both `t = 0` and `t = 1 day` (proving the 86400 s ↔ 1 day ↔ 1/36525 century
  wiring exactly), the perturber **advances ~2.6·10⁹ m/day** between samples (not frozen), the
  **instantaneous LEO tidal magnitudes** hit the textbook ~5·10⁻⁷ m/s² (Sun) and ~1.1·10⁻⁶ m/s²
  (Moon, ≈ 2× the Sun) bands, each body **measurably perturbs the day-long trajectory while staying
  bounded**, and the same initial state propagated at **epochs a quarter-year apart yields a
  different trajectory** (the tidal axis rotates 90°) — while a model with neither body enabled is
  bit-for-bit time-independent, leaving the two-body/J2/zonal goldens untouched. DE-grade ephemeris
  accuracy and external GMAT/Orekit cross-validation remain follow-ons.
- **Low-precision Moon ephemeris (`ephem::moon_position`), completing the Sun/Moon third-body pair.**
  Adds the Montenbruck & Gill low-precision lunar series (`§3.3.2`) alongside the Sun model, so the
  body-agnostic `forces::third_body_accel` can now be driven by either luminary with **no external
  DE/SPK kernel**. Validated self-contained against hand-derived lunar signatures: the geocentric
  distance stays inside the real **perigee/apogee envelope (~356 500–406 700 km)** over a month and its
  **monthly mean recovers the ~384 400 km semi-major axis**; the **ecliptic latitude never exceeds the
  ~5.3° lunar-orbit inclination** (checked by projecting onto the ecliptic pole in equatorial
  coordinates, validating the latitude series and the obliquity rotation together); the Moon's
  **direction returns to within 1° after one sidereal month (27.3217 d)** and its **daily motion stays
  in the physical 12–15°/day band**; and the lunar third-body perturbation on a LEO satellite has the
  **textbook ~1.1·10⁻⁶ m/s² magnitude** (≈ twice the Sun's). DE-grade position accuracy, atmospheric
  drag, and SRP remain follow-ons.
- **Third-body (Sun) gravity with a built-in low-precision ephemeris (`forces::third_body_accel`,
  `ephem::sun_position`).** Adds the third-body perturbation to the force model:
  `a = GM₃·((s−r)/|s−r|³ − s/|s|³)` (direct attraction minus the indirect term the geocentric
  frame must subtract), with the Sun position supplied by the new `ephem` module's
  Montenbruck & Gill low-precision analytical series — **no external DE/SPK kernel needed** for a
  low-fidelity run. Validated self-contained: the acceleration **matches the exact gradient of its
  own disturbing potential** (`third_body_potential`), the perturbation **vanishes at the geocentre**
  and has the **textbook ~5·10⁻⁷ m/s² magnitude on a LEO satellite**, and the Sun ephemeris hits
  hand-derived J2000 anchors — **perihelion distance ≈ 1.471·10¹¹ m**, **declination ≈ −23° near the
  December solstice**, an apparent motion of **≈ 1°/day** (≈ 90° per quarter-year), and a distance
  that stays inside the 0.983–1.017 AU Earth-orbit envelope across a full year. Delivers the
  third-body half of the numerical-propagator milestone's force-model step (the Moon is delivered in a
  companion entry above); DE-grade position accuracy, atmospheric drag, and SRP remain follow-ons.
- **J2–J6 zonal-harmonic force model (`forces::zonal_accel` / `zonal_potential`).** Extends the
  Cowell propagator's force model beyond J2 to the full Earth zonal field through degree 6 (the
  standard published EGM-96 unnormalised `J2..J6`), wired into the propagator as
  `ForceModel::with_zonals_j2_j6()`. The acceleration is the **exact analytic gradient** of the zonal
  disturbing potential `R(r) = −(μ/r)·Σ Jₙ(Re/r)ⁿPₙ(z/r)` (Legendre polynomials by upward recurrence),
  validated three independent ways: it **reduces to the 666-vector-validated `j2_accel` to machine
  precision** when restricted to `[J2]`; it **matches the numerical gradient of its own potential**
  through the full J2..J6 field (the conservative-field gold-standard check); and the odd `J3` vs even
  `J2`/`J4..J6` terms exhibit their **characteristic north–south (anti)symmetry** under `z → −z` — the
  pear-shape asymmetry. A propagated J2..J6 orbit conserves total energy (kinetic + central + zonal
  potential) to ~1e-8 over a day and perturbs the J2-only orbit by a small non-zero amount. This
  delivers step-2 ("J2–J6 zonal harmonics") of the numerical-propagator milestone; the high-degree EGM
  tesseral field, drag, SRP, third-body, and external GMAT/Orekit cross-validation remain follow-ons.
- **Numerical (Cowell) orbit propagator (`src/propagator.rs`).** Kshana's first **non-analytic**
  propagator (the rest of the orbit stack is analytic SGP4/SDP4): it wires the two-body + J2 force
  model (`src/forces.rs`) into the adaptive step-doubling RK4 driver (`src/integrator.rs`) as
  `f(t,[r;v]) = [v; a(r)]`, with a `ForceModel` toggle. Validated against **analytic truth that is
  stronger than a numerical cross-tool would be**: the unperturbed orbit reproduces the **exact
  universal-variable Kepler solution to sub-metre over a 24-hour LEO orbit** (a tighter gate than
  the "vs a numerical reference < 10 m" the milestone phrases), specific energy and angular momentum
  conserve to ~1e-9 relative, and the J2 nodal regression reproduces the closed-form `j2_secular_rates`
  to first-order theory (within 2 %, the O(J2²) residual). Also adds `solve_kepler_checked`, a Newton
  solver for Kepler's equation that **returns `Err` instead of a silently-wrong answer** when it fails
  to converge within a bounded iteration budget (the near-perigee `e = 0.999` case). Honest scope: the
  force model is two-body + J2 only — the high-degree EGM tesseral field (200×200 + loader), drag
  (NRLMSISE-00), SRP, third-body forces, and an external GMAT/Orekit cross-validation remain follow-ons.
- **60-minute GPS-denied gravity-map matching to < 500 m (`run_gps_denied_gravity_nav`).**
  Deepens the alt-PNT layer to the ESA NAVISP *Quantum Wayfarer* validation target: a vehicle
  flies a ~700 km track for a full one-hour GNSS outage — its inertial solution drifting to
  **≈ 70 km** — and a cold-atom gravimeter plus a **hierarchical coarse-to-fine** particle/grid
  matcher recovers the constant INS drift to **≈ 145 m** (< 500 m), a > 480× cut. The gravimeter's
  real white-noise floor is injected as a **deterministic seeded** sequence, so the matcher is
  never handed noise-free truth yet the run is exactly reproducible (verified bit-identical, and
  stable to a few metres across noise realisations). A regression-grade test shows the refinement
  is *necessary* — a single coarse grid stalls at ~2 km, only the three-stage refinement breaks
  the 500 m barrier. New committed scenario `scenarios/gps-denied-gravity-nav.toml`. The
  `docs/CAPABILITY.md` row stays honestly **partial** (still no bundled EGM2008 map) with its
  evidence updated to the 60-min < 500 m result. Honest scope unchanged: low-degree
  spherical-harmonic field + synthetic mascons; a Monte-Carlo over map-representation-error
  realisations is a follow-on.
- **Overclaim ledger + regression guard (`docs/CLAIMS-VS-REALITY.md`, `tests/no_overclaims.rs`).**
  Closes the honesty/de-claim track: the fourteen overclaims an earlier audit catalogued
  (`OC-0`…`OC-13`) are now all GREEN — the strong claims (`OC-0` coupled clock+position Kalman,
  `OC-2` jamming J/S→C/N₀→loss-of-lock, `OC-7` Mach–Zehnder CAI physics, `OC-8` ARAIM HPL/VPL)
  are **superseded by shipped, tested capabilities** rather than softened wording, and the
  remaining rows are de-claimed to match the code. A new CI test scans the live public surfaces
  (`README`, `CAPABILITY`, `GLOSSARY`, `web/`) and fails if any retired bare overclaim phrase
  reappears uncaveated, so a GREEN row cannot silently regress. The per-run "integrity" FoM stays
  honestly labelled *filter self-consistency* (not aviation integrity); the real ARAIM HPL/VPL is
  surfaced separately so the two are never conflated.
- **Gravity-map-matching navigation (GPS-denied alt-PNT).** New `src/gravimeter.rs` adds the
  alt-PNT capability layer ESA NAVISP's *Quantum Wayfarer* / QT-CCI gravity-map-matching studies
  call for: a cold-atom **gravimeter measurement model** whose white-noise floor is derived from
  the CAI accelerometer ASD (`σ = ASD/√τ`); a low-degree, fully-normalised **spherical-harmonic
  gravity-anomaly field** (validated against the closed-form Legendre functions `P̄₁₁=√3·cosφ`,
  `P̄₂₀=(√5/2)(3sin²φ−1)`, `P̄₂₂=(√15/2)cos²φ` and a hand-derived single-term anomaly of
  1.897 mGal) plus synthetic **mascons** for the high-degree local features; and a
  **gravity-map-matching particle filter** (composing `mapmatch` + `particle_filter`) that
  recovers a GPS-denied track from the anomaly sequence it flies through. A committed NAVISP
  benchmark (`scenarios/gravity-map-nav.toml`) cuts a ~73 km free-inertial drift to a few km.
  Honest scope: Kshana does **not** bundle the full EGM2008 2190° coefficient set — the field is
  low-degree + mascons, not a real high-resolution map; the EGM/EIGEN loader, magnetic map,
  terrain-aided SLAM, and scenario-engine `kind=` wiring with an SVG drift chart remain follow-ons.
  `docs/CAPABILITY.md` "Gravity-map / alt-PNT navigation" → **partial**.
- **Maneuver modeling and trajectory-design beachhead.** New `src/maneuver.rs` adds the first
  trajectory-design layer above SGP4: impulsive ΔV nodes that apply a velocity discontinuity and
  carry a 6×6 covariance forward (deterministic burn ⇒ identity state-transition; the
  execution-error covariance rotates from the burn frame — ECI or LVLH — into the velocity block),
  a finite-burn integration (constant thrust over a burn arc with mass as a state) whose achieved
  ΔV is checked against the closed-form **Tsiolkovsky** rocket equation to better than 0.01 %, an
  **Izzo-2015** single-revolution **Lambert** solver (`r1`, `r2`, time-of-flight ⇒ `v1`, `v2`),
  an exact universal-variable **Kepler propagator** (two-body truth), and a **porkchop** sweep that
  maps a launch-epoch × arrival-epoch grid to departure C3 and arrival V∞, emitted as a 2-D JSON
  array for browser contour rendering. Validation is self-contained and stronger than a tutorial
  read-out: every Lambert output is round-tripped through the Kepler propagator (it must land back
  on `r2`), and the porkchop minimum is checked against the analytic Hohmann-transfer C3 floor for
  two coplanar circular orbits. Kshana positions this as the performance-simulation layer above
  GMAT/Orekit, not a replacement (multi-revolution branches and a real planetary ephemeris remain
  out of scope). Ten tests.
- **Full 17-state tightly-coupled GNSS/INS UKF with quantum-CAI dead-reckoning.** New
  `src/fusion/tightly_coupled17.rs` carries the complete inertial-navigation state a
  tightly-coupled filter estimates — `[position, velocity, attitude-error, accelerometer
  bias, gyro bias, clock bias, clock drift]` (17 states) — propagated through the strapdown
  mechanization driven by the measured specific force and angular rate, with the small-angle
  `C ≈ I + [ψ×]` body→inertial rotation so attitude error couples into horizontal acceleration
  (the standard INS tilt coupling). During a GNSS outage it coasts on the IMU alone; the
  velocity-random-walk process noise is the cold-atom-interferometer accelerometer's derived
  `q_va` (`crate::inertial::quantum_imu`), so the dead-reckoning drift is the quantum-sensor
  limited one — a 120-second outage stays bounded to a few hundred metres versus the kilometres
  a navigation-grade free INS would reach. The pseudorange/range-rate update runs through the
  shared unscented filter (with α = 1 for well-conditioned weights at this state size). Five
  tests: measurement-model identity, perfect-IMU constant-velocity integration, GNSS aiding,
  accelerometer-bias estimation, and the CAI-limited 120-s outage benchmark.

## [0.11.0] - 2026-06-05

### Changed
- **Honest framing for the quantum positioning.** The headline descriptor is now a
  **"PNT-resilience simulator with quantum-sensor performance models"** consistently
  across the README tagline, citation line, `CITATION.cff` (title + abstract), and
  the banner artwork — replacing the looser "hybrid quantum/classical PNT simulator"
  marketing phrasing. The README's *What it is / is not* section gains an explicit
  **"It is not (yet)"** scope statement (not a first-principles atom-interferometry
  physics engine, not a GNSS receiver/PVT solver, not a mission-design tool), and a
  new top-level [`ROADMAP.md`](ROADMAP.md) makes the **Quantum physics layer a P2
  item** (Mach–Zehnder CAI phase, projection noise, vibration tensor) so readers know
  the first-principles physics is scoped-and-coming, not abandoned. No behaviour or
  API change.

### Added
- **Constellation-design trade study: Walker design sweep with a Pareto front, revisit-time
  JSON, and a sub-kilometre Walker-formula validation.** `src/walker.rs` gains
  `walker_design_sweep`, which runs a `planes × sats_per_plane` grid (e.g. a 3×3 trade) at a
  fixed inclination and tabulates, per design, the coverage fraction, worst-case PDOP, and the
  max/mean revisit gap; `pareto_front` flags the non-dominated designs (fewer satellites, more
  coverage, lower PDOP, shorter revisit), and `WalkerDesignReport::to_json` serialises the cells
  and Pareto front — revisit-time fields included — as JSON. New validation pins the generator to
  the Walker `i:T/P/F` formula: same-slot satellites in adjacent planes are shown to map onto one
  another by an exact `R_z(2π/P)` rotation to **under 1 km over a full 24 h** of SGP4 propagation
  (the J2 short-period breathing is common-mode and cancels), and the in-plane slots are confirmed
  spaced `2π/S` in the mean. Builds on the committed real Celestrak `gps-ops` 2021-07-28 snapshot
  (`scenarios/orbit-sgp4-gps.toml`, exercised by the scenario-coverage and SP3 round-trip tests).
- **Advanced time-and-frequency transfer: TWSTFT, GNSS common-view, PPP, optical, IEEE-1139
  power-law fit, and a clock ensemble.** New `src/timetransfer_adv.rs` builds the operational
  transfer methods on the shipped Sagnac/common-view closed forms and the Allan-stability tools.
  `twstft_sagnac` gives the Two-Way Satellite Time and Frequency Transfer Sagnac correction as the
  three-hop loop sum, equal to the BIPM closed form `Δt = 2·A·ω_E/c²` exactly (cross-checked by the
  independent `twstft_sagnac_bipm`); `run_twstft` emits a one-day `T_A − T_B` series and its TDEV.
  `gnss_common_view_series` single-differences two synthetic ground stations so the satellite clock
  cancels. `iono_free_combination` + `ppp_receiver_clock` are the PPP ionosphere-free combination and
  receiver-clock solve against an SP3-grade (synthetic) truth, cancelling the first-order ionosphere
  exactly. `rytov_variance`, `fried_parameter`, and the unit-mean `lognormal_fading` model a free-space
  optical link's turbulence-induced scintillation. `fit_power_law_psd` is a full IEEE-1139 five-coefficient
  `h_α` least-squares fit of the Allan-variance curve (all five canonical noise processes at once) with the
  dominant process reported per τ-decade. `ensemble_timescale` forms an inverse-variance-weighted paper
  timescale whose Allan deviation falls strictly below the best contributing clock. 31 unit tests;
  validation targets are closed forms and synthetic truth — a real BIPM Circular-T / IGS SP3 ingest remains.
- **IONEX ionosphere maps: file parser, time interpolation, and slant obliquity mapping.** `src/ionex.rs`
  gains `parse_ionex`, which reads the IONEX file format (header grid definition + `START/END OF TEC MAP`
  blocks) into a sequence of `IonexMap`s — normalising the file's north-to-south latitude ordering into a
  positive-step `TecGrid` and scaling values by `10^EXPONENT`. `interpolate_tec_in_time` blends two
  successive maps to a query epoch, and `obliquity_factor` / `slant_tec` map the vertical TEC onto a slant
  ray via the single-layer thin-shell factor `M(z) = 1/cos z′` (`sin z′ = (Rₑ/(Rₑ+H))·sin z`). Together
  with the shipped grid model these turn a measured IGS global ionosphere map into a usable slant delay.
- **Constellation design: streets-of-coverage sizing + multi-constellation comparison.** `src/walker.rs`
  gains `min_satellites_streets_of_coverage`, an idealised streets-of-coverage minimum-satellite solver —
  from the shipped coverage half-angle `λ` and street half-width `c` it sizes the near-polar constellation
  for continuous single global coverage as `p = ⌈π/(2c)⌉` planes (e.g. a GPS-altitude 4-satellite plane
  needs 2 planes, 8 satellites), and reports `None` when the satellites are too sparse to form a continuous
  street. `compare_constellations` is the multi-constellation comparison tool: it scores each named Walker
  design on the same station/window via `pdop_sweep` and returns their coverage / PDOP / size side by side.
  Honest scope: the seam-exact Rider correction at the counter-rotating plane boundary and a 3-D coverage
  globe are follow-ons.
- **Multi-layer spoof detection: RAIM-consistency parity detector + layer fusion.** `src/spoof_monitors.rs`
  gains the third and final detection layer and the fusion stage: `parity_raim_test` least-squares-fits
  the position/clock solution to a redundant pseudorange set and tests the leftover weighted residual
  sum-of-squares against its χ²`(m−4)` threshold — flagging a biased *subset* of satellites while
  correctly leaving a *common-mode* bias (absorbed by the receiver clock) RAIM-invisible, not papered
  over. `fuse_spoof_layers` combines the parity, AGC and SQM layers into one weighted decision that
  records which layers fired. A Monte-Carlo characterises the detector: empirical **P_fa ≈ 0.068**
  against a 0.05 design point, with **missed-detection falling from 0.885 at a 2σ spoof bias to 0.16 at
  8σ**. Honest scope: cross-validation against specific published (Spirent / ION GNSS+) spoofing test
  vectors needs those external datasets and remains a follow-on.
- **Coupled-vs-decoupled Kalman validation ensemble.** A 100-trial Monte-Carlo in
  `src/fusion/coupled.rs` quantifies the value of carrying the position↔clock cross-covariance: a
  faithful inline decoupled baseline (validated bit-for-bit against the shipped `CoupledPntFilter`)
  processes the same data with the cross blocks zeroed, and after near-degenerate pseudoranges plus a
  clock-only fix the coupled filter recovers position to **2.97 m RMS versus the decoupled filter's
  48.8 m, winning 97 of 100 trials** — the clock fix sharpens position only through the correlation
  the decoupled pack discards. This completes the Kalman-correctness validation suite (Joseph form,
  PSD safety, NEES/NIS consistency, and now the coupled-filter ensemble).
- **Orbit determination pipeline (batch + sequential).** A new `src/orbit_determination.rs` recovers
  a satellite's orbital state `[r, v]` from ground-station range tracking, composing three shipped
  pieces: the two-body + J2 force model (`src/forces.rs`) and RK4 integrator (`src/integrator.rs`)
  propagate a candidate state across the arc, a range measurement model predicts each station range,
  and the Gauss–Newton batch corrector (`src/batch_ls.rs`) drives the candidate onto the best-fit
  state (`determine_orbit_batch`). The same dynamics and range model also drive a **sequential**
  recursive determination on the shipped unscented filter (`determine_orbit_sequential`). Four tests
  validate it: range prediction across the arc; **batch recovery to sub-metre / mm·s⁻¹ from noiseless
  ranges**; batch recovery to **~2 m with a post-fit residual at the 5 m noise floor** (the signature
  of a consistent least-squares fit); and sequential recovery to within tens of metres. Honest scope:
  range-rate/Doppler and angle measurements, an analytic J2 state-transition matrix, and station
  visibility masking are follow-ons.
- **Tightly-coupled GNSS/INS UKF navigator.** A new `src/fusion/tightly_coupled.rs` wires the
  shipped unscented Kalman core (`src/fusion/ukf.rs`) into a working tightly-coupled navigator over
  the eight-state `[px,py,pz,vx,vy,vz,b,d]` (ECEF position/velocity plus receiver clock bias and
  drift in range units). It ingests the **raw satellite measurements** — `pseudorange`
  (`ρ = |p − sᵢ| + b`) and `range_rate`/Doppler (`ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d`) — rather
  than a pre-formed position fix, so `TightlyCoupled` (with `propagate`/`propagate_orbital`/
  `update_gnss`) keeps correcting **with fewer than four satellites** and coasts through GNSS
  outages on its propagated dynamics. Five tests validate it end-to-end, including the milestone
  acceptance scenarios: the pseudorange/Doppler geometry against hand values; noiseless convergence
  to **sub-metre** on five satellites; a **three-satellite** case converging from ~212 m to ~13 m
  where a snapshot PVT cannot even be formed; a constant-velocity **120-second outage** within 50 m;
  and — the headline acceptance — a **30-minute curving LEO pass** (real two-body + J2 orbit) with a
  **120-second GNSS outage**, held to **0.77 m pass RMS** and **2.9 m worst-case through the
  outage**. That orbital coast composes the shipped gravity force model (`src/forces.rs`) and RK4
  integrator (`src/integrator.rs`) into the UKF process model (`propagate_orbital`), so the filter
  follows the orbit's curvature — which a constant-velocity coast cannot (curvature alone is ~58 km
  over 120 s at LEO). Honest scope: the orbital coast uses the two-body + J2 force model rather than
  raw IMU specific-force (for an unpowered orbital platform these coincide); folding in a
  strapdown-IMU error state and in-loop iono/tropo corrections remain follow-ons.
- **Map-matching measurement model (terrain-/gravity-referenced navigation).** A new
  `src/mapmatch.rs` supplies the measurement model that turns the shipped
  sequential-importance-resampling particle filter (`src/particle_filter.rs`) into a working
  GPS-denied navigator: `field_likelihood` (a Gaussian field-match likelihood) and
  `map_match_likelihood`, which samples any georeferenced reference field — terrain elevation
  (TRN) or a gravity anomaly — at a particle's position and weights it by agreement with the
  vehicle's measured value. The field is any `Fn(lat, lon) -> value` sampler, so it composes
  with the bilinear grid in `src/ionex.rs` or a closure. Two tests anchor it — the likelihood
  peaks (=1) at a perfect match and falls to `e^(−½)` at one sigma, and a particle filter over
  a distinctive synthetic-terrain patch recovers the true position to within 0.1. Honest scope:
  the real reference maps (SRTM elevation, EGM/EIGEN gravity anomaly) and their loaders are
  follow-ons.
- **Cislunar PNT integrity (lunar ARAIM).** A new `src/lunar.rs` applies the Earth-side
  MHSS ARAIM engine to a LunaNet-style lunar navigation service with the lunar parameters
  (`σ_URE ≈ 30 m` vs GPS 0.6 m, `P_sat ≈ 1e-4`): lunar constants, a selenocentric
  East/North/Up basis and sky-geometry helper, and `lunar_araim` (HPL/VPL). Three tests
  anchor it — the orthonormal selenocentric basis, the slant-range geometry, and the exact
  linear protection-level scaling with `σ_URE` (lunar 30 m gives a 50× larger protection
  level than the same geometry at the GPS 0.6 m — the quantitative reason lunar PNT
  integrity is hard). Honest scope: the precise LANS NRHO ephemeris, the signal-in-space
  error budget, and the MCI↔MCMF frame reduction are follow-ons.
- **Two-part (high-precision) Julian dates.** A new `src/jd2.rs` adds `Jd2`, a Julian date
  split into an integer `day` and a fractional `frac` in `[0,1)` (the SOFA/hifitime
  convention), with `new`/`from_parts`/`add_seconds`/`diff_seconds`/`total`. Differences of
  nearby epochs stay exact to the `f64` floor where a single-`f64` JD loses ~50 µs near
  J2000. Four tests anchor it: the round-trip, fraction normalisation, exact microsecond
  recovery (with the single-`f64` failure demonstrated alongside), and additive/reversible
  second arithmetic.
- **CCSDS OMM (Orbit Mean-Elements Message) writer.** A new `src/omm.rs` complements the
  `oem` ephemeris writer with the mean-elements message: `OmmFile::from_tle` maps SGP4/TLE
  mean elements into the OMM units (mean motion in rev/day, angles in degrees, plus
  `BSTAR`), and `to_omm_kvn` serialises the standards-track CCSDS 502.0-B-2 KVN form — so a
  Kshana orbit can be consumed by any OMM-aware tool instead of as a bespoke TLE. Two tests
  anchor the TLE→OMM unit conversion (≈ 15.5 rev/day, 51.6° inclination, etc.) and the
  presence of the required KVN keywords. Honest scope: the KVN form and TLE mapping ship
  here; the XML (`ndm/omm`) rendering and a reference-parser round-trip are follow-ons.
- **Sequential-importance-resampling particle filter.** A new `src/particle_filter.rs`
  adds the nonlinear, non-Gaussian estimator behind map-aided, GPS-denied navigation
  (terrain-referenced or gravity-map matching): `predict` (propagate particles through the
  dynamics + Gaussian process noise), `update` (reweight by a per-particle measurement
  likelihood), systematic `resample`, the `effective_sample_size` degeneracy monitor, and
  the weighted-mean estimate. Six tests anchor the deterministic core exactly — ESS spanning
  1…N, systematic resampling picking indices in proportion to weight, the weighted-mean
  convex combination, a Gaussian likelihood pulling the estimate onto the measurement,
  resample-to-uniform behaviour, and seeded predict determinism. Honest scope: the engine
  ships here; the reference maps (SRTM elevation, EGM gravity anomaly) and the map
  measurement model are follow-ons (the `ionex` grid+bilinear sampler would serve a
  gravity/terrain map equally).
- **IONEX-style TEC ionosphere maps.** A new `src/ionex.rs` adds the measured-ionosphere
  alternative to the broadcast Klobuchar model: a `TecGrid` (a regular lat/lon grid of
  vertical TEC, an IGS global ionosphere map) with bilinear interpolation at a pierce point
  (`vtec_at`, clamped outside the grid) and the first-order delay `Δ = 40.3·TEC/f²`
  (`vtec_to_delay_m`, `delay_at`). Four tests anchor it: `1 TECU ≈ 0.162 m` at L1 with the
  `1/f²` scaling, node-exact interpolation, bilinear midpoints averaging the corners, and
  edge-clamped out-of-grid queries. Honest scope: the grid and interpolation ship here;
  parsing the IONEX file format, time interpolation between maps, and the slant mapping
  function are follow-ons.
- **Geometric time-transfer corrections (Sagnac + GNSS common-view).** A new
  `src/timegeo.rs` adds the two deterministic effects a real clock comparison must account
  for, complementing the stochastic two-way model in `timetransfer`: `sagnac_correction`
  (`Δt = (ω_E/c²)·(x₁y₂ − x₂y₁)`, the rotating-Earth delay — tens of ns for continental
  baselines) and `common_view_offset`, the GNSS common-view single difference that cancels
  the satellite-clock error exactly and recovers the inter-station offset. Three tests
  anchor them on exact references: the ≈ 33 ns Sagnac of an equatorial quarter-turn,
  antisymmetry and the zero radial/polar cases, and the exact satellite-clock cancellation.
  Honest scope: a full TWSTFT transponder/hardware-delay budget and a PPP ionosphere-free
  time-transfer solution are follow-ons.
- **Orbital force model (two-body + J2).** A new `src/forces.rs` adds the acceleration
  model a numerical propagator integrates: `two_body_accel` (`−μ·r/|r|³`), the `j2_accel`
  oblateness perturbation (the ECI closed form), and `gravity_accel` summing them — pair
  it with `src/integrator.rs` as `f(t,[r;v]) = [v; a(r)]`. It also exposes the analytic J2
  **secular rates** (`j2_secular_rates`): the nodal regression `Ω̇`, apsidal rotation `ω̇`,
  and mean-anomaly drift `Ṁ`. Six tests anchor the physics on exact references: `μ/r²` for
  the two-body term, the J2 closed form at the equator (~10⁻³ of the two-body magnitude),
  the **critical inclination** (63.4349°) that freezes the perigee (`ω̇ = 0`), the ISS
  nodal regression (`Ω̇ ≈ −5°/day`), and the eastward drift of a retrograde sun-synchronous
  orbit. Honest scope: two-body + J2 only; J3–J6, drag, SRP, and third-body are follow-ons.
- **Shareable scenario permalinks.** A new `src/permalink.rs` adds a dependency-free
  RFC 4648 Base64 codec (standard `+/` alphabet with padding, and a URL-safe `-_`
  unpadded alphabet) and `encode_scenario` / `decode_scenario` wrappers, so a playground
  TOML can be encoded into a `?s=` query parameter and shared as a URL. Exposed to the
  browser as `encode_permalink` / `decode_permalink` wasm bindings. Four tests anchor it
  on the canonical RFC 4648 vectors (`"foobar"` → `"Zm9vYmFy"`, etc.), a URL-safe scenario
  round trip (no `+`/`/`/`=` to escape), invalid-symbol rejection, and an all-256-byte
  round trip. Honest scope: the codec and bindings ship here; the playground Share-button
  UI, the Plotly/D3 multi-series chart, and the A/B comparison mode are follow-ons.
- **Gauss–Newton batch least squares (the batch differential corrector).** A new
  `src/batch_ls.rs` adds the estimation core a batch *orbit determination* (or any
  parameter fit) rests on: `gauss_newton` linearises a user-supplied model `h(x)` with a
  central finite-difference Jacobian, forms and solves the weighted normal equations
  `(HᵀWH)·Δx = HᵀW·(z − h(x))` (reusing the tested matrix inverse), and iterates to
  convergence with per-measurement weights. Four tests anchor it: a linear line fit reaching
  the exact weighted-least-squares solution, a nonlinear `a·exp(b·t)` fit recovering the true
  parameters, a 3-D range-multilateration that recovers a known position from noise-free
  ranges (the orbit-determination flavour), and rejection of under-determined/mismatched
  inputs. Honest scope: this is the generic corrector engine; the orbit-specific
  range/range-rate/azimuth-elevation measurement model, the analytic J2 state-transition
  matrix, and the published-case validation are follow-ons.
- **RF-layer spoofing monitors (AGC power and SQM).** A new `src/spoof_monitors.rs` adds
  two independent receiver-front-end spoof detectors that complement the clock-aided
  time-spoof monitor in `spoof`: an **AGC power monitor** (`combine_power_dbm` incoherent
  power sum + `AgcMonitor`) that flags the excess received power a spoof transmitter adds
  beyond a configurable dB margin, and a **signal-quality monitor** (`bpsk_autocorr`
  triangular code autocorrelation + `SqmMonitor`) that flags the Early-minus-Late
  correlator imbalance multipath/meaconing/replay introduces. Four tests anchor the exact
  closed forms (3.01 dB for a doubling of power, the `10·log10(N)` aggregate, the
  triangular `R(τ)=1−|τ|`, and the 10 % Early/Late alert threshold). Honest scope: the
  full RAIM-consistency parity spoof detector, the multi-layer fusion of the monitor
  outputs, and validation against published Spirent/ION GNSS+ spoofing vectors are
  follow-ons.
- **Adaptive numerical ODE integrator.** A new `src/integrator.rs` adds the first piece
  of a *numerical* propagator (Kshana's orbit propagation is otherwise analytic SGP4/SDP4):
  a generic fourth-order Runge–Kutta step (`rk4_step`) over any first-order system
  `y' = f(t, y)`, and an adaptive driver (`integrate`) that controls local error by
  **step doubling** (Richardson extrapolation) with the standard `0.9·(tol/err)^(1/5)`
  step controller and accept/reject logic. Six tests anchor it on exact solutions: the
  `y' = y → e` exponential to `< 1e-9`, the ~16× error reduction per halved step that
  proves fourth-order convergence, energy/return conservation of the harmonic oscillator
  over a full period, and the adaptive driver meeting a tight tolerance with variable
  steps. Honest scope: this is the integrator core and its error control; the
  Dormand–Prince RK5(4)/RKF7(8) embedded tableaux and the hierarchical orbit force model
  (two-body + J2–J6 + drag + SRP + third-body) that make it a `NumericalPropagator` are
  follow-ons.
- **Unscented (sigma-point) Kalman filter.** A new `src/fusion/ukf.rs` adds the
  scaled unscented Kalman filter (Julier & Uhlmann; Wan & van der Merwe) as a general
  `n`-state estimator over user-supplied process and measurement functions — the
  sigma-point estimator a tightly-coupled GNSS/INS navigator uses when the
  pseudorange/Doppler model is strongly nonlinear and an EKF's Jacobian degrades. It
  includes the supporting dense linear algebra (Cholesky factor for the sigma-point
  spread, Gauss–Jordan inverse for the innovation covariance) and a Joseph-free
  `P⁺ = P⁻ − K S Kᵀ` update. Six tests pin it down, the key ones exploiting the exact
  property that for a *linear* model the unscented transform reproduces the Kalman
  filter to numerical precision (predict, update, and a full predict+update cycle all
  matched against a hand-run linear KF, plus a 1-D analytic Bayesian-posterior check
  and the Cholesky/inverse identities). Honest scope: this is the estimator engine; the
  17-state tightly-coupled GNSS/INS navigator, pseudorange/Doppler measurement model,
  and outage-validation scenario remain follow-ons.
- **Dual-constellation ARAIM protection levels.** A new `araim_dual_raim` extends the
  single-fault Advanced RAIM (`araim_raim`) with the **constellation-wide fault mode** of
  EU ARAIM / DO-316: alongside the fault-free and per-satellite hypotheses, each
  constellation (labelled per satellite) contributes one hypothesis that removes all of its
  satellites at once, with prior `P_const` (a new `DualFaultPriors { p_sat, p_const }`). Every
  hypothesis adds a term to the same MHSS integrity sum, so VPL/HPL are the smallest bounds
  whose total `P_HMI` meets the budget over fault-free + single-SV + per-constellation faults
  (the Bonferroni false-alert split is over all `N + C` hypotheses). With `P_const = 0` the
  result is bit-for-bit `araim_raim`; a single-constellation user returns `None` against its
  own constellation fault (it cannot be excluded) — which is exactly why dual-constellation
  coverage matters. Four tests cover the equivalence, the protection-level widening, the
  single-constellation unavailability, and input validation, reusing the existing
  solution-separation sub-solution machinery.
- **IAU 2006 precession (Fukushima–Williams angles and bias-precession matrix).** A new
  `src/precession.rs` implements the IAU 2006 (P03; Capitaine, Wallace & Chapront 2003)
  precession: the four Fukushima–Williams angles `(γ̄, φ̄, ψ̄, ε̄_A)` as polynomials in TT
  Julian centuries (`fw_angles`), and the GCRS→mean-of-date bias-precession rotation matrix
  built from them via the SOFA `iauFw2m` construction (`precession_matrix`, with
  `gcrs_to_mod` / `mod_to_gcrs` helpers). This is the first inertial-frame piece on top of
  the existing GMST-based `frames` reduction. Eight tests validate against closed-form
  anchors — the J2000 mean obliquity `ε̄ = 84381.406″ = 23.4392794°`, the published angle
  constant terms, the `ψ̄ ≈ 5039.998″` general-precession accumulation over a century,
  matrix orthonormality and `det = +1`, the near-identity (frame-bias-only) value at J2000,
  and the `≈ 1.40°`/century net rotation angle. Honest scope (`ROADMAP.md`): precession
  only — the IAU 2000A 678-term nutation, the full TEME→GCRS chain, and a SOFA/ANISE µas/<10 m
  numerical cross-check are follow-ons.
- **First-principles cold-atom-interferometer (CAI) accelerometer physics.**
  `src/inertial/quantum_imu.rs` models a three-pulse Mach–Zehnder atom interferometer
  from first principles instead of a datasheet: effective wavevector `k_eff = 4π/λ`,
  interferometer phase `Φ = k_eff·a·T²`, quantum projection (shot) noise `σ_Φ = 1/(C·√N)`,
  per-shot acceleration sensitivity, contrast decay `C(t) = C₀·e^(−t/τ)`, and — the
  point — `CaiAccelerometer::q_va()`, which **derives** the white-acceleration PSD the
  classical `AccelModel` already consumes from the atom number, interrogation time, and
  contrast. The model now also covers **vibration coupling** — the dominant real-device
  term: the interferometer acceleration→phase transfer function `|H(ω)| =
  (4/ω²)sin²(ωT/2)` (`accel_transfer_function`), the white-PSD phase variance
  `σ_Φ² = k_eff²·S_a·T³/3` (`vibration_phase_variance_white`, with a numeric band-integral
  cross-check `vibration_phase_variance_band`), the rank-1 along-beam `beam_axis_projection`,
  and `CaiAccelerometer::vibration_phase_noise` / `vibration_limited_accel` (the latter
  reducing to the `k_eff`-independent `√(S_a/(3T))` floor). Eleven tests hand-verify the
  physics (Rb-87 `k_eff ≈ 1.61×10⁷`, `Φ(1 g) ≈ 1.58×10⁴ rad`, `σ_a ≈ 0.13 µg`/shot shot-noise
  floor vs ≈ 5.9 µg vibration floor, the `1/T²`, `1/√N`, and `T³` scaling laws). Honest
  scope in `docs/QUANTUM.md`: this spans the projection-noise floor and the vibration-limited
  regime above it; laser-phase noise, Coriolis and light-shift systematics, and the
  PHARAO/CARIOQA validation scenarios remain follow-ons.
- **Quantum-CAI accelerometer wired into the inertial scenario.** An accelerometer in an
  inertial dead-reckoning scenario now resolves to a new `ImuKind` — `Classical` (the
  existing datasheet-coefficient sensor) or `QuantumCai` when it carries an optional `[cai]`
  block (`CaiCfg`: wavelength, pulse separation, atom number, contrast, cycle time, and an
  optional platform `vibration_psd`). A `quantum_cai` sensor's velocity-random-walk PSD
  `q_va` is **derived** from the interferometer physics — the shot-noise floor plus, when a
  vibration PSD is given, the vibration-limited contribution in quadrature — instead of a
  supplied coefficient, and the run's provenance records that the noise is physics-derived.
  The `cai` field is `skip_serializing_if = "Option::is_none"`, so existing scenarios omit it
  and serialize byte-identically (the scenario hash is unchanged). Five tests cover the
  derivation, the quadrature vibration sum, the `Classical`/`QuantumCai` selection, hash-stable
  serialization, and an end-to-end CAI-driven run.
- **Constellation-design optimiser and streets-of-coverage geometry.** `src/walker.rs`
  gains `optimize_walker_design`, a gradient-free grid optimiser that searches the
  `{planes × sats × inclination}` design space and returns the best Walker design under
  a chosen `DesignObjective` — `MinSatellitesForCoverage`, `MaxCoverage`, or
  `MinWorstPdop` — over the already-validated PDOP sweep (a test confirms it returns the
  brute-force winner). Plus the analytical **streets-of-coverage** closed forms
  `coverage_half_angle_rad` (`λ = arccos(Re/r·cos ε) − ε`) and `street_half_width_rad`
  (`cos c = cos λ / cos(π/s)`, Rider/Beste), hand-verified against textbook geometry and
  detecting the under-population gap. The full Rider minimum-satellite global-coverage
  solver, a 3-D playground globe, and an external-tool DOP cross-check remain follow-ons.
- **SP3 precise-ephemeris export from the CLI.** A propagated orbit/constellation
  scenario can now be written to an SP3-c file: `kshana <orbit.toml> --export-sp3
  out.sp3`, or `export_sp3 = true` in the scenario auto-writes `<scenario>.sp3`
  (`api::export_sp3` / `auto_export_sp3`, `OrbitClockScenario::to_sp3_string`, optional
  `epoch`). A round-trip test (`tests/sp3_export_roundtrip.rs`) propagates the real
  Celestrak `gps-ops` snapshot, exports it, re-parses it, and confirms the recovered
  ECEF positions match the SGP4 truth over 24 h to **< 0.5 m** (well inside the 10 m
  TLE-grade tolerance). README documents the interoperability role (RINEX → RTKLIB/gLAB,
  SP3 → Ginan/precise-orbit products).
- **Coupled clock+position Kalman filter (cross-block covariance).** `src/fusion/coupled.rs`
  `CoupledPntFilter` is a single stacked `[pos, vel, phase, freq]` filter (Joseph-form
  updates) whose **pseudorange** measurement `ρ = g·pos + c·phase + noise` genuinely
  couples the position and clock blocks — unlike the legacy fusion pack's two
  independent two-state filters, which keep the cross-block covariance exactly zero.
  Validated: a shared pseudorange drives `P[pos,phase]` non-zero; two distinct
  geometries jointly resolve injected position+clock offsets a single range cannot
  separate; a **clock-only fix sharpens the position** through the cross-covariance
  (the payoff decoupled filters cannot provide); and the Monte-Carlo NEES is
  **χ²(4)-consistent**. This is the 1-DOF realization (the fusion pack's
  dimensionality); the 3-D 8-state extension and wiring into the runnable pack are
  tracked as follow-ons.
- **Kalman filter-consistency health monitoring (NIS/NEES).** The two-state clock
  filter's covariance update is now in **Joseph stabilised form** `P⁺ = (I−KH)P(I−KH)ᵀ
  + KRKᵀ`, which stays positive-semidefinite under extreme Q/R ratios (Cholesky-checked
  in CI at `R=1e-26 / Q≈1e-30`). A new `src/filter_health.rs` runs a Monte-Carlo
  consistency assessment (Bar-Shalom §5.4): pooled **NIS** (normalised innovation²,
  target 1) and **NEES** (normalised estimation error², target 2) against 95% χ²
  bands, surfaced as a `filter_health { nis_mean, nis_chi2_lower_95, nis_chi2_upper_95,
  nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent }` block in the clock
  result JSON and as a green/amber card in the playground. A Q/R-mismatch sweep test
  proves the monitor flips to inconsistent when the process noise is mistuned by
  ×0.1–×10. Adds a general χ² quantile (`detection::chi2_inv_cdf`, Wilson–Hilferty,
  table-checked).
- **`docs/PROVENANCE.md` — one citable provenance table.** Consolidates every sensor
  parameter (clocks, inertial, time-transfer), physical/algorithmic model (orbit, time
  systems, frames, iono/tropo, integrity, detection, jamming, Allan), and validation
  dataset (AIAA 2006-6753, Celestrak `gps-ops`) with its published source — datasheet,
  paper, ICD, or standard — and an honest maturity label (flight-qualified /
  ground-lab / space-goal-on-ground-hardware). Linked from the README intro and
  Documentation table; complements the per-run `provenance` strings that already travel
  in the result JSON.
- **Typed scenario API.** Dispatch is now on a typed `ScenarioKind` enum instead
  of a raw `kind` string match (`ScenarioKind::classify` + exhaustive dispatch), so
  adding a pack is compile-checked. New typed surfaces alongside the unchanged
  string-returning `run_toml`: `run_scenario(src) -> Result<RunOutput, KshanaError>`
  with a structured error taxonomy (`InvalidInput` / `NonConvergence` /
  `Unsupported` / `IoError`, each with a stable `kind_tag()`); a `Scenario` trait
  and `ExternalPack` extension point (the `jamming` pack is wired through it as the
  worked example); and `list_scenario_kinds()` introspection (name, description,
  required/optional fields per kind). The Python and WebAssembly bindings gain
  `list_kinds()` and `error_kind()`. Documented in `docs/ARCHITECTURE.md`.
- **Real GPS constellation + operating-envelope coverage.**
  `scenarios/orbit-sgp4-gps.toml` now ships a **real Celestrak `gps-ops` snapshot**
  (2021-07-28, 30 satellites) instead of synthetic Walker TLEs, with
  `strict_checksum = true` so it only loads when every TLE checksum is valid;
  `scripts/fetch_tles.sh` documents reproducible refresh and the README credits
  the open-data source. New `tests/scenario_coverage.rs` exercises each pack across
  ≥5 envelope variants asserting finite/bounded output, confirms the **flicker-FM
  floor measurably degrades a clock's coast** when enabled (now set in three shipped
  scenarios), and confirms the **fusion filter converges with a realistic non-zero
  accelerometer bias** (within 3× the zeroed-bias case), closing the "fusion only
  works with zeroed biases" realism gap. `docs/VALIDATION.md` gains an Operating
  Envelope table.
- **Measurement-domain GNSS simulation (`gnss-sim` kind).** A pseudorange-level
  forward model: per visible satellite it synthesises `ρ = geometric range +
  c·δt_rx − c·δt_sv + I + T + noise + multipath` and the L1 Doppler, with the
  **Klobuchar** single-frequency ionosphere (IS-GPS-200 §20.3.3.5.2.5) and the
  **Saastamoinen** zenith troposphere projected by the **Niell (1996)** mapping
  function — exposed as `[iono]` and `[tropo]` TOML blocks. The residuals feed
  snapshot RAIM for per-epoch HPL/VPL, and a `gnss_measurements[]` JSON array
  carries each SV's pseudorange, Doppler, C/N₀, and iono/tropo corrections. A
  zero-noise run reproduces geometry + corrections to sub-millimetre (CI test).
  New `src/gnss_sim.rs` and `scenarios/gnss-sim-raim.toml`.
- **Stochastic time-spoof detector (`spoof` kind).** The spoof pack now runs a real
  detector instead of a deterministic ramp-vs-bound comparison: four injection
  shapes (`linear_ramp`, `step_jump`, `meaconing`, `replay`), a two-sided χ²₁
  energy / Neyman–Pearson test on the clock-aided monitor statistic with the
  threshold set from a target false-alarm budget `target_pfa`, and the
  missed-detection probability `P_md` reported both closed-form and by Monte-Carlo
  (`mc_runs` trials per hypothesis — the two agree to a few ×1/√N). The Security
  figure of merit is now `1 − P_md` at the operationally-harmful (spec) magnitude.
  New `src/detection.rs` (Gaussian tail functions, NP/energy test, Monte-Carlo
  P_fa/P_md) and `scenarios/spoof-meaconing.toml`. Backward compatible: a bare
  `[attack] rate_ns_per_s` is still accepted as a linear ramp.

### Changed
- **Security FoM definition (`spoof` kind):** from the analytic detectability
  bound `1 − min_detectable/threshold` to the stochastic detector's `1 − P_md`.
  The clock pack's `security` field remains the faster analytic proxy.

### Added (continued)
- **RF jamming model (`jamming` kind).** A link-budget interference model that
  turns a jammer's power and geometry into per-satellite loss of lock: the
  jammer-to-signal ratio from free-space path loss and the per-direction
  receive-antenna gain, the effective C/N₀ via the standard anti-jam equation
  (despreading processing gain × the spectral-separation factor `Q`; Kaplan &
  Hegarty §9.4), and a configurable tracking threshold, scored over a Walker
  constellation as an `availability_under_jamming` figure of merit. New
  `src/jamming.rs` and `scenarios/jamming-demo.toml`. Honest scope (no multipath,
  terrain shadowing, AGC, or adaptive nulling) is documented in
  `docs/CAPABILITY.md` / `docs/VALIDATION.md`.
- **Generic N-D parameter sweep over any scenario kind (`sweep-nd`).** The
  previous N-D sweep was clock-pack only. `sweep-nd` varies dotted TOML keys of a
  `[base]` scenario over the Cartesian product of its axes, re-dispatches each
  grid node through the normal run path, and reads one or more metrics out of the
  result by dotted JSON path — so it works for every pack (inertial, gnss-ins,
  integrity, spoof, …) without coupling to each pack's Rust type. Grid nodes are
  evaluated in parallel across OS threads on native targets (no added
  dependency); wasm falls back to sequential. Deterministic and row-major
  regardless of thread count. New `scenarios/sweep-nd-inertial.toml` example.
- **TOML-configurable deterministic IMU error model in the `gnss-ins` pack.** The
  three-axis strapdown error chain (scale-factor, misalignment, g-sensitivity,
  quantization, rate-ramp; IEEE Std 952-1997 §A.2, Groves 2013 §4.3) is now
  reachable per sensor from a scenario file via an optional `[imu_*.error_model]`
  block, layered on top of the constant turn-on biases. Omitting the block leaves
  each sensor a pure constant-bias source, so existing `gnss-ins` runs are
  unchanged. This wires the previously library-only error model into a runnable
  pack and figure of merit.

## [0.10.0] - 2026-06-04

### Changed
- **Real-data validation.** The multi-GNSS RINEX navigation parser, the GLONASS
  RK4 propagator, and the SP3 reader are now exercised against genuine IGS/DLR
  files (a real RINEX 3 mixed broadcast nav file and an IGS SP3-c orbit product),
  not only self-authored samples — asserting non-empty satellite sets and finite,
  physically-sized ECEF positions. The fixtures are test-only (excluded from the
  published crate); see `tests/fixtures/igs/NOTICE`.
- **RAIM on real reference-orbit geometry.** The snapshot, solution-separation
  (MHSS), and ARAIM protection-level cores are now validated against the real IGS
  precise-orbit (SP3) geometry, not synthetic constellations alone: the line-of-sight
  geometry is built from the first SP3 epoch at a real ground station, and the tests
  assert metre-level, APV-I-available protection levels, that a 60 m pseudorange bias
  trips the χ² monitor, that solution separation **identifies** the faulted satellite,
  and that ARAIM's levels meet the allocated `P_HMI`. Closes the
  validated-on-synthetic-geometry-only gap (receiver-domain gLAB parity over a full
  RINEX arc remains a roadmap item — it needs a pseudorange solution).

### Added
- **Per-node confidence intervals for the N-D parameter sweep** (`sweep::nd_sweep_ensemble`).
  Each grid node of the N-dimensional Cartesian-product sweep can now be evaluated as a
  Monte-Carlo ensemble of seeds, reporting the metric's mean, percentiles, and a
  percentile-bootstrap 95% CI per node (for both clocks) — a statistically honest sweep
  rather than one draw per node. Reuses the ensemble/bootstrap machinery (`metric_stat`);
  deterministic; `runs = 1` reduces exactly to the single-seed `nd_sweep`. (Generalising
  the sweep across all packs, entangled with the typed-Scenario refactor, and parallel
  execution remain.)
- **NaveGo cross-validation of the IMU-noise pipeline** (`tests/navego_imu_crossval.rs`).
  An external cross-check against NaveGo (R. Gonzalez's open-source INS/GNSS toolbox):
  reproduces the synthetic round-trip of `navego_example_allan.m` on its published
  Microstrain 3DM-GX3-35 reference profile, confirming our overlapping-ADEV estimator
  recovers NaveGo's velocity- and angle-random-walk coefficients (`ADEV(1 s) = σ·√dt`)
  to under 5% with the expected −1/2 white-noise slope. (The 40 MB recorded STIM300
  `.mat` log is not ingested — binary-format-gated.)
- **Tightly-coupled (pseudorange) GNSS/INS update.** `GnssInsEkf::update_tightly_coupled`
  (and the `ClosedLoopInsGnss::fuse_tightly_coupled` wrapper) implement the
  previously-stubbed range-domain measurement: the innovation is the predicted
  range from the INS position to each satellite versus the measured pseudorange,
  with a line-of-sight Jacobian on the position error. Because each satellite is a
  scalar measurement, the filter keeps correcting with **fewer than four
  satellites** — where a loosely-coupled PVT fix does not exist. Five tests cover
  four-satellite nulling, two-satellite correction (no PVT possible), single-
  satellite along-line-of-sight observability, and input validation. Pseudorange-
  only; carrier phase and an explicit receiver-clock state remain roadmap. The
  unused `tight_coupling` cargo feature (which gated the old error stub) is removed.
- **Loosely-coupled GNSS/INS scenario pack (`kind = "gnss-ins"`, `src/fusion/pack.rs`).**
  Wires the three-axis strapdown navigator and the 15-state error-state EKF
  (`closed_loop` / `gnss_ins_ekf`) into a runnable scenario with a figure of merit —
  the EKF disciplines the mechanization against noisy GNSS fixes while coverage is
  up, then coasts through the outage, replacing the legacy 1-DOF scalar pack's
  truth-snap reset with genuine fusion. The result reports the fused horizontal
  error series, the scored position FoM (availability / outage RMS / holdover), and
  the open-loop free-INS RMS for comparison; a quantum/classical IMU pair differs
  only in true bias. Dispatched from the CLI/Python/wasm entry point with a
  `scenarios/gnss-ins.toml` example. Honest framing: loosely-coupled only, one
  deterministic trajectory, and the fused outage error is floor-limited by the
  hand-over attitude error (so it is not claimed to scale with bias) — the robust
  findings are that fusion beats unaided dead-reckoning for a biased sensor and that
  a lower-bias sensor has the better unaided coast.
- **Constellation design on the validated SGP4 core (`src/walker.rs`).** A new
  `walker` module emits a designed Walker-delta pattern (`i: T/P/F`) as SGP4
  **mean elements**, so the synthetic constellation propagates through the same
  SGP4 path validated to 4.12 mm against the AIAA 2006-6753 vectors — not the
  analytic Keplerian generator. On top of it: `pdop_sweep` tabulates coverage and
  median/worst PDOP over a `{planes × sats × inclination}` design grid, and
  `coverage_revisit` reports the coverage fraction and revisit gaps (worst/mean)
  at a ground point. Validated by the physical monotonicities a trade must obey
  (more satellites ⇒ higher coverage, lower PDOP, shorter revisit). Separately, a
  genuine **Celestrak `gps-ops` TLE snapshot** (2021-07-28, 30 operational GPS
  satellites) is added as a test-only fixture and the real-TLE → SGP4 → ECEF
  geometry path validated against it (full MEO shell within 1%, nine-satellite
  all-in-view at PDOP 1.64), alongside the existing SP3 and RINEX real-data paths.
- **Noise-type-specific effective degrees of freedom for the Allan confidence
  intervals.** `allan::edf_overlapping_adev` implements the NIST SP 1065 Table 5
  closed forms (the Stable32 simple set) for all five canonical power-law noise
  types — white/flicker PM, white/flicker FM, random-walk FM — replacing the
  conservative non-overlapping count as the χ² degrees of freedom. A new
  `PowerLawNoise` enum and `classify_power_law` identify the dominant type from
  the record's **modified** Allan-deviation slope (MDEV separates white from
  flicker PM where ADEV cannot), and `overlapping_adev_curve` now attaches the
  identified noise type, its edf, and a 95% confidence band to every point of the
  exported ADEV curve (`AdevPoint` gains `noise`/`edf`/`ci_lo`/`ci_hi`, additive
  with serde defaults). Validated two ways: the five formulas match hand-evaluated
  values to 1e-12, and a 4 000-record Monte-Carlo white-FM ensemble confirms the
  formula predicts the estimator's actual chi-squared edf within 20% (and that it
  materially beats the conservative count). Eight new tests.
- **Two-way time-transfer stochastic model.** `timetransfer::TwoWayLink` replaces the
  white-only sampler with a physically-grounded model: the reciprocal (common-mode) path
  delay cancels in the `(m_AB - m_BA)/2` estimate (`two_way_offset_estimate`, so two
  independent one-way measurements average to `1/sqrt(2)`), and the residual is the
  **non-reciprocal** differential delay — modelled as a colored white-FM + random-walk-FM
  process (the validated `ClockModel`), giving the synchronization-error series a realistic
  Allan signature (`sigma_y^2(tau) = q_rw*tau/3`) instead of flat white noise. `LinkCfg`
  gains `q_wf_s`/`q_rw_s` (serde default 0 ⇒ the legacy white-only behaviour, bit-for-bit),
  the link FoM reports `adev_tau0` (the model's Allan deviation at the base step), and the
  `timetransfer` scenario/CLI surface it. Golden FoM re-pinned. Six hand-derived tests
  (common-mode cancellation, the sqrt(2) two-way gain, the RWFM `tau/3` law via the link's
  own `step()`, legacy-equivalence at `q=0`, determinism, and end-to-end FoM exposure).
- **Stable32 numeric parity for the Allan-family estimators (NBS14).** `tests/allan_reference.rs`
  validates the overlapping ADEV, modified ADEV, time deviation, and overlapping Hadamard
  estimators against the Stable32 reference deviations for the canonical **NBS14** dataset
  (W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST SP 1065, ~p.107) at
  tau = 1, 2 to a 1e-4 relative tolerance — actual agreement ~1e-6. This pins the
  estimator mathematics against the de-facto reference implementation, not just against
  the estimators' own analytic self-consistency. Only the public reference numbers are
  used; no third-party code.
- **Vertical Stanford integrity diagram exported by the `integrity` scenario.** The
  runnable `integrity` scenario kind now exports a vertical Stanford(-ESA) diagram
  alongside the HPL/VPL availability map: at each protected epoch a seeded, reproducible
  no-fault range-error draw is mapped through the geometry to an actual vertical position
  error and classified against the VPL and the vertical alert limit (Available /
  System-Unavailable / Misleading / Hazardously-Misleading). The diagram (per-epoch
  points + region counts) is carried in the result JSON and the integrity-event / HMI
  counts in the CLI summary, so the Stanford classifier — previously library-only — is
  reachable end-to-end. `IntegrityScenario` gains a `seed` field (default 0) controlling
  the error realization; the availability map itself remains geometry-only and seed
  independent.
- **ARAIM integrity-risk (P_HMI) budget for the protection levels.** `raim::araim_raim`
  derives the horizontal and vertical protection levels from an explicit integrity-risk
  budget rather than a fixed `K_md` multiplier: for the all-in-view solution and every
  single-satellite exclusion sub-solution it builds the per-mode `(prior, detection
  threshold, σ)` on each axis, then `araim_protection_level` solves the smallest PL whose
  summed probability of hazardously-misleading information (`araim_integrity_risk`,
  `P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)`, Blanch et al. *Baseline ARAIM*) meets the
  allocated `P_HMI`. The result reports the integrity risk the levels actually achieve, so
  a user can trade integrity against the alert limit explicitly. Six hand-derived tests
  (fault-free and thresholded single-mode closed forms, multi-mode summation/monotonicity,
  end-to-end fault-free protection with a 10⁵× tighter budget raising the PL, fault
  detection/identification, and the six-satellite redundancy floor). Single-fault MHSS is
  the ARAIM baseline; simultaneous multi-SV-subset faults, the constellation-wide fault
  mode, and gLAB reference-dataset validation are documented extensions.
- **Two-speed coning/sculling compensation for the strapdown mechanization.**
  `inertial::mechanization::coning_sculling_compensate` folds the high-rate coning
  (attitude) and rotation+sculling (velocity) terms out of a coarse update's
  ordered sub-interval IMU increments, so a moderate-rate `NavState::step_increments`
  reproduces vibration-rectified motion a coarse step over the raw sums misses. A
  validation test drives a 10 Hz coning+sculling environment for 60 s and compares
  fine-rate truth, naive coarse integration, and the folded coarse integration:
  the fold cuts the position error by ~18× (metres of naive drift → sub-decimetre),
  confirming the coning/sculling terms are load-bearing. A `ScalarErrorBudget`
  type alias names the legacy 1-DOF `AccelModel` for what it is, distinct from the
  three-axis `NavState` navigator.
- **RINEX observation-file parser.** New `rinex_obs` module reads the RINEX 3.0x /
  4.00 *observation* file — the receiver's actual measurements — completing the
  RINEX pair alongside the existing navigation-message parser. `parse_obs` decodes
  the header (version/type, the per-system `SYS / # / OBS TYPES` lists with
  continuation lines, approximate position, interval, time of first observation)
  and each epoch's per-satellite records: pseudorange, carrier phase, Doppler, and
  signal strength, keyed by their RINEX 3 observation code (`C1C`, `L1C`, …) with
  the loss-of-lock (LLI) and signal-strength (SSI) flags, a blank field preserved
  as absent rather than zero. Honest scope: this is the standards-format *ingest*
  (a real RTKLIB/gLAB/IGS-station observation log in, typed measurements out), not
  a positioning engine — no pseudorange solution, PPP, or RTK here.
- **CCSDS OEM (Orbit Ephemeris Message) writer.** New `oem` module exports a
  propagated constellation as a valid CCSDS 502.0-B OEM 2.0 message —
  the KVN ephemeris format GMAT, Orekit, STK, and most flight-dynamics tools
  ingest. `OemFile::from_propagators` samples each satellite's inertial
  (TEME) state — position **and** velocity, taken straight from the propagator
  with no Earth-fixed rotation, unlike the SP3 export — onto a time grid, and
  `OemFile::to_oem_string` serialises the `CCSDS_OEM_VERS`/`CREATION_DATE`/
  `ORIGINATOR` header plus one `META_START … META_STOP` segment per satellite
  (`OBJECT_NAME`/`OBJECT_ID`/`CENTER_NAME`/`REF_FRAME = TEME`/`TIME_SYSTEM = GPS`/
  `START_TIME`/`STOP_TIME`) followed by its `epoch X Y Z X_DOT Y_DOT Z_DOT`
  lines (km, km/s). The `CREATION_DATE` is caller-supplied, never wall-clock, so
  output is byte-identical across runs (the reproducibility contract). This is the
  spacecraft-ephemeris counterpart to the GNSS SP3 export: a Kshana orbit can now
  be handed to a flight-dynamics tool in a standard format.
- **SP3 precise ephemeris as a propagation source.** `Sp3File::interpolator`
  builds a per-satellite `Sp3Interpolator` that fills the position between the
  tabulated SP3 epochs with a 9th-order Lagrange polynomial (standard IGS
  practice) and rotates it into the shared TEME frame, exposed as
  `Propagator::Sp3Precise`. An IGS/analysis-centre precise-orbit file can now drive
  the same geometry/visibility/integrity pipeline as the broadcast and analytic
  propagators. Validated round-trip: a Kepler orbit written to SP3 and re-read
  through the interpolator matches the original to sub-metre at the nodes and
  < 100 m mid-interval. Clock interpolation is next.
- **GLONASS broadcast ephemeris (completes multi-GNSS RINEX nav).** New `glonass`
  module: GLONASS doesn't broadcast Keplerian elements but a PZ-90 Earth-fixed
  **state vector** (position, velocity, luni-solar acceleration). `parse_glonass_nav`
  reads the RINEX 3 `R` records, and the satellite position at any time is obtained
  by **4th-order Runge–Kutta integration** of the GLONASS ICD equations of motion
  (central gravity + `J2` + Earth-rotation Coriolis/centrifugal terms + the
  broadcast acceleration). Exposed as `Propagator::Glonass`, so GLONASS satellites
  flow through the constellation/visibility/integrity pipeline alongside the
  Keplerian systems; a single `rinex` constellation block can now mix GPS, Galileo,
  QZSS, BeiDou, and GLONASS.
- **Multi-GNSS RINEX navigation (GPS, Galileo, QZSS, BeiDou).** The RINEX 3
  navigation parser now decodes Galileo (`E`), QZSS (`J`), and BeiDou (`C`,
  MEO/IGSO) records alongside GPS (`G`) — they share the Keplerian layout and user
  algorithm — each evaluated with its own gravitational constant and Earth-rotation
  rate (Galileo/BeiDou μ, BeiDou Ω̇ₑ). A mixed-constellation file yields all of
  them, flowing through the constellation/visibility/integrity pipeline as
  `Propagator::Rinex`. BeiDou geostationary satellites use a different coordinate
  rotation and are skipped pending a reference fixture to validate against. The
  record walker uses per-system line counts, fixing a latent bug where four-line
  GLONASS/SBAS records were skipped as if eight lines long. GLONASS (a state-vector
  model) is next.
- **SP3-c/d precise-ephemeris reader and writer.** New `sp3` module parses
  IGS/analysis-centre SP3 precise orbit files (`parse_sp3`) — the post-processed
  ECEF position/clock product that PPP engines (Ginan, RTKLIB, gLAB) treat as
  reference — into a structured `Sp3File` (header, epoch grid, per-satellite
  position km→m, clock µs, and velocity dm/s→m/s for `V` products), preserving the
  SP3 bad-value sentinels. The reverse direction is also covered:
  `Sp3File::from_propagators` builds an SP3 from a propagated constellation
  (TEME→ECEF per epoch) and `to_sp3_string` serialises it, so Kshana orbits can be
  exported in the format external PPP tools ingest — the read↔write round trip.
  Epoch interpolation and an SP3 propagator source are next.
- **RINEX broadcast ephemeris as a runnable constellation source.** A
  constellation now accepts an inline `rinex` block (RINEX 3 GPS navigation
  text) alongside the existing `tle` option, so a real broadcast file drives a
  scenario end-to-end from the CLI, Python, or the in-browser playground — RINEX
  in, PNT geometry out. New `scenarios/orbit-rinex.toml` demonstrates GNSS
  availability and DOP from eight GPS satellites built straight from broadcast
  records. (GPS LNAV only; multi-GNSS and SP3 are next.)
- **RINEX broadcast ephemeris as a propagation source.** A parsed
  `RinexEphemeris` now converts to an `orbit::Propagator` (`Propagator::Rinex`):
  position is the IS-GPS-200 broadcast orbit rotated from ECEF into the shared
  TEME inertial frame (`sv_position_teme`, with leap-second-correct GPS→UT1 time),
  velocity by central finite difference, and the Keplerian orbital period. Real
  GPS broadcast data can now drive the same geometry, visibility, and integrity
  (RAIM) pipeline as the analytic SGP4/Keplerian propagators. (Not yet exposed as
  a RINEX-file scenario kind — that and multi-GNSS/SP3 are next.)

## [0.9.2] - 2026-06-03

### Added
- **Archival DOI.** Releases are now deposited to Zenodo and assigned a citable DOI.

## [0.9.1] - 2026-06-03

### Changed
- **Documentation.** Refreshed the README to institutional grade: a Capabilities
  overview of the full v0.9.0 stack, a Versioning & releases section, a clean
  header with the new mark, and a concise status line. No engine changes.

## [0.9.0] - 2026-06-03

This release adds three substantial capability areas on top of the 0.8.0 SGP4
substrate: a genuine three-axis strapdown INS, a loosely-coupled GNSS/INS
error-state EKF with closed-loop feedback, real snapshot and solution-separation
(ARAIM-style) RAIM with HPL/VPL and a runnable `integrity` scenario, and the first
step of GNSS-format interoperability (RINEX-3 GPS ephemeris ingestion).

### Added
- **RINEX 3 GPS navigation-message parser (`src/rinex.rs`).** First step toward
  GNSS-format interoperability: `parse_nav` reads a RINEX 3.x navigation file and
  decodes each GPS (`G`) broadcast-ephemeris record — the eight-line SV/epoch +
  `BROADCAST ORBIT` block — into a `RinexEphemeris` of Keplerian elements and
  clock corrections, with field names and units per IS-GPS-200. Handles the
  Fortran `D`-exponent float format (`parse_d`) and fixed-width column layout;
  records for non-GPS systems are skipped, not rejected, so a mixed file still
  yields its GPS ephemerides. Four tests: `D`-exponent parsing (including blanks
  and errors), a full record decoded against known field values with a GPS
  semi-major-axis sanity check (√A² ≈ 26 560 km), non-GPS skipping, and the
  empty-file case.
- **GPS broadcast-ephemeris → ECEF position (`src/rinex.rs`).**
  `RinexEphemeris::sv_position_ecef(t_tow)` evaluates the satellite's Earth-fixed
  position from the parsed ephemeris via the IS-GPS-200 §20.3.3.4.3.1 user
  algorithm: Newton solution of Kepler's equation for the eccentric anomaly, the
  second-harmonic argument-of-latitude / radius / inclination corrections, and the
  rotation into ECEF accounting for Earth rotation since the reference epoch (with
  the GPS `μ` and `Ω̇ₑ` mandated by the spec, and a week-rollover `tk` fold). Three
  tests: the geocentric radius stays in the GPS band (≈ 26 560 km), the Earth-fixed
  speed is ~3.9 km/s, and evaluating a full week away reproduces the same position.
- **GPS SV clock bias with the relativistic correction (`src/rinex.rs`).**
  `RinexEphemeris::sv_clock_bias_s(t_tow)` evaluates the broadcast clock
  polynomial `af0 + af1·Δt + af2·Δt²` about `Toc` plus the relativistic
  eccentricity term `F·e·√A·sin Ek` (IS-GPS-200 §20.3.3.3.3.1). A new
  `EpochUtc::gps_time_of_week` converts the record's calendar epoch to GPS
  time-of-week via Julian-day arithmetic from the GPS epoch (1980-01-06), and the
  Kepler solve is shared with the position evaluation. Tests: GPS time-of-week for
  a Sunday/Tuesday/Saturday (week boundaries), and the clock bias being
  af0-dominated with a present, bounded relativistic term. The L1 group-delay
  `TGD` is exposed but deliberately not folded in. Honest scope: a `Propagator`
  source, Galileo/BeiDou/GLONASS, and SP3 remain next steps. (`docs/CAPABILITY.md`
  updated to match.)
- **User-runnable `integrity` scenario kind (`scenarios/integrity-raim.toml`).**
  The RAIM availability capability is now reachable from the CLI/TOML like every
  other pack: `kind = "integrity"` parses an `IntegrityScenario` (user orbit, one
  or more GNSS constellations, elevation mask, and the `(sigma, P_fa, P_md, AL_H,
  AL_V)` integrity config), runs `constellation_raim_availability`, and emits the
  per-epoch HPL/VPL availability map as JSON plus a self-contained SVG —
  protection levels over time against the alert limits, with a green/red
  availability strip. `kshana scenarios/integrity-raim.toml` writes the JSON, the
  chart, and an HTML report. The bundled scenario (24-satellite Walker, 1 m
  dual-frequency ranging, APV-I limits) reports ~95 % availability; it documents
  that single-frequency RAIM does not meet the vertical APV-I limit on one
  constellation, which is why vertical guidance uses SBAS/dual-frequency/ARAIM.
  Tests cover the dispatch, the availability-map JSON, and the SVG.
- **Runnable RAIM availability over a constellation (`src/raim.rs`).** The
  integrity module had no caller — `constellation_raim_availability` makes it a
  genuine end-to-end entry point: at each epoch on a time grid it propagates the
  visible satellites (the same SGP4/Keplerian `Propagator`s the engine uses),
  computes the no-fault protection levels, and judges availability against the
  horizontal/vertical alert limits, returning a `serde`-serializable
  `RaimAvailabilityReport` (per-epoch `n_visible`/HPL/VPL/`available` plus the
  availability fraction). A `RaimConfig` bundles `(sigma, P_fa, P_md, AL_H, AL_V)`
  and the per-epoch `raim_availability_epoch` is exposed for callers that resolve
  their own geometry. Three tests: an epoch judged available under APV-I limits on
  a ten-satellite geometry, made unavailable by an impossibly tight limit, and
  `None` levels below five satellites; and an end-to-end run over a 24-satellite
  Walker constellation that yields a finite availability map and serializes. (Six
  satellites — the residual-RAIM redundancy floor — honestly do *not* meet APV-I
  even at 1 m ranging; APV-I availability needs the denser geometry the test uses.)
- **Stanford(-ESA) integrity diagram accumulator (`src/raim.rs`).** The standard
  way to summarise an integrity monitor over many epochs: it plots actual
  position error (x) against protection level (y) and classifies each epoch, by
  the diagonal `y = x` and the alert limit, into `Available` (PL bounds error,
  within AL), `SystemUnavailable` (PL bounds error but exceeds AL — safe,
  unusable), `MisleadingInformation` (PL < error ≤ AL), or
  `HazardouslyMisleadingInformation` (PL < error and error > AL — the unsafe
  failure). `classify_stanford` is the pure classifier; `StanfordDiagram`
  accumulates `(error, PL)` points against a fixed alert limit, exposing region
  counts, availability, integrity-event totals, and `serde`-serializable points
  for plotting/JSON export. Four tests: every region (including the `error == PL`
  bounded boundary), count/availability accumulation, and JSON round-trip. This
  is the reporting surface for the RAIM protection levels; wiring it into the
  constellation scenario and validating against a public dataset remain roadmap
  items.
- **Solution-separation (ARAIM-style) RAIM (`src/raim.rs`).** A
  multiple-hypothesis integrity monitor alongside the existing residual/parity
  chi-squared `snapshot_raim`. For the all-in-view least-squares solution and
  every single-satellite exclusion sub-solution, it forms the separation
  `Δ_k = x_k − x₀` — zero-mean Gaussian under no fault with covariance
  `Cov(x_k) − Cov(x₀)` (the nested-estimator identity, valid because the
  all-in-view solution is BLUE) — and so it both **detects** a fault and
  **identifies** the faulted satellite (the one whose exclusion gives the largest
  normalized separation). Horizontal/vertical protection levels follow the
  standard MHSS allocation `PL = max(K_md·σ₀, max_k[K_fa·σ_ss,k + K_md·σ_k])`,
  with `K_fa = Φ⁻¹(1−P_fa/2)`, `K_md = Φ⁻¹(1−P_md)`. New dependency-free
  `normal_cdf`/`normal_quantile` built from the module's existing regularized
  incomplete gamma (`erf(x) = P(½,x²)`). Four hand-derived tests: normal CDF /
  quantile against textbook values (Φ(1.95996)=0.975, the 1e-7 tail = 5.1993,
  symmetry); a fault-free geometry that does not alarm and yields finite, positive
  HPL/VPL; a 60-σ single-satellite bias that is detected *and* correctly
  identified (`excluded_sv == 2`); and the six-satellite redundancy floor. Closes
  the audit's "tautological integrity — no real RAIM/HPL/VPL" P0 gap on the
  algorithm side; gLAB-dataset validation and the Stanford-diagram accumulator
  remain roadmap items.
- **Closed-loop GNSS/INS integration (`src/fusion/closed_loop.rs`).**
  `ClosedLoopInsGnss` wires the error-state EKF kernel to the three-axis strapdown
  mechanization: each IMU sample is corrected by the running bias estimates,
  mechanized forward, and the EKF covariance time-propagated with the matching
  navigation context; each GNSS position/velocity fix forms the INS−GNSS
  innovation and feeds the estimated **position, velocity, attitude error (ψ, as a
  quaternion rotation) and accelerometer/gyro biases** back into the solution,
  resetting the error-state mean. Feeding the attitude back (not only the biases)
  is required for stability — the tilt and accelerometer bias are a coupled pair,
  so correcting one without the other diverges. INS and GNSS are compared in a
  local tangent-plane NED frame using the mechanization's own radii of curvature
  (new `mechanization::radii_of_curvature`; `NavState::omega_ie_n`/`omega_en_n`
  exposed). This is the honest replacement for the hybrid pack's *truth-snap
  reset*. Three tests: a closed loop nulling an injected 8 m / −5 m position error
  to <0.1 m; an aided solution staying metre-bounded (<6 m) on a driving
  trajectory while a free-running INS diverges past 100 m; and the milestone
  benchmark — the fused solution's **Monte-Carlo position RMS over a 60 s GNSS
  outage beats an unaided open-loop dead-reckoner by >2× (≈4× across seeds)**.
  Honest limitation documented in the module: in loosely-coupled mode the accel
  bias and tilt are only weakly separable (both couple through gravity), so the
  delivered value is the bounded, corrected state and a clean outage-entry — not a
  precise inertial calibration; richer dynamics and the tightly-coupled extension
  remain roadmap items.
- **Loosely-coupled GNSS/INS error-state EKF kernel (`src/fusion/gnss_ins_ekf.rs`).**
  A 15-state error-state extended Kalman filter — `δx = [δp, δv, ψ, b_a, b_g]` —
  with the strapdown error dynamics from Groves 2013 §14.2 (specific-force/tilt
  coupling, Coriolis, body→nav bias projection, Gauss–Markov bias models), a
  first-order discrete transition `Φ = I + F·dt`, and a loosely-coupled
  position+velocity measurement update (`H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]`) in Joseph
  form. Dependency-free dense linear algebra (Gauss–Jordan inverse, Joseph
  covariance update). A `tight_coupling` cargo feature gates a documented,
  not-yet-implemented pseudorange/Doppler update. 7 tests with hand-derived
  expectations: the skew/cross-product identity, a verified 3×3 inverse,
  covariance staying symmetric/PSD under prediction (and position uncertainty
  growing un-aided), a position fix shrinking the position covariance, exact
  recovery of a known position error at the analytic Kalman gain `P/(P+R)`, and
  smaller corrections under larger measurement noise. This is the kernel that
  will replace the hybrid pack's open-loop truth-snap reset with closed-loop
  feedback (pack wiring + NaveGo validation to follow).
- **Deterministic IMU error model for the 3-axis strapdown navigator (`src/inertial/imu_errors.rs`).**
  `ImuErrorModel` distorts a true body-frame `(ω, f)` pair into a measured one
  through five systematic categories (IEEE Std 952-1997 §A.2; Groves 2013 §4.3,
  Table 4.1): **scale-factor** (per-axis ppm gain error), **misalignment /
  cross-coupling** (off-diagonal triad non-orthogonality), **g-sensitivity** (a
  gyro rate bias proportional to specific force), **quantization** (rounding to
  the output LSB), and **rate-ramp** (a linear-in-time drift — the third Allan
  region), plus a constant turn-on bias. Every term defaults to zero, so
  `ImuErrorModel::ideal()` is a transparent pass-through and existing scenarios
  are unaffected. Each error source has an isolation test (scale linear to <0.01%,
  misalignment cross-axis above the VRW floor, g-sensitivity bias, LSB grid,
  linear ramp), and an end-to-end test drives a navigation error through the
  mechanization from a distorted IMU. Not modelled: vibration rectification error,
  temperature-gradient drift. (The shipped `inertial` scenario pack still runs the
  legacy 1-DOF scalar budget; this model feeds the 3-axis library.)
- **Coning and sculling compensation for the strapdown integrator.** The
  attitude path adds the two-sample `coning_increment` (`½ Δθ_prev × Δθ_cur`); a
  coarse-rate (30 Hz, 5-samples/cycle) integration of a 5 Hz coning environment
  is verified to track fine-rate truth ≥ 3× better with the correction than naive
  increment-summing. The velocity path adds `sculling_increment` (`½ Δθ × Δv`,
  Groves eq. 5.82) and resolves the body velocity increment through a new
  `NavState::step_increments` increment-based update using the body-relative
  rotation `Δθ_rel = Δθ_b − C_n^b ζ`, so an Earth-fixed platform incurs no
  spurious sculling while a genuine vibration triggers the full term.
- **Full three-axis strapdown mechanization in the NED frame (`src/inertial/mechanization.rs`).**
  `NavState { q, v_ned, p_llh }` is advanced by `step(gyro_b, accel_f_b, dt)` using
  the standard terrestrial-frame NED equations (Groves §5.4): body→NED attitude
  corrected for the inertial-to-nav rate `ω_in = ω_ie + ω_en` (Earth rotation +
  transport rate); specific force resolved body→NED through the DCM; velocity
  integrating `v̇ = f_n − (2 ω_ie + ω_en) × v + g_n` (Coriolis/transport + gravity);
  and geodetic position via the meridian/transverse radii of curvature. Gravity is
  the WGS-84 closed-form Somigliana **normal (plumb-bob) gravity** with a NIMA
  free-air altitude correction — never a hard-coded constant. This is the genuine
  three-axis navigator that supersedes the 1-DOF scalar error-budget path. Verified
  by physical invariants: a platform bolted to the rotating Earth at 45°N (sensing
  Earth rate + 1 g) stays within 1 mm over 60 s; a level north specific force gives
  `v_N ≈ a·t` and `½ a t²` displacement; normal gravity matches the known
  equator/pole/45° surface values and the free-air lapse rate.
- **Three-axis attitude representation for strapdown INS (`src/inertial/attitude.rs`).**
  A unit-quaternion `Quaternion` type (scalar-first, Hamilton convention) carrying
  body→nav rotation, with a DCM view (`to_dcm`/`from_dcm` via Shepperd's method),
  Hamilton product, axis-angle and rotation-vector (exact exp-map) constructors,
  and quaternion kinematics — both a first-order RK rate update (`q̇ = ½ q ⊗ ω`)
  and a coning-corrected rotation-vector update. The two-sample `coning_increment`
  (Savage / Bryan–Lewantowski, `½ Δθ_prev × Δθ_cur`) supplies the rotation-rate
  cross-coupling term that scalar dead-reckoning omits. This is the attitude
  foundation for the full 3-axis mechanization that replaces the legacy 1-DOF
  error-budget path. Verified against closed-form rotations: constant-rate
  propagation matches the axis-angle quaternion to 1e-6, DCMs are orthonormal with
  unit determinant, and coning vanishes for single-axis motion. (`src/inertial.rs`
  is now the `src/inertial/` module directory; the public path `crate::inertial`
  is unchanged.)
- **Geodetically-correct ground-station visibility (`src/frames.rs`).**
  `elevation`, `is_visible`, and `visible_count` compute a satellite's elevation
  above a ground station's horizon against the **WGS-84 ellipsoid normal** (the
  true local vertical), not the geocentric radial — the two differ by up to the
  ~0.19° geodetic deflection, enough to flip near-horizon satellites in or out of
  an elevation mask. Verified end-to-end (a Walker constellation propagated,
  rotated TEME→ECEF, and counted from a geodetic site) and against the
  geocentric approximation.

### Changed
- **CI reliability.** The `test-python-bindings` job now builds the wheel with
  `PyO3/maturin-action` (manylinux container) instead of a raw host `maturin
  build`, eliminating an intermittent `rustfmt-preview`/`cargo-fmt` rustup
  conflict on the runner image. The `deny` job installs `cargo-deny` as a
  prebuilt binary via `taiki-e/install-action` instead of the Docker-based
  `cargo-deny-action`, removing a Docker Hub registry-pull timeout. Neither
  change affects the checks performed.

## [0.8.0] - 2026-06-02

### Added
- **Inertial velocity is exposed downstream.** `Propagator::velocity_eci` and
  `Propagator::state_eci` (returning `StateEci { r_m, v_m_s }`) thread the analytic
  TEME velocity SGP4 already computes — previously discarded — through to callers in
  m/s; `Orbit::velocity_eci` gives the Keplerian path a consistent velocity. The
  AIAA 2006-6753 verification test now also checks velocity for every reference row
  (worst velocity error 1.85e-9 km/s across all 666 states) and pins the compared
  row count at exactly 666.
- **Stricter, panic-free TLE parsing.** Lines are required to be ASCII and are
  sliced safely (no more byte-index panics on multi-byte input); elements are
  range-checked (inclination, eccentricity, mean motion); the column-69 checksum
  can be enforced via `ParseOpts { strict_checksum }` / `parse_propagators_opts`
  and the new `strict_checksum` flag on `ConstellationCfg` (lenient by default).
- **Allan-deviation curve in the output.** Each clock run now reports an
  `adev_curve` (`[{tau_s, adev, n_samples}]`) and the browser playground renders a
  log-log "Clock stability (ADEV)" chart.
- **Time-grid input validation.** `TimeCfg::validate` rejects a non-finite, zero,
  negative, or oversized time grid (a step larger than the duration, or more than
  `MAX_TIME_STEPS` samples) before any allocation, so a malformed scenario returns
  an error instead of panicking or exhausting memory.
- **Monte Carlo ensembles for the inertial pack.** `runs = N` on an inertial
  scenario runs N seeds and reports each metric's mean, standard deviation,
  percentiles, and a percentile-bootstrap 95% confidence interval (`ensemble`).
  Every inertial run now carries a `monte_carlo` flag, so a single-realisation FoM
  is no longer mistaken for a distribution. (CEP/2DRMS are intentionally not
  reported — they require the 3-axis model on the roadmap.)
- **Guided playground mode.** The browser playground no longer drops you onto a
  raw TOML wall: a "Start here" strip of one-click scenario cards loads and runs a
  worked example, sliders expose the universal knobs (seed, timing threshold)
  without touching the TOML, a "How to read this" note explains the result, and the
  full TOML is one collapsible away. Every run is shareable — **Copy share link**
  encodes the whole scenario into the URL fragment (nothing is uploaded) so a link
  reproduces the exact run on load. The codec is unit-tested (`web/share.test.mjs`,
  run in CI).
- **N-dimensional parameter sweeps (`src/sweep.rs`).** `nd_sweep` evaluates a
  metric over the full Cartesian product of several `SweepAxis` ranges (the
  multi-parameter trade study), in row-major order, deterministically. Additive —
  the existing 1-D sweep API is unchanged. Per-node bootstrap confidence intervals
  and generalisation beyond the clock pack remain on the roadmap.
- **Real snapshot RAIM (`src/raim.rs`).** Genuine position-domain Receiver
  Autonomous Integrity Monitoring: it builds the line-of-sight geometry to the
  visible satellites, forms the least-squares solution and residuals, runs a χ²
  residual fault-detection test (exact threshold from a dependency-free
  incomplete-gamma χ²/non-central-χ²), and computes slope-based horizontal and
  vertical protection levels (HPL/VPL) with the missed-detection bias derived for
  the configured P_fa/P_md. This is distinct from — and is **not yet wired into** —
  the scenario pipeline's filter-self-consistency Integrity figure; fault
  exclusion, alert-limit/P_HMI budgeting, and ARAIM remain on the roadmap.
- **Frequency-stability suite: MDEV, TDEV, HDEV + confidence intervals**
  (`src/allan.rs`). Alongside the overlapping ADEV: the modified Allan deviation
  (separates white from flicker phase noise), the time deviation
  (`TDEV = tau/sqrt(3) * MDEV`), and the Hadamard deviation (rejects linear
  frequency drift exactly and converges for divergent red-noise types). χ²-based
  confidence intervals (`deviation_ci`) use a dependency-free normal/χ² quantile
  pair (Acklam + Wilson-Hilferty) with a conservative non-overlapping edf;
  noise-type-specific edf and Stable32 numeric parity remain on the roadmap.
- **Reference-frame reduction (`src/frames.rs`).** GMST-based TEME↔ECEF rotation
  (using the same IAU-1982 sidereal time as the propagator), exact WGS-84
  geodetic↔ECEF with a Bowring-seeded iterative inverse (machine-precision at all
  altitudes, including MEO/GEO), and a geodetic ground-station
  observer that returns azimuth / elevation / range in the local East-North-Up
  frame. Polar motion and sub-arcsecond nutation are not applied (GMST-only,
  sub-kilometre on the ground track); an ITRF-precise CIO chain is on the roadmap.
- **Time-scale foundation (`src/timescales.rs`).** A dependency-free Julian-date
  API (Gregorian civil ↔ JD, MJD), the full IERS integer leap-second history
  (UTC↔TAI, 10 s in 1972 to 37 s since 2017), the defined TAI→TT offset, the UT1
  correction via a supplied DUT1, and the IAU-2000 Earth Rotation Angle. This is
  the time substrate that Earth-fixed frame reduction (planned) sits on. Instants
  are single-`f64` Julian Dates (~50 µs resolution near the present epoch; a
  two-part JD is on the roadmap), and the pre-1972 rubber-second era is not
  modelled — both documented in the module.
- **Reproducibility & provenance.** A deterministic CycloneDX SBOM generator
  (`scripts/gen-sbom.sh`) and a SLSA build-provenance attestation on the release
  binary and SBOM; the release toolchain is pinned to match CI. Determinism
  guarantees, the cross-platform `libm` caveat, and the golden-pinning approach are
  documented in `docs/REPRODUCIBILITY.md`.

- **Property-based and fuzz tests** (`tests/property.rs`). Deterministic
  randomized tests (no new dependency) assert invariants over thousands of inputs:
  the TLE and scenario parsers never panic on garbage, non-ASCII, mutated, or
  truncated input; `TimeCfg::validate` never panics on NaN/inf/negative grids; the
  TLE checksum is consistent and column-69-only; geodetic↔ECEF round-trips and the
  TEME→ECEF rotation preserves norm across the globe and a wide altitude band.

### Changed
- Golden tests now **pin the figures of merit field-by-field** for the four
  reference scenarios (with a tolerance that absorbs cross-platform `libm` jitter),
  replacing the earlier inequality-only checks, so a silent numerical regression is
  caught immediately.
- `schema_version` in result artifacts bumped from `0.1` to `0.7` (it was frozen
  while the engine moved on).
- `cargo-deny` now **denies** (not warns on) yanked dependencies.
- New docs: `CAPABILITY.md` (honest scope map), `SCHEMA.md` (result-field
  reference), `INTEGRITY.md`, `QUANTUM-MODELS.md`, `REAL_TLE_GUIDE.md`. A CI guard
  fails if the README version badge drifts from `Cargo.toml`.

## [0.7.0] - 2026-06-02

### Added
- **SGP4/SDP4 orbit propagation.** A full, dependency-free implementation of the
  standard simplified-perturbations propagator — near-Earth SGP4 together with the
  deep-space SDP4 extension (lunar-solar secular and periodic perturbations and
  12 h / 24 h geopotential resonance). It is validated against the official AIAA
  2006-6753 ("Revisiting Spacetrack Report #3") verification vectors: all 666
  reference states across the near-Earth, deep-space, resonant, and error-code
  cases match to a worst-case position error of about 4 mm. This is the model
  two-line element sets are defined against, so it represents real constellations
  — notably the ~12 h GNSS orbits, which are deep-space and resonant and which the
  earlier two-body + J2-secular model cannot capture.
- A constellation given as **full two-line element sets** (line 1 + line 2) is now
  propagated with SGP4/SDP4; a constellation given as line-2-only elements keeps
  the analytic Keplerian two-body propagation, unchanged. The two forms can be
  mixed in one block. New `orbit-sgp4-gps.toml` reference scenario (a GPS-like MEO
  constellation in real two-line format, propagated with SGP4) — drop in a current
  Celestrak "gps-ops" set to study the live constellation.

## [0.6.0] - 2026-06-02

### Added
- **Active spoofing-attack demonstrator.** A new `spoof` scenario kind injects a
  ramping false-time spoof and runs each clock's clock-aided integrity monitor,
  reporting whether and when the spoof is detected and whether it reaches the
  operational spec undetected — turning the Security figure of merit into a concrete
  attack/defence demonstration. New `spoof-attack.toml` reference scenario.
- **Multi-constellation availability.** An orbit scenario can combine several
  constellations (a `[[constellations]]` list alongside the primary
  `[constellation]`) for multi-GNSS availability and dilution of precision — e.g.
  GPS plus Galileo. New `orbit-multignss.toml` reference scenario.

## [0.5.0] - 2026-06-02

### Added
- **HTML scorecard report.** Every run now also produces a self-contained, branded
  HTML scorecard — the one-line summary, the chart (embedded as an inert data-URI
  image), and the full JSON — written by the CLI alongside the JSON and SVG. A
  shareable single-file artifact for a study deliverable or annex.
- **Joint sensor-fusion estimator.** A new `fusion` scenario kind runs a single
  recursive Kalman filter as the navigation solution — fusing the clock state
  `[phase, frequency]` and the position state `[position, velocity]`, disciplined by
  GNSS (learning the frequency offset and velocity) and aided by optical time
  transfer during the outage — rather than composing independent predictors. It
  reports fused timing/position holdover and a joint-covariance integrity. New
  `fusion-pnt.toml` reference scenario.
- **Fuller IMU noise model.** The accelerometer now models the remaining
  Allan-variance terms beyond the constant bias and velocity random walk:
  **bias instability** (a 1/f flicker floor at the standard Allan bias-instability
  coefficient, reusing the clock's flicker synthesis) and **acceleration random
  walk**. New optional `bias_instability` and `q_aa` inertial scenario fields; a
  GNSS re-fix re-calibrates the residual bias drift.
- **Real constellation geometry from TLEs.** A constellation can be given as a block
  of two-line element sets (the standard NORAD/Celestrak format) via a `tle` field,
  so availability and dilution of precision use a real constellation's published
  geometry instead of a synthetic Walker pattern. The engine reads each TLE's mean
  Keplerian elements and propagates them two-body — not SGP4 — which is sound for a
  snapshot study from a common epoch. New `orbit-real-tle.toml` reference scenario.

## [0.4.0] - 2026-06-02

### Added
- **Trade-study parameter sweeps.** A new `sweep` scenario kind varies one
  parameter (`threshold_ns`, `duration_s`, `quantum_q_wf`, or `classical_q_wf`)
  across a linear or logarithmic range and records a chosen figure of merit at each
  point for both clocks, producing the "how does holdover scale with clock
  stability?" comparison chart a design trade needs. New `sweep-clock-stability.toml`
  reference scenario.
- **Monte Carlo confidence bands.** The clock-holdover scenario can run many
  realizations (new optional `runs` field): each figure of merit is then reported
  as a mean with a 5th–95th-percentile spread, and the chart shades the 5–95%
  error envelope around the median for each clock. A single run remains the default.
  New `clock-ensemble.toml` reference scenario.
- **Eccentric orbits and J2 drift.** The orbit type is now a full Keplerian orbit
  (semi-major axis, eccentricity, inclination, RAAN, argument of perigee, mean
  anomaly), propagated by solving Kepler's equation, with optional secular J2 nodal
  regression and apsidal precession. New optional `eccentricity`, `argp_deg`, and
  `j2` scenario fields, and an `orbit-molniya.toml` reference scenario (a 12 h
  highly-eccentric critically-inclined user). Circular orbits keep the original
  closed-form path bit-for-bit.
- The hybrid (combined-PNT) pack now reports **Integrity** and **Security**, so all
  four packs cover the full set of operational figures of merit. Integrity is the
  timing-channel protection-bound containment from a Kalman estimator disciplined to
  truth while GNSS is nominal and re-anchored (more loosely) at each optical re-sync;
  its bound includes the link's measurement-noise floor, so a clock far better than
  the link is scored against the delivered solution's actual noise. Security is the
  clock-aided spoof-detection score against the timing spec.

### Changed
- Release notes are now generated from the curated CHANGELOG section for the tag
  (`scripts/changelog-extract.sh`), so each GitHub release highlights what changed
  instead of listing raw commits.

## [0.3.0] - 2026-06-02

### Added
- **Security** figure of merit (previously unpopulated): a clock-aided
  spoof-detection score for the clock-holdover and orbit packs. It models an
  integrity monitor that cross-checks GNSS-derived time against the clock's own
  coasted prediction over a coherent window; the detection floor combines the
  averaged measurement noise with the clock's coast uncertainty, so a quieter
  clock detects smaller, slower time-spoofs. The score is reported in `[0, 1]`
  relative to the timing spec, completing the six operational figures of merit.
- Geometry-derived **position accuracy** for the orbit pack: from the
  line-of-sight geometry to the visible satellites it forms the design matrix
  and its covariance factor `Q = (HᵀH)⁻¹`, yielding the dilution-of-precision
  factors (GDOP/PDOP/HDOP/VDOP/TDOP). Position accuracy is the position DOP
  scaled by a configurable user-equivalent range error (new optional
  `sigma_uere_m` scenario field). An orbit result now carries a geometry summary
  (fraction of samples with a fix, best and median PDOP and position sigma).
- An in-browser **playground** (`web/`) that runs the engine client-side as
  WebAssembly: pick a reference scenario or edit the TOML, run it, and see the
  summary, chart, and full JSON, with nothing uploaded. A `pages` workflow
  builds and publishes it to GitHub Pages, and a new `summary` WebAssembly export
  backs the readout.
- Labelled y-axes on the SVG charts: gridlines, numeric tick labels, and a units
  axis title (via a shared `chart` helper), so magnitudes are readable.
- Package-publishing workflow (`publish`) for crates.io, PyPI, and npm, each
  gated on its registry token and triggered by a published release.

## [0.2.0] - 2026-06-02

### Added
- Flicker (1/f) FM floor for the clock error model, synthesised as a sum of
  log-spaced Ornstein-Uhlenbeck processes and calibrated so the flat
  Allan-deviation floor sits at a configurable level. Off by default; enabled
  per clock via the optional `flicker_floor` scenario field.
- Gyro channel for the inertial model: residual gyro bias and angular random
  walk drive an attitude (tilt) error that couples gravity into a horizontal
  specific-force error, the dominant strapdown error-growth mechanism. Off by
  default; enabled per sensor via the optional `gyro_bias` and `q_arw` fields.
- Two-state (phase, frequency) Kalman clock estimator with exact van Loan
  process-noise discretisation. Coasting from a known state reproduces the
  analytic holdover error growth (`q_wf*T + q_rw*T^3/3`) exactly, and the filter
  additionally yields an online 1-sigma uncertainty bound.
- The clock run now reports the **Integrity** figure of merit (previously
  unpopulated): the fraction of outage samples whose error stays inside the
  filter's 3-sigma protection bound, surfaced in the JSON result and CLI summary.
- Geometry-derived GNSS availability: circular-orbit propagation, a Walker-delta
  constellation generator, and line-of-sight visibility (Earth-occultation plus
  elevation mask) produce the availability timeline from real orbital geometry.
  New `orbit` scenario kind and the `orbit-gnss-challenged.toml` reference
  scenario (a spacecraft inside the GNSS shell with intermittent coverage).
- Optional Python extension (PyO3, abi3) exposing `run`, `run_full`, and
  `version`, packaged with maturin (`pyproject.toml`) and built for Linux, macOS,
  and Windows by a release-tag `wheels` workflow. The binding is a feature-gated,
  optional dependency: the default build, tests, and dependency-audit gate are
  unaffected.
- Optional WebAssembly module (wasm-bindgen) exposing `run`, `chart_svg`, and
  `version`, built with wasm-pack under the `wasm` feature; `getrandom` is
  target-gated to use the browser entropy source on `wasm32`.
- Shared `api::run_toml` dispatch used by the CLI and both bindings, so the
  command line and the bindings cannot drift.

### Changed
- Holdover scoring is now segment-aware: outage timelines are split into
  contiguous segments at GNSS re-acquisition, and the reported holdover is the
  worst-case (shortest) coast across them. Single-outage scenarios are
  unchanged. Applies to the clock, inertial, and hybrid scorers.
- The inertial model's reported `kind` is now `inertial` (was `accelerometer`),
  reflecting the combined accelerometer and gyro channels.

## [0.1.0] - 2026-06-01

Initial release.

### Added
- **Deterministic simulation engine** for hybrid quantum/classical PNT: a common
  error-model interface, declarative GNSS-availability scenarios, holdover /
  dead-reckoning estimators, and figure-of-merit scoring against the standard
  operational PNT criteria. Results are reproducible from `scenario + seed + engine
  version` (versioned, self-describing JSON with a scenario hash) and rendered as SVG
  charts. The CLI dispatches scenarios by `kind`.
- **Four sensor packs**, each calibrated to published data and validated against the
  standard relation:
  - **Clock holdover** — white FM, random-walk FM, and linear aging; validated by
    overlapping Allan deviation (Riley, NIST SP 1065). Chip-scale atomic clock vs
    strontium optical lattice clock.
  - **Inertial dead-reckoning** — residual bias + velocity random walk, double
    integrated to position error; validated against Groves' error-growth relations.
    Cold-atom vs navigation-grade accelerometer.
  - **Time transfer** — optical vs RF link timing jitter → synchronization precision →
    one-way ranging.
  - **Hybrid fusion (capstone)** — a combined PNT suite that must hold both timing and
    position, with optional optical inter-satellite time-transfer clock-aiding.
- **One cited reference scenario per pack** under `scenarios/`, every numeric
  parameter carrying a peer-reviewed `provenance`.
- **Reproducibility and repository-hygiene guards**; CI (format, clippy, tests,
  guards, MSRV) and a tag-gated release pipeline that re-runs all checks.
- **Documentation**: README with architecture diagrams, validation-status report,
  contributing guide, security policy, and code of conduct; Apache-2.0 license;
  issue/PR templates and Dependabot configuration.
- Vendor-neutral throughout; peer-reviewed scientific and metrology citations retained.
- Apache-2.0 license hygiene: SPDX headers on all sources, a `NOTICE` with trademark
  notice, Developer Certificate of Origin (DCO) sign-off for contributions, and
  `cargo-deny` enforcement of dependency licenses/advisories in CI.
- Open-core positioning (README): a free Apache-2.0 engine plus available commercial
  support, integration, and proprietary extensions from Ashforde OÜ — sustained by
  services, not license fees.
- `CITATION.cff` so the software can be cited.

[Unreleased]: https://github.com/AshfordeOU/kshana/compare/v0.8.0...HEAD
[0.8.0]: https://github.com/AshfordeOU/kshana/compare/v0.7.0...v0.8.0
[0.7.0]: https://github.com/AshfordeOU/kshana/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/AshfordeOU/kshana/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/AshfordeOU/kshana/compare/v0.4.0...v0.5.0
[0.4.0]: https://github.com/AshfordeOU/kshana/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/AshfordeOU/kshana/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/AshfordeOU/kshana/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/AshfordeOU/kshana/releases/tag/v0.1.0
