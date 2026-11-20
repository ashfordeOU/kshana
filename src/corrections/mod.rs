// SPDX-License-Identifier: AGPL-3.0-only
//! Open decoders for broadcast precise-correction services, read-only.
//!
//! * [`has`]: Galileo High Accuracy Service on E6-B: C/NAV pages, the HAS page header, the
//!   high-parity vertical Reed-Solomon outer code and message type 1 (mask, orbit, clock
//!   full-set and subset, code and phase biases). Galileo HAS SIS ICD, Issue 1.0, May 2022.
//! * [`b2b`]: BeiDou-3 PPP-B2b messages 1 to 7 and 63 after channel decoding.
//!   BDS-SIS-ICD-PPP-B2b-1.0 (July 2020), section 6.
//! * [`l6`] and [`cssr`]: QZSS L6 messages: the L6 header, subframe assembly and the Compact
//!   SSR messages (message 4073, sub types 1 to 12) of CLAS (IS-QZSS-L6-008, section 4.1) and
//!   MADOCA-PPP (IS-QZSS-MDC-005, section 4.2), and the MADOCA-PPP wide-area ionospheric
//!   messages (IS-QZSS-MDC-005, section 6.3).
//!
//! Every decoder takes frames whose channel coding a receiver has already removed (the
//! Viterbi and de-interleaving of E6-B, the LDPC of B2b, the Reed-Solomon of L6) and reads
//! open-service data only. They report the fields with the scale factors of the interface
//! documents and mark "data not available" sentinels as `null`. They do not apply corrections
//! to a position solution.
//!
//! Test vectors: `data/conformance/corrections/*.json` (format `kshana.correction-vectors/1`,
//! `docs/CORRECTION-DECODERS.md`) are written by an independent encoder,
//! `data/conformance/corrections/gen_correction_vectors.py`, from the same interface
//! documents. They are self-derived round-trip vectors: a second implementation of our own
//! reading, not an external reference. The worked examples of the HAS ICD (Annexes B, C and D)
//! are checked by an opt-in test that reads a copy of the ICD's attachments the user downloads
//! (`tests/correction_icd_examples.rs`); no ICD content is stored in this repository.
//!
//! MODELLED: no live or recorded signal has been decoded here; the decoders are checked
//! against the vectors above and, for HAS, against the ICD's own worked examples.

pub mod b2b;
pub mod bits;
pub mod cssr;
pub mod has;
pub mod l6;
pub mod vectors;

use serde_json::Value;

/// The decoders the command line and the vectors name.
pub const DECODERS: &[&str] = &["has", "b2b", "l6"];

/// One frame of an input file: optional `key=value` tokens and the frame in hexadecimal.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Frame {
    /// The frame's bytes, most significant bit first.
    pub bytes: Vec<u8>,
    /// Number of hexadecimal digits given (bits = 4 x digits).
    pub nibbles: usize,
}

impl Frame {
    /// The frame as bits (`0`/`1` per element), `n` of them at most.
    pub fn bits(&self) -> Vec<u8> {
        let mut out = Vec::with_capacity(self.nibbles * 4);
        for i in 0..self.nibbles * 4 {
            out.push((self.bytes[i / 8] >> (7 - i % 8)) & 1);
        }
        out
    }
}

/// Parse a hexadecimal frame (spaces inside are allowed).
pub fn parse_hex(s: &str) -> Option<Frame> {
    let digits: Vec<u8> = s
        .chars()
        .filter(|c| !c.is_whitespace())
        .map(|c| c.to_digit(16).map(|d| d as u8))
        .collect::<Option<Vec<u8>>>()?;
    if digits.is_empty() {
        return None;
    }
    let mut bytes = vec![0u8; digits.len().div_ceil(2)];
    for (i, d) in digits.iter().enumerate() {
        bytes[i / 2] |= if i % 2 == 0 { d << 4 } else { *d };
    }
    Some(Frame {
        bytes,
        nibbles: digits.len(),
    })
}

/// Read a frame file: one frame per line in hexadecimal; blank lines and `#` comments are
/// skipped.
pub fn parse_frames(text: &str) -> Result<Vec<Frame>, String> {
    let mut out = Vec::new();
    for line in text.lines() {
        let l = line.split('#').next().unwrap_or("").trim();
        if l.is_empty() {
            continue;
        }
        out.push(parse_hex(l).ok_or_else(|| crate::terr!("e-corrections-bad-hex", line = l))?);
    }
    Ok(out)
}

/// Run a decoder over frames, giving its report as JSON.
pub fn decode(decoder: &str, frames: &[Frame]) -> Result<Value, String> {
    let v = match decoder {
        "has" => serde_json::to_value(has::decode_frames(frames)),
        "b2b" => serde_json::to_value(b2b::decode_frames(frames)),
        "l6" => serde_json::to_value(l6::decode_frames(frames)),
        _ => {
            return Err(crate::terr!(
                "e-corrections-unknown-decoder",
                decoder = decoder
            ))
        }
    };
    v.map_err(|e| e.to_string())
}

/// Satellite label: system letter and two-digit number.
pub(crate) fn label(letter: char, n: u32) -> String {
    format!("{letter}{n:02}")
}

/// `kshana corrections <decode|vectors> ...`. `Ok(false)` when a vector failed.
pub fn run_cli(args: &[String]) -> Result<bool, String> {
    match args.first().map(String::as_str) {
        Some("decode") => {
            let rest = &args[1..];
            let mut format = None;
            let mut path = None;
            let mut i = 0;
            while i < rest.len() {
                match rest[i].as_str() {
                    "--format" => {
                        format = rest.get(i + 1).cloned();
                        i += 2;
                    }
                    a if a.starts_with("--") => return Err(crate::t!("corrections-usage")),
                    a => {
                        path = Some(a.to_string());
                        i += 1;
                    }
                }
            }
            let (Some(format), Some(path)) = (format, path) else {
                return Err(crate::t!("corrections-usage"));
            };
            if !DECODERS.contains(&format.as_str()) {
                return Err(crate::terr!(
                    "e-corrections-unknown-decoder",
                    decoder = format
                ));
            }
            let text = if path == "-" {
                let mut s = String::new();
                std::io::Read::read_to_string(&mut std::io::stdin(), &mut s)
                    .map_err(|e| format!("{path}: {e}"))?;
                s
            } else {
                std::fs::read_to_string(&path).map_err(|e| format!("{path}: {e}"))?
            };
            let frames = parse_frames(&text)?;
            let report = decode(&format, &frames)?;
            println!(
                "{}",
                serde_json::to_string_pretty(&report).map_err(|e| e.to_string())?
            );
            Ok(true)
        }
        Some("vectors") => vectors::run_cli(&args[1..]),
        Some("--help") | Some("-h") => {
            println!("{}", crate::t!("corrections-usage"));
            Ok(true)
        }
        _ => Err(crate::t!("corrections-usage")),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn hex_frames_parse_with_comments_and_odd_lengths() {
        let f = parse_frames("# c\nAB c\n\n0f # tail\n").unwrap();
        assert_eq!(f.len(), 2);
        assert_eq!(f[0].bytes, vec![0xAB, 0xC0]);
        assert_eq!(f[0].nibbles, 3);
        assert_eq!(f[0].bits(), vec![1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0]);
        assert!(parse_frames("zz").is_err());
    }

    #[test]
    fn unknown_decoder_is_refused() {
        assert!(decode("nope", &[]).is_err());
    }
}
