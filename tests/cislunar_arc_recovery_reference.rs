// SPDX-License-Identifier: AGPL-3.0-only
//! Independent-estimator corroboration of the cislunar arc-length observability threshold.
//!
//! `cislunar-observability` reports an arc length at which a single range-only
//! inter-satellite link makes a spacecraft's CR3BP state observable. That verdict is a
//! rank read on `O = stack_k[H_k Φ_k]`, built from the **analytic** range Jacobian rows and
//! the **analytic variational** state-transition matrix; its square-root-information-filter
//! cross-check folds those same rows, so the agreement between them is a consistency check
//! between two numerical machines, not corroboration.
//!
//! `cislunar-arc-recovery` is the independent arbiter: a batch least-squares estimator that
//! actually recovers the state, whose measurement partials are **central finite differences
//! of the composed forward model**. This suite states what that estimator finds, in numbers:
//!
//! 1. the two boundaries on the published planar grid, beside the two Gramian thresholds,
//!    with their ratios — one corroborated, one not;
//! 2. the estimator's measured error curve against the Gramian's formal covariance curve,
//!    row by row (the quantitative corroboration of the formal machinery);
//! 3. a negative control proving the recovery criterion *can* fail — the planar-DRO family
//!    estimating a six-state, which no arc length recovers;
//! 4. parameterisation invariance — the same boundaries in Moon-centred polar coordinates;
//!    and
//! 5. a source-text guard that makes the independence claim enforceable rather than
//!    asserted: the estimator's own code may not mention the Jacobian, STM, SVD-rank or
//!    SRIF machinery at all.

use kshana::api::run_toml;
use serde_json::Value;

/// Run a scenario source and return its parsed result document.
fn run(src: &str) -> Value {
    let out = run_toml(src).unwrap_or_else(|e| panic!("scenario runs: {e:?}\n{src}"));
    serde_json::from_str(&out.json).expect("valid result JSON")
}

/// Pull an `f64` from a dotted path, panicking with the path on a miss.
fn num(doc: &Value, path: &str) -> f64 {
    let mut v = doc;
    for seg in path.split('.') {
        v = v
            .get(seg)
            .unwrap_or_else(|| panic!("missing `{path}` at `{seg}`"));
    }
    v.as_f64()
        .unwrap_or_else(|| panic!("`{path}` is not a number: {v}"))
}

/// The published planar grid: a six-hour arc sampled at 24 epochs, the grid the released
/// `cislunar-observability` document reports its rank transition on.
const PUBLISHED_GRID: &str = "kind = \"cislunar-arc-recovery\"\n";

/// The epoch grid step of the published configuration (hours).
const GRID_H: f64 = 6.0 / 23.0;

/// ORACLE (independent estimator): on the published planar four-state DRO grid, the
/// recovery estimator's two boundaries against the Gramian's two thresholds.
///
/// **The rank threshold is not corroborated as a recoverability boundary.** The Gramian's
/// `rank(O) = 4` criterion at the published `rel_tol = 1e-6` turns at 2.086957 h; the
/// estimator recovers the four-state from 0.782609 h — the first prefix that carries as
/// many measurements as states. Between the two, the state is recoverable while the rank
/// read calls it unobservable, because `rel_tol` is a relative singular-value convention
/// and not a statement about recoverability.
///
/// **The estimability threshold is corroborated exactly.** The Gramian's formal criterion
/// (1σ position ≤ 1 km at σ_range = 1 m) turns at 5.739130 h; the estimator's *measured*
/// Monte-Carlo RMS position error crosses the same bound in the same grid cell.
#[test]
fn the_estimator_disagrees_about_the_rank_threshold_and_agrees_about_estimability() {
    let doc = run(PUBLISHED_GRID);
    let claim = doc.get("claim_under_test").expect("claim block");

    assert!(
        claim["comparable"].as_bool().expect("comparable flag"),
        "the default run must fit the same observable the published threshold was measured on"
    );

    let gram_rank = num(claim, "gramian_rank_threshold_hours");
    let est_rank = num(claim, "estimator_noise_free_boundary_hours");
    let gram_est = num(claim, "gramian_estimability_threshold_hours");
    let est_est = num(claim, "estimator_estimability_boundary_hours");

    // The claim under test, on the published grid.
    assert!(
        (gram_rank - 8.0 * GRID_H).abs() < 1e-9,
        "the Gramian rank threshold moved off epoch 8 (2.086957 h): {gram_rank}"
    );
    // The estimator's noise-free recovery boundary: epoch 3, the first determined prefix.
    assert!(
        (est_rank - 3.0 * GRID_H).abs() < 1e-9,
        "the estimator's noise-free recovery boundary moved off epoch 3 (0.782609 h): {est_rank}"
    );
    let ratio = num(claim, "rank_ratio_estimator_over_gramian");
    assert!(
        (ratio - 0.375).abs() < 1e-9,
        "the rank-threshold ratio moved off 3/8: {ratio}"
    );
    assert!(
        claim["verdict"]
            .as_str()
            .expect("verdict")
            .starts_with("NOT CORROBORATED"),
        "the rank threshold must be reported as not corroborated, not quietly agreed with"
    );

    // The estimability threshold: measured and formal land in the same grid cell.
    assert!(
        (gram_est - 22.0 * GRID_H).abs() < 1e-9,
        "the Gramian estimability threshold moved off epoch 22 (5.739130 h): {gram_est}"
    );
    assert!(
        (est_est - gram_est).abs() < 1e-9,
        "the estimator's measured estimability boundary ({est_est} h) no longer lands in \
         the same grid cell as the formal one ({gram_est} h)"
    );

    // The recovery boundary is insensitive to its own stated bound over two decades, so it
    // is not an artefact of the bound the way the rank threshold is of `rel_tol`.
    let sweep = doc["recovery_threshold"]["recovery_factor_sweep"]
        .as_array()
        .expect("recovery factor sweep");
    for row in sweep.iter().take(3) {
        let f = row["recovery_factor"].as_f64().expect("factor");
        let h = row["arc_hours"].as_f64().expect("hours");
        assert!(
            (h - 3.0 * GRID_H).abs() < 1e-9,
            "recovery_factor {f} moved the boundary to {h} h"
        );
    }
}

/// ORACLE (independent estimator vs the formal covariance): the *measured* Monte-Carlo
/// position recovery error reproduces the Gramian's *predicted* 1σ position uncertainty,
/// arc length by arc length.
///
/// This is the quantitative corroboration the SRIF leg could not give: the two curves come
/// from disjoint machinery — one is `sqrt(trace(σ²(ÕᵀÕ)⁻¹))` built from analytic Jacobian
/// rows mapped through an analytic variational STM, the other is the root-mean-square
/// distance from a finite-difference batch estimate to a known truth over a seeded noise
/// ensemble. They have no expression in common.
///
/// The Gramian side is read at `rel_tol = 1e-10` purely so a formal covariance exists at
/// every determined prefix; at the published `1e-6` it refuses to report one below
/// 2.086957 h, which is the disagreement the previous test states.
#[test]
fn the_measured_recovery_error_reproduces_the_formal_covariance_curve() {
    let rec = run(PUBLISHED_GRID);
    let gram = run("kind = \"cislunar-observability\"\n\
         arc_hours = 6.0\n\
         epochs = 24\n\
         rel_tol = 1e-10\n\
         sigma_range_m = 1.0\n");

    let formal: Vec<(usize, Option<f64>)> = gram["posterior_vs_arc"]
        .as_array()
        .expect("posterior table")
        .iter()
        .map(|p| {
            (
                p["epoch_index"].as_u64().expect("index") as usize,
                p["sigma_position_km"].as_f64(),
            )
        })
        .collect();

    let mut ln_sum = 0.0;
    let mut n = 0usize;
    let mut worst_low = f64::INFINITY;
    let mut worst_high = 0.0_f64;
    for row in rec["recovery_vs_arc"].as_array().expect("recovery table") {
        if row["underdetermined"].as_bool().expect("flag") {
            continue;
        }
        let k = row["epoch_index"].as_u64().expect("index") as usize;
        let measured = row["mc_rms_position_km"].as_f64().expect("measured RMS");
        let Some(predicted) = formal.iter().find(|(i, _)| *i == k).and_then(|(_, v)| *v) else {
            panic!("the Gramian reported no formal covariance at determined prefix {k}");
        };
        let ratio = measured / predicted;
        assert!(
            (0.5..=2.0).contains(&ratio),
            "at epoch {k} the measured RMS position error ({measured:.5} km) and the formal \
             1σ ({predicted:.5} km) differ by more than a factor of two (ratio {ratio:.4})"
        );
        worst_low = worst_low.min(ratio);
        worst_high = worst_high.max(ratio);
        ln_sum += ratio.ln();
        n += 1;
    }
    assert!(
        n >= 20,
        "only {n} comparable prefixes — the walk found too few"
    );
    let geometric_mean = (ln_sum / n as f64).exp();
    assert!(
        (0.75..=1.333).contains(&geometric_mean),
        "the measured error curve is systematically off the formal one: geometric-mean \
         ratio {geometric_mean:.4} over {n} arc lengths (range {worst_low:.4}…{worst_high:.4})"
    );
}

/// NEGATIVE CONTROL — the recovery criterion can fail, and fails on exactly the geometry
/// the Gramian calls unobservable.
///
/// A wholly planar DRO constellation estimating the spatial six-state has a structural
/// datum defect of two: every range row between coplanar spacecraft has a zero out-of-plane
/// column, so no arc length recovers `z` or `ż`. The Gramian reports no rank threshold at
/// all there. The estimator, which knows none of that, must also never recover — and it
/// must be *visibly* broken rather than quietly wrong, so the run is also asserted to blow
/// up rather than return a plausible small error.
///
/// Without this control the recovery criterion would be an assertion that cannot fail.
#[test]
fn the_recovery_criterion_can_fail_where_the_geometry_is_structurally_unobservable() {
    let doc = run("kind = \"cislunar-arc-recovery\"\n\
         spatial = true\n\
         trials = 6\n");
    let claim = doc.get("claim_under_test").expect("claim block");
    assert!(
        claim["gramian_rank_threshold_hours"].is_null(),
        "the planar-DRO six-state geometry is expected to have no Gramian rank threshold"
    );
    assert!(
        claim["estimator_noise_free_boundary_hours"].is_null(),
        "the estimator must not claim to recover a structurally unobservable state"
    );
    assert!(
        claim["estimator_estimability_boundary_hours"].is_null(),
        "the estimator must not meet the estimability bound on an unobservable geometry"
    );
    // Every determined prefix must be scored as not recovered, and the unregularised
    // estimator must diverge in the unobservable out-of-plane pair rather than return a
    // small, plausible error.
    let rows = doc["recovery_vs_arc"].as_array().expect("recovery table");
    let mut determined = 0usize;
    for row in rows {
        if row["underdetermined"].as_bool().expect("flag") {
            continue;
        }
        determined += 1;
        assert!(
            !row["noise_free_recovered"].as_bool().expect("recovered"),
            "epoch {} was scored as recovered on an unobservable geometry",
            row["epoch_index"]
        );
    }
    assert!(determined >= 15, "only {determined} determined prefixes");
    let last = rows.last().expect("a last row");
    let end_rms = last["mc_rms_position_km"].as_f64().expect("end RMS");
    assert!(
        end_rms > 1.0e6,
        "the unregularised batch estimator should diverge on the two unobservable \
         directions, but the end-of-arc RMS position error is only {end_rms} km"
    );
}

/// ORACLE (parameterisation invariance): estimating the unknown in Moon-centred polar
/// coordinates — the transformation applied to the *state*, the forward model
/// re-differenced there, never the Cartesian partials transformed — finds the same two
/// boundaries.
///
/// A smooth invertible change of coordinates cannot move an observability boundary, so
/// agreement here is evidence that the verdict is a property of the geometry rather than of
/// the basis the Gramian happens to work in.
#[test]
fn the_polar_parameterisation_finds_the_same_boundaries() {
    let cart = run(PUBLISHED_GRID);
    let polar = run("kind = \"cislunar-arc-recovery\"\ncoordinates = \"polar\"\n");
    assert_eq!(polar["coordinates"], Value::from("polar"));
    for path in [
        "claim_under_test.estimator_noise_free_boundary_hours",
        "claim_under_test.estimator_estimability_boundary_hours",
    ] {
        let a = num(&cart, path);
        let b = num(&polar, path);
        assert!(
            (a - b).abs() < 1e-9,
            "{path}: cartesian {a} h vs polar {b} h — the boundary moved with the \
             parameterisation"
        );
    }
    // The whole measured error curve agrees, not merely the grid cell the boundary falls
    // in: the two parameterisations are solving one problem in two bases.
    let rows = |d: &Value| -> Vec<f64> {
        d["recovery_vs_arc"]
            .as_array()
            .expect("recovery table")
            .iter()
            .filter_map(|r| r["mc_rms_position_km"].as_f64())
            .collect()
    };
    let (rc, rp) = (rows(&cart), rows(&polar));
    assert_eq!(rc.len(), rp.len(), "the two runs swept different prefixes");
    for (k, (a, b)) in rc.iter().zip(&rp).enumerate() {
        let rel = (a - b).abs() / a.max(*b);
        assert!(
            rel < 1e-3,
            "determined prefix {k}: cartesian RMS {a} km vs polar {b} km (relative {rel:.3e})"
        );
    }
}

/// The estimator's own source may not mention the Jacobian, STM, SVD-rank or SRIF
/// machinery — the independence claim made enforceable.
///
/// Comments and string literals are stripped first (the module documents, and the result
/// document names, exactly what it does not use — that prose must stay), as is the
/// `#[cfg(test)]` block, where the analytic rows are deliberately imported to cross-check
/// the finite differences. What remains is the estimator's executable code, and it must be
/// free of every name below. A future edit that quietly re-shares the partials fails here.
#[test]
fn the_estimator_source_shares_no_jacobian_machinery() {
    const SRC: &str = include_str!("../src/cislunar_arc_recovery.rs");
    let body = SRC
        .split_once("#[cfg(test)]")
        .map(|(before, _)| before)
        .unwrap_or(SRC);
    let code = strip_comments_and_strings(body);

    for needle in [
        "range_row",
        "range_rate_row",
        "propagate_state_stm",
        "observability_gramian",
        "cislunar_srif",
        "deepspace_od",
        "Srif",
        "sym_eig",
        "singular_values",
        "observable_rank",
        "whitened_posterior",
        "crlb",
        "crate::fim",
    ] {
        assert!(
            !code.contains(needle),
            "src/cislunar_arc_recovery.rs executable code mentions `{needle}` — the \
             estimator must not consume the observability Gramian's Jacobian, STM, \
             singular-value or SRIF machinery, or its agreement is a restatement rather \
             than corroboration"
        );
    }
    // Positive control on the stripper: it must not have eaten the code it is guarding.
    for needle in ["gauss_newton", "propagate_cr3bp", "intersat_range_spatial"] {
        assert!(
            code.contains(needle),
            "the comment/string stripper removed `{needle}` — the guard above would pass \
             vacuously"
        );
    }
    // And it must have removed the prose that legitimately names the forbidden items.
    assert!(
        SRC.contains("propagate_state_stm"),
        "the module should still DOCUMENT what it does not use"
    );
}

/// Strip `//` line comments and double-quoted string literals from Rust source, leaving
/// executable code. Escapes inside strings are honoured; the module uses no raw strings or
/// character literals, and the guard's positive control fails loudly if that ever changes.
fn strip_comments_and_strings(src: &str) -> String {
    let mut out = String::with_capacity(src.len());
    let mut chars = src.chars().peekable();
    let (mut in_string, mut in_comment) = (false, false);
    while let Some(c) = chars.next() {
        if in_comment {
            if c == '\n' {
                in_comment = false;
                out.push('\n');
            }
            continue;
        }
        if in_string {
            if c == '\\' {
                chars.next();
            } else if c == '"' {
                in_string = false;
                out.push('"');
            }
            continue;
        }
        match c {
            '/' if chars.peek() == Some(&'/') => {
                chars.next();
                in_comment = true;
            }
            '"' => {
                in_string = true;
                out.push('"');
            }
            _ => out.push(c),
        }
    }
    out
}

/// R1 — the released `cislunar-observability` document is untouched by this work.
///
/// Two layers here: the exact top-level key set (so no field can be removed, renamed or
/// silently added) and a whole-document fingerprint over a canonical form in which every
/// float is pinned to six significant figures (so no released value can move). The
/// module's own unit tests pin the human summary line beside them, so the headline numbers
/// stay legible in a failure. The canonical layer is the platform-stable one the registry
/// golden guard already uses: last-digit libm differences round to identical text, while a
/// genuine change moves the hash.
#[test]
fn the_released_observability_document_is_unchanged() {
    let out = run_toml("kind = \"cislunar-observability\"\n").expect("the released default runs");
    let doc: Value = serde_json::from_str(&out.json).expect("valid JSON");

    let keys: Vec<&str> = doc
        .as_object()
        .expect("object")
        .keys()
        .map(|k| k.as_str())
        .collect();
    assert_eq!(
        keys,
        vec![
            "arc_hours",
            "arc_time_tu",
            "chief_state",
            "dro_provenance",
            "gdop",
            "gramian_spectrum",
            "kind",
            "label",
            "mu",
            "range_rate_lever",
            "rank_vs_arc",
            "rank_vs_arc_note",
            "reference_states",
            "rel_tol",
            "srif_cross_validation",
            "state_dim",
        ],
        "the released cislunar-observability document gained or lost a top-level field"
    );

    let mut canon = String::new();
    canonicalize(&doc, &mut canon);
    assert_eq!(
        fnv64(&canon),
        RELEASED_OBSERVABILITY_CANONICAL_FNV,
        "a released cislunar-observability value moved (canonical six-significant-figure \
         fingerprint) — R1 is additive only"
    );
}

/// Whole-document fingerprint of the released `cislunar-observability` default, over the
/// canonical six-significant-figure form.
const RELEASED_OBSERVABILITY_CANONICAL_FNV: u64 = 9_459_780_657_697_663_305;

/// FNV-1a 64-bit — a tiny, dependency-free byte-identity fingerprint (the same one the
/// registry golden guard uses).
fn fnv64(s: &str) -> u64 {
    let mut h: u64 = 0xcbf2_9ce4_8422_2325;
    for b in s.as_bytes() {
        h ^= *b as u64;
        h = h.wrapping_mul(0x0000_0100_0000_01b3);
    }
    h
}

/// Render a parsed result document into a platform-stable canonical string: every float at
/// six significant figures, signed zero folded, keys walked in serde_json's deterministic
/// order.
fn canonicalize(v: &Value, out: &mut String) {
    match v {
        Value::Null => out.push_str("null"),
        Value::Bool(b) => out.push_str(if *b { "true" } else { "false" }),
        Value::Number(n) => {
            if let Some(i) = n.as_i64() {
                out.push_str(&i.to_string());
            } else if let Some(u) = n.as_u64() {
                out.push_str(&u.to_string());
            } else {
                let f = n.as_f64().expect("finite float");
                let f = if f == 0.0 { 0.0 } else { f };
                out.push_str(&format!("{f:.5e}"));
            }
        }
        Value::String(s) => {
            out.push('"');
            out.push_str(s);
            out.push('"');
        }
        Value::Array(a) => {
            out.push('[');
            for (i, e) in a.iter().enumerate() {
                if i > 0 {
                    out.push(',');
                }
                canonicalize(e, out);
            }
            out.push(']');
        }
        Value::Object(m) => {
            out.push('{');
            for (i, (k, val)) in m.iter().enumerate() {
                if i > 0 {
                    out.push(',');
                }
                out.push('"');
                out.push_str(k);
                out.push_str("\":");
                canonicalize(val, out);
            }
            out.push('}');
        }
    }
}
