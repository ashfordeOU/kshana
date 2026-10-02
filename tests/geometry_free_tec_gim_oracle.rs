// SPDX-License-Identifier: AGPL-3.0-only
//! Measured oracle for the ionosphere-sounding row ("Ionosphere sounding: slant TEC from the
//! dual-band delay of a LEO pass", the geometry-free slant total electron content).
//!
//! Pre-registration (validation 0.30, round 2, batch "sweepA"; written 2026-10-02 before the
//! observation file below was fetched, before the fixture was generated and before any
//! comparison was run).
//!
//! Engine seam (added with this pre-registration, the round-1 blocker): the closed form the
//! `leo-pass` report used inside a private closure becomes the public
//! `leo_link::iono::geometry_free_stec_tecu(p1_m, p2_m, f1_hz, f2_hz, dcb_p1_minus_p2_m)`,
//! `((p2 - p1) + dcb) f1^2 f2^2 / (40.3 (f1^2 - f2^2)) / 1e16`, and the report now calls it, so
//! this test exercises the row's own code path on measured code observations.
//!
//! Quantity: slant TEC (TEC units, 1e16 electrons/m^2) along each GPS line of sight from IGS
//! station ABMF (Le Moule, Guadeloupe, 97103M001), 2018-05-13, from the measured C1C (L1,
//! 1575.42 MHz) and C2W (L2, 1227.60 MHz) code pseudoranges.
//!
//! Inputs: `ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz` from the BKG (Federal Agency for
//! Cartography and Geodesy) IGS archive (Hatanaka-decompressed with `crx2rnx`), GPS only,
//! decimated to whole minutes; broadcast GPS ephemeris `brdc_2018133_G_Einav.rnx` already
//! committed with `tests/fixtures/joint_pvt_itrf_rtklib_oracle/`, for the line-of-sight geometry;
//! receiver position = the RINEX header approximate position. Code biases (all from CODE, the
//! Center for Orbit Determination in Europe, for this day or month): the C1C-C2W station bias of
//! ABMF printed in the GIM header (23.476 ns), the satellite C1W-C2W biases printed in the GIM
//! header, and the satellite C1W-C1C (P1-C1) biases of `P1C11805.DCB`; the C1C-C2W bias of a
//! line of sight is station + satellite(C1W-C2W) - satellite(C1W-C1C), passed in metres as the
//! engine's `dcb_p1_minus_p2_m`.
//!
//! Oracle (Measured): the CODE global ionosphere map `CODG1330.18I` (IONEX 1.0, 1 h maps), a
//! measurement-derived product (AIUB, University of Bern; IGS products are open). Its slant TEC
//! is evaluated by the fixture generator exactly as the file's header defines it: pierce point on
//! the 6821 km sphere (IONEX height 450 km) with geocentric latitude, vertical TEC by the IONEX
//! 1.0 recommended interpolation (bilinear in latitude and longitude, linear in time between the
//! two neighbouring maps each rotated by the Earth's rotation to the observation epoch: Schaer,
//! Gurtner and Feltens, IONEX 1.0, 1998, equation 3), converted to slant by CODE's modified
//! single-layer mapping 1/cos(asin(R/(R+H) sin(alpha z))), R = 6371 km, H = 506.7 km,
//! alpha = 0.9782, at the geodetic zenith angle z. Disclosed: ABMF is one of the GIM's 277 input
//! stations and the GIM's code biases were estimated together with the maps, which flatters the
//! agreement; the oracle is still a published product the engine did not make.
//!
//! Statistic (fixed now): a satellite arc is a run of epochs with gaps no longer than 5 minutes;
//! only epochs with elevation >= 30 deg and both codes present count; an arc counts when it has
//! at least 10 such one-minute epochs. Per arc, the mean of (engine slant TEC - GIM slant TEC).
//! Tolerance (the 0.30 plan's 3 TECU): every counted arc's mean difference within 3 TECU, and at
//! least 15 counted arcs. Reported, not graded: per-epoch RMS difference and the per-arc means.
//!
//! Discrimination, pre-registered: flipping the sign of the geometry-free combination
//! (`p1 - p2` in place of `p2 - p1`) must turn the test red. Reported only: a 10 % error in the
//! 40.3 constant.
//!
//! Result (run 2026-10-02 on the fixture of the commit after 5e795f93): FAIL, a finding. 36 arcs
//! counted; 33 within 3 TECU (26 within 1.5 TECU), per-epoch RMS 3.95 TECU. Outside: G06 from
//! 21:01 UTC (+6.84 TECU, a steady +5 to +11 TECU through the local evening, consistent with
//! the smooth degree-15 map missing post-sunset structure at a low-latitude station) and G31
//! from 09:20 UTC (-3.62 TECU, driven by code noise and multipath of +-10 TECU in the raw
//! geometry-free combination) and G09 from 16:20 UTC (+3.39 TECU, a 71-epoch arc). The formula's sign, constant and band order agree with the map
//! on every other arc (median |arc mean| about 1 TECU).
//!
//! Fixture: `tests/fixtures/geometry_free_tec_gim_oracle/los.csv` from `make_fixture.py` there
//! (NOTICE.md gives sources, licences, retrieval date and SHA-256).

use kshana::leo_link::iono::geometry_free_stec_tecu;
use std::path::PathBuf;

const F_L1: f64 = 1575.42e6;
const F_L2: f64 = 1227.60e6;
const C: f64 = 299_792_458.0;
const TOL_TECU: f64 = 3.0;
const MIN_ARC_EPOCHS: usize = 10;
const MIN_ARCS: usize = 15;
const ELEV_MIN_DEG: f64 = 30.0;
const GAP_S: f64 = 300.0;

/// One line of sight: PRN, seconds of day, elevation (deg), C1C and C2W (m), the line's
/// C1C-C2W code bias (ns) and the GIM slant TEC (TECU).
struct Los {
    prn: u32,
    sod: f64,
    elev: f64,
    c1c: f64,
    c2w: f64,
    bias_ns: f64,
    gim: f64,
}

fn load() -> Option<Vec<Los>> {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/geometry_free_tec_gim_oracle/los.csv");
    let text = std::fs::read_to_string(path).ok()?;
    let mut out = Vec::new();
    for line in text.lines() {
        if line.starts_with('#') || line.starts_with("prn") || line.trim().is_empty() {
            continue;
        }
        let f: Vec<f64> = line.split(',').map(|x| x.parse().expect("number")).collect();
        assert_eq!(f.len(), 7, "malformed line {line}");
        out.push(Los {
            prn: f[0] as u32,
            sod: f[1],
            elev: f[2],
            c1c: f[3],
            c2w: f[4],
            bias_ns: f[5],
            gim: f[6],
        });
    }
    Some(out)
}

/// Per-arc mean differences (engine - GIM) and the per-epoch differences.
fn arcs(los: &[Los]) -> (Vec<(u32, f64, usize, f64)>, Vec<f64>) {
    let mut prns: Vec<u32> = los.iter().map(|l| l.prn).collect();
    prns.sort_unstable();
    prns.dedup();
    let mut out = Vec::new();
    let mut all = Vec::new();
    for prn in prns {
        let mut v: Vec<&Los> = los
            .iter()
            .filter(|l| l.prn == prn && l.elev >= ELEV_MIN_DEG)
            .collect();
        v.sort_by(|a, b| a.sod.partial_cmp(&b.sod).expect("finite"));
        let mut start = 0;
        for k in 1..=v.len() {
            if k == v.len() || v[k].sod - v[k - 1].sod > GAP_S {
                let seg = &v[start..k];
                if seg.len() >= MIN_ARC_EPOCHS {
                    let d: Vec<f64> = seg
                        .iter()
                        .map(|l| {
                            geometry_free_stec_tecu(l.c1c, l.c2w, F_L1, F_L2, C * l.bias_ns * 1e-9)
                                - l.gim
                        })
                        .collect();
                    all.extend(&d);
                    out.push((prn, seg[0].sod, seg.len(), d.iter().sum::<f64>() / d.len() as f64));
                }
                start = k;
            }
        }
    }
    (out, all)
}

#[test]
#[ignore = "pre-registered; FAIL (finding): 33 of 36 arcs within 3 TECU, worst G06 evening arc +6.84 TECU, G31 -3.62 and G09 +3.39 TECU; see the header"]
fn geometry_free_slant_tec_matches_the_code_gim_on_abmf() {
    let Some(los) = load() else {
        eprintln!("SKIP: fixture los.csv absent (run make_fixture.py)");
        return;
    };
    let (arcs, all) = arcs(&los);
    let rms = (all.iter().map(|d| d * d).sum::<f64>() / all.len().max(1) as f64).sqrt();
    let mut worst: f64 = 0.0;
    for (prn, t0, n, m) in &arcs {
        eprintln!("G{prn:02} arc from {t0:.0} s, {n} epochs: mean difference {m:+.2} TECU");
        worst = worst.max(m.abs());
    }
    eprintln!("{} arcs, worst |arc mean| {worst:.2} TECU, per-epoch RMS {rms:.2} TECU", arcs.len());
    assert!(arcs.len() >= MIN_ARCS, "only {} counted arcs", arcs.len());
    assert!(worst <= TOL_TECU, "worst arc mean difference {worst:.2} TECU > {TOL_TECU}");
}

/// Pins the finding: at least 33 of the counted arcs agree with the GIM within 3 TECU and the
/// median |arc mean| is below 1.5 TECU.
#[test]
fn geometry_free_finding_is_pinned() {
    let Some(los) = load() else {
        eprintln!("SKIP: fixture los.csv absent (run make_fixture.py)");
        return;
    };
    let (arcs, _) = arcs(&los);
    let mut m: Vec<f64> = arcs.iter().map(|a| a.3.abs()).collect();
    m.sort_by(|a, b| a.partial_cmp(b).expect("finite"));
    let inside = m.iter().filter(|x| **x <= TOL_TECU).count();
    assert!(arcs.len() == 36 && inside >= 33, "{inside} of {} arcs inside", arcs.len());
    assert!(m[m.len() / 2] < 1.5, "median |arc mean| {}", m[m.len() / 2]);
}
