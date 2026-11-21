// SPDX-License-Identifier: AGPL-3.0-only
//! RTK fix verification and float-precision warnings.
//!
//! Reads a solution file (RTKLIB-style `.pos`, in latitude/longitude/height or ECEF, or NMEA
//! GGA sentences), splits it into occupations (runs where the antenna stays within
//! `static_radius_m` of where the run began, for at least `min_epochs` epochs) and checks each
//! one independently of the receiver's own fix flag:
//!
//! * **inconsistent fixes**: the fixed epochs of one occupation fall into runs (a run ends at
//!   any epoch that is not fixed) whose positions disagree by more than the tolerance (3 cm
//!   horizontal, 5 cm vertical by default). Two fixes of one point cannot both be right; the run
//!   with fewer epochs (or, with a control point, the one farther from it) is named as the
//!   suspect. When the disagreement is close to a whole carrier wavelength (L1 19.0 cm, L2
//!   24.4 cm, L5 25.5 cm, wide-lane 86.2 cm) the finding says so: one wrong integer is the
//!   likely cause.
//! * **fix jump**: consecutive fixed epochs of one run differ by more than the tolerance.
//! * **fix disagrees with float**: the fixed position lies more than four of the float's own
//!   standard deviations, and more than the tolerance, from the converged float positions.
//! * **control mismatch**: the fixed position is farther than the tolerance from a known point.
//! * **optimistic sigma**: the scatter of the fixed positions is more than three times the
//!   standard deviation the solution reports, and more than 1 cm.
//! * **float precision misleads**: no fix, yet the solution reports a horizontal standard
//!   deviation under 2 cm; a float solution's formal precision is not its accuracy.
//! * **low ratio** (more than a fifth of the fixed epochs under a ratio of 3) and **stale
//!   corrections** (an age of differential over 10 s).
//!
//! The checks look at positions only; they cannot see a wrong fix that every run of an
//! occupation shares. Thresholds are this module's: MODELLED.

use crate::frames::{ecef_to_geodetic, geodetic_to_ecef, Geodetic, Vec3};
use serde::Serialize;

/// Evidence label of every report.
pub const LABEL: &str = "MODELLED";

/// Carrier wavelengths (m) a wrong integer shifts a position by, with their names.
const WAVELENGTHS: [(&str, f64); 4] = [
    ("L1", 0.1903),
    ("L2", 0.2442),
    ("L5", 0.2548),
    ("wide-lane", 0.8619),
];

/// One solution epoch.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SolEpoch {
    /// Seconds on the file's own time line (GPS week and seconds, or the date and time).
    pub t_s: f64,
    /// The time as written.
    pub time: String,
    /// ECEF, m.
    pub ecef_m: [f64; 3],
    /// Quality in RTKLIB's numbering: 1 fix, 2 float, 3 SBAS, 4 DGNSS, 5 single, 6 PPP.
    pub q: u8,
    /// Satellites used.
    pub ns: Option<u32>,
    /// Reported standard deviations east, north, up (m).
    pub sd_enu_m: Option<[f64; 3]>,
    /// Age of differential (s).
    pub age_s: Option<f64>,
    /// Ambiguity ratio.
    pub ratio: Option<f64>,
}

fn civil_seconds(date: &str, time: &str) -> Option<f64> {
    let d: Vec<i64> = date
        .split(['/', '-'])
        .filter_map(|x| x.parse().ok())
        .collect();
    let t: Vec<f64> = time.split(':').filter_map(|x| x.parse().ok()).collect();
    if d.len() != 3 || t.len() != 3 {
        return None;
    }
    let days = crate::gnss_time::days_from_civil(d[0], d[1] as u32, d[2] as u32);
    Some(days as f64 * 86_400.0 + t[0] * 3600.0 + t[1] * 60.0 + t[2])
}

fn llh_to_ecef(lat: f64, lon: f64, h: f64) -> Vec3 {
    geodetic_to_ecef(Geodetic {
        lat_rad: lat.to_radians(),
        lon_rad: lon.to_radians(),
        alt_m: h,
    })
}

/// Read an RTKLIB-style `.pos` file.
pub fn parse_pos(text: &str) -> Result<Vec<SolEpoch>, String> {
    let mut ecef_cols = None;
    let mut out = Vec::new();
    for (n, line) in text.lines().enumerate() {
        let l = line.trim();
        if l.is_empty() {
            continue;
        }
        if l.starts_with('%') {
            if l.contains("latitude(deg)") {
                ecef_cols = Some(false);
            } else if l.contains("x-ecef(m)") {
                ecef_cols = Some(true);
            } else if l.contains("latitude(d'\")") || l.contains("baseline(m)") {
                return Err(crate::terr!("e-rtkqa-pos-columns"));
            }
            continue;
        }
        let f: Vec<&str> = l.split_whitespace().collect();
        let bad = || crate::terr!("e-rtkqa-pos-line", line = (n + 1).to_string());
        let (t_s, time, rest) = if f
            .first()
            .is_some_and(|x| x.contains('/') || x.contains('-'))
            && f.len() > 1
        {
            (
                civil_seconds(f[0], f[1]).ok_or_else(bad)?,
                format!("{} {}", f[0], f[1]),
                &f[2..],
            )
        } else if f.len() > 1 {
            let w: f64 = f[0].parse().map_err(|_| bad())?;
            let tow: f64 = f[1].parse().map_err(|_| bad())?;
            (w * 604_800.0 + tow, format!("{} {}", f[0], f[1]), &f[2..])
        } else {
            return Err(bad());
        };
        let num = |i: usize| rest.get(i).and_then(|v| v.parse::<f64>().ok());
        let (Some(a), Some(b), Some(c), Some(q)) = (num(0), num(1), num(2), num(3)) else {
            return Err(bad());
        };
        let is_ecef = ecef_cols.unwrap_or(a.abs() > 1000.0 || b.abs() > 1000.0);
        let ecef = if is_ecef {
            [a, b, c]
        } else {
            llh_to_ecef(a, b, c)
        };
        let sd = match (num(5), num(6), num(7)) {
            (Some(s1), Some(s2), Some(s3)) if is_ecef => {
                // rotate the diagonal ECEF variances into east, north, up (correlations left out)
                let g = ecef_to_geodetic(ecef);
                let (sl, cl, so, co) = (
                    g.lat_rad.sin(),
                    g.lat_rad.cos(),
                    g.lon_rad.sin(),
                    g.lon_rad.cos(),
                );
                let rows = [
                    [-so, co, 0.0],
                    [-sl * co, -sl * so, cl],
                    [cl * co, cl * so, sl],
                ];
                let v = [s1 * s1, s2 * s2, s3 * s3];
                let r = |k: usize| {
                    (rows[k][0].powi(2) * v[0]
                        + rows[k][1].powi(2) * v[1]
                        + rows[k][2].powi(2) * v[2])
                        .sqrt()
                };
                Some([r(0), r(1), r(2)])
            }
            (Some(sn), Some(se), Some(su)) => Some([se, sn, su]),
            _ => None,
        };
        out.push(SolEpoch {
            t_s,
            time,
            ecef_m: ecef,
            q: q as u8,
            ns: num(4).map(|v| v as u32),
            sd_enu_m: sd,
            age_s: num(11),
            ratio: num(12),
        });
    }
    Ok(out)
}

fn nmea_angle(v: &str, hemi: &str, deg_digits: usize) -> Option<f64> {
    if v.len() <= deg_digits {
        return None;
    }
    let d: f64 = v[..deg_digits].parse().ok()?;
    let m: f64 = v[deg_digits..].parse().ok()?;
    let x = d + m / 60.0;
    Some(if hemi == "S" || hemi == "W" { -x } else { x })
}

/// Read NMEA GGA sentences (any talker). Quality 4 is a fix, 5 float, 2 DGNSS, 1 single; the
/// time line is the UTC time of day, carried across midnight. No standard deviations.
pub fn parse_gga(text: &str) -> Result<Vec<SolEpoch>, String> {
    let mut out = Vec::new();
    let mut day = 0.0;
    let mut last = -1.0;
    for line in text.lines() {
        let l = line.trim();
        let Some(body) = l.strip_prefix('$') else {
            continue;
        };
        let body = body.split('*').next().unwrap_or("");
        let f: Vec<&str> = body.split(',').collect();
        if f.len() < 10 || !f[0].ends_with("GGA") || f[1].len() < 6 {
            continue;
        }
        let (Some(lat), Some(lon)) = (nmea_angle(f[2], f[3], 2), nmea_angle(f[4], f[5], 3)) else {
            continue;
        };
        let tod = f[1][..2].parse::<f64>().unwrap_or(0.0) * 3600.0
            + f[1][2..4].parse::<f64>().unwrap_or(0.0) * 60.0
            + f[1][4..].parse::<f64>().unwrap_or(0.0);
        if tod < last {
            day += 86_400.0;
        }
        last = tod;
        let q = match f[6] {
            "4" => 1,
            "5" => 2,
            "2" => 4,
            "1" => 5,
            _ => continue,
        };
        let alt: f64 = f[9].parse().unwrap_or(0.0);
        let sep: f64 = f.get(11).and_then(|v| v.parse().ok()).unwrap_or(0.0);
        out.push(SolEpoch {
            t_s: day + tod,
            time: f[1].to_string(),
            ecef_m: llh_to_ecef(lat, lon, alt + sep),
            q,
            ns: f[7].parse().ok(),
            sd_enu_m: None,
            age_s: f.get(13).and_then(|v| v.parse().ok()),
            ratio: None,
        });
    }
    if out.is_empty() {
        return Err(crate::terr!("e-rtkqa-no-solutions"));
    }
    Ok(out)
}

/// Read a solution file, NMEA or `.pos` by its content.
pub fn parse_solutions(text: &str) -> Result<Vec<SolEpoch>, String> {
    let nmea = text
        .lines()
        .any(|l| l.trim_start().starts_with('$') && l.contains("GGA,"));
    let v = if nmea {
        parse_gga(text)?
    } else {
        parse_pos(text)?
    };
    if v.is_empty() {
        return Err(crate::terr!("e-rtkqa-no-solutions"));
    }
    Ok(v)
}

/// A known point.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Control {
    /// Name.
    pub name: String,
    /// Latitude, longitude (deg), ellipsoidal height (m).
    pub llh: [f64; 3],
}

/// Thresholds.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FixConfig {
    /// An occupation is the antenna staying within this radius (m; default 2).
    pub static_radius_m: f64,
    /// ... for at least this many epochs (default 5).
    pub min_epochs: usize,
    /// Horizontal tolerance (m; default 0.03).
    pub h_tol_m: f64,
    /// Vertical tolerance (m; default 0.05).
    pub v_tol_m: f64,
}

impl Default for FixConfig {
    fn default() -> Self {
        Self {
            static_radius_m: 2.0,
            min_epochs: 5,
            h_tol_m: 0.03,
            v_tol_m: 0.05,
        }
    }
}

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// What was found.
    pub code: &'static str,
    /// `info`, `warn` or `fail`.
    pub severity: &'static str,
    /// The size of it (m, s or a ratio, by code).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub value: Option<f64>,
    /// The carrier wavelength the offset is close to.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub wavelength: Option<&'static str>,
    /// The time (as written) of the epoch or run concerned.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub at: Option<String>,
}

/// A run of consecutive fixed epochs.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FixRun {
    /// Time of its first epoch, as written.
    pub start: String,
    /// Epochs.
    pub n: usize,
    /// Its median position minus the occupation's chosen fixed position, east/north/up (m).
    pub offset_enu_m: [f64; 3],
}

/// The verdict on one occupation.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Occupation {
    /// 1-based index.
    pub index: usize,
    /// First and last epoch time, as written.
    pub start: String,
    /// Last epoch time, as written.
    pub end: String,
    /// Epochs.
    pub n: usize,
    /// Fixed epochs.
    pub n_fix: usize,
    /// Float epochs.
    pub n_float: usize,
    /// Seconds from the first epoch to the first fix.
    pub time_to_fix_s: Option<f64>,
    /// The chosen fixed position (median of the largest run, or of the run nearest a control
    /// point): latitude, longitude (deg), height (m).
    pub fixed_llh: Option<[f64; 3]>,
    /// The control point compared with.
    pub control: Option<String>,
    /// The fixed runs.
    pub runs: Vec<FixRun>,
    /// `pass`, `warn`, `fail` or `no-fix`.
    pub verdict: &'static str,
    /// The findings.
    pub findings: Vec<Finding>,
}

/// The report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FixReport {
    /// Always `MODELLED`.
    pub label: &'static str,
    /// The thresholds used.
    pub config: FixConfig,
    /// Epochs read.
    pub epochs: usize,
    /// The occupations.
    pub occupations: Vec<Occupation>,
    /// Count of `pass`.
    pub pass: usize,
    /// Count of `warn`.
    pub warn: usize,
    /// Count of `fail`.
    pub fail: usize,
    /// Count of `no-fix`.
    pub no_fix: usize,
}

fn enu(at: Vec3, d: Vec3) -> [f64; 3] {
    let g = ecef_to_geodetic(at);
    let (sl, cl) = (g.lat_rad.sin(), g.lat_rad.cos());
    let (so, co) = (g.lon_rad.sin(), g.lon_rad.cos());
    [
        -so * d[0] + co * d[1],
        -sl * co * d[0] - sl * so * d[1] + cl * d[2],
        cl * co * d[0] + cl * so * d[1] + sl * d[2],
    ]
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn hz(e: [f64; 3]) -> f64 {
    e[0].hypot(e[1])
}

fn median(mut v: Vec<f64>) -> f64 {
    if v.is_empty() {
        return 0.0;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

fn median_pos(ps: &[Vec3]) -> Vec3 {
    [0, 1, 2].map(|k| median(ps.iter().map(|p| p[k]).collect()))
}

fn wavelength_of(d: [f64; 3]) -> Option<&'static str> {
    let cands = [
        hz(d),
        d[2].abs(),
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt(),
    ];
    WAVELENGTHS
        .iter()
        .find(|(_, w)| cands.iter().any(|c| (c - w).abs() <= 0.015))
        .map(|(n, _)| *n)
}

fn std_dev(v: &[f64]) -> f64 {
    if v.len() < 2 {
        return 0.0;
    }
    let m = v.iter().sum::<f64>() / v.len() as f64;
    (v.iter().map(|x| (x - m).powi(2)).sum::<f64>() / (v.len() - 1) as f64).sqrt()
}

/// Split the epochs into occupations (index ranges).
pub fn occupations(e: &[SolEpoch], cfg: &FixConfig) -> Vec<std::ops::Range<usize>> {
    let mut out = Vec::new();
    let mut i = 0;
    while i < e.len() {
        let anchor = e[i].ecef_m;
        let mut j = i + 1;
        while j < e.len() && hz(enu(anchor, sub(e[j].ecef_m, anchor))) <= cfg.static_radius_m {
            j += 1;
        }
        if j - i >= cfg.min_epochs {
            out.push(i..j);
            i = j;
        } else {
            i += 1;
        }
    }
    out
}

fn over(cfg: &FixConfig, d: [f64; 3]) -> bool {
    hz(d) > cfg.h_tol_m || d[2].abs() > cfg.v_tol_m
}

/// Check every occupation of `epochs`.
pub fn check(epochs: &[SolEpoch], controls: &[Control], cfg: &FixConfig) -> FixReport {
    let mut occs = Vec::new();
    for (k, r) in occupations(epochs, cfg).into_iter().enumerate() {
        let e = &epochs[r];
        let origin = e[0].ecef_m;
        let n_fix = e.iter().filter(|x| x.q == 1).count();
        let n_float = e.iter().filter(|x| x.q == 2).count();
        let mut findings = Vec::new();
        // runs of consecutive fixed epochs
        let mut runs: Vec<Vec<&SolEpoch>> = Vec::new();
        let mut cur: Vec<&SolEpoch> = Vec::new();
        for x in e {
            if x.q == 1 {
                cur.push(x);
            } else if !cur.is_empty() {
                runs.push(std::mem::take(&mut cur));
            }
        }
        if !cur.is_empty() {
            runs.push(cur);
        }
        for run in &runs {
            for w in run.windows(2) {
                let d = enu(origin, sub(w[1].ecef_m, w[0].ecef_m));
                if over(cfg, d) {
                    findings.push(Finding {
                        code: "fix-jump",
                        severity: "fail",
                        value: Some((hz(d).powi(2) + d[2].powi(2)).sqrt()),
                        wavelength: wavelength_of(d),
                        at: Some(w[1].time.clone()),
                    });
                }
            }
        }
        let run_pos: Vec<Vec3> = runs
            .iter()
            .map(|r| median_pos(&r.iter().map(|x| x.ecef_m).collect::<Vec<_>>()))
            .collect();
        // the control point near this occupation
        let control = controls
            .iter()
            .map(|c| (c, llh_to_ecef(c.llh[0], c.llh[1], c.llh[2])))
            .filter(|(_, x)| hz(enu(origin, sub(*x, origin))) <= cfg.static_radius_m)
            .min_by(|a, b| {
                hz(enu(origin, sub(a.1, origin))).total_cmp(&hz(enu(origin, sub(b.1, origin))))
            });
        // the chosen run: nearest the control point, else the largest
        let chosen = if runs.is_empty() {
            None
        } else if let Some((_, cx)) = control {
            (0..runs.len()).min_by(|a, b| {
                let da = enu(origin, sub(run_pos[*a], cx));
                let db = enu(origin, sub(run_pos[*b], cx));
                (hz(da) + da[2].abs()).total_cmp(&(hz(db) + db[2].abs()))
            })
        } else {
            (0..runs.len()).max_by_key(|i| (runs[*i].len(), std::cmp::Reverse(*i)))
        };
        let mut out_runs = Vec::new();
        if let Some(c) = chosen {
            let cp = run_pos[c];
            for (i, run) in runs.iter().enumerate() {
                let d = enu(cp, sub(run_pos[i], cp));
                out_runs.push(FixRun {
                    start: run[0].time.clone(),
                    n: run.len(),
                    offset_enu_m: d,
                });
                if i != c && over(cfg, d) {
                    findings.push(Finding {
                        code: "inconsistent-fixes",
                        severity: "fail",
                        value: Some((hz(d).powi(2) + d[2].powi(2)).sqrt()),
                        wavelength: wavelength_of(d),
                        at: Some(run[0].time.clone()),
                    });
                }
            }
            // fixed against the converged float
            let floats: Vec<&SolEpoch> = e
                .iter()
                .filter(|x| x.q == 2 && x.sd_enu_m.is_some_and(|s| hz(s) < 0.5))
                .collect();
            if floats.len() >= 3 {
                let fp = median_pos(&floats.iter().map(|x| x.ecef_m).collect::<Vec<_>>());
                let sd =
                    median(floats.iter().filter_map(|x| x.sd_enu_m).map(hz).collect()).max(0.005);
                let d = enu(cp, sub(cp, fp));
                if hz(d) > cfg.h_tol_m && hz(d) / sd > 4.0 {
                    findings.push(Finding {
                        code: "fix-disagrees-with-float",
                        severity: "warn",
                        value: Some(hz(d)),
                        wavelength: wavelength_of(d),
                        at: Some(runs[c][0].time.clone()),
                    });
                }
            }
            // reported precision against the scatter of the chosen run
            let run = &runs[c];
            if run.len() >= 5 {
                let d: Vec<[f64; 3]> = run.iter().map(|x| enu(cp, sub(x.ecef_m, cp))).collect();
                let sh = std_dev(&d.iter().map(|v| v[0]).collect::<Vec<_>>())
                    .hypot(std_dev(&d.iter().map(|v| v[1]).collect::<Vec<_>>()));
                let rep: Vec<f64> = run.iter().filter_map(|x| x.sd_enu_m).map(hz).collect();
                if !rep.is_empty() {
                    let r = median(rep).max(1e-4);
                    if sh > 0.01 && sh / r > 3.0 {
                        findings.push(Finding {
                            code: "optimistic-sigma",
                            severity: "warn",
                            value: Some(sh / r),
                            wavelength: None,
                            at: Some(run[0].time.clone()),
                        });
                    }
                }
            }
            if let Some((ctl, cx)) = control {
                let d = enu(cx, sub(cp, cx));
                findings.push(Finding {
                    code: if over(cfg, d) {
                        "control-mismatch"
                    } else {
                        "control-ok"
                    },
                    severity: if over(cfg, d) { "fail" } else { "info" },
                    value: Some((hz(d).powi(2) + d[2].powi(2)).sqrt()),
                    wavelength: if over(cfg, d) { wavelength_of(d) } else { None },
                    at: Some(ctl.name.clone()),
                });
            }
        } else {
            let rep: Vec<f64> = e
                .iter()
                .filter(|x| x.q == 2)
                .filter_map(|x| x.sd_enu_m)
                .map(hz)
                .collect();
            if !rep.is_empty() && median(rep.clone()) < 0.02 {
                findings.push(Finding {
                    code: "float-precision-misleads",
                    severity: "warn",
                    value: Some(median(rep)),
                    wavelength: None,
                    at: Some(e[0].time.clone()),
                });
            }
        }
        let ratios: Vec<f64> = e
            .iter()
            .filter(|x| x.q == 1)
            .filter_map(|x| x.ratio)
            .filter(|r| *r > 0.0)
            .collect();
        let low = ratios.iter().filter(|r| **r < 3.0).count();
        if !ratios.is_empty() && low * 5 > ratios.len() {
            findings.push(Finding {
                code: "low-ratio",
                severity: "warn",
                value: Some(low as f64 / ratios.len() as f64),
                wavelength: None,
                at: None,
            });
        }
        let age = e.iter().filter_map(|x| x.age_s).fold(0.0, f64::max);
        if age > 10.0 {
            findings.push(Finding {
                code: "stale-corrections",
                severity: "warn",
                value: Some(age),
                wavelength: None,
                at: None,
            });
        }
        let verdict = if findings.iter().any(|f| f.severity == "fail") {
            "fail"
        } else if n_fix == 0 {
            "no-fix"
        } else if findings.iter().any(|f| f.severity == "warn") {
            "warn"
        } else {
            "pass"
        };
        let fixed_llh = chosen.map(|c| {
            let g = ecef_to_geodetic(run_pos[c]);
            [g.lat_rad.to_degrees(), g.lon_rad.to_degrees(), g.alt_m]
        });
        occs.push(Occupation {
            index: k + 1,
            start: e[0].time.clone(),
            end: e[e.len() - 1].time.clone(),
            n: e.len(),
            n_fix,
            n_float,
            time_to_fix_s: e.iter().find(|x| x.q == 1).map(|x| x.t_s - e[0].t_s),
            fixed_llh,
            control: control.map(|(c, _)| c.name.clone()),
            runs: out_runs,
            verdict,
            findings,
        });
    }
    let count = |v: &str| occs.iter().filter(|o| o.verdict == v).count();
    FixReport {
        label: LABEL,
        config: cfg.clone(),
        epochs: epochs.len(),
        pass: count("pass"),
        warn: count("warn"),
        fail: count("fail"),
        no_fix: count("no-fix"),
        occupations: occs,
    }
}
