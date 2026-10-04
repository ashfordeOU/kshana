// SPDX-License-Identifier: AGPL-3.0-only
//! A small, portable, non-cryptographic pseudo-random generator for the IQ
//! simulation layer.
//!
//! The channel models need reproducible simulation noise that is bit-identical
//! on every target, not cryptographic randomness. This is the SplitMix64
//! generator (Steele, Lea and Flood, OOPSLA 2014 — the algorithm behind Java's
//! `SplittableRandom`): a fixed-increment Weyl sequence through a fixed
//! finalising mix, written here as exact 64-bit wrapping arithmetic so the
//! stream depends on neither the host nor a dependency's internal choices. It
//! implements [`rand::RngCore`], so the `rand_distr` distributions draw from it
//! unchanged. It is deliberately not a cryptographic generator and must not be
//! used where unpredictability matters.

use rand::RngCore;

/// A deterministic, portable, non-cryptographic PRNG (SplitMix64).
#[derive(Clone, Debug)]
pub(crate) struct SimRng {
    state: u64,
}

impl SimRng {
    /// A generator seeded with `seed`.
    pub(crate) fn seed(seed: u64) -> Self {
        Self { state: seed }
    }
}

impl RngCore for SimRng {
    fn next_u64(&mut self) -> u64 {
        self.state = self.state.wrapping_add(0x9E37_79B9_7F4A_7C15);
        let mut z = self.state;
        z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
        z ^ (z >> 31)
    }

    fn next_u32(&mut self) -> u32 {
        (self.next_u64() >> 32) as u32
    }

    fn fill_bytes(&mut self, dest: &mut [u8]) {
        let mut i = 0;
        while i < dest.len() {
            let bytes = self.next_u64().to_le_bytes();
            let n = (dest.len() - i).min(8);
            dest[i..i + n].copy_from_slice(&bytes[..n]);
            i += n;
        }
    }

    fn try_fill_bytes(&mut self, dest: &mut [u8]) -> Result<(), rand::Error> {
        self.fill_bytes(dest);
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn deterministic_and_seed_sensitive() {
        let a: Vec<u64> = (0..4)
            .scan(SimRng::seed(1), |r, _| Some(r.next_u64()))
            .collect();
        let b: Vec<u64> = (0..4)
            .scan(SimRng::seed(1), |r, _| Some(r.next_u64()))
            .collect();
        let c: Vec<u64> = (0..4)
            .scan(SimRng::seed(2), |r, _| Some(r.next_u64()))
            .collect();
        assert_eq!(a, b);
        assert_ne!(a, c);
    }

    #[test]
    fn first_value_matches_the_reference_splitmix64() {
        // SplitMix64 from state 0: first output is the published constant.
        assert_eq!(SimRng::seed(0).next_u64(), 0xE220_A839_7B1D_CDAF);
    }
}
