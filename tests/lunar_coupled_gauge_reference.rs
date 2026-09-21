// SPDX-License-Identifier: AGPL-3.0-only
//! Validated anchor: kshana's coupled-gauge linear algebra reproduced against an
//! independent numpy / LAPACK computation on real-DE440-derived observation rows.
//!
//! ## What is Validated
//!
//! The spatial columns 0..7 of every row in `network.json` carry the **real DE440
//! Moon PA-frame orientation** (computed by `examples/gen_coupled_gauge_rows.rs`
//! via `lunar_datum::orbiter_range_row_datum7`).  The beacon/orbiter *geometry* is
//! **Modelled** (documented, deterministic).
//!
//! The Validated claim is that the four kshana functions under test —
//! [`kshana::lunar_gauge::assemble_coupled_info`],
//! [`kshana::fim::sym_eig`],
//! [`kshana::lunar_gauge::classify_null_space`],
//! [`kshana::lunar_gauge::coupled_marginal_eigs`]
//! — reproduce the independent numpy / LAPACK outputs in `reference.json` to
//! **relative error < 1e-3 AND absolute error < 1e-3** on those rows.
//! Integer counts (defect, dim_spatial, dim_temporal, coupled_dim) must match
//! **exactly**.
//!
//! ## Networks
//! - **`well_posed`** (120 rows): full-rank Fisher (defect 0), diverse multi-epoch
//!   geometry.  Checks all 9 eigenvalues and the {scale, offset} Schur marginal.
//! - **`single_epoch`** (30 rows): `elapsed_s = 0` → rate column exactly zero →
//!   exact rate defect (defect 1, `dim_temporal = 1`).  Checks the classification
//!   as well as the marginal eigenvalues.
//!
//! ## Fixture consistency
//! Both `network.json` (Rust generator) and `reference.json` (numpy oracle) share the
//! same 6-dp-rounded row values.  The only Rust-vs-numpy difference is the eigensolver
//! (Jacobi vs LAPACK) and the pseudo-inverse kernel, both of which agree far inside 1e-3.

use kshana::fim::sym_eig;
use kshana::lunar_gauge::{assemble_coupled_info, classify_null_space, coupled_marginal_eigs};

const NETWORK_JSON: &str = include_str!("fixtures/coupled_gauge/network.json");
const REFERENCE_JSON: &str = include_str!("fixtures/coupled_gauge/reference.json");

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

/// P3-style check: absolute < 1e-3 always; relative < 1e-3 where |exp| >= 1e-3.
fn check(label: &str, network: &str, got: f64, exp: f64) {
    const ABS_TOL: f64 = 1e-3;
    const REL_TOL: f64 = 1e-3;

    let abs_err = (got - exp).abs();
    assert!(
        abs_err < ABS_TOL,
        "{network}/{label}: abs error {abs_err:.3e} >= {ABS_TOL:.0e}  \
         (got={got:.9e}  exp={exp:.9e})"
    );
    if exp.abs() >= ABS_TOL {
        let rel_err = abs_err / exp.abs();
        assert!(
            rel_err < REL_TOL,
            "{network}/{label}: rel error {rel_err:.3e} >= {REL_TOL:.0e}  \
             (got={got:.9e}  exp={exp:.9e})"
        );
    }
}

// ---------------------------------------------------------------------------
// Main test
// ---------------------------------------------------------------------------

#[test]
fn coupled_gauge_matches_numpy_on_real_de440_rows() {
    let net: serde_json::Value =
        serde_json::from_str(NETWORK_JSON).expect("network.json must be valid JSON");
    let reference: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("reference.json must be valid JSON");

    let sigma = net["sigma"].as_f64().expect("sigma must be float");

    let network_names = ["well_posed", "single_epoch"];

    for name in &network_names {
        let nw = &net["networks"][name];
        let ref_nw = &reference["networks"][name];

        // ── Load rows from the shared fixture ─────────────────────────────────────
        let rows: Vec<[f64; 9]> = nw["rows"]
            .as_array()
            .unwrap_or_else(|| panic!("{name}: rows must be an array"))
            .iter()
            .map(|r| {
                let v = as_f64_vec(r);
                assert_eq!(v.len(), 9, "{name}: each row must have 9 entries");
                [v[0], v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8]]
            })
            .collect();

        let expected_n_rows = nw["n_rows"].as_u64().expect("n_rows must be integer") as usize;
        assert_eq!(
            rows.len(),
            expected_n_rows,
            "{name}: row count mismatch (loaded {} vs declared {})",
            rows.len(),
            expected_n_rows
        );

        // ── Assemble Fisher via kshana ─────────────────────────────────────────────
        let info = assemble_coupled_info(&[(rows, sigma)]);
        assert_eq!(info.len(), 9, "{name}: Fisher must be 9x9");

        // ── 9 eigenvalues via fim::sym_eig (Jacobi) ───────────────────────────────
        let eig = sym_eig(&info);
        assert_eq!(
            eig.values.len(),
            9,
            "{name}: sym_eig must return 9 eigenvalues"
        );
        let ref_eigs = as_f64_vec(&ref_nw["eigenvalues"]);
        assert_eq!(
            ref_eigs.len(),
            9,
            "{name}: reference must have 9 eigenvalues"
        );

        for (k, (&got, &exp)) in eig.values.iter().zip(ref_eigs.iter()).enumerate() {
            check(&format!("eigenvalue[{k}]"), name, got, exp);
        }

        // ── Null-space classification ──────────────────────────────────────────────
        let cls = classify_null_space(&info, 1e-9);

        // Integer counts must match EXACTLY
        let ref_defect = ref_nw["defect"].as_u64().expect("defect must be integer") as usize;
        let ref_dim_spatial = ref_nw["dim_spatial"]
            .as_u64()
            .expect("dim_spatial must be integer") as usize;
        let ref_dim_temporal = ref_nw["dim_temporal"]
            .as_u64()
            .expect("dim_temporal must be integer") as usize;
        let ref_coupled_dim = ref_nw["coupled_dim"]
            .as_u64()
            .expect("coupled_dim must be integer") as usize;

        assert_eq!(
            cls.defect, ref_defect,
            "{name}/defect: got {} expected {}",
            cls.defect, ref_defect
        );
        assert_eq!(
            cls.dim_spatial, ref_dim_spatial,
            "{name}/dim_spatial: got {} expected {}",
            cls.dim_spatial, ref_dim_spatial
        );
        assert_eq!(
            cls.dim_temporal, ref_dim_temporal,
            "{name}/dim_temporal: got {} expected {}",
            cls.dim_temporal, ref_dim_temporal
        );
        assert_eq!(
            cls.coupled_dim, ref_coupled_dim,
            "{name}/coupled_dim: got {} expected {}",
            cls.coupled_dim, ref_coupled_dim
        );

        // p_st_norm: float check (both 0.0 for these networks → abs check passes)
        let ref_p_st_norm = ref_nw["p_st_norm"]
            .as_f64()
            .expect("p_st_norm must be float");
        check("p_st_norm", name, cls.p_st_norm, ref_p_st_norm);

        // ── {scale, offset} marginal eigenvalues (Schur complement) ───────────────
        let m_eigs = coupled_marginal_eigs(&info);
        let ref_m_eigs = as_f64_vec(&ref_nw["marginal_eigs"]);
        assert_eq!(
            ref_m_eigs.len(),
            2,
            "{name}: reference marginal_eigs must have 2 entries"
        );

        check("marginal_eigs[0]", name, m_eigs[0], ref_m_eigs[0]);
        check("marginal_eigs[1]", name, m_eigs[1], ref_m_eigs[1]);

        // Sanity: ascending order and positivity for the well_posed network
        assert!(
            m_eigs[0] <= m_eigs[1],
            "{name}: marginal eigenvalues must be ascending: [{:.4e}, {:.4e}]",
            m_eigs[0],
            m_eigs[1]
        );
        if *name == "well_posed" {
            assert!(
                m_eigs[0] > 0.0,
                "well_posed: marginal_eigs[0] must be strictly positive: {:.4e}",
                m_eigs[0]
            );
        }

        println!(
            "\n{name} ({expected_n_rows} rows): defect={} dim_spatial={} \
             dim_temporal={} coupled_dim={} p_st_norm={:.3e}",
            cls.defect, cls.dim_spatial, cls.dim_temporal, cls.coupled_dim, cls.p_st_norm,
        );
        println!("  marginal_eigs = [{:.4e}, {:.4e}]", m_eigs[0], m_eigs[1]);
    }
}
