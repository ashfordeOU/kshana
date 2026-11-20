// SPDX-License-Identifier: AGPL-3.0-only
//! Base-coordinate, datum and epoch sanity.
//!
//! The 1005/1006 messages of an RTCM 3 stream say where the base is. A rover's RTK position is
//! only as right as that coordinate, in the frame and at the epoch it was given in. This module
//! compares each broadcast antenna reference point with the station's published coordinate and
//! names what an offset looks like:
//!
//! * **matches the published coordinate** (in its frame, moved to the observation epoch with
//!   the published velocity), within the tolerance (default 2 cm): `ok`;
//! * **matches the coordinate in another frame or at another epoch** (ITRF instead of ETRF, or
//!   the published epoch instead of today): `warn`, `frame-epoch-mismatch`, naming the one it
//!   matches;
//! * **matches the marker instead of the antenna reference point** (or the other way round),
//!   shifted by the antenna height along the vertical: `warn`, `marker-arp-confusion`;
//! * **matches nothing**: `fail`, `unexplained-offset`, with the offset in east, north, up.
//!
//! It also warns when the network's frame and epoch differ from the project's (every rover
//! coordinate then carries that offset), when the coordinate changes during the stream, when a
//! 1006 antenna height differs from the published one, when the heights of the geoid model and
//! the GNSS heights are in different permanent-tide systems, and when an orthometric height
//! from the broadcast height and a published geoid undulation disagrees with the published one.
//!
//! Frames: ITRF2014 and ITRF2020 (IGS14/IGb14 and IGS20/IGb20 are read as these), ETRF2014 and
//! ETRF2020. ITRF2020 to ITRF2014 uses the 14 parameters the IGN ITRF centre publishes (epoch
//! 2015.0); ITRFyy to ETRFyy uses the rotation rates of EUREF Technical Note 1 (Altamimi; epoch
//! 1989.0): ETRF2020 (0.086, 0.519, -0.753) mas/yr, ETRF2014 (0.085, 0.531, -0.770) mas/yr.
//! Permanent tide (Ekman 1989): with `P = 0.099 - 0.296 sin²φ` m, the geoid in the mean-tide
//! system is `1.3 P` above the tide-free one and in the zero-tide system `0.3 P` above it; the
//! crust in the mean-tide and zero-tide systems is `0.6 P` above the tide-free one. The checks
//! are geometric and their thresholds are this module's: MODELLED.

use crate::frames::{ecef_to_geodetic, Vec3};
use crate::receiver_trust::machines::rtcm3_obs::StationArp;
use serde::{Deserialize, Serialize};

/// Evidence label of every report.
pub const LABEL: &str = "MODELLED";

/// One milliarcsecond in radians.
const MAS: f64 = std::f64::consts::PI / (180.0 * 3600.0 * 1000.0);

/// A terrestrial reference frame this module can transform.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum Frame {
    /// ITRF2014 (and IGS14, IGb14).
    Itrf2014,
    /// ITRF2020 (and IGS20, IGb20).
    Itrf2020,
    /// ETRF2014.
    Etrf2014,
    /// ETRF2020.
    Etrf2020,
}

/// Every frame, in the order candidates are tried.
pub const FRAMES: [Frame; 4] = [
    Frame::Itrf2020,
    Frame::Itrf2014,
    Frame::Etrf2020,
    Frame::Etrf2014,
];

impl Frame {
    /// Read a frame name (case does not matter).
    pub fn parse(s: &str) -> Option<Frame> {
        match s.trim().to_ascii_uppercase().as_str() {
            "ITRF2014" | "ITRF14" | "IGS14" | "IGB14" => Some(Frame::Itrf2014),
            "ITRF2020" | "ITRF20" | "IGS20" | "IGB20" => Some(Frame::Itrf2020),
            "ETRF2014" | "ETRF14" => Some(Frame::Etrf2014),
            "ETRF2020" | "ETRF20" => Some(Frame::Etrf2020),
            _ => None,
        }
    }

    /// The frame's name.
    pub fn name(self) -> &'static str {
        match self {
            Frame::Itrf2014 => "ITRF2014",
            Frame::Itrf2020 => "ITRF2020",
            Frame::Etrf2014 => "ETRF2014",
            Frame::Etrf2020 => "ETRF2020",
        }
    }

    fn etrf_rates_mas(self) -> Option<[f64; 3]> {
        match self {
            Frame::Etrf2020 => Some([0.086, 0.519, -0.753]),
            Frame::Etrf2014 => Some([0.085, 0.531, -0.770]),
            _ => None,
        }
    }

    fn is_itrf2014_family(self) -> bool {
        matches!(self, Frame::Itrf2014 | Frame::Etrf2014)
    }
}

fn rot(r: [f64; 3], x: Vec3) -> Vec3 {
    // R·X with R = [[0, -R3, R2], [R3, 0, -R1], [-R2, R1, 0]]
    [
        -r[2] * x[1] + r[1] * x[2],
        r[2] * x[0] - r[0] * x[2],
        -r[1] * x[0] + r[0] * x[1],
    ]
}

fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// ITRF2020 to ITRF2014 at epoch `t`: T = (-1.4, -0.9, 1.4) mm + (0, -0.1, 0.2) mm/yr × (t - 2015),
/// scale -0.42 ppb, no rotation.
fn itrf2020_to_2014(x: Vec3, t: f64) -> Vec3 {
    let dt = t - 2015.0;
    let tr = [-1.4e-3, -0.9e-3 - 0.1e-3 * dt, 1.4e-3 + 0.2e-3 * dt];
    let d = -0.42e-9;
    [
        x[0] + tr[0] + d * x[0],
        x[1] + tr[1] + d * x[1],
        x[2] + tr[2] + d * x[2],
    ]
}

fn itrf2014_to_2020(x: Vec3, t: f64) -> Vec3 {
    let back = itrf2020_to_2014(x, t);
    sub(add(x, x), back)
}

fn itrf_to_etrf(x: Vec3, f: Frame, t: f64) -> Vec3 {
    match f.etrf_rates_mas() {
        Some(r) => {
            let dt = t - 1989.0;
            add(
                x,
                rot([r[0] * MAS * dt, r[1] * MAS * dt, r[2] * MAS * dt], x),
            )
        }
        None => x,
    }
}

fn etrf_to_itrf(x: Vec3, f: Frame, t: f64) -> Vec3 {
    match f.etrf_rates_mas() {
        Some(r) => {
            let dt = t - 1989.0;
            sub(
                x,
                rot([r[0] * MAS * dt, r[1] * MAS * dt, r[2] * MAS * dt], x),
            )
        }
        None => x,
    }
}

/// A coordinate in `from` at epoch `t`, in `to` at the same epoch (sub-millimetre for the
/// rotations involved).
pub fn transform(x: Vec3, from: Frame, to: Frame, t: f64) -> Vec3 {
    if from == to {
        return x;
    }
    let itrf = etrf_to_itrf(x, from, t);
    let itrf20 = if from.is_itrf2014_family() {
        itrf2014_to_2020(itrf, t)
    } else {
        itrf
    };
    let itrf_to = if to.is_itrf2014_family() {
        itrf2020_to_2014(itrf20, t)
    } else {
        itrf20
    };
    itrf_to_etrf(itrf_to, to, t)
}

/// The velocity of a point in `to` from its velocity in `from` (the plate rotation added or
/// removed; the ITRF2014/2020 rate differences are below 0.3 mm/yr and left out).
pub fn transform_velocity(x: Vec3, v: Vec3, from: Frame, to: Frame) -> Vec3 {
    let mut out = v;
    if let Some(r) = from.etrf_rates_mas() {
        out = sub(out, rot([r[0] * MAS, r[1] * MAS, r[2] * MAS], x));
    }
    if let Some(r) = to.etrf_rates_mas() {
        out = add(out, rot([r[0] * MAS, r[1] * MAS, r[2] * MAS], x));
    }
    out
}

/// A tide system for heights or a geoid model.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Tide {
    /// Tide-free (ITRF, ETRF and GNSS coordinates conventionally; EGM2008).
    TideFree,
    /// Zero-tide.
    ZeroTide,
    /// Mean-tide.
    MeanTide,
}

impl Tide {
    /// Read `tide-free`, `zero-tide` or `mean-tide`.
    pub fn parse(s: &str) -> Option<Tide> {
        match s
            .trim()
            .to_ascii_lowercase()
            .replace(['_', ' '], "-")
            .as_str()
        {
            "tide-free" | "non-tidal" | "conventional-tide-free" => Some(Tide::TideFree),
            "zero-tide" => Some(Tide::ZeroTide),
            "mean-tide" => Some(Tide::MeanTide),
            _ => None,
        }
    }
}

/// `P = 0.099 - 0.296 sin²φ` (m), Ekman's permanent-tide term.
fn tide_p(lat_rad: f64) -> f64 {
    0.099 - 0.296 * lat_rad.sin().powi(2)
}

/// The geoid's height above its tide-free form, m.
pub fn geoid_tide_offset_m(t: Tide, lat_rad: f64) -> f64 {
    match t {
        Tide::TideFree => 0.0,
        Tide::ZeroTide => 0.3 * tide_p(lat_rad),
        Tide::MeanTide => 1.3 * tide_p(lat_rad),
    }
}

/// The crust's height above its tide-free form, m.
pub fn crust_tide_offset_m(t: Tide, lat_rad: f64) -> f64 {
    match t {
        Tide::TideFree => 0.0,
        Tide::ZeroTide | Tide::MeanTide => 0.6 * tide_p(lat_rad),
    }
}

/// The error an orthometric height `H = h - N` takes on when `h` is in the tide system
/// `heights` and the geoid model `N` in `geoid`, against both in the geoid's system, m.
pub fn tide_mismatch_m(heights: Tide, geoid: Tide, lat_rad: f64) -> f64 {
    crust_tide_offset_m(heights, lat_rad) - crust_tide_offset_m(geoid, lat_rad)
}

/// The project and its tolerances.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Project {
    /// The frame the project's coordinates are in.
    pub frame: Option<String>,
    /// The epoch (decimal year) of the project's coordinates.
    pub epoch: Option<f64>,
    /// Largest acceptable offset, m (default 0.02).
    pub tolerance_m: Option<f64>,
    /// Tide system of the GNSS heights (default `tide-free`).
    pub height_tide: Option<String>,
    /// Tide system of the geoid model used for orthometric heights.
    pub geoid_tide: Option<String>,
}

/// A published station coordinate.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct RefStation {
    /// RTCM reference station id; without one, the nearest broadcast station within 100 m.
    pub id: Option<u16>,
    /// Station name.
    pub name: Option<String>,
    /// Frame of the coordinate.
    pub frame: String,
    /// Epoch of the coordinate (decimal year).
    pub epoch: f64,
    /// ECEF X, Y, Z of the antenna reference point, m.
    pub ecef_m: [f64; 3],
    /// Velocity in the same frame, m/yr.
    pub velocity_m_per_yr: Option<[f64; 3]>,
    /// Antenna height above the marker, m.
    pub antenna_height_m: Option<f64>,
    /// Geoid undulation at the station, m (with `orthometric_height_m`).
    pub geoid_undulation_m: Option<f64>,
    /// Published orthometric height of the antenna reference point, m.
    pub orthometric_height_m: Option<f64>,
}

/// The reference file.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Reference {
    /// The project.
    #[serde(default)]
    pub project: Project,
    /// Published station coordinates.
    #[serde(default)]
    pub station: Vec<RefStation>,
}

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// What was found.
    pub code: &'static str,
    /// `info`, `warn` or `fail`.
    pub severity: &'static str,
    /// The size of it, m (an offset, a spread, a height difference).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub value_m: Option<f64>,
    /// The frame and epoch it concerns (`ETRF2020@2026.90`).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub realisation: Option<String>,
}

/// The coordinate the broadcast matched best.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Match {
    /// What it matched: `published`, `frame-epoch` or `marker-arp`.
    pub kind: &'static str,
    /// Frame and epoch (`ITRF2020@2015.00`).
    pub realisation: String,
    /// Distance, m.
    pub distance_m: f64,
}

/// The verdict on one broadcast station.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct StationVerdict {
    /// RTCM station id.
    pub station_id: u16,
    /// Published name, when a reference matched.
    pub name: Option<String>,
    /// 1006 or 1005 (the last seen).
    pub message: u16,
    /// Messages seen for this station.
    pub messages_seen: usize,
    /// The non-physical (virtual) reference-station indicator.
    pub non_physical: bool,
    /// The broadcast ECEF, m (the last seen).
    pub ecef_m: [f64; 3],
    /// Latitude, longitude (deg) and ellipsoidal height (m) of it.
    pub llh: [f64; 3],
    /// Largest distance between any two broadcast coordinates of this station, m.
    pub spread_m: f64,
    /// `ok`, `warn`, `fail` or `unchecked` (no published coordinate).
    pub verdict: &'static str,
    /// The best match among the candidate coordinates.
    pub best_match: Option<Match>,
    /// Broadcast minus the published coordinate at the observation epoch, east/north/up, m.
    pub offset_enu_m: Option<[f64; 3]>,
    /// The findings.
    pub findings: Vec<Finding>,
}

/// The report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BaseReport {
    /// Always `MODELLED`.
    pub label: &'static str,
    /// The observation epoch, decimal year.
    pub epoch: f64,
    /// The tolerance used, m.
    pub tolerance_m: f64,
    /// One verdict per station id.
    pub stations: Vec<StationVerdict>,
    /// Count of `ok` verdicts.
    pub ok: usize,
    /// Count of `warn` verdicts.
    pub warn: usize,
    /// Count of `fail` verdicts.
    pub fail: usize,
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

fn up(at: Vec3) -> Vec3 {
    let g = ecef_to_geodetic(at);
    [
        g.lat_rad.cos() * g.lon_rad.cos(),
        g.lat_rad.cos() * g.lon_rad.sin(),
        g.lat_rad.sin(),
    ]
}

fn tag(f: Frame, e: f64) -> String {
    format!("{}@{e:.2}", f.name())
}

/// The published coordinate in frame `to` at epoch `e`.
fn published_at(r: &RefStation, from: Frame, to: Frame, e: f64) -> Vec3 {
    let v = r.velocity_m_per_yr.unwrap_or([0.0; 3]);
    let dt = e - r.epoch;
    let x = [
        r.ecef_m[0] + v[0] * dt,
        r.ecef_m[1] + v[1] * dt,
        r.ecef_m[2] + v[2] * dt,
    ];
    transform(x, from, to, e)
}

/// Check the broadcast stations (`stations`, as decoded, repeats included) against `reference`
/// at the observation epoch `epoch` (decimal year).
pub fn check(
    stations: &[StationArp],
    reference: &Reference,
    epoch: f64,
) -> Result<BaseReport, String> {
    let tol = reference.project.tolerance_m.unwrap_or(0.02);
    let parse_frame = |s: &str| {
        Frame::parse(s).ok_or_else(|| crate::terr!("e-rtkqa-frame", frame = s.to_string()))
    };
    let parse_tide =
        |s: &str| Tide::parse(s).ok_or_else(|| crate::terr!("e-rtkqa-tide", tide = s.to_string()));
    let project_frame = reference
        .project
        .frame
        .as_deref()
        .map(parse_frame)
        .transpose()?;
    let height_tide = parse_tide(
        reference
            .project
            .height_tide
            .as_deref()
            .unwrap_or("tide-free"),
    )?;
    let geoid_tide = reference
        .project
        .geoid_tide
        .as_deref()
        .map(parse_tide)
        .transpose()?;
    let ref_frames = reference
        .station
        .iter()
        .map(|r| parse_frame(&r.frame))
        .collect::<Result<Vec<_>, _>>()?;
    let mut ids: Vec<u16> = stations.iter().map(|s| s.station_id).collect();
    ids.sort_unstable();
    ids.dedup();
    let mut out = Vec::new();
    for id in ids {
        let mine: Vec<&StationArp> = stations.iter().filter(|s| s.station_id == id).collect();
        let last = *mine.last().expect("at least one");
        let mut spread: f64 = 0.0;
        for a in &mine {
            for b in &mine {
                spread = spread.max(norm(sub(a.ecef_m, b.ecef_m)));
            }
        }
        let x = last.ecef_m;
        let g = ecef_to_geodetic(x);
        let mut findings = Vec::new();
        let radius = norm(x);
        if !(6_340_000.0..=6_400_000.0).contains(&radius) {
            findings.push(Finding {
                code: "not-on-earth",
                severity: "fail",
                value_m: Some(radius),
                realisation: None,
            });
        }
        if spread > 0.001 {
            findings.push(Finding {
                code: "coordinates-changed",
                severity: "warn",
                value_m: Some(spread),
                realisation: None,
            });
        }
        if last.non_physical {
            findings.push(Finding {
                code: "non-physical-station",
                severity: "info",
                value_m: None,
                realisation: None,
            });
        }
        let found = reference
            .station
            .iter()
            .zip(&ref_frames)
            .find(|(r, _)| r.id == Some(id))
            .or_else(|| {
                reference
                    .station
                    .iter()
                    .zip(&ref_frames)
                    .filter(|(r, _)| r.id.is_none() && norm(sub(r.ecef_m, x)) < 100.0)
                    .min_by(|a, b| norm(sub(a.0.ecef_m, x)).total_cmp(&norm(sub(b.0.ecef_m, x))))
            });
        let mut best_match = None;
        let mut offset_enu = None;
        let mut verdict = "unchecked";
        if let Some((r, &rf)) = found {
            // the candidates: every frame at the observation epoch and at the published epoch
            let mut cands: Vec<(&'static str, String, Vec3)> = Vec::new();
            let expected = published_at(r, rf, rf, epoch);
            cands.push(("published", tag(rf, epoch), expected));
            for f in FRAMES {
                for e in [epoch, r.epoch] {
                    let c = published_at(r, rf, f, e);
                    if cands.iter().all(|(_, _, y)| norm(sub(*y, c)) > 1e-3) {
                        cands.push(("frame-epoch", tag(f, e), c));
                    }
                }
            }
            let h = last.antenna_height_m.or(r.antenna_height_m).unwrap_or(0.0);
            if h > 0.0 {
                let u = up(expected);
                for s in [-1.0, 1.0] {
                    let c = add(expected, [u[0] * h * s, u[1] * h * s, u[2] * h * s]);
                    cands.push(("marker-arp", tag(rf, epoch), c));
                }
            }
            let d_exp = norm(sub(x, expected));
            let best = cands
                .iter()
                .map(|(k, t, c)| (*k, t.clone(), norm(sub(x, *c))))
                .min_by(|a, b| a.2.total_cmp(&b.2))
                .expect("published candidate");
            offset_enu = Some(enu(expected, sub(x, expected)));
            if d_exp <= tol {
                verdict = "ok";
                best_match = Some(Match {
                    kind: "published",
                    realisation: tag(rf, epoch),
                    distance_m: d_exp,
                });
            } else if best.2 <= tol {
                verdict = "warn";
                findings.push(Finding {
                    code: if best.0 == "marker-arp" {
                        "marker-arp-confusion"
                    } else {
                        "frame-epoch-mismatch"
                    },
                    severity: "warn",
                    value_m: Some(d_exp),
                    realisation: Some(best.1.clone()),
                });
                best_match = Some(Match {
                    kind: best.0,
                    realisation: best.1,
                    distance_m: best.2,
                });
            } else {
                verdict = "fail";
                findings.push(Finding {
                    code: "unexplained-offset",
                    severity: "fail",
                    value_m: Some(d_exp),
                    realisation: None,
                });
                best_match = Some(Match {
                    kind: best.0,
                    realisation: best.1,
                    distance_m: best.2,
                });
            }
            if let (Some(want), Some(got)) = (r.antenna_height_m, last.antenna_height_m) {
                if (want - got).abs() > 0.001 {
                    findings.push(Finding {
                        code: "antenna-height-differs",
                        severity: "warn",
                        value_m: Some(got - want),
                        realisation: None,
                    });
                }
            }
            if last.itrf_year != 0 && rf.name().starts_with("ITRF") {
                let yy = rf.name()[6..].parse::<u8>().unwrap_or(0);
                if last.itrf_year != yy {
                    findings.push(Finding {
                        code: "itrf-year-field",
                        severity: "info",
                        value_m: None,
                        realisation: Some(format!("{}", last.itrf_year)),
                    });
                }
            }
            // the network's realisation (what the broadcast matched) against the project's
            if let Some(pf) = project_frame {
                let pe = reference.project.epoch.unwrap_or(epoch);
                let (net_tag, net_x) = match &best_match {
                    Some(m) if m.kind == "frame-epoch" => (m.realisation.clone(), x),
                    _ => (tag(rf, epoch), expected),
                };
                let proj = published_at(r, rf, pf, pe);
                let d = norm(sub(net_x, proj));
                if d > tol {
                    findings.push(Finding {
                        code: "project-frame-mismatch",
                        severity: "warn",
                        value_m: Some(d),
                        realisation: Some(format!("{net_tag} -> {}", tag(pf, pe))),
                    });
                    if verdict == "ok" {
                        verdict = "warn";
                    }
                }
            }
            if let (Some(n), Some(hh)) = (r.geoid_undulation_m, r.orthometric_height_m) {
                let d = g.alt_m - n - hh;
                if d.abs() > tol {
                    findings.push(Finding {
                        code: "height-inconsistent",
                        severity: "warn",
                        value_m: Some(d),
                        realisation: None,
                    });
                    if verdict == "ok" {
                        verdict = "warn";
                    }
                }
            }
        } else {
            findings.push(Finding {
                code: "no-reference",
                severity: "info",
                value_m: None,
                realisation: None,
            });
        }
        if let Some(gt) = geoid_tide {
            let d = tide_mismatch_m(height_tide, gt, g.lat_rad);
            if d.abs() > 0.005 {
                findings.push(Finding {
                    code: "tide-system-mismatch",
                    severity: "warn",
                    value_m: Some(d),
                    realisation: None,
                });
                if verdict == "ok" {
                    verdict = "warn";
                }
            }
        }
        if findings.iter().any(|f| f.severity == "fail") {
            verdict = "fail";
        }
        out.push(StationVerdict {
            station_id: id,
            name: found.and_then(|(r, _)| r.name.clone()),
            message: last.message,
            messages_seen: mine.len(),
            non_physical: last.non_physical,
            ecef_m: x,
            llh: [g.lat_rad.to_degrees(), g.lon_rad.to_degrees(), g.alt_m],
            spread_m: spread,
            verdict,
            best_match,
            offset_enu_m: offset_enu,
            findings,
        });
    }
    let count = |v: &str| out.iter().filter(|s| s.verdict == v).count();
    Ok(BaseReport {
        label: LABEL,
        epoch,
        tolerance_m: tol,
        ok: count("ok"),
        warn: count("warn"),
        fail: count("fail"),
        stations: out,
    })
}
