// SPDX-License-Identifier: AGPL-3.0-only
//! OSNMA scenario files and the open reference-model runner (`kshana osnma scenario`).
//!
//! A scenario (`kshana.osnma-scenario/1`, JSON) states a synthetic OSNMA stream (the chain's
//! hash and MAC functions, how many sub-frames, the order the satellites arrive in), the
//! changes made to it (flipped navigation or key bits, replayed tags, shifted time labels,
//! dropped pages, broken CRCs), an optional reference time, and what the verifier is
//! expected to conclude. The runner builds the stream with the reference model below, feeds
//! it to [`super::verifier::Verifier`] and reports what the verifier concluded beside each
//! stated expectation.
//!
//! The reference model: satellite E02 transmits OSNMA with MAC look-up table entry 34
//! (40-bit tags, 128-bit keys, one sub-frame per key); satellite E05 does not transmit
//! OSNMA and is authenticated by E02's cross-authentication tags (ADKD 0). E02's own data
//! is covered by ADKD 4 and the slow MAC (ADKD 12). The TESLA chain is a test chain built
//! from a seed, handed to the verifier as already trusted, so no DSM-KROOT signature,
//! Merkle tree or public key is involved. Navigation words are filler derived from a hash,
//! not ephemerides. Layouts follow the Galileo OSNMA SIS ICD Issue 1.1 (sections 3 and 4)
//! and the Receiver Guidelines Issue 1.3 as read in `docs/OSNMA.md`; the stream is written
//! out separately from the verifier's parser but is our own reading of the documents, so
//! a run shows the verifier's behaviour on the scenario, not conformance.
//!
//! Nothing here transmits, and the keys are test keys that no Galileo receiver trusts. The
//! runner keeps the stream in memory and writes only the report.

use super::bits::{read_bits, BitWriter};
use super::mac;
use super::tables::{HashFn, MacFn};
use super::tesla;
use super::verifier::{Chain, Config, Event, TagStatus, Verifier};
use super::{InavPage, OsnmaStatus, WEEK_S};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;

/// Format tag of a scenario file.
pub const FORMAT: &str = "kshana.osnma-scenario/1";
/// Format tag of a run report.
pub const REPORT_FORMAT: &str = "kshana.osnma-scenario-run/1";
/// Largest number of sub-frames a scenario may ask for (one hour).
pub const MAX_SUBFRAMES: u32 = 120;

const WN: u32 = 1248;
/// Start of the stream and time of applicability of the chain (hour aligned).
pub const GST0: u32 = WN * WEEK_S + 345_600;
const ALPHA: [u8; 6] = [0x11, 0x22, 0x33, 0x44, 0x55, 0x66];
const KEY_BITS: usize = 128;
const TAG_BITS: usize = 40;
/// Satellite that transmits OSNMA.
pub const PRN_A: u8 = 2;
/// Satellite authenticated only by cross-authentication.
pub const PRN_X: u8 = 5;
const PKID: u8 = 1;
/// First byte of the TESLA key in a MACK (after Tag0, MACSEQ, COP and five tags).
const KEY_BYTE: usize = 42;

// ------------------------------------------------------------------ the file format ---

/// A scenario file.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Scenario {
    /// Must be [`FORMAT`].
    pub format: String,
    /// Short name, printed in the report.
    pub name: String,
    /// Free text.
    #[serde(default)]
    pub description: String,
    /// The TESLA chain of the stream.
    #[serde(default)]
    pub chain: ChainSpec,
    /// Number of 30-second sub-frames, 1 to [`MAX_SUBFRAMES`].
    pub subframes: u32,
    /// Which satellite's pages of a sub-frame reach the verifier first.
    #[serde(default)]
    pub order: Order,
    /// An independent present time, as the verifier's `--reference-time`.
    #[serde(default)]
    pub reference_time: Option<ReferenceTime>,
    /// Changes made to the stream, applied in order.
    #[serde(default)]
    pub changes: Vec<Change>,
    /// What the verifier is expected to conclude.
    #[serde(default)]
    pub expect: Expect,
}

/// Parameters of the test chain.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct ChainSpec {
    /// `sha256` or `sha3-256`.
    pub hash: String,
    /// `hmac-sha256` or `cmac-aes`.
    pub mac: String,
    /// Seed of the chain's last key; different seeds give unrelated chains.
    pub seed: u8,
    /// Chain id, 0 to 3.
    pub cid: u8,
    /// E02 sends dummy tags (COP 0) for E05 instead of real ones.
    pub dummy_cross_tags: bool,
}

impl Default for ChainSpec {
    fn default() -> Self {
        Self {
            hash: "sha256".into(),
            mac: "hmac-sha256".into(),
            seed: 5,
            cid: 3,
            dummy_cross_tags: false,
        }
    }
}

/// Arrival order within a sub-frame.
#[derive(Debug, Clone, Copy, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum Order {
    /// E05's pages first, then E02's (the data waits for its tags).
    #[default]
    CrossFirst,
    /// E02's pages first.
    OsnmaFirst,
}

/// The reference time handed to the verifier.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ReferenceTime {
    /// Seconds after the stream start (may be negative).
    pub offset_s: i64,
    /// Tolerance, below 30 s.
    pub max_time_error_s: u32,
}

/// One change to the generated stream. Sub-frames are counted from 0.
#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(tag = "kind", rename_all = "snake_case", deny_unknown_fields)]
pub enum Change {
    /// Flip one bit of a page (bit 0 is the first bit of the 240-bit page; the CRC is
    /// recomputed, so the page still looks genuine).
    FlipPageBit {
        /// 2 or 5.
        prn: u8,
        /// Sub-frame.
        subframe: u32,
        /// Page in the sub-frame, 0 to 14.
        page: usize,
        /// Bit in the page, 0 to 239.
        bit: usize,
    },
    /// Flip one bit of the TESLA key E02 sends in a sub-frame.
    FlipKeyBit {
        /// Sub-frame.
        subframe: u32,
        /// Bit of the 128-bit key.
        bit: usize,
    },
    /// E02 sends the tags of an earlier sub-frame with the genuine key of this one.
    ReplayTags {
        /// Sub-frame whose MACK is altered.
        subframe: u32,
        /// Earlier sub-frame whose tags are repeated.
        from_subframe: u32,
    },
    /// Relabel a satellite's pages with a later or earlier time from a sub-frame on.
    TimeOffset {
        /// 2 or 5.
        prn: u8,
        /// First sub-frame affected.
        from_subframe: u32,
        /// Seconds added to every page time.
        seconds: i64,
    },
    /// Remove a satellite's pages over a range of sub-frames (inclusive).
    DropPages {
        /// 2 or 5.
        prn: u8,
        /// First sub-frame removed.
        from_subframe: u32,
        /// Last sub-frame removed.
        to_subframe: u32,
    },
    /// Flip one bit of a page and leave the CRC as it was.
    BreakCrc {
        /// 2 or 5.
        prn: u8,
        /// Sub-frame.
        subframe: u32,
        /// Page in the sub-frame, 0 to 14.
        page: usize,
    },
}

/// Expected outcomes. Every stated field is checked; absent fields are not.
#[derive(Debug, Clone, Default, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct Expect {
    /// Final status per satellite (`E02`, `E05`): `authenticated`, `failed` or
    /// `unavailable`.
    pub status: BTreeMap<String, String>,
    /// Final overall status.
    pub overall: Option<String>,
    /// At least this many tags authenticated.
    pub authenticated_tags_min: Option<usize>,
    /// At most this many tags authenticated.
    pub authenticated_tags_max: Option<usize>,
    /// Whether any tag failed.
    pub any_tag_failed: Option<bool>,
    /// Whether verifier events of these kinds occurred (see [`event_kind`]).
    pub events: BTreeMap<String, bool>,
}

/// Event kinds the report counts, by name.
pub const EVENT_KINDS: [&str; 13] = [
    "public_key_verified",
    "public_key_rejected",
    "alert_message",
    "kroot_verified",
    "kroot_rejected",
    "key_verified",
    "key_rejected",
    "key_stall",
    "chain_revoked",
    "public_key_revoked",
    "time_rejected",
    "bad_crc",
    "tag",
];

/// The name of a verifier event's kind.
pub fn event_kind(e: &Event) -> &'static str {
    match e {
        Event::PublicKeyVerified { .. } => EVENT_KINDS[0],
        Event::PublicKeyRejected(_) => EVENT_KINDS[1],
        Event::AlertMessage { .. } => EVENT_KINDS[2],
        Event::KrootVerified { .. } => EVENT_KINDS[3],
        Event::KrootRejected { .. } => EVENT_KINDS[4],
        Event::KeyVerified { .. } => EVENT_KINDS[5],
        Event::KeyRejected { .. } => EVENT_KINDS[6],
        Event::KeyStall { .. } => EVENT_KINDS[7],
        Event::ChainRevoked { .. } => EVENT_KINDS[8],
        Event::PublicKeyRevoked { .. } => EVENT_KINDS[9],
        Event::TimeRejected { .. } => EVENT_KINDS[10],
        Event::BadCrc { .. } => EVENT_KINDS[11],
        Event::Tag(_) => EVENT_KINDS[12],
    }
}

fn status_name(s: OsnmaStatus) -> &'static str {
    match s {
        OsnmaStatus::Authenticated => "authenticated",
        OsnmaStatus::Failed => "failed",
        OsnmaStatus::Unavailable => "unavailable",
    }
}

impl Scenario {
    /// Parse and check a scenario file.
    pub fn from_json(text: &str) -> Result<Self, String> {
        let s: Scenario = serde_json::from_str(text).map_err(|e| e.to_string())?;
        s.check()?;
        Ok(s)
    }

    /// Reject values the runner cannot honour.
    pub fn check(&self) -> Result<(), String> {
        if self.format != FORMAT {
            return Err(field_err("format".into(), FORMAT));
        }
        if self.subframes == 0 || self.subframes > MAX_SUBFRAMES {
            return Err(field_err(
                "subframes".into(),
                &format!("1..={MAX_SUBFRAMES}"),
            ));
        }
        self.hash()?;
        self.mac()?;
        if self.chain.cid > 3 {
            return Err(field_err("chain.cid".into(), "0..=3"));
        }
        if let Some(r) = &self.reference_time {
            if r.max_time_error_s >= 30 {
                return Err(field_err(
                    "reference_time.max_time_error_s".into(),
                    "0..=29",
                ));
            }
            if i64::from(GST0) + r.offset_s < 0 {
                return Err(field_err(
                    "reference_time.offset_s".into(),
                    &format!(">= -{GST0}"),
                ));
            }
        }
        let n = self.subframes;
        let prn_ok = |p: u8| p == PRN_A || p == PRN_X;
        for (i, c) in self.changes.iter().enumerate() {
            let bad = |what: &str| {
                Err(field_err(
                    format!("changes[{i}]"),
                    &what.replace('N', &n.to_string()),
                ))
            };
            match c {
                Change::FlipPageBit {
                    prn,
                    subframe,
                    page,
                    bit,
                } => {
                    if !prn_ok(*prn) || *subframe >= n || *page > 14 || *bit >= 240 {
                        return bad("prn 2|5, subframe < N, page 0..=14, bit 0..=239");
                    }
                }
                Change::FlipKeyBit { subframe, bit } => {
                    if *subframe >= n || *bit >= KEY_BITS {
                        return bad("subframe < N, bit 0..=127");
                    }
                }
                Change::ReplayTags {
                    subframe,
                    from_subframe,
                } => {
                    if *subframe >= n || from_subframe >= subframe {
                        return bad("from_subframe < subframe < N");
                    }
                }
                Change::TimeOffset {
                    prn,
                    from_subframe,
                    seconds,
                } => {
                    if !prn_ok(*prn) || *from_subframe >= n || seconds.abs() > 7 * 86_400 {
                        return bad("prn 2|5, from_subframe < N, |seconds| <= 604800");
                    }
                }
                Change::DropPages {
                    prn,
                    from_subframe,
                    to_subframe,
                } => {
                    if !prn_ok(*prn) || from_subframe > to_subframe || *to_subframe >= n {
                        return bad("prn 2|5, from_subframe <= to_subframe < N");
                    }
                }
                Change::BreakCrc {
                    prn,
                    subframe,
                    page,
                } => {
                    if !prn_ok(*prn) || *subframe >= n || *page > 14 {
                        return bad("prn 2|5, subframe < N, page 0..=14");
                    }
                }
            }
        }
        for (sat, st) in &self.expect.status {
            if sat != "E02" && sat != "E05" {
                return Err(field_err(format!("expect.status.{sat}"), "E02|E05"));
            }
            status_ok(st)?;
        }
        if let Some(o) = &self.expect.overall {
            status_ok(o)?;
        }
        for k in self.expect.events.keys() {
            if !EVENT_KINDS.contains(&k.as_str()) {
                return Err(field_err(
                    format!("expect.events.{k}"),
                    &EVENT_KINDS.join("|"),
                ));
            }
        }
        Ok(())
    }

    fn hash(&self) -> Result<HashFn, String> {
        match self.chain.hash.as_str() {
            "sha256" => Ok(HashFn::Sha256),
            "sha3-256" => Ok(HashFn::Sha3_256),
            h => Err(field_err(format!("chain.hash {h}"), "sha256|sha3-256")),
        }
    }

    fn mac(&self) -> Result<MacFn, String> {
        match self.chain.mac.as_str() {
            "hmac-sha256" => Ok(MacFn::HmacSha256),
            "cmac-aes" => Ok(MacFn::CmacAes),
            m => Err(field_err(format!("chain.mac {m}"), "hmac-sha256|cmac-aes")),
        }
    }
}

/// A field of the scenario that is out of range or unknown, with what it allows.
fn field_err(field: String, allowed: &str) -> String {
    crate::terr!(
        "e-osnma-scenario-field",
        field = field,
        allowed = allowed.to_string()
    )
}

fn status_ok(s: &str) -> Result<(), String> {
    match s {
        "authenticated" | "failed" | "unavailable" => Ok(()),
        _ => Err(field_err(
            format!("status {s}"),
            "authenticated|failed|unavailable",
        )),
    }
}

// ------------------------------------------------------------- the reference model ---

/// The chain and stream parameters of the reference model.
#[derive(Clone)]
struct Model {
    hash: HashFn,
    mac: MacFn,
    cid: u8,
    seed: u8,
    nmas: u8,
    dummy_x: bool,
}

impl Model {
    /// Keys K_0 (the root, stamped `GST0 - 30`) to K_n.
    fn chain(&self, n: u32) -> Vec<Vec<u8>> {
        let mut seq = vec![(0..KEY_BITS / 8)
            .map(|i| (i * 13 + usize::from(self.seed)) as u8)
            .collect::<Vec<u8>>()];
        for i in (0..n).rev() {
            let gst = GST0 + 30 * i - 30;
            let next = tesla::step(self.hash, &seq[seq.len() - 1], gst, &ALPHA, KEY_BITS);
            seq.push(next);
        }
        seq.reverse();
        seq
    }

    /// The key transmitted at `gst` is K_i with i = (gst - GST0) / 30 + 1.
    fn key_at<'a>(&self, chain: &'a [Vec<u8>], gst: u32) -> &'a [u8] {
        &chain[((gst - GST0) / 30 + 1) as usize]
    }

    fn header(&self) -> u8 {
        // NMAS, CID, CPKS 1 (nominal)
        (self.nmas << 6) | (self.cid << 4) | (1 << 1)
    }

    fn tag(&self, key: &[u8], msg: &[u8]) -> u64 {
        mac::compute(self.mac, key, msg)
            .ok()
            .and_then(|m| read_bits(&m, 0, TAG_BITS))
            .unwrap_or(0)
    }

    fn tag_msg(&self, prnd: Option<u8>, gst: u32, ctr: u8, nav: &(Vec<u8>, usize)) -> Vec<u8> {
        let mut m = BitWriter::new();
        if let Some(d) = prnd {
            m.push(u64::from(d), 8);
        }
        m.push(u64::from(PRN_A), 8);
        m.push(u64::from(super::gst_pack(gst)), 32);
        m.push(u64::from(ctr), 8);
        m.push(u64::from(self.nmas), 2);
        for i in 0..nav.1 {
            m.push(read_bits(&nav.0, i, 1).unwrap_or(0), 1);
        }
        m.into_bytes()
    }

    fn cop(&self, prnd: u8) -> u8 {
        u8::from(!(self.dummy_x && prnd == PRN_X))
    }

    /// The MACK of E02 transmitted at `gst` (look-up table entry 34).
    fn mack(&self, chain: &[Vec<u8>], gst: u32) -> [u8; 60] {
        let k_next = self.key_at(chain, gst + 30).to_vec();
        let plan = plan(gst);
        let mut w = BitWriter::new();
        let t0 = self.tag(
            &k_next,
            &self.tag_msg(None, gst, 1, &navdata(PRN_A, gst - 30, 0)),
        );
        // MACSEQ over the Tag-Info of the flexible slots (positions 1 and 3 of the table).
        let flex: &[usize] = if gst.is_multiple_of(60) {
            &[0, 2]
        } else {
            &[0]
        };
        let mut ms = BitWriter::new();
        ms.push(u64::from(PRN_A), 8);
        ms.push(u64::from(super::gst_pack(gst)), 32);
        for i in flex {
            let (prnd, adkd) = plan[*i];
            ms.push(
                (u64::from(prnd) << 8) | (u64::from(adkd) << 4) | u64::from(self.cop(prnd)),
                16,
            );
        }
        let macseq = mac::compute(self.mac, &k_next, &ms.into_bytes())
            .ok()
            .and_then(|m| read_bits(&m, 0, 12))
            .unwrap_or(0);
        w.push(t0, TAG_BITS);
        w.push(macseq, 12);
        w.push(1, 4);
        for (i, (prnd, adkd)) in plan.iter().enumerate() {
            let ctr = i as u8 + 2;
            let cop = self.cop(*prnd);
            let nav = if cop == 0 {
                // The data of a dummy tag is all zeros of the right length.
                let bits: usize = if *adkd == 4 { 141 } else { 549 };
                (vec![0u8; bits.div_ceil(8)], bits)
            } else {
                navdata(*prnd, gst - 30, if *adkd == 4 { 4 } else { 0 })
            };
            // Slow MAC: key published ten sub-frames later.
            let key = if *adkd == 12 {
                self.key_at(chain, gst + 330)
            } else {
                &k_next[..]
            };
            w.push(
                self.tag(key, &self.tag_msg(Some(*prnd), gst, ctr, &nav)),
                TAG_BITS,
            );
            w.push(u64::from(*prnd), 8);
            w.push(u64::from(*adkd), 4);
            w.push(u64::from(cop), 4);
        }
        for b in self.key_at(chain, gst) {
            w.push(u64::from(*b), 8);
        }
        w.push(0, 480 - w.bit_len());
        let mut out = [0u8; 60];
        out.copy_from_slice(&w.into_bytes());
        out
    }

    /// The chain as the verifier is given it.
    fn trusted(&self, chain: &[Vec<u8>]) -> Chain {
        Chain {
            cid: self.cid,
            hash: self.hash,
            mac: self.mac,
            key_bits: KEY_BITS,
            tag_bits: TAG_BITS,
            maclt: 34,
            alpha: ALPHA,
            pkid: PKID,
            gst0: GST0,
            root_key: chain[0].clone(),
        }
    }
}

/// Tag-Info (prnd, adkd) of tags 1 to 5 of a MACK transmitted at `gst` (entry 34: first
/// message 00S FLX 04S FLX 12S 00E, second 00S FLX 00E 12S 00E 12E).
fn plan(gst: u32) -> [(u8, u8); 5] {
    if gst.is_multiple_of(60) {
        [(PRN_X, 0), (PRN_A, 4), (PRN_X, 0), (PRN_A, 12), (PRN_X, 0)]
    } else {
        [(PRN_X, 0), (PRN_X, 0), (PRN_A, 12), (PRN_X, 0), (PRN_X, 12)]
    }
}

fn word(wt: u8, iod: u64, seed: u8) -> [u8; 16] {
    let mut w = BitWriter::new();
    w.push(u64::from(wt), 6);
    w.push(iod, 10);
    let mut h = Sha256::digest([seed, wt, iod as u8]).to_vec();
    h.extend(Sha256::digest(&h));
    for b in h.iter().take(14) {
        w.push(u64::from(*b), 8);
    }
    let mut out = [0u8; 16];
    out.copy_from_slice(&w.into_bytes()[..16]);
    out
}

/// The 15 words of a sub-frame. Word Types 1 to 5 hold for as long as the IODnav does
/// (ten minutes); Word Type 5 carries the week and time of week of its page.
fn words(prn: u8, gst: u32) -> [[u8; 16]; 15] {
    let iod = u64::from(gst / 600 % 1024);
    let seed = prn.wrapping_mul(31).wrapping_add(iod as u8);
    let mut ws = [[0u8; 16]; 15];
    for (i, wt) in [1u8, 2, 3, 4, 5, 6, 10].iter().enumerate() {
        ws[i] = word(*wt, iod, seed);
    }
    let label = gst + 2 * 4 + 1;
    let mut t = BitWriter::new();
    for k in 0..73 {
        t.push(read_bits(&ws[4], k, 1).unwrap_or(0), 1);
    }
    t.push(u64::from(label / WEEK_S), 12);
    t.push(u64::from(label % WEEK_S), 20);
    t.push(0, 23);
    ws[4].copy_from_slice(&t.into_bytes());
    ws
}

/// Navigation data bits of the sub-frame at `gst` for ADKD 0 or 4, from the field widths
/// of the ICD's Tables 10 and 11 (independent of the verifier's piece table).
fn navdata(prn: u8, gst: u32, adkd: u8) -> (Vec<u8>, usize) {
    let ws = words(prn, gst);
    let find = |wt: u8| {
        ws.iter()
            .find(|w| (w[0] >> 2) == wt)
            .copied()
            .unwrap_or([0; 16])
    };
    let mut out = BitWriter::new();
    let mut take = |w: &[u8; 16], off: usize, n: usize| {
        let mut done = 0;
        while done < n {
            let k = (n - done).min(32);
            out.push(read_bits(w, off + done, k).unwrap_or(0), k);
            done += k;
        }
    };
    if adkd == 4 {
        take(&find(6), 6, 99);
        take(&find(10), 86, 42);
    } else {
        for (wt, len) in [(1, 120), (2, 120), (3, 122), (4, 120), (5, 67)] {
            take(&find(wt), 6, len);
        }
    }
    let n = out.bit_len();
    (out.into_bytes(), n)
}

/// The 15 nominal pages (even and odd parts) of one sub-frame, with valid CRCs.
fn pages(svid: u8, gst: u32, mack: Option<(&[u8; 60], u8)>) -> Vec<InavPage> {
    let ws = words(svid, gst);
    (0..15usize)
        .map(|i| {
            let mut b = BitWriter::new();
            b.push(0, 2);
            for k in 0..112 {
                b.push(read_bits(&ws[i], k, 1).unwrap_or(0), 1);
            }
            b.push(0, 6);
            b.push(0b10, 2);
            for k in 0..16 {
                b.push(read_bits(&ws[i], 112 + k, 1).unwrap_or(0), 1);
            }
            match mack {
                Some((m, header)) => {
                    // HKROOT: the NMA header in the first page, nothing else.
                    b.push(if i == 0 { u64::from(header) } else { 0 }, 8);
                    let mut v = 0u64;
                    for byte in &m[i * 4..i * 4 + 4] {
                        v = (v << 8) | u64::from(*byte);
                    }
                    b.push(v, 32);
                }
                None => b.push(0, 40),
            }
            b.push(0, 240 - b.bit_len());
            let mut raw = [0u8; 30];
            raw.copy_from_slice(&b.into_bytes());
            InavPage::from_bytes(svid, gst + 2 * i as u32 + 1, &raw).with_valid_crc()
        })
        .collect()
}

fn flip(p: &InavPage, bit: usize, fix_crc: bool) -> InavPage {
    let mut raw = [0u8; 30];
    raw.copy_from_slice(p.bytes());
    raw[bit / 8] ^= 0x80 >> (bit % 8);
    let q = InavPage::from_bytes(p.svid, p.gst, &raw);
    if fix_crc {
        q.with_valid_crc()
    } else {
        q
    }
}

fn relabel(p: &InavPage, seconds: i64) -> Option<InavPage> {
    let gst = u32::try_from(i64::from(p.gst) + seconds).ok()?;
    let mut raw = [0u8; 30];
    raw.copy_from_slice(p.bytes());
    Some(InavPage::from_bytes(p.svid, gst, &raw))
}

// ------------------------------------------------------------------------ the run ---

/// One stated expectation and what the run gave.
#[derive(Debug, Clone, Serialize)]
pub struct Check {
    /// What was checked.
    pub what: String,
    /// The expected value.
    pub expected: String,
    /// What the verifier concluded.
    pub observed: String,
    /// Whether they agree.
    pub met: bool,
}

/// The run report.
#[derive(Debug, Clone, Serialize)]
pub struct Report {
    /// [`REPORT_FORMAT`].
    pub format: &'static str,
    /// Scenario name.
    pub scenario: String,
    /// Sub-frames generated.
    pub subframes: u32,
    /// Pages handed to the verifier.
    pub pages: usize,
    /// Tag outcomes by state (`authenticated`, `failed`, `pending`, `discarded`).
    pub tags: BTreeMap<String, usize>,
    /// Tag outcomes by state and reason (for example `failed:tag_mismatch`).
    pub tag_reasons: BTreeMap<String, usize>,
    /// Verifier events by kind.
    pub events: BTreeMap<String, usize>,
    /// Final status per satellite.
    pub status: BTreeMap<String, String>,
    /// Final overall status.
    pub overall: String,
    /// The stated expectations, each with the outcome.
    pub checks: Vec<Check>,
    /// True when every stated expectation was met (vacuously true when none was stated).
    pub all_met: bool,
    /// What the run is and is not.
    pub provenance: &'static str,
    /// The OSNMA advisory.
    pub advisory: &'static str,
}

/// What a run report says about itself.
pub const PROVENANCE: &str = "MODELLED: a synthetic stream from the kshana reference model \
(test TESLA chain handed to the verifier as trusted, filler navigation words, MAC look-up \
table entry 34) run through the kshana OSNMA verifier. It shows the verifier's behaviour on \
the scenario, not conformance to the Galileo OSNMA documents and not a receiver's behaviour.";

/// The serde name of a reason enum (`tag_mismatch`, `awaiting_key`, ...).
fn reason<T: Serialize>(r: &T) -> String {
    match serde_json::to_value(r) {
        Ok(serde_json::Value::String(s)) => s,
        Ok(v) => v.to_string(),
        Err(_) => String::new(),
    }
}

fn tag_state(s: &TagStatus) -> (&'static str, String) {
    match s {
        TagStatus::Authenticated => ("authenticated", String::new()),
        TagStatus::Failed(r) => ("failed", reason(r)),
        TagStatus::Pending(r) => ("pending", reason(r)),
        TagStatus::Discarded(r) => ("discarded", reason(r)),
    }
}

/// Build the scenario's stream, run the verifier on it and compare with the expectations.
pub fn run(s: &Scenario) -> Result<Report, String> {
    s.check()?;
    let m = Model {
        hash: s.hash()?,
        mac: s.mac()?,
        cid: s.chain.cid,
        seed: s.chain.seed,
        nmas: 2,
        dummy_x: s.chain.dummy_cross_tags,
    };
    let chain = m.chain(s.subframes + 20);
    let mut cfg = Config {
        trusted_chain: Some(m.trusted(&chain)),
        ..Config::default()
    };
    if let Some(r) = &s.reference_time {
        cfg.max_time_error_s = Some(r.max_time_error_s);
    }
    let mut v = Verifier::new(cfg);
    if let Some(r) = &s.reference_time {
        // check() has made sure this is not negative; it saturates beyond u32.
        let t = u32::try_from(i64::from(GST0) + r.offset_s).unwrap_or(u32::MAX);
        v.set_reference_time(t);
    }
    let mut tags: BTreeMap<String, usize> = BTreeMap::new();
    let mut reasons: BTreeMap<String, usize> = BTreeMap::new();
    let mut events: BTreeMap<String, usize> = BTreeMap::new();
    let mut fed = 0usize;
    for n in 0..s.subframes {
        let gst = GST0 + 30 * n;
        let mut mack = m.mack(&chain, gst);
        for c in &s.changes {
            match c {
                Change::FlipKeyBit { subframe, bit } if *subframe == n => {
                    mack[KEY_BYTE + bit / 8] ^= 0x80 >> (bit % 8);
                }
                Change::ReplayTags {
                    subframe,
                    from_subframe,
                } if *subframe == n => {
                    let old = m.mack(&chain, GST0 + 30 * from_subframe);
                    mack[..KEY_BYTE].copy_from_slice(&old[..KEY_BYTE]);
                }
                _ => {}
            }
        }
        let mut a = pages(PRN_A, gst, Some((&mack, m.header())));
        let mut x = pages(PRN_X, gst, None);
        for c in &s.changes {
            let pick = |prn: u8| prn == PRN_A;
            match c {
                Change::FlipPageBit {
                    prn,
                    subframe,
                    page,
                    bit,
                } if *subframe == n => {
                    let v = if pick(*prn) { &mut a } else { &mut x };
                    v[*page] = flip(&v[*page], *bit, true);
                }
                Change::BreakCrc {
                    prn,
                    subframe,
                    page,
                } if *subframe == n => {
                    let v = if pick(*prn) { &mut a } else { &mut x };
                    // A data bit of the even part: the CRC no longer matches.
                    v[*page] = flip(&v[*page], 20, false);
                }
                Change::TimeOffset {
                    prn,
                    from_subframe,
                    seconds,
                } if n >= *from_subframe => {
                    let v = if pick(*prn) { &mut a } else { &mut x };
                    *v = v.iter().filter_map(|p| relabel(p, *seconds)).collect();
                }
                Change::DropPages {
                    prn,
                    from_subframe,
                    to_subframe,
                } if (*from_subframe..=*to_subframe).contains(&n) => {
                    let v = if pick(*prn) { &mut a } else { &mut x };
                    v.clear();
                }
                _ => {}
            }
        }
        let order: Vec<&InavPage> = match s.order {
            Order::CrossFirst => x.iter().chain(a.iter()).collect(),
            Order::OsnmaFirst => a.iter().chain(x.iter()).collect(),
        };
        for p in order {
            fed += 1;
            for e in v.push_page(p) {
                *events.entry(event_kind(&e).to_string()).or_default() += 1;
                if let Event::Tag(t) = &e {
                    let (state, why) = tag_state(&t.status);
                    *tags.entry(state.to_string()).or_default() += 1;
                    if !why.is_empty() {
                        *reasons.entry(format!("{state}:{why}")).or_default() += 1;
                    }
                }
            }
        }
    }
    let status: BTreeMap<String, String> = v
        .sat_status()
        .into_iter()
        .map(|(k, st)| (k, status_name(st).to_string()))
        .collect();
    let overall = status_name(v.overall()).to_string();
    let checks = compare(&s.expect, &status, &overall, &tags, &events);
    let all_met = checks.iter().all(|c| c.met);
    Ok(Report {
        format: REPORT_FORMAT,
        scenario: s.name.clone(),
        subframes: s.subframes,
        pages: fed,
        tags,
        tag_reasons: reasons,
        events,
        status,
        overall,
        checks,
        all_met,
        provenance: PROVENANCE,
        advisory: super::ADVISORY,
    })
}

fn compare(
    e: &Expect,
    status: &BTreeMap<String, String>,
    overall: &str,
    tags: &BTreeMap<String, usize>,
    events: &BTreeMap<String, usize>,
) -> Vec<Check> {
    let mut out = Vec::new();
    let mut push = |what: String, expected: String, observed: String, met: bool| {
        out.push(Check {
            what,
            expected,
            observed,
            met,
        })
    };
    for (sat, want) in &e.status {
        let got = status
            .get(sat)
            .cloned()
            .unwrap_or_else(|| "unavailable".into());
        push(
            format!("status {sat}"),
            want.clone(),
            got.clone(),
            &got == want,
        );
    }
    if let Some(want) = &e.overall {
        push(
            "overall".into(),
            want.clone(),
            overall.into(),
            overall == want,
        );
    }
    let ok = tags.get("authenticated").copied().unwrap_or(0);
    if let Some(min) = e.authenticated_tags_min {
        push(
            "authenticated tags".into(),
            format!(">= {min}"),
            ok.to_string(),
            ok >= min,
        );
    }
    if let Some(max) = e.authenticated_tags_max {
        push(
            "authenticated tags".into(),
            format!("<= {max}"),
            ok.to_string(),
            ok <= max,
        );
    }
    if let Some(want) = e.any_tag_failed {
        let got = tags.get("failed").copied().unwrap_or(0) > 0;
        push(
            "any tag failed".into(),
            want.to_string(),
            got.to_string(),
            got == want,
        );
    }
    for (kind, want) in &e.events {
        let got = events.get(kind).copied().unwrap_or(0) > 0;
        push(
            format!("event {kind}"),
            want.to_string(),
            got.to_string(),
            got == *want,
        );
    }
    out
}

/// A filled-in example scenario, as `kshana osnma scenario template` prints it.
pub fn template() -> Scenario {
    Scenario {
        format: FORMAT.into(),
        name: "flipped-cross-authenticated-bit".into(),
        description: "One bit of E05's word type 1 is flipped in sub-frame 6; the cross tag \
                      fails and both satellites are charged."
            .into(),
        chain: ChainSpec::default(),
        subframes: 18,
        order: Order::CrossFirst,
        reference_time: None,
        changes: vec![Change::FlipPageBit {
            prn: PRN_X,
            subframe: 6,
            page: 0,
            bit: 27,
        }],
        expect: Expect {
            status: [("E02", "failed"), ("E05", "failed")]
                .into_iter()
                .map(|(a, b)| (a.to_string(), b.to_string()))
                .collect(),
            overall: Some("failed".into()),
            any_tag_failed: Some(true),
            ..Expect::default()
        },
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn base(name: &str) -> Scenario {
        Scenario {
            name: name.into(),
            changes: Vec::new(),
            expect: Expect::default(),
            ..template()
        }
    }

    #[test]
    fn clean_stream_authenticates_both() {
        let r = run(&base("clean")).unwrap();
        assert_eq!(r.status["E02"], "authenticated");
        assert_eq!(r.status["E05"], "authenticated");
        assert_eq!(r.tags.get("failed"), None);
        assert!(r.tags["authenticated"] > 50);
    }

    #[test]
    fn template_meets_its_expectations() {
        let r = run(&template()).unwrap();
        assert!(r.all_met, "{:#?}", r.checks);
        assert_eq!(r.checks.len(), 4);
    }

    #[test]
    fn a_wrong_expectation_is_reported_not_met() {
        let mut s = template();
        s.expect.overall = Some("authenticated".into());
        let r = run(&s).unwrap();
        assert!(!r.all_met);
        assert!(r.checks.iter().any(|c| c.what == "overall" && !c.met));
    }

    #[test]
    fn checks_reject_out_of_range_values() {
        let mut s = template();
        s.subframes = 0;
        assert!(s.check().is_err());
        let mut s = template();
        s.changes = vec![Change::FlipKeyBit {
            subframe: 2,
            bit: 128,
        }];
        assert!(s.check().is_err());
        let mut s = template();
        s.chain.hash = "md5".into();
        assert!(s.check().is_err());
        let mut s = template();
        s.expect.events.insert("nothing".into(), true);
        assert!(s.check().is_err());
        assert!(Scenario::from_json("{\"format\":\"x\"}").is_err());
    }

    #[test]
    fn template_round_trips_through_json() {
        let t = serde_json::to_string_pretty(&template()).unwrap();
        let s = Scenario::from_json(&t).unwrap();
        assert_eq!(s.name, template().name);
    }
}
