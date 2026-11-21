// SPDX-License-Identifier: AGPL-3.0-only
//! The synthetic stream builder behind the open vector set: TESLA chains, I/NAV pages carrying
//! HKROOT and MACK sections, DSM-KROOT and DSM-PKR messages, a Merkle tree and tags, all made
//! from fixed seeds (no random numbers), so the same pages come out every time.
//!
//! Everything here is Kshana's own: the signing keys are throwaway keys made from a repeated
//! byte, the navigation words are hashes, and the layouts are Kshana's re-expression of the
//! SIS ICD Issue 1.1 (the source is acknowledged in `docs/OSNMA.md`). Nothing is copied from the
//! ICD, the Receiver Guidelines or the official test vectors, and nothing here is a recording of
//! any signal. The layout is written out separately from the verifier's parser (it follows
//! `tests/osnma_synthetic.rs`), but it is still our own reading of the ICD: passing these
//! vectors shows consistency with that reading, not conformance to the Galileo system.

use crate::osnma::bits::{read_bits, BitWriter};
use crate::osnma::signature::PublicKey;
use crate::osnma::tables::{HashFn, KeyType, MacFn};
use crate::osnma::{gst_pack, mac, tesla, InavPage, WEEK_S};
use sha2::{Digest, Sha256};

/// GST week of the synthetic streams.
pub const WN: u32 = 1248;
/// Hour-aligned start of the standard chain and of most streams.
pub const GST0: u32 = WN * WEEK_S + 345_600;
const ALPHA: [u8; 6] = [0x11, 0x22, 0x33, 0x44, 0x55, 0x66];
const KEY_BITS: usize = 128;
const TAG_BITS: usize = 40;
/// The satellite that transmits OSNMA.
pub const PRNA: u8 = 2;
/// A satellite without OSNMA of its own, authenticated by cross-authentication.
pub const PRN_X: u8 = 5;
/// A second OSNMA transmitter that repeats the header of `PRNA` (a witness).
pub const PRN_W: u8 = 9;

/// Everything that distinguishes one chain from another.
#[derive(Clone)]
pub struct Ctx {
    pub hash: HashFn,
    pub mac: MacFn,
    pub cid: u8,
    pub alpha: [u8; 6],
    pub gst0: u32,
    pub seed: u8,
    pub nmas: u8,
    /// Tags for `PRN_X` are dummy tags (COP 0, computed over zeros).
    pub dummy_x: bool,
}

impl Ctx {
    /// The standard chain: SHA-256, HMAC-SHA-256, chain id 3, operational status.
    pub fn std() -> Self {
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
    pub fn chain(&self, n: u32) -> Vec<Vec<u8>> {
        let mut seq = vec![(0..KEY_BITS / 8)
            .map(|i| (i * 13 + usize::from(self.seed)) as u8)
            .collect::<Vec<u8>>()];
        for i in (0..n).rev() {
            let gst = self.gst0 + 30 * i - 30;
            let next = tesla::step(self.hash, &seq[seq.len() - 1], gst, &self.alpha, KEY_BITS);
            seq.push(next);
        }
        seq.reverse();
        seq
    }

    /// The key transmitted at `gst` is K_i with i = (gst - gst0) / 30 + 1.
    pub fn key_at(&self, chain: &[Vec<u8>], gst: u32) -> Vec<u8> {
        chain[((gst - self.gst0) / 30 + 1) as usize].clone()
    }

    /// The NMA header with chain and public key status `cpks`.
    pub fn header(&self, cpks: u8) -> u8 {
        (self.nmas << 6) | (self.cid << 4) | (cpks << 1)
    }

    fn mac_tag(&self, key: &[u8], msg: &[u8]) -> u64 {
        let full = mac::compute(self.mac, key, msg).unwrap_or_default();
        read_bits(&full, 0, TAG_BITS).unwrap_or(0)
    }

    fn tag_msg(&self, prnd: Option<u8>, gst: u32, ctr: u8, nav: &(Vec<u8>, usize)) -> Vec<u8> {
        let mut m = BitWriter::new();
        if let Some(d) = prnd {
            m.push(u64::from(d), 8);
        }
        m.push(u64::from(PRNA), 8);
        m.push(u64::from(gst_pack(gst)), 32);
        m.push(u64::from(ctr), 8);
        m.push(u64::from(self.nmas), 2);
        for i in 0..nav.1 {
            m.push(read_bits(&nav.0, i, 1).unwrap_or(0), 1);
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

    /// The MACK of `PRNA` transmitted at `gst` (look-up entry 34): the flexible slots carry
    /// cross-authentication of ADKD 0 for `PRN_X`.
    pub fn mack(&self, chain: &[Vec<u8>], gst: u32) -> [u8; 60] {
        let k_next = self.key_at(chain, gst + 30);
        let p = plan(gst);
        let mut w = BitWriter::new();
        let t0 = self.mac_tag(
            &k_next,
            &self.tag_msg(None, gst, 1, &navdata(PRNA, gst - 30, 0)),
        );
        let flex_idx: &[usize] = if gst.is_multiple_of(60) {
            &[0, 2]
        } else {
            &[0]
        };
        let mut ms = BitWriter::new();
        ms.push(u64::from(PRNA), 8);
        ms.push(u64::from(gst_pack(gst)), 32);
        for i in flex_idx {
            let (prnd, adkd) = p[*i];
            ms.push(
                (u64::from(prnd) << 8) | (u64::from(adkd) << 4) | u64::from(self.cop(prnd)),
                16,
            );
        }
        let macseq = read_bits(
            &mac::compute(self.mac, &k_next, &ms.into_bytes()).unwrap_or_default(),
            0,
            12,
        )
        .unwrap_or(0);
        w.push(t0, TAG_BITS);
        w.push(macseq, 12);
        w.push(1, 4);
        for (i, (prnd, adkd)) in p.iter().enumerate() {
            let ctr = i as u8 + 2;
            let cop = self.cop(*prnd);
            let nav = if cop == 0 {
                let bits: usize = if *adkd == 4 { 141 } else { 549 };
                (vec![0u8; bits.div_ceil(8)], bits)
            } else {
                navdata(*prnd, gst - 30, if *adkd == 4 { 4 } else { 0 })
            };
            let key = if *adkd == 12 {
                self.key_at(chain, gst + 330)
            } else {
                k_next.clone()
            };
            w.push(
                self.mac_tag(&key, &self.tag_msg(Some(*prnd), gst, ctr, &nav)),
                TAG_BITS,
            );
            w.push(u64::from(*prnd), 8);
            w.push(u64::from(*adkd), 4);
            w.push(u64::from(cop), 4);
        }
        let k = self.key_at(chain, gst);
        for half in k.chunks(8) {
            let mut b = [0u8; 8];
            b.copy_from_slice(half);
            w.push(u64::from_be_bytes(b), 64);
        }
        w.push(0, 480 - w.bit_len());
        let mut out = [0u8; 60];
        out.copy_from_slice(&w.into_bytes());
        out
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

/// The 15 words of a sub-frame of satellite `prn`. As in broadcast data, the ephemeris and
/// clock content holds for as long as the IODnav (ten minutes); Word Type 5 carries the time.
pub fn words(prn: u8, gst: u32) -> [[u8; 16]; 15] {
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

/// Navigation data bits of the sub-frame at `gst` for ADKD 0 or 4.
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

/// Tag-Info (satellite, ADKD) of tags 1 to 5 of the MACK sent at `gst`, look-up entry 34.
fn plan(gst: u32) -> [(u8, u8); 5] {
    if gst.is_multiple_of(60) {
        [(PRN_X, 0), (PRNA, 4), (PRN_X, 0), (PRNA, 12), (PRN_X, 0)]
    } else {
        [(PRN_X, 0), (PRN_X, 0), (PRNA, 12), (PRN_X, 0), (PRN_X, 12)]
    }
}

/// HKROOT bytes carrying only an NMA header.
pub fn plain_hkroot(header: u8) -> [u8; 15] {
    let mut hk = [0u8; 15];
    hk[0] = header;
    hk
}

/// HKROOT bytes carrying block `block` of DSM `dsm_id`.
pub fn dsm_hk(header: u8, dsm_id: u8, dsm: &[u8], block: usize) -> [u8; 15] {
    let mut hk = plain_hkroot(header);
    hk[1] = (dsm_id << 4) | block as u8;
    hk[2..].copy_from_slice(&dsm[block * 13..block * 13 + 13]);
    hk
}

/// The 15 page pairs of one sub-frame, with valid CRCs and the one-second E1 offset in their
/// time labels.
pub fn subframe_pages(
    svid: u8,
    gst: u32,
    ws: &[[u8; 16]; 15],
    osnma: Option<(&[u8; 15], &[u8; 60])>,
) -> Vec<InavPage> {
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
            match osnma {
                Some((hk, m)) => {
                    b.push(u64::from(hk[i]), 8);
                    let mut q = [0u8; 4];
                    q.copy_from_slice(&m[i * 4..i * 4 + 4]);
                    b.push(u64::from(u32::from_be_bytes(q)), 32);
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

/// A page rewritten by `edit`, with its CRC made valid again.
pub fn edit_page(p: &InavPage, edit: impl FnOnce(&mut [u8; 30])) -> InavPage {
    let mut raw = [0u8; 30];
    raw.copy_from_slice(p.bytes());
    edit(&mut raw);
    InavPage::from_bytes(p.svid, p.gst, &raw).with_valid_crc()
}

/// A throwaway ECDSA signing key made from a repeated byte. It authenticates nothing real.
pub enum Signer {
    P256(p256::ecdsa::SigningKey),
    P521(p521::ecdsa::SigningKey),
}

impl Signer {
    pub fn p256(seed: u8) -> Self {
        Self::P256(p256::ecdsa::SigningKey::from_slice(&[seed; 32]).expect("valid scalar"))
    }

    pub fn p521(seed: u8) -> Self {
        let mut scalar = [seed; 66];
        scalar[0] = 0x01;
        Self::P521(p521::ecdsa::SigningKey::from_slice(&scalar).expect("valid scalar"))
    }

    pub fn public(&self, pkid: u8) -> PublicKey {
        match self {
            Self::P256(sk) => PublicKey {
                pkid,
                key_type: KeyType::P256,
                bytes: sk.verifying_key().to_sec1_point(true).as_bytes().to_vec(),
            },
            Self::P521(sk) => PublicKey {
                pkid,
                key_type: KeyType::P521,
                bytes: p521::ecdsa::VerifyingKey::from(sk)
                    .to_sec1_point(true)
                    .as_bytes()
                    .to_vec(),
            },
        }
    }

    /// Deterministic (RFC 6979) signature.
    fn sign(&self, msg: &[u8]) -> Vec<u8> {
        match self {
            Self::P256(sk) => {
                use p256::ecdsa::signature::Signer as _;
                let s: p256::ecdsa::Signature = sk.sign(msg);
                s.to_bytes().to_vec()
            }
            Self::P521(sk) => {
                use p521::ecdsa::signature::Signer as _;
                let s: p521::ecdsa::Signature = sk.sign(msg);
                s.to_bytes().to_vec()
            }
        }
    }
}

/// A DSM-KROOT for the chain of `ctx` with root key `root`, signed with `signer` under key id
/// `pkid`; the signed message uses `header` as its NMA header.
pub fn dsm_kroot(ctx: &Ctx, root: &[u8], signer: &Signer, header: u8, pkid: u8) -> Vec<u8> {
    let (blocks, nbdk, sig_len) = match signer {
        Signer::P256(_) => (8usize, 2u8, 64usize),
        Signer::P521(_) => (13, 7, 132),
    };
    let mut d = vec![0u8; blocks * 13];
    d[0] = (nbdk << 4) | pkid;
    let hf = if ctx.hash == HashFn::Sha3_256 { 2 } else { 0 };
    let mf = if ctx.mac == MacFn::CmacAes { 1 } else { 0 };
    d[1] = (ctx.cid << 6) | (hf << 2) | mf;
    d[2] = (4 << 4) | 9; // 128-bit keys, 40-bit tags
    d[3] = 34; // look-up entry
    d[4] = ((ctx.gst0 / WEEK_S) >> 8) as u8;
    d[5] = (ctx.gst0 / WEEK_S) as u8;
    d[6] = ((ctx.gst0 % WEEK_S) / 3600) as u8;
    d[7..13].copy_from_slice(&ctx.alpha);
    d[13..29].copy_from_slice(root);
    let mut m = vec![header];
    m.extend_from_slice(&d[1..29]);
    d[29..29 + sig_len].copy_from_slice(&signer.sign(&m));
    // Padding: a truncated hash of the signed message and the signature.
    m.extend_from_slice(&d[29..29 + sig_len]);
    let h = Sha256::digest(&m);
    let end = 29 + sig_len;
    let n = d.len() - end;
    d[end..].copy_from_slice(&h[..n]);
    d
}

fn h2(a: &[u8], b: &[u8]) -> [u8; 32] {
    let mut h = Sha256::new();
    h.update(a);
    h.update(b);
    h.finalize().into()
}

/// A 16-leaf SHA-256 Merkle tree of our own.
pub struct Tree {
    levels: Vec<Vec<[u8; 32]>>,
}

impl Tree {
    pub fn new(leaves: &[Vec<u8>]) -> Self {
        let mut levels = vec![leaves
            .iter()
            .map(|m| Sha256::digest(m).into())
            .collect::<Vec<[u8; 32]>>()];
        while levels[levels.len() - 1].len() > 1 {
            let next = levels[levels.len() - 1]
                .chunks(2)
                .map(|p| h2(&p[0], &p[1]))
                .collect();
            levels.push(next);
        }
        Self { levels }
    }

    pub fn root(&self) -> [u8; 32] {
        self.levels[self.levels.len() - 1][0]
    }

    /// A 13-block DSM-PKR for leaf `mid` whose leaf message is `leaf`.
    pub fn dsm_pkr(&self, mid: u8, leaf: &[u8]) -> Vec<u8> {
        let mut d = vec![(7u8 << 4) | mid];
        for j in 0..4 {
            d.extend_from_slice(&self.levels[j][usize::from(mid >> j) ^ 1]);
        }
        d.extend_from_slice(leaf);
        let pad = 169usize.saturating_sub(d.len());
        if pad > 0 {
            d.extend_from_slice(&h2(&self.root(), leaf)[..pad]);
        }
        d.truncate(169);
        d
    }
}

/// The leaf message of a public key (new public key type 1).
pub fn key_leaf(pk: &PublicKey) -> Vec<u8> {
    let mut l = vec![(1u8 << 4) | pk.pkid];
    l.extend_from_slice(&pk.bytes);
    l
}

/// The leaf message of the alert (new public key type 4) with its fixed filler.
pub fn alert_leaf() -> Vec<u8> {
    let mut l = vec![4u8 << 4];
    l.extend((0..39).map(|i| (i * 37 + 11) as u8));
    l
}

/// A tree whose leaf 0 holds `keys[0]`, leaf 1 `keys[1]` (if any) and leaf 15 the alert.
pub fn tree_for(keys: &[PublicKey]) -> Tree {
    let leaves: Vec<Vec<u8>> = (0..16u8)
        .map(|i| match i {
            15 => alert_leaf(),
            i if usize::from(i) < keys.len() => key_leaf(&keys[usize::from(i)]),
            _ => vec![(1 << 4) | (i & 15), i, i, i],
        })
        .collect();
    Tree::new(&leaves)
}

/// A change to the pages one satellite sends in one sub-frame: `(n, gst, svid, pages)`.
pub type Tamper<'a> = &'a mut dyn FnMut(u32, u32, u8, &mut Vec<InavPage>);

/// What `PRNA` transmits in one sub-frame.
pub struct Frame {
    pub hk: [u8; 15],
    pub mack: [u8; 60],
}

/// A stream of `nsf` sub-frames from `start`, in this order within each sub-frame: `PRNA` sends
/// `frame(n, gst)`, `PRN_X` sends navigation data only, and from sub-frame `witness_from` on `PRN_W` repeats the header of
/// `PRNA` with a MACK of filler bytes. `tamper` may alter any satellite's pages of a sub-frame.
pub fn stream(
    start: u32,
    nsf: u32,
    witness_from: Option<u32>,
    frame: &mut dyn FnMut(u32, u32) -> Frame,
    tamper: Tamper,
) -> Vec<InavPage> {
    let mut all = Vec::new();
    for n in 0..nsf {
        let gst = start + 30 * n;
        let f = frame(n, gst);
        let mut x = subframe_pages(PRN_X, gst, &words(PRN_X, gst), None);
        let mut a = subframe_pages(PRNA, gst, &words(PRNA, gst), Some((&f.hk, &f.mack)));
        tamper(n, gst, PRNA, &mut a);
        tamper(n, gst, PRN_X, &mut x);
        all.extend(a);
        all.extend(x);
        if witness_from.is_some_and(|w| n >= w) {
            let mut w = subframe_pages(PRN_W, gst, &words(PRN_W, gst), Some((&f.hk, &[0xA5; 60])));
            tamper(n, gst, PRN_W, &mut w);
            all.extend(w);
        }
    }
    all
}

/// The plain page format `kshana osnma verify` reads, with a header naming the vector.
pub fn render_pages(id: &str, pages: &[InavPage]) -> String {
    let mut out = format!(
        "# {id}\n# Synthetic: made by `kshana osnma vectors generate`, not a recording of any signal.\n# <svid> <gst_seconds> <240 page bits as hex>\n"
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
