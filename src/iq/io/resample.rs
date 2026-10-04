// SPDX-License-Identifier: AGPL-3.0-only
//! Decimation, rational resampling and real-IF to complex-baseband conversion.
//!
//! [`PolyphaseResampler`] changes the sample rate by `up/down` with a Kaiser-windowed
//! sinc low-pass split into `up` polyphase branches, so each output costs one branch of
//! multiply-adds and no zero-stuffed samples are ever formed. It keeps the last
//! `taps_per_phase − 1` inputs as state, so a stream processed in chunks of any size gives
//! bit-identical output to the same stream processed in one call. Decimation by `d` is the
//! `1/d` case.
//!
//! The low-pass is designed from Kaiser's empirical formulas (J. F. Kaiser, "Nonrecursive
//! digital filter design using the I₀-sinh window function", Proc. IEEE ISCAS 1974):
//! `β = 0.1102·(A − 8.7)` for a stop-band attenuation `A > 50 dB`, and length
//! `N ≈ (A − 7.95)/(14.36·Δf) + 1` for a transition width `Δf` in cycles per sample. The
//! pass band ends at `passband_frac` of the lower of the input and output Nyquist
//! frequencies and the stop band starts at that Nyquist frequency, so nothing above it can
//! alias into the pass band. The response is checked by tone tests (MODELLED filter,
//! verified against the closed-form behaviour of a sinusoid through a linear filter).

use crate::iq::{Cf64, IqError, IqSource, SampleSpec};

/// Low-pass design targets for [`PolyphaseResampler`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct FilterDesign {
    /// Pass-band edge as a fraction (0..1) of the lower Nyquist frequency.
    pub passband_frac: f64,
    /// Stop-band attenuation (dB).
    pub stopband_atten_db: f64,
}

impl Default for FilterDesign {
    /// Pass band to 80 % of Nyquist, 80 dB stop band.
    fn default() -> Self {
        FilterDesign {
            passband_frac: 0.8,
            stopband_atten_db: 80.0,
        }
    }
}

/// Kaiser window shape parameter for stop-band attenuation `atten_db` (Kaiser 1974).
pub fn kaiser_beta(atten_db: f64) -> f64 {
    if atten_db > 50.0 {
        0.1102 * (atten_db - 8.7)
    } else if atten_db >= 21.0 {
        0.5842 * (atten_db - 21.0).powf(0.4) + 0.07886 * (atten_db - 21.0)
    } else {
        0.0
    }
}

/// Kaiser's estimate of the filter length for attenuation `atten_db` and transition width
/// `transition` (cycles per sample).
pub fn kaiser_num_taps(atten_db: f64, transition: f64) -> usize {
    ((atten_db - 7.95) / (14.36 * transition)).ceil().max(1.0) as usize + 1
}

/// A Kaiser-windowed sinc low-pass with `n` taps, cut-off `cutoff` (cycles per sample,
/// 0..0.5) and window parameter `beta`, normalised to unit DC gain.
pub fn kaiser_lowpass(n: usize, cutoff: f64, beta: f64) -> Vec<f64> {
    use crate::tracking_loop::bessel_i0;
    let m = (n as f64 - 1.0) / 2.0;
    let i0b = bessel_i0(beta);
    let mut h: Vec<f64> = (0..n)
        .map(|k| {
            let t = k as f64 - m;
            let sinc = if t == 0.0 {
                2.0 * cutoff
            } else {
                (2.0 * std::f64::consts::PI * cutoff * t).sin() / (std::f64::consts::PI * t)
            };
            let r = if m > 0.0 { t / m } else { 0.0 };
            let w = bessel_i0(beta * (1.0 - r * r).max(0.0).sqrt()) / i0b;
            sinc * w
        })
        .collect();
    let sum: f64 = h.iter().sum();
    h.iter_mut().for_each(|v| *v /= sum);
    h
}

fn gcd(a: usize, b: usize) -> usize {
    if b == 0 {
        a
    } else {
        gcd(b, a % b)
    }
}

/// A streaming rational resampler by `up/down` (see the module documentation).
#[derive(Clone, Debug)]
pub struct PolyphaseResampler {
    up: usize,
    down: usize,
    n_taps: usize,
    /// `phases[p][j] = up · h[p + j·up]`.
    phases: Vec<Vec<f64>>,
    hist: Vec<Cf64>,
    /// Index, in the virtual array `hist ++ input`, of the newest input of the next output.
    pos: usize,
    phase: usize,
}

impl PolyphaseResampler {
    /// A resampler by `up/down` (reduced to lowest terms) with the default design.
    pub fn new(up: usize, down: usize) -> Result<Self, IqError> {
        Self::with_design(up, down, FilterDesign::default())
    }

    /// A decimator by `d` (keeps one output per `d` inputs after low-pass filtering).
    pub fn decimator(d: usize) -> Result<Self, IqError> {
        Self::new(1, d)
    }

    /// A resampler by `up/down` with a stated low-pass design.
    pub fn with_design(up: usize, down: usize, design: FilterDesign) -> Result<Self, IqError> {
        if up == 0 || down == 0 {
            return Err(IqError::Format(
                "resampling factors must be positive".into(),
            ));
        }
        let ok = design.passband_frac > 0.0
            && design.passband_frac < 1.0
            && design.stopband_atten_db > 0.0;
        if !ok {
            return Err(IqError::Format(format!(
                "invalid filter design {design:?}: passband_frac in (0, 1), attenuation > 0"
            )));
        }
        let g = gcd(up, down);
        let (up, down) = (up / g, down / g);
        // Frequencies in cycles per sample at the upsampled rate up·fs_in.
        let f_stop = 0.5 / up.max(down) as f64;
        let f_pass = design.passband_frac * f_stop;
        let n = kaiser_num_taps(design.stopband_atten_db, f_stop - f_pass);
        let taps = kaiser_lowpass(
            n,
            0.5 * (f_pass + f_stop),
            kaiser_beta(design.stopband_atten_db),
        );
        Self::from_taps(up, down, &taps)
    }

    /// A resampler by `up/down` (not reduced) using the prototype low-pass `taps`, which
    /// run at the upsampled rate and should have unit DC gain.
    pub fn from_taps(up: usize, down: usize, taps: &[f64]) -> Result<Self, IqError> {
        if up == 0 || down == 0 || taps.is_empty() {
            return Err(IqError::Format(
                "resampling factors must be positive and the filter non-empty".into(),
            ));
        }
        let k = taps.len().div_ceil(up);
        let phases: Vec<Vec<f64>> = (0..up)
            .map(|p| {
                (0..k)
                    .map(|j| taps.get(p + j * up).copied().unwrap_or(0.0) * up as f64)
                    .collect()
            })
            .collect();
        Ok(PolyphaseResampler {
            up,
            down,
            n_taps: taps.len(),
            phases,
            hist: vec![Cf64::default(); k - 1],
            pos: k - 1,
            phase: 0,
        })
    }

    /// Interpolation factor (after reduction).
    pub fn up(&self) -> usize {
        self.up
    }

    /// Decimation factor (after reduction).
    pub fn down(&self) -> usize {
        self.down
    }

    /// Prototype filter length (taps at the upsampled rate).
    pub fn num_taps(&self) -> usize {
        self.n_taps
    }

    /// Taps per polyphase branch.
    pub fn taps_per_phase(&self) -> usize {
        self.hist.len() + 1
    }

    /// Group delay of the linear-phase filter, in output samples.
    pub fn delay_out_samples(&self) -> f64 {
        (self.n_taps as f64 - 1.0) / 2.0 / self.down as f64
    }

    /// Upper bound on the outputs produced from `n_in` inputs in one call.
    pub fn max_output_for(&self, n_in: usize) -> usize {
        (n_in * self.up).div_ceil(self.down) + 1
    }

    /// The output spec for an input spec: rate scaled by `up/down`, frequencies unchanged.
    pub fn output_spec(&self, input: SampleSpec) -> SampleSpec {
        SampleSpec {
            fs_hz: input.fs_hz * self.up as f64 / self.down as f64,
            ..input
        }
    }

    /// Clear the filter state, as if no input had been seen.
    pub fn reset(&mut self) {
        self.hist.iter_mut().for_each(|h| *h = Cf64::default());
        self.pos = self.hist.len();
        self.phase = 0;
    }

    /// Filter and resample `input`, appending the outputs to `out`. The stream starts
    /// from zero state, so the first outputs carry the filter's start-up transient.
    pub fn process(&mut self, input: &[Cf64], out: &mut Vec<Cf64>) {
        let h = self.hist.len();
        let len = h + input.len();
        let at = |i: usize| if i < h { self.hist[i] } else { input[i - h] };
        while self.pos < len {
            let taps = &self.phases[self.phase];
            let mut acc = Cf64::default();
            for (j, &c) in taps.iter().enumerate() {
                let x = at(self.pos - j);
                acc.re += c * x.re;
                acc.im += c * x.im;
            }
            out.push(acc);
            self.phase += self.down;
            self.pos += self.phase / self.up;
            self.phase %= self.up;
        }
        // Keep the newest `h` samples of `hist ++ input` as the next history.
        if h > 0 {
            if input.len() >= h {
                self.hist.copy_from_slice(&input[input.len() - h..]);
            } else {
                self.hist.rotate_left(input.len());
                self.hist[h - input.len()..].copy_from_slice(input);
            }
        }
        self.pos -= input.len();
    }
}

/// An [`IqSource`] adapter that resamples another source in bounded memory: one input
/// buffer of `chunk` samples and one output buffer sized for it. The filter tail after the
/// last input is not flushed.
pub struct ResampledSource<S> {
    src: S,
    rs: PolyphaseResampler,
    inbuf: Vec<Cf64>,
    outbuf: Vec<Cf64>,
    out_pos: usize,
    done: bool,
}

impl<S: IqSource> ResampledSource<S> {
    /// Resample `src` with `rs`, reading `chunk` input samples at a time.
    pub fn new(src: S, rs: PolyphaseResampler, chunk: usize) -> Self {
        let chunk = chunk.max(1);
        let cap = rs.max_output_for(chunk);
        ResampledSource {
            src,
            rs,
            inbuf: vec![Cf64::default(); chunk],
            outbuf: Vec::with_capacity(cap),
            out_pos: 0,
            done: false,
        }
    }

    /// Capacities of the input and output buffers (samples); fixed for the adapter's
    /// lifetime.
    pub fn buffer_capacities(&self) -> (usize, usize) {
        (self.inbuf.capacity(), self.outbuf.capacity())
    }

    /// The resampler in use.
    pub fn resampler(&self) -> &PolyphaseResampler {
        &self.rs
    }
}

impl<S: IqSource> IqSource for ResampledSource<S> {
    fn spec(&self) -> SampleSpec {
        self.rs.output_spec(self.src.spec())
    }

    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let mut n = 0;
        while n < buf.len() {
            if self.out_pos < self.outbuf.len() {
                let k = (buf.len() - n).min(self.outbuf.len() - self.out_pos);
                buf[n..n + k].copy_from_slice(&self.outbuf[self.out_pos..self.out_pos + k]);
                self.out_pos += k;
                n += k;
                continue;
            }
            if self.done {
                break;
            }
            let got = self.src.read(&mut self.inbuf)?;
            if got == 0 {
                self.done = true;
                break;
            }
            self.outbuf.clear();
            self.out_pos = 0;
            self.rs.process(&self.inbuf[..got], &mut self.outbuf);
        }
        Ok(n)
    }
}

/// Converts a real-valued IF stream to complex baseband: multiply by `exp(−j·2π·f_IF·t)`,
/// low-pass, and decimate by `decim` (≥ 2) with a [`PolyphaseResampler`].
///
/// The input source's samples are read as real (`re`; `im` is ignored), as an
/// [`super::stream::IqReader`] over a real format yields them. A component at
/// `f_IF + δ` comes out at `+δ` with half its real amplitude; its mirror at `−f_IF − δ`
/// is moved to `−2·f_IF − δ` and must fall in the stop band, which needs
/// `2·f_IF − δ` above `fs/(2·decim)`; `f_IF = fs/4` with `decim = 2` is the usual choice.
/// When the front end's local oscillator is above the signal (high-side injection) the IF
/// spectrum is inverted; [`RealIfToBaseband::inverted`] conjugates the output to undo it.
///
/// The output spec has rate `fs/decim`, centre `center_hz + if_hz` of the input spec (the
/// radio frequency now at 0 Hz; minus for an inverted spectrum) and zero IF.
pub struct RealIfToBaseband<S> {
    inner: ResampledSource<Mixer<S>>,
    invert: bool,
    if_hz: f64,
}

/// The mixing stage of [`RealIfToBaseband`].
struct Mixer<S> {
    src: S,
    step: f64,
    cyc: f64,
}

impl<S: IqSource> IqSource for Mixer<S> {
    fn spec(&self) -> SampleSpec {
        self.src.spec()
    }

    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let n = self.src.read(buf)?;
        for s in &mut buf[..n] {
            let (sin, cos) = (2.0 * std::f64::consts::PI * self.cyc).sin_cos();
            let x = s.re;
            *s = Cf64::new(x * cos, -x * sin);
            self.cyc += self.step;
            if self.cyc >= 1.0 {
                self.cyc -= 1.0;
            }
        }
        Ok(n)
    }
}

impl<S: IqSource> RealIfToBaseband<S> {
    /// Convert `src` (real samples at `src.spec().fs_hz`) whose signal sits at `if_hz`,
    /// decimating by `decim`, processing `chunk` input samples at a time.
    pub fn new(src: S, if_hz: f64, decim: usize, chunk: usize) -> Result<Self, IqError> {
        let fs = src.spec().fs_hz;
        if !(if_hz > 0.0 && if_hz < fs / 2.0) {
            return Err(IqError::Format(format!(
                "IF {if_hz} Hz must lie strictly between 0 and half the sample rate ({} Hz)",
                fs / 2.0
            )));
        }
        if decim < 2 {
            return Err(IqError::Format(
                "real-IF conversion needs decimation by at least 2 to remove the image".into(),
            ));
        }
        let mixer = Mixer {
            src,
            step: if_hz / fs,
            cyc: 0.0,
        };
        Ok(RealIfToBaseband {
            inner: ResampledSource::new(mixer, PolyphaseResampler::decimator(decim)?, chunk),
            invert: false,
            if_hz,
        })
    }

    /// Conjugate the output, for a spectrum inverted by high-side local-oscillator
    /// injection.
    pub fn inverted(mut self, yes: bool) -> Self {
        self.invert = yes;
        self
    }

    /// Capacities of the internal buffers (samples); fixed for the adapter's lifetime.
    pub fn buffer_capacities(&self) -> (usize, usize) {
        self.inner.buffer_capacities()
    }
}

impl<S: IqSource> IqSource for RealIfToBaseband<S> {
    fn spec(&self) -> SampleSpec {
        let s = self.inner.spec();
        let rf = if self.invert {
            s.center_hz - self.if_hz
        } else {
            s.center_hz + self.if_hz
        };
        SampleSpec {
            fs_hz: s.fs_hz,
            center_hz: rf,
            if_hz: 0.0,
        }
    }

    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let n = self.inner.read(buf)?;
        if self.invert {
            buf[..n].iter_mut().for_each(|s| s.im = -s.im);
        }
        Ok(n)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Kaiser's β formula at 80 dB: 0.1102·71.3 = 7.857 26.
    #[test]
    fn kaiser_beta_matches_the_closed_form() {
        assert!((kaiser_beta(80.0) - 7.857_26).abs() < 1e-9);
        assert_eq!(kaiser_beta(10.0), 0.0);
    }

    #[test]
    fn lowpass_has_unit_dc_gain_and_is_symmetric() {
        let h = kaiser_lowpass(101, 0.1, 8.0);
        assert!((h.iter().sum::<f64>() - 1.0).abs() < 1e-12);
        for k in 0..h.len() {
            assert!((h[k] - h[h.len() - 1 - k]).abs() < 1e-15);
        }
    }

    #[test]
    fn factors_are_reduced_and_zero_is_refused() {
        let r = PolyphaseResampler::new(4, 6).unwrap();
        assert_eq!((r.up(), r.down()), (2, 3));
        assert!(PolyphaseResampler::new(0, 3).is_err());
    }

    #[test]
    fn output_count_follows_the_ratio() {
        let mut r = PolyphaseResampler::new(3, 2).unwrap();
        let mut out = Vec::new();
        r.process(&vec![Cf64::new(1.0, 0.0); 1000], &mut out);
        assert_eq!(out.len(), 1500);
    }
}
