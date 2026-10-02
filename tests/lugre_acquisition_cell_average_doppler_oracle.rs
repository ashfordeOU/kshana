// SPDX-License-Identifier: AGPL-3.0-only
//! Acquisition on real lunar IQ scored against the satellites' predicted Doppler: Kshana's
//! search on the LuGRE (Lunar GNSS Receiver Experiment) L1 snapshots, the Doppler DIFFERENCES
//! between the GPS satellites it acquires in one snapshot, against the differences predicted
//! from final orbits and the reconstructed spacecraft trajectory.
//!
//! PRE-REGISTRATION (written 2026-10-02 before this test was run). It is the comparison of
//! `tests/lugre_acquisition_predicted_doppler_oracle.rs` (registered in 0d1839d2) with ONE
//! change, the detection decision: `PcpsResult::acquired_cell_average`, the peak over the
//! grid's own mean cell, in place of the sample-power statistic. DISCLOSURE: the change was
//! made after the first searches of that registered run (OP2, PRNs 1 to 23) had all crossed
//! the threshold with statistics of 435 to 483 against 346, and after a lag-one noise
//! correlation of 0.27 was measured on OP23 (the front end band-limits the noise, raising every
//! cell's noise about 1.4 times, which the sample-power statistic does not see); the predictions
//! (`predicted.csv`, computed after 0d1839d2) had been written but not compared with any
//! acquisition. The tolerances, the inputs and the prediction file are those of 0d1839d2,
//! unchanged. The earlier header text follows.
//!
//! This is a NEW comparison, not a re-run of
//! `tests/lugre_acquisition_gnss_sdr_oracle.rs`. DISCLOSURE: it was designed after that test's
//! registered run had shown that the published 4-bit samples, read as bare two's-complement
//! integers, carry a mean of −0.5 on I and on Q (a zero-frequency line 32 dB above the noise
//! floor in a 1 kHz bin) and that both GNSS-SDR and Kshana then declare almost every PRN
//! acquired at the same artefact cells. Here the levels are reconstructed mid-rise
//! (`ion_sdr::to_mid_rise`, `2v + 1`), which removes that line, and the bar is an external
//! prediction rather than another receiver.
//!
//! WHY DIFFERENCES. The receiver's clock frequency offset adds the same Doppler to every
//! satellite of a snapshot and is unknown; it cancels in the difference of two satellites. So
//! does most of any error in the receiver's velocity, every line of sight lying within a few
//! degrees of the Earth's direction beyond 100 000 km.
//!
//! DATA. LuGRE Mission Data, Zenodo record 16411687 (CC BY 4.0, Parker et al.), the same nine
//! non-surface L1 snapshots as the GNSS-SDR comparison (OP2, OP14, OP17, OP18, OP21, OP22, OP23,
//! OP32, OP37; OP5 and OP12 excluded for their contradictory metadata; the surface phase held
//! out and never opened). Samples read with `kshana::realdata::ion_sdr`, I in the low nibble
//! (the stated convention; a swap would mirror every Doppler and fail criterion P2).
//!
//! KSHANA. Per snapshot, PRN 1 to 32: `pcps_acquire` on the first 100 ms (coherent 1 ms,
//! 100 non-coherent blocks, Doppler −50 000 to +50 000 Hz in 500 Hz steps, search-wide
//! false-alarm probability 0.001), acquired when `acquired_cell_average` holds; for each
//! acquired PRN `refine` (±300 Hz, 100 periods from
//! the start) gives the Doppler.
//!
//! ORACLE (Measured kind for the geometry, an independent computation): predicted Doppler
//! `−(dρ/dt)/λ_L1` per satellite at the snapshot's header time, computed by
//! `xval/lugre-predicted-doppler/predict.py` (Python with numpy and spiceypy, independent of
//! Kshana): GPS positions from the ESA/ESOC final multi-GNSS orbits (`ESA0MGNFIN`, 5-minute
//! records, 10-point Lagrange interpolation), rotated to J2000 with the NAIF Earth orientation
//! kernel at the transmit time; receiver from the Firefly-reconstructed Blue Ghost cruise
//! trajectory in the NAIF CLPS SPICE archive; one-way light time iterated; range rate by a
//! central difference of ±0.5 s. A satellite is predicted visible when the straight path
//! clears a 6 378 137 m sphere. Written to `tests/fixtures/lugre_acquisition_predicted_doppler/`.
//!
//! TOLERANCES (fixed here):
//! - P1 non-vacuity: at least two snapshots each with at least two acquired PRNs that are
//!   predicted visible.
//! - P2: for EVERY pair of acquired, predicted-visible PRNs in a snapshot,
//!   |(f_i − f_j) measured − (f_i − f_j) predicted| ≤ 50 Hz. Source: the refined Doppler's
//!   resolution over 100 ms is about 10 Hz (two estimates, 20 Hz), the Doppler drifts by at
//!   most a few hertz over the 100 ms window, and a receiver-velocity error of 1 m/s maps to
//!   5 Hz before it largely cancels; 50 Hz is well above their sum and far below the 500 Hz
//!   bin, so a pair of artefact cells passes only by chance.
//! - P3: at least 90 % of the acquisitions are predicted visible.

use kshana::acquisition::{pcps_acquire, refine, PcpsConfig};
use kshana::realdata::ion_sdr::{decode, parse_sdrx, to_mid_rise};
use kshana::sdr::CaCode;
use std::collections::BTreeMap;
use std::path::PathBuf;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lugre_acquisition_predicted_doppler"
);
const SNAPSHOTS: [&str; 9] = [
    "L0/IQS/IQS_L1_20250116_013117_400MS_C_OP2_0.sdrx",
    "L0/IQS/IQS_L1_20250130_224056_400MS_T_OP14_0.sdrx",
    "L0/IQS/IQS_L1_20250203_091340_400MS_T_OP17_0.sdrx",
    "L0/IQS/IQS_L1_20250205_225910_600MS_T_OP18_0.sdrx",
    "L0/IQS/IQS_L1_20250207_232901_600MS_T_OP21_0.sdrx",
    "L0/IQS/IQS_L1_20250212_034755_400MS_T_OP22_0.sdrx",
    "L0/IQS/IQS_L1_20250214_045853_400MS_L_OP23_0.sdrx",
    "L0/IQS/IQS_L1_20250224_120449_300MS_L_OP32_0.sdrx",
    "L0/IQS/IQS_L1_20250227_160937_300MS_L_OP37_0.sdrx",
];

fn data_dir() -> Option<PathBuf> {
    let d = std::env::var_os("KSHANA_LUGRE_DIR")
        .map(PathBuf::from)
        .or_else(|| {
            std::env::var_os("HOME")
                .map(|h| PathBuf::from(h).join("Code/kshana-oracles/data/lugre/LuGRE"))
        })?;
    d.is_dir().then_some(d)
}

/// predicted.csv: snapshot, prn, predicted_doppler_hz, visible (0/1).
fn predictions() -> BTreeMap<(String, u8), (f64, bool)> {
    let text = std::fs::read_to_string(format!("{FIX}/predicted.csv")).expect("predictions");
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            (
                (f[0].to_string(), f[1].trim().parse().unwrap()),
                (f[2].trim().parse().unwrap(), f[3].trim() == "1"),
            )
        })
        .collect()
}

/// Kshana's acquisitions per snapshot: `(prn, refined Doppler Hz)`.
fn acquisitions(dir: &std::path::Path) -> BTreeMap<String, Vec<(u8, f64)>> {
    let mut out = BTreeMap::new();
    for snap in SNAPSHOTS {
        let p = dir.join(snap);
        let layout = parse_sdrx(&std::fs::read_to_string(&p).expect("sdrx")).expect("layout");
        let bytes = std::fs::read(p.parent().unwrap().join(&layout.url)).expect("samples");
        let fs = layout.sample_rate_hz;
        let n = (fs / 1000.0).round() as usize * 100;
        let mut x = decode(&layout, &bytes, 0, n).expect("decode");
        to_mid_rise(&mut x);
        let cfg = PcpsConfig {
            fs_hz: fs,
            if_hz: layout.translated_freq_hz,
            coherent_ms: 1,
            noncoherent: 100,
            doppler_max_hz: 50_000.0,
            doppler_step_hz: 500.0,
            pfa: 1e-3,
        };
        // Four threads, each a fixed set of PRNs; every search is deterministic, so the
        // result does not depend on the threads.
        let found: Vec<(u8, Option<f64>, String)> = std::thread::scope(|sc| {
            let hs: Vec<_> = (0..4u8)
                .map(|k| {
                    let x = &x;
                    sc.spawn(move || {
                        (1..=32u8)
                            .filter(|p| p % 4 == k)
                            .map(|prn| {
                                let code = CaCode::new(prn).unwrap();
                                let r = pcps_acquire(x, &code, &cfg).expect("search");
                                let line = format!("{snap} PRN {prn:2}: cell-average statistic {:.1}, sample-power {:.1} (threshold {:.1}), Doppler {:.0}", r.cell_average_statistic, r.statistic, r.threshold, r.doppler_hz);
                                let fd = r.acquired_cell_average.then(|| refine(x, &code, fs, cfg.if_hz, &r, 300.0, 99).0);
                                (prn, fd, line)
                            })
                            .collect::<Vec<_>>()
                    })
                })
                .collect();
            hs.into_iter().flat_map(|h| h.join().unwrap()).collect()
        });
        let mut v = Vec::new();
        let mut found = found;
        found.sort_by_key(|f| f.0);
        for (prn, fd, line) in found {
            match fd {
                Some(fd) => {
                    eprintln!("{line} -> ACQUIRED, refined {fd:.0} Hz");
                    v.push((prn, fd));
                }
                None => eprintln!("{line}"),
            }
        }
        out.insert(snap.to_string(), v);
    }
    out
}

#[test]
#[ignore = "FINDING (run 2026-10-02 on a81a9a4e): P2 fails, 8 of 8 pairs beyond 50 Hz (P1 4 snapshots, P3 12 of 12 visible). The two strongest pairs match the prediction in magnitude with the sign REVERSED: OP2 PRN 18/24 measured +7670.0 Hz, predicted -7693.9 (23.9 Hz once mirrored); OP17 PRN 11/30 +11155.0 against -11114.4 (40.6 Hz). The registered I-in-the-low-nibble order is evidently the conjugate of the batches; the six detections at statistics 349 to 357 (threshold 346.3) match neither sign. Pinned by strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed"]
fn cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler() {
    let Some(dir) = data_dir() else {
        eprintln!("SKIPPED: LuGRE data not found (set KSHANA_LUGRE_DIR); nothing was compared");
        return;
    };
    let pred = predictions();
    let acq = acquisitions(&dir);
    let (mut total, mut visible) = (0usize, 0usize);
    let mut good_snaps = 0usize;
    let mut worst = 0.0f64;
    let mut fails = Vec::new();
    let mut pairs = 0usize;
    for (snap, v) in &acq {
        let vis: Vec<(u8, f64, f64)> = v
            .iter()
            .filter_map(|&(prn, fd)| {
                total += 1;
                let &(fp, ok) = pred.get(&(snap.clone(), prn))?;
                if ok {
                    visible += 1;
                    Some((prn, fd, fp))
                } else {
                    eprintln!("  {snap} PRN {prn}: acquired, predicted NOT visible");
                    None
                }
            })
            .collect();
        if vis.len() >= 2 {
            good_snaps += 1;
        }
        for i in 0..vis.len() {
            for j in i + 1..vis.len() {
                let r = (vis[i].1 - vis[j].1) - (vis[i].2 - vis[j].2);
                eprintln!("  {snap} PRN {} vs {}: measured Δ {:.1}, predicted Δ {:.1}, residual {r:.1} Hz", vis[i].0, vis[j].0, vis[i].1 - vis[j].1, vis[i].2 - vis[j].2);
                pairs += 1;
                worst = worst.max(r.abs());
                if r.abs() > 50.0 {
                    fails.push(format!("{snap} PRN {} vs {}", vis[i].0, vis[j].0));
                }
            }
        }
    }
    eprintln!("P1 snapshots with two or more visible acquisitions: {good_snaps}; pairs {pairs}");
    eprintln!("P2 worst |residual| {worst:.1} Hz; failures {fails:?}");
    eprintln!("P3 {visible} of {total} acquisitions predicted visible");
    assert!(good_snaps >= 2, "P1 non-vacuity");
    assert!(fails.is_empty(), "P2: {} pairs beyond 50 Hz", fails.len());
    assert!(
        visible as f64 >= 0.9 * total as f64,
        "P3: {visible} of {total}"
    );
}

/// The finding of the strict test, pinned (data-gated): the two strongest pairs of the
/// registered run, re-acquired in a narrow window about the Doppler that run recorded and
/// refined as there, agree with the orbit prediction only when the measured Doppler
/// differences are mirrored, and miss it by more than 15 kHz as registered. The bound here is
/// 150 Hz, not the registered 50 Hz, and that is part of the finding: the narrow re-search
/// refines OP2's pair to 7640 Hz and OP17's to 11205 Hz where the registered run gave 7670 Hz
/// and 11155 Hz (mirrored residuals 53.9 and 90.6 Hz here, 23.9 and 40.6 Hz there), because `refine`
/// maximises the energy of one-millisecond correlations, which is nearly flat over ±50 Hz;
/// the registration's "about 10 Hz" resolution was wrong, so the 50 Hz bar sat at the
/// refinement's own scatter.
#[test]
fn strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed() {
    let Some(dir) = data_dir() else {
        eprintln!("SKIPPED: LuGRE data not found (set KSHANA_LUGRE_DIR); nothing was compared");
        return;
    };
    let pred = predictions();
    // (snapshot, PRN, coarse Doppler of the registered run) per satellite of each pair.
    let pairs = [
        (SNAPSHOTS[0], (18u8, 11_000.0), (24u8, 3_000.0)),
        (SNAPSHOTS[2], (11u8, 6_500.0), (30u8, -4_500.0)),
    ];
    for (snap, a, b) in pairs {
        let p = dir.join(snap);
        let layout = parse_sdrx(&std::fs::read_to_string(&p).unwrap()).unwrap();
        let bytes = std::fs::read(p.parent().unwrap().join(&layout.url)).unwrap();
        let fs = layout.sample_rate_hz;
        let mut x = decode(&layout, &bytes, 0, (fs / 1000.0).round() as usize * 100).unwrap();
        to_mid_rise(&mut x);
        let refined = |(prn, coarse): (u8, f64)| -> f64 {
            let code = CaCode::new(prn).unwrap();
            let cfg = PcpsConfig {
                fs_hz: fs,
                if_hz: coarse,
                coherent_ms: 1,
                noncoherent: 100,
                doppler_max_hz: 1_000.0,
                doppler_step_hz: 500.0,
                pfa: 1e-3,
            };
            let r = pcps_acquire(&x, &code, &cfg).unwrap();
            assert!(r.acquired_cell_average, "{snap} PRN {prn}: {r:?}");
            coarse + refine(&x, &code, fs, coarse, &r, 300.0, 99).0
        };
        let (fa, fb) = (refined(a), refined(b));
        let measured = fa - fb;
        let predicted = pred[&(snap.to_string(), a.0)].0 - pred[&(snap.to_string(), b.0)].0;
        eprintln!(
            "{snap} PRN {} vs {}: measured {measured:.1}, predicted {predicted:.1}",
            a.0, b.0
        );
        assert!(
            (measured + predicted).abs() <= 150.0,
            "mirrored residual {}",
            measured + predicted
        );
        assert!(
            (measured - predicted).abs() > 15_000.0,
            "registered residual {}",
            measured - predicted
        );
    }
}
