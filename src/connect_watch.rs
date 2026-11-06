// SPDX-License-Identifier: AGPL-3.0-only
//! Live ingest from a directory (roadmap A3a): follow the files a logger writes or rotates into a
//! directory and turn new rows into `kshana.obs/1` records with a Kshana Connect mapping.
//!
//! Each [`step`] reads every file whose name ends with the chosen suffix, in name order (loggers that
//! rotate by date or sequence number sort correctly), up to its last complete line, and reads them as
//! one continuous log: a later file's comment lines and header row are dropped (CSV, TSV). So an epoch
//! whose rows are split by a rotation is one epoch, and every `t_s` counts from the first epoch of the
//! directory. Only epochs not emitted before are returned. Files must be in time order by name; an
//! earlier row after a later one is the mapping's time-order error. A single JSON document is not a
//! growing log and is refused; use `jsonl`.
//!
//! The last epoch is held back until more rows arrive after it, because rows of that epoch may still
//! be written. [`flush`] releases it, for the end of a run.
//!
//! Cost: the directory is re-read and re-mapped on each step, so move processed files out of the watched
//! directory from time to time (or point the watch at the current day's folder). This is a polling watch with no operating-system file events, so it behaves
//! the same on every platform and on network file systems.
use crate::connect::{has_rows, map, Mapping};
use crate::obs::{Record, Station};
use std::path::{Path, PathBuf};

/// What the watch remembers between steps.
#[derive(Clone, Debug, Default)]
pub struct WatchState {
    /// Epochs emitted so far.
    pub emitted: usize,
    /// Whether the header record was emitted.
    pub header_sent: bool,
}

fn files(dir: &Path, suffix: &str) -> Result<Vec<PathBuf>, String> {
    let rd = std::fs::read_dir(dir).map_err(|e| format!("{}: {e}", dir.display()))?;
    let mut v: Vec<PathBuf> = rd
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| {
            p.is_file()
                && p.file_name()
                    .is_some_and(|n| n.to_string_lossy().ends_with(suffix))
        })
        .collect();
    v.sort();
    Ok(v)
}

/// The data lines of a later file: its comment lines, skipped lines and header row removed (CSV, TSV),
/// so the directory reads as one continuous log.
fn body_lines<'a>(mapping: &Mapping, text: &'a str) -> Vec<&'a str> {
    let csv = matches!(mapping.source.format.as_str(), "csv" | "tsv");
    let comment = mapping.source.comment.as_deref().filter(|c| !c.is_empty());
    let mut header_seen = !csv;
    text.lines()
        .skip(if csv { mapping.source.skip_lines } else { 0 })
        .filter(|l| {
            if l.trim().is_empty() || comment.is_some_and(|c| l.starts_with(c)) {
                return false;
            }
            if !header_seen {
                header_seen = true;
                return false;
            }
            true
        })
        .collect()
}

fn run(
    dir: &Path,
    suffix: &str,
    mapping: &Mapping,
    station: &Station,
    st: &mut WatchState,
    flush: bool,
) -> Result<Vec<Record>, String> {
    if mapping.source.format == "json" {
        return Err(crate::terr!("e-connect-watch-json"));
    }
    let mut text = String::new();
    for (k, f) in files(dir, suffix)?.iter().enumerate() {
        let raw = std::fs::read(f).map_err(|e| format!("{}: {e}", f.display()))?;
        let Some(end) = raw.iter().rposition(|&b| b == b'\n') else {
            continue;
        };
        let part = String::from_utf8_lossy(&raw[..=end]);
        if k == 0 || text.is_empty() {
            text.push_str(&part);
        } else {
            for l in body_lines(mapping, &part) {
                text.push_str(l);
                text.push('\n');
            }
        }
    }
    if text.is_empty() || !has_rows(mapping, &text)? {
        return Ok(Vec::new());
    }
    let mut it = map(mapping, &text, station)?.into_iter();
    let Some(Record::Header(h)) = it.next() else {
        return Ok(Vec::new());
    };
    let epochs: Vec<_> = it
        .filter_map(|r| match r {
            Record::Epoch(e) => Some(e),
            _ => None,
        })
        .collect();
    let ready = if flush {
        epochs.len()
    } else {
        epochs.len().saturating_sub(1)
    };
    let mut out = Vec::new();
    if ready > st.emitted && !st.header_sent {
        let mut h = h;
        h.source_format = Some(format!("connect-watch:{}", mapping.source.format));
        out.push(Record::Header(h));
        st.header_sent = true;
    }
    out.extend(
        epochs
            .into_iter()
            .take(ready)
            .skip(st.emitted)
            .map(Record::Epoch),
    );
    st.emitted = st.emitted.max(ready);
    Ok(out)
}

/// One polling step: the records that became complete since the last step.
pub fn step(
    dir: &Path,
    suffix: &str,
    mapping: &Mapping,
    station: &Station,
    st: &mut WatchState,
) -> Result<Vec<Record>, String> {
    run(dir, suffix, mapping, station, st, false)
}

/// Release the epochs held back at the end of each file (for the end of a run).
pub fn flush(
    dir: &Path,
    suffix: &str,
    mapping: &Mapping,
    station: &Station,
    st: &mut WatchState,
) -> Result<Vec<Record>, String> {
    run(dir, suffix, mapping, station, st, true)
}
