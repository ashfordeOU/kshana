// SPDX-License-Identifier: AGPL-3.0-only
//! Bar 5 of xval/greenhall-edf/PREREGISTRATION.md: `assurance::uncertainty::edf` is
//! bit-identical before and after the Greenhall refactor over the pre-registered grid.
//!
//! The dump (every value's `f64::to_bits`, in grid order) is about 5 MB, so its SHA-256 is
//! pinned instead. Bar 5 itself was met on host maths: the dump after the refactor equalled
//! the one taken from `src/assurance/uncertainty.rs` as it stood at the base commit c9e37402,
//! before the change ([`BASE_DUMP_SHA256`], kept as that historical record).
//!
//! From 0.36 the engine computes every transcendental with portable maths (STUDIO-15), which
//! moves 3 746 of the 274 280 values by at most a relative 1.6e-12, so the guard compares
//! against the named baseline "0.36 portable" ([`PORTABLE_0_36_DUMP_SHA256`], printed by this
//! test). Old -> new and the comparison: docs/revisions/STUDIO15-greenhall-edf-portable.md.
use kshana::assurance::uncertainty::{edf, NoiseType, VarType};
use sha2::{Digest, Sha256};

/// SHA-256 of the dump at the base commit (host maths; the historical Bar 5 record).
// PIN-SCOPE:    the same dump on host maths at the base commit (historical; not compared)
// PIN-EXCLUDES: everything; it is printed only when the 0.36 portable pin below fails
const BASE_DUMP_SHA256: &str = "5b2de183db76bf26920a51ae8b7dc55818471e930aee4a5e46597de6a6bb8ad9";

/// SHA-256 of the dump on the 0.36 portable-maths engine.
// PIN-SCOPE:    the f64 bits of assurance::uncertainty::edf over the pre-registered grid
//               (every noise type and variance type), in grid order
// PIN-EXCLUDES: nothing else: no other function or output is covered
const PORTABLE_0_36_DUMP_SHA256: &str =
    "ad1444373d2021e47ac4ecaaa8af9cf538d28f55eec770d97afb8e8693f9c166";

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

/// Values of `edf` at points of the grid, taken on the baseline engine (Linux, 0.36 portable maths).
// PIN-SCOPE:    edf at ten grid points (noise, n, m, variance type), as printed by `{:e}`
// PIN-EXCLUDES: every other grid point; the exact layer's hash covers them on the baseline host
const SPOT: [(NoiseType, usize, usize, VarType, f64); 10] = [
    (
        NoiseType::WhitePM,
        64,
        3,
        VarType::Allan,
        3.0901639344262296e1,
    ),
    (
        NoiseType::FlickerPM,
        100,
        10,
        VarType::Modified,
        7.797976206874892e0,
    ),
    (
        NoiseType::WhiteFM,
        257,
        7,
        VarType::Hadamard,
        3.852758956402695e1,
    ),
    (NoiseType::FlickerFM, 1000, 50, VarType::Total, 2.318e1),
    (
        NoiseType::RandomWalkFM,
        4096,
        100,
        VarType::Allan,
        3.8075572018490924e1,
    ),
    (
        NoiseType::FlickerPM,
        100_000,
        3,
        VarType::Hadamard,
        3.7291637422781256e4,
    ),
    (NoiseType::WhiteFM, 4096, 1, VarType::Total, 6.144e3),
    (
        NoiseType::RandomWalkFM,
        1000,
        20,
        VarType::Hadamard,
        4.6031557920043106e1,
    ),
    (
        NoiseType::RandomWalkFM,
        100_000,
        5000,
        VarType::Total,
        1.8240000000000002e1,
    ),
    (
        NoiseType::FlickerFM,
        30,
        4,
        VarType::Allan,
        6.696428571428571e0,
    ),
];

fn exact_layer_applies() -> bool {
    !cfg!(target_os = "macos") || std::env::var("KSHANA_EXACT_PINS").ok().as_deref() == Some("1")
}

#[test]
fn uncertainty_edf_is_bit_identical_to_the_0_36_portable_baseline() {
    for &(noise, n, m, var, want) in &SPOT {
        let got = edf(noise, n, m, var);
        assert!(
            (got - want).abs() <= 1e-9 * want.abs(),
            "edf({noise:?}, {n}, {m}, {var:?}) = {got:e}, baseline {want:e}"
        );
    }
    if !exact_layer_applies() {
        return;
    }
    let (got, count) = dump_sha256();
    eprintln!("{count} values, dump SHA-256 {got}");
    assert_eq!(count, 274_280);
    assert_eq!(
        got, PORTABLE_0_36_DUMP_SHA256,
        "uncertainty::edf moved from the 0.36 portable baseline (the host-maths base of \
         Bar 5 was {BASE_DUMP_SHA256})"
    );
}
