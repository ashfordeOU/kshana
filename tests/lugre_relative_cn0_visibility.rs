// SPDX-License-Identifier: AGPL-3.0-only
//! Earth-GNSS reception at lunar distance, restated from absolute to RELATIVE carrier-to-noise
//! density (C/N0) plus visibility: Kshana's link prediction with the measured GPS Block IIR
//! and IIR-M transmit patterns against what the LuGRE (Lunar GNSS Receiver Experiment) flight
//! receiver measured between the Earth and the Moon in 2025.
//!
//! PRE-REGISTRATION (written 2026-10-02, before the LuGRE dataset, the NAVCEN patterns, the
//! orbit files or the spacecraft kernels were downloaded or opened; the engine,
//! `kshana::earth_gnss_lunar::transmit_side_db` with `kshana::antenna::GainPattern2D`, was
//! committed beforehand with unit tests on hand-made cases only).
//!
//! WHY RELATIVE. Parker et al. (NAVIGATION 73(1), the LuGRE results; reading copy not
//! vendored) report measured C/N0 7 to 12 dB below prediction with no accepted explanation. A
//! loss common to every satellite the receiver tracks at one instant cancels in the difference
//! of two of them, so the bar here is the DIFFERENCE of C/N0 between two satellites at the same
//! epoch, never the absolute value.
//!
//! QUANTITY. (V) Visibility: each GPS satellite the flight receiver reports with an L1 C/A C/N0
//! is predicted not occulted by the Earth and inside the tabulated range of its transmit
//! pattern. (R) For every pair of Block IIR or IIR-M satellites tracked at the same epoch,
//! `ΔC/N0 measured − ΔC/N0 predicted`, where the prediction is
//! `P_T + G_T(azimuth, off-nadir) − free-space loss` per satellite (`transmit_side_db`), all
//! receiver-side terms cancelling. Blocks IIF and III (and Galileo) are EXCLUDED IN ADVANCE: no
//! measured pattern for them is public.
//!
//! ORACLE (Measured kind): the flight receiver's raw GPS L1 C/A C/N0 in the LuGRE Mission
//! Data, Zenodo record 16411687 (`LuGRE.zip`, CC BY 4.0, Parker et al.), extracted by
//! `xval/lugre-relative-cn0/generate.py` (Python, independent of Kshana) into
//! `tracked.csv`. The onboard navigation solution is NOT used, neither as truth nor as input.
//!
//! INPUTS (each a fixture in `tests/fixtures/lugre_relative_cn0/` with generator and NOTICE):
//! - Epochs: raw-observable epochs of the transit and lunar-orbit phases, at most one per
//!   10 minutes, on the 5-minute grid of the orbit file, before 2025-03-02T08:00:00Z (the
//!   surface phase is held out and not opened), with the receiver at least 100 000 km from the
//!   Earth's centre. Commissioning (near Earth) is excluded by that distance.
//! - Receiver position: the reconstructed Blue Ghost Mission 1 trajectory in the NAIF (Navigation
//!   and Ancillary Information Facility) CLPS (Commercial Lunar Payload Services) SPICE archive
//!   (`https://naif.jpl.nasa.gov/pub/naif/pds/pds4/clps/clps_spice/`), evaluated with spiceypy in
//!   the ITRF93 frame; an epoch the kernels do not cover is dropped. Sun position from the same
//!   SPICE run (DE440 planetary kernel), ITRF93.
//! - GPS positions: ESA/ESOC (European Space Operations Centre) final multi-GNSS orbits
//!   `ESA0MGNFIN_*_01D_05M_ORB.SP3`, the record at the epoch (no interpolation; the signal
//!   travel time of about 1.3 s, a few kilometres of satellite motion, is neglected).
//! - Blocks and SVNs (space vehicle numbers): the IGS (International GNSS Service) satellite
//!   metadata SINEX file at the epoch's date.
//! - Transmit patterns: the NAVCEN (US Coast Guard Navigation Center) release
//!   `GPS_IIR_IIR-M_LM.zip` (Lockheed Martin measured L1 patterns of Blocks IIR and IIR-M), the
//!   satellite's own SVN pattern; a satellite whose SVN has no L1 pattern is excluded. Azimuth
//!   and off-nadir as the release defines its axes, mapped to the yaw-steering body frame of
//!   `yaw_steering_axes`; if the release does not define its azimuth reference, the azimuth
//!   average (`GainPattern2D::azimuth_average`) is used instead, decided by reading the release
//!   documentation before any comparison.
//! - Transmit power: equal for IIR-A, IIR-B and IIR-M L1 C/A (14.5 dBW, Montenbruck et al.
//!   2023, J. Geod. 97:96, Table 2), so it cancels in every pair.
//! - Earth: a sphere of radius 6 378 137 m for occultation.
//!
//! TOLERANCES (fixed here):
//! - V: at least 99 % of tracked (epoch, IIR/IIR-M satellite) records predicted visible (not
//!   occulted and inside the pattern), and at least 50 records.
//! - R1 non-vacuity: at least 30 pairs from at least 10 epochs.
//! - R2: RMS of the pair residual at most 3.0 dB and median absolute residual at most 2.0 dB.
//!   Source: per satellite, about 1 dB of flight C/N0 estimator noise at 25 to 30 dB-Hz, about
//!   1 dB of satellite-to-satellite spread of L1 C/A transmit power within a block (the
//!   "about 1 dB" accuracy Montenbruck et al. 2023 state for their power inputs), and up to
//!   1 dB of receive-gain difference neglected across the cone of a few degrees in which every
//!   GPS satellite lies as seen from beyond 100 000 km; a pair carries √2 of the first two and
//!   the third once: root-sum-square 2.2 dB, bar 3.0 dB RMS and 2.0 dB median.
//!
//! REPORTED, NOT GATING: the same residuals with the azimuth-averaged pattern and with the
//! Airy stand-in the existing M039 report uses, for context.

use kshana::antenna::GainPattern2D;
use kshana::earth_gnss_lunar::transmit_side_db;
use std::collections::BTreeMap;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lugre_relative_cn0"
);
const L1: f64 = 1_575_420_000.0;
const R_EARTH: f64 = 6_378_137.0;

fn csv(name: &str) -> Vec<Vec<String>> {
    let text =
        std::fs::read_to_string(format!("{FIX}/{name}")).unwrap_or_else(|e| panic!("{name}: {e}"));
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty() && !l.starts_with('#'))
        .map(|l| l.split(',').map(|f| f.trim().to_string()).collect())
        .collect()
}

fn f(s: &str) -> f64 {
    s.parse().unwrap_or_else(|_| panic!("not a number: {s}"))
}

/// A pattern file: first row `off_nadir_deg\\az0,az1,...`, then one row per off-nadir angle.
fn pattern(svn: &str) -> Option<GainPattern2D> {
    let text = std::fs::read_to_string(format!("{FIX}/patterns/{svn}_L1.csv")).ok()?;
    let mut lines = text.lines().filter(|l| !l.starts_with('#'));
    let az: Vec<f64> = lines
        .next()?
        .split(',')
        .skip(1)
        .map(|v| f(v.trim()))
        .collect();
    let mut th = Vec::new();
    let mut by_th: Vec<Vec<f64>> = Vec::new();
    for l in lines.filter(|l| !l.trim().is_empty()) {
        let v: Vec<f64> = l.split(',').map(|x| f(x.trim())).collect();
        th.push(v[0]);
        by_th.push(v[1..].to_vec());
    }
    let gain: Vec<Vec<f64>> = (0..az.len())
        .map(|a| by_th.iter().map(|r| r[a]).collect())
        .collect();
    GainPattern2D::new(az, th, gain).ok()
}

/// The comparison: `(tracked IIR/IIR-M records with a pattern, of them predicted visible,
/// pair residuals as (epoch, dB))`.
fn evaluate() -> (usize, usize, Vec<(i64, f64)>) {
    // epochs.csv: gps_s, rx_x, rx_y, rx_z, sun_x, sun_y, sun_z (ITRF93, m)
    let epochs: BTreeMap<i64, ([f64; 3], [f64; 3])> = csv("epochs.csv")
        .iter()
        .map(|r| {
            (
                f(&r[0]) as i64,
                (
                    [f(&r[1]), f(&r[2]), f(&r[3])],
                    [f(&r[4]), f(&r[5]), f(&r[6])],
                ),
            )
        })
        .collect();
    // sats.csv: gps_s, prn, svn, block, x, y, z (ITRF, m)
    let mut sats: BTreeMap<(i64, u8), (String, String, [f64; 3])> = BTreeMap::new();
    for r in csv("sats.csv") {
        sats.insert(
            (f(&r[0]) as i64, f(&r[1]) as u8),
            (r[2].clone(), r[3].clone(), [f(&r[4]), f(&r[5]), f(&r[6])]),
        );
    }
    // tracked.csv: gps_s, prn, cn0_dbhz
    let tracked: Vec<(i64, u8, f64)> = csv("tracked.csv")
        .iter()
        .map(|r| (f(&r[0]) as i64, f(&r[1]) as u8, f(&r[2])))
        .collect();
    let mut patterns: BTreeMap<String, Option<GainPattern2D>> = BTreeMap::new();
    let (mut records, mut visible) = (0usize, 0usize);
    let mut per_epoch: BTreeMap<i64, Vec<(u8, f64, f64)>> = BTreeMap::new();
    for &(t, prn, cn0) in &tracked {
        let Some(&(rx, sun)) = epochs.get(&t) else {
            continue;
        };
        let Some((svn, block, pos)) = sats.get(&(t, prn)) else {
            continue;
        };
        if !(block.starts_with("GPS-IIR")) {
            continue;
        }
        let pat = patterns.entry(svn.clone()).or_insert_with(|| pattern(svn));
        let Some(pat) = pat else { continue };
        records += 1;
        match transmit_side_db(*pos, sun, rx, 14.5, pat, L1, R_EARTH) {
            Some(pred) => {
                visible += 1;
                per_epoch.entry(t).or_default().push((prn, cn0, pred));
            }
            None => eprintln!("not predicted visible: t {t} PRN {prn} ({svn})"),
        }
    }
    let mut resid = Vec::new();
    for (t, v) in &per_epoch {
        for i in 0..v.len() {
            for j in i + 1..v.len() {
                let r = (v[i].1 - v[j].1) - (v[i].2 - v[j].2);
                eprintln!(
                    "t {t} PRN {} vs {}: measured Δ {:.2}, predicted Δ {:.2}, residual {r:.2}",
                    v[i].0,
                    v[j].0,
                    v[i].1 - v[j].1,
                    v[i].2 - v[j].2
                );
                resid.push((*t, r));
            }
        }
    }
    (records, visible, resid)
}

#[test]
#[ignore = "FINDING (run 2026-10-02 on 768cb62b + fixture): non-vacuity not met - 15 tracked Block IIR/IIR-M records (bar 50) and 1 pair (bar 30 over 10 epochs); 15 of 15 predicted visible; the one pair residual is -0.06 dB. At the 26 qualifying transit and lunar-orbit epochs the flight receiver tracked 37 GPS records, mostly Block IIF and III. A first generator run also admitted commissioning epochs (18 records), against the registration, and was replaced. Pinned by too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar"]
fn relative_cn0_and_visibility_at_lunar_distance_match_lugre() {
    let (records, visible, resid) = evaluate();
    let n = resid.len();
    let rms = (resid.iter().map(|r| r.1 * r.1).sum::<f64>() / n.max(1) as f64).sqrt();
    let mut abs: Vec<f64> = resid.iter().map(|r| r.1.abs()).collect();
    abs.sort_by(f64::total_cmp);
    let median = if abs.is_empty() {
        f64::NAN
    } else {
        abs[abs.len() / 2]
    };
    let pair_epochs = resid
        .iter()
        .map(|r| r.0)
        .collect::<std::collections::BTreeSet<_>>()
        .len();
    eprintln!("V: {visible} of {records} tracked IIR/IIR-M records predicted visible");
    eprintln!(
        "R: {n} pairs over {pair_epochs} epochs; RMS {rms:.2} dB, median |residual| {median:.2} dB"
    );
    assert!(records >= 50, "V non-vacuity: {records}");
    assert!(
        visible as f64 >= 0.99 * records as f64,
        "V: {visible} of {records}"
    );
    assert!(n >= 30 && pair_epochs >= 10, "R1 non-vacuity");
    assert!(rms <= 3.0, "R2 RMS {rms}");
    assert!(median <= 2.0, "R2 median {median}");
}

/// The finding of the strict test, pinned on the committed fixture: the data the flight
/// receiver produced beyond 100 000 km hold too few Block IIR and IIR-M satellites for the
/// pre-registered bar. Every one of them is predicted visible, and the single same-epoch pair
/// agrees with the measured C/N0 difference to within half a decibel; one pair is reported,
/// not claimed.
#[test]
fn too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar() {
    let (records, visible, resid) = evaluate();
    assert_eq!(records, 15);
    assert_eq!(visible, 15);
    assert_eq!(resid.len(), 1);
    assert!(resid[0].1.abs() < 0.5, "pair residual {}", resid[0].1);
}
