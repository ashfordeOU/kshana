// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana bench ...`: the command-line front of kshana-bench (`bench/SPEC.md`).
//!
//! Every subcommand works on local files. Nothing opens a network connection and nothing is
//! transmitted; datasets are fetched by the scripts named in the manifests, not by this command.

use std::path::{Path, PathBuf};

use serde_json::{json, Value};

use super::tasks::{self, C_BASELINES};
use super::{
    reveal_check, seal, sha256_hex, site, validate_result, BenchError, Split, MANIFEST_SCHEMA,
    SPEC_VERSION,
};

/// Usage text for `kshana bench`.
pub const BENCH_USAGE: &str = "usage: kshana bench spec
   or: kshana bench truth --task a --data <extracted JammerTest 2024 dir> --split <dev|test|holdout|all> --out <truth.json>
   or: kshana bench cases --task <c|d> --split <dev|test|holdout> --out <dir> [--clocks <clocks.txt>] [--scale <0..1>] [--seed-file <file>]
   or: kshana bench score --truth <truth.json> --predictions <predictions.json> [--threshold <x>] [--out <result.json>]
   or: kshana bench baseline --task <a|b|c|d> --split <dev|test|holdout> --out <dir> [--data <dir>] [--clocks <clocks.txt>] [--scale <0..1>] [--seed-file <file>]
   or: kshana bench seal --task <a|b|c|d> --seed-file <file> [--new]
   or: kshana bench reveal-check --task <a|b|c|d> --seed-file <file> --commitment <hex>
   or: kshana bench manifest --task a --data <extracted dir> [--archive <tar.gz>] --out <manifest.json>
   or: kshana bench verify-manifest <manifest.json> --root <dir>
   or: kshana bench validate <result.json>...
   or: kshana bench leaderboard [<results dir|result.json>...] --out <page.html> [--fragment]   (no inputs: the empty state; --fragment: an embeddable section)
   (a seed file holds the secret behind a sealed holdout; keep it out of version control)";

/// Run `kshana bench ...`; returns the process exit code.
pub fn run(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(code) => code,
        Err(e) => {
            eprintln!("error: {e}");
            2
        }
    }
}

/// Run `f` in English, for a document written to a file (an error is shown in the user's language).
fn en<T>(f: impl Fn() -> Result<T, BenchError>) -> Result<T, BenchError> {
    crate::i18n::in_english_or_localised_error(f)
}

/// The same for a builder that cannot fail.
fn en_ok<T>(f: impl FnOnce() -> T) -> T {
    crate::i18n::in_english(f)
}

fn flag<'a>(args: &'a [String], name: &str) -> Result<Option<&'a str>, BenchError> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args
            .get(i + 1)
            .map(|v| Some(v.as_str()))
            .ok_or_else(|| BenchError(crate::t!("bench-cli-needs-value", name = name))),
    }
}

fn need<'a>(args: &'a [String], name: &str) -> Result<&'a str, BenchError> {
    flag(args, name)?
        .ok_or_else(|| BenchError(crate::terr!("e-bench-cli-is-required", flag = name)))
}

fn check(
    args: &[String],
    valued: &[&str],
    positionals_allowed: bool,
) -> Result<Vec<String>, BenchError> {
    let mut pos = Vec::new();
    let mut i = 0;
    while i < args.len() {
        let a = args[i].as_str();
        if valued.contains(&a) {
            i += 2;
        } else if a.starts_with("--") {
            return Err(BenchError(crate::t!("bench-cli-unknown-option", a = a)));
        } else {
            pos.push(a.to_string());
            i += 1;
        }
    }
    if !positionals_allowed && !pos.is_empty() {
        return Err(BenchError(crate::t!(
            "bench-cli-unexpected-argument",
            pos = pos[0]
        )));
    }
    Ok(pos)
}

fn read(p: &str) -> Result<String, BenchError> {
    std::fs::read_to_string(p)
        .map_err(|e| BenchError(crate::t!("bench-cli-cannot-read", p = p, e = e)))
}

fn write(p: &Path, text: &str) -> Result<(), BenchError> {
    if let Some(d) = p.parent() {
        if !d.as_os_str().is_empty() {
            std::fs::create_dir_all(d).map_err(|e| {
                BenchError(crate::t!("bench-cli-cannot-create", d = d.display(), e = e))
            })?;
        }
    }
    std::fs::write(p, text)
        .map_err(|e| BenchError(crate::t!("bench-cli-cannot-write", p = p.display(), e = e)))
}

fn pretty(v: &Value) -> String {
    let mut s = serde_json::to_string_pretty(v).unwrap_or_default();
    s.push('\n');
    s
}

fn secret(args: &[String]) -> Result<Option<Vec<u8>>, BenchError> {
    match flag(args, "--seed-file")? {
        None => Ok(None),
        Some(p) => {
            let mut b = std::fs::read(p)
                .map_err(|e| BenchError(crate::t!("bench-cli-cannot-read", p = p, e = e)))?;
            while matches!(b.last(), Some(b'\n' | b'\r')) {
                b.pop();
            }
            if b.is_empty() {
                return Err(BenchError(crate::terr!("e-bench-cli-is-empty", p = p)));
            }
            Ok(Some(b))
        }
    }
}

fn task_arg(args: &[String]) -> Result<&str, BenchError> {
    let t = need(args, "--task")?;
    if matches!(t, "a" | "b" | "c" | "d") {
        Ok(t)
    } else {
        Err(BenchError(crate::t!("bench-cli-unknown-task-or", t = t)))
    }
}

fn scale_arg(args: &[String]) -> Result<f64, BenchError> {
    match flag(args, "--scale")? {
        None => Ok(0.5),
        Some(s) => s
            .parse::<f64>()
            .map_err(|_| BenchError(crate::terr!("e-bench-cli-scale-is-not-number"))),
    }
}

fn clocks_text(args: &[String]) -> Result<String, BenchError> {
    read(
        flag(args, "--clocks")?
            .unwrap_or("tests/fixtures/clock_state_igs_holdout_oracle/clocks.txt"),
    )
}

fn slug(s: &str) -> String {
    s.chars()
        .map(|c| {
            if c.is_ascii_alphanumeric() {
                c.to_ascii_lowercase()
            } else {
                '-'
            }
        })
        .collect::<String>()
        .trim_matches('-')
        .to_string()
}

fn run_inner(args: &[String]) -> Result<i32, BenchError> {
    let Some(sub) = args.first().map(String::as_str) else {
        println!("{BENCH_USAGE}");
        return Ok(0);
    };
    let rest = &args[1..];
    match sub {
        "--help" | "-h" | "help" => {
            println!("{BENCH_USAGE}");
            Ok(0)
        }
        "spec" => {
            check(rest, &[], false)?;
            println!(
                "{}",
                serde_json::to_string_pretty(&json!({
                    "spec_version": SPEC_VERSION,
                    "document": "bench/SPEC.md",
                    "licence": "CC-BY-4.0 / CC0 proposed, owner decision pending",
                    "tasks": {
                        "a": "detection on receiver logs (JammerTest 2024)",
                        "b": "detection on IQ (synthetic recipe; TEXBAT reference only)",
                        "c": "timing holdover prediction (IGS clocks, 300 s)",
                        "d": "out-of-distribution optimism gap (synthetic corpus)",
                    },
                    "splits": ["dev", "test", "holdout"],
                }))
                .unwrap_or_default()
            );
            Ok(0)
        }
        "truth" => {
            check(rest, &["--task", "--data", "--split", "--out"], false)?;
            if task_arg(rest)? != "a" {
                return Err(BenchError(crate::terr!(
                    "e-bench-cli-truth-reads-dataset-and-is"
                )));
            }
            let split_s = need(rest, "--split")?;
            let (filter, label) = if split_s == "all" {
                (None, Split::Test)
            } else {
                let s = Split::parse(split_s)?;
                (Some(s), s)
            };
            let t = en(|| tasks::a_load(Path::new(need(rest, "--data")?), filter))?;
            let doc = en_ok(|| tasks::a_truth_json(&t, label));
            let mut doc = doc;
            if filter.is_none() {
                doc["split"] = json!("all");
            }
            write(Path::new(need(rest, "--out")?), &pretty(&doc))?;
            println!(
                "{}",
                crate::t!(
                    "bench-cli-scored-epochs-in-folder",
                    labels = t.labels.len(),
                    folders = t.folders.len()
                )
            );
            Ok(0)
        }
        "cases" => {
            check(
                rest,
                &[
                    "--task",
                    "--split",
                    "--out",
                    "--clocks",
                    "--scale",
                    "--seed-file",
                ],
                false,
            )?;
            let split = Split::parse(need(rest, "--split")?)?;
            let out = PathBuf::from(need(rest, "--out")?);
            let (cases, truth) = match task_arg(rest)? {
                "d" => {
                    let (scale, sec) = (scale_arg(rest)?, secret(rest)?);
                    en(|| tasks::d_files(split, scale, sec.as_deref()))?
                }
                "c" => {
                    if split == Split::Holdout && flag(rest, "--seed-file")?.is_some() {
                        return Err(BenchError(crate::terr!(
                            "e-bench-cli-task-has-no-sealed-holdout"
                        )));
                    }
                    let text = clocks_text(rest)?;
                    let c = en(|| tasks::c_load(&text, split))?;
                    en_ok(|| tasks::c_files(&c, split))
                }
                _ => {
                    return Err(BenchError(crate::terr!(
                        "e-bench-cli-cases-makes-the-files-of"
                    )))
                }
            };
            write(&out.join("cases.json"), &pretty(&cases))?;
            write(&out.join("truth.json"), &pretty(&truth))?;
            println!(
                "{}",
                crate::t!("bench-cli-wrote-cases-json-and-truth", out = out.display())
            );
            Ok(0)
        }
        "score" => {
            check(
                rest,
                &["--truth", "--predictions", "--threshold", "--out"],
                false,
            )?;
            let thr = match flag(rest, "--threshold")? {
                None => None,
                Some(s) => Some(s.parse::<f64>().map_err(|_| {
                    BenchError(crate::terr!("e-bench-cli-threshold-is-not-number"))
                })?),
            };
            let (truth, predictions) = (
                read(need(rest, "--truth")?)?,
                read(need(rest, "--predictions")?)?,
            );
            let r = en(|| super::score(&truth, &predictions, thr))?;
            match flag(rest, "--out")? {
                Some(p) => write(Path::new(p), &format!("{r}\n"))?,
                None => println!("{r}"),
            }
            Ok(0)
        }
        "baseline" => baseline(rest),
        "seal" => seal_cmd(rest),
        "reveal-check" => {
            check(rest, &["--task", "--seed-file", "--commitment"], false)?;
            let s = secret(rest)?
                .ok_or_else(|| BenchError(crate::terr!("e-bench-cli-seed-file-is-required")))?;
            let c = need(rest, "--commitment")?;
            if super::is_exposed(c) {
                println!(
                    "{}",
                    crate::t!("bench-cli-refused-this-commitment-is-provisional")
                );
                return Ok(1);
            }
            if reveal_check(task_arg(rest)?, &s, c) {
                println!("match");
                Ok(0)
            } else {
                println!("{}", crate::t!("bench-cli-mismatch-the-seed-is-not"));
                Ok(1)
            }
        }
        "manifest" => manifest(rest),
        "verify-manifest" => verify_manifest(rest),
        "validate" => {
            let files = check(rest, &[], true)?;
            if files.is_empty() {
                return Err(BenchError(crate::terr!(
                    "e-bench-cli-validate-needs-at-least-one"
                )));
            }
            let mut bad = 0;
            for f in &files {
                let v: Value = serde_json::from_str(&read(f)?)
                    .map_err(|e| BenchError(crate::t!("bench-cli-is-not-json", f = f, e = e)))?;
                let p = validate_result(&v);
                if p.is_empty() {
                    println!("{f}: valid");
                } else {
                    bad += 1;
                    for m in p {
                        println!("{f}: {m}");
                    }
                }
            }
            Ok(i32::from(bad > 0))
        }
        "leaderboard" => {
            let fragment = rest.iter().any(|a| a == "--fragment");
            let rest: Vec<String> = rest
                .iter()
                .filter(|a| *a != "--fragment")
                .cloned()
                .collect();
            let rest = &rest[..];
            let inputs = check(rest, &["--out"], true)?;
            let mut files: Vec<PathBuf> = Vec::new();
            for i in &inputs {
                let p = PathBuf::from(i);
                if p.is_dir() {
                    let mut v: Vec<PathBuf> = std::fs::read_dir(&p)
                        .map_err(|e| {
                            BenchError(crate::t!("bench-cli-cannot-read-2", i = i, e = e))
                        })?
                        .flatten()
                        .map(|e| e.path())
                        .filter(|x| x.to_string_lossy().ends_with(".result.json"))
                        .collect();
                    v.sort();
                    files.extend(v);
                } else {
                    files.push(p);
                }
            }
            let results: Vec<Value> = files
                .iter()
                .map(|f| {
                    serde_json::from_str(&read(&f.to_string_lossy())?).map_err(|e| {
                        BenchError(crate::t!("bench-cli-is-not-json", f = f.display(), e = e))
                    })
                })
                .collect::<Result<_, _>>()?;
            let html = if fragment {
                site::leaderboard_fragment(&results)?
            } else {
                site::leaderboard_html(&results)?
            };
            write(Path::new(need(rest, "--out")?), &html)?;
            println!(
                "{}",
                crate::t!("bench-cli-result-rendered", results = results.len())
            );
            Ok(0)
        }
        other => Err(BenchError(crate::t!(
            "bench-cli-unknown-subcommand",
            other = other,
            BENCH_USAGE = BENCH_USAGE
        ))),
    }
}

/// One baseline: write its predictions and its scored result.
fn emit(out: &Path, stem: &str, truth_text: &str, preds: &Value) -> Result<(), BenchError> {
    let ptext = pretty(preds);
    write(
        &out.join(crate::i18n::in_english(|| {
            crate::t!("bench-cli-predictions-json", stem = stem)
        })),
        &ptext,
    )?;
    let r = en(|| super::score(truth_text, &ptext, None))?;
    write(
        &out.join(crate::i18n::in_english(|| {
            crate::t!("bench-cli-result-json", stem = stem)
        })),
        &format!("{r}\n"),
    )?;
    println!("{stem}");
    Ok(())
}

/// `seal`: print the commitment of an existing seed file, or with `--new` create the seed file
/// (refusing to overwrite one, readable by its owner only) and print only the commitment.
fn seal_cmd(rest: &[String]) -> Result<i32, BenchError> {
    use std::io::Write;
    let valued = ["--task", "--seed-file"];
    let mut v: Vec<String> = rest.to_vec();
    let new = v.iter().any(|a| a == "--new");
    v.retain(|a| a != "--new");
    check(&v, &valued, false)?;
    let task = task_arg(&v)?;
    if !new {
        let s = secret(&v)?
            .ok_or_else(|| BenchError(crate::terr!("e-bench-cli-seed-file-is-required")))?;
        println!("{}", seal(task, &s));
        return Ok(0);
    }
    let path = Path::new(need(&v, "--seed-file")?);
    let s = super::new_secret();
    let mut opts = std::fs::OpenOptions::new();
    opts.write(true).create_new(true);
    #[cfg(unix)]
    {
        use std::os::unix::fs::OpenOptionsExt;
        opts.mode(0o600);
    }
    let mut f = opts.open(path).map_err(|e| {
        BenchError(crate::t!(
            "bench-cli-cannot-create-an-existing-seed",
            path = path.display(),
            e = e
        ))
    })?;
    f.write_all(format!("{s}\n").as_bytes()).map_err(|e| {
        BenchError(crate::t!(
            "bench-cli-cannot-write-2",
            path = path.display(),
            e = e
        ))
    })?;
    eprintln!(
        "{}",
        crate::t!("bench-cli-seed-written-to-keep-it", path = path.display())
    );
    println!("{}", seal(task, s.as_bytes()));
    Ok(0)
}

fn baseline(args: &[String]) -> Result<i32, BenchError> {
    check(
        args,
        &[
            "--task",
            "--split",
            "--out",
            "--data",
            "--clocks",
            "--scale",
            "--seed-file",
        ],
        false,
    )?;
    let task = task_arg(args)?;
    let out = PathBuf::from(need(args, "--out")?);
    if task == "b" {
        let r = en_ok(carried_b);
        write(
            &out.join("b-test-kshana-iq-cn0-drop.result.json"),
            &pretty(&r),
        )?;
        println!("{}", crate::t!("bench-cli-test-kshana-iq-cn0-drop"));
        return Ok(0);
    }
    let split = Split::parse(need(args, "--split")?)?;
    match task {
        "a" => {
            let t = en(|| tasks::a_load(Path::new(need(args, "--data")?), Some(split)))?;
            let truth_text = en_ok(|| pretty(&tasks::a_truth_json(&t, split)));
            write(
                &out.join(crate::i18n::in_english(|| {
                    crate::t!("bench-cli-truth-json", split = split.name())
                })),
                &truth_text,
            )?;
            for (stat, doc) in en_ok(|| tasks::a_baselines(&t, split.name())) {
                let stem = format!("a-{}-{}", split.name(), slug(stat.config_field()));
                emit(&out, &stem, &truth_text, &doc)?;
            }
        }
        "c" => {
            let text = clocks_text(args)?;
            let cases = en(|| tasks::c_load(&text, split))?;
            let (_, truth) = en_ok(|| tasks::c_files(&cases, split));
            let truth_text = pretty(&truth);
            write(
                &out.join(crate::i18n::in_english(|| {
                    crate::t!("bench-cli-truth-json-2", split = split.name())
                })),
                &truth_text,
            )?;
            for b in C_BASELINES {
                let doc = en_ok(|| tasks::c_baseline_doc(b, &cases, split.name()));
                emit(&out, &format!("c-{}-{b}", split.name()), &truth_text, &doc)?;
            }
        }
        _ => {
            let scale = scale_arg(args)?;
            let sec = secret(args)?;
            let (_, truth) = en(|| tasks::d_files(split, scale, sec.as_deref()))?;
            let truth_text = pretty(&truth);
            write(
                &out.join(crate::i18n::in_english(|| {
                    crate::t!("bench-cli-truth-json-3", split = split.name())
                })),
                &truth_text,
            )?;
            let seed = en(|| tasks::d_seed(split, sec.as_deref()))?;
            let (cin, cout) = en_ok(|| tasks::d_corpora(seed, scale, split));
            for det in tasks::d_detectors() {
                let doc = en_ok(|| {
                    let scores = tasks::d_baseline_scores(det.as_ref(), &cin, &cout);
                    tasks::scores_doc(
                        "d",
                        split.name(),
                        &crate::t!("bench-cli-impairment-eval-baseline", det = det.name()),
                        &scores,
                    )
                });
                emit(
                    &out,
                    &format!("d-{}-{}", split.name(), slug(det.name())),
                    &truth_text,
                    &doc,
                )?;
            }
        }
    }
    Ok(0)
}

/// The task (b) baseline, carried from `docs/design/DETECTION-ROC.md` section 3.
fn carried_b() -> Value {
    super::result_json(
        "b",
        "test",
        &super::System {
            name: "kshana iq monitors: cn0_drop (CUSUM)".into(),
            version: SPEC_VERSION.into(),
            url: None,
        },
        "carried",
        Some("docs/design/DETECTION-ROC.md section 3: the R1 campaign of tests/iq_campaign_roc.rs, run 2026-10-13; not re-run for bench v1. Bar R1 (AUC >= 0.95) was NOT MET."),
        &"0".repeat(64),
        &"0".repeat(64),
        json!({
            "n_positive": 18,
            "n_negative": 36,
            "auc": 0.7855,
            "declared_threshold_note": "CUSUM threshold h = 5",
            "pd_at_declared": 1.0,
            "pfa_at_declared": 0.5,
            "bar_R1": "NOT MET (AUC 0.7855 against 0.95)",
        }),
        "MODELLED: truth is the stated 6 dB attenuation events of Kshana's own GPS L1 C/A scenes; no interference waveform is involved",
    )
}

fn manifest(args: &[String]) -> Result<i32, BenchError> {
    check(args, &["--task", "--data", "--archive", "--out"], false)?;
    if task_arg(args)? != "a" {
        return Err(BenchError(crate::terr!(
            "e-bench-cli-manifest-is-for-task-the"
        )));
    }
    let root = PathBuf::from(need(args, "--data")?);
    let mut dirs = Vec::new();
    crate::receiver_trust::calibration::find_scenarios(&root, &mut dirs);
    if dirs.is_empty() {
        return Err(BenchError(crate::t!(
            "bench-cli-no-scenario-json-under",
            root = root.display()
        )));
    }
    let (archive_sha, archive_bytes) = match flag(args, "--archive")? {
        Some(p) => {
            let b = std::fs::read(p)
                .map_err(|e| BenchError(crate::t!("bench-cli-cannot-read", p = p, e = e)))?;
            (sha256_hex(&b), b.len() as u64)
        }
        None => (
            // PIN-SCOPE:    the SHA-256 and byte length of GNSS_DATASET_JAMMING_SPOOFING.tar.gz (Zenodo
            //               record 15911589) that the JammerTest 2024 manifests are defined on, used as
            //               the default when no archive path is given.
            // PIN-EXCLUDES: any other archive, and the extracted files (their own hashes are in the manifest).
            "73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313".to_string(),
            375_338_522,
        ),
    };
    let read: Vec<_> = dirs
        .iter()
        .map(|d| {
            (
                d,
                en_ok(|| crate::receiver_trust::calibration::read_folder(&root, d)),
            )
        })
        .collect();
    let assignment = super::assign_splits(
        &read
            .iter()
            .filter(|(_, f)| f.excluded.is_none())
            .map(|(_, f)| (f.path.clone(), f.jamming && f.epochs.jamming > 0))
            .collect::<Vec<_>>(),
    );
    let mut folders = Vec::new();
    let mut holdout = Vec::new();
    for (d, f) in &read {
        let mut files = Vec::new();
        for name in ["scenario.json", "mon_rf.csv", "rinex.csv"] {
            if let Ok(b) = std::fs::read(d.join(name)) {
                files.push(json!({"name": name, "bytes": b.len(), "sha256": sha256_hex(&b)}));
            }
        }
        let sp = assignment.get(&f.path).map(|s| s.name());
        if sp == Some("holdout") {
            holdout.push(f.path.clone());
        }
        folders.push(json!({
            "path": f.path,
            "split": sp,
            "evaluable": f.excluded.is_none(),
            "excluded_reason": f.excluded,
            "attack_type": f.attack_type,
            "files": files,
        }));
    }
    holdout.sort();
    let doc = json!({
        "schema": MANIFEST_SCHEMA,
        "spec_version": SPEC_VERSION,
        "task": "a",
        "licence": "CC0 proposed, owner decision pending (facts about the data; the data itself is GPL-3.0-or-later)",
        "source": {
            "name": "GNSS Dataset Under Jamming, Spoofing, and Meaconing Conditions (JammerTest 2024)",
            "record": "https://zenodo.org/records/15911589",
            "doi": "10.5281/zenodo.15911589",
            "data_licence": "GPL-3.0-or-later",
            "cite": "V. Renaudin, M. I. Sayyaf, F. L. Bourhis, M. Ortiz, GNSS Positioning Under Threat, IEEE JISPIN, doi 10.1109/JISPIN.2025.3629705",
        },
        "archive": {"file": "GNSS_DATASET_JAMMING_SPOOFING.tar.gz", "bytes": archive_bytes, "sha256": archive_sha},
        "fetch": "scripts/fetch_jammertest2024.sh",
        "split_rule": "2.0.0: evaluable folders in two strata (jamming folders, other folders), each ordered by the hex SHA-256 of the folder path; per stratum the first max(1, round(n/4)) are holdout, the next max(1, round(n/4)) test, the rest dev (xval/bench/PREREGISTRATION-v2.md)",
        "holdout_folders_sha256": sha256_hex(holdout.join("\n").as_bytes()),
        "holdout_is_secret": false,
        "folders": folders,
    });
    write(Path::new(need(args, "--out")?), &pretty(&doc))?;
    println!("{} folder(s)", dirs.len());
    Ok(0)
}

fn verify_manifest(args: &[String]) -> Result<i32, BenchError> {
    let pos = check(args, &["--root"], true)?;
    let [path] = pos.as_slice() else {
        return Err(BenchError(crate::terr!(
            "e-bench-cli-verify-manifest-needs-one-manifest"
        )));
    };
    let root = PathBuf::from(need(args, "--root")?);
    let m: Value = serde_json::from_str(&read(path)?)
        .map_err(|e| BenchError(crate::t!("bench-cli-is-not-json-2", path = path, e = e)))?;
    let mut entries: Vec<(String, Option<String>)> = Vec::new();
    if let Some(a) = m.get("archive") {
        if let Some(f) = a["file"].as_str() {
            entries.push((f.to_string(), a["sha256"].as_str().map(String::from)));
        }
    }
    if let Some(fs) = m.get("folders").and_then(Value::as_array) {
        for d in fs {
            let dp = d["path"].as_str().unwrap_or("");
            for f in d["files"].as_array().into_iter().flatten() {
                entries.push((
                    format!("{dp}/{}", f["name"].as_str().unwrap_or("")),
                    f["sha256"].as_str().map(String::from),
                ));
            }
        }
    }
    for f in m
        .get("files")
        .and_then(Value::as_array)
        .into_iter()
        .flatten()
    {
        entries.push((
            f["path"].as_str().unwrap_or("").to_string(),
            f["sha256"].as_str().map(String::from),
        ));
    }
    let (mut ok, mut bad, mut missing, mut unpinned) = (0, 0, 0, 0);
    for (rel, want) in &entries {
        let Some(want) = want else {
            unpinned += 1;
            println!("unpinned: {rel}");
            continue;
        };
        match std::fs::read(root.join(rel)) {
            Err(_) => {
                missing += 1;
                println!("missing: {rel}");
            }
            Ok(b) if &sha256_hex(&b) == want => ok += 1,
            Ok(_) => {
                bad += 1;
                println!("MISMATCH: {rel}");
            }
        }
    }
    println!(
        "{}",
        crate::t!(
            "bench-cli-ok-mismatched-missing-unpinned",
            ok = ok,
            bad = bad,
            missing = missing,
            unpinned = unpinned
        )
    );
    Ok(i32::from(bad > 0 || missing > 0))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn s(v: &[&str]) -> Vec<String> {
        v.iter().map(|x| x.to_string()).collect()
    }

    #[test]
    fn unknown_options_and_subcommands_are_refused() {
        assert_eq!(run(&s(&["nope"])), 2);
        assert_eq!(run(&s(&["spec", "--bogus"])), 2);
        assert_eq!(run(&s(&["score", "--truth"])), 2);
        assert_eq!(run(&s(&[])), 0);
    }

    #[test]
    fn slug_is_filename_safe() {
        assert_eq!(slug("energy(cn0-drop)"), "energy-cn0-drop");
    }

    #[test]
    fn the_carried_b_result_is_valid_and_says_it_was_not_re_run() {
        let v = carried_b();
        assert!(validate_result(&v).is_empty(), "{:?}", validate_result(&v));
        assert_eq!(v["provenance"], "carried");
        assert!(v["provenance_note"]
            .as_str()
            .unwrap()
            .contains("not re-run"));
        assert!(v["metrics"]["bar_R1"].as_str().unwrap().contains("NOT MET"));
    }
}
