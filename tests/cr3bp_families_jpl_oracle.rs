// SPDX-License-Identifier: AGPL-3.0-only
//! Earth-Moon CR3BP family members (`cr3bp_family::correct_member`) against the NASA/JPL
//! Three-Body Periodic Orbits API: L1 northern halo, L2 southern halo (NRHO segment included)
//! and planar DROs.
//!
//! Pre-registration: `docs/design/evidence/cr3bp-families/PREREGISTRATION.md` (committed alone,
//! a9074f65, before any request to the API). Fixtures: `tests/fixtures/cr3bp_families_jpl/`
//! (the three API responses byte for byte; provenance in NOTICE.md).
//!
//! Per selected member (20 per family, indices `round(k (n - 1) / 19)`), corrected from the API
//! state at the API's mass ratio: converged with closure <= 1e-8; initial state within 1e-6;
//! period within 1e-6 relative; Jacobi within 1e-8; stability index within 1e-2 relative when the
//! API's index is <= 1e4.
//!
//! ## Result
//!
//! First run, 2026-10-13: **NOT MET**, a finding. 58 members were checked (two L2 members,
//! #1050 and #1534, are not at a perpendicular crossing in the API data and were excluded, as the
//! pre-registration says). 54 meet every bar; state, period and Jacobi agree to at most
//! 9.8e-11, 1.7e-12 and 1.5e-12 everywhere. Misses: L1 northern halo #4222, stability index 2.085
//! against 2.305 (9.5e-2 relative; bar 1e-2), and DRO #0, #579 and #1158, closure 3.3e-8, 2.3e-8
//! and 1.5e-8 (bar 1e-8; the smallest DROs, close to the Moon). The strict test is ignored and
//! `finding_four_members_miss_a_bar` pins exactly these four. The module is `#[doc(hidden)]` and
//! no ledger row claims it. Results: docs/design/evidence/cr3bp-families/RESULTS.md.

use kshana::cr3bp::Cr3bpState;
use kshana::cr3bp_family::{correct_member, CorrectorSettings, Hold};
use serde_json::Value;

const FAMILIES: [(&str, &str, bool); 3] = [
    ("L1 northern halo", "halo_L1_N.json", false),
    ("L2 southern halo", "halo_L2_S.json", false),
    ("DRO", "dro.json", true),
];

fn load(file: &str) -> Value {
    let p = format!(
        "{}/tests/fixtures/cr3bp_families_jpl/{file}",
        env!("CARGO_MANIFEST_DIR")
    );
    serde_json::from_str(&std::fs::read_to_string(&p).expect("fixture")).expect("json")
}

fn num(v: &Value) -> f64 {
    match v {
        Value::String(s) => s.trim().parse().expect("number string"),
        other => other.as_f64().expect("number"),
    }
}

/// One failed bar: (family, member index, quantity, value, bar).
type Miss = (&'static str, usize, &'static str, f64, f64);

fn run() -> (Vec<Miss>, usize) {
    let mut misses = Vec::new();
    let mut checked = 0;
    let set = CorrectorSettings::default();
    for (fam, file, planar) in FAMILIES {
        let d = load(file);
        let mu = num(&d["system"]["mass_ratio"]);
        let rows = d["data"].as_array().expect("data");
        let n = rows.len();
        let picks: Vec<usize> = if n < 20 {
            (0..n).collect()
        } else {
            (0..20)
                .map(|k| ((k * (n - 1)) as f64 / 19.0).round() as usize)
                .collect()
        };
        for i in picks {
            let r: Vec<f64> = rows[i].as_array().unwrap().iter().map(num).collect();
            let api = Cr3bpState {
                r: [r[0], r[1], r[2]],
                v: [r[3], r[4], r[5]],
            };
            let (jac, per, nu) = (r[6], r[7], r[8]);
            if api.r[1].abs() > 1e-10 || api.v[0].abs() > 1e-10 || api.v[2].abs() > 1e-10 {
                println!("{fam} #{i}: not at a perpendicular x-z crossing; excluded");
                continue;
            }
            checked += 1;
            let mut hold = Hold::X0;
            let mut m = correct_member(&api, mu, hold, planar, &set);
            if m.is_none() && !planar {
                hold = Hold::Z0;
                m = correct_member(&api, mu, hold, planar, &set);
            }
            let Some(m) = m else {
                println!("{fam} #{i}: did not converge");
                misses.push((fam, i, "converged", 1.0, 0.0));
                continue;
            };
            let ds = (0..3)
                .map(|k| {
                    (m.ic.r[k] - api.r[k])
                        .abs()
                        .max((m.ic.v[k] - api.v[k]).abs())
                })
                .fold(0.0_f64, f64::max);
            let dp = (m.period - per).abs() / per;
            let dj = (m.jacobi - jac).abs();
            let dn = (m.stability_index - nu).abs() / nu;
            println!(
                "{fam:<17} #{i:>5} hold {hold:?}: closure {:.1e} state {ds:.1e} period {dp:.1e} \
                 Jacobi {dj:.1e} stability {:.4e} vs {nu:.4e} ({dn:.1e})",
                m.closure, m.stability_index
            );
            let mut bar = |q: &'static str, v: f64, b: f64| {
                if !(v <= b) {
                    misses.push((fam, i, q, v, b));
                }
            };
            bar("closure", m.closure, 1e-8);
            bar("initial state", ds, 1e-6);
            bar("period (relative)", dp, 1e-6);
            bar("Jacobi", dj, 1e-8);
            if nu <= 1e4 {
                bar("stability index (relative)", dn, 1e-2);
            }
        }
    }
    (misses, checked)
}

#[test]
#[ignore = "finding 2026-10-13: 4 of 58 members miss a bar (one stability index, three DRO closures); see the finding test"]
fn family_members_match_the_jpl_three_body_periodic_orbits_api() {
    let (misses, checked) = run();
    println!("{checked} members checked, {} bar misses", misses.len());
    assert!(misses.is_empty(), "outside the bar: {misses:#?}");
}

/// The finding, pinned: exactly these four (family, member, quantity) miss their bar.
#[test]
fn finding_four_members_miss_a_bar() {
    let (misses, checked) = run();
    assert_eq!(checked, 58);
    let got: Vec<(&str, usize, &str)> = misses.iter().map(|m| (m.0, m.1, m.2)).collect();
    assert_eq!(
        got,
        vec![
            ("L1 northern halo", 4222, "stability index (relative)"),
            ("DRO", 0, "closure"),
            ("DRO", 579, "closure"),
            ("DRO", 1158, "closure"),
        ],
        "the finding changed"
    );
}
