// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana receiver-trust live`: read an NMEA 0183 stream, score every epoch, and write the
//! scores (and, with `--gate`, the stream) on. The scoring is `kshana::receiver_trust::live`;
//! this file is only input and output.

use std::fs::{File, OpenOptions};
use std::io::{BufRead, BufReader, Seek, SeekFrom, Write};
use std::net::{TcpListener, TcpStream, UdpSocket};
use std::path::PathBuf;
use std::process::ExitCode;
use std::sync::mpsc::{self, RecvTimeoutError};
use std::sync::mpsc::{sync_channel, SyncSender, TrySendError};
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

use kshana::receiver_trust::live::{parse_live_scenario, LiveEngine, LiveOut};

pub const LIVE_USAGE: &str = "usage: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] [--from-end] | --tcp <host:port> | --udp <[addr:]port>] [--replay] [--gate [--listen tcp:[<addr>:]<port>]] [--json <path|->] [--pksht <path|->]

Reads NMEA 0183 (stdin by default), scores every epoch of a vessel's fix 0-100 and writes one
JSON line per epoch (stdout by default). With --gate the NMEA stream is passed through on stdout
instead, unchanged while the fix is trusted and with the fix marked invalid while it is not, each
cycle followed by a $PKSHT sentence; the JSON then goes only where --json says. The session is a
scenario .toml with a [platform] kind = \"vessel\"; its [log] table is not needed.

--listen (with --gate) serves the gated stream to any number of TCP clients (a chart plotter,
for example) instead of writing it to stdout; the default address is loopback. A client that
cannot keep up is dropped, so it never holds up the others or the input.

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

/// Fan-out of the forwarded stream to TCP clients. Every client has its own bounded queue and
/// its own writer thread, so one that cannot keep up is dropped (its connection closed)
/// instead of holding up the other clients or the input.
type ClientQueue = SyncSender<Arc<Vec<u8>>>;

#[derive(Clone)]
struct Broadcaster {
    clients: Arc<Mutex<Vec<ClientQueue>>>,
    writers: Arc<Mutex<Vec<std::thread::JoinHandle<()>>>>,
}

/// Messages a client may fall behind by before it is dropped.
const CLIENT_QUEUE: usize = 256;

impl Broadcaster {
    fn new() -> Self {
        Self {
            clients: Arc::new(Mutex::new(Vec::new())),
            writers: Arc::new(Mutex::new(Vec::new())),
        }
    }

    /// Add a client's queue.
    fn add(&self, tx: ClientQueue) {
        if let Ok(mut c) = self.clients.lock() {
            c.push(tx);
        }
    }

    /// Queue `bytes` for every client without blocking; a full or closed queue drops that
    /// client. Returns how many were dropped.
    fn send(&self, bytes: Vec<u8>) -> usize {
        let msg = Arc::new(bytes);
        let Ok(mut c) = self.clients.lock() else {
            return 0;
        };
        let before = c.len();
        c.retain(|tx| match tx.try_send(Arc::clone(&msg)) {
            Ok(()) => true,
            Err(TrySendError::Full(_)) | Err(TrySendError::Disconnected(_)) => false,
        });
        before - c.len()
    }

    /// The stream has ended: let every client's queue drain (each write is bounded by the
    /// write timeout), then close.
    fn close(&self) {
        if let Ok(mut c) = self.clients.lock() {
            c.clear(); // the writers finish what is queued, then stop
        }
        let handles: Vec<_> = self
            .writers
            .lock()
            .map(|mut w| w.drain(..).collect())
            .unwrap_or_default();
        for h in handles {
            let _ = h.join();
        }
    }

    /// Accept clients on `addr` in a background thread.
    fn listen(&self, addr: &str) -> Result<(), String> {
        let l = TcpListener::bind(addr).map_err(|e| format!("cannot listen on {addr}: {e}"))?;
        eprintln!("kshana live: listening on tcp {addr}");
        let b = self.clone();
        std::thread::spawn(move || {
            for conn in l.incoming().flatten() {
                let (tx, rx) = sync_channel::<Arc<Vec<u8>>>(CLIENT_QUEUE);
                let _ = conn.set_nodelay(true);
                let _ = conn.set_write_timeout(Some(Duration::from_secs(5)));
                b.add(tx);
                let h = std::thread::spawn(move || {
                    let mut conn = conn;
                    // Ends when the queue is dropped (client too slow) or a write fails.
                    while let Ok(m) = rx.recv() {
                        if conn.write_all(&m).is_err() {
                            break;
                        }
                    }
                });
                if let Ok(mut w) = b.writers.lock() {
                    w.push(h);
                }
            }
        });
        Ok(())
    }
}

/// Parse `--listen tcp:<port>` (loopback) or `tcp:<addr>:<port>`.
fn listen_addr(spec: &str) -> Result<String, String> {
    let rest = spec
        .strip_prefix("tcp:")
        .ok_or("--listen takes tcp:<port> or tcp:<addr>:<port>")?;
    let addr = if rest.contains(':') {
        rest.to_string()
    } else {
        format!("127.0.0.1:{rest}")
    };
    let host = addr.rsplit_once(':').map_or("", |(h, _)| h);
    if !(host == "127.0.0.1" || host == "localhost" || host == "[::1]") {
        eprintln!(
            "kshana live: warning: {addr} is not a loopback address; anything that can reach it \
             can read the stream"
        );
    }
    Ok(addr)
}

enum Sink {
    None,
    Stdout,
    File(File),
    Tcp(Broadcaster),
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
            Sink::Tcp(b) => {
                if b.send(bytes.to_vec()) > 0 {
                    eprintln!("kshana live: dropped a tcp client that could not keep up");
                }
                Ok(())
            }
        }
    }

    fn flush(&mut self) -> std::io::Result<()> {
        match self {
            Sink::None => Ok(()),
            Sink::Stdout => std::io::stdout().lock().flush(),
            Sink::File(f) => f.flush(),
            Sink::Tcp(_) => Ok(()),
        }
    }

    fn is_stdout(&self) -> bool {
        matches!(self, Sink::Stdout)
    }
}

/// Lines a reader may be ahead of the engine by. A reader of a stream (stdin, a file, TCP) blocks
/// when the channel is full, so the kernel's buffers push back on the sender and nothing is lost;
/// UDP, which cannot push back, drops the datagram and counts it.
const READ_QUEUE: usize = 8_192;

type Tx = SyncSender<Msg>;

enum Msg {
    Line(Vec<u8>, f64),
    /// A followed file has been read to its end for the first time: from here it is growing in
    /// real time.
    CaughtUp,
    /// UDP datagrams dropped since the last report.
    Dropped(u64),
    End,
    Fail(String),
}

fn read_lines<R: BufRead>(mut r: R, tx: &Tx, start: Instant) -> Result<(), String> {
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
    tx: &Tx,
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
    let mut caught_up = false;
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
        // At the end of a file that may still grow: it is caught up (what was there is read, what
        // comes is arriving in real time), so say so once, then wait, and start over if it was
        // truncated or replaced by a shorter one.
        if !caught_up {
            caught_up = true;
            let _ = tx.send(Msg::CaughtUp);
        }
        std::thread::sleep(Duration::from_millis(100));
        if std::fs::metadata(path).is_ok_and(|m| m.len() < pos) {
            (r, pos) = open(false)?;
            partial.clear();
        }
    }
}

/// Longest partial line held across datagrams before it is let go as a line.
const MAX_PARTIAL: usize = 4_096;

fn read_udp(addr: &str, tx: &Tx, start: Instant) -> Result<(), String> {
    let host = addr.rsplit_once(':').map_or("", |(h, _)| h);
    if !(host == "127.0.0.1" || host == "localhost" || host == "[::1]") {
        eprintln!(
            "kshana live: warning: {addr} is not a loopback address; anything that can reach it \
             can send this layer a stream"
        );
    }
    let sock = UdpSocket::bind(addr).map_err(|e| format!("cannot bind udp {addr}: {e}"))?;
    eprintln!("kshana live: listening on udp {addr}");
    let mut buf = vec![0u8; 65_536];
    // A sentence that a datagram boundary split is joined with its other half. A partial line is
    // held until the rest arrives; one that is followed by a datagram starting a new sentence
    // (`$` or `!`) is whole as it stands (no terminator was sent), and one that grows past
    // MAX_PARTIAL is let go.
    let mut partial: Vec<u8> = Vec::new();
    let mut dropped = 0u64;
    let send = |line: Vec<u8>, t: f64, dropped: &mut u64| -> bool {
        match tx.try_send(Msg::Line(line, t)) {
            Ok(()) => true,
            Err(mpsc::TrySendError::Full(_)) => {
                *dropped += 1;
                true
            }
            Err(mpsc::TrySendError::Disconnected(_)) => false,
        }
    };
    loop {
        let (n, _) = sock.recv_from(&mut buf).map_err(|e| e.to_string())?;
        let t = start.elapsed().as_secs_f64();
        let dg = &buf[..n];
        if !partial.is_empty() && matches!(dg.first(), Some(b'$') | Some(b'!')) {
            let whole = std::mem::take(&mut partial);
            if !send(whole, t, &mut dropped) {
                return Ok(());
            }
        }
        for piece in dg.split_inclusive(|b| *b == b'\n') {
            partial.extend_from_slice(piece);
            if partial.ends_with(b"\n") || partial.len() >= MAX_PARTIAL {
                let whole = std::mem::take(&mut partial);
                if !send(whole, t, &mut dropped) {
                    return Ok(());
                }
            }
        }
        if dropped > 0 {
            let _ = tx.try_send(Msg::Dropped(std::mem::take(&mut dropped)));
        }
    }
}

fn spawn_reader(src: Source, tx: Tx, start: Instant) {
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
        // A stream that was expected to go on and ended is a fault, not a normal end: a
        // supervisor should see it. Stdin and a file read to its end are normal ends.
        let expected_to_go_on = matches!(&src, Source::Tcp(_));
        let _ = tx.send(match r {
            Ok(()) if expected_to_go_on => Msg::Fail(
                "the tcp connection was closed by the peer (the layer does not reconnect: run it \
                 under a supervisor that restarts it)"
                    .into(),
            ),
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
    let mut listen: Option<String> = None;
    let mut tcp: Option<Broadcaster> = None;
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
                // Loopback unless an address is given, like --listen.
                source = Source::Udp(if v.contains(':') {
                    v
                } else {
                    format!("127.0.0.1:{v}")
                });
            }
            "--gate" => gate = true,
            "--replay" => replay = true,
            "--listen" => listen = Some(value("--listen")?),
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
    // A followed file starts as a replay of what is already in it; the host clock is engaged once
    // it has been read to its end, because from there on it grows in real time.
    let follows = matches!(&source, Source::File { follow: true, .. });
    engine.set_host_clock(!(replay || stored || follows));
    let mut udp_dropped = 0u64;

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
    if let Some(spec) = &listen {
        if !gate {
            return Err(usage("--listen serves the gated stream: add --gate".into()));
        }
        let addr = listen_addr(spec).map_err(&usage)?;
        let b = Broadcaster::new();
        b.listen(&addr).map_err(|e| (e, 2))?;
        tcp = Some(b.clone());
        stream = Sink::Tcp(b);
    }
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
    let (tx, rx) = mpsc::sync_channel(READ_QUEUE);
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
            Ok(Msg::CaughtUp) => engine.set_host_clock(!replay),
            Ok(Msg::Dropped(n)) => {
                udp_dropped += n;
                eprintln!("kshana live: dropped {n} udp datagram(s) the engine could not take ({udp_dropped} in all)");
            }
            Ok(Msg::End) | Err(RecvTimeoutError::Disconnected) => {
                emit(engine.finish())?;
                if let Some(b) = &tcp {
                    b.close();
                }
                return Ok(());
            }
            Ok(Msg::Fail(e)) => {
                emit(engine.finish())?;
                if let Some(b) = &tcp {
                    b.close();
                }
                return Err((e, 1));
            }
            Err(RecvTimeoutError::Timeout) => {
                emit(engine.idle(start.elapsed().as_secs_f64()))?;
            }
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_client_that_cannot_keep_up_is_dropped_without_blocking_the_others() {
        let b = Broadcaster::new();
        let (slow_tx, _slow_rx) = sync_channel(2); // never read
        let (fast_tx, fast_rx) = sync_channel(CLIENT_QUEUE);
        b.add(slow_tx);
        b.add(fast_tx);
        let mut dropped = 0;
        for i in 0..50u8 {
            dropped += b.send(vec![i]); // returns at once whatever the slow client does
        }
        assert_eq!(dropped, 1);
        let got: Vec<u8> = (0..50).map(|_| fast_rx.recv().unwrap()[0]).collect();
        assert_eq!(got, (0..50).collect::<Vec<u8>>());
        assert_eq!(b.clients.lock().unwrap().len(), 1);
    }

    #[test]
    fn listen_addresses() {
        assert_eq!(listen_addr("tcp:10110").unwrap(), "127.0.0.1:10110");
        assert_eq!(listen_addr("tcp:127.0.0.1:2000").unwrap(), "127.0.0.1:2000");
        assert!(listen_addr("udp:1").is_err());
    }
}
