// SPDX-License-Identifier: AGPL-3.0-only
//! End-to-end checks of the OSNMA verifier on synthetic data built by this test: TESLA
//! chains, I/NAV pages carrying MACK sections, DSM-KROOT and DSM-PKR messages, and tags
//! computed from the equations the verifier implements. The message layout here is
//! written out separately from the verifier's, but it is still our own reading of the
//! ICD, so it shows consistency and that corruption and attacks are caught, not
//! conformance. Conformance is checked by the opt-in official-vector test
//! (`osnma_official_vectors.rs`).

use kshana::osnma::bits::{read_bits, BitWriter};
use kshana::osnma::mac;
use kshana::osnma::signature::{PublicKey, SigError};
use kshana::osnma::tables::{HashFn, KeyType, MacFn};
use kshana::osnma::tesla;
use kshana::osnma::verifier::{
    Chain, Config, Event, FailReason, KrootError, PendingReason, TagResult, TagStatus, Verifier,
};
use kshana::osnma::{InavPage, OsnmaStatus, WEEK_S};
use rand::SeedableRng;
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;

const WN: u32 = 1248;
/// Start of the stream and time of applicability of the first chain (hour aligned).
const GST0: u32 = WN * WEEK_S + 345_600;
const ALPHA: [u8; 6] = [0x11, 0x22, 0x33, 0x44, 0x55, 0x66];
const KEY_BITS: usize = 128;
const TAG_BITS: usize = 40;
const PRNA: u8 = 2; // transmits OSNMA
const PRN_X: u8 = 5; // does not; authenticated by cross-authentication
const SUBFRAMES: u32 = 18;
const PKID: u8 = 1;

/// Everything that distinguishes one chain from another.
#[derive(Clone)]
struct Ctx {
    hash: HashFn,
    mac: MacFn,
    cid: u8,
    alpha: [u8; 6],
    gst0: u32,
    seed: u8,
    nmas: u8,
    /// Tags for `PRN_X` are dummy tags (COP 0, computed over zeros).
    dummy_x: bool,
}

impl Ctx {
    fn std() -> Self {
        Self {
            hash: HashFn::Sha256,
            mac: MacFn::HmacSha256,
            cid: 3,
            alpha: ALPHA,
            gst0: GST0,
            seed: 5,
            nmas: 2,
            dummy_x: false,
        }
    }

    /// Keys K_0 (the root, stamped `gst0 - 30`) to K_n.
    fn chain(&self, n: u32) -> Vec<Vec<u8>> {
        let mut seq = vec![(0..KEY_BITS / 8)
            .map(|i| (i * 13 + usize::from(self.seed)) as u8)
            .collect::<Vec<u8>>()];
        for i in (0..n).rev() {
            let gst = self.gst0 + 30 * i - 30;
            let next = tesla::step(self.hash, seq.last().unwrap(), gst, &self.alpha, KEY_BITS);
            seq.push(next);
        }
        seq.reverse();
        seq
    }

    /// The key transmitted at `gst` is K_i with i = (gst - gst0) / 30 + 1.
    fn key_at(&self, chain: &[Vec<u8>], gst: u32) -> Vec<u8> {
        chain[((gst - self.gst0) / 30 + 1) as usize].clone()
    }

    fn header(&self, cpks: u8) -> u8 {
        (self.nmas << 6) | (self.cid << 4) | (cpks << 1)
    }

    fn mac_tag(&self, key: &[u8], msg: &[u8]) -> u64 {
        let full = mac::compute(self.mac, key, msg).unwrap();
        read_bits(&full, 0, TAG_BITS).unwrap()
    }

    fn tag_msg(
        &self,
        prnd: Option<u8>,
        prna: u8,
        gst: u32,
        ctr: u8,
        nav: &(Vec<u8>, usize),
    ) -> Vec<u8> {
        let mut m = BitWriter::new();
        if let Some(d) = prnd {
            m.push(u64::from(d), 8);
        }
        m.push(u64::from(prna), 8);
        m.push(u64::from(kshana::osnma::gst_pack(gst)), 32);
        m.push(u64::from(ctr), 8);
        m.push(u64::from(self.nmas), 2);
        for i in 0..nav.1 {
            m.push(read_bits(&nav.0, i, 1).unwrap(), 1);
        }
        m.into_bytes()
    }

    fn cop(&self, prnd: u8) -> u8 {
        if self.dummy_x && prnd == PRN_X {
            0
        } else {
            1
        }
    }

    /// The MACK of `PRNA` transmitted at `gst` (MACLT 34): flexible slots carry
    /// cross-authentication of ADKD 0 for `PRN_X`.
    fn mack(&self, chain: &[Vec<u8>], gst: u32) -> [u8; 60] {
        let k_next = self.key_at(chain, gst + 30);
        let p = plan(gst);
        let mut w = BitWriter::new();
        let t0 = self.mac_tag(
            &k_next,
            &self.tag_msg(None, PRNA, gst, 1, &navdata(PRNA, gst - 30, 0)),
        );
        // MACSEQ over the Tag-Info of the flexible slots (positions 1 and 3 of the table).
        let flex_idx: Vec<usize> = if gst % 60 == 0 { vec![0, 2] } else { vec![0] };
        let mut ms = BitWriter::new();
        ms.push(u64::from(PRNA), 8);
        ms.push(u64::from(kshana::osnma::gst_pack(gst)), 32);
        for i in &flex_idx {
            let (prnd, adkd) = p.tags[*i];
            ms.push(
                (u64::from(prnd) << 8) | (u64::from(adkd) << 4) | u64::from(self.cop(prnd)),
                16,
            );
        }
        let macseq = read_bits(
            &mac::compute(self.mac, &k_next, &ms.into_bytes()).unwrap(),
            0,
            12,
        )
        .unwrap();
        w.push(t0, TAG_BITS);
        w.push(macseq, 12);
        w.push(1, 4);
        for (i, (prnd, adkd)) in p.tags.iter().enumerate() {
            let ctr = i as u8 + 2;
            let cop = self.cop(*prnd);
            let nav = if cop == 0 {
                // The data of a dummy tag is all zeros of the right length.
                let bits: usize = if *adkd == 4 { 141 } else { 549 };
                (vec![0u8; bits.div_ceil(8)], bits)
            } else {
                navdata(*prnd, gst - 30, if *adkd == 4 { 4 } else { 0 })
            };
            let key = if *adkd == 12 {
                // Slow MAC: key published ten sub-frames later.
                self.key_at(chain, gst + 330)
            } else {
                k_next.clone()
            };
            w.push(
                self.mac_tag(&key, &self.tag_msg(Some(*prnd), PRNA, gst, ctr, &nav)),
                TAG_BITS,
            );
            w.push(u64::from(*prnd), 8);
            w.push(u64::from(*adkd), 4);
            w.push(u64::from(cop), 4);
        }
        let k = self.key_at(chain, gst);
        w.push(u64::from_be_bytes(k[..8].try_into().unwrap()), 64);
        w.push(u64::from_be_bytes(k[8..16].try_into().unwrap()), 64);
        w.push(0, 480 - w.bit_len());
        let mut out = [0u8; 60];
        out.copy_from_slice(&w.into_bytes());
        out
    }

    /// The chain as a receiver could be given it directly.
    fn trusted(&self, chain: &[Vec<u8>]) -> Chain {
        Chain {
            cid: self.cid,
            hash: self.hash,
            mac: self.mac,
            key_bits: KEY_BITS,
            tag_bits: TAG_BITS,
            maclt: 34,
            alpha: self.alpha,
            pkid: PKID,
            gst0: self.gst0,
            root_key: chain[0].clone(),
        }
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

/// The 15 words of a sub-frame of satellite `prn`; the content depends on the sub-frame.
fn words(prn: u8, gst: u32) -> [[u8; 16]; 15] {
    words_iod(prn, gst, u64::from(gst / 600 % 1024))
}

/// As [`words`] with a chosen IODnav. As in broadcast data the IODnav normally holds for
/// ten minutes while the content of the words (the seed) differs from one sub-frame to
/// the next.
fn words_iod(prn: u8, gst: u32, iod: u64) -> [[u8; 16]; 15] {
    let seed = prn.wrapping_mul(31).wrapping_add((gst / 30) as u8);
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
    t.push(u64::from(label / WEEK_S), 12);
    t.push(u64::from(label % WEEK_S), 20);
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

/// Tag-Info of tags 1..5 for a MACK transmitted at `gst` (MACLT 34).
struct Plan {
    // (prnd, adkd)
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

fn plain_hkroot(header: u8) -> [u8; 15] {
    let mut hk = [0u8; 15];
    hk[0] = header;
    hk
}

/// The 15 page pairs of one sub-frame. Pages carry the one-second E1 offset in their
/// time label, as in broadcast data.
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
            InavPage::from_hex(svid, gst + 2 * i as u32 + 1, &hex::encode(b.into_bytes()))
                .unwrap()
                .with_valid_crc()
        })
        .collect()
}

fn pages(svid: u8, gst: u32, ws: &[[u8; 16]; 15], mack: Option<&[u8; 60]>) -> Vec<InavPage> {
    pages_hk(svid, gst, ws, mack, &plain_hkroot(Ctx::std().header(1)))
}

/// What the transmitting satellite sends in a sub-frame.
struct Frame {
    hk: [u8; 15],
    mack: [u8; 60],
}

struct Out {
    v: Verifier,
    events: Vec<Event>,
    pages: Vec<InavPage>,
}

type Tamper<'a> = &'a mut dyn FnMut(u32, u8, &mut Vec<InavPage>);

/// Feed `nsf` sub-frames from the two satellites. `frame(n, gst)` gives what `PRNA`
/// transmits in sub-frame `n`; `tamper` may alter either satellite's pages.
fn drive(
    cfg: Config,
    nsf: u32,
    a_first: bool,
    frame: &mut dyn FnMut(u32, u32) -> Frame,
    tamper: Tamper,
) -> Out {
    let mut v = Verifier::new(cfg);
    let (mut events, mut all) = (Vec::new(), Vec::new());
    for n in 0..nsf {
        let gst = GST0 + 30 * n;
        let f = frame(n, gst);
        let mut a = pages_hk(PRNA, gst, &words(PRNA, gst), Some(&f.mack), &f.hk);
        let mut x = pages(PRN_X, gst, &words(PRN_X, gst), None);
        tamper(gst, PRNA, &mut a);
        tamper(gst, PRN_X, &mut x);
        let order: Vec<&InavPage> = if a_first {
            a.iter().chain(x.iter()).collect()
        } else {
            x.iter().chain(a.iter()).collect()
        };
        for p in order {
            events.extend(v.push_page(p));
            all.push(p.clone());
        }
    }
    Out {
        v,
        events,
        pages: all,
    }
}

fn no_tamper() -> impl FnMut(u32, u8, &mut Vec<InavPage>) {
    |_, _, _| {}
}

/// Frames of the standard chain with an ordinary header.
fn std_frames(ctx: &Ctx, chain: &[Vec<u8>]) -> impl FnMut(u32, u32) -> Frame {
    let (ctx, chain) = (ctx.clone(), chain.to_vec());
    move |_, gst| Frame {
        hk: plain_hkroot(ctx.header(1)),
        mack: ctx.mack(&chain, gst),
    }
}

/// Config with the standard chain handed to the verifier directly.
fn config() -> Config {
    let ctx = Ctx::std();
    Config {
        trusted_chain: Some(ctx.trusted(&ctx.chain(SUBFRAMES + 20))),
        ..Config::default()
    }
}

fn run(mut tamper: impl FnMut(u32, u8, &mut Vec<InavPage>)) -> (Verifier, Vec<Event>) {
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let o = drive(
        config(),
        SUBFRAMES,
        false,
        &mut std_frames(&ctx, &chain),
        &mut tamper,
    );
    (o.v, o.events)
}

fn tags(events: &[Event]) -> Vec<&TagResult> {
    events
        .iter()
        .filter_map(|e| if let Event::Tag(t) = e { Some(t) } else { None })
        .collect()
}

fn status(v: &Verifier) -> BTreeMap<String, OsnmaStatus> {
    v.sat_status().into_iter().collect()
}

fn count_ok(events: &[Event]) -> usize {
    tags(events)
        .iter()
        .filter(|t| t.status == TagStatus::Authenticated)
        .count()
}

/// Rewrite a page, keeping the CRC valid.
fn edit_page(p: &InavPage, edit: impl FnOnce(&mut [u8])) -> InavPage {
    let mut raw = p.bytes().to_vec();
    edit(&mut raw);
    InavPage::from_hex(p.svid, p.gst, &hex::encode(raw))
        .unwrap()
        .with_valid_crc()
}

// ---------------------------------------------------------------- basic behaviour ---

#[test]
fn clean_stream_authenticates_both_satellites() {
    let (v, events) = run(|_, _, _| {});
    assert!(!tags(&events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
    assert!(events
        .iter()
        .any(|e| matches!(e, Event::KeyVerified { .. })));
    let s = status(&v);
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
fn flipped_navigation_bit_fails_that_satellite_and_the_one_that_vouched() {
    let target = GST0 + 30 * 6;
    let (v, events) = run(|gst, svid, pgs| {
        if gst == target && svid == PRN_X {
            // Flip one bit inside the authenticated part of the word-type-1 data.
            pgs[0] = edit_page(&pgs[0], |raw| raw[3] ^= 0x10);
        }
    });
    let s = status(&v);
    // The mismatching cross tag is charged to the satellite whose data it covers and to
    // the one that transmitted it: either could be the forger.
    assert_eq!(s["E05"], OsnmaStatus::Failed);
    assert_eq!(s["E02"], OsnmaStatus::Failed);
    assert!(tags(&events)
        .iter()
        .any(|t| t.prnd == PRN_X && t.status == TagStatus::Failed(FailReason::TagMismatch)));
    assert_eq!(v.overall(), OsnmaStatus::Failed);
}

#[test]
fn flipped_key_bit_is_rejected_and_nothing_after_it_authenticates() {
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let target = GST0 + 30 * 3;
    let (_, events) = run(|gst, svid, pgs| {
        if gst == target && svid == PRNA {
            let mut m = ctx.mack(&chain, gst);
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
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let old = GST0 + 30 * 4;
    let new = old + 60;
    let (v, events) = run(|gst, svid, pgs| {
        if gst == new && svid == PRNA {
            // Old tags (everything before the key field) with the genuine new key.
            let mut m = ctx.mack(&chain, old);
            m[42..].copy_from_slice(&ctx.mack(&chain, new)[42..]);
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
    cfg.max_time_error_s = Some(29);
    let mut v = Verifier::new(cfg);
    v.set_reference_time(GST0 + 100_000);
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let gst = GST0 + 30;
    let mut ev = Vec::new();
    for p in pages(PRNA, gst, &words(PRNA, gst), Some(&ctx.mack(&chain, gst))) {
        ev.extend(v.push_page(&p));
    }
    assert!(ev.iter().any(|e| matches!(e, Event::TimeRejected { .. })));
    assert_eq!(v.overall(), OsnmaStatus::Unavailable);
}

#[test]
fn time_tolerance_is_limited_to_less_than_a_sub_frame() {
    let mut cfg = Config {
        max_time_error_s: Some(30),
        ..Config::default()
    };
    assert!(cfg.validate().is_err());
    cfg.max_time_error_s = Some(29);
    assert!(cfg.validate().is_ok());
    // A value that slips through is cut to the limit rather than widening the window.
    let mut c = config();
    c.max_time_error_s = Some(10_000);
    let mut v = Verifier::new(c);
    v.set_reference_time(GST0);
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let gst = GST0 + 600;
    let mut ev = Vec::new();
    for p in pages(PRNA, gst, &words(PRNA, gst), Some(&ctx.mack(&chain, gst))) {
        ev.extend(v.push_page(&p));
    }
    assert!(ev.iter().any(|e| matches!(e, Event::TimeRejected { .. })));
}

#[test]
fn missing_navigation_data_stays_pending_not_failed() {
    // Satellite 5 never transmits: its cross-authentication tags cannot be decided.
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let mut v = Verifier::new(config());
    let mut events = Vec::new();
    for n in 0..8u32 {
        let gst = GST0 + 30 * n;
        for p in pages(PRNA, gst, &words(PRNA, gst), Some(&ctx.mack(&chain, gst))) {
            events.extend(v.push_page(&p));
        }
    }
    let t = tags(&events);
    assert!(t
        .iter()
        .any(|t| t.prnd == PRN_X && t.status == TagStatus::Pending(PendingReason::NoNavData)));
    assert!(!t.iter().any(|t| matches!(t.status, TagStatus::Failed(_))));
}

// ------------------------------------------------------------ the critic's attacks ---

/// Fifteen pages stamped far ahead for `svid`, in several shapes.
fn spoof_pages(svid: u8, gst: u32, kind: u8, ctx: &Ctx, chain: &[Vec<u8>]) -> Vec<InavPage> {
    match kind {
        // Raw zero pages, whose CRC of zero happens to match.
        0 => (0..15u32)
            .map(|i| InavPage::from_hex(svid, gst + 2 * i + 1, &"00".repeat(30)).unwrap())
            .collect(),
        // Well-formed nominal pages with zero data and a valid CRC.
        1 => pages(svid, gst, &[[0u8; 16]; 15], None),
        // Real-looking OSNMA fields: genuine MACK content, but for the wrong time.
        _ => pages(
            svid,
            gst,
            &words(svid, gst),
            Some(&ctx.mack(chain, GST0 + 30)),
        ),
    }
}

#[test]
fn spoofed_far_future_sub_frames_do_not_erase_a_failure() {
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let target = GST0 + 30 * 6;
    for kind in 0..3u8 {
        let (mut v, _) = run(|gst, svid, pgs| {
            if gst == target && svid == PRN_X {
                pgs[0] = edit_page(&pgs[0], |raw| raw[3] ^= 0x10);
            }
        });
        assert_eq!(status(&v)["E05"], OsnmaStatus::Failed);
        let clock = v.trusted_time();
        // A day ahead, for every satellite that matters.
        for svid in [PRN_X, PRNA, 9, 30] {
            for p in spoof_pages(svid, GST0 + 86_400, kind, &ctx, &chain) {
                v.push_page(&p);
            }
        }
        assert_eq!(v.trusted_time(), clock, "kind {kind}: the clock moved");
        assert_eq!(status(&v)["E05"], OsnmaStatus::Failed, "kind {kind}");
        assert_eq!(v.overall(), OsnmaStatus::Failed, "kind {kind}");
    }
}

#[test]
fn spoofed_sub_frames_do_not_evict_data_waiting_for_its_key() {
    // A pending MACK and the navigation data it covers survive a far-future spoof, and the
    // spoofed ephemeris does not count as the data in use.
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let mut v = Verifier::new(config());
    let mut events = Vec::new();
    let feed = |v: &mut Verifier, n: u32| {
        let gst = GST0 + 30 * n;
        let mut out = Vec::new();
        for p in pages(PRN_X, gst, &words(PRN_X, gst), None) {
            out.extend(v.push_page(&p));
        }
        for p in pages(PRNA, gst, &words(PRNA, gst), Some(&ctx.mack(&chain, gst))) {
            out.extend(v.push_page(&p));
        }
        out
    };
    for n in 0..5u32 {
        events.extend(feed(&mut v, n));
    }
    // A spoof of satellite 5 itself, with other ephemeris content (another IODnav).
    for p in spoof_pages(PRN_X, GST0 + 86_400, 2, &ctx, &chain) {
        v.push_page(&p);
    }
    for n in 5..9u32 {
        events.extend(feed(&mut v, n));
    }
    assert_eq!(status(&v)["E05"], OsnmaStatus::Authenticated);
    assert!(!tags(&events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
}

#[test]
fn authentication_expires_and_follows_the_ephemeris_in_use() {
    // Two hours of silence, said by an independent clock, take authentication away.
    let (mut v, _) = run(no_tamper());
    assert_eq!(status(&v)["E05"], OsnmaStatus::Authenticated);
    v.set_reference_time(GST0 + 7200);
    assert_eq!(status(&v)["E05"], OsnmaStatus::Unavailable);
    assert_eq!(v.overall(), OsnmaStatus::Unavailable);

    // New, unauthenticated ephemeris data (another IODnav) takes it away from that
    // satellite only, until it authenticates in its turn.
    let (mut v, _) = run(no_tamper());
    let gst = GST0 + 30 * SUBFRAMES;
    for p in pages(PRN_X, gst, &words_iod(PRN_X, gst, 7), None) {
        v.push_page(&p);
    }
    let s = status(&v);
    assert_eq!(s["E05"], OsnmaStatus::Unavailable);
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
}

#[test]
fn failures_are_remembered_for_a_while_and_then_forgotten() {
    let target = GST0 + 30 * 3;
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let cfg = || Config {
        failure_memory_s: Some(60),
        ..config()
    };
    let flip = |gst: u32, svid: u8, pgs: &mut Vec<InavPage>| {
        if gst == target && svid == PRN_X {
            pgs[0] = edit_page(&pgs[0], |raw| raw[3] ^= 0x10);
        }
    };
    let mid = drive(cfg(), 7, false, &mut std_frames(&ctx, &chain), &mut {
        flip
    });
    assert_eq!(status(&mid.v)["E05"], OsnmaStatus::Failed);
    let end = drive(
        cfg(),
        SUBFRAMES,
        false,
        &mut std_frames(&ctx, &chain),
        &mut { flip },
    );
    assert_eq!(status(&end.v)["E05"], OsnmaStatus::Authenticated);
}

#[test]
fn dummy_tags_never_authenticate_a_satellite() {
    let mut ctx = Ctx::std();
    ctx.dummy_x = true;
    let chain = ctx.chain(SUBFRAMES + 20);
    let o = drive(
        Config {
            trusted_chain: Some(ctx.trusted(&chain)),
            ..Config::default()
        },
        SUBFRAMES,
        false,
        &mut std_frames(&ctx, &chain),
        &mut no_tamper(),
    );
    // The dummy tags verify as tags (they prove the key) ...
    assert!(tags(&o.events)
        .iter()
        .any(|t| t.prnd == PRN_X && t.status == TagStatus::Authenticated));
    // ... but PRN_X's data was never authenticated, so it does not read as such.
    assert_ne!(status(&o.v).get("E05"), Some(&OsnmaStatus::Authenticated));
    assert_eq!(status(&o.v)["E02"], OsnmaStatus::Authenticated);
}

#[test]
fn a_macseq_mismatch_is_charged_to_the_transmitting_satellite() {
    let target = GST0 + 30 * 8;
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let (v, events) = run(|gst, svid, pgs| {
        if gst == target && svid == PRNA {
            let mut m = ctx.mack(&chain, gst);
            m[5] ^= 0x80; // the first bit of the 12-bit MACSEQ after the 40-bit Tag0
            *pgs = pages(PRNA, gst, &words(PRNA, gst), Some(&m));
        }
    });
    assert!(tags(&events)
        .iter()
        .any(|t| t.status == TagStatus::Failed(FailReason::MacseqMismatch)));
    let s = status(&v);
    assert_eq!(s["E02"], OsnmaStatus::Failed);
    assert_ne!(s["E05"], OsnmaStatus::Failed);
}

#[test]
fn two_satellites_sending_different_keys_for_one_slot_is_a_conflict() {
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let target = GST0 + 30 * 4;
    // Satellite 5 also transmits OSNMA at the target sub-frame, with one key bit flipped.
    let mut tamper = |gst: u32, svid: u8, pgs: &mut Vec<InavPage>| {
        if gst == target && svid == PRN_X {
            let mut m = ctx.mack(&chain, gst);
            m[50] ^= 1;
            *pgs = pages(PRN_X, gst, &words(PRN_X, gst), Some(&m));
        }
    };
    let o = drive(
        config(),
        SUBFRAMES,
        true,
        &mut std_frames(&ctx, &chain),
        &mut tamper,
    );
    assert!(o.events.iter().any(|e| matches!(
        e,
        Event::KeyRejected {
            reason: FailReason::KeyConflict,
            ..
        }
    )));
    // The genuine key was in first and stays.
    assert!(count_ok(&o.events) > 0);
}

// -------------------------------------------------------- signed chains, DSM, alert ---

enum Signer {
    P256(p256::ecdsa::SigningKey),
    P521(p521::ecdsa::SigningKey),
}

impl Signer {
    fn p256(seed: u8) -> Self {
        Self::P256(p256::ecdsa::SigningKey::from_slice(&[seed; 32]).unwrap())
    }

    fn p521(seed: u8) -> Self {
        let mut scalar = [seed; 66];
        scalar[0] = 0x01; // a P-521 scalar has 521 bits
        Self::P521(p521::ecdsa::SigningKey::from_slice(&scalar).unwrap())
    }

    fn public(&self, pkid: u8) -> PublicKey {
        match self {
            Self::P256(sk) => PublicKey {
                pkid,
                key_type: KeyType::P256,
                bytes: sk
                    .verifying_key()
                    .to_encoded_point(true)
                    .as_bytes()
                    .to_vec(),
            },
            Self::P521(sk) => PublicKey {
                pkid,
                key_type: KeyType::P521,
                bytes: p521::ecdsa::VerifyingKey::from(sk)
                    .to_encoded_point(true)
                    .as_bytes()
                    .to_vec(),
            },
        }
    }

    fn sign(&self, msg: &[u8]) -> Vec<u8> {
        match self {
            Self::P256(sk) => {
                use p256::ecdsa::signature::Signer as _;
                let s: p256::ecdsa::Signature = sk.sign(msg);
                s.to_bytes().to_vec()
            }
            Self::P521(sk) => {
                use p521::ecdsa::signature::RandomizedSigner as _;
                let mut rng = rand_chacha::ChaCha20Rng::seed_from_u64(7);
                let s: p521::ecdsa::Signature = sk.try_sign_with_rng(&mut rng, msg).unwrap();
                s.to_bytes().to_vec()
            }
        }
    }
}

/// A DSM-KROOT for the chain of `ctx`, signed with `signer`; the signed message uses
/// `header` as its NMA header.
fn dsm_kroot(ctx: &Ctx, root: &[u8], signer: &Signer, header: u8) -> Vec<u8> {
    let (blocks, nbdk, sig_len) = match signer {
        Signer::P256(_) => (8usize, 2u8, 64usize),
        Signer::P521(_) => (13, 7, 132),
    };
    let mut d = vec![0u8; blocks * 13];
    d[0] = (nbdk << 4) | PKID;
    let hf = if ctx.hash == HashFn::Sha3_256 { 2 } else { 0 };
    let mf = if ctx.mac == MacFn::CmacAes { 1 } else { 0 };
    d[1] = (ctx.cid << 6) | (hf << 2) | mf;
    d[2] = (4 << 4) | 9; // KS 4 = 128 bit, TS 9 = 40 bit
    d[3] = 34; // MACLT
    d[4] = ((ctx.gst0 / WEEK_S) >> 8) as u8; // reserved nibble 0, then the 12-bit week number
    d[5] = (ctx.gst0 / WEEK_S) as u8;
    d[6] = ((ctx.gst0 % WEEK_S) / 3600) as u8;
    d[7..13].copy_from_slice(&ctx.alpha);
    d[13..29].copy_from_slice(root);
    let mut m = vec![header];
    m.extend_from_slice(&d[1..29]);
    d[29..29 + sig_len].copy_from_slice(&signer.sign(&m));
    reseal(&mut d, header, sig_len);
    d
}

/// Set the padding field to `trunc(hash(M || DS))`, as the broadcast message has it.
fn reseal(d: &mut [u8], header: u8, sig_len: usize) {
    let mut m = vec![header];
    m.extend_from_slice(&d[1..29]);
    m.extend_from_slice(&d[29..29 + sig_len]);
    let h = Sha256::digest(&m);
    let end = 29 + sig_len;
    let n = d.len() - end;
    d[end..].copy_from_slice(&h[..n]);
}

/// HKROOT bytes carrying block `block` of DSM `dsm_id`.
fn dsm_hk(header: u8, dsm_id: u8, dsm: &[u8], block: usize) -> [u8; 15] {
    let mut hk = plain_hkroot(header);
    hk[1] = (dsm_id << 4) | block as u8;
    hk[2..].copy_from_slice(&dsm[block * 13..block * 13 + 13]);
    hk
}

fn signed_cfg(pk: PublicKey) -> Config {
    Config {
        public_keys: vec![pk],
        ..Config::default()
    }
}

/// Frames of a single chain carrying its DSM-KROOT round the clock.
fn kroot_frames(ctx: &Ctx, chain: &[Vec<u8>], dsm: &[u8]) -> impl FnMut(u32, u32) -> Frame {
    let (ctx, chain, dsm) = (ctx.clone(), chain.to_vec(), dsm.to_vec());
    move |n, gst| Frame {
        hk: dsm_hk(ctx.header(1), 0, &dsm, n as usize % (dsm.len() / 13)),
        mack: ctx.mack(&chain, gst),
    }
}

fn run_signed(cfg: Config, dsm: &[u8], mut tamper: impl FnMut(u32, u8, &mut Vec<InavPage>)) -> Out {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    drive(
        cfg,
        24,
        false,
        &mut kroot_frames(&ctx, &chain, dsm),
        &mut tamper,
    )
}

#[test]
fn signed_kroot_establishes_the_chain_and_everything_authenticates() {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let sk = Signer::p256(0x11);
    let o = run_signed(
        signed_cfg(sk.public(PKID)),
        &dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1)),
        no_tamper(),
    );
    assert!(o.events.iter().any(|e| matches!(
        e,
        Event::KrootVerified {
            cid: 3,
            pkid: 1,
            hash: HashFn::Sha256,
            mac: MacFn::HmacSha256,
            ..
        }
    )));
    assert!(!tags(&o.events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
    let s = status(&o.v);
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);
}

#[test]
fn a_bad_signature_or_wrong_key_authenticates_nothing() {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let sk = Signer::p256(0x11);
    let h = ctx.header(1);
    let good = dsm_kroot(&ctx, &chain[0], &sk, h);

    // One bit of the signature flipped in transit; the padding of a forged message can
    // be made to match, so the signature itself has to catch it.
    let mut bad_sig = good.clone();
    bad_sig[40] ^= 0x01;
    reseal(&mut bad_sig, h, 64);
    let o = run_signed(signed_cfg(sk.public(PKID)), &bad_sig, no_tamper());
    assert!(o.events.iter().any(|e| matches!(
        e,
        Event::KrootRejected(KrootError::Signature(SigError::Invalid))
    )));
    assert_eq!(count_ok(&o.events), 0);
    assert_eq!(o.v.overall(), OsnmaStatus::Unavailable);

    // The root key altered after signing.
    let mut bad_root = good.clone();
    bad_root[20] ^= 0x80;
    reseal(&mut bad_root, h, 64);
    let o = run_signed(signed_cfg(sk.public(PKID)), &bad_root, no_tamper());
    assert_eq!(count_ok(&o.events), 0);

    // Signed by a key the receiver does not trust.
    let other = Signer::p256(0x22);
    let o = run_signed(
        signed_cfg(sk.public(PKID)),
        &dsm_kroot(&ctx, &chain[0], &other, h),
        no_tamper(),
    );
    assert!(o.events.iter().any(|e| matches!(
        e,
        Event::KrootRejected(KrootError::Signature(SigError::Invalid))
    )));
    assert_eq!(count_ok(&o.events), 0);

    // No key for the named key id at all.
    let o = run_signed(Config::default(), &good, no_tamper());
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::KrootRejected(KrootError::NoPublicKey))));

    // The padding hash is a cheap test before any signature work: a message whose
    // padding does not match is dropped as malformed.
    let mut bad_pad = good.clone();
    let n = bad_pad.len();
    bad_pad[n - 1] ^= 1;
    let o = run_signed(signed_cfg(sk.public(PKID)), &bad_pad, no_tamper());
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::KrootRejected(KrootError::Malformed))));
    assert_eq!(count_ok(&o.events), 0);
}

#[test]
fn a_header_change_while_the_kroot_is_assembled_does_not_lose_it() {
    // The signed message uses the NMA header of one sub-frame; the receiver tries the
    // headers it saw and the padding hash says which.
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let sk = Signer::p256(0x11);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    let mut frames = {
        let (ctx, chain, dsm) = (ctx.clone(), chain.clone(), dsm.clone());
        move |n: u32, gst: u32| Frame {
            // The header changes (CPKS nominal to new public key) from the 5th block on.
            hk: dsm_hk(
                ctx.header(if n % 8 < 4 { 1 } else { 4 }),
                0,
                &dsm,
                n as usize % 8,
            ),
            mack: ctx.mack(&chain, gst),
        }
    };
    let o = drive(
        signed_cfg(sk.public(PKID)),
        24,
        false,
        &mut frames,
        &mut no_tamper(),
    );
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::KrootVerified { cid: 3, .. })));
}

#[test]
fn sha3_chain_cmac_tags_and_a_p521_signature_through_the_verifier() {
    let mut ctx = Ctx::std();
    ctx.hash = HashFn::Sha3_256;
    ctx.mac = MacFn::CmacAes;
    let chain = ctx.chain(60);
    let sk = Signer::p521(0x33);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    assert_eq!(dsm.len(), 169);
    // 13 blocks per cycle: run longer than the other signed tests.
    let o = drive(
        signed_cfg(sk.public(PKID)),
        36,
        false,
        &mut kroot_frames(&ctx, &chain, &dsm),
        &mut no_tamper(),
    );
    assert!(o.events.iter().any(|e| matches!(
        e,
        Event::KrootVerified {
            hash: HashFn::Sha3_256,
            mac: MacFn::CmacAes,
            ..
        }
    )));
    assert!(!tags(&o.events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
    let s = status(&o.v);
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);
    // The same stream read with the other chain function authenticates nothing.
    let mut wrong = ctx.clone();
    wrong.hash = HashFn::Sha256;
    let dsm_wrong = dsm_kroot(&wrong, &chain[0], &sk, wrong.header(1));
    let o = drive(
        signed_cfg(sk.public(PKID)),
        36,
        false,
        &mut kroot_frames(&ctx, &chain, &dsm_wrong),
        &mut no_tamper(),
    );
    assert_eq!(count_ok(&o.events), 0);
}

// A 16-leaf Merkle tree: leaf 0 holds a public key, leaf 15 the alert message.

struct Tree {
    levels: Vec<Vec<[u8; 32]>>,
}

fn h2(a: &[u8], b: &[u8]) -> [u8; 32] {
    let mut h = Sha256::new();
    h.update(a);
    h.update(b);
    h.finalize().into()
}

impl Tree {
    fn new(leaves: &[Vec<u8>]) -> Self {
        let mut levels = vec![leaves
            .iter()
            .map(|m| Sha256::digest(m).into())
            .collect::<Vec<[u8; 32]>>()];
        while levels.last().unwrap().len() > 1 {
            let next = levels
                .last()
                .unwrap()
                .chunks(2)
                .map(|p| h2(&p[0], &p[1]))
                .collect();
            levels.push(next);
        }
        Self { levels }
    }

    fn root(&self) -> [u8; 32] {
        self.levels.last().unwrap()[0]
    }

    /// A 13-block DSM-PKR for leaf `mid` whose leaf message is `leaf` (NPKT/NPKID byte
    /// then NPK).
    fn dsm_pkr(&self, mid: u8, leaf: &[u8]) -> Vec<u8> {
        let mut d = vec![(7u8 << 4) | mid];
        for j in 0..4 {
            d.extend_from_slice(&self.levels[j][usize::from(mid >> j) ^ 1]);
        }
        d.extend_from_slice(leaf);
        // Padding of a key message: trunc(hash(root || m_i)); an alert fills the rest
        // with its random NPK instead.
        let pad = 169 - d.len();
        if pad > 0 {
            d.extend_from_slice(&h2(&self.root(), leaf)[..pad]);
        }
        assert_eq!(d.len(), 169);
        d
    }
}

fn merkle_for(sk: &Signer) -> (Tree, Vec<u8>, Vec<u8>) {
    let pk = sk.public(PKID);
    let mut key_leaf = vec![(1u8 << 4) | PKID];
    key_leaf.extend_from_slice(&pk.bytes);
    let mut alert_leaf = vec![4u8 << 4]; // NPKT 4, NPKID 0
    alert_leaf.extend((0..39).map(|i| (i * 37 + 11) as u8)); // the random NPK
    let leaves: Vec<Vec<u8>> = (0..16u8)
        .map(|i| match i {
            0 => key_leaf.clone(),
            15 => alert_leaf.clone(),
            _ => vec![(1 << 4) | (i & 15), i, i, i],
        })
        .collect();
    (Tree::new(&leaves), key_leaf, alert_leaf)
}

/// Frames that deliver, in turn, the DSM-PKR of the public key, the DSM-KROOT, and
/// from sub-frame `alert_at` on the alert message with NMA status "don't use".
fn pkr_kroot_alert_frames(
    ctx: &Ctx,
    chain: &[Vec<u8>],
    pkr: Vec<u8>,
    kroot: Vec<u8>,
    alert: Vec<u8>,
    alert_at: u32,
) -> impl FnMut(u32, u32) -> Frame {
    let (ctx, chain) = (ctx.clone(), chain.to_vec());
    move |n, gst| {
        let hk = if n >= alert_at {
            let mut a = ctx.clone();
            a.nmas = 3;
            dsm_hk(a.header(7), 12, &alert, (n - alert_at) as usize % 13)
        } else if n < 13 {
            dsm_hk(ctx.header(1), 12, &pkr, n as usize)
        } else {
            dsm_hk(ctx.header(1), 0, &kroot, (n - 13) as usize % 8)
        };
        Frame {
            hk,
            mack: ctx.mack(&chain, gst),
        }
    }
}

#[test]
fn a_public_key_from_a_dsm_pkr_then_a_kroot_then_an_alert() {
    let ctx = Ctx::std();
    let chain = ctx.chain(90);
    let sk = Signer::p256(0x11);
    let (tree, key_leaf, alert_leaf) = merkle_for(&sk);
    let pkr = tree.dsm_pkr(0, &key_leaf);
    let alert = tree.dsm_pkr(15, &alert_leaf);
    let kroot = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    let cfg = || Config {
        merkle_root: Some(tree.root()),
        ..Config::default()
    };

    // Without the alert: the key arrives through the Merkle tree and the chain follows.
    let o = drive(
        cfg(),
        45,
        false,
        &mut pkr_kroot_alert_frames(&ctx, &chain, pkr.clone(), kroot.clone(), alert.clone(), 999),
        &mut no_tamper(),
    );
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::PublicKeyVerified { pkid: 1 })));
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::KrootVerified { .. })));
    assert_eq!(status(&o.v)["E05"], OsnmaStatus::Authenticated);
    assert!(!o.v.alert());

    // A DSM-PKR with a flipped key bit does not give a key.
    let mut bad = pkr.clone();
    bad[140] ^= 1;
    let o = drive(
        cfg(),
        45,
        false,
        &mut pkr_kroot_alert_frames(&ctx, &chain, bad, kroot.clone(), alert.clone(), 999),
        &mut no_tamper(),
    );
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::PublicKeyRejected(_))));
    assert_eq!(count_ok(&o.events), 0);

    // With a verified alert from sub-frame 30 on: everything reads unavailable, the
    // chain and keys are forgotten, and no later KROOT is taken.
    let o = drive(
        cfg(),
        60,
        false,
        &mut pkr_kroot_alert_frames(&ctx, &chain, pkr, kroot, alert, 30),
        &mut no_tamper(),
    );
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::AlertMessage { verified: true })));
    assert!(o.v.alert());
    assert_eq!(o.v.overall(), OsnmaStatus::Unavailable);
    assert!(status(&o.v)
        .values()
        .all(|s| *s == OsnmaStatus::Unavailable));
    // Nothing authenticated after the alert was verified.
    let alert_sf = GST0 + 30 * (30 + 12);
    assert!(!tags(&o.events)
        .iter()
        .any(|t| t.tag_gst > alert_sf && t.status == TagStatus::Authenticated));
}

#[test]
fn nma_status_dont_use_reads_unavailable() {
    // The last sub-frames carry NMA status 3: tags are not looked at and nothing reads
    // as authenticated.
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let mut frames = |n: u32, gst: u32| {
        let mut c = ctx.clone();
        if n >= 12 {
            c.nmas = 3;
        }
        Frame {
            hk: plain_hkroot(c.header(1)),
            mack: ctx.mack(&chain, gst),
        }
    };
    let o = drive(config(), SUBFRAMES, false, &mut frames, &mut no_tamper());
    assert!(count_ok(&o.events) > 0, "service was usable at first");
    assert!(tags(&o.events).iter().any(|t| matches!(
        t.status,
        TagStatus::Pending(PendingReason::ServiceNotUsable)
    )));
    assert_eq!(o.v.nma_status(), 3);
    assert_eq!(o.v.overall(), OsnmaStatus::Unavailable);
}

// -------------------------------------------------------------------- chain life ---

#[test]
fn a_header_naming_another_chain_leaves_the_tags_unchecked() {
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let mut frames = |n: u32, gst: u32| {
        let mut c = ctx.clone();
        if n >= 6 {
            c.cid = 1; // the chain in force is no longer the one verified
        }
        Frame {
            hk: plain_hkroot(c.header(1)),
            mack: ctx.mack(&chain, gst),
        }
    };
    let o = drive(config(), SUBFRAMES, false, &mut frames, &mut no_tamper());
    assert!(tags(&o.events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Pending(PendingReason::ChainMismatch))));
    // Tags sent after the change are not authenticated.
    assert!(!tags(&o.events)
        .iter()
        .any(|t| t.tag_gst >= GST0 + 30 * 8 && t.status == TagStatus::Authenticated));
}

#[test]
fn a_revoked_chain_is_dropped_and_cannot_come_back() {
    let ctx = Ctx::std();
    let chain = ctx.chain(60);
    let sk = Signer::p256(0x11);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    let mut frames = |n: u32, gst: u32| {
        // From sub-frame 12: chain revoked, NMA status "don't use", for the chain's id.
        let mut c = ctx.clone();
        let cpks = if n >= 12 {
            c.nmas = 3;
            3
        } else {
            1
        };
        Frame {
            hk: dsm_hk(c.header(cpks), 0, &dsm, n as usize % 8),
            mack: ctx.mack(&chain, gst),
        }
    };
    let o = drive(
        signed_cfg(sk.public(PKID)),
        30,
        false,
        &mut frames,
        &mut no_tamper(),
    );
    assert!(count_ok(&o.events) > 0);
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::ChainRevoked { cid: 3 })));
    // The revoked chain's KROOT keeps coming, signed and genuine, and is refused.
    assert!(o
        .events
        .iter()
        .any(|e| matches!(e, Event::KrootRejected(KrootError::Revoked))));
    assert!(!tags(&o.events)
        .iter()
        .any(|t| t.tag_gst >= GST0 + 30 * 13 && t.status == TagStatus::Authenticated));
    assert_eq!(o.v.overall(), OsnmaStatus::Unavailable);
}

#[test]
fn the_revocation_flag_on_the_new_chain_does_not_revoke_it() {
    // After a chain revocation the same CPKS value goes on for a while with the new
    // chain's id and NMA status operational (as in the official CREV step 3): the chain
    // in force must keep authenticating.
    let ctx = Ctx::std();
    let chain = ctx.chain(SUBFRAMES + 20);
    let mut frames = |_: u32, gst: u32| Frame {
        hk: plain_hkroot(ctx.header(3)),
        mack: ctx.mack(&chain, gst),
    };
    let o = drive(config(), SUBFRAMES, false, &mut frames, &mut no_tamper());
    assert!(!o
        .events
        .iter()
        .any(|e| matches!(e, Event::ChainRevoked { .. })));
    assert_eq!(o.v.overall(), OsnmaStatus::Authenticated);
}

#[test]
fn a_new_chain_takes_over_and_the_old_ones_kroot_does_not_undo_it() {
    // Chain A (id 3) is in force for the first hour, chain B (id 1, another pattern, key
    // seed and start) after it. Both KROOTs, signed with one key, are broadcast in turn
    // on two DSM ids all along, so A's is repeated after B has taken over.
    let a = Ctx::std();
    let mut b = Ctx::std();
    b.cid = 1;
    b.alpha = [9, 8, 7, 6, 5, 4];
    b.gst0 = GST0 + 3600;
    b.seed = 77;
    let (chain_a, chain_b) = (a.chain(140), b.chain(60));
    let sk = Signer::p256(0x11);
    let dsm_a = dsm_kroot(&a, &chain_a[0], &sk, a.header(1));
    let dsm_b = dsm_kroot(&b, &chain_b[0], &sk, b.header(1));
    let switch = 120u32;
    let mut frames = |n: u32, gst: u32| {
        let (c, chain) = if n < switch {
            (&a, &chain_a)
        } else {
            (&b, &chain_b)
        };
        let hk = if n % 16 < 8 {
            dsm_hk(c.header(1), 0, &dsm_a, n as usize % 8)
        } else {
            dsm_hk(c.header(1), 1, &dsm_b, n as usize % 8)
        };
        Frame {
            hk,
            mack: c.mack(chain, gst),
        }
    };
    let o = drive(
        signed_cfg(sk.public(PKID)),
        switch + 24,
        false,
        &mut frames,
        &mut no_tamper(),
    );
    let verified: Vec<u8> = o
        .events
        .iter()
        .filter_map(|e| match e {
            Event::KrootVerified { cid, .. } => Some(*cid),
            _ => None,
        })
        .collect();
    assert!(verified.contains(&3) && verified.contains(&1));
    assert!(!tags(&o.events)
        .iter()
        .any(|t| matches!(t.status, TagStatus::Failed(_))));
    let during_a = tags(&o.events)
        .iter()
        .filter(|t| t.tag_gst < GST0 + 30 * switch && t.status == TagStatus::Authenticated)
        .count();
    let during_b = tags(&o.events)
        .iter()
        .filter(|t| t.tag_gst >= GST0 + 30 * (switch + 2) && t.status == TagStatus::Authenticated)
        .count();
    assert!(during_a > 100 && during_b > 20, "{during_a} {during_b}");
    let s = status(&o.v);
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);
}

// ---------------------------------------------------------------- the command line ---

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

struct Cli {
    code: i32,
    json: serde_json::Value,
    stdout: String,
    stderr: String,
}

fn cli(args: &[&str]) -> Cli {
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["osnma", "verify"])
        .args(args)
        .output()
        .unwrap();
    Cli {
        code: out.status.code().unwrap(),
        json: serde_json::from_slice(&out.stdout).unwrap_or(serde_json::Value::Null),
        stdout: String::from_utf8_lossy(&out.stdout).into_owned(),
        stderr: String::from_utf8_lossy(&out.stderr).into_owned(),
    }
}

const ADVISORY_PHRASE: &str = "not type-approved navigation equipment";

#[test]
fn command_line_reports_status_per_satellite_and_exit_code() {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let sk = Signer::p256(0x11);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    let key_arg = format!("{PKID}:p256:{}", hex::encode(sk.public(PKID).bytes));
    let dir = std::env::temp_dir().join(format!("kshana-osnma-cli-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();

    let clean = run_signed(signed_cfg(sk.public(PKID)), &dsm, no_tamper()).pages;
    let f = dir.join("clean.txt");
    write_pages(&f, &clean);
    let c = cli(&[f.to_str().unwrap(), "--public-key", &key_arg, "--json"]);
    assert_eq!(c.code, 0);
    assert_eq!(c.json["overall"], "authenticated");
    assert!(c.json["advisory"]
        .as_str()
        .unwrap()
        .contains(ADVISORY_PHRASE));
    assert_eq!(c.json["freshness_enforced"], false);
    let sats: Vec<(String, String)> = c.json["satellites"]
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
    assert!(c.json["pksos"].as_str().unwrap().starts_with("$PKSOS,A,"));
    // The text form carries the advisory and says that freshness is not enforced.
    let c = cli(&[f.to_str().unwrap(), "--public-key", &key_arg]);
    assert!(c.stdout.contains(ADVISORY_PHRASE));
    assert!(c.stdout.contains("freshness: NOT enforced"));

    // One flipped navigation bit in satellite 5's data: that satellite fails, exit 3.
    let target = GST0 + 30 * 12;
    let bad = run_signed(
        signed_cfg(sk.public(PKID)),
        &dsm,
        |gst: u32, svid: u8, pgs: &mut Vec<InavPage>| {
            if gst == target && svid == PRN_X {
                pgs[0] = edit_page(&pgs[0], |raw| raw[3] ^= 0x10);
            }
        },
    )
    .pages;
    let f = dir.join("bad.txt");
    write_pages(&f, &bad);
    let c = cli(&[f.to_str().unwrap(), "--public-key", &key_arg, "--json"]);
    assert_eq!(c.code, 3);
    assert_eq!(c.json["overall"], "failed");

    // Without a trusted key nothing can be authenticated.
    let c = cli(&[f.to_str().unwrap(), "--json"]);
    assert_eq!(c.code, 0);
    assert_eq!(c.json["overall"], "unavailable");

    // A reference time brings the check on time: only sub-frames near it are used.
    let r = (GST0 + 30 * 12).to_string();
    let c = cli(&[
        f.to_str().unwrap(),
        "--public-key",
        &key_arg,
        "--reference-time",
        &r,
        "--json",
    ]);
    assert_eq!(c.json["freshness_enforced"], true);
    assert!(c.json["events"]
        .as_array()
        .unwrap()
        .iter()
        .any(|e| e["kind"] == "time_rejected"));

    // Usage errors, each with the advisory.
    let file = f.to_str().unwrap();
    for args in [
        vec![],
        vec!["/nonexistent/file"],
        // A tolerance without a reference time does nothing, so it is refused.
        vec![file, "--max-time-error", "10"],
        // A tolerance of a sub-frame or more is refused.
        vec![file, "--reference-time", "1", "--max-time-error", "30"],
    ] {
        let c = cli(&args);
        assert_eq!(c.code, 2, "{args:?}");
        assert!(c.stderr.contains(ADVISORY_PHRASE), "{args:?}: {}", c.stderr);
    }
    let _ = std::fs::remove_dir_all(&dir);
}

// ------------------------------------------------------------------------ UBX ---

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
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let sk = Signer::p256(0x11);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    let all = run_signed(signed_cfg(sk.public(PKID)), &dsm, no_tamper()).pages;
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
    let mut v = Verifier::new(signed_cfg(sk.public(PKID)));
    for p in &pages {
        v.push_page(p);
    }
    let s = status(&v);
    assert_eq!(s["E02"], OsnmaStatus::Authenticated);
    assert_eq!(s["E05"], OsnmaStatus::Authenticated);

    // Through the command line, auto-detected as UBX.
    let dir = std::env::temp_dir().join(format!("kshana-osnma-ubx-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let f = dir.join("stream.ubx");
    std::fs::write(&f, &bytes).unwrap();
    let key_arg = format!("{PKID}:p256:{}", hex::encode(sk.public(PKID).bytes));
    let c = cli(&[f.to_str().unwrap(), "--public-key", &key_arg, "--json"]);
    assert_eq!(c.code, 0);
    assert_eq!(c.json["overall"], "authenticated");
    assert!(c.json["ubx"]["inav_pages"].as_u64().unwrap() > 0);
    let _ = std::fs::remove_dir_all(&dir);
}

// -------------------------------------------------------- the sample files for the Studio ---

fn render_pages(title: &str, pages: &[InavPage]) -> String {
    let mut out = format!(
        "# {title}\n# Synthetic: made by tests/osnma_synthetic.rs, not a recording of any signal.\n# <svid> <gst_seconds> <240 page bits as hex>\n"
    );
    for p in pages {
        out.push_str(&format!(
            "{} {} {}\n",
            p.svid,
            p.gst,
            hex::encode(p.bytes())
        ));
    }
    out
}

fn sample_ubx(pages: &[InavPage]) -> Vec<u8> {
    pages.iter().flat_map(sfrbx_frame).collect()
}

/// The four sample inputs and the public key argument that goes with them. The chain
/// and the signing key are made up; a flipped bit in satellite 5's data is the
/// corruption.
fn samples() -> (Vec<(&'static str, Vec<u8>)>, String) {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let sk = Signer::p256(0x11);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk, ctx.header(1));
    let good = run_signed(signed_cfg(sk.public(PKID)), &dsm, no_tamper()).pages;
    let target = GST0 + 30 * 12;
    let bad = run_signed(
        signed_cfg(sk.public(PKID)),
        &dsm,
        |gst: u32, svid: u8, pgs: &mut Vec<InavPage>| {
            if gst == target && svid == PRN_X {
                pgs[0] = edit_page(&pgs[0], |raw| raw[3] ^= 0x10);
            }
        },
    )
    .pages;
    let key_arg = format!("{PKID}:p256:{}", hex::encode(sk.public(PKID).bytes));
    let files = vec![
        ("public-key.txt", format!("{key_arg}\n").into_bytes()),
        (
            "pages-good.txt",
            render_pages("Good chain: every tag verifies", &good).into_bytes(),
        ),
        (
            "pages-corrupt.txt",
            render_pages(
                "One flipped bit in E05's navigation data at sub-frame 12",
                &bad,
            )
            .into_bytes(),
        ),
        ("stream-good.ubx", sample_ubx(&good)),
        ("stream-corrupt.ubx", sample_ubx(&bad)),
    ];
    (files, key_arg)
}

fn cli_from_root(args: &[&str]) -> String {
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .args(["osnma", "verify"])
        .args(args)
        .output()
        .unwrap();
    String::from_utf8(out.stdout).unwrap()
}

/// With `KSHANA_WRITE_OSNMA_EXAMPLES` set this writes `examples/osnma/`; otherwise it
/// fails if the committed files differ from what the code makes today, and if the
/// expected outputs differ from what the command prints for them.
#[test]
fn the_osnma_sample_files_are_current() {
    let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("examples/osnma");
    let write = std::env::var_os("KSHANA_WRITE_OSNMA_EXAMPLES").is_some();
    let (files, key_arg) = samples();
    if write {
        std::fs::create_dir_all(dir.join("expected")).unwrap();
        for (name, bytes) in &files {
            std::fs::write(dir.join(name), bytes).unwrap();
        }
    }
    for (name, bytes) in &files {
        assert_eq!(
            &std::fs::read(dir.join(name)).unwrap_or_default(),
            bytes,
            "{name} is out of date: run examples/osnma/regenerate.sh"
        );
        if name.ends_with("key.txt") {
            continue;
        }
        let rel = format!("examples/osnma/{name}");
        let json = cli_from_root(&[&rel, "--public-key", &key_arg, "--json"]);
        let expected = dir.join("expected").join(format!("{name}.json"));
        if write {
            std::fs::write(&expected, &json).unwrap();
        }
        assert_eq!(
            std::fs::read_to_string(&expected).unwrap_or_default(),
            json,
            "expected output of {name} is out of date: run examples/osnma/regenerate.sh"
        );
    }
}
