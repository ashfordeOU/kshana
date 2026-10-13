// SPDX-License-Identifier: AGPL-3.0-only
//! Bar 5 of xval/greenhall-edf/PREREGISTRATION.md: `assurance::uncertainty::edf` is
//! bit-identical before and after the Greenhall refactor over the pre-registered grid.
//!
//! The dump (every value's `f64::to_bits`, in grid order) is about 5 MB, so its SHA-256 is
//! pinned instead: taken from `src/assurance/uncertainty.rs` as it stood at the base commit
//! c9e37402 (unchanged on this branch until the refactor), before the change.
use kshana::assurance::uncertainty::{edf, NoiseType, VarType};
use sha2::{Digest, Sha256};

/// SHA-256 of the dump at the base commit.
// PIN-SCOPE:    the f64 bits of assurance::uncertainty::edf over the pre-registered grid
//               (every noise type and variance type), in grid order
// PIN-EXCLUDES: nothing else: no other function or output is covered
const BASE_DUMP_SHA256: &str = "5b2de183db76bf26920a51ae8b7dc55818471e930aee4a5e46597de6a6bb8ad9";

fn dump_sha256() -> (String, usize) {
    let mut ns: Vec<usize> = (4..=64).collect();
    ns.extend([100, 257, 1000, 4096, 100_000]);
    let noises = [
        NoiseType::WhitePM,
        NoiseType::FlickerPM,
        NoiseType::WhiteFM,
        NoiseType::FlickerFM,
        NoiseType::RandomWalkFM,
    ];
    let vars = [
        VarType::Allan,
        VarType::Modified,
        VarType::Hadamard,
        VarType::Total,
    ];
    let mut h = Sha256::new();
    let mut count = 0;
    for &n in &ns {
        for m in (1..=10_000).take_while(|m| 2 * m < n) {
            for &noise in &noises {
                for &var in &vars {
                    h.update(edf(noise, n, m, var).to_bits().to_le_bytes());
                    count += 1;
                }
            }
        }
    }
    (hex::encode(h.finalize()), count)
}

#[test]
fn uncertainty_edf_is_bit_identical_to_the_base_commit() {
    let (got, count) = dump_sha256();
    eprintln!("{count} values, dump SHA-256 {got}");
    assert_eq!(got, BASE_DUMP_SHA256);
}
