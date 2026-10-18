// SPDX-License-Identifier: AGPL-3.0-only
//! RTKLIB solution (`.pos`) reader, per the output format in the RTKLIB manual: `%` header
//! lines, then one solution per line with the time, the position (latitude/longitude in
//! degrees and height, or ECEF X/Y/Z), the quality flag `Q`, the number of satellites `ns`
//! and the standard deviations that follow. Only time, position and `ns` are used.
//!
//! Time columns are either `yyyy/mm/dd hh:mm:ss.sss` or a GPS week and seconds of week
//! (`-tt`/week output); the scale (`GPST`, `UTC`, `JST`) is read from the column header and
//! carried in the label. Degrees-minutes-seconds positions are refused with a message
//! rather than guessed at.

use super::{gps_week_ms, EpochMap, DAY_MS};
use crate::frames::{ecef_to_geodetic, Geodetic};
use crate::receiver_trust::ingest::{days_from_civil, plausible_date};
use crate::receiver_trust::{ReportedFix, Timeline};

#[derive(Clone, Copy, PartialEq)]
enum Pos {
    LatLon,
    Ecef,
}

/// Parse `hh:mm:ss.sss` to milliseconds of the day.
fn clock_ms(s: &str) -> Option<i64> {
    let mut it = s.split(':');
    let h: i64 = it.next()?.parse().ok()?;
    let m: i64 = it.next()?.parse().ok()?;
    let sec: f64 = it.next()?.parse().ok()?;
    if it.next().is_some() || !(0..24).contains(&h) || !(0..60).contains(&m) {
        return None;
    }
    if !sec.is_finite() || !(0.0..61.0).contains(&sec) {
        return None;
    }
    Some(h * 3_600_000 + m * 60_000 + (sec * 1000.0).round() as i64)
}

fn label(ms: i64, scale: &str) -> String {
    let (y, mo, d) = civil(ms.div_euclid(DAY_MS));
    let r = ms.rem_euclid(DAY_MS);
    format!(
        "{y:04}-{mo:02}-{d:02}T{:02}:{:02}:{:02}.{:03} {scale}",
        r / 3_600_000,
        r / 60_000 % 60,
        r / 1000 % 60,
        r % 1000
    )
}

fn civil(z: i64) -> (i64, i64, i64) {
    crate::receiver_trust::ingest::civil_from_days(z)
}

/// Read an RTKLIB `.pos` solution file.
pub fn read_rtklib_pos(text: &str) -> Result<Timeline, String> {
    let mut scale = String::from("GPST");
    let mut pos = Pos::LatLon;
    let mut map = EpochMap::default();
    let mut skipped = 0usize;
    for line in text.lines() {
        let l = line.trim();
        if l.is_empty() {
            continue;
        }
        if let Some(h) = l.strip_prefix('%') {
            let h = h.trim_start();
            let first = h.split_whitespace().next().unwrap_or("");
            if matches!(first, "GPST" | "UTC" | "JST" | "GST" | "BDT") {
                scale = first.to_string();
                if h.contains("x-ecef") {
                    pos = Pos::Ecef;
                } else if h.contains("latitude(d'") {
                    return Err(
                        "RTKLIB .pos with degrees-minutes-seconds positions is not read: \
                                re-run rnx2rtkp/RTKPOST with decimal degrees (-degf 0)"
                            .to_string(),
                    );
                }
            }
            continue;
        }
        let f: Vec<&str> = l.split_whitespace().collect();
        let parsed = (|| {
            let (ms, rest) = if f.first()?.contains('/') {
                let mut d = f[0].split('/');
                let y: i64 = d.next()?.parse().ok()?;
                let mo: i64 = d.next()?.parse().ok()?;
                let da: i64 = d.next()?.parse().ok()?;
                if d.next().is_some() || !plausible_date(y, mo, da) {
                    return None;
                }
                (
                    days_from_civil(y, mo, da) * DAY_MS + clock_ms(f.get(1)?)?,
                    2,
                )
            } else {
                let week: i64 = f.first()?.parse().ok()?;
                let tow: f64 = f.get(1)?.parse().ok()?;
                if !(0..=9999).contains(&week)
                    || !tow.is_finite()
                    || !(0.0..604_800.0).contains(&tow)
                {
                    return None;
                }
                (gps_week_ms(week, (tow * 1000.0).round() as i64), 2)
            };
            let num = |i: usize| -> Option<f64> {
                f.get(rest + i)?
                    .parse::<f64>()
                    .ok()
                    .filter(|v| v.is_finite())
            };
            let (a, b, c) = (num(0)?, num(1)?, num(2)?);
            let ns: Option<u32> = f.get(rest + 4).and_then(|s| s.parse().ok());
            let (lat_deg, lon_deg, height_m) = match pos {
                Pos::LatLon => {
                    if !(-90.0..=90.0).contains(&a) || !(-180.0..=360.0).contains(&b) {
                        return None;
                    }
                    (a, b, c)
                }
                Pos::Ecef => {
                    let g: Geodetic = ecef_to_geodetic([a, b, c]);
                    (g.lat_rad.to_degrees(), g.lon_rad.to_degrees(), g.alt_m)
                }
            };
            Some((ms, lat_deg, lon_deg, height_m, ns))
        })();
        match parsed {
            Some((ms, lat_deg, lon_deg, height_m, ns)) => {
                let e = map.at(ms);
                e.time_label = Some(label(ms, &scale));
                e.fix = Some(ReportedFix {
                    lat_deg,
                    lon_deg,
                    height_m,
                    n_used: ns,
                });
            }
            None => skipped += 1,
        }
    }
    Ok(map.finish(skipped))
}

#[cfg(test)]
mod tests {
    use super::*;

    const POS: &str = "\
% program   : RTKLIB ver.2.4.3
% obs start : 2024/03/01 12:00:00.0 GPST (week 2304 561600.0s)
%  GPST                  latitude(deg) longitude(deg)  height(m)   Q  ns   sdn(m)   sde(m)   sdu(m)  sdne(m)  sdeu(m)  sdun(m) age(s)  ratio
2024/03/01 12:00:00.000   59.911500000   10.757900000    12.3456   1  14   0.0050   0.0050   0.0100   0.0001   0.0001   0.0001   0.00    9.9
2024/03/01 12:00:01.000   59.911500100   10.757900100    12.3500   2  13   0.5000   0.5000   1.0000   0.0001   0.0001   0.0001   0.00    1.2
garbage line
2024/03/01 12:00:02.000   59.911500200   10.757900200    12.3400   5   9   1.0000   1.0000   2.0000   0.0001   0.0001   0.0001   0.00    0.0
";

    #[test]
    fn reads_latlon_epochs() {
        let tl = read_rtklib_pos(POS).unwrap();
        assert_eq!(tl.epochs.len(), 3);
        assert_eq!(tl.skipped_records, 1);
        assert_eq!(tl.epochs[2].t_s, 2.0);
        let f = tl.epochs[0].fix.unwrap();
        assert!((f.lat_deg - 59.9115).abs() < 1e-9 && f.n_used == Some(14));
        assert_eq!(
            tl.epochs[0].time_label.as_deref(),
            Some("2024-03-01T12:00:00.000 GPST")
        );
        assert!(tl.observables.contains(&"fix".to_string()));
    }

    #[test]
    fn reads_week_tow_and_ecef() {
        let txt = "\
% UTC x-ecef(m) y-ecef(m) z-ecef(m) Q ns sdx(m)
2304 561600.000 3149785.9652 598260.8822 5495348.4927 1 10 0.01
2304 561601.000 3149785.9652 598260.8822 5495348.4927 1 10 0.01
";
        let tl = read_rtklib_pos(txt).unwrap();
        assert_eq!(tl.epochs.len(), 2);
        let f = tl.epochs[0].fix.unwrap();
        assert!((f.lat_deg - 59.91).abs() < 0.01, "{}", f.lat_deg);
        assert!(tl.epochs[0].time_label.as_deref().unwrap().ends_with("UTC"));
    }

    #[test]
    fn refuses_dms_and_empty() {
        assert!(read_rtklib_pos("% GPST latitude(d'\")\n").is_err());
        let tl = read_rtklib_pos("% header only\n").unwrap();
        assert!(tl.epochs.is_empty());
    }

    #[test]
    fn hostile_input_does_not_panic() {
        for s in [
            "2024/99/99 99:99:99 a b c",
            "9999 1e308 1 2 3",
            "\u{0}\u{1}",
            "2024/03/01",
        ] {
            let _ = read_rtklib_pos(s);
        }
    }
}
