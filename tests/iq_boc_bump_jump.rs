// SPDX-License-Identifier: AGPL-3.0-only
//! CAP-07 (a): opt-in BOC(1,1) tracking (DLL scaling and bump-jump) against the bars of
//! `docs/design/evidence/boc-bump-jump/PREREGISTRATION.md` (committed before any run).
//!
//! References: the injected truth of an `iq::scene` BeiDou B1C data signal (PRN 19, sine
//! BOC(1,1), seeded 10 ms data symbols, 5 MS/s complex, Doppler +1250 Hz, thermal noise) for
//! B1 to B4, and a correlator-level model with the exact BOC(1,1) noise covariance for B5.
//! No external receiver's output is compared. A bar that is missed is a finding: it is kept
//! as written in a test marked `#[ignore = "FINDING …"]` and recorded in `RESULTS.md`.

use kshana::iq::scene::{
    NavData, NoiseConfig, RangeProfile, SatGeometry, Scene, SceneConfig, SceneSatellite,
    TruthRecord,
};
use kshana::iq::signals::{beidou, SignalCode};
use kshana::iq::track::discrim::DllDiscriminator;
use kshana::iq::track::{
    BocKind, BocTracking, BumpJump, BumpJumpConfig, BumpJumpEvent, CarrierLoop, Channel,
    ChannelInit, EpochOutput, LoopConfig,
};
use kshana::iq::{Cf64, IqError, IqSink, SampleSpec, SpreadingCode, C_M_PER_S};
use std::sync::Arc;

const PRN: u16 = 19;
const FS_HZ: f64 = 5.0e6;
const DOPPLER_HZ: f64 = 1250.0;
const INIT_DOPPLER_ERR_HZ: f64 = 2.0;
const SPACING: f64 = 0.2;
const SEED: u64 = 0xB0C1;

fn code() -> SignalCode {
    beidou::b1c_data(PRN).unwrap()
}

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS_HZ,
        center_hz: code().carrier_hz(),
        if_hz: 0.0,
    }
}

/// The pre-registered loop: 1-period (10 ms) integration, EMLP DLL `d = 0.2` first order
/// 1 Hz carrier-aided, Costas (atan) PLL second order 10 Hz with a first-order 5 Hz FLL during
/// pull-in, default lock thresholds; `boc` as given.
fn loop_config(label: &str, boc: Option<BocTracking>) -> LoopConfig {
    LoopConfig {
        label: label.into(),
        coherent_periods: 1,
        spacing_chips: SPACING,
        dll: DllDiscriminator::EarlyMinusLatePower,
        dll_order: 1,
        dll_bn_hz: 1.0,
        carrier_aiding: true,
        carrier: CarrierLoop::FllAssistedPll {
            pll_order: 2,
            pll_bn_hz: 10.0,
            fll_order: 1,
            fll_bn_hz: 5.0,
        },
        boc,
        ..LoopConfig::default()
    }
}

/// One channel of a run: its start offset (replica minus truth, chips), how long it is fed,
/// and what it produced.
struct Run {
    label: String,
    offset_chips: f64,
    until_s: f64,
    channel: Channel,
    epochs: Vec<EpochOutput>,
}

/// Feeds the scene's samples to every channel as they are generated (no stored stream).
struct Fanout<'a> {
    runs: &'a mut [Run],
    n: u64,
}

impl IqSink for Fanout<'_> {
    fn write(&mut self, block: &[Cf64]) -> Result<(), IqError> {
        let t0 = self.n as f64 / FS_HZ;
        for r in self.runs.iter_mut() {
            if t0 >= r.until_s {
                continue;
            }
            let room = ((r.until_s * FS_HZ).round() as u64 - self.n) as usize;
            let take = room.min(block.len());
            r.channel.process(&block[..take], &mut r.epochs);
        }
        self.n += block.len() as u64;
        Ok(())
    }
}

/// Generate one scene at `cn0_dbhz` (`noise` on or off) of `duration_s` and track it with
/// every `(label, offset, until, config)`; returns the runs and the truth.
fn track(
    cn0_dbhz: f64,
    noise: bool,
    duration_s: f64,
    setups: Vec<(String, f64, f64, LoopConfig)>,
) -> (Vec<Run>, Vec<TruthRecord>) {
    let spec = spec();
    let tx = code();
    let mut cfg = SceneConfig::new(spec, duration_s);
    cfg.seed = SEED ^ (cn0_dbhz as u64);
    cfg.threads = 2;
    cfg.noise = NoiseConfig {
        enabled: noise,
        ..cfg.noise
    };
    let mut scene = Scene::new(cfg).unwrap();
    let lambda = C_M_PER_S / tx.carrier_hz();
    scene.add_satellite(SceneSatellite {
        id: PRN as u32,
        code: Box::new(tx.clone()),
        geometry: SatGeometry::Profile(RangeProfile {
            range_m: 2.1e7,
            range_rate_mps: -DOPPLER_HZ * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        }),
        cn0_dbhz: Some(cn0_dbhz),
        nav: NavData::Seeded { seed: SEED },
    });
    // The channels start from the truth at t = 0, which is deterministic in the geometry: a
    // 2 ms noise-free scene of the same satellite gives it before the run.
    let t0 = truth_at_start(&tx);
    let len = tx.len_chips() as f64;
    let rx: Arc<dyn SpreadingCode + Send + Sync> = Arc::new(tx.clone());
    let mut runs: Vec<Run> = setups
        .into_iter()
        .map(|(label, offset, until_s, lc)| {
            let init = ChannelInit {
                code: rx.clone(),
                code_phase_chips: (t0.code_phase_chips + offset).rem_euclid(len),
                doppler_hz: t0.doppler_hz + INIT_DOPPLER_ERR_HZ,
                periods_per_bit: Some(1),
            };
            Run {
                label,
                offset_chips: offset,
                until_s,
                channel: Channel::new(&spec, &init, &lc).unwrap(),
                epochs: Vec::new(),
            }
        })
        .collect();
    let mut truth = Vec::new();
    let mut sink = Fanout {
        runs: &mut runs,
        n: 0,
    };
    scene.generate(&mut sink, &mut truth).unwrap();
    (runs, truth)
}

fn truth_at_start(tx: &SignalCode) -> TruthRecord {
    let mut cfg = SceneConfig::new(spec(), 0.002);
    cfg.noise.enabled = false;
    let mut scene = Scene::new(cfg).unwrap();
    let lambda = C_M_PER_S / tx.carrier_hz();
    scene.add_satellite(SceneSatellite {
        id: PRN as u32,
        code: Box::new(tx.clone()),
        geometry: SatGeometry::Profile(RangeProfile {
            range_m: 2.1e7,
            range_rate_mps: -DOPPLER_HZ * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        }),
        cn0_dbhz: Some(45.0),
        nav: NavData::None,
    });
    let mut truth: Vec<TruthRecord> = Vec::new();
    struct Null;
    impl IqSink for Null {
        fn write(&mut self, _b: &[Cf64]) -> Result<(), IqError> {
            Ok(())
        }
    }
    scene.generate(&mut Null, &mut truth).unwrap();
    *truth.iter().find(|t| t.t_s == 0.0).unwrap()
}

/// Signed `a − b` wrapped into `(−len/2, len/2]`.
fn wrap_diff(a: f64, b: f64, len: f64) -> f64 {
    let d = (a - b).rem_euclid(len);
    if d > len / 2.0 {
        d - len
    } else {
        d
    }
}

/// Truth code phase at stream time `t_s` from the truth record at or before it, carried
/// forward at its Doppler-scaled chip rate (truth records are 1 ms apart).
fn truth_phase(truth: &[TruthRecord], code: &SignalCode, t_s: f64) -> f64 {
    let k = truth.partition_point(|r| r.t_s <= t_s).max(1) - 1;
    let r = &truth[k];
    let rate = code.chip_rate_hz() * (1.0 + r.doppler_hz / code.carrier_hz());
    r.code_phase_chips + rate * (t_s - r.t_s)
}

/// Code error (replica minus truth, chips) of every epoch, with its time (s).
fn code_errors(run: &Run, truth: &[TruthRecord]) -> Vec<(f64, f64)> {
    let c = code();
    let len = c.len_chips() as f64;
    run.epochs
        .iter()
        .map(|e| {
            let t = e.sample_index as f64 / FS_HZ;
            (
                t,
                wrap_diff(e.code_phase_chips, truth_phase(truth, &c, t), len),
            )
        })
        .collect()
}

fn window(errs: &[(f64, f64)], t0: f64, t1: f64) -> Vec<f64> {
    errs.iter()
        .filter(|(t, _)| *t >= t0 && *t < t1)
        .map(|(_, e)| *e)
        .collect()
}

fn mean(v: &[f64]) -> f64 {
    v.iter().sum::<f64>() / v.len() as f64
}

fn rms(v: &[f64]) -> f64 {
    (v.iter().map(|x| x * x).sum::<f64>() / v.len() as f64).sqrt()
}

fn jumps(run: &Run) -> &[BumpJumpEvent] {
    run.channel.bump_jumps()
}

/// What B1/B2/B3 measure on one run.
struct Measured {
    label: String,
    offset: f64,
    mean_late: f64,
    rms_late: f64,
    jumps: Vec<(f64, f64)>,
}

impl std::fmt::Display for Measured {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(
            f,
            "{} (start {:+.1} chip): late-window mean {:+.4} chip, RMS {:.4} chip, jumps {:?}",
            self.label, self.offset, self.mean_late, self.rms_late, self.jumps
        )
    }
}

fn measure(run: &Run, truth: &[TruthRecord], t0: f64, t1: f64) -> Measured {
    let w = window(&code_errors(run, truth), t0, t1);
    assert!(
        w.len() > 50,
        "{}: only {} epochs in window",
        run.label,
        w.len()
    );
    Measured {
        label: run.label.clone(),
        offset: run.offset_chips,
        mean_late: mean(&w),
        rms_late: rms(&w),
        jumps: jumps(run)
            .iter()
            .map(|j| (j.code_epoch_s, j.jump_chips))
            .collect(),
    }
}

/// B2's checks on one run; returns the failed parts.
fn b2_fails(m: &Measured) -> Vec<String> {
    let mut f = Vec::new();
    match m.jumps.first() {
        None => f.push("no jump".into()),
        Some(&(t, j)) => {
            if t > 0.5 {
                f.push(format!("first jump at {t:.3} s > 0.5 s"));
            }
            if j.signum() == m.offset.signum() {
                f.push(format!("first jump {j:+} away from the main peak"));
            }
        }
    }
    if m.jumps.len() != 1 {
        f.push(format!("{} jumps, not exactly one", m.jumps.len()));
    }
    if m.rms_late > 0.05 {
        f.push(format!("RMS {:.4} > 0.05 chip", m.rms_late));
    }
    f
}

/// B1, B2 (at 45 and 35 dB-Hz) and B3 (at 35, 40 and 45 dB-Hz) on the IQ chain: one scene
/// per C/N0, every channel fed from it as it is generated.
#[test]
fn b1_b2_b3_side_peak_and_false_jumps_on_the_iq_chain() {
    let mut fails: Vec<String> = Vec::new();
    for cn0 in [45.0, 40.0, 35.0] {
        let mut setups = Vec::new();
        if cn0 == 45.0 {
            for off in [0.5, -0.5] {
                setups.push((format!("B1 off {cn0}"), off, 3.0, loop_config("off", None)));
            }
        }
        if cn0 != 40.0 {
            for off in [0.5, -0.5] {
                setups.push((
                    format!("B2 on {cn0}"),
                    off,
                    3.0,
                    loop_config("on", Some(BocTracking::boc11())),
                ));
            }
        }
        setups.push((
            format!("B3 on {cn0}"),
            0.0,
            4.0,
            loop_config("on", Some(BocTracking::boc11())),
        ));
        let (runs, truth) = track(cn0, true, 4.0, setups);
        for run in &runs {
            if run.label.starts_with("B1") {
                let m = measure(run, &truth, 2.0, 3.0);
                eprintln!("{m}");
                let ok = (0.40..=0.70).contains(&m.mean_late.abs())
                    && m.mean_late.signum() == m.offset.signum()
                    && m.jumps.is_empty();
                if !ok {
                    fails.push(format!("B1: {m}"));
                }
            } else if run.label.starts_with("B2") {
                let m = measure(run, &truth, 2.0, 3.0);
                eprintln!("{m}");
                let f = b2_fails(&m);
                if !f.is_empty() {
                    fails.push(format!("B2: {m}: {}", f.join("; ")));
                }
            } else {
                let m = measure(run, &truth, 2.0, 4.0);
                eprintln!("{m}");
                if !m.jumps.is_empty() || m.rms_late > 0.05 {
                    fails.push(format!("B3: {m}"));
                }
            }
        }
    }
    assert!(fails.is_empty(), "missed bars:\n{}", fails.join("\n"));
}

/// B4 on the sampled signal: noise-free B1C at 5 MS/s, replica offset by `ε` (the
/// discriminator's sign: truth minus replica), `d = 0.2`, EMLP. The DLL is held open
/// (bandwidth 1e-9 Hz) so that each reading is of the stated offset; the readings are
/// averaged over loop updates 1 to 10 (update 0 integrates a part period).
#[test]
fn b4_scaling_on_the_sampled_signal() {
    let open = |boc: Option<BocTracking>| LoopConfig {
        dll_bn_hz: 1e-9,
        ..loop_config("b4", boc)
    };
    let scaling_only = BocTracking {
        kind: BocKind::SineBoc11,
        bump_jump: None,
    };
    let eps = [-0.06, -0.03, 0.03, 0.06];
    let mut setups = Vec::new();
    for &e in &eps {
        setups.push((format!("scaled {e:+}"), -e, 0.12, open(Some(scaling_only))));
        setups.push((format!("bpsk {e:+}"), -e, 0.12, open(None)));
    }
    let (runs, _truth) = track(45.0, false, 0.12, setups);
    let mut fails = Vec::new();
    for run in &runs {
        let e = -run.offset_chips;
        let r: Vec<f64> = run.epochs[1..=10]
            .iter()
            .map(|x| x.disc.dll_chips)
            .collect();
        let slope = mean(&r) / e;
        eprintln!(
            "B4 {}: reading {:+.5} chip, slope {slope:.4}",
            run.label,
            mean(&r)
        );
        let ok = if run.label.starts_with("scaled") {
            (0.9..=1.1).contains(&slope)
        } else {
            slope > 3.0
        };
        if !ok {
            fails.push(format!("{}: slope {slope:.4}", run.label));
        }
    }
    assert!(fails.is_empty(), "B4 missed: {fails:?}");
}

// ---- B5: the detector alone on correlator triples. ----

/// SplitMix64 and Box-Muller: a seeded standard normal stream.
struct Normal {
    s: u64,
    spare: Option<f64>,
}

impl Normal {
    fn new(seed: u64) -> Self {
        Self {
            s: seed,
            spare: None,
        }
    }
    fn u(&mut self) -> f64 {
        self.s = self.s.wrapping_add(0x9e37_79b9_7f4a_7c15);
        let mut z = self.s;
        z = (z ^ (z >> 30)).wrapping_mul(0xbf58_476d_1ce4_e5b9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94d0_49bb_1331_11eb);
        z ^= z >> 31;
        ((z >> 11) as f64 + 0.5) / (1u64 << 53) as f64
    }
    fn next(&mut self) -> f64 {
        if let Some(x) = self.spare.take() {
            return x;
        }
        let (u1, u2) = (self.u(), self.u());
        let r = (-2.0 * u1.ln()).sqrt();
        let th = std::f64::consts::TAU * u2;
        self.spare = Some(r * th.sin());
        r * th.cos()
    }
}

/// One `(VE, P, VL)` triple: means `a·(R(ε+0.5), R(ε), R(ε−0.5))` plus complex noise of unit
/// variance per component whose correlation matrix is the BOC(1,1) autocorrelation at the
/// tap separations (`R(0.5) = −0.5` between P and each of VE and VL, `R(1) = 0` between VE
/// and VL), built by a Cholesky factor.
fn triple(g: &mut Normal, a: f64, eps: f64) -> (Cf64, Cf64, Cf64) {
    let k = BocKind::SineBoc11;
    // Cholesky of [[1, -.5, -.5], [-.5, 1, 0], [-.5, 0, 1]] in the order (P, VE, VL).
    let l21: f64 = -0.5;
    let l22 = (1.0 - l21 * l21).sqrt();
    let l31: f64 = -0.5;
    let l32 = (0.0 - l31 * l21) / l22;
    let l33 = (1.0 - l31 * l31 - l32 * l32).sqrt();
    let mut comp = || {
        let (z1, z2, z3) = (g.next(), g.next(), g.next());
        (z1, l21 * z1 + l22 * z2, l31 * z1 + l32 * z2 + l33 * z3)
    };
    let (pr, ver, vlr) = comp();
    let (pi, vei, vli) = comp();
    let ve = Cf64::new(a * k.autocorrelation(eps + 0.5) + ver, vei);
    let p = Cf64::new(a * k.autocorrelation(eps) + pr, pi);
    let vl = Cf64::new(a * k.autocorrelation(eps - 0.5) + vlr, vli);
    (ve, p, vl)
}

/// Signal amplitude per update for unit noise variance per component: `a²/2 = C/N0 · T`.
fn amplitude(cn0_dbhz: f64) -> f64 {
    (2.0 * 10f64.powf(cn0_dbhz / 10.0) * 0.010).sqrt()
}

fn false_jumps(cn0_dbhz: f64, updates: usize) -> usize {
    let mut g = Normal::new(SEED ^ (cn0_dbhz.to_bits()));
    let mut b = BumpJump::new(BumpJumpConfig::default());
    let a = amplitude(cn0_dbhz);
    (0..updates)
        .filter(|_| {
            let (ve, p, vl) = triple(&mut g, a, 0.0);
            b.update(ve, p, vl) != 0
        })
        .count()
}

#[test]
fn b5_false_jump_rate_and_detection_at_correlator_level() {
    let mut fails = Vec::new();
    for cn0 in [45.0, 40.0, 35.0, 30.0, 25.0] {
        let n = false_jumps(cn0, 100_000);
        eprintln!("B5 false jumps at {cn0} dB-Hz over 100 000 updates: {n}");
        let max = if cn0 == 25.0 { 1 } else { 0 };
        if n > max {
            fails.push(format!("{cn0} dB-Hz: {n} false jumps > {max}"));
        }
    }
    // Detection: side peak at +0.5 chip (replica ahead), 1000 trials of 50 updates.
    let mut g = Normal::new(SEED ^ 0xDE7E);
    let a = amplitude(35.0);
    let (mut detected, mut wrong) = (0, 0);
    for _ in 0..1000 {
        let mut b = BumpJump::new(BumpJumpConfig::default());
        for _ in 0..50 {
            let (ve, p, vl) = triple(&mut g, a, 0.5);
            match b.update(ve, p, vl) {
                0 => continue,
                -1 => detected += 1,
                _ => wrong += 1,
            }
            break;
        }
    }
    eprintln!("B5 detection at 35 dB-Hz: {detected}/1000 towards the main peak, {wrong} away");
    if detected < 990 || wrong > 0 {
        fails.push(format!("detection {detected}/1000, {wrong} away"));
    }
    assert!(fails.is_empty(), "B5 missed: {fails:?}");
}
