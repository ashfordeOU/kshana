// SPDX-License-Identifier: AGPL-3.0-only
//! **Terrestrial signals of opportunity: receiver clock offset from LTE downlink
//! synchronisation signals, and oscillator frequency offset from any cyclic-prefix OFDM
//! broadcast (DVB-T, LTE).** MODELLED.
//!
//! This is a timing library. The transmitter's and the receiver's positions are inputs, so
//! the signal travel time is known and what is estimated is the receiver clock's offset and
//! rate against the transmitter's time base. Nothing here estimates a position, locates a
//! transmitter, or transmits.
//!
//! * **LTE primary synchronisation signal (PSS).** The PSS is a length-62 Zadoff–Chu sequence
//!   of root 25, 29 or 34 (`N_ID^(2)` = 0, 1, 2), `d_u(n) = exp(−jπ·u·n(n+1)/63)` for
//!   `n = 0..30` and `exp(−jπ·u·(n+1)(n+2)/63)` for `n = 31..61` (3GPP TS 36.211 §6.11.1.1),
//!   on the 62 subcarriers nearest the unused DC subcarrier (§6.11.1.2), in the last OFDM
//!   symbol of slots 0 and 10 of a frequency-division-duplex frame, so every 5 ms. With the
//!   normal cyclic prefix the useful part of that symbol starts 13 312 basic time units
//!   (`T_s = 1/30.72 MHz`), 433.33 µs, after the half-frame boundary (§4.1, §6.12). The
//!   template is synthesised at the capture's own sample rate ([`pss_template`]), the capture
//!   is correlated against the three roots, and each 5 ms peak is refined to a fraction of a
//!   sample by a parabola through the correlation magnitude ([`detect_pss`]).
//! * **Clock offset.** A transmitter whose frame boundaries are aligned to GPS time (stated
//!   by the user, with any known offset of that transmitter) sends the PSS at
//!   `T_k = k·5 ms + 433.33 µs + offset_tx`; it arrives at `T_k + |r_tx − r_rx|/c`. The
//!   receiver clock reads the arrival as `t_capture + τ`, so the receiver clock offset is
//!   `t_capture + τ − T_k − range/c`, resolved modulo 5 ms by the nearest value to a stated
//!   prior (default zero, so offsets within ±2.5 ms). The offsets of all detections are fitted
//!   with a line ([`fit_offset`]): offset at the capture start, rate (s/s), and their
//!   standard uncertainties from the residuals.
//! * **Cyclic-prefix OFDM.** For any OFDM broadcast with a cyclic prefix (DVB-T 2k/8k with its
//!   guard interval, LTE) the maximum-likelihood estimator of van de Beek, Sandell and
//!   Börjesson (*ML estimation of time and frequency offset in OFDM systems*, IEEE Trans.
//!   Signal Processing 45(7), 1997) gives the symbol timing modulo the symbol period and the
//!   carrier frequency offset as a fraction of the subcarrier spacing ([`cp_estimate`]). The
//!   carrier frequency offset over the carrier frequency is the receiver oscillator's
//!   fractional frequency offset against the transmitter's; DVB-T gives no absolute time
//!   without decoding its frame, so only the rate is stated for it.
//!
//! **Honest scope.** Tested on synthetic captures ([`synth_lte`]: a test signal with the PSS
//! in its LTE positions and random QPSK elsewhere, not a conformant LTE downlink). No real
//! capture is bundled. Whether a given transmitter's frames are aligned to GPS, and with
//! what offset, is the user's statement (time-division LTE networks are synchronised; many
//! frequency-division networks are not); the result is only as good as that statement.
//! Multipath delays the correlation peak and biases the offset late. Single-frequency DVB-T
//! networks are commonly GPS-disciplined; that too is the user's statement.

use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::portable_math::PortableFloat;
use crate::sdr::Cf64;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::Serialize;
use std::f64::consts::PI;

/// Schema ids.
pub const LTE_SCHEMA: &str = "kshana.soop-clock-lte/1";
pub const CP_SCHEMA: &str = "kshana.soop-clock-cp/1";
/// Speed of light (m/s).
const C: f64 = 299_792_458.0;
/// LTE subcarrier spacing (Hz).
pub const LTE_SCS_HZ: f64 = 15_000.0;
/// LTE half-frame (s).
pub const HALF_FRAME_S: f64 = 5e-3;
/// Start of the PSS useful part after the half-frame boundary (s): 13 312 `T_s`.
pub const PSS_OFFSET_S: f64 = 13_312.0 / 30.72e6;
/// Zadoff–Chu roots of `N_ID^(2)` = 0, 1, 2.
pub const PSS_ROOTS: [u32; 3] = [25, 29, 34];

/// The 62 PSS symbols of `N_ID^(2)` = `nid2` (TS 36.211 §6.11.1.1).
pub fn pss_sequence(nid2: usize) -> Vec<Cf64> {
    let u = PSS_ROOTS[nid2 % 3] as f64;
    (0..62)
        .map(|n| {
            let n = n as f64;
            let arg = if n < 31.0 {
                -PI * u * n * (n + 1.0) / 63.0
            } else {
                -PI * u * (n + 1.0) * (n + 2.0) / 63.0
            };
            Cf64::new(arg.pcos(), arg.psin())
        })
        .collect()
}

/// Subcarrier index (relative to DC) of PSS symbol `n`: −31..−1 then +1..+31.
fn pss_subcarrier(n: usize) -> f64 {
    if n < 31 {
        n as f64 - 31.0
    } else {
        n as f64 - 30.0
    }
}

/// The PSS useful part (one OFDM symbol, `round(fs/15 kHz)` samples) synthesised at `fs`,
/// unit mean power.
pub fn pss_template(nid2: usize, fs: f64) -> Vec<Cf64> {
    let d = pss_sequence(nid2);
    let len = (fs / LTE_SCS_HZ).round().max(1.0) as usize;
    let norm = 1.0 / (62f64).sqrt();
    (0..len)
        .map(|i| {
            let t = i as f64 / fs;
            let mut acc = Cf64::default();
            for (n, dn) in d.iter().enumerate() {
                let ph = 2.0 * PI * pss_subcarrier(n) * LTE_SCS_HZ * t;
                acc = acc + *dn * Cf64::new(ph.pcos(), ph.psin());
            }
            acc * norm
        })
        .collect()
}

/// One PSS detection.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct PssHit {
    pub nid2: usize,
    /// Arrival of the PSS useful part after the first capture sample (s).
    pub toa_s: f64,
    /// Correlation magnitude over the template and window energies, in [0, 1].
    pub metric: f64,
}

fn corr_at(x: &[Cf64], tpl: &[Cf64], lag: usize) -> (f64, f64) {
    let (mut re, mut im, mut e) = (0.0, 0.0, 0.0);
    for (k, t) in tpl.iter().enumerate() {
        let s = x[lag + k];
        // s · conj(t)
        re += s.re * t.re + s.im * t.im;
        im += s.im * t.re - s.re * t.im;
        e += s.re * s.re + s.im * s.im;
    }
    (re * re + im * im, e)
}

/// Detect the PSS in a capture at sample rate `fs`: find the strongest root and lag in the
/// first 5 ms, then the peak near each later 5 ms step, each refined by a parabola through
/// the correlation magnitude. Detections with a metric under `min_metric` are dropped.
pub fn detect_pss(x: &[Cf64], fs: f64, min_metric: f64) -> Vec<PssHit> {
    let tpls: Vec<Vec<Cf64>> = (0..3).map(|r| pss_template(r, fs)).collect();
    let len = tpls[0].len();
    let tpl_e: f64 = tpls[0].iter().map(|c| c.re * c.re + c.im * c.im).sum();
    let half = (HALF_FRAME_S * fs).round() as usize;
    if x.len() < len + half + 2 {
        return Vec::new();
    }
    let metric = |r: usize, lag: usize| {
        let (p, e) = corr_at(x, &tpls[r], lag);
        if e > 0.0 {
            p / (e * tpl_e)
        } else {
            0.0
        }
    };
    // Acquisition over the first half-frame.
    let (mut best, mut br, mut bl) = (0.0, 0usize, 0usize);
    for r in 0..3 {
        for lag in 0..half.min(x.len() - len) {
            let m = metric(r, lag);
            if m > best {
                best = m;
                br = r;
                bl = lag;
            }
        }
    }
    let mut out = Vec::new();
    let search = ((fs * 2e-6).ceil() as usize).max(2);
    let mut centre = bl as f64;
    while (centre as usize) + len + search + 1 < x.len() {
        let c = centre.round() as usize;
        let lo = c.saturating_sub(search).max(1);
        let hi = (c + search).min(x.len() - len - 1);
        let (mut m0, mut l0) = (0.0, lo);
        for lag in lo..=hi {
            let m = metric(br, lag);
            if m > m0 {
                m0 = m;
                l0 = lag;
            }
        }
        if l0 >= 1 && l0 + 1 + len <= x.len() {
            let (a, b, cc) = (
                metric(br, l0 - 1).sqrt(),
                m0.sqrt(),
                metric(br, l0 + 1).sqrt(),
            );
            let den = a - 2.0 * b + cc;
            let frac = if den.abs() > 1e-12 {
                (0.5 * (a - cc) / den).clamp(-0.5, 0.5)
            } else {
                0.0
            };
            if m0 >= min_metric {
                out.push(PssHit {
                    nid2: br,
                    toa_s: (l0 as f64 + frac) / fs,
                    metric: m0,
                });
            }
            centre = l0 as f64 + frac + half as f64;
        } else {
            break;
        }
    }
    out
}

/// A transmitter or receiver position from geodetic degrees and metres.
pub fn ecef(lat_deg: f64, lon_deg: f64, h_m: f64) -> [f64; 3] {
    geodetic_to_ecef(Geodetic {
        lat_rad: lat_deg.to_radians(),
        lon_rad: lon_deg.to_radians(),
        alt_m: h_m,
    })
}

/// The receiver clock offset (s) of each detection, against a transmitter time base aligned to
/// GPS time with offset `tx_offset_s`, resolved modulo 5 ms to the value nearest `prior_s`.
/// `capture_start_s` is the receiver-clock time of the first sample (GPS seconds).
pub fn offsets(
    hits: &[PssHit],
    capture_start_s: f64,
    range_m: f64,
    tx_offset_s: f64,
    prior_s: f64,
) -> Vec<(f64, f64)> {
    hits.iter()
        .map(|h| {
            let t_rx = capture_start_s + h.toa_s;
            let raw = t_rx - range_m / C - PSS_OFFSET_S - tx_offset_s;
            // raw = k·5 ms + offset; choose k so offset is nearest the prior.
            let k = ((raw - prior_s) / HALF_FRAME_S).round();
            (h.toa_s, raw - k * HALF_FRAME_S)
        })
        .collect()
}

/// A straight-line fit of offsets against time.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct OffsetFit {
    /// Offset at the capture start (s).
    pub offset_s: f64,
    pub offset_u_s: f64,
    /// Rate (s/s).
    pub rate: f64,
    pub rate_u: f64,
    pub residual_rms_s: f64,
    pub n: usize,
}

/// Least-squares line through `(t, offset)` points (at least three), with standard
/// uncertainties from the residual scatter.
pub fn fit_offset(pts: &[(f64, f64)]) -> Option<OffsetFit> {
    let n = pts.len();
    if n < 3 {
        return None;
    }
    let nf = n as f64;
    let mt = pts.iter().map(|p| p.0).sum::<f64>() / nf;
    // Fit about the first offset to keep precision.
    let o0 = pts[0].1;
    let my = pts.iter().map(|p| p.1 - o0).sum::<f64>() / nf;
    let sxx: f64 = pts.iter().map(|p| (p.0 - mt).powi(2)).sum();
    if sxx <= 0.0 {
        return None;
    }
    let sxy: f64 = pts.iter().map(|p| (p.0 - mt) * (p.1 - o0 - my)).sum();
    let b = sxy / sxx;
    let a = my - b * mt;
    let ss: f64 = pts.iter().map(|p| (p.1 - o0 - a - b * p.0).powi(2)).sum();
    let s2 = ss / (nf - 2.0);
    Some(OffsetFit {
        offset_s: o0 + a,
        offset_u_s: (s2 * (1.0 / nf + mt * mt / sxx)).sqrt(),
        rate: b,
        rate_u: (s2 / sxx).sqrt(),
        residual_rms_s: (ss / nf).sqrt(),
        n,
    })
}

/// Van de Beek ML estimate over a capture of a cyclic-prefix OFDM signal with useful length
/// `nfft` and prefix `ncp` samples: the symbol start (sample index modulo `nfft + ncp`) and the
/// carrier frequency offset as a fraction of the subcarrier spacing (in `(−0.5, 0.5]`), with
/// the normalised peak `|γ|/Φ`-style metric. Uses the high-SNR form of the estimator
/// (`ρ → 1`): the start maximises `|Σ r(n)·r*(n+N)|` over the prefix window summed over all
/// symbols, and `ε = −∠(γ)/2π`. Every symbol must carry the same prefix length (as in
/// DVB-T); LTE's longer first prefix of each slot biases it, so LTE uses [`lte_cfo_hz`].
pub fn cp_estimate(x: &[Cf64], nfft: usize, ncp: usize) -> Option<(usize, f64, f64)> {
    let sym = nfft + ncp;
    if nfft == 0 || ncp == 0 || x.len() < 2 * sym + nfft {
        return None;
    }
    let nsym = (x.len() - nfft - ncp) / sym;
    let (mut best, mut bt, mut bg) = (-1.0, 0usize, (0.0, 0.0));
    for theta in 0..sym {
        let (mut gr, mut gi, mut e) = (0.0, 0.0, 0.0);
        for s in 0..nsym {
            let base = theta + s * sym;
            if base + ncp + nfft > x.len() {
                break;
            }
            for k in base..base + ncp {
                let (a, b) = (x[k], x[k + nfft]);
                gr += a.re * b.re + a.im * b.im;
                gi += a.im * b.re - a.re * b.im;
                e += 0.5 * (a.re * a.re + a.im * a.im + b.re * b.re + b.im * b.im);
            }
        }
        let mag = (gr * gr + gi * gi).sqrt();
        let m = if e > 0.0 { mag / e } else { 0.0 };
        if m > best {
            best = m;
            bt = theta;
            bg = (gr, gi);
        }
    }
    // γ = Σ r(k)·r*(k+N) has phase −2π·ε for a frequency offset ε·Δf... with our conjugate on
    // the later sample the phase is −2πε: ε = −∠γ/(2π).
    let eps = -bg.1.patan2(bg.0) / (2.0 * PI);
    Some((bt, eps, best))
}

/// The carrier frequency offset (Hz) of an LTE capture from its cyclic prefixes, with the
/// symbol boundaries placed from the PSS detections: in each half-frame after a detection,
/// every symbol's prefix (10 samples at 1.92 MHz for the first symbol of a slot, 9 for the
/// others, scaled to `fs`) is correlated with the end of its symbol and the products summed;
/// `Δf = −∠γ·15 kHz/2π`. Needs a sample rate that is a whole multiple of 1.92 MHz; `None`
/// otherwise or without a detection.
pub fn lte_cfo_hz(x: &[Cf64], fs: f64, hits: &[PssHit]) -> Option<f64> {
    let scale = fs / 1.92e6;
    if (scale - scale.round()).abs() > 1e-9 || scale < 1.0 || hits.is_empty() {
        return None;
    }
    let sc = scale.round() as usize;
    let nfft = 128 * sc;
    let (mut gr, mut gi) = (0.0, 0.0);
    for h in hits {
        let u = (h.toa_s * fs).round() as i64;
        let boundary = u - (832 * sc) as i64;
        if boundary < 0 {
            continue;
        }
        let mut pos = boundary as usize;
        for sym in 0..70 {
            let cp = if sym % 7 == 0 { 10 * sc } else { 9 * sc };
            if pos + cp + nfft > x.len() {
                break;
            }
            for k in pos..pos + cp {
                let (a, b) = (x[k], x[k + nfft]);
                gr += a.re * b.re + a.im * b.im;
                gi += a.im * b.re - a.re * b.im;
            }
            pos += cp + nfft;
        }
    }
    if gr == 0.0 && gi == 0.0 {
        return None;
    }
    Some(-gi.patan2(gr) / (2.0 * PI) * LTE_SCS_HZ)
}

/// A synthetic LTE-like test capture at `fs` (a multiple of 15 kHz times the template length
/// is not required): random QPSK on the 72 central subcarriers in every OFDM symbol with the
/// normal cyclic prefix, the PSS of `nid2` in the last symbol of slots 0 and 10, the whole
/// signal delayed by `delay_s` (fractional, by a phase ramp in the transform domain), shifted
/// by `cfo_hz`, in complex white noise at `snr_db` over the occupied band. **A test signal,
/// not a conformant LTE downlink.**
pub fn synth_lte(
    fs: f64,
    duration_s: f64,
    nid2: usize,
    delay_s: f64,
    cfo_hz: f64,
    snr_db: f64,
    seed: u64,
) -> Vec<Cf64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let n_out = (duration_s * fs).round() as usize;
    let nfft = (fs / LTE_SCS_HZ).round() as usize;
    let cp_first = ((160.0 / 2048.0) * nfft as f64).round() as usize;
    let cp_other = ((144.0 / 2048.0) * nfft as f64).round() as usize;
    let d = pss_sequence(nid2);
    let mut sig: Vec<Cf64> = Vec::with_capacity(n_out + 2 * nfft);
    let mut sym_index = 0usize;
    while sig.len() < n_out + nfft {
        let l = sym_index % 7;
        let slot = (sym_index / 7) % 20;
        let cp = if l == 0 { cp_first } else { cp_other };
        let is_pss = l == 6 && (slot == 0 || slot == 10);
        // Frequency-domain content: subcarriers −36..−1, +1..+36.
        let mut fd: Vec<(f64, Cf64)> = Vec::with_capacity(72);
        if is_pss {
            for (n, dn) in d.iter().enumerate() {
                fd.push((pss_subcarrier(n), *dn));
            }
        } else {
            for k in (-36i32..=36).filter(|k| *k != 0) {
                let q = |b: bool| if b { 1.0 } else { -1.0 } / 2f64.sqrt();
                fd.push((k as f64, Cf64::new(q(rng.gen()), q(rng.gen()))));
            }
        }
        let norm = 1.0 / (fd.len() as f64).sqrt();
        let mut body = Vec::with_capacity(nfft);
        for i in 0..nfft {
            let t = i as f64 / fs;
            let mut acc = Cf64::default();
            for (k, v) in &fd {
                let ph = 2.0 * PI * k * LTE_SCS_HZ * t;
                acc = acc + *v * Cf64::new(ph.pcos(), ph.psin());
            }
            body.push(acc * norm);
        }
        sig.extend_from_slice(&body[nfft - cp..]);
        sig.extend_from_slice(&body);
        sym_index += 1;
    }
    // Fractional delay: transform, phase ramp, inverse (on a power-of-two buffer).
    let m = (n_out + nfft).next_power_of_two();
    let mut buf = vec![Cf64::default(); m];
    buf[..sig.len().min(m)].copy_from_slice(&sig[..sig.len().min(m)]);
    crate::spectrum::fft_in_place(&mut buf, false);
    for (k, v) in buf.iter_mut().enumerate() {
        let f = if k < m / 2 {
            k as f64
        } else {
            k as f64 - m as f64
        } * fs
            / m as f64;
        let ph = -2.0 * PI * f * delay_s;
        *v = *v * Cf64::new(ph.pcos(), ph.psin());
    }
    crate::spectrum::fft_in_place(&mut buf, true);
    let inv = 1.0 / m as f64;
    // The signal has unit power per sample, all of it in the 72 occupied subcarriers; the
    // noise variance over the sampled band gives the stated SNR within that occupied band.
    let noise_var = 10f64.ppowf(-snr_db / 10.0) * fs / (72.0 * LTE_SCS_HZ);
    let ns = (noise_var / 2.0).sqrt();
    (0..n_out)
        .map(|i| {
            let ph = 2.0 * PI * cfo_hz * i as f64 / fs;
            let s = buf[i] * inv * Cf64::new(ph.pcos(), ph.psin());
            s + Cf64::new(
                ns * crate::portable_math::standard_normal(&mut rng),
                ns * crate::portable_math::standard_normal(&mut rng),
            )
        })
        .collect()
}

// ─────────────────────────────── CLI ───────────────────────────────

/// `kshana soop-clock <lte|cp|synth-lte> ...`; returns the exit code.
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn parse_pos(v: &str) -> Option<[f64; 3]> {
    let p: Vec<f64> = v
        .split(',')
        .map(|s| s.trim().parse::<f64>())
        .collect::<Result<_, _>>()
        .ok()?;
    match p.as_slice() {
        [lat, lon, h] if lat.abs() <= 90.0 && lon.abs() <= 360.0 && h.is_finite() => {
            Some([*lat, *lon, *h])
        }
        [lat, lon] if lat.abs() <= 90.0 && lon.abs() <= 360.0 => Some([*lat, *lon, 0.0]),
        _ => None,
    }
}

fn sigmf_base(p: &str) -> String {
    p.trim_end_matches(".sigmf-meta")
        .trim_end_matches(".sigmf-data")
        .trim_end_matches('.')
        .to_string()
}

fn run_inner(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("soop-clock-usage");
    let Some(sub) = args.first() else {
        return Err(usage());
    };
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(());
    }
    let mut o: std::collections::BTreeMap<&str, String> = Default::default();
    let mut pos = Vec::new();
    let mut i = 1;
    const OPTS: &[&str] = &[
        "--start-gps-s",
        "--rx",
        "--tx",
        "--tx-offset-ns",
        "--prior-offset-s",
        "--carrier-hz",
        "--out",
        "--nfft",
        "--ncp",
        "--fs",
        "--duration-s",
        "--nid2",
        "--delay-s",
        "--cfo-hz",
        "--snr-db",
        "--seed",
        "--min-metric",
    ];
    while i < args.len() {
        let a = args[i].as_str();
        if let Some(k) = OPTS.iter().find(|k| **k == a) {
            i += 1;
            let v = args
                .get(i)
                .cloned()
                .ok_or_else(|| crate::terr!("e-soop-clock-missing-value", option = a))?;
            o.insert(k, v);
        } else if a.starts_with('-') {
            return Err(crate::terr!("e-soop-clock-unknown-option", option = a));
        } else {
            pos.push(a.to_string());
        }
        i += 1;
    }
    let num = |k: &str, default: Option<f64>| -> Result<f64, String> {
        match o.get(k) {
            Some(v) => v
                .parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .ok_or_else(|| {
                    crate::terr!("e-soop-clock-bad-number", option = k, value = v.as_str())
                }),
            None => default.ok_or_else(usage),
        }
    };
    let emit = |doc: serde_json::Value| -> Result<(), String> {
        let s = serde_json::to_string_pretty(&doc).unwrap_or_default() + "\n";
        match o.get("--out") {
            Some(p) => std::fs::write(p, s)
                .map_err(|e| crate::terr!("e-soop-clock-cannot-write", path = p.as_str(), e = e)),
            None => {
                print!("{s}");
                Ok(())
            }
        }
    };
    let read_capture = |p: &str| -> Result<(Vec<Cf64>, f64), String> {
        let b = sigmf_base(p);
        let (mp, dp) = (format!("{b}.sigmf-meta"), format!("{b}.sigmf-data"));
        let meta = std::fs::read_to_string(&mp)
            .map_err(|e| crate::terr!("e-soop-clock-cannot-read", path = mp.as_str(), e = e))?;
        let data = std::fs::read(&dp)
            .map_err(|e| crate::terr!("e-soop-clock-cannot-read", path = dp.as_str(), e = e))?;
        let rec = crate::sigmf::read(&meta, &data, 1.0)?;
        let fs = rec.sample_rate_hz()?;
        Ok((rec.samples, fs))
    };
    match sub.as_str() {
        "lte" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let (x, fs) = read_capture(p)?;
            let start = num("--start-gps-s", None)?;
            let pos_of = |k: &str| -> Result<[f64; 3], String> {
                let v = o.get(k).ok_or_else(usage)?;
                parse_pos(v).ok_or_else(|| {
                    crate::terr!("e-soop-clock-bad-position", option = k, value = v.as_str())
                })
            };
            let (rx, tx) = (pos_of("--rx")?, pos_of("--tx")?);
            let (re, te) = (ecef(rx[0], rx[1], rx[2]), ecef(tx[0], tx[1], tx[2]));
            let range =
                ((re[0] - te[0]).powi(2) + (re[1] - te[1]).powi(2) + (re[2] - te[2]).powi(2))
                    .sqrt();
            let tx_off = num("--tx-offset-ns", Some(0.0))? * 1e-9;
            let prior = num("--prior-offset-s", Some(0.0))?;
            let min_metric = num("--min-metric", Some(0.2))?;
            let hits = detect_pss(&x, fs, min_metric);
            let pts = offsets(&hits, start, range, tx_off, prior);
            let fit = fit_offset(&pts)
                .ok_or_else(|| crate::terr!("e-soop-clock-too-few-detections", n = hits.len()))?;
            // Frequency offset from the cyclic prefixes, placed by the PSS timing.
            let cfo = lte_cfo_hz(&x, fs, &hits);
            let carrier = o
                .get("--carrier-hz")
                .and_then(|v| v.parse::<f64>().ok())
                .filter(|f| *f > 0.0);
            eprintln!(
                "{}",
                crate::t!(
                    "soop-clock-summary",
                    n = hits.len(),
                    offset_us = format!("{:.3}", fit.offset_s * 1e6)
                )
            );
            emit(serde_json::json!({
                "schema": LTE_SCHEMA,
                "label": "MODELLED",
                "note": "receiver clock offset against a transmitter time base stated to be aligned to GPS time (with tx_offset_ns); positions are inputs, nothing is located; multipath biases the offset late",
                "input": p,
                "sample_rate_hz": fs,
                "range_m": range,
                "tx_offset_ns": tx_off * 1e9,
                "nid2": hits.first().map(|h| h.nid2),
                "detections": hits.len(),
                "fit": fit,
                "offsets": pts.iter().map(|(t, off)| serde_json::json!({"t_s": t, "offset_s": off})).collect::<Vec<_>>(),
                "cfo_hz": cfo,
                "fractional_frequency_offset": match (cfo, carrier) { (Some(c), Some(f)) => serde_json::json!(c / f), _ => serde_json::Value::Null },
            }))
        }
        "cp" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let (x, fs) = read_capture(p)?;
            let nfft = num("--nfft", None)? as usize;
            let ncp = num("--ncp", None)? as usize;
            let (start, eps, metric) =
                cp_estimate(&x, nfft, ncp).ok_or_else(|| crate::terr!("e-soop-clock-too-short"))?;
            let scs = fs / nfft as f64;
            let carrier = o
                .get("--carrier-hz")
                .and_then(|v| v.parse::<f64>().ok())
                .filter(|f| *f > 0.0);
            emit(serde_json::json!({
                "schema": CP_SCHEMA,
                "label": "MODELLED",
                "note": "symbol timing modulo the symbol period and the carrier frequency offset (a fraction of the subcarrier spacing, unambiguous within half of it); no absolute time without decoding the frame",
                "input": p,
                "sample_rate_hz": fs,
                "symbol_start_sample": start,
                "symbol_period_samples": nfft + ncp,
                "cfo_hz": eps * scs,
                "metric": metric,
                "fractional_frequency_offset": carrier.map(|f| eps * scs / f),
            }))
        }
        "synth-lte" => {
            let Some(out) = o.get("--out").cloned() else {
                return Err(usage());
            };
            let fs = num("--fs", Some(1.92e6))?;
            let dur = num("--duration-s", Some(0.02))?;
            if !((1e5..=6.144e7).contains(&fs) && dur > 0.0 && dur * fs <= 2e7) {
                return Err(crate::terr!("e-soop-clock-bad-synth"));
            }
            let x = synth_lte(
                fs,
                dur,
                num("--nid2", Some(0.0))? as usize % 3,
                num("--delay-s", Some(0.0))?,
                num("--cfo-hz", Some(0.0))?,
                num("--snr-db", Some(10.0))?,
                num("--seed", Some(1.0))? as u64,
            );
            let rec = crate::sigmf::Recording {
                meta: crate::sigmf::Meta::new(
                    crate::sigmf::DataType::Cf32Le,
                    fs,
                    0.0,
                    "MODELLED test signal (kshana soop-clock synth-lte): LTE PSS positions with random QPSK, not a conformant LTE downlink",
                ),
                samples: x,
            };
            let (json, bytes, _) = crate::sigmf::write(&rec, 1.0)?;
            let b = sigmf_base(&out);
            let (mp, dp) = (format!("{b}.sigmf-meta"), format!("{b}.sigmf-data"));
            std::fs::write(&mp, json).map_err(|e| {
                crate::terr!("e-soop-clock-cannot-write", path = mp.as_str(), e = e)
            })?;
            std::fs::write(&dp, bytes)
                .map_err(|e| crate::terr!("e-soop-clock-cannot-write", path = dp.as_str(), e = e))
        }
        _ => Err(usage()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn pss_sequences_have_unit_modulus_and_low_cross_correlation() {
        let s: Vec<Vec<Cf64>> = (0..3).map(pss_sequence).collect();
        for q in &s {
            assert_eq!(q.len(), 62);
            assert!(q.iter().all(|c| (c.abs() - 1.0).abs() < 1e-12));
        }
        let xc = |a: &[Cf64], b: &[Cf64]| {
            let (mut re, mut im) = (0.0, 0.0);
            for (x, y) in a.iter().zip(b) {
                re += x.re * y.re + x.im * y.im;
                im += x.im * y.re - x.re * y.im;
            }
            (re * re + im * im).sqrt() / 62.0
        };
        assert!((xc(&s[0], &s[0]) - 1.0).abs() < 1e-12);
        assert!(xc(&s[0], &s[1]) < 0.3 && xc(&s[1], &s[2]) < 0.3);
    }

    #[test]
    fn pss_offset_is_13312_basic_units() {
        // 138 + 5·137 + 9 samples at 1.92 MHz = 832 samples = 433.33 µs.
        assert!((PSS_OFFSET_S - 832.0 / 1.92e6).abs() < 1e-15);
    }

    #[test]
    fn fit_recovers_a_line() {
        let pts: Vec<(f64, f64)> = (0..10)
            .map(|i| (i as f64 * 0.005, 1e-6 + 2e-8 * i as f64 * 0.005))
            .collect();
        let f = fit_offset(&pts).unwrap();
        assert!((f.offset_s - 1e-6).abs() < 1e-15);
        assert!((f.rate - 2e-8).abs() < 1e-15);
    }
}
