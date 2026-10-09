// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana receiver-trust live` end to end: stdin, a file being appended, TCP and UDP.
//! The streams are synthetic NMEA text from `receiver_trust::synth`.

use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpListener, UdpSocket};
use std::path::PathBuf;
use std::process::{Child, Command, Stdio};

use kshana::receiver_trust::synth::{synth_voyage, VoyageSpec};

const BIN: &str = env!("CARGO_BIN_EXE_kshana");

fn session(tag: &str) -> PathBuf {
    let dir = std::env::temp_dir().join(format!("kshana-live-{}-{tag}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let p = dir.join("session.toml");
    std::fs::write(
        &p,
        "kind = \"receiver-trust\"\n[monitors]\ncalibration_s = 20.0\n\
         [platform]\nkind = \"vessel\"\nantenna_height_m = 18.0\nheading_sensor = true\n",
    )
    .unwrap();
    p
}

fn text(duration_s: f64) -> String {
    synth_voyage(&VoyageSpec {
        duration_s,
        ..Default::default()
    })
    .lines()
    .map(|l| format!("{l}\r\n"))
    .collect()
}

fn run_stdin(args: &[&str], input: &str, tag: &str) -> (String, String) {
    let mut child = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session(tag))
        .args(args)
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    let mut stdin = child.stdin.take().unwrap();
    let data = input.to_string();
    let w = std::thread::spawn(move || stdin.write_all(data.as_bytes()).unwrap());
    let out = child.wait_with_output().unwrap();
    w.join().unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    (
        String::from_utf8(out.stdout).unwrap(),
        String::from_utf8(out.stderr).unwrap(),
    )
}

fn json_lines(s: &str) -> Vec<serde_json::Value> {
    s.lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect()
}

#[test]
fn a_stored_log_fed_in_at_full_speed_trips_the_host_clock_check_unless_replay_is_stated() {
    // The receiver's time runs 60 s in a few milliseconds of this computer's: that is what
    // the check is for, and it says so.
    let (out, _) = run_stdin(&[], &text(60.0), "fast");
    let v = json_lines(&out);
    assert_eq!(v[60]["state"], "degraded");
    assert_eq!(v[60]["deductions"][0]["monitor"], "time-consistency");
}

#[test]
fn stdin_gives_one_json_line_per_epoch() {
    let (out, err) = run_stdin(&["--replay"], &text(60.0), "stdin");
    let v = json_lines(&out);
    assert_eq!(v.len(), 61);
    assert_eq!(v[5]["state"], "calibrating");
    assert_eq!(v[60]["state"], "nominal");
    assert_eq!(v[60]["score"], 100.0);
    assert_eq!(v[60]["gate"], "off");
    assert!(err.contains("Advisory software"), "{err}");
}

#[test]
fn gate_passes_the_stream_with_a_pksht_after_each_cycle_and_json_goes_to_a_file() {
    let dir = std::env::temp_dir().join(format!("kshana-live-{}-gatejson", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let json = dir.join("out.jsonl");
    let input = text(40.0);
    let (out, _) = run_stdin(
        &["--replay", "--gate", "--json", json.to_str().unwrap()],
        &input,
        "gate",
    );
    let forwarded: Vec<&str> = out.lines().filter(|l| !l.starts_with("$PKSHT")).collect();
    let in_lines: Vec<&str> = input.lines().collect();
    assert_eq!(forwarded, in_lines, "a trusted stream passes unchanged");
    let pksht: Vec<&str> = out.lines().filter(|l| l.starts_with("$PKSHT")).collect();
    assert_eq!(pksht.len(), 41);
    assert!(
        pksht[0].starts_with("$PKSHT,1,080000.00,,C,P,*"),
        "{}",
        pksht[0]
    );
    assert!(
        pksht[40].starts_with("$PKSHT,1,080040.00,100.0,N,P,*"),
        "{}",
        pksht[40]
    );
    let jl = std::fs::read_to_string(&json).unwrap();
    assert_eq!(json_lines(&jl).len(), 41);
}

#[test]
fn two_outputs_cannot_share_stdout_and_live_needs_a_vessel() {
    let out = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session("share"))
        .args(["--gate", "--json", "-"])
        .stdin(Stdio::null())
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&out.stderr).contains("share stdout"));

    let p = std::env::temp_dir().join(format!("kshana-live-{}-static.toml", std::process::id()));
    std::fs::write(&p, "kind = \"receiver-trust\"\n").unwrap();
    let out = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(&p)
        .stdin(Stdio::null())
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&out.stderr).contains("vessel"));
}

fn read_json_lines(child: &mut Child, n: usize) -> Vec<serde_json::Value> {
    let r = BufReader::new(child.stdout.as_mut().unwrap());
    r.lines()
        .take(n)
        .map(|l| serde_json::from_str(&l.unwrap()).unwrap())
        .collect()
}

#[test]
fn a_file_being_appended_is_followed() {
    let dir = std::env::temp_dir().join(format!("kshana-live-{}-follow", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let log = dir.join("nmea.log");
    let all = text(40.0);
    let cut = all.find("GPGGA,080020.00").unwrap();
    let cut = all[..cut].rfind('$').unwrap();
    std::fs::write(&log, &all[..cut]).unwrap();
    let mut child = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session("follow"))
        .args(["--replay", "--file", log.to_str().unwrap(), "--follow"])
        .stdout(Stdio::piped())
        .stderr(Stdio::null())
        .spawn()
        .unwrap();
    // The first 20 s are read at once; the rest is appended afterwards.
    std::thread::sleep(std::time::Duration::from_millis(400));
    let mut f = std::fs::OpenOptions::new().append(true).open(&log).unwrap();
    f.write_all(&all.as_bytes()[cut..]).unwrap();
    f.flush().unwrap();
    let v = read_json_lines(&mut child, 40);
    child.kill().unwrap();
    child.wait().unwrap();
    assert_eq!(v.len(), 40);
    assert_eq!(v[39]["t_s"], 39.0);
    assert_eq!(v[39]["state"], "nominal");
}

#[test]
fn tcp_is_read_until_the_peer_closes() {
    let listener = TcpListener::bind("127.0.0.1:0").unwrap();
    let port = listener.local_addr().unwrap().port();
    let input = text(30.0);
    let server = std::thread::spawn(move || {
        let (mut s, _) = listener.accept().unwrap();
        s.write_all(input.as_bytes()).unwrap();
    });
    let out = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session("tcp"))
        .args(["--replay", "--tcp", &format!("127.0.0.1:{port}")])
        .output()
        .unwrap();
    server.join().unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let v = json_lines(&String::from_utf8(out.stdout).unwrap());
    assert_eq!(v.len(), 31);
    assert_eq!(v[30]["state"], "nominal");
}

#[test]
fn udp_datagrams_are_read() {
    let probe = UdpSocket::bind("127.0.0.1:0").unwrap();
    let port = probe.local_addr().unwrap().port();
    drop(probe);
    let mut child = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session("udp"))
        .args(["--replay", "--udp", &format!("127.0.0.1:{port}")])
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    // Wait until it has bound.
    let mut err = BufReader::new(child.stderr.take().unwrap());
    let mut l = String::new();
    while !l.contains("listening on udp") {
        l.clear();
        assert!(err.read_line(&mut l).unwrap() > 0, "exited before binding");
    }
    let tx = UdpSocket::bind("127.0.0.1:0").unwrap();
    // One datagram per cycle of sentences, as a multiplexer sends them.
    let input = text(30.0);
    let mut cycle = String::new();
    for line in input.split_inclusive('\n') {
        if line.contains("GGA") && !cycle.is_empty() {
            tx.send_to(cycle.as_bytes(), format!("127.0.0.1:{port}"))
                .unwrap();
            cycle.clear();
            std::thread::sleep(std::time::Duration::from_millis(2));
        }
        cycle.push_str(line);
    }
    tx.send_to(cycle.as_bytes(), format!("127.0.0.1:{port}"))
        .unwrap();
    let v = read_json_lines(&mut child, 30);
    child.kill().unwrap();
    child.wait().unwrap();
    let mut rest = String::new();
    let _ = err.read_to_string(&mut rest);
    assert_eq!(v.len(), 30);
    assert_eq!(v[29]["state"], "nominal");
}

#[test]
fn gate_serves_the_stream_to_several_tcp_clients_on_localhost() {
    let probe = TcpListener::bind("127.0.0.1:0").unwrap();
    let port = probe.local_addr().unwrap().port();
    drop(probe);
    let mut child = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session("listen"))
        .args(["--replay", "--gate", "--listen", &format!("tcp:{port}")])
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    let mut err = BufReader::new(child.stderr.take().unwrap());
    let mut l = String::new();
    while !l.contains("listening on tcp") {
        l.clear();
        assert!(
            err.read_line(&mut l).unwrap() > 0,
            "exited before listening"
        );
    }
    // Two readers, and a third that connects and never reads.
    let addr = format!("127.0.0.1:{port}");
    let readers: Vec<_> = (0..2)
        .map(|_| {
            let mut s = std::net::TcpStream::connect(&addr).unwrap();
            std::thread::spawn(move || {
                let mut out = String::new();
                s.read_to_string(&mut out).unwrap();
                out
            })
        })
        .collect();
    let _idle = std::net::TcpStream::connect(&addr).unwrap();
    std::thread::sleep(std::time::Duration::from_millis(300));
    let input = text(30.0);
    child
        .stdin
        .take()
        .unwrap()
        .write_all(input.as_bytes())
        .unwrap();
    let status = child.wait().unwrap();
    assert!(status.success());
    // stdout carries nothing of the stream while it is served over TCP.
    let mut so = String::new();
    child
        .stdout
        .take()
        .unwrap()
        .read_to_string(&mut so)
        .unwrap();
    assert!(so.is_empty(), "{so}");
    for r in readers {
        let got = r.join().unwrap();
        let fwd: Vec<&str> = got.lines().filter(|l| !l.starts_with("$PKSHT")).collect();
        assert_eq!(fwd, input.lines().collect::<Vec<_>>());
        assert_eq!(got.matches("$PKSHT,").count(), 31);
    }
}
