// SPDX-License-Identifier: AGPL-3.0-only
//! One-command artifact for the resilience-scoring study. Builds the reference
//! architecture panel and threat ensemble, runs the instability study (H1) under
//! two defensible weighting priors, the declared-vs-measured contrast (H2), and
//! the diversity-collapse analysis (H3), and writes a versioned, self-describing
//! JSON artifact (MODELLED, synthetic) plus one example assurance report.
//!
//! Run: `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json`

use kshana::resilience::panel::{reference_panel, scenario_ensemble, simulate, Threat};
use kshana::resilience::report::{assurance_report_json, integrity_hash, Provenance};
use kshana::resilience::score::{composite, score};
use kshana::resilience::study::{
    declared_vs_measured, diversity_collapse, run_instability, StudyConfig,
};
use serde_json::{json, Value};

const SCHEMA_VERSION: &str = "resilience-study/1";

fn instability_block(cfg: &StudyConfig) -> Value {
    let r = run_instability(cfg);
    let ranges: Value = r
        .rank_ranges
        .iter()
        .map(|(k, (lo, hi))| (k.clone(), json!([lo, hi])))
        .collect::<serde_json::Map<_, _>>()
        .into();
    json!({
        "n_weight_draws": cfg.n_weight_draws,
        "dirichlet_alpha": cfg.dirichlet_alpha,
        "top1_flip_rate": r.top1_flip_rate,
        "kendall_tau_mean": r.kendall_tau_mean,
        "kendall_tau_ci": [r.kendall_tau_ci.0, r.kendall_tau_ci.1],
        "level_flip_rate": r.level_flip_rate,
        "rank_ranges": ranges,
        "n_evaluations": r.n_evaluations,
    })
}

fn main() {
    let path = std::env::args()
        .nth(1)
        .unwrap_or_else(|| "resilience-study.json".to_string());

    let panel = reference_panel();
    let mixes = scenario_ensemble(&panel);
    let seed = 12345u64;

    // H1 under two defensible weighting priors: a broad simplex (alpha=1, no
    // preference) and a near-equal simplex (alpha=5, mild weightings close to
    // equal). Instability under BOTH means it is not an artifact of extremes.
    let cfg_broad = StudyConfig {
        archs: panel.clone(),
        mixes: mixes.clone(),
        n_weight_draws: 2000,
        dirichlet_alpha: vec![1.0; 7],
        seed,
    };
    let cfg_near_equal = StudyConfig {
        dirichlet_alpha: vec![5.0; 7],
        ..cfg_broad.clone()
    };

    // H2 / H3.
    let contrasts = declared_vs_measured(&cfg_broad);
    let collapse = diversity_collapse(&panel);

    // Per-(architecture, threat) profiles for the score tables.
    let mut profiles = serde_json::Map::new();
    for a in &panel {
        let mut per_threat = serde_json::Map::new();
        for &t in &Threat::all() {
            let sim = simulate(a, t);
            let p = score(a, &sim);
            let equal = vec![1.0; 7];
            per_threat.insert(
                t.name().to_string(),
                json!({
                    "level": p.level,
                    "level_basis": p.level_basis,
                    "composite_equal_weight": composite(&p, &equal),
                    "sim": sim,
                    "rpcf": p.rpcf,
                    "rdrr": p.rdrr,
                    "yang": p.yang,
                }),
            );
        }
        profiles.insert(a.name.clone(), Value::Object(per_threat));
    }

    // One example assurance report: the diverse architecture under the combined threat.
    let demo_arch = panel.iter().find(|a| a.name == "diverse_full").unwrap();
    let demo_profile = score(demo_arch, &simulate(demo_arch, Threat::Combined));
    let prov = Provenance {
        engine_version: env!("CARGO_PKG_VERSION").to_string(),
        scenario: "combined".to_string(),
        seed,
        note: "MODELLED, synthetic parameter-grounded study; not a field measurement".to_string(),
    };
    let assurance_json = assurance_report_json(&demo_profile, &prov);
    let assurance_hash = integrity_hash(assurance_json.as_bytes());

    let panel_desc: Vec<Value> = panel
        .iter()
        .map(|a| {
            json!({
                "name": a.name,
                "n_sources": a.sources.len(),
                "independent_groups": a.independent_group_count(),
                "techniques": a.techniques,
            })
        })
        .collect();

    let doc = json!({
        "schema_version": SCHEMA_VERSION,
        "label": "MODELLED resilience-scoring study (synthetic, parameter-grounded). \
    Simulation-derived self-assessment aligned to DHS RPCF v2.0; not a certification or field measurement.",
        "provenance": {
            "engine": "kshana",
            "engine_version": env!("CARGO_PKG_VERSION"),
            "seed": seed,
            "n_architectures": panel.len(),
            "n_threats": Threat::all().len(),
        },
        "panel": panel_desc,
        "h1_instability": {
            "broad_simplex": instability_block(&cfg_broad),
            "near_equal_simplex": instability_block(&cfg_near_equal),
        },
        "h2_declared_vs_measured": contrasts,
        "h3_diversity_collapse": collapse,
        "profiles": profiles,
        "example_assurance_report": {
            "arch": "diverse_full",
            "threat": "combined",
            "sha256": assurance_hash,
            "report": serde_json::from_str::<Value>(&assurance_json).unwrap(),
        },
    });

    let out = serde_json::to_string_pretty(&doc).expect("serialize artifact");
    std::fs::write(&path, &out).unwrap_or_else(|e| panic!("write {path}: {e}"));

    // Console summary.
    let b = run_instability(&cfg_broad);
    let ne = run_instability(&cfg_near_equal);
    println!("resilience study written to {path}");
    println!(
        "H1 broad simplex:      top1_flip={:.3} kendall_tau_mean={:.3} level_flip={:.3}",
        b.top1_flip_rate, b.kendall_tau_mean, b.level_flip_rate
    );
    println!(
        "H1 near-equal simplex: top1_flip={:.3} kendall_tau_mean={:.3} level_flip={:.3}",
        ne.top1_flip_rate, ne.kendall_tau_mean, ne.level_flip_rate
    );
    println!("H2 declared-vs-measured contrasts: {}", contrasts.len());
    println!("H3 diversity-collapse rows: {}", collapse.len());
}
