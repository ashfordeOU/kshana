// SPDX-License-Identifier: AGPL-3.0-only
//! The verifier: turns a stream of I/NAV pages into per-satellite authentication
//! status with a reason for every failure or delay.
//!
//! Trust flows from a Merkle root (or a loaded public key) to a signed KROOT, then
//! down the TESLA chain to the key that opens the tags of a MACK message, then to the
//! navigation data each tag covers (ICD chapter 6; Receiver Guidelines chapter 5).
//!
//! Time. Every check is relative to the GST of the pages as supplied. The chain proves
//! that a key belongs to a given slot, not that the slot is the present one, so the
//! caller must supply pages stamped from a time source that an attacker cannot move,
//! or set a reference time with [`Verifier::set_reference_time`]. See `docs/OSNMA.md`.

use super::bits::{read_bits, BitWriter};
use super::dsm::{Dsm, DsmAssembler, DsmKroot, DsmPkr};
use super::mac::{self, MacError};
use super::maclt::{MacLookup, Slot};
use super::merkle::{self, MerkleError};
use super::navdata::{self, BitString};
use super::page::InavPage;
use super::signature::{self, PublicKey, SigError};
use super::subframe::{Mack, MackLayout, NmaHeader, Subframe, SubframeAssembler, SUBFRAME_S};
use super::tables::{HashFn, KeyType, MacFn};
use super::tesla;
use super::OsnmaStatus;
use serde::Serialize;
use std::collections::BTreeMap;

/// Sub-frames of extra delay before the key of an ADKD 12 ("slow MAC") tag is sent.
const SLOW_MAC_DELAY: u32 = 10;
/// How many sub-frames of navigation data and pending tags are kept per satellite.
const HISTORY: u32 = 45;

/// Parameters of a TESLA chain, as signed in a DSM-KROOT.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Chain {
    pub cid: u8,
    pub hash: HashFn,
    pub mac: MacFn,
    pub key_bits: usize,
    pub tag_bits: usize,
    pub maclt: u8,
    pub alpha: [u8; 6],
    /// Time of applicability `GST_0`, in GST seconds.
    pub gst0: u32,
    pub root_key: Vec<u8>,
}

impl Chain {
    pub fn from_kroot(k: &DsmKroot) -> Self {
        Self {
            cid: k.cidkr,
            hash: k.hash,
            mac: k.mac,
            key_bits: k.key_bits,
            tag_bits: k.tag_bits,
            maclt: k.maclt,
            alpha: k.alpha,
            gst0: k.gst0(),
            root_key: k.kroot.clone(),
        }
    }
}

/// What the verifier starts from.
#[derive(Debug, Clone, Default)]
pub struct Config {
    /// Merkle root against which DSM-PKR messages are checked.
    pub merkle_root: Option<[u8; 32]>,
    /// Public keys already trusted (for example loaded from the service operator).
    pub public_keys: Vec<PublicKey>,
    /// A chain verified earlier and kept, so signatures need not be re-checked.
    pub trusted_chain: Option<Chain>,
    pub maclt: MacLookup,
    /// Largest accepted difference between a sub-frame's time and the reference time.
    pub max_time_error_s: Option<u32>,
    /// Accept pages whose CRC does not match. Off by default: a page that fails its
    /// CRC is dropped and reported, as the Receiver Guidelines require.
    pub skip_crc_check: bool,
    /// How long a failed check keeps a satellite at `Failed`, even if later data
    /// verifies: a mismatch is evidence worth remembering. Defaults to 600 s.
    pub failure_memory_s: Option<u32>,
}

/// Why a tag, key or message was rejected. These mean the data did not check out.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum FailReason {
    /// The recomputed tag differs from the received one.
    TagMismatch,
    /// The MACSEQ that covers the flexible Tag-Info fields does not verify.
    MacseqMismatch,
    /// The key does not lead back to the trusted chain key.
    KeyChainMismatch,
    /// Two satellites sent different keys for the same slot.
    KeyConflict,
}

/// Why a tag could not be decided yet, or at all. These mean the check did not run.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum PendingReason {
    /// No signed KROOT has been verified yet.
    NoChain,
    /// The key that opens the tag has not arrived or could not be verified.
    AwaitingKey,
    /// The navigation data the tag covers was not received.
    NoNavData,
    /// The look-up table entry is unknown or does not match the MACK layout.
    UnknownMaclt,
    /// The chain uses a function this build does not provide.
    UnsupportedFunction,
    /// The sub-frame carried NMA status "don't use" or a reserved status.
    ServiceNotUsable,
}

/// Why a tag was set aside without being checked, as the Receiver Guidelines direct.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum DiscardReason {
    /// The Tag-Info ADKD (or satellite role) differs from the look-up table slot.
    AdkdNotInTable,
    /// The tag names a reserved satellite or ADKD value.
    ReservedField,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize)]
#[serde(tag = "state", content = "reason", rename_all = "snake_case")]
pub enum TagStatus {
    Authenticated,
    Failed(FailReason),
    Pending(PendingReason),
    Discarded(DiscardReason),
}

/// The outcome for one tag.
#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct TagResult {
    /// Satellite that transmitted the tag.
    pub prna: u8,
    /// Satellite whose data the tag covers.
    pub prnd: u8,
    pub adkd: u8,
    /// Position of the tag in its MACK message, counted from 1 (Tag0).
    pub ctr: u8,
    /// Sub-frame start in which the tag was transmitted.
    pub tag_gst: u32,
    /// Sub-frame start of the data that matched, when it authenticated.
    pub data_gst: Option<u32>,
    pub nmas: u8,
    pub status: TagStatus,
}

/// Things that happened while processing a page.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Event {
    PublicKeyVerified {
        pkid: u8,
    },
    PublicKeyRejected(MerkleError),
    AlertMessage {
        verified: bool,
    },
    KrootVerified {
        cid: u8,
        pkid: u8,
    },
    KrootRejected(KrootError),
    KeyVerified {
        gst: u32,
    },
    KeyRejected {
        gst: u32,
        reason: FailReason,
    },
    /// A sub-frame time lay outside the allowed distance from the reference time.
    TimeRejected {
        gst_sf: u32,
    },
    /// A page was dropped because its CRC did not match.
    BadCrc {
        svid: u8,
        gst: u32,
    },
    Tag(TagResult),
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum KrootError {
    NoPublicKey,
    Signature(SigError),
    Malformed,
}

struct PendingMack {
    prna: u8,
    gst: u32,
    nmas: u8,
    mack: Mack,
    slots: Option<Vec<Slot>>,
    macseq_ok: Option<bool>,
    fast_done: bool,
    slow_done: bool,
}

/// Latest verdict per satellite.
#[derive(Debug, Clone, Copy, Default)]
struct SatRecord {
    last_ok: Option<u32>,
    last_fail: Option<(u32, FailReason)>,
}

pub struct Verifier {
    cfg: Config,
    sf: SubframeAssembler,
    dsm: DsmAssembler,
    chain: Option<Chain>,
    public_keys: BTreeMap<u8, PublicKey>,
    keys: BTreeMap<u32, Vec<u8>>,
    history: BTreeMap<(u8, u32), [[u8; 16]; 15]>,
    pending: Vec<PendingMack>,
    sats: BTreeMap<u8, SatRecord>,
    held_kroot: Option<(Dsm, u8)>,
    reference: Option<u32>,
    latest_gst: u32,
    nmas: u8,
    alert: bool,
}

impl Verifier {
    pub fn new(cfg: Config) -> Self {
        let public_keys = cfg
            .public_keys
            .iter()
            .map(|k| (k.pkid, k.clone()))
            .collect();
        let chain = cfg.trusted_chain.clone();
        let mut v = Self {
            cfg,
            sf: SubframeAssembler::new(),
            dsm: DsmAssembler::new(),
            chain: None,
            public_keys,
            keys: BTreeMap::new(),
            history: BTreeMap::new(),
            pending: Vec::new(),
            sats: BTreeMap::new(),
            held_kroot: None,
            reference: None,
            latest_gst: 0,
            nmas: 0,
            alert: false,
        };
        if let Some(c) = chain {
            v.adopt_chain(c);
        }
        v
    }

    /// Tell the verifier the present time from a source the received data cannot move.
    pub fn set_reference_time(&mut self, gst: u32) {
        self.reference = Some(gst);
    }

    fn adopt_chain(&mut self, c: Chain) {
        self.keys
            .insert(c.gst0.wrapping_sub(SUBFRAME_S), c.root_key.clone());
        self.chain = Some(c);
    }

    /// Feed one page; returns the events it caused.
    pub fn push_page(&mut self, page: &InavPage) -> Vec<Event> {
        if !self.cfg.skip_crc_check && !page.crc_ok() {
            return vec![Event::BadCrc {
                svid: page.svid,
                gst: page.gst,
            }];
        }
        match self.sf.push(page) {
            Some(sf) => self.on_subframe(sf),
            None => Vec::new(),
        }
    }

    fn on_subframe(&mut self, sf: Subframe) -> Vec<Event> {
        let mut ev = Vec::new();
        if let (Some(r), Some(tol)) = (self.reference, self.cfg.max_time_error_s) {
            if sf.gst_sf.abs_diff(r) > tol {
                ev.push(Event::TimeRejected { gst_sf: sf.gst_sf });
                return ev;
            }
        }
        self.latest_gst = self.latest_gst.max(sf.gst_sf);
        let nma = sf.nma_header();
        if sf.has_osnma {
            self.nmas = nma.nmas;
        }
        self.history.insert((sf.svid, sf.gst_sf), sf.words);
        let floor = self.latest_gst.saturating_sub(SUBFRAME_S * HISTORY);
        self.history.retain(|&(_, g), _| g >= floor);
        self.pending.retain(|p| p.gst >= floor);
        let newest_old = self.keys.range(..floor).next_back().map(|(g, _)| *g);
        self.keys
            .retain(|g, _| *g >= floor || Some(*g) == newest_old);

        if !sf.has_osnma {
            return ev;
        }
        let usable = matches!(nma.nmas, 1 | 2);
        let dh = sf.dsm_header();
        if usable {
            if let Some(d) = self.dsm.push(dh.dsm_id, dh.block_id, sf.dsm_block()) {
                self.on_dsm(d, sf.hkroot[0], &mut ev);
            }
            self.retry_kroot(&mut ev);
            self.on_mack(&sf, nma, &mut ev);
        } else {
            self.note_unusable(&sf, &mut ev);
        }
        ev
    }

    fn note_unusable(&mut self, sf: &Subframe, ev: &mut Vec<Event>) {
        // The tags of an unusable sub-frame are not looked at, but the sub-frame is
        // reported so the caller can see why the satellite shows no authentication.
        ev.push(Event::Tag(TagResult {
            prna: sf.svid,
            prnd: sf.svid,
            adkd: 0,
            ctr: 1,
            tag_gst: sf.gst_sf,
            data_gst: None,
            nmas: sf.nma_header().nmas,
            status: TagStatus::Pending(PendingReason::ServiceNotUsable),
        }));
    }

    fn on_dsm(&mut self, d: Dsm, nma_byte: u8, ev: &mut Vec<Event>) {
        if d.dsm_id >= 12 {
            self.on_pkr(&d, ev);
        } else {
            self.try_kroot(d, nma_byte, ev);
        }
    }

    fn on_pkr(&mut self, d: &Dsm, ev: &mut Vec<Event>) {
        let Ok(pkr) = DsmPkr::parse(&d.bytes) else {
            return;
        };
        let Some(root) = self.cfg.merkle_root else {
            return;
        };
        match merkle::verify_pkr(&pkr, &root) {
            Err(e) => ev.push(Event::PublicKeyRejected(e)),
            Ok(()) if pkr.is_alert() => {
                self.alert = true;
                ev.push(Event::AlertMessage { verified: true });
            }
            Ok(()) => {
                if let Some(key_type) = KeyType::from_npkt(pkr.npkt) {
                    self.public_keys.insert(
                        pkr.npkid,
                        PublicKey {
                            pkid: pkr.npkid,
                            key_type,
                            bytes: pkr.npk,
                        },
                    );
                    ev.push(Event::PublicKeyVerified { pkid: pkr.npkid });
                }
            }
        }
    }

    fn try_kroot(&mut self, d: Dsm, nma_byte: u8, ev: &mut Vec<Event>) {
        let pkid = d.bytes[0] & 0x0F;
        let Some(pk) = self.public_keys.get(&pkid).cloned() else {
            ev.push(Event::KrootRejected(KrootError::NoPublicKey));
            self.held_kroot = Some((d, nma_byte));
            return;
        };
        let Ok(k) = DsmKroot::parse(&d.bytes, pk.key_type.signature_bits()) else {
            ev.push(Event::KrootRejected(KrootError::Malformed));
            return;
        };
        match signature::verify(&pk, &k.signed_message(nma_byte), &k.signature) {
            Ok(()) => {
                ev.push(Event::KrootVerified { cid: k.cidkr, pkid });
                let chain = Chain::from_kroot(&k);
                match &self.chain {
                    Some(c) if c.cid == chain.cid && c.alpha == chain.alpha => {
                        // A floating KROOT of the chain in force is one more anchor.
                        self.keys
                            .insert(chain.gst0.wrapping_sub(SUBFRAME_S), chain.root_key);
                    }
                    _ => {
                        self.keys.clear();
                        self.adopt_chain(chain);
                    }
                }
            }
            Err(e) => ev.push(Event::KrootRejected(KrootError::Signature(e))),
        }
    }

    fn retry_kroot(&mut self, ev: &mut Vec<Event>) {
        if let Some((d, n)) = self.held_kroot.take() {
            let pkid = d.bytes[0] & 0x0F;
            if self.public_keys.contains_key(&pkid) {
                self.try_kroot(d, n, ev);
            } else {
                self.held_kroot = Some((d, n));
            }
        }
    }

    fn on_mack(&mut self, sf: &Subframe, nma: NmaHeader, ev: &mut Vec<Event>) {
        let Some(chain) = self.chain.clone() else {
            return;
        };
        let layout = MackLayout {
            key_bits: chain.key_bits,
            tag_bits: chain.tag_bits,
        };
        let Some(mack) = layout.parse(&sf.mack) else {
            return;
        };
        // The key in this MACK opens the tags of the previous MACKs.
        self.accept_key(&chain, sf.gst_sf, &mack.key, ev);
        let slots = self
            .cfg
            .maclt
            .get(chain.maclt)
            .map(|e| e.sequence_at(sf.gst_sf).to_vec())
            .filter(|s| s.len() == layout.tags_per_mack());
        self.pending.push(PendingMack {
            prna: sf.svid,
            gst: sf.gst_sf,
            nmas: nma.nmas,
            mack,
            slots,
            macseq_ok: None,
            fast_done: false,
            slow_done: false,
        });
        self.process_pending(&chain, ev);
    }

    fn accept_key(&mut self, chain: &Chain, gst: u32, key: &[u8], ev: &mut Vec<Event>) {
        if let Some(have) = self.keys.get(&gst) {
            if have != key {
                ev.push(Event::KeyRejected {
                    gst,
                    reason: FailReason::KeyConflict,
                });
            }
            return;
        }
        let anchor = self
            .keys
            .range(..gst)
            .next_back()
            .map(|(g, k)| (*g, k.clone()));
        let Some((ag, ak)) = anchor else {
            return;
        };
        match tesla::verify_key(chain.hash, key, gst, &ak, ag, &chain.alpha) {
            Ok(()) => {
                self.keys.insert(gst, key.to_vec());
                ev.push(Event::KeyVerified { gst });
            }
            Err(_) => ev.push(Event::KeyRejected {
                gst,
                reason: FailReason::KeyChainMismatch,
            }),
        }
    }

    fn process_pending(&mut self, chain: &Chain, ev: &mut Vec<Event>) {
        let mut pending = std::mem::take(&mut self.pending);
        for p in &mut pending {
            // The chain's root key (stamped GST_0 - 30) is never a tag key, and a MACK
            // sent before GST_0 - 30 belongs to the previous chain: leave it alone.
            if p.gst + SUBFRAME_S < chain.gst0 {
                p.fast_done = true;
                p.slow_done = true;
                continue;
            }
            let fast_key = self.keys.get(&(p.gst + SUBFRAME_S)).cloned();
            if let (Some(k), false) = (fast_key, p.fast_done) {
                self.run_mack(chain, p, &k, false, ev);
                p.fast_done = true;
            }
            let slow_gst = p.gst + SUBFRAME_S * (1 + SLOW_MAC_DELAY);
            if let (Some(k), true, false) =
                (self.keys.get(&slow_gst).cloned(), p.fast_done, p.slow_done)
            {
                self.run_mack(chain, p, &k, true, ev);
                p.slow_done = true;
            }
        }
        pending.retain(|p| !(p.fast_done && p.slow_done));
        self.pending = pending;
    }

    /// Verify the tags of one MACK with `key`: the fast pass covers every ADKD except
    /// 12 and the MACSEQ; the slow pass covers ADKD 12.
    fn run_mack(
        &mut self,
        chain: &Chain,
        p: &mut PendingMack,
        key: &[u8],
        slow: bool,
        ev: &mut Vec<Event>,
    ) {
        let Some(slots) = p.slots.clone() else {
            if !slow {
                self.emit(
                    ev,
                    p,
                    1,
                    p.prna,
                    0,
                    TagStatus::Pending(PendingReason::UnknownMaclt),
                );
            }
            return;
        };
        if !slow {
            p.macseq_ok = self.macseq_ok(chain, p, &slots, key);
        }
        let mut entries: Vec<(u8, u64, u8, u8, u8, Slot)> = Vec::new();
        entries.push((1, p.mack.tag0, p.prna, 0, p.mack.cop0, slots[0]));
        for (i, t) in p.mack.tags.iter().enumerate() {
            entries.push((i as u8 + 2, t.tag, t.prn_d, t.adkd, t.cop, slots[i + 1]));
        }
        for (ctr, tag, prnd, adkd, cop, slot) in entries {
            if (adkd == 12) != slow {
                continue;
            }
            let status = self.judge(chain, p, key, ctr, tag, prnd, adkd, cop, slot);
            self.emit(ev, p, ctr, prnd, adkd, status);
        }
    }

    fn macseq_ok(
        &self,
        chain: &Chain,
        p: &PendingMack,
        slots: &[Slot],
        key: &[u8],
    ) -> Option<bool> {
        let flex: Vec<u16> = slots
            .iter()
            .enumerate()
            .skip(1)
            .filter(|(_, s)| **s == Slot::Flexible)
            .map(|(i, _)| {
                let t = &p.mack.tags[i - 1];
                (u16::from(t.prn_d) << 8) | (u16::from(t.adkd) << 4) | u16::from(t.cop)
            })
            .collect();
        if flex.is_empty() {
            return None;
        }
        let mut m = BitWriter::new();
        m.push(u64::from(p.prna), 8);
        m.push(u64::from(super::gst_pack(p.gst)), 32);
        for f in flex {
            m.push(u64::from(f), 16);
        }
        let full = mac::compute(chain.mac, key, &m.into_bytes()).ok()?;
        Some(read_bits(&full, 0, 12) == Some(u64::from(p.mack.macseq)))
    }

    #[allow(clippy::too_many_arguments)]
    fn judge(
        &self,
        chain: &Chain,
        p: &PendingMack,
        key: &[u8],
        ctr: u8,
        tag: u64,
        prnd: u8,
        adkd: u8,
        cop: u8,
        slot: Slot,
    ) -> TagStatus {
        let tag0 = ctr == 1;
        let adkd = if tag0 { 0 } else { adkd };
        match slot {
            Slot::Flexible => match p.macseq_ok {
                Some(true) => {}
                Some(false) => return TagStatus::Failed(FailReason::MacseqMismatch),
                None => return TagStatus::Pending(PendingReason::UnsupportedFunction),
            },
            Slot::Fixed { adkd: want, own } => {
                if adkd != want || (own && prnd != p.prna) {
                    return TagStatus::Discarded(DiscardReason::AdkdNotInTable);
                }
            }
        }
        if !matches!(adkd, 0 | 4 | 12) || !(1..=36).contains(&prnd) {
            return TagStatus::Discarded(DiscardReason::ReservedField);
        }
        let build = |nav: &BitString| {
            let mut m = BitWriter::new();
            if !tag0 {
                m.push(u64::from(prnd), 8);
            }
            m.push(u64::from(p.prna), 8);
            m.push(u64::from(super::gst_pack(p.gst)), 32);
            m.push(u64::from(ctr), 8);
            m.push(u64::from(p.nmas), 2);
            for chunk in 0..nav.bits.div_ceil(32) {
                let n = (nav.bits - chunk * 32).min(32);
                m.push(read_bits(&nav.bytes, chunk * 32, n).unwrap_or(0), n);
            }
            m.into_bytes()
        };
        let matches = |nav: &BitString| -> Result<bool, MacError> {
            let full = mac::compute(chain.mac, key, &build(nav))?;
            Ok(read_bits(&full, 0, chain.tag_bits) == Some(tag))
        };
        if cop == 0 {
            return match navdata::dummy(adkd).map(|n| matches(&n)) {
                Some(Ok(true)) => TagStatus::Authenticated,
                Some(Ok(false)) | None => TagStatus::Failed(FailReason::TagMismatch),
                Some(Err(_)) => TagStatus::Pending(PendingReason::UnsupportedFunction),
            };
        }
        let mut saw_data = false;
        for k in 1..=u32::from(cop) {
            let Some(g) = p.gst.checked_sub(SUBFRAME_S * k) else {
                break;
            };
            let Some(words) = self.history.get(&(prnd, g)) else {
                continue;
            };
            let nav = if adkd == 4 {
                navdata::adkd4(words)
            } else {
                navdata::adkd0(words)
            };
            let Some(nav) = nav else { continue };
            saw_data = true;
            match matches(&nav) {
                Ok(true) => return TagStatus::Authenticated,
                Ok(false) => {}
                Err(_) => return TagStatus::Pending(PendingReason::UnsupportedFunction),
            }
        }
        if saw_data {
            TagStatus::Failed(FailReason::TagMismatch)
        } else {
            TagStatus::Pending(PendingReason::NoNavData)
        }
    }

    fn emit(
        &mut self,
        ev: &mut Vec<Event>,
        p: &PendingMack,
        ctr: u8,
        prnd: u8,
        adkd: u8,
        status: TagStatus,
    ) {
        let data_gst =
            matches!(status, TagStatus::Authenticated).then(|| p.gst.saturating_sub(SUBFRAME_S));
        let rec = self.sats.entry(prnd).or_default();
        match status {
            TagStatus::Authenticated if adkd == 0 || adkd == 12 => {
                rec.last_ok = rec.last_ok.max(Some(p.gst));
            }
            TagStatus::Failed(r) => {
                if rec.last_fail.is_none_or(|(g, _)| g <= p.gst) {
                    rec.last_fail = Some((p.gst, r));
                }
            }
            _ => {}
        }
        ev.push(Event::Tag(TagResult {
            prna: p.prna,
            prnd,
            adkd,
            ctr,
            tag_gst: p.gst,
            data_gst,
            nmas: p.nmas,
            status,
        }));
    }

    /// Per-satellite status in the form the receiver-trust monitor consumes:
    /// `Failed` when a check on the satellite's data failed within the failure memory,
    /// else `Authenticated` when its ephemeris and clock data has verified, else
    /// `Unavailable`.
    pub fn sat_status(&self) -> Vec<(String, OsnmaStatus)> {
        let memory = self.cfg.failure_memory_s.unwrap_or(600);
        self.sats
            .iter()
            .map(|(prn, r)| {
                let recent_fail = r
                    .last_fail
                    .is_some_and(|(fg, _)| fg.saturating_add(memory) >= self.latest_gst);
                let s = match (r.last_ok, recent_fail) {
                    (_, true) => OsnmaStatus::Failed,
                    (Some(_), false) => OsnmaStatus::Authenticated,
                    _ => OsnmaStatus::Unavailable,
                };
                (format!("E{prn:02}"), s)
            })
            .collect()
    }

    /// Overall status: `Failed` if any satellite failed, `Authenticated` if at least one
    /// is authenticated and none failed, `Unavailable` otherwise.
    pub fn overall(&self) -> OsnmaStatus {
        let s = self.sat_status();
        if s.iter().any(|(_, x)| *x == OsnmaStatus::Failed) {
            OsnmaStatus::Failed
        } else if s.iter().any(|(_, x)| *x == OsnmaStatus::Authenticated) {
            OsnmaStatus::Authenticated
        } else {
            OsnmaStatus::Unavailable
        }
    }

    /// The most recent NMA status value seen (1 test, 2 operational, 3 don't use).
    pub fn nma_status(&self) -> u8 {
        self.nmas
    }

    /// Whether a verified OSNMA alert message has been received.
    pub fn alert(&self) -> bool {
        self.alert
    }
}
