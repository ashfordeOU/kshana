//! `kshana trust-telemetry` end to end: the binary reads the live stream and feeds the
//! sinks. Everything binds to localhost only.

use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpListener, TcpStream, UdpSocket};
use std::path::PathBuf;
use std::process::{Child, Command, Stdio};
use std::time::{Duration, Instant};

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

fn run(args: &[&str], stdin: &str) -> (String, String, i32) {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("trust-telemetry")
        .args(args)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    c.stdin.take().unwrap().write_all(stdin.as_bytes()).unwrap();
    let o = c.wait_with_output().unwrap();
    (
        String::from_utf8_lossy(&o.stdout).into(),
        String::from_utf8_lossy(&o.stderr).into(),
        o.status.code().unwrap_or(-1),
    )
}

#[test]
fn metrics_and_cef_from_stdin() {
    let (out, err, code) = run(
        &["--print-metrics", "--print-syslog", "--host", "ops-gw1"],
        STREAM,
    );
    assert_eq!(code, 0, "{err}");
    assert!(
        err.contains("input line 3"),
        "the bad line is reported: {err}"
    );
    // One event per band change: calibrating, nominal, degraded, untrusted.
    let events: Vec<&str> = out.lines().filter(|l| l.starts_with('<')).collect();
    assert_eq!(events.len(), 4, "{out}");
    assert!(
        events[2].starts_with("<132>1 "),
        "degraded is syslog warning: {}",
        events[2]
    );
    assert!(
        events[3].starts_with("<130>1 "),
        "untrusted is syslog critical: {}",
        events[3]
    );
    assert!(
        events[3].contains("CEF:0|Ashforde OU|Kshana|"),
        "{}",
        events[3]
    );
    assert!(events[3].contains("|gnss-trust.untrusted|GNSS trust untrusted|9|"));
    assert!(events[3].contains("cs2=kinematic,cn0-drop"));
    assert!(events[3].contains("cs3=degraded") && events[3].contains("cs5=withheld"));
    assert!(events[3].contains("dvchost=ops-gw1"));
    // Metrics reflect the last epoch and the counters.
    assert!(out.contains("kshana_trust_score 12\n"));
    assert!(out.contains("kshana_trust_band{band=\"untrusted\"} 1\n"));
    assert!(out.contains("kshana_trust_epochs_total{band=\"degraded\"} 1\n"));
    assert!(out.contains("kshana_trust_input_errors_total 1\n"));
    assert!(out.contains("kshana_trust_gate{gate=\"withheld\"} 1\n"));
    assert!(out.contains("kshana_trust_reason_epochs_total{reason=\"cn0-drop\"} 2\n"));
}

#[test]
fn leef_and_all_epochs() {
    let (out, err, code) = run(
        &["--print-syslog", "--format", "leef", "--syslog-all"],
        STREAM,
    );
    assert_eq!(code, 0, "{err}");
    let events: Vec<&str> = out.lines().filter(|l| l.starts_with('<')).collect();
    assert_eq!(events.len(), 4, "every valid epoch");
    assert!(events[3].contains("LEEF:2.0|Ashforde OU|Kshana|"));
    assert!(events[3].contains("|gnss-trust.untrusted|^|cat=gnss-trust^sev=9^"));
    assert!(
        events[3].contains("^reasons=kinematic,cn0-drop^") && events[3].contains("^gate=withheld")
    );
}

#[test]
fn http_endpoint_serves_the_stream() {
    let mut child: Child = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["trust-telemetry", "--listen", "127.0.0.1:0", "--hold"])
        .stdin(Stdio::piped())
        .stdout(Stdio::null())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    let mut err = BufReader::new(child.stderr.take().unwrap());
    let mut line = String::new();
    err.read_line(&mut line).unwrap();
    let addr = line
        .trim()
        .strip_prefix("serving http://")
        .and_then(|r| r.strip_suffix("/metrics"))
        .unwrap_or_else(|| panic!("unexpected banner {line:?}"))
        .to_string();
    child
        .stdin
        .take()
        .unwrap()
        .write_all(STREAM.as_bytes())
        .unwrap();

    let t0 = Instant::now();
    let body = loop {
        let mut c = TcpStream::connect(&addr).unwrap();
        c.write_all(b"GET /metrics HTTP/1.1\r\nHost: x\r\n\r\n")
            .unwrap();
        let mut resp = String::new();
        c.read_to_string(&mut resp).unwrap();
        if resp.contains("kshana_trust_epochs_total{band=\"untrusted\"} 1")
            || t0.elapsed() > Duration::from_secs(10)
        {
            break resp;
        }
        std::thread::sleep(Duration::from_millis(50));
    };
    let _ = child.kill();
    let _ = child.wait();
    assert!(body.starts_with("HTTP/1.1 200 OK"), "{body}");
    assert!(body.contains("text/plain; version=0.0.4"));
    assert!(
        body.contains("kshana_trust_band{band=\"untrusted\"} 1\n"),
        "{body}"
    );
    assert!(body.contains("kshana_trust_last_sample_timestamp_seconds "));
}

#[test]
fn udp_syslog_reaches_a_local_collector() {
    let u = UdpSocket::bind("127.0.0.1:0").unwrap();
    u.set_read_timeout(Some(Duration::from_secs(10))).unwrap();
    let addr = u.local_addr().unwrap().to_string();
    let handle = std::thread::spawn(move || {
        let mut got = Vec::new();
        let mut buf = [0u8; 2048];
        while got.len() < 4 {
            match u.recv(&mut buf) {
                Ok(n) => got.push(String::from_utf8_lossy(&buf[..n]).to_string()),
                Err(_) => break,
            }
        }
        got
    });
    let (_, err, code) = run(&["--syslog-udp", &addr, "--format", "cef"], STREAM);
    assert_eq!(code, 0, "{err}");
    let got = handle.join().unwrap();
    assert_eq!(got.len(), 4, "{got:?}");
    assert!(
        got[3].contains("CEF:0|Ashforde OU|Kshana|") && got[3].contains("gnss-trust.untrusted")
    );
}

#[test]
fn a_dead_tcp_collector_neither_hangs_the_run_nor_goes_unnoticed() {
    // A port with nothing listening.
    let port = TcpListener::bind("127.0.0.1:0")
        .unwrap()
        .local_addr()
        .unwrap()
        .port();
    let t0 = Instant::now();
    let (out, _err, code) = run(
        &[
            "--syslog-tcp",
            &format!("127.0.0.1:{port}"),
            "--print-metrics",
        ],
        STREAM,
    );
    assert_eq!(code, 0);
    assert!(
        t0.elapsed() < Duration::from_secs(15),
        "took {:?}",
        t0.elapsed()
    );
    // Four band changes, none deliverable: all four are counted.
    assert!(
        out.contains("kshana_trust_syslog_send_failures_total 4\n"),
        "{out}"
    );
    // The assessment's own metrics are intact.
    assert!(out.contains("kshana_trust_score 12\n"));
}

#[test]
fn octet_counting_needs_tcp_and_usage_errors_exit_2() {
    let (_, err, code) = run(&["--syslog-octet-counting", "--print-metrics"], "");
    assert_eq!(code, 1, "{err}");
    assert!(err.contains("applies to --syslog-tcp"));
    let (_, _, code) = run(&["--format", "xml"], "");
    assert_eq!(code, 2);
}

#[test]
fn replays_a_batch_result() {
    let src = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("examples/receiver-trust");
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!(
        "kshana-telemetry-replay-{}-{}",
        std::process::id(),
        uniq
    ));
    let _ = std::fs::remove_dir_all(&dir);
    std::fs::create_dir_all(&dir).unwrap();
    for f in ["session.toml", "illustrative-jamming.nmea"] {
        std::fs::copy(src.join(f), dir.join(f)).unwrap();
    }
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["receiver-trust", dir.join("session.toml").to_str().unwrap()])
        .output()
        .unwrap();
    assert!(o.status.success());
    let (out, err, code) = run(
        &[
            "--result",
            dir.join("session.result.json").to_str().unwrap(),
            "--print-metrics",
        ],
        "",
    );
    let _ = std::fs::remove_dir_all(&dir);
    assert_eq!(code, 0, "{err}");
    assert!(
        out.contains("kshana_trust_epochs_total{band=\"untrusted\"}")
            || out.contains("kshana_trust_epochs_total{band=\"degraded\"}")
    );
    assert!(
        out.contains("kshana_trust_reason_epochs_total{reason=\"cn0-drop\"}"),
        "{out}"
    );
    assert!(
        !out.contains("kshana_trust_score "),
        "a static-platform batch result has no score"
    );
}
