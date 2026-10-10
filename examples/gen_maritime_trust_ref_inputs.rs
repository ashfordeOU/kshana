// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the synthetic NMEA 0183 inputs of the maritime-trust external-oracle comparison to
//! `tests/fixtures/maritime_trust/`: one 400 s voyage with a drag-off (for the monitor
//! statistics), short voyages at other latitudes and across the antimeridian (for the geodesy),
//! and variants of the first 90 s that use VTG instead of RMC and VBW instead of VHW (for the decoding). Text only; no radio signal, no measured data.
//!
//! `cargo run --release --example gen_maritime_trust_ref_inputs`
//! then `python3 scripts/gen_maritime_trust_ref.py` for the oracle's reference.

use kshana::receiver_trust::synth::{synth_voyage, DragSpec, VoyageSpec};

const DIR: &str = "tests/fixtures/maritime_trust";

fn crlf(text: &str) -> String {
    text.lines().map(|l| format!("{l}\r\n")).collect()
}

fn checksummed(body: &str) -> String {
    let ck = body.bytes().fold(0u8, |a, b| a ^ b);
    format!("${body}*{ck:02X}")
}

/// The first `n` seconds of a log: its lines up to the GGA of epoch `n`.
fn first_seconds(text: &str, n: usize) -> String {
    let mut out = String::new();
    let mut ggas = 0;
    for l in text.lines() {
        if l.contains("GGA") {
            ggas += 1;
            if ggas > n {
                break;
            }
        }
        out.push_str(l);
        out.push('\n');
    }
    out
}

/// Rewrite the lines whose sentence type is `kind` with `f(fields)`; `None` drops the line.
fn rewrite(text: &str, kind: &str, f: impl Fn(&[&str]) -> Option<String>) -> String {
    let mut out = String::new();
    for l in text.lines() {
        let body = &l[1..l.find('*').unwrap()];
        let fields: Vec<&str> = body.split(',').collect();
        if fields[0].ends_with(kind) {
            if let Some(b) = f(&fields) {
                out.push_str(&checksummed(&b));
                out.push('\n');
            }
        } else {
            out.push_str(l);
            out.push('\n');
        }
    }
    out
}

/// A made-up position fault: from epoch `from` on, the GGA and RMC latitudes are `dlat` degrees
/// further north (a step of about 170 m for 0.0015 degrees), so that the implied speed,
/// acceleration and dead-reckoning residual of the kinematic monitor leave their quiet values.
fn step_position(text: &str, from: usize, dlat: f64) -> String {
    let mut epoch = 0usize;
    let mut out = String::new();
    for l in text.lines() {
        let body = &l[1..l.find('*').unwrap()];
        let mut f: Vec<String> = body.split(',').map(str::to_string).collect();
        let kind = f[0].clone();
        if kind.ends_with("GGA") {
            epoch += 1;
        }
        let lat_at = if kind.ends_with("GGA") {
            Some(2)
        } else if kind.ends_with("RMC") {
            Some(3)
        } else {
            None
        };
        match lat_at {
            Some(i) if epoch > from => {
                let v: f64 = f[i].parse().unwrap();
                let deg = (v / 100.0).trunc();
                let a = deg + (v - deg * 100.0) / 60.0 + dlat;
                let (d, m) = (a.trunc(), (a - a.trunc()) * 60.0);
                f[i] = format!("{:02}{:08.5}", d as u32, m);
                out.push_str(&checksummed(&f.join(",")));
            }
            _ => out.push_str(l),
        }
        out.push('\n');
    }
    out
}

fn write(name: &str, text: &str) {
    std::fs::write(format!("{DIR}/{name}"), crlf(text)).expect("write");
    println!("wrote {DIR}/{name}");
}

fn main() {
    std::fs::create_dir_all(DIR).unwrap();
    // The monitors' voyage: a ferry track, a drag-off from 250 s that departs to starboard.
    let main_spec = VoyageSpec {
        // A turn of about 60 degrees to port after roughly 2 km, so that the implied turn rate
        // exceeds the position-uncertainty allowance of the kinematic monitor.
        route: vec![(59.455, 24.770), (59.470, 24.790), (59.600, 24.760)],
        duration_s: 400.0,
        sog_kn: 17.0,
        geoid_sep_m: 21.0,
        seed: 7_001,
        drag: Some(DragSpec {
            onset_s: 250.0,
            accel_mps2: 0.02,
            speed_mps: 3.0,
            bearing_rel_deg: 60.0,
            cn0_common_dbhz: Some(46.0),
            cn0_ramp_s: 60.0,
        }),
        ..Default::default()
    };
    let main = step_position(&synth_voyage(&main_spec), 320, 0.0015);
    write("voyage.nmea", &main);

    // Other latitudes, and the antimeridian, for the geodesy and the decoding of hemispheres.
    for (name, route, seed) in [
        ("lat_s45.nmea", vec![(-45.0, 170.0), (-45.0, 170.3)], 11),
        ("lat_0.nmea", vec![(0.0, -30.0), (0.1, -29.8)], 12),
        ("lat_30.nmea", vec![(30.0, -80.0), (30.1, -79.9)], 13),
        ("lat_70.nmea", vec![(70.0, 20.0), (70.1, 20.5)], 14),
        (
            "antimeridian.nmea",
            vec![(10.0, 179.998), (10.0, -179.9)],
            15,
        ),
    ] {
        let spec = VoyageSpec {
            route,
            duration_s: 100.0,
            seed,
            ..Default::default()
        };
        write(name, &synth_voyage(&spec));
    }

    // Decoding variants of the first 90 s of the main voyage.
    let head = first_seconds(&main, 90);
    // VTG for speed and course (no RMC).
    write("variant_vtg_only.nmea", &rewrite(&head, "RMC", |_| None));
    // VBW for the speed through the water, instead of VHW (longitudinal water speed first).
    write(
        "variant_vbw.nmea",
        &rewrite(&head, "VHW", |f| {
            Some(format!("VWVBW,{},0.00,A,{},0.00,A", f[5], f[5]))
        }),
    );
}
