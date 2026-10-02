// SPDX-License-Identifier: AGPL-3.0-only
//! **Augmented Forward Signal spreading codes (LSIS V1.0).**
//!
//! Where the LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 defines a code by an
//! algorithm, the code is computed here; nothing copied from the standard is committed:
//!
//! * the AFS-Q primary codes are generated from the IS-GPS-800 L1C pilot construction with
//!   the IS-GPS-800J Weil and insertion indices ([`super::params`], a US Government source);
//! * the AFS-I Gold codes are generated from the two shift registers; the per-pseudo-random
//!   noise (PRN) G2 delay, which only LSIS defines, is recovered at load time from the
//!   standard's own Annex 3 Gold-code file in the local cache ([`super::lsis`]), and loading
//!   fails unless every chip of every PRN then follows the Gold construction;
//! * the AFS-Q tertiary codes are read from the standard's Annex 3 file in the same cache
//!   (their Weil indices are LSIS-specific); [`weil_tertiary`] generates the same family from
//!   an index, which the data-gated oracle test uses to check that file.
//!
//! Chips are logic levels (`0` or `1`); LSIS-150 maps logic 1 to signal level -1.0 and logic 0
//! to +1.0 ([`chip_level`]).
//!
//! * AFS-I primary (LSIS-221, Appendix C): a 2047-chip Gold code of the preferred pair
//!   `g1(x) = x^11 + x^2 + 1`, `g2(x) = x^11 + x^8 + x^5 + x^2 + 1`, both registers all ones,
//!   the G2 sequence delayed by the PRN's G2 delay, short-cycled to 2046 chips.
//! * AFS-Q primary (LSIS-222, Appendix D): the 10230-chip Weil code built on the length-10223
//!   Legendre sequence with the seven-chip expansion `0110100` inserted, the IS-GPS-800 L1C
//!   pilot construction.
//! * AFS-Q secondary (LSIS-223, Table 10): one of four 4-chip codes.
//! * AFS-Q tertiary (LSIS-224, Appendix E): the length-1499 Weil code with a `0` appended.
//!
//! The tiered pilot code (LSIS 2.3.5.2) is primary xor secondary xor tertiary, one secondary
//! chip per primary period (2 ms) and one tertiary chip per secondary period (8 ms), so the
//! tiered period is 10230 x 4 x 1500 chips, 12 s, one data frame (LSIS-220).
//!
//! Stated assumptions (also pre-registered in `tests/lunar_afs_codes_lsis_reference.rs`):
//! the shift registers follow the IS-GPS-200 convention the standard cites (stage `i` feeds
//! stage `i + 1`, output stage 11, feedback the sum of the stages the polynomial names); the
//! G2 delay `D` gives chip `t = G1(t) xor G2((t - D) mod 2047)`; the length-1499 Legendre
//! sequence of Appendix E, for which no formula is printed, uses the quadratic-residue
//! definition of Appendix D.

use super::lsis;
use super::params::L1CP_WEIL_INSERTION;

/// AFS-I primary code length (chips), LSIS-200 Table 9.
pub const I_PRIMARY_LEN: usize = 2046;
/// AFS-Q primary code length (chips), LSIS-200 Table 9.
pub const Q_PRIMARY_LEN: usize = 10230;
/// AFS-Q secondary code length (chips), LSIS-200 Table 9.
pub const Q_SECONDARY_LEN: usize = 4;
/// AFS-Q tertiary code length (chips), LSIS-200 Table 9.
pub const Q_TERTIARY_LEN: usize = 1500;
/// Length of the Legendre sequence the AFS-Q primary Weil codes are built on (Appendix D).
pub const Q_PRIMARY_LEGENDRE_LEN: usize = 10223;
/// Length of the Legendre sequence the AFS-Q tertiary Weil codes are built on (Appendix E).
pub const Q_TERTIARY_LEGENDRE_LEN: usize = 1499;
/// Highest PRN the standard defines codes for.
pub const MAX_PRN: u16 = 210;
/// The seven-chip expansion sequence inserted into every AFS-Q primary Weil code.
pub const Q_EXPANSION: [u8; 7] = [0, 1, 1, 0, 1, 0, 0];
/// The four AFS-Q secondary codes S0 to S3 of LSIS-223 Table 10, first chip first.
pub const Q_SECONDARY_CODES: [[u8; 4]; 4] =
    [[1, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1], [1, 1, 0, 1]];

/// The signal level of a logic chip (LSIS-150 Table 8): logic 1 is -1.0, logic 0 is +1.0.
#[inline]
pub fn chip_level(bit: u8) -> f64 {
    if bit & 1 == 1 {
        -1.0
    } else {
        1.0
    }
}

fn check_prn(prn: u16) -> Result<usize, String> {
    if (1..=MAX_PRN).contains(&prn) {
        Ok((prn - 1) as usize)
    } else {
        Err(format!("AFS PRN {prn} is outside 1..={MAX_PRN}"))
    }
}

/// One full period (2047 chips) of an 11-stage maximal-length register started from all ones.
/// `taps` are the stages (1-based) the polynomial names; the output is stage 11.
fn m_sequence_11(taps: &[usize]) -> Vec<u8> {
    // reg[0] is stage 1, reg[10] stage 11.
    let mut reg = [1u8; 11];
    let mut out = Vec::with_capacity(2047);
    for _ in 0..2047 {
        out.push(reg[10]);
        let fb = taps.iter().fold(0u8, |acc, &s| acc ^ reg[s - 1]);
        for i in (1..11).rev() {
            reg[i] = reg[i - 1];
        }
        reg[0] = fb;
    }
    out
}

/// The G1 sequence of Figure C-1, `g1(x) = x^11 + x^2 + 1`.
pub fn g1_sequence() -> Vec<u8> {
    m_sequence_11(&[2, 11])
}

/// The G2 sequence of Figure C-1, `g2(x) = x^11 + x^8 + x^5 + x^2 + 1`.
pub fn g2_sequence() -> Vec<u8> {
    m_sequence_11(&[2, 5, 8, 11])
}

/// The AFS-I primary code with G2 delay `d`: 2046 logic chips (LSIS-221), chip `t` equal to
/// `G1(t) xor G2((t - d) mod 2047)`, both registers restarted every 2046 chips.
pub fn afs_i_from_delay(d: usize) -> Vec<u8> {
    let g1 = g1_sequence();
    let g2 = g2_sequence();
    (0..I_PRIMARY_LEN)
        .map(|t| g1[t] ^ g2[(t + 2047 - d % 2047) % 2047])
        .collect()
}

/// The G2 register content at chip 0 for delay `d` (an 11-bit value, stage 11 the most
/// significant bit, the convention of LSIS Tables C-1 to C-5): the next 11 delayed G2 chips.
pub fn g2_initial_state(d: usize) -> u16 {
    let g2 = g2_sequence();
    (0..11).fold(0u16, |acc, t| {
        (acc << 1) | g2[(t + 2047 - d % 2047) % 2047] as u16
    })
}

/// The G2 delay that makes `code` (2046 chips) a Gold code of the AFS-I pair, if any: the
/// unique `d` with `code[t] xor G1(t) = G2((t - d) mod 2047)` for every `t`.
pub fn g2_delay_of(code: &[u8]) -> Option<usize> {
    if code.len() != I_PRIMARY_LEN {
        return None;
    }
    let g1 = g1_sequence();
    let g2 = g2_sequence();
    (0..2047).find(|&d| (0..I_PRIMARY_LEN).all(|t| code[t] ^ g1[t] == g2[(t + 2047 - d) % 2047]))
}

/// The Legendre sequence of odd prime length `n`: `L(0) = 0`, `L(t) = 1` when `t` is a
/// non-zero quadratic residue modulo `n` (Appendix D; assumed for Appendix E).
pub fn legendre_sequence(n: usize) -> Vec<u8> {
    let mut l = vec![0u8; n];
    for x in 1..n {
        l[(x * x) % n] = 1;
    }
    l
}

/// The Weil code `W(t; k) = L(t) xor L((t + k) mod n)` over a Legendre sequence `l`.
fn weil(l: &[u8], k: usize) -> Vec<u8> {
    let n = l.len();
    (0..n).map(|t| l[t] ^ l[(t + k) % n]).collect()
}

/// The AFS-Q primary code of `prn`: 10230 logic chips (LSIS-222, Appendix D), the IS-GPS-800
/// L1C pilot construction with the IS-GPS-800J indices.
pub fn afs_q_primary(prn: u16) -> Result<Vec<u8>, String> {
    let (w, p) = L1CP_WEIL_INSERTION[check_prn(prn)?];
    let w = weil(&legendre_sequence(Q_PRIMARY_LEGENDRE_LEN), w as usize);
    let p = p as usize;
    if !(1..=Q_PRIMARY_LEGENDRE_LEN).contains(&p) {
        return Err(format!("insertion index {p} outside 1..=10223"));
    }
    // Chips 0..p-2 are W(0..p-2); the expansion fills p-1..p+5; then W(t-7).
    let mut code = Vec::with_capacity(Q_PRIMARY_LEN);
    code.extend_from_slice(&w[..p - 1]);
    code.extend_from_slice(&Q_EXPANSION);
    code.extend_from_slice(&w[p - 1..]);
    debug_assert_eq!(code.len(), Q_PRIMARY_LEN);
    Ok(code)
}

/// A 1500-chip tertiary code of the LSIS-224 family: the length-1499 Weil code of index `k`
/// with a `0` appended (Appendix E).
pub fn weil_tertiary(k: usize) -> Vec<u8> {
    let mut code = weil(&legendre_sequence(Q_TERTIARY_LEGENDRE_LEN), k);
    code.push(0);
    code
}

/// The LSIS-only code data, loaded from the verified local cache ([`super::lsis`]).
#[derive(Clone, Debug)]
pub struct LsisCodes {
    /// AFS-I G2 delay of PRNs 1-210, recovered from the Annex 3 Gold-code file.
    pub g2_delay: Vec<u16>,
    /// AFS-Q tertiary codes of PRNs 1-210, from the Annex 3 tertiary file.
    pub tertiary: Vec<Vec<u8>>,
}

impl LsisCodes {
    /// Load and check: every Annex 3 AFS-I code must be a Gold code of the stated pair.
    pub fn load() -> Result<Self, String> {
        let gold = lsis::annex3_hex_lines(
            &lsis::read_verified_text("006_GoldCode2046hex210prns.txt")?,
            500,
        );
        let ter = lsis::annex3_hex_lines(
            &lsis::read_verified_text("008_Weil1500hex210prns.txt")?,
            370,
        );
        if gold.len() != 210 || ter.len() != 210 {
            return Err(format!(
                "Annex 3 files hold {} and {} codes, 210 expected",
                gold.len(),
                ter.len()
            ));
        }
        let mut g2_delay = Vec::with_capacity(210);
        for (i, h) in gold.iter().enumerate() {
            let code = lsis::hex_bits_last(h, I_PRIMARY_LEN);
            let d = g2_delay_of(&code).ok_or_else(|| {
                format!(
                    "Annex 3 AFS-I PRN {} is not a Gold code of g1, g2 (LSIS Figure C-1)",
                    i + 1
                )
            })?;
            g2_delay.push(d as u16);
        }
        let tertiary = ter
            .iter()
            .map(|h| lsis::hex_bits_last(h, Q_TERTIARY_LEN))
            .collect();
        Ok(LsisCodes { g2_delay, tertiary })
    }

    /// The AFS-I primary code of `prn`.
    pub fn afs_i_primary(&self, prn: u16) -> Result<Vec<u8>, String> {
        Ok(afs_i_from_delay(self.g2_delay[check_prn(prn)?] as usize))
    }

    /// The AFS-Q tertiary code of `prn`.
    pub fn afs_q_tertiary(&self, prn: u16) -> Result<Vec<u8>, String> {
        Ok(self.tertiary[check_prn(prn)?].clone())
    }
}

/// A secondary code identifier S0 to S3 (LSIS-223 Table 10).
pub fn afs_q_secondary(id: u8) -> Result<[u8; 4], String> {
    Q_SECONDARY_CODES
        .get(id as usize)
        .copied()
        .ok_or_else(|| format!("secondary code S{id} does not exist (S0 to S3)"))
}

/// The code combination of one LunaNet service provider (LNSP) node (LSIS-260).
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub struct NodeCodes {
    /// LNSP node identifier.
    pub node_id: u16,
    /// AFS-I primary PRN.
    pub i_prn: u16,
    /// AFS-Q primary PRN.
    pub q_prn: u16,
    /// AFS-Q secondary code identifier (0 to 3 for S0 to S3).
    pub secondary: u8,
    /// AFS-Q tertiary PRN.
    pub tertiary_prn: u16,
    /// Tertiary phase offset in tertiary chips.
    pub tertiary_phase: u16,
}

impl NodeCodes {
    /// The interim test-and-integration assignment of LSIS Table 11 (node identifiers 1 to
    /// 12): every PRN equal to the node identifier, secondary `S((id - 1) mod 4)`, phase 0.
    /// The standard marks the final assignment {LSIS-TBD-2001}.
    pub fn interim(node_id: u16) -> Result<Self, String> {
        if !(1..=12).contains(&node_id) {
            return Err(format!(
                "LSIS V1.0 Table 11 assigns codes to node identifiers 1 to 12 only, not {node_id}"
            ));
        }
        Ok(NodeCodes {
            node_id,
            i_prn: node_id,
            q_prn: node_id,
            secondary: ((node_id - 1) % 4) as u8,
            tertiary_prn: node_id,
            tertiary_phase: 0,
        })
    }
}

/// The generated chips of one node, ready for waveform synthesis.
#[derive(Clone, Debug)]
pub struct NodeChips {
    /// The node's code assignment.
    pub codes: NodeCodes,
    /// AFS-I primary chips.
    pub i_primary: Vec<u8>,
    /// AFS-Q primary chips.
    pub q_primary: Vec<u8>,
    /// AFS-Q secondary chips.
    pub q_secondary: [u8; 4],
    /// AFS-Q tertiary chips.
    pub q_tertiary: Vec<u8>,
}

impl NodeChips {
    /// Generate every code of `codes`.
    pub fn new(codes: NodeCodes, lsis: &LsisCodes) -> Result<Self, String> {
        Ok(NodeChips {
            codes,
            i_primary: lsis.afs_i_primary(codes.i_prn)?,
            q_primary: afs_q_primary(codes.q_prn)?,
            q_secondary: afs_q_secondary(codes.secondary)?,
            q_tertiary: lsis.afs_q_tertiary(codes.tertiary_prn)?,
        })
    }

    /// Chip `n` (counted from the start of a frame, `0 <= n < 10230 x 4 x 1500`) of the tiered
    /// AFS-Q code `Cp xor Cs xor Ct` (LSIS 2.3.5.2).
    #[inline]
    pub fn q_tiered_chip(&self, n: u64) -> u8 {
        let p = (n % Q_PRIMARY_LEN as u64) as usize;
        let epoch = n / Q_PRIMARY_LEN as u64;
        let s = (epoch % Q_SECONDARY_LEN as u64) as usize;
        let t = ((epoch / Q_SECONDARY_LEN as u64 + self.codes.tertiary_phase as u64)
            % Q_TERTIARY_LEN as u64) as usize;
        self.q_primary[p] ^ self.q_secondary[s] ^ self.q_tertiary[t]
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Internal: both registers are maximal length (period 2047, 1024 ones).
    #[test]
    fn g1_and_g2_are_maximal_length_sequences() {
        for s in [g1_sequence(), g2_sequence()] {
            assert_eq!(s.iter().filter(|&&b| b == 1).count(), 1024);
        }
    }

    /// Internal: the Legendre sequences are balanced as quadratic residues are, every code
    /// has its stated length, and a G2 delay round-trips through the Gold construction.
    #[test]
    fn code_lengths_legendre_balance_and_delay_round_trip() {
        let l = legendre_sequence(Q_PRIMARY_LEGENDRE_LEN);
        assert_eq!(l.iter().filter(|&&b| b == 1).count(), 5111);
        let l = legendre_sequence(Q_TERTIARY_LEGENDRE_LEN);
        assert_eq!(l.iter().filter(|&&b| b == 1).count(), 749);
        for prn in [1, 105, 210] {
            assert_eq!(afs_q_primary(prn).unwrap().len(), Q_PRIMARY_LEN);
        }
        assert_eq!(weil_tertiary(1).len(), Q_TERTIARY_LEN);
        assert!(afs_q_primary(0).is_err() && afs_q_primary(211).is_err());
        for d in [0usize, 1, 170, 1845, 2046] {
            assert_eq!(g2_delay_of(&afs_i_from_delay(d)), Some(d));
        }
        let mut c = afs_i_from_delay(170);
        c[100] ^= 1;
        assert_eq!(g2_delay_of(&c), None);
    }

    /// Internal: the tiered chip is the xor of its three tiers at the right epochs.
    #[test]
    fn tiered_chip_combines_the_three_tiers() {
        let lsis = LsisCodes {
            g2_delay: (0..210).map(|i| i as u16).collect(),
            tertiary: (1..=210).map(weil_tertiary).collect(),
        };
        let c = NodeChips::new(NodeCodes::interim(3).unwrap(), &lsis).unwrap();
        assert_eq!(c.codes.secondary, 2);
        for n in [0u64, 10229, 10230, 40919, 40920, 61_379_999] {
            let p = (n % 10230) as usize;
            let s = ((n / 10230) % 4) as usize;
            let t = ((n / 40920) % 1500) as usize;
            assert_eq!(
                c.q_tiered_chip(n),
                c.q_primary[p] ^ c.q_secondary[s] ^ c.q_tertiary[t]
            );
        }
        assert!(NodeCodes::interim(13).is_err());
    }
}
