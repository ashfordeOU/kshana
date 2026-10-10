// SPDX-License-Identifier: AGPL-3.0-only
//! The verifier: turns a stream of I/NAV pages into per-satellite authentication
//! status with a reason for every failure or delay.
//!
//! Trust flows from a Merkle root (or a loaded public key) to a signed KROOT, then
//! down the TESLA chain to the key that opens the tags of a MACK message, then to the
//! navigation data each tag covers (ICD chapter 6; Receiver Guidelines chapter 5).
//!
//! Time. The chain proves that a key belongs to a given slot, not that the slot is the
//! present one, so the verifier never takes "now" from an unverified page. Its notion of
//! the present is the later of the reference time given with
//! [`Verifier::set_reference_time`] and the slot of the latest TESLA key that verified
//! (a key cannot be known before its slot, so it proves time cannot be earlier). Failure
//! memory, the validity window of an authentication and the eviction of old data all run
//! on that time. Without a reference time the page stamps are only as good as their
//! source: see `docs/OSNMA.md`.

use super::bits::{read_bits, BitWriter};
use super::dsm::{Dsm, DsmAssembler, DsmKroot, DsmPkr};
use super::mac::{self, MacError};
use super::maclt::{MacLookup, Slot};
use super::merkle::{self, MerkleError};
use super::navdata::{self, BitString};
use super::page::{InavPage, GST_LIMIT};
use super::signature::{self, PublicKey, SigError};
use super::subframe::{Mack, MackLayout, NmaHeader, Subframe, SubframeAssembler, SUBFRAME_S};
use super::tables::{HashFn, KeyType, MacFn};
use super::tesla;
use super::OsnmaStatus;
use serde::Serialize;
use std::collections::{BTreeMap, BTreeSet};

/// Sub-frames of extra delay before the key of an ADKD 12 ("slow MAC") tag is sent.
const SLOW_MAC_DELAY: u32 = 10;
/// How many sub-frames of navigation data and pending tags are kept per satellite.
const HISTORY: u32 = 45;
/// How far past the latest verified key a sub-frame may be stamped before its own key
/// has to prove the time.
const AHEAD_S: u32 = 3 * SUBFRAME_S;
/// Most sub-frames of navigation data kept, whatever their stamps.
const HISTORY_CAP: usize = 6000;
/// Default seconds an authentication of a satellite's ephemeris stays valid.
const AUTH_WINDOW_S: u32 = 600;

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
    /// Key id of the public key that signed this chain's root.
    pub pkid: u8,
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
            pkid: k.pkid,
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
    /// Must be below one sub-frame (30 s); larger values are cut to 29. It has an effect
    /// only together with a reference time.
    pub max_time_error_s: Option<u32>,
    /// Seconds an authentication stays valid, measured from the sub-frame of the
    /// authenticated data. Defaults to 600 s.
    pub auth_window_s: Option<u32>,
    /// Accept pages whose CRC does not match. Off by default: a page that fails its
    /// CRC is dropped and reported, as the Receiver Guidelines require.
    pub skip_crc_check: bool,
    /// How long a failed check keeps a satellite at `Failed`, even if later data
    /// verifies: a mismatch is evidence worth remembering. Defaults to 600 s.
    pub failure_memory_s: Option<u32>,
}

impl Config {
    /// Reject settings that would silently weaken the checks.
    pub fn validate(&self) -> Result<(), String> {
        match self.max_time_error_s {
            Some(t) if t >= SUBFRAME_S => Err(format!(
                "the time tolerance must be below one sub-frame ({SUBFRAME_S} s), got {t} s"
            )),
            _ => Ok(()),
        }
    }
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
    /// The sub-frame names a chain (CID) that is not the one verified.
    ChainMismatch,
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
        hash: HashFn,
        mac: MacFn,
        key_bits: usize,
        tag_bits: usize,
        maclt: u8,
    },
    /// The NMA header announced the end of a chain or key; it is no longer trusted.
    ChainRevoked {
        cid: u8,
    },
    PublicKeyRevoked {
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
    /// The chain or the key that signed it was revoked by the NMA header.
    Revoked,
    /// A verified alert message has been received; nothing more is accepted.
    Alert,
}

struct Revoked {
    alpha: Option<[u8; 6]>,
    upto: u32,
}

struct PendingMack {
    cid: u8,
    prna: u8,
    gst: u32,
    nmas: u8,
    mack: Mack,
    slots: Option<Vec<Slot>>,
    macseq_ok: Option<bool>,
    fast_done: bool,
    slow_done: bool,
}

/// A verified chain and the keys verified for it.
struct ChainState {
    chain: Chain,
    keys: BTreeMap<u32, Vec<u8>>,
}

/// What judging one tag produced.
struct Verdict {
    status: TagStatus,
    /// Sub-frame start and IODnav of the data that matched.
    data: Option<(u32, Option<u16>)>,
    /// A dummy tag (COP 0) proves the key, not any data: it never counts for a satellite.
    dummy: bool,
}

impl Verdict {
    fn of(status: TagStatus) -> Self {
        Self {
            status,
            data: None,
            dummy: false,
        }
    }
}

/// Latest verdict per satellite.
#[derive(Debug, Clone, Copy, Default)]
struct SatRecord {
    /// Sub-frame start and IODnav of the newest authenticated ephemeris and clock data.
    ok: Option<(u32, u16)>,
    last_fail: Option<(u32, FailReason)>,
}

pub struct Verifier {
    cfg: Config,
    sf: SubframeAssembler,
    dsm: DsmAssembler,
    chains: BTreeMap<u8, ChainState>,
    public_keys: BTreeMap<u8, PublicKey>,
    /// Chains revoked by the NMA header, by id: the chain's alpha when it was known
    /// (any KROOT of that chain stays out, whatever its time of applicability), else the
    /// announcement time (KROOTs of that id not later than it stay out).
    revoked_cids: BTreeMap<u8, Revoked>,
    revoked_pkids: BTreeSet<u8>,
    history: BTreeMap<(u8, u32), [[u8; 16]; 15]>,
    /// IODnav of the newest ephemeris received per satellite, authenticated or not.
    cur_iod: BTreeMap<u8, (u32, u16)>,
    pending: Vec<PendingMack>,
    sats: BTreeMap<u8, SatRecord>,
    held_kroot: Option<(Dsm, Vec<u8>)>,
    /// NMA header bytes seen while each DSM was being assembled: the signed message
    /// uses the header of one particular sub-frame, which the padding hash identifies.
    dsm_nma: BTreeMap<u8, Vec<u8>>,
    reference: Option<u32>,
    /// Slot of the latest TESLA key that verified.
    latest_key_gst: Option<u32>,
    nmas: u8,
    nmas_seen: bool,
    alert: bool,
}

impl Verifier {
    pub fn new(mut cfg: Config) -> Self {
        cfg.max_time_error_s = cfg.max_time_error_s.map(|t| t.min(SUBFRAME_S - 1));
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
            chains: BTreeMap::new(),
            public_keys,
            revoked_cids: BTreeMap::new(),
            revoked_pkids: BTreeSet::new(),
            history: BTreeMap::new(),
            cur_iod: BTreeMap::new(),
            pending: Vec::new(),
            sats: BTreeMap::new(),
            held_kroot: None,
            dsm_nma: BTreeMap::new(),
            reference: None,
            latest_key_gst: None,
            nmas: 0,
            nmas_seen: false,
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

    /// The verifier's present time: the later of the reference time and the slot of the
    /// latest verified TESLA key. `None` until either exists.
    pub fn trusted_time(&self) -> Option<u32> {
        match (self.reference, self.latest_key_gst) {
            (Some(r), Some(k)) => Some(r.max(k)),
            (r, k) => r.or(k),
        }
    }

    fn adopt_chain(&mut self, c: Chain) {
        let Some(anchor) = c.gst0.checked_sub(SUBFRAME_S) else {
            return;
        };
        let keys = BTreeMap::from([(anchor, c.root_key.clone())]);
        self.chains.insert(c.cid, ChainState { chain: c, keys });
    }

    /// Feed one page; returns the events it caused.
    pub fn push_page(&mut self, page: &InavPage) -> Vec<Event> {
        if page.gst >= GST_LIMIT {
            return vec![Event::TimeRejected { gst_sf: page.gst }];
        }
        if !page.is_nominal() {
            return Vec::new();
        }
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
        if self.alert {
            return ev;
        }
        let nma = sf.nma_header();
        // A sub-frame stamped well past the latest verified key must prove its time with
        // its own key: an unverified stamp never moves the verifier's clock. Whatever
        // cannot is set aside, except the key and alert messages, which carry their own
        // proof (a signature or the Merkle root) and may be what restores a lost chain.
        let ahead = self
            .latest_key_gst
            .is_some_and(|k| sf.gst_sf > k.saturating_add(AHEAD_S));
        if ahead && !self.key_proves_time(&sf, nma) {
            ev.push(Event::TimeRejected { gst_sf: sf.gst_sf });
            if sf.has_osnma {
                self.process_dsm(&sf, &mut ev);
            }
            return ev;
        }
        if sf.has_osnma {
            self.nmas = nma.nmas;
            self.nmas_seen = true;
        }
        self.history.insert((sf.svid, sf.gst_sf), sf.words);
        if let Some(iod) = navdata::iodnav(&sf.words) {
            let newer = self
                .cur_iod
                .get(&sf.svid)
                .is_none_or(|(g, _)| *g <= sf.gst_sf);
            if newer {
                self.cur_iod.insert(sf.svid, (sf.gst_sf, iod));
            }
        }
        if sf.has_osnma {
            self.on_cpks(&sf, nma, &mut ev);
            // Key and alert messages are processed whatever the NMA status (an alert
            // is sent while the status is "don't use"); the tags only when it is usable.
            self.process_dsm(&sf, &mut ev);
            if matches!(nma.nmas, 1 | 2) {
                self.on_mack(&sf, nma, &mut ev);
            } else {
                self.note(&sf, PendingReason::ServiceNotUsable, &mut ev);
            }
        }
        self.evict();
        ev
    }

    fn process_dsm(&mut self, sf: &Subframe, ev: &mut Vec<Event>) {
        let dh = sf.dsm_header();
        let seen = self.dsm_nma.entry(dh.dsm_id).or_default();
        if !seen.contains(&sf.hkroot[0]) && seen.len() < 4 {
            seen.push(sf.hkroot[0]);
        }
        if let Some(d) = self.dsm.push(dh.dsm_id, dh.block_id, sf.dsm_block()) {
            let nma_bytes = self.dsm_nma.remove(&d.dsm_id).unwrap_or_default();
            self.on_dsm(d, nma_bytes, ev);
        }
        self.retry_kroot(ev);
    }

    /// Whether the TESLA key in this sub-frame verifies against the chain it names.
    fn key_proves_time(&self, sf: &Subframe, nma: NmaHeader) -> bool {
        let Some(cs) = self.chains.get(&nma.cid) else {
            return false;
        };
        if !sf.has_osnma {
            return false;
        }
        let layout = MackLayout {
            key_bits: cs.chain.key_bits,
            tag_bits: cs.chain.tag_bits,
        };
        let (Some(mack), Some((ag, ak))) = (
            layout.parse(&sf.mack),
            cs.keys.range(..sf.gst_sf).next_back(),
        ) else {
            return false;
        };
        tesla::verify_key(
            cs.chain.hash,
            &mack.key,
            sf.gst_sf,
            ak,
            *ag,
            &cs.chain.alpha,
        )
        .is_ok()
    }

    /// Drop data that has aged out of the history, by verified time.
    fn evict(&mut self) {
        if let Some(now) = self.trusted_time() {
            let floor = now.saturating_sub(SUBFRAME_S * HISTORY);
            self.history.retain(|&(_, g), _| g >= floor);
            self.pending.retain(|p| p.gst >= floor);
            for cs in self.chains.values_mut() {
                let newest_old = cs.keys.range(..floor).next_back().map(|(g, _)| *g);
                cs.keys.retain(|g, _| *g >= floor || Some(*g) == newest_old);
            }
        }
        while self.history.len() > HISTORY_CAP {
            let Some(oldest) = self.history.keys().min_by_key(|(_, g)| *g).copied() else {
                break;
            };
            self.history.remove(&oldest);
        }
    }

    /// Chain and public key status from the NMA header. A revocation is announced with
    /// NMA status "don't use" and the id of the chain being withdrawn; once the
    /// replacement is in force the same CPKS value goes on with status operational and
    /// the new chain's id, which must not revoke it. The header is not itself
    /// authenticated, so a revocation is final within a session: a forged one can only
    /// take authentication away, never grant it.
    fn on_cpks(&mut self, sf: &Subframe, nma: NmaHeader, ev: &mut Vec<Event>) {
        if nma.nmas != 3 {
            return;
        }
        match nma.cpks {
            3 => {
                let known = self
                    .chains
                    .get(&nma.cid)
                    .map(|c| (c.chain.alpha, c.chain.gst0));
                self.revoked_cids.insert(
                    nma.cid,
                    Revoked {
                        alpha: known.map(|(a, _)| a),
                        upto: known.map_or(sf.gst_sf, |(_, g)| g.max(sf.gst_sf)),
                    },
                );
                if self.chains.remove(&nma.cid).is_some() {
                    self.pending.retain(|p| p.cid != nma.cid);
                    ev.push(Event::ChainRevoked { cid: nma.cid });
                }
            }
            5 => {
                let pkid = self.chains.get(&nma.cid).map(|c| c.chain.pkid);
                if let Some(pkid) = pkid {
                    self.public_keys.remove(&pkid);
                    self.revoked_pkids.insert(pkid);
                    let dropped: Vec<u8> = self
                        .chains
                        .iter()
                        .filter(|(_, c)| c.chain.pkid == pkid)
                        .map(|(cid, _)| *cid)
                        .collect();
                    for cid in dropped {
                        self.chains.remove(&cid);
                        self.pending.retain(|p| p.cid != cid);
                        ev.push(Event::ChainRevoked { cid });
                    }
                    ev.push(Event::PublicKeyRevoked { pkid });
                }
            }
            _ => {}
        }
    }

    fn note(&mut self, sf: &Subframe, why: PendingReason, ev: &mut Vec<Event>) {
        // The tags of such a sub-frame are not looked at, but the sub-frame is reported
        // so the caller can see why the satellite shows no authentication.
        ev.push(Event::Tag(TagResult {
            prna: sf.svid,
            prnd: sf.svid,
            adkd: 0,
            ctr: 1,
            tag_gst: sf.gst_sf,
            data_gst: None,
            nmas: sf.nma_header().nmas,
            status: TagStatus::Pending(why),
        }));
    }

    fn on_dsm(&mut self, d: Dsm, nma_bytes: Vec<u8>, ev: &mut Vec<Event>) {
        if d.dsm_id >= 12 {
            self.on_pkr(&d, ev);
        } else {
            self.try_kroot(d, nma_bytes, ev);
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
                // Everything learned so far is suspect: forget the chains and keys, and
                // accept nothing more until the verifier is restarted.
                self.alert = true;
                self.chains.clear();
                self.public_keys.clear();
                self.pending.clear();
                self.held_kroot = None;
                ev.push(Event::AlertMessage { verified: true });
            }
            Ok(()) => {
                if self.revoked_pkids.contains(&pkr.npkid) {
                    return;
                }
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

    fn try_kroot(&mut self, d: Dsm, nma_bytes: Vec<u8>, ev: &mut Vec<Event>) {
        if self.alert {
            ev.push(Event::KrootRejected(KrootError::Alert));
            return;
        }
        let pkid = d.bytes[0] & 0x0F;
        if self.revoked_pkids.contains(&pkid) {
            ev.push(Event::KrootRejected(KrootError::Revoked));
            return;
        }
        let Some(pk) = self.public_keys.get(&pkid).cloned() else {
            ev.push(Event::KrootRejected(KrootError::NoPublicKey));
            self.held_kroot = Some((d, nma_bytes));
            return;
        };
        let Ok(k) = DsmKroot::parse(&d.bytes, pk.key_type.signature_bits()) else {
            ev.push(Event::KrootRejected(KrootError::Malformed));
            return;
        };
        // Which NMA header the signed message used is told by the padding hash; only the
        // candidates it does not rule out are put to the signature check.
        let candidates: Vec<u8> = nma_bytes
            .iter()
            .copied()
            .filter(|n| k.padding_matches(*n) != Some(false))
            .collect();
        if candidates.is_empty() {
            ev.push(Event::KrootRejected(KrootError::Malformed));
            return;
        }
        let mut result = Err(SigError::Invalid);
        for n in candidates {
            result = signature::verify(&pk, &k.signed_message(n), &k.signature);
            if result.is_ok() {
                break;
            }
        }
        match result {
            Ok(()) => {
                if self
                    .revoked_cids
                    .get(&k.cidkr)
                    .is_some_and(|r| match r.alpha {
                        Some(a) => a == k.alpha,
                        None => k.gst0() <= r.upto,
                    })
                {
                    ev.push(Event::KrootRejected(KrootError::Revoked));
                    return;
                }
                let chain = Chain::from_kroot(&k);
                ev.push(Event::KrootVerified {
                    cid: chain.cid,
                    pkid,
                    hash: chain.hash,
                    mac: chain.mac,
                    key_bits: chain.key_bits,
                    tag_bits: chain.tag_bits,
                    maclt: chain.maclt,
                });
                match self.chains.get_mut(&chain.cid) {
                    Some(cs) if cs.chain.alpha == chain.alpha => {
                        // A KROOT of the chain in force (possibly for a later time of
                        // applicability): one more anchor.
                        if let Some(a) = chain.gst0.checked_sub(SUBFRAME_S) {
                            cs.keys.insert(a, chain.root_key);
                        }
                    }
                    _ => self.adopt_chain(chain),
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
        if self.chains.is_empty() {
            return;
        }
        // Tags belong to the chain the NMA header names; any other is not looked at.
        let Some(cs) = self.chains.get(&nma.cid) else {
            self.note(sf, PendingReason::ChainMismatch, ev);
            return;
        };
        let chain = cs.chain.clone();
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
            cid: chain.cid,
            prna: sf.svid,
            gst: sf.gst_sf,
            nmas: nma.nmas,
            mack,
            slots,
            macseq_ok: None,
            fast_done: false,
            slow_done: false,
        });
        self.process_pending(ev);
    }

    fn accept_key(&mut self, chain: &Chain, gst: u32, key: &[u8], ev: &mut Vec<Event>) {
        let Some(cs) = self.chains.get_mut(&chain.cid) else {
            return;
        };
        if let Some(have) = cs.keys.get(&gst) {
            if have != key {
                ev.push(Event::KeyRejected {
                    gst,
                    reason: FailReason::KeyConflict,
                });
            }
            return;
        }
        let anchor = cs
            .keys
            .range(..gst)
            .next_back()
            .map(|(g, k)| (*g, k.clone()));
        let Some((ag, ak)) = anchor else {
            return;
        };
        match tesla::verify_key(chain.hash, key, gst, &ak, ag, &chain.alpha) {
            Ok(()) => {
                cs.keys.insert(gst, key.to_vec());
                self.latest_key_gst = self.latest_key_gst.max(Some(gst));
                ev.push(Event::KeyVerified { gst });
            }
            Err(_) => ev.push(Event::KeyRejected {
                gst,
                reason: FailReason::KeyChainMismatch,
            }),
        }
    }

    fn process_pending(&mut self, ev: &mut Vec<Event>) {
        let mut pending = std::mem::take(&mut self.pending);
        for p in &mut pending {
            let Some(cs) = self.chains.get(&p.cid) else {
                p.fast_done = true;
                p.slow_done = true;
                continue;
            };
            let chain = cs.chain.clone();
            // The chain's root key (stamped GST_0 - 30) is never a tag key, and a MACK
            // sent before GST_0 - 30 belongs to the previous chain: leave it alone.
            if p.gst + SUBFRAME_S < chain.gst0 {
                p.fast_done = true;
                p.slow_done = true;
                continue;
            }
            let fast_key = cs.keys.get(&(p.gst + SUBFRAME_S)).cloned();
            let slow_key = cs
                .keys
                .get(&(p.gst + SUBFRAME_S * (1 + SLOW_MAC_DELAY)))
                .cloned();
            if let (Some(k), false) = (fast_key, p.fast_done) {
                self.run_mack(&chain, p, &k, false, ev);
                p.fast_done = true;
            }
            if let (Some(k), true, false) = (slow_key, p.fast_done, p.slow_done) {
                self.run_mack(&chain, p, &k, true, ev);
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
                let v = Verdict::of(TagStatus::Pending(PendingReason::UnknownMaclt));
                self.emit(ev, p, 1, p.prna, 0, v);
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
            let v = self.judge(chain, p, key, ctr, tag, prnd, adkd, cop, slot);
            self.emit(ev, p, ctr, prnd, adkd, v);
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
    ) -> Verdict {
        let tag0 = ctr == 1;
        let adkd = if tag0 { 0 } else { adkd };
        match slot {
            Slot::Flexible => match p.macseq_ok {
                Some(true) => {}
                Some(false) => return Verdict::of(TagStatus::Failed(FailReason::MacseqMismatch)),
                None => return Verdict::of(TagStatus::Pending(PendingReason::UnsupportedFunction)),
            },
            Slot::Fixed { adkd: want, own } => {
                if adkd != want || (own && prnd != p.prna) {
                    return Verdict::of(TagStatus::Discarded(DiscardReason::AdkdNotInTable));
                }
            }
        }
        if !matches!(adkd, 0 | 4 | 12) || !(1..=36).contains(&prnd) {
            return Verdict::of(TagStatus::Discarded(DiscardReason::ReservedField));
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
                // `nav` holds `bits` valid bits, so this read cannot come up short.
                m.push(read_bits(&nav.bytes, chunk * 32, n).unwrap_or_default(), n);
            }
            m.into_bytes()
        };
        let matches = |nav: &BitString| -> Result<bool, MacError> {
            let full = mac::compute(chain.mac, key, &build(nav))?;
            Ok(read_bits(&full, 0, chain.tag_bits) == Some(tag))
        };
        if cop == 0 {
            return match navdata::dummy(adkd).map(|n| matches(&n)) {
                Some(Ok(true)) => Verdict {
                    status: TagStatus::Authenticated,
                    data: None,
                    dummy: true,
                },
                Some(Ok(false)) | None => Verdict::of(TagStatus::Failed(FailReason::TagMismatch)),
                Some(Err(_)) => Verdict::of(TagStatus::Pending(PendingReason::UnsupportedFunction)),
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
                Ok(true) => {
                    return Verdict {
                        status: TagStatus::Authenticated,
                        data: Some((g, navdata::iodnav(words))),
                        dummy: false,
                    }
                }
                Ok(false) => {}
                Err(_) => {
                    return Verdict::of(TagStatus::Pending(PendingReason::UnsupportedFunction))
                }
            }
        }
        Verdict::of(if saw_data {
            TagStatus::Failed(FailReason::TagMismatch)
        } else {
            TagStatus::Pending(PendingReason::NoNavData)
        })
    }

    fn emit(
        &mut self,
        ev: &mut Vec<Event>,
        p: &PendingMack,
        ctr: u8,
        prnd: u8,
        adkd: u8,
        v: Verdict,
    ) {
        match v.status {
            TagStatus::Authenticated if !v.dummy && (adkd == 0 || adkd == 12) => {
                if let Some((g, Some(iod))) = v.data {
                    let rec = self.sats.entry(prnd).or_default();
                    if rec.ok.is_none_or(|(og, _)| og <= g) {
                        rec.ok = Some((g, iod));
                    }
                }
            }
            TagStatus::Failed(r) => {
                // A MACSEQ failure says the transmitting satellite's tag layout is not
                // genuine; a mismatch on another satellite's data can come from either
                // side, so both are marked.
                let blamed: Vec<u8> = match r {
                    FailReason::MacseqMismatch => vec![p.prna],
                    _ if prnd != p.prna => vec![prnd, p.prna],
                    _ => vec![prnd],
                };
                for sat in blamed {
                    let rec = self.sats.entry(sat).or_default();
                    if rec.last_fail.is_none_or(|(g, _)| g <= p.gst) {
                        rec.last_fail = Some((p.gst, r));
                    }
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
            data_gst: v.data.map(|(g, _)| g),
            nmas: p.nmas,
            status: v.status,
        }));
    }

    fn status_of(&self, prn: u8, r: &SatRecord) -> OsnmaStatus {
        let unusable = self.alert || (self.nmas_seen && !matches!(self.nmas, 1 | 2));
        let Some(now) = self.trusted_time() else {
            return OsnmaStatus::Unavailable;
        };
        if unusable {
            return OsnmaStatus::Unavailable;
        }
        let memory = self.cfg.failure_memory_s.unwrap_or(600);
        if r.last_fail
            .is_some_and(|(fg, _)| fg.saturating_add(memory) >= now)
        {
            return OsnmaStatus::Failed;
        }
        let window = self.cfg.auth_window_s.unwrap_or(AUTH_WINDOW_S);
        match r.ok {
            // Only while it is recent, and only for the ephemeris still in use: newer,
            // unauthenticated data of the satellite takes the status away again.
            Some((g, iod))
                if now.saturating_sub(g) <= window
                    && self.cur_iod.get(&prn).is_none_or(|(_, c)| *c == iod) =>
            {
                OsnmaStatus::Authenticated
            }
            _ => OsnmaStatus::Unavailable,
        }
    }

    /// Per-satellite status in the form the receiver-trust monitor consumes:
    /// `Failed` when a check on the satellite's data failed within the failure memory,
    /// else `Authenticated` when its ephemeris and clock data verified recently and is
    /// still the data in use, else `Unavailable`. After a verified alert message or
    /// with NMA status "don't use" every satellite is `Unavailable`.
    pub fn sat_status(&self) -> Vec<(String, OsnmaStatus)> {
        self.sats
            .iter()
            .map(|(prn, r)| (format!("E{prn:02}"), self.status_of(*prn, r)))
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
