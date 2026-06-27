// SPDX-License-Identifier: AGPL-3.0-only
//! Throwaway generator: emit the frozen kshana EME2000 CCSDS OEM fixtures that
//! `tests/ccsds_oem_interop_reference.rs` and the oem-library oracle consume.
//!
//! It serialises real kshana propagator states (`Propagator::state_eci`) through
//! kshana's own CCSDS OEM serialiser (`OemFile::to_oem_string`) into two files
//! under `tests/fixtures/ccsds_oem_interop/`:
//!   - `kshana_leo_eme2000.oem`     — single segment, 12 epochs of one LEO object;
//!   - `kshana_meo_eme2000_multiseg.oem` — two contiguous arcs (segments) of one
//!     MEO object, 6 + 6 epochs (the multi-segment case CCSDS 502.0 allows: the
//!     segments are time-contiguous arcs of the SAME object, which is what the
//!     independent `oem` library enforces — see the reference test's findings).
//!
//! Tokens are standard CCSDS: REF_FRAME = EME2000, TIME_SYSTEM = UTC,
//! CENTER_NAME = EARTH. The numeric states are kshana's; only the metadata tokens
//! are set on the `OemMetadata` struct (its fields are public) so the file uses
//! standard frame/time names the oem library validates against, rather than the
//! TEME/GPS labels `from_propagators` hardcodes.
//!
//! Run: cargo run --example gen_ccsds_oem_interop_fixtures

use kshana::oem::{OemFile, OemMetadata, OemSegment, OemStateLine};
use kshana::orbit::{Orbit, Propagator};
use kshana::rinex::EpochUtc;

fn epoch(y: i32, mo: u32, d: u32, h: u32, mi: u32, s: f64) -> EpochUtc {
    EpochUtc {
        year: y,
        month: mo,
        day: d,
        hour: h,
        minute: mi,
        second: s,
    }
}

fn iso(e: &EpochUtc) -> String {
    format!(
        "{:04}-{:02}-{:02}T{:02}:{:02}:{:09.6}",
        e.year, e.month, e.day, e.hour, e.minute, e.second
    )
}

/// Build one EME2000/UTC segment of `n` epochs at `step_s` starting `start_s` into
/// the propagation, with epochs stamped from `t0` + offset (whole-second grid).
fn segment(
    object: &str,
    prop: &Propagator,
    t0: EpochUtc,
    base_offset_s: f64,
    sample_offset_s: f64,
    step_s: f64,
    n: usize,
) -> OemSegment {
    let mut states = Vec::with_capacity(n);
    // Stamp epochs from a whole-second seconds-of-day base so the printed calendar
    // times are exact (no f64 cancellation in the date), matching kshana's emitter.
    let base_sod = t0.hour as f64 * 3600.0 + t0.minute as f64 * 60.0 + t0.second;
    let stamp = |i: usize| -> EpochUtc {
        let total = base_sod + base_offset_s + i as f64 * step_s;
        let mut sod = total;
        let hour = (sod / 3600.0).floor();
        sod -= hour * 3600.0;
        let minute = (sod / 60.0).floor();
        sod -= minute * 60.0;
        EpochUtc {
            year: t0.year,
            month: t0.month,
            day: t0.day,
            hour: hour as u32,
            minute: minute as u32,
            second: sod,
        }
    };
    for i in 0..n {
        let t = sample_offset_s + i as f64 * step_s;
        let s = prop.state_eci(t);
        states.push(OemStateLine {
            epoch: stamp(i),
            pos_km: [s.r_m[0] / 1000.0, s.r_m[1] / 1000.0, s.r_m[2] / 1000.0],
            vel_km_s: [
                s.v_m_s[0] / 1000.0,
                s.v_m_s[1] / 1000.0,
                s.v_m_s[2] / 1000.0,
            ],
        });
    }
    let start = states.first().unwrap().epoch;
    let stop = states.last().unwrap().epoch;
    OemSegment {
        meta: OemMetadata {
            object_name: object.to_string(),
            object_id: object.to_string(),
            center_name: "EARTH".to_string(),
            ref_frame: "EME2000".to_string(),
            time_system: "UTC".to_string(),
            start,
            stop,
        },
        states,
    }
}

fn main() {
    let created = epoch(2026, 6, 27, 0, 0, 0.0);
    let t0 = epoch(2024, 1, 1, 0, 0, 0.0);

    // --- Fixture 1: single-segment LEO, 12 epochs at 300 s ---
    let leo = Propagator::Kepler(Orbit::keplerian(6_878_000.0, 0.001, 0.9, 0.3, 0.2, 0.4));
    let f_leo = OemFile {
        version: "2.0".to_string(),
        creation_date: created,
        originator: "KSHANA".to_string(),
        segments: vec![segment("KSHANA-LEO-1", &leo, t0, 0.0, 0.0, 300.0, 12)],
    };
    let leo_text = f_leo.to_oem_string();

    // --- Fixture 2: two contiguous arcs (segments) of ONE MEO object ---
    // Arc A: epochs 0..6 (every 600 s); Arc B: epochs starting at 1h, 6 more.
    let meo = Propagator::Kepler(Orbit::keplerian(26_560_000.0, 0.01, 0.96, 0.3, 0.2, 0.4));
    let arc_a = segment("KSHANA-MEO-1", &meo, t0, 0.0, 0.0, 600.0, 6);
    // Arc B picks up an hour after t0 (base_offset 3600 s) and samples the same
    // propagator from t = 3600 s onward — a genuine contiguous later arc.
    let arc_b = segment("KSHANA-MEO-1", &meo, t0, 3600.0, 3600.0, 600.0, 6);
    let f_meo = OemFile {
        version: "2.0".to_string(),
        creation_date: created,
        originator: "KSHANA".to_string(),
        segments: vec![arc_a, arc_b],
    };
    let meo_text = f_meo.to_oem_string();

    // Sanity echo to stderr (epoch spans), so a human running this sees the shape.
    eprintln!(
        "LEO single-seg: {} states, span {} .. {}",
        f_leo.segments[0].states.len(),
        iso(&f_leo.segments[0].meta.start),
        iso(&f_leo.segments[0].meta.stop),
    );
    eprintln!(
        "MEO multi-seg: seg0 {} states ({}..{}), seg1 {} states ({}..{})",
        f_meo.segments[0].states.len(),
        iso(&f_meo.segments[0].meta.start),
        iso(&f_meo.segments[0].meta.stop),
        f_meo.segments[1].states.len(),
        iso(&f_meo.segments[1].meta.start),
        iso(&f_meo.segments[1].meta.stop),
    );

    let dir = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/ccsds_oem_interop"
    );
    std::fs::create_dir_all(dir).unwrap();
    std::fs::write(format!("{dir}/kshana_leo_eme2000.oem"), &leo_text).unwrap();
    std::fs::write(format!("{dir}/kshana_meo_eme2000_multiseg.oem"), &meo_text).unwrap();
    eprintln!("wrote fixtures to {dir}");
}
