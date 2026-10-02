// SPDX-License-Identifier: AGPL-3.0-only
//! Closed-loop decodability oracle for Kshana's Augmented Forward Signal (AFS) recordings:
//! an independent software receiver acquires, tracks and decodes the baseband IQ that
//! `kshana::lunar_afs` writes as a Signal Metadata Format (SigMF) recording, and its decoded
//! values are compared with the recording's truth labels.
//!
//! What this proves, and what it does not: it proves that the recording conforms to the
//! LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0, 29 January 2025, as far as an
//! independent receiver built to that standard can tell (codes, tiering, modulation, data
//! alignment, frame, channel coding), and that the truth labels written beside the samples
//! are consistent with what the receiver recovers. It does NOT validate channel physics,
//! propagation, received power, link budgets or the service volume: the recording's Doppler,
//! delay and carrier-to-noise density are chosen inputs, not physical predictions.
//!
//! Pre-registration (package D6, written 2026-10-02 before any Kshana waveform or SigMF code
//! existed, before PocketSDR-AFS was built or run, and before the recording existed). The
//! criteria, inputs and tolerances are fixed by this commit.
//!
//! ## Oracle (kind: Library)
//!
//! PocketSDR-AFS, T. Ebinuma (based on T. Takasu's PocketSDR 0.13),
//! `https://github.com/osqzss/PocketSDR-AFS`, commit
//! `5b23809f30d68518b7fad7a564fd0fac57cc497d` (8 December 2025), BSD-2-Clause licence; its
//! external libraries come from its own `lib/clone_lib.sh`. Run only as a separate program.
//! Configuration pinned: `src/pocket_sdr.h` built with `#define DEMO_L1` removed (the S-band
//! carrier of LSIS-020); command
//! `pocket_trk -sig AFSD -prn 2-8 -sig AFSP -prn 2-8 -fmt INT8X2 -f 12 -IQ 2 -log log.txt <file>`
//! (its own offline example with the interleaved 8-bit format named). LANS-AFS-SIM and
//! PocketSDR-AFS share an author and count as one independent implementation; leg (d),
//! `tests/lunar_afs_frame_coding_oracle.rs`, guards against a misreading they might share.
//!
//! ## Input recording (produced by Kshana; truth labels in its SigMF annotations)
//!
//! 12 MHz complex sampling, `ci8` (interleaved signed 8-bit I and Q), 42.5 s, centre frequency
//! 2492.028 MHz, two transmitting LunaNet service provider nodes of the interim Table 11
//! assignment, each with a composite carrier-to-noise density of 50 dB-Hz (47 dB-Hz per
//! component, LSIS-103 50/50 split), constant Doppler with coherent code Doppler:
//!
//! - node identifier 3 (AFS-I PRN 3, AFS-Q PRN 3, secondary S2, tertiary PRN 3, phase 0),
//!   Doppler +1234.5 Hz, the leading edge of a frame's synchronisation pattern arriving at
//!   receiver time 4.0004567 s, that frame's TOI 17;
//! - node identifier 8 (PRNs 8, secondary S3, tertiary PRN 8), Doppler -2718.3 Hz, a frame
//!   arriving at 4.0012345 s with TOI 42.
//!
//! Frame identifier 0, TOI incrementing by one per 12 s frame; subframe 2, 3 and 4 data bits
//! from a seeded generator (seed recorded in the metadata), CRC appended per LSIS-FID0-469.
//! Complex white Gaussian noise of unit variance per dimension, seeded; samples scaled by 16
//! and rounded to 8 bits with clipping at plus or minus 127.
//!
//! ## Pre-registered bars (all must hold)
//!
//! - C1, acquisition and tracking. For each present node, the AFS-I (`AFSD`) and AFS-Q
//!   (`AFSP`) channels of its PRN are tracked to the end of the file, and in every channel
//!   status line the receiver logs at receiver time 5 s or later: Doppler within 10 Hz of the
//!   truth; carrier-to-noise density within 3 dB of the 47 dB-Hz per-component truth; for
//!   `AFSD`, code offset within 0.25 AFS-I chip (244.4 ns) of the truth, modulo the 2 ms code
//!   period, with the receiver's code-offset convention read from its source and stated in
//!   the generator script. For the absent PRNs 2, 4, 5, 6 and 7, no frame or symbol
//!   synchronisation is ever logged.
//! - C2, decoding. For each present node and each of the three frames whose synchronisation
//!   pattern arrives at about 4, 16 and 28 s: the TOI the receiver logs on frame
//!   synchronisation equals the truth; its logged subframe-2 content equals the truth bits;
//!   subframe 3 and subframe 4 are each logged as decoded; and over the whole run the receiver
//!   logs zero subframe frame errors and zero "TOI NOT FOUND" for the present PRNs.
//!
//! Source of the bars: a conforming recording at 47 dB-Hz per component leaves a tracking
//! loop's Doppler error well below 1 Hz and its code error well below 0.05 chip, so 10 Hz and
//! 0.25 chip separate "conforms" from "does not", not good from bad tracking; any code, tier,
//! frame or coding error stops synchronisation or decoding outright.
//!
//! ## Fixture and test
//!
//! `tests/fixtures/lunar_afs_decodability_pocketsdr/`: the receiver's log filtered to the
//! present and absent PRNs, the SHA-256 of the recording and of the receiver binary inputs,
//! the commands, and a NOTICE.md. The runner is `xval/lunar-afs/run_pocketsdr.sh`. The test
//! regenerates the truth labels in process from the same configuration and compares.
//!
//! ## Disclosure
//!
//! The PocketSDR-AFS repository was cloned (source only) before this commit to read its README,
//! its command-line usage and the names of its log records; it was not built or run.
//!
//! ## Run record (2026-10-02): the pre-registered run did not test the signal
//!
//! First and only run of this configuration: no channel was acquired. Every one of the 194
//! acquisition attempts over the 42.5 s, present nodes included, logged `SIGNAL NOT FOUND`,
//! with acquisition carrier-to-noise estimates of 32.3 to 34.0 dB-Hz (the noise floor). Bars
//! C1 and C2 are not met.
//!
//! Cause, found afterwards in the receiver's source (`src/pocket_sdr.h`, `SDR_CPX8`, and
//! `write_buff` in `src/sdr_rcv.c`): the receiver keeps 4 bits per I and per Q component and
//! stores an `INT8X2` input sample by its low four bits, so codes outside -8..7 wrap modulo
//! 16. The pre-registered recording (noise 16 codes per dimension, clipped at 127) lies far
//! outside that range and is scrambled on input; a direct correlation of the same recording
//! at its truth labels shows the AFS-I signal at about 10 sigma per 2 ms (a check written
//! after the failure, not an oracle). The receiver acquires and decodes its own simulator's
//! 2-bit output in the same build, so the build itself works.
//!
//! Outcome of this pre-registration: the comparison could not be made; it is not a pass and
//! not a statement about the recording. A fresh comparison, with new inputs inside the
//! receiver's 4-bit range and the same bars, is pre-registered separately in
//! `tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs`.
//!
//! Disclosed deviation of the receiver configuration: at its default log level 3 the pinned
//! build logs neither its channel status (`$CH`, level 4) nor the TOI it decodes, both of
//! which the bars read. A print-only copy (`xval/lunar-afs/apply_psdr_trace.py`, diff in
//! `tests/fixtures/lunar_afs_decodability_pocketsdr/psdr_trace.patch`) raises the level to 4
//! and logs the TOI; `xval/lunar-afs/run_pocketsdr.sh` checks that every record of the
//! unpatched build is reproduced by it (guard G0, held on this run).

use kshana::lunar_afs::codes::NodeCodes;
use kshana::lunar_afs::waveform::{truth_meta_json, Generator, NodeSignal, RecordingConfig};

/// The pre-registered recording.
fn recording() -> RecordingConfig {
    RecordingConfig {
        sample_rate_hz: 12.0e6,
        duration_s: 42.5,
        nodes: vec![
            NodeSignal {
                codes: NodeCodes::interim(3).unwrap(),
                doppler_hz: 1234.5,
                frame_arrival_s: 4.0004567,
                toi_at_arrival: 17,
                cn0_dbhz: 50.0,
                carrier_phase_rad: 0.0,
                data_seed: 3,
            },
            NodeSignal {
                codes: NodeCodes::interim(8).unwrap(),
                doppler_hz: -2718.3,
                frame_arrival_s: 4.0012345,
                toi_at_arrival: 42,
                cn0_dbhz: 50.0,
                carrier_phase_rad: 0.0,
                data_seed: 8,
            },
        ],
        noise_seed: Some(20_261_002),
        ci8_scale: 16.0,
        ci8_clip: 127,
    }
}

/// Write the recording (`afs.sigmf-data`, `afs.sigmf-meta`) into `KSHANA_AFS_RECORDING_OUT`.
/// Ignored in the gate: the 1.02 GB file is an input of `xval/lunar-afs/run_pocketsdr.sh`.
#[test]
#[ignore = "writes the 1.02 GB recording for xval/lunar-afs/run_pocketsdr.sh"]
fn write_recording_for_pocketsdr() {
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

const V1_LOG: &str = include_str!("fixtures/lunar_afs_decodability_pocketsdr/v1_log_l4.txt");

/// C1 and C2: PocketSDR-AFS acquires, tracks and decodes Kshana's recording to its labels.
#[test]
#[ignore = "pre-registered run could not test the signal: 0 of 194 acquisitions found a signal \
            (estimates 32.3-34.0 dB-Hz, the noise floor) because the receiver keeps 4 bits per \
            component and the recording's codes span +-127; superseded by the fresh 4-bit \
            pre-registration tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs"]
fn pocketsdr_afs_acquires_tracks_and_decodes_kshana_recording() {
    let found = V1_LOG
        .lines()
        .filter(|l| l.contains("SIGNAL FOUND"))
        .count();
    assert!(found > 0, "no channel acquired");
}

/// Pins the recorded outcome of the first run: nothing was acquired, so neither bar could
/// be evaluated, and the recording written by this file's generator is the one whose
/// metadata is committed (the same truth labels the generator writes today).
#[test]
fn first_run_finding_no_acquisition_outside_the_receivers_4_bit_range() {
    let attempts: Vec<&str> = V1_LOG
        .lines()
        .filter(|l| l.contains("SIGNAL NOT FOUND"))
        .collect();
    assert_eq!(attempts.len(), 194);
    assert!(!V1_LOG.contains("SIGNAL FOUND ("));
    assert!(!V1_LOG.contains("$SB2"));
    let max_cn0 = attempts
        .iter()
        .map(|l| {
            l.rsplit('(')
                .next()
                .unwrap()
                .trim_end_matches(')')
                .parse::<f64>()
                .unwrap()
        })
        .fold(f64::MIN, f64::max);
    assert!(max_cn0 <= 34.0, "{max_cn0}");
    let committed = include_str!("fixtures/lunar_afs_decodability_pocketsdr/v1_afs.sigmf-meta");
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
