// SPDX-License-Identifier: AGPL-3.0-only
//! Head-to-head SGP4/SDP4 accuracy comparison: Kshana versus the independent
//! `sgp4` crate (neuromorphicsystems/sgp4) on the official AIAA 2006-6753
//! verification vectors. Two *independent* implementations both reproduce the
//! reference table, and agree with each other to sub-millimetre. That is
//! competitive pedigree, not merely self-consistency: a port that quietly
//! diverged from the rest of the ecosystem would show up here.
//!
//! The fixtures are the same ones the primary verification test uses:
//! `tests/fixtures/sgp4/SGP4-VER.TLE` (input element sets, each line 2 carrying
//! the extra start/stop/step minutes) and `tcppver.out` (reference TEME state).
//!
//! Running with `KSHANA_REGEN_FIXTURES=1` regenerates the committed comparison
//! table at `tests/fixtures/sgp4_comparison.md`; without it the test only asserts
//! and prints, leaving the working tree clean (so CI never writes files).

use std::f64::consts::TAU;
use std::fmt::Write as _;

use kshana::sgp4::wgs72;
use kshana::tle::parse_tle;

const TLE_TEXT: &str = include_str!("fixtures/sgp4/SGP4-VER.TLE");
const OUT_TEXT: &str = include_str!("fixtures/sgp4/tcppver.out");

/// One reference time and the expected TEME position (km). Velocity is exercised
/// by the primary verification test; here position error is the headline metric.
struct Row {
    tsince: f64,
    pos: [f64; 3],
}

/// Parse `tcppver.out` into per-satellite blocks of rows, in file order.
fn parse_expected(text: &str) -> Vec<Vec<Row>> {
    let mut blocks: Vec<Vec<Row>> = Vec::new();
    for line in text.lines() {
        let toks: Vec<&str> = line.split_whitespace().collect();
        if toks.len() == 2 && toks[1] == "xx" {
            blocks.push(Vec::new());
            continue;
        }
        if toks.len() >= 4 {
            if let (Ok(tsince), Ok(x), Ok(y), Ok(z)) = (
                toks[0].parse::<f64>(),
                toks[1].parse::<f64>(),
                toks[2].parse::<f64>(),
                toks[3].parse::<f64>(),
            ) {
                if let Some(b) = blocks.last_mut() {
                    b.push(Row {
                        tsince,
                        pos: [x, y, z],
                    });
                }
            }
        }
    }
    blocks
}

/// Parse `SGP4-VER.TLE` into `(line1, line2)` pairs, in file order, skipping the
/// `#` comment lines.
fn parse_cases(text: &str) -> Vec<(String, String)> {
    let mut cases = Vec::new();
    let mut line1: Option<String> = None;
    for line in text.lines() {
        if line.starts_with('#') {
            continue;
        }
        if line.starts_with("1 ") {
            line1 = Some(line.to_string());
        } else if line.starts_with("2 ") {
            if let Some(l1) = line1.take() {
                cases.push((l1, line.to_string()));
            }
        }
    }
    cases
}

/// Classify a case by the SDP4 deep-space/resonance regime, mirroring the
/// algorithm's own `irez` decision (Vallado `dsinit`): mean motion in rad/min
/// selects 1-day resonance (0.0035–0.0052), and the half-day band (0.0083–0.0092
/// with e ≥ 0.5) selects 1/2-day resonance; everything with a period ≥ 225 min is
/// deep-space, otherwise near-earth.
fn category(line2: &str) -> &'static str {
    let nm_rev_day: f64 = line2[52..63].trim().parse().unwrap_or(0.0);
    let ecc: f64 = format!("0.{}", line2[26..33].trim()).parse().unwrap_or(0.0);
    if nm_rev_day <= 0.0 {
        return "near-earth (LEO/MEO)";
    }
    let nm = nm_rev_day * TAU / 1440.0; // rad/min
    let period_min = 1440.0 / nm_rev_day;
    if period_min >= 225.0 {
        if nm > 0.0034906585 && nm < 0.0052359877 {
            "deep-space resonance (1-day)"
        } else if (0.00826..=0.00924).contains(&nm) && ecc >= 0.5 {
            "deep-space resonance (1/2-day)"
        } else {
            "deep-space (non-resonant)"
        }
    } else {
        "near-earth (LEO/MEO)"
    }
}

/// Euclidean distance between two position vectors (km).
fn dist(a: &[f64; 3], b: &[f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// Accumulated worst-case errors for one category.
#[derive(Default, Clone)]
struct Cat {
    cases: usize,
    rows: usize,
    crate_rows: usize,
    kshana_vs_ref: f64,
    crate_vs_ref: f64,
    agreement: f64,
}

// Ordered category labels for a stable report.
const CATS: [&str; 4] = [
    "near-earth (LEO/MEO)",
    "deep-space (non-resonant)",
    "deep-space resonance (1/2-day)",
    "deep-space resonance (1-day)",
];

#[test]
fn kshana_agrees_with_the_independent_sgp4_crate_on_the_aiaa_vectors() {
    let cases = parse_cases(TLE_TEXT);
    let blocks = parse_expected(OUT_TEXT);
    assert_eq!(
        cases.len(),
        blocks.len(),
        "case/block count mismatch: {} TLE cases vs {} output blocks",
        cases.len(),
        blocks.len()
    );

    let grav = wgs72();

    // The AIAA reference table is published to ~1e-6 km precision, so a faithful
    // WGS72 port reproduces it to well under a centimetre — the same 2e-5 km bound
    // the primary verification test pins for Kshana. We hold the independent crate
    // to the same bound, and (by the triangle inequality) their mutual agreement to
    // twice it. These are a-priori bounds from the reference precision, not numbers
    // fitted to the output; the report prints the far tighter measured worst cases
    // (sub-micron near-earth, 4.12 mm worst-case deep-space) that go into the table.
    //
    // Both implementations are run with the **WGS72** gravity model that the AIAA
    // vectors use. The crate's default `from_elements` uses WGS84 instead and would
    // differ from this WGS72 reference by ~km; its `_afspc_compatibility_mode`
    // constructor selects WGS72, which is the fair apples-to-apples basis here.
    const KSHANA_REF_TOL_KM: f64 = 2.0e-5; // Kshana's established AIAA bound (~2 cm)
    const CRATE_REF_TOL_KM: f64 = 2.0e-5; // same bound for the independent crate
    const AGREE_TOL_KM: f64 = 4.0e-5; // triangle inequality: 2 × the reference bound

    let mut cats: std::collections::BTreeMap<&'static str, Cat> = std::collections::BTreeMap::new();
    let mut crate_unsupported: Vec<String> = Vec::new();
    let mut total_rows = 0usize;
    let mut failures: Vec<String> = Vec::new();

    for ((l1, l2), rows) in cases.iter().zip(blocks.iter()) {
        let satnum = l1[2..7].trim().to_string();
        let cat_label = category(l2);

        let tle = parse_tle(l1, l2).unwrap_or_else(|e| panic!("kshana parse {satnum}: {e}"));
        let kprop = tle.to_sgp4(grav, false);

        // The `sgp4` crate parses fixed TLE columns; trim line 2 to the canonical
        // 69 characters so the trailing start/stop/step numbers are not fed in.
        let l2_canon = &l2.as_bytes()[..l2.len().min(69)];
        // `from_tle` and `from_elements` return different error types; unify them
        // so a case the crate cannot handle is recorded uniformly rather than
        // failing the build.
        let crate_consts: Result<sgp4::Constants, String> =
            sgp4::Elements::from_tle(Some(format!("AIAA-{satnum}")), l1.as_bytes(), l2_canon)
                .map_err(|e| format!("{e:?}"))
                .and_then(|e| {
                    sgp4::Constants::from_elements_afspc_compatibility_mode(&e)
                        .map_err(|e| format!("{e:?}"))
                });

        let entry = cats.entry(cat_label).or_default();
        entry.cases += 1;

        for r in rows {
            // Kshana state at this reference time (deliberate error cases skip).
            let kpos = match kprop.propagate(r.tsince) {
                Ok((p, _v)) => p,
                Err(_) => continue,
            };
            let k_err = dist(&kpos, &r.pos);
            entry.rows += 1;
            total_rows += 1;
            entry.kshana_vs_ref = entry.kshana_vs_ref.max(k_err);
            if k_err > KSHANA_REF_TOL_KM {
                failures.push(format!(
                    "kshana sat {satnum} t={:.1}: {k_err:.3e} km > {KSHANA_REF_TOL_KM:.0e}",
                    r.tsince
                ));
            }

            // Crate state at the same time, if the crate supports this case.
            let Ok(consts) = &crate_consts else {
                continue;
            };
            let Ok(pred) = consts.propagate(sgp4::MinutesSinceEpoch(r.tsince)) else {
                continue;
            };
            let cpos = pred.position;
            let c_err = dist(&cpos, &r.pos);
            let agree = dist(&kpos, &cpos);
            entry.crate_rows += 1;
            entry.crate_vs_ref = entry.crate_vs_ref.max(c_err);
            entry.agreement = entry.agreement.max(agree);
            if c_err > CRATE_REF_TOL_KM {
                failures.push(format!(
                    "crate sat {satnum} t={:.1}: {c_err:.3e} km > {CRATE_REF_TOL_KM:.0e}",
                    r.tsince
                ));
            }
            if agree > AGREE_TOL_KM {
                failures.push(format!(
                    "disagreement sat {satnum} t={:.1}: {agree:.3e} km > {AGREE_TOL_KM:.0e}",
                    r.tsince
                ));
            }
        }

        if crate_consts.is_err() {
            crate_unsupported.push(satnum);
        }
    }

    // Report the measured worst cases (these become the committed table).
    eprintln!("SGP4 head-to-head (Kshana vs sgp4 crate) on the AIAA vectors:");
    for label in CATS {
        if let Some(c) = cats.get(label) {
            eprintln!(
                "  {label}: {} cases / {} rows | kshana↔ref {:.2e} | crate↔ref {:.2e} | kshana↔crate {:.2e} km",
                c.cases, c.rows, c.kshana_vs_ref, c.crate_vs_ref, c.agreement
            );
        }
    }
    if !crate_unsupported.is_empty() {
        eprintln!(
            "  sgp4 crate could not initialise {} case(s): {}",
            crate_unsupported.len(),
            crate_unsupported.join(", ")
        );
    }
    eprintln!("  total reference rows compared: {total_rows}");

    if std::env::var("KSHANA_REGEN_FIXTURES").is_ok() {
        write_fixture(&cats, &crate_unsupported, total_rows);
    }

    assert!(
        failures.is_empty(),
        "{} comparison row(s) exceeded a tolerance; first few:\n{}",
        failures.len(),
        failures
            .iter()
            .take(12)
            .cloned()
            .collect::<Vec<_>>()
            .join("\n")
    );
    // The bundled fixtures contribute a fixed number of reference rows; pinning it
    // stops a silent regression that compared fewer rows from passing unnoticed.
    assert_eq!(
        total_rows, 666,
        "compared {total_rows} reference rows, expected 666 — fixtures or skip behaviour changed"
    );
}

/// Write the committed comparison table. Deterministic: no timestamps, so a
/// regeneration with unchanged numerics leaves the file byte-identical.
fn write_fixture(
    cats: &std::collections::BTreeMap<&'static str, Cat>,
    crate_unsupported: &[String],
    total_rows: usize,
) {
    let mut md = String::new();
    md.push_str("# SGP4/SDP4 head-to-head: Kshana vs the `sgp4` crate\n\n");
    md.push_str(
        "Independent cross-validation of Kshana's SGP4/SDP4 propagator against the \
         [`sgp4`](https://crates.io/crates/sgp4) crate (neuromorphicsystems/sgp4), the \
         most widely used Rust SGP4 implementation. Both are propagated over the official \
         **AIAA 2006-6753** verification vectors (Vallado et al., *Revisiting Spacetrack \
         Report #3*) bundled at `tests/fixtures/sgp4/`, and each TEME position is compared \
         against the reference `tcppver.out` table.\n\n",
    );
    md.push_str(
        "Both propagators use the **WGS72** gravity model the AIAA vectors are defined in. The \
         crate's default `Constants::from_elements` constructor uses WGS84 and so differs from \
         this WGS72 reference by up to ~3 km — a modelling choice, not an error; we therefore \
         drive the crate through `from_elements_afspc_compatibility_mode`, which selects WGS72, \
         for an apples-to-apples comparison against the reference and Kshana.\n\n",
    );
    md.push_str(
        "Worst-case position error per regime (km). `kshana↔ref` and `crate↔ref` are each \
         implementation against the published reference; `kshana↔crate` is the two independent \
         implementations against **each other** — the agreement that establishes pedigree. \
         `rows` counts the reference rows compared for Kshana; `crate rows` the subset the crate \
         could also propagate (it rejects a few pathological cases at construction).\n\n",
    );
    md.push_str(
        "| Regime | Cases | Rows | Crate rows | kshana↔ref (km) | crate↔ref (km) | kshana↔crate (km) |\n",
    );
    md.push_str("|---|---:|---:|---:|---:|---:|---:|\n");
    let mut tot = Cat::default();
    for label in CATS {
        if let Some(c) = cats.get(label) {
            let _ = writeln!(
                md,
                "| {label} | {} | {} | {} | {:.2e} | {:.2e} | {:.2e} |",
                c.cases, c.rows, c.crate_rows, c.kshana_vs_ref, c.crate_vs_ref, c.agreement
            );
            tot.cases += c.cases;
            tot.rows += c.rows;
            tot.crate_rows += c.crate_rows;
            tot.kshana_vs_ref = tot.kshana_vs_ref.max(c.kshana_vs_ref);
            tot.crate_vs_ref = tot.crate_vs_ref.max(c.crate_vs_ref);
            tot.agreement = tot.agreement.max(c.agreement);
        }
    }
    let _ = writeln!(
        md,
        "| **all** | **{}** | **{}** | **{}** | **{:.2e}** | **{:.2e}** | **{:.2e}** |",
        tot.cases, tot.rows, tot.crate_rows, tot.kshana_vs_ref, tot.crate_vs_ref, tot.agreement
    );
    md.push('\n');
    let _ = writeln!(
        md,
        "Total reference rows compared: **{total_rows}** for Kshana, **{}** of them also \
         propagated by the crate.\n",
        tot.crate_rows
    );
    if crate_unsupported.is_empty() {
        md.push_str(
            "The `sgp4` crate initialised every one of the AIAA element sets; no case was \
             skipped on the crate side.\n\n",
        );
    } else {
        let _ = writeln!(
            md,
            "The `sgp4` crate could not initialise {} deliberately-pathological AIAA case(s) \
             (`{}`) — it rejects out-of-range orbits at construction, where Kshana accepts the \
             element set and returns an error only on the propagation steps that decay or \
             diverge (exactly where the reference table also stops). Those cases are excluded \
             from the cross-implementation columns; Kshana's own agreement with the reference on \
             every supported row is unaffected.\n",
            crate_unsupported.len(),
            crate_unsupported.join("`, `")
        );
    }
    md.push_str(
        "Regenerate with `KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison`. \
         The figures are produced deterministically from the bundled fixtures and the pinned \
         toolchain; no wall-clock time is embedded, so an unchanged run reproduces this file \
         byte-for-byte. The live assertions in `tests/sgp4_crate_comparison.rs` enforce that \
         both implementations stay within 2e-5 km of the reference and agree with each other to \
         within 4e-5 km across all regimes — a regression guard, not just a one-off table.\n",
    );

    let path =
        std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/sgp4_comparison.md");
    std::fs::write(&path, md).expect("write sgp4_comparison.md");
    eprintln!("regenerated {}", path.display());
}
