// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end checks of the OSNMA verifier on synthetic data built by this test: a
//! TESLA chain, I/NAV pages carrying MACK sections, and tags computed from the
//! equations the verifier implements. The message layout here is written out
//! separately from the verifier's, but it is still our own reading of the ICD, so it
//! shows consistency and that corruption is caught, not conformance. Conformance is
//! checked by the opt-in official-vector test (`osnma_official_vectors.rs`).

use kshana::osnma::bits::{read_bits, BitWriter};
use kshana::osnma::mac;
use kshana::osnma::tables::{HashFn, MacFn};
use kshana::osnma::tesla;
use kshana::osnma::verifier::{
    Chain, Config, Event, FailReason, PendingReason, TagStatus, Verifier,
};
use kshana::osnma::{InavPage, OsnmaStatus};
use sha2::{Digest, Sha256};

const WN: u32 = 1248;
const GST0: u32 = WN * kshana::osnma::WEEK_S + 345_600;
const ALPHA: [u8; 6] = [0x11, 0x22, 0x33, 0x44, 0x55, 0x66];
const KEY_BITS: usize = 128;
const TAG_BITS: usize = 40;
const NMAS: u8 = 2;
const PRNA: u8 = 2; // transmits OSNMA
const PRN_X: u8 = 5; // does not; authenticated by cross-authentication
const SUBFRAMES: u32 = 18;

fn key_at(chain: &[Vec<u8>], gst: u32) -> Vec<u8> {
    // Key transmitted at GST0 + 30 (i - 1) is K_i; K_0 is stamped GST0 - 30.
    chain[((gst - GST0) / 30 + 1) as usize].clone()
}

fn make_chain(n: u32) -> Vec<Vec<u8>> {
    let mut seq = vec![(0..KEY_BITS / 8)
        .map(|i| (i * 13 + 5) as u8)
        .collect::<Vec<u8>>()];
    for i in (0..n).rev() {
        let gst = GST0 + 30 * i - 30;
        let next = tesla::step(HashFn::Sha256, seq.last().unwrap(), gst, &ALPHA, KEY_BITS);
        seq.push(next);
    }
    seq.reverse();
    seq
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

/// The 15 words of a sub-frame of satellite `prn`; the content depends on the sub-frame.
fn words(prn: u8, gst: u32) -> [[u8; 16]; 15] {
    let seed = prn.wrapping_mul(31).wrapping_add((gst / 30) as u8);
    let iod = u64::from(gst / 30 % 1024);
    let mut ws = [[0u8; 16]; 15];
    for (i, wt) in [1u8, 2, 3, 4, 5, 6, 10].iter().enumerate() {
        ws[i] = word(*wt, iod, seed);
    }
    // Word type 5 carries the week and time of week of its page (index 4, labelled one
    // second after the sub-frame start as in broadcast data), after its 73 data bits.
    let label = gst + 2 * 4 + 1;
    let mut t = BitWriter::new();
    for k in 0..73 {
        t.push(read_bits(&ws[4], k, 1).unwrap(), 1);
    }
    t.push(u64::from(label / kshana::osnma::WEEK_S), 12);
    t.push(u64::from(label % kshana::osnma::WEEK_S), 20);
    t.push(0, 23);
    ws[4].copy_from_slice(&t.into_bytes());
    ws
}

/// Navigation data bits of the sub-frame at `gst` for ADKD 0 / 4, built from the
/// documented field widths (independent of the verifier's piece table).
fn navdata(prn: u8, gst: u32, adkd: u8) -> (Vec<u8>, usize) {
    let ws = words(prn, gst);
    let find = |wt: u8| *ws.iter().find(|w| (w[0] >> 2) == wt).unwrap();
    let mut out = BitWriter::new();
    let mut take = |w: &[u8; 16], off: usize, n: usize| {
        let mut done = 0;
        while done < n {
            let k = (n - done).min(32);
            out.push(read_bits(w, off + done, k).unwrap(), k);
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

fn nma_byte() -> u8 {
    (NMAS << 6) | (3 << 4) | (1 << 1)
}

fn tag_msg(prnd: Option<u8>, prna: u8, gst: u32, ctr: u8, nav: &(Vec<u8>, usize)) -> Vec<u8> {
    let mut m = BitWriter::new();
    if let Some(d) = prnd {
        m.push(u64::from(d), 8);
    }
    m.push(u64::from(prna), 8);
    m.push(u64::from(kshana::osnma::gst_pack(gst)), 32);
    m.push(u64::from(ctr), 8);
    m.push(u64::from(NMAS), 2);
    for i in 0..nav.1 {
        m.push(read_bits(&nav.0, i, 1).unwrap(), 1);
    }
    m.into_bytes()
}

fn mac_tag(key: &[u8], msg: &[u8]) -> u64 {
    let full = mac::compute(MacFn::HmacSha256, key, msg).unwrap();
    read_bits(&full, 0, TAG_BITS).unwrap()
}

/// Tag-Info of tags 1..5 for a MACK transmitted at `gst` (MACLT 34): flexible slots
/// carry cross-authentication of ADKD 0 for `PRN_X`.
struct Plan {
    // (slot spec, prnd, adkd)
    tags: Vec<(u8, u8)>,
}

fn plan(gst: u32) -> Plan {
    // MACLT 34, first message: 00S FLX 04S FLX 12S 00E ; second: 00S FLX 00E 12S 00E 12E
    let first = gst % 60 == 0;
    let tags = if first {
        vec![(PRN_X, 0), (PRNA, 4), (PRN_X, 0), (PRNA, 12), (PRN_X, 0)]
    } else {
        vec![(PRN_X, 0), (PRN_X, 0), (PRNA, 12), (PRN_X, 0), (PRN_X, 12)]
    };
    Plan { tags }
}

fn mack_bytes(chain: &[Vec<u8>], gst: u32) -> [u8; 60] {
    let k_next = key_at(chain, gst + 30);
    let p = plan(gst);
    let mut w = BitWriter::new();
    let t0 = mac_tag(
        &k_next,
        &tag_msg(None, PRNA, gst, 1, &navdata(PRNA, gst - 30, 0)),
    );
    // MACSEQ over the Tag-Info of the flexible slots (positions 1 and 3 of the table).
    let flex_idx: Vec<usize> = if gst % 60 == 0 { vec![0, 2] } else { vec![0] };
    let mut ms = BitWriter::new();
    ms.push(u64::from(PRNA), 8);
    ms.push(u64::from(kshana::osnma::gst_pack(gst)), 32);
    // Slot 4 of the second sequence is also flexible in entry 34? No: only slot 1.
    for i in &flex_idx {
        let (prnd, adkd) = p.tags[*i];
        ms.push((u64::from(prnd) << 8) | (u64::from(adkd) << 4) | 1, 16);
    }
    let macseq = read_bits(
        &mac::compute(MacFn::HmacSha256, &k_next, &ms.into_bytes()).unwrap(),
        0,
        12,
    )
    .unwrap();
    w.push(t0, TAG_BITS);
    w.push(macseq, 12);
    w.push(1, 4);
    for (i, (prnd, adkd)) in p.tags.iter().enumerate() {
        let ctr = i as u8 + 2;
        let nav = navdata(*prnd, gst - 30, if *adkd == 4 { 4 } else { 0 });
        let tag = if *adkd == 12 {
            // Slow MAC: key published ten sub-frames later.
            mac_tag(
                &key_at(chain, gst + 330),
                &tag_msg(Some(*prnd), PRNA, gst, ctr, &nav),
            )
        } else {
            mac_tag(&k_next, &tag_msg(Some(*prnd), PRNA, gst, ctr, &nav))
        };
        w.push(tag, TAG_BITS);
        w.push(u64::from(*prnd), 8);
        w.push(u64::from(*adkd), 4);
        w.push(1, 4);
    }
    w.push(
        u64::from_be_bytes(key_at(chain, gst)[..8].try_into().unwrap()),
        64,
    );
    w.push(
        u64::from_be_bytes(key_at(chain, gst)[8..16].try_into().unwrap()),
        64,
    );
    w.push(0, 480 - w.bit_len());
    let mut out = [0u8; 60];
    out.copy_from_slice(&w.into_bytes());
    out
}

fn plain_hkroot() -> [u8; 15] {
    let mut hk = [0u8; 15];
    hk[0] = nma_byte();
    hk
}

fn pages(svid: u8, gst: u32, ws: &[[u8; 16]; 15], mack: Option<&[u8; 60]>) -> Vec<InavPage> {
    pages_hk(svid, gst, ws, mack, &plain_hkroot())
}

fn pages_hk(
    svid: u8,
    gst: u32,
    ws: &[[u8; 16]; 15],
    mack: Option<&[u8; 60]>,
    hkroot: &[u8; 15],
) -> Vec<InavPage> {
    (0..15usize)
        .map(|i| {
            let mut b = BitWriter::new();
            b.push(0, 2);
            for k in 0..112 {
                b.push(read_bits(&ws[i], k, 1).unwrap(), 1);
            }
            b.push(0, 6);
            b.push(0b10, 2);
            for k in 0..16 {
                b.push(read_bits(&ws[i], 112 + k, 1).unwrap(), 1);
            }
            match mack {
                Some(m) => {
                    b.push(u64::from(hkroot[i]), 8);
                    b.push(
                        u64::from(u32::from_be_bytes(m[i * 4..i * 4 + 4].try_into().unwrap())),
                        32,
                    );
                }
                None => b.push(0, 40),
            }
            b.push(0, 240 - b.bit_len());
            // The page time carries the one-second E1 offset, as in broadcast data.
            InavPage::from_hex(svid, gst + 2 * i as u32 + 1, &hex::encode(b.into_bytes()))
                .unwrap()
                .with_valid_crc()
        })
        .collect()
}

fn config() -> Config {
    let chain = make_chain(SUBFRAMES + 20);
    Config {
        trusted_chain: Some(Chain {
            cid: 3,
            hash: HashFn::Sha256,
            mac: MacFn::HmacSha256,
            key_bits: KEY_BITS,
            tag_bits: TAG_BITS,
            maclt: 34,
            alpha: ALPHA,
            gst0: GST0,
            root_key: chain[0].clone(),
        }),
        ..Config::default()
    }
}

/// Feed `SUBFRAMES` sub-frames from the two satellites; `tamper` may alter pages.
fn run(mut tamper: impl FnMut(u32, u8, &mut Vec<InavPage>)) -> (Verifier, Vec<Event>) {
    let chain = make_chain(SUBFRAMES + 20);
    let mut v = Verifier::new(config());
    let mut events = Vec::new();
    for n in 0..SUBFRAMES {
        let gst = GST0 + 30 * n;
        let mut a = pages(PRNA, gst, &words(PRNA, gst), Some(&mack_bytes(&chain, gst)));
        let mut x = pages(PRN_X, gst, &words(PRN_X, gst), None);
        tamper(gst, PRNA, &mut a);
        tamper(gst, PRN_X, &mut x);
        for p in x.iter().chain(a.iter()) {
            events.extend(v.push_page(p));
        }
    }
    (v, events)
}

fn tags(events: &[Event]) -> Vec<&kshana::osnma::verifier::TagResult> {
    events
        .iter()
        .filter_map(|e| if let Event::Tag(t) = e { Some(t) } else { None })
        .collect()
}

#[test]
fn clean_stream_authenticates_both_satellites() {
    let (v, events) = run(|_, _, _| {});
    assert!(!tags(&events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
    assert!(events
        .iter()
        .any(|e| matches!(e, Event::KeyVerified { .. })));
    let s: std::collections::BTreeMap<_, _> = v.sat_status().into_iter().collect();
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);
    assert_eq!(v.overall(), OsnmaStatus::Authenticated);
    // Slow-MAC tags were decided too once their keys arrived.
    assert!(tags(&events)
        .iter()
        .any(|t| t.adkd == 12 && t.status == TagStatus::Authenticated));
    assert!(tags(&events)
        .iter()
        .any(|t| t.adkd == 4 && t.status == TagStatus::Authenticated));
}

#[test]
fn flipped_navigation_bit_fails_that_satellite_only() {
    let target = GST0 + 30 * 6;
    let (v, events) = run(|gst, svid, pgs| {
        if gst == target && svid == PRN_X {
            // Flip one bit inside the authenticated part of the word-type-1 data.
            let p = &pgs[0];
            let mut hexs = hex::encode(p.bytes());
            let mut raw = hex::decode(&hexs).unwrap();
            raw[3] ^= 0x10;
            hexs = hex::encode(raw);
            pgs[0] = InavPage::from_hex(p.svid, p.gst, &hexs)
                .unwrap()
                .with_valid_crc();
        }
    });
    let s: std::collections::BTreeMap<_, _> = v.sat_status().into_iter().collect();
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert!(tags(&events)
        .iter()
        .any(|t| t.prnd == PRN_X && t.status == TagStatus::Failed(FailReason::TagMismatch)));
    assert_eq!(v.overall(), OsnmaStatus::Failed);
}

#[test]
fn flipped_key_bit_is_rejected_and_nothing_after_it_authenticates() {
    let chain = make_chain(SUBFRAMES + 20);
    let target = GST0 + 30 * 3;
    let (_, events) = run(|gst, svid, pgs| {
        if gst == target && svid == PRNA {
            let mut m = mack_bytes(&chain, gst);
            m[50] ^= 1; // inside the 128-bit key field (bytes 42..58)
            *pgs = pages(PRNA, gst, &words(PRNA, gst), Some(&m));
        }
    });
    assert!(events.iter().any(|e| matches!(
        e,
        Event::KeyRejected {
            gst,
            reason: FailReason::KeyChainMismatch
        } if *gst == target
    )));
}

#[test]
fn replayed_tags_do_not_authenticate_later_data() {
    let chain = make_chain(SUBFRAMES + 20);
    let old = GST0 + 30 * 4;
    let new = old + 60;
    let (v, events) = run(|gst, svid, pgs| {
        if gst == new && svid == PRNA {
            // Old tags (everything before the key field) with the genuine new key.
            let mut m = mack_bytes(&chain, old);
            m[42..].copy_from_slice(&mack_bytes(&chain, new)[42..]);
            *pgs = pages(PRNA, gst, &words(PRNA, gst), Some(&m));
        }
    });
    assert!(tags(&events)
        .iter()
        .any(|t| t.tag_gst == new && t.status == TagStatus::Failed(FailReason::TagMismatch)));
    assert_eq!(v.overall(), OsnmaStatus::Failed);
}

#[test]
fn wrong_time_stamps_break_the_key_chain() {
    // Every page of satellite 2 claims a time 60 s later than the data was built for.
    let (_, events) = run(|_, svid, pgs| {
        if svid == PRNA {
            for p in pgs.iter_mut() {
                *p = InavPage::from_hex(p.svid, p.gst + 60, &hex::encode(p.bytes())).unwrap();
            }
        }
    });
    assert!(!tags(&events)
        .iter()
        .any(|t| t.status == TagStatus::Authenticated));
    assert!(events.iter().any(|e| matches!(
        e,
        Event::KeyRejected {
            reason: FailReason::KeyChainMismatch,
            ..
        }
    )));
}

#[test]
fn reference_time_rejects_distant_sub_frames() {
    let mut cfg = config();
    cfg.max_time_error_s = Some(60);
    let mut v = Verifier::new(cfg);
    v.set_reference_time(GST0 + 100_000);
    let chain = make_chain(SUBFRAMES + 20);
    let gst = GST0 + 30;
    let mut ev = Vec::new();
    for p in pages(PRNA, gst, &words(PRNA, gst), Some(&mack_bytes(&chain, gst))) {
        ev.extend(v.push_page(&p));
    }
    assert!(ev.iter().any(|e| matches!(e, Event::TimeRejected { .. })));
    assert_eq!(v.overall(), OsnmaStatus::Unavailable);
}

#[test]
fn missing_navigation_data_stays_pending_not_failed() {
    // Satellite 5 never transmits: its cross-authentication tags cannot be decided.
    let chain = make_chain(SUBFRAMES + 20);
    let mut v = Verifier::new(config());
    let mut events = Vec::new();
    for n in 0..8u32 {
        let gst = GST0 + 30 * n;
        for p in pages(PRNA, gst, &words(PRNA, gst), Some(&mack_bytes(&chain, gst))) {
            events.extend(v.push_page(&p));
        }
    }
    let t = tags(&events);
    assert!(t
        .iter()
        .any(|t| t.prnd == PRN_X && t.status == TagStatus::Pending(PendingReason::NoNavData)));
    assert!(!t.iter().any(|t| matches!(t.status, TagStatus::Failed(_))));
}

// ---- Signed DSM-KROOT: the chain is established from the stream, not injected. ----

use kshana::osnma::signature::PublicKey;
use kshana::osnma::signature::SigError;
use kshana::osnma::tables::KeyType;
use kshana::osnma::verifier::KrootError;
use p256::ecdsa::{signature::Signer, Signature, SigningKey};

const PKID: u8 = 1;

fn throwaway_key(seed: u8) -> SigningKey {
    SigningKey::from_slice(&[seed; 32]).unwrap()
}

fn public_key(sk: &SigningKey) -> PublicKey {
    PublicKey {
        pkid: PKID,
        key_type: KeyType::P256,
        bytes: sk
            .verifying_key()
            .to_encoded_point(true)
            .as_bytes()
            .to_vec(),
    }
}

/// A DSM-KROOT of 8 blocks (104 bytes) for the test chain, signed with `sk`.
fn dsm_kroot(chain: &[Vec<u8>], sk: &SigningKey) -> Vec<u8> {
    let mut d = vec![0u8; 104];
    d[0] = (2 << 4) | PKID; // NBDK 2 = 8 blocks
    d[1] = 3 << 6; // CIDKR 3, HF 0 (SHA-256), MF 0 (HMAC-SHA-256)
    d[2] = (4 << 4) | 9; // KS 4 = 128 bit, TS 9 = 40 bit
    d[3] = 34; // MACLT
    d[4] = (WN >> 8) as u8; // reserved nibble 0, then the 12-bit week number
    d[5] = WN as u8;
    d[6] = ((GST0 % kshana::osnma::WEEK_S) / 3600) as u8;
    d[7..13].copy_from_slice(&ALPHA);
    d[13..29].copy_from_slice(&chain[0]);
    let mut m = vec![nma_byte()];
    m.extend_from_slice(&d[1..29]);
    let sig: Signature = sk.sign(&m);
    d[29..93].copy_from_slice(&sig.to_bytes());
    d
}

fn run_signed(
    cfg: Config,
    dsm: &[u8],
    mut tamper: impl FnMut(u32, u8, &mut Vec<InavPage>),
) -> (Verifier, Vec<Event>, Vec<InavPage>) {
    let chain = make_chain(40);
    let mut v = Verifier::new(cfg);
    let (mut events, mut all) = (Vec::new(), Vec::new());
    for n in 0..24u32 {
        let gst = GST0 + 30 * n;
        let bid = (n % 8) as usize;
        let mut hk = plain_hkroot();
        hk[1] = bid as u8; // DSM id 0, block id n mod 8
        hk[2..].copy_from_slice(&dsm[bid * 13..bid * 13 + 13]);
        let mut a = pages_hk(
            PRNA,
            gst,
            &words(PRNA, gst),
            Some(&mack_bytes(&chain, gst)),
            &hk,
        );
        let mut x = pages(PRN_X, gst, &words(PRN_X, gst), None);
        tamper(gst, PRNA, &mut a);
        tamper(gst, PRN_X, &mut x);
        for p in x.iter().chain(a.iter()) {
            events.extend(v.push_page(p));
            all.push(p.clone());
        }
    }
    (v, events, all)
}

fn signed_cfg(pk: PublicKey) -> Config {
    Config {
        public_keys: vec![pk],
        ..Config::default()
    }
}

#[test]
fn signed_kroot_establishes_the_chain_and_everything_authenticates() {
    let chain = make_chain(40);
    let sk = throwaway_key(0x11);
    let (v, events, _) = run_signed(
        signed_cfg(public_key(&sk)),
        &dsm_kroot(&chain, &sk),
        |_, _, _| {},
    );
    assert!(events
        .iter()
        .any(|e| matches!(e, Event::KrootVerified { cid: 3, pkid: 1 })));
    assert!(!tags(&events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
    let s: std::collections::BTreeMap<_, _> = v.sat_status().into_iter().collect();
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);
}

#[test]
fn a_bad_signature_or_wrong_key_authenticates_nothing() {
    let chain = make_chain(40);
    let sk = throwaway_key(0x11);
    let good = dsm_kroot(&chain, &sk);

    // One bit of the signature flipped in transit.
    let mut bad_sig = good.clone();
    bad_sig[40] ^= 0x01;
    let (v, events, _) = run_signed(signed_cfg(public_key(&sk)), &bad_sig, |_, _, _| {});
    assert!(events.iter().any(|e| matches!(
        e,
        Event::KrootRejected(KrootError::Signature(SigError::Invalid))
    )));
    assert!(!tags(&events)
        .iter()
        .any(|t| t.status == TagStatus::Authenticated));
    assert_eq!(v.overall(), OsnmaStatus::Unavailable);

    // The root key altered after signing.
    let mut bad_root = good.clone();
    bad_root[20] ^= 0x80;
    let (_, events, _) = run_signed(signed_cfg(public_key(&sk)), &bad_root, |_, _, _| {});
    assert!(!tags(&events)
        .iter()
        .any(|t| t.status == TagStatus::Authenticated));

    // Signed by a key the receiver does not trust.
    let other = throwaway_key(0x22);
    let (_, events, _) = run_signed(
        signed_cfg(public_key(&sk)),
        &dsm_kroot(&chain, &other),
        |_, _, _| {},
    );
    assert!(events.iter().any(|e| matches!(
        e,
        Event::KrootRejected(KrootError::Signature(SigError::Invalid))
    )));
    assert!(!tags(&events)
        .iter()
        .any(|t| t.status == TagStatus::Authenticated));

    // No key for the named key id at all.
    let (_, events, _) = run_signed(Config::default(), &good, |_, _, _| {});
    assert!(events
        .iter()
        .any(|e| matches!(e, Event::KrootRejected(KrootError::NoPublicKey))));
}

fn write_pages(path: &std::path::Path, pages: &[InavPage]) {
    let mut out = String::from("# synthetic pages\n");
    for p in pages {
        out.push_str(&format!(
            "{} {} {}\n",
            p.svid,
            p.gst,
            hex::encode(p.bytes())
        ));
    }
    std::fs::write(path, out).unwrap();
}

fn cli(args: &[&str]) -> (i32, serde_json::Value) {
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["osnma", "verify"])
        .args(args)
        .output()
        .unwrap();
    let json = serde_json::from_slice(&out.stdout).unwrap_or(serde_json::Value::Null);
    (out.status.code().unwrap(), json)
}

#[test]
fn command_line_reports_status_per_satellite_and_exit_code() {
    let chain = make_chain(40);
    let sk = throwaway_key(0x11);
    let dsm = dsm_kroot(&chain, &sk);
    let key_arg = format!("{PKID}:p256:{}", hex::encode(public_key(&sk).bytes));
    let dir = std::env::temp_dir().join(format!("kshana-osnma-cli-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();

    let (_, _, clean) = run_signed(signed_cfg(public_key(&sk)), &dsm, |_, _, _| {});
    let f = dir.join("clean.txt");
    write_pages(&f, &clean);
    let (code, j) = cli(&[f.to_str().unwrap(), "--public-key", &key_arg, "--json"]);
    assert_eq!(code, 0);
    assert_eq!(j["overall"], "authenticated");
    assert!(j["advisory"]
        .as_str()
        .unwrap()
        .contains("not type-approved navigation equipment"));
    let sats: Vec<(String, String)> = j["satellites"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| {
            (
                s["sat"].as_str().unwrap().into(),
                s["status"].as_str().unwrap().into(),
            )
        })
        .collect();
    assert!(sats.contains(&("E02".into(), "authenticated".into())));
    assert!(sats.contains(&("E05".into(), "authenticated".into())));
    assert!(j["pksos"].as_str().unwrap().starts_with("$PKSOS,A,"));

    // One flipped navigation bit in satellite 5's data: that satellite fails, exit 3.
    let target = GST0 + 30 * 12;
    let (_, _, bad) = run_signed(signed_cfg(public_key(&sk)), &dsm, |gst, svid, pgs| {
        if gst == target && svid == PRN_X {
            let mut raw = pgs[0].bytes().to_vec();
            raw[3] ^= 0x10;
            pgs[0] = InavPage::from_hex(pgs[0].svid, pgs[0].gst, &hex::encode(raw))
                .unwrap()
                .with_valid_crc();
        }
    });
    let f = dir.join("bad.txt");
    write_pages(&f, &bad);
    let (code, j) = cli(&[f.to_str().unwrap(), "--public-key", &key_arg, "--json"]);
    assert_eq!(code, 3);
    assert_eq!(j["overall"], "failed");

    // Without a trusted key nothing can be authenticated.
    let (code, j) = cli(&[f.to_str().unwrap(), "--json"]);
    assert_eq!(code, 0);
    assert_eq!(j["overall"], "unavailable");

    // Usage errors.
    assert_eq!(cli(&[]).0, 2);
    assert_eq!(cli(&["/nonexistent/file"]).0, 2);
    let _ = std::fs::remove_dir_all(&dir);
}

// ---- The same signed stream delivered as a u-blox UBX-RXM-SFRBX byte stream. ----

fn sfrbx_frame(p: &InavPage) -> Vec<u8> {
    let mut stream = [0u8; 32];
    stream[..15].copy_from_slice(&p.bytes()[..15]);
    stream[16..31].copy_from_slice(&p.bytes()[15..]);
    let mut payload = vec![2, p.svid, 1, 0, 8, 0, 2, 0];
    for w in 0..8 {
        let be = u32::from_be_bytes(stream[4 * w..4 * w + 4].try_into().unwrap());
        payload.extend_from_slice(&be.to_le_bytes());
    }
    let mut f = vec![0xB5, 0x62, 0x02, 0x13];
    f.extend_from_slice(&(payload.len() as u16).to_le_bytes());
    f.extend_from_slice(&payload);
    let (mut a, mut b) = (0u8, 0u8);
    for x in &f[2..] {
        a = a.wrapping_add(*x);
        b = b.wrapping_add(a);
    }
    f.extend_from_slice(&[a, b]);
    f
}

#[test]
fn a_ubx_stream_authenticates_like_the_page_file() {
    let chain = make_chain(40);
    let sk = throwaway_key(0x11);
    let (_, _, all) = run_signed(
        signed_cfg(public_key(&sk)),
        &dsm_kroot(&chain, &sk),
        |_, _, _| {},
    );
    let mut bytes = vec![0x00, 0xB5, 0x62, 0x01]; // leading noise
    for p in &all {
        bytes.extend(sfrbx_frame(p));
    }
    let (pages, stats) = kshana::osnma::ubx::pages_from_ubx(&bytes);
    assert_eq!(stats.bad_crc, 0);
    assert_eq!(stats.time_conflicts, 0);
    assert!(
        pages.len() > all.len() * 9 / 10,
        "{} of {}",
        pages.len(),
        all.len()
    );
    let mut v = Verifier::new(signed_cfg(public_key(&sk)));
    for p in &pages {
        v.push_page(p);
    }
    let s: std::collections::BTreeMap<_, _> = v.sat_status().into_iter().collect();
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);

    // Through the command line, auto-detected as UBX.
    let dir = std::env::temp_dir().join(format!("kshana-osnma-ubx-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let f = dir.join("stream.ubx");
    std::fs::write(&f, &bytes).unwrap();
    let key_arg = format!("{PKID}:p256:{}", hex::encode(public_key(&sk).bytes));
    let (code, j) = cli(&[f.to_str().unwrap(), "--public-key", &key_arg, "--json"]);
    assert_eq!(code, 0);
    assert_eq!(j["overall"], "authenticated");
    assert!(j["ubx"]["inav_pages"].as_u64().unwrap() > 0);
    let _ = std::fs::remove_dir_all(&dir);
}
