// SPDX-License-Identifier: AGPL-3.0-only
//! Onboard orbit determination against a two-line element set: the evidence a space receiver's
//! navigation solution gives when it is set beside the public catalogue.
//!
//! The onboard solution is a CCSDS OEM ([`crate::orbit_data::ephem::read_oem`]) whose
//! `REF_FRAME` is `EME2000`, `GCRF`, `ICRF` (all taken as GCRS; the frame bias, under 25 mas, is
//! below a metre at GEO) or `TEME`. The element set is propagated with the engine's SGP4 (WGS-72,
//! [`crate::sgp4`]) to every OEM epoch and rotated from TEME to GCRS at TT
//! ([`crate::nutation::teme_to_gcrs`]). The difference (TLE minus OD) is reported in the OD
//! state's radial, transverse and normal axes ([`crate::orbit_data::cdm::rtn_axes`]): largest,
//! root mean square and the RTN components at the largest, with the element set's age at each
//! end of the window.
//!
//! MODELLED: the comparison says how far the two disagree through these models; it does not say
//! which is closer to the true orbit. OEM epochs are read as UTC.

use crate::orbit_data::cdm::rtn_axes;
use crate::sgp4::wgs72;
use crate::tle::parse_tle;
use serde::Serialize;

/// The honesty label.
pub const LABEL: &str =
    "MODELLED: SGP4 (WGS-72) propagation of the element set rotated TEME to GCRS, against the \
onboard OEM states; a disagreement between two sources, not an accuracy of either.";

/// One compared epoch.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Point {
    /// UTC Julian date.
    pub jd_utc: f64,
    /// Radial, transverse, normal difference, km.
    pub rtn_km: [f64; 3],
    /// Magnitude, km.
    pub dist_km: f64,
}

/// The comparison.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// OEM reference frame.
    pub ref_frame: String,
    /// Epochs compared.
    pub points: usize,
    /// Root mean square distance, km.
    pub rms_km: f64,
    /// Largest distance, km.
    pub max_km: f64,
    /// RTN at the largest, km.
    pub rtn_at_max_km: [f64; 3],
    /// Mean RTN difference, km.
    pub mean_rtn_km: [f64; 3],
    /// Element-set age at the first and last epoch, days.
    pub tle_age_days: [f64; 2],
    /// Epochs SGP4 could not propagate to.
    pub propagation_failures: usize,
}

/// Compare an OEM text with an element set (two lines, an optional name line first).
pub fn compare(oem_text: &str, tle_text: &str) -> Result<Report, String> {
    let lines: Vec<&str> = tle_text
        .lines()
        .map(str::trim_end)
        .filter(|l| !l.is_empty())
        .collect();
    let l1 = lines.iter().position(|l| l.starts_with("1 "));
    let (Some(i1), true) = (l1, l1.is_some_and(|i| i + 1 < lines.len())) else {
        return Err(crate::terr!("e-space-receiver-no-tle"));
    };
    let tle = parse_tle(lines[i1], lines[i1 + 1])?;
    let sgp = tle.to_sgp4(wgs72(), false);
    let mut rep = crate::orbit_data::Report::new("OEM", "CCSDS 502.0-B-3");
    let doc = crate::orbit_data::ephem::read_oem(oem_text, &mut rep);
    let mut pts = Vec::new();
    let mut fails = 0usize;
    let mut frame = String::new();
    for seg in &doc.segments {
        let f = seg.get("REF_FRAME").unwrap_or("").to_ascii_uppercase();
        let teme = match f.as_str() {
            "EME2000" | "GCRF" | "ICRF" => false,
            "TEME" => true,
            _ => return Err(crate::terr!("e-space-receiver-oem-frame", frame = f)),
        };
        frame = f.clone();
        for (_, tok) in &seg.lines {
            if tok.len() < 7 {
                continue;
            }
            let jd = crate::leo_pass::parse_epoch_jd(&tok[0])?;
            let mut x = [0.0f64; 6];
            for (k, v) in x.iter_mut().enumerate() {
                *v = tok[k + 1]
                    .parse::<f64>()
                    .map_err(|_| crate::terr!("e-space-receiver-bad-row", line = 0))?;
            }
            let Ok((r, v)) = sgp.propagate((jd - sgp.epoch_jd_utc()) * 1440.0) else {
                fails += 1;
                continue;
            };
            let (r, _) = if teme {
                (r, v)
            } else {
                crate::nutation::teme_to_gcrs(r, v, crate::timescales::utc_to_tt(jd))
            };
            let d = [r[0] - x[0], r[1] - x[1], r[2] - x[2]];
            let ax = rtn_axes(&x);
            let rtn = [
                ax[0][0] * d[0] + ax[0][1] * d[1] + ax[0][2] * d[2],
                ax[1][0] * d[0] + ax[1][1] * d[1] + ax[1][2] * d[2],
                ax[2][0] * d[0] + ax[2][1] * d[1] + ax[2][2] * d[2],
            ];
            pts.push(Point {
                jd_utc: jd,
                rtn_km: rtn,
                dist_km: (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt(),
            });
        }
    }
    if pts.is_empty() {
        return Err(crate::terr!("e-space-receiver-too-few-rows"));
    }
    let n = pts.len() as f64;
    let rms = (pts.iter().map(|p| p.dist_km * p.dist_km).sum::<f64>() / n).sqrt();
    let imax = (0..pts.len())
        .max_by(|&a, &b| pts[a].dist_km.total_cmp(&pts[b].dist_km))
        .unwrap_or(0);
    let mut mean = [0.0; 3];
    for p in &pts {
        for (m, v) in mean.iter_mut().zip(p.rtn_km) {
            *m += v / n;
        }
    }
    let e = sgp.epoch_jd_utc();
    Ok(Report {
        schema: "kshana.space-receiver-od-vs-tle/1",
        label: LABEL,
        ref_frame: frame,
        points: pts.len(),
        rms_km: rms,
        max_km: pts[imax].dist_km,
        rtn_at_max_km: pts[imax].rtn_km,
        mean_rtn_km: mean,
        tle_age_days: [pts[0].jd_utc - e, pts[pts.len() - 1].jd_utc - e],
        propagation_failures: fails,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    // The ISS element set of the SGP4 verification set (Vallado et al. 2006, catalogue 25544).
    const TLE: &str = "1 25544U 98067A   08264.51782528 -.00002182  00000-0 -11606-4 0  2927\n\
2 25544  51.6416 247.4627 0006703 130.5360 325.0288 15.72125391563537\n";

    /// An OEM written from the same element set: the comparison must be (nearly) zero.
    fn oem_from_tle(frame: &str, shift_km: f64) -> String {
        let tle = parse_tle(TLE.lines().next().unwrap(), TLE.lines().nth(1).unwrap()).unwrap();
        let s = tle.to_sgp4(wgs72(), false);
        let e0 = s.epoch_jd_utc();
        let mut out = format!(
            "CCSDS_OEM_VERS = 2.0\nCREATION_DATE = 2008-09-20T00:00:00\nORIGINATOR = TEST\n\nMETA_START\nOBJECT_NAME = ISS\nOBJECT_ID = 1998-067A\nCENTER_NAME = EARTH\nREF_FRAME = {frame}\nTIME_SYSTEM = UTC\nSTART_TIME = 2008-09-20T12:25:40.104\nSTOP_TIME = 2008-09-20T13:25:40.104\nMETA_STOP\n\n"
        );
        for k in 0..7 {
            let jd = e0 + k as f64 * 600.0 / 86_400.0;
            let (r, v) = s.propagate((jd - e0) * 1440.0).unwrap();
            let (r, v) = if frame == "TEME" {
                (r, v)
            } else {
                crate::nutation::teme_to_gcrs(r, v, crate::timescales::utc_to_tt(jd))
            };
            let c = crate::timescales::civil_from_jd(jd);
            out.push_str(&format!(
                "{:04}-{:02}-{:02}T{:02}:{:02}:{:09.6} {} {} {} {} {} {}\n",
                c.year,
                c.month,
                c.day,
                c.hour,
                c.minute,
                c.second,
                r[0] + shift_km,
                r[1],
                r[2],
                v[0],
                v[1],
                v[2]
            ));
        }
        out
    }

    #[test]
    fn the_same_orbit_agrees_and_a_shift_is_seen() {
        for frame in ["TEME", "EME2000"] {
            let r = compare(&oem_from_tle(frame, 0.0), TLE).unwrap();
            assert_eq!(r.points, 7, "{frame}");
            assert!(r.max_km < 0.05, "{frame}: {}", r.max_km);
        }
        let r = compare(&oem_from_tle("TEME", 2.0), TLE).unwrap();
        assert!((r.max_km - 2.0).abs() < 0.05, "{}", r.max_km);
        assert!(r.tle_age_days[1] > 0.04);
    }

    #[test]
    fn bad_inputs() {
        assert!(compare(&oem_from_tle("ITRF", 0.0), TLE).is_err());
        assert!(compare(&oem_from_tle("TEME", 0.0), "not a tle").is_err());
    }
}
