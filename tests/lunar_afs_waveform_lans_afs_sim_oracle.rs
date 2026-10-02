// SPDX-License-Identifier: AGPL-3.0-only
//! Independent-generator oracle for the Augmented Forward Signal (AFS) baseband waveform of
//! the LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0, 29 January 2025, Volume A.
//!
//! Pre-registration (package D6, written 2026-10-02 before any Kshana waveform code existed,
//! before LANS-AFS-SIM was built or run, and before any fixture below was produced). The
//! criteria, inputs and tolerances are fixed by this commit.
//!
//! ## Oracle (kind: Library)
//!
//! LANS-AFS-SIM, T. Ebinuma, `https://github.com/osqzss/LANS-AFS-SIM`, commit
//! `480c6bf353717bafc04b5ee5bafb38ed90e61aae` (2 May 2026), BSD-2-Clause licence. It is run
//! only as a separate program; no line of it enters `src/`. Configuration pinned: built with
//! its `#define DEMO_L1` removed, so that its carrier is the S-band 2492.028 MHz of LSIS-020
//! instead of its 1575.42 MHz L-band default; default 12 MHz sampling; 16-bit output
//! (`-b 16`, its noise-free format). The driver lives in `xval/lunar-afs/` (build script,
//! a C harness that calls the simulator's own code and frame routines, a print-only patch,
//! the run script). LANS-AFS-SIM and PocketSDR-AFS share an author and count as ONE
//! independent implementation; LANS-AFS-SIM reads its tertiary codes from the standard's
//! Annex 3 file, so W1 for the tertiary code is not independent of
//! `tests/lunar_afs_codes_lsis_reference.rs`.
//!
//! ## Quantities, inputs and tolerances
//!
//! - W1, chips. For every PRN the simulator's code routines accept (expected 1 to 210), the
//!   AFS-I primary (2046 chips), the AFS-Q primary (10230 chips) and the tertiary (1500
//!   chips) codes printed by the harness equal Kshana's `lunar_afs::codes` chip for chip.
//!   Tolerance: zero mismatches.
//! - W2, frame symbols. For each node the simulator transmits in the W3 run, for each frame
//!   it starts inside the run, the print-only patch records the frame's FID, TOI, the data
//!   bits it placed in subframes 2, 3 and 4 and the 6000 symbols it transmits. Kshana's frame
//!   builder, given the same FID, TOI and data bits, must produce the same 6000 symbols.
//!   Tolerance: zero mismatches.
//! - W3, baseband samples. The simulator is run for 24 s from its default start time with
//!   an almanac reduced to ONE node (the first entry of its `default_almanac.txt`, committed
//!   with the fixture), noise-free 16-bit IQ at 12 MHz. The print-only patch records, at each
//!   of the simulator's own update epochs, the channel's code phase (both codes), carrier
//!   phase, carrier and code rates and amplitude, exactly as the simulator holds them. Kshana's
//!   waveform generator, driven by that recorded state (no geometry of its own) and the W2
//!   symbols, regenerates the same samples. Compared quantity: the normalised complex
//!   correlation `rho = <x, y> / (|x| |y|)` between the simulator's samples `x` and Kshana's `y`.
//!   Tolerances: `|rho| >= 0.999` over the whole run and `|rho| >= 0.99` in every 2 ms block;
//!   the phase of `rho` within 0.05 rad of zero (the LSIS-130 relation
//!   `S(t) = I(t) cos(2 pi f t) - Q(t) sin(2 pi f t)`, so baseband `I + jQ`). Source of the
//!   tolerances: an exact waveform model gives `rho = 1` up to the simulator's 16-bit and
//!   table-lookup quantisation, whose loss is far below 1e-3; an I/Q swap, a Q sign flip, a
//!   missing tier or a wrong data alignment drops `|rho|` to near 0 or 0.5, and a 60/40 power
//!   split instead of LSIS-103's 50/50 drops it to 0.995.
//! - W0, guard. The patch only prints: the 16-bit output file of the patched build must be
//!   byte-identical to that of the unpatched build for the same command. If it is not, W2
//!   and W3 are void.
//!
//! The fixture `tests/fixtures/lunar_afs_waveform_lans_afs_sim/` holds the harness's printed
//! chips (hexadecimal), the recorded states and symbols, a decimated digest of the samples
//! (per-2 ms-block correlation inputs are recomputed by the generator script, which commits
//! the per-block `rho` the simulator's samples give against Kshana's), the SHA-256 of the
//! simulator's IQ file, and a NOTICE.md. The test regenerates Kshana's side in process.
//!
//! ## Disclosure
//!
//! The LANS-AFS-SIM repository was cloned (source only) before this commit to read its
//! README and command-line interface; it was not built or run. Its code-generation source
//! is not read until Kshana's own generator, written from the standard, is committed.
//!
//! ## Run record (2026-10-02, first and only run of each comparison)
//!
//! Deviations from the text above, each forced by the oracle and made before any comparison:
//!
//! - The simulator's `-b` option accepts only `2`; its 16-bit output is the default without
//!   `-b`, which is how it was run. Same output format as pre-registered.
//! - The first almanac entry (PRN-01) is below the horizon at the simulator's default start
//!   and site, so that run has no channel and writes an all-zero file. The run uses the first
//!   entry that is above the horizon there, PRN-02 (node identifier 2 of LSIS Table 11:
//!   secondary S1, tertiary PRN 2), as the pre-registration intended one transmitting node.
//! - Subframe 1 of a frame carries, per LSIS-415, the TOI of the NEXT frame's leading edge;
//!   the simulator writes `TOI + 1` there. W2 passes Kshana's frame builder the TOI field
//!   exactly as the trace records it, which is the comparison as stated ("the same FID, TOI
//!   and data bits").
//!
//! Results: W0 holds (patched and unpatched IQ byte-identical). W1: 630 codes (3 x 210 PRNs),
//! zero chip mismatches. W2: the 3 frames the run transmits, zero symbol mismatches. W3: over
//! the whole 23.9 s run (239 blocks of 0.1 s, 11 950 blocks of 2 ms), `|rho| = 0.999990333`,
//! phase `7.9e-9` rad; worst 2 ms block `|rho| = 0.999948`, worst phase `7.8e-5` rad
//! (`tests/fixtures/lunar_afs_waveform_lans_afs_sim/full_run_results.tsv`); on the 24
//! committed windows `|rho| = 0.999990`. All bars hold.
//!
//! Mutations (each applied alone to the engine, test run, then reverted): reading the
//! interleaver by rows instead of columns makes W2 fail (2950 of 6000 symbols differ);
//! flipping the sign of the AFS-Q chip makes W3 fail (`|rho| = 0.0047` in the first window).

use kshana::lunar_afs::codes::{afs_q_primary, LsisCodes, NodeChips, NodeCodes};
use kshana::lunar_afs::frame::{FrameCoder, FrameData};
use kshana::lunar_afs::waveform::{render, ChannelState};
use kshana::sdr::Cf64;
use std::rc::Rc;

const CODES: &str = include_str!("fixtures/lunar_afs_waveform_lans_afs_sim/lans_codes.txt");
const TRACE: &str = include_str!("fixtures/lunar_afs_waveform_lans_afs_sim/trace.txt");
const WINDOWS: &[u8] = include_bytes!("fixtures/lunar_afs_waveform_lans_afs_sim/windows.bin");
/// Complex samples per 0.1 s simulator block at 12 MHz.
const BLOCK: usize = 1_200_000;
/// Samples per 2 ms comparison block.
const SUB: usize = 24_000;
const FS: f64 = 12.0e6;

fn hex_to_bits(hex: &str, n: usize) -> Vec<u8> {
    let bits: Vec<u8> = hex
        .chars()
        .flat_map(|c| {
            let v = c.to_digit(16).expect("hex") as u8;
            (0..4).rev().map(move |k| (v >> k) & 1)
        })
        .collect();
    bits[bits.len() - n..].to_vec()
}

fn bits(s: &str) -> Vec<u8> {
    s.bytes().map(|b| b - b'0').collect()
}

/// One `STATE` line of the trace: the simulator's channel state at the start of a block.
#[derive(Clone, Copy, Debug)]
struct LansState {
    isim: i64,
    prn: u16,
    i_code_phase: f64,
    i_ibit: i64,
    i_f_code: f64,
    q_code_phase: f64,
    q_ibit: i64,
    q_ichip: i64,
    q_f_code: f64,
    f_carr: f64,
    carr_phase: f64,
    gain: f64,
}

struct Trace {
    sb2: Vec<u8>,
    sb34: Vec<u8>,
    /// (block after which it takes effect, SB1 TOI field, 6000 symbols)
    frames: Vec<(i64, u8, Vec<u8>)>,
    states: Vec<LansState>,
}

fn parse_trace() -> Trace {
    let mut t = Trace {
        sb2: vec![],
        sb34: vec![],
        frames: vec![],
        states: vec![],
    };
    for line in TRACE.lines() {
        let f: Vec<&str> = line.split_whitespace().collect();
        match f[0] {
            "SB34" => t.sb34 = bits(f[1]),
            "SB2" => t.sb2 = bits(f[2]),
            "FRAME" => t
                .frames
                .push((f[1].parse().unwrap(), f[3].parse().unwrap(), bits(f[4]))),
            "STATE" => {
                let g = |i: usize| f[i].parse::<f64>().unwrap();
                t.states.push(LansState {
                    isim: f[1].parse().unwrap(),
                    prn: f[2].parse().unwrap(),
                    i_code_phase: g(3),
                    i_ibit: f[4].parse().unwrap(),
                    i_f_code: g(6),
                    q_code_phase: g(7),
                    q_ibit: f[8].parse().unwrap(),
                    q_ichip: f[9].parse().unwrap(),
                    q_f_code: g(10),
                    f_carr: g(11),
                    carr_phase: g(12),
                    gain: g(13),
                });
            }
            other => panic!("unknown trace record {other}"),
        }
    }
    t
}

/// Kshana's samples of one simulator block, from the simulator's recorded state only.
fn kshana_block(st: &LansState, symbols: &Rc<Vec<u8>>, n: usize, chips: &NodeChips) -> Vec<Cf64> {
    let amp = st.gain * 250.0 / 128.0;
    let cs = ChannelState {
        i_phase_chips: st.i_ibit as f64 * 2046.0 + st.i_code_phase,
        i_rate_cps: st.i_f_code,
        q_phase_chips: ((st.q_ichip * 4 + st.q_ibit) as f64) * 10230.0 + st.q_code_phase,
        q_rate_cps: st.q_f_code,
        carrier_phase_cycles: st.carr_phase,
        carrier_hz: st.f_carr,
        amp_i: amp,
        amp_q: amp,
    };
    let mut out = vec![Cf64::new(0.0, 0.0); n];
    render(&mut out, FS, &cs, chips, |_| symbols.clone());
    out
}

/// The frame symbols in force during block `isim`.
fn symbols_for(trace: &Trace, isim: i64) -> Rc<Vec<u8>> {
    let f = trace
        .frames
        .iter()
        .rev()
        .find(|(at, _, _)| *at < isim)
        .expect("a frame");
    Rc::new(f.2.clone())
}

/// `rho = <x, y> / (|x| |y|)` as (magnitude, phase).
fn rho(x: &[Cf64], y: &[Cf64]) -> (f64, f64) {
    let (mut re, mut im, mut px, mut py) = (0.0, 0.0, 0.0, 0.0);
    for (a, b) in x.iter().zip(y) {
        re += a.re * b.re + a.im * b.im;
        im += a.im * b.re - a.re * b.im;
        px += a.re * a.re + a.im * a.im;
        py += b.re * b.re + b.im * b.im;
    }
    let d = (px * py).sqrt();
    ((re * re + im * im).sqrt() / d, im.atan2(re))
}

fn int16_iq(bytes: &[u8]) -> Vec<Cf64> {
    bytes
        .chunks_exact(4)
        .map(|c| {
            Cf64::new(
                i16::from_le_bytes([c[0], c[1]]) as f64,
                i16::from_le_bytes([c[2], c[3]]) as f64,
            )
        })
        .collect()
}

/// Compare a LANS-AFS-SIM code dump with Kshana's codes; returns the per-code counts seen and
/// the mismatches. AFS-I and tertiary records need the LSIS cache.
fn compare_codes(text: &str, lsis: Option<&LsisCodes>) -> ([usize; 3], Vec<String>) {
    let mut seen = [0usize; 3];
    let mut bad = Vec::new();
    for line in text.lines() {
        let f: Vec<&str> = line.split_whitespace().collect();
        let prn: u16 = f[1].parse().unwrap();
        let (k, want, got) = match (f[0], lsis) {
            ("I", Some(l)) => (0, hex_to_bits(f[2], 2046), l.afs_i_primary(prn).unwrap()),
            ("Q", _) => (1, hex_to_bits(f[2], 10230), afs_q_primary(prn).unwrap()),
            ("T", Some(l)) => (2, hex_to_bits(f[2], 1500), l.afs_q_tertiary(prn).unwrap()),
            ("I" | "T", None) => continue,
            (o, _) => panic!("unknown code record {o}"),
        };
        seen[k] += 1;
        let n = got.iter().zip(&want).filter(|(a, b)| a != b).count();
        if n != 0 {
            bad.push(format!("{} PRN {prn}: {n} chips differ", f[0]));
        }
    }
    (seen, bad)
}

/// W1: chips of every code and PRN equal LANS-AFS-SIM's. The committed dump holds the AFS-Q
/// primary codes only (the IS-GPS-800 L1C pilot codes); the AFS-I and tertiary records, which
/// carry LSIS-only content, are compared from the simulator run directory
/// (`KSHANA_LANS_RUN`, written by `xval/lunar-afs/run_lans.sh`) against the LSIS cache.
#[test]
fn afs_chips_match_lans_afs_sim() {
    let (seen, bad) = compare_codes(CODES, None);
    assert_eq!(
        seen,
        [0, 210, 0],
        "committed dump: the 210 AFS-Q primary codes"
    );
    assert!(bad.is_empty(), "{bad:?}");
    let (Ok(dir), true) = (
        std::env::var("KSHANA_LANS_RUN"),
        kshana::lunar_afs::lsis::cache_present(),
    ) else {
        eprintln!(
            "SKIP (AFS-I and tertiary): KSHANA_LANS_RUN or the LSIS cache absent; {}",
            kshana::lunar_afs::lsis::fetch_hint()
        );
        return;
    };
    let full = std::fs::read_to_string(format!("{dir}/lans_codes.txt")).expect("lans_codes.txt");
    let (seen, bad) = compare_codes(&full, Some(&LsisCodes::load().unwrap()));
    assert_eq!(seen, [210, 210, 210], "every PRN of every code dumped");
    assert!(bad.is_empty(), "{bad:?}");
}

/// W2 and W3: the frame symbols and the baseband samples equal LANS-AFS-SIM's.
///
/// W3 in the gate runs on the 24 committed 2 ms windows; the whole 23.9 s run is
/// [`afs_full_run_matches_lans_afs_sim`], data-gated on the simulator's 1.15 GB IQ file.
#[test]
fn afs_frames_and_baseband_match_lans_afs_sim() {
    if !kshana::lunar_afs::lsis::cache_present() {
        eprintln!("SKIP: {}", kshana::lunar_afs::lsis::fetch_hint());
        return;
    }
    let trace = parse_trace();
    assert_eq!(trace.sb2.len(), 1176);
    assert_eq!(trace.sb34.len(), 846);
    // W2: every frame the simulator transmits.
    let coder = FrameCoder::load().unwrap();
    assert_eq!(trace.frames.len(), 3);
    for (at, toi, sym) in &trace.frames {
        let ours = coder
            .encode(&FrameData {
                fid: 0,
                toi: *toi,
                sb2: trace.sb2.clone(),
                sb3: trace.sb34.clone(),
                sb4: trace.sb34.clone(),
            })
            .unwrap();
        let n = ours.iter().zip(sym).filter(|(a, b)| a != b).count();
        assert_eq!(
            n, 0,
            "frame from block {at} (TOI field {toi}): {n} of 6000 symbols differ"
        );
    }
    // W3 on the committed windows.
    let chips =
        NodeChips::new(NodeCodes::interim(2).unwrap(), &LsisCodes::load().unwrap()).unwrap();
    let lans = int16_iq(WINDOWS);
    assert_eq!(lans.len(), 24 * SUB);
    let mut all_x = Vec::new();
    let mut all_y = Vec::new();
    for (w, block) in (0..240).step_by(10).enumerate() {
        let st = trace
            .states
            .iter()
            .find(|s| s.isim == block)
            .expect("state");
        assert_eq!(st.prn, 2);
        let y = kshana_block(st, &symbols_for(&trace, block), SUB, &chips);
        let x = &lans[w * SUB..(w + 1) * SUB];
        let (r, ph) = rho(x, &y);
        assert!(r >= 0.99, "block {block}: |rho| = {r}");
        assert!(ph.abs() <= 0.05, "block {block}: phase {ph}");
        all_x.extend_from_slice(x);
        all_y.extend(y);
    }
    let (r, ph) = rho(&all_x, &all_y);
    eprintln!("W3 windows: |rho| = {r:.9}, phase = {ph:.3e} rad");
    assert!(
        r >= 0.999 && ph.abs() <= 0.05,
        "windows: |rho| = {r}, phase {ph}"
    );
}

/// W3 over the whole run (data-gated): set `KSHANA_LANS_RUN` to the directory
/// `xval/lunar-afs/run_lans.sh` wrote. Every 2 ms block and the whole run are compared.
#[test]
fn afs_full_run_matches_lans_afs_sim() {
    let Ok(dir) = std::env::var("KSHANA_LANS_RUN") else {
        eprintln!(
            "SKIP: KSHANA_LANS_RUN not set (LANS-AFS-SIM IQ file absent); W3 full run not compared"
        );
        return;
    };
    if !kshana::lunar_afs::lsis::cache_present() {
        eprintln!("SKIP: {}", kshana::lunar_afs::lsis::fetch_hint());
        return;
    }
    use std::io::Read;
    let trace = parse_trace();
    let chips =
        NodeChips::new(NodeCodes::interim(2).unwrap(), &LsisCodes::load().unwrap()).unwrap();
    let mut f = std::fs::File::open(format!("{dir}/iq16.bin")).expect("iq16.bin");
    let mut buf = vec![0u8; BLOCK * 4];
    let (mut re, mut im, mut px, mut py) = (0.0f64, 0.0f64, 0.0f64, 0.0f64);
    let (mut worst, mut worst_at, mut worst_phase) = (1.0f64, (0i64, 0usize), 0.0f64);
    let mut n_sub = 0usize;
    for st in &trace.states {
        f.read_exact(&mut buf).expect("block");
        let x = int16_iq(&buf);
        let y = kshana_block(st, &symbols_for(&trace, st.isim), BLOCK, &chips);
        for k in 0..BLOCK / SUB {
            let (xs, ys) = (&x[k * SUB..(k + 1) * SUB], &y[k * SUB..(k + 1) * SUB]);
            let (r, ph) = rho(xs, ys);
            n_sub += 1;
            if r < worst || ph.abs() > worst_phase.abs() {
                if r < worst {
                    worst = r;
                    worst_at = (st.isim, k);
                }
                if ph.abs() > worst_phase.abs() {
                    worst_phase = ph;
                }
            }
        }
        for (a, b) in x.iter().zip(&y) {
            re += a.re * b.re + a.im * b.im;
            im += a.im * b.re - a.re * b.im;
            px += a.re * a.re + a.im * a.im;
            py += b.re * b.re + b.im * b.im;
        }
    }
    let r = (re * re + im * im).sqrt() / (px * py).sqrt();
    let ph = im.atan2(re);
    let summary = format!(
        "blocks_0p1s\t{}\nblocks_2ms\t{n_sub}\nrho_whole_run\t{r:.12}\nphase_whole_run_rad\t{ph:.6e}\n\
         worst_block_rho\t{worst:.12}\nworst_block_at\t{}:{}\nworst_block_phase_rad\t{worst_phase:.6e}\n",
        trace.states.len(),
        worst_at.0,
        worst_at.1
    );
    eprint!("{summary}");
    if let Ok(out) = std::env::var("KSHANA_LANS_RESULTS_OUT") {
        std::fs::write(out, &summary).unwrap();
    }
    assert!(
        r >= 0.999 && ph.abs() <= 0.05,
        "whole run: |rho| = {r}, phase {ph}"
    );
    assert!(
        worst >= 0.99 && worst_phase.abs() <= 0.05,
        "worst 2 ms block {worst} at {worst_at:?}, phase {worst_phase}"
    );
}
