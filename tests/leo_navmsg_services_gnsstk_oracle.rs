// SPDX-License-Identifier: AGPL-3.0-only
//! M125 oracle: the single-frequency ionospheric and UTC services of a LEO navigation message
//! (`leo_navmsg::services`) against two independent implementations.
//!
//! Pre-registration (written 2026-10-02, committed before any oracle value was generated).
//! Round 1 was BLOCKED because the planned NeQuick G reference implementation of the Joint
//! Research Centre needs a registration. This round uses tools that need none:
//!
//! - **GNSSTk** (the GNSS Toolkit of the Applied Research Laboratories, University of Texas at
//!   Austin; https://github.com/SGL-UT/gnsstk, commit 55ea33448ed76b3ec0dae3f28aea70e3574c26ca,
//!   version 15.3.1, LGPL-3.0, built locally and run as a separate program through a small
//!   harness, never linked into Kshana): `KlobucharIonoNavData::getIonoCorr` (IS-GPS-200
//!   Figure 20-4 with the (f_L1/f)^2 scaling for other carriers), `NeQuickIonoNavData::
//!   getEffIonoLevel` (the effective ionisation level Az of the Galileo single-frequency
//!   algorithm, eq. 17-18 and the [0, 400] sfu clamp) and `GPSLNavTimeOffset::getOffset` (the
//!   system-time-to-UTC offset ΔtUTC = ΔtLS + A0 + A1 (t - t_ot + 604800 (WN - WN_ot))).
//! - **ERFA** through pyerfa (BSD-3-Clause, the version in the oracle virtual environment), which
//!   carries the International Earth Rotation and Reference Systems Service leap-second table
//!   and represents an inserted second as 23:59:60: the UTC time of day of a GPS instant across the
//!   real leap seconds of 2015-06-30 (ΔtLS 16 -> 17, WN_LSF 1851, DN 3) and 2016-12-31 (17 -> 18,
//!   WN_LSF 1929, DN 7), with A0 = A1 = 0. GNSSTk's `StdNavTimeOffset` does not implement the
//!   ICD's case (b) day-length rule (it switches to ΔtLSF at the start of day DN for six hours),
//!   so it is not used for the leap-second cases; that is written down here, before any run.
//!
//! Inputs (fixed now): Klobuchar with the real GPS broadcast coefficients of the IGS merged
//! navigation file BRDC00IGS_R_20242550000_01D_MN (header ION ALPHA/BETA, i.e. GPSA/GPSB) and
//! the IS-GPS-200 example set used in the module's tests, on a grid of receiver latitudes
//! (-75, -40, 0, 40, 75 deg), longitudes (-150, 0, 120 deg), satellite elevations (5, 20, 45,
//! 90 deg) and azimuths (0, 135, 270 deg) at four GPS times of day, for L1, L2 and L5 (the
//! receiver geodetic latitude, longitude, elevation and azimuth GNSSTk computes are passed to
//! Kshana unchanged); Az with the real Galileo coefficients of the same file (GAL), three
//! further sets (low, medium and high solar activity as broadcast-quantised values), the
//! all-zero set and a set that exceeds 400 sfu, on MODIP -90 to 90 deg in 5 deg steps; the UTC
//! drift with the real GPS UTC parameters of the same file (GPUT line) at 50 instants over the
//! following four weeks, case (a); the leap-second cases at every quarter second from 7 h before
//! to 7 h after each event (cases a, b and c), scored at whole and quarter seconds.
//!
//! Tolerances (fixed now): Klobuchar delay within 1e-3 m (three orders below the model's metre
//! scale; the two implementations evaluate the same closed form); Az within 1e-6 sfu (the round-1
//! plan's); UTC within 1 ns (the round-1 plan's), for both the drift term and the UTC time of day
//! of every leap-second case including the inserted second, which must read 86400 + fraction.
//! PROMOTE only if every case of every service agrees.
//!
//! Amendment (2026-10-02, after the ERFA values were generated and before any Kshana value was
//! compared): the full quarter-second leap grid is 403 202 rows (17.5 MB), too large to commit;
//! the fixture keeps every quarter second within 120 s of each event, every whole second within
//! 1 h and every 15 s over the full 7 h either side (21 602 rows). Tolerances unchanged.

use kshana::leo_navmsg::elements::{KlobucharSet, NequickSet, UtcOffset};
use kshana::leo_navmsg::services::{effective_ionisation_level, klobuchar_delay_m, system_to_utc};

const DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/leo_navmsg_services_gnsstk_oracle"
);

fn rows(file: &str) -> Vec<Vec<f64>> {
    let text = std::fs::read_to_string(format!("{DIR}/{file}")).expect(file);
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .skip(1)
        .map(|l| {
            l.split('\t')
                .map(|x| x.trim().parse::<f64>().unwrap())
                .collect()
        })
        .collect()
}

/// Worst Klobuchar, Az, UTC-drift and UTC-leap differences, and the case counts.
pub fn worst() -> ([f64; 4], [usize; 4]) {
    let mut w = [0.0_f64; 4];
    let mut n = [0usize; 4];
    // f_hz lat lon el az sod a0..a3 b0..b3 delay_m
    for r in rows("klobuchar.tsv") {
        let set = KlobucharSet {
            alpha: [r[6], r[7], r[8], r[9]],
            beta: [r[10], r[11], r[12], r[13]],
        };
        let d = klobuchar_delay_m(
            &set,
            r[0],
            r[1].to_radians(),
            r[2].to_radians(),
            r[3].to_radians(),
            r[4].to_radians(),
            r[5],
        );
        w[0] = w[0].max((d - r[14]).abs());
        n[0] += 1;
    }
    // ai0 ai1 ai2 modip az
    for r in rows("az.tsv") {
        let set = NequickSet {
            ai0: r[0],
            ai1: r[1],
            ai2: r[2],
            storm_flags: [false; 5],
        };
        w[1] = w[1].max((effective_ionisation_level(&set, r[3]) - r[4]).abs());
        n[1] += 1;
    }
    // a0 a1 dt_ls t_ot wn_ot wn_lsf dn dt_lsf week tow offset_s
    for r in rows("utc_drift.tsv") {
        let p = UtcOffset {
            a0: r[0],
            a1: r[1],
            dt_ls: r[2] as i32,
            t_ot: r[3],
            wn_ot: r[4] as u32,
            wn_lsf: r[5] as u32,
            dn: r[6] as u8,
            dt_lsf: r[7] as i32,
        };
        let (_, dt) = system_to_utc(&p, r[8] as u32, r[9]);
        w[2] = w[2].max((dt - r[10]).abs());
        n[2] += 1;
    }
    // dt_ls dt_lsf wn_lsf dn week tow utc_sod
    for r in rows("utc_leap.tsv") {
        let p = UtcOffset {
            a0: 0.0,
            a1: 0.0,
            dt_ls: r[0] as i32,
            t_ot: 0.0,
            wn_ot: r[2] as u32,
            wn_lsf: r[2] as u32,
            dn: r[3] as u8,
            dt_lsf: r[1] as i32,
        };
        let (u, _) = system_to_utc(&p, r[4] as u32, r[5]);
        w[3] = w[3].max((u - r[6]).abs());
        n[3] += 1;
    }
    (w, n)
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn services_match_gnsstk_and_erfa() {
    let (w, n) = worst();
    println!("worst: klobuchar {:.3e} m ({}), az {:.3e} sfu ({}), utc drift {:.3e} s ({}), utc leap {:.3e} s ({})",
        w[0], n[0], w[1], n[1], w[2], n[2], w[3], n[3]);
    assert!(n.iter().all(|&k| k > 0));
    assert!(w[0] <= 1e-3, "klobuchar {}", w[0]);
    assert!(w[1] <= 1e-6, "az {}", w[1]);
    assert!(w[2] <= 1e-9, "utc drift {}", w[2]);
    assert!(w[3] <= 1e-9, "utc leap {}", w[3]);
}
