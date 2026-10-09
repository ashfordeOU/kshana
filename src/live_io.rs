// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana receiver-trust live`: read an NMEA 0183 stream, score every epoch, and write the
//! scores (and, with `--gate`, the stream) on. The scoring is `kshana::receiver_trust::live`;
//! this file is only input and output.

use std::fs::{File, OpenOptions};
use std::io::{BufRead, BufReader, Seek, SeekFrom, Write};
use std::net::{TcpStream, UdpSocket};
use std::path::PathBuf;
use std::process::ExitCode;
use std::sync::mpsc::{self, RecvTimeoutError, Sender};
use std::time::{Duration, Instant};

use kshana::receiver_trust::live::{parse_live_scenario, LiveEngine, LiveOut};

pub const LIVE_USAGE: &str = "usage: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] [--from-end] | --tcp <host:port> | --udp <[addr:]port>] [--replay] [--gate] [--json <path|->] [--pksht <path|->]

Reads NMEA 0183 (stdin by default), scores every epoch of a vessel's fix 0-100 and writes one
JSON line per epoch (stdout by default). With --gate the NMEA stream is passed through on stdout
instead, unchanged while the fix is trusted and with the fix marked invalid while it is not, each
cycle followed by a $PKSHT sentence; the JSON then goes only where --json says. The session is a
scenario .toml with a [platform] kind = \"vessel\"; its [log] table is not needed.

The receiver's time is also checked against this computer's clock, which only means something for
a stream arriving in real time; for a stored log fed in faster than that (stdin, tcp, udp) pass
--replay, and a plain --file (without --follow) already does.

This is advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the
operator remains responsible for the navigation of the vessel.";

enum Source {
    Stdin,
    File {
        path: PathBuf,
        follow: bool,
        from_end: bool,
    },
    Tcp(String),
    Udp(String),
}

enum Sink {
    None,
    Stdout,
    File(File),
}

impl Sink {
    fn open(spec: &str) -> Result<Self, String> {
        if spec == "-" {
            return Ok(Sink::Stdout);
        }
        OpenOptions::new()
            .create(true)
            .append(true)
            .open(spec)
            .map(Sink::File)
            .map_err(|e| format!("cannot open {spec}: {e}"))
    }

    fn write(&mut self, bytes: &[u8]) -> std::io::Result<()> {
        match self {
            Sink::None => Ok(()),
            Sink::Stdout => std::io::stdout().lock().write_all(bytes),
            Sink::File(f) => f.write_all(bytes),
        }
    }

    fn flush(&mut self) -> std::io::Result<()> {
        match self {
            Sink::None => Ok(()),
            Sink::Stdout => std::io::stdout().lock().flush(),
            Sink::File(f) => f.flush(),
        }
    }

    fn is_stdout(&self) -> bool {
        matches!(self, Sink::Stdout)
    }
}

enum Msg {
    Line(Vec<u8>, f64),
    End,
    Fail(String),
}

fn read_lines<R: BufRead>(mut r: R, tx: &Sender<Msg>, start: Instant) -> Result<(), String> {
    let mut buf = Vec::new();
    loop {
        buf.clear();
        match r.read_until(b'\n', &mut buf) {
            Ok(0) => return Ok(()),
            Ok(_) => {
                if tx
                    .send(Msg::Line(buf.clone(), start.elapsed().as_secs_f64()))
                    .is_err()
                {
                    return Ok(());
                }
            }
            Err(e) => return Err(e.to_string()),
        }
    }
}

fn read_file(
    path: &PathBuf,
    follow: bool,
    from_end: bool,
    tx: &Sender<Msg>,
    start: Instant,
) -> Result<(), String> {
    let open = |from_end: bool| -> Result<(BufReader<File>, u64), String> {
        let mut f = File::open(path).map_err(|e| format!("cannot open {}: {e}", path.display()))?;
        let pos = if from_end {
            f.seek(SeekFrom::End(0)).map_err(|e| e.to_string())?
        } else {
            0
        };
        Ok((BufReader::new(f), pos))
    };
    let (mut r, mut pos) = open(from_end)?;
    let mut partial: Vec<u8> = Vec::new();
    let mut buf = Vec::new();
    loop {
        buf.clear();
        let n = r.read_until(b'\n', &mut buf).map_err(|e| e.to_string())?;
        if n > 0 {
            pos += n as u64;
            partial.extend_from_slice(&buf);
            if partial.ends_with(b"\n") {
                let line = std::mem::take(&mut partial);
                if tx
                    .send(Msg::Line(line, start.elapsed().as_secs_f64()))
                    .is_err()
                {
                    return Ok(());
                }
            }
            continue;
        }
        if !follow {
            if !partial.is_empty() {
                let _ = tx.send(Msg::Line(partial, start.elapsed().as_secs_f64()));
            }
            return Ok(());
        }
        // At the end of a file that may still grow: wait, and start over if it was
        // truncated or replaced by a shorter one.
        std::thread::sleep(Duration::from_millis(100));
        if std::fs::metadata(path).is_ok_and(|m| m.len() < pos) {
            (r, pos) = open(false)?;
            partial.clear();
        }
    }
}

fn read_udp(addr: &str, tx: &Sender<Msg>, start: Instant) -> Result<(), String> {
    let sock = UdpSocket::bind(addr).map_err(|e| format!("cannot bind udp {addr}: {e}"))?;
    eprintln!("kshana live: listening on udp {addr}");
    let mut buf = vec![0u8; 65_536];
    loop {
        let (n, _) = sock.recv_from(&mut buf).map_err(|e| e.to_string())?;
        let t = start.elapsed().as_secs_f64();
        for line in buf[..n].split_inclusive(|b| *b == b'\n') {
            if tx.send(Msg::Line(line.to_vec(), t)).is_err() {
                return Ok(());
            }
        }
    }
}

fn spawn_reader(src: Source, tx: Sender<Msg>, start: Instant) {
    std::thread::spawn(move || {
        let r = match &src {
            Source::Stdin => read_lines(BufReader::new(std::io::stdin().lock()), &tx, start),
            Source::File {
                path,
                follow,
                from_end,
            } => read_file(path, *follow, *from_end, &tx, start),
            Source::Tcp(addr) => TcpStream::connect(addr)
                .map_err(|e| format!("cannot connect to {addr}: {e}"))
                .and_then(|s| {
                    eprintln!("kshana live: connected to tcp {addr}");
                    read_lines(BufReader::new(s), &tx, start)
                }),
            Source::Udp(addr) => read_udp(addr, &tx, start),
        };
        let _ = tx.send(match r {
            Ok(()) => Msg::End,
            Err(e) => Msg::Fail(e),
        });
    });
}

/// `kshana receiver-trust live ...`
pub fn run(args: &[String]) -> ExitCode {
    match run_inner(args) {
        Ok(()) => ExitCode::SUCCESS,
        Err((msg, code)) => {
            eprintln!("error: {msg}");
            ExitCode::from(code)
        }
    }
}

fn run_inner(args: &[String]) -> Result<(), (String, u8)> {
    let usage = |m: String| (format!("{m}\n{LIVE_USAGE}"), 2u8);
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{LIVE_USAGE}");
        return Ok(());
    }
    let mut session: Option<PathBuf> = None;
    let mut source = Source::Stdin;
    let (mut follow, mut from_end, mut gate, mut replay) = (false, false, false, false);
    let (mut json_spec, mut pksht_spec): (Option<String>, Option<String>) = (None, None);
    let mut it = args.iter();
    while let Some(a) = it.next() {
        let mut value = |name: &str| -> Result<String, (String, u8)> {
            it.next()
                .cloned()
                .ok_or_else(|| usage(format!("{name} needs a value")))
        };
        match a.as_str() {
            "--stdin" => source = Source::Stdin,
            "--file" => {
                source = Source::File {
                    path: PathBuf::from(value("--file")?),
                    follow: false,
                    from_end: false,
                }
            }
            "--follow" => follow = true,
            "--from-end" => from_end = true,
            "--tcp" => source = Source::Tcp(value("--tcp")?),
            "--udp" => {
                let v = value("--udp")?;
                source = Source::Udp(if v.contains(':') {
                    v
                } else {
                    format!("0.0.0.0:{v}")
                });
            }
            "--gate" => gate = true,
            "--replay" => replay = true,
            "--json" => json_spec = Some(value("--json")?),
            "--pksht" => pksht_spec = Some(value("--pksht")?),
            s if s.starts_with("--") => return Err(usage(format!("unknown option {s}"))),
            s => {
                if session.replace(PathBuf::from(s)).is_some() {
                    return Err(usage("more than one session file".into()));
                }
            }
        }
    }
    if let Source::File {
        follow: f,
        from_end: e,
        ..
    } = &mut source
    {
        *f = follow;
        *e = from_end;
    } else if follow || from_end {
        return Err(usage("--follow and --from-end apply to --file only".into()));
    }
    let Some(session) = session else {
        return Err(usage("live needs a session .toml".into()));
    };
    let src = std::fs::read_to_string(&session)
        .map_err(|e| (format!("cannot read {}: {e}", session.display()), 2))?;
    let scn = parse_live_scenario(&src).map_err(|e| (e, 2))?;
    let mut engine = LiveEngine::new(&scn, gate).map_err(|e| (e, 2))?;
    // A file read to its end is not arriving in real time; neither is anything given --replay.
    let stored = matches!(&source, Source::File { follow: false, .. });
    engine.set_host_clock(!(replay || stored));

    // Where things go. The stream (gate) or the JSON lines take stdout unless told otherwise.
    let mut json = match (&json_spec, gate) {
        (Some(s), _) => Sink::open(s).map_err(|e| (e, 2))?,
        (None, false) => Sink::Stdout,
        (None, true) => Sink::None,
    };
    let mut pksht = match &pksht_spec {
        Some(s) => Sink::open(s).map_err(|e| (e, 2))?,
        None => Sink::None,
    };
    let mut stream = if gate { Sink::Stdout } else { Sink::None };
    let stdout_users = [&json, &pksht, &stream]
        .iter()
        .filter(|s| s.is_stdout())
        .count();
    if stdout_users > 1 {
        return Err(usage(
            "two outputs would share stdout; send --json or --pksht to a file".into(),
        ));
    }
    eprintln!(
        "kshana live: vessel platform, calibrating for {} s; gate {}. Advisory software, not \
         type-approved navigation equipment: the operator remains responsible.",
        scn.monitors.calibration_s,
        if gate {
            "ON (fix marked invalid while untrusted)"
        } else {
            "off"
        }
    );

    let start = Instant::now();
    let (tx, rx) = mpsc::channel();
    spawn_reader(source, tx, start);
    let poll = Duration::from_secs_f64((scn.monitors.live.idle_flush_s / 4.0).clamp(0.01, 0.25));
    let io_err = |e: std::io::Error| (format!("write failed: {e}"), 1u8);
    let mut emit = |out: LiveOut| -> Result<(), (String, u8)> {
        for line in &out.forward {
            // The stream sink carries a line's own terminator; only a line without one gets CRLF.
            stream.write(line).map_err(io_err)?;
            if !line.ends_with(b"\n") {
                stream.write(b"\r\n").map_err(io_err)?;
            }
        }
        for r in &out.reports {
            json.write(format!("{}\n", r.to_json_line()).as_bytes())
                .map_err(io_err)?;
            pksht
                .write(format!("{}\r\n", r.pksht()).as_bytes())
                .map_err(io_err)?;
        }
        stream.flush().map_err(io_err)?;
        json.flush().map_err(io_err)?;
        pksht.flush().map_err(io_err)
    };
    loop {
        match rx.recv_timeout(poll) {
            Ok(Msg::Line(l, t)) => emit(engine.feed_line(&l, t))?,
            Ok(Msg::End) | Err(RecvTimeoutError::Disconnected) => {
                emit(engine.finish())?;
                return Ok(());
            }
            Ok(Msg::Fail(e)) => {
                emit(engine.finish())?;
                return Err((e, 1));
            }
            Err(RecvTimeoutError::Timeout) => {
                emit(engine.idle(start.elapsed().as_secs_f64()))?;
            }
        }
    }
}
