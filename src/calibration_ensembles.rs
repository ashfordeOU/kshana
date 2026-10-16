// SPDX-License-Identifier: AGPL-3.0-only
//! Calibration ensembles (CAP-10): a single-seed check re-run over many independent
//! seeds, so the pass fraction of its tolerance and the coverage of its stated
//! confidence interval are measured rather than assumed.
//!
//! The protocol, bars and predictions are pre-registered in
//! `docs/design/evidence/cap10-calibration/PREREGISTRATION.md`. The generator
//! (`cargo run --release --bin gen_calibration_ensembles`) writes
//! `docs/CALIBRATION-ENSEMBLES.md` and `docs/data/calibration-ensembles.csv`; the
//! oracles are closed forms on the engine's own models, so every row is MODELLED.

use crate::allan::overlapping_adev;
use crate::models::{ClockModel, ErrorModel};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;

/// Ensembles (E1) or seeds (E2, E3) per row.
pub const K: usize = 200;

/// The E1 scenario, read at compile time so the generator and the test run the same text.
const E1_SCENARIO: &str = include_str!("../scenarios/campaign-monte-carlo-clock-holdover.toml");

/// E1's closed-form standard deviation of the final error (ns): sqrt(q_wf * 3010 s).
pub fn e1_sigma_ns() -> f64 {
    (9.0e-20_f64 * 3010.0).sqrt() * 1e9
}

/// One E1 ensemble's statistics and the four checks of the single-seed test.
#[derive(Clone, Debug, PartialEq)]
pub struct E1Row {
    pub j: usize,
    pub mean_ns: f64,
    pub std_ns: f64,
    pub ci_low_ns: f64,
    pub ci_high_ns: f64,
    pub p05_ns: f64,
    pub p95_ns: f64,
    pub c1: bool,
    pub c2: bool,
    pub c3: bool,
    pub c4: bool,
}

/// E1 ensemble `j`: base seed 1 000 000 + 1000 j, campaign (bootstrap) seed 20260928 + j.
pub fn e1(j: usize) -> Result<E1Row, String> {
    let mut v: toml::Value = toml::from_str(E1_SCENARIO).map_err(|e| e.to_string())?;
    let t = v.as_table_mut().ok_or("E1 scenario is not a table")?;
    t.insert("seed".into(), toml::Value::Integer(20_260_928 + j as i64));
    let mc = t
        .get_mut("monte_carlo")
        .and_then(toml::Value::as_table_mut)
        .ok_or("E1 scenario has no [monte_carlo]")?;
    mc.insert(
        "base_seed".into(),
        toml::Value::Integer(1_000_000 + 1000 * j as i64),
    );
    let src = toml::to_string(&v).map_err(|e| e.to_string())?;
    let out = crate::api::run_toml(&src)?;
    let doc: serde_json::Value = serde_json::from_str(&out.json).map_err(|e| e.to_string())?;
    let m = &doc["monte_carlo"]["metrics"]["final_error"];
    let f = |k: &str| {
        m[k].as_f64()
            .ok_or_else(|| format!("E1: final_error.{k} missing"))
    };
    let n = f("n")?;
    let (mean, std, lo, hi, p05, p95) = (
        f("mean")?,
        f("std")?,
        f("ci95_low")?,
        f("ci95_high")?,
        f("p05")?,
        f("p95")?,
    );
    let sigma = e1_sigma_ns();
    let s2 = std * std * n / (n - 1.0);
    let stat = (n - 1.0) * s2 / (sigma * sigma);
    let half = (hi - lo) / 2.0;
    let se = 1.959_964 * sigma / n.sqrt();
    Ok(E1Row {
        j,
        mean_ns: mean,
        std_ns: std,
        ci_low_ns: lo,
        ci_high_ns: hi,
        p05_ns: p05,
        p95_ns: p95,
        c1: lo <= 0.0 && 0.0 <= hi,
        c2: (151.37..=254.14).contains(&stat),
        c3: (half / se - 1.0).abs() < 0.25,
        c4: (p95 - 1.644_854 * sigma).abs() < 0.3 * sigma
            && (p05 + 1.644_854 * sigma).abs() < 0.3 * sigma,
    })
}

/// The phase samples of a pure white-FM clock, as `tests/calibration.rs` simulates them.
fn white_fm_phase(q_wf: f64, n: usize, seed: u64) -> Vec<f64> {
    let mut c = ClockModel::new("cal", "calibration", 0.0, q_wf, 0.0);
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut v = Vec::with_capacity(n);
    v.push(0.0);
    for _ in 1..n {
        c.step(1.0, &mut rng);
        v.push(c.phase());
    }
    v
}

/// One seed of E2: ADEV(1 s) of 8192 samples against 3e-10, tolerance 20 %.
#[derive(Clone, Debug, PartialEq)]
pub struct E2Row {
    pub seed: u64,
    pub rel: f64,
    pub pass: bool,
}

/// E2 at `seed`.
pub fn e2(seed: u64) -> E2Row {
    let target = 3.0e-10;
    let phase = white_fm_phase(target * target, 8192, seed);
    let rel = (overlapping_adev(&phase, 1.0, 1) - target).abs() / target;
    E2Row {
        seed,
        rel,
        pass: rel < 0.2,
    }
}

/// One seed of E3: ADEV at 1, 10 and 100 s of 40 000 samples, tolerance 25 % each.
#[derive(Clone, Debug, PartialEq)]
pub struct E3Row {
    pub seed: u64,
    pub rel: [f64; 3],
    pub pass: bool,
}

/// E3 at `seed`.
pub fn e3(seed: u64) -> E3Row {
    let s1 = 3.0e-10;
    let phase = white_fm_phase(s1 * s1, 40_000, seed);
    let mut rel = [0.0; 3];
    for (r, &m) in rel.iter_mut().zip(&[1usize, 10, 100]) {
        let target = s1 / (m as f64).sqrt();
        *r = (overlapping_adev(&phase, 1.0, m) - target).abs() / target;
    }
    E3Row {
        seed,
        rel,
        pass: rel.iter().all(|&r| r < 0.25),
    }
}

/// Every row of every ensemble.
pub struct Report {
    pub e1: Vec<E1Row>,
    pub e2: Vec<E2Row>,
    pub e3: Vec<E3Row>,
}

/// Run the whole protocol.
pub fn run() -> Result<Report, String> {
    Ok(Report {
        e1: (0..K).map(e1).collect::<Result<_, _>>()?,
        e2: (0..K as u64).map(e2).collect(),
        e3: (0..K as u64).map(e3).collect(),
    })
}

/// A pre-registered bar and its outcome.
pub struct Bar {
    pub id: &'static str,
    pub what: &'static str,
    pub count: usize,
    pub lo: usize,
    pub hi: usize,
}

impl Bar {
    pub fn met(&self) -> bool {
        (self.lo..=self.hi).contains(&self.count)
    }
}

/// The bars, scored on a report.
pub fn bars(r: &Report) -> Vec<Bar> {
    let n = |it: &mut dyn Iterator<Item = bool>| it.filter(|&b| b).count();
    vec![
        Bar {
            id: "B1",
            what: "E1 c1: the 95 % interval covers the true mean 0",
            count: n(&mut r.e1.iter().map(|x| x.c1)),
            lo: 181,
            hi: 197,
        },
        Bar {
            id: "B2",
            what: "E1 c2: chi-square statistic inside its 99 % interval",
            count: n(&mut r.e1.iter().map(|x| x.c2)),
            lo: 194,
            hi: 200,
        },
        Bar {
            id: "B3",
            what: "E1 c3: interval half-width within 25 % of 1.96 sigma/sqrt(n)",
            count: n(&mut r.e1.iter().map(|x| x.c3)),
            lo: 190,
            hi: K,
        },
        Bar {
            id: "B3",
            what: "E1 c4: p05 and p95 within 0.3 sigma of the Gaussian quantiles",
            count: n(&mut r.e1.iter().map(|x| x.c4)),
            lo: 190,
            hi: K,
        },
        Bar {
            id: "B3",
            what: "E2: ADEV(1 s) within 20 % (tests/calibration.rs csac_white_fm_adev_matches_datasheet)",
            count: n(&mut r.e2.iter().map(|x| x.pass)),
            lo: 190,
            hi: K,
        },
        Bar {
            id: "B3",
            what: "E3: ADEV(1, 10, 100 s) each within 25 % (tests/calibration.rs csac_white_fm_adev_curve)",
            count: n(&mut r.e3.iter().map(|x| x.pass)),
            lo: 190,
            hi: K,
        },
    ]
}

fn g(v: f64) -> String {
    format!("{v:.17e}")
}

/// The per-row CSV: one line per ensemble or seed, full precision.
pub fn csv(r: &Report) -> String {
    let mut s = String::from("row,index,a,b,c,d,e,f,checks\n");
    let b = |x: bool| if x { "1" } else { "0" };
    for x in &r.e1 {
        s.push_str(&format!(
            "E1,{},{},{},{},{},{},{},{}{}{}{}\n",
            x.j,
            g(x.mean_ns),
            g(x.std_ns),
            g(x.ci_low_ns),
            g(x.ci_high_ns),
            g(x.p05_ns),
            g(x.p95_ns),
            b(x.c1),
            b(x.c2),
            b(x.c3),
            b(x.c4)
        ));
    }
    for x in &r.e2 {
        s.push_str(&format!("E2,{},{},,,,,,{}\n", x.seed, g(x.rel), b(x.pass)));
    }
    for x in &r.e3 {
        s.push_str(&format!(
            "E3,{},{},{},{},,,,{}\n",
            x.seed,
            g(x.rel[0]),
            g(x.rel[1]),
            g(x.rel[2]),
            b(x.pass)
        ));
    }
    s
}

fn max(it: impl Iterator<Item = f64>) -> f64 {
    it.fold(0.0, f64::max)
}

/// The generated report.
pub fn markdown(r: &Report) -> String {
    let mut s = String::new();
    s.push_str(
        "<!-- Generated by `cargo run --release --bin gen_calibration_ensembles`; do not edit. -->\n\
         # Calibration ensembles\n\n\
         A single-seed test shows that one seed passes. Each row below re-runs such a check over \
         200 independent seeds, and counts how often its tolerance passes and how often its stated \
         interval covers the known truth. The protocol, bars and predictions were pre-registered \
         before the first run, in \
         [`docs/design/evidence/cap10-calibration/PREREGISTRATION.md`](design/evidence/cap10-calibration/PREREGISTRATION.md). \
         The per-seed values are in [`docs/data/calibration-ensembles.csv`](data/calibration-ensembles.csv).\n\n\
         The oracles are closed forms on the engine's own models: **MODELLED**. A calibration \
         ensemble checks that a statistic is honest about its own spread, not that the model \
         matches a measured clock.\n\n",
    );
    s.push_str(
        "| Bar | Check | Passing | Pre-registered region | Outcome |\n|---|---|---|---|---|\n",
    );
    for b in bars(r) {
        s.push_str(&format!(
            "| {} | {} | {} of {K} ({:.3}) | [{}, {}] | {} |\n",
            b.id,
            b.what,
            b.count,
            b.count as f64 / K as f64,
            b.lo,
            b.hi,
            if b.met() { "MET" } else { "**NOT MET**" }
        ));
    }
    let sigma = e1_sigma_ns();
    s.push_str(&format!(
        "\nE1 is `scenarios/campaign-monte-carlo-clock-holdover.toml`, 200 ensembles of 200 \
         realisations each, against the closed form: mean 0, sigma = {sigma:.6} ns. \
         Ensemble j uses base seed 1 000 000 + 1000 j and bootstrap seed 20260928 + j. The \
         largest relative ADEV error was {:.4} for E2 and {:.4} for E3 (across 1, 10 and 100 s).\n",
        max(r.e2.iter().map(|x| x.rel)),
        max(r.e3.iter().flat_map(|x| x.rel)),
    ));
    s
}
