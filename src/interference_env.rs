// SPDX-License-Identifier: AGPL-3.0-only
//! Interference environments for RNSS receivers, against published thresholds
//! (`kshana interference-env`).
//!
//! A model library, nothing that radiates. It describes an interference environment as a set of
//! sources, each a **CW** tone, a **wideband** noise-like emission with a bandwidth, or a
//! **pulsed** source group (DME/TACAN-like: peak power, pulse width, repetition rate), all as
//! received at the passive antenna output, and evaluates it two ways:
//!
//! 1. **Continuous interference against Recommendation ITU-R M.1903-1 (09/2019).** Table 1 of
//!    that Recommendation gives the relative interference power threshold as a function of the
//!    interference bandwidth for receivers using the L1 C/A signal (normalised to the 1 MHz
//!    tracking threshold), and Table 2 gives the absolute thresholds per receiver type. [`relative_threshold_db`]
//!    reproduces Table 1 at its breakpoints exactly. Between breakpoints the table says
//!    "linearly increasing": the interpolation is taken in dB against log10(bandwidth), which is the
//!    reading consistent with Table 1, note (1) (above 1 MHz a constant density must give
//!    10·log10(B/1 MHz), and 0 dB at 1 MHz to 13 dB at 20 MHz is that line within 0.011 dB). Figure 1
//!    of the Recommendation is a plot; its axis scale is to confirm against the printed figure.
//! 2. **Pulsed interference by Recommendation ITU-R M.2030-0 (12/2012).** The effective noise
//!    density with a pulse blanker (equations 1–4) or a saturating receiver (equation 5), and the
//!    degradation ratio of an added pulsed source group against a baseline (equations 6, 7, 7a, 8),
//!    with the baselines and allowable ratios of its Tables 1 and 2. The two worked examples of
//!    its Annex 2 are reproduced in `tests/interference_env.rs`.
//!
//! What is not here: the RTCA DO-235C and DO-292 environment masks and the DME/TACAN
//! "hot spot" pulse environments they define are not public and are not reproduced; a pulse is
//! described by its width and rate only, not its shape. Every result is MODELLED.

use serde::{Deserialize, Serialize};

/// The label every result carries.
pub const LABEL: &str = "MODELLED";

/// Where the thresholds come from.
pub const SOURCE_M1903: &str = "Recommendation ITU-R M.1903-1 (09/2019), Tables 1 and 2";
/// Where the pulsed method comes from.
pub const SOURCE_M2030: &str = "Recommendation ITU-R M.2030-0 (12/2012), Annex 1";

/// Table 1 of M.1903-1: (bandwidth Hz, relative level dB) breakpoints for L1 C/A receivers.
/// Flat at −10 dB up to 700 Hz and at 21 dB above 40 MHz.
pub const TABLE1_BREAKPOINTS: [(f64, f64); 7] = [
    (700.0, -10.0),
    (10e3, -3.0),
    (100e3, 0.0),
    (1e6, 0.0),
    (20e6, 13.0),
    (30e6, 19.4),
    (40e6, 21.0),
];

/// The relative continuous interference threshold (dB) for an interference bandwidth `bw_hz`
/// (M.1903-1 Table 1; interpolation in dB against log10 bandwidth between breakpoints).
pub fn relative_threshold_db(bw_hz: f64) -> f64 {
    let b = TABLE1_BREAKPOINTS;
    if bw_hz <= b[0].0 {
        return b[0].1;
    }
    for w in b.windows(2) {
        let ((x0, y0), (x1, y1)) = (w[0], w[1]);
        if bw_hz <= x1 {
            let t = (bw_hz.log10() - x0.log10()) / (x1.log10() - x0.log10());
            return y0 + t * (y1 - y0);
        }
    }
    b[b.len() - 1].1
}

/// A receiver type of M.1903-1 Table 2 whose thresholds are encoded here.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Receiver {
    /// Stable id.
    pub id: &'static str,
    /// The Table 2 column.
    pub column: u8,
    /// Narrow-band aggregate threshold, tracking, dBW.
    pub nb_track_dbw: f64,
    /// Narrow-band aggregate threshold, acquisition, dBW.
    pub nb_acq_dbw: f64,
    /// Wideband aggregate threshold, tracking, dB(W/MHz).
    pub wb_track_dbw_mhz: f64,
    /// Wideband aggregate threshold, acquisition, dB(W/MHz).
    pub wb_acq_dbw_mhz: f64,
    /// Receiver input saturation level, dBW (in 1 MHz for the Type 1 receivers).
    pub saturation_dbw: f64,
    /// Overload recovery time, s.
    pub recovery_s: f64,
    /// Whether Table 1's bandwidth curve applies (Table 2 notes 1–2: L1 C/A receivers).
    pub table1_applies: bool,
}

/// The receiver types encoded: the Table 2 columns whose values the Recommendation's own text
/// also states (columns 1, 3 and 7). Other columns are not encoded.
pub const RECEIVERS: [Receiver; 3] = [
    Receiver {
        id: "sbas-cat1-type1",
        column: 1,
        nb_track_dbw: -150.5,
        nb_acq_dbw: -156.5,
        wb_track_dbw_mhz: -140.5,
        wb_acq_dbw_mhz: -146.5,
        saturation_dbw: -135.0,
        recovery_s: 25.0e-6,
        table1_applies: true,
    },
    Receiver {
        id: "gbas-cat1-3-type1",
        column: 3,
        nb_track_dbw: -150.5,
        nb_acq_dbw: -156.5,
        wb_track_dbw_mhz: -140.5,
        wb_acq_dbw_mhz: -146.5,
        saturation_dbw: -135.0,
        recovery_s: 25.0e-6,
        table1_applies: true,
    },
    Receiver {
        id: "a-rnss",
        column: 7,
        nb_track_dbw: -156.9,
        nb_acq_dbw: -156.9,
        wb_track_dbw_mhz: -146.9,
        wb_acq_dbw_mhz: -146.9,
        saturation_dbw: f64::NAN,
        recovery_s: f64::NAN,
        table1_applies: false,
    },
];

/// The receiver with `id`.
pub fn receiver(id: &str) -> Option<&'static Receiver> {
    RECEIVERS.iter().find(|r| r.id == id)
}

/// Tracking or acquisition.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Mode {
    /// Signal tracking.
    Tracking,
    /// Signal acquisition.
    Acquisition,
}

/// The aggregate threshold (dBW, over the interference bandwidth) for interference of bandwidth
/// `bw_hz`. For a receiver where Table 1 applies, the 1 MHz tracking level (the wideband density
/// times 1 MHz) plus the Table 1 relative level, with acquisition `nb_acq − nb_track` lower; else
/// the narrow-band threshold below 700 Hz and the wideband density times the bandwidth above
/// 1 MHz, with bandwidths in between not specified (`None`).
pub fn threshold_dbw(r: &Receiver, mode: Mode, bw_hz: f64) -> Option<f64> {
    let (nb, wb) = match mode {
        Mode::Tracking => (r.nb_track_dbw, r.wb_track_dbw_mhz),
        Mode::Acquisition => (r.nb_acq_dbw, r.wb_acq_dbw_mhz),
    };
    if r.table1_applies {
        // Table 1 is normalised to the 1 MHz tracking level; the acquisition curve of the
        // Type 1 receivers is offset by the same amount as their Table 2 thresholds.
        let offset = nb - r.nb_track_dbw;
        let rel = relative_threshold_db(bw_hz.max(1.0));
        // Note (1): above 1 MHz the density must not exceed the wideband threshold.
        let density_cap = if bw_hz > 1e6 {
            wb + 10.0 * (bw_hz / 1e6).log10()
        } else {
            f64::INFINITY
        };
        return Some((r.wb_track_dbw_mhz + rel + offset).min(density_cap));
    }
    if bw_hz <= 700.0 {
        Some(nb)
    } else if bw_hz >= 1e6 {
        Some(wb + 10.0 * (bw_hz / 1e6).log10())
    } else {
        None
    }
}

/// One interference source, as received at the passive antenna output.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(tag = "kind", rename_all = "kebab-case", deny_unknown_fields)]
pub enum Source {
    /// A continuous-wave tone.
    Cw {
        /// A name.
        name: String,
        /// Received power, dBW.
        power_dbw: f64,
    },
    /// A noise-like continuous emission of constant density over its bandwidth.
    Wideband {
        /// A name.
        name: String,
        /// Received density, dB(W/MHz).
        density_dbw_mhz: f64,
        /// Bandwidth, Hz.
        bandwidth_hz: f64,
    },
    /// A pulsed source group (DME/TACAN-like).
    Pulsed {
        /// A name.
        name: String,
        /// Received peak power, dBW.
        peak_dbw: f64,
        /// Effective received pulse width, s.
        pulse_width_s: f64,
        /// Pulse repetition rate, Hz.
        prf_hz: f64,
    },
}

impl Source {
    fn name(&self) -> &str {
        match self {
            Source::Cw { name, .. }
            | Source::Wideband { name, .. }
            | Source::Pulsed { name, .. } => name,
        }
    }
}

/// An environment: the receiver, the mode and the sources.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Environment {
    /// A receiver id of [`RECEIVERS`].
    pub receiver: String,
    /// Tracking (default) or acquisition.
    #[serde(default = "tracking")]
    pub mode: Mode,
    /// Receiver system noise temperature, K (for the pulsed evaluation).
    #[serde(default)]
    pub noise_temperature_k: Option<f64>,
    /// Pre-correlation bandwidth, Hz (for the pulsed evaluation).
    #[serde(default)]
    pub precorrelation_bw_hz: Option<f64>,
    /// The receiver's pulse handling: `blanking` (N_LIM = 0) or `saturating` with `n_lim`.
    #[serde(default)]
    pub n_lim: Option<f64>,
    /// Blanker threshold, dBW (pulses at or above it are blanked); default the saturation level.
    #[serde(default)]
    pub blanker_threshold_dbw: Option<f64>,
    /// The sources.
    #[serde(rename = "source", default)]
    pub sources: Vec<Source>,
}

fn tracking() -> Mode {
    Mode::Tracking
}

/// One continuous source against its threshold.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ContinuousRow {
    /// The source name.
    pub name: String,
    /// Its bandwidth, Hz (CW: 0).
    pub bandwidth_hz: f64,
    /// Its received power over its bandwidth, dBW.
    pub power_dbw: f64,
    /// The threshold for its bandwidth, dBW (absent where the Recommendation does not specify one).
    pub threshold_dbw: Option<f64>,
    /// Threshold minus power, dB (positive: below the threshold).
    pub margin_db: Option<f64>,
}

/// The pulsed evaluation.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct PulsedResult {
    /// N_LIM (0: blanking).
    pub n_lim: f64,
    /// Aggregate duty cycle of pulses above the blanker or saturation level (eq. 3, 3a).
    pub pdc: f64,
    /// Below-threshold pulsed density ratio R_I (eq. 2, 4, 4a).
    pub r_i: f64,
    /// Continuous wideband density ratio I0,WB/N0 from the wideband sources.
    pub i0_wb_over_n0: f64,
    /// N0,EFF / N0 (eq. 1 or 5).
    pub n0_eff_over_n0: f64,
    /// The same in dB.
    pub n0_eff_over_n0_db: f64,
}

/// An evaluated environment.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Evaluation {
    /// Always [`LABEL`].
    pub label: String,
    /// The sources cited.
    pub sources: Vec<String>,
    /// The receiver.
    pub receiver: Receiver,
    /// The mode.
    pub mode: Mode,
    /// Each continuous source.
    pub continuous: Vec<ContinuousRow>,
    /// The sum of the continuous sources' fractions of their thresholds, dB (0 dB: at threshold;
    /// sources whose bandwidth has no threshold are left out).
    pub aggregate_fraction_db: Option<f64>,
    /// The pulsed evaluation, when the environment has pulsed sources and receiver noise.
    pub pulsed: Option<PulsedResult>,
}

/// Boltzmann's constant, J/K.
pub const BOLTZMANN: f64 = 1.380_649e-23;

fn lin(db: f64) -> f64 {
    10f64.powf(db / 10.0)
}

fn db(x: f64) -> f64 {
    10.0 * x.log10()
}

/// M.2030 equation (1): N0,EFF/N0 for a pulse-blanking receiver.
pub fn n0_eff_blanking(pdc_b: f64, i0_wb_over_n0: f64, r_i: f64) -> f64 {
    (1.0 + i0_wb_over_n0 + r_i) / (1.0 - pdc_b)
}

/// M.2030 equation (5): N0,EFF/N0 for a saturating receiver.
pub fn n0_eff_saturating(pdc_lim: f64, i0_wb_over_n0: f64, r_i: f64, n_lim: f64) -> f64 {
    (1.0 + i0_wb_over_n0 + r_i) * (1.0 + n_lim * n_lim * pdc_lim / (1.0 - pdc_lim))
        / (1.0 - pdc_lim)
}

/// M.2030 equation (3): the aggregate duty cycle of independent pulse groups.
pub fn aggregate_pdc(pdcs: &[f64]) -> f64 {
    1.0 - pdcs.iter().map(|p| 1.0 - p).product::<f64>()
}

/// M.2030 equation (3a): the duty cycle of one above-threshold source.
pub fn pdc_above(pulse_width_s: f64, recovery_s: f64, prf_hz: f64) -> f64 {
    (pulse_width_s + recovery_s) * prf_hz
}

/// A baseline of M.2030 Table 1 or 2.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Baseline {
    /// Stable id.
    pub id: &'static str,
    /// The band, MHz.
    pub band: &'static str,
    /// N_LIM.
    pub n_lim: f64,
    /// Baseline PDC.
    pub pdc: f64,
    /// Baseline R_I.
    pub r_i: f64,
    /// Baseline I0,WB/N0.
    pub i0_wb_over_n0: f64,
    /// Allowable degradation ratio for new pulsed sources, dB.
    pub allowable_db: f64,
    /// The overload recovery time the baseline assumes, s.
    pub recovery_s: f64,
}

/// M.2030-0 Table 1 (1 164–1 215 MHz) and Table 2 (1 215–1 300 MHz).
pub const BASELINES: [Baseline; 8] = [
    Baseline {
        id: "l5-air-nav-1-cdma",
        band: "1164-1215",
        n_lim: 0.0,
        pdc: 0.6527,
        r_i: 0.9628,
        i0_wb_over_n0: 1.0551,
        allowable_db: 0.1,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l5-air-nav-2-fdma",
        band: "1164-1215",
        n_lim: 1.0,
        pdc: 0.6527,
        r_i: 0.9628,
        i0_wb_over_n0: 0.455,
        allowable_db: 0.1,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l5-high-precision-cdma",
        band: "1164-1215",
        n_lim: 2.0,
        pdc: 0.0941,
        r_i: 0.0,
        i0_wb_over_n0: 0.5012,
        allowable_db: 0.2,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l5-high-precision-fdma",
        band: "1164-1215",
        n_lim: 2.0,
        pdc: 0.0941,
        r_i: 0.0,
        i0_wb_over_n0: 0.5012,
        allowable_db: 0.2,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l2-sbas-ground-reference",
        band: "1215-1300",
        n_lim: 1.0,
        pdc: 0.0793,
        r_i: 0.0,
        i0_wb_over_n0: 0.3925,
        allowable_db: 0.2,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l2-high-precision-semicodeless",
        band: "1215-1300",
        n_lim: 2.0,
        pdc: 0.0765,
        r_i: 0.0,
        i0_wb_over_n0: 0.3983,
        allowable_db: 0.2,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l2-air-nav-fdma-1us",
        band: "1215-1300",
        n_lim: 1.0,
        pdc: 0.1327,
        r_i: 0.0,
        i0_wb_over_n0: 0.455,
        allowable_db: 0.1,
        recovery_s: 1e-6,
    },
    Baseline {
        id: "l2-air-nav-fdma-30us",
        band: "1215-1300",
        n_lim: 1.0,
        pdc: 0.1723,
        r_i: 0.0,
        i0_wb_over_n0: 0.455,
        allowable_db: 0.1,
        recovery_s: 30e-6,
    },
];

/// The degradation ratio N0,EFF+Y / N0,EFF (algebraic) of adding a pulsed group with duty cycle
/// `pdc_y` and below-threshold ratio `r_y` to a baseline (M.2030 equations 6, 7 and 8; 7a is 7
/// with N_LIM = 1 and R = 0).
pub fn degradation_ratio(b: &Baseline, pdc_y: f64, r_y: f64) -> f64 {
    let cont = 1.0 + b.i0_wb_over_n0 + b.r_i;
    if b.n_lim == 0.0 {
        // Equation (6).
        return (1.0 / (1.0 - pdc_y)) * (1.0 + r_y / cont);
    }
    let n2 = b.n_lim * b.n_lim;
    if b.pdc == 0.0 && b.r_i == 0.0 {
        // Equation (8).
        return (1.0 / (1.0 - pdc_y))
            * (1.0 + r_y / (1.0 + b.i0_wb_over_n0))
            * (1.0 + n2 * pdc_y / (1.0 - pdc_y));
    }
    // Equation (7).
    (1.0 / (1.0 - pdc_y))
        * (1.0 + r_y / cont)
        * (1.0 + n2 * pdc_y / ((1.0 - pdc_y) * (1.0 + b.pdc * (n2 - 1.0))))
}

/// The baseline with `id`.
pub fn baseline(id: &str) -> Option<&'static Baseline> {
    BASELINES.iter().find(|b| b.id == id)
}

/// Evaluate an environment.
pub fn evaluate(env: &Environment) -> Result<Evaluation, String> {
    let r = receiver(&env.receiver).ok_or_else(|| {
        crate::terr!(
            "e-interference-env-unknown-receiver",
            id = env.receiver.clone()
        )
    })?;
    let mut continuous = Vec::new();
    let mut frac = 0.0;
    let mut any = false;
    let mut i0_wb_w_hz = 0.0;
    for s in &env.sources {
        let (bw, p) = match s {
            Source::Cw { power_dbw, .. } => (0.0, *power_dbw),
            Source::Wideband {
                density_dbw_mhz,
                bandwidth_hz,
                ..
            } => {
                if !(bandwidth_hz.is_finite() && *bandwidth_hz > 0.0) {
                    return Err(crate::terr!(
                        "e-interference-env-bad-source",
                        name = s.name().to_string()
                    ));
                }
                i0_wb_w_hz += lin(*density_dbw_mhz) / 1e6;
                (*bandwidth_hz, density_dbw_mhz + db(bandwidth_hz / 1e6))
            }
            Source::Pulsed { .. } => continue,
        };
        if !p.is_finite() {
            return Err(crate::terr!(
                "e-interference-env-bad-source",
                name = s.name().to_string()
            ));
        }
        let th = threshold_dbw(r, env.mode, bw);
        if let Some(t) = th {
            frac += lin(p - t);
            any = true;
        }
        continuous.push(ContinuousRow {
            name: s.name().to_string(),
            bandwidth_hz: bw,
            power_dbw: round3(p),
            threshold_dbw: th.map(round3),
            margin_db: th.map(|t| round3(t - p)),
        });
    }
    let pulsed = pulsed_eval(env, r, i0_wb_w_hz)?;
    Ok(Evaluation {
        label: LABEL.to_string(),
        sources: vec![SOURCE_M1903.to_string(), SOURCE_M2030.to_string()],
        receiver: *r,
        mode: env.mode,
        continuous,
        aggregate_fraction_db: any.then(|| round3(db(frac))),
        pulsed,
    })
}

fn round3(v: f64) -> f64 {
    (v * 1000.0).round() / 1000.0
}

fn pulsed_eval(
    env: &Environment,
    r: &Receiver,
    i0_wb_w_hz: f64,
) -> Result<Option<PulsedResult>, String> {
    let pulses: Vec<&Source> = env
        .sources
        .iter()
        .filter(|s| matches!(s, Source::Pulsed { .. }))
        .collect();
    if pulses.is_empty() {
        return Ok(None);
    }
    let (Some(t_k), Some(bw)) = (env.noise_temperature_k, env.precorrelation_bw_hz) else {
        return Err(crate::terr!("e-interference-env-pulsed-needs-receiver"));
    };
    let threshold = env.blanker_threshold_dbw.unwrap_or(r.saturation_dbw);
    let recovery = if r.recovery_s.is_finite() {
        r.recovery_s
    } else {
        0.0
    };
    if !(t_k > 0.0 && bw > 0.0 && threshold.is_finite()) {
        return Err(crate::terr!("e-interference-env-pulsed-needs-receiver"));
    }
    let n0 = BOLTZMANN * t_k;
    let mut above = Vec::new();
    let mut r_i = 0.0;
    for s in pulses {
        let Source::Pulsed {
            peak_dbw,
            pulse_width_s,
            prf_hz,
            ..
        } = s
        else {
            continue;
        };
        let ok = peak_dbw.is_finite()
            && *pulse_width_s > 0.0
            && *prf_hz > 0.0
            && pulse_width_s * prf_hz < 1.0;
        if !ok {
            return Err(crate::terr!(
                "e-interference-env-bad-source",
                name = s.name().to_string()
            ));
        }
        if *peak_dbw >= threshold {
            above.push(pdc_above(*pulse_width_s, recovery, *prf_hz).min(1.0));
        } else {
            // Equation (2) with (4a): dc = PW·PRF.
            r_i += lin(*peak_dbw) * pulse_width_s * prf_hz / (n0 * bw);
        }
    }
    let pdc = aggregate_pdc(&above);
    if pdc >= 1.0 {
        return Err(crate::terr!("e-interference-env-saturated"));
    }
    let i0 = i0_wb_w_hz / n0;
    let n_lim = env.n_lim.unwrap_or(0.0);
    let ratio = if n_lim == 0.0 {
        n0_eff_blanking(pdc, i0, r_i)
    } else {
        n0_eff_saturating(pdc, i0, r_i, n_lim)
    };
    Ok(Some(PulsedResult {
        n_lim,
        pdc: round6(pdc),
        r_i: round6(r_i),
        i0_wb_over_n0: round6(i0),
        n0_eff_over_n0: round6(ratio),
        n0_eff_over_n0_db: round3(db(ratio)),
    }))
}

fn round6(v: f64) -> f64 {
    (v * 1e6).round() / 1e6
}

/// The degradation result of an added pulsed source group.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Degradation {
    /// Always [`LABEL`].
    pub label: String,
    /// The source cited.
    pub source: String,
    /// The baseline.
    pub baseline: Baseline,
    /// The added group's above-threshold duty cycle (eq. 3a).
    pub pdc_y: f64,
    /// The added group's below-threshold ratio R_Y.
    pub r_y: f64,
    /// N0,EFF+Y / N0,EFF.
    pub ratio: f64,
    /// The same in dB.
    pub ratio_db: f64,
    /// Whether it is within the allowable ratio.
    pub within_allowable: bool,
}

/// The degradation of adding a pulsed group (width, rate, below-threshold ratio) to a baseline;
/// the recovery time is the baseline's unless given.
pub fn degradation(
    b: &Baseline,
    pulse_width_s: f64,
    prf_hz: f64,
    r_y: f64,
    recovery_s: Option<f64>,
) -> Result<Degradation, String> {
    let rec = recovery_s.unwrap_or(b.recovery_s);
    let ok = pulse_width_s > 0.0 && prf_hz > 0.0 && r_y >= 0.0 && rec >= 0.0 && r_y.is_finite();
    let pdc_y = pdc_above(pulse_width_s, rec, prf_hz);
    if !ok || pdc_y.is_nan() || pdc_y >= 1.0 {
        return Err(crate::terr!("e-interference-env-saturated"));
    }
    let ratio = degradation_ratio(b, pdc_y, r_y);
    let ratio_db = db(ratio);
    Ok(Degradation {
        label: LABEL.to_string(),
        source: SOURCE_M2030.to_string(),
        baseline: *b,
        pdc_y: round6(pdc_y),
        r_y,
        ratio: round6(ratio),
        ratio_db: round3(ratio_db),
        within_allowable: ratio_db <= b.allowable_db,
    })
}

fn flag(args: &[String], name: &str) -> Result<Option<String>, String> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args.get(i + 1).cloned().map(Some).ok_or_else(|| {
            crate::terr!(
                "e-interference-env-missing-value",
                option = name.to_string()
            )
        }),
    }
}

fn num(args: &[String], name: &str) -> Result<Option<f64>, String> {
    match flag(args, name)? {
        None => Ok(None),
        Some(v) => v.parse::<f64>().map(Some).map_err(|_| {
            crate::terr!(
                "e-interference-env-bad-number",
                option = name.to_string(),
                value = v
            )
        }),
    }
}

fn positional(args: &[String], valued: &[&str], switches: &[&str]) -> Result<Vec<String>, String> {
    let mut pos = Vec::new();
    let mut i = 0;
    while i < args.len() {
        let a = &args[i];
        if valued.contains(&a.as_str()) {
            i += 2;
            continue;
        }
        if !switches.contains(&a.as_str()) {
            if a.starts_with("--") {
                return Err(crate::terr!(
                    "e-interference-env-unknown-option",
                    option = a.clone()
                ));
            }
            pos.push(a.clone());
        }
        i += 1;
    }
    Ok(pos)
}

fn print_json<T: Serialize>(v: &T) -> Result<(), String> {
    println!(
        "{}",
        serde_json::to_string_pretty(v).map_err(|e| e.to_string())?
    );
    Ok(())
}

/// `kshana interference-env <evaluate|thresholds|degradation> ...`. Every output is JSON.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("interference-env-usage");
    let Some((cmd, rest)) = args.split_first() else {
        return Err(usage());
    };
    match cmd.as_str() {
        "evaluate" => {
            let pos = positional(rest, &[], &[])?;
            let [path] = pos.as_slice() else {
                return Err(usage());
            };
            let text = std::fs::read_to_string(path).map_err(|e| {
                crate::terr!(
                    "e-interference-env-cannot-read",
                    path = path.clone(),
                    e = e.to_string()
                )
            })?;
            let env: Environment = toml::from_str(&text).map_err(|e| {
                crate::terr!(
                    "e-interference-env-bad-file",
                    path = path.clone(),
                    e = e.to_string()
                )
            })?;
            print_json(&evaluate(&env)?)
        }
        "thresholds" => {
            positional(rest, &["--receiver"], &[])?;
            let rs: Vec<&Receiver> = match flag(rest, "--receiver")? {
                Some(id) => vec![receiver(&id).ok_or_else(|| {
                    crate::terr!("e-interference-env-unknown-receiver", id = id.clone())
                })?],
                None => RECEIVERS.iter().collect(),
            };
            let bws = [
                100.0, 700.0, 1e3, 10e3, 100e3, 1e6, 2e6, 10e6, 20e6, 30e6, 40e6,
            ];
            let curve: Vec<serde_json::Value> = bws
                .iter()
                .map(|&b| serde_json::json!({"bandwidth_hz": b, "relative_db": round3(relative_threshold_db(b))}))
                .collect();
            let per: Vec<serde_json::Value> = rs
                .iter()
                .map(|r| {
                    let at = |m: Mode| -> Vec<serde_json::Value> {
                        bws.iter()
                            .map(|&b| serde_json::json!({"bandwidth_hz": b, "threshold_dbw": threshold_dbw(r, m, b).map(round3)}))
                            .collect()
                    };
                    serde_json::json!({"receiver": r, "tracking": at(Mode::Tracking), "acquisition": at(Mode::Acquisition)})
                })
                .collect();
            print_json(&serde_json::json!({
                "label": LABEL,
                "source": SOURCE_M1903,
                "relative_curve": curve,
                "receivers": per,
            }))
        }
        "degradation" => {
            positional(
                rest,
                &[
                    "--baseline",
                    "--pulse-width",
                    "--prf",
                    "--below-ratio",
                    "--recovery",
                ],
                &[],
            )?;
            let (Some(id), Some(pw), Some(prf)) = (
                flag(rest, "--baseline")?,
                num(rest, "--pulse-width")?,
                num(rest, "--prf")?,
            ) else {
                return Err(usage());
            };
            let b = baseline(&id).ok_or_else(|| {
                crate::terr!("e-interference-env-unknown-baseline", id = id.clone())
            })?;
            let r_y = num(rest, "--below-ratio")?.unwrap_or(0.0);
            print_json(&degradation(b, pw, prf, r_y, num(rest, "--recovery")?)?)
        }
        _ => Err(usage()),
    }
}
