// SPDX-License-Identifier: AGPL-3.0-only
//! One-command artifact for the resilience-scoring study. Builds the reference
//! architecture panel and threat ensemble, runs the instability study (H1) under
//! two defensible weighting priors, the declared-vs-measured contrast (H2), and
//! the diversity-collapse analysis (H3). It also separates weighting-only from
//! scenario-driven instability, sweeps the weighting concentration, and tests
//! robustness of the conclusions to a +/-20% perturbation of every driver, then
//! writes a versioned, self-describing JSON artifact (MODELLED, synthetic) plus
//! one example assurance report.
//!
//! Run: `cargo run --release --example resilience_report -- paper-artifacts/resilience-study.json`

use kshana::resilience::arch::PntArchitecture;
use kshana::resilience::panel::{reference_panel, scenario_ensemble, simulate, Threat};
use kshana::resilience::report::{assurance_report_json, integrity_hash, Provenance};
use kshana::resilience::score::{composite, score, SimSummary};
use kshana::resilience::study::{
    declared_vs_measured, diversity_collapse, run_instability, ScenarioMix, StudyConfig,
};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Value};

const SCHEMA_VERSION: &str = "resilience-study/2";

fn flip_se(p: f64, n: usize) -> f64 {
    if n == 0 {
        return f64::NAN;
    }
    (p * (1.0 - p) / n as f64).sqrt()
}

fn instability_block(cfg: &StudyConfig) -> Value {
    let r = run_instability(cfg);
    let ranges: Value = r
        .rank_ranges
        .iter()
        .map(|(k, (lo, hi))| (k.clone(), json!([lo, hi])))
        .collect::<serde_json::Map<_, _>>()
        .into();
    let n_rankings = cfg.n_weight_draws * cfg.mixes.len();
    json!({
        "n_weight_draws": cfg.n_weight_draws,
        "dirichlet_alpha": cfg.dirichlet_alpha,
        "top1_flip_rate": r.top1_flip_rate,
        "top1_flip_se": flip_se(r.top1_flip_rate, n_rankings),
        "kendall_tau_mean": r.kendall_tau_mean,
        "kendall_tau_ci": [r.kendall_tau_ci.0, r.kendall_tau_ci.1],
        "level_flip_rate": r.level_flip_rate,
        "rank_ranges": ranges,
        "n_evaluations": r.n_evaluations,
    })
}

/// Instability from re-weighting ALONE, within each fixed scenario (isolates the
/// weighting effect from the scenario effect that the pooled metrics blend).
fn weighting_only_per_scenario(
    panel: &[PntArchitecture],
    mixes: &[ScenarioMix],
    seed: u64,
) -> Value {
    let mut m = serde_json::Map::new();
    for mix in mixes {
        let cfg = StudyConfig {
            archs: panel.to_vec(),
            mixes: vec![mix.clone()],
            n_weight_draws: 2000,
            dirichlet_alpha: vec![1.0; 7],
            seed,
        };
        let r = run_instability(&cfg);
        m.insert(
            mix.name.clone(),
            json!({
                "top1_flip_rate": r.top1_flip_rate,
                "kendall_tau_mean": r.kendall_tau_mean,
            }),
        );
    }
    Value::Object(m)
}

/// Sweep the Dirichlet concentration: alpha=1 is broad (any defensible weighting),
/// larger alpha concentrates near equal weights.
fn alpha_sweep(panel: &[PntArchitecture], mixes: &[ScenarioMix], seed: u64) -> Value {
    let alphas = [1.0_f64, 2.0, 5.0, 10.0, 20.0];
    let v: Vec<Value> = alphas
        .iter()
        .map(|&a| {
            let cfg = StudyConfig {
                archs: panel.to_vec(),
                mixes: mixes.to_vec(),
                n_weight_draws: 2000,
                dirichlet_alpha: vec![a; 7],
                seed,
            };
            let r = run_instability(&cfg);
            json!({
                "alpha": a,
                "top1_flip_rate": r.top1_flip_rate,
                "kendall_tau_mean": r.kendall_tau_mean,
                "level_flip_rate": r.level_flip_rate,
            })
        })
        .collect();
    Value::Array(v)
}

fn jittered_mixes(base: &[ScenarioMix], rng: &mut ChaCha8Rng, pct: f64) -> Vec<ScenarioMix> {
    base.iter()
        .map(|mix| {
            let per = mix
                .per_arch
                .iter()
                .map(|(k, s)| {
                    let mut j = |v: f64| v * (1.0 + pct * rng.gen_range(-1.0..1.0));
                    let s2 = SimSummary {
                        holdover_s: j(s.holdover_s).max(0.0),
                        availability: j(s.availability).clamp(0.0, 1.0),
                        detect_auc: j(s.detect_auc).clamp(0.5, 0.99),
                        integrity: j(s.integrity).clamp(0.0, 1.0),
                        security: s.security,
                        bounded: s.bounded,
                    };
                    (k.clone(), s2)
                })
                .collect();
            ScenarioMix {
                name: mix.name.clone(),
                per_arch: per,
            }
        })
        .collect()
}

fn stat(v: &[f64]) -> Value {
    let n = v.len() as f64;
    let mean = v.iter().sum::<f64>() / n;
    let mn = v.iter().cloned().fold(f64::INFINITY, f64::min);
    let mx = v.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    json!({"min": mn, "mean": mean, "max": mx})
}

/// Robustness of the conclusions to the modelled reduction: perturb every driver
/// by +/-`pct` over `reps` replicates and re-run, reporting the spread of the
/// headline metrics and how often the contested-middle architectures keep wide
/// rank ranges (span >= 3 of 7).
fn robustness(panel: &[PntArchitecture], base: &[ScenarioMix], pct: f64, reps: usize) -> Value {
    let mut rng = ChaCha8Rng::seed_from_u64(99);
    let (mut flips, mut levelflips) = (Vec::new(), Vec::new());
    let mut mid_wide = 0usize;
    for _ in 0..reps {
        let jm = jittered_mixes(base, &mut rng, pct);
        let cfg = StudyConfig {
            archs: panel.to_vec(),
            mixes: jm,
            n_weight_draws: 1000,
            dirichlet_alpha: vec![1.0; 7],
            seed: 1,
        };
        let r = run_instability(&cfg);
        flips.push(r.top1_flip_rate);
        levelflips.push(r.level_flip_rate);
        let wide = ["checkbox_gnss", "quad_gnss"].iter().all(|a| {
            let (lo, hi) = r.rank_ranges[*a];
            hi - lo >= 3
        });
        if wide {
            mid_wide += 1;
        }
    }
    json!({
        "jitter_pct": pct,
        "n_replicates": reps,
        "top1_flip_rate": stat(&flips),
        "level_flip_rate": stat(&levelflips),
        "contested_mid_wide_fraction": mid_wide as f64 / reps as f64,
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
        "h1_weighting_only_per_scenario": weighting_only_per_scenario(&panel, &mixes, seed),
        "h1_alpha_sweep": alpha_sweep(&panel, &mixes, seed),
        "h1_robustness_to_reduction": robustness(&panel, &mixes, 0.2, 40),
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
