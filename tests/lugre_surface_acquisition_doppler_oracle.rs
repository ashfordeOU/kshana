// SPDX-License-Identifier: AGPL-3.0-only
//! Acquisition on real IQ recorded ON THE LUNAR SURFACE, scored against the satellites'
//! predicted Doppler: Kshana's search on the never-opened surface-phase LuGRE (Lunar GNSS
//! Receiver Experiment) L1 batches, the Doppler DIFFERENCES between the GPS satellites it
//! acquires in one batch, against differences predicted from final orbits and the published
//! landing site.
//!
//! PRE-REGISTRATION (written 2026-10-02; the surface-phase batches, their headers, the
//! landing-site kernel and the orbit files of those days have NOT been opened or downloaded:
//! the batches were held out from the start of package D7). This is a blind run of a method
//! developed on the nine non-surface batches, where three registered comparisons failed and
//! taught: (1) the samples must be read with I in the high nibble (`ion_sdr` default since
//! 3c480336; the other reading came out mirrored against prediction), (2) the bare
//! two's-complement levels carry a −0.5 mean, removed by the mid-rise reconstruction
//! (`to_mid_rise`), (3) the band-limited front end inflates the cell noise, handled by the
//! cell-averaging decision (`acquired_cell_average`), (4) the non-coherent refinement scatters
//! by tens of hertz, replaced by the phase-coherent `refine_doppler_coherent`, and (5) noise
//! maxima reached cell-averaging statistics up to 357 at a threshold of 346 (false-alarm
//! probability 1e-3), so the false-alarm probability here is 1e-7. Those lessons were all
//! learned on the development batches; nothing here was tuned on the surface batches.
//!
//! DATA. LuGRE Mission Data, Zenodo record 16411687 (CC BY 4.0, Parker et al.), the nine L1
//! surface batches OP38, OP40, OP73, OP74, OP76, OP77_0, OP77_1, OP78_0 and OP78_1. A batch
//! whose `.sdrx` metadata disagrees with its binary header (`lugre::IqsHeader::disagreements`)
//! is excluded, mechanically, and reported.
//!
//! KSHANA. Per batch, PRN 1 to 32: `pcps_acquire` on the first 100 ms of mid-rise samples
//! (coherent 1 ms, 100 non-coherent blocks, Doppler −50 000 to +50 000 Hz in 500 Hz steps,
//! search-wide false-alarm probability 1e-7), acquired when `acquired_cell_average`; then
//! `refine` (±300 Hz, 99 periods) for the code delay and `refine_doppler_coherent` over the
//! first 200 code periods from that delay for the Doppler, which is the mean over the window
//! and is compared with the prediction at the window's centre (header time + 0.1 s).
//!
//! ORACLE (an independent computation from measured-data products):
//! `xval/lugre-predicted-doppler/predict_surface.py` (Python with numpy and spiceypy,
//! independent of Kshana): receiver at the Blue Ghost landing site from the NAIF CLPS SPICE
//! archive's Firefly landing-site kernel `clps_to19d_bgm1_ls_250302_v01.bsp` (with the frame and
//! lunar orientation kernels it needs), in J2000; GPS positions from the ESA/ESOC final
//! multi-GNSS orbits of the day (10-point Lagrange), rotated with the NAIF Earth orientation
//! kernel at the transmit time; light time iterated; predicted Doppler `−(dρ/dt)/λ_L1` by a
//! central difference of ±0.5 s at header time + 0.1 s. Predicted visible when the straight path
//! clears a 6 378 137 m Earth sphere AND rises above the receiver's local lunar horizon (a
//! 1 737 400 m lunar sphere).
//!
//! WHY DIFFERENCES. The receiver clock's frequency offset is common to every satellite of a
//! batch and cancels in a difference; the lander is fixed to the Moon, so its velocity is known
//! to far better than any term here.
//!
//! TOLERANCES (fixed here):
//! - P1 non-vacuity: at least two batches each with at least two acquired, predicted-visible
//!   PRNs.
//! - P2: for EVERY such pair, |(f_i − f_j) measured − (f_i − f_j) predicted| ≤ 10 Hz. Source:
//!   the coherent refinement's error measured before this registration (Monte Carlo, 60 draws
//!   per level, 200 ms, half-sample delay error: RMS 0.21 Hz and maximum 0.55 Hz at 30 dB-Hz,
//!   0.05 and 0.14 Hz at 40 dB-Hz), so a pair carries under 1 Hz; satellite clock drifts add
//!   about 0.02 Hz; the rest of the 10 Hz allows a receiver time-tag error of up to about 1.5 s
//!   (the line-of-sight accelerations of two GPS satellites differ by up to about 6 Hz/s). A pair
//!   of noise cells, spread over a 100 kHz search, passes only with probability of order 1e-4.
//! - P3: at least 90 % of the acquisitions predicted visible.
//!
//! DEVIATION, recorded before the comparison was run and before any surface sample, header or
//! prediction was looked at: the `.sdrx` of OP40 names `IQS_L1_20250304_070323_400MS_S_OP40_0.bin`,
//! a file the dataset does not contain (it ships `..._300MS_S_OP40_0.bin`; seen in a directory
//! listing when the prediction script failed to open the named file). The batch is excluded by
//! the registration's own rule for metadata that does not match its file, not mapped by guess.
//!
//! If P1 to P3 hold, the row "Acquisition on real lunar-surface IQ" is promotable on this test.

use kshana::acquisition::{pcps_acquire, refine, refine_doppler_coherent, PcpsConfig};
use kshana::realdata::ion_sdr::{decode, parse_sdrx, to_mid_rise};
use kshana::realdata::lugre::IqsHeader;
use kshana::sdr::CaCode;
use std::collections::BTreeMap;
use std::path::PathBuf;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/lugre_surface_acquisition_doppler"
);
const BATCHES: [&str; 9] = [
    "L0/IQS/IQS_L1_20250303_061300_300MS_S_OP38_0.sdrx",
    "L0/IQS/IQS_L1_20250304_070323_400MS_S_OP40_0.sdrx",
    "L0/IQS/IQS_L1_20250314_100945_2000MS_S_OP73_0.sdrx",
    "L0/IQS/IQS_L1_20250314_124717_500MS_S_OP74_0.sdrx",
    "L0/IQS/IQS_L1_20250315_130727_2000MS_S_OP76_0.sdrx",
    "L0/IQS/IQS_L1_20250316_151230_300MS_S_OP77_0.sdrx",
    "L0/IQS/IQS_L1_20250316_191504_300MS_S_OP77_1.sdrx",
    "L0/IQS/IQS_L1_20250316_220402_300MS_S_OP78_0.sdrx",
    "L0/IQS/IQS_L1_20250316_221128_300MS_S_OP78_1.sdrx",
];
const TOLERANCE_HZ: f64 = 10.0;

fn data_dir() -> Option<PathBuf> {
    let d = std::env::var_os("KSHANA_LUGRE_DIR")
        .map(PathBuf::from)
        .or_else(|| {
            std::env::var_os("HOME")
                .map(|h| PathBuf::from(h).join("Code/kshana-oracles/data/lugre/LuGRE"))
        })?;
    d.is_dir().then_some(d)
}

/// predicted.csv: batch, prn, predicted_doppler_hz, visible (0/1).
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

/// Acquisitions per batch, `(prn, Doppler Hz)`, and the excluded batches.
type Acquired = (BTreeMap<String, Vec<(u8, f64)>>, Vec<String>);

/// Kshana's acquisitions per usable batch, `(prn, Doppler Hz)`, and the excluded batches.
fn acquisitions(dir: &std::path::Path) -> Acquired {
    let mut out = BTreeMap::new();
    let mut excluded = Vec::new();
    for batch in BATCHES {
        let p = dir.join(batch);
        let layout = parse_sdrx(&std::fs::read_to_string(&p).expect("sdrx")).expect("layout");
        let Ok(bytes) = std::fs::read(p.parent().unwrap().join(&layout.url)) else {
            eprintln!(
                "EXCLUDED {batch}: its metadata names {}, which the dataset does not contain",
                layout.url
            );
            excluded.push(batch.to_string());
            continue;
        };
        let header = IqsHeader::parse(&bytes).expect("IQS header");
        let d = header.disagreements(&layout, bytes.len());
        if !d.is_empty() {
            eprintln!("EXCLUDED {batch}: {d:?}");
            excluded.push(batch.to_string());
            continue;
        }
        let fs = layout.sample_rate_hz;
        let spc = (fs / 1000.0).round() as usize;
        let n = layout.sample_count(bytes.len()).min(spc * 300);
        let mut x = decode(&layout, &bytes, 0, n).expect("decode");
        to_mid_rise(&mut x);
        let acq = &x[..spc * 100];
        let cfg = PcpsConfig {
            fs_hz: fs,
            if_hz: layout.translated_freq_hz,
            coherent_ms: 1,
            noncoherent: 100,
            doppler_max_hz: 50_000.0,
            doppler_step_hz: 500.0,
            pfa: 1e-7,
        };
        let found: Vec<(u8, Option<f64>, String)> = std::thread::scope(|sc| {
            let hs: Vec<_> = (0..4u8)
                .map(|k| {
                    let x = &x;
                    sc.spawn(move || {
                        (1..=32u8)
                            .filter(|p| p % 4 == k)
                            .map(|prn| {
                                let code = CaCode::new(prn).unwrap();
                                let r = pcps_acquire(acq, &code, &cfg).expect("search");
                                let line = format!(
                                    "{batch} PRN {prn:2}: cell-average statistic {:.1} (threshold {:.1}), Doppler {:.0}",
                                    r.cell_average_statistic, r.threshold, r.doppler_hz
                                );
                                let fd = if r.acquired_cell_average {
                                    let (_, tau) = refine(acq, &code, fs, cfg.if_hz, &r, 300.0, 99);
                                    refine_doppler_coherent(x, &code, fs, cfg.if_hz, r.doppler_hz, tau, 200)
                                } else {
                                    None
                                };
                                (prn, fd, line)
                            })
                            .collect::<Vec<_>>()
                    })
                })
                .collect();
            hs.into_iter().flat_map(|h| h.join().unwrap()).collect()
        });
        let mut found = found;
        found.sort_by_key(|f| f.0);
        let mut v = Vec::new();
        for (prn, fd, line) in found {
            match fd {
                Some(fd) => {
                    eprintln!("{line} -> ACQUIRED, coherent Doppler {fd:.2} Hz");
                    v.push((prn, fd));
                }
                None => eprintln!("{line}"),
            }
        }
        out.insert(batch.to_string(), v);
    }
    (out, excluded)
}

#[test]
#[ignore = "FINDING (run 2026-10-02 on 2108e6ff, 1103 s): P1 non-vacuity fails - no batch has two acquisitions. OP40 excluded (its metadata names a missing file); OP38, OP73, OP77_0 and OP77_1 acquire nothing (top statistics 325 to 356, threshold 385.9, so no false alarm at 1e-7); OP74 and OP76 acquire PRN 31 and OP78_0 and OP78_1 PRN 12 (statistics 529 to 757), each alone; P3 4 of 4 predicted visible; P2 has no pair. Reported, not claimed: measured minus predicted Doppler is +530, +449 and +639 Hz on three of them (one receiver clock offset near 0.35 ppm), +4913 Hz on OP78_1. Pinned by each_surface_acquisition_is_a_single_predicted_visible_satellite"]
fn surface_acquisitions_match_the_orbit_predicted_doppler() {
    let Some(dir) = data_dir() else {
        eprintln!("SKIPPED: LuGRE data not found (set KSHANA_LUGRE_DIR); nothing was compared");
        return;
    };
    let pred = predictions();
    let (acq, excluded) = acquisitions(&dir);
    let (mut total, mut visible, mut good, mut pairs) = (0usize, 0usize, 0usize, 0usize);
    let mut worst = 0.0f64;
    let mut fails = Vec::new();
    for (batch, v) in &acq {
        let vis: Vec<(u8, f64, f64)> = v
            .iter()
            .filter_map(|&(prn, fd)| {
                total += 1;
                let &(fp, ok) = pred.get(&(batch.clone(), prn))?;
                if ok {
                    visible += 1;
                    Some((prn, fd, fp))
                } else {
                    eprintln!("  {batch} PRN {prn}: acquired, predicted NOT visible");
                    None
                }
            })
            .collect();
        if vis.len() >= 2 {
            good += 1;
        }
        for i in 0..vis.len() {
            for j in i + 1..vis.len() {
                let r = (vis[i].1 - vis[j].1) - (vis[i].2 - vis[j].2);
                eprintln!(
                    "  {batch} PRN {} vs {}: measured Δ {:.2}, predicted Δ {:.2}, residual {r:.2} Hz",
                    vis[i].0,
                    vis[j].0,
                    vis[i].1 - vis[j].1,
                    vis[i].2 - vis[j].2
                );
                pairs += 1;
                worst = worst.max(r.abs());
                if r.abs() > TOLERANCE_HZ {
                    fails.push(format!("{batch} PRN {} vs {}", vis[i].0, vis[j].0));
                }
            }
        }
    }
    eprintln!("excluded batches: {excluded:?}");
    eprintln!("P1 batches with two or more visible acquisitions: {good}; pairs {pairs}");
    eprintln!("P2 worst |residual| {worst:.2} Hz; failures {fails:?}");
    eprintln!("P3 {visible} of {total} acquisitions predicted visible");
    assert!(good >= 2, "P1 non-vacuity");
    assert!(
        fails.is_empty(),
        "P2: {} pairs beyond {TOLERANCE_HZ} Hz",
        fails.len()
    );
    assert!(
        visible as f64 >= 0.9 * total as f64,
        "P3: {visible} of {total}"
    );
}

/// The finding of the strict test, pinned (data-gated): the four acquisitions of the registered
/// run, re-acquired in a narrow window about their recorded Doppler with the registered decision
/// and refined as there, give the same coherent Doppler within 1 Hz and are predicted visible.
#[test]
fn each_surface_acquisition_is_a_single_predicted_visible_satellite() {
    let Some(dir) = data_dir() else {
        eprintln!("SKIPPED: LuGRE data not found (set KSHANA_LUGRE_DIR); nothing was compared");
        return;
    };
    let pred = predictions();
    // (batch, PRN, coarse Doppler, coherent Doppler) as the registered run recorded them.
    let recorded = [
        (BATCHES[3], 31u8, -5_500.0, -5_347.30),
        (BATCHES[4], 31u8, -2_000.0, -1_832.41),
        (BATCHES[7], 12u8, -2_000.0, -2_129.27),
        (BATCHES[8], 12u8, 3_500.0, 3_335.97),
    ];
    for (batch, prn, coarse, coherent) in recorded {
        let p = dir.join(batch);
        let layout = parse_sdrx(&std::fs::read_to_string(&p).unwrap()).unwrap();
        let bytes = std::fs::read(p.parent().unwrap().join(&layout.url)).unwrap();
        let fs = layout.sample_rate_hz;
        let spc = (fs / 1000.0).round() as usize;
        let mut x = decode(&layout, &bytes, 0, spc * 300).unwrap();
        to_mid_rise(&mut x);
        let acq = &x[..spc * 100];
        let code = CaCode::new(prn).unwrap();
        let cfg = PcpsConfig {
            fs_hz: fs,
            if_hz: coarse,
            coherent_ms: 1,
            noncoherent: 100,
            doppler_max_hz: 500.0,
            doppler_step_hz: 500.0,
            pfa: 1e-7,
        };
        let r = pcps_acquire(acq, &code, &cfg).unwrap();
        assert!(r.acquired_cell_average, "{batch} PRN {prn}: {r:?}");
        // Refine as the registered run did: zero intermediate frequency and the absolute
        // Doppler, so that the code rate is scaled by the whole carrier Doppler.
        let abs = kshana::acquisition::PcpsResult {
            doppler_hz: coarse + r.doppler_hz,
            ..r.clone()
        };
        let (_, tau) = refine(acq, &code, fs, 0.0, &abs, 300.0, 99);
        let fd = refine_doppler_coherent(&x, &code, fs, 0.0, abs.doppler_hz, tau, 200).unwrap();
        eprintln!("{batch} PRN {prn}: coherent Doppler {fd:.2} Hz (registered run {coherent:.2})");
        assert!((fd - coherent).abs() < 1.0, "{batch} PRN {prn}: {fd}");
        assert!(
            pred[&(batch.to_string(), prn)].1,
            "{batch} PRN {prn} not predicted visible"
        );
    }
}
