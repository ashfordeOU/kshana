// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq frontend`: apply receiver front-end and interference-mitigation DSP to a
//! recording, and the shared front-end flags used by `acquire`/`track`.
//!
//! The command opens any recording [`open_recording`] opens, runs a chain of
//! [`crate::iq::frontend`] stages over it in order (band-pass FIR, adaptive notch, pulse
//! blanking, frequency-domain excision, AGC, quantiser) and writes a new raw recording with
//! a sidecar. [`FrontendParams`]/[`build_chain`] are shared with the Python binding and with
//! the `--bandpass`/`--notch`/`--blank`/`--excise`/`--agc`/`--bits` flags that `acquire` and
//! `track` apply to the samples before processing. The chain order is fixed: filtering and
//! excision first, then AGC, then the quantiser last (as in a real front end).

use super::{raw_sidecar, Args, Fail};
use crate::iq::frontend::agc::Agc;
use crate::iq::frontend::blank::PulseBlanker;
use crate::iq::frontend::fdaf::FreqExcision;
use crate::iq::frontend::fir::{self, Fir};
use crate::iq::frontend::notch::AdaptiveNotch;
use crate::iq::frontend::quant::Quantiser;
use crate::iq::frontend::{Chain, Stage};
use crate::iq::io::inventory::{open_recording, write_sidecar, RawSidecar};
use crate::iq::io::stream::create_raw;
use crate::iq::io::SampleFormat;
use crate::iq::{Cf64, IqSink};
use std::path::Path;

/// The front-end chain a command applies, collected from the CLI or Python surface.
#[derive(Clone, Debug)]
pub(crate) struct FrontendParams {
    /// Band-pass passband `(lo_hz, hi_hz)` relative to baseband; `None` disables it.
    pub(crate) bandpass: Option<(f64, f64)>,
    /// Band-pass transition width (Hz); defaults to half the passband width.
    pub(crate) bandpass_transition_hz: Option<f64>,
    /// Band-pass stopband attenuation (dB).
    pub(crate) bandpass_atten_db: f64,
    /// Enable the adaptive notch filter.
    pub(crate) notch: bool,
    /// Notch pole contraction `r ∈ (0, 1)`.
    pub(crate) notch_r: f64,
    /// Notch normalised LMS step `mu ∈ (0, 1)`.
    pub(crate) notch_mu: f64,
    /// Pulse-blanking magnitude threshold; `None` disables it.
    pub(crate) blank: Option<f64>,
    /// Pulse-blanking hold (samples).
    pub(crate) blank_hold: usize,
    /// Enable frequency-domain excision.
    pub(crate) excise: bool,
    /// Excision FFT length.
    pub(crate) excise_fft: usize,
    /// Excision false-alarm probability per bin.
    pub(crate) excise_pfa: f64,
    /// Enable AGC.
    pub(crate) agc: bool,
    /// AGC time constant (s).
    pub(crate) agc_tau_s: f64,
    /// Quantiser bits per component (1/2/3/8/14 are the usual front-end widths); `None`
    /// disables it.
    pub(crate) bits: Option<u32>,
    /// Quantiser step; `None` uses 1.0 (paired with an automatic AGC).
    pub(crate) quant_step: Option<f64>,
    /// Suppress the automatic AGC that otherwise precedes a quantiser.
    pub(crate) no_agc: bool,
}

impl Default for FrontendParams {
    fn default() -> Self {
        Self {
            bandpass: None,
            bandpass_transition_hz: None,
            bandpass_atten_db: 60.0,
            notch: false,
            notch_r: 0.95,
            notch_mu: 0.05,
            blank: None,
            blank_hold: 0,
            excise: false,
            excise_fft: 256,
            excise_pfa: 1e-3,
            agc: false,
            agc_tau_s: 1e-3,
            bits: None,
            quant_step: None,
            no_agc: false,
        }
    }
}

/// The value-less switches the front-end flags add.
pub(crate) const FRONTEND_SWITCHES: &[&str] = &["--notch", "--excise", "--agc", "--no-agc"];

impl FrontendParams {
    /// Parse the front-end flags out of already-parsed [`Args`].
    pub(crate) fn from_args(a: &Args) -> Result<Self, Fail> {
        let mut p = FrontendParams {
            notch: a.has("--notch"),
            excise: a.has("--excise"),
            agc: a.has("--agc"),
            no_agc: a.has("--no-agc"),
            blank: a.num("--blank").map_err(Fail::Usage)?,
            bits: a.num("--bits").map_err(Fail::Usage)?,
            quant_step: a.num("--quant-step").map_err(Fail::Usage)?,
            bandpass_transition_hz: a.num("--bandpass-transition").map_err(Fail::Usage)?,
            ..FrontendParams::default()
        };
        if let Some(v) = a.get("--bandpass") {
            let parts: Vec<f64> = v
                .split(',')
                .map(|s| s.trim().parse::<f64>())
                .collect::<Result<_, _>>()
                .map_err(|_| Fail::Usage(format!("--bandpass wants lo,hi (got {v:?})")))?;
            if parts.len() != 2 {
                return Err(Fail::Usage("--bandpass wants two values: lo,hi".into()));
            }
            p.bandpass = Some((parts[0], parts[1]));
        }
        if let Some(v) = a.num("--bandpass-atten").map_err(Fail::Usage)? {
            p.bandpass_atten_db = v;
        }
        if let Some(v) = a.num("--notch-r").map_err(Fail::Usage)? {
            p.notch_r = v;
        }
        if let Some(v) = a.num("--notch-mu").map_err(Fail::Usage)? {
            p.notch_mu = v;
        }
        if let Some(v) = a.num("--blank-hold").map_err(Fail::Usage)? {
            p.blank_hold = v;
        }
        if let Some(v) = a.num("--excise-fft").map_err(Fail::Usage)? {
            p.excise_fft = v;
        }
        if let Some(v) = a.num("--excise-pfa").map_err(Fail::Usage)? {
            p.excise_pfa = v;
        }
        if let Some(v) = a.num("--agc-tau").map_err(Fail::Usage)? {
            p.agc_tau_s = v;
        }
        Ok(p)
    }

    /// Whether any front-end stage is enabled.
    pub(crate) fn any(&self) -> bool {
        self.bandpass.is_some()
            || self.notch
            || self.blank.is_some()
            || self.excise
            || self.agc
            || self.bits.is_some()
    }
}

/// Build the front-end chain from `p` for a stream sampled at `fs_hz`. The order is
/// band-pass, notch, pulse blanking, frequency excision, AGC, quantiser. A quantiser is
/// preceded by an automatic AGC (targeting its loss-minimising input level) unless `--agc`
/// is explicit or `--no-agc` is given.
pub(crate) fn build_chain(p: &FrontendParams, fs_hz: f64) -> Result<Chain, String> {
    let mut chain = Chain::new();
    if let Some((lo, hi)) = p.bandpass {
        if lo >= hi {
            return Err("--bandpass needs lo < hi".to_string());
        }
        let half = 0.5 * (hi - lo);
        let transition = p.bandpass_transition_hz.unwrap_or(half);
        if half + transition >= fs_hz / 2.0 {
            return Err(format!(
                "--bandpass {lo},{hi} with transition {transition} Hz does not fit below fs/2 \
                 ({} Hz); narrow the band or the transition",
                fs_hz / 2.0
            ));
        }
        let design = fir::bandpass(fs_hz, lo, hi, transition, p.bandpass_atten_db);
        chain = chain.push(Fir::from_design(&design));
    }
    if p.notch {
        chain = chain.push(AdaptiveNotch::new(p.notch_r, p.notch_mu, Cf64::default()));
    }
    if let Some(threshold) = p.blank {
        chain = chain.push(PulseBlanker::new(threshold, p.blank_hold));
    }
    if p.excise {
        chain = chain.push(FreqExcision::new(p.excise_fft, p.excise_pfa));
    }
    // AGC before the quantiser. An explicit --agc without a quantiser targets unit power.
    if let Some(bits) = p.bits {
        if !(1..=16).contains(&bits) {
            return Err(format!("--bits must be 1..=16 (got {bits})"));
        }
        let quant = Quantiser::new(bits, p.quant_step.unwrap_or(1.0));
        let want_agc = p.agc || !p.no_agc;
        if want_agc {
            chain = chain.push(Agc::for_quantiser(&quant, fs_hz, p.agc_tau_s));
        }
        chain = chain.push(quant);
    } else if p.agc {
        chain = chain.push(Agc::new(fs_hz, p.agc_tau_s, 1.0, 1.0));
    }
    Ok(chain)
}

/// Apply the front-end chain `chain` to `samples` in place.
pub(crate) fn apply_chain(chain: &mut Chain, samples: &mut [Cf64]) {
    chain.process(samples);
}

/// Run `kshana iq frontend <in> <out> [flags]`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let switches: Vec<&str> = FRONTEND_SWITCHES.to_vec();
    let a = Args::parse(args, &switches).map_err(Fail::Usage)?;
    a.need_pos(2, "frontend")?;
    let input = Path::new(&a.pos[0]);
    let out = Path::new(&a.pos[1]);

    let opened = open_recording(input, raw_sidecar(&a)?)?;
    let spec = opened.source.spec();
    let params = FrontendParams::from_args(&a)?;
    if !params.any() {
        return Err(Fail::Usage(
            "iq frontend needs at least one stage (--bandpass/--notch/--blank/--excise/--agc/--bits)"
                .into(),
        ));
    }
    let mut chain = build_chain(&params, spec.fs_hz).map_err(Fail::Usage)?;

    let format = match a.get("--out-format") {
        Some(f) => SampleFormat::parse(f)?,
        None => SampleFormat::CF32_LE,
    };
    let mut src = opened.source;
    let mut sink = create_raw(out, format)?;
    let chunk = 1 << 16;
    let mut buf = vec![Cf64::default(); chunk];
    let mut total: u64 = 0;
    loop {
        let n = src.read(&mut buf)?;
        if n == 0 {
            break;
        }
        chain.process(&mut buf[..n]);
        sink.write(&buf[..n])?;
        total += n as u64;
    }
    sink.finish()?;

    let sidecar = RawSidecar {
        format: format.name(),
        sample_rate_hz: spec.fs_hz,
        center_hz: Some(spec.center_hz),
        if_hz: (spec.if_hz != 0.0).then_some(spec.if_hz),
        header_bytes: None,
        datetime: None,
        description: Some("written by kshana iq frontend".into()),
    };
    let sidecar_path = write_sidecar(out, &sidecar)?;
    Ok(format!(
        "filtered {} samples ({} Hz) to {} ({}); sidecar {}",
        total,
        spec.fs_hz,
        out.display(),
        format.name(),
        sidecar_path.display(),
    ))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::iq::simrng::SimRng;
    use rand::Rng;
    use rand_distr::StandardNormal;
    use std::f64::consts::TAU;

    fn mean_power(xs: &[Cf64]) -> f64 {
        xs.iter().map(|z| z.re * z.re + z.im * z.im).sum::<f64>() / xs.len() as f64
    }

    #[test]
    fn notch_chain_removes_a_narrowband_tone() {
        let fs = 1.0e6;
        let f0 = 1.5e5;
        let mut rng = SimRng::seed(1);
        let mut x: Vec<Cf64> = (0..40_000)
            .map(|n| {
                let ph = TAU * f0 * n as f64 / fs;
                let nr: f64 = rng.sample(StandardNormal);
                let ni: f64 = rng.sample(StandardNormal);
                Cf64::new(ph.cos() + 0.05 * nr, ph.sin() + 0.05 * ni)
            })
            .collect();
        let p = FrontendParams {
            notch: true,
            notch_r: 0.98,
            notch_mu: 0.05,
            ..FrontendParams::default()
        };
        let before = mean_power(&x[20_000..]);
        let mut chain = build_chain(&p, fs).unwrap();
        chain.process(&mut x);
        // After the notch has adapted, the second half is dominated by the residual, far
        // below the tone-plus-noise input power.
        let after = mean_power(&x[20_000..]);
        assert!(after < 0.2 * before, "after {after} vs before {before}");
    }

    #[test]
    fn quantiser_chain_limits_the_output_to_its_levels() {
        let fs = 2.0e6;
        let mut rng = SimRng::seed(3);
        let mut x: Vec<Cf64> = (0..8_000)
            .map(|_| {
                let r: f64 = rng.sample(StandardNormal);
                let i: f64 = rng.sample(StandardNormal);
                Cf64::new(r, i)
            })
            .collect();
        // Two bits, step 1, with the automatic AGC: output levels are ±0.5 and ±1.5.
        let p = FrontendParams {
            bits: Some(2),
            ..FrontendParams::default()
        };
        let mut chain = build_chain(&p, fs).unwrap();
        chain.process(&mut x);
        for z in &x {
            for c in [z.re, z.im] {
                let a = c.abs();
                assert!(
                    (a - 0.5).abs() < 1e-9 || (a - 1.5).abs() < 1e-9,
                    "level {c} not a 2-bit output"
                );
            }
        }
    }

    #[test]
    fn empty_params_build_an_empty_chain() {
        assert!(!FrontendParams::default().any());
        assert!(build_chain(&FrontendParams::default(), 1.0e6)
            .unwrap()
            .is_empty());
    }
}
