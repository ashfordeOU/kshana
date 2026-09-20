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
    archived_vintage_comparison, bulletin_a_agreement, derived_frame_realization_floor_m,
    equivalent_horizon_days, frame_eop_svg, frame_error_budget, joint_eop_error_vs_horizon,
    latest_operational_fits, operational_vs_persistence_vs_horizon, pm_prediction_error_vs_horizon,
    predicted_rows_summary, predicted_vs_final_ut1, prediction_error_vs_horizon,
    ArchivedVintageRow, BulletinAAgreement, FrameErrorBudget, Horizon, HorizonError, JointEopError,
    OperationalFit, OperationalPredictorConfig, PredictedRowsSummary, PredictorComparisonRow,
    PredictorError, C_M_S, DEFAULT_OPERATIONAL_WINDOW_DAYS, D_EM_M, LEVER_M_PER_S,
    OMEGA_EARTH_RAD_S,
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
    /// G13 — least-squares fitting window (days) of the **operational-style** Earth-orientation
    /// predictor that Table 5 scores against persistence. Default
    /// [`crate::frame_eop::DEFAULT_OPERATIONAL_WINDOW_DAYS`]; set it to 365 against a real
    /// year-long `finals2000A` product to get the IERS Bulletin A window (which then also
    /// admits the annual, semi-annual and Chandler terms).
    pub operational_window_days: Option<f64>,
    /// G13 — how many cycles of a periodic term the fitting window must span before that
    /// term is admitted to the design matrix. Default 0.5. Terms that fail are reported as
    /// rejected, with the cycles the window spans, rather than silently dropped.
    pub operational_min_cycle_fraction: Option<f64>,
    /// G13 — carry the last in-window fit residual forward onto every forecast (default
    /// `true`), the zero-decay limit of the autoregressive residual stage IERS runs after
    /// its least-squares extrapolation. `false` gives the bare least-squares extrapolation.
    pub operational_anchor_residual: Option<bool>,
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
    /// G13 — the operational-predictor configuration in force.
    op_cfg: OperationalPredictorConfig,
    /// G13 — Table 5: the operational predictor and persistence scored side by side
    /// against the later-published Bulletin B final, over one identical epoch set.
    op_vs_pers: Vec<PredictorComparisonRow>,
    /// G13 — Table 6: the archived-vintage comparison; empty unless a later vintage was
    /// supplied and it matched a prediction row of the as-issued vintage.
    archived: Vec<ArchivedVintageRow>,
    /// G13 — how this crate's forecast compares with the genuine archived Bulletin A
    /// prediction rows the in-force product publishes.
    bulletin_a: Option<BulletinAAgreement>,
    /// G13 — a representative UT1 fit (at the series' last issue epoch) for the model
    /// block, so the admitted and rejected terms are visible in the report.
    rep_ut1_fit: Option<OperationalFit>,
    /// G13 — the polar-motion twin of [`Computed::rep_ut1_fit`] (the `x_p` fit).
    rep_pm_fit: Option<OperationalFit>,
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

        // G13 — the operational-style predictor, scored predicted-vs-final against the
        // later-published Bulletin B final, with persistence beside it over the SAME
        // epochs and the SAME truth so the two differ only in the predictor.
        let op_cfg = self.op_config();
        let op_vs_pers = operational_vs_persistence_vs_horizon(&body, &horizons, &op_cfg);
        let (rep_ut1_fit, rep_pm_fit) = latest_operational_fits(&body, &op_cfg);
        let bulletin_a = bulletin_a_agreement(&body, &op_cfg);
        // G13 — the archived-vintage path: only a genuine second vintage can populate it.
        let archived = match &self.eop_finals2000a_later {
            Some(path) => {
                let later = std::fs::read_to_string(path)
                    .map_err(|e| format!("cannot read later-vintage EOP file {path}: {e}"))?;
                archived_vintage_comparison(&body, &later, &horizons, &op_cfg)
            }
            None => Vec::new(),
        };

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
            op_cfg,
            op_vs_pers,
            archived,
            bulletin_a,
            rep_ut1_fit,
            rep_pm_fit,
        })
    }

    /// G13 — the operational-predictor configuration in force: the crate defaults with
    /// whichever of the three scenario overrides were supplied.
    fn op_config(&self) -> OperationalPredictorConfig {
        let d = OperationalPredictorConfig::default();
        OperationalPredictorConfig {
            window_days: self
                .operational_window_days
                .unwrap_or(DEFAULT_OPERATIONAL_WINDOW_DAYS),
            min_cycle_fraction: self
                .operational_min_cycle_fraction
                .unwrap_or(d.min_cycle_fraction),
            anchor_residual: self
                .operational_anchor_residual
                .unwrap_or(d.anchor_residual),
        }
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
                "p95_position_m": c.p95_position_m,
                "rms_light_time_ns": c.rms_light_time_ns,
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

        let mut doc = serde_json::json!({
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
        // G13 — three new top-level blocks, added beside the P4 tables and changing none
        // of them, plus the unit/provenance map for every numeric field of the document.
        doc["operational_predictor_model"] = self.operational_model_json(c);
        doc["table5_operational_vs_persistence"] = self.table5_json(c);
        doc["table6_archived_vintage_predicted_vs_final"] = self.table6_json(c);
        doc["units"] = units_block();
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }

    /// G13 — the model block: what the operational predictor actually is, the window and
    /// admission threshold in force, the terms it admitted and rejected on this input, and
    /// its agreement with the published Bulletin A prediction rows.
    fn operational_model_json(&self, c: &Computed) -> serde_json::Value {
        let fit = |f: &Option<OperationalFit>| match f {
            Some(f) => fit_json(f),
            None => serde_json::json!({
                "status": "no-complete-window",
                "statement": "No fit is reported for this input: the configured window does \
                              not fit inside the supplied series, and a partial window is \
                              refused rather than quietly shortened.",
            }),
        };
        let agreement = match &c.bulletin_a {
            Some(a) => bulletin_a_json(a),
            None => serde_json::json!({
                "status": "no-published-prediction-rows",
                "statement": "EMPTY, and deliberately so: this check compares the forecast \
                              against the GENUINE Bulletin A prediction rows a real product \
                              publishes past its own data cutoff. The input in force either \
                              carries none (a final-only excerpt) or gives the fit no \
                              complete window at that cutoff. Nothing is invented to fill it.",
            }),
        };
        serde_json::json!({
            "label": G13_LABEL,
            "name": "least-squares bias + rate + principal periodic terms over a trailing \
                     window, extrapolated, with the last in-window residual carried forward",
            "model": "y(t) = a + b·(t−T)/W + Σₖ [cₖ·cos(2π(t−T)/Pₖ) + sₖ·sin(2π(t−T)/Pₖ)] + r, \
                      where T is the issue epoch, W the window, Pₖ the admitted periods and r \
                      the residual at the last in-window observation.",
            "window_days": c.op_cfg.window_days,
            "window_rule": "observations in [T − window_days, T]; the window must be COMPLETE \
                            (the series must reach back to its start) or no forecast is issued \
                            at that epoch. The fit never sees an observation later than T, and \
                            each Table 5 row emits `min_fit_lead_days` as the proof.",
            "min_cycle_fraction": c.op_cfg.min_cycle_fraction,
            "residual_anchored": c.op_cfg.anchor_residual,
            "candidate_terms_ut1": ["bias", "rate", "annual", "semi-annual",
                                    "monthly-zonal-tide", "fortnightly-zonal-tide"],
            "candidate_terms_polar_motion": ["bias", "rate", "chandler", "annual", "semi-annual"],
            "fitted_on": "the rapid Bulletin A columns ONLY — the product a real-time user \
                          holds at the issue epoch. A Bulletin B final never enters a fit; it \
                          is used only as the truth at the target epoch.",
            "leap_seconds": "UT1 is fitted as UT1−TAI and restored to UT1−UTC at the target \
                             epoch, so a leap second inside a window or a forecast is a step in \
                             neither predictor. The same restoration is applied to persistence.",
            "reference_algorithm": "IERS Bulletin A: a least-squares bias + rate + annual + \
                                    semi-annual fit over the last 365 days of tide-reduced UT1R \
                                    (and bias + rate + Chandler + annual for the pole), followed \
                                    by an autoregressive model of the fit residuals.",
            "declared_deviations": [
                "The autoregressive residual stage is NOT reproduced. Carrying the last \
                 in-window residual forward is its zero-decay limit.",
                "The tabulated IERS Conventions zonal-tide reduction to UT1R is NOT \
                 reproduced. The two principal zonal-tide periods (Mm, Mf) are carried as \
                 fitted cos/sin pairs instead, with the amplitude estimated over the window \
                 rather than tabulated.",
                "The 365-day operational window is not reachable with the series committed \
                 here; the window is a scenario input and the value in force is reported \
                 above, together with the periodic terms it was too short to admit.",
                "This is the model CLASS Bulletin A uses. It is not Bulletin A, and the \
                 `published_bulletin_a_agreement` block below measures how far apart the two \
                 are at each lead on whichever real product carries prediction rows.",
            ],
            "representative_fit": {
                "note": "The UT1 and x_p models as they stand at the LAST epoch of the input \
                         series — the most recent forecast this product could have issued. \
                         Reported so the admitted and rejected terms are visible as data \
                         rather than asserted in prose.",
                "ut1": fit(&c.rep_ut1_fit),
                "polar_motion_xp": fit(&c.rep_pm_fit),
            },
            "published_bulletin_a_agreement": agreement,
        })
    }

    /// G13 — Table 5: the operational predictor and persistence, scored predicted-versus-
    /// final over one identical epoch set.
    fn table5_json(&self, c: &Computed) -> serde_json::Value {
        let rows: Vec<serde_json::Value> = c
            .op_vs_pers
            .iter()
            .map(|r| {
                serde_json::json!({
                    "horizon": horizon_label(r.horizon),
                    "horizon_days": r.horizon.days(),
                    "n": r.n,
                    "epochs_mjd": r.epochs_mjd,
                    "target_mjds": r.target_mjds,
                    "min_fit_lead_days": r.min_fit_lead_days,
                    "fit_rows_min": r.fit_rows_min,
                    "fit_rows_max": r.fit_rows_max,
                    "ut1": quantity_pair_json("ut1", &r.ut1_operational, &r.ut1_persistence),
                    "polar_motion": quantity_pair_json(
                        "polar-motion", &r.pm_operational, &r.pm_persistence),
                    "combined": quantity_pair_json(
                        "combined", &r.combined_operational, &r.combined_persistence),
                })
            })
            .collect();
        let target_m = c.table1[1].frame_position_m;
        let cross = |pick: fn(&PredictorComparisonRow) -> (f64, f64)| -> serde_json::Value {
            let curve: Vec<(f64, f64)> = c.op_vs_pers.iter().map(pick).collect();
            match equivalent_horizon_days(&curve, target_m) {
                Some(d) => d.into(),
                None => serde_json::Value::Null,
            }
        };
        let (status, statement) = if c.op_vs_pers.is_empty() {
            (
                "insufficient-data",
                format!(
                "EMPTY, and deliberately so: a predicted-versus-final row needs an issue epoch \
                 with a COMPLETE {:.0}-day fit window behind it and a published Bulletin B \
                 final at the target epoch. The input in force ({}) supplies no epoch meeting \
                 both. Shorten `operational_window_days`, or supply a longer real finals2000A \
                 series — no row is manufactured to fill the table.",
                c.op_cfg.window_days, c.eop_source),
            )
        } else {
            (
                "measured",
                format!(
                    "Measured over the real series in force ({}). Every row is a genuine \
                 prediction error: a forecast for T+h formed from rapid Bulletin A rows at or \
                 before T, scored against the LATER-PUBLISHED Bulletin B final at T+h. \
                 Persistence is scored over the identical epoch set against the identical \
                 finals, so the two columns differ in the predictor and in nothing else. \
                 `improvement_factor` below 1 means the operational predictor is WORSE than \
                 persistence at that horizon, and is reported as such.",
                    c.eop_source
                ),
            )
        };
        serde_json::json!({
            "status": status,
            "statement": statement,
            "n_rows": rows.len(),
            "truth_definition": "the Bulletin B FINAL at the target epoch. A target epoch with \
                                 no published final is skipped; the rapid Bulletin A value is \
                                 never substituted as truth, which is what separates this table \
                                 from `table2_error_vs_horizon`.",
            "relation_to_table2": "table2_error_vs_horizon is unchanged and still reports the \
                                   PERSISTENCE curve with the rapid-if-no-final truth rule over \
                                   its own epoch set. Its numbers are NOT the persistence column \
                                   here: this table requires a published final at the target and \
                                   a complete fit window behind the issue epoch, so it covers a \
                                   smaller, different epoch set. Compare within a table, never \
                                   across the two.",
            "rows": rows,
            "equivalent_horizon_days": {
                "target_position_m": target_m,
                "statement": "The horizon at which each predictor's measured Moon-frame error \
                              reaches the Table 1 real-time frame position, by linear \
                              interpolation BETWEEN two measured horizons that bracket it. Null \
                              when no measured pair brackets the target — the curve is never \
                              extrapolated past its own data to manufacture a horizon.",
                "ut1": {
                    "operational": cross(|r| (r.horizon.days(), r.ut1_operational.rms_position_m)),
                    "persistence": cross(|r| (r.horizon.days(), r.ut1_persistence.rms_position_m)),
                },
                "combined": {
                    "operational": cross(|r| (
                        r.horizon.days(), r.combined_operational.rms_position_m)),
                    "persistence": cross(|r| (
                        r.horizon.days(), r.combined_persistence.rms_position_m)),
                },
            },
        })
    }

    /// G13 — Table 6: the archived-vintage predicted-versus-final comparison. Always
    /// emitted; populated only by a genuine second vintage.
    fn table6_json(&self, c: &Computed) -> serde_json::Value {
        let rows: Vec<serde_json::Value> = c
            .archived
            .iter()
            .map(|r| {
                let trio = |q: &str, a: &PredictorError, o: &PredictorError, p: &PredictorError| {
                    serde_json::json!({
                        "quantity": q,
                        "archived_bulletin_a": predictor_error_json(a),
                        "operational": predictor_error_json(o),
                        "persistence": predictor_error_json(p),
                    })
                };
                serde_json::json!({
                    "horizon": horizon_label(r.horizon),
                    "horizon_days": r.horizon.days(),
                    "issue_mjd": r.issue_mjd,
                    "n": r.n,
                    "epochs_mjd": r.epochs_mjd,
                    "ut1": trio("ut1", &r.ut1_archived, &r.ut1_operational, &r.ut1_persistence),
                    "polar_motion": trio(
                        "polar-motion", &r.pm_archived, &r.pm_operational, &r.pm_persistence),
                })
            })
            .collect();
        let (status, statement) =
            if !rows.is_empty() {
                (
                    "measured",
                    format!(
                "Measured over a genuine two-vintage pair: the as-issued vintage ({}) carries \
                 real Bulletin A predictions past its own data cutoff, and the archived later \
                 vintage ({}) carries the Bulletin B finals those dates eventually received. \
                 Three forecasts are scored against that final — the archived Bulletin A \
                 prediction itself, this crate's operational-style fit over the as-issued \
                 vintage, and persistence at the cutoff.",
                c.eop_source, c.later_source.clone().unwrap_or_default()),
                )
            } else if c.later_source.is_some() {
                (
                    "no-matched-pairs",
                    format!(
                "EMPTY, and deliberately so: a later vintage was supplied ({}) but no date is \
                 carried as a Bulletin A PREDICTION in the as-issued file ({}) and as a \
                 Bulletin B FINAL in the later one at any requested horizon. No row is \
                 synthesised.",
                c.later_source.clone().unwrap_or_default(), c.eop_source),
                )
            } else {
                (
                    "no-second-vintage",
                    format!(
                "EMPTY, and deliberately so. Scoring a GENUINE ARCHIVED prediction needs two \
                 vintages of the same finals2000A product; this run was given one ({}). The \
                 repository ships no archived earlier vintage, and one is NOT manufactured by \
                 perturbing the vintage it has — a synthesised archive would make every number \
                 in this table a measurement of the perturbation. Supply a real archived later \
                 vintage through `eop_finals2000a_later` to populate it. Until then the \
                 genuine predicted-versus-final errors this report does carry are in \
                 `table5_operational_vs_persistence`, where the forecast is this crate's own \
                 and the truth is the later-published Bulletin B final.",
                c.eop_source),
                )
            };
        serde_json::json!({
            "status": status,
            "statement": statement,
            "n_rows": rows.len(),
            "as_issued_source": c.eop_source,
            "later_vintage_source": c.later_source,
            "rows": rows,
        })
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

// ---------------------------------------------------------------------------
// G13 — emission of the operational-predictor model, Table 5 and Table 6.
// ---------------------------------------------------------------------------

/// The G13 honesty label. The document's top-level `label` describes P4 Tables 1–4 and is
/// deliberately left byte-identical by the additive-only rule; this one covers the
/// operational-predictor additions.
const G13_LABEL: &str = "Operational-style Earth-orientation predictor (Table 5) and the \
archived-vintage predicted-vs-final path (Table 6). VALIDATED real data: every residual is \
a genuine prediction error — a forecast formed from rapid Bulletin A rows at or before the \
issue epoch, scored against the LATER-PUBLISHED Bulletin B final at the target epoch; no \
target without a published final is scored, and no value is back-filled. MODELLED: the \
predictor is a least-squares bias+rate fit plus the principal periodic terms with the last \
in-window residual carried forward — the class Bulletin A uses, NOT Bulletin A. IERS \
additionally reduces UT1 to UT1R with the tabulated IERS Conventions zonal-tide \
coefficients and runs an autoregressive filter on the fit residuals; neither is reproduced \
here, and the two principal zonal-tide periods are fitted instead of tabulated. NOTHING in \
Table 6 is produced from a synthesised vintage: an archived earlier vintage of the same \
product is an input, and with only one vintage the table reports no rows and says why.";

/// The `unit` + `provenance` map for every numeric field the report publishes. Paths are
/// dotted; `x[]` descends into the first element of the array `x`, and `*` stands for
/// every object-valued member of an object (the three quantity blocks of a Table 5/6 row).
fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::new();
    let mut put = |k: &str, unit: &str, prov: &str, note: &str| {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), unit.into());
        e.insert("provenance".into(), prov.into());
        if !note.is_empty() {
            e.insert("note".into(), note.into());
        }
        m.insert(k.to_string(), serde_json::Value::Object(e));
    };

    // --- document scalars and the pre-existing P4 tables ---
    put(
        "latency_s",
        "s",
        "input",
        "real-time EOP prediction latency",
    );
    put(
        "lever_arm_m_per_s",
        "m/s",
        "constant",
        "D_EM * omega_earth (L19)",
    );
    put(
        "earth_moon_distance_m",
        "m",
        "constant",
        "DE440 mean Earth-Moon distance",
    );
    put("omega_earth_rad_s", "rad/s", "constant", "");
    put("table1_consistency[].frame_position_m", "m", "modelled", "");
    put(
        "table1_consistency[].ut1_equiv_ms",
        "ms",
        "computed",
        "L19 image of the position",
    );
    put("table1_consistency[].light_time_ns", "ns", "computed", "");
    put("table2_error_vs_horizon[].horizon_days", "day", "input", "");
    put("table2_error_vs_horizon[].n", "count", "measured", "");
    put("table2_error_vs_horizon[].ut1_rms_ms", "ms", "measured", "");
    put("table2_error_vs_horizon[].ut1_p50_ms", "ms", "measured", "");
    put("table2_error_vs_horizon[].ut1_p95_ms", "ms", "measured", "");
    put(
        "table2_error_vs_horizon[].moon_position_m",
        "m",
        "computed",
        "",
    );
    put(
        "table2_error_vs_horizon[].moon_light_time_ns",
        "ns",
        "computed",
        "",
    );
    put("table3_joint_eop[].horizon_days", "day", "input", "");
    put("table3_joint_eop[].n", "count", "measured", "");
    for q in ["ut1", "polar_motion", "combined"] {
        put(
            &format!("table3_joint_eop[].{q}.n"),
            "count",
            "measured",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.epochs_mjd"),
            "MJD (day)",
            "measured",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.rms_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.p50_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.p95_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.max_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.rms_position_m"),
            "m",
            "computed",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.p95_position_m"),
            "m",
            "computed",
            "",
        );
        put(
            &format!("table3_joint_eop[].{q}.rms_light_time_ns"),
            "ns",
            "computed",
            "",
        );
    }
    put(
        "table4_predicted_vs_final_horizon.n_rows",
        "count",
        "measured",
        "",
    );
    put(
        "table4_predicted_vs_final_horizon.rows[].horizon_days",
        "day",
        "input",
        "",
    );
    put(
        "table4_predicted_vs_final_horizon.rows[].n",
        "count",
        "measured",
        "",
    );
    put(
        "table4_predicted_vs_final_horizon.rows[].ut1_rms_ms",
        "ms",
        "measured",
        "",
    );
    put(
        "table4_predicted_vs_final_horizon.rows[].ut1_p50_ms",
        "ms",
        "measured",
        "",
    );
    put(
        "table4_predicted_vs_final_horizon.rows[].ut1_p95_ms",
        "ms",
        "measured",
        "",
    );
    put(
        "table4_predicted_vs_final_horizon.rows[].moon_position_m",
        "m",
        "computed",
        "",
    );
    put("eop_input.rows", "count", "measured", "");
    put("eop_input.final_rows", "count", "measured", "");
    put("eop_input.prediction_rows", "count", "measured", "");
    put("predicted_rows.n", "count", "measured", "");
    put(
        "predicted_rows.first_mjd",
        "MJD (day)",
        "measured",
        "null when the input publishes no prediction row",
    );
    put(
        "predicted_rows.last_mjd",
        "MJD (day)",
        "measured",
        "null when the input publishes no prediction row",
    );
    put(
        "realtime_frame_error_budget.delta_ut1_ms",
        "ms",
        "input",
        "",
    );
    put(
        "realtime_frame_error_budget.delta_xp_mas",
        "mas",
        "measured-or-input",
        "measured pole floor / sqrt(2) unless overridden",
    );
    put(
        "realtime_frame_error_budget.delta_yp_mas",
        "mas",
        "measured-or-input",
        "",
    );
    put(
        "realtime_frame_error_budget.measured_pm_floor_mas",
        "mas",
        "measured",
        "null when the input carries no Bulletin B pole",
    );
    put(
        "realtime_frame_error_budget.eop_term_m",
        "m",
        "computed",
        "",
    );
    put(
        "realtime_frame_error_budget.ephemeris_term_m",
        "m",
        "modelled",
        "",
    );
    put(
        "realtime_frame_error_budget.frame_realization_floor_m",
        "m",
        "derived",
        "Helmert post-fit RMS residual unless overridden",
    );
    put("realtime_frame_error_budget.total_m", "m", "computed", "");
    put(
        "realtime_frame_error_budget.total_time_ns",
        "ns",
        "computed",
        "",
    );

    // --- G13: the operational predictor ---
    put(
        "operational_predictor_model.window_days",
        "day",
        "input",
        "",
    );
    put(
        "operational_predictor_model.min_cycle_fraction",
        "cycle (dimensionless)",
        "input",
        "",
    );
    for q in ["ut1", "polar_motion_xp"] {
        let u = if q == "ut1" { "s" } else { "arcsec" };
        put(
            &format!("operational_predictor_model.representative_fit.{q}.issue_mjd"),
            "MJD (day)",
            "measured",
            "",
        );
        put(
            &format!("operational_predictor_model.representative_fit.{q}.window_first_mjd"),
            "MJD (day)",
            "measured",
            "",
        );
        put(
            &format!("operational_predictor_model.representative_fit.{q}.window_last_mjd"),
            "MJD (day)",
            "measured",
            "",
        );
        put(
            &format!("operational_predictor_model.representative_fit.{q}.n_fit"),
            "count",
            "measured",
            "",
        );
        put(
            &format!("operational_predictor_model.representative_fit.{q}.rms_fit_residual_native"),
            u,
            "computed",
            "in-window post-fit RMS, NOT a prediction error",
        );
        put(
            &format!("operational_predictor_model.representative_fit.{q}.anchor_residual_native"),
            u,
            "computed",
            "the last in-window residual carried onto every forecast",
        );
        put(
            &format!(
                "operational_predictor_model.representative_fit.{q}.terms_rejected[].period_days"
            ),
            "day",
            "constant",
            "",
        );
        put(&format!("operational_predictor_model.representative_fit.{q}.terms_rejected[].cycles_spanned"), "cycle (dimensionless)", "computed", "");
        put(&format!("operational_predictor_model.representative_fit.{q}.terms_rejected[].threshold_cycles"), "cycle (dimensionless)", "input", "");
    }
    put(
        "operational_predictor_model.published_bulletin_a_agreement.issue_mjd",
        "MJD (day)",
        "measured",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.n",
        "count",
        "measured",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.first_lead_days",
        "day",
        "measured",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.last_lead_days",
        "day",
        "measured",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.ut1_rms_s",
        "s",
        "computed",
        "agreement with the published prediction, NOT an error",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.ut1_rms_position_m",
        "m",
        "computed",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.pm_rms_arcsec",
        "arcsec",
        "computed",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.pm_rms_position_m",
        "m",
        "computed",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.leads[].lead_days",
        "day",
        "measured",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.leads[].ut1_diff_s",
        "s",
        "computed",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.leads[].ut1_position_m",
        "m",
        "computed",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.leads[].pm_diff_arcsec",
        "arcsec",
        "computed",
        "",
    );
    put(
        "operational_predictor_model.published_bulletin_a_agreement.leads[].pm_position_m",
        "m",
        "computed",
        "",
    );

    // --- G13: Table 5 ---
    let t5 = "table5_operational_vs_persistence";
    put(&format!("{t5}.n_rows"), "count", "measured", "");
    put(&format!("{t5}.rows[].horizon_days"), "day", "input", "");
    put(&format!("{t5}.rows[].n"), "count", "measured", "");
    put(
        &format!("{t5}.rows[].epochs_mjd"),
        "MJD (day)",
        "measured",
        "the issue epochs the forecasts were made at",
    );
    put(
        &format!("{t5}.rows[].target_mjds"),
        "MJD (day)",
        "measured",
        "the epochs the forecasts were scored at",
    );
    put(&format!("{t5}.rows[].min_fit_lead_days"), "day", "computed", "smallest gap between any fit window's last observation and the epoch it predicted; > 0 is the no-look-ahead proof");
    put(
        &format!("{t5}.rows[].fit_rows_min"),
        "count",
        "measured",
        "",
    );
    put(
        &format!("{t5}.rows[].fit_rows_max"),
        "count",
        "measured",
        "",
    );
    put(&format!("{t5}.rows[].*.improvement_factor"), "ratio (dimensionless)", "computed", "persistence RMS / operational RMS; below 1 means the operational predictor is WORSE at that horizon");
    for p in ["operational", "persistence"] {
        put(&format!("{t5}.rows[].*.{p}.n"), "count", "measured", "");
        put(
            &format!("{t5}.rows[].*.{p}.rms_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t5}.rows[].*.{p}.p50_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t5}.rows[].*.{p}.p95_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t5}.rows[].*.{p}.max_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t5}.rows[].*.{p}.rms_position_m"),
            "m",
            "computed",
            "",
        );
        put(
            &format!("{t5}.rows[].*.{p}.p95_position_m"),
            "m",
            "computed",
            "",
        );
        put(
            &format!("{t5}.rows[].*.{p}.rms_light_time_ns"),
            "ns",
            "computed",
            "",
        );
    }
    put(
        &format!("{t5}.equivalent_horizon_days.target_position_m"),
        "m",
        "modelled",
        "the Table 1 real-time frame position the horizon is read against",
    );
    for q in ["ut1", "combined"] {
        for p in ["operational", "persistence"] {
            put(&format!("{t5}.equivalent_horizon_days.{q}.{p}"), "day", "computed", "null when no measured pair of horizons brackets the target; the curve is never extrapolated");
        }
    }

    // --- G13: Table 6 ---
    let t6 = "table6_archived_vintage_predicted_vs_final";
    put(&format!("{t6}.n_rows"), "count", "measured", "");
    put(&format!("{t6}.rows[].horizon_days"), "day", "input", "");
    put(&format!("{t6}.rows[].n"), "count", "measured", "");
    put(
        &format!("{t6}.rows[].issue_mjd"),
        "MJD (day)",
        "measured",
        "the as-issued vintage's data cutoff",
    );
    put(
        &format!("{t6}.rows[].epochs_mjd"),
        "MJD (day)",
        "measured",
        "",
    );
    for p in ["archived_bulletin_a", "operational", "persistence"] {
        put(&format!("{t6}.rows[].*.{p}.n"), "count", "measured", "");
        put(
            &format!("{t6}.rows[].*.{p}.rms_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t6}.rows[].*.{p}.p50_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t6}.rows[].*.{p}.p95_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t6}.rows[].*.{p}.max_native"),
            "see the sibling `unit` field",
            "measured",
            "",
        );
        put(
            &format!("{t6}.rows[].*.{p}.rms_position_m"),
            "m",
            "computed",
            "",
        );
        put(
            &format!("{t6}.rows[].*.{p}.p95_position_m"),
            "m",
            "computed",
            "",
        );
        put(
            &format!("{t6}.rows[].*.{p}.rms_light_time_ns"),
            "ns",
            "computed",
            "",
        );
    }
    serde_json::Value::Object(m)
}

/// One [`PredictorError`] as JSON.
fn predictor_error_json(e: &PredictorError) -> serde_json::Value {
    serde_json::json!({
        "predictor": e.predictor,
        "unit": e.unit,
        "n": e.n,
        "rms_native": e.rms_native,
        "p50_native": e.p50_native,
        "p95_native": e.p95_native,
        "max_native": e.max_native,
        "rms_position_m": e.rms_position_m,
        "p95_position_m": e.p95_position_m,
        "rms_light_time_ns": e.rms_light_time_ns,
    })
}

/// `persistence RMS / operational RMS` on the Moon-frame position, or `null`.
fn improvement_factor(op: &PredictorError, pers: &PredictorError) -> serde_json::Value {
    if op.rms_position_m > 0.0 {
        (pers.rms_position_m / op.rms_position_m).into()
    } else {
        serde_json::Value::Null
    }
}

/// One Table 5 quantity block: both predictors plus the ratio between them.
fn quantity_pair_json(
    quantity: &str,
    op: &PredictorError,
    pers: &PredictorError,
) -> serde_json::Value {
    serde_json::json!({
        "quantity": quantity,
        "improvement_factor": improvement_factor(op, pers),
        "operational": predictor_error_json(op),
        "persistence": predictor_error_json(pers),
    })
}

/// One fitted model as JSON, for the report's model block.
fn fit_json(f: &OperationalFit) -> serde_json::Value {
    let rejected: Vec<serde_json::Value> = f
        .rejected_terms
        .iter()
        .map(|r| {
            serde_json::json!({
                "term": r.name,
                "period_days": r.period_days,
                "cycles_spanned": r.cycles_spanned,
                "threshold_cycles": r.threshold_cycles,
                "reason": "the fitting window spans fewer cycles of this period than the \
                           admission threshold, so the term cannot be separated from the \
                           bias/rate pair; it is rejected rather than fitted",
            })
        })
        .collect();
    serde_json::json!({
        "issue_mjd": f.issue_mjd,
        "window_first_mjd": f.window_first_mjd,
        "window_last_mjd": f.window_last_mjd,
        "n_fit": f.n_fit,
        "terms_admitted": f.term_names,
        "terms_rejected": rejected,
        "rms_fit_residual_native": f.rms_fit_residual,
        "anchor_residual_native": f.anchor_residual,
    })
}

/// The Bulletin A agreement block.
fn bulletin_a_json(a: &BulletinAAgreement) -> serde_json::Value {
    let leads: Vec<serde_json::Value> = a
        .leads
        .iter()
        .map(|l| {
            serde_json::json!({
                "lead_days": l.lead_days,
                "ut1_diff_s": l.ut1_diff_s,
                "ut1_position_m": l.ut1_position_m,
                "pm_diff_arcsec": l.pm_diff_arcsec,
                "pm_position_m": l.pm_position_m,
            })
        })
        .collect();
    serde_json::json!({
        "status": "measured",
        "statement": "How far this crate's operational-style forecast sits from the GENUINE \
                      ARCHIVED Bulletin A prediction the same file publishes for the same \
                      future dates. This is an AGREEMENT statistic, not an error: neither \
                      quantity is a truth value and no Bulletin B final is involved. It is \
                      the only external check on the predictor available from a single \
                      vintage, and it is the honest place to read how far this model class \
                      is from the operational product at each lead.",
        "issue_mjd": a.issue_mjd,
        "n": a.n,
        "first_lead_days": a.first_lead_days,
        "last_lead_days": a.last_lead_days,
        "ut1_rms_s": a.ut1_rms_s,
        "ut1_rms_position_m": a.ut1_rms_position_m,
        "pm_rms_arcsec": a.pm_rms_arcsec,
        "pm_rms_position_m": a.pm_rms_position_m,
        "leads": leads,
    })
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
            // The 95th-percentile position and the RMS position must share ONE lever arm.
            // Two columns that map the same residual series to metres through two different
            // constants would be the quiet way for this table to become incoherent, and a
            // consumer reading both columns cannot detect it from the numbers alone.
            for k in comps {
                let rms_native = row[k]["rms_native"].as_f64().unwrap();
                let p95_native = row[k]["p95_native"].as_f64().unwrap();
                let rms_pos = row[k]["rms_position_m"].as_f64().unwrap();
                let p95_pos = row[k]["p95_position_m"].as_f64().unwrap();
                if rms_native > 0.0 && p95_native > 0.0 {
                    let lever_rms = rms_pos / rms_native;
                    let lever_p95 = p95_pos / p95_native;
                    let rel = (lever_rms - lever_p95).abs() / lever_rms;
                    assert!(
                        rel < 1e-12,
                        "{k}: RMS maps to metres at {lever_rms} but p95 at {lever_p95} \
                         (rel {rel}) -- the two position columns disagree on the lever arm"
                    );
                }
                // Ordering survives the mapping: p95 >= RMS in native units must still hold
                // in metres, which it does only because the mapping is linear and positive.
                assert_eq!(
                    p95_native >= rms_native,
                    p95_pos >= rms_pos,
                    "{k}: the native and metre columns disagree on which of p95/RMS is larger"
                );
            }

            // The light-time column is the position column in flight time, nothing else.
            for k in comps {
                let pos = row[k]["rms_position_m"].as_f64().unwrap();
                let ns = row[k]["rms_light_time_ns"].as_f64().unwrap();
                let expect = pos / crate::frame_eop::C_M_S * 1e9;
                assert!(
                    (ns - expect).abs() <= 1e-9 * expect.max(1.0),
                    "{k}: light time {ns} ns != {expect} ns for {pos} m"
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

    // ---- G13: the operational-style predictor reaches the report ----

    /// The real 45-row extract: the longest verbatim series committed here, and the only
    /// input whose row count makes a per-horizon statistic worth reading.
    const LONGSPAN_PATH: &str = "tests/fixtures/agency/eop/finals2000A_2022001_longspan.txt";
    /// The real 2026 extract: 20 final rows plus 12 genuine Bulletin A prediction rows.
    const REAL_2026_PATH: &str = "tests/fixtures/agency/eop/finals2000A_2026.txt";

    /// Run a scenario and parse its report.
    fn run(scn: RealtimeFrameEopScenario) -> Value {
        serde_json::from_str(&scn.run_json().expect("run").0).expect("valid JSON")
    }

    /// The report over the real 45-row series at five horizons — the configuration every
    /// G13 number quoted anywhere comes from.
    fn longspan_report() -> Value {
        run(RealtimeFrameEopScenario {
            eop_finals2000a: Some(LONGSPAN_PATH.to_string()),
            horizons_days: Some(vec![1, 2, 3, 5, 10]),
            ..Default::default()
        })
    }

    /// The report over the real 2026 extract — the only shipped input that publishes
    /// genuine Bulletin A prediction rows, so the only one whose agreement block fills.
    fn real_2026_report() -> Value {
        run(RealtimeFrameEopScenario {
            eop_finals2000a: Some(REAL_2026_PATH.to_string()),
            ..Default::default()
        })
    }

    /// An as-issued vintage built by truncating the Bulletin B tail of the real 45-row
    /// series after its first `kept` rows, so the later rows read as prediction-only.
    /// Every value is a real IERS value; only the trailing final block is removed. See
    /// [`tests::table6_populates_from_a_two_vintage_pair_and_scores_all_three_predictors`]
    /// for why this is a reachability construction and not an archived vintage.
    fn truncated_as_issued(later: &str, kept: usize) -> String {
        let mut out = String::new();
        let mut n = 0;
        for line in later.lines() {
            if line.trim_start().starts_with('#') || line.len() < 68 {
                out.push_str(line);
            } else if n < kept {
                out.push_str(line);
                n += 1;
            } else {
                let head: String = line.chars().take(134).collect();
                out.push_str(head.trim_end());
            }
            out.push('\n');
        }
        out
    }

    /// Distinguishes the temp files of concurrent `two_vintage_report` calls.
    static TWO_VINTAGE_SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);

    /// Run the scenario over a genuine two-vintage pair (see [`truncated_as_issued`]),
    /// through real files on disk, and return the report.
    fn two_vintage_report(kept: usize, tag: &str) -> Value {
        let later = include_str!("../tests/fixtures/agency/eop/finals2000A_2022001_longspan.txt");
        let as_issued = truncated_as_issued(later, kept);
        let dir = std::env::temp_dir();
        let pid = std::process::id();
        // The sequence number is what makes these paths unique, not the tag. Cargo runs
        // the library tests as parallel threads of ONE process, so the pid is shared, and
        // `all_reports()` — itself called by three separate tests — passes the same tag
        // every time. Keyed on tag alone, those three raced on one pair of files: whichever
        // finished first removed them while another was still reading, and the run failed
        // with ENOENT on a file it had just written. Intermittent, so it passed the gate
        // once before it failed one.
        let seq = TWO_VINTAGE_SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
        let a = dir.join(format!("kshana_g13_issued_{tag}_{pid}_{seq}.txt"));
        let b = dir.join(format!("kshana_g13_later_{tag}_{pid}_{seq}.txt"));
        std::fs::write(&a, &as_issued).unwrap();
        std::fs::write(&b, later).unwrap();
        let v = run(RealtimeFrameEopScenario {
            eop_finals2000a: Some(a.to_string_lossy().to_string()),
            eop_finals2000a_later: Some(b.to_string_lossy().to_string()),
            horizons_days: Some(vec![1, 2, 5]),
            ..Default::default()
        });
        let _ = std::fs::remove_file(&a);
        let _ = std::fs::remove_file(&b);
        v
    }

    /// The reports the unit/provenance ratchet is run over. Between them every block of
    /// the document is populated at least once, so a field that only exists on a real
    /// input — or only on a two-vintage run — cannot escape the check by being absent
    /// from the bare default run.
    fn all_reports() -> Vec<Value> {
        vec![
            run(RealtimeFrameEopScenario::default()),
            longspan_report(),
            real_2026_report(),
            two_vintage_report(25, "units"),
        ]
    }

    // ORACLE: the library curve recomputed directly from the same real file, through the
    // public `frame_eop` entry point rather than the scenario. Every emitted statistic
    // must equal it, and the row must satisfy the identities the report claims for it.
    #[test]
    fn table5_equals_the_library_comparison_over_the_same_real_series() {
        let v = longspan_report();
        let t5 = &v["table5_operational_vs_persistence"];
        assert_eq!(t5["status"], "measured", "{}", t5["statement"]);
        let rows = t5["rows"].as_array().expect("rows");
        let body = std::fs::read_to_string(LONGSPAN_PATH).expect("fixture");
        let direct = crate::frame_eop::operational_vs_persistence_vs_horizon(
            &body,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(3),
                Horizon::Days(5),
                Horizon::Days(10),
            ],
            &OperationalPredictorConfig::default(),
        );
        assert_eq!(rows.len(), direct.len());
        assert_eq!(t5["n_rows"].as_u64().unwrap() as usize, rows.len());
        for (row, d) in rows.iter().zip(&direct) {
            assert_eq!(row["n"].as_u64().unwrap() as usize, d.n);
            assert!(d.n > 0);
            for (key, pair) in [
                ("ut1", (&d.ut1_operational, &d.ut1_persistence)),
                ("polar_motion", (&d.pm_operational, &d.pm_persistence)),
                (
                    "combined",
                    (&d.combined_operational, &d.combined_persistence),
                ),
            ] {
                for (who, e) in [("operational", pair.0), ("persistence", pair.1)] {
                    let j = &row[key][who];
                    assert_eq!(j["unit"], e.unit, "{key}/{who} unit");
                    assert_eq!(j["n"].as_u64().unwrap() as usize, e.n);
                    let got = j["rms_native"].as_f64().unwrap();
                    assert!(
                        (got - e.rms_native).abs() <= 1e-12 * e.rms_native.abs().max(1e-12),
                        "{key}/{who}: {got} != {}",
                        e.rms_native
                    );
                    assert!(
                        (j["rms_position_m"].as_f64().unwrap() - e.rms_position_m).abs() < 1e-12
                    );
                }
                // The ratio is the two emitted position RMSs and nothing else.
                let o = row[key]["operational"]["rms_position_m"].as_f64().unwrap();
                let p = row[key]["persistence"]["rms_position_m"].as_f64().unwrap();
                let f = row[key]["improvement_factor"].as_f64().unwrap();
                assert!(
                    (f - p / o).abs() <= 1e-12 * f.max(1.0),
                    "{key}: {f} != {}",
                    p / o
                );
            }
            // No fit ever saw its own target, and the report says so per row.
            assert!(
                row["min_fit_lead_days"].as_f64().unwrap() >= 1.0,
                "a fit window reached within a day of its target"
            );
            assert_eq!(
                row["epochs_mjd"].as_array().unwrap().len(),
                row["n"].as_u64().unwrap() as usize
            );
            assert_eq!(
                row["target_mjds"].as_array().unwrap().len(),
                row["n"].as_u64().unwrap() as usize
            );
        }
    }

    // The point of the whole exercise: the operational predictor's error is a DIFFERENT
    // number from persistence's, both are reported, and the horizon the ~14.4 m real-time
    // frame error corresponds to moves when the predictor changes. If these ever coincide
    // the table has stopped saying anything.
    #[test]
    fn the_operational_predictor_moves_the_equivalent_horizon_away_from_persistence() {
        let v = longspan_report();
        let t5 = &v["table5_operational_vs_persistence"];
        let eh = &t5["equivalent_horizon_days"];
        // The target is the Table 1 real-time frame position, unchanged by G13.
        let target = eh["target_position_m"].as_f64().unwrap();
        assert!(
            (target
                - v["table1_consistency"][1]["frame_position_m"]
                    .as_f64()
                    .unwrap())
            .abs()
                < 1e-12
        );
        for q in ["ut1", "combined"] {
            let op = eh[q]["operational"].as_f64().expect("a bracketed crossing");
            let pers = eh[q]["persistence"].as_f64().expect("a bracketed crossing");
            assert!(
                op > pers,
                "{q}: the operational predictor must not reach {target} m sooner than \
                 persistence (op {op} d, persistence {pers} d)"
            );
            // Both crossings lie inside the measured horizon span, never beyond it.
            assert!((1.0..=10.0).contains(&op) && (1.0..=10.0).contains(&pers));
        }
        // At the 1-day lead the operational predictor is genuinely better here, and the
        // report carries the factor rather than leaving it to be divided out by hand.
        let day1 = t5["rows"]
            .as_array()
            .unwrap()
            .iter()
            .find(|r| r["horizon"] == "day-1")
            .expect("a 1-day row");
        assert!(day1["combined"]["improvement_factor"].as_f64().unwrap() > 1.5);
        // And where it is WORSE the table says so with a factor below 1, instead of
        // quietly reporting only the horizons that flatter it.
        let far = t5["rows"]
            .as_array()
            .unwrap()
            .iter()
            .find(|r| r["horizon"] == "day-10")
            .expect("a 10-day row");
        assert!(
            far["combined"]["improvement_factor"].as_f64().unwrap() < 1.0,
            "on this series the bare extrapolation is worse at 10 days and must say so"
        );
    }

    // The persistence column of Table 5 is NOT Table 2's: the two use different truth
    // rules over different epoch sets, and the report must not let them be confused.
    // Table 2 itself is untouched.
    #[test]
    fn table2_is_unchanged_and_table5_says_it_is_a_different_statistic() {
        let v = longspan_report();
        let body = std::fs::read_to_string(LONGSPAN_PATH).expect("fixture");
        let t2 = crate::frame_eop::prediction_error_vs_horizon(
            &body,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(3),
                Horizon::Days(5),
                Horizon::Days(10),
            ],
        );
        let rows = v["table2_error_vs_horizon"].as_array().unwrap();
        assert_eq!(rows.len(), t2.len());
        for (row, h) in rows.iter().zip(&t2) {
            assert!((row["ut1_rms_ms"].as_f64().unwrap() - h.rms_ms()).abs() < 1e-15);
            assert_eq!(row["n"].as_u64().unwrap() as usize, h.n);
        }
        let note = v["table5_operational_vs_persistence"]["relation_to_table2"]
            .as_str()
            .unwrap();
        assert!(note.contains("table2_error_vs_horizon") && note.contains("never across"));
        // They really do differ, which is why the note exists.
        let t5_day1 = v["table5_operational_vs_persistence"]["rows"]
            .as_array()
            .unwrap()
            .iter()
            .find(|r| r["horizon"] == "day-1")
            .unwrap()["n"]
            .as_u64()
            .unwrap();
        let t2_day1 = rows.iter().find(|r| r["horizon"] == "day-1").unwrap()["n"]
            .as_u64()
            .unwrap();
        assert_ne!(t5_day1, t2_day1);
    }

    // An input that cannot support the model says so, in words, rather than publishing an
    // empty array for a reader to interpret as "measured and zero".
    #[test]
    fn table5_states_its_own_emptiness_on_an_input_that_cannot_feed_it() {
        let v = run(RealtimeFrameEopScenario::default());
        let t5 = &v["table5_operational_vs_persistence"];
        assert_eq!(t5["status"], "insufficient-data");
        assert_eq!(t5["n_rows"], 0);
        assert_eq!(t5["rows"].as_array().unwrap().len(), 0);
        let s = t5["statement"].as_str().unwrap();
        assert!(s.contains("EMPTY") && s.contains("operational_window_days"));
        assert!(s.contains("no row is manufactured"));
        // No crossing is invented from an empty curve either.
        for q in ["ut1", "combined"] {
            assert!(t5["equivalent_horizon_days"][q]["operational"].is_null());
            assert!(t5["equivalent_horizon_days"][q]["persistence"].is_null());
        }
        // The model block still describes the predictor, and says why it did not fit.
        let m = &v["operational_predictor_model"];
        assert_eq!(
            m["representative_fit"]["ut1"]["status"],
            "no-complete-window"
        );
        assert_eq!(
            m["published_bulletin_a_agreement"]["status"],
            "no-published-prediction-rows"
        );
    }

    // The archived-vintage table is always present, and with one vintage it states that
    // the repository has no archived earlier vintage and that none is manufactured.
    #[test]
    fn table6_states_that_a_second_vintage_is_missing_and_is_not_invented() {
        for scn in [
            RealtimeFrameEopScenario::default(),
            RealtimeFrameEopScenario {
                eop_finals2000a: Some(REAL_2026_PATH.to_string()),
                ..Default::default()
            },
        ] {
            let v = run(scn);
            let t6 = &v["table6_archived_vintage_predicted_vs_final"];
            assert_eq!(t6["status"], "no-second-vintage");
            assert_eq!(t6["n_rows"], 0);
            assert!(t6["later_vintage_source"].is_null());
            let s = t6["statement"].as_str().unwrap();
            assert!(s.contains("two vintages") && s.contains("perturbing"));
            assert!(s.contains("eop_finals2000a_later"));
        }
    }

    // ORACLE: `frame_eop::archived_vintage_comparison` on a two-vintage pair built from
    // REAL rows — a later vintage, and the same file with its Bulletin B tail truncated so
    // the later rows read as prediction-only.
    //
    // This proves the emitted table is REACHABLE and is not permanently dead code. It is
    // not, and is not reported as, a measurement of a prediction error: the Bulletin A
    // column of a truncated later vintage holds the *rapid* value, not the value IERS
    // predicted at the earlier epoch, so the `archived_bulletin_a` residual it produces is
    // the rapid-minus-final publication floor. The repository ships no archived earlier
    // vintage, and no number here is quoted as a Bulletin A prediction error.
    #[test]
    fn table6_populates_from_a_two_vintage_pair_and_scores_all_three_predictors() {
        let later = include_str!("../tests/fixtures/agency/eop/finals2000A_2022001_longspan.txt");
        let as_issued = truncated_as_issued(later, 25);
        let v = two_vintage_report(25, "t6");
        let t6 = &v["table6_archived_vintage_predicted_vs_final"];
        assert_eq!(t6["status"], "measured", "{}", t6["statement"]);
        let rows = t6["rows"].as_array().unwrap();
        assert!(!rows.is_empty());
        assert_eq!(t6["n_rows"].as_u64().unwrap() as usize, rows.len());
        assert!(!t6["later_vintage_source"].is_null());
        let direct = crate::frame_eop::archived_vintage_comparison(
            &as_issued,
            later,
            &[
                Horizon::Final,
                Horizon::Days(1),
                Horizon::Days(2),
                Horizon::Days(5),
            ],
            &OperationalPredictorConfig::default(),
        );
        assert_eq!(rows.len(), direct.len());
        for (row, d) in rows.iter().zip(&direct) {
            assert_eq!(row["n"].as_u64().unwrap() as usize, d.n);
            assert!(d.n >= 1);
            assert!((row["issue_mjd"].as_f64().unwrap() - d.issue_mjd).abs() < 1e-9);
            // All three predictors are scored, for both quantities, over the same epochs.
            for q in ["ut1", "polar_motion"] {
                for who in ["archived_bulletin_a", "operational", "persistence"] {
                    let j = &row[q][who];
                    assert_eq!(j["n"].as_u64().unwrap() as usize, d.n, "{q}/{who}");
                    assert!(j["rms_native"].as_f64().unwrap() >= 0.0);
                    assert!(j["rms_position_m"].as_f64().unwrap() >= 0.0);
                }
            }
            assert!(
                (row["ut1"]["archived_bulletin_a"]["rms_native"]
                    .as_f64()
                    .unwrap()
                    - d.ut1_archived.rms_native)
                    .abs()
                    < 1e-15
            );
        }
    }

    // The three G13 scenario inputs are parsed and are actually in force — a knob that
    // parses but changes nothing is worse than no knob.
    #[test]
    fn the_operational_predictor_inputs_parse_and_take_effect() {
        let scn: RealtimeFrameEopScenario = toml::from_str(
            "kind=\"realtime-frame-eop\"\n\
             operational_window_days = 25.0\n\
             operational_min_cycle_fraction = 0.75\n\
             operational_anchor_residual = false\n",
        )
        .expect("the G13 fields must parse");
        assert_eq!(scn.operational_window_days, Some(25.0));
        assert_eq!(scn.operational_min_cycle_fraction, Some(0.75));
        assert_eq!(scn.operational_anchor_residual, Some(false));

        let base = longspan_report();
        let m = &base["operational_predictor_model"];
        assert_eq!(m["window_days"].as_f64().unwrap(), 15.0);
        assert_eq!(m["residual_anchored"], true);
        assert_eq!(m["min_cycle_fraction"].as_f64().unwrap(), 0.5);

        let tuned = run(RealtimeFrameEopScenario {
            eop_finals2000a: Some(LONGSPAN_PATH.to_string()),
            horizons_days: Some(vec![1, 2, 3, 5, 10]),
            operational_window_days: Some(25.0),
            operational_anchor_residual: Some(false),
            ..Default::default()
        });
        let tm = &tuned["operational_predictor_model"];
        assert_eq!(tm["window_days"].as_f64().unwrap(), 25.0);
        assert_eq!(tm["residual_anchored"], false);
        assert_eq!(
            tm["representative_fit"]["ut1"]["anchor_residual_native"],
            0.0
        );
        // A different window is a different fit and a different measured error.
        let rms = |v: &Value| {
            v["table5_operational_vs_persistence"]["rows"][0]["ut1"]["operational"]["rms_native"]
                .as_f64()
                .unwrap()
        };
        assert!((rms(&base) - rms(&tuned)).abs() > 1e-9);
        // A tighter admission threshold really does drop a term.
        let strict = run(RealtimeFrameEopScenario {
            eop_finals2000a: Some(LONGSPAN_PATH.to_string()),
            operational_min_cycle_fraction: Some(0.9),
            ..Default::default()
        });
        let admitted = |v: &Value| {
            v["operational_predictor_model"]["representative_fit"]["ut1"]["terms_admitted"]
                .as_array()
                .unwrap()
                .len()
        };
        assert!(admitted(&strict) < admitted(&base));
    }

    // The model block names the model, the window, the terms it admitted and the terms it
    // could not, and declares what it does NOT reproduce. A model class asserted in prose
    // with no admitted-term list is not checkable.
    #[test]
    fn the_model_block_reports_the_terms_it_admitted_and_the_ones_it_could_not() {
        let v = longspan_report();
        let m = &v["operational_predictor_model"];
        assert!(m["label"].as_str().unwrap().contains("VALIDATED real data"));
        assert!(m["label"].as_str().unwrap().contains("MODELLED"));
        assert!(m["model"].as_str().unwrap().contains("cos"));
        let dev = m["declared_deviations"].as_array().unwrap();
        assert!(dev.len() >= 3);
        let joined = dev
            .iter()
            .map(|d| d.as_str().unwrap())
            .collect::<Vec<_>>()
            .join(" ");
        assert!(joined.contains("autoregressive"), "{joined}");
        assert!(joined.contains("UT1R"), "{joined}");
        let ut1 = &m["representative_fit"]["ut1"];
        let admitted: Vec<&str> = ut1["terms_admitted"]
            .as_array()
            .unwrap()
            .iter()
            .map(|t| t.as_str().unwrap())
            .collect();
        assert_eq!(
            admitted,
            vec![
                "bias",
                "rate",
                "monthly-zonal-tide",
                "fortnightly-zonal-tide"
            ],
            "the 15-day default window over this real series"
        );
        // The long-period terms are reported as rejected, with the shortfall quantified.
        let rejected = ut1["terms_rejected"].as_array().unwrap();
        assert_eq!(rejected.len(), 2);
        for r in rejected {
            assert!(
                r["cycles_spanned"].as_f64().unwrap() < r["threshold_cycles"].as_f64().unwrap()
            );
            assert!(r["reason"].as_str().unwrap().contains("bias/rate"));
        }
        // The window really ends at or before the issue epoch.
        assert!(
            ut1["window_last_mjd"].as_f64().unwrap() <= ut1["issue_mjd"].as_f64().unwrap(),
            "the representative fit window runs past its own issue epoch"
        );
    }

    // ORACLE: the real published Bulletin A prediction rows of the 2026 extract, through
    // the scenario. The agreement block must reach the report and carry one row per
    // published prediction.
    #[test]
    fn the_report_carries_the_agreement_with_the_published_bulletin_a_predictions() {
        let v = run(RealtimeFrameEopScenario {
            eop_finals2000a: Some(REAL_2026_PATH.to_string()),
            ..Default::default()
        });
        let a = &v["operational_predictor_model"]["published_bulletin_a_agreement"];
        assert_eq!(a["status"], "measured");
        assert_eq!(a["n"], 12);
        assert_eq!(a["leads"].as_array().unwrap().len(), 12);
        assert!(a["statement"]
            .as_str()
            .unwrap()
            .contains("AGREEMENT statistic, not an error"));
        // It matches the same count the report already publishes for the prediction rows.
        assert_eq!(a["n"], v["eop_input"]["prediction_rows"]);
    }

    // ---- R3: every reported figure carries a unit and a provenance class ----

    /// Walk a report and collect the dotted path of every numeric field. An array whose
    /// elements are all numbers is one field (`epochs_mjd`), not one field per element;
    /// an array of objects descends into its first element as `name[]`.
    fn numeric_paths(v: &Value, prefix: &str, out: &mut std::collections::BTreeSet<String>) {
        match v {
            Value::Object(o) => {
                for (k, val) in o {
                    let path = if prefix.is_empty() {
                        k.clone()
                    } else {
                        format!("{prefix}.{k}")
                    };
                    match val {
                        Value::Number(_) => {
                            out.insert(path);
                        }
                        Value::Array(a) if a.iter().all(|e| e.is_number()) && !a.is_empty() => {
                            out.insert(path);
                        }
                        Value::Array(a) => {
                            if let Some(first) = a.first() {
                                numeric_paths(first, &format!("{path}[]"), out);
                            }
                        }
                        Value::Object(_) => numeric_paths(val, &path, out),
                        _ => {}
                    }
                }
            }
            _ => {
                if v.is_number() {
                    out.insert(prefix.to_string());
                }
            }
        }
    }

    /// Resolve a dotted units path against a report, yielding every value it names.
    /// `x[]` takes the first element of the array `x`; `*` takes every object-valued
    /// member of an object. Returns an empty vector when the path is not reachable in
    /// this particular report (an empty array, say), so a caller can require reachability
    /// in at least one of several reports.
    fn resolve(v: &Value, path: &str) -> Vec<Value> {
        let mut cur = vec![v.clone()];
        for seg in path.split('.') {
            let mut next = Vec::new();
            for c in &cur {
                if seg == "*" {
                    if let Some(o) = c.as_object() {
                        next.extend(o.values().filter(|x| x.is_object()).cloned());
                    }
                } else if let Some(name) = seg.strip_suffix("[]") {
                    if let Some(a) = c.get(name).and_then(|x| x.as_array()) {
                        if let Some(first) = a.first() {
                            next.push(first.clone());
                        }
                    }
                } else if let Some(x) = c.get(seg) {
                    next.push(x.clone());
                }
            }
            cur = next;
            if cur.is_empty() {
                return Vec::new();
            }
        }
        cur
    }

    /// Every path the units block declares, expanded over a report.
    fn declared(v: &Value) -> std::collections::BTreeSet<String> {
        let mut out = std::collections::BTreeSet::new();
        for key in v["units"].as_object().expect("a units block").keys() {
            if !key.contains('*') {
                out.insert(key.clone());
                continue;
            }
            // Expand `*` against the components actually present in this report.
            let (head, tail) = key.split_once(".*.").expect("a `*` segment");
            let parent = resolve(v, head);
            for p in &parent {
                if let Some(o) = p.as_object() {
                    for (name, val) in o {
                        if val.is_object() {
                            out.insert(format!("{head}.{name}.{tail}"));
                        }
                    }
                }
            }
        }
        out
    }

    // R3. Every numeric field the report publishes carries a unit and a provenance class.
    // Run over two reports — the bare default and the rich real-data configuration — so a
    // block that is empty in one is covered by the other.
    #[test]
    fn every_reported_figure_carries_a_unit_and_a_provenance_class() {
        for v in all_reports() {
            let units = v["units"].as_object().expect("a units block");
            assert!(!units.is_empty());
            for (field, meta) in units {
                assert!(meta["unit"].is_string(), "{field} has no unit");
                assert!(
                    meta["provenance"].is_string(),
                    "{field} has no provenance class"
                );
                assert!(
                    !meta["unit"].as_str().unwrap().is_empty(),
                    "{field} has a blank unit"
                );
            }
            let mut found = std::collections::BTreeSet::new();
            numeric_paths(&v, "", &mut found);
            let described = declared(&v);
            for path in &found {
                assert!(
                    described.contains(path),
                    "numeric field `{path}` is missing from the units block"
                );
            }
        }
    }

    // A units block that names a field nobody emits reads as a guarantee and documents a
    // ghost. Every declared path must resolve in at least one of the two reports.
    #[test]
    fn the_units_block_describes_only_fields_that_exist() {
        let reports = all_reports();
        let keys: Vec<String> = reports[0]["units"]
            .as_object()
            .unwrap()
            .keys()
            .cloned()
            .collect();
        for key in keys {
            let hits: Vec<Value> = reports.iter().flat_map(|v| resolve(v, &key)).collect();
            assert!(
                !hits.is_empty(),
                "the units block names a field no report emits: {key}"
            );
            // A declared field must be a number, a null (an explicitly nullable figure)
            // or an array of numbers (an epoch list) — never a string or an object.
            assert!(
                hits.iter().any(|h| h.is_number()
                    || h.is_null()
                    || h.as_array()
                        .is_some_and(|a| a.iter().all(|e| e.is_number()))),
                "the units block names a non-numeric field: {key}"
            );
        }
    }

    // The two reports must declare the same unit map — a units block that changed with the
    // input would be describing one run, not the document.
    #[test]
    fn the_units_block_is_the_same_for_every_run() {
        let reports = all_reports();
        for v in &reports[1..] {
            assert_eq!(reports[0]["units"], v["units"]);
        }
    }
}
