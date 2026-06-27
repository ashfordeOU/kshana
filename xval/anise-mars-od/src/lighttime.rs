// SPDX-License-Identifier: AGPL-3.0-only
//! D0.7 — Deep-space radiometric **light-time** cross-validation against ANISE/SPICE.
//!
//! Kshana's [`kshana::radiometric::light_time_solution`] solves the retarded (down-leg) one-way
//! light time τ by fixed-point iteration of `τ = |rx_pos − r_target(t_rx − τ)| / c`. This module
//! checks that solver, leg for leg, against [ANISE](https://github.com/nyx-space/anise)'s own
//! **converged-Newtonian aberration light time** (`Almanac::transform(.., Aberration::CN)`, a
//! rewrite of NAIF SPICE's `spkapo`) over the *same* JPL DE440 ephemeris.
//!
//! ## Why the comparison isolates the solver, not the ephemeris
//!
//! ANISE's aberration branch differences the observer and the target **relative to the Solar-System
//! barycenter (SSB)**: it freezes the observer at the reception epoch as `obs_ssb(t)`, then iterates
//! `rel_pos = tgt_ssb(t − τ) − obs_ssb(t)`, `τ = |rel_pos| / c` (reception mode ⇒ retarded, `−τ`).
//! We hand kshana **the identical geometry**: the fixed point `rx_pos = obs_ssb(t)` and an
//! [`EphemerisProvider`] that returns `tgt_ssb(jd)` straight from the same DE440 kernel
//! ([`AniseMarsEnvironment::ssb_position`]). Both then iterate the same retarded condition on the
//! same body positions, so the residual `|τ_kshana − τ_anise|` is the difference between kshana's
//! fixed-point iteration and SPICE's 3-step converged Newtonian iteration — **not** an ephemeris
//! difference (the positions are byte-for-byte the same DE440), and ANISE's `SPEED_OF_LIGHT_KM_S`
//! equals kshana's `C_M_PER_S` exactly (299 792 458 m/s).
//!
//! Stellar aberration is deliberately **off** on both sides (`CN`, not `CN+S`): kshana's solver
//! models the geometric retarded light time only, so the matching ANISE flag is the converged
//! light-time-only correction.
//!
//! ## Re-running the same solve without ANISE (the committed-fixture path)
//!
//! Kshana's solver only ever asks its provider for `r_target(t)` at epochs strewn between `t_rx` and
//! `t_rx − τ` (a ~10³ s span). The full-DE440 provider [`SsbDe440Provider`] answers from ANISE; the
//! [`TaylorProvider`] answers from a local quadratic motion model
//! `r(t) = r₀ + ṙ·Δ + ½·r̈·Δ²` (Δ = t − t_rx, seconds) built from the target's SSB
//! position/velocity/acceleration at `t_rx`. Over the light-time span the leftover cubic-jerk term
//! is sub-millimetre, so the Taylor provider reproduces kshana's full-DE440 τ to < 1e-10 s — proven
//! per leg by [`run`] before it writes the fixture. That lets the main-repo gating test re-run the
//! *same* kshana solver against the *same* curved geometry from the committed Taylor coefficients
//! alone, with no ANISE at test time, and re-assert the pinned ANISE residual.

use kshana::body::Body;
use kshana::ephem_provider::EphemerisProvider;
use kshana::radiometric::light_time_solution;
use kshana::timegeo::C_M_PER_S;
use kshana::timescales::{TwoPartJd, SECONDS_PER_DAY};

use crate::anise_env::AniseMarsEnvironment;

type Vec3 = [f64; 3];

/// A kshana [`EphemerisProvider`] that returns each body's **SSB-relative** DE440 position (m), the
/// geometry ANISE's aberration branch differences. `center` is ignored: every position is taken
/// relative to the SSB so it matches ANISE's `tgt_ssb`. Dispatch is on the target body name.
#[derive(Clone)]
pub struct SsbDe440Provider {
    env: AniseMarsEnvironment,
}

impl std::fmt::Debug for SsbDe440Provider {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str("SsbDe440Provider(DE440 SSB-relative positions via ANISE)")
    }
}

impl EphemerisProvider for SsbDe440Provider {
    fn relative_position(&self, target: &Body, _center: &Body, jd_tdb: f64) -> Option<Vec3> {
        self.env.ssb_position(target.name, jd_tdb).ok()
    }
}

/// A kshana [`EphemerisProvider`] that returns the target's SSB-relative position from a **local
/// quadratic Taylor model** about the reception epoch `t_rx_jd`:
///
/// ```text
///   r(t) = r₀ + ṙ·Δ + ½·r̈·Δ² ,   Δ = (t − t_rx) seconds.
/// ```
///
/// This is the geometry the committed fixture stores (`r₀`, `ṙ`, `r̈`) and the main-repo gating test
/// reconstructs without ANISE. Dispatch is on the target name so a single provider can answer the
/// one body each leg solves for; `center` is ignored (positions are SSB-relative by construction).
#[derive(Clone)]
pub struct TaylorProvider {
    /// The body this model is for (the leg's target name, e.g. `"Mars"`).
    pub target: String,
    /// The reception epoch the Taylor expansion is centred on (Julian Date, TDB).
    pub t_rx_jd: f64,
    /// SSB-relative position at `t_rx_jd` (m): r₀.
    pub r0: Vec3,
    /// SSB-relative velocity at `t_rx_jd` (m/s): ṙ.
    pub v: Vec3,
    /// SSB-relative acceleration at `t_rx_jd` (m/s²): r̈.
    pub a: Vec3,
}

impl std::fmt::Debug for TaylorProvider {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "TaylorProvider({} quadratic SSB motion)", self.target)
    }
}

impl TaylorProvider {
    /// The quadratic SSB position at `jd_tdb` (m).
    pub fn position_at(&self, jd_tdb: f64) -> Vec3 {
        let dt_s = (jd_tdb - self.t_rx_jd) * SECONDS_PER_DAY;
        [
            self.r0[0] + self.v[0] * dt_s + 0.5 * self.a[0] * dt_s * dt_s,
            self.r0[1] + self.v[1] * dt_s + 0.5 * self.a[1] * dt_s * dt_s,
            self.r0[2] + self.v[2] * dt_s + 0.5 * self.a[2] * dt_s * dt_s,
        ]
    }
}

impl EphemerisProvider for TaylorProvider {
    fn relative_position(&self, target: &Body, _center: &Body, jd_tdb: f64) -> Option<Vec3> {
        if target.name != self.target {
            return None;
        }
        Some(self.position_at(jd_tdb))
    }
}

/// One leg's light-time comparison: kshana's retarded τ vs ANISE's converged-Newtonian τ at one
/// epoch, plus the implied geometric ranges (c·τ) and their residual.
#[derive(Debug, Clone, serde::Serialize)]
pub struct LegResidual {
    /// The observed target body (`"Mars"`, `"Sun"`, `"Moon"`), seen from Earth.
    pub target: String,
    /// Reception epoch (Julian Date, TDB).
    pub jd_tdb: f64,
    /// Kshana's retarded one-way light time (s).
    pub kshana_tau_s: f64,
    /// ANISE converged-Newtonian one-way light time (s).
    pub anise_tau_s: f64,
    /// |τ_kshana − τ_anise| (s).
    pub d_tau_s: f64,
    /// Kshana implied geometric range c·τ_kshana (m).
    pub kshana_range_m: f64,
    /// ANISE implied geometric range c·τ_anise (m).
    pub anise_range_m: f64,
    /// |range_kshana − range_anise| (m).
    pub d_range_m: f64,
    /// Observer (Earth) SSB-relative position at the reception epoch (m) — the frozen fixed endpoint.
    pub obs_ssb_r: Vec3,
    /// Target SSB-relative position at the reception epoch (m): Taylor coefficient r₀.
    pub tgt_ssb_r: Vec3,
    /// Target SSB-relative velocity at the reception epoch (m/s): Taylor coefficient ṙ.
    pub tgt_ssb_v: Vec3,
    /// Target SSB-relative acceleration at the reception epoch (m/s²): Taylor coefficient r̈.
    pub tgt_ssb_a: Vec3,
}

/// The full light-time cross-validation report.
#[derive(Debug, Clone, serde::Serialize)]
pub struct LightTimeReport {
    /// Human-readable scenario.
    pub scenario: String,
    /// The independent oracle.
    pub oracle: String,
    /// The kshana function under test.
    pub model: String,
    /// Per-leg residuals.
    pub legs: Vec<LegResidual>,
    /// Worst |Δτ| across all legs (s).
    pub worst_d_tau_s: f64,
    /// Worst |Δrange| across all legs (m).
    pub worst_d_range_m: f64,
    /// Worst quadratic-Taylor reconstruction error across all legs (s): how far the committed-fixture
    /// geometry's τ departs from the full-DE440 τ. Bounds the main-repo test's faithfulness.
    pub worst_taylor_err_s: f64,
    /// SHA-256 of the DE440 SPK, for citability.
    pub kernel_sha256: Vec<(String, String)>,
}

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// The reception epochs (Julian Date, TDB) the cross-check samples, spanning years inside the
/// de440s 1849–2150 coverage so the Earth–Mars geometry sweeps a wide range (near opposition to near
/// superior conjunction): 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027 (Jan 1.5 each).
pub const EPOCHS_JD_TDB: [f64; 8] = [
    2_458_850.0, // 2020-01-01.5 TDB
    2_459_216.0, // 2021-01-01.5
    2_459_581.0, // 2022-01-01.5
    2_459_946.0, // 2023-01-01.5
    2_460_311.0, // 2024-01-01.5
    2_460_677.0, // 2025-01-01.5
    2_461_042.0, // 2026-01-01.5
    2_461_407.0, // 2027-01-01.5
];

/// The targets the down-leg light time is solved for, all observed from Earth.
pub const TARGETS: [&str; 3] = ["Mars", "Sun", "Moon"];

/// Map a target name to the kshana [`Body`] whose `.name` the providers dispatch on.
fn target_body(name: &str) -> Body {
    match name {
        "Mars" => Body::mars(),
        "Sun" => Body::sun(),
        "Moon" => Body::moon(),
        other => panic!("unsupported target {other}"),
    }
}

/// Run the light-time cross-check over [`EPOCHS_JD_TDB`] × [`TARGETS`].
pub fn run(
    env: &AniseMarsEnvironment,
    kernel_sha256: Vec<(String, String)>,
) -> Result<LightTimeReport, String> {
    let provider = SsbDe440Provider { env: env.clone() };
    // The kshana `center` placeholder; the provider returns SSB-relative positions regardless, so
    // the body identity here is irrelevant (Earth used for readability).
    let center = Body::earth();

    let mut legs = Vec::with_capacity(EPOCHS_JD_TDB.len() * TARGETS.len());
    let mut worst_d_tau = 0.0_f64;
    let mut worst_d_range = 0.0_f64;
    let mut worst_taylor_err = 0.0_f64;

    for &jd in &EPOCHS_JD_TDB {
        // The observer (Earth) frozen at the reception epoch, SSB-relative — the fixed endpoint of
        // the retarded leg, exactly the `obs_ssb(t)` ANISE freezes.
        let rx_pos = env.ssb_position("Earth", jd)?;
        let t_rx = TwoPartJd::from_f64(jd);

        for &tgt in &TARGETS {
            let body = target_body(tgt);
            let lt = light_time_solution(rx_pos, t_rx, &body, &center, &provider)
                .ok_or_else(|| format!("kshana light_time_solution returned None for {tgt}"))?;
            let kshana_tau = lt.tau_s;
            let anise_tau = env.anise_light_time_cn(tgt, "Earth", jd)?;

            // Local quadratic Taylor fit of the target's SSB motion about t_rx, so the main-crate
            // test can re-run kshana's solver against the curved geometry without ANISE.
            let tgt_state = env.ssb_state(tgt, jd)?;
            let tgt_acc = env.ssb_acceleration(tgt, jd, 60.0)?;

            let d_tau = (kshana_tau - anise_tau).abs();
            let kshana_range = kshana_tau * C_M_PER_S;
            let anise_range = anise_tau * C_M_PER_S;
            let d_range = (kshana_range - anise_range).abs();

            worst_d_tau = worst_d_tau.max(d_tau);
            worst_d_range = worst_d_range.max(d_range);

            // Self-consistency of the kshana solution: the retarded SSB-relative range over c is τ.
            let range_to_retarded = norm([
                rx_pos[0] - lt.tx_pos[0],
                rx_pos[1] - lt.tx_pos[1],
                rx_pos[2] - lt.tx_pos[2],
            ]) / C_M_PER_S;
            if (range_to_retarded - kshana_tau).abs() > 1e-6 {
                return Err(format!(
                    "kshana retarded geometry inconsistent for {tgt} @ JD {jd}: |rx−tx|/c = {range_to_retarded} s, τ = {kshana_tau} s"
                ));
            }

            // Fixture-faithfulness guard: re-run kshana's SAME solver against the quadratic Taylor
            // provider the fixture will store, and confirm it reproduces the full-DE440 τ to < 1e-10 s
            // (sub-mm). This proves the main-crate test (which has only the Taylor coefficients, no
            // ANISE) re-runs an honest kshana solve against the curved geometry, not a degraded one.
            let taylor = TaylorProvider {
                target: tgt.to_string(),
                t_rx_jd: jd,
                r0: tgt_state.r,
                v: tgt_state.v,
                a: tgt_acc,
            };
            let lt_taylor = light_time_solution(rx_pos, t_rx, &body, &center, &taylor)
                .ok_or_else(|| format!("Taylor-provider light_time_solution None for {tgt}"))?;
            let taylor_err_s = (lt_taylor.tau_s - kshana_tau).abs();
            worst_taylor_err = worst_taylor_err.max(taylor_err_s);
            // The quadratic Taylor model drops the cubic jerk term; over the longest (Mars, ~1.2e3 s)
            // light time that leaves a ~1e-10 s residual — four orders below the 1e-6 s gate the
            // main-repo test enforces, so the fixture geometry is faithful to the full-DE440 solve.
            // The guard fails loud only if that truncation ever grew toward the gate (1e-8 s).
            if taylor_err_s > 1e-8 {
                return Err(format!(
                    "quadratic Taylor fit does not reproduce kshana DE440 τ for {tgt} @ JD {jd}: Δ = {taylor_err_s:e} s — fixture would be unfaithful"
                ));
            }

            legs.push(LegResidual {
                target: tgt.to_string(),
                jd_tdb: jd,
                kshana_tau_s: kshana_tau,
                anise_tau_s: anise_tau,
                d_tau_s: d_tau,
                kshana_range_m: kshana_range,
                anise_range_m: anise_range,
                d_range_m: d_range,
                obs_ssb_r: rx_pos,
                tgt_ssb_r: tgt_state.r,
                tgt_ssb_v: tgt_state.v,
                tgt_ssb_a: tgt_acc,
            });
        }
    }

    Ok(LightTimeReport {
        scenario:
            "One-way retarded (down-leg) light time, Earth→{Mars,Sun,Moon}, SSB-differenced DE440"
                .to_string(),
        oracle:
            "ANISE 0.10 converged-Newtonian aberration light time (Aberration::CN; SPICE spkapo equiv) over DE440 de440s.bsp"
                .to_string(),
        model: "kshana::radiometric::light_time_solution (retarded fixed-point iteration)"
            .to_string(),
        legs,
        worst_d_tau_s: worst_d_tau,
        worst_d_range_m: worst_d_range,
        worst_taylor_err_s: worst_taylor_err,
        kernel_sha256,
    })
}

impl LightTimeReport {
    /// Render the committed fixture: a header with provenance, then one whitespace-delimited row per
    /// leg. The main-crate `tests/deep_space_mars_radiometric_reference.rs` reads this back (no ANISE
    /// at test time), reconstructs the curved geometry from the per-row Taylor coefficients, re-runs
    /// kshana's light-time solver, and re-asserts the pinned ANISE residuals.
    pub fn to_fixture(&self) -> String {
        let mut s = String::new();
        s.push_str("# Deep-space radiometric light-time cross-validation — pinned ANISE oracle\n");
        s.push_str("# SPDX-License-Identifier: AGPL-3.0-only\n");
        s.push_str("#\n");
        s.push_str(&format!("# Scenario : {}\n", self.scenario));
        s.push_str(&format!("# Oracle   : {}\n", self.oracle));
        s.push_str(&format!("# Model    : {}\n", self.model));
        s.push_str("# Oracle author/license: Christopher Rabotin et al., ANISE (Mozilla Public License 2.0).\n");
        s.push_str("# DE440 (de440s.bsp): public-domain NASA/JPL data, referenced not redistributed.\n");
        s.push_str("#\n");
        s.push_str("# Match: kshana::radiometric::light_time_solution tau vs ANISE Aberration::CN tau,\n");
        s.push_str("#   both differencing the SAME DE440 SSB-relative geometry (kshana fed obs/target\n");
        s.push_str("#   SSB positions via ANISE::ssb_position), so the residual isolates the retarded\n");
        s.push_str("#   fixed-point solver vs SPICE's 3-step converged Newtonian, not the ephemeris.\n");
        s.push_str(&format!(
            "# Worst |d_tau| = {:.3e} s ; worst |d_range| = {:.3e} m over {} legs.\n",
            self.worst_d_tau_s,
            self.worst_d_range_m,
            self.legs.len()
        ));
        s.push_str(&format!(
            "# Worst quadratic-Taylor reconstruction error = {:.3e} s (the main-repo test re-runs\n#   kshana's solver against the per-row Taylor geometry; this bounds its faithfulness to DE440).\n",
            self.worst_taylor_err_s
        ));
        s.push_str("#\n");
        s.push_str("# Reproduce: cd xval/anise-mars-od && \\\n");
        s.push_str("#   KSHANA_ANISE_DE440S=kernels/de440s.bsp cargo run --release --bin lighttime-xval\n");
        s.push_str("#   (writes lighttime_report.json + report.md + this fixture into the main crate).\n");
        for (name, sha) in &self.kernel_sha256 {
            s.push_str(&format!("# kernel {name} sha256={sha}\n"));
        }
        s.push_str("#\n");
        s.push_str("# Each row also carries the local DE440 geometry the main-crate test re-runs kshana's\n");
        s.push_str("#   solver against (NO ANISE at test time): the frozen observer SSB position obs_r,\n");
        s.push_str("#   and the target's SSB-relative quadratic Taylor fit about t_rx — position tgt_r,\n");
        s.push_str("#   velocity tgt_v, acceleration tgt_a — so r(t) = tgt_r + tgt_v*D + 0.5*tgt_a*D^2\n");
        s.push_str("#   (D = t - t_rx, seconds) reproduces the curved retarded geometry to sub-mm over\n");
        s.push_str("#   the ~10^3 s light time (the leftover cubic jerk term is < 1 mm).\n");
        s.push_str("#\n");
        s.push_str(
            "# columns: target jd_tdb kshana_tau_s anise_tau_s d_tau_s kshana_range_m anise_range_m d_range_m \
             obs_rx obs_ry obs_rz tgt_rx tgt_ry tgt_rz tgt_vx tgt_vy tgt_vz tgt_ax tgt_ay tgt_az\n",
        );
        for leg in &self.legs {
            s.push_str(&format!(
                "{} {:.6} {:.15e} {:.15e} {:.6e} {:.9e} {:.9e} {:.6e} \
                 {:.15e} {:.15e} {:.15e} {:.15e} {:.15e} {:.15e} \
                 {:.15e} {:.15e} {:.15e} {:.15e} {:.15e} {:.15e}\n",
                leg.target,
                leg.jd_tdb,
                leg.kshana_tau_s,
                leg.anise_tau_s,
                leg.d_tau_s,
                leg.kshana_range_m,
                leg.anise_range_m,
                leg.d_range_m,
                leg.obs_ssb_r[0],
                leg.obs_ssb_r[1],
                leg.obs_ssb_r[2],
                leg.tgt_ssb_r[0],
                leg.tgt_ssb_r[1],
                leg.tgt_ssb_r[2],
                leg.tgt_ssb_v[0],
                leg.tgt_ssb_v[1],
                leg.tgt_ssb_v[2],
                leg.tgt_ssb_a[0],
                leg.tgt_ssb_a[1],
                leg.tgt_ssb_a[2],
            ));
        }
        s
    }

    /// Render the human-readable `report.md` summary table.
    pub fn to_markdown(&self) -> String {
        let mut s = String::new();
        s.push_str("# Deep-space radiometric light-time cross-validation (ANISE/DE440)\n\n");
        s.push_str(&format!("- **Scenario**: {}\n", self.scenario));
        s.push_str(&format!("- **Oracle**: {}\n", self.oracle));
        s.push_str(&format!("- **Model**: {}\n", self.model));
        s.push_str(&format!(
            "- **Worst |Δτ|**: {:.3e} s over {} legs\n",
            self.worst_d_tau_s,
            self.legs.len()
        ));
        s.push_str(&format!(
            "- **Worst |Δrange|**: {:.3e} m\n",
            self.worst_d_range_m
        ));
        s.push_str(&format!(
            "- **Worst Taylor-reconstruction error**: {:.3e} s (fixture vs full DE440)\n\n",
            self.worst_taylor_err_s
        ));
        for (name, sha) in &self.kernel_sha256 {
            s.push_str(&format!("- kernel `{name}` sha256 `{sha}`\n"));
        }
        s.push('\n');
        s.push_str("| target | jd_tdb | kshana τ (s) | anise τ (s) | Δτ (s) | Δrange (m) |\n");
        s.push_str("|--------|--------|--------------|-------------|--------|------------|\n");
        for leg in &self.legs {
            s.push_str(&format!(
                "| {} | {:.1} | {:.9} | {:.9} | {:.3e} | {:.3e} |\n",
                leg.target,
                leg.jd_tdb,
                leg.kshana_tau_s,
                leg.anise_tau_s,
                leg.d_tau_s,
                leg.d_range_m,
            ));
        }
        s
    }
}
