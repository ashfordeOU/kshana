// SPDX-License-Identifier: AGPL-3.0-only
//! `realtime-frame-eop` scenario — a runnable wrapper over the real-time lunar frame /
//! Earth-orientation prediction budget ([`crate::frame_eop`]).
//!
//! A lunar navigation frame realised from an Earth-based UT1/polar-motion product is only
//! as good as the *predicted* Earth orientation available in real time. This scenario
//! emits the two P4 tables:
//!
//! * **Table 1 — the frame-error consistency check.** The post-processed (definitive,
//!   zero-latency) ~0.27 m frame position and the real-time (predicted, one-hour latency)
//!   ~15 m frame position, each expressed as its equivalent UT1 error via the L19 lever
//!   arm (`Δr = D_EM·ω⊕·ΔUT1`) — 0.27 m ↔ ~0.010 ms, 15 m ↔ ~0.5 ms. The metre and
//!   millisecond views are two faces of the same budget linked by the lever arm.
//! * **Table 2 — measured UT1 prediction error vs horizon.** The L18 curve read directly
//!   off the real IERS `finals2000A` series: the Bulletin A − Bulletin B final floor and
//!   the multi-day persistence-predictor error, each mapped to a Moon-frame position by
//!   L19.
//!
//! It also reports the L21 root-sum-square real-time frame-error budget (EOP + ephemeris
//! + realisation floor).
//!
//! ## Validated vs Modelled
//! - **Validated (closed form).** The L19 lever arm (`1 ms ↔ 28.03 m ↔ 93.5 ns`) is exact
//!   and its `ω⊕` is cross-checked against [`crate::cio::earth_rotation_angle`].
//! - **Validated (real data).** The L18 final floor and multi-day growth are computed from
//!   the real, verbatim `finals2000A` fixture rows and land in the IERS-published
//!   Bulletin A/B accuracy band.
//! - **Modelled.** The lunar-relay OD covariance magnitudes (0.27 m post-processed, ~15 m
//!   real-time at 1 h latency) and the frame-realisation floor are representative
//!   allocations, and the multi-day predictor is persistence (not IERS's operational
//!   Bulletin A least-squares/AR algorithm). Not a certified real-time frame product.

use crate::frame_eop::{
    frame_eop_svg, frame_error_budget, prediction_error_vs_horizon, FrameErrorBudget, Horizon,
    HorizonError, C_M_S, D_EM_M, LEVER_M_PER_S, OMEGA_EARTH_RAD_S,
};
use crate::frames::arcsec;
use crate::lunar_frame_predict::{
    predict_frame_error, OdCovariance, POSTPROC_POS_SIGMA_M, REALTIME_LATENCY_S,
    REPRESENTATIVE_VEL_SIGMA_MPS,
};
use serde::Deserialize;

/// The real IERS `finals2000A` fixture bundled for the offline/default run — the same
/// verbatim rows the [`crate::frame_eop`] tests read. Kept under `tools/` (a shipped
/// crate asset, like `tools/egm2008_to70.gfc`) rather than `tests/fixtures/` — which is
/// excluded from the published crate tarball — because this is a *runtime* default the
/// library embeds, not a test-only fixture. The drift guard below pins it byte-for-byte
/// to the test-fixture copy so the two cannot diverge.
const FIXTURE: &str = include_str!("../tools/finals2000A_2022001.txt");

/// The honesty label carried on the result document.
const LABEL: &str = "Real-time lunar frame / Earth-orientation prediction budget. \
VALIDATED closed form: the L19 lever arm (1 ms ↔ 28.03 m ↔ 93.5 ns), ω⊕ cross-checked \
against the CIO Earth-rotation angle. VALIDATED real data: the L18 UT1 prediction-error \
curve read directly off the real IERS finals2000A series. MODELLED: the lunar-relay OD \
covariance magnitudes (0.27 m post-processed, ~15 m real-time at 1 h latency) and the \
frame-realisation floor are representative allocations, and the multi-day predictor is \
persistence, not IERS's operational Bulletin A algorithm. Not a certified real-time \
frame product.";

/// The `realtime-frame-eop` scenario. Every field is optional: with no fields the budget
/// runs the representative lunar-relay OD covariance over the bundled real `finals2000A`
/// fixture for the 1/2/3-day horizons.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct RealtimeFrameEopScenario {
    /// Informational epoch label (UTC date) for the report. Default `2022-01-01`.
    pub epoch: Option<String>,
    /// Persistence-predictor lead times (integer days) to evaluate for Table 2, in
    /// addition to the always-present rapid-minus-final floor. Default `[1, 2, 3]`.
    pub horizons_days: Option<Vec<u32>>,
    /// Post-processed lunar-relay OD position 1σ (m). Default 0.27 m (representative).
    pub ephemeris_pos_sigma_m: Option<f64>,
    /// Lunar-relay OD velocity 1σ (m/s). Default the representative value that places the
    /// one-hour-latency predicted position on ~15 m.
    pub ephemeris_vel_sigma_mps: Option<f64>,
    /// Real-time prediction latency (s). Default 3600 (one hour).
    pub latency_s: Option<f64>,
    /// Frame-realisation (datum-recovery) floor (m) for the L21 RSS budget. Default 0.2 m.
    pub frame_realization_floor_m: Option<f64>,
    /// UT1 prediction error (ms) driving the EOP term of the L21 budget. Default 0.5 ms.
    pub delta_ut1_ms: Option<f64>,
    /// Polar-motion x-pole prediction error (milliarcseconds) for the L21 budget. Default 0.
    pub delta_xp_mas: Option<f64>,
    /// Polar-motion y-pole prediction error (milliarcseconds) for the L21 budget. Default 0.
    pub delta_yp_mas: Option<f64>,
    /// Path to a real `finals2000A` EOP file. Absent ⇒ the bundled fixture is used.
    pub eop_finals2000a: Option<String>,
}

/// One Table 1 row: a frame position (m) and its L19-equivalent UT1 error and light-time.
struct Table1Row {
    regime: &'static str,
    frame_position_m: f64,
    ut1_equiv_ms: f64,
    light_time_ns: f64,
}

/// One Table 2 row: a measured UT1 prediction-error statistic at one horizon, with its
/// L19 Moon-frame position and light-time.
struct Table2Row {
    label: String,
    horizon_days: f64,
    n: usize,
    ut1_rms_ms: f64,
    ut1_p50_ms: f64,
    ut1_p95_ms: f64,
    moon_position_m: f64,
    moon_light_time_ns: f64,
}

/// Everything the analysis produces, computed once and reused by the JSON / summary /
/// SVG / CSV emitters.
struct Computed {
    epoch: String,
    eop_source: String,
    latency_s: f64,
    delta_ut1_ms: f64,
    delta_xp_mas: f64,
    delta_yp_mas: f64,
    curve: Vec<HorizonError>,
    budget: FrameErrorBudget,
    table1: Vec<Table1Row>,
    table2: Vec<Table2Row>,
}

impl RealtimeFrameEopScenario {
    /// The OD covariance: the representative lunar-relay OD when no covariance override is
    /// given, else one built from the supplied 1σ values.
    fn covariance(&self) -> OdCovariance {
        match (self.ephemeris_pos_sigma_m, self.ephemeris_vel_sigma_mps) {
            (None, None) => OdCovariance::representative(),
            (pos, vel) => OdCovariance::new(
                pos.unwrap_or(POSTPROC_POS_SIGMA_M),
                vel.unwrap_or(REPRESENTATIVE_VEL_SIGMA_MPS),
                0.0,
            ),
        }
    }

    /// Read the EOP series body: the bundled fixture, or the caller-supplied path.
    fn eop_body(&self) -> Result<(String, String), String> {
        match &self.eop_finals2000a {
            Some(path) => {
                let body = std::fs::read_to_string(path)
                    .map_err(|e| format!("cannot read EOP file {path}: {e}"))?;
                Ok((body, path.clone()))
            }
            None => Ok((
                FIXTURE.to_string(),
                "bundled fixture finals2000A_2022001".to_string(),
            )),
        }
    }

    fn compute(&self) -> Result<Computed, String> {
        let epoch = self
            .epoch
            .clone()
            .unwrap_or_else(|| "2022-01-01".to_string());
        let latency_s = self.latency_s.unwrap_or(REALTIME_LATENCY_S);
        let floor_m = self.frame_realization_floor_m.unwrap_or(0.2);
        let delta_ut1_ms = self.delta_ut1_ms.unwrap_or(0.5);
        let delta_xp_mas = self.delta_xp_mas.unwrap_or(0.0);
        let delta_yp_mas = self.delta_yp_mas.unwrap_or(0.0);
        if !latency_s.is_finite() || latency_s < 0.0 {
            return Err(format!(
                "latency_s must be finite and non-negative, got {latency_s}"
            ));
        }

        let cov = self.covariance();
        let (body, eop_source) = self.eop_body()?;

        // Table 1 — the post-processed vs real-time frame-error consistency (L13 + L19).
        let predict = predict_frame_error(cov, latency_s);
        let table1 = vec![
            Table1Row {
                regime: "post-processed",
                frame_position_m: predict.postproc_pos_sigma_m,
                ut1_equiv_ms: position_to_ut1_ms(predict.postproc_pos_sigma_m),
                light_time_ns: predict.postproc_time_ns,
            },
            Table1Row {
                regime: "real-time",
                frame_position_m: predict.predicted_pos_sigma_m,
                ut1_equiv_ms: position_to_ut1_ms(predict.predicted_pos_sigma_m),
                light_time_ns: predict.predicted_time_ns,
            },
        ];

        // Table 2 — measured UT1 prediction error vs horizon (L18) mapped to Moon (L19).
        let horizons = self.horizons();
        let curve = prediction_error_vs_horizon(&body, &horizons);
        let table2: Vec<Table2Row> = curve
            .iter()
            .map(|h| Table2Row {
                label: horizon_label(h.horizon),
                horizon_days: h.horizon.days(),
                n: h.n,
                ut1_rms_ms: h.rms_ms(),
                ut1_p50_ms: h.p50_ms(),
                ut1_p95_ms: h.p95_ms(),
                moon_position_m: h.rms_position_m(),
                moon_light_time_ns: h.rms_position_m() / C_M_S * 1e9,
            })
            .collect();

        // L21 — the RSS real-time frame-error budget.
        let budget = frame_error_budget(
            delta_ut1_ms * 1e-3,
            arcsec(delta_xp_mas * 1e-3),
            arcsec(delta_yp_mas * 1e-3),
            cov,
            latency_s,
            floor_m,
        );

        Ok(Computed {
            epoch,
            eop_source,
            latency_s,
            delta_ut1_ms,
            delta_xp_mas,
            delta_yp_mas,
            curve,
            budget,
            table1,
            table2,
        })
    }

    /// The horizon list: the rapid-minus-final floor plus each requested lead time.
    fn horizons(&self) -> Vec<Horizon> {
        let days = self.horizons_days.clone().unwrap_or_else(|| vec![1, 2, 3]);
        let mut hs = vec![Horizon::Final];
        hs.extend(days.into_iter().map(Horizon::Days));
        hs
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c)))
    }

    /// Run the scenario, returning `(json, summary, svg)`; the SVG is the deterministic
    /// two-panel [`frame_eop_svg`] chart of the measured Table 2 curve.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c), frame_eop_svg(&c.curve)))
    }

    /// The byte-stable CSV artifact: Table 1 (frame-error consistency) then Table 2
    /// (UT1 prediction error vs horizon). Fixed-precision formatting so last-ULP libm
    /// jitter cannot fork the bytes across platforms.
    pub fn to_csv(&self) -> Result<String, String> {
        let c = self.compute()?;
        let mut s = String::new();
        s.push_str(
            "# realtime-frame-eop golden — P4 Table 1 (frame-error consistency, lever arm \
             L19) + Table 2 (UT1 prediction error vs horizon, L18 over finals2000A, mapped \
             to Moon by L19)\n",
        );
        s.push_str("section,label,n,ut1_ms,ut1_p50_ms,ut1_p95_ms,position_m,light_time_ns\n");
        for r in &c.table1 {
            s.push_str(&format!(
                "table1,{},,{:.6},,,{:.6},{:.6}\n",
                r.regime, r.ut1_equiv_ms, r.frame_position_m, r.light_time_ns
            ));
        }
        for r in &c.table2 {
            s.push_str(&format!(
                "table2,{},{},{:.6},{:.6},{:.6},{:.6},{:.6}\n",
                r.label,
                r.n,
                r.ut1_rms_ms,
                r.ut1_p50_ms,
                r.ut1_p95_ms,
                r.moon_position_m,
                r.moon_light_time_ns,
            ));
        }
        Ok(s)
    }

    fn json(&self, c: &Computed) -> Result<String, String> {
        let table1: Vec<serde_json::Value> = c
            .table1
            .iter()
            .map(|r| {
                serde_json::json!({
                    "regime": r.regime,
                    "frame_position_m": r.frame_position_m,
                    "ut1_equiv_ms": r.ut1_equiv_ms,
                    "light_time_ns": r.light_time_ns,
                })
            })
            .collect();
        let table2: Vec<serde_json::Value> = c
            .table2
            .iter()
            .map(|r| {
                serde_json::json!({
                    "horizon": r.label,
                    "horizon_days": r.horizon_days,
                    "n": r.n,
                    "ut1_rms_ms": r.ut1_rms_ms,
                    "ut1_p50_ms": r.ut1_p50_ms,
                    "ut1_p95_ms": r.ut1_p95_ms,
                    "moon_position_m": r.moon_position_m,
                    "moon_light_time_ns": r.moon_light_time_ns,
                })
            })
            .collect();
        let doc = serde_json::json!({
            "kind": "realtime-frame-eop",
            "label": LABEL,
            "epoch": c.epoch,
            "eop_source": c.eop_source,
            "latency_s": c.latency_s,
            "lever_arm_m_per_s": LEVER_M_PER_S,
            "earth_moon_distance_m": D_EM_M,
            "omega_earth_rad_s": OMEGA_EARTH_RAD_S,
            "table1_consistency": table1,
            "table2_error_vs_horizon": table2,
            "realtime_frame_error_budget": {
                "delta_ut1_ms": c.delta_ut1_ms,
                "delta_xp_mas": c.delta_xp_mas,
                "delta_yp_mas": c.delta_yp_mas,
                "eop_term_m": c.budget.eop_term_m,
                "ephemeris_term_m": c.budget.ephemeris_term_m,
                "frame_realization_floor_m": c.budget.frame_realization_floor_m,
                "total_m": c.budget.total_m,
                "total_time_ns": c.budget.total_time_ns,
            },
        });
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }

    fn summary(&self, c: &Computed) -> String {
        let far = c.table2.last();
        let floor = c.table2.first();
        format!(
            "realtime-frame-eop | Table 1: post-proc {:.2} m ({:.4} ms UT1) ↔ real-time \
             {:.1} m ({:.3} ms UT1) | Table 2: final floor {:.4} ms → {:.0}-day {:.4} ms \
             | budget total {:.1} m ({:.1} ns) | L19 lever arm + L18 real-data (Validated), \
             OD cov (Modelled)",
            c.table1[0].frame_position_m,
            c.table1[0].ut1_equiv_ms,
            c.table1[1].frame_position_m,
            c.table1[1].ut1_equiv_ms,
            floor.map(|r| r.ut1_rms_ms).unwrap_or(0.0),
            far.map(|r| r.horizon_days).unwrap_or(0.0),
            far.map(|r| r.ut1_rms_ms).unwrap_or(0.0),
            c.budget.total_m,
            c.budget.total_time_ns,
        )
    }
}

/// A frame position error (m) as its L19-equivalent UT1 error, in milliseconds.
fn position_to_ut1_ms(position_m: f64) -> f64 {
    crate::frame_eop::lunar_position_to_ut1(position_m) * 1e3
}

/// A short CSV/JSON label for a horizon.
fn horizon_label(h: Horizon) -> String {
    match h {
        Horizon::Final => "final".to_string(),
        Horizon::Days(d) => format!("day-{d}"),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::frame_eop::ut1_error_to_lunar;
    use serde_json::Value;

    /// The bundled runtime EOP asset (`tools/finals2000A_2022001.txt`, shipped in the
    /// crate tarball) must stay byte-for-byte identical to the test fixture under
    /// `tests/fixtures/` — otherwise the offline default would silently diverge from the
    /// data the `frame_eop` validation tests are pinned to.
    #[test]
    fn bundled_eop_matches_the_test_fixture() {
        let test_fixture = include_str!("../tests/fixtures/agency/eop/finals2000A_2022001.txt");
        assert_eq!(
            FIXTURE, test_fixture,
            "tools/finals2000A_2022001.txt (shipped runtime asset) has drifted from \
             tests/fixtures/agency/eop/finals2000A_2022001.txt — re-copy it"
        );
    }

    #[test]
    fn default_scenario_runs_and_carries_the_honesty_label() {
        let (json, summary) = RealtimeFrameEopScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "realtime-frame-eop");
        let label = v["label"].as_str().unwrap();
        assert!(label.contains("VALIDATED"));
        assert!(label.contains("MODELLED"));
        assert!(summary.contains("realtime-frame-eop"));
    }

    #[test]
    fn table1_matches_the_l19_lever_arm_and_l13_prediction_to_machine_precision() {
        // Oracle: the closed-form L19 lever arm and the L13 predicted covariance. The
        // real-time frame position is the representative OD covariance propagated through
        // the one-hour latency (~15 m), and its UT1 equivalent is Δr/(D_EM·ω⊕).
        let (json, _s) = RealtimeFrameEopScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let predict = predict_frame_error(OdCovariance::representative(), REALTIME_LATENCY_S);

        let rt = &v["table1_consistency"][1];
        assert!(
            (rt["frame_position_m"].as_f64().unwrap() - predict.predicted_pos_sigma_m).abs()
                < 1e-12
        );
        assert!((rt["light_time_ns"].as_f64().unwrap() - predict.predicted_time_ns).abs() < 1e-9);
        // Round-trip: the reported UT1 equivalent maps back to the same position via L19.
        let pos = rt["frame_position_m"].as_f64().unwrap();
        let ut1_s = rt["ut1_equiv_ms"].as_f64().unwrap() * 1e-3;
        assert!((ut1_error_to_lunar(ut1_s).0 - pos).abs() < 1e-9);

        // The real-time regime lands near the P4 headline of ~15 m ↔ ~0.5 ms.
        assert!(
            (13.0..17.0).contains(&pos),
            "real-time frame position {pos} m"
        );
        assert!((0.45..0.60).contains(&rt["ut1_equiv_ms"].as_f64().unwrap()));

        // Post-processed: ~0.27 m ↔ ~0.010 ms.
        let pp = &v["table1_consistency"][0];
        assert!(
            (pp["frame_position_m"].as_f64().unwrap() - predict.postproc_pos_sigma_m).abs() < 1e-12
        );
        assert!((0.005..0.015).contains(&pp["ut1_equiv_ms"].as_f64().unwrap()));
    }

    #[test]
    fn table2_positions_equal_the_l18_curve_through_the_l19_lever_arm() {
        // Oracle: the L18 curve over the real fixture, each RMS mapped to Moon by L19.
        let (json, _s) = RealtimeFrameEopScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let curve = prediction_error_vs_horizon(
            FIXTURE,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(3),
            ],
        );
        let rows = v["table2_error_vs_horizon"].as_array().unwrap();
        assert_eq!(rows.len(), curve.len());
        for (row, h) in rows.iter().zip(curve.iter()) {
            assert_eq!(row["n"].as_u64().unwrap() as usize, h.n);
            assert!((row["ut1_rms_ms"].as_f64().unwrap() - h.rms_ms()).abs() < 1e-12);
            // The Moon position is exactly the L19 image of the RMS UT1 error.
            assert!(
                (row["moon_position_m"].as_f64().unwrap() - ut1_error_to_lunar(h.rms_s).0).abs()
                    < 1e-12
            );
        }
        // The final floor lands in the IERS-published ~0.01-0.02 ms band.
        let floor = rows[0]["ut1_rms_ms"].as_f64().unwrap();
        assert!((0.005..0.05).contains(&floor), "final floor {floor} ms");
    }

    #[test]
    fn is_deterministic_and_svg_is_well_formed() {
        let scn = RealtimeFrameEopScenario::default();
        assert_eq!(scn.run_json().unwrap(), scn.run_json().unwrap());
        let (_j, _s, svg) = scn.run_output().unwrap();
        assert!(svg.starts_with("<svg"));
        assert!(svg.ends_with("</svg>"));
    }

    #[test]
    fn csv_is_deterministic_and_has_both_tables() {
        let scn = RealtimeFrameEopScenario::default();
        let a = scn.to_csv().unwrap();
        assert_eq!(a, scn.to_csv().unwrap());
        assert!(a.contains("table1,post-processed,"));
        assert!(a.contains("table1,real-time,"));
        assert!(a.contains("table2,final,"));
        assert!(a.contains("table2,day-1,"));
    }
}
