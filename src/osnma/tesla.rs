// SPDX-License-Identifier: AGPL-3.0-only
//! TESLA key chain (ICD 5.5 and 6.4, Eqs. 16 to 19): the one-way function and the
//! verification of a received key against a trusted earlier key of the same chain.

use super::tables::HashFn;
use sha2::{Digest, Sha256};

pub const SUBFRAME_S: u32 = 30;
/// Most one-way steps a single verification may take: bounds the work a forged, far
/// future key can cause. A week of sub-frames is 20160.
pub const MAX_STEPS: u32 = 100_000;

/// Why a TESLA key did not verify.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum KeyError {
    /// The chain's hash function is not available in this build.
    UnsupportedHash,
    /// The key is not later than the trusted key, or the times are not sub-frame aligned.
    BadTiming,
    /// Applying the one-way function did not lead to the trusted key.
    ChainMismatch,
    /// The key length does not match the chain's key size.
    BadLength,
}

fn digest(hf: HashFn, data: &[u8]) -> Result<Vec<u8>, KeyError> {
    match hf {
        HashFn::Sha256 => Ok(Sha256::digest(data).to_vec()),
        HashFn::Sha3_256 => Err(KeyError::UnsupportedHash),
    }
}

/// One step of the chain: `F(K) = trunc(lk, hash(K || GST || alpha))`, where `gst` is
/// the time in GST seconds of the sub-frame that carries the *derived* key; it is
/// packed into the 32-bit message form here.
pub fn step(
    hf: HashFn,
    key: &[u8],
    gst: u32,
    alpha: &[u8; 6],
    key_bits: usize,
) -> Result<Vec<u8>, KeyError> {
    let mut m = Vec::with_capacity(key.len() + 10);
    m.extend_from_slice(key);
    m.extend_from_slice(&super::gst_pack(gst).to_be_bytes());
    m.extend_from_slice(alpha);
    let mut out = digest(hf, &m)?;
    out.truncate(key_bits / 8);
    Ok(out)
}

/// Verify `key`, broadcast in the sub-frame starting at `key_gst`, against `trusted`,
/// a key of the same chain that was authenticated for the sub-frame at `trusted_gst`
/// (for the chain root this is `GST_0 - 30`). Applies `(key_gst - trusted_gst) / 30`
/// steps, each stamped with the time of the key it produces.
pub fn verify_key(
    hf: HashFn,
    key: &[u8],
    key_gst: u32,
    trusted: &[u8],
    trusted_gst: u32,
    alpha: &[u8; 6],
) -> Result<(), KeyError> {
    let key_bits = trusted.len() * 8;
    if key.len() != trusted.len() {
        return Err(KeyError::BadLength);
    }
    let span = key_gst
        .checked_sub(trusted_gst)
        .ok_or(KeyError::BadTiming)?;
    if span == 0 || span % SUBFRAME_S != 0 || span / SUBFRAME_S > MAX_STEPS {
        return Err(KeyError::BadTiming);
    }
    let mut cur = key.to_vec();
    let mut gst = key_gst;
    while gst > trusted_gst {
        gst -= SUBFRAME_S;
        cur = step(hf, &cur, gst, alpha, key_bits)?;
    }
    if cur == trusted {
        Ok(())
    } else {
        Err(KeyError::ChainMismatch)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Generate the chain forward from a seed, the way a provider would.
    fn chain(n: u32, gst0: u32, alpha: &[u8; 6], bits: usize) -> Vec<Vec<u8>> {
        // The seed is the last key; walk toward the root.
        let seed: Vec<u8> = (0..bits / 8).map(|i| (i * 31 + 7) as u8).collect();
        let mut seq = vec![seed];
        for i in (0..n).rev() {
            let gst = gst0 + 30 * i - 30;
            let next = step(HashFn::Sha256, seq.last().unwrap(), gst, alpha, bits).unwrap();
            seq.push(next);
        }
        seq.reverse(); // seq[0] = K0 (root) .. seq[n] = seed
        seq
    }

    const ALPHA: [u8; 6] = [0xA1, 0xB2, 0xC3, 0xD4, 0xE5, 0xF6];
    const GST0: u32 = 1248 * crate::osnma::WEEK_S + 345_600;

    #[test]
    fn chain_keys_verify_back_to_root_and_to_each_other() {
        for bits in [96, 128, 256] {
            let c = chain(40, GST0, &ALPHA, bits);
            let root_gst = GST0 - 30;
            for i in [1usize, 2, 17, 40] {
                let kgst = GST0 + 30 * (i as u32 - 1);
                assert_eq!(
                    verify_key(HashFn::Sha256, &c[i], kgst, &c[0], root_gst, &ALPHA),
                    Ok(()),
                    "bits {bits} i {i}"
                );
            }
            // Against an earlier authenticated key rather than the root.
            assert_eq!(
                verify_key(
                    HashFn::Sha256,
                    &c[30],
                    GST0 + 30 * 29,
                    &c[12],
                    GST0 + 30 * 11,
                    &ALPHA
                ),
                Ok(())
            );
        }
    }

    #[test]
    fn corrupted_or_misused_keys_are_rejected() {
        let c = chain(10, GST0, &ALPHA, 128);
        let root_gst = GST0 - 30;
        let kgst = GST0 + 30 * 4;
        let ok =
            |k: &[u8], t: u32, a: &[u8; 6]| verify_key(HashFn::Sha256, k, t, &c[0], root_gst, a);
        assert_eq!(ok(&c[5], kgst, &ALPHA), Ok(()));
        let mut bad = c[5].clone();
        bad[0] ^= 1;
        assert_eq!(ok(&bad, kgst, &ALPHA), Err(KeyError::ChainMismatch));
        assert_eq!(ok(&c[5], kgst + 30, &ALPHA), Err(KeyError::ChainMismatch)); // wrong time
        let mut a = ALPHA;
        a[5] ^= 1;
        assert_eq!(ok(&c[5], kgst, &a), Err(KeyError::ChainMismatch)); // wrong pattern
        assert_eq!(ok(&c[5], kgst + 1, &ALPHA), Err(KeyError::BadTiming));
        assert_eq!(ok(&c[5], root_gst, &ALPHA), Err(KeyError::BadTiming));
        assert_eq!(ok(&c[5][..15], kgst, &ALPHA), Err(KeyError::BadLength));
        assert_eq!(
            verify_key(HashFn::Sha3_256, &c[5], kgst, &c[0], root_gst, &ALPHA),
            Err(KeyError::UnsupportedHash)
        );
    }
}
