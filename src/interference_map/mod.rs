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

/// Minimal CSV reader for the documented input formats: a header row, comma-separated
/// fields, no quoting. Returns the header names and a row iterator keyed by column index.
pub(crate) struct CsvTable<'a> {
    pub header: Vec<&'a str>,
    pub rows: Vec<Vec<&'a str>>,
}

impl<'a> CsvTable<'a> {
    pub fn parse(text: &'a str) -> Result<Self, MapError> {
        let mut lines = text.lines().filter(|l| !l.trim().is_empty());
        let header: Vec<&str> = lines
            .next()
            .ok_or_else(|| MapError::Format("empty input: a header row is required".into()))?
            .split(',')
            .map(str::trim)
            .collect();
        let rows = lines
            .map(|l| l.split(',').map(str::trim).collect())
            .collect();
        Ok(Self { header, rows })
    }

    pub fn col(&self, name: &str) -> Option<usize> {
        self.header
            .iter()
            .position(|h| h.eq_ignore_ascii_case(name))
    }

    pub fn require(&self, name: &str) -> Result<usize, MapError> {
        self.col(name)
            .ok_or_else(|| MapError::Format(format!("missing required column `{name}`")))
    }
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
    fn csv_requires_header_and_columns() {
        assert!(CsvTable::parse("").is_err());
        let t = CsvTable::parse("a,b\n1,2\n\n3,4\n").unwrap();
        assert_eq!(t.rows.len(), 2);
        assert_eq!(t.col("B"), Some(1));
        assert!(t.require("c").is_err());
    }
}
