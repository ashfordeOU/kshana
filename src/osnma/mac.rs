// SPDX-License-Identifier: AGPL-3.0-only
//! MAC functions of the chain (ICD Table 9): HMAC-SHA-256 (FIPS 198-1) and CMAC-AES
//! (NIST SP 800-38B), from the RustCrypto crates.

use super::tables::MacFn;
use aes::{Aes128, Aes192, Aes256};
use cmac::Cmac;
use hmac::{Hmac, Mac};
use sha2::Sha256;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MacError {
    /// The key length does not suit the MAC function (CMAC-AES takes 128, 192 or 256 bits).
    BadKey,
}

/// Compute the full-length MAC of `msg` under `key`.
pub fn compute(mf: MacFn, key: &[u8], msg: &[u8]) -> Result<Vec<u8>, MacError> {
    fn run<M: Mac>(mut m: M, msg: &[u8]) -> Vec<u8> {
        m.update(msg);
        m.finalize().into_bytes().to_vec()
    }
    match mf {
        MacFn::HmacSha256 => {
            let m = Hmac::<Sha256>::new_from_slice(key).map_err(|_| MacError::BadKey)?;
            Ok(run(m, msg))
        }
        MacFn::CmacAes => match key.len() {
            16 => Ok(run(
                Cmac::<Aes128>::new_from_slice(key).map_err(|_| MacError::BadKey)?,
                msg,
            )),
            24 => Ok(run(
                Cmac::<Aes192>::new_from_slice(key).map_err(|_| MacError::BadKey)?,
                msg,
            )),
            32 => Ok(run(
                Cmac::<Aes256>::new_from_slice(key).map_err(|_| MacError::BadKey)?,
                msg,
            )),
            _ => Err(MacError::BadKey),
        },
    }
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

    fn h(m: MacFn, key: &[u8], msg: &[u8]) -> String {
        hex::encode(compute(m, key, msg).unwrap())
    }

    // Test cases 1, 2 and 6 of RFC 4231 (HMAC-SHA-256).
    #[test]
    fn rfc4231_known_answers() {
        let f = MacFn::HmacSha256;
        assert_eq!(
            h(f, &[0x0b; 20], b"Hi There"),
            "b0344c61d8db38535ca8afceaf0bf12b881dc200c9833da726e9376c2e32cff7"
        );
        assert_eq!(
            h(f, b"Jefe", b"what do ya want for nothing?"),
            "5bdcc146bf60754e6a042426089575c75a003f089d2739839dec58b964ec3843"
        );
        assert_eq!(
            h(
                f,
                &[0xaa; 131],
                b"Test Using Larger Than Block-Size Key - Hash Key First"
            ),
            "60e431591ee0b67f0d8a26aacbf5b77f8e0bc6213728c5140546040f0ee37f54"
        );
    }

    // Example 1 to 4 of RFC 4493 (AES-128 CMAC).
    #[test]
    fn rfc4493_known_answers() {
        let key = hex::decode("2b7e151628aed2a6abf7158809cf4f3c").unwrap();
        let msg = hex::decode(
            "6bc1bee22e409f96e93d7e117393172aae2d8a571e03ac9c9eb76fac45af8e51\
             30c81c46a35ce411e5fbc1191a0a52eff69f2445df4f9b17ad2b417be66c3710",
        )
        .unwrap();
        let f = MacFn::CmacAes;
        assert_eq!(h(f, &key, &[]), "bb1d6929e95937287fa37d129b756746");
        assert_eq!(h(f, &key, &msg[..16]), "070a16b46b4d4144f79bdd9dd04a287c");
        assert_eq!(h(f, &key, &msg[..40]), "dfa66747de9ae63030ca32611497c827");
        assert_eq!(h(f, &key, &msg), "51f0bebf7e3b9d92fc49741779363cfe");
    }

    // FIPS 197 appendix C.1: the AES-128 block cipher that CMAC is built on.
    #[test]
    fn fips197_aes128_block() {
        use aes::cipher::{BlockEncrypt, KeyInit};
        let key = hex::decode("000102030405060708090a0b0c0d0e0f").unwrap();
        let mut block =
            aes::Block::clone_from_slice(&hex::decode("00112233445566778899aabbccddeeff").unwrap());
        Aes128::new_from_slice(&key)
            .unwrap()
            .encrypt_block(&mut block);
        assert_eq!(hex::encode(block), "69c4e0d86a7b0430d8cdb78070b4c55a");
    }

    #[test]
    fn cmac_rejects_unsuitable_key_lengths() {
        assert_eq!(
            compute(MacFn::CmacAes, &[0; 12], b"x"),
            Err(MacError::BadKey)
        );
        assert!(compute(MacFn::CmacAes, &[0; 24], b"x").is_ok());
        assert!(compute(MacFn::CmacAes, &[0; 32], b"x").is_ok());
    }

    #[test]
    fn truncation_keeps_the_leading_bits() {
        let m = [0xAB, 0xCD, 0xEF];
        assert_eq!(truncate(&m, 12), vec![0xAB, 0xC0]);
        assert_eq!(truncate(&m, 24), vec![0xAB, 0xCD, 0xEF]);
        assert_eq!(truncate(&m, 20), vec![0xAB, 0xCD, 0xE0]);
    }
}
