// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS interference map built from openly licensed aircraft (ADS-B) and ship (AIS)
//! position reports, and a route-exposure summary on top of it.
//!
//! Everything here works on local files in the documented formats of
//! `docs/INTERFERENCE-MAP.md`; nothing opens a network connection. The methods are
//! aggregate-only: identifiers in the input (aircraft address, vessel number) are hashed
//! in memory with a per-run random salt for distinct-counting and are never stored,
//! logged or written, and a cell with fewer than [`PUBLICATION_MIN_DISTINCT`] distinct
//! aircraft or vessels is not published at all.
//!
//! The detection thresholds are pre-registered: they are constants of a named method
//! version ([`adsb::METHOD_ID`], `ais::METHOD_ID`), written into every output file, and
//! were fixed from the physics of the reported fields and from the privacy rule before any
//! data was examined. Changing one means a new method version.

pub mod adsb;
pub mod ais;
pub mod api;
pub mod cli;
pub mod grid;
pub mod land;
pub mod output;
pub mod route;
pub mod sources;
pub mod time;

/// A cell is published only when at least this many distinct aircraft or vessels were
/// observed in it that day, so no published value can single out one aircraft or vessel.
pub const PUBLICATION_MIN_DISTINCT: usize = 5;

/// Errors from reading inputs and writing outputs.
#[derive(Debug)]
pub enum MapError {
    /// Reading or writing a file failed; the message names the file.
    Io(String),
    /// An input or argument is malformed; the message says what to fix.
    Format(String),
}

impl std::fmt::Display for MapError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            MapError::Io(s) | MapError::Format(s) => f.write_str(s),
        }
    }
}

impl std::error::Error for MapError {}

/// Hashes identifiers for distinct-counting only. The salt is random per run and never
/// leaves this struct, so a hash cannot be reversed or matched across runs.
pub struct IdHasher {
    salt: [u8; 16],
}

impl Default for IdHasher {
    fn default() -> Self {
        Self::new()
    }
}

impl IdHasher {
    /// A hasher with a fresh random salt.
    pub fn new() -> Self {
        Self {
            salt: rand::random::<[u8; 16]>(),
        }
    }

    /// A fixed salt, for tests that need to be repeatable.
    pub fn with_salt(salt: [u8; 16]) -> Self {
        Self { salt }
    }

    /// Hash an identifier (trimmed, upper-cased) to a number used only for distinct-counting.
    pub fn hash(&self, id: &str) -> u64 {
        use sha2::{Digest, Sha256};
        let mut h = Sha256::new();
        h.update(self.salt);
        h.update(id.trim().to_ascii_uppercase().as_bytes());
        let d = h.finalize();
        let mut b = [0u8; 8];
        b.copy_from_slice(&d[..8]);
        u64::from_le_bytes(b)
    }
}

/// Column names of a CSV header row.
pub(crate) struct Header(Vec<String>);

impl Header {
    pub fn col(&self, name: &str) -> Option<usize> {
        self.0.iter().position(|h| h.eq_ignore_ascii_case(name))
    }

    pub fn require(&self, name: &str) -> Result<usize, MapError> {
        self.col(name)
            .ok_or_else(|| MapError::Format(format!("missing required column `{name}`")))
    }
}

/// Stream a documented CSV: a header row, comma-separated fields, no quoting. The header is
/// handed to `parse_header` once; every later non-blank line is split and given to `on_row`.
/// Only one line is held at a time, so memory does not depend on the input size.
pub(crate) fn stream_csv<R: std::io::BufRead, C>(
    mut reader: R,
    parse_header: impl FnOnce(&Header) -> Result<C, MapError>,
    mut on_row: impl FnMut(&C, &[&str]),
) -> Result<(), MapError> {
    let mut line = String::new();
    let mut cols: Option<C> = None;
    let mut parse_header = Some(parse_header);
    loop {
        line.clear();
        let n = reader
            .read_line(&mut line)
            .map_err(|e| MapError::Io(format!("cannot read input: {e}")))?;
        if n == 0 {
            break;
        }
        let text = line.trim();
        if text.is_empty() {
            continue;
        }
        match (&cols, parse_header.take()) {
            (None, Some(ph)) => {
                let header = Header(text.split(',').map(|h| h.trim().to_string()).collect());
                cols = Some(ph(&header)?);
            }
            (Some(c), _) => {
                let fields: Vec<&str> = text.split(',').map(str::trim).collect();
                on_row(c, &fields);
            }
            (None, None) => unreachable!("the header closure is taken only with the header"),
        }
    }
    if cols.is_none() {
        return Err(MapError::Format(
            "empty input: a header row is required".into(),
        ));
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn hasher_is_stable_within_a_run_and_case_insensitive() {
        let h = IdHasher::with_salt([7; 16]);
        assert_eq!(h.hash("abc123"), h.hash(" ABC123 "));
        assert_ne!(h.hash("abc123"), h.hash("abc124"));
        assert_ne!(
            h.hash("abc123"),
            IdHasher::with_salt([8; 16]).hash("abc123")
        );
    }

    #[test]
    fn csv_streams_rows_and_requires_a_header() {
        let run = |text: &str| {
            let mut rows = Vec::new();
            let r = stream_csv(
                text.as_bytes(),
                |h| {
                    assert_eq!(h.col("B"), Some(1));
                    assert!(h.require("c").is_err());
                    Ok(())
                },
                |_, f| rows.push(f.join("|")),
            );
            (r, rows)
        };
        assert!(stream_csv("".as_bytes(), |_| Ok(()), |_: &(), _| {}).is_err());
        let (r, rows) = run("a,b\r\n1,2\n\n 3 , 4 \n");
        assert!(r.is_ok());
        assert_eq!(rows, ["1|2", "3|4"]);
        let (r, rows) = run("\n\na,b\n5,6");
        assert!(r.is_ok() && rows == ["5|6"]);
    }
}
