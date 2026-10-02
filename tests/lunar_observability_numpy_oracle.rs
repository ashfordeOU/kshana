// SPDX-License-Identifier: AGPL-3.0-only
//! Independent-library comparison (policy P2, an independent numerical library) for the
//! Fisher-information observability of the joint lunar orbit-and-clock solve,
//! `kshana::lunar_combination::lunar_observability` (verification row "Lunar absolute-station
//! observability (datum defect)").
//!
//! ## Pre-registration (written 2026-10-01, before the oracle was run)
//!
//! * **Quantity.** For each committed configuration, the linear algebra of `M = Hᵀ W H`, with `H`
//!   the central finite-difference measurement Jacobian about the nominal geometry and
//!   `W = diag(1/σ²)`: the numerical rank and datum defect at the relative eigenvalue threshold
//!   1e-9 (Kshana's stated threshold); the basis-invariant overlap of the station's three
//!   position axes with the null space, `Σ_k ||Π₃ v_k||²` over an orthonormal null basis; whether
//!   the station position is observable (overlap below 1e-6); and, when it is, the station
//!   Cramér–Rao bound `sqrt(C₀₀ + C₁₁ + C₂₂) × 1e6 m` with `C` the inverse (pseudo-inverse when
//!   rank-deficient) of `M`.
//! * **Inputs.** `tests/fixtures/lunar_observability_numpy_oracle/inputs.json`, written by
//!   `examples/gen_lunar_observability_fixture.rs` from `observability_inputs`: `H`, `W` and the
//!   stored-unit scale for 17 configurations, the cases the row's unit tests make the claim on
//!   (no Earth-baseline VLBI; one, two, three and more Earth stations, i.e. zero, one, three and
//!   more baselines; three, six and eight satellites; the circular placement and the elliptical
//!   lunar frozen orbit). The test first asserts the committed `H` and `W` equal what the engine
//!   builds now, so the fixture cannot drift from the code.
//! * **Oracle (P2).** NumPy 2.3.5 and SciPy 1.18.1 (BSD-3-Clause), run once by
//!   `tests/fixtures/lunar_observability_numpy_oracle/gen_reference.py`, never linked in:
//!   singular values by `numpy.linalg.svd` (LAPACK `gesdd`) for the rank, `scipy.linalg.null_space`
//!   for the null basis, `numpy.linalg.inv` (LAPACK LU, `getrf`/`getri`) or `numpy.linalg.pinv` for
//!   the covariance. Kshana uses a cyclic-Jacobi eigensolver and a spectral pseudo-inverse.
//! * **Spectral-gap precondition (caveat (a) of the route review).** `H` is a finite-difference
//!   Jacobian, so the oracle asserts, before writing its reference, that no singular value of
//!   `M` lies within a factor 2 of the threshold `1e-9 * s_max`. Engine-side, before this
//!   pre-registration, the narrowest margin is the one-Earth-station, six-satellite case: its
//!   smallest kept eigenvalue is 3.3e-9 of the largest, so its defect of 3 is a statement at the
//!   stated 1e-9 threshold (a 1e-8 threshold would read 4); the largest discarded eigenvalue of
//!   any case is 4.9e-11 of the largest (no Earth baselines, three satellites).
//! * **Tolerances (fixed now, before the first comparison).**
//!   - rank and defect: **exact**, every case;
//!   - station-axis null overlap: **1e-6 absolute**. The null basis of a matrix whose smallest
//!     kept eigenvalue is `g` times the largest is determined only to an angle of about `ε/g`
//!     (Davis–Kahan), 6.6e-8 at the narrowest gap above, so two correct algorithms can differ by
//!     about 1e-7; the bar is ten times that. The overlaps it decides are 0 or above 0.14;
//!   - observability decision (overlap below 1e-6): **identical**, every case;
//!   - station CRLB: **1e-8 relative**. The forward error of an inverse is about `κ ε`; the
//!     largest condition number among the observable cases is 5.4e6, so `κ ε` = 1.2e-9 and the
//!     1e-9 of the 7 x 7 datum-identifiability precedent cannot be guaranteed for any two correct
//!     algorithms on these 16 to 36 parameter matrices; 1e-8 is ten times the bound;
//!   - the oracle's CRLB decreases strictly from three to six Earth stations (the monotone design
//!     curve the row's tests claim), and the engine's agrees in each case within the bar above.
//! * **What this validates, and what it does not (caveats (b) to (d)).** The observability linear
//!   algebra on the committed, Kshana-generated `H` and `W`: rank, defect, the station's share of
//!   the null space and the station CRLB. A wrong physics Jacobian would not be caught. The row's
//!   further clause that "the estimator attains" the CRLB (the Monte Carlo efficiency of the
//!   Gauss–Newton estimator) and the three-station design rationale are not compared here. The
//!   threshold is three Earth stations, i.e. three baselines of which two are independent.
//!
//! ## Result (recorded 2026-10-01, not tuned): AGREES on the observability linear algebra
//!
//! 17 cases: every rank and defect equal (defects 1, 2, 3, 1 and 0 where the claim puts them);
//! every observability decision equal; worst station null-overlap gap 8.4e-10 (bar 1e-6); worst
//! station CRLB relative gap 1.2e-10 (bar 1e-8); the oracle's CRLB falls 50.12, 36.80, 27.53,
//! 20.08 m from three to six Earth stations. The oracle's spectral-gap precondition held on every
//! case. Mutations, each reverted by editing back: summing two of the three station axes into the
//! CRLB fails `default_with_vlbi` (20.017 against 20.078 m); a 1e-8 rank threshold fails
//! `ladder_six_sats_one_station` (rank 24 against 25). The estimator-attainment clause of the row
//! is not covered by this comparison.

use kshana::lunar_combination::{lunar_observability, observability_inputs, LunarNetworkConfig};

const OVERLAP_TOL: f64 = 1e-6;
const CRLB_REL_TOL: f64 = 1e-8;
const MIN_CASES: usize = 17;

fn fixture(name: &str) -> serde_json::Value {
    let path = format!(
        "{}/tests/fixtures/lunar_observability_numpy_oracle/{name}",
        env!("CARGO_MANIFEST_DIR")
    );
    let text = std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    serde_json::from_str(&text).expect("json")
}

fn config(c: &serde_json::Value) -> LunarNetworkConfig {
    let u = |k: &str| c[k].as_u64().expect(k) as usize;
    let f = |k: &str| c[k].as_f64().expect(k);
    LunarNetworkConfig {
        n_sat: u("n_sat"),
        n_earth: u("n_earth"),
        with_vlbi: c["with_vlbi"].as_bool().expect("with_vlbi"),
        orbit_radius_km: f("orbit_radius_km"),
        orbit_ecc: f("orbit_ecc"),
        orbit_planes: u("orbit_planes"),
        ..LunarNetworkConfig::default()
    }
}

fn floats(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("array")
        .iter()
        .map(|x| x.as_f64().expect("number"))
        .collect()
}

#[test]
fn lunar_observability_matches_numpy_on_the_committed_jacobians() {
    let inputs = fixture("inputs.json");
    let reference = fixture("reference.json");
    let cases = inputs["cases"].as_array().expect("cases");
    let refs = reference["cases"].as_array().expect("reference cases");
    assert!(cases.len() >= MIN_CASES, "{} cases", cases.len());
    assert_eq!(cases.len(), refs.len(), "one reference per input case");

    let mut crlb_by_name = std::collections::BTreeMap::new();
    let (mut worst_overlap, mut worst_crlb) = (0.0_f64, 0.0_f64);
    for (c, r) in cases.iter().zip(refs) {
        let name = c["name"].as_str().expect("name");
        assert_eq!(r["name"].as_str(), Some(name), "case order");
        let cfg = config(&c["config"]);

        // The committed inputs are what the engine builds now.
        let now = observability_inputs(&cfg);
        let w = floats(&c["weights"]);
        assert_eq!(now.weights, w, "{name}: weights drifted from the fixture");
        let h: Vec<Vec<f64>> = c["jacobian"]
            .as_array()
            .expect("jacobian")
            .iter()
            .map(floats)
            .collect();
        assert_eq!(now.jacobian, h, "{name}: Jacobian drifted from the fixture");

        let o = lunar_observability(&cfg);
        let o_rank = r["rank"].as_u64().expect("rank") as usize;
        let o_defect = r["defect"].as_u64().expect("defect") as usize;
        assert_eq!(o.rank, o_rank, "{name}: rank");
        assert_eq!(o.defect, o_defect, "{name}: defect");

        let o_overlap = r["station_null_overlap"].as_f64().expect("overlap");
        let d = (o.station_pos_unobservable_axes - o_overlap).abs();
        worst_overlap = worst_overlap.max(d);
        assert!(
            d < OVERLAP_TOL,
            "{name}: station null overlap Kshana {} vs NumPy {o_overlap}",
            o.station_pos_unobservable_axes
        );

        let o_crlb = r["station_crlb_m"].as_f64();
        assert_eq!(
            o.station_pos_crlb_m.is_some(),
            o_crlb.is_some(),
            "{name}: observability decision Kshana {:?} vs NumPy {o_crlb:?}",
            o.station_pos_crlb_m
        );
        if let (Some(k), Some(n)) = (o.station_pos_crlb_m, o_crlb) {
            let rel = (k - n).abs() / n.abs();
            worst_crlb = worst_crlb.max(rel);
            assert!(
                rel < CRLB_REL_TOL,
                "{name}: station CRLB Kshana {k} m vs NumPy {n} m (rel {rel:.3e})"
            );
            crlb_by_name.insert(name.to_string(), n);
        }
    }

    // The monotone design curve, on the oracle's numbers.
    let curve: Vec<f64> = [
        "default_three_stations",
        "default_four_stations",
        "default_five_stations",
        "default_with_vlbi",
    ]
    .iter()
    .map(|n| crlb_by_name[*n])
    .collect();
    assert!(
        curve.windows(2).all(|p| p[1] < p[0]),
        "NumPy station CRLB must fall from three to six Earth stations: {curve:?}"
    );
    eprintln!(
        "{} cases; worst overlap gap {worst_overlap:.3e}; worst CRLB relative gap {worst_crlb:.3e}",
        cases.len()
    );
}
