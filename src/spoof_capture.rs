// SPDX-License-Identifier: AGPL-3.0-only
//! **Tracking-loop pull-in spoof-capture model: does the spoofer actually capture the loop?**
//!
//! The active time-spoof demonstrator ([`crate::spoof`]) and the multi-channel spoof
//! detector ([`crate::spoof_detect`]) both take *capture* as a given: once the spoofer's
//! power advantage clears a small margin (the folkloric "≈3 dB and you own the loop"),
//! the receiver is assumed to be tracking the false signal. That is an **asserted**
//! threshold, not a computed one — and it is wrong in an important regime: a spoofer that
//! is 20 dB stronger but whose code replica lands more than a chip away from the true
//! signal *cannot* drag a locked delay-lock loop at all, because its correlation peak
//! never enters the loop's discriminator. Power is necessary but not sufficient; code
//! alignment (or an active slew) is what pulls a loop off.
//!
//! This module replaces the asserted threshold with a **computed pull-in result**. It
//! synthesises a composite intermediate-frequency stream — an authentic signal plus a
//! spoofer with its own code offset, carrier/Doppler offset, and power advantage, over a
//! seeded thermal-noise floor — drives it through the receiver's code (DLL) and carrier
//! (Costas PLL) tracking loops, and reports whether the loop's code/carrier state
//! converges to the **spoofer's** parameters (a pull-off / capture) or stays on the
//! authentic signal. It reuses the validated front end in [`crate::sdr`]: [`CaCode`]
//! Gold-code generation, [`synth_if`](crate::sdr::synth_if) for each signal's samples,
//! and [`correlate`](crate::sdr::correlate) — the exact Early/Prompt/Late primitive at
//! the heart of a channel. The loop closure here is instrumented to expose the loop's
//! internal code phase and carrier frequency (which [`crate::sdr::track`] hides inside
//! its return), and is proven identical to [`crate::sdr::track`] on a clean signal by
//! [`self::tests::traced_loop_reproduces_sdr_track`].
//!
//! ## Validated vs Modelled
//!
//! **Validated** — the *pull-in physics*. A standard early-late DLL can only be dragged
//! by an interfering replica whose code offset falls inside the discriminator's pull-in
//! region, about ±(1 chip + half the correlator spacing) for a coherent BPSK
//! correlation triangle; outside it the discriminator is null and no power advantage
//! captures the loop. The tests assert exactly this against the closed-form behaviour:
//! (a) an out-of-range offset never captures at any power, (b) an in-range offset with a
//! positive power advantage captures and the loop's code error tracks the spoofer, and
//! (c) monotonicity — the power advantage required to capture is non-decreasing as the
//! offset grows toward the pull-in edge (capture is easier the closer the spoofer sits
//! to the true code phase). Oracle: Kaplan & Hegarty, *Understanding GPS/GNSS* (3rd ed.),
//! ch. 8 (code tracking / DLL discriminators) and ch. 14 (interference & spoofing).
//!
//! **Modelled** — the specific [`capture_map`] over the (power-advantage × code-offset)
//! grid, and the numeric capture margins on it, are representative of *this* loop
//! configuration (narrow-correlator DLL, first-order Costas PLL, 1 ms coherent
//! integration) and are not claimed to reproduce any particular receiver or field trial.
//! No real raw-IF spoofing fixture (TEXBAT/OAKBAT) ships in-tree, so the oracle is the
//! closed-form pull-in behaviour above rather than a recorded capture.

use crate::sdr::{
    correlate, synth_if, Acquisition, CaCode, Cf64, CorrParams, CorrelatorDump, TrackConfig,
    CA_CHIP_RATE_HZ, CA_CODE_LEN,
};
use std::f64::consts::TAU;

/// Experiment setup shared by every capture run: the receiver front-end geometry and the
/// authentic signal the loop is initially locked to. The spoofer's power advantage, code
/// offset and carrier offset are the per-run knobs passed to [`run_capture`].
#[derive(Clone, Copy, Debug)]
pub struct CaptureConfig {
    /// PRN of both the authentic signal and the spoofer (a matched-code spoof).
    pub prn: u8,
    /// IQ sample rate (Hz).
    pub fs_hz: f64,
    /// Nominal intermediate frequency (Hz).
    pub if_hz: f64,
    /// Authentic carrier Doppler offset from the IF (Hz).
    pub auth_doppler_hz: f64,
    /// Authentic starting code phase (chips) — where the loop is initially locked.
    pub auth_code_phase_chips: f64,
    /// Number of 1 ms epochs to observe (the pull-in window).
    pub n_epochs: usize,
    /// DLL/PLL loop and correlator geometry.
    pub track: TrackConfig,
    /// Additive thermal-noise standard deviation on the composite IF (0 for a noiseless,
    /// purely deterministic pull-in experiment).
    pub noise_std: f64,
    /// Seed for the deterministic thermal noise (no wall-clock; reproducible).
    pub seed: u64,
    /// Code-error tolerance (chips) within which the loop is judged to have settled on a
    /// signal; also the capture decision radius around the spoofer.
    pub capture_tol_chips: f64,
    /// Fraction of the peak prompt magnitude the final prompt must retain to count as
    /// still locked (guards against a loop that merely lost lock rather than being pulled).
    pub lock_frac: f64,
}

impl Default for CaptureConfig {
    /// A 5 Msps L1 C/A channel initially locked to PRN 10 at 50 kHz IF + 800 Hz Doppler,
    /// observed for 150 ms with the default narrow-correlator loop and no thermal noise.
    fn default() -> Self {
        Self {
            prn: 10,
            fs_hz: 5_000_000.0,
            if_hz: 50_000.0,
            auth_doppler_hz: 800.0,
            auth_code_phase_chips: 123.0,
            n_epochs: 150,
            track: TrackConfig::default(),
            noise_std: 0.0,
            seed: 2024,
            capture_tol_chips: 0.35,
            lock_frac: 0.3,
        }
    }
}

/// The outcome of one pull-in experiment: whether the spoofer captured the loop, and the
/// loop's terminal code/carrier state relative to the authentic and spoofed truths.
#[derive(Clone, Copy, Debug)]
pub struct CaptureOutcome {
    /// The spoofer's power advantage over the authentic signal (dB) for this run.
    pub power_advantage_db: f64,
    /// The spoofer's code offset from the authentic code phase (chips) for this run.
    pub code_offset_chips: f64,
    /// The spoofer's carrier/Doppler offset from the authentic carrier (Hz) for this run.
    pub carrier_offset_hz: f64,
    /// `true` iff the loop was dragged onto the spoofer: it ended closer to the spoofer
    /// than to the authentic signal, within [`CaptureConfig::capture_tol_chips`] of the
    /// spoofer, while still locked.
    pub captured: bool,
    /// Terminal loop code error relative to the **authentic** code phase (chips): the
    /// distance the loop was dragged (≈0 if it held, ≈`code_offset_chips` if captured).
    pub final_code_err_chips: f64,
    /// Terminal loop code error relative to the **spoofer** code phase (chips): ≈0 iff
    /// the spoofer captured the loop.
    pub residual_to_spoofer_chips: f64,
    /// Terminal carrier-frequency error (Hz) relative to whichever signal the loop settled
    /// on (authentic if not captured, spoofer if captured).
    pub final_carrier_err_hz: f64,
    /// Time (s) at which the loop first settled — and stayed — within tolerance of its
    /// final signal. `NaN` if it never settled within tolerance.
    pub lock_time_s: f64,
    /// Final prompt magnitude as a fraction of the peak prompt over the run (lock health).
    pub prompt_lock_ratio: f64,
}

/// Signed code error in chips, wrapped into `(-N/2, N/2]` for a code of `N` chips.
#[inline]
fn signed_wrap_chips(dx: f64) -> f64 {
    let n = CA_CODE_LEN as f64;
    let m = dx.rem_euclid(n);
    if m > n / 2.0 {
        m - n
    } else {
        m
    }
}

/// The complete state trajectory of the instrumented tracking loop.
struct TrackTrace {
    /// Per-epoch correlator dumps (the wide SQM Early/Prompt/Late taps), identical to
    /// those [`crate::sdr::track`] emits for the same inputs.
    dumps: Vec<CorrelatorDump>,
    /// The code phase (chips) used to correlate each epoch — the loop's internal state.
    code_phase: Vec<f64>,
    /// The carrier frequency (Hz) used each epoch.
    carrier_freq: Vec<f64>,
    /// Samples per 1 ms epoch and the epoch duration (s).
    spe: usize,
    epoch_dur: f64,
}

/// Instrumented DLL+PLL tracking loop. This is [`crate::sdr::track`] with its internal
/// code-phase and carrier-frequency trajectory recorded so a capture decision can read
/// the loop's terminal state. The update laws (narrow early-late amplitude DLL, first-
/// order Costas `atan(Q/I)` PLL) mirror [`crate::sdr::track`] exactly and are proven
/// identical to it on a clean signal by the test suite; the correlation itself is the
/// reused [`crate::sdr::correlate`] primitive.
fn track_traced(
    iq: &[Cf64],
    code: &CaCode,
    acq: &Acquisition,
    fs_hz: f64,
    if_hz: f64,
    cfg: &TrackConfig,
    n_epochs: usize,
) -> TrackTrace {
    let spe = (fs_hz / 1000.0).round() as usize;
    let epoch_dur = if spe == 0 { 0.0 } else { spe as f64 / fs_hz };
    let mut code_phase = acq.code_phase_chips;
    let mut carrier_freq = if_hz + acq.doppler_hz;
    let mut carrier_phase = 0.0_f64;
    let mut dumps = Vec::with_capacity(n_epochs);
    let mut cp_hist = Vec::with_capacity(n_epochs);
    let mut cf_hist = Vec::with_capacity(n_epochs);

    if spe == 0 {
        return TrackTrace {
            dumps,
            code_phase: cp_hist,
            carrier_freq: cf_hist,
            spe,
            epoch_dur,
        };
    }

    for e in 0..n_epochs {
        let start = e * spe;
        let end = start + spe;
        if end > iq.len() {
            break;
        }
        cp_hist.push(code_phase);
        cf_hist.push(carrier_freq);
        let block = &iq[start..end];
        let base = CorrParams {
            fs_hz,
            carrier_freq_hz: carrier_freq,
            carrier_phase_rad: carrier_phase,
            code_rate_hz: CA_CHIP_RATE_HZ,
            code_phase_chips: code_phase,
            corr_spacing_chips: cfg.dll_spacing_chips,
        };
        let loop_corr = correlate(block, code, &base);
        let mon = correlate(
            block,
            code,
            &CorrParams {
                corr_spacing_chips: cfg.sqm_spacing_chips,
                ..base
            },
        );
        dumps.push(CorrelatorDump {
            epoch_s: e as f64 * epoch_dur,
            prn: code.prn,
            early: mon.early,
            prompt: mon.prompt,
            late: mon.late,
        });

        let (em, lm) = (loop_corr.early.abs(), loop_corr.late.abs());
        let dll = if em + lm > 0.0 {
            0.5 * (em - lm) / (em + lm)
        } else {
            0.0
        };
        let pll = if loop_corr.prompt.re != 0.0 {
            (loop_corr.prompt.im / loop_corr.prompt.re).atan()
        } else {
            0.0
        };
        let freq_err = pll / (TAU * epoch_dur);
        carrier_freq += cfg.pll_freq_gain * freq_err;

        code_phase += CA_CHIP_RATE_HZ * epoch_dur + cfg.dll_gain * dll;
        code_phase = code_phase.rem_euclid(CA_CODE_LEN as f64);
        carrier_phase += TAU * carrier_freq * epoch_dur + cfg.pll_phase_gain * pll;
        carrier_phase = carrier_phase.rem_euclid(TAU);
    }

    TrackTrace {
        dumps,
        code_phase: cp_hist,
        carrier_freq: cf_hist,
        spe,
        epoch_dur,
    }
}

/// Build the composite intermediate-frequency stream: the authentic signal (amplitude 1,
/// carrying the seeded thermal noise) plus a spoofer at the given power advantage, code
/// offset and carrier offset, summed sample-by-sample. Both signals share the PRN and
/// nominal chip rate; the spoofer differs only in code phase, carrier frequency, and
/// amplitude.
fn build_composite(
    cfg: &CaptureConfig,
    code: &CaCode,
    power_advantage_db: f64,
    code_offset_chips: f64,
    carrier_offset_hz: f64,
    n_samples: usize,
) -> Vec<Cf64> {
    let auth_carrier = cfg.if_hz + cfg.auth_doppler_hz;
    let authentic = synth_if(
        code,
        cfg.fs_hz,
        auth_carrier,
        CA_CHIP_RATE_HZ,
        cfg.auth_code_phase_chips,
        1.0,
        n_samples,
        cfg.noise_std,
        cfg.seed,
    );
    let spoof_amp = 10f64.powf(power_advantage_db / 20.0);
    let spoofer = synth_if(
        code,
        cfg.fs_hz,
        auth_carrier + carrier_offset_hz,
        CA_CHIP_RATE_HZ,
        cfg.auth_code_phase_chips + code_offset_chips,
        spoof_amp,
        n_samples,
        0.0,
        cfg.seed.wrapping_add(1),
    );
    authentic
        .iter()
        .zip(&spoofer)
        .map(|(a, s)| Cf64::new(a.re + s.re, a.im + s.im))
        .collect()
}

/// **Run one pull-in capture experiment.** Synthesise the authentic+spoofer composite IF
/// for a spoofer with `power_advantage_db` power advantage, `code_offset_chips` code
/// offset and `carrier_offset_hz` carrier offset, initialise the loop locked to the
/// authentic signal, drive it through the DLL+PLL, and decide whether the spoofer
/// captured the loop by where the loop's terminal code/carrier state settled.
///
/// Capture is declared when the loop ends closer to the spoofer's code phase than to the
/// authentic one, within [`CaptureConfig::capture_tol_chips`] of the spoofer, and still
/// locked (final prompt magnitude ≥ [`CaptureConfig::lock_frac`] of its peak).
pub fn run_capture(
    cfg: &CaptureConfig,
    power_advantage_db: f64,
    code_offset_chips: f64,
    carrier_offset_hz: f64,
) -> CaptureOutcome {
    let code = match CaCode::new(cfg.prn) {
        Some(c) => c,
        None => {
            return CaptureOutcome {
                power_advantage_db,
                code_offset_chips,
                carrier_offset_hz,
                captured: false,
                final_code_err_chips: f64::NAN,
                residual_to_spoofer_chips: f64::NAN,
                final_carrier_err_hz: f64::NAN,
                lock_time_s: f64::NAN,
                prompt_lock_ratio: 0.0,
            };
        }
    };
    let spe = (cfg.fs_hz / 1000.0).round() as usize;
    let n_samples = spe.saturating_mul(cfg.n_epochs);
    let iq = build_composite(
        cfg,
        &code,
        power_advantage_db,
        code_offset_chips,
        carrier_offset_hz,
        n_samples,
    );

    // The receiver is already tracking the authentic signal: seed the loop there.
    let acq = Acquisition {
        prn: cfg.prn,
        code_phase_chips: cfg.auth_code_phase_chips,
        doppler_hz: cfg.auth_doppler_hz,
        peak_ratio: f64::INFINITY,
        acquired: true,
    };
    let trace = track_traced(
        &iq,
        &code,
        &acq,
        cfg.fs_hz,
        cfg.if_hz,
        &cfg.track,
        cfg.n_epochs,
    );

    let n = trace.code_phase.len();
    if n == 0 {
        return CaptureOutcome {
            power_advantage_db,
            code_offset_chips,
            carrier_offset_hz,
            captured: false,
            final_code_err_chips: f64::NAN,
            residual_to_spoofer_chips: f64::NAN,
            final_carrier_err_hz: f64::NAN,
            lock_time_s: f64::NAN,
            prompt_lock_ratio: 0.0,
        };
    }

    // Per-epoch true code phases advance at the nominal chip rate for both signals.
    let true_phase = |e: usize, base_offset: f64| -> f64 {
        let t = (e * trace.spe) as f64 / cfg.fs_hz;
        cfg.auth_code_phase_chips + base_offset + CA_CHIP_RATE_HZ * t
    };

    let last = n - 1;
    let err_auth_last = signed_wrap_chips(trace.code_phase[last] - true_phase(last, 0.0));
    let err_spoof_last =
        signed_wrap_chips(trace.code_phase[last] - true_phase(last, code_offset_chips));

    // Lock health from the dumps' prompt magnitudes.
    let peak_prompt = trace
        .dumps
        .iter()
        .map(|d| d.prompt.abs())
        .fold(0.0_f64, f64::max);
    let final_prompt = trace.dumps[last].prompt.abs();
    let prompt_lock_ratio = if peak_prompt > 0.0 {
        final_prompt / peak_prompt
    } else {
        0.0
    };
    let locked = prompt_lock_ratio >= cfg.lock_frac;

    let captured = locked
        && err_spoof_last.abs() < err_auth_last.abs()
        && err_spoof_last.abs() < cfg.capture_tol_chips;

    // Carrier error relative to whichever signal the loop settled on.
    let settled_carrier =
        cfg.if_hz + cfg.auth_doppler_hz + if captured { carrier_offset_hz } else { 0.0 };
    let final_carrier_err_hz = trace.carrier_freq[last] - settled_carrier;

    // Lock time: the first epoch after which the loop stays within tolerance of its final
    // signal for the remainder of the run.
    let target_offset = if captured { code_offset_chips } else { 0.0 };
    let mut settle_epoch: Option<usize> = None;
    for e in (0..n).rev() {
        let err = signed_wrap_chips(trace.code_phase[e] - true_phase(e, target_offset));
        if err.abs() >= cfg.capture_tol_chips {
            settle_epoch = Some((e + 1).min(n - 1));
            break;
        }
        if e == 0 {
            settle_epoch = Some(0);
        }
    }
    let lock_time_s = match settle_epoch {
        Some(e)
            if e < n && {
                let err = signed_wrap_chips(trace.code_phase[e] - true_phase(e, target_offset));
                err.abs() < cfg.capture_tol_chips
            } =>
        {
            e as f64 * trace.epoch_dur
        }
        _ => f64::NAN,
    };

    CaptureOutcome {
        power_advantage_db,
        code_offset_chips,
        carrier_offset_hz,
        captured,
        final_code_err_chips: err_auth_last,
        residual_to_spoofer_chips: err_spoof_last,
        final_carrier_err_hz,
        lock_time_s,
        prompt_lock_ratio,
    }
}

/// A capture map: for each (power-advantage, code-offset) grid cell, the [`CaptureOutcome`].
/// `outcomes[i][j]` is the run at `powers_db[i]` and `offsets_chips[j]`.
#[derive(Clone, Debug)]
pub struct CaptureMap {
    /// Power-advantage axis (dB), spoofer minus authentic.
    pub powers_db: Vec<f64>,
    /// Code-offset axis (chips), spoofer minus authentic.
    pub offsets_chips: Vec<f64>,
    /// Row-major outcomes: `outcomes[power_index][offset_index]`.
    pub outcomes: Vec<Vec<CaptureOutcome>>,
}

impl CaptureMap {
    /// The smallest power advantage in [`Self::powers_db`] at which the offset in column
    /// `offset_index` is captured, or `None` if no grid power captures it. Assumes
    /// `powers_db` is sorted ascending.
    pub fn min_capture_power_db(&self, offset_index: usize) -> Option<f64> {
        for (i, &p) in self.powers_db.iter().enumerate() {
            if self.outcomes[i][offset_index].captured {
                return Some(p);
            }
        }
        None
    }
}

/// **Sweep** the (power-advantage × code-offset) grid at a fixed carrier offset, running
/// one [`run_capture`] per cell. This is the *Modelled* capture map: a representative
/// picture of which spoofer geometries take the loop for this receiver configuration.
pub fn capture_map(
    cfg: &CaptureConfig,
    powers_db: &[f64],
    offsets_chips: &[f64],
    carrier_offset_hz: f64,
) -> CaptureMap {
    let outcomes = powers_db
        .iter()
        .map(|&p| {
            offsets_chips
                .iter()
                .map(|&off| run_capture(cfg, p, off, carrier_offset_hz))
                .collect()
        })
        .collect();
    CaptureMap {
        powers_db: powers_db.to_vec(),
        offsets_chips: offsets_chips.to_vec(),
        outcomes,
    }
}

/// A capture **cube**: the full three-dimensional sweep the P1 acceptance calls for —
/// (power-advantage × code-offset × carrier-offset), with per-cell lock time as the
/// output. Where [`CaptureMap`] fixes the carrier offset to a scalar, this exposes it as a
/// genuine third axis so a spoofer's carrier/Doppler mismatch — not just its power and
/// code alignment — is part of the geometry being mapped. `outcomes[i][j][k]` is the run
/// at `powers_db[i]`, `offsets_chips[j]` and `carrier_offsets_hz[k]`.
///
/// ## Validated vs Modelled
///
/// **Validated** — the *reduction* and the *lock-time output*. Slicing the cube at
/// `carrier_offsets_hz = [0.0]` reproduces [`capture_map`] at carrier offset `0.0`
/// cell-for-cell (same `captured`, same `final_code_err_chips`), because each cell is the
/// very same [`run_capture`] call the 2-D map makes — the third axis is added, nothing is
/// perturbed. The "× lock time" dimension is the per-cell [`CaptureOutcome::lock_time_s`]
/// *output*, carried through unchanged; captured cells report a finite `lock_time_s >= 0`.
///
/// **Modelled** — the specific numeric capture margins across the carrier axis. The
/// physical mechanism is Validated (a spoofer's residual carrier rotates its correlation
/// phasor by `TAU·Δf·T` over the 1 ms coherent integration; at `Δf ≳ 1/T ≈ 1 kHz` the
/// spoofer's coherent gain hits its `sinc(π·Δf·T)` null and the DLL can no longer be
/// dragged, so a far-out carrier offset denies capture even at healthy power — Kaplan &
/// Hegarty ch. 8, and the Costas `atan(Q/I)` half-cycle pull-in edge at `Δf·T = 1/4`
/// ≈ 250 Hz), but the exact offset at which a given cell flips is representative of *this*
/// loop configuration, not a claim about any particular receiver.
#[derive(Clone, Debug)]
pub struct CaptureCube {
    /// Power-advantage axis (dB), spoofer minus authentic.
    pub powers_db: Vec<f64>,
    /// Code-offset axis (chips), spoofer minus authentic.
    pub offsets_chips: Vec<f64>,
    /// Carrier/Doppler-offset axis (Hz), spoofer minus authentic — the genuine third axis.
    pub carrier_offsets_hz: Vec<f64>,
    /// Outcomes indexed `outcomes[power_index][offset_index][carrier_index]`.
    pub outcomes: Vec<Vec<Vec<CaptureOutcome>>>,
}

impl CaptureCube {
    /// The smallest power advantage in [`Self::powers_db`] at which the (offset, carrier)
    /// column indexed by `offset_index` and `carrier_index` is captured, or `None` if no
    /// grid power captures it. Mirrors [`CaptureMap::min_capture_power_db`]; assumes
    /// `powers_db` is sorted ascending.
    pub fn min_capture_power_db(&self, offset_index: usize, carrier_index: usize) -> Option<f64> {
        for (i, &p) in self.powers_db.iter().enumerate() {
            if self.outcomes[i][offset_index][carrier_index].captured {
                return Some(p);
            }
        }
        None
    }
}

/// **Sweep** the full (power-advantage × code-offset × carrier-offset) cube, running one
/// [`run_capture`] per cell. This is the *Modelled* capture cube: the three-dimensional
/// picture of which spoofer geometries — power, code alignment *and* carrier/Doppler
/// mismatch — take the loop for this receiver configuration. Reuses [`run_capture`]
/// directly; the `carrier_offsets_hz = [0.0]` slice is an exact reduction to
/// [`capture_map`] at carrier offset `0.0` (see [`CaptureCube`]).
pub fn capture_cube(
    cfg: &CaptureConfig,
    powers_db: &[f64],
    offsets_chips: &[f64],
    carrier_offsets_hz: &[f64],
) -> CaptureCube {
    let outcomes = powers_db
        .iter()
        .map(|&p| {
            offsets_chips
                .iter()
                .map(|&off| {
                    carrier_offsets_hz
                        .iter()
                        .map(|&carrier| run_capture(cfg, p, off, carrier))
                        .collect()
                })
                .collect()
        })
        .collect();
    CaptureCube {
        powers_db: powers_db.to_vec(),
        offsets_chips: offsets_chips.to_vec(),
        carrier_offsets_hz: carrier_offsets_hz.to_vec(),
        outcomes,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::sdr::track;

    /// Cross-validation: the instrumented loop [`track_traced`] must reproduce
    /// [`crate::sdr::track`] bit-for-bit on a clean signal, proving the capture experiment
    /// really "runs track()" and only adds state instrumentation on top.
    #[test]
    fn traced_loop_reproduces_sdr_track() {
        let code = CaCode::new(10).unwrap();
        let fs = 5_000_000.0;
        let if_hz = 50_000.0;
        let doppler = 800.0;
        let n_epochs = 20;
        let n = (fs / 1000.0) as usize * n_epochs;
        let iq = synth_if(
            &code,
            fs,
            if_hz + doppler,
            CA_CHIP_RATE_HZ,
            123.0,
            1.0,
            n,
            0.0,
            7,
        );
        let acq = Acquisition {
            prn: 10,
            code_phase_chips: 123.0,
            doppler_hz: doppler,
            peak_ratio: f64::INFINITY,
            acquired: true,
        };
        let cfg = TrackConfig::default();
        let ref_dumps = track(&iq, &code, &acq, fs, if_hz, &cfg, n_epochs);
        let trace = track_traced(&iq, &code, &acq, fs, if_hz, &cfg, n_epochs);
        assert_eq!(ref_dumps.len(), trace.dumps.len());
        for (r, t) in ref_dumps.iter().zip(&trace.dumps) {
            assert_eq!(r.prompt.re, t.prompt.re);
            assert_eq!(r.prompt.im, t.prompt.im);
            assert_eq!(r.early.re, t.early.re);
            assert_eq!(r.late.im, t.late.im);
        }
    }

    /// ORACLE (Validated) — pull-in range, part (a): a spoofer whose code offset lies
    /// OUTSIDE the early-late discriminator's pull-in region (1.5 chips ≫ ~1.1-chip edge)
    /// cannot capture the loop at ANY power advantage. Kaplan & Hegarty ch. 8: the DLL
    /// discriminator is null when no interfering correlation peak reaches the correlators.
    #[test]
    fn out_of_range_offset_never_captures_regardless_of_power() {
        let cfg = CaptureConfig::default();
        for &power in &[0.0, 6.0, 12.0, 20.0, 30.0] {
            let out = run_capture(&cfg, power, 1.5, 0.0);
            assert!(
                !out.captured,
                "1.5-chip-offset spoofer at {power} dB must NOT capture (out of pull-in); \
                 err_auth={:.3} err_spoof={:.3}",
                out.final_code_err_chips, out.residual_to_spoofer_chips
            );
            // The loop never converges onto the spoofer: it stays far from the spoofer's
            // code phase (it may be mildly perturbed by the amplified off-peak code
            // residual at extreme power, but it is nowhere near captured).
            assert!(
                out.residual_to_spoofer_chips.abs() > 0.5,
                "loop must stay far from the out-of-range spoofer, residual={:.3}",
                out.residual_to_spoofer_chips
            );
        }
    }

    /// ORACLE (Validated) — pull-in range, part (b): a spoofer INSIDE the pull-in region
    /// (0.3 chip) with a clear power advantage (+6 dB) captures the loop, and the loop's
    /// terminal code error tracks the SPOOFER (residual-to-spoofer ≈ 0, drag ≈ offset).
    #[test]
    fn in_range_offset_with_power_captures_and_tracks_spoofer() {
        let cfg = CaptureConfig::default();
        let out = run_capture(&cfg, 6.0, 0.3, 0.0);
        assert!(
            out.captured,
            "0.3-chip spoofer at +6 dB should capture; err_auth={:.3} err_spoof={:.3} lock={:.2}",
            out.final_code_err_chips, out.residual_to_spoofer_chips, out.prompt_lock_ratio
        );
        assert!(
            out.residual_to_spoofer_chips.abs() < 0.1,
            "captured loop must sit on the spoofer, residual={:.3}",
            out.residual_to_spoofer_chips
        );
        assert!(
            (out.final_code_err_chips - 0.3).abs() < 0.1,
            "drag from authentic should ≈ offset 0.3, got {:.3}",
            out.final_code_err_chips
        );
        assert!(out.lock_time_s.is_finite() && out.lock_time_s >= 0.0);
    }

    /// ORACLE (Validated) — pull-in range: a spoofer INSIDE the region but with the
    /// authentic signal *stronger* (negative advantage) cannot move the equilibrium past
    /// the midpoint, so the loop holds and is not captured.
    #[test]
    fn in_range_offset_without_power_does_not_capture() {
        let cfg = CaptureConfig::default();
        let out = run_capture(&cfg, -6.0, 0.3, 0.0);
        assert!(
            !out.captured,
            "weaker spoofer (−6 dB) at 0.3 chip must not capture; err_spoof={:.3}",
            out.residual_to_spoofer_chips
        );
    }

    /// ORACLE (Validated) — part (c): monotonicity. The power advantage required to
    /// capture is non-decreasing as the code offset grows toward the pull-in edge, i.e.
    /// capture is easier the closer the spoofer sits to the true code phase (Kaplan &
    /// Hegarty ch. 8: the discriminator's pull toward an off-centre peak weakens as the
    /// peak nears the correlator's reach).
    #[test]
    fn required_power_is_monotonic_in_offset() {
        let cfg = CaptureConfig::default();
        let powers: Vec<f64> = vec![-6.0, -3.0, 0.0, 3.0, 6.0, 9.0, 12.0];
        let offsets: Vec<f64> = vec![0.15, 0.4, 0.7, 0.95];
        let map = capture_map(&cfg, &powers, &offsets, 0.0);
        let req: Vec<Option<f64>> = (0..offsets.len())
            .map(|j| map.min_capture_power_db(j))
            .collect();
        // Every in-range offset is capturable somewhere on the grid.
        for (j, r) in req.iter().enumerate() {
            assert!(
                r.is_some(),
                "offset {} should be capturable within the grid",
                offsets[j]
            );
        }
        // Non-decreasing required power as offset grows.
        for w in req.windows(2) {
            let (a, b) = (w[0].unwrap(), w[1].unwrap());
            assert!(
                b >= a,
                "required capture power must be non-decreasing in offset: {a} then {b}"
            );
        }
        // And strictly harder at the pull-in edge than close in (the physical effect).
        assert!(
            req.last().unwrap().unwrap() > req.first().unwrap().unwrap(),
            "near-edge offset must need strictly more power than a close-in offset"
        );
    }

    /// The capture map is well-formed and, at a healthy power advantage, shows the
    /// expected shape: captured close in, not captured beyond the pull-in edge.
    #[test]
    fn capture_map_shape_is_consistent() {
        let cfg = CaptureConfig::default();
        let powers = vec![10.0];
        let offsets = vec![0.2, 1.5];
        let map = capture_map(&cfg, &powers, &offsets, 0.0);
        assert_eq!(map.outcomes.len(), 1);
        assert_eq!(map.outcomes[0].len(), 2);
        assert!(map.outcomes[0][0].captured, "0.2 chip at +10 dB captures");
        assert!(
            !map.outcomes[0][1].captured,
            "1.5 chip at +10 dB does not capture"
        );
    }

    /// REDUCTION (Validated) — the third (carrier) axis is a genuine superset of the 2-D
    /// map: a cube whose `carrier_offsets_hz` is the single value `[0.0]` must reproduce
    /// [`capture_map`] at carrier offset `0.0` cell-for-cell. Same `captured` flag and same
    /// `final_code_err_chips` for every (power, offset) cell, proving [`capture_cube`] only
    /// adds a dimension and does not perturb the existing behaviour.
    #[test]
    fn cube_zero_carrier_slice_reduces_to_capture_map() {
        let cfg = CaptureConfig::default();
        let powers: Vec<f64> = vec![-6.0, 0.0, 6.0, 12.0];
        let offsets: Vec<f64> = vec![0.15, 0.4, 0.7, 1.5];
        let map = capture_map(&cfg, &powers, &offsets, 0.0);
        let cube = capture_cube(&cfg, &powers, &offsets, &[0.0]);
        assert_eq!(cube.carrier_offsets_hz, vec![0.0]);
        assert_eq!(cube.outcomes.len(), powers.len());
        for i in 0..powers.len() {
            assert_eq!(cube.outcomes[i].len(), offsets.len());
            for j in 0..offsets.len() {
                assert_eq!(cube.outcomes[i][j].len(), 1);
                let m = &map.outcomes[i][j];
                let c = &cube.outcomes[i][j][0];
                assert_eq!(
                    c.captured, m.captured,
                    "captured mismatch at power {} offset {}",
                    powers[i], offsets[j]
                );
                assert_eq!(
                    c.final_code_err_chips, m.final_code_err_chips,
                    "final_code_err mismatch at power {} offset {}",
                    powers[i], offsets[j]
                );
            }
        }
    }

    /// OUTPUT (Validated) — `lock_time_s` is a per-cell *output* of the cube's "× lock
    /// time" dimension, not an input axis. Every captured cell must report a finite
    /// `lock_time_s >= 0`, and that value is carried through into the cube unchanged from
    /// [`run_capture`].
    #[test]
    fn cube_reports_finite_lock_time_for_captured_cells() {
        let cfg = CaptureConfig::default();
        let powers: Vec<f64> = vec![6.0, 12.0];
        let offsets: Vec<f64> = vec![0.2, 0.4];
        let carriers: Vec<f64> = vec![0.0, 100.0];
        let cube = capture_cube(&cfg, &powers, &offsets, &carriers);
        let mut saw_capture = false;
        for i in 0..powers.len() {
            for j in 0..offsets.len() {
                for k in 0..carriers.len() {
                    let c = &cube.outcomes[i][j][k];
                    if c.captured {
                        saw_capture = true;
                        assert!(
                            c.lock_time_s.is_finite() && c.lock_time_s >= 0.0,
                            "captured cell must report finite lock_time_s >= 0, got {} \
                             at power {} offset {} carrier {}",
                            c.lock_time_s,
                            powers[i],
                            offsets[j],
                            carriers[k]
                        );
                        // The output equals what run_capture reports for the same cell.
                        let direct = run_capture(&cfg, powers[i], offsets[j], carriers[k]);
                        assert_eq!(c.lock_time_s, direct.lock_time_s);
                    }
                }
            }
        }
        assert!(
            saw_capture,
            "grid should contain at least one captured cell"
        );
    }

    /// CARRIER DOMAIN (Modelled magnitudes, Validated mechanism) — at a fixed in-range code
    /// offset (0.3 chip) and healthy power (+6 dB) that captures at zero carrier offset, a
    /// carrier offset far outside the loop's pull-in capability DENIES capture. The
    /// spoofer's residual carrier rotates its correlation phasor by `TAU·Δf·T` over the 1 ms
    /// coherent integration; at Δf ≳ 1/T ≈ 1 kHz this drives the spoofer's coherent
    /// correlation gain to its `sinc(π·Δf·T)` null, so the amplified spoofer contributes
    /// ≈zero net energy to the Early/Prompt/Late taps and the DLL cannot be dragged — the
    /// loop holds the authentic signal (Kaplan & Hegarty ch. 8, coherent-integration
    /// frequency response; the Costas `atan(Q/I)` half-cycle edge is Δf·T = 1/4 ≈ 250 Hz).
    /// The specific far-offset magnitudes are Modelled for this configuration; the
    /// denial-at-large-offset mechanism is the Validated part. The loop stays healthy
    /// (lock ratio high), so this is genuine capture-denial, not loss of lock.
    #[test]
    fn far_carrier_offset_denies_in_range_capture() {
        let cfg = CaptureConfig::default();
        // Baseline: zero carrier offset captures.
        let base = run_capture(&cfg, 6.0, 0.3, 0.0);
        assert!(
            base.captured,
            "baseline (0 Hz carrier, +6 dB, 0.3 chip) must capture; lock={:.3}",
            base.prompt_lock_ratio
        );
        // Sweep far-out carrier offsets through the cube; every one denies capture and the
        // loop stays on the authentic signal (residual-to-spoofer ≈ the full offset).
        let carriers: Vec<f64> = vec![1500.0, 2000.0, 3000.0, 4000.0];
        let cube = capture_cube(&cfg, &[6.0], &[0.3], &carriers);
        for (k, &c) in carriers.iter().enumerate() {
            let out = &cube.outcomes[0][0][k];
            assert!(
                !out.captured,
                "far carrier offset {c} Hz must deny capture; captured={} resid_spoof={:.3}",
                out.captured, out.residual_to_spoofer_chips
            );
            assert!(
                out.residual_to_spoofer_chips.abs() > 0.2,
                "loop must hold the authentic signal (stay far from spoofer) at {c} Hz, \
                 residual={:.3}",
                out.residual_to_spoofer_chips
            );
        }
    }

    /// DETERMINISM across the carrier axis — [`capture_cube`] is a pure function of its
    /// inputs: two cubes over the same grid are identical cell-for-cell on the key
    /// observables. Complements the noise-determinism test but exercises the new axis.
    #[test]
    fn cube_is_deterministic_across_carrier_axis() {
        let cfg = CaptureConfig::default();
        let powers: Vec<f64> = vec![3.0, 9.0];
        let offsets: Vec<f64> = vec![0.25, 0.6];
        let carriers: Vec<f64> = vec![0.0, 400.0, 900.0];
        let a = capture_cube(&cfg, &powers, &offsets, &carriers);
        let b = capture_cube(&cfg, &powers, &offsets, &carriers);
        for i in 0..powers.len() {
            for j in 0..offsets.len() {
                for k in 0..carriers.len() {
                    assert_eq!(a.outcomes[i][j][k].captured, b.outcomes[i][j][k].captured);
                    assert_eq!(
                        a.outcomes[i][j][k].final_code_err_chips,
                        b.outcomes[i][j][k].final_code_err_chips
                    );
                    assert_eq!(
                        a.outcomes[i][j][k].final_carrier_err_hz,
                        b.outcomes[i][j][k].final_carrier_err_hz
                    );
                }
            }
        }
    }

    /// The cube accessor mirrors [`CaptureMap::min_capture_power_db`]: at zero carrier
    /// offset the min-capture-power for a given offset must equal the 2-D map's value.
    #[test]
    fn cube_min_capture_power_matches_map_at_zero_carrier() {
        let cfg = CaptureConfig::default();
        let powers: Vec<f64> = vec![-6.0, -3.0, 0.0, 3.0, 6.0, 9.0, 12.0];
        let offsets: Vec<f64> = vec![0.15, 0.4, 0.7, 0.95];
        let map = capture_map(&cfg, &powers, &offsets, 0.0);
        let cube = capture_cube(&cfg, &powers, &offsets, &[0.0]);
        for j in 0..offsets.len() {
            assert_eq!(
                cube.min_capture_power_db(j, 0),
                map.min_capture_power_db(j),
                "cube accessor must match map at offset {}",
                offsets[j]
            );
        }
    }

    /// A run over a noisy composite stays deterministic (seeded) and still resolves a
    /// clear in-range capture, showing the model is not brittle to a thermal floor.
    #[test]
    fn deterministic_under_thermal_noise() {
        let cfg = CaptureConfig {
            noise_std: 0.05,
            ..CaptureConfig::default()
        };
        let a = run_capture(&cfg, 6.0, 0.3, 0.0);
        let b = run_capture(&cfg, 6.0, 0.3, 0.0);
        assert_eq!(a.captured, b.captured);
        assert_eq!(a.final_code_err_chips, b.final_code_err_chips);
        assert!(a.captured, "in-range +6 dB spoof still captures over noise");
    }
}
