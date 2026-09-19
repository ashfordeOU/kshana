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
//!   ~14.4 m frame position, each expressed as its equivalent UT1 error via the L19 lever
//!   arm (`Δr = D_EM·ω⊕·ΔUT1`) — 0.27 m ↔ ~0.010 ms, 14.4 m ↔ ~0.51 ms. The ~14.4 m is
//!   the genuine propagation of a round (not back-solved) OD covariance; the order-15-m
//!   scale is independently bracketed by the real EOP-prediction curve (Table 2). The metre
//!   and millisecond views are two faces of the same budget linked by the lever arm.
//! * **Table 2 — measured UT1 prediction error vs horizon.** The L18 curve read directly
//!   off the real IERS `finals2000A` series: the Bulletin A − Bulletin B final floor and
//!   the multi-day persistence-predictor error, each mapped to a Moon-frame position by
//!   L19.
//!
//! * **Table 3 — the joint Earth-orientation table (G14).** UT1, polar motion and their
//!   quadrature combination reduced over one **identical** row set per horizon. The two
//!   single-quantity statistics each cover whatever rows their own Bulletin B block
//!   populates, so root-sum-squaring them sizes a correction rather than forming a joint
//!   statistic; this table intersects the two epoch sets first and reports the epochs each
//!   component was measured at, so the claim is checkable from the document.
//! * **Table 4 — the predicted-vs-final horizon table (G12).** Always emitted. It is
//!   populated only when an archived LATER vintage of the same `finals2000A` product is
//!   supplied through `eop_finals2000a_later`; with a single vintage there is no
//!   predicted-vs-final residual to measure, and the table says that explicitly in its
//!   `status` and `statement` rather than leaving an unexplained empty array. No row is
//!   ever synthesised.
//!
//! It also reports the L21 root-sum-square real-time frame-error budget (EOP + ephemeris
//! + realisation floor).
//!
//! ## The EOP input (G12)
//! The **documented** input is a real IERS `finals2000A` product passed through
//! `eop_finals2000a`; two verbatim extracts are committed under
//! `tests/fixtures/agency/eop/`. The bundled offline fixture is the fallback, and it is a
//! FINAL-ONLY excerpt — which is the whole reason a bare run reports `predicted_rows.n = 0`.
//! Pointed at the real 2026 extract the same code reports the 12 genuine Bulletin A
//! prediction rows that file publishes. The bundled fixture remains the runtime default
//! because switching it would renumber the already-published P4 tables; the emitted
//! `eop_input` block names the input actually in force and carries its row census
//! (`rows = final_rows + prediction_rows`).
//!
//! ## Validated vs Modelled
//! - **Validated (closed form).** The L19 lever arm (`1 ms ↔ 28.03 m ↔ 93.5 ns`) is exact
//!   and its `ω⊕` is cross-checked against [`crate::cio::earth_rotation_angle`].
//! - **Validated (real data).** The L18 final floor and multi-day growth are computed from
//!   the real, verbatim `finals2000A` fixture rows and land in the IERS-published
//!   Bulletin A/B accuracy band.
//! - **Derived.** The frame-realisation floor is the post-fit RMS residual of an actual
//!   7-parameter Helmert datum realisation (not an asserted 0.2 m); the polar-motion term
//!   is sourced from the measured Bulletin-A-minus-Bulletin-B pole residual.
//! - **Modelled.** The lunar-relay OD covariance magnitudes (0.27 m post-processed, ~14.4 m
//!   real-time at 1 h latency) are a round, NOT back-solved, representative allocation, and
//!   the multi-day predictor is persistence (not IERS's operational Bulletin A
//!   least-squares/AR algorithm). Not a certified real-time frame product.

use crate::frame_eop::{
    derived_frame_realization_floor_m, frame_eop_svg, frame_error_budget,
    joint_eop_error_vs_horizon, pm_prediction_error_vs_horizon, predicted_rows_summary,
    predicted_vs_final_ut1, prediction_error_vs_horizon, FrameErrorBudget, Horizon, HorizonError,
    JointEopError, PredictedRowsSummary, C_M_S, D_EM_M, LEVER_M_PER_S, OMEGA_EARTH_RAD_S,
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
against the CIO Earth-rotation angle. VALIDATED real data: the L18 UT1 and polar-motion \
prediction-error curves read directly off the real IERS finals2000A series (Bulletin A \
rapid vs Bulletin B final, and multi-day persistence over the real daily rows). DERIVED: \
the frame-realisation floor is the post-fit RMS residual of an actual 7-parameter Helmert \
datum realisation (not an asserted 0.2 m). MODELLED: the lunar-relay OD covariance \
magnitudes (0.27 m post-processed, ~14.4 m real-time at 1 h latency) are a round, \
NOT back-solved, representative allocation — the order-15-m real-time figure is \
independently bracketed by the real EOP-prediction curve (≈9.9 m at 1 day, ≈18.8 m at \
2 days). The multi-day predictor is persistence, not IERS's operational Bulletin A \
algorithm, and a genuine predicted-vs-final vintage difference needs an archived earlier \
file vintage (not available from a single fetch). Not a certified real-time frame product.";

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
    /// Lunar-relay OD velocity 1σ (m/s). Default a round representative 4 mm/s, which
    /// propagates to ~14.4 m at one-hour latency (not back-solved to any target).
    pub ephemeris_vel_sigma_mps: Option<f64>,
    /// Real-time prediction latency (s). Default 3600 (one hour).
    pub latency_s: Option<f64>,
    /// Explicit frame-realisation (datum-recovery) floor (m) for the L21 RSS budget. When
    /// omitted the floor is **derived** from an actual Helmert datum realisation (the
    /// post-fit RMS residual of [`crate::lunar_frame_realise`]) at
    /// [`Self::frame_realization_tie_noise_m`] — not an asserted constant.
    pub frame_realization_floor_m: Option<f64>,
    /// Per-coordinate tie-noise (m) used to derive the frame-realisation floor when
    /// [`Self::frame_realization_floor_m`] is not given. Default 0.2 m (a lunar-network
    /// datum-tie level), yielding a derived floor of ~0.18 m from the real Helmert fit.
    pub frame_realization_tie_noise_m: Option<f64>,
    /// UT1 prediction error (ms) driving the EOP term of the L21 budget. Default 0.5 ms.
    pub delta_ut1_ms: Option<f64>,
    /// Polar-motion x-pole prediction error (milliarcseconds) for the L21 budget. When
    /// omitted **and** an EOP series is available, the x-pole term is sourced from the
    /// measured Bulletin-A-minus-Bulletin-B rapid-vs-final pole residual (the PM final
    /// floor), not defaulted to zero.
    pub delta_xp_mas: Option<f64>,
    /// Polar-motion y-pole prediction error (milliarcseconds) for the L21 budget. Measured
    /// from the real PM residual when omitted (see [`Self::delta_xp_mas`]).
    pub delta_yp_mas: Option<f64>,
    /// Path to a real `finals2000A` EOP file. This is the **documented** EOP input: point
    /// it at a real IERS product (the repository ships two verbatim extracts under
    /// `tests/fixtures/agency/eop/`). Absent ⇒ the bundled offline fixture is used, which is
    /// a FINAL-ONLY excerpt and therefore publishes no Bulletin A prediction rows; the
    /// emitted `eop_input` block says which of the two is in force. The bundled fixture
    /// remains the *runtime* default only because changing it would renumber the published
    /// P4 tables.
    pub eop_finals2000a: Option<String>,
    /// Path to an **archived later vintage** of the same `finals2000A` product — the file as
    /// it stood after the dates [`Self::eop_finals2000a`] predicts had become Bulletin B
    /// final. Supplying it turns on the true predicted-vs-final vintage differencing
    /// ([`crate::frame_eop::predicted_vs_final_ut1`]). Absent ⇒ that comparison has no rows,
    /// which the report states explicitly rather than leaving an unexplained empty array: a
    /// single instantaneous fetch carries predictions only for dates that do not yet have a
    /// final, so no residual exists to measure and none is synthesised.
    pub eop_finals2000a_later: Option<String>,
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
    /// G14 — UT1, polar motion and their combination over one identical row set.
    joint: Vec<JointEopError>,
    /// G12 — the true predicted-vs-final vintage-differenced curve; empty unless an
    /// archived later vintage was supplied.
    predicted_vs_final: Vec<HorizonError>,
    /// The archived later-vintage path, when one was supplied.
    later_source: Option<String>,
    /// Row census of the EOP input: total parsed rows, and how many carry a Bulletin B
    /// final block.
    eop_rows: usize,
    eop_final_rows: usize,
    /// True when the EOP series came from the bundled offline fixture.
    eop_is_bundled_fixture: bool,
    predicted_rows: PredictedRowsSummary,
    measured_pm_floor_mas: Option<f64>,
    frame_realization_floor_derived: bool,
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
        // G8: the frame-realisation floor is DERIVED from an actual Helmert datum
        // realisation (the post-fit RMS residual of lunar_frame_realise) at the tie-noise
        // level, not asserted — unless the caller passes an explicit override.
        let tie_noise_m = self.frame_realization_tie_noise_m.unwrap_or(0.2);
        let floor_m = self
            .frame_realization_floor_m
            .unwrap_or_else(|| derived_frame_realization_floor_m(tie_noise_m));
        let delta_ut1_ms = self.delta_ut1_ms.unwrap_or(0.5);
        if !latency_s.is_finite() || latency_s < 0.0 {
            return Err(format!(
                "latency_s must be finite and non-negative, got {latency_s}"
            ));
        }

        let cov = self.covariance();
        let (body, eop_source) = self.eop_body()?;

        // G7: source the polar-motion prediction error for the L21 budget from the real
        // measured Bulletin-A-minus-Bulletin-B pole residual (the PM final floor, in arc
        // seconds → mas) when the caller does not override it, instead of defaulting to 0.
        let pm_curve = pm_prediction_error_vs_horizon(&body, &[Horizon::Final]);
        let measured_pm_floor_mas = pm_curve
            .first()
            .map(|h| h.rms_s * 1e3) // rms_s carries arc seconds for the PM curve → mas
            .filter(|v| v.is_finite() && *v > 0.0);
        // Split the measured combined-pole floor equally across the two axes (its axes are
        // not separately reported by the combined magnitude); each axis carries
        // floor/√2 so the RSS reproduces the measured magnitude.
        let measured_axis_mas = measured_pm_floor_mas.map(|m| m / std::f64::consts::SQRT_2);
        let delta_xp_mas = self.delta_xp_mas.or(measured_axis_mas).unwrap_or(0.0);
        let delta_yp_mas = self.delta_yp_mas.or(measured_axis_mas).unwrap_or(0.0);

        // G1: ingest the real Bulletin A predicted rows the file publishes (exercises the
        // predicted-column parser on real data).
        let predicted_rows = predicted_rows_summary(&body);
        // G12: a row census of whatever EOP product is actually in force, so the report
        // shows WHY `predicted_rows.n` is what it is instead of leaving a bare 0.
        let eop_rows = crate::eop::parse_all(&body).len();
        let eop_final_rows = eop_rows.saturating_sub(predicted_rows.n);

        // G12: the TRUE predicted-vs-final vintage differencing, run only when an archived
        // later vintage of the same product is supplied. With one vintage there is nothing
        // to difference against and the table stays empty — stated, never synthesised.
        let (predicted_vs_final, later_source) = match &self.eop_finals2000a_later {
            Some(path) => {
                let later = std::fs::read_to_string(path)
                    .map_err(|e| format!("cannot read later-vintage EOP file {path}: {e}"))?;
                (
                    predicted_vs_final_ut1(&body, &later, &self.horizons()),
                    Some(path.clone()),
                )
            }
            None => (Vec::new(), None),
        };

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

        // G14 — the JOINT UT1 + polar-motion table: both quantities and their quadrature
        // combination reduced over one IDENTICAL row set, so the combination is a joint
        // statistic rather than the root-sum-square of two differently-sized samples.
        let joint = joint_eop_error_vs_horizon(&body, &horizons);

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
            joint,
            predicted_vs_final,
            later_source,
            eop_rows,
            eop_final_rows,
            eop_is_bundled_fixture: self.eop_finals2000a.is_none(),
            predicted_rows,
            measured_pm_floor_mas,
            frame_realization_floor_derived: self.frame_realization_floor_m.is_none(),
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
            "# realtime-frame-eop reproducibility table (emitted at runtime as \
             <scenario>.table.csv; golden-pinned in tests/golden/realtime-frame-eop.csv) — \
             P4 Table 1 (frame-error consistency, lever arm L19) + Table 2 (UT1 prediction \
             error vs horizon, L18 over finals2000A, mapped to Moon by L19)\n",
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
        // G14 — one table carrying UT1, polar motion and their combination over an
        // IDENTICAL row set, each component reporting the epochs it was measured at.
        let component = |c: &crate::frame_eop::JointComponent| {
            serde_json::json!({
                "component": c.component,
                "unit": c.unit,
                "n": c.n,
                "epochs_mjd": c.epochs_mjd,
                "rms_native": c.rms_native,
                "p50_native": c.p50_native,
                "p95_native": c.p95_native,
                "max_native": c.max_native,
                "rms_position_m": c.rms_position_m,
            })
        };
        let table3: Vec<serde_json::Value> = c
            .joint
            .iter()
            .map(|r| {
                serde_json::json!({
                    "horizon": horizon_label(r.horizon),
                    "horizon_days": r.horizon.days(),
                    "n": r.n,
                    "ut1": component(&r.ut1),
                    "polar_motion": component(&r.polar_motion),
                    "combined": component(&r.combined),
                })
            })
            .collect();

        // G12 — the predicted-vs-final horizon table is ALWAYS emitted. When it has no rows
        // the report says so, and why, in `status` + `statement`; it never leaves a bare
        // empty array for a reader to interpret, and it never invents a row.
        let pvf_rows: Vec<serde_json::Value> = c
            .predicted_vs_final
            .iter()
            .map(|h| {
                serde_json::json!({
                    "horizon": horizon_label(h.horizon),
                    "horizon_days": h.horizon.days(),
                    "n": h.n,
                    "ut1_rms_ms": h.rms_ms(),
                    "ut1_p50_ms": h.p50_ms(),
                    "ut1_p95_ms": h.p95_ms(),
                    "moon_position_m": h.rms_position_m(),
                })
            })
            .collect();
        let (pvf_status, pvf_statement) = predicted_vs_final_status(c);

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
            "table3_joint_eop": table3,
            "table3_note": "G14 — UT1, polar motion and their quadrature combination over one \
                            IDENTICAL row set per horizon. The two single-quantity curves \
                            (`table2_error_vs_horizon` and the budget's measured pole floor) \
                            each cover whatever rows their own Bulletin B block populates and \
                            can therefore rest on different epochs; this table intersects the \
                            two epoch sets first, so `combined` is a joint statistic and not \
                            the root-sum-square of two differently-sized samples. Each \
                            component reports the epochs it was measured at.",
            "table4_predicted_vs_final_horizon": {
                "status": pvf_status,
                "n_rows": pvf_rows.len(),
                "statement": pvf_statement,
                "as_issued_source": c.eop_source,
                "later_vintage_source": c.later_source,
                "rows": pvf_rows,
            },
            "eop_input": {
                "source": c.eop_source,
                "kind": if c.eop_is_bundled_fixture { "bundled-offline-fixture" } else { "supplied-finals2000a-file" },
                "rows": c.eop_rows,
                "final_rows": c.eop_final_rows,
                "prediction_rows": c.predicted_rows.n,
                "note": "The DOCUMENTED EOP input is a real IERS finals2000A product supplied \
                         through `eop_finals2000a` (the repository ships two verbatim extracts \
                         under tests/fixtures/agency/eop/). The bundled offline fixture is the \
                         fallback only: it is a FINAL-ONLY excerpt, every row carrying a \
                         Bulletin B block, so it publishes no Bulletin A prediction rows and \
                         `predicted_rows.n` is 0 on a bare run for that reason alone — not \
                         because a prediction row is unreadable. A real full product does \
                         carry prediction rows and reports a non-zero count. The bundled \
                         fixture is retained as the runtime default because changing it would \
                         renumber the already-published P4 tables; `rows` = `final_rows` + \
                         `prediction_rows` for whichever input is in force.",
            },
            "predicted_rows": {
                "n": c.predicted_rows.n,
                "first_mjd": c.predicted_rows.first_mjd,
                "last_mjd": c.predicted_rows.last_mjd,
                "note": "Real Bulletin A prediction-only rows (blank Bulletin B) the file \
                         publishes, parsed by eop::parse_all_predicted. A genuine predicted-\
                         vs-final residual needs an archived earlier vintage of the SAME \
                         product; from a single instantaneous fetch these future dates have \
                         no eventual final yet, so the multi-day Table 2 growth uses the \
                         persistence predictor over the real finals instead (honestly \
                         Modelled predictor, real measured error).",
            },
            "realtime_frame_error_budget": {
                "delta_ut1_ms": c.delta_ut1_ms,
                "delta_xp_mas": c.delta_xp_mas,
                "delta_yp_mas": c.delta_yp_mas,
                "measured_pm_floor_mas": c.measured_pm_floor_mas,
                "eop_term_m": c.budget.eop_term_m,
                "ephemeris_term_m": c.budget.ephemeris_term_m,
                "frame_realization_floor_m": c.budget.frame_realization_floor_m,
                "frame_realization_floor_derived": c.frame_realization_floor_derived,
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

/// G12 — the explicit status and prose statement for the predicted-vs-final horizon
/// table. The table is emitted on every run; when it carries no rows this says which of the
/// two reasons applies, so an empty table is never left to be read as "measured and zero".
fn predicted_vs_final_status(c: &Computed) -> (&'static str, String) {
    if !c.predicted_vs_final.is_empty() {
        return (
            "measured",
            format!(
                "Measured over a genuine two-vintage pair: the Bulletin A PREDICTED UT1 of \
                 the as-issued file ({}) differenced against the eventual Bulletin B FINAL \
                 of the archived later vintage ({}), at {} horizon(s).",
                c.eop_source,
                c.later_source.clone().unwrap_or_default(),
                c.predicted_vs_final.len(),
            ),
        );
    }
    if c.later_source.is_some() {
        return (
            "no-matched-pairs",
            format!(
                "EMPTY, and deliberately so: an archived later vintage was supplied ({}) but \
                 no date is carried as a Bulletin A PREDICTION in the as-issued file ({}) and \
                 as a Bulletin B FINAL in the later one at any requested horizon, so there is \
                 no predicted-vs-final residual to report. No row is synthesised.",
                c.later_source.clone().unwrap_or_default(),
                c.eop_source,
            ),
        );
    }
    (
        "no-second-vintage",
        format!(
            "EMPTY, and deliberately so: a predicted-vs-final residual needs TWO vintages of \
             the same finals2000A product. This run was given one ({}). Its Bulletin A \
             prediction rows are for future dates that have no Bulletin B final yet, so the \
             residual does not exist to be measured and none is invented here. Supply an \
             archived later vintage through `eop_finals2000a_later` to populate this table. \
             Until then the multi-day growth reported in `table2_error_vs_horizon` is the \
             PERSISTENCE predictor scored over the real finals — a real measured error, but a \
             Modelled predictor, and not the IERS Bulletin A prediction residual.",
            c.eop_source,
        ),
    )
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
        // the one-hour latency (~14.4 m), and its UT1 equivalent is Δr/(D_EM·ω⊕).
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

        // The real-time regime lands in the order-15-m band (~14.4 m ↔ ~0.51 ms), the
        // genuine propagation of the round representative covariance — NOT pinned to 15.000.
        assert!(
            (13.0..17.0).contains(&pos),
            "real-time frame position {pos} m"
        );
        assert!(
            (pos - 15.0).abs() > 0.3,
            "position {pos} m suspiciously pinned to 15.000"
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

    // G4: a plain runtime run through the api dispatch emits the CSV artifact on RunOutput
    // (not only the #[ignore] golden-regen test), and it matches the scenario's to_csv().
    #[test]
    fn runtime_dispatch_emits_the_csv_artifact() {
        let out = crate::api::run_toml("kind=\"realtime-frame-eop\"\n").unwrap();
        let csv = out
            .csv
            .as_ref()
            .expect("realtime-frame-eop must emit a CSV artifact");
        assert!(csv.contains("table1,real-time,"));
        assert!(csv.contains("table2,final,"));
        // The runtime CSV equals the scenario's own to_csv() byte-for-byte.
        assert_eq!(csv, &RealtimeFrameEopScenario::default().to_csv().unwrap());
        // And write_csv actually writes it to a path.
        let dir = std::env::temp_dir();
        let path = dir.join(format!("kshana_rt_frame_eop_{}.csv", std::process::id()));
        let n = out.write_csv(&path).unwrap();
        assert!(n > 0);
        let read = std::fs::read_to_string(&path).unwrap();
        assert_eq!(&read, csv);
        let _ = std::fs::remove_file(&path);
    }

    // G8: the default frame-realisation floor in the budget is DERIVED from an actual
    // Helmert datum realisation (its post-fit RMS residual), NOT the old asserted 0.2 m.
    #[test]
    fn default_budget_floor_is_the_derived_helmert_residual() {
        let (json, _s) = RealtimeFrameEopScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let b = &v["realtime_frame_error_budget"];
        assert_eq!(b["frame_realization_floor_derived"], true);
        let floor = b["frame_realization_floor_m"].as_f64().unwrap();
        // Independent recompute: the derived floor at the default 0.2 m tie noise.
        let derived = crate::frame_eop::derived_frame_realization_floor_m(0.2);
        assert!(
            (floor - derived).abs() < 1e-12,
            "floor {floor} != derived {derived}"
        );
        // It is a genuine sub-0.3 m residual near the tie level, not pinned to 0.2.
        assert!((0.10..0.30).contains(&floor), "derived floor {floor}");
        assert!(
            (floor - 0.2).abs() > 1e-6,
            "floor {floor} suspiciously pinned to 0.2"
        );

        // An explicit override is respected and flagged as NOT derived.
        let (j2, _) = RealtimeFrameEopScenario {
            frame_realization_floor_m: Some(0.35),
            ..Default::default()
        }
        .run_json()
        .unwrap();
        let v2: Value = serde_json::from_str(&j2).unwrap();
        let b2 = &v2["realtime_frame_error_budget"];
        assert_eq!(b2["frame_realization_floor_derived"], false);
        assert!((b2["frame_realization_floor_m"].as_f64().unwrap() - 0.35).abs() < 1e-12);
    }

    // G7: with a real EOP series carrying Bulletin B polar motion, the default budget
    // sources its polar-motion term from the MEASURED rapid-minus-final pole residual
    // (not the old default of 0). The 2026 fixture carries the Bulletin B PM columns.
    #[test]
    fn budget_pm_term_is_sourced_from_measured_pole_residual() {
        let fixture = "tests/fixtures/agency/eop/finals2000A_2026.txt";
        let (json, _s) = RealtimeFrameEopScenario {
            eop_finals2000a: Some(fixture.to_string()),
            ..Default::default()
        }
        .run_json()
        .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let b = &v["realtime_frame_error_budget"];
        // A real measured PM floor is reported and drives the per-axis pole terms.
        let measured = b["measured_pm_floor_mas"].as_f64().unwrap();
        assert!(
            measured > 0.0,
            "measured PM floor {measured} mas must be > 0"
        );
        let xp = b["delta_xp_mas"].as_f64().unwrap();
        let yp = b["delta_yp_mas"].as_f64().unwrap();
        assert!(
            xp > 0.0 && yp > 0.0,
            "PM axes must be measured, not 0: {xp}/{yp}"
        );
        // Each axis is the measured combined floor split by √2, so the RSS reproduces it.
        let rss = (xp * xp + yp * yp).sqrt();
        assert!(
            (rss - measured).abs() < 1e-9,
            "axis RSS {rss} != measured {measured}"
        );

        // An explicit override still wins and is used verbatim.
        let (j2, _) = RealtimeFrameEopScenario {
            eop_finals2000a: Some(fixture.to_string()),
            delta_xp_mas: Some(0.0),
            delta_yp_mas: Some(0.0),
            ..Default::default()
        }
        .run_json()
        .unwrap();
        let v2: Value = serde_json::from_str(&j2).unwrap();
        assert_eq!(
            v2["realtime_frame_error_budget"]["delta_xp_mas"]
                .as_f64()
                .unwrap(),
            0.0
        );
    }

    // ---- G14: the joint UT1 + polar-motion table reaches the report ----

    // ORACLE: the emitted epoch vectors, plus the quadrature identity recomputed from the
    // two components' own reported positions. Run over a REAL IERS product (the 2026
    // extract), where the pole floor and the UT1 curve genuinely cover different rows.
    #[test]
    fn joint_table_reports_all_three_components_over_identical_rows() {
        let (json, _s) = RealtimeFrameEopScenario {
            eop_finals2000a: Some("tests/fixtures/agency/eop/finals2000A_2026.txt".to_string()),
            horizons_days: Some(vec![1, 2, 5]),
            ..Default::default()
        }
        .run_json()
        .unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let rows = v["table3_joint_eop"]
            .as_array()
            .expect("the joint table must be emitted");
        assert!(!rows.is_empty(), "joint table must carry rows");
        for row in rows {
            let n = row["n"].as_u64().unwrap();
            assert!(n > 0);
            let comps = ["ut1", "polar_motion", "combined"];
            let epochs: Vec<&Vec<Value>> = comps
                .iter()
                .map(|k| row[k]["epochs_mjd"].as_array().unwrap())
                .collect();
            for (k, e) in comps.iter().zip(&epochs) {
                assert_eq!(
                    row[k]["n"].as_u64().unwrap(),
                    n,
                    "{k} count differs from the row count"
                );
                assert_eq!(e.len() as u64, n, "{k} epoch list length differs");
            }
            // Elementwise identity of the three epoch sets.
            // Every list was just asserted to be n long, so indexing the other two is safe.
            for (i, ea) in epochs[0].iter().enumerate().take(n as usize) {
                let a = ea.as_f64().unwrap();
                let b = epochs[1][i].as_f64().unwrap();
                let c = epochs[2][i].as_f64().unwrap();
                assert!(
                    (a - b).abs() < 1e-9 && (a - c).abs() < 1e-9,
                    "epoch {i}: UT1 {a}, pole {b}, combined {c}"
                );
            }
            // The combination is the quadrature sum of its own two components.
            let u = row["ut1"]["rms_position_m"].as_f64().unwrap();
            let p = row["polar_motion"]["rms_position_m"].as_f64().unwrap();
            let got = row["combined"]["rms_position_m"].as_f64().unwrap();
            let expect = (u * u + p * p).sqrt();
            assert!(
                (got - expect).abs() <= 1e-9 * expect.max(1.0),
                "combined {got} m != quadrature sum {expect} m"
            );
            assert!(u > 0.0 && p > 0.0, "both components must contribute");
        }
        // The point of the table: on this real product the joint FINAL row is measured over
        // the shared rows, which is NOT the row count the UT1-only curve reports at the
        // multi-day horizons (those reach the Bulletin A prediction rows the pole cannot).
        let joint_final = rows
            .iter()
            .find(|r| r["horizon"] == "final")
            .expect("a final row");
        let t2_day1 = v["table2_error_vs_horizon"]
            .as_array()
            .unwrap()
            .iter()
            .find(|r| r["horizon"] == "day-1")
            .expect("a day-1 row");
        assert!(
            joint_final["n"].as_u64().unwrap() != t2_day1["n"].as_u64().unwrap(),
            "the row sets are expected to differ on this real product"
        );
    }

    // ---- G12: the real-EOP path, and the always-emitted horizon table ----

    // ORACLE: the real IERS products themselves. `predicted_rows.n` is 0 on a bare run
    // because the BUNDLED fixture is a final-only excerpt — not because the engine cannot
    // read a prediction row. Pointed at a real full product it reports the real count, and
    // the emitted census decomposes exactly.
    #[test]
    fn real_eop_path_publishes_the_prediction_rows_the_fixture_has_none_of() {
        let run = |scn: RealtimeFrameEopScenario| -> Value {
            serde_json::from_str(&scn.run_json().unwrap().0).unwrap()
        };
        let bundled = run(RealtimeFrameEopScenario::default());
        assert_eq!(bundled["predicted_rows"]["n"], 0);
        assert_eq!(bundled["eop_input"]["kind"], "bundled-offline-fixture");
        assert_eq!(bundled["eop_input"]["prediction_rows"], 0);
        // Every bundled row is a final row — that is WHY the count is zero.
        assert_eq!(
            bundled["eop_input"]["rows"], bundled["eop_input"]["final_rows"],
            "the bundled fixture must be a final-only excerpt"
        );

        let real = run(RealtimeFrameEopScenario {
            eop_finals2000a: Some("tests/fixtures/agency/eop/finals2000A_2026.txt".to_string()),
            ..Default::default()
        });
        assert_eq!(real["eop_input"]["kind"], "supplied-finals2000a-file");
        // The real product carries 12 genuine Bulletin A prediction-only rows.
        assert_eq!(real["predicted_rows"]["n"], 12);
        assert_eq!(real["eop_input"]["prediction_rows"], 12);
        // The census decomposes exactly on both inputs.
        for v in [&bundled, &real] {
            let e = &v["eop_input"];
            assert_eq!(
                e["rows"].as_u64().unwrap(),
                e["final_rows"].as_u64().unwrap() + e["prediction_rows"].as_u64().unwrap(),
                "row census must decompose"
            );
            assert!(e["note"].as_str().unwrap().contains("eop_finals2000a"));
        }
    }

    // ORACLE: the report's own field set. The horizon table must be PRESENT on a run that
    // can produce no rows, and its emptiness must be stated in the document — not implied
    // by a missing field, and not left as a bare empty array.
    #[test]
    fn predicted_vs_final_horizon_table_is_emitted_and_states_its_own_emptiness() {
        for scn in [
            RealtimeFrameEopScenario::default(),
            RealtimeFrameEopScenario {
                eop_finals2000a: Some("tests/fixtures/agency/eop/finals2000A_2026.txt".to_string()),
                ..Default::default()
            },
        ] {
            let v: Value = serde_json::from_str(&scn.run_json().unwrap().0).unwrap();
            let t = v
                .get("table4_predicted_vs_final_horizon")
                .expect("the horizon table must always be emitted, even with no rows");
            // Empty — and every part of that emptiness is stated, not implied.
            assert_eq!(t["rows"].as_array().unwrap().len(), 0);
            assert_eq!(t["n_rows"], 0);
            assert_eq!(t["status"], "no-second-vintage");
            assert!(t["later_vintage_source"].is_null());
            let statement = t["statement"].as_str().unwrap();
            assert!(
                statement.contains("EMPTY") && statement.contains("TWO vintages"),
                "the statement must say it is empty and why: {statement}"
            );
            assert!(
                statement.contains("eop_finals2000a_later"),
                "the statement must name the input that would populate it: {statement}"
            );
            // And it must not have quietly borrowed the persistence curve's rows.
            assert!(!v["table2_error_vs_horizon"].as_array().unwrap().is_empty());
        }
    }

    // ORACLE: `frame_eop::predicted_vs_final_ut1` on a genuine two-vintage pair built from
    // REAL rows (an early data cutoff, with the later real rows re-emitted as
    // prediction-only so they carry their real Bulletin A UT1 in the identical columns).
    // Proves the emitted table is reachable and not permanently dead.
    #[test]
    fn predicted_vs_final_horizon_table_populates_from_a_real_second_vintage() {
        let later = include_str!("../tests/fixtures/agency/eop/finals2000A_2022001_longspan.txt");
        let mut as_issued = String::new();
        let mut kept = 0;
        for line in later.lines() {
            if line.trim_start().starts_with('#') || line.len() < 68 {
                as_issued.push_str(line);
            } else if kept < 5 {
                as_issued.push_str(line);
                kept += 1;
            } else {
                // Blank the Bulletin B tail: a real prediction-only row carrying the row's
                // genuine Bulletin A UT1.
                let head: String = line.chars().take(134).collect();
                as_issued.push_str(head.trim_end());
            }
            as_issued.push('\n');
        }
        let dir = std::env::temp_dir();
        let pid = std::process::id();
        let a = dir.join(format!("kshana_eop_issued_{pid}.txt"));
        let b = dir.join(format!("kshana_eop_later_{pid}.txt"));
        std::fs::write(&a, &as_issued).unwrap();
        std::fs::write(&b, later).unwrap();

        let (json, _s) = RealtimeFrameEopScenario {
            eop_finals2000a: Some(a.to_string_lossy().to_string()),
            eop_finals2000a_later: Some(b.to_string_lossy().to_string()),
            horizons_days: Some(vec![1, 2, 5]),
            ..Default::default()
        }
        .run_json()
        .unwrap();
        let _ = std::fs::remove_file(&a);
        let _ = std::fs::remove_file(&b);

        let v: Value = serde_json::from_str(&json).unwrap();
        let t = &v["table4_predicted_vs_final_horizon"];
        assert_eq!(t["status"], "measured", "statement: {}", t["statement"]);
        let rows = t["rows"].as_array().unwrap();
        assert!(!rows.is_empty(), "a real second vintage must produce rows");
        assert_eq!(t["n_rows"].as_u64().unwrap() as usize, rows.len());
        assert!(!t["later_vintage_source"].is_null());
        // Independent oracle: the same residuals straight from frame_eop.
        let direct = predicted_vs_final_ut1(
            &as_issued,
            later,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(5),
            ],
        );
        assert_eq!(rows.len(), direct.len());
        for (row, h) in rows.iter().zip(direct.iter()) {
            assert_eq!(row["n"].as_u64().unwrap() as usize, h.n);
            assert!(row["n"].as_u64().unwrap() >= 1);
            assert!((row["ut1_rms_ms"].as_f64().unwrap() - h.rms_ms()).abs() < 1e-12);
            // Real Bulletin A UT1 tracks the final to well under 10 ms.
            assert!(row["ut1_rms_ms"].as_f64().unwrap() < 10.0);
        }
        assert!(t["statement"].as_str().unwrap().contains("two-vintage"));
    }

    // A missing later-vintage file is a loud error, not a silently empty table.
    #[test]
    fn a_missing_later_vintage_file_is_reported_not_swallowed() {
        let err = RealtimeFrameEopScenario {
            eop_finals2000a_later: Some("/nonexistent/finals2000A_later.txt".to_string()),
            ..Default::default()
        }
        .run_json()
        .unwrap_err();
        assert!(err.contains("later-vintage EOP file"), "{err}");
    }
}
