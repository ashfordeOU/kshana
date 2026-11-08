// SPDX-License-Identifier: AGPL-3.0-only
//! M4 (0.41): dark vessels and AIS integrity. The synthetic truth set (generator) of
//! `docs/design/evidence/m4-dark-vessel-ais-integrity/PREREGISTRATION.md`, with the readings of
//! `xval/m4-dark-vessel/README.md` (cited as R1 to R12). The area, its sea points and the RF layer are
//! M2's (`crate::tip_and_cue`). MODELLED: synthetic scenes only; outputs describe data consistency,
//! never intent.

use std::collections::HashSet;

use rand::{seq::SliceRandom, Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Value};

use crate::body::Body;
use crate::constellation::satellite_positions_fixed;
use crate::portable_math::PortableFloat;
use crate::tip_and_cue::{baltic_points, primary_rf_layer, AREA_BOX_DEG, AREA_CELL_DEG};

/// Scene length, s (R1).
pub const SCENE_S: u32 = 21_600;
/// Time step, s (R1).
pub const STEP_S: u32 = 10;
/// Vessels per scene.
pub const N_VESSELS: usize = 2000;
/// Sphere radius, m (M2 reading 3).
pub const R_M: f64 = 6_378_137.0;
const DEG: f64 = std::f64::consts::PI / 180.0;
const KN: f64 = 1852.0 / 3600.0;

/// The five labels.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Label {
    /// AIS on throughout, true position.
    Normal,
    /// No AIS at all.
    Dark,
    /// AIS off for one interval.
    Gap,
    /// Reports offset by a constant from an onset.
    PositionOffset,
    /// A second vessel uses this identity.
    IdentityDuplicate,
}

impl Label {
    /// The name in files.
    pub fn name(self) -> &'static str {
        match self {
            Label::Normal => "NORMAL",
            Label::Dark => "DARK",
            Label::Gap => "GAP",
            Label::PositionOffset => "POSITION-OFFSET",
            Label::IdentityDuplicate => "IDENTITY-DUPLICATE",
        }
    }
    /// All labels, in matrix order.
    pub const ALL: [Label; 5] = [
        Label::Normal,
        Label::Dark,
        Label::Gap,
        Label::PositionOffset,
        Label::IdentityDuplicate,
    ];
}

/// The sea cells of the M2 area as integer cell indices (R2).
pub struct Sea {
    cells: HashSet<(i64, i64)>,
    list: Vec<(f64, f64)>,
}

fn cell_of(lat: f64, lon: f64) -> (i64, i64) {
    (
        ((lat - AREA_BOX_DEG[0]) / AREA_CELL_DEG).floor() as i64,
        ((lon - AREA_BOX_DEG[2]) / AREA_CELL_DEG).floor() as i64,
    )
}

impl Sea {
    /// The M2 sea points.
    pub fn m2() -> Self {
        let list = baltic_points();
        let cells = list.iter().map(|&(a, b)| cell_of(a, b)).collect();
        Self { cells, list }
    }
    /// Whether a position is at sea (R2).
    pub fn at_sea(&self, lat: f64, lon: f64) -> bool {
        let [la0, la1, lo0, lo1] = AREA_BOX_DEG;
        lat >= la0
            && lat < la1
            && lon >= lo0
            && lon < lo1
            && self.cells.contains(&cell_of(lat, lon))
    }
}

fn normal(r: &mut ChaCha8Rng) -> f64 {
    let u1: f64 = 1.0 - r.gen::<f64>();
    let u2: f64 = r.gen::<f64>();
    (-2.0 * u1.pln()).sqrt() * (2.0 * std::f64::consts::PI * u2).pcos()
}

/// Move `(lat, lon)` by `east`, `north` metres on the local flat plane (R4).
pub fn offset(lat: f64, lon: f64, east_m: f64, north_m: f64) -> (f64, f64) {
    let dlat = north_m / R_M / DEG;
    let dlon = east_m / (R_M * (lat * DEG).pcos()) / DEG;
    (lat + dlat, lon + dlon)
}

/// A vessel's true track: positions at every step `0..=SCENE_S/STEP_S`.
fn draw_track(
    sea: &Sea,
    r: &mut ChaCha8Rng,
    start_far_from: Option<(f64, f64)>,
) -> (Vec<(f64, f64)>, u32) {
    let n = (SCENE_S / STEP_S) as usize;
    let mut redraws = 0;
    'draw: loop {
        let c = sea.list[r.gen_range(0..sea.list.len())];
        let h = AREA_CELL_DEG / 2.0;
        let mut lat = c.0 + r.gen_range(-h..h);
        let mut lon = c.1 + r.gen_range(-h..h);
        let speed = r.gen_range(5.0..=22.0f64) * KN;
        let mut head = r.gen_range(0.0..360.0f64);
        let far = match start_far_from {
            Some(o) => {
                let (e, nn) = (
                    (lon - o.1) * DEG * R_M * (o.0 * DEG).pcos(),
                    (lat - o.0) * DEG * R_M,
                );
                (e * e + nn * nn).sqrt() >= 50_000.0
            }
            None => true,
        };
        // Phase plan: legs and turns until the scene ends.
        let mut track = Vec::with_capacity(n + 1);
        track.push((lat, lon));
        let mut leg_left = r.gen_range(1200.0..=5400.0f64);
        let mut turn: Option<(f64, f64)> = None; // (angle left, rate signed) deg, deg/s
        for _ in 0..n {
            let mut dt = STEP_S as f64;
            while dt > 0.0 {
                if let Some((left, rate)) = turn {
                    let need = left.abs() / rate.abs();
                    let use_t = need.min(dt);
                    head = (head + rate * use_t).rem_euclid(360.0);
                    dt -= use_t;
                    let left2 = left - rate * use_t;
                    if use_t >= need {
                        turn = None;
                        leg_left = r.gen_range(1200.0..=5400.0f64);
                    } else {
                        turn = Some((left2, rate));
                    }
                } else {
                    let use_t = leg_left.min(dt);
                    leg_left -= use_t;
                    dt -= use_t;
                    if leg_left <= 0.0 {
                        let ang = r.gen_range(10.0..=90.0f64);
                        let sign = if r.gen::<bool>() { 1.0 } else { -1.0 };
                        let rate = r.gen_range(1.0..=3.0f64) * sign;
                        turn = Some((ang * sign, rate));
                    }
                }
            }
            let (sh, ch) = (head * DEG).psin_cos();
            let step = speed * STEP_S as f64;
            let p = offset(lat, lon, step * sh, step * ch);
            lat = p.0;
            lon = p.1;
            track.push((lat, lon));
        }
        if !far || track.iter().any(|&(a, b)| !sea.at_sea(a, b)) {
            redraws += 1;
            continue 'draw;
        }
        return (track, redraws);
    }
}

/// One generated scene.
pub struct Scene {
    /// Seed.
    pub seed: u64,
    /// Truth document.
    pub truth: Value,
    /// AIS reports `(t, identity, lat, lon)`, sorted.
    pub ais: Vec<(u32, u64, f64, f64)>,
    /// RF fixes `(t, lat, lon)`, sorted.
    pub rf: Vec<(u32, f64, f64)>,
    /// The owner of each fix of `rf`: vessel index, or `-1 - k` for the `k`-th duplicate.
    pub rf_owner: Vec<i64>,
    /// Redraws (vessels that touched land).
    pub redraws: u32,
}

/// Satellite unit vectors and radii at every step (M2 readings 1, 2).
fn sat_positions() -> Vec<Vec<[f64; 3]>> {
    let els = primary_rf_layer().elements().unwrap_or_default();
    let body = Body::earth();
    (0..=SCENE_S / STEP_S)
        .map(|k| {
            satellite_positions_fixed(
                &body,
                std::slice::from_ref(&els),
                true,
                f64::from(k * STEP_S),
            )
        })
        .collect()
}

fn visible(sats: &[[f64; 3]], lat: f64, lon: f64, sin_mask: f64) -> bool {
    let (sp, cp) = (lat * DEG).psin_cos();
    let (sl, cl) = (lon * DEG).psin_cos();
    let u = [cp * cl, cp * sl, sp];
    let p = [R_M * u[0], R_M * u[1], R_M * u[2]];
    sats.iter().any(|s| {
        let d = [s[0] - p[0], s[1] - p[1], s[2] - p[2]];
        let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
        (d[0] * u[0] + d[1] * u[1] + d[2] * u[2]) / n >= sin_mask
    })
}

fn rf_fixes(
    r: &mut ChaCha8Rng,
    sats: &[Vec<[f64; 3]>],
    track: &[(f64, f64)],
    sin_mask: f64,
    owner: i64,
    out: &mut Vec<(u32, f64, f64, i64)>,
) {
    let vis: Vec<bool> = track
        .iter()
        .enumerate()
        .map(|(k, &(a, b))| visible(&sats[k], a, b, sin_mask))
        .collect();
    let mut k = 0;
    while k < vis.len() {
        if !vis[k] {
            k += 1;
            continue;
        }
        let s = k;
        while k < vis.len() && vis[k] {
            k += 1;
        }
        let e = k - 1;
        let mid = s + (e - s) / 2;
        if r.gen::<f64>() < 0.9 {
            let (a, b) = track[mid];
            let (fa, fb) = offset(a, b, 1000.0 * normal(r), 1000.0 * normal(r));
            out.push((mid as u32 * STEP_S, fa, fb, owner));
        }
    }
}

fn ais_reports(
    r: &mut ChaCha8Rng,
    id: u64,
    track: &[(f64, f64)],
    off: impl Fn(u32) -> Option<(f64, f64)>,
    silent: impl Fn(u32) -> bool,
    out: &mut Vec<(u32, u64, f64, f64)>,
) {
    for (k, &(a, b)) in track.iter().enumerate() {
        let t = k as u32 * STEP_S;
        if silent(t) || r.gen::<f64>() >= 0.8 {
            continue;
        }
        let (mut e, mut n) = (10.0 * normal(r), 10.0 * normal(r));
        if let Some((oe, on)) = off(t) {
            e += oe;
            n += on;
        }
        let (la, lo) = offset(a, b, e, n);
        out.push((t, id, la, lo));
    }
}

fn round_step(x: f64) -> u32 {
    ((x / STEP_S as f64).round() as u32) * STEP_S
}

/// Generate the scene of one seed (R1 to R11).
pub fn generate(seed: u64) -> Scene {
    let sea = Sea::m2();
    let sats = sat_positions();
    let sin_mask = (10.0 * DEG).psin();
    let mut r = ChaCha8Rng::seed_from_u64(seed);
    let mut labels: Vec<Label> = Vec::with_capacity(N_VESSELS);
    for (l, n) in [
        (Label::Normal, 1600),
        (Label::Dark, 140),
        (Label::Gap, 60),
        (Label::PositionOffset, 140),
        (Label::IdentityDuplicate, 60),
    ] {
        labels.extend(std::iter::repeat_n(l, n));
    }
    labels.shuffle(&mut r);
    let mut offsets: Vec<f64> = [2.0, 5.0, 10.0, 20.0, 50.0]
        .iter()
        .flat_map(|&d| std::iter::repeat_n(d, 28))
        .collect();
    offsets.shuffle(&mut r);
    let mut off_iter = offsets.into_iter();
    let mut ais = Vec::new();
    let mut rf = Vec::new();
    let mut redraws = 0;
    let mut truth_v = Vec::with_capacity(N_VESSELS);
    let mut dup_of: Vec<(usize, (f64, f64))> = Vec::new();
    for (i, &label) in labels.iter().enumerate() {
        let id = 200_000_000 + i as u64;
        let (track, rd) = draw_track(&sea, &mut r, None);
        redraws += rd;
        let mut entry = json!({"id": id, "label": label.name()});
        match label {
            Label::Normal | Label::IdentityDuplicate => {
                ais_reports(&mut r, id, &track, |_| None, |_| false, &mut ais);
                if label == Label::IdentityDuplicate {
                    dup_of.push((i, track[0]));
                }
            }
            Label::Dark => {}
            Label::Gap => {
                let len = round_step(r.gen_range(1800.0..=7200.0f64));
                let lo = 600.0;
                let hi = (SCENE_S - 600 - len) as f64;
                let g = round_step(r.gen_range(lo..=hi));
                entry["gap_s"] = json!([g, g + len]);
                ais_reports(
                    &mut r,
                    id,
                    &track,
                    |_| None,
                    |t| t >= g && t < g + len,
                    &mut ais,
                );
            }
            Label::PositionOffset => {
                let d = off_iter.next().unwrap_or(2.0);
                let on = round_step(r.gen_range(0.0..14_400.0f64));
                let dir = r.gen_range(0.0..360.0f64) * DEG;
                let (sd, cd) = dir.psin_cos();
                let (oe, onn) = (d * 1000.0 * sd, d * 1000.0 * cd);
                entry["offset_km"] = json!(d);
                entry["onset_s"] = json!(on);
                ais_reports(
                    &mut r,
                    id,
                    &track,
                    |t| (t >= on).then_some((oe, onn)),
                    |_| false,
                    &mut ais,
                );
            }
        }
        rf_fixes(&mut r, &sats, &track, sin_mask, i as i64, &mut rf);
        truth_v.push(entry);
    }
    let mut dups = Vec::new();
    for (k, (i, start)) in dup_of.into_iter().enumerate() {
        let id = 200_000_000 + i as u64;
        let (track, rd) = draw_track(&sea, &mut r, Some(start));
        redraws += rd;
        ais_reports(&mut r, id, &track, |_| None, |_| false, &mut ais);
        rf_fixes(&mut r, &sats, &track, sin_mask, -1 - k as i64, &mut rf);
        dups.push(json!({"original": id}));
    }
    ais.sort_by(|a, b| a.0.cmp(&b.0).then(a.1.cmp(&b.1)));
    rf.sort_by(|a, b| {
        a.0.cmp(&b.0)
            .then(a.1.partial_cmp(&b.1).unwrap_or(std::cmp::Ordering::Equal))
            .then(a.3.cmp(&b.3))
    });
    let rf_owner: Vec<i64> = rf.iter().map(|f| f.3).collect();
    let rf: Vec<(u32, f64, f64)> = rf.into_iter().map(|f| (f.0, f.1, f.2)).collect();
    let truth = json!({
        "schema": "kshana.m4-truth/1", "seed": seed, "scene_s": SCENE_S,
        "vessels": truth_v, "duplicates": dups, "redraws": redraws, "rf_owner": rf_owner,
    });
    Scene {
        seed,
        truth,
        ais,
        rf,
        rf_owner,
        redraws,
    }
}

impl Scene {
    /// The three files (truth, AIS, RF) as compact JSON, each ending in a newline (R11).
    pub fn files(&self) -> (String, String, String) {
        let ais: Vec<Value> = self
            .ais
            .iter()
            .map(|&(t, id, a, b)| json!([t, id, a, b]))
            .collect();
        let rf: Vec<Value> = self.rf.iter().map(|&(t, a, b)| json!([t, a, b])).collect();
        (
            format!("{}\n", self.truth),
            format!(
                "{}\n",
                json!({"schema": "kshana.m4-ais/1", "seed": self.seed, "reports": ais})
            ),
            format!(
                "{}\n",
                json!({"schema": "kshana.m4-rf/1", "seed": self.seed, "fixes": rf})
            ),
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sea_test_uses_the_m2_cells() {
        let sea = Sea::m2();
        let p = sea.list[0];
        assert!(sea.at_sea(p.0, p.1));
        assert!(!sea.at_sea(52.0, 20.0));
    }

    #[test]
    fn offset_moves_by_the_stated_metres() {
        let (a, b) = offset(60.0, 20.0, 0.0, 1000.0);
        assert!(((a - 60.0) * DEG * R_M - 1000.0).abs() < 1e-6 && b == 20.0);
    }
}
