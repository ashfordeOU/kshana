// SPDX-License-Identifier: AGPL-3.0-only
//! Validated anchor: kshana's fault-observability linear algebra reproduced against an
//! independent numpy/scipy computation on real-DE440 per-node observation rows.
//!
//! ## What is Validated
//!
//! The rows of `network.json` are the `n × state_dim` measurement Jacobian `G` of the
//! real-DE440 per-node lunar network (each row a differential inter-node one-way range,
//! built by `examples/gen_faultobs_rows.rs` via `lunar_faultobs::pernode_range_row`
//! with a **real DE440 Moon PA-frame line of sight**). The node *geometry* is
//! **Modelled**; the DE440 orientation carried in every line of sight is the external
//! ingredient.
//!
//! The Validated claim is that the four kshana fault-observability quantities under
//! test —
//! 1. the weighted parity projector `P⊥ = I − G(GᵀWG)⁺GᵀW`
//!    ([`kshana::lunar_faultobs::parity_projector`]),
//! 2. detectability `‖P⊥·b‖` ([`kshana::lunar_faultobs::is_detectable`]),
//! 3. the MDB non-centrality quadratic form `cᵀWP⊥c` and `MDB = √(λ₀/cᵀWP⊥c)`
//!    ([`kshana::lunar_faultobs::mdb`]), and
//! 4. the Byzantine block-spark counts of the stacked effective peer signatures
//!    `P⊥·B_T` ([`kshana::lunar_faultobs::byzantine_bound`])
//!
//! — reproduce the **independent numpy/scipy** oracle in `reference.json` to
//! **relative error < 1e-3 AND absolute error < 1e-3**. Integer counts (`rank_G`,
//! `parity_dim`, and the block-spark detect/identify counts) must match **exactly**.
//!
//! ## Independence
//! The oracle (`scripts/gen_faultobs_ref.py`) imports only numpy/scipy/json and builds
//! `P⊥` from the **SVD of the whitened design matrix** `W^{1/2}·G` — never the crate's
//! cyclic-Jacobi eigendecomposition of `GᵀWG` plus spectral pseudo-inverse. The MDB
//! non-centrality is the textbook Baarda parity-subspace squared norm, and the block
//! rank is a numpy SVD count with a rank cutoff matched to the crate's. Agreement of two
//! genuinely different routes is what makes the Validated tag meaningful (and would
//! catch a wrong MDB form).
//!
//! ## Spectral separation
//! The network is spectrally well separated: the weakest observable whitened direction
//! sits at `σ²/σ²_max ≈ 6.3e-6` (retained above the `1e-9` cutoff) while the gauge nulls
//! sit at `≲ 1.6e-14` (discarded), so `rank(G) = 32` and `parity_dim = 52` are
//! unambiguous under both the Jacobi and the SVD solvers.

use kshana::lunar_faultobs::{
    byzantine_bound, is_detectable, mdb, parity_projector, peer_signature,
};

const NETWORK_JSON: &str = include_str!("fixtures/faultobs/network.json");
const REFERENCE_JSON: &str = include_str!("fixtures/faultobs/reference.json");

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

fn as_f64_vec(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("expected JSON array")
        .iter()
        .map(|x| x.as_f64().expect("expected float"))
        .collect()
}

fn as_usize_vec(v: &serde_json::Value) -> Vec<usize> {
    v.as_array()
        .expect("expected JSON array")
        .iter()
        .map(|x| x.as_u64().expect("expected integer") as usize)
        .collect()
}

/// P3/P4-style tolerance: absolute < 1e-3 always; relative < 1e-3 where |exp| >= 1e-3.
fn check(label: &str, got: f64, exp: f64) {
    const TOL: f64 = 1e-3;
    let abs_err = (got - exp).abs();
    assert!(
        abs_err < TOL,
        "{label}: abs error {abs_err:.3e} >= {TOL:.0e}  (got={got:.9e}  exp={exp:.9e})"
    );
    if exp.abs() >= TOL {
        let rel_err = abs_err / exp.abs();
        assert!(
            rel_err < TOL,
            "{label}: rel error {rel_err:.3e} >= {TOL:.0e}  (got={got:.9e}  exp={exp:.9e})"
        );
    }
}

/// `q = cᵀ W P⊥ c` — the MDB non-centrality quadratic form, recomputed in the test to
/// validate the quadratic-form quantity directly against the oracle's independent value.
fn quad_form(pperp: &[Vec<f64>], w: &[f64], c: &[f64]) -> f64 {
    c.iter()
        .enumerate()
        .map(|(i, &ci)| {
            let wi_ci = w[i] * ci;
            pperp[i]
                .iter()
                .zip(c.iter())
                .map(|(&pij, &cj)| wi_ci * pij * cj)
                .sum::<f64>()
        })
        .sum()
}

// ---------------------------------------------------------------------------
// Main test
// ---------------------------------------------------------------------------

#[test]
fn faultobs_matches_numpy_scipy_on_real_de440_rows() {
    let net: serde_json::Value =
        serde_json::from_str(NETWORK_JSON).expect("network.json must be valid JSON");
    let reference: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("reference.json must be valid JSON");

    // ── Load G and per-measurement weights from the shared fixture ────────────────────
    let g: Vec<Vec<f64>> = net["rows"]
        .as_array()
        .expect("rows must be an array")
        .iter()
        .map(as_f64_vec)
        .collect();
    let sigma = as_f64_vec(&net["sigma"]);
    let n_meas = g.len();
    let state_dim = g[0].len();
    assert_eq!(sigma.len(), n_meas, "one sigma per measurement row");
    assert_eq!(
        n_meas,
        net["n_rows"].as_u64().unwrap() as usize,
        "row count matches declared n_rows"
    );
    let w: Vec<f64> = sigma.iter().map(|&s| 1.0 / (s * s)).collect();

    // ── (1) Weighted parity projector P⊥ ──────────────────────────────────────────────
    let pperp = parity_projector(&g, &w);
    assert_eq!(pperp.len(), n_meas, "P⊥ must be n×n");

    let ref_pperp: Vec<Vec<f64>> = reference["pperp"]
        .as_array()
        .expect("reference pperp must be an array")
        .iter()
        .map(as_f64_vec)
        .collect();
    assert_eq!(ref_pperp.len(), n_meas, "reference P⊥ row count");

    let mut max_abs = 0.0_f64;
    let mut max_rel = 0.0_f64;
    for (i, (got_row, exp_row)) in pperp.iter().zip(ref_pperp.iter()).enumerate() {
        for (j, (&got, &exp)) in got_row.iter().zip(exp_row.iter()).enumerate() {
            check(&format!("pperp[{i}][{j}]"), got, exp);
            let a = (got - exp).abs();
            max_abs = max_abs.max(a);
            if exp.abs() >= 1e-3 {
                max_rel = max_rel.max(a / exp.abs());
            }
        }
    }

    // Integer rank invariants (trace of the oblique projector == parity dimension).
    let trace: f64 = (0..n_meas).map(|i| pperp[i][i]).sum();
    let ref_parity_dim = reference["parity_dim"].as_u64().unwrap() as usize;
    let ref_rank_g = reference["rank_G"].as_u64().unwrap() as usize;
    assert_eq!(
        trace.round() as usize,
        ref_parity_dim,
        "trace(P⊥) must equal parity_dim: got {trace:.6}, expected {ref_parity_dim}"
    );
    assert_eq!(
        n_meas - trace.round() as usize,
        ref_rank_g,
        "n − trace(P⊥) must equal rank(G) = {ref_rank_g}"
    );
    check(
        "pperp_trace",
        trace,
        reference["pperp_trace"].as_f64().unwrap(),
    );
    let fro = pperp
        .iter()
        .flat_map(|r| r.iter())
        .map(|&x| x * x)
        .sum::<f64>()
        .sqrt();
    check("pperp_fro", fro, reference["pperp_fro"].as_f64().unwrap());

    // ── (2) Detectability ‖P⊥·b‖ for each fault vector ────────────────────────────────
    for (name, b_json) in net["fault_vectors"].as_object().unwrap() {
        let b = as_f64_vec(b_json);
        let (det, norm) = is_detectable(&pperp, &b, 1e-8);
        let ref_entry = &reference["detectability"][name];
        let ref_norm = ref_entry["norm"].as_f64().unwrap();
        let ref_det = ref_entry["detectable"].as_bool().unwrap();
        check(&format!("detect[{name}].norm"), norm, ref_norm);
        assert_eq!(
            det, ref_det,
            "detect[{name}]: detectable flag got {det} expected {ref_det} (‖P⊥b‖={norm:.3e})"
        );
    }

    // ── (3) MDB non-centrality quadratic form cᵀWP⊥c and MDB = √(λ₀/q) ────────────────
    let ref_mdb = reference["mdb"].as_array().unwrap();
    for d in net["mdb_directions"].as_array().unwrap() {
        let name = d["name"].as_str().unwrap();
        let c = as_f64_vec(&d["c"]);
        let ncp = d["ncp"].as_f64().unwrap();
        let detectable = d["detectable"].as_bool().unwrap();

        let ref_entry = ref_mdb
            .iter()
            .find(|e| e["name"].as_str().unwrap() == name)
            .unwrap_or_else(|| panic!("reference mdb entry for {name} missing"));

        // Quadratic form (quantity 3), recomputed and compared to the oracle.
        let q = quad_form(&pperp, &w, &c);
        check(
            &format!("mdb[{name}].q"),
            q,
            ref_entry["q"].as_f64().unwrap(),
        );

        let mdb_val = mdb(&pperp, &w, &c, ncp);
        if detectable {
            let ref_m = ref_entry["mdb"]
                .as_f64()
                .unwrap_or_else(|| panic!("reference mdb for detectable {name} must be a float"));
            check(&format!("mdb[{name}].mdb"), mdb_val, ref_m);
            assert!(
                mdb_val.is_finite() && mdb_val > 0.0,
                "mdb[{name}] must be finite positive, got {mdb_val}"
            );
        } else {
            // Undetectable direction: c ∈ range(G) ⇒ q ≈ 0 ⇒ MDB → ∞. The oracle stores
            // mdb: null; the crate returns a huge/infinite value.
            assert!(
                ref_entry["mdb"].is_null(),
                "reference mdb for undetectable {name} should be null"
            );
            assert!(
                mdb_val > 1e3 || mdb_val.is_infinite(),
                "mdb[{name}] for undetectable direction must be huge/∞, got {mdb_val}"
            );
        }
    }

    // ── (4) Byzantine block-spark counts for each peer coalition ──────────────────────
    for (name, peers_json) in net["peer_coalitions"].as_object().unwrap() {
        let peers: Vec<Vec<Vec<f64>>> = peers_json
            .as_array()
            .unwrap()
            .iter()
            .map(|inc| peer_signature(n_meas, &as_usize_vec(inc)))
            .collect();
        let cls = byzantine_bound(&peers, &pperp, 1e-9);
        let ref_b = &reference["block_spark"][name];
        assert_eq!(
            cls.block_spark,
            ref_b["block_spark"].as_u64().unwrap() as usize,
            "block_spark[{name}]"
        );
        assert_eq!(
            cls.f_detect,
            ref_b["f_detect"].as_u64().unwrap() as usize,
            "f_detect[{name}]"
        );
        assert_eq!(
            cls.f_identify,
            ref_b["f_identify"].as_u64().unwrap() as usize,
            "f_identify[{name}]"
        );
    }

    println!(
        "faultobs anchor: n_meas={n_meas} state_dim={state_dim} rank(G)={ref_rank_g} \
         parity_dim={ref_parity_dim}"
    );
    println!("  P⊥ agreement: max_abs={max_abs:.3e}  max_rel={max_rel:.3e}  (both < 1e-3)");
}
