// SPDX-License-Identifier: AGPL-3.0-only
//! Simultaneous multi-satellite fault hypotheses (CAP-05a): the ADD v4.2 subset rule
//! generalised beyond pairs ([`kshana::araim_reference::add_v42_subset_plan`]) and the opt-in
//! advanced RAIM over those hypotheses ([`kshana::raim::araim_subset_raim`]).
//!
//! * At order 2 the rule is the one the MAAST-checked ADD v4.2 path always used (that path now
//!   calls it, and `tests/araim_reference_vectors.rs` still passes); a deeper order changes
//!   nothing when the priors need no deeper subsets.
//! * Priors that need triples are refused at order 2 (never silently truncated) and planned at
//!   a deeper order, with every monitored prior re-derived here from `P_no fault Π q_e` and the
//!   unmonitored risk within `P_THRES`.
//! * With pairs monitored, a bias on two satellites is detected and the pair is the subset of
//!   largest normalised separation; a fault-free epoch raises no alarm.
//!
//! MODELLED (InternalConsistency): the generalisation has no MAAST run beyond pairs here.

use kshana::araim_reference::add_v42_subset_plan;
use kshana::raim::{araim_subset_raim, DualFaultPriors, IntegrityBudget, SubsetRule};

type Vec3 = [f64; 3];

/// Twelve satellites, two constellations (alternating).
fn constellation_of(n: usize) -> Vec<usize> {
    (0..n).map(|i| i % 2).collect()
}

#[test]
fn deeper_orders_change_nothing_when_pairs_suffice() {
    let c = constellation_of(12);
    let p_sat = vec![1e-5; 12];
    let p_const = vec![1e-4; 2];
    let two = add_v42_subset_plan(&c, 2, &p_sat, &p_const, 1e-7, 8e-8, 0.01, 2).unwrap();
    for order in 3..=5 {
        let deep = add_v42_subset_plan(&c, 2, &p_sat, &p_const, 1e-7, 8e-8, 0.01, order).unwrap();
        assert_eq!(deep, two, "order {order}");
    }
    assert!(two.n_fault_max <= 2);
}

#[test]
fn triples_are_refused_at_order_two_and_planned_deeper() {
    let n = 12;
    let c = constellation_of(n);
    let p_sat = vec![2e-3; n];
    let p_const = vec![1e-4; 2];
    let (p_hmi, p_thres) = (1e-7, 8e-8);
    let err = add_v42_subset_plan(&c, 2, &p_sat, &p_const, p_hmi, p_thres, 0.01, 2).unwrap_err();
    assert!(err.contains("simultaneous events"), "{err}");
    let plan = add_v42_subset_plan(&c, 2, &p_sat, &p_const, p_hmi, p_thres, 0.01, 6)
        .expect("planned at order 6");
    assert!(plan.n_fault_max >= 3, "N_fault,max {}", plan.n_fault_max);
    assert_eq!(plan.depth, plan.n_fault_max.max(2));
    assert!(plan.p_not_monitored <= p_thres, "{}", plan.p_not_monitored);
    // Some monitored subset removes three or more satellites.
    assert!(plan.monitored.iter().any(|s| s.excluded.len() >= 3));
    // Independent re-derivation of the priors of the satellite-only subsets that are not
    // merged into a constellation fault: P_no fault * prod q_e over the removed satellites.
    let mut p_event: Vec<f64> = p_sat.clone();
    p_event.extend(&p_const);
    let p_nf: f64 = p_event.iter().map(|p| 1.0 - p).product();
    let q: f64 = 2e-3 / (1.0 - 2e-3);
    let mut checked = 0;
    for s in plan.monitored.iter().skip(1) {
        let k = s.excluded.len();
        // A subset spanning both constellations cannot have been merged into either.
        let spans = s.excluded.iter().any(|&i| c[i] == 0) && s.excluded.iter().any(|&i| c[i] == 1);
        if spans && k < 6 {
            let want = p_nf * q.powi(k as i32);
            assert!(
                (s.p_fault - want).abs() <= 1e-12 * want,
                "{:?}: {} vs {want}",
                s.excluded,
                s.p_fault
            );
            checked += 1;
        }
    }
    assert!(checked > 10, "{checked} priors re-derived");
}

/// A user on the equator at longitude 0: east = +y, north = +z, up = +x.
fn geometry() -> (Vec3, Vec<Vec3>, Vec<u8>) {
    let user = [6_378_137.0, 0.0, 0.0];
    let azel = [
        (10.0, 70.0),
        (70.0, 30.0),
        (140.0, 45.0),
        (200.0, 25.0),
        (260.0, 55.0),
        (310.0, 35.0),
        (350.0, 20.0),
        (40.0, 50.0),
        (100.0, 20.0),
        (170.0, 62.0),
        (230.0, 40.0),
        (290.0, 28.0),
        (330.0, 65.0),
        (20.0, 38.0),
    ];
    let sats = azel
        .iter()
        .map(|&(az, el): &(f64, f64)| {
            let (a, e) = (az.to_radians(), el.to_radians());
            let (de, dn, du) = (e.cos() * a.sin(), e.cos() * a.cos(), e.sin());
            let r = 22_000_000.0;
            [user[0] + r * du, r * de, r * dn]
        })
        .collect();
    let constellation = (0..azel.len()).map(|i| u8::from(i >= 7)).collect();
    (user, sats, constellation)
}

#[test]
fn a_two_satellite_fault_is_found_as_a_pair() {
    let (user, sats, cons) = geometry();
    let priors = DualFaultPriors {
        p_sat: 1e-4,
        p_const: 1e-4,
        b_nom_m: 0.0,
    };
    let budget = IntegrityBudget {
        p_hmi_vert: 9.8e-8,
        p_hmi_horz: 2e-9,
        p_fa: 4e-6,
    };
    let noise: Vec<f64> = (0..sats.len())
        .map(|i| 0.3 * (i as f64 * 1.7).sin())
        .collect();
    let clean = araim_subset_raim(
        user,
        &sats,
        &cons,
        &noise,
        1.0,
        priors,
        budget,
        SubsetRule::default(),
    )
    .expect("a solution");
    assert!(!clean.fault_detected, "fault-free epoch alarmed");
    assert!(
        clean.max_subset_size >= 2,
        "pairs must be monitored at these priors"
    );
    assert!(clean.hpl_m.is_finite() && clean.vpl_m.is_finite());
    let mut faulty = noise.clone();
    faulty[2] += 30.0;
    faulty[9] += 30.0;
    let r = araim_subset_raim(
        user,
        &sats,
        &cons,
        &faulty,
        1.0,
        priors,
        budget,
        SubsetRule::default(),
    )
    .expect("a solution");
    assert!(r.fault_detected);
    assert_eq!(r.excluded_subset, Some(vec![2, 9]));
}
