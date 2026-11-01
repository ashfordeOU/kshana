// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana partner check`: the format and metadata check of a data-partner submission.
//!
//! PIN-SCOPE:    the synthetic example passes; each class of fault (schema, hash, unreadable data, missing
//!               metadata, a target that is not a MODELLED row, personal data, false statements) is reported
//!               as an error and a clean file is not; the rows `docs/PARTNER-DATA.md` lists are real MODELLED
//!               rows; the command's exit status
//! PIN-EXCLUDES: whether any data would pass a pre-registered bar (the check never scores), and any real
//!               measurement: the example record is made up (examples/partner-submission/NOTICE.md)

use kshana::evidence::bundle::sha256_hex;
use kshana::partner::{check_file, modelled_requirements, Report};
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn example_dir() -> PathBuf {
    root().join("examples/partner-submission")
}

/// A scratch copy of the example, with `edit` applied to the submission text.
fn scratch(edit: impl Fn(&str) -> String) -> PathBuf {
    static SEQ: AtomicUsize = AtomicUsize::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-partner-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    std::fs::copy(
        example_dir().join("clock-phase-synthetic.txt"),
        dir.join("clock-phase-synthetic.txt"),
    )
    .unwrap();
    let text = std::fs::read_to_string(example_dir().join("submission.toml")).unwrap();
    std::fs::write(dir.join("submission.toml"), edit(&text)).unwrap();
    dir.join("submission.toml")
}

fn report(path: &Path) -> Report {
    check_file(path).expect("the file reads")
}

fn has(r: &Report, needle: &str) -> bool {
    r.errors.iter().any(|e| e.contains(needle))
}

#[test]
fn the_synthetic_example_is_complete_and_readable() {
    let r = report(&example_dir().join("submission.toml"));
    assert!(r.ok, "{:#?}", r.errors);
    assert!(r.warnings.is_empty(), "{:#?}", r.warnings);
    assert!(
        r.info
            .iter()
            .any(|i| i.contains("2400 samples") && i.contains("60 s")),
        "{:#?}",
        r.info
    );
    assert!(r.info.iter().any(|i| i.contains("SHA-256 matches")));
    assert_eq!(
        r.targets,
        vec!["Oscillator holdover presets from public datasheets"]
    );
    assert!(
        r.statement.contains("does not score the data"),
        "the report must say what it is not"
    );
}

#[test]
fn a_wrong_hash_a_missing_file_and_a_bad_schema_are_errors() {
    let wrong = scratch(|t| {
        let sha =
            sha256_hex(&std::fs::read(example_dir().join("clock-phase-synthetic.txt")).unwrap());
        t.replace(&sha, &"0".repeat(64))
    });
    let r = report(&wrong);
    assert!(
        !r.ok && has(&r, "does not match the file"),
        "{:#?}",
        r.errors
    );

    let missing = scratch(|t| t.replace("clock-phase-synthetic.txt", "no-such-file.txt"));
    let r = report(&missing);
    assert!(!r.ok && has(&r, "cannot be read"), "{:#?}", r.errors);

    let schema =
        scratch(|t| t.replace("kshana.partner-submission/1", "kshana.partner-submission/9"));
    let r = report(&schema);
    assert!(
        !r.ok && has(&r, "expected `kshana.partner-submission/1`"),
        "{:#?}",
        r.errors
    );
}

#[test]
fn metadata_that_is_missing_or_inconsistent_is_named() {
    type Edit = Box<dyn Fn(&str) -> String>;
    let cases: [(&str, Edit, &str); 9] = [
        (
            "processed with no note",
            Box::new(|t| t.replace("processing = \"raw\"", "processing = \"processed\"")),
            "processing_note",
        ),
        (
            "class other with no model",
            Box::new(|t| t.replace("class = \"rubidium\"", "class = \"other\"")),
            "device.model",
        ),
        (
            "unknown class",
            Box::new(|t| t.replace("class = \"rubidium\"", "class = \"fusion-clock\"")),
            "device.class",
        ),
        (
            "bad time",
            Box::new(|t| t.replace("2026-03-01T00:00:00Z", "yesterday")),
            "start_utc",
        ),
        (
            "public with no attribution",
            Box::new(|t| t.replace("attribution = \"Synthetic example, Kshana\"\n", "")),
            "attribution is required",
        ),
        (
            "no licence",
            Box::new(|t| t.replace("spdx = \"CC-BY-4.0\"\n", "")),
            "licence: give an SPDX",
        ),
        (
            "a statement false",
            Box::new(|t| t.replace("permission_to_use = true", "permission_to_use = false")),
            "statements.permission_to_use",
        ),
        (
            "an IMU format on a clock",
            Box::new(|t| t.replace("format = \"timelab\"", "format = \"csv\"")),
            "not a clock-log format",
        ),
        (
            "a row that is not in the matrix",
            Box::new(|t| {
                t.replace(
                    "Oscillator holdover presets from public datasheets",
                    "Quantum teleportation",
                )
            }),
            "not the requirement text of a MODELLED row",
        ),
    ];
    for (what, edit, needle) in cases {
        let r = report(&scratch(edit));
        assert!(!r.ok && has(&r, needle), "{what}: {:#?}", r.errors);
    }
}

#[test]
fn contact_details_and_telephone_numbers_are_refused() {
    let r = report(&scratch(|t| {
        t.replace(
            "a temperature-controlled laboratory",
            "write to someone@example.org",
        )
    }));
    assert!(!r.ok && has(&r, "an email address"), "{:#?}", r.errors);
    let r = report(&scratch(|t| {
        t.replace("a second, identical unit", "+44 20 7946 0000")
    }));
    assert!(!r.ok && has(&r, "a telephone number"), "{:#?}", r.errors);
}

#[test]
fn a_file_that_does_not_parse_is_a_finding_not_a_crash() {
    let r = report(&scratch(|t| {
        t.replace("[statements]", "[statements]\nextra = 1")
    }));
    assert!(!r.ok && has(&r, "does not parse"), "{:#?}", r.errors);
    let r = report(&scratch(|_| "not toml at all [[[".to_string()));
    assert!(!r.ok && has(&r, "does not parse"), "{:#?}", r.errors);
}

#[test]
fn a_short_record_warns_and_an_unreadable_one_errors() {
    // 12 samples: reads, but is far too short to say anything about a floor.
    let path = scratch(|t| t.to_string());
    let dir = path.parent().unwrap();
    let short = "# short\n# tau0 = 60\n# units = ns\n# data = phase\n1\n2\n3\n4\n5\n6\n7\n8\n9\n10\n11\n12\n";
    std::fs::write(dir.join("clock-phase-synthetic.txt"), short).unwrap();
    let text = std::fs::read_to_string(&path).unwrap();
    let sha = sha256_hex(&std::fs::read(example_dir().join("clock-phase-synthetic.txt")).unwrap());
    std::fs::write(&path, text.replace(&sha, &sha256_hex(short.as_bytes()))).unwrap();
    let r = report(&path);
    assert!(r.ok, "{:#?}", r.errors);
    assert!(
        r.warnings.iter().any(|w| w.contains("only 12 samples")),
        "{:#?}",
        r.warnings
    );
    assert!(
        r.warnings.iter().any(|w| w.contains("under a day")),
        "{:#?}",
        r.warnings
    );

    let junk = "this is not a clock log\n";
    std::fs::write(dir.join("clock-phase-synthetic.txt"), junk).unwrap();
    let text = std::fs::read_to_string(&path).unwrap();
    std::fs::write(
        &path,
        text.replace(&sha256_hex(short.as_bytes()), &sha256_hex(junk.as_bytes())),
    )
    .unwrap();
    let r = report(&path);
    assert!(
        !r.ok && has(&r, "the clock log does not read"),
        "{:#?}",
        r.errors
    );
}

/// Every row `docs/PARTNER-DATA.md` offers is a real MODELLED row, by its exact requirement text, so the page cannot
/// name a row the ledger does not have or one that has since been promoted.
#[test]
fn the_rows_the_partner_page_lists_are_modelled_rows() {
    let page =
        std::fs::read_to_string(root().join("docs/PARTNER-DATA.md")).expect("docs/PARTNER-DATA.md");
    let start = page
        .find("## Rows a partner's data could promote")
        .expect("the rows section");
    let rest = &page[start..];
    let end = rest[3..].find("\n## ").map_or(rest.len(), |i| i + 3);
    let modelled = modelled_requirements();
    let mut listed = 0;
    for line in rest[..end].lines().filter(|l| l.starts_with("| `")) {
        let cell = line.trim_start_matches("| `").split("` |").next().unwrap();
        assert!(modelled.contains(&cell), "docs/PARTNER-DATA.md lists `{cell}`, which is not a MODELLED requirement in the matrix");
        listed += 1;
    }
    assert!(listed >= 5, "only {listed} rows listed");
}

fn run(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .expect("run kshana");
    (
        out.status.code().unwrap_or(-1),
        format!(
            "{}{}",
            String::from_utf8_lossy(&out.stdout),
            String::from_utf8_lossy(&out.stderr)
        ),
    )
}

#[test]
fn the_command_exits_0_when_ready_1_when_not_and_2_on_misuse() {
    let ok = example_dir().join("submission.toml");
    let (code, text) = run(&["partner", "check", ok.to_str().unwrap()]);
    assert_eq!(code, 0, "{text}");
    assert!(
        text.contains("complete and readable") && text.contains("does not score the data"),
        "{text}"
    );

    let (code, text) = run(&["partner", "check", ok.to_str().unwrap(), "--json"]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).expect("json");
    assert_eq!(v["ok"], true);
    assert!(v["statement"]
        .as_str()
        .unwrap()
        .contains("not type-approved"));

    let bad = scratch(|t| t.replace("kshana.partner-submission/1", "x"));
    let (code, text) = run(&["partner", "check", bad.to_str().unwrap()]);
    assert_eq!(code, 1, "{text}");
    assert!(
        text.contains("ERROR") && text.contains("not ready"),
        "{text}"
    );

    assert_eq!(run(&["partner"]).0, 2);
    assert_eq!(run(&["partner", "check"]).0, 2);
    assert_eq!(run(&["partner", "check", "a", "b"]).0, 2);
    assert_eq!(run(&["partner", "check", "--bogus", "a"]).0, 2);
    assert_eq!(run(&["partner", "check", "/no/such/file.toml"]).0, 2);
}
