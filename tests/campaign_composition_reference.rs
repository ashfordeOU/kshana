// SPDX-License-Identifier: AGPL-3.0-only
//! **Composition identities for the `campaign` kind.**
//!
//! A campaign only composes existing kinds, so what it must prove is that composing
//! changes nothing it should not:
//!
//! 1. A one-phase campaign reproduces the stand-alone scenario output bit for bit: the
//!    member's result document is byte-identical to `run_toml` on the scenario file,
//!    its digest is the one the campaign reports, and, when the timeline grid matches
//!    the run's own step, every aligned value equals the stand-alone series value.
//!    Checked on three kinds with different time columns (`clock`, `jamming`,
//!    `integrity`).
//! 2. A one-node sweep and a one-member composition read the same number as the
//!    stand-alone run.
//! 3. A Monte Carlo ensemble with a fixed seed is byte-stable, and realisation `k` is
//!    exactly the stand-alone run at `seed + k`.
//! 4. On an analytic case, a white-frequency-noise clock coasting after its last
//!    synchronisation, the time error at the end of the run is Gaussian with zero mean
//!    and variance `q_wf * tau` (the random walk of phase under white frequency noise,
//!    NIST Technical Note 1337). The ensemble mean falls inside the reported bootstrap
//!    95% confidence interval around the true mean of zero, and the sample variance
//!    lies inside the two-sided 99% chi-square interval of the closed form.
//!
//! The chain's own modelling (additive carry, zero-order hold, a phase ended at a
//! computed time) is checked for what it does, not validated: the campaign rows in
//! docs/VERIFICATION-MATRIX.md are MODELLED.

use serde_json::Value;
use sha2::{Digest, Sha256};

fn sha(s: &str) -> String {
    let mut h = Sha256::new();
    h.update(s.as_bytes());
    hex::encode(h.finalize())
}

fn read(path: &str) -> String {
    std::fs::read_to_string(path).unwrap_or_else(|e| panic!("cannot read {path}: {e}"))
}

/// A one-phase campaign around the scenario file `path`, on a grid of `step_s`.
fn one_phase(path: &str, duration_s: f64, step_s: f64) -> String {
    let scn: toml::Value = toml::from_str(&read(path)).unwrap();
    let mut run = toml::map::Map::new();
    run.insert("scenario".into(), scn);
    let mut phase = toml::map::Map::new();
    phase.insert("name".into(), "only".into());
    phase.insert("duration_s".into(), toml::Value::Float(duration_s));
    phase.insert(
        "runs".into(),
        toml::Value::Array(vec![toml::Value::Table(run)]),
    );
    let mut timeline = toml::map::Map::new();
    timeline.insert("step_s".into(), toml::Value::Float(step_s));
    let mut top = toml::map::Map::new();
    top.insert("kind".into(), "campaign".into());
    top.insert("timeline".into(), toml::Value::Table(timeline));
    top.insert(
        "phases".into(),
        toml::Value::Array(vec![toml::Value::Table(phase)]),
    );
    toml::to_string(&toml::Value::Table(top)).unwrap()
}

fn check_one_phase(path: &str, duration_s: f64, step_s: f64, t_col: &str, pairs: &[(&str, &str)]) {
    let standalone = kshana::api::run_toml(&read(path)).unwrap();
    let run =
        kshana::campaign::run_campaign_detailed(&one_phase(path, duration_s, step_s)).unwrap();
    // The member result is the stand-alone result, byte for byte.
    assert_eq!(run.member_results.len(), 1);
    assert_eq!(
        run.member_results[0].1, standalone.json,
        "{path}: the campaign member's result differs from the stand-alone run"
    );
    let t = run.result.timeline.as_ref().unwrap();
    assert_eq!(t.phases[0].runs[0].result_sha256, sha(&standalone.json));
    // And the aligned series are the stand-alone series, value for value.
    let doc: Value = serde_json::from_str(&standalone.json).unwrap();
    let (rows_path, t_key) = t_col.split_once("[].").unwrap();
    let mut rows = &doc;
    for p in rows_path.split('.') {
        rows = &rows[p];
    }
    let rows = rows.as_array().unwrap();
    assert_eq!(
        t.t_s.len(),
        rows.len(),
        "{path}: grid and run lengths differ"
    );
    for (channel, key) in pairs {
        let ch = &t.channels[*channel];
        for (k, row) in rows.iter().enumerate() {
            assert_eq!(row[t_key].as_f64().unwrap(), t.t_s[k]);
            let want = row[*key].as_f64();
            assert_eq!(
                ch.values[k].map(f64::to_bits),
                want.map(f64::to_bits),
                "{path}: channel {channel} at grid {k}"
            );
        }
    }
}

#[test]
fn a_one_phase_clock_campaign_reproduces_the_standalone_run_bit_for_bit() {
    check_one_phase(
        "scenarios/clock-holdover.toml",
        7200.0,
        10.0,
        "classical.series[].t",
        &[("time_error_ns", "error_ns")],
    );
}

#[test]
fn a_one_phase_integrity_campaign_reproduces_the_standalone_run_bit_for_bit() {
    check_one_phase(
        "scenarios/integrity-raim.toml",
        43200.0,
        120.0,
        "epochs[].t_s",
        &[("protection_level_m", "vpl_m")],
    );
}

#[test]
fn a_one_phase_jamming_campaign_reproduces_the_standalone_run_bit_for_bit() {
    // The jamming channel is a mean over satellites, so compare it to the mean the
    // stand-alone document gives, computed here independently.
    let path = "scenarios/jamming-demo.toml";
    let standalone = kshana::api::run_toml(&read(path)).unwrap();
    let run = kshana::campaign::run_campaign_detailed(&one_phase(path, 1800.0, 30.0)).unwrap();
    assert_eq!(run.member_results[0].1, standalone.json);
    let doc: Value = serde_json::from_str(&standalone.json).unwrap();
    let t = run.result.timeline.as_ref().unwrap();
    let epochs = doc["epochs"].as_array().unwrap();
    assert_eq!(epochs.len(), t.t_s.len());
    for (k, e) in epochs.iter().enumerate() {
        let sats = e["sats"].as_array().unwrap();
        let mean = sats
            .iter()
            .map(|s| s["cn0_effective_dbhz"].as_f64().unwrap())
            .sum::<f64>()
            / sats.len() as f64;
        assert_eq!(t.channels["cn0_dbhz"].values[k], Some(mean));
        assert_eq!(
            t.channels["tracking"].values[k],
            e["tracking"].as_f64(),
            "tracking at {k}"
        );
        let alarm = if e["tracking"].as_u64().unwrap() < 4 {
            1.0
        } else {
            0.0
        };
        assert_eq!(t.channels["alarm"].values[k], Some(alarm));
    }
}

#[test]
fn a_one_node_sweep_and_a_one_member_composition_read_the_standalone_number() {
    let path = "scenarios/jamming-demo.toml";
    let standalone = kshana::api::run_toml(&read(path)).unwrap();
    let doc: Value = serde_json::from_str(&standalone.json).unwrap();
    let want = doc["fom"]["mean_js_db"].as_f64().unwrap();
    let scn = read(path)
        .lines()
        .filter(|l| !l.trim_start().starts_with('#'))
        .collect::<Vec<_>>()
        .join("\n");
    // Nest the scenario under a table by re-serialising it.
    let v: toml::Value = toml::from_str(&scn).unwrap();
    let nested = |prefix: &str| -> String {
        let mut top = toml::map::Map::new();
        let mut inner = toml::map::Map::new();
        inner.insert("scenario".into(), v.clone());
        let _ = prefix;
        top.insert("x".into(), toml::Value::Table(inner));
        toml::to_string(&toml::Value::Table(top)).unwrap().replacen(
            "[x.",
            &format!("[{prefix}."),
            usize::MAX,
        )
    };
    // Sweep the jammer power over two identical values: both nodes are the file.
    let sweep = format!(
        "kind = \"campaign\"\n[sweep]\nmetrics = [{{ name = \"js\", path = \"fom.mean_js_db\" }}]\n\
         [[sweep.axes]]\nname = \"p\"\nkey = \"jammer.power_dbw\"\nunit = \"dBW\"\nstart = 10.0\nstop = 10.0\nsteps = 2\n{}",
        nested("sweep")
    );
    let r = kshana::campaign::run_campaign(&sweep).unwrap();
    for n in &r.sweep.as_ref().unwrap().nodes {
        match &n.metrics["js"] {
            kshana::campaign::NodeMetric::Value(Some(x)) => assert_eq!(*x, want),
            other => panic!("unexpected node metric {other:?}"),
        }
    }
    let compose = format!(
        "kind = \"campaign\"\n[[compose.members]]\nlabel = \"only\"\nmetrics = [{{ name = \"js\", path = \"fom.mean_js_db\" }}]\n{}",
        nested("compose.members")
    );
    let r = kshana::campaign::run_campaign(&compose).unwrap();
    let c = r.compose.unwrap();
    assert_eq!(c.members["only"].metrics["js"], Some(want));
    assert_eq!(c.members["only"].result_sha256, sha(&standalone.json));
    assert_eq!(c.combined["js"].min, want);
    assert_eq!(c.combined["js"].max, want);
}

#[test]
fn a_fixed_seed_ensemble_is_byte_stable_and_each_realisation_is_the_standalone_run() {
    let src = read("scenarios/campaign-monte-carlo-clock-holdover.toml")
        .replace("runs = 200", "runs = 12");
    let a = kshana::api::run_toml(&src).unwrap();
    let b = kshana::api::run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "a fixed-seed ensemble must reproduce byte for byte"
    );
    let doc: Value = serde_json::from_str(&a.json).unwrap();
    let samples = doc["monte_carlo"]["metrics"]["final_error"]["samples"]
        .as_array()
        .unwrap();
    let base: toml::Value = toml::from_str(&src).unwrap();
    for k in [0_usize, 5, 11] {
        let mut scn = base["monte_carlo"]["scenario"].clone();
        scn.as_table_mut()
            .unwrap()
            .insert("seed".into(), toml::Value::Integer(42 + k as i64));
        let one = kshana::api::run_toml(&toml::to_string(&scn).unwrap()).unwrap();
        let d: Value = serde_json::from_str(&one.json).unwrap();
        let last = d["classical"]["series"].as_array().unwrap().last().unwrap()["error_ns"]
            .as_f64()
            .unwrap();
        assert_eq!(samples[k].as_f64().unwrap(), last, "realisation {k}");
    }
    // The campaign hash ignores formatting and key order.
    let reordered = src.replacen(
        "title = \"Monte Carlo: free-running clock error against its closed form\"\nseed = 20260928",
        "seed = 20260928\ntitle = \"Monte Carlo: free-running clock error against its closed form\"",
        1,
    );
    assert_ne!(reordered, src);
    assert_eq!(
        kshana::campaign::campaign_hash(&reordered).unwrap(),
        kshana::campaign::campaign_hash(&src).unwrap()
    );
}

#[test]
fn the_ensemble_mean_and_spread_match_the_white_fm_closed_form() {
    let out =
        kshana::api::run_toml(&read("scenarios/campaign-monte-carlo-clock-holdover.toml")).unwrap();
    let doc: Value = serde_json::from_str(&out.json).unwrap();
    let m = &doc["monte_carlo"]["metrics"]["final_error"];
    let n = m["n"].as_f64().unwrap();
    assert_eq!(n, 200.0);
    // Closed form: last synchronisation at 590 s (the last nominal sample on a 10 s
    // grid), end of run at 3600 s, so tau = 3010 s and sigma = sqrt(q_wf * tau).
    let q_wf: f64 = 9.0e-20;
    let tau = 3600.0 - 590.0;
    let sigma_ns = (q_wf * tau).sqrt() * 1e9;
    assert!((sigma_ns - 16.459_040).abs() < 1e-5, "sigma {sigma_ns}");
    let (lo, hi) = (
        m["ci95_low"].as_f64().unwrap(),
        m["ci95_high"].as_f64().unwrap(),
    );
    let mean = m["mean"].as_f64().unwrap();
    assert!(
        lo <= 0.0 && 0.0 <= hi,
        "the true mean 0 must lie inside the reported 95% interval [{lo}, {hi}]"
    );
    assert!(lo <= mean && mean <= hi);
    // The interval's half-width is the standard error it claims to be (within 25%).
    let half = (hi - lo) / 2.0;
    let se = 1.959_964 * sigma_ns / n.sqrt();
    assert!((half / se - 1.0).abs() < 0.25, "half-width {half} vs {se}");
    // Sample variance inside the two-sided 99% chi-square interval (199 degrees of
    // freedom: 0.5% and 99.5% quantiles 151.37 and 254.14).
    let std = m["std"].as_f64().unwrap(); // population form, divisor n
    let s2 = std * std * n / (n - 1.0);
    let stat = (n - 1.0) * s2 / (sigma_ns * sigma_ns);
    assert!(
        (151.37..=254.14).contains(&stat),
        "chi-square statistic {stat} outside the 99% interval (std {std} ns vs {sigma_ns} ns)"
    );
    // Percentiles are ordered and bracket the median of a zero-mean Gaussian.
    let (p05, p50, p95) = (
        m["p05"].as_f64().unwrap(),
        m["p50"].as_f64().unwrap(),
        m["p95"].as_f64().unwrap(),
    );
    assert!(p05 < p50 && p50 < p95);
    assert!((p95 - 1.644_854 * sigma_ns).abs() < 0.3 * sigma_ns);
    assert!((p05 + 1.644_854 * sigma_ns).abs() < 0.3 * sigma_ns);
}

#[test]
fn the_chained_mission_hands_state_on_and_ends_the_spoofing_phase_on_detection() {
    let src = read("scenarios/campaign-jam-spoof-holdover-integrity.toml");
    let run = kshana::campaign::run_campaign_detailed(&src).unwrap();
    let t = run.result.timeline.as_ref().unwrap();
    let names: Vec<&str> = t.phases.iter().map(|p| p.name.as_str()).collect();
    assert_eq!(
        names,
        [
            "nominal",
            "jamming",
            "spoofing",
            "holdover",
            "integrity-alarm",
            "recovery"
        ]
    );
    // Phases tile the timeline.
    for w in t.phases.windows(2) {
        assert_eq!(w[0].t1_s, w[1].t0_s);
    }
    // The spoofing phase ends at the spoof run's own detection time.
    let spoof_doc: Value = run
        .member_results
        .iter()
        .find(|(l, _)| l == "phase spoofing/run 0")
        .map(|(_, j)| serde_json::from_str(j).unwrap())
        .unwrap();
    let detect = spoof_doc["classical"]["detect_time_s"].as_f64().unwrap();
    let sp = &t.phases[2];
    assert_eq!(sp.t1_s - sp.t0_s, detect);
    assert!(sp.ended_by.starts_with("end_at"));
    // The holdover carries the spoofed offset at detection: the last spoof sample
    // inside the phase, which is the offset the monitor saw.
    let series = spoof_doc["classical"]["series"].as_array().unwrap();
    let at_detect = series
        .iter()
        .rev()
        .find(|s| s["t"].as_f64().unwrap() <= detect)
        .unwrap()["offset_ns"]
        .as_f64()
        .unwrap();
    assert_eq!(t.phases[3].carried["time_error_ns"], at_detect);
    assert_eq!(
        at_detect,
        spoof_doc["classical"]["offset_at_detection_ns"]
            .as_f64()
            .unwrap()
    );
    // …and the first holdover grid value is that offset plus the clock's own first
    // sample, which is zero at its synchronisation instant.
    let k0 = t.t_s.iter().position(|&x| x == t.phases[3].t0_s).unwrap();
    assert_eq!(t.channels["time_error_ns"].values[k0], Some(at_detect));
    // Recovery re-synchronises: no carry, zero time error.
    let rec = &t.phases[5];
    assert!(rec.carried.is_empty());
    let kr = t.t_s.iter().position(|&x| x == rec.t0_s).unwrap();
    assert_eq!(t.channels["time_error_ns"].values[kr], Some(0.0));
    // The alarm is quiet in nominal and recovery and raised through spoofing and the
    // integrity alarm.
    let alarm = &t.channels["alarm"].values;
    let in_phase = |i: usize| {
        let p = &t.phases[i];
        t.t_s
            .iter()
            .enumerate()
            .filter(move |(_, &x)| x >= p.t0_s && x < p.t1_s)
            .map(|(k, _)| k)
    };
    assert!(in_phase(0).all(|k| alarm[k] == Some(0.0)));
    assert!(in_phase(5).all(|k| alarm[k] == Some(0.0)));
    assert!(in_phase(2).all(|k| alarm[k] == Some(1.0)));
    // In the integrity-alarm phase the flag is up wherever the protection level is
    // missing (too few satellites) or exceeds the alert limit, and up for most of it.
    let pl = &t.channels["protection_level_m"].values;
    let al = &t.channels["alert_limit_m"].values;
    let mut up = 0;
    let mut total = 0;
    for k in in_phase(4) {
        total += 1;
        if alarm[k] == Some(1.0) {
            up += 1;
        }
        let exceeded = match (pl[k], al[k]) {
            (Some(p), Some(a)) => p > a,
            _ => true,
        };
        if exceeded {
            assert_eq!(
                alarm[k],
                Some(1.0),
                "integrity exceeded at grid {k} with no alarm"
            );
        }
    }
    assert!(
        2 * up > total,
        "alarm up on {up} of {total} integrity-alarm samples"
    );
    // C/N0 falls below the floor in holdover and is above it at nominal.
    let cn0 = &t.channels["cn0_dbhz"].values;
    let floor = &t.channels["cn0_floor_dbhz"].values;
    assert!(in_phase(3).all(|k| cn0[k].unwrap() < floor[k].unwrap()));
    assert!(in_phase(0).all(|k| cn0[k].unwrap() > floor[k].unwrap()));
    // Two events: the RF detector at the start of spoofing, the clock monitor at its end.
    assert_eq!(t.events.len(), 2);
    assert_eq!(t.events[0].t_s, sp.t0_s);
    assert_eq!(t.events[1].t_s, sp.t1_s);
    // Every numeric field of the document carries a unit and a provenance class.
    let doc: Value =
        serde_json::from_str(&kshana::campaign::to_json(&run.result).unwrap()).unwrap();
    let audit = kshana::field_schema::audit_document(&doc);
    assert!(audit.missing.is_empty(), "undescribed: {:?}", audit.missing);
    assert!(audit.malformed.is_empty());
    // The reproducibility digest is over every member result, in order.
    let mut h = Sha256::new();
    for (_, j) in &run.member_results {
        h.update(sha(j).as_bytes());
    }
    assert_eq!(
        run.result.reproducibility.run_digest,
        hex::encode(h.finalize())
    );
    assert_eq!(run.result.reproducibility.runs_total, 18);
}

#[test]
fn a_handoff_writes_the_previous_phase_number_into_the_next_scenario() {
    let clock = |seed: u64, denied: bool| {
        format!(
            "[[phases.runs]]\n[phases.runs.scenario]\nseed = {seed}\nthreshold_ns = 20.0\n\
             [phases.runs.scenario.time]\nstep_s = 10.0\nduration_s = 600.0\n\
             [phases.runs.scenario.gnss]\nwindows = [{{ t0 = 0.0, t1 = {}, state = \"nominal\" }}, {{ t0 = {}, t1 = 600.0, state = \"denied\" }}]\n\
             [phases.runs.scenario.clock_quantum]\nid = \"q\"\nprovenance = \"t\"\ny0 = 0.0\nq_wf = 1.0e-30\nq_rw = 0.0\n\
             [phases.runs.scenario.clock_classical]\nid = \"c\"\nprovenance = \"t\"\ny0 = 5.0e-10\nq_wf = 9.0e-20\nq_rw = 0.0\n",
            if denied { "1.0" } else { "600.0" },
            if denied { "1.0" } else { "600.0" },
        )
    };
    let src = format!(
        "kind = \"campaign\"\n[timeline]\nstep_s = 10.0\n\
         [[phases]]\nname = \"a\"\nduration_s = 600.0\n{}\
         [[phases]]\nname = \"b\"\nduration_s = 600.0\ncarry = [\"time_error_ns\"]\n\
         [[phases.handoff]]\nfrom = \"classical.fom.timing_rms_ns\"\nto = \"threshold_ns\"\nscale = 3.0\n{}",
        clock(1, true),
        clock(2, true)
    );
    let run = kshana::campaign::run_campaign_detailed(&src).unwrap();
    let a: Value = serde_json::from_str(&run.member_results[0].1).unwrap();
    let rms = a["classical"]["fom"]["timing_rms_ns"].as_f64().unwrap();
    let t = run.result.timeline.as_ref().unwrap();
    assert_eq!(t.handoffs.len(), 1);
    assert_eq!(t.handoffs[0].value, 3.0 * rms);
    assert_eq!(t.handoffs[0].unit, "ns");
    // Phase b's guard is the handed-on number, read back from phase b's own result.
    let b: Value = serde_json::from_str(&run.member_results[1].1).unwrap();
    assert_eq!(b["threshold_ns"].as_f64().unwrap(), 3.0 * rms);
    let kb = t.t_s.iter().position(|&x| x == 600.0).unwrap();
    assert_eq!(t.channels["guard_ns"].values[kb], Some(3.0 * rms));
    // Carry adds phase a's last time error to every phase-b sample.
    let a_last = a["classical"]["series"].as_array().unwrap().last().unwrap()["error_ns"]
        .as_f64()
        .unwrap();
    let b_series = b["classical"]["series"].as_array().unwrap();
    assert_eq!(t.phases[1].carried["time_error_ns"], a_last);
    for (i, s) in b_series.iter().take(60).enumerate() {
        assert_eq!(
            t.channels["time_error_ns"].values[60 + i],
            Some(s["error_ns"].as_f64().unwrap() + a_last)
        );
    }
}

#[test]
fn an_empty_campaign_runs_and_says_it_composed_nothing() {
    let out = kshana::api::run_toml("kind = \"campaign\"\n").unwrap();
    assert!(out.summary.contains("nothing composed"), "{}", out.summary);
    assert!(out.summary.contains("0 member runs"));
}

#[test]
fn malformed_campaigns_fail_loudly() {
    let bad = [
        ("kind = \"campaign\"\n[sweeep]\nx = 1\n", "unknown field"),
        (
            "kind = \"campaign\"\n[[phases]]\nname = \"a\"\nduration_s = 10.0\n[[phases.runs]]\n[phases.runs.scenario]\nkind = \"spoof-detect\"\n",
            "timeline",
        ),
        (
            "kind = \"campaign\"\n[[compose.members]]\nlabel = \"x\"\nmetrics = [{ name = \"m\", path = \"fom.x\" }]\n[compose.members.scenario]\nkind = \"campaign\"\n",
            "cannot contain a campaign",
        ),
        (
            "kind = \"campaign\"\n[[compose.members]]\nlabel = \"x\"\nmetrics = [{ name = \"m\", path = \"no.such\" }]\n[compose.members.scenario]\nkind = \"quantum-time-transfer\"\n",
            "no field",
        ),
    ];
    for (src, needle) in bad {
        let e = kshana::api::run_toml(src).unwrap_err();
        assert!(e.contains(needle), "expected `{needle}` in `{e}`");
    }
}
