// SPDX-License-Identifier: AGPL-3.0-only
//! Channel coding shared by GPS CNAV and Galileo I/NAV and F/NAV.
//!
//! * CRC-24Q: generator `g(X) = X^24 + X^23 + X^18 + X^17 + X^14 + X^11 + X^10 + X^7 + X^6 +
//!   X^5 + X^4 + X^3 + X + 1` (`0x1864CFB`), zero initial value, no reflection, no final XOR
//!   (IS-GPS-200 section 30.3.5, Galileo OS SIS ICD section 4.1.2), over a bit sequence most
//!   significant first.
//! * Convolutional code: rate 1/2, constraint length 7, generators `G1 = 171` and `G2 = 133`
//!   (octal), the most significant generator bit multiplying the current input bit, so the
//!   impulse response read in time is the generator's binary digits from the most significant.
//!   The `G1` symbol is sent first. Galileo inverts the `G2` output (the Galileo OS SIS ICD
//!   coding scheme figure); GPS does not.
//! * Block interleaver: symbols written column by column into a matrix of `rows` rows and
//!   `cols` columns and read row by row (Galileo: I/NAV 30 columns x 8 rows, F/NAV 61 x 8).
//!
//! [`viterbi`] is a hard-decision maximum-likelihood decoder for the same code. It exists to
//! check the encoder (encode, decode, compare); it is not a receiver model.

/// The CRC-24Q generator without its `X^24` term.
pub const CRC24Q_POLY: u32 = 0x86_4CFB;
/// Generator `G1`, octal 171.
pub const G1: u8 = 0o171;
/// Generator `G2`, octal 133.
pub const G2: u8 = 0o133;

/// CRC-24Q of a bit sequence (`0`/`1` per element), most significant bit first.
pub fn crc24q(bits: &[u8]) -> u32 {
    let mut crc = 0u32;
    for &b in bits {
        let fb = ((crc >> 23) & 1) ^ u32::from(b & 1);
        crc = (crc << 1) & 0x00FF_FFFF;
        if fb == 1 {
            crc ^= CRC24Q_POLY;
        }
    }
    crc
}

fn parity7(x: u8) -> u8 {
    (x.count_ones() & 1) as u8
}

/// The two output symbols for input `bit` with encoder `state` (the previous six inputs, most
/// recent in bit 5), and the next state.
#[inline]
fn step(state: u8, bit: u8, invert_g2: bool) -> (u8, u8, u8) {
    let reg = ((bit & 1) << 6) | (state & 0x3F);
    let c1 = parity7(reg & G1);
    let c2 = parity7(reg & G2) ^ u8::from(invert_g2);
    (c1, c2, reg >> 1)
}

/// Encode `bits` from encoder `state` (updated in place), giving two symbols per bit, `G1`
/// first; `invert_g2` inverts the second symbol (Galileo).
pub fn conv_encode(bits: &[u8], state: &mut u8, invert_g2: bool) -> Vec<u8> {
    let mut out = Vec::with_capacity(2 * bits.len());
    for &b in bits {
        let (c1, c2, next) = step(*state, b, invert_g2);
        out.push(c1);
        out.push(c2);
        *state = next;
    }
    out
}

/// Hard-decision Viterbi decoding of `symbols` (pairs, `G1` first) starting from encoder
/// state `start`. With `end = Some(s)` the path must end in state `s` (a terminated block);
/// otherwise the best end state is taken. Returns the decoded bits and the path's Hamming
/// distance from the received symbols.
pub fn viterbi(symbols: &[u8], start: u8, end: Option<u8>, invert_g2: bool) -> (Vec<u8>, u32) {
    const INF: u32 = u32::MAX / 2;
    let n = symbols.len() / 2;
    let mut metric = [INF; 64];
    metric[(start & 0x3F) as usize] = 0;
    // For each step and next state, the predecessor state and input bit.
    let mut back: Vec<[(u8, u8); 64]> = Vec::with_capacity(n);
    for k in 0..n {
        let (r1, r2) = (symbols[2 * k] & 1, symbols[2 * k + 1] & 1);
        let mut next = [INF; 64];
        let mut from = [(0u8, 0u8); 64];
        for s in 0..64u8 {
            let m = metric[s as usize];
            if m >= INF {
                continue;
            }
            for b in 0..2u8 {
                let (c1, c2, ns) = step(s, b, invert_g2);
                let d = m + u32::from(c1 ^ r1) + u32::from(c2 ^ r2);
                if d < next[ns as usize] {
                    next[ns as usize] = d;
                    from[ns as usize] = (s, b);
                }
            }
        }
        metric = next;
        back.push(from);
    }
    let last = match end {
        Some(s) => s & 0x3F,
        None => (0..64u8).min_by_key(|&s| metric[s as usize]).unwrap_or(0),
    };
    let dist = metric[last as usize];
    let mut bits = vec![0u8; n];
    let mut s = last;
    for k in (0..n).rev() {
        let (p, b) = back[k][s as usize];
        bits[k] = b;
        s = p;
    }
    (bits, dist)
}

/// Block interleave: symbol `k` of the input goes to row `k % rows`, column `k / rows`, and
/// the matrix is read row by row.
pub fn interleave(symbols: &[u8], cols: usize, rows: usize) -> Vec<u8> {
    assert_eq!(symbols.len(), cols * rows, "interleaver block size");
    let mut out = vec![0u8; symbols.len()];
    for r in 0..rows {
        for c in 0..cols {
            out[r * cols + c] = symbols[c * rows + r];
        }
    }
    out
}

/// Undo [`interleave`].
pub fn deinterleave(symbols: &[u8], cols: usize, rows: usize) -> Vec<u8> {
    assert_eq!(symbols.len(), cols * rows, "interleaver block size");
    let mut out = vec![0u8; symbols.len()];
    for r in 0..rows {
        for c in 0..cols {
            out[c * rows + r] = symbols[r * cols + c];
        }
    }
    out
}

/// Bits of a string of `0` and `1` characters (for sync patterns and test vectors).
pub fn bits_of(s: &str) -> Vec<u8> {
    s.bytes()
        .filter(|b| *b == b'0' || *b == b'1')
        .map(|b| b - b'0')
        .collect()
}

/// Bits of bytes, most significant first.
pub fn bits_of_bytes(data: &[u8]) -> Vec<u8> {
    data.iter()
        .flat_map(|b| (0..8).rev().map(move |k| (b >> k) & 1))
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn crc24q_check_value_and_agreement_with_the_byte_implementation() {
        // Check value of the CRC RevEng catalogue entry CRC-24/LTE-A, the same parameters as
        // CRC-24Q: "123456789" -> 0xCDE703.
        assert_eq!(crc24q(&bits_of_bytes(b"123456789")), 0xCD_E703);
        let data: Vec<u8> = (0u8..=200).map(|i| i.wrapping_mul(37) ^ 0x5A).collect();
        assert_eq!(
            crc24q(&bits_of_bytes(&data)),
            crate::leo_navmsg::codec::crc24q(&data)
        );
    }

    #[test]
    fn impulse_response_is_the_generators() {
        let mut s = 0u8;
        let out = conv_encode(&[1, 0, 0, 0, 0, 0, 0], &mut s, false);
        let g1: Vec<u8> = out.iter().step_by(2).copied().collect();
        let g2: Vec<u8> = out.iter().skip(1).step_by(2).copied().collect();
        assert_eq!(g1, bits_of("1111001")); // 171 octal
        assert_eq!(g2, bits_of("1011011")); // 133 octal
        assert_eq!(s, 0);
    }

    #[test]
    fn all_zeros_encode_to_zeros_or_alternating_with_inverted_g2() {
        let mut s = 0;
        assert!(conv_encode(&[0; 40], &mut s, false).iter().all(|&c| c == 0));
        let g = conv_encode(&[0; 40], &mut s, true);
        assert!(g.chunks(2).all(|p| p == [0, 1]));
    }

    #[test]
    fn viterbi_inverts_the_encoder_and_corrects_errors() {
        let bits: Vec<u8> = (0..200u32)
            .map(|i| ((i * 7 + i / 3) % 5 % 2) as u8)
            .collect();
        for inv in [false, true] {
            let mut s = 0x2A;
            let mut sym = conv_encode(&bits, &mut s, inv);
            let (dec, d) = viterbi(&sym, 0x2A, Some(s), inv);
            assert_eq!((dec.as_slice(), d), (bits.as_slice(), 0));
            for k in [3usize, 60, 150, 290] {
                sym[k] ^= 1;
            }
            let (dec, d) = viterbi(&sym, 0x2A, None, inv);
            assert_eq!(dec, bits);
            assert_eq!(d, 4);
        }
    }

    #[test]
    fn interleaver_round_trip_and_position() {
        let x: Vec<u8> = (0..240).map(|i| (i % 251) as u8).collect();
        let y = interleave(&x, 30, 8);
        // Second transmitted symbol is the ninth encoded one (row 0, column 1).
        assert_eq!(y[1], x[8]);
        assert_eq!(y[30], x[1]);
        assert_eq!(deinterleave(&y, 30, 8), x);
    }
}
