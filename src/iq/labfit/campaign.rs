// SPDX-License-Identifier: AGPL-3.0-only
//! **The campaign loader of the lab fit from IQ campaigns** (`docs/design/LABFIT-FROM-IQ.md`
//! §2).
//!
//! Reads a `kshana iq campaign` output folder: `campaign.json` (the resolved campaign, with
//! every recording's test conditions and their hash), the `kshana.campaign-cell/1` cell files
//! and the `DIGEST`, checks every hash it can, and groups the per-satellite event scores into
//! **fit units**, one per (signal, loop design, front-end chain, jammer type). Recordings and
//! satellites are the data inside a unit; units are never pooled across designs or front
//! ends. The loader never reruns the receiver, so a fit is reproducible from the campaign
//! `DIGEST` alone.
//!
//! A C/N0 bin is **censored** when the satellite was locked for less than 90 % of the time
//! the stated J/S spent in the bin. That fraction is the bin's locked time (the time from
//! onset to the scored first loss, or to the event's end without a loss) over the bin's
//! time, both read from the stated power profile. Re-locks inside the event are not credited,
//! so a bin after a loss is censored even if the channel re-locked in it: the conservative
//! side.

use std::collections::BTreeMap;
use std::path::Path;

use serde::Serialize;

use crate::iq::campaign::conditions::{Interpolation, PowerProfile};
use crate::iq::campaign::hash::{sha256_file, sha256_hex};
use crate::iq::campaign::runner::cell_path;
use crate::iq::campaign::score::reference_q;
use crate::iq::campaign::{CellResult, Plan};
use crate::jamming::Q_CW;

/// Locked fraction of a bin below which the bin is censored.
pub const MIN_LOCKED_FRACTION: f64 = 0.9;

/// One C/N0 bin of one satellite's event.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Bin {
    /// Stated J/S of the bin (dB).
    pub js_db: f64,
    /// Locked epochs in the bin.
    pub n: u64,
    /// Measured C/N0 (dB-Hz).
    pub measured_cn0_dbhz: Option<f64>,
    /// Fraction of the bin's stated time the satellite was locked.
    pub locked_fraction: f64,
    /// Whether the bin is kept out of the fit.
    pub censored: bool,
}

/// One satellite's scores for one event in one recording.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SatEvent {
    /// Satellite id.
    pub sat: i64,
    /// Event id.
    pub event_id: String,
    /// Onset (s).
    pub onset_s: f64,
    /// End (s).
    pub offset_s: f64,
    /// Measured baseline C/N0 (dB-Hz).
    pub baseline_cn0_dbhz: Option<f64>,
    /// The bins.
    pub bins: Vec<Bin>,
    /// Locked at the onset.
    pub locked_at_onset: bool,
    /// Lost lock in the event.
    pub lost: bool,
    /// Time from onset to the loss (s).
    pub time_to_loss_s: Option<f64>,
    /// Stated J/S at the loss (dB).
    pub js_at_loss_db: Option<f64>,
    /// Re-acquired after the loss.
    pub reacquired: bool,
    /// Re-acquisition time, from the later of the loss and the event's end (s).
    pub reacq_time_s: Option<f64>,
    /// End of the scored stream (s): the settle time plus the whole run's scored time.
    pub run_end_s: Option<f64>,
    /// The stated power profile.
    #[serde(skip)]
    pub power: Option<PowerProfile>,
}

impl SatEvent {
    /// The stated J/S at `t_s`.
    pub fn js_at(&self, t_s: f64) -> Option<f64> {
        self.power.as_ref().map(|p| p.js_db_at(t_s))
    }

    /// The largest stated J/S within the event.
    pub fn peak_js_db(&self) -> Option<f64> {
        let p = self.power.as_ref()?;
        let mut m = p.js_db_at(self.onset_s);
        for pt in &p.points {
            if pt[0] >= self.onset_s && pt[0] < self.offset_s {
                m = m.max(p.js_db_at(pt[0]));
            }
        }
        Some(m)
    }

    /// The mean J/S rate over the event's rising part (dB/s): peak minus the onset level over
    /// the time to reach the peak; 0 for a step.
    pub fn ramp_db_per_s(&self) -> f64 {
        let Some(p) = &self.power else { return 0.0 };
        let j0 = p.js_db_at(self.onset_s);
        let mut best = (0.0, self.onset_s);
        for pt in &p.points {
            if pt[0] > self.onset_s && pt[0] <= self.offset_s {
                let j = p.js_db_at(pt[0]) - j0;
                if j > best.0 {
                    best = (j, pt[0]);
                }
            }
        }
        if p.interpolation == Interpolation::Step || best.1 <= self.onset_s {
            0.0
        } else {
            best.0 / (best.1 - self.onset_s)
        }
    }
}

/// One recording inside a unit: its cell and its satellites' event scores.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct UnitRecording {
    /// Recording id.
    pub recording: String,
    /// The cell's key.
    pub cell_key: String,
    /// Satellite events.
    pub events: Vec<SatEvent>,
}

/// A name and its content hash.
#[derive(Clone, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
pub struct Named {
    /// Name.
    pub name: String,
    /// Hash.
    pub hash: String,
}

/// One fit unit: (signal, loop design, front-end chain, jammer type).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FitUnit {
    /// Signal.
    pub signal: String,
    /// Loop design.
    pub design: Named,
    /// Front-end chain.
    pub frontend: Named,
    /// Jammer type as stated.
    pub jammer_type: String,
    /// Chip rate of the signal (chips/s).
    pub chip_rate_hz: f64,
    /// The stated `Q`.
    pub q_stated: f64,
    /// Where the stated `Q` comes from.
    pub q_source: String,
    /// Recordings, in id order.
    pub recordings: Vec<UnitRecording>,
}

/// A loaded campaign.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CampaignData {
    /// The campaign `DIGEST`.
    pub digest: String,
    /// SHA-256 of `campaign.json`.
    pub campaign_json_sha256: String,
    /// Every cell key with the SHA-256 of its file.
    pub cells: Vec<(String, String)>,
    /// Every recording's test-condition hash.
    pub test_conditions: Vec<(String, String)>,
    /// Scoring re-acquisition grace (s).
    pub reacq_grace_s: f64,
    /// The fit units.
    pub units: Vec<FitUnit>,
}

/// The stated `Q` of an event and its source: the event's `q`, the type table, or for a
/// type without a table value (including an unstated type) the most damaging stated value,
/// the smallest `Q` the table holds (CW).
pub fn stated_q(ev: &crate::iq::campaign::conditions::Event) -> (f64, String) {
    match reference_q(ev) {
        Some((q, s)) => (q, s.to_string()),
        None => (
            Q_CW,
            format!(
                "most damaging stated Q (cw): no table value for type `{}`",
                ev.event_type.name()
            ),
        ),
    }
}

/// The time (s) the stated J/S of `p` spends in the bin of width `w` centred on `js`
/// within `[a, b)`, and of that, within `[a, locked_end)`. Integrated numerically over a
/// fine time grid (1 ms or 1/2000 of the interval, whichever is finer).
fn bin_times(p: &PowerProfile, js: f64, w: f64, a: f64, b: f64, locked_end: f64) -> (f64, f64) {
    if b <= a {
        return (0.0, 0.0);
    }
    let n = (((b - a) / 1e-3).ceil() as usize).clamp(2000, 2_000_000);
    let dt = (b - a) / n as f64;
    let k = (js / w).round() as i64;
    let (mut tot, mut locked) = (0.0, 0.0);
    for i in 0..n {
        let t = a + (i as f64 + 0.5) * dt;
        let j = p.js_db_at(t);
        if j.is_finite() && (j / w).round() as i64 == k {
            tot += dt;
            if t < locked_end {
                locked += dt;
            }
        }
    }
    (tot, locked)
}

fn chip_rate(signal: &str, id: i64) -> Option<f64> {
    use crate::iq::SpreadingCode as _;
    crate::iq::cli::build_code(signal, id)
        .ok()
        .map(|c| c.chip_rate_hz())
}

/// Load the campaign in `out_dir` into fit units. Every planned cell must be present; the
/// `DIGEST` is recomputed and must match the file, and every recording's stated conditions
/// must reproduce their recorded hash.
pub fn load(out_dir: &Path) -> Result<CampaignData, String> {
    let plan_path = out_dir.join("campaign.json");
    let plan_bytes =
        std::fs::read(&plan_path).map_err(|e| format!("{}: {e}", plan_path.display()))?;
    let plan: Plan =
        serde_json::from_slice(&plan_bytes).map_err(|e| format!("{}: {e}", plan_path.display()))?;
    let digest = crate::iq::campaign::report::digest(out_dir)?
        .ok_or_else(|| format!("{}: the campaign is not complete", out_dir.display()))?;
    if let Ok(on_disk) = std::fs::read_to_string(out_dir.join("DIGEST")) {
        if on_disk.trim() != digest {
            return Err(format!(
                "{}: DIGEST {} does not match the cells ({digest})",
                out_dir.display(),
                on_disk.trim()
            ));
        }
    }
    let mut tc_hashes = Vec::new();
    for r in &plan.recordings {
        let h = r.conditions.hash().to_string();
        if h != r.conditions_hash {
            return Err(format!(
                "recording `{}`: test conditions hash {h} does not match the recorded {}",
                r.id, r.conditions_hash
            ));
        }
        tc_hashes.push((r.id.clone(), h));
    }
    let grace = plan.scoring.reacq_grace_s;
    let bin_w = plan.scoring.js_bin_db;
    let mut cells = Vec::new();
    type Key = (String, Named, Named, String);
    let mut units: BTreeMap<Key, FitUnit> = BTreeMap::new();
    for pc in &plan.cells {
        let path = cell_path(out_dir, &pc.key);
        let text =
            std::fs::read_to_string(&path).map_err(|e| format!("{}: {e}", path.display()))?;
        let cell: CellResult =
            serde_json::from_str(&text).map_err(|e| format!("{}: {e}", path.display()))?;
        cells.push((pc.key.clone(), sha256_file(&path)?.to_string()));
        let rec = &plan.recordings[pc.recording];
        let tc = &rec.conditions;
        let design = Named {
            name: cell.design.name.clone(),
            hash: cell.design.hash.clone(),
        };
        let frontend = Named {
            name: cell.frontend.name.clone(),
            hash: cell.frontend.hash.clone(),
        };
        for cs in &cell.satellites {
            let s = &cs.score;
            for e in &s.events {
                let Some(ev) = tc.events.iter().find(|x| x.id == e.event_id) else {
                    continue;
                };
                // Only events with a stated power profile carry a J/S to fit against.
                if ev.power.is_none() {
                    continue;
                }
                let jt = ev.event_type.name().to_string();
                let (q_stated, q_source) = stated_q(ev);
                let Some(rc) = e
                    .modelled
                    .as_ref()
                    .map(|m| m.chip_rate_hz)
                    .or_else(|| chip_rate(&s.signal, s.id))
                else {
                    return Err(format!("signal `{}`: unknown chip rate", s.signal));
                };
                let locked_end = match (e.locked_at_onset, e.time_to_loss_s) {
                    (false, _) => e.onset_s,
                    (true, Some(t)) => e.onset_s + t,
                    (true, None) => e.offset_s,
                };
                let p = ev.power.clone().expect("checked above");
                let bins = e
                    .cn0_curve
                    .iter()
                    .map(|b| {
                        let (tot, locked) =
                            bin_times(&p, b.js_db, bin_w, e.onset_s, e.offset_s, locked_end);
                        let frac = if tot > 0.0 { locked / tot } else { 0.0 };
                        Bin {
                            js_db: b.js_db,
                            n: b.n,
                            measured_cn0_dbhz: b.measured_cn0_dbhz,
                            locked_fraction: frac,
                            censored: frac < MIN_LOCKED_FRACTION
                                || b.measured_cn0_dbhz.is_none()
                                || b.n == 0,
                        }
                    })
                    .collect();
                let key = (
                    s.signal.clone(),
                    design.clone(),
                    frontend.clone(),
                    jt.clone(),
                );
                let unit = units.entry(key).or_insert_with(|| FitUnit {
                    signal: s.signal.clone(),
                    design: design.clone(),
                    frontend: frontend.clone(),
                    jammer_type: jt.clone(),
                    chip_rate_hz: rc,
                    q_stated,
                    q_source: q_source.clone(),
                    recordings: Vec::new(),
                });
                if unit.q_stated != q_stated {
                    // Events of one type with different stated Q (an event `q`): keep the
                    // most damaging, and say so.
                    if q_stated < unit.q_stated {
                        unit.q_stated = q_stated;
                        unit.q_source = q_source.clone();
                    }
                    if !unit.q_source.contains("differs between events") {
                        unit.q_source.push_str(
                            "; stated Q differs between events: the smallest (most damaging) is used",
                        );
                    }
                }
                let se = SatEvent {
                    sat: s.id,
                    event_id: e.event_id.clone(),
                    onset_s: e.onset_s,
                    offset_s: e.offset_s,
                    baseline_cn0_dbhz: e.baseline_cn0_dbhz,
                    bins,
                    locked_at_onset: e.locked_at_onset,
                    lost: e.lost,
                    time_to_loss_s: e.time_to_loss_s,
                    js_at_loss_db: e.js_at_loss_db,
                    reacquired: e.reacquired,
                    reacq_time_s: e.reacq_time_s,
                    run_end_s: Some(tc.recording.settle_s + s.whole_run.scored_s),
                    power: Some(p),
                };
                match unit.recordings.iter_mut().find(|r| r.recording == rec.id) {
                    Some(r) => r.events.push(se),
                    None => unit.recordings.push(UnitRecording {
                        recording: rec.id.clone(),
                        cell_key: pc.key.clone(),
                        events: vec![se],
                    }),
                }
            }
        }
    }
    let mut units: Vec<FitUnit> = units.into_values().collect();
    for u in &mut units {
        u.recordings.sort_by(|a, b| a.recording.cmp(&b.recording));
        for r in &mut u.recordings {
            r.events
                .sort_by(|a, b| (a.sat, &a.event_id).cmp(&(b.sat, &b.event_id)));
        }
    }
    cells.sort();
    Ok(CampaignData {
        digest,
        campaign_json_sha256: sha256_hex(&plan_bytes).to_string(),
        cells,
        test_conditions: tc_hashes,
        reacq_grace_s: grace,
        units,
    })
}
