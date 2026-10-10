// SPDX-License-Identifier: AGPL-3.0-only
//! ECDSA verification of the DSM-KROOT (ICD 6.3, Table 15): P-256 with SHA-256 and
//! P-521 with SHA-512, signatures as the fixed-width concatenation of r and s, public
//! keys as compressed points. Verification only.

use super::tables::KeyType;

/// A public key in force: its id, curve and compressed SEC1 point.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct PublicKey {
    pub pkid: u8,
    pub key_type: KeyType,
    pub bytes: Vec<u8>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum SigError {
    /// The key or signature is not a valid encoding.
    Malformed,
    /// The signature does not verify.
    Invalid,
}

/// Verify `signature` over `message` (the zero-padded concatenation of Eq. 14).
pub fn verify(key: &PublicKey, message: &[u8], signature: &[u8]) -> Result<(), SigError> {
    match key.key_type {
        KeyType::P256 => {
            use p256::ecdsa::{signature::Verifier, Signature, VerifyingKey};
            let vk = VerifyingKey::from_sec1_bytes(&key.bytes).map_err(|_| SigError::Malformed)?;
            let sig = Signature::from_slice(signature).map_err(|_| SigError::Malformed)?;
            vk.verify(message, &sig).map_err(|_| SigError::Invalid)
        }
        KeyType::P521 => {
            use p521::ecdsa::{signature::Verifier, Signature, VerifyingKey};
            let vk = VerifyingKey::from_sec1_bytes(&key.bytes).map_err(|_| SigError::Malformed)?;
            let sig = Signature::from_slice(signature).map_err(|_| SigError::Malformed)?;
            vk.verify(message, &sig).map_err(|_| SigError::Invalid)
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // RFC 6979 appendix A.2.5: ECDSA P-256 with SHA-256, message "sample".
    const UX: &str = "60fed4ba255a9d31c961eb74c6356d68c049b8923b61fa6ce669622e60f29fb6";
    const R: &str = "efd48b2aacb6a8fd1140dd9cd45e81d69d2c877b56aaf991c34d0ea84eaf3716";
    const S: &str = "f7cb1c942d657c41d436c7a1b6e29f65f3e900dbb9aff4064dc4ab2f843acda8";

    fn p256_key() -> PublicKey {
        // Uy ends in an odd byte (0x99), so the compressed prefix is 03.
        PublicKey {
            pkid: 1,
            key_type: KeyType::P256,
            bytes: hex::decode(format!("03{UX}")).unwrap(),
        }
    }

    #[test]
    fn rfc6979_p256_known_answer() {
        let sig = hex::decode(format!("{R}{S}")).unwrap();
        assert_eq!(verify(&p256_key(), b"sample", &sig), Ok(()));
        assert_eq!(
            verify(&p256_key(), b"sample!", &sig),
            Err(SigError::Invalid)
        );
        let mut bad = sig.clone();
        bad[40] ^= 1;
        assert_eq!(verify(&p256_key(), b"sample", &bad), Err(SigError::Invalid));
        assert_eq!(
            verify(&p256_key(), b"sample", &sig[..63]),
            Err(SigError::Malformed)
        );
        let mut k = p256_key();
        k.bytes[0] = 0x07;
        assert_eq!(verify(&k, b"sample", &sig), Err(SigError::Malformed));
    }

    /// P-521 wiring (compressed key, 132-byte r||s, SHA-512) against a throwaway key
    /// pair made in the test. This checks encodings and hash selection of our code; the
    /// curve arithmetic itself is the library's.
    #[test]
    fn p521_roundtrip_and_corruption() {
        use p521::ecdsa::{signature::RandomizedSigner, Signature, SigningKey, VerifyingKey};
        use rand::SeedableRng;
        let mut scalar = [0x42u8; 66];
        scalar[0] = 0x01; // a P-521 scalar has 521 bits
        let sk = SigningKey::from_slice(&scalar).unwrap();
        let pk = VerifyingKey::from(&sk).to_encoded_point(true);
        let key = PublicKey {
            pkid: 2,
            key_type: KeyType::P521,
            bytes: pk.as_bytes().to_vec(),
        };
        assert_eq!(key.bytes.len(), 67);
        let msg = b"throwaway message";
        let mut rng = rand_chacha::ChaCha20Rng::seed_from_u64(7);
        let sig: Signature = sk.try_sign_with_rng(&mut rng, msg).unwrap();
        let raw = sig.to_bytes().to_vec();
        assert_eq!(raw.len(), 132);
        assert_eq!(verify(&key, msg, &raw), Ok(()));
        assert_eq!(verify(&key, b"other", &raw), Err(SigError::Invalid));
        let mut bad = raw.clone();
        bad[10] ^= 0x80;
        assert_eq!(verify(&key, msg, &bad), Err(SigError::Invalid));
        // A P-256 key type with this signature is rejected by length, not accepted.
        let k256 = PublicKey {
            key_type: KeyType::P256,
            ..key
        };
        assert!(verify(&k256, msg, &raw).is_err());
    }
}
