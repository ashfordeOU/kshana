// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana receiver-trust live --serial` on a pseudo-terminal loopback: the test plays the
//! receiver on the master side, the command reads the slave side as a serial device, and nothing
//! the command does ever shows up as a write to the receiver.
//!
//! PIN-SCOPE:    NMEA written to a pty is scored line by line; the line is read-only (the master
//!               side sees no byte from the command); a bad baud rate and `--configure` are refused;
//!               a closed device is a fault, not a normal end
//! PIN-EXCLUDES: real USB serial adapters, flow control, hot-unplug timing
#![cfg(unix)]

use std::io::{BufRead, BufReader, Read, Write};
use std::os::fd::{FromRawFd, RawFd};
use std::process::{Command, Stdio};
use std::time::{Duration, Instant};

use kshana::receiver_trust::synth::{synth_voyage, VoyageSpec};

const BIN: &str = env!("CARGO_BIN_EXE_kshana");

/// A pty master and the path of its slave.
fn pty() -> (std::fs::File, String) {
    // SAFETY: plain libc calls on a descriptor this function owns; the master is wrapped in a
    // `File` (which closes it) straight after it is opened.
    unsafe {
        // O_CLOEXEC: the command under test must not inherit the master, or it would never see the hang-up.
        let fd: RawFd = libc::posix_openpt(libc::O_RDWR | libc::O_NOCTTY | libc::O_CLOEXEC);
        assert!(fd >= 0, "posix_openpt");
        assert_eq!(libc::grantpt(fd), 0);
        assert_eq!(libc::unlockpt(fd), 0);
        let name = std::ffi::CStr::from_ptr(libc::ptsname(fd))
            .to_string_lossy()
            .into_owned();
        (std::fs::File::from_raw_fd(fd), name)
    }
}

fn session() -> std::path::PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-serial-{}-{seq}", std::process::id()));
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

#[test]
fn a_pty_loopback_is_scored_and_never_written_to() {
    let (mut master, slave) = pty();
    // Keep a slave descriptor open here so the line does not hang up between the child's
    // open and our first write.
    let _keep = std::fs::OpenOptions::new()
        .read(true)
        .write(true)
        .open(&slave)
        .unwrap();
    let mut child = Command::new(BIN)
        .args(["receiver-trust", "live"])
        .arg(session())
        .args(["--serial", &slave, "--baud", "4800", "--replay"])
        .stdout(Stdio::piped())
        .stderr(Stdio::piped())
        .spawn()
        .unwrap();
    // Wait for the command to report that it has the device open.
    let mut err = BufReader::new(child.stderr.take().unwrap());
    let mut line = String::new();
    let deadline = Instant::now() + Duration::from_secs(20);
    loop {
        line.clear();
        err.read_line(&mut line).unwrap();
        if line.contains("read only") {
            break;
        }
        assert!(
            Instant::now() < deadline,
            "the command never opened the device: {line}"
        );
    }
    let nmea: String = synth_voyage(&VoyageSpec {
        duration_s: 40.0,
        ..Default::default()
    })
    .lines()
    .map(|l| format!("{l}\r\n"))
    .collect();
    for chunk in nmea.as_bytes().chunks(512) {
        master.write_all(chunk).unwrap();
        std::thread::sleep(Duration::from_millis(2));
    }
    let (tx, rx) = std::sync::mpsc::channel();
    let stdout = child.stdout.take().unwrap();
    std::thread::spawn(move || {
        for l in BufReader::new(stdout).lines() {
            if tx.send(l.unwrap()).is_err() {
                break;
            }
        }
    });
    let mut epochs = 0;
    let mut last = serde_json::Value::Null;
    while epochs < 35 {
        match rx.recv_timeout(Duration::from_secs(10)) {
            Ok(l) => {
                last = serde_json::from_str(&l).unwrap();
                epochs += 1;
            }
            Err(_) => break,
        }
    }
    assert!(epochs >= 35, "only {epochs} epochs scored");
    assert!(
        last["score"].is_number() || last["state"].is_string(),
        "{last}"
    );
    // Read-only: the master side received nothing from the command.
    // SAFETY: setting O_NONBLOCK on a descriptor this test owns.
    unsafe {
        use std::os::fd::AsRawFd;
        let fl = libc::fcntl(master.as_raw_fd(), libc::F_GETFL);
        libc::fcntl(master.as_raw_fd(), libc::F_SETFL, fl | libc::O_NONBLOCK);
    }
    let mut buf = [0u8; 64];
    match master.read(&mut buf) {
        Ok(n) => assert_eq!(n, 0, "the command wrote {n} bytes to the receiver"),
        Err(e) => assert_eq!(e.kind(), std::io::ErrorKind::WouldBlock, "{e}"),
    }
    // Closing the receiver side ends the command as a fault, not as a normal end.
    drop(_keep);
    drop(master);
    let status = child.wait().unwrap();
    assert_eq!(status.code(), Some(1), "a device that goes away is a fault");
}

#[test]
fn bad_options_are_refused_without_touching_a_device() {
    let run = |args: &[&str]| {
        Command::new(BIN)
            .args(["receiver-trust", "live"])
            .arg(session())
            .args(args)
            .output()
            .unwrap()
    };
    let o = run(&["--serial", "/dev/null", "--baud", "5"]);
    assert_eq!(o.status.code(), Some(1));
    assert!(String::from_utf8_lossy(&o.stderr).contains("--baud 5"));
    let o = run(&["--serial", "/dev/null", "--configure"]);
    assert_eq!(o.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&o.stderr).contains("never writes to a receiver"));
    let o = run(&["--stdin", "--baud", "9600"]);
    assert_eq!(o.status.code(), Some(2));
    let o = run(&["--serial", "/nonexistent/ttyUSB0"]);
    assert_eq!(o.status.code(), Some(1));
    assert!(String::from_utf8_lossy(&o.stderr).contains("cannot open"));
}
