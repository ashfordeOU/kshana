// SPDX-License-Identifier: AGPL-3.0-only
//! Throwaway generator: emit the frozen kshana CCSDS OEM fixture that CARRIES a
//! covariance block, for `tests/ccsds_oem_covariance_reference.rs` and its
//! independent oem-library oracle.
//!
//! kshana's `covariance_block_kvn` writes the CCSDS 502.0 covariance as an
//! UNLABELLED lower-triangular 6x6 (bare numbers, one matrix row per line) — the
//! KVN form the third-party `oem` library's parser actually accepts (it REJECTS
//! the labelled `CX_X = …` variant). Because `oem` only parses a covariance that
//! sits INSIDE a segment (Section.DATA → COVARIANCE_START), this generator embeds
//! the block in a full, valid OEM 2.0 segment: header + one EME2000/UTC segment of
//! real kshana propagator states, then the covariance block spliced in before
//! META/EOF.
//!
//! The covariance matrix is a realistic LEO orbit-determination 6x6 (position km²,
//! position-velocity km²/s, velocity km²/s²), symmetric positive-definite, with
//! distinct off-diagonals so a transpose/index bug could not pass unnoticed.
//!
//! Run: cargo run --example gen_p5_ccsds_cov_fixture

use kshana::oem::{
    covariance_block_kvn, Covariance6, OemFile, OemMetadata, OemSegment, OemStateLine,
};
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

/// A realistic, symmetric positive-definite LEO orbit-determination covariance in
/// CCSDS OEM units: [x,y,z] in km², [ẋ,ẏ,ż] in km²/s², cross-terms km²/s. Built as
/// L·Lᵀ from a lower-triangular L with distinct entries so the matrix is genuinely
/// asymmetric-free of accidental symmetry AND positive-definite; magnitudes are
/// position σ ≈ 10–30 m and velocity σ ≈ 3–10 mm/s, typical for a converged LEO OD.
#[allow(clippy::needless_range_loop)]
fn od_covariance() -> Covariance6 {
    // Lower-triangular generator L (units: km on the position rows, km/s on the
    // velocity rows). Distinct, non-trivial entries.
    let l: [[f64; 6]; 6] = [
        [1.2e-2, 0.0, 0.0, 0.0, 0.0, 0.0],
        [3.0e-3, 1.5e-2, 0.0, 0.0, 0.0, 0.0],
        [-2.0e-3, 4.0e-3, 1.8e-2, 0.0, 0.0, 0.0],
        [1.0e-5, -3.0e-6, 2.0e-6, 6.0e-6, 0.0, 0.0],
        [-2.0e-6, 5.0e-6, 1.0e-6, 1.5e-6, 5.0e-6, 0.0],
        [3.0e-6, 1.0e-6, -4.0e-6, 8.0e-7, 1.2e-6, 4.0e-6],
    ];
    let mut c = [[0.0f64; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            let mut s = 0.0;
            for k in 0..6 {
                s += l[i][k] * l[j][k];
            }
            c[i][j] = s;
        }
    }
    c
}

/// Build one EME2000/UTC segment of `n` epochs at `step_s`, epochs stamped from `t0`
/// on a whole-second grid (matching kshana's emitter format).
fn segment(object: &str, prop: &Propagator, t0: EpochUtc, step_s: f64, n: usize) -> OemSegment {
    let base_sod = t0.hour as f64 * 3600.0 + t0.minute as f64 * 60.0 + t0.second;
    let stamp = |i: usize| -> EpochUtc {
        let total = base_sod + i as f64 * step_s;
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
    let mut states = Vec::with_capacity(n);
    for i in 0..n {
        let t = i as f64 * step_s;
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

/// Serialise a single-segment OEM that CARRIES `cov` as a CCSDS covariance block at
/// the segment's first epoch. Header + states come from `OemFile::to_oem_string`;
/// the covariance block (kshana's own `covariance_block_kvn`) is spliced in after
/// the state lines, inside the segment, exactly where CCSDS 502.0 places it.
fn oem_with_covariance(f: &OemFile, cov: &Covariance6, cov_ref_frame: Option<&str>) -> String {
    let mut text = f.to_oem_string();
    // The covariance epoch is the segment's first state epoch (as a KVN string).
    let cov_epoch = iso(&f.segments[0].states[0].epoch);
    let block = covariance_block_kvn(&cov_epoch, cov, cov_ref_frame);
    // Ensure a blank line separates the ephemeris lines from the covariance block.
    if !text.ends_with('\n') {
        text.push('\n');
    }
    text.push('\n');
    text.push_str(&block);
    text
}

fn main() {
    let created = epoch(2026, 6, 27, 0, 0, 0.0);
    let t0 = epoch(2024, 1, 1, 0, 0, 0.0);

    // Single-segment LEO, 6 epochs at 300 s — enough state context for a valid OEM.
    let leo = Propagator::Kepler(Orbit::keplerian(6_878_000.0, 0.001, 0.9, 0.3, 0.2, 0.4));
    let f = OemFile {
        version: "2.0".to_string(),
        creation_date: created,
        originator: "KSHANA".to_string(),
        segments: vec![segment("KSHANA-COV-LEO-1", &leo, t0, 300.0, 6)],
    };

    let cov = od_covariance();
    let text = oem_with_covariance(&f, &cov, Some("RTN"));

    // Sanity echo to stderr.
    eprintln!(
        "cov fixture: 1 segment, {} states, covariance epoch {}",
        f.segments[0].states.len(),
        iso(&f.segments[0].states[0].epoch),
    );
    eprintln!("covariance diagonal (km²/km²·s⁻²):");
    for (i, row) in cov.iter().enumerate() {
        eprintln!("  C[{i}][{i}] = {:.6e}", row[i]);
    }

    let dir = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/ccsds_cov");
    std::fs::create_dir_all(dir).unwrap();
    std::fs::write(format!("{dir}/kshana_cov_leo.oem"), &text).unwrap();
    eprintln!("wrote fixture to {dir}/kshana_cov_leo.oem");
}
