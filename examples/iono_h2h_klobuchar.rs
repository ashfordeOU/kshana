// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana's entry to a pre-registered ionosphere comparison (schema `iono_h2h/1`): the broadcast GPS
//! Klobuchar model, with its coefficients read from the day's merged broadcast navigation header, evaluated
//! at the requested VTEC nodes and station-satellite epochs. Kshana has no F2-peak model, so `peaks` is empty.
//!
//!   cargo run --release --example iono_h2h_klobuchar -- <requests.json> <BRDC...rnx.gz> > <window>.json
//!
//! - VTEC: the Klobuchar zenith delay at the node (elevation 90°), in TECU at L1.
//! - STEC: the Klobuchar slant delay from the station to the satellite position given in the request, in TECU.
//! - Times: the requests are UTC; GPS seconds of day are UTC + 18 s (the 2025 offset).
//!
//! MODELLED; advisory software.

use kshana::frames::ecef_to_geodetic;
use kshana::gnss_sim::klobuchar_delay_m;
use kshana::pvt::klobuchar_from_nav_header;
use serde_json::{json, Value};
use std::io::Read;

const F_L1: f64 = 1_575.42e6;
const GPS_MINUS_UTC_S: f64 = 18.0;

fn tecu(delay_m: f64) -> f64 {
    delay_m * F_L1 * F_L1 / 40.3 / 1e16
}

fn gps_sod(epoch: &str) -> f64 {
    // "YYYY-MM-DDTHH:MM:SSZ"
    let h: f64 = epoch[11..13].parse().unwrap();
    let m: f64 = epoch[14..16].parse().unwrap();
    let s: f64 = epoch[17..19].parse().unwrap();
    (h * 3_600.0 + m * 60.0 + s + GPS_MINUS_UTC_S).rem_euclid(86_400.0)
}

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let req: Value = serde_json::from_str(&std::fs::read_to_string(&a[1]).unwrap()).unwrap();
    let mut nav = String::new();
    flate2::read::GzDecoder::new(std::fs::File::open(&a[2]).unwrap())
        .read_to_string(&mut nav)
        .unwrap();
    let k = klobuchar_from_nav_header(&nav).expect("GPSA/GPSB in the navigation header");
    let d2r = std::f64::consts::PI / 180.0;

    let t_v = gps_sod(req["vtec_epoch"].as_str().unwrap());
    let vtec: Vec<Value> = req["vtec"]
        .as_array()
        .unwrap()
        .iter()
        .map(|n| {
            let (lat, lon) = (n[0].as_f64().unwrap(), n[1].as_f64().unwrap());
            let d = klobuchar_delay_m(&k, lat * d2r, lon * d2r, 90.0 * d2r, 0.0, t_v);
            json!([lat, lon, tecu(d)])
        })
        .collect();

    let stations = req["stec_stations"].as_object().unwrap();
    let stec: Vec<Value> = req["stec"]
        .as_array()
        .unwrap()
        .iter()
        .map(|row| {
            let (st, sat, ep) = (
                row[0].as_str().unwrap(),
                row[1].as_str().unwrap(),
                row[2].as_str().unwrap(),
            );
            let p: Vec<f64> = stations[st]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            let s: Vec<f64> = row[4]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect();
            let g = ecef_to_geodetic([p[0], p[1], p[2]]);
            let (sl, cl) = g.lat_rad.sin_cos();
            let (so, co) = g.lon_rad.sin_cos();
            let d = [s[0] - p[0], s[1] - p[1], s[2] - p[2]];
            let e = -so * d[0] + co * d[1];
            let n = -sl * co * d[0] - sl * so * d[1] + cl * d[2];
            let u = cl * co * d[0] + cl * so * d[1] + sl * d[2];
            let el = u.atan2((e * e + n * n).sqrt());
            let az = e.atan2(n);
            let dl = klobuchar_delay_m(&k, g.lat_rad, g.lon_rad, el, az, gps_sod(ep));
            json!([st, sat, ep, tecu(dl)])
        })
        .collect();

    let out = json!({
        "schema": "iono_h2h/1",
        "model": "kshana",
        "window": req["window"],
        "vtec": vtec,
        "peaks": [],
        "stec": stec,
    });
    println!("{}", serde_json::to_string(&out).unwrap());
}
