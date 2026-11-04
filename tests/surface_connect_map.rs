// SPDX-License-Identifier: AGPL-3.0-only
//! The in-memory Connect surface (Python and WASM `connect_map`) gives the same bytes as the
//! conformance vectors that `kshana connect check` runs, for every vector with a mapping file.

use std::path::Path;

#[test]
fn in_memory_connect_map_matches_every_mapping_vector() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut checked = 0;
    for v in kshana::connect::find_vectors(&root.join("conformance/connect")) {
        let (vector, expected, _) = kshana::connect::run_vector(&v).unwrap();
        let Some(mapping) = &vector.mapping else {
            continue;
        };
        let dir = v.parent().unwrap();
        let read = |p: &str| std::fs::read_to_string(dir.join(p)).unwrap();
        let got = kshana::surface::connect_map(
            &read(mapping),
            &read(&vector.station),
            &read(&vector.input),
            kshana::surface::MAX_INPUT_BYTES,
        )
        .unwrap();
        assert_eq!(
            got,
            std::fs::read_to_string(&expected).unwrap(),
            "{}",
            vector.name
        );
        checked += 1;
    }
    assert!(checked >= 3, "only {checked} mapping vectors found");
}

#[test]
fn a_bad_mapping_is_an_error_not_a_panic() {
    let e = kshana::surface::connect_map("not toml [", "", "", 1024).unwrap_err();
    assert!(!e.is_empty());
    let e = kshana::surface::connect_map("", "", &"x".repeat(2048), 1024).unwrap_err();
    assert!(e.contains("1024"), "{e}");
}
