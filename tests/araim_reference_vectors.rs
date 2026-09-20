// SPDX-License-Identifier: AGPL-3.0-only
//! ARAIM certification reference vectors — the engine's HPL/VPL against the
//! **published worked numerical examples** of the EU-U.S. Working Group C ARAIM
//! Technical Subgroup reference airborne algorithm.
//!
//! This is the ARAIM counterpart of `tests/sbas_reference.rs` (DO-229E HPL against
//! an independent RTKLIB fork on real EGNOS data) and `tests/raim_reference.rs`
//! (the statistical kernel against SciPy). What it adds over
//! `tests/araim_dual_real_data.rs` is the only thing that file could not supply:
//! an **oracle outside the codebase**. `araim_dual_real_data.rs` runs the engine on
//! real Celestrak TLE geometry and then checks *relations* the answer must satisfy
//! — pooling a constellation cannot raise the protection level, a
//! constellation-fault hypothesis must cost availability, a looser alert limit must
//! help. Every one of those is a self-consistency property; none of them says what
//! a protection level should be. Here the WG-C documents state the geometry, the
//! error variances, the priors, the budget split **and the answer**, and the
//! engine has to land on it.
//!
//! # The oracle
//!
//! Two published vectors, both transcribed into
//! `tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt` with their
//! retrieval URL, date, file SHA-256 and page, and both compiled into
//! `kshana::araim_reference::published_vectors()`. The first test in this file
//! asserts those two copies agree, so no published figure can be edited on one
//! side to make a check pass.
//!
//! * `add-v3.1-appendix-d` — Reference Airborne Algorithm Description Document
//!   v3.1 (20 June 2019), Appendix D. Self-consistent, and therefore the
//!   **acceptance vector**.
//! * `milestone3-annex-a-ix` — Milestone 3 Report (25 February 2016), Annex A
//!   §A.IX: the document the research bibliographies cite. It carries two internal
//!   defects (a sign typo in the geometry and a `K_fa` evaluated at 57 fault modes
//!   while stating `N_fault,max = 1`, i.e. 12), so its protection levels are
//!   reported as **measured discrepancies**, never graded — and the defects are
//!   demonstrated by running the document's own numbers, not asserted.
//!
//! # The tolerance
//!
//! `TOL_PL = 5 × 10⁻² m`, the "tolerance for the computation of the Protection
//! Level" in the sources' own list of constants; both documents require the output
//! protection level to be within `TOL_PL` of the solution of the protection-level
//! equation. Nothing here is widened to fit.

use kshana::araim_reference::{
    araim_reference_protection_levels, published_vectors, PublishedVector, ReferenceCase,
    ReferenceResult, MILESTONE3_ROW3_UP_AS_PRINTED,
};

const FIXTURE: &str = include_str!("fixtures/araim_reference/wgc_araim_reference_vectors.txt");

/// The published intermediates are printed to four decimals, so a faithful
/// reproduction may differ from the printed text by up to half a unit in the last
/// place. This is a rounding allowance on the *source's* precision, not a
/// tolerance on the engine.
const PRINTED_DECIMAL_ALLOWANCE_M: f64 = 5e-5;

/// One record of the transcription fixture.
#[derive(Default, Debug)]
struct FixtureVector {
    id: String,
    url: String,
    retrieved: String,
    sha256: String,
    constellations: usize,
    b_nom_m: f64,
    p_sat: f64,
    p_const: f64,
    tol_pl_m: f64,
    rows: Vec<(f64, f64, f64, usize)>,
    row3_up_sign_corrected: Option<f64>,
    c_int: Vec<f64>,
    c_acc: Vec<f64>,
    k_fa3: f64,
    n_fault_modes_in_k_fa: usize,
    const_sigma3: Vec<f64>,
    const_sigma_ss3: Vec<f64>,
    const_b3: Vec<f64>,
    vpl_m: f64,
    hpl_m: f64,
    emt_m: f64,
    sigma_v_acc_m: f64,
    pl_reproducible: bool,
}

fn nums(rest: &str) -> Vec<f64> {
    rest.split_whitespace()
        .map(|t| {
            t.parse::<f64>()
                .unwrap_or_else(|e| panic!("bad number {t:?}: {e}"))
        })
        .collect()
}

fn parse_fixture() -> Vec<FixtureVector> {
    let mut out: Vec<FixtureVector> = Vec::new();
    let mut cur: Option<FixtureVector> = None;
    for line in FIXTURE.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let (key, rest) = match line.split_once(' ') {
            Some((k, r)) => (k, r.trim()),
            None => (line, ""),
        };
        if key == "VECTOR" {
            assert!(cur.is_none(), "VECTOR inside an unterminated record");
            cur = Some(FixtureVector {
                id: rest.to_string(),
                ..Default::default()
            });
            continue;
        }
        if key == "END" {
            out.push(cur.take().expect("END outside a record"));
            continue;
        }
        let v = cur.as_mut().expect("field outside a record");
        match key {
            "URL" => v.url = rest.to_string(),
            "RETRIEVED" => v.retrieved = rest.to_string(),
            "SHA256" => v.sha256 = rest.to_string(),
            "CONSTELLATIONS" => v.constellations = rest.parse().expect("integer"),
            // sigma_URA / sigma_URE are recorded for the C_int - C_acc identity the
            // next test checks; they are not separate engine inputs.
            "SIGMA_URA_M" | "SIGMA_URE_M" => {}
            "B_NOM_M" => v.b_nom_m = nums(rest)[0],
            "P_SAT" => v.p_sat = nums(rest)[0],
            "P_CONST" => v.p_const = nums(rest)[0],
            "TOL_PL_M" => v.tol_pl_m = nums(rest)[0],
            "GROW" => {
                let n = nums(rest);
                assert_eq!(n.len(), 4, "GROW needs east north up constellation");
                v.rows.push((n[0], n[1], n[2], n[3] as usize));
            }
            "ROW3_UP_SIGN_CORRECTED" => v.row3_up_sign_corrected = Some(nums(rest)[0]),
            "CINT" => v.c_int = nums(rest),
            "CACC" => v.c_acc = nums(rest),
            "KFA3" => v.k_fa3 = nums(rest)[0],
            "NFAULTMODES_IN_KFA" => v.n_fault_modes_in_k_fa = rest.parse().expect("integer"),
            "CONST_SIGMA3" => v.const_sigma3 = nums(rest),
            "CONST_SIGMASS3" => v.const_sigma_ss3 = nums(rest),
            "CONST_B3" => v.const_b3 = nums(rest),
            "VPL_M" => v.vpl_m = nums(rest)[0],
            "HPL_M" => v.hpl_m = nums(rest)[0],
            "EMT_M" => v.emt_m = nums(rest)[0],
            "SIGMA_V_ACC_M" => v.sigma_v_acc_m = nums(rest)[0],
            "PL_REPRODUCIBLE" => v.pl_reproducible = rest == "yes",
            other => panic!("unknown fixture key {other:?}"),
        }
    }
    assert!(cur.is_none(), "unterminated fixture record");
    assert_eq!(out.len(), 2, "expected both published vectors");
    out
}

fn vector(id: &str) -> PublishedVector {
    published_vectors()
        .into_iter()
        .find(|v| v.id == id)
        .unwrap_or_else(|| panic!("no published vector {id}"))
}

fn run(case: &ReferenceCase) -> ReferenceResult {
    araim_reference_protection_levels(case).expect("the reference algorithm runs")
}

#[test]
fn the_committed_transcription_matches_the_compiled_reference_constants() {
    // The fixture and `published_vectors()` are two independent copies of the same
    // published figures. If they ever disagree, one of them was edited — which is
    // exactly the failure mode a fabricated certification fixture would look like.
    for f in parse_fixture() {
        let v = vector(&f.id);
        assert_eq!(v.url, f.url, "{}: url", f.id);
        assert_eq!(v.retrieved, f.retrieved, "{}: retrieval date", f.id);
        assert_eq!(v.source_sha256, f.sha256, "{}: source SHA-256", f.id);
        assert_eq!(v.tolerance_m, f.tol_pl_m, "{}: TOL_PL", f.id);
        assert_eq!(v.vpl_m, f.vpl_m, "{}: published VPL", f.id);
        assert_eq!(v.hpl_m, f.hpl_m, "{}: published HPL", f.id);
        assert_eq!(v.emt_m, f.emt_m, "{}: published EMT", f.id);
        assert_eq!(
            v.sigma_v_acc_m, f.sigma_v_acc_m,
            "{}: published sigma_v_acc",
            f.id
        );
        assert_eq!(v.k_fa_vert, f.k_fa3, "{}: published K_fa,3", f.id);
        assert_eq!(
            v.n_fault_modes_in_k_fa, f.n_fault_modes_in_k_fa,
            "{}: N_fault modes in the published K_fa",
            f.id
        );
        assert_eq!(
            v.protection_levels_reproducible, f.pl_reproducible,
            "{}: PL_REPRODUCIBLE",
            f.id
        );
        assert_eq!(
            v.constellation_sigma_up_m.to_vec(),
            f.const_sigma3,
            "{}: published sigma_3^(k)",
            f.id
        );
        assert_eq!(
            v.constellation_sigma_ss_up_m.to_vec(),
            f.const_sigma_ss3,
            "{}: published sigma_ss,3^(k)",
            f.id
        );
        assert_eq!(
            v.constellation_bias_up_m.to_vec(),
            f.const_b3,
            "{}: published b_3^(k)",
            f.id
        );

        // Inputs.
        assert_eq!(v.case.constellations, f.constellations, "{}", f.id);
        assert_eq!(v.case.b_nom_m, f.b_nom_m, "{}: b_nom", f.id);
        assert_eq!(v.case.p_sat, f.p_sat, "{}: P_sat", f.id);
        assert_eq!(v.case.p_const, f.p_const, "{}: P_const", f.id);
        assert_eq!(v.case.satellites.len(), f.rows.len(), "{}: row count", f.id);
        for (i, s) in v.case.satellites.iter().enumerate() {
            let (e, n, u, c) = f.rows[i];
            // Where the source's print carries a recorded sign defect, the compiled
            // case uses the corrected value; every other component is verbatim.
            let expected_up = match (i, f.row3_up_sign_corrected) {
                (2, Some(corrected)) => corrected,
                _ => u,
            };
            assert_eq!(s.east, e, "{}: row {i} east", f.id);
            assert_eq!(s.north, n, "{}: row {i} north", f.id);
            assert_eq!(s.up, expected_up, "{}: row {i} up", f.id);
            assert_eq!(s.constellation, c, "{}: row {i} constellation", f.id);
            assert_eq!(s.c_int_m2, f.c_int[i], "{}: row {i} C_int", f.id);
            assert_eq!(s.c_acc_m2, f.c_acc[i], "{}: row {i} C_acc", f.id);
        }
        if let Some(corrected) = f.row3_up_sign_corrected {
            assert_eq!(
                f.rows[2].2, MILESTONE3_ROW3_UP_AS_PRINTED,
                "{}: the as-printed row 3 Up component",
                f.id
            );
            assert_eq!(corrected, -MILESTONE3_ROW3_UP_AS_PRINTED);
        }
    }
}

#[test]
fn the_add_v3_1_worked_example_reproduces_within_the_references_own_tol_pl() {
    // THE ACCEPTANCE GATE. The tolerance is TOL_PL = 5e-2 m, the value the source
    // itself specifies for a protection-level computation — not a number picked
    // here.
    let v = vector("add-v3.1-appendix-d");
    assert!(v.protection_levels_reproducible);
    let tol = v.tolerance_m;
    assert_eq!(tol, 5e-2, "TOL_PL must be the source's own 5e-2 m");
    let r = run(&v.case);

    // The fault-mode list the source states: N_fault,max = 1 gives 10
    // single-satellite plus 2 constellation modes, and the printed K_fa,3 is
    // evaluated at 2 x 12. Both are reproduced from the priors, not asserted.
    assert_eq!(r.n_fault_max, 1);
    assert_eq!(r.n_fault_modes, 12);
    assert_eq!(v.n_fault_modes_in_k_fa, r.n_fault_modes);
    let d_k = (r.k_fa_vert - v.k_fa_vert).abs();
    assert!(
        d_k < 5e-5,
        "K_fa,3: engine {:.6} vs published {:.4} (|Δ|={d_k:.2e})",
        r.k_fa_vert,
        v.k_fa_vert
    );

    // The geometry-derived intermediates the source tabulates for the two
    // constellation-fault modes.
    for (j, m) in r.constellation_modes.iter().enumerate() {
        for (name, got, want) in [
            ("sigma_3^(k)", m.sigma_up_m, v.constellation_sigma_up_m[j]),
            (
                "sigma_ss,3^(k)",
                m.sigma_ss_up_m,
                v.constellation_sigma_ss_up_m[j],
            ),
            ("b_3^(k)", m.bias_up_m, v.constellation_bias_up_m[j]),
        ] {
            let d = (got - want).abs();
            assert!(
                d <= PRINTED_DECIMAL_ALLOWANCE_M,
                "{name} mode {j}: engine {got:.6} m vs published {want} m (|Δ|={d:.2e})"
            );
        }
    }

    let d_vpl = (r.vpl_m - v.vpl_m).abs();
    let d_hpl = (r.hpl_m - v.hpl_m).abs();
    let d_emt = (r.emt_m - v.emt_m).abs();
    let d_sig = (r.sigma_v_acc_m - v.sigma_v_acc_m).abs();
    eprintln!(
        "WG-C ARAIM reference (ADD v3.1 App. D): VPL {:.4} vs 18.3 (Δ {d_vpl:.4} m); \
         HPL {:.4} vs 13.45 (Δ {d_hpl:.4} m); EMT {:.4} vs 7.2998 (Δ {d_emt:.2e} m); \
         σ_v,acc {:.4} vs 1.3694 (Δ {d_sig:.2e} m); TOL_PL {tol} m",
        r.vpl_m, r.hpl_m, r.emt_m, r.sigma_v_acc_m
    );
    assert!(
        d_vpl <= tol,
        "VPL: engine {:.6} m vs published {} m (|Δ|={d_vpl:.4} m > TOL_PL {tol} m)",
        r.vpl_m,
        v.vpl_m
    );
    assert!(
        d_hpl <= tol,
        "HPL: engine {:.6} m vs published {} m (|Δ|={d_hpl:.4} m > TOL_PL {tol} m)",
        r.hpl_m,
        v.hpl_m
    );
    // EMT carries no iteration tolerance of its own, so it is held to the source's
    // own printed precision — but EMT = K_fa,3 · σ_ss,3, so the half-unit rounding
    // on the printed σ_ss,3 propagates into it multiplied by K_fa,3. The bound is
    // therefore derived from the source's precision, not chosen: the allowance on
    // EMT's own last printed place plus K_fa,3 times the allowance on σ_ss,3's.
    let emt_allowance = PRINTED_DECIMAL_ALLOWANCE_M * (1.0 + r.k_fa_vert);
    assert!(
        d_emt <= emt_allowance,
        "EMT: engine {:.6} m vs published {} m (|Δ|={d_emt:.2e} m > propagated printed \
         allowance {emt_allowance:.2e} m)",
        r.emt_m,
        v.emt_m
    );
    assert!(
        d_sig <= PRINTED_DECIMAL_ALLOWANCE_M,
        "sigma_v,acc: engine {:.6} m vs published {} m (|Δ|={d_sig:.2e} m)",
        r.sigma_v_acc_m,
        v.sigma_v_acc_m
    );
    // The bound the VPL was solved for is actually met.
    assert!(r.achieved_risk_vert <= r.allocated_risk_vert * (1.0 + 1e-9));
}

#[test]
fn the_milestone3_worked_example_reproduces_its_geometry_intermediates_exactly() {
    // Every quantity of the cited 2016 example that its two internal defects cannot
    // touch — the sub-solution sigmas, the solution-separation sigmas, the nominal
    // bias projections and the all-in-view accuracy sigma — is reproduced to the
    // precision the document prints them at.
    let v = vector("milestone3-annex-a-ix");
    let r = run(&v.case);
    for (j, m) in r.constellation_modes.iter().enumerate() {
        for (name, got, want) in [
            ("sigma_3^(k)", m.sigma_up_m, v.constellation_sigma_up_m[j]),
            (
                "sigma_ss,3^(k)",
                m.sigma_ss_up_m,
                v.constellation_sigma_ss_up_m[j],
            ),
            ("b_3^(k)", m.bias_up_m, v.constellation_bias_up_m[j]),
        ] {
            let d = (got - want).abs();
            assert!(
                d <= PRINTED_DECIMAL_ALLOWANCE_M,
                "{name} mode {j}: engine {got:.6} m vs published {want} m (|Δ|={d:.2e})"
            );
        }
    }
    // sigma_v,acc is printed to two decimals here.
    let d_sig = (r.sigma_v_acc_m - v.sigma_v_acc_m).abs();
    assert!(
        d_sig <= 5e-3,
        "sigma_v,acc: engine {:.6} m vs published {} m (|Δ|={d_sig:.2e})",
        r.sigma_v_acc_m,
        v.sigma_v_acc_m
    );
}

#[test]
fn the_milestone3_protection_levels_are_recorded_as_a_measured_discrepancy() {
    // NOT GRADED, AND NOT WIDENED. The 2016 report states N_fault,max = 1 — which
    // its own rule confirms and which yields 12 monitored fault modes — but prints
    // K_fa,3 evaluated at 2 x 57, and its EMT follows that K_fa while its VPL and
    // HPL do not. No single conforming implementation can land on all of its
    // printed outputs, so this test states what the engine produces and what the
    // document says, and pins the fact that they differ.
    let v = vector("milestone3-annex-a-ix");
    assert!(!v.protection_levels_reproducible);
    let r = run(&v.case);
    assert_eq!(r.n_fault_max, 1, "the document's own rule gives 1");
    assert_eq!(r.n_fault_modes, 12, "N_fault,max = 1 means 12 fault modes");
    assert_eq!(
        v.n_fault_modes_in_k_fa, 57,
        "but the document's printed K_fa,3 is evaluated at 57"
    );

    let d_vpl = (r.vpl_m - v.vpl_m).abs();
    let d_hpl = (r.hpl_m - v.hpl_m).abs();
    let d_emt = (r.emt_m - v.emt_m).abs();
    eprintln!(
        "WG-C ARAIM reference (Milestone 3 A.IX, internally inconsistent): \
         VPL {:.4} vs 19.2 (Δ {d_vpl:.4} m); HPL {:.4} vs 14.5 (Δ {d_hpl:.4} m); \
         EMT {:.4} vs 8.3 (Δ {d_emt:.4} m, the document's stale 57-mode K_fa)",
        r.vpl_m, r.hpl_m, r.emt_m
    );
    // The VPL happens to land inside TOL_PL anyway; the HPL and EMT do not, and
    // that is the finding. Pinning both directions stops the discrepancy from
    // silently growing or from being "fixed" by tuning the engine.
    assert!(d_vpl <= v.tolerance_m, "measured VPL Δ = {d_vpl}");
    assert!(
        d_hpl > v.tolerance_m && d_hpl < 0.15,
        "measured HPL Δ = {d_hpl} m; expected a recorded discrepancy above TOL_PL"
    );
    assert!(
        d_emt > 0.4 && d_emt < 0.6,
        "measured EMT Δ = {d_emt} m; the document's EMT follows its 57-mode K_fa"
    );
}

// ---------------------------------------------------------------------------
// Negative controls — the check must be able to FAIL.
//
// A reference comparison that passes for the wrong reasons is worse than none.
// Each control below perturbs exactly one modelling decision and asserts the
// published answer is then MISSED by more than the reference's own tolerance, so
// the acceptance test above cannot be passing vacuously.
// ---------------------------------------------------------------------------

/// The measured miss of the published VPL for a perturbed case.
fn vpl_miss(case: &ReferenceCase, published_vpl_m: f64) -> f64 {
    (run(case).vpl_m - published_vpl_m).abs()
}

#[test]
fn negative_control_dropping_the_nominal_bias_misses_the_published_vpl() {
    let v = vector("add-v3.1-appendix-d");
    let mut case = v.case.clone();
    case.b_nom_m = 0.0;
    let miss = vpl_miss(&case, v.vpl_m);
    eprintln!("negative control (b_nom = 0): VPL misses 18.3 m by {miss:.4} m");
    assert!(
        miss > v.tolerance_m,
        "with b_nom = 0 the VPL still matched to {miss} m — the check is vacuous"
    );
}

#[test]
fn negative_control_a_ten_percent_error_in_b_nom_misses_the_published_vpl() {
    // Resolution: the comparison binds at the tolerance scale, so a 10 % error in a
    // single ISM input is caught rather than absorbed.
    let v = vector("add-v3.1-appendix-d");
    let mut case = v.case.clone();
    case.b_nom_m = 0.45;
    let miss = vpl_miss(&case, v.vpl_m);
    eprintln!("negative control (b_nom 0.5 -> 0.45): VPL misses 18.3 m by {miss:.4} m");
    assert!(miss > v.tolerance_m, "10 % b_nom error absorbed: {miss} m");
}

#[test]
fn negative_control_the_wrong_fault_mode_count_in_k_fa_misses_the_published_vpl() {
    // K_fa,3 = Q^-1(P_FA_VERT / 2N). Scaling P_FA_VERT by 12/57 reproduces exactly
    // the K_fa the 2016 report printed for 57 modes while 12 are monitored — the
    // defect that report carries. It must not pass as the 2019 example's answer.
    let v = vector("add-v3.1-appendix-d");
    let mut case = v.case.clone();
    case.constants.p_fa_vert *= 12.0 / 57.0;
    let r = run(&case);
    let miss = (r.vpl_m - v.vpl_m).abs();
    eprintln!(
        "negative control (K_fa,3 at 57 modes = {:.4}): VPL misses 18.3 m by {miss:.4} m",
        r.k_fa_vert
    );
    assert!(
        (r.k_fa_vert - 5.3953).abs() < 5e-5,
        "the control should reproduce the 57-mode K_fa, got {}",
        r.k_fa_vert
    );
    assert!(miss > v.tolerance_m, "wrong K_fa absorbed: {miss} m");
}

#[test]
fn negative_control_an_integrity_variance_error_misses_the_published_vpl() {
    // The resolution of the check, measured rather than asserted: the miss is swept
    // over an error in the integrity covariance C_int and the smallest one TOL_PL
    // catches is reported. A 1 % variance error is genuinely BELOW the reference's
    // own tolerance and is not caught — an honest limit of what a 5 cm bar on an
    // 18 m protection level can resolve — while 2 % and above are.
    let v = vector("add-v3.1-appendix-d");
    let mut misses = Vec::new();
    for pct in [1.0_f64, 2.0, 5.0] {
        let mut case = v.case.clone();
        for s in case.satellites.iter_mut() {
            s.c_int_m2 *= 1.0 + pct / 100.0;
        }
        let miss = vpl_miss(&case, v.vpl_m);
        misses.push((pct, miss));
    }
    eprintln!(
        "negative control (C_int error sweep): {}",
        misses
            .iter()
            .map(|(p, m)| format!("+{p} % -> VPL misses 18.3 m by {m:.4} m"))
            .collect::<Vec<_>>()
            .join("; ")
    );
    for (pct, miss) in &misses {
        if *pct >= 2.0 {
            assert!(
                *miss > v.tolerance_m,
                "a {pct} % integrity-variance error was absorbed: {miss} m"
            );
        }
    }
    // Monotone in the error, so the sweep is measuring the perturbation and not
    // noise.
    assert!(misses[0].1 < misses[1].1 && misses[1].1 < misses[2].1);
}

#[test]
fn negative_control_the_milestone3_geometry_as_printed_cannot_produce_its_own_sigma() {
    // The claim "the 2016 print has a sign typo in row 3" is DEMONSTRATED here, not
    // assumed: with the Up component exactly as printed, the document's own
    // sigma_v,acc = 1.47 m is missed by a wide margin; with the sign the 2019
    // document prints, it is reproduced.
    let v = vector("milestone3-annex-a-ix");
    let mut as_printed = v.case.clone();
    as_printed.satellites[2].up = MILESTONE3_ROW3_UP_AS_PRINTED;
    let printed = run(&as_printed).sigma_v_acc_m;
    let corrected = run(&v.case).sigma_v_acc_m;
    eprintln!(
        "negative control (Milestone 3 row 3 Up as printed +0.7477): sigma_v,acc {printed:.4} m \
         vs published 1.47 m; with the corrected -0.7477 it is {corrected:.4} m"
    );
    assert!(
        (printed - v.sigma_v_acc_m).abs() > 0.5,
        "the as-printed geometry unexpectedly reproduced sigma_v,acc: {printed}"
    );
    assert!((corrected - v.sigma_v_acc_m).abs() <= 5e-3);
}

#[test]
fn negative_control_the_two_documents_answers_are_not_interchangeable() {
    // A check that would pass against either document's answer would be measuring
    // nothing. The 2019 example's VPL/HPL must MISS the 2016 example's published
    // VPL/HPL by more than TOL_PL, and vice versa.
    let a = vector("add-v3.1-appendix-d");
    let b = vector("milestone3-annex-a-ix");
    let ra = run(&a.case);
    let rb = run(&b.case);
    for (label, got, wrong, tol) in [
        ("ADD VPL vs MS3 published", ra.vpl_m, b.vpl_m, a.tolerance_m),
        ("ADD HPL vs MS3 published", ra.hpl_m, b.hpl_m, a.tolerance_m),
        ("MS3 VPL vs ADD published", rb.vpl_m, a.vpl_m, b.tolerance_m),
        ("MS3 HPL vs ADD published", rb.hpl_m, a.hpl_m, b.tolerance_m),
    ] {
        let d = (got - wrong).abs();
        assert!(
            d > tol,
            "{label}: {got:.4} m is within {tol} m of the OTHER document's {wrong} m"
        );
    }
}

#[test]
fn the_scenario_kind_publishes_the_comparison() {
    // The result is citable: running the kind emits every published figure with its
    // URL, retrieval date, source hash and page beside the engine's own number.
    let out = kshana::api::run_toml("kind = \"araim-reference-check\"\n")
        .expect("araim-reference-check dispatches");
    let v: serde_json::Value = serde_json::from_str(&out.json).expect("valid JSON");
    assert_eq!(v["kind"], "araim-reference-check");
    assert_eq!(v["acceptance_tolerance_m"], 5e-2);
    assert_eq!(v["acceptance_met"], true);
    let worst = v["worst_acceptance_error_m"].as_f64().expect("a number");
    assert!(worst <= 5e-2, "worst acceptance error {worst} m");
    let rows = v["vectors"].as_array().expect("vector rows");
    assert_eq!(rows.len(), 2);
    for row in rows {
        assert!(row["url"].as_str().expect("url").starts_with("https://"));
        assert_eq!(row["retrieved"], "2026-09-20");
        assert_eq!(
            row["source_sha256"].as_str().expect("hash").len(),
            64,
            "a SHA-256 of the retrieved source"
        );
        assert!(row["location"].as_str().expect("location").len() > 10);
        assert!(row["tolerance_source"]
            .as_str()
            .expect("tolerance source")
            .contains("TOL_PL"));
    }
}
