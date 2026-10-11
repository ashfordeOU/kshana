//! `kshana::surface::trust_telemetry` (the WebAssembly `trust_telemetry` export) against the
//! command line: the same encoders, so the same events and the same metrics, with no clock.

use kshana::surface::{
    trust_telemetry, TelemetryFormat, TelemetryInput, TelemetryOptions, MAX_INPUT_BYTES,
};
use std::io::Write;
use std::process::{Command, Stdio};

const STREAM: &str = concat!(
    r#"{"seq":1,"t_s":0.0,"time":null,"state":"calibrating","score":null,"deductions":[],"alarms":[],"gate":"off","note":null}"#,
    "\n",
    r#"{"seq":2,"t_s":1.0,"time":null,"state":"nominal","score":97.5,"deductions":[],"alarms":[],"gate":"off","note":null}"#,
    "\n",
    "this line is not JSON\n",
    r#"{"seq":3,"t_s":2.0,"time":null,"state":"degraded","score":41.0,"deductions":[{"monitor":"cn0-drop","ratio":1.5,"points":30.0}],"alarms":["cn0-drop"],"gate":"off","note":null}"#,
    "\n",
    r#"{"seq":4,"t_s":3.0,"time":null,"state":"untrusted","score":12.0,"deductions":[{"monitor":"kinematic","ratio":3.0,"points":50.0}],"alarms":["kinematic","cn0-drop"],"gate":"withheld","note":null}"#,
    "\n",
);

fn surface(format: TelemetryFormat, opts: TelemetryOptions) -> String {
    trust_telemetry(
        STREAM,
        format,
        "ops-gw1",
        TelemetryInput::Jsonl,
        opts,
        MAX_INPUT_BYTES,
    )
    .unwrap()
}

fn cli(args: &[&str]) -> String {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("trust-telemetry")
        .args(args)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::null())
        .spawn()
        .unwrap();
    c.stdin
        .take()
        .unwrap()
        .write_all(STREAM.as_bytes())
        .unwrap();
    String::from_utf8(c.wait_with_output().unwrap().stdout).unwrap()
}

/// The CEF or LEEF text of each event: everything from the format marker on.
fn payloads(text: &str, marker: &str) -> Vec<String> {
    text.lines()
        .filter(|l| l.starts_with('<'))
        .map(|l| l[l.find(marker).expect("marker")..].to_string())
        .collect()
}

#[test]
fn cef_events_match_the_command_line() {
    let got = surface(TelemetryFormat::Cef, TelemetryOptions::default());
    let want = cli(&["--print-syslog", "--host", "ops-gw1"]);
    assert_eq!(payloads(&got, "CEF:"), payloads(&want, "CEF:"));
    assert_eq!(got.lines().count(), 4, "one event per band change: {got}");
    assert!(got
        .lines()
        .all(|l| l.contains(" - ") || l.contains(" ops-gw1 ")));
}

#[test]
fn leef_and_syslog_all_match_the_command_line() {
    let opts = TelemetryOptions {
        syslog_all: true,
        ..Default::default()
    };
    let got = surface(TelemetryFormat::Leef, opts);
    let want = cli(&[
        "--print-syslog",
        "--format",
        "leef",
        "--syslog-all",
        "--host",
        "ops-gw1",
    ]);
    assert_eq!(payloads(&got, "LEEF:"), payloads(&want, "LEEF:"));
    assert_eq!(got.lines().count(), 4, "four parsed epochs: {got}");
}

#[test]
fn prometheus_matches_the_command_line_apart_from_clock_gauges() {
    let got = surface(TelemetryFormat::Prometheus, TelemetryOptions::default());
    let want = cli(&["--print-metrics", "--host", "ops-gw1"]);
    let keep = |t: &str| -> Vec<String> {
        t.lines()
            .filter(|l| !l.contains("_unix") && !l.contains("timestamp_seconds"))
            .map(str::to_string)
            .collect()
    };
    assert_eq!(keep(&got), keep(&want));
    assert!(got.contains("kshana_trust_input_errors_total 1"), "{got}");
}

#[cfg(feature = "otlp")]
#[test]
fn otlp_is_the_metrics_payload() {
    let got = surface(
        TelemetryFormat::Otlp,
        TelemetryOptions {
            unix_nano: 1_700_000_000 * 1_000_000_000,
            ..Default::default()
        },
    );
    let v: serde_json::Value = serde_json::from_str(&got).unwrap();
    assert!(v["resourceMetrics"].is_array(), "{got}");
    assert!(got.contains("kshana.trust.score"));
}

#[test]
fn bad_input_is_refused_not_guessed() {
    let f = |input: &str, kind| {
        trust_telemetry(
            input,
            TelemetryFormat::Cef,
            "",
            kind,
            TelemetryOptions::default(),
            MAX_INPUT_BYTES,
        )
    };
    assert!(f("", TelemetryInput::Jsonl)
        .unwrap_err()
        .contains("no trust epoch"));
    assert!(f("not json", TelemetryInput::Result).is_err());
    assert!(trust_telemetry(
        "x",
        TelemetryFormat::Cef,
        "",
        TelemetryInput::Jsonl,
        TelemetryOptions::default(),
        0
    )
    .unwrap_err()
    .contains("limit"));
    assert!(TelemetryFormat::parse("xml").is_err());
    assert!(TelemetryInput::parse("csv").is_err());
}

#[test]
fn a_long_or_unprintable_host_is_refused_before_it_is_copied_into_every_event() {
    let go = |host: &str, max: usize| {
        trust_telemetry(
            STREAM,
            TelemetryFormat::Cef,
            host,
            TelemetryInput::Jsonl,
            TelemetryOptions {
                syslog_all: true,
                ..Default::default()
            },
            max,
        )
    };
    let long = "h".repeat(100_000);
    assert!(go(&long, MAX_INPUT_BYTES).unwrap_err().contains("host"));
    assert!(go(&"h".repeat(256), MAX_INPUT_BYTES).is_err());
    assert!(go(&"h".repeat(255), MAX_INPUT_BYTES).is_ok());
    assert!(go("two words", MAX_INPUT_BYTES).is_err());
    assert!(go("caf\u{e9}", MAX_INPUT_BYTES).is_err());
    assert!(go("a\nb", MAX_INPUT_BYTES).is_err());
}

#[test]
fn the_reply_is_capped_so_a_small_input_cannot_make_a_huge_one() {
    // One line fans out to one CEF event per epoch with `syslog_all`: the reply, not only the
    // input, is bounded by the limit the caller gives.
    let line = r#"{"seq":1,"t_s":1.0,"time":null,"state":"nominal","score":97.5,"deductions":[],"alarms":[],"gate":"off","note":null}"#;
    let input = format!("{line}\n").repeat(400);
    let host = "h".repeat(255);
    let max = input.len() + 1;
    let e = trust_telemetry(
        &input,
        TelemetryFormat::Cef,
        &host,
        TelemetryInput::Jsonl,
        TelemetryOptions {
            syslog_all: true,
            ..Default::default()
        },
        max,
    )
    .unwrap_err();
    assert!(e.contains("reply") && e.contains("limit"), "{e}");
}
