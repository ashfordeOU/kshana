// SPDX-License-Identifier: AGPL-3.0-only
//! Reproducibility generator for the P2 cross-provider interoperability manuscript.
//!
//! Regenerates every quantitative result the paper reports, directly from the
//! committed engine and vendored fixtures, so each table number is traceable to one run:
//!   - Part A (VALIDATED): per-pair Helmert provenance decomposition of real DE440 /
//!     INPOP21a / EPM2021 geocentric-Moon positions — raw_rms, rot_residual, reducible,
//!     irreducible, and θ magnitudes for all three provider pairs.
//!   - Part B (MODELLED): multi-provider interop budget under each FrameConvention
//!     (PerProvider / CommonFrameTie / CommonEphemeris) with the design-law metric
//!     `irreducible_fraction`.
//!   - Part C (MODELLED): consistency-tolerance τ(B) for a lunar-surface user at
//!     B ∈ {5, 10, 15} m.
//!
//! Part A is Validated against the real inter-ephemeris data (see
//! `tests/lunar_interop_budget_reference.rs`). Parts B and C are Modelled (representative
//! multi-provider analog; the "providers" are ephemerides — no two lunar-PNT providers fly).
//!
//! Run: `cargo run --example p2_cross_provider_interop`

use kshana::lunar_interop_budget::{
    consistency_tolerance, interop_budget, provenance_split, FrameConvention, ProvenanceSplit, Vec3,
};
use std::collections::BTreeMap;

// Vendored fixtures — baked at compile time; no runtime I/O.
const MOON_GEO_CSV: &str = include_str!("../tests/fixtures/inter_ephemeris/moon_geo.csv");
const PLANET_SSB_CSV: &str = include_str!("../tests/fixtures/inter_ephemeris/planet_ssb.csv");
const REFERENCE_JSON: &str = include_str!("../tests/fixtures/inter_ephemeris/reference.json");

// ── CSV parsers (mirror tests/lunar_interop_budget_reference.rs) ──────────────

/// Parse `moon_geo.csv` → `BTreeMap<provider, Vec<Vec3>>`.
///
/// Rows are day-sorted within each provider; we push them in file order.
fn parse_moon_geo(csv: &str) -> BTreeMap<String, Vec<Vec3>> {
    let mut map: BTreeMap<String, Vec<Vec3>> = BTreeMap::new();
    for line in csv.lines().skip(1) {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }
        let mut it = line.split(',');
        let _day = it.next().unwrap();
        let provider = it.next().unwrap().to_string();
        let x: f64 = it.next().unwrap().trim().parse().unwrap();
        let y: f64 = it.next().unwrap().trim().parse().unwrap();
        let z: f64 = it.next().unwrap().trim().parse().unwrap();
        map.entry(provider).or_default().push([x, y, z]);
    }
    map
}

/// Parse `planet_ssb.csv` → `BTreeMap<(provider, body), Vec<Vec3>>`.
///
/// Rows are day-sorted within each (provider, body) group.
fn parse_planet_ssb(csv: &str) -> BTreeMap<(String, String), Vec<Vec3>> {
    let mut map: BTreeMap<(String, String), Vec<Vec3>> = BTreeMap::new();
    for line in csv.lines().skip(1) {
        let line = line.trim();
        if line.is_empty() {
            continue;
        }
        let mut it = line.split(',');
        let _day = it.next().unwrap();
        let provider = it.next().unwrap().to_string();
        let body = it.next().unwrap().to_string();
        let x: f64 = it.next().unwrap().trim().parse().unwrap();
        let y: f64 = it.next().unwrap().trim().parse().unwrap();
        let z: f64 = it.next().unwrap().trim().parse().unwrap();
        map.entry((provider, body)).or_default().push([x, y, z]);
    }
    map
}

fn norm3(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn main() {
    println!("# P2 cross-provider interoperability — canonical numbers\n");

    // ── Load fixtures ──────────────────────────────────────────────────────────

    let moon = parse_moon_geo(MOON_GEO_CSV);
    let planet = parse_planet_ssb(PLANET_SSB_CSV);

    let ref_val: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("reference.json must be valid JSON");
    let lever_arm_m: f64 = ref_val["lunar_dist_m"]
        .as_f64()
        .expect("lunar_dist_m must be a number");

    // Fixed body order: mercury, venus, mars, emb (matches the SciPy oracle).
    let bodies = ["mercury", "venus", "mars", "emb"];

    // Provider pairs in the order the paper reports them.
    let pairs = [
        ("DE440", "INPOP21a"),
        ("DE440", "EPM2021"),
        ("INPOP21a", "EPM2021"),
    ];

    // ── Part A — VALIDATED provenance decomposition ────────────────────────────

    println!("## Part A — Provenance decomposition [VALIDATED]");
    println!("  (real DE440 / INPOP21a / EPM2021 geocentric-Moon positions,");
    println!("   lever arm = {lever_arm_m:.3e} m)\n");

    println!(
        "{:<22}  {:>9}  {:>10}  {:>12}  {:>12}  {:>12}  {:>14}  {:>14}",
        "pair",
        "raw(m)",
        "rot_res(m)",
        "reduc(m)",
        "irred(m)",
        "|θ_moon|(nrad)",
        "|θ_tie|(nrad)",
        "|θ_exc|(nrad)"
    );
    println!("{}", "-".repeat(112));

    let mut splits: Vec<ProvenanceSplit> = Vec::with_capacity(pairs.len());

    for (a, b) in &pairs {
        let moon_from = moon
            .get(*a)
            .unwrap_or_else(|| panic!("provider '{a}' not found in moon_geo.csv"));
        let moon_to = moon
            .get(*b)
            .unwrap_or_else(|| panic!("provider '{b}' not found in moon_geo.csv"));

        let planet_pairs: Vec<(Vec<Vec3>, Vec<Vec3>)> = bodies
            .iter()
            .map(|&body| {
                let from = planet
                    .get(&(a.to_string(), body.to_string()))
                    .unwrap_or_else(|| panic!("missing ({a}, {body}) in planet_ssb.csv"))
                    .clone();
                let to = planet
                    .get(&(b.to_string(), body.to_string()))
                    .unwrap_or_else(|| panic!("missing ({b}, {body}) in planet_ssb.csv"))
                    .clone();
                (from, to)
            })
            .collect();

        let split = provenance_split(moon_from, moon_to, &planet_pairs, lever_arm_m);
        let pair_label = format!("{a}-{b}");

        println!(
            "{:<22}  {:>9.4}  {:>10.4}  {:>12.4}  {:>12.4}  {:>14.4}  {:>14.4}  {:>14.4}",
            pair_label,
            split.raw_rms_m,
            split.rot_residual_m,
            split.reducible_m,
            split.irreducible_m,
            norm3(split.theta_moon) * 1e9,
            norm3(split.theta_frametie) * 1e9,
            norm3(split.theta_excess) * 1e9,
        );

        splits.push(split);
    }

    println!();
    println!("  Headline checks (NOTICE.md anchors):");
    println!(
        "    DE440-INPOP21a    raw_rms ≈ 2.40 m  → {:.4} m  irred ≈ 1.87 m → {:.4} m",
        splits[0].raw_rms_m, splits[0].irreducible_m
    );
    println!(
        "    DE440-EPM2021     irred   ≈ 2.41 m  → {:.4} m",
        splits[1].irreducible_m
    );
    println!(
        "    INPOP21a-EPM2021  reduc   ≈ 1.02 m  → {:.4} m",
        splits[2].reducible_m
    );

    // ── Part B — MODELLED interop budget + design law ──────────────────────────

    println!("\n## Part B — Multi-provider interop budget [MODELLED]");
    println!("  (representative multi-provider analog; ephemerides used as providers;\n  no two lunar-PNT providers fly)\n");

    let conventions = [
        FrameConvention::PerProvider,
        FrameConvention::CommonFrameTie,
        FrameConvention::CommonEphemeris,
    ];
    let conv_labels = ["PerProvider", "CommonFrameTie", "CommonEphemeris"];

    println!(
        "{:<18}  {:>12}  {:>12}  {:>10}  {:>20}",
        "convention", "reducible(m)", "irreducible(m)", "total(m)", "irreducible_fraction"
    );
    println!("{}", "-".repeat(80));

    for (conv, label) in conventions.iter().zip(conv_labels.iter()) {
        let budget = interop_budget(&splits, *conv);
        println!(
            "{:<18}  {:>12.4}  {:>12.4}  {:>10.4}  {:>20.4}",
            label,
            budget.reducible_m,
            budget.irreducible_m,
            budget.total_m,
            budget.irreducible_fraction,
        );
    }

    println!();
    let cft = interop_budget(&splits, FrameConvention::CommonFrameTie);
    println!(
        "  Design law: CommonFrameTie.irreducible_fraction = {:.4}",
        cft.irreducible_fraction
    );
    println!(
        "    → A common frame/format tag alone ({:.4} m irred floor) leaves the",
        cft.irreducible_m
    );
    println!("      dominant residual; a common ephemeris (CommonEphemeris) is needed");
    println!("      to eliminate it. Dynamics dominate the non-residual budget.");

    // ── Part C — MODELLED consistency tolerance τ(B) ──────────────────────────

    println!("\n## Part C — Consistency tolerance τ(B) [MODELLED]");
    println!("  (lunar-surface user, r_user = 1 737 400 m, per_provider = None)\n");

    let r_user_m = 1_737_400.0_f64;
    let budgets = [5.0_f64, 10.0, 15.0];

    println!(
        "{:>10}  {:>14}  {:>12}  {:>18}  {:>18}  {:>9}",
        "B(m)", "max_origin(m)", "max_scale", "max_rot(rad)", "max_rot(nrad)", "binding"
    );
    println!("{}", "-".repeat(92));

    for &b in &budgets {
        let tol = consistency_tolerance(b, r_user_m, None);
        println!(
            "{:>10.1}  {:>14.4}  {:>12.4e}  {:>18.6e}  {:>18.4}  {:>9}",
            b,
            tol.max_origin_m,
            tol.max_scale,
            tol.max_rotation_rad,
            tol.max_rotation_rad * 1e9,
            tol.binding,
        );
    }

    // ── Honesty banner ─────────────────────────────────────────────────────────

    println!();
    println!("─────────────────────────────────────────────────────────────────────────────");
    println!("HONESTY: Part A decomposition is Validated against real DE440/INPOP/EPM data");
    println!("  (see tests/lunar_interop_budget_reference.rs); Parts B–C are Modelled");
    println!("  (representative multi-provider analog; the 'providers' are ephemerides —");
    println!("  no two lunar-PNT providers fly). No certified standard, no TRL claim.");
    println!("─────────────────────────────────────────────────────────────────────────────");
}
