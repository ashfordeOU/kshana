// SPDX-License-Identifier: AGPL-3.0-only
//! Task (g) of kshana-bench (spec 2.2.0): smartphone positioning accuracy, continuing the metric of
//! the Google Smartphone Decimeter Challenge (GSDC) on data laid out as its training set.
//!
//! The unit is one epoch of one trace (`<drive>/<phone>`); the truth is the trace's
//! `ground_truth.csv`; a submission gives a latitude and longitude for every truth epoch. The metric
//! is the GSDC one: per trace, the mean of the 50th and 95th percentile horizontal errors
//! (haversine on a 6,371,000 m sphere), averaged over the traces. The data are downloaded by the user
//! from the publisher under its own terms and never committed (`bench/manifests/datasets.json`).
//! Every score is MODELLED: the truth is the publisher's reference trajectory, whose own error is
//! not removed, and a score describes these traces, never a phone or a product.

use std::collections::BTreeMap;
use std::path::Path;

use serde_json::{json, Map, Value};

use super::anomaly::SPEC_VERSION_FG;
use super::{assign_splits, err, BenchError, Split, PREDICTIONS_SCHEMA, TRUTH_SCHEMA};
use crate::portable_math::PortableFloat;

/// Sphere radius of the GSDC horizontal-error metric, m.
pub const GSDC_RADIUS_M: f64 = 6_371_000.0;

/// The task (g) baseline: the receiver's own weighted-least-squares fix as provided in each trace's
/// `device_gnss.csv`, taken at the nearest epoch.
pub const G_BASELINES: [&str; 1] = ["provided-wls"];

/// One epoch: Unix time in ms, latitude and longitude in degrees.
pub type Fix = (i64, f64, f64);

/// The traces of a data directory: id to its truth epochs, in time order.
pub type Traces = BTreeMap<String, Vec<Fix>>;

/// Horizontal distance in metres between two latitude and longitude pairs in degrees, as the GSDC
/// metric computes it.
pub fn haversine_m(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> f64 {
    let (p1, p2) = (lat1.to_radians(), lat2.to_radians());
    let dp = p2 - p1;
    let dl = (lon2 - lon1).to_radians();
    let a = (dp / 2.0).psin().ppowi(2) + p1.pcos() * p2.pcos() * (dl / 2.0).psin().ppowi(2);
    2.0 * GSDC_RADIUS_M * a.sqrt().min(1.0).pasin()
}

/// The `q`-th percentile (0..100) of a non-empty slice, by linear interpolation between the closest
/// ranks (the numpy default the GSDC metric used).
pub fn percentile(v: &[f64], q: f64) -> f64 {
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    let pos = (s.len() - 1) as f64 * q / 100.0;
    let lo = pos.floor() as usize;
    let hi = (lo + 1).min(s.len() - 1);
    s[lo] + (s[hi] - s[lo]) * (pos - lo as f64)
}

/// A comma-separated file with a header, read by column name.
struct Csv<'a> {
    file: String,
    header: Vec<&'a str>,
    rows: Vec<Vec<&'a str>>,
}

impl<'a> Csv<'a> {
    fn parse(file: &str, text: &'a str) -> Result<Self, BenchError> {
        let mut lines = text.lines().filter(|l| !l.trim().is_empty());
        let header = lines
            .next()
            .ok_or_else(|| BenchError(crate::t!("bench-data-no-header", file = file)))?
            .split(',')
            .map(str::trim)
            .collect();
        Ok(Self {
            file: file.to_string(),
            header,
            rows: lines
                .map(|l| l.split(',').map(str::trim).collect())
                .collect(),
        })
    }

    fn col(&self, name: &str) -> Result<usize, BenchError> {
        self.header.iter().position(|h| *h == name).ok_or_else(|| {
            BenchError(crate::t!(
                "bench-data-no-column",
                file = self.file.as_str(),
                column = name
            ))
        })
    }

    /// The value of column `c` in row `r` as a finite number, or `None` when empty or not a number.
    fn num(&self, r: usize, c: usize) -> Option<f64> {
        self.rows[r]
            .get(c)
            .and_then(|s| s.parse::<f64>().ok())
            .filter(|x| x.is_finite())
    }

    fn need(&self, r: usize, c: usize, name: &str) -> Result<f64, BenchError> {
        self.num(r, c).ok_or_else(|| {
            BenchError(crate::t!(
                "bench-data-bad-value",
                file = self.file.as_str(),
                line = r + 2,
                column = name
            ))
        })
    }
}

/// Read one trace's `ground_truth.csv`.
pub fn g_truth_of(file: &str, text: &str) -> Result<Vec<Fix>, BenchError> {
    let c = Csv::parse(file, text)?;
    let (t, la, lo) = (
        c.col("UnixTimeMillis")?,
        c.col("LatitudeDegrees")?,
        c.col("LongitudeDegrees")?,
    );
    let mut v = (0..c.rows.len())
        .map(|r| {
            Ok((
                c.need(r, t, "UnixTimeMillis")? as i64,
                c.need(r, la, "LatitudeDegrees")?,
                c.need(r, lo, "LongitudeDegrees")?,
            ))
        })
        .collect::<Result<Vec<Fix>, BenchError>>()?;
    v.sort_by_key(|f| f.0);
    v.dedup_by_key(|f| f.0);
    Ok(v)
}

fn trace_dirs(root: &Path) -> Result<Vec<(String, std::path::PathBuf)>, BenchError> {
    let read = |p: &Path| {
        let mut v: Vec<std::path::PathBuf> = std::fs::read_dir(p)
            .map_err(|e| {
                BenchError(crate::t!(
                    "bench-cli-cannot-read",
                    p = p.display().to_string(),
                    e = e.to_string()
                ))
            })?
            .flatten()
            .map(|e| e.path())
            .filter(|p| p.is_dir())
            .collect();
        v.sort();
        Ok::<_, BenchError>(v)
    };
    let mut out = Vec::new();
    for drive in read(root)? {
        for phone in read(&drive)? {
            if phone.join("ground_truth.csv").is_file() {
                let name = |p: &Path| {
                    p.file_name()
                        .unwrap_or_default()
                        .to_string_lossy()
                        .to_string()
                };
                out.push((format!("{}/{}", name(&drive), name(&phone)), phone));
            }
        }
    }
    if out.is_empty() {
        return err(crate::t!(
            "bench-g-no-traces",
            root = root.display().to_string()
        ));
    }
    Ok(out)
}

/// The split of each trace id: the stratified rule of section 4 with a single stratum.
pub fn g_splits(ids: &[String]) -> BTreeMap<String, Split> {
    let v: Vec<(String, bool)> = ids.iter().map(|i| (i.clone(), true)).collect();
    assign_splits(&v)
}

/// Read the traces of `split` under `root` (`<drive>/<phone>/ground_truth.csv`), with their
/// directories.
pub fn g_load(
    root: &Path,
    split: Split,
) -> Result<(Traces, BTreeMap<String, std::path::PathBuf>), BenchError> {
    let dirs = trace_dirs(root)?;
    let ids: Vec<String> = dirs.iter().map(|d| d.0.clone()).collect();
    let splits = g_splits(&ids);
    let (mut traces, mut where_) = (Traces::new(), BTreeMap::new());
    for (id, dir) in dirs {
        if splits.get(&id) != Some(&split) {
            continue;
        }
        let p = dir.join("ground_truth.csv");
        let text = std::fs::read_to_string(&p).map_err(|e| {
            BenchError(crate::t!(
                "bench-cli-cannot-read",
                p = p.display().to_string(),
                e = e.to_string()
            ))
        })?;
        traces.insert(id.clone(), g_truth_of(&p.display().to_string(), &text)?);
        where_.insert(id, dir);
    }
    Ok((traces, where_))
}

fn doc(schema: &str, split: Split) -> Map<String, Value> {
    let mut m = Map::new();
    m.insert("schema".into(), json!(schema));
    m.insert("task".into(), json!("g"));
    m.insert("split".into(), json!(split.name()));
    m.insert("spec_version".into(), json!(SPEC_VERSION_FG));
    m
}

/// The truth file of a split.
pub fn g_truth_json(traces: &Traces, split: Split) -> Value {
    let mut m = doc(TRUTH_SCHEMA, split);
    m.insert("radius_m".into(), json!(GSDC_RADIUS_M));
    m.insert("traces".into(), json!(traces));
    Value::Object(m)
}

/// A predictions document of task (g).
pub fn g_predictions_json(positions: &Traces, split: Split, name: &str, version: &str) -> Value {
    let mut m = doc(PREDICTIONS_SCHEMA, split);
    m.insert("system".into(), json!({"name": name, "version": version}));
    m.insert("positions".into(), json!(positions));
    Value::Object(m)
}

fn traces_of(v: &Value, key: &str) -> Result<Traces, BenchError> {
    let o = v
        .get(key)
        .and_then(Value::as_object)
        .ok_or_else(|| BenchError(crate::t!("bench-g-no-object", key = key)))?;
    let mut out = Traces::new();
    for (id, arr) in o {
        let bad = || BenchError(crate::t!("bench-g-bad-epoch", id = id.as_str()));
        let v = arr
            .as_array()
            .ok_or_else(bad)?
            .iter()
            .map(|e| {
                let t = e.get(0).and_then(Value::as_i64).ok_or_else(bad)?;
                let la = e.get(1).and_then(Value::as_f64).ok_or_else(bad)?;
                let lo = e.get(2).and_then(Value::as_f64).ok_or_else(bad)?;
                Ok((t, la, lo))
            })
            .collect::<Result<Vec<Fix>, BenchError>>()?;
        out.insert(id.clone(), v);
    }
    Ok(out)
}

/// Read a GSDC-format submission (`tripId,UnixTimeMillis,LatitudeDegrees,LongitudeDegrees`) into
/// the positions of a predictions document.
pub fn g_positions_from_csv(file: &str, text: &str) -> Result<Traces, BenchError> {
    let c = Csv::parse(file, text)?;
    let (id, t, la, lo) = (
        c.col("tripId")?,
        c.col("UnixTimeMillis")?,
        c.col("LatitudeDegrees")?,
        c.col("LongitudeDegrees")?,
    );
    let mut out = Traces::new();
    for r in 0..c.rows.len() {
        let trip = c.rows[r].get(id).copied().unwrap_or("").to_string();
        out.entry(trip).or_default().push((
            c.need(r, t, "UnixTimeMillis")? as i64,
            c.need(r, la, "LatitudeDegrees")?,
            c.need(r, lo, "LongitudeDegrees")?,
        ));
    }
    Ok(out)
}

/// Score task (g). Every truth epoch needs a prediction at the same millisecond; extra epochs are
/// ignored; a trace the truth does not hold is refused.
pub fn score_g(truth: &Value, preds: &Value) -> Result<(Value, String), BenchError> {
    let t = traces_of(truth, "traces")?;
    let p = traces_of(preds, "positions")?;
    if let Some(extra) = p.keys().find(|k| !t.contains_key(*k)) {
        return err(crate::t!(
            "bench-predictions-name-case-that-is",
            extra = extra.as_str()
        ));
    }
    let (mut per, mut all, mut sum) = (Vec::new(), Vec::new(), 0.0);
    let (mut missing, mut first) = (0usize, String::new());
    for (id, epochs) in &t {
        let at: BTreeMap<i64, (f64, f64)> = p
            .get(id)
            .map(|v| v.iter().map(|f| (f.0, (f.1, f.2))).collect())
            .unwrap_or_default();
        let mut e = Vec::with_capacity(epochs.len());
        for (ms, la, lo) in epochs {
            match at.get(ms) {
                Some((pla, plo)) => e.push(haversine_m(*la, *lo, *pla, *plo)),
                None => {
                    if missing == 0 {
                        first = format!("{id}@{ms}");
                    }
                    missing += 1;
                }
            }
        }
        if missing > 0 || e.is_empty() {
            continue;
        }
        let (p50, p95) = (percentile(&e, 50.0), percentile(&e, 95.0));
        sum += 0.5 * (p50 + p95);
        per.push(json!({"trace": id, "n_epochs": e.len(), "p50_m": p50, "p95_m": p95, "score_m": 0.5 * (p50 + p95)}));
        all.extend(e);
    }
    if missing > 0 {
        return err(crate::t!(
            "bench-case-have-no-score-the",
            missing = missing,
            first_missing = first
        ));
    }
    if per.is_empty() {
        return err(crate::t!("bench-g-no-object", key = "traces"));
    }
    let n = per.len() as f64;
    let m = json!({
        "n_traces": per.len(),
        "n_epochs": all.len(),
        "gsdc_score_m": sum / n,
        "pooled_p50_m": percentile(&all, 50.0),
        "pooled_p95_m": percentile(&all, 95.0),
        "radius_m": GSDC_RADIUS_M,
        "per_trace": per,
    });
    Ok((
        m,
        "MODELLED: truth is the publisher's reference trajectory of each trace, whose own error is not removed; a score describes these traces, never a phone or a product".to_string(),
    ))
}

/// The `provided-wls` baseline of one trace: for every truth epoch, the weighted-least-squares
/// fix of `device_gnss.csv` (ECEF, m) nearest in time, converted to latitude and longitude.
pub fn g_wls_positions(file: &str, text: &str, epochs: &[Fix]) -> Result<Vec<Fix>, BenchError> {
    let c = Csv::parse(file, text)?;
    let (t, x, y, z) = (
        c.col("utcTimeMillis")?,
        c.col("WlsPositionXEcefMeters")?,
        c.col("WlsPositionYEcefMeters")?,
        c.col("WlsPositionZEcefMeters")?,
    );
    let mut fixes: BTreeMap<i64, [f64; 3]> = BTreeMap::new();
    for r in 0..c.rows.len() {
        if let (Some(ms), Some(a), Some(b), Some(d)) =
            (c.num(r, t), c.num(r, x), c.num(r, y), c.num(r, z))
        {
            fixes.entry(ms as i64).or_insert([a, b, d]);
        }
    }
    if fixes.is_empty() {
        return err(crate::t!("bench-data-no-rows", file = file));
    }
    Ok(epochs
        .iter()
        .map(|(ms, _, _)| {
            let after = fixes.range(*ms..).next();
            let before = fixes.range(..*ms).next_back();
            let r = match (before, after) {
                (Some(b), Some(a)) => {
                    if (i128::from(*ms) - i128::from(*b.0)) < (i128::from(*a.0) - i128::from(*ms)) {
                        b.1
                    } else {
                        a.1
                    }
                }
                (Some(b), None) => b.1,
                (None, Some(a)) => a.1,
                (None, None) => unreachable!("fixes is not empty"),
            };
            let g = crate::frames::ecef_to_geodetic(*r);
            (*ms, g.lat_rad.to_degrees(), g.lon_rad.to_degrees())
        })
        .collect())
}

/// The predictions of a baseline over the traces of a split.
pub fn g_baseline(
    baseline: &str,
    traces: &Traces,
    dirs: &BTreeMap<String, std::path::PathBuf>,
    split: Split,
) -> Result<Value, BenchError> {
    if !G_BASELINES.contains(&baseline) {
        return err(crate::t!("bench-unknown-baseline", name = baseline));
    }
    let mut out = Traces::new();
    for (id, epochs) in traces {
        let p = dirs[id].join("device_gnss.csv");
        let text = std::fs::read_to_string(&p).map_err(|e| {
            BenchError(crate::t!(
                "bench-cli-cannot-read",
                p = p.display().to_string(),
                e = e.to_string()
            ))
        })?;
        out.insert(
            id.clone(),
            g_wls_positions(&p.display().to_string(), &text, epochs)?,
        );
    }
    Ok(g_predictions_json(
        &out,
        split,
        &crate::t!("bench-tasks-kshana-bench-baseline", baseline = baseline),
        SPEC_VERSION_FG,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn haversine_and_percentile_follow_the_gsdc_definitions() {
        // One arc-second of latitude on a 6,371,000 m sphere.
        let d = haversine_m(0.0, 0.0, 1.0 / 3600.0, 0.0);
        assert!((d - GSDC_RADIUS_M * (1.0f64 / 3600.0).to_radians()).abs() < 1e-9);
        let v = [1.0, 2.0, 3.0, 4.0, 5.0];
        assert_eq!(percentile(&v, 50.0), 3.0);
        assert!((percentile(&v, 95.0) - 4.8).abs() < 1e-12);
    }

    #[test]
    fn the_score_is_the_trace_mean_of_p50_and_p95() {
        let t: Traces = [
            ("d/p1".to_string(), vec![(1, 0.0, 0.0), (2, 0.0, 0.0)]),
            ("d/p2".to_string(), vec![(1, 0.0, 0.0)]),
        ]
        .into_iter()
        .collect();
        let one_m_deg = (1.0 / GSDC_RADIUS_M).to_degrees();
        let p: Traces = [
            (
                "d/p1".to_string(),
                vec![
                    (1, one_m_deg, 0.0),
                    (2, 3.0 * one_m_deg, 0.0),
                    (9, 5.0, 5.0),
                ],
            ),
            ("d/p2".to_string(), vec![(1, 2.0 * one_m_deg, 0.0)]),
        ]
        .into_iter()
        .collect();
        let truth = g_truth_json(&t, Split::Test);
        let preds = g_predictions_json(&p, Split::Test, "x", "1");
        let (m, _) = score_g(&truth, &preds).unwrap();
        // p1: errors 1 and 3 -> p50 2, p95 2.9 -> 2.45; p2: 2 -> 2; mean 2.225.
        assert!((m["gsdc_score_m"].as_f64().unwrap() - 2.225).abs() < 1e-6);
        assert_eq!(m["n_epochs"], json!(3));
        // A missing epoch is refused, naming it.
        let mut q = p.clone();
        q.get_mut("d/p1").unwrap().remove(1);
        let e = score_g(&truth, &g_predictions_json(&q, Split::Test, "x", "1")).unwrap_err();
        assert!(e.to_string().contains("d/p1@2"), "{e}");
    }

    #[test]
    fn a_gsdc_submission_csv_and_the_wls_baseline_read_by_column_name() {
        let csv = "tripId,UnixTimeMillis,LatitudeDegrees,LongitudeDegrees\nd/p,1000,37.5,-122.1\nd/p,2000,37.6,-122.2\n";
        let p = g_positions_from_csv("s.csv", csv).unwrap();
        assert_eq!(p["d/p"], vec![(1000, 37.5, -122.1), (2000, 37.6, -122.2)]);
        let g = crate::frames::Geodetic {
            lat_rad: 37.5f64.to_radians(),
            lon_rad: (-122.1f64).to_radians(),
            alt_m: 10.0,
        };
        let r = crate::frames::geodetic_to_ecef(g);
        let dev = format!(
            "MessageType,utcTimeMillis,Svid,WlsPositionXEcefMeters,WlsPositionYEcefMeters,WlsPositionZEcefMeters\nRaw,990,3,{},{},{}\nRaw,990,5,,,\nRaw,3000,3,NaN,NaN,NaN\n",
            r[0], r[1], r[2]
        );
        let w = g_wls_positions("device_gnss.csv", &dev, &[(1000, 0.0, 0.0)]).unwrap();
        assert!(haversine_m(w[0].1, w[0].2, 37.5, -122.1) < 1e-3);
        assert!(g_wls_positions("x", "utcTimeMillis\n1\n", &[]).is_err());
    }

    #[test]
    fn traces_split_by_the_section_4_rule_and_cover_all_three_splits() {
        let ids: Vec<String> = (0..12).map(|i| format!("drive{i}/phone")).collect();
        let s = g_splits(&ids);
        let n = |x| s.values().filter(|v| **v == x).count();
        assert_eq!(
            (n(Split::Holdout), n(Split::Test), n(Split::Dev)),
            (3, 3, 6)
        );
        assert_eq!(g_splits(&ids), s);
    }
}
