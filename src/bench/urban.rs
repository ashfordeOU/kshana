// SPDX-License-Identifier: AGPL-3.0-only
//! Task (h) of kshana-bench (spec 2.3.0): urban positioning accuracy on the UrbanNav sequences
//! (IPNL, The Hong Kong Polytechnic University; MIT licence as the publisher's README states it,
//! `bench/manifests/datasets.json`), in two editions scored separately, never pooled: Hong Kong
//! (`scripts/fetch_urbannav.sh`, truth `ground_truth.txt`) and Tokyo
//! (`scripts/fetch_urbannav_tokyo.sh`, truth `tk_reference.csv`). A data directory holds one edition.
//!
//! The unit is one epoch of one trace (`<sequence>/<receiver>`); the truth is the sequence's
//! `ground_truth.txt`, the publisher's NovAtel SPAN-CPT reference trajectory at 1 Hz; a submission
//! gives a latitude and longitude for every truth epoch. The metric is the one of task (g): per
//! trace, the mean of the 50th and 95th percentile horizontal errors (haversine on a 6,371,000 m
//! sphere), averaged over the traces ([`super::smartphone::score_g`]). Splits are drawn per
//! sequence ([`h_splits`]), so the receivers of one sequence never fall in two splits. The data are fetched by
//! `scripts/fetch_urbannav.sh` with every file's SHA-256 pinned, and never committed.
//!
//! The ground truth is public, so this task has no holdout split (as for task (f)): the sequences
//! are divided between test and dev only. Every score is MODELLED: the truth is the publisher's
//! reference trajectory, whose own error is not removed, and a score describes these sequences,
//! never a receiver or a product.

use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

use serde_json::{json, Map, Value};

use super::smartphone::{Fix, Traces};
use super::{err, sha256_hex, BenchError, Split, PREDICTIONS_SCHEMA, TRUTH_SCHEMA};

/// Spec version of task (h), added as a minor version.
pub const SPEC_VERSION_H: &str = "kshana-bench/2.3.0";

/// The receivers of a sequence directory, by file stem (`<stem>.obs`, `<stem>.nmea`): the Hong Kong
/// edition has the first two, the Tokyo edition the u-blox F9P and the Trimble NetR9.
pub const RECEIVERS: [&str; 3] = ["ublox-f9p", "xiaomi-mi8", "trimble-netr9"];

/// The truth file of a sequence of the Hong Kong edition (`scripts/fetch_urbannav.sh`).
pub const TRUTH_HK: &str = "ground_truth.txt";
/// The truth file of a sequence of the Tokyo edition (`scripts/fetch_urbannav_tokyo.sh`).
pub const TRUTH_TOKYO: &str = "tk_reference.csv";

/// The task (h) baselines: the receiver's own NMEA GGA fix, and the engine's code single-point
/// solution ([`crate::pvt::run_pvt`]) from the receiver's RINEX observations and the day's broadcast
/// navigation file, each taken at the nearest epoch.
pub const H_BASELINES: [&str; 2] = ["provided-nmea", "kshana-spp"];

/// Elevation mask of the second `kshana-spp` pass, degrees (the solver's default).
pub const SPP_MASK_DEG: f64 = 10.0;

/// Read a text file; bytes that are not UTF-8 (a receiver log can interleave binary messages with
/// its NMEA) become U+FFFD and the lines they are on are skipped by the parsers.
fn read(p: &Path) -> Result<String, BenchError> {
    std::fs::read(p)
        .map(|b| String::from_utf8_lossy(&b).into_owned())
        .map_err(|e| {
            BenchError(crate::t!(
                "bench-cli-cannot-read",
                p = p.display().to_string(),
                e = e.to_string()
            ))
        })
}

/// A signed degrees, minutes, seconds angle from three tokens; the sign is the first token's.
fn dms(d: &str, m: &str, s: &str) -> Option<f64> {
    let (dv, mv, sv) = (
        d.parse::<f64>().ok()?,
        m.parse::<f64>().ok()?,
        s.parse::<f64>().ok()?,
    );
    let x = dv.abs() + mv / 60.0 + sv / 3600.0;
    let v = if d.starts_with('-') { -x } else { x };
    v.is_finite().then_some(v)
}

/// Read an UrbanNav ground-truth file (`UTCTime Week GPSTime Latitude(D M S) Longitude(D M S)
/// H-Ell ...`, whitespace separated, two header lines). UTCTime is Unix seconds in UTC.
pub fn h_truth_of(file: &str, text: &str) -> Result<Vec<Fix>, BenchError> {
    let mut v = Vec::new();
    for (i, line) in text.lines().enumerate() {
        let f: Vec<&str> = line.split_whitespace().collect();
        if f.is_empty() || f[0].parse::<f64>().is_err() {
            continue;
        }
        let bad = || {
            BenchError(crate::t!(
                "bench-data-bad-value",
                file = file,
                line = i + 1,
                column = "UTCTime Latitude Longitude"
            ))
        };
        if f.len() < 10 {
            return Err(bad());
        }
        let t = f[0]
            .parse::<f64>()
            .ok()
            .filter(|x| x.is_finite())
            .ok_or_else(bad)?;
        let lat = dms(f[3], f[4], f[5]).ok_or_else(bad)?;
        let lon = dms(f[6], f[7], f[8]).ok_or_else(bad)?;
        v.push(((t * 1000.0).round() as i64, lat, lon));
    }
    if v.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = file));
    }
    v.sort_by_key(|f| f.0);
    v.dedup_by_key(|f| f.0);
    Ok(v)
}

/// Read an UrbanNav Tokyo reference file (the publisher's `reference.csv`, laid out as
/// `tk_reference.csv`; Applanix POS LV620 at 10 Hz: columns
/// `GPS TOW (s)`, `GPS Week`, `Latitude (deg)`, `Longitude (deg)`, ...). Only whole-second epochs
/// are kept, so the truth is 1 Hz as in the Hong Kong edition; GPS time becomes Unix UTC
/// milliseconds with [`GPS_MINUS_UTC_S`].
pub fn h_truth_tokyo_of(file: &str, text: &str) -> Result<Vec<Fix>, BenchError> {
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let header: Vec<&str> = lines
        .next()
        .ok_or_else(|| BenchError(crate::t!("bench-data-no-header", file = file)))?
        .split(',')
        .map(str::trim)
        .collect();
    let col = |name: &str| {
        header.iter().position(|h| *h == name).ok_or_else(|| {
            BenchError(crate::t!(
                "bench-data-no-column",
                file = file,
                column = name
            ))
        })
    };
    let (ct, cw, cla, clo) = (
        col("GPS TOW (s)")?,
        col("GPS Week")?,
        col("Latitude (deg)")?,
        col("Longitude (deg)")?,
    );
    let mut v = Vec::new();
    for (i, line) in lines.enumerate() {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        let num = |c: usize, name: &str| {
            f.get(c)
                .and_then(|x| x.parse::<f64>().ok())
                .filter(|x| x.is_finite())
                .ok_or_else(|| {
                    BenchError(crate::t!(
                        "bench-data-bad-value",
                        file = file,
                        line = i + 2,
                        column = name
                    ))
                })
        };
        let tow = num(ct, "GPS TOW (s)")?;
        let ms_tow = (tow * 1000.0).round() as i64;
        if ms_tow % 1000 != 0 {
            continue;
        }
        let week = num(cw, "GPS Week")? as i64;
        let unix_ms = (GPS_EPOCH_UNIX_S + week * 604_800 - GPS_MINUS_UTC_S) * 1000 + ms_tow;
        v.push((
            unix_ms,
            num(cla, "Latitude (deg)")?,
            num(clo, "Longitude (deg)")?,
        ));
    }
    if v.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = file));
    }
    v.sort_by_key(|f| f.0);
    v.dedup_by_key(|f| f.0);
    Ok(v)
}

/// Unix time of the GPS epoch, 1980-01-06T00:00:00Z, s.
pub const GPS_EPOCH_UNIX_S: i64 = 315_964_800;

/// The truth of one sequence directory, whichever edition it belongs to.
fn sequence_truth(dir: &Path) -> Result<Vec<Fix>, BenchError> {
    let hk = dir.join(TRUTH_HK);
    if hk.is_file() {
        return h_truth_of(&hk.display().to_string(), &read(&hk)?);
    }
    let tk = dir.join(TRUTH_TOKYO);
    h_truth_tokyo_of(&tk.display().to_string(), &read(&tk)?)
}

/// The traces under `root`: `(trace id, sequence name, sequence directory)`, sorted.
fn trace_dirs(root: &Path) -> Result<Vec<(String, String, PathBuf)>, BenchError> {
    let mut seqs: Vec<PathBuf> = std::fs::read_dir(root)
        .map_err(|e| {
            BenchError(crate::t!(
                "bench-cli-cannot-read",
                p = root.display().to_string(),
                e = e.to_string()
            ))
        })?
        .flatten()
        .map(|e| e.path())
        .filter(|p| p.join(TRUTH_HK).is_file() || p.join(TRUTH_TOKYO).is_file())
        .collect();
    seqs.sort();
    // One directory holds one edition: the splits are drawn among its own sequences, so mixing
    // editions would move the frozen splits of either.
    let hk = seqs.iter().any(|p| p.join(TRUTH_HK).is_file());
    let tk = seqs.iter().any(|p| p.join(TRUTH_TOKYO).is_file());
    if hk && tk {
        return err(crate::t!(
            "bench-h-mixed-editions",
            root = root.display().to_string()
        ));
    }
    let mut out = Vec::new();
    for s in seqs {
        let name = s
            .file_name()
            .unwrap_or_default()
            .to_string_lossy()
            .to_string();
        for r in RECEIVERS {
            if s.join(format!("{r}.obs")).is_file() || s.join(format!("{r}.nmea")).is_file() {
                out.push((format!("{name}/{r}"), name.clone(), s.clone()));
            }
        }
    }
    if out.is_empty() {
        return err(crate::t!(
            "bench-h-no-sequences",
            root = root.display().to_string()
        ));
    }
    Ok(out)
}

/// The split of each sequence: sorted by the SHA-256 of the name, the first half (rounded up) is
/// test and the rest dev. There is no holdout: the truth is public.
pub fn h_splits(sequences: &[String]) -> BTreeMap<String, Split> {
    let mut v: Vec<(String, &String)> = sequences
        .iter()
        .map(|s| (sha256_hex(s.as_bytes()), s))
        .collect();
    v.sort();
    v.dedup_by(|a, b| a.1 == b.1);
    let half = v.len().div_ceil(2);
    v.iter()
        .enumerate()
        .map(|(i, (_, s))| {
            let split = if i < half { Split::Test } else { Split::Dev };
            ((*s).clone(), split)
        })
        .collect()
}

/// Read the traces of `split` under `root`, with each trace's sequence directory.
pub fn h_load(
    root: &Path,
    split: Split,
) -> Result<(Traces, BTreeMap<String, PathBuf>), BenchError> {
    if split == Split::Holdout {
        return err(crate::t!("bench-task-has-no-holdout", task = "h"));
    }
    let dirs = trace_dirs(root)?;
    let mut seqs: Vec<String> = dirs.iter().map(|d| d.1.clone()).collect();
    seqs.dedup();
    let splits = h_splits(&seqs);
    let (mut traces, mut where_) = (Traces::new(), BTreeMap::new());
    let mut truth_of: BTreeMap<String, Vec<Fix>> = BTreeMap::new();
    for (id, seq, dir) in dirs {
        if splits.get(&seq) != Some(&split) {
            continue;
        }
        if !truth_of.contains_key(&seq) {
            truth_of.insert(seq.clone(), sequence_truth(&dir)?);
        }
        traces.insert(id.clone(), truth_of[&seq].clone());
        where_.insert(id, dir);
    }
    Ok((traces, where_))
}

fn doc(schema: &str, split: Split) -> Map<String, Value> {
    let mut m = Map::new();
    m.insert("schema".into(), json!(schema));
    m.insert("task".into(), json!("h"));
    m.insert("split".into(), json!(split.name()));
    m.insert("spec_version".into(), json!(SPEC_VERSION_H));
    m
}

/// The truth file of a split.
pub fn h_truth_json(traces: &Traces, split: Split) -> Value {
    let mut m = doc(TRUTH_SCHEMA, split);
    m.insert("radius_m".into(), json!(super::smartphone::GSDC_RADIUS_M));
    m.insert("traces".into(), json!(traces));
    Value::Object(m)
}

/// A predictions document of task (h).
pub fn h_predictions_json(positions: &Traces, split: Split, name: &str, version: &str) -> Value {
    let mut m = doc(PREDICTIONS_SCHEMA, split);
    m.insert("system".into(), json!({"name": name, "version": version}));
    m.insert("positions".into(), json!(positions));
    Value::Object(m)
}

/// Score task (h): the metric of task (g) over the traces of the truth.
pub fn score_h(truth: &Value, preds: &Value) -> Result<(Value, String), BenchError> {
    let (m, _) = super::smartphone::score_g(truth, preds)?;
    Ok((
        m,
        "MODELLED: truth is the UrbanNav reference trajectory (NovAtel SPAN-CPT, as the publisher states it) of each sequence, whose own error is not removed; a score describes these sequences, never a receiver or a product".to_string(),
    ))
}

/// For every truth epoch, the fix (ECEF, m, keyed by Unix ms) nearest in time, as latitude and
/// longitude. `fixes` is not empty.
fn nearest(fixes: &BTreeMap<i64, [f64; 3]>, epochs: &[Fix]) -> Vec<Fix> {
    epochs
        .iter()
        .filter_map(|(ms, _, _)| {
            let after = fixes.range(*ms..).next();
            let before = fixes.range(..*ms).next_back();
            let r = match (before, after) {
                (Some(b), Some(a)) => {
                    if i128::from(*ms) - i128::from(*b.0) < i128::from(*a.0) - i128::from(*ms) {
                        b.1
                    } else {
                        a.1
                    }
                }
                (Some(b), None) => b.1,
                (None, Some(a)) => a.1,
                (None, None) => return None,
            };
            let g = crate::frames::ecef_to_geodetic(*r);
            Some((*ms, g.lat_rad.to_degrees(), g.lon_rad.to_degrees()))
        })
        .collect()
}

/// The `provided-nmea` baseline of one trace: the receiver's own GGA fixes, dated by the UTC day
/// of the first truth epoch (a GGA sentence carries the time of day only; a fix more than 12 h
/// from the truth's first epoch is moved by a day).
pub fn h_nmea_positions(file: &str, text: &str, epochs: &[Fix]) -> Result<Vec<Fix>, BenchError> {
    let sols = crate::rtk_qa::fix_check::parse_gga(text)
        .map_err(|_| BenchError(crate::t!("bench-data-no-rows", file = file)))?;
    let t0 = epochs.first().map_or(0, |e| e.0);
    let day0 = t0.div_euclid(86_400_000) * 86_400_000;
    let mut fixes = BTreeMap::new();
    for s in sols {
        let mut ms = day0 + (s.t_s * 1000.0).round() as i64;
        if ms - t0 > 43_200_000 {
            ms -= 86_400_000;
        } else if t0 - ms > 43_200_000 {
            ms += 86_400_000;
        }
        fixes.entry(ms).or_insert(s.ecef_m);
    }
    Ok(nearest(&fixes, epochs))
}

/// Days from 1970-01-01 to a proleptic Gregorian date (H. Hinnant's algorithm).
fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let mp = (m + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// Unix milliseconds of a solver epoch time `YYYY-MM-DD HH:MM:SS.sss` on the GPS time scale.
fn gps_text_to_unix_ms(t: &str, leap_s: i64) -> Option<i64> {
    let (date, time) = t.split_once(' ')?;
    let d: Vec<i64> = date
        .split('-')
        .map(|x| x.parse().ok())
        .collect::<Option<_>>()?;
    let h: Vec<&str> = time.split(':').collect();
    if d.len() != 3 || h.len() != 3 {
        return None;
    }
    let (hh, mm): (i64, i64) = (h[0].parse().ok()?, h[1].parse().ok()?);
    let ss: f64 = h[2].parse().ok()?;
    let days = days_from_civil(d[0], d[1], d[2]);
    Some((days * 86_400 + hh * 3600 + mm * 60 - leap_s) * 1000 + (ss * 1000.0).round() as i64)
}

/// GPS minus UTC in 2021, s (unchanged since 2017-01-01).
pub const GPS_MINUS_UTC_S: i64 = 18;

/// The `kshana-spp` baseline of one trace. Two passes of [`crate::pvt::run_pvt`], neither using
/// the truth: the first with no elevation mask from the Earth's centre, the second with the
/// solver's 10° mask from the median of the first pass's fixes. Single frequency with the
/// broadcast Klobuchar model (`dual_frequency = false`) for both receivers alike.
pub fn h_spp_positions(
    obs_file: &str,
    obs: &str,
    nav: &str,
    epochs: &[Fix],
) -> Result<(Vec<Fix>, Value), BenchError> {
    let run = |apriori: [f64; 3], mask: f64| {
        crate::pvt::run_pvt(&crate::pvt::PvtScenario {
            obs_rinex: obs.to_string(),
            nav_rinex: nav.to_string(),
            truth_ecef: None,
            apriori_ecef: Some(apriori),
            mask_deg: mask,
            dual_frequency: false,
        })
        .map_err(|e| BenchError(format!("{obs_file}: {e}")))
    };
    let fixes_of = |r: &crate::pvt::PvtResult| -> BTreeMap<i64, [f64; 3]> {
        r.epochs
            .iter()
            .filter_map(|e| {
                let f = e.fix.as_ref()?;
                Some((gps_text_to_unix_ms(&e.time, GPS_MINUS_UTC_S)?, f.ecef_m))
            })
            .collect()
    };
    let first = fixes_of(&run([0.0; 3], -90.0)?);
    if first.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = obs_file));
    }
    let med = |k: usize| {
        let v: Vec<f64> = first.values().map(|r| r[k]).collect();
        super::smartphone::percentile(&v, 50.0)
    };
    let second = run([med(0), med(1), med(2)], SPP_MASK_DEG)?;
    let fixes = fixes_of(&second);
    if fixes.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = obs_file));
    }
    let info = json!({
        "epochs_total": second.fom.epochs_total,
        "epochs_solved": second.fom.epochs_solved,
        "mean_n_used": second.fom.mean_n_used,
        "mean_pdop": second.fom.mean_pdop,
    });
    Ok((nearest(&fixes, epochs), info))
}

/// Whether a baseline has its inputs for every trace: `provided-nmea` needs each receiver's NMEA
/// (the Tokyo edition has none), `kshana-spp` its RINEX observations and the navigation file.
pub fn h_baseline_available(baseline: &str, dirs: &BTreeMap<String, PathBuf>) -> bool {
    dirs.iter().all(|(id, dir)| {
        let receiver = id.rsplit('/').next().unwrap_or("");
        match baseline {
            "provided-nmea" => dir.join(format!("{receiver}.nmea")).is_file(),
            "kshana-spp" => {
                dir.join(format!("{receiver}.obs")).is_file() && dir.join("nav.rnx").is_file()
            }
            _ => false,
        }
    })
}

/// The predictions of a baseline over the traces of a split, with a note per trace of what the
/// baseline had to work with.
pub fn h_baseline(
    baseline: &str,
    traces: &Traces,
    dirs: &BTreeMap<String, PathBuf>,
    split: Split,
) -> Result<Value, BenchError> {
    if !H_BASELINES.contains(&baseline) {
        return err(crate::t!("bench-unknown-baseline", name = baseline));
    }
    let (mut out, mut notes) = (Traces::new(), Map::new());
    for (id, epochs) in traces {
        let receiver = id.rsplit('/').next().unwrap_or("");
        let dir = &dirs[id];
        if baseline == "provided-nmea" {
            let p = dir.join(format!("{receiver}.nmea"));
            out.insert(
                id.clone(),
                h_nmea_positions(&p.display().to_string(), &read(&p)?, epochs)?,
            );
        } else {
            let p = dir.join(format!("{receiver}.obs"));
            let (pos, info) = h_spp_positions(
                &p.display().to_string(),
                &read(&p)?,
                &read(&dir.join("nav.rnx"))?,
                epochs,
            )?;
            out.insert(id.clone(), pos);
            notes.insert(id.clone(), info);
        }
    }
    // The Tokyo edition's baselines carry the edition in their name, so a board never shows them
    // as the Hong Kong rows.
    let tokyo = dirs.values().any(|d| d.join(TRUTH_TOKYO).is_file());
    let label = if tokyo {
        format!("{baseline}/tokyo")
    } else {
        baseline.to_string()
    };
    let mut d = h_predictions_json(
        &out,
        split,
        &crate::t!(
            "bench-tasks-kshana-bench-baseline",
            baseline = label.as_str()
        ),
        SPEC_VERSION_H,
    );
    if !notes.is_empty() {
        d["solver"] = Value::Object(notes);
    }
    Ok(d)
}

#[cfg(test)]
mod tests {
    use super::*;

    const GT: &str = "      UTCTime       Week   GPSTime         Latitude        Longitude        H-Ell VelBdyX\n        (sec)    (weeks)     (sec)       (+/-D M S)       (+/-D M S)          (m)   (m/s)\n1621218776.00 2158.00000  95594.00   22 18 04.31949  114 10 44.60559        3.471  -0.000\r\n1621218775.00 2158.00000  95593.00  -22 18 04.31949 -114 10 44.60559        3.472  -0.000\r\n";

    #[test]
    fn urbannav_truth_reads_signed_dms_and_unix_seconds() {
        let v = h_truth_of("gt.txt", GT).unwrap();
        assert_eq!(v.len(), 2);
        assert_eq!(v[0].0, 1_621_218_775_000);
        let lat = 22.0 + 18.0 / 60.0 + 4.31949 / 3600.0;
        let lon = 114.0 + 10.0 / 60.0 + 44.60559 / 3600.0;
        assert!((v[0].1 + lat).abs() < 1e-12 && (v[0].2 + lon).abs() < 1e-12);
        assert!((v[1].1 - lat).abs() < 1e-12 && (v[1].2 - lon).abs() < 1e-12);
        assert!(h_truth_of("gt.txt", "1621218775.00 2158 95593 22 18\n").is_err());
        assert!(h_truth_of("gt.txt", "header only\n").is_err());
    }

    #[test]
    fn tokyo_reference_keeps_whole_seconds_and_converts_gps_time() {
        let csv = "GPS TOW (s), GPS Week, Latitude (deg), Longitude (deg), Ellipsoid Height (m)\n273375.90, 2032, 35.1, 139.1, 44.6\n273376.00, 2032, 35.62931853, 139.78712595, 44.6995\n273376.10, 2032, 35.2, 139.2, 44.6\n";
        let v = h_truth_tokyo_of("reference.csv", csv).unwrap();
        // Week 2032, TOW 273376 s (GPS) is 2018-12-19T03:55:58Z (UTC, 18 s earlier).
        assert_eq!(v, vec![(1_545_191_758_000, 35.62931853, 139.78712595)]);
        assert!(h_truth_tokyo_of("r.csv", "GPS TOW (s), GPS Week\n1, 2\n").is_err());
        assert!(h_truth_tokyo_of("r.csv", "").is_err());
    }

    #[test]
    fn gga_fixes_are_dated_by_the_truth_day_and_taken_at_the_nearest_epoch() {
        let gga = "$GNGGA,023255.00,2218.07395,N,11410.74198,E,2,12,0.62,9.0,M,-1.6,M,,0000*51\n$GNGGA,023257.00,2218.07410,N,11410.74185,E,2,12,0.82,8.8,M,-1.6,M,,0000*52\n";
        // 2021-05-17 02:32:56 UTC is between the two sentences, nearer neither: the later wins.
        let t = 1_621_218_776_000;
        let p = h_nmea_positions("r.nmea", gga, &[(t, 0.0, 0.0), (t + 1000, 0.0, 0.0)]).unwrap();
        let want = (22.0 + 18.07410 / 60.0, 114.0 + 10.74185 / 60.0);
        for f in &p {
            assert!(super::super::smartphone::haversine_m(f.1, f.2, want.0, want.1) < 0.01);
        }
        assert!(h_nmea_positions("r.nmea", "no sentences\n", &[(t, 0.0, 0.0)]).is_err());
    }

    #[test]
    fn solver_epochs_convert_from_gps_time_to_unix_milliseconds() {
        // 2021-05-17 02:33:13.005 GPS is 02:32:55.005 UTC.
        assert_eq!(
            gps_text_to_unix_ms("2021-05-17 02:33:13.005", GPS_MINUS_UTC_S),
            Some(1_621_218_775_005)
        );
        assert_eq!(gps_text_to_unix_ms("garbage", 18), None);
    }

    #[test]
    fn sequences_split_whole_and_the_score_is_the_task_g_metric() {
        let seqs: Vec<String> = [
            "medium-urban-1",
            "deep-urban-1",
            "harsh-urban-1",
            "tunnel-1",
        ]
        .iter()
        .map(|s| s.to_string())
        .collect();
        let s = h_splits(&seqs);
        let n = |x| s.values().filter(|v| **v == x).count();
        assert_eq!(
            (n(Split::Holdout), n(Split::Test), n(Split::Dev)),
            (0, 2, 2)
        );
        assert_eq!(h_splits(&seqs), s);
        assert!(h_load(Path::new("."), Split::Holdout).is_err());
        let t: Traces = [("s/ublox-f9p".to_string(), vec![(1, 0.0, 0.0)])]
            .into_iter()
            .collect();
        let one_m = (1.0 / super::super::smartphone::GSDC_RADIUS_M).to_degrees();
        let p: Traces = [("s/ublox-f9p".to_string(), vec![(1, one_m, 0.0)])]
            .into_iter()
            .collect();
        let (m, label) = score_h(
            &h_truth_json(&t, Split::Test),
            &h_predictions_json(&p, Split::Test, "x", "1"),
        )
        .unwrap();
        assert!((m["gsdc_score_m"].as_f64().unwrap() - 1.0).abs() < 1e-6);
        assert!(label.starts_with("MODELLED"));
    }
}
