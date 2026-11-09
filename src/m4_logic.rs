// SPDX-License-Identifier: AGPL-3.0-only
//! M4 (0.41): the per-vessel AIS integrity decision and its scorer, readings 13 to 19 of
//! `xval/m4-dark-vessel/README.md`. Input: an AIS stream and an RF fix stream (no identities on
//! fixes); output: one class per identity and a dark/associated flag per fix. Outputs describe data
//! consistency ("no matching AIS", "AIS position inconsistent with the RF fix"), never intent.

use std::collections::BTreeMap;

use serde_json::{json, Value};

use crate::body::Body;
use crate::constellation::satellite_positions_fixed;
use crate::m4_dark_vessel::{Label, Scene, R_M, SCENE_S, STEP_S};
use crate::portable_math::PortableFloat;
use crate::tip_and_cue::primary_rf_layer;

const DEG: f64 = std::f64::consts::PI / 180.0;

/// The v2 `m`, chosen on seeds 20-29 (R21, R24; xval/m4-dark-vessel/dev-v2.json.gz): m = 2 has FA 0.00513
/// (above 0.005, not eligible); m = 3 has FA 0.00006 and is the only eligible value.
pub const M4_V2_M: usize = 3;

/// Every number of the decision (R13 to R18).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct M4Params {
    /// Fix noise per axis, m.
    pub sigma_fix_m: f64,
    /// Chi-square gate (2 degrees of freedom, false-gate probability 0.001).
    pub gate: f64,
    /// Largest report spacing for interpolation, s.
    pub interp_max_s: u32,
    /// Speed above which consecutive reports show a duplicate identity, kn.
    pub max_speed_kn: f64,
    /// Internal silence that makes a gap, s.
    pub gap_s: u32,
    /// Time window around an expected epoch, s.
    pub epoch_window_s: u32,
    /// Largest distance of an offset candidate, m.
    pub candidate_max_m: f64,
    /// Misses with a candidate needed for an offset.
    pub m: usize,
    /// Consistency radius of the candidates' displacements, m.
    pub c_m: f64,
    /// Elevation mask of the RF layer, degrees.
    pub mask_deg: f64,
    /// v2 (R20 to R23): the step test for offsets and dark tracks from fix sequences. `false` is v1.
    pub v2: bool,
    /// v2 dark-track speed limit, kn (R22).
    pub dark_max_kn: f64,
}

impl M4Params {
    /// The development defaults before tuning (`m` and `c` are replaced by the tuned pair in `v1`).
    pub fn base() -> Self {
        Self {
            sigma_fix_m: 1000.0,
            gate: 13.816,
            interp_max_s: 60,
            max_speed_kn: 70.0,
            gap_s: 600,
            epoch_window_s: 60,
            candidate_max_m: 60_000.0,
            m: 2,
            c_m: 3000.0,
            mask_deg: 10.0,
            v2: false,
            dark_max_kn: 30.0,
        }
    }

    /// The committed version 2 parameters (R24). `m` is set from the seeds 20-29 development run.
    pub fn v2() -> Self {
        Self::v2_base(M4_V2_M)
    }

    /// The v2 development base (R21, R22): v1's window and `c`, the v2 logic on, `m` to be tuned.
    pub fn v2_base(m: usize) -> Self {
        Self {
            m,
            v2: true,
            ..Self::v1()
        }
    }

    /// The committed version 1 parameters: the base values with the (m, c) pair chosen on seeds 0 to 9
    /// (R17, R19).
    pub fn v1() -> Self {
        // Chosen on seeds 0-9 (xval/m4-dark-vessel/dev-third.json.gz): the eligible triple
        // (FA <= 0.005) with the highest offset recall at d >= 5 km: window 60 s, m = 3, c = 5 km
        // (FA 0.00469, recall 938 of 1 120).
        Self {
            epoch_window_s: 60,
            m: 3,
            c_m: 5000.0,
            ..Self::base()
        }
    }
}

/// Local east and north metres of `b` from `a`.
fn en(a: (f64, f64), b: (f64, f64)) -> (f64, f64) {
    (
        (b.1 - a.1) * DEG * R_M * (a.0 * DEG).pcos(),
        (b.0 - a.0) * DEG * R_M,
    )
}

/// One AIS track: reports `(t, lat, lon)` sorted by time.
#[derive(Clone, Debug)]
struct Track {
    id: u64,
    rep: Vec<(u32, f64, f64)>,
}

impl Track {
    fn predict(&self, t: u32, max_gap: u32) -> Option<(f64, f64)> {
        let k = self.rep.partition_point(|r| r.0 < t);
        if k < self.rep.len() && self.rep[k].0 == t {
            return Some((self.rep[k].1, self.rep[k].2));
        }
        if k == 0 || k == self.rep.len() {
            return None;
        }
        let (a, b) = (self.rep[k - 1], self.rep[k]);
        if b.0 - a.0 > max_gap {
            return None;
        }
        let w = f64::from(t - a.0) / f64::from(b.0 - a.0);
        Some((a.1 + w * (b.1 - a.1), a.2 + w * (b.2 - a.2)))
    }
}

/// The decision for one scene.
#[derive(Clone, Debug)]
pub struct Decision {
    /// Class per identity.
    pub class: BTreeMap<u64, Label>,
    /// Per fix (stream order): true if it is a dark fix (v1: unassociated, not explained; v2: in a dark
    /// track of at least 2 fixes, R22).
    pub dark_fix: Vec<bool>,
    /// Per fix: true if an AIS-associated fix was taken by a dark track (v2, R22); all false in v1.
    pub taken: Vec<bool>,
}

fn implied_kn(a: (u32, f64, f64), b: (u32, f64, f64)) -> f64 {
    let (e, n) = en((a.1, a.2), (b.1, b.2));
    let dt = f64::from(b.0.saturating_sub(a.0).max(1));
    (e * e + n * n).sqrt() / dt * 3600.0 / 1852.0
}

/// Decide every identity and fix of a scene from its AIS and RF streams (R13 to R18).
pub fn decide(scene: &Scene, p: &M4Params) -> Decision {
    let mut by_id: BTreeMap<u64, Vec<(u32, f64, f64)>> = BTreeMap::new();
    for &(t, id, a, b) in &scene.ais {
        by_id.entry(id).or_default().push((t, a, b));
    }
    let mut class: BTreeMap<u64, Label> = BTreeMap::new();
    let mut tracks: Vec<Track> = Vec::new();
    for (&id, rep) in &by_id {
        let dup = rep
            .windows(2)
            .filter(|w| implied_kn(w[0], w[1]) > p.max_speed_kn)
            .count()
            >= 2;
        if dup {
            class.insert(id, Label::IdentityDuplicate);
            let mut parts: Vec<Vec<(u32, f64, f64)>> = Vec::new();
            for &r in rep {
                let pick = parts
                    .iter()
                    .enumerate()
                    .filter(|(_, v)| implied_kn(*v.last().unwrap_or(&r), r) <= p.max_speed_kn)
                    .map(|(k, _)| k)
                    .next();
                match pick {
                    Some(k) => parts[k].push(r),
                    None => parts.push(vec![r]),
                }
            }
            for v in parts {
                tracks.push(Track { id, rep: v });
            }
            continue;
        }
        let gap = rep.windows(2).any(|w| w[1].0 - w[0].0 > p.gap_s);
        class.insert(id, if gap { Label::Gap } else { Label::Normal });
        tracks.push(Track {
            id,
            rep: rep.clone(),
        });
    }
    // Association (R14).
    let s2 = p.sigma_fix_m * p.sigma_fix_m;
    let mut assoc: Vec<Option<usize>> = Vec::with_capacity(scene.rf.len());
    let mut d2_ais: Vec<f64> = Vec::with_capacity(scene.rf.len());
    for &(t, a, b) in &scene.rf {
        let mut best: Option<(f64, usize)> = None;
        for (k, tr) in tracks.iter().enumerate() {
            if let Some(q) = tr.predict(t, p.interp_max_s) {
                let (e, n) = en(q, (a, b));
                let d2 = (e * e + n * n) / s2;
                if d2 <= p.gate && best.is_none_or(|x| d2 < x.0) {
                    best = Some((d2, k));
                }
            }
        }
        assoc.push(best.map(|x| x.1));
        d2_ais.push(best.map_or(f64::INFINITY, |x| x.0));
    }
    let mut explained = vec![false; scene.rf.len()];
    // Expected accesses (R17).
    let els = primary_rf_layer().elements().unwrap_or_default();
    let body = Body::earth();
    let sats: Vec<Vec<[f64; 3]>> = (0..=SCENE_S / STEP_S)
        .map(|k| {
            satellite_positions_fixed(
                &body,
                std::slice::from_ref(&els),
                true,
                f64::from(k * STEP_S),
            )
        })
        .collect();
    let sin_mask = (p.mask_deg * DEG).psin();
    let vis = |k: usize, q: (f64, f64)| -> bool {
        let (sp, cp) = (q.0 * DEG).psin_cos();
        let (sl, cl) = (q.1 * DEG).psin_cos();
        let u = [cp * cl, cp * sl, sp];
        let pt = [R_M * u[0], R_M * u[1], R_M * u[2]];
        sats[k].iter().any(|s| {
            let d = [s[0] - pt[0], s[1] - pt[1], s[2] - pt[2]];
            let nn = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            (d[0] * u[0] + d[1] * u[1] + d[2] * u[2]) / nn >= sin_mask
        })
    };
    // Fix indices by time for windows.
    let times: Vec<u32> = scene.rf.iter().map(|f| f.0).collect();
    for (k, tr) in tracks.iter().enumerate() {
        if class.get(&tr.id) == Some(&Label::IdentityDuplicate) {
            continue;
        }
        let steps = (SCENE_S / STEP_S) as usize;
        let mut epochs = Vec::new();
        let mut run: Option<usize> = None;
        for s in 0..=steps {
            let t = s as u32 * STEP_S;
            let v = tr.predict(t, p.interp_max_s).is_some_and(|q| vis(s, q));
            match (v, run) {
                (true, None) => run = Some(s),
                (false, Some(a)) => {
                    epochs.push((a + (s - 1 - a) / 2) as u32 * STEP_S);
                    run = None;
                }
                _ => {}
            }
        }
        if let Some(a) = run {
            epochs.push((a + (steps - a) / 2) as u32 * STEP_S);
        }
        // Every miss keeps all its candidates (amended R17); v2 also keeps the epochs and hits (R21).
        let mut misses: Vec<Vec<(usize, (f64, f64))>> = Vec::new();
        let mut miss_t: Vec<u32> = Vec::new();
        let mut hits: Vec<u32> = Vec::new();
        for te in epochs {
            let lo = times.partition_point(|&x| x + p.epoch_window_s < te);
            let hi = times.partition_point(|&x| x <= te + p.epoch_window_s);
            if (lo..hi).any(|j| assoc[j] == Some(k)) {
                hits.push(te);
                continue;
            }
            let Some(q) = tr.predict(te, p.interp_max_s) else {
                continue;
            };
            let cand: Vec<(usize, (f64, f64))> = (lo..hi)
                .filter(|&j| assoc[j].is_none())
                .map(|j| (j, en(q, (scene.rf[j].1, scene.rf[j].2))))
                .filter(|(_, d)| (d.0 * d.0 + d.1 * d.1).sqrt() <= p.candidate_max_m)
                .collect();
            if !cand.is_empty() {
                misses.push(cand);
                miss_t.push(te);
            }
        }
        // The vote: the candidate displacement agreed by the most misses.
        let near = |a: (f64, f64), b: (f64, f64)| {
            ((a.0 - b.0).powi(2) + (a.1 - b.1).powi(2)).sqrt() <= p.c_m
        };
        let mut best: Option<(usize, (f64, f64))> = None;
        let mut best_from = 0usize;
        for (i, m) in misses.iter().enumerate() {
            for &(_, d) in m {
                // v1 votes over every miss; v2 over the misses from this one's epoch on (R21).
                let from = if p.v2 { i } else { 0 };
                let count = misses[from..]
                    .iter()
                    .filter(|o| o.iter().any(|x| near(x.1, d)))
                    .count();
                if best.is_none_or(|b| count > b.0) {
                    best = Some((count, d));
                    best_from = from;
                }
            }
        }
        if let Some((count, d)) = best {
            // v2 step test: no hit at or after t0 (R21).
            let step_ok = !p.v2 || !hits.iter().any(|&h| h >= miss_t[best_from]);
            if count >= p.m && step_ok {
                if class.get(&tr.id) == Some(&Label::Normal) {
                    class.insert(tr.id, Label::PositionOffset);
                }
                for m in &misses[best_from..] {
                    for x in m.iter().filter(|x| near(x.1, d)) {
                        explained[x.0] = true;
                    }
                }
            }
        }
    }
    if p.v2 {
        let (dark_fix, taken) = dark_tracks(scene, p, &assoc, &d2_ais, &explained);
        return Decision {
            class,
            dark_fix,
            taken,
        };
    }
    let dark_fix = (0..scene.rf.len())
        .map(|j| assoc[j].is_none() && !explained[j])
        .collect();
    Decision {
        class,
        dark_fix,
        taken: vec![false; scene.rf.len()],
    }
}

/// v2 dark tracks from fix sequences (R22). Returns the dark-fix flags and the associated fixes taken
/// by a dark track.
fn dark_tracks(
    scene: &Scene,
    p: &M4Params,
    assoc: &[Option<usize>],
    d2_ais: &[f64],
    explained: &[bool],
) -> (Vec<bool>, Vec<bool>) {
    let s2 = p.sigma_fix_m * p.sigma_fix_m;
    let v_max = p.dark_max_kn * 1852.0 / 3600.0;
    let slack = 3.0 * std::f64::consts::SQRT_2 * p.sigma_fix_m;
    let mut tracks: Vec<Vec<usize>> = Vec::new();
    let mut taken = vec![false; scene.rf.len()];
    let pos = |j: usize| (scene.rf[j].1, scene.rf[j].2);
    for j in 0..scene.rf.len() {
        if explained[j] {
            continue;
        }
        let (t, x) = (scene.rf[j].0, pos(j));
        let mut pred_best: Option<(f64, usize)> = None;
        let mut single_best: Option<(f64, usize)> = None;
        for (k, tr) in tracks.iter().enumerate() {
            let last = *tr.last().unwrap_or(&j);
            let dt = f64::from(t.saturating_sub(scene.rf[last].0));
            let (e, n) = en(pos(last), x);
            let dist = (e * e + n * n).sqrt();
            if dist > v_max * dt + slack {
                continue;
            }
            if tr.len() >= 2 {
                let f1 = tr[tr.len() - 2];
                let (t1, t2) = (scene.rf[f1].0, scene.rf[last].0);
                if t2 == t1 {
                    continue;
                }
                let tau = f64::from(t - t2) / f64::from(t2 - t1);
                let (ve, vn) = en(pos(f1), pos(last));
                let (re, rn) = (e - ve * tau, n - vn * tau);
                let d2 = (re * re + rn * rn) / (s2 * (1.0 + (1.0 + tau).powi(2) + tau * tau));
                if pred_best.is_none_or(|b| d2 < b.0) {
                    pred_best = Some((d2, k));
                }
            } else if single_best.is_none_or(|b| dist < b.0) {
                single_best = Some((dist, k));
            }
        }
        if assoc[j].is_some() {
            if let Some((d2, k)) = pred_best {
                if d2 < d2_ais[j] {
                    tracks[k].push(j);
                    taken[j] = true;
                }
            }
            continue;
        }
        match pred_best.or(single_best) {
            Some((_, k)) => tracks[k].push(j),
            None => tracks.push(vec![j]),
        }
    }
    let mut dark = vec![false; scene.rf.len()];
    for tr in tracks.iter().filter(|tr| tr.len() >= 2) {
        for &j in tr {
            dark[j] = true;
        }
    }
    (dark, taken)
}

/// Exact (Clopper-Pearson) 95 % interval of `k` successes in `n`.
pub fn clopper_pearson(k: usize, n: usize) -> (f64, f64) {
    if n == 0 {
        return (0.0, 1.0);
    }
    let cdf = |p: f64, upto: usize| -> f64 {
        // P(X <= upto), X ~ Bin(n, p), by summing terms in log space.
        let mut s = 0.0;
        let lp = p.max(1e-300).pln();
        let lq = (1.0 - p).max(1e-300).pln();
        let mut lc = 0.0; // ln C(n, 0)
        for i in 0..=upto {
            if i > 0 {
                lc += ((n - i + 1) as f64).pln() - (i as f64).pln();
            }
            s += (lc + i as f64 * lp + (n - i) as f64 * lq).pexp();
        }
        s
    };
    let solve = |f: &dyn Fn(f64) -> f64, target: f64| -> f64 {
        let (mut lo, mut hi) = (0.0, 1.0);
        for _ in 0..80 {
            let mid = 0.5 * (lo + hi);
            if f(mid) > target {
                lo = mid;
            } else {
                hi = mid;
            }
        }
        0.5 * (lo + hi)
    };
    let lower = if k == 0 {
        0.0
    } else {
        solve(&|p| cdf(p, k - 1), 0.975)
    };
    let upper = if k == n {
        1.0
    } else {
        solve(&|p| cdf(p, k), 0.025)
    };
    (lower, upper)
}

fn idx(l: Label) -> usize {
    Label::ALL.iter().position(|x| *x == l).unwrap_or(0)
}

/// The decided class of every scored vessel (R18), from the truth's identities and fix owners.
pub fn decided_classes(scene: &Scene, d: &Decision) -> Vec<(Label, Label, Option<f64>)> {
    let vessels = scene.truth["vessels"]
        .as_array()
        .cloned()
        .unwrap_or_default();
    let mut own_total = vec![0usize; vessels.len()];
    let mut own_dark = vec![0usize; vessels.len()];
    for (j, &o) in scene.rf_owner.iter().enumerate() {
        if o >= 0 {
            own_total[o as usize] += 1;
            own_dark[o as usize] += usize::from(d.dark_fix[j]);
        }
    }
    vessels
        .iter()
        .enumerate()
        .map(|(i, v)| {
            let truth = Label::ALL
                .into_iter()
                .find(|l| v["label"] == l.name())
                .unwrap_or(Label::Normal);
            let id = v["id"].as_u64().unwrap_or(0);
            let majority_dark = own_total[i] > 0 && 2 * own_dark[i] > own_total[i];
            let dec = if truth == Label::Dark {
                if majority_dark {
                    Label::Dark
                } else {
                    Label::Normal
                }
            } else {
                match d.class.get(&id).copied().unwrap_or(Label::Normal) {
                    Label::Normal if majority_dark => Label::Dark,
                    c => c,
                }
            };
            (truth, dec, v["offset_km"].as_f64())
        })
        .collect()
}

/// Metrics of a set of scored vessels (the pre-registration's formulas).
pub fn metrics(rows: &[(Label, Label, Option<f64>)]) -> Value {
    let mut n = [[0usize; 5]; 5];
    for &(t, d, _) in rows {
        n[idx(t)][idx(d)] += 1;
    }
    let mut per = serde_json::Map::new();
    for (c, l) in Label::ALL.iter().enumerate() {
        let row: usize = n[c].iter().sum();
        let col: usize = (0..5).map(|k| n[k][c]).sum();
        let (rl, rh) = clopper_pearson(n[c][c], row);
        let (pl, ph) = clopper_pearson(n[c][c], col);
        per.insert(
            l.name().into(),
            json!({
                "recall": if row > 0 { json!(n[c][c] as f64 / row as f64) } else { Value::Null },
                "recall_ci95": [rl, rh],
                "precision": if col > 0 { json!(n[c][c] as f64 / col as f64) } else { Value::Null },
                "precision_ci95": [pl, ph],
            }),
        );
    }
    let row0: usize = n[0].iter().sum();
    let fa = 1.0 - n[0][0] as f64 / row0.max(1) as f64;
    let mut by_d = serde_json::Map::new();
    for d in [2.0, 5.0, 10.0, 20.0, 50.0] {
        let v: Vec<_> = rows
            .iter()
            .filter(|r| r.0 == Label::PositionOffset && r.2 == Some(d))
            .collect();
        let k = v.iter().filter(|r| r.1 == Label::PositionOffset).count();
        by_d.insert(
            format!("{d}"),
            json!({"n": v.len(), "recall": k as f64 / v.len().max(1) as f64, "ci95": clopper_pearson(k, v.len())}),
        );
    }
    json!({
        "classes": Label::ALL.iter().map(|l| l.name()).collect::<Vec<_>>(),
        "confusion": n,
        "per_class": per,
        "false_alarm": fa,
        "false_alarm_ci95": clopper_pearson(row0 - n[0][0], row0),
        "offset_recall_by_km": by_d,
        "n_vessels": rows.len(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn clopper_pearson_known_values() {
        // 0 of 10: upper = 1 - 0.025^(1/10) = 0.3084971...
        let (l, u) = clopper_pearson(0, 10);
        assert_eq!(l, 0.0);
        assert!((u - (1.0 - 0.025f64.powf(0.1))).abs() < 1e-9, "{u}");
        // 10 of 10: lower = 0.025^(1/10)
        let (l, _) = clopper_pearson(10, 10);
        assert!((l - 0.025f64.powf(0.1)).abs() < 1e-9, "{l}");
    }
}
