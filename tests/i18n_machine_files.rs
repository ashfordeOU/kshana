// SPDX-License-Identifier: AGPL-3.0-only
//! Machine files do not depend on the language. Each case runs subcommands of the compiled binary
//! three times in fresh scratch folders, in English, in German (`--lang de`) and in the
//! pseudo-locale (`--lang en-XA`, which accents, brackets and pads every message), and asserts
//! that every file the run wrote (JSON, CSV, TOML, NDJSON, NMEA, SigMF, Markdown) and every
//! `--json` document printed to standard output is byte-identical, while the human text on the
//! terminal differs for the pseudo-locale where a step prints messages.
//!
//! Files meant for a person (an SVG chart, an HTML page) are left out of the comparison by name.
//! See docs/i18n.md, "What is localised and what never is".

use std::collections::BTreeMap;
use std::path::{Path, PathBuf};
use std::process::Command;

const LANGS: [&str; 3] = ["en", "de", "en-XA"];

/// A scratch folder removed when the test ends.
struct Scratch(PathBuf);

impl Drop for Scratch {
    fn drop(&mut self) {
        let _ = std::fs::remove_dir_all(&self.0);
    }
}

fn scratch(name: &str) -> Scratch {
    static NEXT: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = NEXT.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let d = std::env::temp_dir().join(format!(
        "kshana-i18n-mf-{}-{}-{name}",
        std::process::id(),
        seq
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    Scratch(d)
}

fn repo(rel: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join(rel)
}

/// One command line, and what the test expects of it.
struct Step {
    args: Vec<String>,
    /// Standard output is a document read by programs: it must be identical in every language.
    json_stdout: bool,
    /// The step prints messages: in the pseudo-locale its terminal text must differ from English.
    human: bool,
    /// Lines of standard output that start with one of these are left out of the comparison
    /// (a wall-clock reading, which differs from run to run in any language).
    volatile: &'static [&'static str],
    /// ISO times `YYYY-MM-DDTHH:MM:SSZ` in standard output are left out of the comparison.
    mask_times: bool,
}

fn step(args: &[&str]) -> Step {
    Step {
        args: args.iter().map(|s| s.to_string()).collect(),
        json_stdout: false,
        human: true,
        volatile: &[],
        mask_times: false,
    }
}

/// A step whose standard output is a machine document and which prints no message of its own.
fn doc(args: &[&str]) -> Step {
    Step {
        json_stdout: true,
        human: false,
        ..step(args)
    }
}

fn mask_iso_times(text: &str) -> String {
    let b = text.as_bytes();
    let mut out = String::new();
    let mut i = 0;
    while i < b.len() {
        let t = b.get(i..i + 20);
        let is_time = t.is_some_and(|t| {
            t.iter().enumerate().all(|(k, c)| match k {
                4 | 7 => *c == b'-',
                10 => *c == b'T',
                13 | 16 => *c == b':',
                19 => *c == b'Z',
                _ => c.is_ascii_digit(),
            })
        });
        if is_time {
            out.push_str("<time>");
            i += 20;
        } else {
            let ch = text[i..].chars().next().unwrap();
            out.push(ch);
            i += ch.len_utf8();
        }
    }
    out
}

fn without_volatile(text: &str, volatile: &[&str]) -> String {
    text.lines()
        .filter(|l| !volatile.iter().any(|v| l.starts_with(v)))
        .collect::<Vec<_>>()
        .join("\n")
}

fn shown(text: &str, s: &Step) -> String {
    let t = without_volatile(text, s.volatile);
    if s.mask_times {
        mask_iso_times(&t)
    } else {
        t
    }
}

/// Everything one run left behind.
struct Outcome {
    /// (exit code, stdout, stderr) of each step.
    steps: Vec<(i32, String, String)>,
    /// Every file below the folder, by relative path.
    files: BTreeMap<String, Vec<u8>>,
}

fn collect(root: &Path, dir: &Path, skip: &[&str], out: &mut BTreeMap<String, Vec<u8>>) {
    let mut entries: Vec<_> = std::fs::read_dir(dir).unwrap().flatten().collect();
    entries.sort_by_key(|e| e.path());
    for e in entries {
        let p = e.path();
        if p.is_dir() {
            collect(root, &p, skip, out);
        } else {
            let rel = p.strip_prefix(root).unwrap().to_string_lossy().into_owned();
            if skip.iter().any(|s| rel.ends_with(s)) {
                continue;
            }
            out.insert(rel, std::fs::read(&p).unwrap());
        }
    }
}

fn run_in(
    lang: &str,
    root: &Path,
    setup: &dyn Fn(&Path),
    steps: &[Step],
    skip: &[&str],
) -> Outcome {
    let dir = root.join(lang);
    std::fs::create_dir_all(&dir).unwrap();
    setup(&dir);
    let mut results = Vec::new();
    for s in steps {
        let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
            .current_dir(&dir)
            .env_remove("KSHANA_LANG")
            .env_remove("LANG")
            .env_remove("LANGUAGE")
            .env_remove("LC_ALL")
            .env_remove("LC_MESSAGES")
            .arg("--lang")
            .arg(lang)
            .args(&s.args)
            .output()
            .expect("run kshana");
        results.push((
            o.status.code().unwrap_or(-1),
            String::from_utf8_lossy(&o.stdout).into_owned(),
            String::from_utf8_lossy(&o.stderr).into_owned(),
        ));
    }
    let mut files = BTreeMap::new();
    collect(&dir, &dir, skip, &mut files);
    Outcome {
        steps: results,
        files,
    }
}

/// Run `steps` in each language and compare.
fn assert_language_independent(name: &str, setup: &dyn Fn(&Path), steps: &[Step], skip: &[&str]) {
    let tmp = scratch(name);
    let runs: Vec<Outcome> = LANGS
        .iter()
        .map(|l| run_in(l, &tmp.0, setup, steps, skip))
        .collect();
    let english = &runs[0];
    // The English run must have worked, or nothing below proves anything.
    for (i, (code, _, err)) in english.steps.iter().enumerate() {
        assert!(
            *code == 0,
            "{name}: step {i} {:?} failed in English ({code}): {err}",
            steps[i].args
        );
    }
    assert!(
        !english.files.is_empty() || steps.iter().all(|s| s.json_stdout),
        "{name}: no file"
    );
    for (lang, run) in LANGS.iter().zip(&runs).skip(1) {
        for (i, s) in steps.iter().enumerate() {
            assert_eq!(
                run.steps[i].0, english.steps[i].0,
                "{name}: step {i} {:?}: exit code differs in {lang}",
                s.args
            );
            if s.json_stdout {
                assert_eq!(
                    shown(&run.steps[i].1, s),
                    shown(&english.steps[i].1, s),
                    "{name}: step {i} {:?}: the document on standard output differs in {lang}",
                    s.args
                );
            }
        }
        let names: Vec<_> = english.files.keys().collect();
        let got: Vec<_> = run.files.keys().collect();
        assert_eq!(got, names, "{name}: the files written differ in {lang}");
        for (file, bytes) in &english.files {
            assert!(
                run.files[file] == *bytes,
                "{name}: {file} differs in {lang}:\n--- en\n{}\n--- {lang}\n{}",
                first_difference(bytes, &run.files[file]),
                first_difference(&run.files[file], bytes)
            );
        }
    }
    // Where a step prints messages, the pseudo-locale changes them (so the comparison above is
    // not trivially true because the language never took effect).
    let xa = &runs[2];
    for (i, s) in steps.iter().enumerate() {
        if s.human {
            let (e, x) = (&english.steps[i], &xa.steps[i]);
            assert!(
                (e.1.as_str(), e.2.as_str()) != (x.1.as_str(), x.2.as_str()),
                "{name}: step {i} {:?}: terminal text is the same in en-XA: {} {}",
                s.args,
                e.1,
                e.2
            );
        }
    }
}

/// A short excerpt of `a` around the first byte that `b` does not share.
fn first_difference(a: &[u8], b: &[u8]) -> String {
    let at = a
        .iter()
        .zip(b)
        .position(|(x, y)| x != y)
        .unwrap_or(a.len().min(b.len()));
    let from = at.saturating_sub(60);
    let to = (at + 120).min(a.len());
    String::from_utf8_lossy(&a[from..to]).into_owned()
}

fn nothing(_: &Path) {}

fn copy(rel: &str, to: &Path, name: &str) {
    std::fs::copy(repo(rel), to.join(name)).unwrap();
}

// ---------------------------------------------------------------------------------------------
// kshana iq

#[test]
fn iq_scene_acquire_track_monitor_write_the_same_files() {
    assert_language_independent(
        "iq",
        &nothing,
        &[
            step(&[
                "iq",
                "scene",
                "s.cf32",
                "--rate",
                "2046000",
                "--duration",
                "0.3",
                "--signal",
                "gps-l1ca",
                "--prn",
                "3,9",
                "--doppler",
                "1000,-1500",
                "--cn0",
                "48",
                "--no-noise",
                "--seed",
                "5",
            ]),
            // SigMF: the channel description goes into the annotations of the metadata file.
            step(&[
                "iq",
                "scene",
                "n",
                "--format",
                "sigmf",
                "--rate",
                "2046000",
                "--duration",
                "0.05",
                "--signal",
                "gps-l1ca",
                "--prn",
                "9",
                "--cn0",
                "45",
                "--iono-stec",
                "12",
                "--seed",
                "2",
            ]),
            // ION SDR metadata: the scale note goes into the metadata file.
            step(&[
                "iq",
                "scene",
                "m",
                "--format",
                "sdrx",
                "--rate",
                "2046000",
                "--duration",
                "0.05",
                "--signal",
                "gps-l1ca",
                "--prn",
                "9",
                "--cn0",
                "45",
                "--seed",
                "2",
            ]),
            step(&[
                "iq", "acquire", "s.cf32", "--signal", "gps-l1ca", "--prn", "3,9", "--json",
                "acq.json", "--csv", "acq.csv",
            ]),
            // 2.046 MHz is 2 samples per chip: the commensurate-sampling warning, with its
            // message, goes into the JSON documents and is printed in the language.
            step(&[
                "iq",
                "track",
                "s.cf32",
                "--signal",
                "gps-l1ca",
                "--prn",
                "9",
                "--json",
                "track.json",
                "--summary",
                "track.summary.json",
                "--csv",
                "track.csv",
                "--events",
                "track.events.jsonl",
            ]),
            doc(&["iq", "info", "s.cf32"]),
            Step {
                human: false,
                ..step(&[
                    "iq", "monitor", "s.cf32", "--power", "--signal", "gps-l1ca", "--prn", "9",
                    "--json", "mon.json", "--csv", "mon",
                ])
            },
        ],
        &[],
    );
}

// ---------------------------------------------------------------------------------------------
// kshana receiver-trust, compliance-report, trust-telemetry, evidence

fn trust_setup(dir: &Path) {
    copy("examples/receiver-trust/session.toml", dir, "session.toml");
    copy(
        "examples/receiver-trust/illustrative-jamming.nmea",
        dir,
        "illustrative-jamming.nmea",
    );
    std::fs::write(dir.join("signer.key"), "07".repeat(32) + "\n").unwrap();
}

#[test]
fn receiver_trust_and_its_consumers_write_the_same_files() {
    assert_language_independent(
        "trust",
        &trust_setup,
        &[
            step(&["receiver-trust", "session.toml"]),
            step(&[
                "compliance-report",
                "--out",
                "compliance",
                "session.result.json",
            ]),
            Step {
                volatile: &["kshana_trust_last_sample_timestamp_seconds"],
                ..doc(&[
                    "trust-telemetry",
                    "--result",
                    "session.result.json",
                    "--print-metrics",
                ])
            },
            // Syslog lines carry the wall-clock time, which differs from run to run.
            Step {
                mask_times: true,
                ..doc(&[
                    "trust-telemetry",
                    "--result",
                    "session.result.json",
                    "--print-syslog",
                    "--syslog-all",
                ])
            },
            doc(&[
                "trust-telemetry",
                "--result",
                "session.result.json",
                "--print-mqtt",
            ]),
            step(&[
                "receiver-trust",
                "evidence",
                "session.toml",
                "--from",
                "100",
                "--to",
                "260",
                "--key",
                "signer.key",
                "--out",
                "pack",
                "--title",
                "Example",
                "--created-utc",
                "none",
            ]),
        ],
        // The chart is for a person (its text is in the language).
        &[".svg"],
    );
}

#[test]
fn jammertest_import_and_score_write_the_same_files() {
    fn nmea(secs: u32) -> String {
        fn cs(body: &str) -> u8 {
            body.bytes().fold(0, |a, b| a ^ b)
        }
        fn s(body: &str) -> String {
            format!("${body}*{:02X}\r\n", cs(body))
        }
        let mut o = String::new();
        for t in 0..secs {
            let (h, m, sec) = (12 + t / 3600, t / 60 % 60, t % 60);
            let tod = format!("{h:02}{m:02}{sec:02}.00");
            o += &s(&format!(
                "GPRMC,{tod},A,6900.0000,N,01600.0000,E,0.0,0.0,150925,,,A"
            ));
            o += &s(&format!(
                "GPGGA,{tod},6900.0000,N,01600.0000,E,1,08,1.0,10.0,M,0.0,M,,"
            ));
            let hit = (300..=360).contains(&t);
            for set in 0..2 {
                let mut body = format!("GPGSV,2,{},08", set + 1);
                for k in 0..4 {
                    let sv = set * 4 + k + 1;
                    let snr = 45.0 - f64::from(sv % 3) - if hit { 20.0 } else { 0.0 };
                    body += &format!(",{sv:02},{:02},{:03},{:02.0}", 30 + sv * 5, sv * 40, snr);
                }
                o += &s(&body);
            }
        }
        o
    }
    let setup = |dir: &Path| {
        std::fs::write(dir.join("log.nmea"), nmea(700)).unwrap();
        std::fs::write(
            dir.join("session.toml"),
            "[log]\nformat = \"nmea\"\npath = \"log.nmea\"\n",
        )
        .unwrap();
        std::fs::write(
            dir.join("catalog.json"),
            r#"{"test_types":[{"type":"Jamming","type_id":1,"test_groups":[
  {"group_id":2,"group_name":"CW","tests":[{"test_id":5,"name":"CW jammer"}]}]}]}"#,
        )
        .unwrap();
        std::fs::write(
            dir.join("plan.json"),
            r#"{"locations":[{"location_id":1,"location_name":"Test Area 1","tests":[
  {"start_time":"2025-09-15T12:05:00","end_time":"2025-09-15T12:06:00","test_id":"1.2.5","power_w":0,"status":""},
  {"start_time":"2025-09-15T12:08:20","end_time":"2025-09-15T12:09:20","test_id":"1.2.5","power_w":0,"status":""}]}]}"#,
        )
        .unwrap();
        std::fs::write(dir.join("signer.key"), "05".repeat(32) + "\n").unwrap();
    };
    let common = [
        "--catalog",
        "catalog.json",
        "--plan",
        "plan.json",
        "--location",
        "1",
        "--local-offset-h",
        "0",
    ];
    let mut score_json = vec!["jammertest", "score", "session.toml"];
    score_json.extend(common);
    score_json.push("--json");
    let mut score_text = vec!["jammertest", "score", "session.toml"];
    score_text.extend(common);
    let mut score_pack = score_text.clone();
    score_pack.extend([
        "--key",
        "signer.key",
        "--out",
        "pack",
        "--created-utc",
        "none",
    ]);
    let mut import = vec![
        "jammertest",
        "import",
        "--log-start",
        "2025-09-15T12:00:00Z",
        "--out",
        "events.toml",
    ];
    import.extend(common);
    assert_language_independent(
        "jammertest",
        &setup,
        &[
            doc(&score_json),
            step(&score_text),
            step(&score_pack),
            step(&import),
        ],
        &[],
    );
}

// ---------------------------------------------------------------------------------------------
// kshana standards-pack, bench, kinds, sky, skyline, lunanet-afs-check

#[test]
fn standards_pack_writes_the_same_documents() {
    assert_language_independent(
        "standards",
        &nothing,
        &[
            doc(&["standards-pack", "list"]),
            Step {
                human: false,
                ..step(&["standards-pack", "run", "imo-circ-1575", "--out", "imo"])
            },
        ],
        &[],
    );
}

#[test]
fn bench_writes_the_same_documents() {
    assert_language_independent(
        "bench",
        &nothing,
        &[
            doc(&["bench", "spec"]),
            step(&[
                "bench", "cases", "--task", "d", "--split", "dev", "--scale", "0.05", "--out",
                "cases",
            ]),
            Step {
                human: false,
                ..step(&[
                    "bench", "baseline", "--task", "d", "--split", "dev", "--scale", "0.05",
                    "--out", "baseline",
                ])
            },
            Step {
                human: false,
                ..step(&[
                    "bench",
                    "score",
                    "--truth",
                    "baseline/d-dev.truth.json",
                    "--predictions",
                    "baseline/d-dev-energy-cn0-drop.predictions.json",
                    "--out",
                    "scored.json",
                ])
            },
            step(&[
                "bench", "baseline", "--task", "b", "--split", "test", "--out", "b",
            ]),
        ],
        // The page is for a person.
        &[".html"],
    );
}

#[test]
fn kinds_sky_skyline_and_the_afs_check_print_the_same_documents() {
    assert_language_independent(
        "documents",
        &nothing,
        &[
            doc(&["kinds", "--json"]),
            doc(&[
                "sky",
                "--site",
                "59.4,24.7",
                "--systems",
                "gps-baseline,galileo",
                "--json",
            ]),
            doc(&[
                "sky",
                "--site",
                "59.4,24.7",
                "--systems",
                "gps-baseline",
                "--skyline-preset",
                "fjord",
                "--monte-carlo",
                "20",
                "--seed",
                "3",
            ]),
            doc(&["skyline", "--preset", "fjord", "--json"]),
            doc(&["skyline", "--presets"]),
            doc(&["lunanet-afs-check", "spec", "--json"]),
        ],
        &[],
    );
}

// ---------------------------------------------------------------------------------------------
// kshana imu-fit, nmea-scenario, bench-export, interference-map, osnma

#[test]
fn imu_fit_prints_and_writes_the_same_documents() {
    let setup = |dir: &Path| {
        let mut x: u64 = 0x2545_F491_4F6C_DD1D;
        let mut next = || {
            x ^= x << 13;
            x ^= x >> 7;
            x ^= x << 17;
            (x as f64 / u64::MAX as f64) - 0.5
        };
        let mut s = String::from("t_s,gx,gy,gz,ax,ay,az\n");
        for i in 0..3000 {
            s.push_str(&format!(
                "{:.2},0,0,{:e},{:e},0,9.80665\n",
                i as f64 * 0.01,
                1e-3 * next(),
                1e-2 * next()
            ));
        }
        std::fs::write(dir.join("imu.csv"), s).unwrap();
    };
    assert_language_independent(
        "imu-fit",
        &setup,
        &[
            doc(&["imu-fit", "imu.csv", "--json"]),
            // The table goes to standard output (a file when redirected), notes to standard error.
            Step {
                json_stdout: true,
                human: false,
                ..step(&["imu-fit", "imu.csv", "--id", "bench-imu"])
            },
        ],
        &[],
    );
}

#[test]
fn nmea_scenario_writes_the_same_files() {
    let setup = |dir: &Path| {
        copy(
            "scenarios/training/open-sea-jamming.toml",
            dir,
            "open-sea-jamming.toml",
        );
    };
    assert_language_independent(
        "nmea-scenario",
        &setup,
        &[step(&[
            "nmea-scenario",
            "open-sea-jamming.toml",
            "--out",
            "stream.nmea",
            "--seed",
            "4",
        ])],
        &[],
    );
}

#[test]
fn interference_map_and_route_exposure_write_the_same_files() {
    let setup = |dir: &Path| {
        copy("examples/interference-map/input/adsb.csv", dir, "adsb.csv");
        copy(
            "examples/interference-map/input/route-adsb.geojson",
            dir,
            "route.geojson",
        );
    };
    assert_language_independent(
        "interference-map",
        &setup,
        &[
            step(&[
                "interference-map",
                "adsb",
                "adsb.csv",
                "--dataset",
                "adsb-lol",
                "--out",
                "maps",
            ]),
            doc(&[
                "route-exposure",
                "--route",
                "route.geojson",
                "--map",
                "maps",
                "--json",
                "--out",
                "exposure.json",
            ]),
        ],
        &[],
    );
}

#[test]
fn osnma_verify_prints_the_same_report() {
    let setup = |dir: &Path| {
        let page = "00".repeat(30);
        std::fs::write(
            dir.join("vectors.csv"),
            format!("SVID,NumNavBits,NavBitsHEX\n02,480,{page}{page}\n03,240,{page}\n"),
        )
        .unwrap();
    };
    assert_language_independent(
        "osnma",
        &setup,
        &[Step {
            // Exit status 3 would mean a failed check; the report is the point.
            ..doc(&[
                "osnma",
                "verify",
                "vectors.csv",
                "--format",
                "vector-csv",
                "--start-gst",
                "1000",
                "--json",
            ])
        }],
        &[],
    );
}

#[test]
fn bench_export_writes_the_same_files() {
    let setup = |dir: &Path| {
        copy("scenarios/gnss-ins.toml", dir, "s.toml");
    };
    assert_language_independent(
        "bench-export",
        &setup,
        &[Step {
            human: false,
            ..step(&[
                "bench-export",
                "s.toml",
                "--out",
                "bench",
                "--epoch",
                "2025-03-01T10:00:00Z",
            ])
        }],
        &[],
    );
}

#[test]
fn a_scenario_run_with_exports_writes_the_same_files() {
    let setup = |dir: &Path| {
        copy("scenarios/gnss-ins.toml", dir, "g.toml");
    };
    assert_language_independent(
        "scenario-export",
        &setup,
        &[step(&[
            "g.toml", "--export", "czml", "--export", "geojson", "--export", "kml",
        ])],
        // The chart and the page are for a person; their text is in the language.
        &[".svg", ".html"],
    );
}
