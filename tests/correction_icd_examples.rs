// SPDX-License-Identifier: AGPL-3.0-only
//! Opt-in: the HAS decoder against the worked examples of the Galileo HAS SIS ICD, Issue 1.0.
//!
//! The ICD (published by the European Union at gsc-europa.eu) carries two text attachments:
//! Annex B, the Reed-Solomon generator matrix, and Annex D, two message decoding examples (the
//! first is also printed in Annex C). The ICD's terms restrict its reproduction, so this
//! repository stores none of it. To run this test, download the ICD yourself, extract the
//! attachments (for example `pdfdetach -saveall -o <dir> Galileo_HAS_SIS_ICD_v1.0.pdf`) and
//! point `KSHANA_HAS_ICD_DIR` at that directory:
//!
//! ```sh
//! KSHANA_HAS_ICD_DIR=<dir> cargo test --test correction_icd_examples -- --nocapture
//! ```
//!
//! Without the variable the test prints a note and passes. It checks: the generator matrix
//! computed by the decoder against Annex B, entry by entry; for both Annex D examples, the
//! message recovered from the received pages against the decoded message printed in hex; and
//! the decoded fields (header, mask, orbit, clock, code and phase biases) against the values
//! printed in Annex D, `null` where the annex prints the "data not available" code.

use kshana::corrections::{has, Frame};
use std::path::{Path, PathBuf};

fn find(dir: &Path, needle: &str) -> PathBuf {
    std::fs::read_dir(dir)
        .unwrap()
        .filter_map(|e| e.ok().map(|e| e.path()))
        .find(|p| p.file_name().unwrap().to_string_lossy().contains(needle))
        .unwrap_or_else(|| panic!("no file containing {needle} in {}", dir.display()))
}

fn text(p: &Path) -> String {
    String::from_utf8_lossy(&std::fs::read(p).unwrap()).into_owned()
}

/// Numbers in a bracketed list.
fn numbers(s: &str) -> Vec<u32> {
    s.split(|c: char| !c.is_ascii_digit())
        .filter(|t| !t.is_empty())
        .map(|t| t.parse().unwrap())
        .collect()
}

/// Lines `<numbers...> // <sat>` between two markers.
fn rows(t: &str, from: &str, to: &str) -> Vec<(String, Vec<f64>)> {
    let a = t.find(from).unwrap_or_else(|| panic!("no {from}"));
    let b = t[a..].find(to).map(|i| a + i).unwrap_or(t.len());
    let mut out = Vec::new();
    for line in t[a..b].lines() {
        let Some((vals, sat)) = line.split_once("//") else {
            continue;
        };
        let sat: String = sat.chars().filter(|c| c.is_ascii_alphanumeric()).collect();
        if sat.len() != 3
            || !(sat.starts_with('G') || sat.starts_with('E'))
            || !sat[1..].chars().all(|c| c.is_ascii_digit())
        {
            continue;
        }
        let v: Vec<f64> = vals
            .split(|c: char| !(c.is_ascii_digit() || c == '.' || c == '-'))
            .filter(|t| !t.is_empty())
            .map(|t| t.parse().unwrap())
            .collect();
        out.push((sat, v));
    }
    out
}

fn close(sentinel: f64, annex: f64, got: Option<f64>, what: &str) {
    if (annex - sentinel).abs() < 1e-9 {
        assert_eq!(got, None, "{what}: annex prints the not-available code");
    } else {
        let g = got.unwrap_or_else(|| panic!("{what}: decoded null, annex {annex}"));
        assert!((g - annex).abs() < 1e-6, "{what}: {g} != {annex}");
    }
}

/// A 448-bit HAS page (header and encoded page) as a frame.
fn page(mid: u8, ms: u8, pid: u8, octets: &[u32]) -> Frame {
    let h: u32 = (1 << 18) | (u32::from(mid) << 13) | (u32::from(ms - 1) << 8) | u32::from(pid);
    let mut bytes = vec![(h >> 16) as u8, (h >> 8) as u8, h as u8];
    bytes.extend(octets.iter().map(|o| *o as u8));
    Frame {
        bytes,
        nibbles: 112,
    }
}

#[test]
fn has_icd_annex_examples() {
    let Some(dir) = std::env::var_os("KSHANA_HAS_ICD_DIR") else {
        eprintln!("KSHANA_HAS_ICD_DIR not set: HAS ICD example check skipped");
        return;
    };
    let dir = PathBuf::from(dir);

    // Annex B: the generator matrix.
    let b = text(&find(&dir, "Annex_B"));
    let g = has::generator_matrix();
    let rows_b: Vec<Vec<u32>> = b
        .lines()
        .filter(|l| !l.trim().is_empty())
        .map(numbers)
        .collect();
    assert_eq!(rows_b.len(), 255);
    for (r, row) in rows_b.iter().enumerate() {
        let mine: Vec<u32> = g[r].iter().map(|x| u32::from(*x)).collect();
        assert_eq!(&mine, row, "generator matrix row {}", r + 1);
    }

    // Annex D: two examples, decoded in sequence (the second uses the first one's mask).
    let d = text(&find(&dir, "Annex_D"));
    let ex: Vec<&str> = d.split("HAS MESSAGE DECODING EXAMPLE").collect();
    let examples = [ex[1], ex[3]];
    let mut dec = has::Decoder::default();
    for (n, e) in examples.iter().enumerate() {
        let mut pages = Vec::new();
        for chunk in e.split("// PID").skip(1) {
            let pid = numbers(chunk.lines().nth(1).unwrap())[0] as u8;
            let a = chunk.find('[').unwrap();
            let z = chunk.find(']').unwrap();
            pages.push((pid, numbers(&chunk[a..z])));
        }
        let ms = pages.len() as u8;
        let hex_at = e.find("HEX REPRESENTATION").unwrap();
        let hx = &e[hex_at..];
        let hx = &hx[hx.find('[').unwrap() + 1..hx.find(']').unwrap()];
        let hx: String = hx.chars().filter(|c| c.is_ascii_hexdigit()).collect();
        // RS recovery against the printed message.
        let rx: Vec<(u8, [u8; has::OCTETS])> = pages
            .iter()
            .map(|(p, o)| {
                let mut a = [0u8; has::OCTETS];
                for (x, y) in a.iter_mut().zip(o) {
                    *x = *y as u8;
                }
                (*p, a)
            })
            .collect();
        let msg = has::rs_decode(&rx).expect("decodes");
        let got: String = msg.iter().flatten().map(|b| format!("{b:02x}")).collect();
        assert_eq!(got, hx, "example {} message", n + 1);
        for (pid, o) in &pages {
            dec.push_frame(&page(15 + n as u8, ms, *pid, o));
        }
        let m = dec.report.messages.last().unwrap().clone();
        assert_eq!(m.error, None, "example {}", n + 1);
        assert!(m.trailing_is_padding, "example {} padding", n + 1);
        let h = m.header.unwrap();
        let toh = numbers(&e[e.find("// TOH").unwrap()..])[0];
        assert_eq!(u32::from(h.toh), toh);
        let fl_at = e.find("PHASE_BIAS ]").unwrap();
        let flags = numbers(&e[fl_at + 12..fl_at + 60]);
        assert_eq!(
            flags[..6],
            [
                h.mask,
                h.orbit,
                h.clock_full,
                h.clock_subset,
                h.code_bias,
                h.phase_bias
            ]
            .map(u32::from)
        );
        if n == 0 {
            assert_eq!((h.mask_id, h.iod_set_id), (0, 11));
            let mask = m.mask.as_ref().unwrap();
            assert_eq!(mask.len(), 2);
            assert_eq!(mask[0].gnss_id, 0);
            assert_eq!(mask[1].gnss_id, 2);
            let orbit = rows(e, "=== ORBIT CORRECTIONS ===", "=== CODE BIASES ===");
            let ob = m.orbit.as_ref().unwrap();
            assert_eq!(ob.validity_index, 10);
            assert_eq!(orbit.len(), ob.sats.len());
            for ((sat, v), s) in orbit.iter().zip(&ob.sats) {
                assert_eq!(&s.sat, sat);
                assert_eq!(s.iod_ref, v[0] as u32, "{sat} IODref");
                close(-10.24, v[1], s.radial_m, &format!("{sat} radial"));
                close(-16.384, v[2], s.in_track_m, &format!("{sat} in-track"));
                close(
                    -16.384,
                    v[3],
                    s.cross_track_m,
                    &format!("{sat} cross-track"),
                );
            }
            let cb = rows(e, "=== CODE BIASES ===", "=== PHASE BIASES ===");
            let cbb = m.code_bias.as_ref().unwrap();
            assert_eq!(cbb.validity_index, 14);
            assert_eq!(cb.len(), cbb.sats.len());
            for ((sat, v), s) in cb.iter().zip(&cbb.sats) {
                assert_eq!(&s.sat, sat);
                assert_eq!(v.len(), s.biases.len(), "{sat} code bias count");
                for (a, b) in v.iter().zip(&s.biases) {
                    close(-20.48, *a, b.bias, &format!("{sat} code bias"));
                }
            }
            let pb = rows(e, "=== PHASE BIASES ===", "END MESSAGE BODY");
            let pbb = m.phase_bias.as_ref().unwrap();
            assert_eq!(pbb.validity_index, 5);
            for ((sat, v), s) in pb.iter().zip(&pbb.sats) {
                assert_eq!(&s.sat, sat);
                assert_eq!(v.len(), 2 * s.biases.len(), "{sat} phase bias count");
                for (pair, b) in v.chunks(2).zip(&s.biases) {
                    close(-10.24, pair[0], b.bias, &format!("{sat} phase bias"));
                    assert_eq!(b.pdi, Some(pair[1] as u8), "{sat} PDI");
                }
            }
        } else {
            let ck = m.clock_full.as_ref().unwrap();
            assert_eq!(ck.validity_index, 5);
            // The annex prints the 2-bit multiplier codes; the multiplier is code + 1.
            for (k, mult) in ck.multipliers.iter().enumerate() {
                let needle = format!("Delta Clock Multiplier (GNSS ID {})", k + 1);
                let at = e.find(&needle).unwrap() + needle.len();
                let code = numbers(&e[at..at + 24])[0];
                assert_eq!(u32::from(*mult), code + 1);
            }
            let cl = rows(e, "Delta Clock C0", "END MESSAGE BODY");
            assert_eq!(cl.len(), ck.sats.len());
            for ((sat, v), s) in cl.iter().zip(&ck.sats) {
                assert_eq!(&s.sat, sat);
                close(-10.24, v[0], s.dcc_m, &format!("{sat} DCC"));
            }
        }
    }
    eprintln!(
        "HAS ICD Annex B and D examples: {} messages checked",
        dec.report.messages.len()
    );
}
