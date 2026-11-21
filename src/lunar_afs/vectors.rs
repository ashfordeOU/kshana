// SPDX-License-Identifier: AGPL-3.0-only
//! Bit-true verification vectors for an AFS receiver: `data/conformance/lunar-afs/`, format
//! `kshana.afs-vectors/1`, and a runner that checks this crate's generator against them.
//!
//! The vectors were computed by an independent generator
//! (`data/conformance/lunar-afs/gen_afs_vectors.py`, Python standard library only) from the
//! IS-GPS-800J Weil indices and the LSIS V1.0 construction, not by kshana: for every AFS-Q primary
//! PRN 1 to 210 the length, the number of ones, the first and last 24 chips in octal and the
//! SHA-256 of the whole code; the four secondary codes; CRC-24Q of four byte strings; and the one
//! SB1 codeword the standard prints (Figure 8). A receiver team can run the same file against its
//! own code generator: each vector is an operation, an input and an expected object.
//!
//! The vectors also agree with the published tables `kshana lunanet-afs-check spec` checks (bar B3:
//! the first and last 24 chips of all 210 PRNs; B5; B6; B7): `tests` compares every AFS-Q vector
//! with those printed values. AFS-I codes, the tertiary codes and LDPC coding need the LSIS
//! attachments ([`super::lsis`]) and are not in this file.

use super::codes::{afs_q_primary, afs_q_secondary};
use super::frame::{crc24_bytes, encode_sb1};
use serde::Serialize;
use serde_json::Value;

/// The format tag.
pub const FORMAT: &str = "kshana.afs-vectors/1";
/// The shipped vectors.
pub const BUILTIN: &str = include_str!("../../data/conformance/lunar-afs/afs-q-vectors.json");

/// One vector's outcome.
#[derive(Clone, Debug, Serialize)]
pub struct Outcome {
    /// Operation.
    pub op: String,
    /// Input.
    pub input: Value,
    /// Whether it passed.
    pub pass: bool,
    /// What was computed, when it failed.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub got: Option<Value>,
}

/// The run report.
#[derive(Clone, Debug, Serialize)]
pub struct Report {
    /// Document schema.
    pub schema: &'static str,
    /// Vectors run.
    pub vectors: usize,
    /// Passed.
    pub passed: usize,
    /// The failures (all of them; the passes are counted).
    pub failures: Vec<Outcome>,
}

fn octal(bits: &[u8]) -> String {
    let v = bits.iter().fold(0u64, |a, &b| (a << 1) | u64::from(b));
    format!("{v:08o}")
}

fn unhex(s: &str) -> Option<Vec<u8>> {
    if !s.len().is_multiple_of(2) {
        return None;
    }
    (0..s.len())
        .step_by(2)
        .map(|i| u8::from_str_radix(s.get(i..i + 2)?, 16).ok())
        .collect()
}

fn compute(op: &str, input: &Value) -> Option<Value> {
    match op {
        "afs_q_primary" => {
            let c = afs_q_primary(u16::try_from(input["prn"].as_u64()?).ok()?).ok()?;
            Some(serde_json::json!({
                "length": c.len(),
                "ones": c.iter().map(|&b| usize::from(b)).sum::<usize>(),
                "first_24_octal": octal(&c[..24]),
                "last_24_octal": octal(&c[c.len() - 24..]),
                "sha256": crate::advanced_report::sha256_hex(&c),
            }))
        }
        "afs_q_secondary" => {
            let c = afs_q_secondary(u8::try_from(input["id"].as_u64()?).ok()?).ok()?;
            Some(serde_json::json!({ "chips": c }))
        }
        "crc24q" => {
            let b = unhex(input["hex"].as_str()?)?;
            Some(serde_json::json!({ "crc": format!("{:06x}", crc24_bytes(&b)) }))
        }
        "sb1_encode" => {
            let bits = encode_sb1(
                u8::try_from(input["fid"].as_u64()?).ok()?,
                u8::try_from(input["toi"].as_u64()?).ok()?,
            )
            .ok()?;
            let v = bits.iter().fold(0u64, |a, &b| (a << 1) | u64::from(b));
            Some(serde_json::json!({ "codeword_hex": format!("{v:013X}") }))
        }
        _ => None,
    }
}

/// Run a vector file's text.
pub fn run(text: &str) -> Result<Report, String> {
    let doc: Value = serde_json::from_str(text)
        .map_err(|e| crate::terr!("e-lunar-afs-kit-bad-vectors", e = e))?;
    if doc["format"] != FORMAT {
        return Err(crate::terr!("e-lunar-afs-kit-bad-vectors", e = FORMAT));
    }
    let mut n = 0;
    let mut failures = Vec::new();
    for v in doc["vectors"].as_array().into_iter().flatten() {
        n += 1;
        let op = v["op"].as_str().unwrap_or_default();
        let got = compute(op, &v["input"]);
        let pass = got.as_ref() == Some(&v["expected"]);
        if !pass {
            failures.push(Outcome {
                op: op.to_string(),
                input: v["input"].clone(),
                pass,
                got,
            });
        }
    }
    Ok(Report {
        schema: "kshana.afs-vectors-run/1",
        vectors: n,
        passed: n - failures.len(),
        failures,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_builtin_vector_passes() {
        let r = run(BUILTIN).unwrap();
        assert_eq!(r.vectors, 210 + 4 + 4 + 1);
        assert!(r.failures.is_empty(), "{:?}", r.failures);
    }

    #[test]
    fn the_vectors_agree_with_the_tables_lunanet_afs_check_spec_checks() {
        // Bar B3 of `kshana lunanet-afs-check spec`: the printed first and last 24 chips.
        let doc: Value = serde_json::from_str(BUILTIN).unwrap();
        let printed = &crate::iq::signals::lunanet_oracle::AFS_Q_PRINTED;
        let mut n = 0;
        for v in doc["vectors"].as_array().unwrap() {
            if v["op"] != "afs_q_primary" {
                continue;
            }
            let prn = v["input"]["prn"].as_u64().unwrap() as usize;
            let e = &v["expected"];
            let f = u32::from_str_radix(e["first_24_octal"].as_str().unwrap(), 8).unwrap();
            let l = u32::from_str_radix(e["last_24_octal"].as_str().unwrap(), 8).unwrap();
            assert_eq!((f, l), printed[prn - 1], "PRN {prn}");
            n += 1;
        }
        assert_eq!(n, 210);
        // Bars B5, B6 and B7 are the secondary, SB1 and CRC vectors; the spec check meets them.
        let spec = crate::iq::lunanet_afs::check_spec();
        for bar in spec["bars"].as_array().unwrap() {
            if ["B3", "B5", "B6", "B7"].contains(&bar["bar"].as_str().unwrap()) {
                assert_eq!(bar["status"], "MET", "{bar}");
            }
        }
    }

    #[test]
    fn a_wrong_expectation_is_a_failure() {
        let t = BUILTIN.replacen("\"cde703\"", "\"cde704\"", 1);
        let r = run(&t).unwrap();
        assert_eq!(r.failures.len(), 1);
        assert_eq!(r.failures[0].op, "crc24q");
        assert!(run("{}").is_err());
    }
}
