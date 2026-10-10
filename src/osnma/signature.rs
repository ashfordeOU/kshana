// SPDX-License-Identifier: AGPL-3.0-only
//! ECDSA verification of the DSM-KROOT (ICD 6.3, Table 15). The curve implementations
//! are not part of this build yet, so verification reports `Unsupported`.

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
    /// ECDSA for this curve is not available in this build.
    Unsupported,
    /// The key or signature is not a valid encoding.
    Malformed,
    /// The signature does not verify.
    Invalid,
}

/// Verify `signature` over `message` (the zero-padded concatenation of Eq. 14).
pub fn verify(_key: &PublicKey, _message: &[u8], _signature: &[u8]) -> Result<(), SigError> {
    Err(SigError::Unsupported)
}
