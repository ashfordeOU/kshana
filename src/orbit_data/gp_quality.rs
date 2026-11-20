// SPDX-License-Identifier: AGPL-3.0-only
//! Quality monitors for general-perturbations element sets (two-line element sets, TLE).
//!
//! * [`compare`]: two sources for the same objects (for example the public GP catalogue and an
//!   operator's supplemental GP, or two archive days). For each catalogue number in both, the
//!   latest set of each source is propagated with SGP4 over a common window (from the later of the
//!   two epochs) and the position difference is reported: largest, root mean square and its RTN
//!   components at the largest, with a flag above a threshold.
//! * [`audit`]: one source on its own. Per set: the column-69 checksums, that line 1 and line 2 name
//!   the same object, that the elements parse, that the perigee is above the Earth's surface, that
//!   SGP4 initialises and propagates at the epoch and a day later, and the age of the epoch against
//!   a reference time (stale or in the future). Per object with several sets: element-set numbers
//!   that go backwards, repeated epochs, and consecutive sets that disagree (the earlier set
//!   propagated to the later epoch, compared with the later set) by more than a threshold, which
//!   marks a manoeuvre or a bad set.
//!
//! The propagator is the engine's SGP4 (WGS-72 constants, improved mode). Differences are MODELLED:
//! they compare two element sets through one model and say nothing about which is closer to the
//! true orbit. Thresholds are the caller's; the defaults (25 km, 30 days) are choices of this tool.

use super::cdm::rtn_axes;
use super::fmt_num;
use crate::sgp4::{wgs72, Sgp4};
use crate::tle::{parse_tle, tle_checksum, Tle};
use serde::Serialize;
use std::collections::BTreeMap;

/// One element set as read.
#[derive(Clone, Debug)]
pub struct ElementSet {
    /// The name line before the set, if any (`0 ` prefix removed).
    pub name: Option<String>,
    /// Line 1.
    pub line1: String,
    /// Line 2.
    pub line2: String,
    /// 1-based line number of line 1 in the input.
    pub line: usize,
    /// Catalogue number from line 1 (digits or Alpha-5), if readable.
    pub catalogue: Option<u32>,
    /// Elements, or why they did not parse.
    pub elements: Result<Tle, String>,
    /// Element set number (line 1, columns 65-68), if readable.
    pub elset_no: Option<u32>,
}

/// Read every two-line set in `text`; a line before line 1 that is neither line 1 nor line 2 is
/// taken as the name.
pub fn read_sets(text: &str) -> Vec<ElementSet> {
    let lines: Vec<&str> = text.lines().map(|l| l.trim_end_matches('\r')).collect();
    let mut out = Vec::new();
    let mut i = 0;
    while i < lines.len() {
        let l = lines[i];
        if l.starts_with("1 ") && i + 1 < lines.len() && lines[i + 1].starts_with("2 ") {
            let name = (i > 0)
                .then(|| lines[i - 1])
                .filter(|p| !p.starts_with("1 ") && !p.starts_with("2 ") && !p.trim().is_empty())
                .map(|p| p.strip_prefix("0 ").unwrap_or(p).trim().to_string());
            let l2 = lines[i + 1];
            let catalogue = l.get(2..7).and_then(|f| crate::norad::decode(f).ok());
            let elset_no = l.get(64..68).and_then(|f| f.trim().parse().ok());
            out.push(ElementSet {
                name,
                line1: l.to_string(),
                line2: l2.to_string(),
                line: i + 1,
                catalogue,
                elements: parse_tle(l, l2),
                elset_no,
            });
            i += 2;
        } else {
            i += 1;
        }
    }
    out
}

fn sgp4(t: &Tle) -> Sgp4 {
    t.to_sgp4(wgs72(), false)
}

/// Position (km, TEME) and velocity of a set at `epoch_days` (days since 1950 Jan 0.0 UTC).
fn at(s: &Sgp4, t: &Tle, epoch_days: f64) -> Result<[f64; 6], i32> {
    let (r, v) = s.propagate((epoch_days - t.epoch_days_1950) * 1440.0)?;
    Ok([r[0], r[1], r[2], v[0], v[1], v[2]])
}

/// Options of [`compare`].
#[derive(Clone, Copy, Debug)]
pub struct CompareOpts {
    /// Window length, hours.
    pub hours: f64,
    /// Step, minutes.
    pub step_min: f64,
    /// Flag threshold on the largest position difference, km.
    pub threshold_km: f64,
}

impl Default for CompareOpts {
    fn default() -> Self {
        CompareOpts {
            hours: 24.0,
            step_min: 10.0,
            threshold_km: 25.0,
        }
    }
}

/// The comparison of one object between two sources.
#[derive(Clone, Debug, Serialize)]
pub struct Comparison {
    /// Catalogue number.
    pub catalogue: u32,
    /// Name from source A, else B.
    pub name: Option<String>,
    /// Epoch of B minus epoch of A, hours.
    pub epoch_difference_h: f64,
    /// Largest position difference over the window, km.
    pub max_km: f64,
    /// Root-mean-square position difference, km.
    pub rms_km: f64,
    /// Radial, transverse and normal components (in B's RTN axes) at the largest difference, km.
    pub rtn_at_max_km: [f64; 3],
    /// True when `max_km` exceeds the threshold.
    pub flagged: bool,
    /// SGP4 error code, when a set could not be propagated over the whole window.
    pub sgp4_error: Option<i32>,
}

/// The result of [`compare`].
#[derive(Clone, Debug, Serialize)]
pub struct CompareReport {
    /// Objects in both sources, by catalogue number.
    pub objects: Vec<Comparison>,
    /// Catalogue numbers only in A.
    pub only_in_a: Vec<u32>,
    /// Catalogue numbers only in B.
    pub only_in_b: Vec<u32>,
    /// Number of objects flagged.
    pub flagged: usize,
    /// Threshold used, km.
    pub threshold_km: f64,
    /// Evidence label.
    pub evidence: &'static str,
}

fn latest(sets: &[ElementSet]) -> BTreeMap<u32, (&ElementSet, Tle)> {
    let mut m: BTreeMap<u32, (&ElementSet, Tle)> = BTreeMap::new();
    for s in sets {
        let (Some(c), Ok(t)) = (s.catalogue, &s.elements) else {
            continue;
        };
        match m.get(&c) {
            Some((_, old)) if old.epoch_days_1950 >= t.epoch_days_1950 => {}
            _ => {
                m.insert(c, (s, *t));
            }
        }
    }
    m
}

/// Compare source `a` with source `b` (the reference for the RTN axes).
pub fn compare(a: &[ElementSet], b: &[ElementSet], o: CompareOpts) -> CompareReport {
    let la = latest(a);
    let lb = latest(b);
    let mut objects = Vec::new();
    for (c, (sa, ta)) in &la {
        let Some((sb, tb)) = lb.get(c) else { continue };
        let (pa, pb) = (sgp4(ta), sgp4(tb));
        let t0 = ta.epoch_days_1950.max(tb.epoch_days_1950);
        let n = ((o.hours * 60.0) / o.step_min.max(1e-3)).floor() as usize;
        let mut max: f64 = 0.0;
        let mut rtn = [0.0; 3];
        let mut sum = 0.0;
        let mut count = 0usize;
        let mut err = None;
        for k in 0..=n {
            let t = t0 + k as f64 * o.step_min / 1440.0;
            match (at(&pa, ta, t), at(&pb, tb, t)) {
                (Ok(xa), Ok(xb)) => {
                    let d = [xa[0] - xb[0], xa[1] - xb[1], xa[2] - xb[2]];
                    let m = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
                    sum += m * m;
                    count += 1;
                    if m >= max {
                        max = m;
                        let ax = rtn_axes(&xb);
                        rtn = std::array::from_fn(|i| {
                            ax[i][0] * d[0] + ax[i][1] * d[1] + ax[i][2] * d[2]
                        });
                    }
                }
                (Err(e), _) | (_, Err(e)) => {
                    err = Some(e);
                    break;
                }
            }
        }
        let rms = if count > 0 {
            (sum / count as f64).sqrt()
        } else {
            f64::NAN
        };
        objects.push(Comparison {
            catalogue: *c,
            name: sa.name.clone().or_else(|| sb.name.clone()),
            epoch_difference_h: (tb.epoch_days_1950 - ta.epoch_days_1950) * 24.0,
            max_km: max,
            rms_km: rms,
            rtn_at_max_km: rtn,
            flagged: max > o.threshold_km || err.is_some(),
            sgp4_error: err,
        });
    }
    let flagged = objects.iter().filter(|c| c.flagged).count();
    CompareReport {
        only_in_a: la.keys().filter(|c| !lb.contains_key(c)).copied().collect(),
        only_in_b: lb.keys().filter(|c| !la.contains_key(c)).copied().collect(),
        objects,
        flagged,
        threshold_km: o.threshold_km,
        evidence: "MODELLED",
    }
}

impl CompareReport {
    /// A table: one row per object, flagged rows marked, then a summary line.
    pub fn to_text(&self) -> String {
        let mut s = format!(
            "{:>9}  {:>10}  {:>10}  {:>9}  {:>9}  {:>9}  {:>8}  {}\n",
            "catalogue", "max km", "rms km", "R km", "T km", "N km", "dt h", "flag"
        );
        for c in &self.objects {
            s.push_str(&format!(
                "{:>9}  {:>10.3}  {:>10.3}  {:>9.3}  {:>9.3}  {:>9.3}  {:>8.2}  {}\n",
                c.catalogue,
                c.max_km,
                c.rms_km,
                c.rtn_at_max_km[0],
                c.rtn_at_max_km[1],
                c.rtn_at_max_km[2],
                c.epoch_difference_h,
                if c.flagged { "FLAG" } else { "" }
            ));
        }
        s.push_str(&crate::t!(
            "orbit-data-gp-compare-summary",
            n = self.objects.len(),
            flagged = self.flagged,
            threshold = fmt_num(self.threshold_km),
            only_a = self.only_in_a.len(),
            only_b = self.only_in_b.len()
        ));
        s.push('\n');
        s
    }
}

/// Options of [`audit`].
#[derive(Clone, Copy, Debug)]
pub struct AuditOpts {
    /// Reference time (days since 1950 Jan 0.0 UTC) for the age checks; none skips them.
    pub reference_days: Option<f64>,
    /// Age above which a set is stale, days.
    pub stale_days: f64,
    /// Consecutive-set disagreement threshold, km.
    pub jump_km: f64,
}

impl Default for AuditOpts {
    fn default() -> Self {
        AuditOpts {
            reference_days: None,
            stale_days: 30.0,
            jump_km: 25.0,
        }
    }
}

/// One audit finding.
#[derive(Clone, Debug, Serialize)]
pub struct AuditFinding {
    /// Catalogue number, if readable.
    pub catalogue: Option<u32>,
    /// Line of the set's line 1.
    pub line: usize,
    /// `error` (the set is unusable or corrupt) or `warning`.
    pub severity: super::Severity,
    /// Stable machine code.
    pub code: &'static str,
    /// What was found.
    pub message: String,
}

/// The result of [`audit`].
#[derive(Clone, Debug, Serialize)]
pub struct AuditReport {
    /// Sets read.
    pub sets: usize,
    /// Distinct catalogue numbers.
    pub objects: usize,
    /// Findings, in input order and then per object.
    pub findings: Vec<AuditFinding>,
    /// Evidence label (propagation-based checks are MODELLED).
    pub evidence: &'static str,
}

const EARTH_RADIUS_KM: f64 = 6378.135;
const MU_KM3_S2: f64 = 398_600.8;

/// Audit one source of element sets.
pub fn audit(sets: &[ElementSet], o: AuditOpts) -> AuditReport {
    use super::Severity::{Error, Warning};
    let mut f = Vec::new();
    let mut push = |s: &ElementSet, sev, code, message| {
        f.push(AuditFinding {
            catalogue: s.catalogue,
            line: s.line,
            severity: sev,
            code,
            message,
        })
    };
    for s in sets {
        for (n, l) in [(1, &s.line1), (2, &s.line2)] {
            let want = l.as_bytes().get(68).filter(|b| b.is_ascii_digit());
            if want.is_none_or(|w| u32::from(w - b'0') != tle_checksum(l)) {
                push(
                    s,
                    Error,
                    "checksum",
                    crate::t!("orbit-data-gp-checksum", line = n, want = tle_checksum(l)),
                );
            }
        }
        let c2 = s.line2.get(2..7).and_then(|f| crate::norad::decode(f).ok());
        if s.catalogue.is_none() || c2 != s.catalogue {
            push(s, Error, "catalogue", crate::t!("orbit-data-gp-catalogue"));
        }
        let t = match &s.elements {
            Ok(t) => *t,
            Err(e) => {
                push(
                    s,
                    Error,
                    "parse",
                    crate::t!("orbit-data-parse-failed", err = e.as_str()),
                );
                continue;
            }
        };
        let n_rad_s = t.no_kozai_rad_min / 60.0;
        let a_km = (MU_KM3_S2 / (n_rad_s * n_rad_s)).cbrt();
        let perigee = a_km * (1.0 - t.ecco) - EARTH_RADIUS_KM;
        if perigee < 0.0 {
            push(
                s,
                Error,
                "perigee",
                crate::t!("orbit-data-gp-perigee", km = fmt_num(perigee)),
            );
        }
        let p = sgp4(&t);
        if let Err(code) = p.propagate(0.0) {
            push(
                s,
                Error,
                "sgp4",
                crate::t!("orbit-data-gp-sgp4", code = code, days = 0),
            );
        } else if let Err(code) = p.propagate(1440.0) {
            push(
                s,
                Warning,
                "sgp4",
                crate::t!("orbit-data-gp-sgp4", code = code, days = 1),
            );
        }
        if let Some(r) = o.reference_days {
            let age = r - t.epoch_days_1950;
            if age > o.stale_days {
                push(
                    s,
                    Warning,
                    "stale",
                    crate::t!(
                        "orbit-data-gp-stale",
                        days = fmt_num((age * 100.0).round() / 100.0),
                        max = fmt_num(o.stale_days)
                    ),
                );
            } else if age < 0.0 {
                push(
                    s,
                    Warning,
                    "future-epoch",
                    crate::t!(
                        "orbit-data-gp-future",
                        days = fmt_num((-age * 100.0).round() / 100.0)
                    ),
                );
            }
        }
    }
    // Per object, in epoch order.
    let mut by: BTreeMap<u32, Vec<(&ElementSet, Tle)>> = BTreeMap::new();
    for s in sets {
        if let (Some(c), Ok(t)) = (s.catalogue, &s.elements) {
            by.entry(c).or_default().push((s, *t));
        }
    }
    for list in by.values_mut() {
        list.sort_by(|a, b| a.1.epoch_days_1950.total_cmp(&b.1.epoch_days_1950));
        for w in list.windows(2) {
            let ((sa, ta), (sb, tb)) = (w[0], w[1]);
            if (tb.epoch_days_1950 - ta.epoch_days_1950).abs() < 1e-9 {
                if sa.line2 != sb.line2 {
                    push(
                        sb,
                        Warning,
                        "repeated-epoch",
                        crate::t!("orbit-data-gp-repeated-epoch"),
                    );
                }
                continue;
            }
            if let (Some(na), Some(nb)) = (sa.elset_no, sb.elset_no) {
                if nb < na {
                    push(
                        sb,
                        Warning,
                        "elset-number",
                        crate::t!("orbit-data-gp-elset-number", a = na, b = nb),
                    );
                }
            }
            let (pa, pb) = (sgp4(&ta), sgp4(&tb));
            if let (Ok(xa), Ok(xb)) = (
                at(&pa, &ta, tb.epoch_days_1950),
                at(&pb, &tb, tb.epoch_days_1950),
            ) {
                let d =
                    ((xa[0] - xb[0]).powi(2) + (xa[1] - xb[1]).powi(2) + (xa[2] - xb[2]).powi(2))
                        .sqrt();
                if d > o.jump_km {
                    push(
                        sb,
                        Warning,
                        "consecutive-jump",
                        crate::t!(
                            "orbit-data-gp-jump",
                            km = fmt_num((d * 1000.0).round() / 1000.0),
                            hours = fmt_num(
                                ((tb.epoch_days_1950 - ta.epoch_days_1950) * 2400.0).round()
                                    / 100.0
                            ),
                            max = fmt_num(o.jump_km)
                        ),
                    );
                }
            }
        }
    }
    AuditReport {
        sets: sets.len(),
        objects: by.len(),
        findings: f,
        evidence: "MODELLED",
    }
}

impl AuditReport {
    /// Findings as text, then a summary line.
    pub fn to_text(&self) -> String {
        let mut s = String::new();
        for f in &self.findings {
            let sev = match f.severity {
                super::Severity::Error => crate::t!("orbit-data-error"),
                super::Severity::Warning => crate::t!("orbit-data-warning"),
            };
            let cat = f.catalogue.map(|c| c.to_string()).unwrap_or_default();
            s.push_str(&format!(
                "{sev}:{}  {cat}  [{}]  {}\n",
                f.line, f.code, f.message
            ));
        }
        s.push_str(&crate::t!(
            "orbit-data-gp-audit-summary",
            sets = self.sets,
            objects = self.objects,
            findings = self.findings.len()
        ));
        s.push('\n');
        s
    }
}
