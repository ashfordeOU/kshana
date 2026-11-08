// SPDX-License-Identifier: AGPL-3.0-only
//! M4 bar B6 for the generator (`xval/m4-dark-vessel/README.md`, reading 12): the same seed gives
//! byte-identical truth, AIS and RF files, and seed 0's files have the pinned SHA-256 on every platform.

use kshana::bench::sha256_hex;
use kshana::m4_dark_vessel::generate;

#[test]
fn seed_0_is_byte_identical_twice_and_matches_the_pin() {
    let a = generate(0).files();
    let b = generate(0).files();
    assert!(a == b, "two runs of seed 0 differ");
    let got = [
        sha256_hex(a.0.as_bytes()),
        sha256_hex(a.1.as_bytes()),
        sha256_hex(a.2.as_bytes()),
    ];
    // PIN-SCOPE:    the SHA-256 of seed 0's truth, AIS and RF files from the M4 generator.
    // PIN-EXCLUDES: every other seed and the decision logic's outputs.
    let want = [
        "24d18b72f329efef8ee7d4fadc7cb790a45770c780707c720e310b324d193405",
        "d2c89cf0a6452b924022dfb31c1156ac277b1e5e6cb4e76f74f1d490408a89d9",
        "ad4a35487cd80e613a14c698eb6ddea9f8b620b4826bd6ad0b431179ab68bfeb",
    ];
    assert_eq!(got, want);
}
