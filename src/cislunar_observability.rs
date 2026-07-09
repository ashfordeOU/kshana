// SPDX-License-Identifier: AGPL-3.0-only
//! `cislunar-observability` scenario — planar cislunar constellation observability (P6).
//!
//! A small planar four-spacecraft cislunar constellation near the Moon is tracked by
//! inter-satellite ranging. The scenario answers the single question a batch estimator
//! designer needs before committing: *how much of a spacecraft's four-state
//! `[x, y, ẋ, ẏ]` does the arc actually make observable, and how does that grow with arc
//! length?* It assembles the observability structure of [`crate::observability_gramian`]
//! from the crate's finite-difference-validated CR3BP variational STM and the analytic
//! inter-satellite range/range-rate Jacobians, and emits three honest artifacts:
//!
//! 1. the **rank-vs-arc-length** table for a single range-only link — instantaneously
//!    rank-1, growing toward the full four-state as the arc lengthens (paper P6 Table 1);
//! 2. the observability **Gramian eigen-spectrum** and condition number over the arc; and
//! 3. the **range-only vs range+range-rate** instantaneous-rank comparison — the Doppler
//!    design lever that lifts a single snapshot off rank-1.
//!
//! 4. the **SRIF cross-validation** of the rank transition: an independent square-root
//!    information filter ([`crate::deepspace_od::Srif`], via [`crate::cislunar_srif`]) folds
//!    the same observability rows and its posterior covariance turns finite / well-conditioned
//!    *exactly* at the arc where the observable rank reaches the full four-state, with a
//!    condition number that tracks the Gramian conditioning (P6 rank-only → Validated against
//!    an independent estimator).
//!
//! ## Validated vs Modelled
//! * **Validated.** The rank is a rank-revealing singular-value threshold, cross-checked
//!   against the Gramian eigen-rank; the eigen-spectrum obeys the spectral invariants
//!   (`trace = Σλ`, `det = Πλ`); the STM is the finite-difference-validated CR3BP
//!   variational matrix; the range/range-rate Jacobian rows are finite-difference-validated
//!   analytic partials. The constellation initial conditions are **differential-corrected
//!   planar DROs** ([`crate::dro`]) that close to a tight periodicity residual and are
//!   retrograde. The rank transition is cross-validated against an independent SRIF estimator
//!   ([`crate::cislunar_srif`]). (See the unit tests of the underlying modules.)
//! * **Modelled.** The constellation *design* (which perilune amplitudes and phases the four
//!   DROs take) is a scenario choice, and the *specific* rank progression it produces is a
//!   property of that geometry, not a certified universal.

use crate::cislunar_srif::{full_rank_transition, srif_cross_validation, SrifArcPoint};
use crate::cr3bp::{EARTH_MOON_MU, SIDEREAL_MONTH_DAYS};
use crate::intersat_range::{range_rate_row, range_row, PlanarState};
use crate::observability_gramian::{
    cislunar_gdop, gramian, gramian_spectrum, range_vs_range_rate_rank, rank_vs_arc, CislunarGdop,
    GramianSpectrum, Mat, ObsEpoch, RankArcPoint, RankLever, N_PLANAR,
};
use serde::Deserialize;
use std::sync::OnceLock;

/// A differential-corrected DRO constellation member: the parent planar DRO's provenance and
/// the phased planar state this spacecraft rides.
#[derive(Clone, Debug)]
struct DroMember {
    /// The phased planar constellation state `[x, y, ẋ, ẏ]`.
    state: PlanarState,
    /// Perilune amplitude of the parent DRO (km).
    perilune_km: f64,
    /// Periodicity residual of the parent DRO (nondimensional closure error) — the Validated
    /// closure anchor.
    periodicity_residual: f64,
    /// Full period of the parent DRO (rotating-frame time units).
    period: f64,
    /// Phase fraction of the period at which this member rides the DRO.
    phase: f64,
}

/// The default four-spacecraft cislunar constellation: differential-corrected planar DROs at
/// prescribed perilune amplitudes (index 0 the chief, 1.. the beacons), each ridden at a distinct
/// phase so the constellation spans the plane. Built once for the Earth–Moon mass ratio and cached
/// (the differential correction is deterministic but not free), so repeated scenario runs are
/// cheap and byte-identical.
fn dro_constellation() -> &'static [DroMember] {
    static CELL: OnceLock<Vec<DroMember>> = OnceLock::new();
    CELL.get_or_init(|| {
        let mu = EARTH_MOON_MU;
        // (perpendicular-crossing distance from the Moon, phase fraction). The crossing distances
        // place the perilunes across ~18,000–44,000 km — within the ~11,500–46,000 km distant-
        // retrograde band — and the phases spread the members off the x-axis.
        let design = [
            (0.070_f64, 0.00_f64), // chief
            (0.048, 0.20),         // reference 0
            (0.095, 0.44),         // reference 1
            (0.118, 0.66),         // reference 2
        ];
        design
            .iter()
            .map(|&(d, phase)| {
                let dro = crate::dro::dro_from_crossing((1.0 - mu) + d, mu, 1e-12, 60)
                    .expect("cislunar constellation DRO must differential-correct");
                DroMember {
                    state: crate::dro::state_at(&dro, mu, phase, 24_000),
                    perilune_km: dro.perilune_km,
                    periodicity_residual: dro.periodicity_residual,
                    period: dro.period,
                    phase,
                }
            })
            .collect()
    })
}

/// The honesty label carried on the result document.
const LABEL: &str = "MODELLED planar cislunar constellation observability (P6). VALIDATED \
core: the observable RANK is a rank-revealing singular-value threshold cross-checked \
against the Gramian eigen-rank; the Gramian eigen-spectrum obeys the spectral invariants \
(trace = sum eig, det = prod eig, Frobenius^2 = sum eig^2); the variational STM is the \
finite-difference-validated CR3BP STM (crate::cr3bp); the range / range-rate Jacobian rows \
are finite-difference-validated analytic partials (cross-checked against the crate's 3-D \
range-rate observable); the four-spacecraft initial conditions are differential-corrected \
planar DROs (crate::dro) that close to a tight periodicity residual and are retrograde; and \
the rank transition is cross-validated against an independent square-root information filter \
(crate::cislunar_srif) whose posterior covariance turns finite exactly at full observable \
rank. MODELLED: the constellation design (which DRO perilune amplitudes and phases) and the \
specific rank-vs-arc progression it produces. Not a certified navigation-performance product.";

/// Rotating-frame time units per hour (`2π` time units = one sidereal month).
fn tu_per_hour() -> f64 {
    let days_per_hour = 1.0 / 24.0;
    let days_per_tu = SIDEREAL_MONTH_DAYS / (2.0 * std::f64::consts::PI);
    days_per_hour / days_per_tu
}

/// The `cislunar-observability` scenario. Every field is optional; with no fields the
/// analysis runs the default differential-corrected planar-DRO constellation over a ~6-hour arc.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct CislunarObservabilityScenario {
    /// Earth–Moon mass ratio (default [`EARTH_MOON_MU`]).
    pub mu: Option<f64>,
    /// Tracking-arc length in hours (default 6.0).
    pub arc_hours: Option<f64>,
    /// Number of epochs sampled along the arc (default 24).
    pub epochs: Option<usize>,
    /// RK4 sub-steps per STM propagation to each checkpoint (default 2000).
    pub steps: Option<usize>,
    /// Relative singular-value threshold for the observable-rank read (default 1e-6).
    pub rel_tol: Option<f64>,
}

/// The computed observability analysis.
struct Computed {
    mu: f64,
    arc_hours: f64,
    arc_time_tu: f64,
    rel_tol: f64,
    chief: PlanarState,
    refs: Vec<PlanarState>,
    rank_arc: Vec<RankArcPoint>,
    spectrum: GramianSpectrum,
    lever: RankLever,
    gdop_range_only: CislunarGdop,
    gdop_range_rate: CislunarGdop,
    srif_arc: Vec<SrifArcPoint>,
}

impl CislunarObservabilityScenario {
    /// The four planar constellation states `[x, y, ẋ, ẏ]` (rotating frame, normalised
    /// units): index 0 is the tracked *chief*, indices 1.. are the reference beacons.
    ///
    /// These are **differential-corrected planar distant-retrograde orbits** (DROs) about the
    /// Moon (which sits at `1−μ ≈ 0.988` on the x-axis), at prescribed perilune amplitudes and
    /// phases (see [`crate::dro`]). Each parent DRO closes to a tight periodicity residual and is
    /// retrograde — Validated — so the initial conditions are corrected periodic orbits, not
    /// hand-placed guesses. The specific amplitudes/phases (the constellation *design*) remain a
    /// Modelled choice. The DRO family is built for the Earth–Moon mass ratio and cached, so this
    /// seam stays deterministic and cheap across repeated runs.
    pub fn seed_states(&self) -> Vec<PlanarState> {
        dro_constellation().iter().map(|m| m.state).collect()
    }

    fn compute(&self) -> Result<Computed, String> {
        let mu = self.mu.unwrap_or(EARTH_MOON_MU);
        let arc_hours = self.arc_hours.unwrap_or(6.0);
        let n_epochs = self.epochs.unwrap_or(24);
        let steps = self.steps.unwrap_or(2000);
        let rel_tol = self.rel_tol.unwrap_or(1e-6);
        if !(arc_hours.is_finite() && arc_hours > 0.0) {
            return Err(format!(
                "arc_hours must be finite and positive, got {arc_hours}"
            ));
        }
        if n_epochs < 2 {
            return Err(format!("epochs must be ≥ 2, got {n_epochs}"));
        }
        if !(rel_tol.is_finite() && rel_tol > 0.0) {
            return Err(format!(
                "rel_tol must be finite and positive, got {rel_tol}"
            ));
        }
        let states = self.seed_states();
        if states.len() < 2 {
            return Err("seed_states must return at least a chief and one reference".to_string());
        }
        let chief = states[0];
        let refs: Vec<PlanarState> = states[1..].to_vec();
        let arc_time_tu = arc_hours * tu_per_hour();

        // Build the single-link range-only arc (chief ↔ reference 0): the P6 Table-1
        // series. Each epoch carries the chief's STM Φ(t_k) and one range row.
        let ref0 = refs[0];
        let mut epochs_single: Vec<ObsEpoch> = Vec::with_capacity(n_epochs);
        let mut prev_t = 0.0;
        for k in 0..n_epochs {
            let t = arc_time_tu * (k as f64) / ((n_epochs - 1) as f64);
            let (cs, phi) = crate::observability_gramian::planar_state_stm(&chief, mu, t, steps);
            let rs = crate::observability_gramian::planar_propagate(&ref0, mu, t, steps);
            let (_rho, r_row) = range_row(&cs, &rs);
            epochs_single.push(ObsEpoch {
                h: vec![r_row.to_vec()],
                phi: phi.iter().map(|row| row.to_vec()).collect(),
                dt: t - prev_t,
            });
            prev_t = t;
        }
        let rank_arc = rank_vs_arc(&epochs_single, rel_tol);
        let w = gramian(&epochs_single);
        let spectrum = gramian_spectrum(&w, rel_tol);

        // Independent SRIF cross-validation of the rank transition on the same single-link arc:
        // the square-root information filter's posterior covariance turns finite / well-conditioned
        // exactly when the observable rank reaches the full four-state.
        let srif_arc = srif_cross_validation(&epochs_single, rel_tol);

        // Instantaneous (t=0) multi-link range-only vs range+range-rate lever.
        let lever = range_vs_range_rate_rank(&chief, &refs, rel_tol);

        // Instantaneous GDOP: range-only (rank-deficient → undefined) vs range+range-rate.
        let mut rows_ro: Mat = Vec::new();
        let mut rows_rr: Mat = Vec::new();
        for r in &refs {
            let (_rho, rr) = range_row(&chief, r);
            rows_ro.push(rr.to_vec());
            rows_rr.push(rr.to_vec());
            let (_rd, rrr) = range_rate_row(&chief, r);
            rows_rr.push(rrr.to_vec());
        }
        let gdop_range_only = cislunar_gdop(&rows_ro, rel_tol);
        let gdop_range_rate = cislunar_gdop(&rows_rr, rel_tol);

        Ok(Computed {
            mu,
            arc_hours,
            arc_time_tu,
            rel_tol,
            chief,
            refs,
            rank_arc,
            spectrum,
            lever,
            gdop_range_only,
            gdop_range_rate,
            srif_arc,
        })
    }

    /// Run the scenario, returning `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c), svg(&c)))
    }

    fn json(&self, c: &Computed) -> Result<String, String> {
        let rank_arc: Vec<serde_json::Value> = c
            .rank_arc
            .iter()
            .map(|p| {
                serde_json::json!({
                    "epoch_index": p.epoch_index,
                    "arc_time_tu": p.arc_time,
                    "arc_hours": p.arc_time / tu_per_hour(),
                    "n_rows": p.n_rows,
                    "rank": p.rank,
                    "sigma_max": p.sigma_max,
                    "sigma_min": p.sigma_min,
                })
            })
            .collect();
        // DRO provenance: one entry per constellation member (chief first), carrying the parent
        // DRO's perilune amplitude, periodicity residual (the Validated closure), period, phase.
        let dro_provenance: Vec<serde_json::Value> = dro_constellation()
            .iter()
            .enumerate()
            .map(|(i, m)| {
                serde_json::json!({
                    "role": if i == 0 { "chief".to_string() } else { format!("reference {}", i - 1) },
                    "state": m.state,
                    "perilune_km": m.perilune_km,
                    "periodicity_residual": m.periodicity_residual,
                    "period_tu": m.period,
                    "phase_fraction": m.phase,
                })
            })
            .collect();
        // SRIF cross-validation of the rank transition (P6 rank-only → Validated vs an
        // independent estimator).
        let srif_arc: Vec<serde_json::Value> = c
            .srif_arc
            .iter()
            .map(|p| {
                serde_json::json!({
                    "epoch_index": p.epoch_index,
                    "arc_time_tu": p.arc_time,
                    "arc_hours": p.arc_time / tu_per_hour(),
                    "n_rows": p.n_rows,
                    "observable_rank": p.gramian_rank,
                    "gramian_condition": condition_json(p.gramian_condition),
                    "srif_posterior_wellposed": p.srif_posterior_wellposed,
                    "srif_condition": condition_json(p.srif_condition),
                })
            })
            .collect();
        let transition = full_rank_transition(&c.srif_arc);
        let doc = serde_json::json!({
            "kind": "cislunar-observability",
            "label": LABEL,
            "mu": c.mu,
            "arc_hours": c.arc_hours,
            "arc_time_tu": c.arc_time_tu,
            "rel_tol": c.rel_tol,
            "state_dim": N_PLANAR,
            "chief_state": c.chief,
            "reference_states": c.refs,
            "dro_provenance": {
                "members": dro_provenance,
                "note": "Validated: each constellation initial condition is a differential-corrected \
                    planar DRO (crate::dro) that closes over one period to the reported periodicity \
                    residual and is retrograde about the Moon. Perilune amplitudes and phases are at \
                    the Earth–Moon mass ratio. Modelled: the choice of amplitudes/phases (the \
                    constellation design)."
            },
            "rank_vs_arc": rank_arc,
            "rank_vs_arc_note": "Validated: rank via singular-value threshold (rank-revealing SVD), \
                cross-checked against the Gramian eigen-rank. Modelled: the specific 1→…→4 \
                progression, which depends on the (Modelled) constellation geometry.",
            "gramian_spectrum": {
                "eigenvalues_ascending": c.spectrum.eigenvalues,
                "min_eigenvalue": c.spectrum.min_eigenvalue,
                "max_eigenvalue": c.spectrum.max_eigenvalue,
                "trace": c.spectrum.trace,
                "condition": condition_json(c.spectrum.condition),
                "rank": c.spectrum.rank,
                "defect": c.spectrum.defect,
                "note": "Validated: symmetric spectrum from the crate's Jacobi eigensolver, \
                    invariant-checked (trace = sum eig, Frobenius^2 = sum eig^2, det = prod eig)."
            },
            "range_rate_lever": {
                "n_links": c.lever.n_links,
                "rank_range_only": c.lever.rank_range_only,
                "rank_range_rate": c.lever.rank_range_rate,
                "note": "Validated: instantaneous ranks via singular-value threshold. Range-only \
                    rows have zero velocity columns (rank ≤ position dimension); Doppler's \
                    non-zero velocity columns lift the rank toward the full four-state."
            },
            "gdop": {
                "range_only": gdop_json(&c.gdop_range_only),
                "range_rate": gdop_json(&c.gdop_range_rate),
                "note": "Validated: a rank-deficient / singular geometry is flagged undefined \
                    (via fim::design_metrics condition=inf), never a bogus finite GDOP — the \
                    same singular-geometry guard pvt::solve_spp applies."
            },
            "srif_cross_validation": {
                "arc": srif_arc,
                "full_rank_transition_epoch": transition,
                "note": "Validated: an independent square-root information filter \
                    (crate::deepspace_od::Srif) folds the same observability rows through \
                    Householder triangularization; its posterior covariance P = R⁻¹R⁻ᵀ turns \
                    finite / well-conditioned exactly at the epoch where the observable rank reaches \
                    the full four-state, and its condition number equals the observability-Gram \
                    condition (cond(P) = cond(OᵀO)) — the rank-only P6 transition upgraded to a \
                    cross-check against a second estimator. gramian_condition/srif_condition are the \
                    full-space λmax/λmin (\"inf\" below full rank)."
            }
        });
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }

    fn summary(&self, c: &Computed) -> String {
        let first = c.rank_arc.first();
        let last = c.rank_arc.last();
        let ro = match &c.gdop_range_only {
            CislunarGdop::Defined { gdop, .. } => format!("{gdop:.3}"),
            CislunarGdop::Undefined { .. } => "undefined".to_string(),
        };
        let rr = match &c.gdop_range_rate {
            CislunarGdop::Defined { gdop, .. } => format!("{gdop:.3}"),
            CislunarGdop::Undefined { .. } => "undefined".to_string(),
        };
        let max_resid = dro_constellation()
            .iter()
            .map(|m| m.periodicity_residual)
            .fold(0.0_f64, f64::max);
        let srif_epoch = match full_rank_transition(&c.srif_arc) {
            Some(e) => e.to_string(),
            None => "none".to_string(),
        };
        format!(
            "cislunar-observability | {} s/c ({} refs) | {:.1} h arc, {} epochs | rank {} → {} \
             of {} over arc | Gramian λ [{:.2e}…{:.2e}] cond {} | instantaneous rank range-only \
             {} → range+rate {} ({} links) | GDOP range-only {} range+rate {} | DRO ICs (max \
             periodicity residual {:.1e}) | SRIF posterior finite at rank-4 epoch {} (Validated \
             rank/STM/DRO-closure/SRIF, Modelled design)",
            c.refs.len() + 1,
            c.refs.len(),
            c.arc_hours,
            c.rank_arc.len(),
            first.map(|p| p.rank).unwrap_or(0),
            last.map(|p| p.rank).unwrap_or(0),
            N_PLANAR,
            c.spectrum.min_eigenvalue,
            c.spectrum.max_eigenvalue,
            condition_str(c.spectrum.condition),
            c.lever.rank_range_only,
            c.lever.rank_range_rate,
            c.lever.n_links,
            ro,
            rr,
            max_resid,
            srif_epoch,
        )
    }
}

fn condition_json(condition: f64) -> serde_json::Value {
    if condition.is_finite() {
        serde_json::Value::from(condition)
    } else {
        serde_json::Value::from("inf")
    }
}

fn condition_str(condition: f64) -> String {
    if condition.is_finite() {
        format!("{condition:.2e}")
    } else {
        "inf".to_string()
    }
}

fn gdop_json(g: &CislunarGdop) -> serde_json::Value {
    match g {
        CislunarGdop::Defined { gdop, rank } => serde_json::json!({
            "status": "defined",
            "gdop": gdop,
            "rank": rank,
        }),
        CislunarGdop::Undefined {
            rank,
            defect,
            reason,
        } => serde_json::json!({
            "status": "undefined",
            "rank": rank,
            "defect": defect,
            "reason": reason,
        }),
    }
}

/// Deterministic two-panel SVG: rank vs arc length (left) and the Gramian eigenvalue
/// spectrum as log-scaled bars (right). Fixed-precision formatting so no last-ULP jitter
/// can fork the bytes across platforms.
fn svg(c: &Computed) -> String {
    let (w, h) = (900.0_f64, 420.0_f64);
    let mut s = String::new();
    s.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    s.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    s.push_str(
        "<text x=\"24\" y=\"24\" font-size=\"15\" font-weight=\"bold\">Cislunar observability over a tracking arc (P6)</text>",
    );
    s.push_str(
        "<text x=\"24\" y=\"40\" font-size=\"11\" fill=\"#8a8172\">rank-vs-arc (range-only single link) · Gramian eigen-spectrum · differential-corrected DRO ICs + SRIF cross-check · MODELLED design, VALIDATED rank/STM/closure</text>",
    );

    // ── Left panel: rank vs arc length ──
    let (lx, ly, lw, lh) = (60.0_f64, 70.0_f64, 360.0_f64, 300.0_f64);
    let axis_y = ly + lh;
    s.push_str(&format!(
        "<text x=\"{lx:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">observable rank vs arc length</text>",
        ly - 8.0
    ));
    s.push_str(&format!(
        "<line x1=\"{lx:.0}\" y1=\"{ly:.0}\" x2=\"{lx:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{lx:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        lx + lw
    ));
    let rmax = N_PLANAR as f64;
    let yof = |r: f64| axis_y - (r / rmax) * lh;
    for g in 0..=N_PLANAR {
        let gy = yof(g as f64);
        s.push_str(&format!(
            "<line x1=\"{lx:.0}\" y1=\"{gy:.1}\" x2=\"{:.0}\" y2=\"{gy:.1}\" stroke=\"#241d15\" stroke-dasharray=\"3 4\"/>",
            lx + lw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#6b6355\">{g}</text>",
            lx - 6.0,
            gy + 4.0
        ));
    }
    let arc_max = c
        .rank_arc
        .last()
        .map(|p| p.arc_time)
        .unwrap_or(1.0)
        .max(1e-12);
    let xof = |t: f64| lx + (t / arc_max) * lw;
    let mut pts = String::new();
    for p in &c.rank_arc {
        pts.push_str(&format!(
            "{:.1},{:.1} ",
            xof(p.arc_time),
            yof(p.rank as f64)
        ));
    }
    s.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        pts.trim_end()
    ));
    for p in &c.rank_arc {
        s.push_str(&format!(
            "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"2.4\" fill=\"#e0bd84\"/>",
            xof(p.arc_time),
            yof(p.rank as f64)
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8a8172\">arc length (rotating-frame time units, {:.1} h total)</text>",
        lx + lw / 2.0,
        axis_y + 26.0,
        c.arc_hours
    ));

    // ── Right panel: Gramian eigenvalue bars (log10) ──
    let (rx, ryy, rw, rh) = (520.0_f64, 70.0_f64, 340.0_f64, 300.0_f64);
    let raxis_y = ryy + rh;
    s.push_str(&format!(
        "<text x=\"{rx:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">Gramian eigenvalues (log10)</text>",
        ryy - 8.0
    ));
    s.push_str(&format!(
        "<line x1=\"{rx:.0}\" y1=\"{ryy:.0}\" x2=\"{rx:.0}\" y2=\"{raxis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    s.push_str(&format!(
        "<line x1=\"{rx:.0}\" y1=\"{raxis_y:.0}\" x2=\"{:.0}\" y2=\"{raxis_y:.0}\" stroke=\"#342c21\"/>",
        rx + rw
    ));
    let logs: Vec<f64> = c
        .spectrum
        .eigenvalues
        .iter()
        .map(|&l| if l > 0.0 { l.log10() } else { -30.0 })
        .collect();
    let lmin = logs.iter().cloned().fold(f64::INFINITY, f64::min);
    let lmax = logs.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let span = (lmax - lmin).max(1.0);
    let base = lmin - 0.5;
    let neig = logs.len().max(1) as f64;
    let slot = rw / neig;
    let bw = slot * 0.6;
    for (i, &lg) in logs.iter().enumerate() {
        let frac = ((lg - base) / (span + 0.5)).clamp(0.02, 1.0);
        let bh = frac * rh;
        let bx = rx + slot * (i as f64 + 0.5) - bw / 2.0;
        let by = raxis_y - bh;
        s.push_str(&format!(
            "<rect x=\"{bx:.1}\" y=\"{by:.1}\" width=\"{bw:.1}\" height=\"{bh:.1}\" fill=\"#5fb0c9\"/>"
        ));
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\" fill=\"#e6ddcb\">{:.1}</text>",
            rx + slot * (i as f64 + 0.5),
            by - 4.0,
            lg
        ));
        s.push_str(&format!(
            "<text x=\"{:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"10\">λ{}</text>",
            rx + slot * (i as f64 + 0.5),
            raxis_y + 16.0,
            i + 1
        ));
    }
    s.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\" fill=\"#8a8172\">condition κ = {}</text>",
        rx + rw / 2.0,
        raxis_y + 34.0,
        condition_str(c.spectrum.condition)
    ));
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    #[test]
    fn default_scenario_runs_and_is_modelled() {
        let (json, summary, svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "cislunar-observability");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(v["label"].as_str().unwrap().contains("VALIDATED"));
        assert_eq!(v["state_dim"], N_PLANAR);
        assert!(summary.contains("cislunar-observability"));
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
    }

    #[test]
    fn rank_grows_from_one_to_full_over_the_arc() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let table = v["rank_vs_arc"].as_array().unwrap();
        // A single instantaneous range snapshot is rank-1.
        assert_eq!(table[0]["rank"].as_u64().unwrap(), 1);
        // Rank is non-decreasing and reaches the full four-state by the end of the arc.
        let ranks: Vec<u64> = table.iter().map(|p| p["rank"].as_u64().unwrap()).collect();
        for w in ranks.windows(2) {
            assert!(w[1] >= w[0], "rank must not decrease: {ranks:?}");
        }
        assert_eq!(
            *ranks.last().unwrap(),
            N_PLANAR as u64,
            "full observability: {ranks:?}"
        );
    }

    #[test]
    fn range_rate_lever_lifts_instantaneous_rank() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let ro = v["range_rate_lever"]["rank_range_only"].as_u64().unwrap();
        let rr = v["range_rate_lever"]["rank_range_rate"].as_u64().unwrap();
        assert!(rr > ro, "range+rate rank {rr} must exceed range-only {ro}");
    }

    #[test]
    fn range_only_snapshot_gdop_is_undefined() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["gdop"]["range_only"]["status"], "undefined");
        // Range + range-rate spans the full state → a finite GDOP.
        assert_eq!(v["gdop"]["range_rate"]["status"], "defined");
    }

    #[test]
    fn gramian_spectrum_is_symmetric_and_reported() {
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let eig = v["gramian_spectrum"]["eigenvalues_ascending"]
            .as_array()
            .unwrap();
        assert_eq!(eig.len(), N_PLANAR);
        // Ascending and non-negative (a symmetric PSD Gramian).
        let vals: Vec<f64> = eig.iter().map(|x| x.as_f64().unwrap()).collect();
        for w in vals.windows(2) {
            assert!(
                w[1] >= w[0] - 1e-15,
                "eigenvalues must be ascending: {vals:?}"
            );
        }
        assert!(vals[0] >= -1e-12);
    }

    #[test]
    fn is_deterministic() {
        let scn = CislunarObservabilityScenario::default();
        assert_eq!(scn.run_output().unwrap(), scn.run_output().unwrap());
    }

    #[test]
    fn seed_states_seam_returns_four_planar_states() {
        // The DRO-seeder seam: four planar [x,y,vx,vy] states, chief first.
        let states = CislunarObservabilityScenario::default().seed_states();
        assert_eq!(states.len(), 4);
        for s in &states {
            assert_eq!(s.len(), 4);
        }
    }

    #[test]
    fn seed_states_are_differential_corrected_closing_dros() {
        // Provenance: every constellation member is a corrected planar DRO that closes to the
        // tight periodicity residual (Validated) and is retrograde.
        let (json, _s, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let members = v["dro_provenance"]["members"].as_array().unwrap();
        assert_eq!(members.len(), 4);
        for (i, m) in members.iter().enumerate() {
            let resid = m["periodicity_residual"].as_f64().unwrap();
            assert!(
                resid < 1e-8,
                "member {i} periodicity residual {resid:.3e} exceeds 1e-8"
            );
            let peri = m["perilune_km"].as_f64().unwrap();
            assert!(
                (10_000.0..=50_000.0).contains(&peri),
                "member {i} perilune {peri:.0} km outside the DRO band"
            );
        }
        assert_eq!(members[0]["role"], "chief");
    }

    #[test]
    fn srif_cross_validation_transitions_at_full_rank() {
        // The independent SRIF posterior turns finite exactly at the rank-4 arc, and its
        // condition tracks the Gramian conditioning there.
        let (json, summary, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let arc = v["srif_cross_validation"]["arc"].as_array().unwrap();
        // First arc snapshot: rank-deficient ⇒ SRIF posterior not well-posed.
        assert!(!arc[0]["srif_posterior_wellposed"].as_bool().unwrap());
        // The last arc reaches full observable rank and a well-posed SRIF posterior.
        let last = arc.last().unwrap();
        assert_eq!(last["observable_rank"].as_u64().unwrap(), N_PLANAR as u64);
        assert!(last["srif_posterior_wellposed"].as_bool().unwrap());
        // At full rank both conditions are finite numbers (not "inf") and the same order.
        let gc = last["gramian_condition"].as_f64().unwrap();
        let sc = last["srif_condition"].as_f64().unwrap();
        assert!(gc.is_finite() && sc.is_finite());
        let ratio = sc / gc;
        assert!((0.1..=10.0).contains(&ratio), "cond ratio {ratio:.3e}");
        // The transition epoch is reported and the summary advertises the cross-check.
        assert!(v["srif_cross_validation"]["full_rank_transition_epoch"].is_number());
        assert!(summary.contains("SRIF posterior finite"));
    }

    #[test]
    fn rejects_degenerate_arc() {
        let scn = CislunarObservabilityScenario {
            arc_hours: Some(0.0),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
        let scn = CislunarObservabilityScenario {
            epochs: Some(1),
            ..Default::default()
        };
        assert!(scn.run_output().is_err());
    }
}
