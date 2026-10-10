// SPDX-License-Identifier: AGPL-3.0-only
//! DSM-PKR verification against the Merkle root (ICD 6.2, Eqs. 11 to 13, Table 4).

use super::dsm::DsmPkr;
use sha2::{Digest, Sha256};

/// Why a DSM-PKR failed to verify.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MerkleError {
    /// The message id selects no leaf (it must be 0..=15).
    BadMessageId,
    /// The recomputed root differs from the trusted one.
    RootMismatch,
}

/// The Merkle leaf `m_i = NPKT || NPKID || NPK` (Eq. 11).
pub fn leaf(pkr: &DsmPkr) -> Vec<u8> {
    let mut m = Vec::with_capacity(1 + pkr.npk.len());
    m.push((pkr.npkt << 4) | pkr.npkid);
    m.extend_from_slice(&pkr.npk);
    m
}

fn h2(a: &[u8], b: &[u8]) -> [u8; 32] {
    let mut h = Sha256::new();
    h.update(a);
    h.update(b);
    h.finalize().into()
}

/// Recompute the root from the leaf and the four transmitted sibling nodes: at level
/// `j` the sibling of node `i` sits on the left when `i` is odd (Eq. 13, Table 4).
pub fn root_from_pkr(pkr: &DsmPkr) -> Result<[u8; 32], MerkleError> {
    if pkr.mid > 15 {
        return Err(MerkleError::BadMessageId);
    }
    let mut node: [u8; 32] = Sha256::digest(leaf(pkr)).into();
    let mut idx = pkr.mid;
    for sib in &pkr.itn {
        node = if idx & 1 == 0 {
            h2(&node, sib)
        } else {
            h2(sib, &node)
        };
        idx >>= 1;
    }
    Ok(node)
}

/// Verify a DSM-PKR against a trusted Merkle root.
pub fn verify_pkr(pkr: &DsmPkr, trusted_root: &[u8; 32]) -> Result<(), MerkleError> {
    if &root_from_pkr(pkr)? == trusted_root {
        Ok(())
    } else {
        Err(MerkleError::RootMismatch)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Build the whole 16-leaf tree level by level, independently of the path walk.
    fn build(leaves: &[Vec<u8>]) -> Vec<Vec<[u8; 32]>> {
        let mut levels = vec![leaves
            .iter()
            .map(|m| Sha256::digest(m).into())
            .collect::<Vec<[u8; 32]>>()];
        while levels.last().unwrap().len() > 1 {
            let prev = levels.last().unwrap();
            let next = prev.chunks(2).map(|p| h2(&p[0], &p[1])).collect();
            levels.push(next);
        }
        levels
    }

    fn pkr_for(levels: &[Vec<[u8; 32]>], mid: u8, leaf_bytes: &[u8]) -> DsmPkr {
        let mut itn = [[0u8; 32]; 4];
        for (j, n) in itn.iter_mut().enumerate() {
            *n = levels[j][usize::from(mid >> j) ^ 1];
        }
        DsmPkr {
            mid,
            itn,
            npkt: leaf_bytes[0] >> 4,
            npkid: leaf_bytes[0] & 0xF,
            npk: leaf_bytes[1..].to_vec(),
        }
    }

    fn leaves() -> Vec<Vec<u8>> {
        (0..16u8)
            .map(|i| {
                let mut m = vec![(1 << 4) | (i & 0xF)];
                m.extend((0..33).map(|k| i.wrapping_mul(7).wrapping_add(k)));
                m
            })
            .collect()
    }

    #[test]
    fn every_leaf_verifies_against_the_built_root() {
        let ls = leaves();
        let t = build(&ls);
        let root = t.last().unwrap()[0];
        for mid in 0..16u8 {
            let p = pkr_for(&t, mid, &ls[usize::from(mid)]);
            assert_eq!(verify_pkr(&p, &root), Ok(()), "mid {mid}");
        }
    }

    #[test]
    fn corruption_is_rejected() {
        let ls = leaves();
        let t = build(&ls);
        let root = t.last().unwrap()[0];
        let good = pkr_for(&t, 5, &ls[5]);

        let mut p = good.clone();
        p.npk[3] ^= 1; // flipped key bit
        assert_eq!(verify_pkr(&p, &root), Err(MerkleError::RootMismatch));

        let mut p = good.clone();
        p.itn[2][0] ^= 0x80; // flipped node bit
        assert_eq!(verify_pkr(&p, &root), Err(MerkleError::RootMismatch));

        let mut p = good.clone();
        p.mid = 4; // right data, wrong leaf position
        assert_eq!(verify_pkr(&p, &root), Err(MerkleError::RootMismatch));

        let mut wrong = root;
        wrong[31] ^= 1; // wrong trusted root
        assert_eq!(verify_pkr(&good, &wrong), Err(MerkleError::RootMismatch));
    }
}
