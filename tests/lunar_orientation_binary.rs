// SPDX-License-Identifier: AGPL-3.0-only
//! The embedded binary DE440 Moon PA orientation series (`data/lunar/de440_moon_pa.bin`) holds
//! exactly the doubles of the source-of-record CSV (`tests/fixtures/llr_geometry/de440_moon_pa.csv`),
//! bit for bit, in the layout `src/lunar_orientation.rs` documents (column-major, little-endian,
//! byte-planed). Regenerate with `python3 scripts/gen_de440_moon_pa_bin.py`.

use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

#[test]
fn the_embedded_binary_series_is_the_csv_bit_for_bit() {
    let csv = std::fs::read_to_string(root().join("tests/fixtures/llr_geometry/de440_moon_pa.csv"))
        .expect("csv");
    let bin = std::fs::read(root().join("data/lunar/de440_moon_pa.bin")).expect("bin");
    let mut rows: Vec<[f64; 10]> = Vec::new();
    for (i, line) in csv.lines().enumerate() {
        if i == 0 || line.trim().is_empty() {
            continue;
        }
        let mut r = [0.0; 10];
        for (k, cell) in line.split(',').enumerate() {
            r[k] = cell.trim().parse().expect("number");
        }
        rows.push(r);
    }
    let n = rows.len() * 10;
    assert_eq!(bin.len(), n * 8, "binary length");
    for (c, col) in (0..10).map(|c| (c, c * rows.len())) {
        for (i, row) in rows.iter().enumerate() {
            let j = col + i;
            let mut b = [0u8; 8];
            for (k, byte) in b.iter_mut().enumerate() {
                *byte = bin[k * n + j];
            }
            assert_eq!(
                f64::from_le_bytes(b).to_bits(),
                row[c].to_bits(),
                "row {i} column {c}"
            );
        }
    }
}

#[test]
fn the_library_decodes_the_same_nodes() {
    let csv = std::fs::read_to_string(root().join("tests/fixtures/llr_geometry/de440_moon_pa.csv"))
        .expect("csv");
    let mut nodes = 0usize;
    for (i, line) in csv.lines().enumerate() {
        if i == 0 || line.trim().is_empty() {
            continue;
        }
        nodes += 1;
        if i % 997 != 1 {
            continue;
        }
        let v: Vec<f64> = line
            .split(',')
            .map(|c| c.trim().parse().expect("n"))
            .collect();
        let r = kshana::lunar_orientation::de440_moon_pa(v[0]);
        for a in 0..3 {
            for b in 0..3 {
                assert!(
                    (r[a][b] - v[1 + a * 3 + b]).abs() < 1e-12,
                    "node {i} [{a}][{b}]"
                );
            }
        }
    }
    let (first, last) = kshana::lunar_orientation::de440_moon_pa_span();
    assert!(nodes == 6209 && first < last);
}
