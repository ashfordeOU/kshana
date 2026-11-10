// SPDX-License-Identifier: AGPL-3.0-only
//! B1a v3 (`docs/design/evidence/b1a-planner/PREREGISTRATION-v3.md`, readings 20 to 25 of
//! `xval/planner/README.md`): the planner's v3 placement search on the 48-candidate instance.
//!
//! * P4: `greedy+exchange2+restarts` on `place_48_v3.json` (48 candidates, `m` = 8) against the best of
//!   1 000 random subsets drawn with ChaCha20 seed `0xB1B2`. P1 to P3, P5 and P6 are re-run unchanged by
//!   `tests/planner_v2.rs`.
//! * The same placement from `place` and from `run_json("place", …)`.

use kshana::planner::{objective_of, place, run_json, PlanSpec};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha20Rng;
use std::path::PathBuf;

fn text() -> String {
    std::fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/planner/place_48_v3.json"),
    )
    .unwrap()
}

#[test]
fn p4_v3_search_against_random_subsets() {
    let t = text();
    let sp: PlanSpec = serde_json::from_str(&t).unwrap();
    let got = place(&sp).unwrap();
    assert_eq!(got.method.as_deref(), Some("greedy+exchange2+restarts"));
    let mut rng = ChaCha20Rng::seed_from_u64(0xB1B2);
    let mut best = 0f64;
    let mut best_sub = Vec::new();
    for _ in 0..1000 {
        let mut pool: Vec<usize> = (0..48).collect();
        let mut sub: Vec<usize> = (0..8)
            .map(|_| pool.remove(rng.gen_range(0..pool.len())))
            .collect();
        sub.sort_unstable();
        let o = objective_of(&sp, &sub).0;
        if o > best {
            best = o;
            best_sub = sub;
        }
    }
    println!(
        "P4 v3: {:?} objective {:.6} (median DRMS {:?}); best of 1000 random {best:.6} {best_sub:?}",
        got.subset, got.objective, got.median_drms_m
    );
    let via_json: serde_json::Value =
        serde_json::from_str(&run_json("place", &t).unwrap()).unwrap();
    assert_eq!(
        via_json,
        serde_json::to_value(&got).unwrap(),
        "place and run_json disagree"
    );
    assert!(got.objective >= best, "P4 v3 NOT MET: {} < {best}", got.objective);
}
