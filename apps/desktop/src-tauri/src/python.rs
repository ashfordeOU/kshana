// SPDX-License-Identifier: AGPL-3.0-only
//! The Python console and notebook of the Desktop (0.42 U23): a Python session on this computer,
//! bound to the project folder, that runs the cells the page sends and answers with what they
//! printed, the value of a last expression, the traceback of an error and the matplotlib figures
//! they drew (as PNG).
//!
//! The app carries no Python. [`probe`] looks for an interpreter (the one the person names, else
//! `python3`, `python`, and on Windows `py -3`) and says whether the `kshana` package
//! (`pip install kshana`) imports there; the page says plainly when there is none. The session
//! is one interpreter process running a small driver (below) that reads one JSON request per line
//! on its standard input and writes one JSON answer per line, marked so that what a cell writes
//! to the process's own output is never taken for an answer. The cells share one namespace, as
//! in a notebook. A cell that runs past its time limit, or a press on Stop, ends the process
//! (its variables are lost) and the next cell starts a new one.
//!
//! The process starts in the project folder, with `KSHANA_PROJECT` set to it and matplotlib's
//! non-interactive backend (`MPLBACKEND=Agg`). Nothing is sent anywhere by the app; what a cell
//! does is the person's own code.

use std::io::{BufRead, BufReader, Write};
use std::process::{Child, ChildStdin, Command, Stdio};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::mpsc::{Receiver, RecvTimeoutError};
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant};

use serde_json::{json, Value};

/// The mark before every answer line of the driver.
const MARK: &str = "\u{1e}KSHANA-PY ";
/// The longest a cell may run unless the page asks for less (seconds).
pub const MAX_CELL_S: u64 = 3600;
/// The longest code a cell may send.
pub const MAX_CODE_BYTES: usize = 4 * 1024 * 1024;

/// The driver the interpreter runs: a read-eval loop over JSON lines, one namespace for every cell.
pub const DRIVER: &str = r#"
import sys, json, io, ast, time, base64, traceback, contextlib
MARK = "\x1eKSHANA-PY "
G = {"__name__": "__main__"}
CAP = 1 << 20
OUT = sys.stdout
def figures():
    plt = sys.modules.get("matplotlib.pyplot")
    if plt is None:
        return []
    out = []
    for n in plt.get_fignums():
        b = io.BytesIO()
        plt.figure(n).savefig(b, format="png", dpi=110, bbox_inches="tight")
        out.append(base64.b64encode(b.getvalue()).decode("ascii"))
    plt.close("all")
    return out
OUT.write(MARK + json.dumps({"ready": True, "python": sys.version.split()[0]}) + "\n"); OUT.flush()
for line in sys.stdin:
    try:
        req = json.loads(line)
    except Exception:
        continue
    o, e = io.StringIO(), io.StringIO()
    err, val, t0 = None, None, time.time()
    with contextlib.redirect_stdout(o), contextlib.redirect_stderr(e):
        try:
            tree = ast.parse(req.get("code", ""), "<cell>", "exec")
            last = None
            if tree.body and isinstance(tree.body[-1], ast.Expr):
                last = ast.Expression(tree.body.pop().value)
            exec(compile(tree, "<cell>", "exec"), G)
            if last is not None:
                v = eval(compile(last, "<cell>", "eval"), G)
                if v is not None:
                    val = repr(v)
        except SystemExit:
            err = "SystemExit: a cell cannot end the session"
        except BaseException:
            err = traceback.format_exc()
    try:
        images = figures()
    except Exception:
        images = []
    rep = {"id": req.get("id"), "stdout": o.getvalue()[-CAP:], "stderr": e.getvalue()[-CAP:], "error": err,
           "value": None if val is None else val[-CAP:], "images": images[:12], "ms": round((time.time() - t0) * 1000)}
    OUT.write(MARK + json.dumps(rep) + "\n"); OUT.flush()
"#;

/// What [`probe`] runs: the interpreter's version and path, and the kshana package's version.
const PROBE: &str = r#"
import sys, json
r = {"python": sys.version.split()[0], "executable": sys.executable, "kshana": None, "kshana_error": None}
try:
    import kshana
    v = getattr(kshana, "__version__", None)
    if v is None:
        try:
            from importlib.metadata import version
            v = version("kshana")
        except Exception:
            v = "unknown version"
    r["kshana"] = str(v)
except Exception as e:
    r["kshana_error"] = type(e).__name__ + ": " + str(e)
print(json.dumps(r))
"#;

/// The interpreters tried, in order: the person's own, else the usual names.
fn candidates(interpreter: Option<&str>) -> Vec<Vec<String>> {
    if let Some(p) = interpreter.map(str::trim).filter(|p| !p.is_empty()) {
        return vec![vec![p.to_string()]];
    }
    let mut v = vec![vec!["python3".to_string()], vec!["python".to_string()]];
    if cfg!(windows) {
        v.push(vec!["py".to_string(), "-3".to_string()]);
    }
    v
}

fn command(argv: &[String]) -> Command {
    let mut c = Command::new(&argv[0]);
    c.args(&argv[1..]);
    c.env("PYTHONIOENCODING", "utf-8")
        .env("PYTHONUNBUFFERED", "1")
        .env("MPLBACKEND", "Agg");
    c
}

/// The first interpreter that answers the probe: its command line and the probe's answer.
fn find(interpreter: Option<&str>) -> Result<(Vec<String>, Value), Vec<String>> {
    let mut tried = Vec::new();
    for argv in candidates(interpreter) {
        tried.push(argv.join(" "));
        let out = command(&argv)
            .args(["-c", PROBE])
            .stdin(Stdio::null())
            .output();
        let Ok(o) = out else { continue };
        if !o.status.success() {
            continue;
        }
        let text = String::from_utf8_lossy(&o.stdout);
        // An interpreter that printed no JSON (a Python 2, another program) is not used.
        if let Some(v) = text
            .lines()
            .rev()
            .find_map(|l| serde_json::from_str::<Value>(l.trim()).ok())
        {
            return Ok((argv, v));
        }
    }
    Err(tried)
}

/// Look for a Python interpreter and the kshana package in it: `{found, python, executable,
/// kshana, kshana_error, command}`, or `{found: false, tried}`.
pub fn probe(interpreter: Option<&str>) -> Value {
    match find(interpreter) {
        Ok((argv, mut v)) => {
            v["found"] = json!(true);
            v["command"] = json!(argv.join(" "));
            v
        }
        Err(tried) => json!({"found": false, "tried": tried}),
    }
}

struct Session {
    child: Mutex<Child>,
    stdin: Mutex<ChildStdin>,
    rx: Mutex<Receiver<String>>,
    seq: AtomicU64,
    python: String,
    command: String,
    cwd: String,
}

static CURRENT: Mutex<Option<Arc<Session>>> = Mutex::new(None);

fn start_session(interpreter: Option<&str>, cwd: Option<&str>) -> Result<Arc<Session>, String> {
    let (argv, p) = find(interpreter).map_err(|_| match interpreter {
        Some(i) if !i.trim().is_empty() => format!("{i}: no Python interpreter answers there"),
        _ => "no Python interpreter was found on this computer (python3, python)".to_string(),
    })?;
    let mut cmd = command(&argv);
    cmd.args(["-u", "-c", DRIVER])
        .stdin(Stdio::piped())
        .stdout(Stdio::piped())
        .stderr(Stdio::null());
    let dir = cwd
        .map(str::trim)
        .filter(|d| !d.is_empty() && std::path::Path::new(d).is_dir())
        .map(str::to_string);
    if let Some(d) = &dir {
        cmd.current_dir(d).env("KSHANA_PROJECT", d);
    }
    let mut child = cmd
        .spawn()
        .map_err(|e| format!("{}: {e}", argv.join(" ")))?;
    let stdin = child.stdin.take().ok_or("no input to the Python session")?;
    let stdout = child
        .stdout
        .take()
        .ok_or("no output from the Python session")?;
    let (tx, rx) = std::sync::mpsc::channel::<String>();
    std::thread::Builder::new()
        .name("kshana-python".into())
        .spawn(move || {
            for line in BufReader::new(stdout).lines() {
                let Ok(l) = line else { break };
                if let Some(a) = l.strip_prefix(MARK) {
                    if tx.send(a.to_string()).is_err() {
                        break;
                    }
                }
            }
        })
        .map_err(|e| e.to_string())?;
    let s = Arc::new(Session {
        child: Mutex::new(child),
        stdin: Mutex::new(stdin),
        rx: Mutex::new(rx),
        seq: AtomicU64::new(0),
        python: p["python"].as_str().unwrap_or("").to_string(),
        command: argv.join(" "),
        cwd: dir.unwrap_or_default(),
    });
    // the driver says it is ready before the first cell
    let ready =
        s.rx.lock()
            .unwrap_or_else(|e| e.into_inner())
            .recv_timeout(Duration::from_secs(20));
    if ready.is_err() {
        let _ = s.child.lock().unwrap_or_else(|e| e.into_inner()).kill();
        return Err("the Python session did not start".into());
    }
    Ok(s)
}

/// Run one cell (`code`) in the session, starting it when there is none (with `interpreter` and
/// the project folder `cwd`). `timeout_s` (at most [`MAX_CELL_S`]) ends the session when passed.
/// The answer is `{stdout, stderr, error, value, images, ms, python, session}`; a stopped or
/// timed-out session answers `{error, stopped: true}`.
pub fn exec(
    code: &str,
    interpreter: Option<&str>,
    cwd: Option<&str>,
    timeout_s: Option<u64>,
) -> Result<Value, String> {
    if code.len() > MAX_CODE_BYTES {
        return Err(format!(
            "the cell is longer than {} MiB",
            MAX_CODE_BYTES >> 20
        ));
    }
    let s = {
        let mut cur = CURRENT.lock().unwrap_or_else(|e| e.into_inner());
        let alive = cur.as_ref().is_some_and(|s| {
            s.child
                .lock()
                .unwrap_or_else(|e| e.into_inner())
                .try_wait()
                .is_ok_and(|st| st.is_none())
        });
        if !alive {
            *cur = Some(start_session(interpreter, cwd)?);
        }
        cur.clone().ok_or("no Python session")?
    };
    let id = s.seq.fetch_add(1, Ordering::Relaxed) + 1;
    {
        let mut w = s.stdin.lock().unwrap_or_else(|e| e.into_inner());
        let line = json!({"id": id, "code": code}).to_string();
        w.write_all(line.as_bytes())
            .and_then(|()| w.write_all(b"\n"))
            .and_then(|()| w.flush())
            .map_err(|e| format!("the Python session stopped: {e}"))?;
    }
    let limit = Duration::from_secs(timeout_s.unwrap_or(MAX_CELL_S).clamp(1, MAX_CELL_S));
    let t0 = Instant::now();
    let rx = s.rx.lock().unwrap_or_else(|e| e.into_inner());
    loop {
        match rx.recv_timeout(Duration::from_millis(200)) {
            Ok(a) => {
                let Ok(mut v) = serde_json::from_str::<Value>(&a) else {
                    continue;
                };
                if v["id"] != json!(id) {
                    continue;
                }
                v["python"] = json!(s.python);
                v["session"] = json!({"command": s.command, "cwd": s.cwd});
                return Ok(v);
            }
            Err(RecvTimeoutError::Timeout) if t0.elapsed() < limit => {}
            Err(RecvTimeoutError::Timeout) => {
                drop(rx);
                stop();
                return Ok(json!({
                    "error": format!("The cell ran longer than {} s: the Python session was stopped and its variables are gone.", limit.as_secs()),
                    "stopped": true,
                }));
            }
            Err(RecvTimeoutError::Disconnected) => {
                drop(rx);
                stop();
                return Ok(json!({
                    "error": "The Python session stopped (it was ended, or the interpreter exited); the next cell starts a new one.",
                    "stopped": true,
                }));
            }
        }
    }
}

/// Whether a session runs, with its interpreter and folder.
pub fn status() -> Value {
    let cur = CURRENT.lock().unwrap_or_else(|e| e.into_inner());
    match cur.as_ref() {
        Some(s) => json!({"running": true, "python": s.python, "command": s.command, "cwd": s.cwd}),
        None => json!({"running": false}),
    }
}

/// End the session (a cell that is running stops with it).
pub fn stop() -> Value {
    let old = CURRENT.lock().unwrap_or_else(|e| e.into_inner()).take();
    match old {
        Some(s) => {
            let mut c = s.child.lock().unwrap_or_else(|e| e.into_inner());
            let _ = c.kill();
            let _ = c.wait();
            json!({"stopped": true})
        }
        None => json!({"stopped": false}),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_named_interpreter_that_is_not_there_is_reported() {
        let p = probe(Some("/no/such/python-kshana-test"));
        assert_eq!(p["found"], false);
        assert_eq!(p["tried"][0], "/no/such/python-kshana-test");
        assert!(exec("1", Some("/no/such/python-kshana-test"), None, Some(5)).is_err());
        assert_eq!(
            candidates(Some("  ")).len(),
            if cfg!(windows) { 3 } else { 2 }
        );
    }

    // One test drives the single global session.
    #[test]
    fn cells_share_a_namespace_and_answer_output_values_errors_and_time_limits() {
        if probe(None)["found"] != true {
            eprintln!("no Python on this machine: the session test is skipped");
            return;
        }
        let dir = std::env::temp_dir();
        let a = exec("x = 21\nprint('hello')", None, dir.to_str(), Some(30)).unwrap();
        assert_eq!(a["stdout"], "hello\n");
        assert_eq!(a["error"], Value::Null);
        assert_eq!(a["value"], Value::Null);
        let b = exec("x * 2", None, None, Some(30)).unwrap();
        assert_eq!(b["value"], "42");
        let c = exec(
            "import os\nos.environ.get('KSHANA_PROJECT') is not None",
            None,
            None,
            Some(30),
        )
        .unwrap();
        assert_eq!(c["value"], "True");
        let d = exec("1/0", None, None, Some(30)).unwrap();
        assert!(d["error"].as_str().unwrap().contains("ZeroDivisionError"));
        // what a cell writes to the process's own output is not taken for an answer
        let e = exec(
            "import sys\nsys.__stdout__.write('{\"id\": 99}\\n'); sys.__stdout__.flush()\n'ok'",
            None,
            None,
            Some(30),
        )
        .unwrap();
        assert_eq!(e["value"], "'ok'");
        assert_eq!(status()["running"], true);
        let f = exec("import time\ntime.sleep(5)", None, None, Some(1)).unwrap();
        assert_eq!(f["stopped"], true);
        assert_eq!(status()["running"], false);
        // the next cell starts a new session: the variable is gone
        let g = exec("'x' in globals()", None, None, Some(30)).unwrap();
        assert_eq!(g["value"], "False");
        assert_eq!(stop()["stopped"], true);
        assert_eq!(stop()["stopped"], false);
    }
}
