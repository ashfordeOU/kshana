// SPDX-License-Identifier: AGPL-3.0-only
//! MAC functions of the chain (ICD Table 9). HMAC-SHA-256 follows RFC 2104 / FIPS 198-1
//! over the `sha2` crate; CMAC-AES is not yet available in this build.

use super::tables::MacFn;
use sha2::{Digest, Sha256};

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MacError {
    Unsupported,
}

/// Compute the full-length MAC of `msg` under `key`.
pub fn compute(mf: MacFn, key: &[u8], msg: &[u8]) -> Result<Vec<u8>, MacError> {
    match mf {
        MacFn::HmacSha256 => Ok(hmac_sha256(key, msg).to_vec()),
        MacFn::CmacAes => Err(MacError::Unsupported),
    }
}

fn hmac_sha256(key: &[u8], msg: &[u8]) -> [u8; 32] {
    const BLOCK: usize = 64;
    let mut k = [0u8; BLOCK];
    if key.len() > BLOCK {
        k[..32].copy_from_slice(&Sha256::digest(key));
    } else {
        k[..key.len()].copy_from_slice(key);
    }
    let mut inner = Sha256::new();
    inner.update(k.map(|b| b ^ 0x36));
    inner.update(msg);
    let mut outer = Sha256::new();
    outer.update(k.map(|b| b ^ 0x5C));
    outer.update(inner.finalize());
    outer.finalize().into()
}

/// The `bits` most significant bits of `mac`, left-aligned (the rest zero), as bytes.
pub fn truncate(mac: &[u8], bits: usize) -> Vec<u8> {
    let mut out = mac[..bits.div_ceil(8).min(mac.len())].to_vec();
    if bits % 8 != 0 {
        if let Some(last) = out.last_mut() {
            *last &= 0xFF << (8 - bits % 8);
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    // Test cases 1, 2 and 6 of RFC 4231 (HMAC-SHA-256).
    #[test]
    fn rfc4231_known_answers() {
        let hex_of = |b: [u8; 32]| hex::encode(b);
        assert_eq!(
            hex_of(hmac_sha256(&[0x0b; 20], b"Hi There")),
            "b0344c61d8db38535ca8afceaf0bf12b881dc200c9833da726e9376c2e32cff7"
        );
        assert_eq!(
            hex_of(hmac_sha256(b"Jefe", b"what do ya want for nothing?")),
            "5bdcc146bf60754e6a042426089575c75a003f089d2739839dec58b964ec3843"
        );
        assert_eq!(
            hex_of(hmac_sha256(
                &[0xaa; 131],
                b"Test Using Larger Than Block-Size Key - Hash Key First"
            )),
            "60e431591ee0b67f0d8a26aacbf5b77f8e0bc6213728c5140546040f0ee37f54"
        );
    }

    #[test]
    fn truncation_keeps_the_leading_bits() {
        let m = [0xAB, 0xCD, 0xEF];
        assert_eq!(truncate(&m, 12), vec![0xAB, 0xC0]);
        assert_eq!(truncate(&m, 24), vec![0xAB, 0xCD, 0xEF]);
        assert_eq!(truncate(&m, 20), vec![0xAB, 0xCD, 0xE0]);
    }

    #[test]
    fn cmac_is_reported_unsupported() {
        assert_eq!(
            compute(MacFn::CmacAes, &[0; 16], b"x"),
            Err(MacError::Unsupported)
        );
    }
}
