// SPDX-License-Identifier: AGPL-3.0-only
//! **Baseband in-phase/quadrature (IQ) synthesis of the Augmented Forward Signal, with truth
//! labels.**
//!
//! LSIS-130 defines the transmitted signal as
//! `S(t) = I(t) cos(2 pi fc t) - Q(t) sin(2 pi fc t)` with
//! `I = sqrt(P_I / 2) · C_I · D_I` and `Q = sqrt(P_Q / 2) · C_Q`, so the complex baseband
//! envelope is `I + jQ`: the data channel (binary phase-shift keying BPSK(1), the 2046-chip
//! Gold code times the 500 symbol/s frame) on the in-phase axis, the pilot (BPSK(5), the
//! tiered code) on the quadrature axis, half the power each (LSIS-103).
//!
//! [`render`] is the one synthesis core: it turns a channel state (code phases, code rates,
//! carrier phase and frequency, amplitudes) into samples, and knows nothing of geometry. The
//! node layer ([`NodeSignal`], [`RecordingConfig`]) builds that state for a constant Doppler
//! with coherent code Doppler and an arrival time, adds seeded white Gaussian noise at a
//! stated carrier-to-noise density and writes an 8-bit Signal Metadata Format (SigMF)
//! recording whose annotations are the truth labels (codes, Doppler, delay, every frame's
//! time of interval (TOI) and data bits).
//!
//! What is modelled here is conformance to the standard, not a channel: no propagation, no
//! dynamics beyond a constant Doppler, no receiver front end.

use super::codes::{chip_level, LsisCodes, NodeChips, NodeCodes, I_PRIMARY_LEN, Q_PRIMARY_LEN};
use super::frame::{FrameCoder, FrameData, FRAME_SYMBOLS, SB2_DATA_BITS, SB34_DATA_BITS};
use super::{CARRIER_HZ, I_CHIP_RATE_HZ, LSIS_VERSION, Q_CHIP_RATE_HZ};
use crate::sdr::Cf64;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use std::collections::BTreeMap;

/// Chips of the AFS-I code per data symbol (one primary period, LSIS-160).
pub const I_CHIPS_PER_SYMBOL: u64 = I_PRIMARY_LEN as u64;
/// AFS-Q chips per frame: 10230 x 4 x 1500 (LSIS-200, LSIS-220).
pub const Q_CHIPS_PER_FRAME: u64 = (Q_PRIMARY_LEN * 4 * 1500) as u64;
/// Frame duration (s).
pub const FRAME_S: f64 = 12.0;

/// The state of one channel at the first sample of a block. Code phases count chips from the
/// leading edge of frame 0 (the frame whose symbols `symbols(0)` returns); they may be
/// negative for samples received before that frame.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ChannelState {
    /// AFS-I code phase (chips).
    pub i_phase_chips: f64,
    /// AFS-I code rate (chips per second).
    pub i_rate_cps: f64,
    /// AFS-Q code phase (chips).
    pub q_phase_chips: f64,
    /// AFS-Q code rate (chips per second).
    pub q_rate_cps: f64,
    /// Carrier phase (cycles).
    pub carrier_phase_cycles: f64,
    /// Carrier frequency offset from the recording centre (Hz).
    pub carrier_hz: f64,
    /// In-phase (data) amplitude.
    pub amp_i: f64,
    /// Quadrature (pilot) amplitude.
    pub amp_q: f64,
}

/// Add `n` samples of one channel at `fs` to `out`, starting from `state`. `symbols(k)` gives
/// the 6000 frame symbols of frame `k`.
pub fn render<F>(out: &mut [Cf64], fs: f64, state: &ChannelState, chips: &NodeChips, mut symbols: F)
where
    F: FnMut(i64) -> std::rc::Rc<Vec<u8>>,
{
    let mut cached: Option<(i64, std::rc::Rc<Vec<u8>>)> = None;
    for (n, o) in out.iter_mut().enumerate() {
        let dt = n as f64 / fs;
        let ip = state.i_phase_chips + state.i_rate_cps * dt;
        let qp = state.q_phase_chips + state.q_rate_cps * dt;
        let ichip = ip.floor() as i64;
        let qchip = qp.floor() as i64;
        let sym_abs = ichip.div_euclid(I_CHIPS_PER_SYMBOL as i64);
        let frame = sym_abs.div_euclid(FRAME_SYMBOLS as i64);
        let sym = sym_abs.rem_euclid(FRAME_SYMBOLS as i64) as usize;
        let fr = match &cached {
            Some((k, f)) if *k == frame => f.clone(),
            _ => {
                let f = symbols(frame);
                cached = Some((frame, f.clone()));
                f
            }
        };
        let ci = chips.i_primary[ichip.rem_euclid(I_CHIPS_PER_SYMBOL as i64) as usize];
        let d = fr[sym];
        let cq = chips.q_tiered_chip(qchip.rem_euclid(Q_CHIPS_PER_FRAME as i64) as u64);
        let i = state.amp_i * chip_level(ci ^ d);
        let q = state.amp_q * chip_level(cq);
        let ph = (state.carrier_phase_cycles + state.carrier_hz * dt).rem_euclid(1.0);
        let (s, c) = (std::f64::consts::TAU * ph).sin_cos();
        o.re += i * c - q * s;
        o.im += i * s + q * c;
    }
}

/// One transmitting node in a recording.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct NodeSignal {
    /// The node's code assignment.
    pub codes: NodeCodes,
    /// Constant carrier Doppler (Hz); the code Doppler is coherent with it.
    pub doppler_hz: f64,
    /// Receiver time (s from the first sample) at which the leading edge of the frame with
    /// TOI `toi_at_arrival` arrives.
    pub frame_arrival_s: f64,
    /// TOI of that frame; TOI increments by one per frame, modulo 100.
    pub toi_at_arrival: u8,
    /// Composite carrier-to-noise density (dB-Hz), split 50/50 between AFS-I and AFS-Q.
    pub cn0_dbhz: f64,
    /// Carrier phase at the frame arrival (rad).
    pub carrier_phase_rad: f64,
    /// Seed of the subframe 2, 3 and 4 data bits.
    pub data_seed: u64,
}

/// A recording of one or more nodes.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct RecordingConfig {
    /// Complex sample rate (Hz).
    pub sample_rate_hz: f64,
    /// Duration (s).
    pub duration_s: f64,
    /// The transmitting nodes.
    pub nodes: Vec<NodeSignal>,
    /// Seed of the noise; `None` writes a noise-free recording.
    pub noise_seed: Option<u64>,
    /// Scale applied before rounding to 8 bits (samples have unit noise variance per
    /// dimension).
    pub ci8_scale: f64,
    /// Symmetric clip level of the 8-bit codes (at most 127). A receiver that keeps fewer
    /// bits needs a recording inside its range: PocketSDR stores 4 bits per component, so a
    /// recording for it is clipped at 7.
    pub ci8_clip: u8,
}

/// The data bits of frame `frame` (counted from the arrival frame) of a node.
pub fn frame_data(node: &NodeSignal, frame: i64) -> FrameData {
    let mut rng = ChaCha8Rng::seed_from_u64(
        node.data_seed ^ (frame as u64).wrapping_mul(0x9E37_79B9_7F4A_7C15),
    );
    let mut bits = |n: usize| (0..n).map(|_| rng.gen::<bool>() as u8).collect::<Vec<u8>>();
    FrameData {
        fid: 0,
        toi: (node.toi_at_arrival as i64 + frame).rem_euclid(100) as u8,
        sb2: bits(SB2_DATA_BITS),
        sb3: bits(SB34_DATA_BITS),
        sb4: bits(SB34_DATA_BITS),
    }
}

impl NodeSignal {
    /// The time-compression factor `1 + f_d / f_c` of the coherent code Doppler.
    pub fn code_scale(&self) -> f64 {
        1.0 + self.doppler_hz / CARRIER_HZ
    }

    /// Per-component amplitude for unit noise variance per dimension at `fs`: complex noise
    /// of total power 2 over a bandwidth `fs` has density `N0 = 2 / fs`, and each component
    /// carries half of `C = (C/N0) · N0`.
    pub fn component_amplitude(&self, fs: f64) -> f64 {
        let c = 10f64.powf(self.cn0_dbhz / 10.0) * 2.0 / fs;
        (c / 2.0).sqrt()
    }

    /// The channel state at receiver time `t` (s).
    pub fn state_at(&self, t: f64, fs: f64) -> ChannelState {
        let k = self.code_scale();
        let tau = (t - self.frame_arrival_s) * k; // transmit time since the frame edge
        let a = self.component_amplitude(fs);
        ChannelState {
            i_phase_chips: tau * I_CHIP_RATE_HZ,
            i_rate_cps: I_CHIP_RATE_HZ * k,
            q_phase_chips: tau * Q_CHIP_RATE_HZ,
            q_rate_cps: Q_CHIP_RATE_HZ * k,
            carrier_phase_cycles: self.carrier_phase_rad / std::f64::consts::TAU
                + self.doppler_hz * (t - self.frame_arrival_s),
            carrier_hz: self.doppler_hz,
            amp_i: a,
            amp_q: a,
        }
    }

    /// Receiver times of the leading edges of the frames that start inside `[0, duration)`,
    /// with their frame index (relative to the arrival frame).
    pub fn frame_edges(&self, duration_s: f64) -> Vec<(i64, f64)> {
        let period = FRAME_S / self.code_scale();
        let k0 = (-self.frame_arrival_s / period).ceil() as i64;
        (k0..)
            .map(|k| (k, self.frame_arrival_s + k as f64 * period))
            .take_while(|&(_, t)| t < duration_s)
            .filter(|&(_, t)| t >= 0.0)
            .collect()
    }
}

/// A recording generator that streams blocks in order (so the noise is independent of the
/// block size).
pub struct Generator {
    cfg: RecordingConfig,
    chips: Vec<NodeChips>,
    coder: FrameCoder,
    frames: Vec<BTreeMap<i64, std::rc::Rc<Vec<u8>>>>,
    noise: Option<ChaCha8Rng>,
    next_sample: u64,
}

impl Generator {
    /// Prepare the codes and frame coder of every node (needs the verified LSIS cache,
    /// [`super::lsis`]).
    pub fn new(cfg: RecordingConfig) -> Result<Self, String> {
        if !(cfg.sample_rate_hz.is_finite() && cfg.sample_rate_hz > 0.0) {
            return Err("sample rate must be positive".into());
        }
        let lsis = LsisCodes::load()?;
        let chips = cfg
            .nodes
            .iter()
            .map(|n| NodeChips::new(n.codes, &lsis))
            .collect::<Result<Vec<_>, _>>()?;
        Ok(Generator {
            frames: vec![BTreeMap::new(); cfg.nodes.len()],
            noise: cfg.noise_seed.map(ChaCha8Rng::seed_from_u64),
            chips,
            coder: FrameCoder::load()?,
            cfg,
            next_sample: 0,
        })
    }

    /// Total samples of the recording.
    pub fn total_samples(&self) -> u64 {
        (self.cfg.duration_s * self.cfg.sample_rate_hz).round() as u64
    }

    /// The next block of at most `n` complex samples (unit noise variance per dimension);
    /// empty at the end.
    pub fn next_block(&mut self, n: usize) -> Vec<Cf64> {
        let left = self.total_samples().saturating_sub(self.next_sample);
        let n = (n as u64).min(left) as usize;
        let mut out = vec![Cf64::new(0.0, 0.0); n];
        let fs = self.cfg.sample_rate_hz;
        let t0 = self.next_sample as f64 / fs;
        for (j, node) in self.cfg.nodes.iter().enumerate() {
            let st = node.state_at(t0, fs);
            let cache = &mut self.frames[j];
            let coder = &self.coder;
            render(&mut out, fs, &st, &self.chips[j], |k| {
                cache
                    .entry(k)
                    .or_insert_with(|| {
                        std::rc::Rc::new(coder.encode(&frame_data(node, k)).expect("frame encodes"))
                    })
                    .clone()
            });
        }
        if let Some(rng) = self.noise.as_mut() {
            for o in out.iter_mut() {
                o.re += rng.sample::<f64, _>(rand_distr::StandardNormal);
                o.im += rng.sample::<f64, _>(rand_distr::StandardNormal);
            }
        }
        self.next_sample += n as u64;
        out
    }

    /// Quantise a block to interleaved 8-bit I and Q (`ci8`), clipping at plus or minus
    /// `ci8_clip` (at most 127);
    /// returns the bytes and the number of clipped components.
    pub fn to_ci8(&self, block: &[Cf64]) -> (Vec<u8>, usize) {
        let mut clipped = 0;
        let mut q = |v: f64| {
            let x = (v * self.cfg.ci8_scale).round();
            let clip = self.cfg.ci8_clip.min(127) as f64;
            if x.abs() > clip {
                clipped += 1;
            }
            x.clamp(-clip, clip) as i8 as u8
        };
        let mut out = Vec::with_capacity(block.len() * 2);
        for s in block {
            out.push(q(s.re));
            out.push(q(s.im));
        }
        (out, clipped)
    }

    /// The SigMF metadata (JSON) of the recording, with the truth labels as `kshana_afs:`
    /// extension fields.
    pub fn sigmf_meta_json(&self) -> Result<String, String> {
        truth_meta_json(&self.cfg)
    }
}

/// The extension namespace of the truth labels.
pub const SIGMF_NAMESPACE: &str = "kshana_afs";

fn bits_hex(bits: &[u8]) -> String {
    // Left-padded with zeros to whole hexadecimal digits, first bit most significant.
    let pad = (4 - bits.len() % 4) % 4;
    let mut v = vec![0u8; pad];
    v.extend_from_slice(bits);
    v.chunks(4)
        .map(|c| format!("{:X}", c.iter().fold(0u8, |a, &b| (a << 1) | b)))
        .collect()
}

/// The truth labels of `cfg` as SigMF metadata.
pub fn truth_meta_json(cfg: &RecordingConfig) -> Result<String, String> {
    use crate::sigmf::{Annotation, DataType, Meta};
    use serde_json::{json, Map, Value};
    let ns = SIGMF_NAMESPACE;
    let fs = cfg.sample_rate_hz;
    let mut meta = Meta::new(
        DataType::Ci8,
        fs,
        CARRIER_HZ,
        &format!(
            "LunaNet Augmented Forward Signal baseband, {LSIS_VERSION}; Kshana reference generator"
        ),
    );
    let mut global = Map::new();
    global.insert(format!("{ns}:standard"), json!(LSIS_VERSION));
    global.insert(format!("{ns}:noise_seed"), json!(cfg.noise_seed));
    global.insert(
        format!("{ns}:noise_variance_per_dimension"),
        json!(if cfg.noise_seed.is_some() { 1.0 } else { 0.0 }),
    );
    global.insert(format!("{ns}:ci8_scale"), json!(cfg.ci8_scale));
    global.insert(format!("{ns}:ci8_clip"), json!(cfg.ci8_clip.min(127)));
    global.insert(
        format!("{ns}:scope"),
        json!("conformance to the standard and label consistency; not a channel, propagation or link-budget model"),
    );
    let mut ann_ext: Vec<Map<String, Value>> = Vec::new();
    let total = (cfg.duration_s * fs).round() as u64;
    for node in &cfg.nodes {
        meta.annotations.push(Annotation {
            sample_start: 0,
            sample_count: Some(total),
            freq_lower_edge: None,
            freq_upper_edge: None,
            label: Some(format!("AFS node {}", node.codes.node_id)),
            comment: None,
        });
        let mut m = Map::new();
        m.insert(format!("{ns}:kind"), json!("node"));
        m.insert(
            format!("{ns}:node"),
            serde_json::to_value(node).map_err(|e| e.to_string())?,
        );
        m.insert(
            format!("{ns}:component_cn0_dbhz"),
            json!(node.cn0_dbhz - 10.0 * 2f64.log10()),
        );
        m.insert(format!("{ns}:code_scale"), json!(node.code_scale()));
        // Time from the first sample to the next AFS-I primary-code epoch (s).
        let st = node.state_at(0.0, fs);
        let to_next = (-st.i_phase_chips).rem_euclid(I_PRIMARY_LEN as f64) / st.i_rate_cps;
        m.insert(format!("{ns}:first_i_code_epoch_s"), json!(to_next));
        ann_ext.push(m);
        for (k, t) in node.frame_edges(cfg.duration_s) {
            let f = frame_data(node, k);
            meta.annotations.push(Annotation {
                sample_start: (t * fs).floor() as u64,
                sample_count: Some(((FRAME_S / node.code_scale()) * fs).round() as u64),
                freq_lower_edge: None,
                freq_upper_edge: None,
                label: Some(format!(
                    "AFS node {} frame TOI {}",
                    node.codes.node_id, f.toi
                )),
                comment: None,
            });
            let mut m = Map::new();
            m.insert(format!("{ns}:kind"), json!("frame"));
            m.insert(format!("{ns}:node_id"), json!(node.codes.node_id));
            m.insert(format!("{ns}:frame_index"), json!(k));
            m.insert(format!("{ns}:arrival_s"), json!(t));
            m.insert(format!("{ns}:fid"), json!(f.fid));
            m.insert(format!("{ns}:toi"), json!(f.toi));
            m.insert(format!("{ns}:sb2_hex"), json!(bits_hex(&f.sb2)));
            m.insert(format!("{ns}:sb3_hex"), json!(bits_hex(&f.sb3)));
            m.insert(format!("{ns}:sb4_hex"), json!(bits_hex(&f.sb4)));
            ann_ext.push(m);
        }
    }
    // SigMF requires annotations in increasing `core:sample_start`; with several nodes the
    // per-node lists interleave, so sort the annotations and their extension maps together
    // (stable, so equal starts keep node order).
    let mut pairs: Vec<_> = meta.annotations.drain(..).zip(ann_ext).collect();
    pairs.sort_by_key(|(a, _)| a.sample_start);
    let (anns, ann_ext): (Vec<_>, Vec<_>) = pairs.into_iter().unzip();
    meta.annotations = anns;
    crate::sigmf::meta_to_json_with_extensions(&meta, ns, "0.1.0", &global, &ann_ext)
}

#[cfg(test)]
mod tests {
    use super::*;

    /// With several nodes, the SigMF annotations are in increasing `core:sample_start` (as the
    /// specification requires) and each keeps its own truth label.
    #[test]
    fn multi_node_annotations_are_sorted_by_sample_start() {
        let node = |id: u16, arr: f64| NodeSignal {
            codes: NodeCodes::interim(id).unwrap(),
            doppler_hz: 100.0,
            frame_arrival_s: arr,
            toi_at_arrival: 1,
            cn0_dbhz: 50.0,
            carrier_phase_rad: 0.0,
            data_seed: id as u64,
        };
        let cfg = RecordingConfig {
            sample_rate_hz: 1.0e6,
            duration_s: 30.0,
            nodes: vec![node(3, 4.0), node(8, 1.0)],
            noise_seed: None,
            ci8_scale: 1.0,
            ci8_clip: 127,
        };
        let js = truth_meta_json(&cfg).unwrap();
        let meta = crate::sigmf::parse_meta(&js).unwrap();
        let starts: Vec<u64> = meta.annotations.iter().map(|a| a.sample_start).collect();
        assert!(starts.windows(2).all(|w| w[0] <= w[1]), "{starts:?}");
        let (_, ext) = crate::sigmf::annotation_extension_fields(&js, SIGMF_NAMESPACE).unwrap();
        for (a, e) in meta.annotations.iter().zip(&ext) {
            let label = a.label.as_deref().unwrap();
            if let Some(id) = e.get("kshana_afs:node_id") {
                assert!(
                    label.starts_with(&format!("AFS node {id} frame TOI ")),
                    "{label}"
                );
            }
        }
    }
}
