// SPDX-License-Identifier: AGPL-3.0-only
//! Oracles for the Augmented Forward Signal (AFS) frame channel coding of the LunaNet
//! Signal-In-Space Recommended Standard (LSIS) V1.0, 29 January 2025, Volume A, frame
//! identifier 0 (FID0): the Bose–Chaudhuri–Hocquenghem (BCH) (51, 8) code of subframe 1, the
//! 24-bit cyclic redundancy check (CRC), the rate one-half low-density parity-check (LDPC)
//! codes of subframes 2, 3 and 4 with their puncturing, and the 60 by 98 block interleaver.
//!
//! Pre-registration (package D6, written 2026-10-02 before any Kshana frame-coding code existed
//! and before any comparison was run). The criteria, inputs and tolerances are fixed here.
//!
//! This is leg (d) of the package: a decoder built from the parity-check matrices the standard
//! prints, so that a misreading shared by LANS-AFS-SIM and PocketSDR-AFS (one author) cannot
//! pass both legs (b) and (c) unnoticed. The independent-tool leg of the same row is the
//! PocketSDR-AFS frame decoding pre-registered in `tests/lunar_afs_decodability_pocketsdr_oracle.rs`.
//!
//! ## Quantities, inputs, oracles and tolerances
//!
//! - D1, BCH (51, 8), kind Reference. Kshana's subframe-1 encoder
//!   (`kshana::lunar_afs::frame`) applied to the 9-bit subframe-1 word `0x045` (FID 0,
//!   TOI 69) must produce the 52-symbol word printed in LSIS Figure 8, `0x229f61dbb84a0` (52
//!   symbols with three leading padding zeros dropped). Tolerance: bit-exact. The encoder is
//!   the 8-stage register of Figure 7 with the octal-763 generator, `1 + X + X^4 + X^5 + X^6 +
//!   X^7 + X^8`.
//! - D2, CRC-24, kind Reference. The generator `(1 + X)·P(X)` of LSIS-FID0-467 is the
//!   polynomial `0x1864CFB`; with the bit ordering of LSIS-FID0-469 (no reflection, zero
//!   initial value, no final exclusive-or) the CRC of the nine ASCII bytes `123456789` must
//!   equal `0xCDE703`, the check value of the catalogue entry CRC-24/LTE-A (Greg Cook, Catalogue
//!   of parametrised CRC algorithms, reveng.sourceforge.io, same parameters). Tolerance:
//!   bit-exact.
//! - D3, LDPC encoding against the printed parity-check matrix, kind Reference. For 50 seeded
//!   pseudo-random 1200-bit subframe-2 words and 50 seeded 870-bit subframe-3 words, the full
//!   codeword `(s; p1; p2)` of Kshana's encoder (which uses the printed `A`, `B^-1`, `C`, `D`
//!   of [Annex1], as LSIS 2.4.3.1.2 requires) must satisfy `H·c = 0 (mod 2)`, where `H` is
//!   assembled as `[[A, B, 0], [C, D, I]]` from the printed `A`, `B`, `C`, `D` index tables
//!   (the `B` table, not `B^-1`). Tolerance: zero unsatisfied checks.
//! - D4, decodability of the broadcast symbols, kind: an in-repository decoder (not an
//!   independent oracle on its own; it guards the puncturing and ordering conventions). A
//!   normalised min-sum belief-propagation decoder written from `H` alone (never calling the
//!   encoder) receives the 2400 / 1740 broadcast symbols of each subframe, with the punctured
//!   positions (the first `z` systematic bits, the 10 filler bits of subframes 3 and 4, and the
//!   untransmitted parity tail) set to zero log-likelihood ratio. Noise-free (symbols mapped
//!   0 to +1, 1 to -1, LSIS-150), all 50 + 50 words must decode to the transmitted data with
//!   zero bit errors and a passing CRC. With seeded additive white Gaussian noise at a symbol
//!   energy to noise density ratio of 3 dB, 20 + 20 words must all decode with zero bit errors
//!   and a passing CRC (rate one-half codes of this block length reach a 1e-3 frame error rate
//!   near 1.5 dB of bit energy to noise density, that is near -1.5 dB of symbol energy, so 3 dB
//!   of symbol energy leaves a wide margin; the bar tests conventions, not code performance).
//! - D5, deinterleaving and full frame, in-repository: the 6000-symbol frame is the 68-symbol
//!   synchronisation pattern `CC63F74536F49E04A` (LSIS-330), the 52 subframe-1 symbols, then the
//!   5880 interleaved symbols; inverting the interleaver (written by rows of 98, read by
//!   columns of 60, the dimensions of LSIS 2.4.3.1.5 text) and decoding D1 and D4 recovers FID,
//!   TOI and all three subframes for 10 seeded frames. Tolerance: exact.
//!
//! D1, D2 and D3 are the externally anchored claims; D4 and D5 are internal and are not
//! counted as oracles.
//!
//! Source of the standard: LSIS V1.0, 29 January 2025, retrieved 2026-10-02 from
//! `https://www.nasa.gov/wp-content/uploads/2025/02/lunanet-signal-in-space-recommended-standard-augmented-forward-signal-vol-a.pdf`
//! (SHA-256 `986e07959f527d24280d87b5477298424ffdf754c4625f08041b5749592e61b6`); [Annex1]
//! and its comma-separated index files (`003a`..`003j`) are embedded in that PDF.
//!
//! ## Stated assumptions
//!
//! - B1. Subframe 1: bit 0 of the 9-bit word is the most significant bit; bits 1 to 8 load
//!   the register so that bit 1 sits in stage 8 and is output first; bit 0 is added modulo 2
//!   to all 51 outputs and prepended (LSIS 2.4.2.1).
//! - B2. The index tables are (row, column) pairs counted from zero, as the Annex 2 README says.
//! - B3. Subframes 3 and 4: the 10 zero filler bits follow the 870 data-and-CRC bits, making
//!   an 880-bit systematic part; the broadcast word is `s` without its first `z` bits and
//!   without the filler bits, then `p1`, then `p2` from its first bit, until 2400 (subframe 2)
//!   or 1740 (subframes 3 and 4) symbols (`z` = 240 and 176).
//! - B4. Table 17 prints "60 x 98 (n columns x k rows)"; the text describes 60 rows and 98
//!   columns, written by rows and read by columns, which is used.
//!
//! ## Disclosure
//!
//! The standard and its annexes were downloaded and read before this commit (they define what
//! is implemented). No Kshana frame-coding code existed when this header was committed.
//!
//! Licence (after the run): the [Annex1] tables are no longer committed; D3 to D5 read them
//! from the verified local LSIS cache (`xval/lunar-afs/fetch_lsis.sh`) and skip with a notice
//! without it. D1 and D2 need no table and always run. The comparisons are unchanged.
//!
//! Correction to the header text, recorded with the first run: D1 says the printed word has
//! "three leading padding zeros dropped". It has none: `0x229f61dbb84a0` is 13 hexadecimal
//! digits, exactly 52 symbols; the three padding zeros of Figure 8 belong to the 9-bit data
//! field `0x045`. The comparison is the one stated, the 52 printed symbols, bit-exact.

use kshana::lunar_afs::frame::{
    crc24_bytes, encode_sb1, sync_pattern, with_crc, FrameCoder, FrameData, SB2_DATA_BITS,
    SB34_DATA_BITS,
};
use kshana::lunar_afs::ldpc::{LdpcCode, Subframe};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;

fn random_bits(rng: &mut ChaCha8Rng, n: usize) -> Vec<u8> {
    (0..n).map(|_| rng.gen::<bool>() as u8).collect()
}

/// LSIS-150: logic 0 is +1.0, logic 1 is -1.0.
fn level(b: u8) -> f64 {
    if b == 1 {
        -1.0
    } else {
        1.0
    }
}

/// D1 and D2: the printed BCH worked example and the catalogue CRC check value.
#[test]
fn bch_worked_example_and_crc24_check_value_are_bit_exact() {
    // Figure 8: SB1 data 0x045 = FID 0, TOI 69.
    let got = encode_sb1(0, 69).unwrap();
    let want: Vec<u8> = (0..52)
        .rev()
        .map(|k| ((0x229f61dbb84a0u64 >> k) & 1) as u8)
        .collect();
    assert_eq!(got, want, "BCH (51, 8) code word of 0x045");
    // CRC-24/LTE-A catalogue check value, same parameters as LSIS-FID0-467/469.
    assert_eq!(crc24_bytes(b"123456789"), 0xCD_E703);
}

/// D3: every encoder codeword satisfies the printed parity-check matrix.
#[test]
fn ldpc_codewords_satisfy_the_printed_parity_check_matrices() {
    if !kshana::lunar_afs::lsis::cache_present() {
        eprintln!("SKIP: {}", kshana::lunar_afs::lsis::fetch_hint());
        return;
    }
    let mut rng = ChaCha8Rng::seed_from_u64(0xD6_D3);
    for (sf, data_bits) in [
        (Subframe::Sb2, SB2_DATA_BITS),
        (Subframe::Sb34, SB34_DATA_BITS),
    ] {
        let code = LdpcCode::load(sf).unwrap();
        for _ in 0..50 {
            let info = with_crc(&random_bits(&mut rng, data_bits));
            let cw = code.encode_full(&info).unwrap();
            assert_eq!(code.unsatisfied_checks(&cw), 0, "{sf:?}");
        }
    }
}

/// D4 and D5: a decoder built from the parity-check matrices alone recovers every frame.
#[test]
fn decoder_from_parity_check_matrices_recovers_every_frame() {
    if !kshana::lunar_afs::lsis::cache_present() {
        eprintln!("SKIP: {}", kshana::lunar_afs::lsis::fetch_hint());
        return;
    }
    let mut rng = ChaCha8Rng::seed_from_u64(0xD6_D4);
    // D4, noise-free: 50 + 50 words.
    for (sf, data_bits) in [
        (Subframe::Sb2, SB2_DATA_BITS),
        (Subframe::Sb34, SB34_DATA_BITS),
    ] {
        let code = LdpcCode::load(sf).unwrap();
        for _ in 0..50 {
            let info = with_crc(&random_bits(&mut rng, data_bits));
            let llr: Vec<f64> = code
                .encode(&info)
                .unwrap()
                .iter()
                .map(|&b| 4.0 * level(b))
                .collect();
            let (dec, ok) = code.decode_min_sum(&llr, 50);
            assert!(ok, "{sf:?} noise-free parity");
            assert_eq!(dec, info, "{sf:?} noise-free word");
        }
    }
    // D4, Es/N0 = 3 dB: 20 + 20 words.
    let esn0 = 10f64.powf(0.3);
    let sigma2 = 1.0 / (2.0 * esn0);
    let normal = rand_distr::Normal::new(0.0, sigma2.sqrt()).unwrap();
    for (sf, data_bits) in [
        (Subframe::Sb2, SB2_DATA_BITS),
        (Subframe::Sb34, SB34_DATA_BITS),
    ] {
        let code = LdpcCode::load(sf).unwrap();
        for _ in 0..20 {
            let info = with_crc(&random_bits(&mut rng, data_bits));
            let llr: Vec<f64> = code
                .encode(&info)
                .unwrap()
                .iter()
                .map(|&b| 2.0 * (level(b) + rng.sample(normal)) / sigma2)
                .collect();
            let (dec, ok) = code.decode_min_sum(&llr, 50);
            assert!(ok, "{sf:?} 3 dB parity");
            assert_eq!(dec, info, "{sf:?} 3 dB word");
        }
    }
    // D5: ten full frames.
    let coder = FrameCoder::load().unwrap();
    for i in 0..10u8 {
        let f = FrameData {
            fid: 0,
            toi: (i * 11) % 100,
            sb2: random_bits(&mut rng, SB2_DATA_BITS),
            sb3: random_bits(&mut rng, SB34_DATA_BITS),
            sb4: random_bits(&mut rng, SB34_DATA_BITS),
        };
        let sym = coder.encode(&f).unwrap();
        assert_eq!(sym.len(), 6000);
        assert_eq!(sym[..68], sync_pattern()[..]);
        let soft: Vec<f64> = sym.iter().map(|&b| 4.0 * level(b)).collect();
        let d = coder.decode(&soft, 50).unwrap();
        assert_eq!((d.fid, d.toi), (f.fid, f.toi));
        assert_eq!(d.data, [f.sb2.clone(), f.sb3.clone(), f.sb4.clone()]);
        assert_eq!(d.parity_ok, [true; 3]);
        assert_eq!(d.crc_ok, [true; 3]);
    }
}
