// SPDX-License-Identifier: AGPL-3.0-only
//! Reproducibility generator for the P3 common-mode-integrity manuscript.
//!
//! Regenerates every quantitative result the paper reports, directly from the
//! committed engine (`kshana::lunar_common_mode`) and the vendored real-data
//! fixture, so each number is traceable to one run:
//!
//!   - Part A (ANALYTIC): the theorem, numerically. On a spread constellation a
//!     pure common-mode error `δy = G·δ` splits with `blind_fraction = 1`,
//!     `detectable_norm = 0`, and the absorbed `blind_dx` recovers the injected
//!     state `δ` exactly — a common-mode error lives entirely in `range(G)` and
//!     is invisible to *any* snapshot RAIM/ARAIM residual test.
//!   - Part B (linear algebra CHECKED vs numpy, on REAL inter-ephemeris input): for each
//!     of the two provider pairs (DE440-INPOP21a, DE440-EPM2021), over 366
//!     epochs, the median absorbed position error `‖blind_dx[0..3]‖`, median
//!     `blind_fraction`, and median `detectable_norm` of the REAL geocentric-Moon
//!     disagreement fed through the engine's common-mode split. The ≈2 m real
//!     inter-ephemeris floor is absorbed as user position error with a
//!     structurally-zero parity residual: ARAIM passes while the position is wrong.
//!   - Part C (MODELLED): the integrity envelope. A Modelled rank-1 common-mode
//!     measurement covariance sized to the ≈2 m floor yields a Common-mode
//!     Protection Level (CMPL) via `cmpl_horizontal` with `k = K_H = 6.0` (the 2-D
//!     horizontal Rayleigh factor); combined with a
//!     clearly-labelled *representative* ARAIM HPL it shows the user's true
//!     horizontal integrity envelope `hpl_total = hpl_araim + cmpl` exceeds the
//!     ARAIM HPL by a real additive term ARAIM omits.
//!
//! HONESTY BOUNDARY.
//!   - Part A is exact linear algebra (analytic; no stochastic or external-oracle
//!     content). It holds for any full-rank geometry.
//!   - Part B is MODELLED: the common-mode split is reproduced against an
//!     independent numpy computation in
//!     `tests/lunar_common_mode_integrity_reference.rs`, run on the REAL
//!     DE440-vs-INPOP21a / DE440-vs-EPM2021 geocentric-Moon disagreement. Only the
//!     parity-projection / least-squares linear algebra is checked against numpy; the lunar
//!     constellation (user + 8 satellites) is MODELLED (see the fixture NOTICE.md).
//!   - Part C is FULLY MODELLED: representative common-mode covariance,
//!     representative constellation, and a representative (illustrative, NOT
//!     Validated) ARAIM HPL. No certified standard, no TRL claim.
//!
//! Run: `cargo run --example p3_common_mode_integrity`

use kshana::lunar_common_mode::{
    blind_position_covariance, cmpl_horizontal, common_mode_split, geometry_from_los,
    integrity_envelope,
};

// Vendored fixture — baked at compile time; no runtime I/O.
const REFERENCE_JSON: &str = include_str!("../tests/fixtures/common_mode/reference.json");

/// The horizontal protection-level multiplier `K_H`: the 2-D Rayleigh factor
/// (~6.0 in the SBAS/ARAIM convention) applied to the semi-major axis of the 1-σ
/// horizontal error ellipse. (The *vertical* PL uses the 1-D Gaussian `K_V ≈ 5.33`;
/// a horizontal PL uses the larger 2-D factor — using `K_V` for a horizontal bound
/// would under-scale it.)
const K_H: f64 = 6.0;

/// A **representative, illustrative** lunar ARAIM horizontal protection level, in
/// metres. This is NOT a Validated number: it is a stand-in in the typical
/// O(10-30 m) range for a sparse lunar constellation, used only to show how the
/// CMPL adds on top of whatever the ARAIM HPL is. The manuscript must cite this as
/// representative / Modelled.
const HPL_ARAIM_REPRESENTATIVE_M: f64 = 15.0;

// ── small helpers ─────────────────────────────────────────────────────────────

/// Euclidean norm of a 3-vector.
fn norm3(v: &[f64]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// Median of a slice (copies + sorts). Callers guarantee non-empty.
fn median(xs: &[f64]) -> f64 {
    let mut v = xs.to_vec();
    v.sort_by(|a, b| a.partial_cmp(b).expect("finite values, no NaN"));
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// Parse a JSON array of f64.
fn as_f64_vec(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("expected JSON array")
        .iter()
        .map(|x| x.as_f64().expect("expected float"))
        .collect()
}

/// `y = G·d` — the pure `range(G)` measurement error induced by a state error `d`
/// (position+clock). Row `gᵢ = [-eᵢ, 1]`, so `yᵢ = gᵢ·d`.
fn g_times(g: &[[f64; 4]], d: [f64; 4]) -> Vec<f64> {
    g.iter()
        .map(|row| row.iter().zip(d.iter()).map(|(a, b)| a * b).sum())
        .collect()
}

/// Rank-1 common-mode covariance `u ⊗ uᵀ` (unit variance) from a measurement-space
/// direction `u`. Models the common-mode error as a unit-std scalar amplitude times
/// the fixed pattern `u`; the induced blind position covariance is then
/// `(S·u)(S·u)ᵀ`, whose 1-σ magnitude along `S·u` equals `‖S·u‖`.
fn outer(u: &[f64]) -> Vec<Vec<f64>> {
    u.iter()
        .map(|&ui| u.iter().map(|&uj| ui * uj).collect())
        .collect()
}

fn main() {
    println!("# P3 common-mode integrity — canonical numbers\n");

    // ── Load the Modelled constellation + real-data records from the fixture ────
    let root: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("reference.json must be valid JSON");

    let cons = &root["constellation"];
    let user_v = as_f64_vec(&cons["user"]);
    let user: [f64; 3] = [user_v[0], user_v[1], user_v[2]];
    let sats: Vec<[f64; 3]> = cons["sats"]
        .as_array()
        .expect("sats must be an array")
        .iter()
        .map(|s| {
            let a = as_f64_vec(s);
            [a[0], a[1], a[2]]
        })
        .collect();
    let n = sats.len();

    // The single engine geometry used by all three parts: rows gᵢ = [-eᵢ, 1].
    let g = geometry_from_los(user, &sats)
        .expect("Modelled constellation must yield a full-rank RAIM geometry");
    assert_eq!(g.len(), n, "one geometry row per satellite");

    // ── Part A — the theorem, numerically [ANALYTIC] ────────────────────────────
    println!("## Part A — a pure common-mode error is perfectly blind [ANALYTIC]");
    println!(
        "  ({n}-satellite spread lunar constellation; user r = {:.1} m)\n",
        norm3(&user)
    );

    // Inject a pure state error δ (position 3 + clock) and form δy = G·δ, a
    // measurement error that lives entirely in range(G).
    let delta: [f64; 4] = [1.0, -2.0, 0.5, 3.0];
    let delta_y = g_times(&g, delta);
    let split = common_mode_split(&g, &delta_y).expect("nonzero range(G) error must split");

    println!(
        "  injected state δ         = [{:.3}, {:.3}, {:.3}, {:.3}]  (x,y,z,clock)",
        delta[0], delta[1], delta[2], delta[3]
    );
    println!(
        "  absorbed blind_dx        = [{:.9}, {:.9}, {:.9}, {:.9}]",
        split.blind_dx[0], split.blind_dx[1], split.blind_dx[2], split.blind_dx[3]
    );
    println!(
        "  blind_fraction           = {:.15}   (theorem: 1)",
        split.blind_fraction
    );
    println!(
        "  detectable_norm (parity) = {:.3e} m   (theorem: 0)",
        split.detectable_norm
    );
    let recover_err: f64 = split
        .blind_dx
        .iter()
        .zip(delta.iter())
        .map(|(a, b)| (a - b).abs())
        .fold(0.0_f64, f64::max);
    println!("  max |blind_dx − δ|       = {recover_err:.3e}   (blind_dx recovers δ)\n");
    println!("  Takeaway: δy = G·δ lies entirely in range(G); the parity projector P⊥");
    println!("  annihilates it, so it is invisible to ANY snapshot RAIM/ARAIM residual");
    println!("  test — yet the user silently absorbs it as the state error δ.");

    // ── Part B — the real anchor [linear algebra checked vs numpy; real input] ──
    println!("\n## Part B — real inter-ephemeris floor, absorbed & RAIM-invisible [MODELLED]");
    println!("  (REAL DE440-vs-INPOP21a / DE440-vs-EPM2021 geocentric-Moon disagreement,");
    println!("   366 epochs/pair, fed through the engine's common-mode split;");
    println!("   constellation MODELLED, split linear algebra CHECKED vs numpy)\n");

    let pairs = ["DE440-INPOP21a", "DE440-EPM2021"];
    let records = root["records"]
        .as_array()
        .expect("records must be an array");

    println!(
        "{:<18}  {:>8}  {:>22}  {:>18}  {:>22}",
        "pair", "epochs", "med |blind_dx_pos|(m)", "med blind_fraction", "med detectable_norm(m)"
    );
    println!("{}", "-".repeat(96));

    for pair in &pairs {
        let mut pos_errs: Vec<f64> = Vec::new();
        let mut blind_fracs: Vec<f64> = Vec::new();
        let mut det_norms: Vec<f64> = Vec::new();

        for rec in records {
            if rec["pair"].as_str().expect("pair") != *pair {
                continue;
            }
            let delta_y = as_f64_vec(&rec["delta_y"]);
            assert_eq!(delta_y.len(), n, "one δy per satellite");
            // Regenerate from the committed engine (do NOT trust stored fields).
            let s = common_mode_split(&g, &delta_y)
                .expect("nonzero real δy on a full-rank geometry must split");
            pos_errs.push(norm3(&s.blind_dx[0..3]));
            blind_fracs.push(s.blind_fraction);
            det_norms.push(s.detectable_norm);
        }

        // PIN-SCOPE:    the EPOCH COUNT of one provider pair in the committed
        //               tests/fixtures/inter_ephemeris sample — 366 rows, the 2-day
        //               cadence over 2024-2025 documented in that directory's NOTICE.md.
        //               It exists so a silently re-sampled or truncated fixture cannot
        //               change the medians printed below while still looking healthy.
        // PIN-EXCLUDES: every computed value. The split, the medians and the parity
        //               norms are printed, not asserted, anywhere in this example; the
        //               numerical agreement is pinned in
        //               tests/lunar_common_mode_integrity_reference.rs instead. Only the
        //               sample SIZE is fixed here, so re-sampling the ephemerides is a
        //               deliberate edit to this one number rather than a silent drift.
        assert_eq!(pos_errs.len(), 366, "expected 366 epochs for {pair}");
        println!(
            "{:<18}  {:>8}  {:>22.4}  {:>18.9}  {:>22.3e}",
            pair,
            pos_errs.len(),
            median(&pos_errs),
            median(&blind_fracs),
            median(&det_norms),
        );
    }

    println!();
    println!("  Takeaway: the REAL inter-ephemeris Moon-position disagreement is absorbed as");
    println!("  ≈2 m of user horizontal-plus position error with a STRUCTURALLY-ZERO parity");
    println!("  residual — ARAIM passes its residual test while the position is wrong. This");
    println!("  row is MODELLED (reproduced vs numpy in");
    println!("  tests/lunar_common_mode_integrity_reference.rs); the constellation is Modelled.");

    // ── Part C — the integrity envelope [MODELLED] ──────────────────────────────
    println!("\n## Part C — integrity envelope: ARAIM HPL omits the CMPL [MODELLED]");
    println!("  (representative common-mode covariance, representative constellation, and a");
    println!("   representative/illustrative ARAIM HPL — everything here is Modelled)\n");

    // Modelled common-mode covariance construction (documented for the manuscript):
    //   1. Pick a representative frame-translation offset Δs, magnitude sized to the
    //      ≈2 m inter-ephemeris floor from Part B, in a documented direction.
    //   2. The corresponding pure state error is d_frame = [-Δs; 0] (a common-mode
    //      translation absorbs as −Δs of position, zero clock — exactly the real
    //      Part-B mechanism, where blind_dx = −Δs).
    //   3. Its measurement-space signature is u = G·d_frame (uᵢ = eᵢ·Δs).
    //   4. cm_cov = u ⊗ uᵀ (unit-variance rank-1). The induced blind position
    //      covariance is (S·u)(S·u)ᵀ = Δs·Δsᵀ, so the 1-σ absorbed position error
    //      along Δs is exactly ‖Δs‖ ≈ 2 m — sized to the Part-B floor by construction.
    let sigma_frame_m = 2.0_f64; // representative inter-ephemeris floor (Part B: 2.01–2.40 m)
    let dir = {
        // Isotropic-ish documented direction; at this equatorial user Up=+x, so the
        // {y,z} components are horizontal (E,N) and x is vertical (radial).
        let raw = [1.0_f64, 1.0, 1.0];
        let nrm = norm3(&raw);
        [raw[0] / nrm, raw[1] / nrm, raw[2] / nrm]
    };
    let delta_s = [
        sigma_frame_m * dir[0],
        sigma_frame_m * dir[1],
        sigma_frame_m * dir[2],
    ];
    let d_frame: [f64; 4] = [-delta_s[0], -delta_s[1], -delta_s[2], 0.0];
    let u = g_times(&g, d_frame); // uᵢ = eᵢ·Δs
    let cm_cov = outer(&u);

    // Sanity: the blind position covariance's 1-σ magnitude should be ‖Δs‖ ≈ 2 m.
    let cpos = blind_position_covariance(&g, &cm_cov).expect("valid blind position covariance");
    let sigma_pos_1sigma = (cpos[0][0] + cpos[1][1] + cpos[2][2]).sqrt();

    let cmpl = cmpl_horizontal(&g, user, &cm_cov, K_H)
        .expect("Modelled common-mode covariance must give a finite CMPL");
    let env = integrity_envelope(HPL_ARAIM_REPRESENTATIVE_M, cmpl);

    println!("  Modelled common-mode covariance cm_cov = u ⊗ uᵀ,  u = G·[−Δs; 0]");
    println!("    ‖Δs‖ (frame offset, 1-σ)        = {sigma_frame_m:.4} m  (sized to Part-B floor)");
    println!(
        "    direction Δ̂s                    = [{:.4}, {:.4}, {:.4}]  (Up=+x ⇒ y,z horizontal)",
        dir[0], dir[1], dir[2]
    );
    println!("    ‖blind position 1-σ‖ (S cm_cov Sᵀ) = {sigma_pos_1sigma:.4} m  (≈ ‖Δs‖, as constructed)\n");
    println!("    hpl_araim (representative, K_H=6.0 ARAIM HPL) = {:.4} m   [ILLUSTRATIVE, not Validated]",
        env.hpl_araim);
    println!(
        "    cmpl      (K_H=6.0 blind horizontal PL)       = {:.4} m",
        env.cmpl
    );
    println!(
        "    hpl_total = hpl_araim + cmpl                 = {:.4} m",
        env.hpl_total
    );
    println!();
    println!(
        "  Takeaway: the CMPL ({:.2} m) is a real additive term the ARAIM HPL omits — the",
        env.cmpl
    );
    println!("  common-mode (blind) class carries zero parity residual, so the user's TRUE");
    println!(
        "  horizontal integrity envelope ({:.2} m) exceeds the ARAIM HPL ({:.2} m).",
        env.hpl_total, env.hpl_araim
    );

    // ── Honesty banner ──────────────────────────────────────────────────────────
    println!();
    println!("─────────────────────────────────────────────────────────────────────────────");
    println!("HONESTY: Part A is exact analytic linear algebra. Part B is numpy-checked linear");
    println!("  algebra on REAL DE440/INPOP/EPM inter-ephemeris data (reproduced vs numpy in");
    println!("  tests/lunar_common_mode_integrity_reference.rs); its constellation is Modelled.");
    println!("  Part C is FULLY MODELLED: representative common-mode covariance, geometry, and");
    println!("  an illustrative (NOT Validated) ARAIM HPL. No certified standard, no TRL claim.");
    println!("─────────────────────────────────────────────────────────────────────────────");
}
