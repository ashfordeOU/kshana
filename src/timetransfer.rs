// SPDX-License-Identifier: AGPL-3.0-only
//! Time-and-frequency transfer: TWSTFT, GNSS common-view, PPP and free-space-optical
//! link transfer precision.
use crate::allan::overlapping_adev;
use crate::models::{ClockModel, ErrorModel};
use crate::types::{ModelSpec, Seconds};
use rand::{RngCore, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Speed of light (m/s), exact.
pub const C_M_PER_S: f64 = 299_792_458.0;

/// One-way ranging error (m) from a timing error (s): range = c * dt.
pub fn range_error_m(timing_s: f64) -> f64 {
    timing_s * C_M_PER_S
}

/// A two-way time-transfer link with white timing jitter (1-sigma per measurement, s).
#[derive(Clone, Debug)]
pub struct TimeTransferLink {
    pub id: String,
    pub provenance: String,
    pub sigma_j: f64,
}

impl TimeTransferLink {
    pub fn new(id: &str, provenance: &str, sigma_j: f64) -> Self {
        Self {
            id: id.into(),
            provenance: provenance.into(),
            sigma_j,
        }
    }
    pub fn sample(&self, rng: &mut dyn RngCore) -> f64 {
        if self.sigma_j <= 0.0 {
            return 0.0;
        }
        // The guard ensures positivity but not finiteness; `Normal::new` (rand_distr 0.4)
        // rejects only a non-finite std_dev, so coerce an `inf` sigma to a finite value.
        let sigma = if self.sigma_j.is_finite() {
            self.sigma_j
        } else {
            f64::MIN_POSITIVE
        };
        Normal::new(0.0, sigma)
            .expect("sigma is finite and strictly positive, which Normal::new always accepts")
            .sample(rng)
    }
    pub fn spec(&self) -> ModelSpec {
        ModelSpec {
            id: self.id.clone(),
            kind: "time-transfer".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({ "sigma_j_s": self.sigma_j }),
        }
    }
}

/// The two-way offset estimate from the two one-way measurements of a two-way
/// time-transfer exchange. Station A → B measures `m_AB = offset + common + j1`;
/// station B → A measures `m_BA = -offset + common + j2`, where `offset` is the
/// clock offset to recover, `common` is the **reciprocal** (shared) path delay,
/// and `j1, j2` are the per-direction measurement noises. The estimate is
///
/// ```text
/// (m_AB - m_BA) / 2 = offset + (j1 - j2) / 2
/// ```
///
/// so the reciprocal `common` delay (satellite transponder, bulk path) cancels
/// exactly — the defining property of two-way transfer — and two independent
/// white measurements average to `1/sqrt(2)` of a single one-way measurement.
pub fn two_way_offset_estimate(offset: f64, common: f64, j1: f64, j2: f64) -> f64 {
    let m_ab = offset + common + j1;
    let m_ba = -offset + common + j2;
    (m_ab - m_ba) / 2.0
}

/// A two-way time-transfer link with a realistic stochastic error model.
///
/// Reciprocal path delays cancel in the two-way estimate (see
/// [`two_way_offset_estimate`]); what limits a real link is (a) white measurement
/// jitter on the estimate and (b) the **non-reciprocal** differential delay —
/// equipment-delay asymmetry and up/down-path (e.g. ionospheric) variation
/// sampled at different instants — which does *not* cancel and is the dominant
/// long-term TWSTFT error floor. This models (b) as a colored white-FM +
/// random-walk-FM process (the validated [`ClockModel`]), so the synchronization
/// error series has a realistic Allan signature instead of flat white noise. With
/// `q_wf = q_rw = 0` it reduces exactly to the legacy white-jitter behaviour.
pub struct TwoWayLink {
    pub id: String,
    pub provenance: String,
    /// White jitter on the two-way estimate (s, 1-sigma per exchange).
    pub sigma_j: f64,
    /// Non-reciprocal differential-delay instability (white-FM + random-walk-FM).
    diff: ClockModel,
}

impl TwoWayLink {
    pub fn new(id: &str, provenance: &str, sigma_j: f64, q_wf: f64, q_rw: f64) -> Self {
        Self {
            id: id.into(),
            provenance: provenance.into(),
            sigma_j,
            diff: ClockModel::new(&format!("{id}-diff"), provenance, 0.0, q_wf, q_rw),
        }
    }

    /// Advance one two-way exchange of duration `dt` and return the residual
    /// synchronization error (s): the evolved non-reciprocal differential delay
    /// plus this exchange's white measurement residual.
    pub fn step(&mut self, dt: Seconds, rng: &mut dyn RngCore) -> f64 {
        if dt > 0.0 {
            self.diff.step(dt, rng);
        }
        let white = if self.sigma_j > 0.0 {
            // The guard ensures positivity but not finiteness; coerce an `inf` sigma to a
            // finite value so `Normal::new` (which rejects only non-finite std_dev) cannot
            // fail.
            let sigma = if self.sigma_j.is_finite() {
                self.sigma_j
            } else {
                f64::MIN_POSITIVE
            };
            Normal::new(0.0, sigma)
                .expect("sigma is finite and strictly positive, which Normal::new always accepts")
                .sample(rng)
        } else {
            0.0
        };
        self.diff.phase() + white
    }

    pub fn spec(&self) -> ModelSpec {
        ModelSpec {
            id: self.id.clone(),
            kind: "two-way-time-transfer".into(),
            provenance: self.provenance.clone(),
            params: serde_json::json!({
                "sigma_j_s": self.sigma_j,
                "q_wf": self.diff.q_wf,
                "q_rw": self.diff.q_rw,
            }),
        }
    }
}

/// One synchronization measurement: timing (sync) error in seconds at time t.
#[derive(Clone, Debug, Serialize)]
pub struct SyncSample {
    pub t: Seconds,
    pub sync_error_s: f64,
}

/// Time-transfer figures of merit.
#[derive(Clone, Debug, Serialize)]
pub struct LinkFoM {
    pub sync_rms_ps: f64,
    pub sync_p95_ps: f64,
    pub range_rms_mm: f64,
    pub range_p95_mm: f64,
    pub within_spec_fraction: f64,
    /// Overlapping Allan deviation of the sync-error series at the base averaging
    /// time (tau = the measurement step). 0 when the series is too short. This is
    /// the stochastic model's Allan signature surfaced as a reported quantity.
    pub adev_tau0: f64,
}

/// Score a sync-error series against a one-way ranging spec (mm).
pub fn score_link(samples: &[SyncSample], range_spec_mm: f64) -> LinkFoM {
    let n = samples.len().max(1) as f64;
    let sumsq: f64 = samples
        .iter()
        .map(|s| s.sync_error_s * s.sync_error_s)
        .sum();
    let sync_rms_s = (sumsq / n).sqrt();
    let mut abs: Vec<f64> = samples.iter().map(|s| s.sync_error_s.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let sync_p95_s = abs.get(idx).copied().unwrap_or(0.0);
    let within = samples
        .iter()
        .filter(|s| range_error_m(s.sync_error_s.abs()) * 1000.0 <= range_spec_mm)
        .count();
    LinkFoM {
        sync_rms_ps: sync_rms_s * 1e12,
        sync_p95_ps: sync_p95_s * 1e12,
        range_rms_mm: range_error_m(sync_rms_s) * 1000.0,
        range_p95_mm: range_error_m(sync_p95_s) * 1000.0,
        within_spec_fraction: within as f64 / n,
        adev_tau0: 0.0,
    }
}

/// Link configuration in a time-transfer scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct LinkCfg {
    pub id: String,
    pub provenance: String,
    pub sigma_j_s: f64,
    /// White-FM intensity of the non-reciprocal differential delay (default 0 ⇒
    /// pure white measurement jitter, the legacy model).
    #[serde(default)]
    pub q_wf_s: f64,
    /// Random-walk-FM intensity of the non-reciprocal differential delay
    /// (default 0). A non-zero value gives the link a realistic long-tau Allan
    /// floor (`sigma_y^2(tau) = q_rw * tau / 3`).
    #[serde(default)]
    pub q_rw_s: f64,
}

/// A time-transfer scenario: N synchronization measurements over an optical and an RF link.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct TimeTransferScenario {
    pub seed: u64,
    pub samples: usize,
    pub step_s: f64,
    pub range_spec_mm: f64,
    pub link_quantum: LinkCfg,
    pub link_classical: LinkCfg,
}

#[derive(Clone, Debug, Serialize)]
pub struct LinkRun {
    pub spec: ModelSpec,
    pub series: Vec<SyncSample>,
    pub fom: LinkFoM,
}

#[derive(Clone, Debug, Serialize)]
pub struct TimeTransferResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub range_spec_mm: f64,
    pub quantum: LinkRun,
    pub classical: LinkRun,
}

fn hash_tt(scn: &TimeTransferScenario) -> String {
    let c = serde_json::to_string(scn).unwrap_or_default();
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

fn run_link(scn: &TimeTransferScenario, cfg: &LinkCfg, seed: u64) -> LinkRun {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut link = TwoWayLink::new(
        &cfg.id,
        &cfg.provenance,
        cfg.sigma_j_s,
        cfg.q_wf_s,
        cfg.q_rw_s,
    );
    let mut series = Vec::with_capacity(scn.samples);
    for i in 0..scn.samples {
        let t = i as f64 * scn.step_s;
        let e = link.step(scn.step_s, &mut rng);
        series.push(SyncSample { t, sync_error_s: e });
    }
    let mut fom = score_link(&series, scn.range_spec_mm);
    // Surface the model's Allan signature at the base averaging time.
    if series.len() > 2 {
        let phase: Vec<f64> = series.iter().map(|s| s.sync_error_s).collect();
        fom.adev_tau0 = overlapping_adev(&phase, scn.step_s, 1);
    }
    LinkRun {
        spec: link.spec(),
        series,
        fom,
    }
}

/// Run a time-transfer scenario for the optical (quantum) and RF (classical) links.
pub fn run_timetransfer(scn: &TimeTransferScenario) -> TimeTransferResult {
    TimeTransferResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_tt(scn),
        seed: scn.seed,
        range_spec_mm: scn.range_spec_mm,
        quantum: run_link(scn, &scn.link_quantum, scn.seed),
        classical: run_link(
            scn,
            &scn.link_classical,
            scn.seed.wrapping_add(0x9e3779b97f4a7c15),
        ),
    }
}

/// Render the optical-vs-RF synchronization-error divergence as a standalone SVG.
pub fn to_svg(result: &TimeTransferResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (80.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let c = &result.classical.series;
    let q = &result.quantum.series;
    let t_max = c.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    // spec threshold expressed in ps
    let spec_ps = (result.range_spec_mm / 1000.0 / C_M_PER_S) * 1e12;
    let mut y_max = spec_ps * 1.3;
    for s in c.iter().chain(q.iter()) {
        y_max = y_max.max(s.sync_error_s.abs() * 1e12);
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |ps: f64| mt + ph - (ps.min(y_max) / y_max) * ph;
    let points = |series: &[SyncSample]| {
        series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.sync_error_s.abs() * 1e12)))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(spec_ps);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!("<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Time-transfer synchronization error (optical vs RF)</text>", ml));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "sync error (ps)",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!("<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>", ml + pw));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">spec {:.0} mm = {:.1} ps</text>",
        ml + 4.0,
        thr_y - 4.0,
        result.range_spec_mm,
        spec_ps
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        points(c)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\" points=\"{}\"/>",
        points(q)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">measurement time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#d2925e\">RF: {}</text>",
        ml + 10.0,
        result.classical.spec.id
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#e0bd84\">optical: {}</text>",
        ml + 10.0,
        result.quantum.spec.id
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn one_way_ranging_conversion() {
        // 1 ps one-way -> 0.299792458 mm.
        let mm = range_error_m(1e-12) * 1000.0;
        assert!((mm - 0.299792458).abs() < 1e-9, "mm={mm}");
    }

    #[test]
    fn sync_rms_matches_jitter() {
        let link = TimeTransferLink::new("opt", "unit", 1e-12);
        let mut rng = ChaCha8Rng::seed_from_u64(7);
        let series: Vec<SyncSample> = (0..10000)
            .map(|i| SyncSample {
                t: i as f64,
                sync_error_s: link.sample(&mut rng),
            })
            .collect();
        let f = score_link(&series, 10.0);
        // RMS of N(0, (1 ps)^2) -> ~1 ps.
        assert!(
            (f.sync_rms_ps - 1.0).abs() / 1.0 < 0.05,
            "rms={}",
            f.sync_rms_ps
        );
    }

    #[test]
    fn hand_derived_link_scores() {
        let s = |e_ps: f64| SyncSample {
            t: 0.0,
            sync_error_s: e_ps * 1e-12,
        };
        let series = vec![s(0.0), s(100.0), s(200.0)];
        let f = score_link(&series, 1000.0);
        // RMS of [0,100,200] ps = 129.0994 ps; range_rms_mm = 129.0994 * 0.299792458
        assert!(
            (f.sync_rms_ps - 129.0994).abs() < 1e-3,
            "sync_rms_ps={}",
            f.sync_rms_ps
        );
        assert_eq!(f.sync_p95_ps, 200.0);
        assert!(
            (f.range_rms_mm - 129.0994 * 0.299792458).abs() < 1e-3,
            "range_rms_mm={}",
            f.range_rms_mm
        );
    }

    #[test]
    fn white_noise_mean_averages_down() {
        // Std of the sample mean of N iid jitter samples ~ sigma/sqrt(N). Seed-averaged check.
        let sigma = 1e-12;
        let n = 400usize;
        let link = TimeTransferLink::new("opt", "unit", sigma);
        let seeds: Vec<u64> = (1..=64).collect();
        let mut sumsq_mean = 0.0;
        for &seed in &seeds {
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            let mean: f64 = (0..n).map(|_| link.sample(&mut rng)).sum::<f64>() / n as f64;
            sumsq_mean += mean * mean;
        }
        let sd_of_mean = (sumsq_mean / seeds.len() as f64).sqrt();
        let expected = sigma / (n as f64).sqrt();
        assert!(
            (sd_of_mean - expected).abs() / expected < 0.2,
            "sd={sd_of_mean} expected={expected}"
        );
    }

    #[test]
    fn two_way_cancels_the_reciprocal_common_mode_delay() {
        // The reciprocal delay cancels algebraically: the estimate is independent
        // of `common` and equals offset + (j1 - j2)/2. (To floating-point
        // precision — a path delay is ~0.25 s round-trip, not astronomical.)
        let (offset, j1, j2) = (3e-9, 2e-13, -1e-13); // 3 ns offset, sub-ps noise
        let e_geo = two_way_offset_estimate(offset, 0.25, j1, j2); // GEO ~0.25 s
        let e_leo = two_way_offset_estimate(offset, 0.013, j1, j2); // a closer link
        assert!(
            (e_geo - e_leo).abs() < 1e-15,
            "common-mode delay did not cancel: {e_geo} vs {e_leo}"
        );
        assert!((e_geo - (offset + (j1 - j2) / 2.0)).abs() < 1e-15);
    }

    #[test]
    fn two_way_white_noise_beats_one_way_by_sqrt_two() {
        // Two independent one-way measurements average to 1/sqrt(2) of one.
        use rand_distr::Normal;
        let sigma_ow = 1e-12;
        let nrm = Normal::new(0.0, sigma_ow).unwrap();
        let mut rng = ChaCha8Rng::seed_from_u64(42);
        let n = 200_000usize;
        let mut sumsq = 0.0;
        for _ in 0..n {
            let (j1, j2) = (nrm.sample(&mut rng), nrm.sample(&mut rng));
            let resid = two_way_offset_estimate(0.0, 1.0e-9, j1, j2); // common cancels
            sumsq += resid * resid;
        }
        let rms = (sumsq / n as f64).sqrt();
        let expected = sigma_ow / 2.0_f64.sqrt();
        assert!(
            (rms - expected).abs() / expected < 0.02,
            "two-way RMS {rms} vs expected {expected}"
        );
    }

    #[test]
    fn differential_random_walk_fm_follows_q_tau_over_3() {
        // A TwoWayLink driven only by random-walk FM (no white jitter) has the
        // textbook RWFM Allan signature sigma_y^2(tau) = q_rw * tau / 3, the same
        // relation validated for the clock model — here through the link's own
        // step(). Average the Allan variance over seeds to cut scatter.
        let q_rw = 1.0e-24;
        let m = 50usize;
        let tau = m as f64;
        let n = 20_000usize;
        let seeds = [1u64, 2, 3, 4, 5, 6, 7, 8];
        let mut var_sum = 0.0;
        for &seed in &seeds {
            let mut link = TwoWayLink::new("diff", "unit", 0.0, 0.0, q_rw);
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            let mut phase = vec![0.0];
            for _ in 1..n {
                phase.push(link.step(1.0, &mut rng));
            }
            let adev = overlapping_adev(&phase, 1.0, m);
            var_sum += adev * adev;
        }
        let adev_mean = (var_sum / seeds.len() as f64).sqrt();
        let expected = (q_rw * tau / 3.0).sqrt();
        assert!(
            (adev_mean - expected).abs() / expected < 0.2,
            "RWFM adev_mean={adev_mean} expected={expected}"
        );
    }

    #[test]
    fn white_only_two_way_reduces_to_the_legacy_jitter() {
        // With q_wf = q_rw = 0 the two-way link draws exactly the same white
        // sequence as the legacy stateless link (backward compatibility).
        let sigma = 1e-12;
        let mut twoway = TwoWayLink::new("w", "unit", sigma, 0.0, 0.0);
        let legacy = TimeTransferLink::new("w", "unit", sigma);
        let mut r1 = ChaCha8Rng::seed_from_u64(7);
        let mut r2 = ChaCha8Rng::seed_from_u64(7);
        for _ in 0..1000 {
            assert_eq!(twoway.step(1.0, &mut r1), legacy.sample(&mut r2));
        }
    }

    #[test]
    fn two_way_link_is_deterministic_in_seed() {
        let mk = || TwoWayLink::new("d", "unit", 5e-13, 1e-26, 1e-26);
        let series = |seed: u64| {
            let mut link = mk();
            let mut rng = ChaCha8Rng::seed_from_u64(seed);
            (0..500)
                .map(|_| link.step(1.0, &mut rng))
                .collect::<Vec<_>>()
        };
        assert_eq!(series(11), series(11));
    }

    #[test]
    fn colored_link_reports_a_nonzero_allan_signature_in_the_fom() {
        // End-to-end: a scenario whose links carry random-walk FM reports a
        // positive Allan deviation in the FoM (the model's signature is reachable).
        let scn = TimeTransferScenario {
            seed: 3,
            samples: 2000,
            step_s: 1.0,
            range_spec_mm: 100.0,
            link_quantum: LinkCfg {
                id: "optical".into(),
                provenance: "unit".into(),
                sigma_j_s: 1e-13,
                q_wf_s: 0.0,
                q_rw_s: 1e-26,
            },
            link_classical: LinkCfg {
                id: "rf".into(),
                provenance: "unit".into(),
                sigma_j_s: 1e-11,
                q_wf_s: 0.0,
                q_rw_s: 1e-24,
            },
        };
        let r = run_timetransfer(&scn);
        assert!(r.quantum.fom.adev_tau0 > 0.0);
        assert!(r.classical.fom.adev_tau0 > 0.0);
        // The noisier RF link has the larger short-tau Allan deviation.
        assert!(r.classical.fom.adev_tau0 > r.quantum.fom.adev_tau0);
    }
}
