// SPDX-License-Identifier: AGPL-3.0-only
//! Write one M4 scene: `cargo run --release --example m4_scene -- SEED OUT_DIR`.
fn main() {
    let a: Vec<String> = std::env::args().skip(1).collect();
    let seed: u64 = a[0].parse().expect("seed");
    let out = std::path::Path::new(&a[1]);
    std::fs::create_dir_all(out).expect("dir");
    let s = kshana::m4_dark_vessel::generate(seed);
    let (t, ais, rf) = s.files();
    for (n, x) in [("truth", t), ("ais", ais), ("rf", rf)] {
        std::fs::write(out.join(format!("m4-{seed}-{n}.json")), x).expect("write");
    }
    println!(
        "seed {seed}: {} AIS reports, {} RF fixes, {} redraws",
        s.ais.len(),
        s.rf.len(),
        s.redraws
    );
}
