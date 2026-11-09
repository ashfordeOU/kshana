// SPDX-License-Identifier: AGPL-3.0-only
//! B4a E5 v2 (`docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION-E5-v2.md`, readings E5v2-1 to
//! E5v2-9 and the amendment to E5v2-4 in `xval/bench-e/README.md`): the B-iq window scores of one TEXBAT
//! recording, computed on the owner's computer. The file is streamed once: its SHA-256 and size are
//! checked against the pinned manifest at the end, and nothing is written on a mismatch. The output
//! holds window scores only, never IQ samples.

use crate::realdata::iqif::{self, FeatureStageConfig, IqFormat};
use crate::sdr::{self, CaCode, Cf64, CorrelatorDump, TrackState};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::io::Read;

/// Samples per second (25 Msps complex int16, E5v2-3).
pub const FS_HZ: f64 = 25_000_000.0;
/// Spoofing onset used for every spoofing recording, s (E5v2-2).
pub const ONSET_S: u64 = 110;
/// First epoch of a window that enters the statistics (E5v2-5: epochs 21 to 1 000).
pub const FIRST_EPOCH: usize = 20;
/// The synthetic thresholds `(τ_S, τ_P)` (E5v2-6, as amended): the 99th percentiles over the 61 of 64
/// synthetic windows that acquire, computed by `tests/texbat_e5v2.rs` on 9 November 2026 before any
/// TEXBAT byte was read.
pub const THRESHOLDS: (f64, f64) = (1.944_242_841_719_368_8e-1, 2.169_909_546_431_267_4);

/// The pinned manifest of the B-iq task (`bench/manifests/b-iq.json`), compiled in so the command
/// needs no repository checkout.
const MANIFEST: &str = include_str!("../../bench/manifests/b-iq.json");

/// The class of a TEXBAT file name (E5v2-1), or `None` for a name that is not one of the ten.
pub fn class_of(name: &str) -> Option<&'static str> {
    match name {
        "cleanStatic.bin" | "cleanDynamic.bin" => Some("nominal"),
        "ds1.bin" | "ds2.bin" | "ds3.bin" | "ds4.bin" | "ds5.bin" | "ds6.bin" | "ds7.bin"
        | "ds8.bin" => Some("spoofing"),
        _ => None,
    }
}

/// The pinned `(bytes, sha256)` of a TEXBAT file name, from the compiled-in manifest.
pub fn pinned(name: &str) -> Option<(u64, String)> {
    let m: Value = serde_json::from_str(MANIFEST).ok()?;
    m["sources"].as_array()?.iter().find_map(|s| {
        s["files"].as_array()?.iter().find_map(|f| {
            (f["path"].as_str()? == name).then(|| {
                (
                    f["bytes"].as_u64().unwrap_or(0),
                    f["sha256"].as_str().unwrap_or("").to_string(),
                )
            })
        })
    })
}

/// `(S, P)` of one PRN's window of dumps (E5v2-5): the mean early-minus-late imbalance and the
/// standard deviation of the prompt power in dB, over epochs 21 to 1 000.
pub fn window_stats(dumps: &[CorrelatorDump]) -> Option<(f64, f64)> {
    let d = dumps.get(FIRST_EPOCH..)?;
    if d.len() < 2 {
        return None;
    }
    let n = d.len() as f64;
    let s = d.iter().map(CorrelatorDump::el_imbalance).sum::<f64>() / n;
    let p: Vec<f64> = d
        .iter()
        .map(|x| 20.0 * crate::portable_math::PortableFloat::plog10(x.prompt.abs().max(1e-12)))
        .collect();
    let mean = p.iter().sum::<f64>() / n;
    let var = p.iter().map(|x| (x - mean) * (x - mean)).sum::<f64>() / (n - 1.0);
    Some((s, var.sqrt()))
}

/// The window score (E5v2-7) from each tracked PRN's `(S, P)`: the largest normalised statistic,
/// `+∞` when no PRN is tracked.
pub fn window_score(stats: &[(f64, f64)], tau: (f64, f64)) -> f64 {
    stats
        .iter()
        .map(|&(s, p)| (s / tau.0).max(p / tau.1))
        .fold(None, |a: Option<f64>, x| Some(a.map_or(x, |a| a.max(x))))
        .unwrap_or(f64::INFINITY)
}

/// One PRN being tracked through a recording.
struct Tracked {
    code: CaCode,
    state: TrackState,
}

/// Stream one recording window by window (E5v2-3, E5v2-4 as amended), hashing every byte, and return
/// the per-window document. `Err` on a read error, an unknown name, or a hash or size that differs
/// from the pinned manifest; then nothing is written.
pub fn score_file(path: &std::path::Path) -> Result<Value, String> {
    let name = path
        .file_name()
        .and_then(|n| n.to_str())
        .ok_or_else(|| crate::terr!("e-bench-texbat-name"))?
        .to_string();
    let class = class_of(&name).ok_or_else(|| crate::terr!("e-bench-texbat-name"))?;
    let (want_bytes, want_sha) = pinned(&name)
        .ok_or_else(|| crate::terr!("e-bench-texbat-unpinned", name = name.as_str()))?;
    let tau = THRESHOLDS;
    let cfg = FeatureStageConfig::texbat_like();
    let win_bytes = FS_HZ as usize * 4;
    let mut f = std::fs::File::open(path).map_err(|e| e.to_string())?;
    let mut hasher = Sha256::new();
    let mut total: u64 = 0;
    let mut buf = vec![0u8; win_bytes];
    let mut tracked: Vec<Tracked> = Vec::new();
    let mut windows = Vec::new();
    let mut w: u64 = 0;
    loop {
        let mut filled = 0;
        while filled < win_bytes {
            let k = f.read(&mut buf[filled..]).map_err(|e| e.to_string())?;
            if k == 0 {
                break;
            }
            filled += k;
        }
        hasher.update(&buf[..filled]);
        total += filled as u64;
        if filled < win_bytes {
            break; // a trailing partial window is dropped (E5v2-3)
        }
        let iq: Vec<Cf64> = iqif::load_iq(&buf, IqFormat::Int16Le);
        if w == 0 {
            // Acquisition once, on the recording's first millisecond (amended E5v2-4).
            let spe = (FS_HZ / 1000.0).round() as usize;
            for prn in 1u8..=32 {
                let Some(code) = CaCode::new(prn) else {
                    continue;
                };
                let acq = sdr::acquire(
                    &iq[..spe],
                    &code,
                    cfg.fs_hz,
                    cfg.if_hz,
                    cfg.doppler_max_hz,
                    cfg.doppler_step_hz,
                    cfg.acq_threshold,
                );
                if acq.acquired {
                    tracked.push(Tracked {
                        state: TrackState::from_acquisition(&acq, cfg.if_hz),
                        code,
                    });
                }
            }
        }
        // Each PRN's loop is independent: tracked in parallel, results in PRN order.
        let stats: Vec<(u8, Option<(f64, f64)>)> = std::thread::scope(|sc| {
            let handles: Vec<_> = tracked
                .iter_mut()
                .map(|t| {
                    let iq = &iq;
                    let cfg = &cfg;
                    sc.spawn(move || {
                        let d = sdr::track_continue(
                            iq,
                            &t.code,
                            &mut t.state,
                            cfg.fs_hz,
                            &cfg.track,
                            cfg.n_epochs,
                        );
                        (t.code.prn, window_stats(&d))
                    })
                })
                .collect();
            handles
                .into_iter()
                .map(|h| h.join().unwrap_or((0, None)))
                .collect()
        });
        let ok: Vec<(f64, f64)> = stats.iter().filter_map(|x| x.1).collect();
        let counted = class == "nominal" || w >= ONSET_S;
        windows.push(json!({
            "start_s": w,
            "counted": counted,
            "score": crate::bench::texbat::finite_or_null(window_score(&ok, tau)),
            "prns": stats.iter().map(|(p, v)| json!({"prn": p, "s": v.map(|x| x.0), "p": v.map(|x| x.1)})).collect::<Vec<_>>(),
        }));
        w += 1;
    }
    let got = hex::encode(hasher.finalize());
    if got != want_sha || total != want_bytes {
        return Err(crate::terr!(
            "e-bench-texbat-mismatch",
            name = name.as_str(),
            got = got.as_str(),
            bytes = total
        ));
    }
    Ok(json!({
        "schema": "kshana-bench-texbat-windows/1",
        "file": name,
        "class": class,
        "bytes": total,
        "sha256": got,
        "onset_s": ONSET_S,
        "thresholds": {"tau_s": tau.0, "tau_p": tau.1},
        "acquired_prns": tracked.iter().map(|t| t.code.prn).collect::<Vec<_>>(),
        "windows": windows,
    }))
}

/// A score as JSON: `null` stands for `+∞` (no tracked PRN, E5v2-7).
pub fn finite_or_null(x: f64) -> Value {
    if x.is_finite() {
        json!(x)
    } else {
        Value::Null
    }
}

/// The synthetic clean window of E5v2-6 number `i` (0 to 63) and the PRN it carries.
pub fn synthetic_window(i: usize) -> (Vec<Cf64>, u8) {
    let prn = (i % 32) as u8 + 1;
    let offset = if i < 32 { 1_500.0 } else { -2_500.0 };
    let code = CaCode::new(prn).expect("PRN 1 to 32");
    let sigma = (3.0 * FS_HZ / (4.0 * 10f64.powf(4.5))).sqrt();
    let iq = sdr::synth_if(
        &code,
        FS_HZ,
        offset,
        sdr::CA_CHIP_RATE_HZ,
        f64::from((17 * u32::from(prn)) % 1023),
        1.0,
        FS_HZ as usize,
        sigma,
        i as u64 + 1,
    );
    (iq, prn)
}

/// `(S, P)` of synthetic window `i`, acquired then tracked for 1 s (E5v2-4, E5v2-5), or `None` when
/// it does not acquire.
pub fn synthetic_stats(i: usize) -> Option<(f64, f64)> {
    let (iq, prn) = synthetic_window(i);
    let cfg = FeatureStageConfig::texbat_like();
    let dumps = iqif::dumps_for_prn(&iq, prn, &cfg)?;
    window_stats(&dumps)
}

/// The nearest-rank 99th percentile of `v` (E5v2-6).
pub fn p99(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    let k = ((0.99 * v.len() as f64).ceil() as usize).clamp(1, v.len());
    v[k - 1]
}
