// SPDX-License-Identifier: AGPL-3.0-only
//! Closed-loop decodability oracle, second pre-registration: an independent software
//! receiver acquires, tracks and decodes a fresh `kshana::lunar_afs` recording quantised to
//! the receiver's 4-bit input range, and its decoded values are compared with the recording's
//! truth labels.
//!
//! What this proves, and what it does not: it proves that the recording conforms to the
//! LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0, 29 January 2025, as far as an
//! independent receiver built to that standard can tell (codes, tiering, modulation, data
//! alignment, frame, channel coding), and that the truth labels written beside the samples
//! are consistent with what the receiver recovers. It does NOT validate channel physics,
//! propagation, received power, link budgets or the service volume: the recording's Doppler,
//! delay and carrier-to-noise density are chosen inputs, not physical predictions.
//!
//! ## Why a second pre-registration
//!
//! The first one (`tests/lunar_afs_decodability_pocketsdr_oracle.rs`) could not test the
//! signal: its recording spanned 8-bit codes of plus or minus 127, and the receiver keeps
//! 4 bits per component, so every input sample wrapped and nothing was acquired (recorded
//! there). This file fixes, before the new recording is generated and before the receiver is
//! run on it, a comparison with NEW inputs (different nodes, Dopplers, delays, TOIs and seeds,
//! none of which has been generated or seen) inside the receiver's range, and the same bars.
//! Written 2026-10-02.
//!
//! ## Oracle (kind: Library)
//!
//! PocketSDR-AFS, T. Ebinuma (based on T. Takasu's PocketSDR 0.13),
//! `https://github.com/osqzss/PocketSDR-AFS`, commit
//! `5b23809f30d68518b7fad7a564fd0fac57cc497d` (8 December 2025), BSD-2-Clause licence, with
//! `#define DEMO_L1` removed (S-band carrier, LSIS-020), built by
//! `xval/lunar-afs/build_oracles.sh`. Run as a separate program by
//! `xval/lunar-afs/run_pocketsdr.sh` with
//! `pocket_trk -sig AFSD -prn 2-12 -sig AFSP -prn 2-12 -fmt INT8X2 -f 12 -IQ 2 -log <log> <file>`,
//! on both the pinned build and its print-only copy (log level 4, and a record of the TOI it
//! decodes, `xval/lunar-afs/apply_psdr_trace.py`); the bars read the print-only copy's log,
//! and guard G0 requires every record of the pinned build's log to appear in it identically.
//! LANS-AFS-SIM and PocketSDR-AFS share an author and count as one independent
//! implementation; `tests/lunar_afs_frame_coding_oracle.rs` guards against a misreading
//! they might share.
//!
//! ## Input recording (produced by Kshana; truth labels in its SigMF annotations)
//!
//! 12 MHz complex sampling, `ci8`, 42.5 s, centre 2492.028 MHz, two nodes of the interim
//! Table 11 assignment, each with a composite carrier-to-noise density of 50 dB-Hz (47 dB-Hz
//! per component), constant Doppler with coherent code Doppler, frame identifier 0, seeded
//! subframe 2, 3, 4 data with CRC:
//!
//! - node identifier 5 (PRNs 5, secondary S0, tertiary PRN 5, phase 0): Doppler -987.6 Hz,
//!   carrier phase 0.7 rad at the frame edge, the leading edge of a frame's synchronisation
//!   pattern at receiver time 3.5007654 s carrying the subframe-1 TOI field 63, data seed 505;
//! - node identifier 11 (PRNs 11, secondary S2, tertiary PRN 11): Doppler +3141.6 Hz, carrier
//!   phase 2.1 rad, frame edge at 3.5003210 s with TOI field 98 (so its three frames carry 98,
//!   99 and 0), data seed 1111.
//!
//! Complex white Gaussian noise of unit variance per dimension, seed 20261003; samples scaled
//! by 2 and rounded, clipped at plus or minus 7 (the receiver's 4-bit range is -8..7).
//!
//! ## Pre-registered bars (all must hold)
//!
//! - C1, acquisition and tracking. For each present node, the receiver acquires the AFS-I
//!   (`AFSD`) and AFS-Q (`AFSP`) channels of its PRN and tracks them to the end of the file.
//!   In every `$CH` status line of those channels logged at receiver time 5 s or later and at
//!   least 1 s after that channel's `SIGNAL FOUND`: Doppler within 10 Hz of the truth;
//!   carrier-to-noise density within 3 dB of the 47 dB-Hz per-component truth; for `AFSD`, the
//!   code offset within 0.25 AFS-I chip (244.4 ns) of the truth, modulo the 2 ms code period.
//!   The receiver's code offset (`ch->coff`, `src/sdr_ch.c` `track_sig`) is the time from the
//!   status line's receiver time to the start of a primary-code period in the sample stream;
//!   the truth is the same quantity from the labels. For the absent PRNs 2, 3, 4, 6, 7, 8, 9,
//!   10 and 12, no `SYMBOL SYNC`, no `FRAME SYNC` and no subframe record is ever logged.
//! - C2, decoding. For each present node and each of the three frames whose synchronisation
//!   pattern arrives at about 3.5, 15.5 and 27.5 s: the TOI the receiver records equals the
//!   truth subframe-1 field; its `$SB2` record (the first 320 bits and the 24 CRC bits of the
//!   1200-bit subframe 2, as it prints them) equals the truth; subframes 3 and 4 are each
//!   logged as decoded; and over the whole run the receiver logs zero subframe frame errors
//!   and zero `TOI NOT FOUND` for the present PRNs.
//!
//! Source of the bars: as in the first pre-registration: at 47 dB-Hz per component a
//! conforming signal leaves Doppler errors far below 10 Hz and code errors far below 0.25 chip
//! once the loops have settled (the 1 s settling allowance is new in this file, and is fixed
//! before any status line exists); any code, tier, frame or coding error stops
//! synchronisation or decoding outright.
//!
//! ## Fixture and test
//!
//! `tests/fixtures/lunar_afs_decodability_pocketsdr/v2_*`: both logs (the `$TIME` wall-clock
//! records removed), the recording's SigMF metadata and SHA-256, and the run's G0 result.
//! The test regenerates the truth labels in process from the configuration below and compares.
//!
//! ## Run record (2026-10-02, first and only run of this configuration)
//!
//! Outcome: the criterion is missed by 5 violations (pinned in
//! [`decodability_finding_five_violations`]): one AFSP PRN 11 carrier-to-noise reading
//! 0.3 dB below the band at 6 s, and node 11's first frame (TOI 98) never synchronised. All
//! other checks hold: 151 eligible status lines, worst Doppler error 0.49 Hz, worst AFS-I code
//! offset error 0.008 chip, five of six frames decoded with the right TOI (63, 64, 65; 99, 0),
//! subframe 2 matching the truth, subframes 3 and 4 decoded, no frame error, no
//! synchronisation on any of the nine absent PRNs. The same frame is missed by two further
//! runs of the receiver; a direct demodulation of the recording at its truth labels (a
//! diagnostic, not an oracle) finds that frame's synchronisation patterns error-free.
//!
//! Guard G0 as written does not hold: 4 records of the pinned build's log, all four
//! `SIGNAL FOUND` acquisition records, differ in time and estimate in the print-only build's
//! log. Two runs of the PINNED build differ in exactly the same four records (the receiver
//! paces its acquisition search with wall-clock sleeps), so the difference is the receiver's
//! own run-to-run variation; every other record agrees between all three runs.
//!
//! Recording: 204 108 of 1 020 000 000 components clipped at plus or minus 7 (0.02 per cent,
//! the expected Gaussian tail beyond 3.5 sigma).
//!
//! Mutation (applied to the engine, recording regenerated, pinned receiver run, mutation
//! reverted): writing the 5880 coded symbols without interleaving makes every subframe of
//! every frame fail (15 frame-error records, nothing decoded).

use kshana::lunar_afs::codes::NodeCodes;
use kshana::lunar_afs::waveform::{truth_meta_json, Generator, NodeSignal, RecordingConfig};

/// The pre-registered recording.
fn recording() -> RecordingConfig {
    RecordingConfig {
        sample_rate_hz: 12.0e6,
        duration_s: 42.5,
        nodes: vec![
            NodeSignal {
                codes: NodeCodes::interim(5).unwrap(),
                doppler_hz: -987.6,
                frame_arrival_s: 3.5007654,
                toi_at_arrival: 63,
                cn0_dbhz: 50.0,
                carrier_phase_rad: 0.7,
                data_seed: 505,
            },
            NodeSignal {
                codes: NodeCodes::interim(11).unwrap(),
                doppler_hz: 3141.6,
                frame_arrival_s: 3.5003210,
                toi_at_arrival: 98,
                cn0_dbhz: 50.0,
                carrier_phase_rad: 2.1,
                data_seed: 1111,
            },
        ],
        noise_seed: Some(20_261_003),
        ci8_scale: 2.0,
        ci8_clip: 7,
    }
}

/// Write the recording (`afs.sigmf-data`, `afs.sigmf-meta`) into `KSHANA_AFS_RECORDING_OUT`.
#[test]
#[ignore = "writes the 1.02 GB recording for xval/lunar-afs/run_pocketsdr.sh"]
fn write_4bit_recording_for_pocketsdr() {
    use std::io::Write;
    let dir = std::env::var("KSHANA_AFS_RECORDING_OUT").expect("KSHANA_AFS_RECORDING_OUT");
    let mut g = Generator::new(recording()).unwrap();
    std::fs::write(
        format!("{dir}/afs.sigmf-meta"),
        g.sigmf_meta_json().unwrap(),
    )
    .unwrap();
    let mut f =
        std::io::BufWriter::new(std::fs::File::create(format!("{dir}/afs.sigmf-data")).unwrap());
    let mut clipped = 0usize;
    loop {
        let b = g.next_block(1 << 20);
        if b.is_empty() {
            break;
        }
        let (bytes, c) = g.to_ci8(&b);
        clipped += c;
        f.write_all(&bytes).unwrap();
    }
    eprintln!("clipped components: {clipped}");
}

const LOG: &str = include_str!("fixtures/lunar_afs_decodability_pocketsdr/v2_log_l4.txt");
const LOG_PINNED: &str = include_str!("fixtures/lunar_afs_decodability_pocketsdr/v2_log_l3.txt");
const LOG_PINNED_RERUN: &str =
    include_str!("fixtures/lunar_afs_decodability_pocketsdr/v2_log_l3_rerun.txt");
const PRESENT: [u16; 2] = [5, 11];
const FS: f64 = 12.0e6;

fn hex_of(bits: &[u8]) -> String {
    bits.chunks(4)
        .map(|c| format!("{:X}", c.iter().fold(0u8, |a, &b| (a << 1) | b)))
        .collect()
}

/// Evaluate bars C1 and C2 on the committed print-only-build log; returns the list of
/// violations (empty when every bar holds) and a few counts for the record.
fn evaluate() -> (Vec<String>, Vec<String>) {
    use kshana::lunar_afs::frame::with_crc;
    use kshana::lunar_afs::waveform::frame_data;
    let cfg = recording();
    let mut bad = Vec::new();
    let mut notes = Vec::new();
    let recs: Vec<Vec<&str>> = LOG.lines().map(|l| l.split(',').collect()).collect();
    let node_of = |prn: u16| cfg.nodes.iter().find(|n| n.codes.i_prn == prn);
    // Acquisition times per (signal, PRN).
    let found = |sig: &str, prn: u16| -> Option<f64> {
        recs.iter()
            .find(|r| {
                r[0] == "$LOG"
                    && r[2] == sig
                    && r[3] == prn.to_string()
                    && r[4].starts_with("SIGNAL FOUND")
            })
            .map(|r| r[1].parse().unwrap())
    };
    // C1.
    for &prn in &PRESENT {
        let node = node_of(prn).unwrap();
        for sig in ["AFSD", "AFSP"] {
            let Some(t_found) = found(sig, prn) else {
                bad.push(format!("C1 {sig} {prn}: never acquired"));
                continue;
            };
            let mut n_lines = 0;
            let mut worst = (0.0f64, 0.0f64, 0.0f64);
            let mut last_t = 0.0f64;
            for r in recs
                .iter()
                .filter(|r| r[0] == "$CH" && r[2] == sig && r[3] == prn.to_string())
            {
                let t: f64 = r[1].parse().unwrap();
                last_t = last_t.max(t);
                if t < 5.0 || t < t_found + 1.0 {
                    continue;
                }
                n_lines += 1;
                let cn0: f64 = r[5].parse().unwrap();
                let coff_s: f64 = r[6].parse::<f64>().unwrap() * 1e-3;
                let fd: f64 = r[7].parse().unwrap();
                let dfd = fd - node.doppler_hz;
                let dcn0 = cn0 - (node.cn0_dbhz - 10.0 * 2f64.log10());
                worst.0 = worst.0.max(dfd.abs());
                worst.1 = worst.1.max(dcn0.abs());
                if dfd.abs() > 10.0 {
                    bad.push(format!(
                        "C1 {sig} {prn} t={t}: Doppler {fd} vs {}",
                        node.doppler_hz
                    ));
                }
                if dcn0.abs() > 3.0 {
                    bad.push(format!("C1 {sig} {prn} t={t}: C/N0 {cn0}"));
                }
                if sig == "AFSD" {
                    let st = node.state_at(t, FS);
                    let truth = (-st.i_phase_chips).rem_euclid(2046.0) / st.i_rate_cps;
                    let d = (coff_s - truth + 1e-3).rem_euclid(2e-3) - 1e-3;
                    let d_chips = d * st.i_rate_cps;
                    worst.2 = worst.2.max(d_chips.abs());
                    if d_chips.abs() > 0.25 {
                        bad.push(format!(
                            "C1 AFSD {prn} t={t}: code offset error {d_chips:.4} chip"
                        ));
                    }
                }
            }
            if n_lines == 0 {
                bad.push(format!("C1 {sig} {prn}: no status line to check"));
            }
            if last_t < 42.0 {
                bad.push(format!(
                    "C1 {sig} {prn}: not tracked to the end (last status {last_t})"
                ));
            }
            notes.push(format!(
                "{sig} {prn}: acquired {t_found} s, {n_lines} lines, worst |dDoppler| {:.3} Hz, |dC/N0| {:.2} dB, |dcode| {:.4} chip",
                worst.0, worst.1, worst.2
            ));
        }
    }
    for r in &recs {
        if r.len() < 5 || r[0] != "$LOG" && !r[0].starts_with("$SB") {
            continue;
        }
        let prn: u16 = r[3].parse().unwrap_or(0);
        let present = PRESENT.contains(&prn);
        let what = r[4];
        if !present
            && (what.contains("SYMBOL SYNC")
                || what.contains("FRAME SYNC")
                || r[0].starts_with("$SB"))
        {
            bad.push(format!("C1 absent PRN {prn}: {}", r.join(",")));
        }
        if present && (what.contains("FRAME ERROR") || what.contains("TOI NOT FOUND")) {
            bad.push(format!("C2 PRN {prn}: {}", r.join(",")));
        }
    }
    // C2: each of the three frames of each present node.
    for &prn in &PRESENT {
        let node = node_of(prn).unwrap();
        for (k, t_edge) in node
            .frame_edges(cfg.duration_s)
            .into_iter()
            .filter(|&(_, t)| t < 30.0)
        {
            let f = frame_data(node, k);
            // The receiver decodes a frame once the next frame's synchronisation pattern is in.
            let t_dec = t_edge + 12.0 / node.code_scale() + 0.136;
            let near = |r: &&Vec<&str>| {
                r.len() > 3
                    && r[2] == "AFSD"
                    && r[3] == prn.to_string()
                    && (r[1].parse::<f64>().unwrap() - t_dec).abs() < 0.05
            };
            let toi = recs
                .iter()
                .filter(near)
                .find(|r| r[4].starts_with("AFSD TOI="));
            match toi {
                Some(r) if r[4] == format!("AFSD TOI={}", f.toi) => {}
                Some(r) => bad.push(format!(
                    "C2 PRN {prn} frame TOI {}: receiver TOI {}",
                    f.toi, r[4]
                )),
                None => bad.push(format!(
                    "C2 PRN {prn} frame TOI {} (edge {t_edge:.4} s): no TOI record",
                    f.toi
                )),
            }
            let sb2 = hex_of(&with_crc(&f.sb2));
            match recs.iter().filter(near).find(|r| r[0] == "$SB2") {
                Some(r) => {
                    if r[4] != &sb2[..80] || r[5] != &sb2[294..] {
                        bad.push(format!("C2 PRN {prn} TOI {}: SB2 differs", f.toi));
                    }
                }
                None => bad.push(format!("C2 PRN {prn} TOI {}: no $SB2 record", f.toi)),
            }
            for sb in ["$SB3", "$SB4"] {
                if !recs
                    .iter()
                    .filter(near)
                    .any(|r| r[0] == sb && r[4] == "FRAME DECODED")
                {
                    bad.push(format!("C2 PRN {prn} TOI {}: no {sb} FRAME DECODED", f.toi));
                }
            }
        }
    }
    (bad, notes)
}

/// Guard G0 as pre-registered (every record of the pinned build reproduced by the print-only
/// build), and the run-to-run check of the pinned build that explains its result.
fn g0() -> (Vec<String>, Vec<String>) {
    let keep = |s: &str| -> std::collections::BTreeSet<String> {
        s.lines()
            .filter(|l| !l.contains("START NCH"))
            .map(str::to_string)
            .collect()
    };
    let (p, t, rr) = (keep(LOG_PINNED), keep(LOG), keep(LOG_PINNED_RERUN));
    (
        p.difference(&t).cloned().collect(),
        p.symmetric_difference(&rr).cloned().collect(),
    )
}

/// C1 and C2 on the 4-bit recording.
#[test]
#[ignore = "pre-registered criterion missed on the first and only run: 5 violations. C1: one AFSP PRN 11 \
            status line (t = 6 s, 1.5 s after acquisition) reports 43.7 dB-Hz, 0.3 dB below the 44 dB-Hz \
            floor; C2: the first frame of node 11 (TOI 98, edge 3.5003 s, 1.34 s after acquisition) is \
            never frame-synchronised, so its TOI, SB2, SB3 and SB4 are missing. Everything else holds; \
            finding pinned by decodability_finding_five_violations"]
fn pocketsdr_afs_acquires_tracks_and_decodes_4bit_recording() {
    let (bad, notes) = evaluate();
    for n in &notes {
        eprintln!("{n}");
    }
    let (g0_missing, pinned_vs_rerun) = g0();
    eprintln!("G0 missing: {g0_missing:?}");
    eprintln!("pinned run vs pinned re-run: {pinned_vs_rerun:?}");
    assert!(bad.is_empty(), "{} violations: {bad:#?}", bad.len());
}

/// The finding of the second pre-registered comparison, pinned so that any change shows.
///
/// Holds: all four channels of the two present nodes acquired and tracked to the end, with
/// worst Doppler errors 0.32 to 0.49 Hz and worst AFS-I code-offset errors 0.006 to 0.008
/// chip; five of the six frames frame-synchronised with the right TOI (63, 64, 65 and 99, 0,
/// across the 99 to 0 wrap), subframe 2 equal to the truth in every printed bit and both
/// subframes 3 and 4 decoded; no frame error and no "TOI NOT FOUND"; none of the nine absent
/// PRNs ever synchronised.
///
/// Misses (the five violations): the first eligible AFSP PRN 11 carrier-to-noise reading,
/// 43.7 dB-Hz at 6 s against the 44 dB-Hz floor (its later readings rise to 44.2-45.3); and
/// node 11's first frame, never synchronised in this run or in two further runs of the
/// receiver. A direct demodulation of the recording at its truth labels (a diagnostic, not an
/// oracle) finds both synchronisation patterns of that frame pair with zero symbol errors.
/// The receiver's loops were settled by 3 s (Doppler error under 0.1 Hz), and the frame
/// began only 1.34 s after acquisition; the receiver-side cause is not identified.
///
/// Guard G0 as written does not hold: four acquisition records of the pinned build are not
/// reproduced by the print-only build. Two runs of the pinned build itself differ in exactly
/// those records (acquisition is paced by wall-clock sleeps); every other record agrees.
#[test]
fn decodability_finding_five_violations() {
    let (bad, notes) = evaluate();
    assert_eq!(
        bad,
        vec![
            "C1 AFSP 11 t=6: C/N0 43.7".to_string(),
            "C2 PRN 11 frame TOI 98 (edge 3.5003 s): no TOI record".to_string(),
            "C2 PRN 11 TOI 98: no $SB2 record".to_string(),
            "C2 PRN 11 TOI 98: no $SB3 FRAME DECODED".to_string(),
            "C2 PRN 11 TOI 98: no $SB4 FRAME DECODED".to_string(),
        ]
    );
    assert_eq!(notes.len(), 4);
    let (g0_missing, pinned_vs_rerun) = g0();
    assert_eq!(g0_missing.len(), 4);
    assert!(g0_missing.iter().all(|l| l.contains("SIGNAL FOUND")));
    assert!(pinned_vs_rerun.iter().all(|l| l.contains("SIGNAL FOUND")));
    assert_eq!(pinned_vs_rerun.len(), 8);
    // The committed metadata is the one this file's generator writes.
    let committed = include_str!("fixtures/lunar_afs_decodability_pocketsdr/v2_afs.sigmf-meta");
    let strip = |m: &str| {
        m.lines()
            .filter(|l| !l.contains("core:recorder"))
            .collect::<Vec<_>>()
            .join("\n")
    };
    assert_eq!(
        strip(&truth_meta_json(&recording()).unwrap()),
        strip(committed)
    );
}
