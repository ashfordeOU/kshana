// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana corrections qznma-verify`: check QZNMA signatures against navigation messages.
//!
//! Inputs: L6E QZNMA frames (the GPS and Galileo RDS, [`super::qznma`]), a navigation-message
//! file, and public keys. The navigation file has one message per line,
//! `<satellite> <signal> <part> <hex>`, with `#` comments: the satellite label as the RDS
//! reports it (`G05`, `E12`; for QZSS any label, one per satellite), a signal name of
//! [`Signal::name`], the part (subframe, message type, word type or page type; see
//! [`Signal::part_index`] and, for the QZSS DSS, [`Signal::dss_part`]) and the bits in
//! hexadecimal, most significant first, as the receiver decoded them (LNAV with parity, CNAV and
//! CNAV2 with CRC, F/NAV with CRC and tail; trailing pad bits are ignored).
//!
//! For each signature the newest messages of each part are tried first, and up to
//! [`MAX_COMBINATIONS`] combinations of the stored messages; a signature verifies when one of
//! them does. QZSS signatures are rebuilt from the three DSS of one satellite and checked
//! against that satellite's own messages (that a DSS signs the transmitting satellite's
//! messages is our reading of SAS-001 5.1.11, to confirm). Public keys are DER files (SAS-001
//! 7.3.3) whose file name holds the key ID (`001.der` is key 1), or `ID:path`.
//!
//! Every result is MODELLED: QZSS-generated test data are not public (SAS-001 Appendix A).

use super::qznma::{self, public_key_from_der};
use super::qznma_nav::{self as nav, QzssSignature, Signal};
use crate::osnma::signature::PublicKey;
use serde::Serialize;
use std::collections::{BTreeMap, HashMap};

/// Most combinations of stored messages tried for one signature.
pub const MAX_COMBINATIONS: usize = 64;

/// Navigation messages by satellite, signal and part identifier, in file order.
#[derive(Default, Debug)]
pub struct NavStore {
    msgs: BTreeMap<(String, Signal, u16), Vec<Vec<u8>>>,
    /// QZSS DSS-carrying messages in file order: (satellite, signal, bits).
    dss: Vec<(String, Signal, Vec<u8>)>,
}

impl NavStore {
    /// Parse a navigation-message file.
    pub fn parse(text: &str) -> Result<Self, String> {
        let mut s = Self::default();
        for line in text.lines() {
            let l = line.split('#').next().unwrap_or("").trim();
            if l.is_empty() {
                continue;
            }
            let bad = || crate::terr!("e-qznma-bad-nav-line", line = l);
            let mut it = l.split_whitespace();
            let (Some(sat), Some(sig), Some(part), Some(hex), None) =
                (it.next(), it.next(), it.next(), it.next(), it.next())
            else {
                return Err(bad());
            };
            let sig = Signal::from_name(sig).ok_or_else(bad)?;
            let part: u16 = part.parse().map_err(|_| bad())?;
            let bits = super::parse_hex(hex).ok_or_else(bad)?.bits();
            if sig.dss_part() == Some(part) {
                s.dss.push((sat.to_string(), sig, bits));
            } else if sig.part_index(part).is_some() {
                s.msgs
                    .entry((sat.to_string(), sig, part))
                    .or_default()
                    .push(bits);
            } else {
                return Err(bad());
            }
        }
        Ok(s)
    }

    /// Candidate messages for each part of `sig` from `sat`, newest first.
    fn candidates(&self, sat: &str, sig: Signal) -> Vec<Vec<&[u8]>> {
        let mut by_part: Vec<Vec<&[u8]>> = vec![Vec::new(); sig.part_bits().len()];
        for ((s, g, id), list) in &self.msgs {
            if s == sat && *g == sig {
                if let Some(i) = sig.part_index(*id) {
                    by_part[i].extend(list.iter().rev().map(Vec::as_slice));
                }
            }
        }
        by_part
    }
}

/// Public keys by key ID.
pub type Keys = HashMap<u8, PublicKey>;

/// Read a key argument: `ID:path`, or a path whose file name holds the key ID.
pub fn load_key(arg: &str) -> Result<PublicKey, String> {
    let bad = || crate::terr!("e-qznma-bad-key", path = arg);
    let (id, path) = match arg.split_once(':') {
        Some((id, p)) if id.chars().all(|c| c.is_ascii_digit()) && !id.is_empty() => {
            (id.parse::<u8>().map_err(|_| bad())?, p)
        }
        _ => {
            let stem = std::path::Path::new(arg)
                .file_stem()
                .and_then(|s| s.to_str())
                .unwrap_or("");
            let digits: String = stem
                .chars()
                .rev()
                .take_while(|c| c.is_ascii_digit())
                .collect::<Vec<_>>()
                .into_iter()
                .rev()
                .collect();
            (digits.parse::<u8>().map_err(|_| bad())?, arg)
        }
    };
    let der = std::fs::read(path).map_err(|e| format!("{path}: {e}"))?;
    public_key_from_der(&der, id).ok_or_else(bad)
}

/// The outcome of one signature.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum Status {
    Verified,
    Failed,
    NoKey,
    /// The navigation messages it signs are not in the file.
    NoNavigation,
}

/// One checked signature.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Check {
    /// `l6e` for an RDS in a QZNMA frame, `qzss_dss` for a QZSS signal's own DSS.
    pub source: &'static str,
    /// Frame index and RDS slot (0 or 1) of an L6E RDS.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub frame: Option<usize>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub slot: Option<usize>,
    pub sat: Option<String>,
    pub signal: Option<Signal>,
    pub key_id: u8,
    pub status: Status,
    /// Combinations of navigation messages tried.
    pub tried: usize,
}

/// The verification report.
#[derive(Clone, Debug, PartialEq, Serialize, Default)]
pub struct Report {
    pub label: &'static str,
    pub checks: Vec<Check>,
    pub verified: usize,
    pub failed: usize,
    pub no_key: usize,
    pub no_navigation: usize,
}

/// Every combination (one candidate per part), newest first, at most `MAX_COMBINATIONS`.
fn combinations<'a>(cands: &[Vec<&'a [u8]>]) -> Vec<Vec<&'a [u8]>> {
    let mut out: Vec<Vec<&[u8]>> = vec![Vec::new()];
    for c in cands {
        let mut next = Vec::new();
        for prefix in &out {
            for m in c {
                if next.len() >= MAX_COMBINATIONS {
                    break;
                }
                let mut p = prefix.clone();
                p.push(*m);
                next.push(p);
            }
        }
        out = next;
    }
    out
}

/// Try `rand_of` over the combinations; the status and the number tried.
fn try_all(
    cands: &[Vec<&[u8]>],
    key: Option<&PublicKey>,
    signature: &str,
    rand_of: impl Fn(&[&[u8]]) -> Option<Vec<u8>>,
) -> (Status, usize) {
    if cands.iter().any(Vec::is_empty) {
        return (Status::NoNavigation, 0);
    }
    let Some(key) = key else {
        return (Status::NoKey, 0);
    };
    let combos = combinations(cands);
    for (k, parts) in combos.iter().enumerate() {
        if let Some(rand) = rand_of(parts) {
            if nav::verify(&rand, signature, key).is_ok() {
                return (Status::Verified, k + 1);
            }
        }
    }
    (Status::Failed, combos.len())
}

/// Check every signature of the QZNMA frames and of the QZSS DSS in the navigation file.
pub fn run(frames: &[super::Frame], store: &NavStore, keys: &Keys) -> Report {
    let mut rep = Report {
        label: "MODELLED",
        ..Default::default()
    };
    let decoded = qznma::decode_frames(frames);
    for f in &decoded.messages {
        for (slot, rds) in f.rds.iter().enumerate() {
            let Some(rds) = rds.as_ref().filter(|r| r.used) else {
                continue;
            };
            let sig = nav::Signal::from_message_type(rds.message_type);
            let (status, tried) = match (sig, rds.sat.as_deref()) {
                (Some(sig), Some(sat)) => try_all(
                    &store.candidates(sat, sig),
                    keys.get(&(rds.key_id & 0x7F)),
                    &rds.signature,
                    |p| nav::gnss_rand(rds, p),
                ),
                _ => (Status::NoNavigation, 0),
            };
            rep.checks.push(Check {
                source: "l6e",
                frame: Some(f.index),
                slot: Some(slot),
                sat: rds.sat.clone(),
                signal: sig,
                key_id: rds.key_id,
                status,
                tried,
            });
        }
    }
    // QZSS: three segments of one satellite and signal make a signature.
    let mut pending: HashMap<(String, Signal), [Option<Vec<u8>>; 3]> = HashMap::new();
    for (sat, sig, bits) in &store.dss {
        let Some((id, seg)) = nav::qzss_dss(*sig, bits) else {
            continue;
        };
        let slots = pending.entry((sat.clone(), *sig)).or_default();
        slots[usize::from(id) - 1] = Some(seg);
        if slots.iter().all(Option::is_some) {
            let segs: Vec<Vec<u8>> = slots
                .iter_mut()
                .map(|s| s.take().unwrap_or_default())
                .collect();
            let Some(q): Option<QzssSignature> =
                nav::qzss_signature(*sig, [&segs[0], &segs[1], &segs[2]])
            else {
                continue;
            };
            let (status, tried) = try_all(
                &store.candidates(sat, *sig),
                keys.get(&(q.key_id & 0x7F)),
                &q.signature,
                |p| nav::qzss_rand(&q, p),
            );
            rep.checks.push(Check {
                source: "qzss_dss",
                frame: None,
                slot: None,
                sat: Some(sat.clone()),
                signal: Some(*sig),
                key_id: q.key_id,
                status,
                tried,
            });
        }
    }
    for c in &rep.checks {
        match c.status {
            Status::Verified => rep.verified += 1,
            Status::Failed => rep.failed += 1,
            Status::NoKey => rep.no_key += 1,
            Status::NoNavigation => rep.no_navigation += 1,
        }
    }
    rep
}

fn read(path: &str) -> Result<String, String> {
    if path == "-" {
        let mut s = String::new();
        std::io::Read::read_to_string(&mut std::io::stdin(), &mut s)
            .map_err(|e| format!("{path}: {e}"))?;
        Ok(s)
    } else {
        std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))
    }
}

/// `kshana corrections qznma-verify [--frames <file>] [--nav <file>] --pubkey <key> ...`.
/// Prints the JSON report; `Ok(false)` when a signature failed.
pub fn run_cli(args: &[String]) -> Result<bool, String> {
    let (mut frames, mut nav_path, mut keys) = (None, None, Keys::new());
    let mut i = 0;
    while i < args.len() {
        let value = args
            .get(i + 1)
            .ok_or_else(|| crate::t!("corrections-usage"))?;
        match args[i].as_str() {
            "--frames" => frames = Some(value.clone()),
            "--nav" => nav_path = Some(value.clone()),
            "--pubkey" => {
                let k = load_key(value)?;
                keys.insert(k.pkid & 0x7F, k);
            }
            _ => return Err(crate::t!("corrections-usage")),
        }
        i += 2;
    }
    if frames.is_none() && nav_path.is_none() {
        return Err(crate::t!("corrections-usage"));
    }
    let frames = match frames {
        Some(p) => super::parse_frames(&read(&p)?)?,
        None => Vec::new(),
    };
    let store = match nav_path {
        Some(p) => NavStore::parse(&read(&p)?)?,
        None => NavStore::default(),
    };
    let rep = run(&frames, &store, &keys);
    println!(
        "{}",
        serde_json::to_string_pretty(&rep).map_err(|e| e.to_string())?
    );
    eprintln!(
        "{}",
        crate::t!(
            "qznma-verify-summary",
            n = rep.checks.len(),
            verified = rep.verified,
            failed = rep.failed,
            no_key = rep.no_key,
            no_navigation = rep.no_navigation
        )
    );
    Ok(rep.failed == 0)
}
