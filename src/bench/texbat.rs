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
            // Acquisition once, on the recording's first millisecond (amended E5v2-4); PRNs searched
            // in parallel, kept in PRN order.
            let spe = (FS_HZ / 1000.0).round() as usize;
            let first = &iq[..spe];
            let found: Vec<Option<Tracked>> = std::thread::scope(|sc| {
                let hs: Vec<_> = (1u8..=32)
                    .map(|prn| {
                        let cfg = &cfg;
                        sc.spawn(move || {
                            let code = CaCode::new(prn)?;
                            let acq = sdr::acquire(
                                first,
                                &code,
                                cfg.fs_hz,
                                cfg.if_hz,
                                cfg.doppler_max_hz,
                                cfg.doppler_step_hz,
                                cfg.acq_threshold,
                            );
                            acq.acquired.then(|| Tracked {
                                state: TrackState::from_acquisition(&acq, cfg.if_hz),
                                code,
                            })
                        })
                    })
                    .collect();
                hs.into_iter().map(|h| h.join().ok().flatten()).collect()
            });
            tracked = found.into_iter().flatten().collect();
            eprintln!(
                "{}",
                crate::t!(
                    "bench-texbat-acquired",
                    name = name.as_str(),
                    prns = format!(
                        "{:?}",
                        tracked.iter().map(|t| t.code.prn).collect::<Vec<_>>()
                    )
                )
            );
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
        if w.is_multiple_of(30) {
            eprintln!(
                "{}",
                crate::t!("bench-texbat-progress", name = name.as_str(), seconds = w)
            );
        }
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

/// B4a E5-PD (`docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION-E5-PD.md`): the power
/// threshold `τ_ΔP`, dB.
pub const TAU_DP_DB: f64 = 1.0;
/// E5-PD: windows `0..BASELINE_WINDOWS` set each recording's power baseline and are not scored.
pub const BASELINE_WINDOWS: u64 = 60;

/// The E5-PD window score: `max(ΔP/τ_ΔP, max S/τ_S, max P/τ_P)` over the PRN statistics, `+∞` when
/// no PRN is tracked.
pub fn pd_score(dp_db: f64, stats: &[(f64, f64)], tau: (f64, f64)) -> f64 {
    if stats.is_empty() {
        return f64::INFINITY;
    }
    (dp_db / TAU_DP_DB).max(window_score(stats, tau))
}

/// The median of `v` (mean of the two middle values for an even count).
fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n == 0 {
        f64::NAN
    } else if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// E5-PD for one recording: stream it once (hash checked against the pinned manifest at the end;
/// nothing is returned on a mismatch), take each 1 s window's in-band power in dB, and combine it with
/// the distortion statistics of the recording's E5 v2 score document `windows`.
pub fn pd_file(path: &std::path::Path, windows: &Value) -> Result<Value, String> {
    let name = path
        .file_name()
        .and_then(|n| n.to_str())
        .ok_or_else(|| crate::terr!("e-bench-texbat-name"))?
        .to_string();
    let class = class_of(&name).ok_or_else(|| crate::terr!("e-bench-texbat-name"))?;
    let (want_bytes, want_sha) = pinned(&name)
        .ok_or_else(|| crate::terr!("e-bench-texbat-unpinned", name = name.as_str()))?;
    if windows["file"].as_str() != Some(name.as_str())
        || windows["sha256"].as_str() != Some(want_sha.as_str())
    {
        return Err(crate::terr!(
            "e-bench-texbat-pd-windows",
            name = name.as_str()
        ));
    }
    let win_bytes = FS_HZ as usize * 4;
    let mut f = std::fs::File::open(path).map_err(|e| e.to_string())?;
    let mut hasher = Sha256::new();
    let mut total: u64 = 0;
    let mut buf = vec![0u8; win_bytes];
    let mut power_db: Vec<f64> = Vec::new();
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
            break;
        }
        let mut acc = 0.0f64;
        for c in buf.chunks_exact(4) {
            let i = f64::from(i16::from_le_bytes([c[0], c[1]]));
            let q = f64::from(i16::from_le_bytes([c[2], c[3]]));
            acc += i * i + q * q;
        }
        let mean = acc / (win_bytes / 4) as f64;
        power_db.push(10.0 * crate::portable_math::PortableFloat::plog10(mean.max(1e-300)));
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
    let base_n = (BASELINE_WINDOWS as usize).min(power_db.len());
    let baseline = median(power_db[..base_n].to_vec());
    let tau = THRESHOLDS;
    let src = windows["windows"].as_array().cloned().unwrap_or_default();
    let out: Vec<Value> = power_db
        .iter()
        .enumerate()
        .map(|(w, &p)| {
            let w64 = w as u64;
            let stats: Vec<(f64, f64)> = src
                .get(w)
                .and_then(|x| x["prns"].as_array())
                .into_iter()
                .flatten()
                .filter_map(|p| Some((p["s"].as_f64()?, p["p"].as_f64()?)))
                .collect();
            let dp = p - baseline;
            let counted = w64 >= BASELINE_WINDOWS && (class == "nominal" || w64 >= ONSET_S);
            json!({
                "start_s": w64,
                "counted": counted,
                "power_db": p,
                "dp_db": dp,
                "score": finite_or_null(pd_score(dp, &stats, tau)),
            })
        })
        .collect();
    Ok(json!({
        "schema": "kshana-bench-texbat-pd/1",
        "file": name,
        "class": class,
        "bytes": total,
        "sha256": got,
        "onset_s": ONSET_S,
        "baseline_windows": BASELINE_WINDOWS,
        "baseline_db": baseline,
        "thresholds": {"tau_s": tau.0, "tau_p": tau.1, "tau_dp_db": TAU_DP_DB},
        "windows": out,
    }))
}

// ------------------------------------------------------------ the one score (E5 v2 and E5-PD)

/// A window score as a number: JSON `null` is `+∞` (no tracked PRN, E5v2-7).
fn score_value(w: &Value) -> f64 {
    w["score"].as_f64().unwrap_or(f64::INFINITY)
}

/// One-vs-rest AUC of `pos` against `neg` by the rank-sum rule: each (positive, negative) pair
/// counts 1 when the positive scores higher, 1/2 on a tie (two `+∞` tie). `None` when a class is
/// empty.
pub fn auc(pos: &[f64], neg: &[f64]) -> Option<f64> {
    if pos.is_empty() || neg.is_empty() {
        return None;
    }
    let mut n = neg.to_vec();
    n.sort_by(f64::total_cmp);
    let mut sum = 0.0;
    for &p in pos {
        let below = n.partition_point(|&x| x.total_cmp(&p).is_lt());
        let upto = n.partition_point(|&x| x.total_cmp(&p).is_le());
        sum += below as f64 + 0.5 * (upto - below) as f64;
    }
    Some(sum / (pos.len() as f64 * n.len() as f64))
}

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// The counted windows' scores of one score document, by start time.
fn counted(doc: &Value) -> Vec<(u64, f64)> {
    doc["windows"]
        .as_array()
        .into_iter()
        .flatten()
        .filter(|w| w["counted"].as_bool() == Some(true))
        .filter_map(|w| Some((w["start_s"].as_u64()?, score_value(w))))
        .collect()
}

/// E5 (v2 or PD) from the ten documents of one kind: the barred one-vs-rest AUC of `spoofing`
/// over the counted windows, the minimum-data check (2 recordings and 300 units per class),
/// and, with no bar, the recording-level AUC (each recording's median window score) and the AUC of
/// each spoofing recording against the two clean ones.
pub fn e5_score(docs: &[Value], bar: f64) -> Value {
    let mut pos = Vec::new();
    let mut neg = Vec::new();
    let mut rec_pos = Vec::new();
    let mut rec_neg = Vec::new();
    let mut per: Vec<(String, Vec<f64>)> = Vec::new();
    let (mut n_pos_rec, mut n_neg_rec) = (0usize, 0usize);
    for d in docs {
        let s: Vec<f64> = counted(d).into_iter().map(|(_, x)| x).collect();
        if s.is_empty() {
            continue;
        }
        let m = median(s.clone());
        if d["class"].as_str() == Some("spoofing") {
            n_pos_rec += 1;
            rec_pos.push(m);
            per.push((d["file"].as_str().unwrap_or("").to_string(), s.clone()));
            pos.extend(s);
        } else {
            n_neg_rec += 1;
            rec_neg.push(m);
            neg.extend(s);
        }
    }
    let enough = n_pos_rec >= 2 && n_neg_rec >= 2 && pos.len() >= 300 && neg.len() >= 300;
    let a = auc(&pos, &neg);
    let per_rec: serde_json::Map<String, Value> = per
        .iter()
        .map(|(f, s)| (f.clone(), json!(auc(s, &neg))))
        .collect();
    json!({
        "auc": a,
        "bar": bar,
        "verdict": match (enough, a) {
            (false, _) => "NOT ASSESSABLE",
            (true, Some(x)) if x >= bar => "MET",
            _ => "NOT MET",
        },
        "units": {"spoofing": pos.len(), "nominal": neg.len()},
        "recordings": {"spoofing": n_pos_rec, "nominal": n_neg_rec},
        "recording_level_auc": auc(&rec_pos, &rec_neg),
        "per_recording_auc": per_rec,
    })
}

/// E5 v2's AUC restricted to the windows E5-PD counts (reported with E5-PD, no bar).
pub fn e5v2_on_pd_windows(v2: &[Value], pd: &[Value]) -> Option<f64> {
    let mut pos = Vec::new();
    let mut neg = Vec::new();
    for p in pd {
        let keep: std::collections::BTreeSet<u64> = counted(p).into_iter().map(|(t, _)| t).collect();
        let Some(w) = v2.iter().find(|w| w["file"] == p["file"]) else {
            continue;
        };
        let s = w["windows"]
            .as_array()
            .into_iter()
            .flatten()
            .filter(|x| x["start_s"].as_u64().is_some_and(|t| keep.contains(&t)))
            .map(score_value);
        if p["class"].as_str() == Some("spoofing") {
            pos.extend(s);
        } else {
            neg.extend(s);
        }
    }
    auc(&pos, &neg)
}
