// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS-SDR monitor adapter: the receiver's `Monitor` (per-channel `Gnss_Synchro`) and PVT
//! monitor (`Monitor_Pvt`) streams, as JSON lines.
//!
//! GNSS-SDR streams both over UDP as Protocol Buffers. This reader takes the same messages
//! after the standard Protocol Buffers JSON mapping with the proto field names kept
//! (`MessageToJson(msg, preserving_proto_field_name=True)`), one object per line with an extra
//! `"msg"` key, `"synchro"` or `"pvt"`; `integrations/gnss-sdr/relay.py` makes such a file from
//! the live UDP stream. The field names are the ones in the GNSS-SDR documentation for the
//! Monitor and PVT blocks. Read here:
//!
//! * `synchro`: `System` (`G`, `E`, `R`, `C`, `S`, `J`), `Signal` (two-character GNSS-SDR
//!   signal id), `PRN`, `CN0_dB_hz`, `RX_time` (seconds of the GPS week) and
//!   `Flag_valid_pseudorange`; only valid ones with a positive C/N0 count.
//! * `pvt`: `rx_time`, `week`, `latitude`, `longitude`, `height`, `valid_sats`, `hdop`,
//!   `utc_time` and `tracked_satellites` (`prn`, `system`, `signal`, `azimuth_deg`,
//!   `elevation_deg`, `used`).
//!
//! Observations are placed in one-second bins of `RX_time`, the last value per satellite and
//! signal in a bin winning (GNSS-SDR emits every 20 ms by default).

use super::{sat_id_from_prn, EpochMap};
use crate::receiver_trust::{ReportedDop, ReportedFix, SatCn0, SatSky, Timeline};
use serde_json::Value;

const MAX_LINES: usize = 50_000_000;

fn f(v: &Value, k: &str) -> Option<f64> {
    v.get(k)?
        .as_f64()
        .or_else(|| v.get(k)?.as_str()?.parse().ok())
        .filter(|x| x.is_finite())
}

fn u(v: &Value, k: &str) -> Option<u32> {
    f(v, k)
        .filter(|x| *x >= 0.0 && *x < 4.0e9)
        .map(|x| x as u32)
}

fn sys(v: &Value, k: &str) -> Option<char> {
    let c = v.get(k)?.as_str()?.chars().next()?;
    "GERCSJ".contains(c).then_some(c)
}

/// Read a GNSS-SDR monitor capture (JSON lines).
pub fn read_gnss_sdr_monitor(text: &str) -> Result<Timeline, String> {
    let mut map = EpochMap::default();
    let mut skipped = 0usize;
    let mut week: Option<i64> = None;
    for line in text.lines().take(MAX_LINES) {
        let l = line.trim();
        if l.is_empty() {
            continue;
        }
        let Ok(v) = serde_json::from_str::<Value>(l) else {
            skipped += 1;
            continue;
        };
        let ok = match v.get("msg").and_then(Value::as_str) {
            Some("synchro") => synchro(&v, &mut map),
            Some("pvt") => pvt(&v, &mut map, &mut week),
            _ => None,
        };
        if ok.is_none() {
            skipped += 1;
        }
    }
    let tl = map.finish(skipped);
    if tl.epochs.is_empty() {
        return Err(crate::terr!(
            "e-receiver-trust-machines-gnss-sdr-no-gnss-sdr-synchro-or",
            skipped = skipped
        ));
    }
    Ok(tl)
}

fn bin_ms(t_s: f64) -> Option<i64> {
    (t_s.is_finite() && (0.0..604_800.0).contains(&t_s)).then(|| (t_s.floor() as i64) * 1000)
}

fn synchro(v: &Value, map: &mut EpochMap) -> Option<()> {
    let key = bin_ms(f(v, "RX_time")?)?;
    let letter = sys(v, "System")?;
    let sat = sat_id_from_prn(letter, u(v, "PRN")?)?;
    let valid = v
        .get("Flag_valid_pseudorange")
        .and_then(Value::as_bool)
        .unwrap_or(false);
    let cn0 = f(v, "CN0_dB_hz")?;
    let band = v
        .get("Signal")
        .and_then(Value::as_str)
        .unwrap_or("1C")
        .to_string();
    let e = map.at(key);
    e.time_label.get_or_insert_with(|| {
        crate::t!(
            "receiver-trust-machines-gnss-sdr-gps-tow",
            v1 = crate::i18n::localise_decimal(format!("{:.0}", key as f64 / 1000.0))
        )
    });
    if valid && cn0 > 0.0 {
        if let Some(s) = e.cn0.iter_mut().find(|s| s.sat == sat && s.band == band) {
            s.cn0_dbhz = cn0;
        } else {
            e.cn0.push(SatCn0 {
                sat,
                band,
                cn0_dbhz: cn0,
            });
        }
    }
    Some(())
}

fn pvt(v: &Value, map: &mut EpochMap, week: &mut Option<i64>) -> Option<()> {
    let t = f(v, "rx_time")?;
    let key = bin_ms(t % 604_800.0).filter(|_| t >= 0.0)?;
    if let Some(w) = u(v, "week").filter(|w| *w > 0) {
        *week = Some(i64::from(w));
    }
    let e = map.at(key);
    let tow = key as f64 / 1000.0;
    e.time_label = Some(
        match (
            u(v, "week").filter(|w| *w > 0).or(week.map(|w| w as u32)),
            v.get("utc_time").and_then(Value::as_str),
        ) {
            (_, Some(utc)) if !utc.is_empty() => utc.to_string(),
            (Some(w), _) => crate::t!(
                "receiver-trust-ingest-gps-week-tow-2",
                w = w,
                tow = crate::i18n::localise_decimal(format!("{:.0}", tow))
            ),
            _ => crate::t!(
                "receiver-trust-ingest-gps-tow",
                tow = crate::i18n::localise_decimal(format!("{:.0}", tow))
            ),
        },
    );
    let (lat, lon) = (f(v, "latitude")?, f(v, "longitude")?);
    if (-90.0..=90.0).contains(&lat) && (-180.0..=360.0).contains(&lon) {
        e.fix = Some(ReportedFix {
            lat_deg: lat,
            lon_deg: lon,
            height_m: f(v, "height").unwrap_or(0.0),
            n_used: u(v, "valid_sats"),
        });
    }
    if let Some(h) = f(v, "hdop").filter(|h| *h > 0.0) {
        e.reported_dop = Some(ReportedDop {
            pdop: f(v, "pdop").filter(|p| *p > 0.0),
            hdop: Some(h),
            vdop: f(v, "vdop").filter(|p| *p > 0.0),
            n_used: u(v, "valid_sats").unwrap_or(0),
        });
    }
    if let Some(list) = v.get("tracked_satellites").and_then(Value::as_array) {
        for s in list {
            let (Some(letter), Some(prn)) = (sys(s, "system"), u(s, "prn")) else {
                continue;
            };
            let (Some(sat), Some(el), Some(az)) = (
                sat_id_from_prn(letter, prn),
                f(s, "elevation_deg"),
                f(s, "azimuth_deg"),
            ) else {
                continue;
            };
            let az = az.rem_euclid(360.0);
            if !(-90.0..=90.0).contains(&el) {
                continue;
            }
            let used = s.get("used").and_then(Value::as_bool).unwrap_or(true);
            if let Some(x) = e.sky.iter_mut().find(|x| x.sat == sat) {
                x.elev_deg = el;
                x.azim_deg = az;
                x.tracked |= used;
            } else {
                e.sky.push(SatSky {
                    sat,
                    elev_deg: el,
                    azim_deg: az,
                    tracked: used,
                });
            }
        }
    }
    Some(())
}

#[cfg(test)]
mod tests {
    use super::*;

    const LOG: &str = r#"
{"msg":"synchro","System":"G","Signal":"1C","PRN":5,"CN0_dB_hz":44.5,"RX_time":100.02,"Flag_valid_pseudorange":true}
{"msg":"synchro","System":"G","Signal":"1C","PRN":5,"CN0_dB_hz":45.5,"RX_time":100.04,"Flag_valid_pseudorange":true}
{"msg":"synchro","System":"E","Signal":"1B","PRN":11,"CN0_dB_hz":40.0,"RX_time":100.06,"Flag_valid_pseudorange":false}
{"msg":"synchro","System":"E","Signal":"1B","PRN":11,"CN0_dB_hz":41.0,"RX_time":101.02,"Flag_valid_pseudorange":true}
{"msg":"pvt","rx_time":101.0,"week":2300,"latitude":59.91,"longitude":10.75,"height":12.5,"valid_sats":9,"hdop":1.1,"utc_time":"2024-03-01T12:00:01.000Z","tracked_satellites":[{"prn":5,"system":"G","signal":"1C","azimuth_deg":-170.0,"elevation_deg":35.0,"used":true},{"prn":11,"system":"E","signal":"1B","azimuth_deg":40.0,"elevation_deg":-5.0,"used":false}]}
not json
{"msg":"other"}
"#;

    #[test]
    fn reads_synchro_and_pvt() {
        let tl = read_gnss_sdr_monitor(LOG).unwrap();
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.skipped_records, 2);
        let e0 = &tl.epochs[0];
        assert_eq!(e0.cn0.len(), 1, "the invalid E11 observation is dropped");
        assert_eq!(e0.cn0[0].cn0_dbhz, 45.5, "last value in the bin wins");
        let e1 = &tl.epochs[1];
        assert_eq!(e1.t_s, 1.0);
        assert_eq!(e1.fix.unwrap().n_used, Some(9));
        assert_eq!(e1.time_label.as_deref(), Some("2024-03-01T12:00:01.000Z"));
        assert_eq!(e1.sky.len(), 2);
        assert!((e1.sky[0].azim_deg - 190.0).abs() < 1e-9);
        assert!(!e1.sky[1].tracked);
        assert_eq!(e1.cn0[0].sat, "E11");
    }

    #[test]
    fn nothing_readable_is_an_error() {
        assert!(read_gnss_sdr_monitor("hello\n{}\n").is_err());
        assert!(read_gnss_sdr_monitor("").is_err());
    }
}
