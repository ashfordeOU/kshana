// SPDX-License-Identifier: AGPL-3.0-only
//! Version 1 of the open synthetic OSNMA vector set: what each vector feeds the verifier and
//! the fixed bar it must meet. The bars are written here by hand from the documented
//! behaviour (`docs/OSNMA.md`, and the ICD and Receiver Guidelines sections each vector
//! cites); they are never derived from a run of the verifier. Their SHA-256 is pinned in
//! [`super::BARS_SHA256_V1`], so changing a bar is a visible change of that constant and of
//! the set version, never a silent adjustment.
//!
//! Section numbers refer to the Galileo OSNMA SIS ICD Issue 1.1 ("ICD") and the Galileo OSNMA
//! Receiver Guidelines Issue 1.3 ("RG"), © European Union; they are citations, not copies.

use super::gen::{
    dsm_hk, dsm_kroot, edit_page, plain_hkroot, stream, subframe_pages, tree_for, words, Ctx,
    Frame, Signer, Tamper, GST0, PRNA, PRN_W, PRN_X,
};
use crate::osnma::signature::PublicKey;
use crate::osnma::tables::{HashFn, MacFn};
use crate::osnma::InavPage;
use serde_json::{json, Value};

/// What one vector gives the verifier: the pages and the trust anchors and time a receiver
/// would hold.
pub struct Built {
    /// The I/NAV pages the receiver gets.
    pub pages: Vec<InavPage>,
    /// The Merkle root the receiver trusts, if the vector uses one.
    pub merkle_root: Option<[u8; 32]>,
    /// The public keys the receiver holds.
    pub public_keys: Vec<PublicKey>,
    /// The receiver's reference time (GST, s), if the vector sets one.
    pub reference_time: Option<u32>,
    /// The receiver's maximum time error (s), if the vector sets one.
    pub max_time_error: Option<u32>,
}

impl Built {
    fn keys(pages: Vec<InavPage>, keys: Vec<PublicKey>) -> Self {
        Self {
            pages,
            merkle_root: None,
            public_keys: keys,
            reference_time: None,
            max_time_error: None,
        }
    }
}

/// One vector of the set.
pub struct VectorDef {
    /// Vector ID, as in the manifest.
    pub id: &'static str,
    /// Category of the vector (valid, keys, key-chain, mack-tags, time, replay, corruption, alert, renewal-revocation).
    pub category: &'static str,
    /// One-line title.
    pub title: &'static str,
    /// ICD and Receiver Guidelines references for the vector.
    pub refs: &'static [&'static str],
    /// Builds the vector's pages and trust anchors.
    pub build: fn() -> Built,
    /// The vector's fixed bars, as JSON.
    pub bars: fn() -> Value,
}

const PK1: u8 = 1;
const PK2: u8 = 2;

fn sk1() -> Signer {
    Signer::p256(0x11)
}

fn sk2() -> Signer {
    Signer::p256(0x22)
}

fn none() -> impl FnMut(u32, u32, u8, &mut Vec<InavPage>) {
    |_, _, _, _| {}
}

/// Frames of one chain whose DSM-KROOT (DSM id 0) is broadcast round the clock.
fn kroot_frames(ctx: Ctx, chain: Vec<Vec<u8>>, dsm: Vec<u8>) -> impl FnMut(u32, u32) -> Frame {
    move |n, gst| Frame {
        hk: dsm_hk(ctx.header(1), 0, &dsm, n as usize % (dsm.len() / 13)),
        mack: ctx.mack(&chain, gst),
    }
}

/// The standard chain signed with key 1, `nsf` sub-frames from `GST0`, with `tamper`.
fn std_stream(nsf: u32, tamper: Tamper) -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(nsf + 20);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let pages = stream(GST0, nsf, None, &mut kroot_frames(ctx, chain, dsm), tamper);
    Built::keys(pages, vec![sk1().public(PK1)])
}

/// The standard chain with a different context (algorithms, dummy tags).
fn ctx_stream(ctx: Ctx, signer: Signer, nsf: u32) -> Built {
    let chain = ctx.chain(nsf + 20);
    let dsm = dsm_kroot(&ctx, &chain[0], &signer, ctx.header(1), PK1);
    let pages = stream(
        GST0,
        nsf,
        None,
        &mut kroot_frames(ctx, chain, dsm),
        &mut none(),
    );
    Built::keys(pages, vec![signer.public(PK1)])
}

// ------------------------------------------------------------------------- builders ---

fn b_nominal() -> Built {
    std_stream(20, &mut none())
}

fn b_cmac_sha3_p521() -> Built {
    let mut c = Ctx::std();
    c.hash = HashFn::Sha3_256;
    c.mac = MacFn::CmacAes;
    ctx_stream(c, Signer::p521(0x33), 24)
}

fn b_pkr_merkle() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(46);
    let pk = sk1().public(PK1);
    let tree = tree_for(std::slice::from_ref(&pk));
    let pkr = tree.dsm_pkr(0, &super::gen::key_leaf(&pk));
    let kroot = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| Frame {
        hk: if n < 13 {
            dsm_hk(ctx.header(1), 12, &pkr, n as usize)
        } else {
            dsm_hk(ctx.header(1), 0, &kroot, (n - 13) as usize % 8)
        },
        mack: ctx.mack(&chain, gst),
    };
    let pages = stream(GST0, 26, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree.root()),
        ..Built::keys(pages, Vec::new())
    }
}

fn b_dummy_tags() -> Built {
    let mut c = Ctx::std();
    c.dummy_x = true;
    ctx_stream(c, sk1(), 20)
}

fn b_flipped_key_bit() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    std_stream(18, &mut |n, gst, svid, pgs| {
        if n == 12 && svid == PRNA {
            let mut m = ctx.mack(&chain, gst);
            m[50] ^= 1; // inside the 128-bit key field (bytes 42 to 57)
            let hk = std_hk(n);
            *pgs = subframe_pages(PRNA, gst, &words(PRNA, gst), Some((&hk, &m)));
        }
    })
}

/// The HKROOT the standard stream sends in sub-frame `n` (KROOT block `n % 8`).
fn std_hk(n: u32) -> [u8; 15] {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    dsm_hk(ctx.header(1), 0, &dsm, n as usize % 8)
}

fn b_key_conflict() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    // Satellite 5 also sends OSNMA in sub-frame 12, after satellite 2, with one key bit flipped.
    std_stream(18, &mut |n, gst, svid, pgs| {
        if n == 12 && svid == PRN_X {
            let mut m = ctx.mack(&chain, gst);
            m[50] ^= 1;
            let hk = std_hk(n);
            *pgs = subframe_pages(PRN_X, gst, &words(PRN_X, gst), Some((&hk, &m)));
        }
    })
}

fn b_wrong_public_key() -> Built {
    // The KROOT is signed with another key under the same id as the trusted key.
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk2(), ctx.header(1), PK1);
    let pages = stream(
        GST0,
        16,
        None,
        &mut kroot_frames(ctx, chain, dsm),
        &mut none(),
    );
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_unknown_key_id() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk2(), ctx.header(1), PK2);
    let pages = stream(
        GST0,
        16,
        None,
        &mut kroot_frames(ctx, chain, dsm),
        &mut none(),
    );
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_stale_kroot() -> Built {
    // A genuine, signed KROOT of an older chain with the same id (an hour earlier, another
    // pattern and seed) follows the chain in force on a second DSM id.
    let a = Ctx::std();
    let mut old = Ctx::std();
    old.alpha = [9, 8, 7, 6, 5, 4];
    old.gst0 = GST0 - 3600;
    old.seed = 77;
    let chain_a = a.chain(40);
    let chain_old = old.chain(5);
    let dsm_a = dsm_kroot(&a, &chain_a[0], &sk1(), a.header(1), PK1);
    let dsm_old = dsm_kroot(&old, &chain_old[0], &sk1(), old.header(1), PK1);
    let mut frames = |n: u32, gst: u32| Frame {
        hk: if n % 16 < 8 {
            dsm_hk(a.header(1), 0, &dsm_a, n as usize % 8)
        } else {
            dsm_hk(a.header(1), 1, &dsm_old, n as usize % 8)
        },
        mack: a.mack(&chain_a, gst),
    };
    let pages = stream(GST0, 20, None, &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_flipped_nav_bit() -> Built {
    std_stream(20, &mut |n, _, svid, pgs| {
        if n == 12 && svid == PRN_X {
            pgs[0] = edit_page(&pgs[0], |raw| raw[3] ^= 0x10);
        }
    })
}

fn b_replayed_tags() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    std_stream(20, &mut |n, gst, svid, pgs| {
        if n == 14 && svid == PRNA {
            // The tags of sub-frame 12 (same MACK layout) with the genuine key of sub-frame 14.
            let mut m = ctx.mack(&chain, gst - 60);
            m[42..].copy_from_slice(&ctx.mack(&chain, gst)[42..]);
            let hk = std_hk(n);
            *pgs = subframe_pages(PRNA, gst, &words(PRNA, gst), Some((&hk, &m)));
        }
    })
}

fn b_macseq() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    std_stream(20, &mut |n, gst, svid, pgs| {
        if n == 12 && svid == PRNA {
            let mut m = ctx.mack(&chain, gst);
            m[5] ^= 0x80; // first bit of the 12-bit MACSEQ after the 40-bit Tag0
            let hk = std_hk(n);
            *pgs = subframe_pages(PRNA, gst, &words(PRNA, gst), Some((&hk, &m)));
        }
    })
}

fn b_header_other_chain() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| {
        let mut c = ctx.clone();
        if n >= 12 {
            c.cid = 1; // the header names a chain that was never verified
        }
        Frame {
            hk: dsm_hk(c.header(1), 0, &dsm, n as usize % 8),
            mack: ctx.mack(&chain, gst),
        }
    };
    let pages = stream(GST0, 18, None, &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_chain_renewal() -> Built {
    // Chain A (id 3) is in force until the hour; chain B (id 1, another pattern and seed)
    // from the hour on. Both KROOTs, signed with key 1, are broadcast in turn on two DSM ids.
    let a = Ctx::std();
    let mut b = Ctx::std();
    b.cid = 1;
    b.alpha = [9, 8, 7, 6, 5, 4];
    b.gst0 = GST0 + 3600;
    b.seed = 77;
    let chain_a = a.chain(140);
    let chain_b = b.chain(40);
    let dsm_a = dsm_kroot(&a, &chain_a[0], &sk1(), a.header(1), PK1);
    let dsm_b = dsm_kroot(&b, &chain_b[0], &sk1(), b.header(1), PK1);
    let start = GST0 + 3600 - 30 * 14;
    let mut frames = |n: u32, gst: u32| {
        let (c, chain) = if gst < b.gst0 {
            (&a, &chain_a)
        } else {
            (&b, &chain_b)
        };
        Frame {
            hk: if n % 16 < 8 {
                dsm_hk(c.header(1), 0, &dsm_a, n as usize % 8)
            } else {
                dsm_hk(c.header(1), 1, &dsm_b, n as usize % 8)
            },
            mack: c.mack(chain, gst),
        }
    };
    let pages = stream(start, 28, None, &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_chain_revocation() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(50);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| {
        // From sub-frame 12: chain revoked (CPKS 3) with NMA status "don't use".
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
    let pages = stream(GST0, 26, Some(12), &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_pk_renewal() -> Built {
    // Key 1 is trusted. A new public key (id 2) arrives through the Merkle tree, and the
    // chain in force is announced again with a KROOT signed by key 2.
    let ctx = Ctx::std();
    let chain = ctx.chain(56);
    let (p1, p2) = (sk1().public(PK1), sk2().public(PK2));
    let tree = tree_for(&[p1.clone(), p2.clone()]);
    let pkr2 = tree.dsm_pkr(1, &super::gen::key_leaf(&p2));
    let k1 = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let k2 = dsm_kroot(&ctx, &chain[0], &sk2(), ctx.header(1), PK2);
    let mut frames = |n: u32, gst: u32| Frame {
        hk: if n < 8 {
            dsm_hk(ctx.header(1), 0, &k1, n as usize)
        } else if n < 21 {
            dsm_hk(ctx.header(1), 12, &pkr2, (n - 8) as usize)
        } else {
            dsm_hk(ctx.header(1), 1, &k2, (n - 21) as usize % 8)
        },
        mack: ctx.mack(&chain, gst),
    };
    let pages = stream(GST0, 32, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree.root()),
        ..Built::keys(pages, vec![p1])
    }
}

fn b_pk_revocation() -> Built {
    // Chain A (id 3, key 1) is established from its KROOT. A second chain (id 1, signed
    // with key 2, applicable an hour later) is announced on another DSM id. From sub-frame 18
    // the header says "public key revoked" with "don't use" for chain 3, confirmed by a second
    // satellite: key 1 and the chain it signed go; key 2 and its chain stay.
    let a = Ctx::std();
    let mut b = Ctx::std();
    b.cid = 1;
    b.alpha = [9, 8, 7, 6, 5, 4];
    b.gst0 = GST0 + 3600;
    b.seed = 77;
    let chain_a = a.chain(50);
    let chain_b = b.chain(5);
    let dsm_a = dsm_kroot(&a, &chain_a[0], &sk1(), a.header(1), PK1);
    // Chain 1's KROOT is signed over the header it is sent under, chain 3's.
    let dsm_b = dsm_kroot(&b, &chain_b[0], &sk2(), a.header(1), PK2);
    let mut frames = |n: u32, gst: u32| {
        let hk = if n < 8 {
            dsm_hk(a.header(1), 0, &dsm_a, n as usize)
        } else if n < 16 {
            dsm_hk(a.header(1), 1, &dsm_b, (n - 8) as usize)
        } else if n >= 18 {
            let mut r = a.clone();
            r.nmas = 3;
            plain_hkroot(r.header(5))
        } else {
            plain_hkroot(a.header(1))
        };
        Frame {
            hk,
            mack: a.mack(&chain_a, gst),
        }
    };
    let pages = stream(GST0, 22, Some(18), &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1), sk2().public(PK2)])
}

fn b_alert() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(50);
    let p1 = sk1().public(PK1);
    let tree = tree_for(std::slice::from_ref(&p1));
    let alert = tree.dsm_pkr(15, &super::gen::alert_leaf());
    let kroot = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| {
        let hk = if n < 14 {
            dsm_hk(ctx.header(1), 0, &kroot, n as usize % 8)
        } else {
            let mut c = ctx.clone();
            c.nmas = 3;
            dsm_hk(c.header(7), 12, &alert, (n - 14) as usize % 13)
        };
        Frame {
            hk,
            mack: ctx.mack(&chain, gst),
        }
    };
    let pages = stream(GST0, 28, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree.root()),
        ..Built::keys(pages, vec![p1])
    }
}

/// Don't-use from sub-frame 12; the KROOT is sent once (sub-frames 0 to 7), then only the
/// header, so no signed header can lift the status again.
fn dont_use(witness: Option<u32>) -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| {
        let mut c = ctx.clone();
        if n >= 12 {
            c.nmas = 3;
        }
        Frame {
            hk: if n < 8 {
                dsm_hk(c.header(1), 0, &dsm, n as usize)
            } else {
                plain_hkroot(c.header(1))
            },
            mack: ctx.mack(&chain, gst),
        }
    };
    let pages = stream(GST0, 20, witness, &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_dont_use_confirmed() -> Built {
    dont_use(Some(12))
}

fn b_dont_use_single() -> Built {
    dont_use(None)
}

fn b_bad_crc() -> Built {
    std_stream(18, &mut |n, _, svid, pgs| {
        // One bit flipped without repairing the CRC: in satellite 2's sub-frame 12 and
        // satellite 5's sub-frame 13.
        let target = match (n, svid) {
            (12, PRNA) => Some(3),
            (13, PRN_X) => Some(0),
            _ => None,
        };
        if let Some(i) = target {
            let mut raw = [0u8; 30];
            raw.copy_from_slice(pgs[i].bytes());
            raw[10] ^= 0x04;
            pgs[i] = InavPage::from_bytes(pgs[i].svid, pgs[i].gst, &raw);
        }
    })
}

fn b_truncated() -> Built {
    std_stream(20, &mut |n, _, svid, pgs| {
        // Satellite 2's sub-frame 11 stops after page 8; satellite 5's sub-frame 12 after 10.
        match (n, svid) {
            (11, PRNA) => pgs.truncate(8),
            (12, PRN_X) => pgs.truncate(10),
            _ => {}
        }
    })
}

fn b_corrupt_kroot() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let mut dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    dsm[3 * 13 + 5] ^= 0x01; // a signature byte in block 3, every time it is sent
    let pages = stream(
        GST0,
        18,
        None,
        &mut kroot_frames(ctx, chain, dsm),
        &mut none(),
    );
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_corrupt_pkr() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(46);
    let pk = sk1().public(PK1);
    let tree = tree_for(std::slice::from_ref(&pk));
    let mut pkr = tree.dsm_pkr(0, &super::gen::key_leaf(&pk));
    pkr[140] ^= 1; // a bit of the new public key
    let kroot = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| Frame {
        hk: if n < 13 {
            dsm_hk(ctx.header(1), 12, &pkr, n as usize)
        } else {
            dsm_hk(ctx.header(1), 0, &kroot, (n - 13) as usize % 8)
        },
        mack: ctx.mack(&chain, gst),
    };
    let pages = stream(GST0, 24, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree.root()),
        ..Built::keys(pages, Vec::new())
    }
}

fn b_reference_far() -> Built {
    Built {
        reference_time: Some(GST0 + 86_400),
        max_time_error: Some(29),
        ..std_stream(16, &mut none())
    }
}

fn b_shifted_stamps() -> Built {
    std_stream(16, &mut |_, _, svid, pgs| {
        if svid == PRNA {
            for p in pgs.iter_mut() {
                let mut raw = [0u8; 30];
                raw.copy_from_slice(p.bytes());
                *p = InavPage::from_bytes(p.svid, p.gst + 60, &raw);
            }
        }
    })
}

fn b_far_future() -> Built {
    let mut b = b_flipped_nav_bit();
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let ahead = GST0 + 86_400;
    for svid in [PRN_X, PRNA, PRN_W, 30] {
        // Well-formed pages with zero data, then pages with genuine OSNMA content of another time.
        b.pages
            .extend(subframe_pages(svid, ahead, &[[0u8; 16]; 15], None));
        let hk = std_hk(1);
        b.pages.extend(subframe_pages(
            svid,
            ahead + 30,
            &words(svid, ahead + 30),
            Some((&hk, &ctx.mack(&chain, GST0 + 30))),
        ));
    }
    b
}

// --------------------------------------------------------------------------- the set ---

/// The vectors of set version 1, in order.
pub fn vectors() -> Vec<VectorDef> {
    vec![
        VectorDef {
            id: "V01-nominal",
            category: "valid",
            title: "Signed chain (P-256 KROOT, SHA-256 chain, HMAC-SHA-256 tags), cross-authentication, ADKD 0, 4 and 12",
            refs: &["ICD 3.2.3", "ICD 4.2", "ICD 6.3", "ICD 6.4", "ICD 6.7", "RG 5.2", "RG 5.4", "RG 5.5"],
            build: b_nominal,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "alert": false, "nma_status": 2, "exit": 0,
                "tags": {"authenticated_min": 20, "failed_max": 0},
                "adkd_authenticated": [0, 4, 12],
                "events_present": [{"kind": "kroot_verified", "cid": 3, "pkid": 1, "hash": "Sha256", "mac": "HmacSha256"}, {"kind": "key_verified"}],
                "events_absent": [{"kind": "key_rejected"}, {"kind": "kroot_rejected"}]
            }),
        },
        VectorDef {
            id: "V02-cmac-sha3-p521",
            category: "valid",
            title: "Signed chain with a P-521 KROOT signature, a SHA3-256 chain and CMAC-AES tags",
            refs: &["ICD 3.2.3", "ICD 6.1.1", "ICD 6.3", "ICD 6.7"],
            build: b_cmac_sha3_p521,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 10, "failed_max": 0},
                "adkd_authenticated": [0],
                "events_present": [{"kind": "kroot_verified", "pkid": 1, "hash": "Sha3_256", "mac": "CmacAes"}]
            }),
        },
        VectorDef {
            id: "V03-pkr-merkle",
            category: "valid",
            title: "Public key delivered by a DSM-PKR and checked against the Merkle root, then the KROOT it signed",
            refs: &["ICD 3.2.2", "ICD 5.4", "ICD 6.2", "RG 5.1"],
            build: b_pkr_merkle,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 5, "failed_max": 0},
                "events_present": [{"kind": "public_key_verified", "pkid": 1}, {"kind": "kroot_verified", "pkid": 1}],
                "events_absent": [{"kind": "public_key_rejected"}]
            }),
        },
        VectorDef {
            id: "V04-dummy-tags",
            category: "valid",
            title: "Dummy tags (COP 0) for satellite 5 prove the key but never authenticate its data",
            refs: &["ICD 4.1.3", "ICD 4.2.1", "RG 5.5.6"],
            build: b_dummy_tags,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated"},
                "satellites_not": {"E05": "authenticated"},
                "exit": 0,
                "tags": {"failed_max": 0}
            }),
        },
        VectorDef {
            id: "K01-flipped-key-bit",
            category: "key-chain",
            title: "A TESLA key with one flipped bit does not verify against the chain",
            refs: &["ICD 6.4", "RG 5.4.3"],
            build: b_flipped_key_bit,
            bars: || json!({
                "events_present": [{"kind": "kroot_verified"}, {"kind": "key_rejected", "reason": "key_chain_mismatch"}]
            }),
        },
        VectorDef {
            id: "K02-key-conflict",
            category: "key-chain",
            title: "Two satellites send different keys for one slot: the second is a conflict, the verified key stays",
            refs: &["ICD 6.4", "RG 5.4.3"],
            build: b_key_conflict,
            bars: || json!({
                "tags": {"authenticated_min": 1},
                "events_present": [{"kind": "key_rejected", "reason": "key_conflict"}]
            }),
        },
        VectorDef {
            id: "K03-wrong-public-key",
            category: "keys",
            title: "A KROOT signed with another key under the trusted key's id is refused; nothing authenticates",
            refs: &["ICD 6.3", "RG 5.2"],
            build: b_wrong_public_key,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "kroot_rejected", "reason": "Signature"}],
                "events_absent": [{"kind": "kroot_verified"}]
            }),
        },
        VectorDef {
            id: "K04-unknown-key-id",
            category: "keys",
            title: "A KROOT naming a public key id the receiver does not hold is refused",
            refs: &["ICD 6.3", "RG 5.2"],
            build: b_unknown_key_id,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "kroot_rejected", "reason": "NoPublicKey"}],
                "events_absent": [{"kind": "kroot_verified"}]
            }),
        },
        VectorDef {
            id: "K05-stale-kroot-replay",
            category: "replay",
            title: "A genuine KROOT of an older chain with the same id is replayed: refused as stale, the chain in force keeps authenticating",
            refs: &["ICD 5.5.1", "ICD 6.3", "RG 5.2"],
            build: b_stale_kroot,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"failed_max": 0},
                "events_present": [{"kind": "kroot_rejected", "reason": "Stale"}]
            }),
        },
        VectorDef {
            id: "T01-flipped-nav-bit",
            category: "mack-tags",
            title: "One flipped bit in satellite 5's ephemeris: the covering tag fails, charged to satellite 5 and to satellite 2 that sent it",
            refs: &["ICD 4.2.2", "ICD 6.7", "RG 5.5.5", "RG 5.5.6"],
            build: b_flipped_nav_bit,
            bars: || json!({
                "overall": "failed",
                "satellites": {"E02": "failed", "E05": "failed"},
                "exit": 3,
                "tags": {"failed_min": 1},
                "fail_reasons": ["tag_mismatch"]
            }),
        },
        VectorDef {
            id: "T02-replayed-tags",
            category: "replay",
            title: "Tags of an earlier sub-frame replayed with the genuine new key do not authenticate the new data",
            refs: &["ICD 6.7", "RG 5.5.5"],
            build: b_replayed_tags,
            bars: || json!({
                "overall": "failed", "exit": 3,
                "tags": {"failed_min": 1},
                "fail_reasons": ["tag_mismatch"]
            }),
        },
        VectorDef {
            id: "T03-macseq-mismatch",
            category: "mack-tags",
            title: "A MACSEQ with one flipped bit fails, charged to the transmitting satellite only",
            refs: &["ICD 4.1.2", "ICD 6.6", "RG 5.5.2", "RG 5.5.3"],
            build: b_macseq,
            bars: || json!({
                "overall": "failed",
                "satellites": {"E02": "failed"},
                "satellites_not": {"E05": "failed"},
                "exit": 3,
                "fail_reasons": ["macseq_mismatch"]
            }),
        },
        VectorDef {
            id: "T04-header-other-chain",
            category: "mack-tags",
            title: "The NMA header names a chain that was never verified: the tags stay unchecked, not failed",
            refs: &["ICD 3.1.2", "RG 4.2.1"],
            build: b_header_other_chain,
            bars: || json!({
                "tags": {"failed_max": 0},
                "pending_reasons": ["chain_mismatch"]
            }),
        },
        VectorDef {
            id: "R01-chain-renewal",
            category: "renewal-revocation",
            title: "Chain renewal at the hour: the new chain's KROOT verifies and its tags authenticate the new data",
            refs: &["ICD 5.5.3", "RG B.4.1"],
            build: b_chain_renewal,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 20, "failed_max": 0},
                "events_present": [{"kind": "kroot_verified", "cid": 3}, {"kind": "kroot_verified", "cid": 1}]
            }),
        },
        VectorDef {
            id: "R02-chain-revocation",
            category: "renewal-revocation",
            title: "Chain revoked with \"don't use\", confirmed by a second satellite: the chain is dropped and its KROOT refused",
            refs: &["ICD 3.1.3", "ICD 5.5.3", "RG 4.2.3", "RG B.4.2"],
            build: b_chain_revocation,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"failed_max": 0},
                "events_present": [{"kind": "chain_revoked", "cid": 3}, {"kind": "kroot_rejected", "reason": "Revoked"}]
            }),
        },
        VectorDef {
            id: "R03-public-key-renewal",
            category: "renewal-revocation",
            title: "Public-key renewal: key id 2 arrives through the Merkle tree and the chain is re-signed with it",
            refs: &["ICD 5.4.1", "ICD 6.2", "RG B.4.3"],
            build: b_pk_renewal,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"failed_max": 0},
                "events_present": [{"kind": "public_key_verified", "pkid": 2}, {"kind": "kroot_verified", "pkid": 1}, {"kind": "kroot_verified", "pkid": 2}]
            }),
        },
        VectorDef {
            id: "R04-public-key-revocation",
            category: "renewal-revocation",
            title: "Public-key revocation confirmed by two satellites: key 1 and the chain it signed are dropped; key 2 and its chain stay",
            refs: &["ICD 3.1.3", "ICD 5.4.1", "RG 4.2.3", "RG B.4.4"],
            build: b_pk_revocation,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"failed_max": 0},
                "events_present": [{"kind": "kroot_verified", "cid": 3, "pkid": 1}, {"kind": "kroot_verified", "cid": 1, "pkid": 2}, {"kind": "public_key_revoked", "pkid": 1}, {"kind": "chain_revoked", "cid": 3}],
                "events_absent": [{"kind": "public_key_revoked", "pkid": 2}, {"kind": "chain_revoked", "cid": 1}]
            }),
        },
        VectorDef {
            id: "A01-alert-message",
            category: "alert",
            title: "The alert message (DSM-PKR, NPKT 4) verifies through the Merkle tree: every satellite becomes unavailable",
            refs: &["ICD 5.7", "RG B.4.6"],
            build: b_alert,
            bars: || json!({
                "overall": "unavailable",
                "satellites": {"E02": "unavailable", "E05": "unavailable"},
                "alert": true, "exit": 0,
                "events_present": [{"kind": "alert_message", "verified": true}]
            }),
        },
        VectorDef {
            id: "S01-dont-use-confirmed",
            category: "alert",
            title: "NMA status \"don't use\" sent by two satellites counts: nothing reads as authenticated",
            refs: &["ICD 3.1.1", "RG 4.2.1", "RG 4.2.3"],
            build: b_dont_use_confirmed,
            bars: || json!({
                "overall": "unavailable", "nma_status": 3, "exit": 0,
                "tags": {"failed_max": 0},
                "pending_reasons": ["service_not_usable"]
            }),
        },
        VectorDef {
            id: "S02-dont-use-single",
            category: "alert",
            title: "NMA status \"don't use\" from one satellite alone is not confirmed and changes no status",
            refs: &["ICD 3.1.1", "RG 4.2.1", "RG 4.2.3"],
            build: b_dont_use_single,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0}
            }),
        },
        VectorDef {
            id: "C01-bad-crc",
            category: "corruption",
            title: "Pages whose CRC does not match are dropped and counted, never checked",
            refs: &["RG 3"],
            build: b_bad_crc,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0},
                "event_counts": [{"match": {"kind": "bad_crc"}, "min": 2, "max": 2}]
            }),
        },
        VectorDef {
            id: "C02-truncated-subframes",
            category: "corruption",
            title: "Sub-frames cut short: what is missing is not decided, nothing fails, later sub-frames authenticate",
            refs: &["RG 3"],
            build: b_truncated,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0}
            }),
        },
        VectorDef {
            id: "C03-corrupt-kroot",
            category: "corruption",
            title: "A DSM-KROOT with a corrupted block is refused every time; nothing authenticates",
            refs: &["ICD 3.2.3", "ICD 6.3", "RG 5.2"],
            build: b_corrupt_kroot,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "kroot_rejected"}],
                "events_absent": [{"kind": "kroot_verified"}]
            }),
        },
        VectorDef {
            id: "C04-corrupt-pkr",
            category: "corruption",
            title: "A DSM-PKR with a flipped key bit does not verify against the Merkle root; no key, nothing authenticates",
            refs: &["ICD 3.2.2", "ICD 6.2", "RG 5.1"],
            build: b_corrupt_pkr,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "public_key_rejected"}],
                "events_absent": [{"kind": "public_key_verified"}, {"kind": "kroot_verified"}]
            }),
        },
        VectorDef {
            id: "X01-reference-time-far",
            category: "time",
            title: "A reference time a day away from the stream: every sub-frame is set aside, nothing authenticates",
            refs: &["RG 2.1", "RG Annex C"],
            build: b_reference_far,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "freshness_enforced": true,
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "time_rejected"}]
            }),
        },
        VectorDef {
            id: "X02-shifted-stamps",
            category: "time",
            title: "Satellite 2's pages stamped 60 s late: the keys no longer fit the chain, nothing authenticates",
            refs: &["ICD 6.4", "RG 5.3"],
            build: b_shifted_stamps,
            bars: || json!({
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "key_rejected", "reason": "key_chain_mismatch"}]
            }),
        },
        VectorDef {
            id: "X03-far-future-spoof",
            category: "time",
            title: "Sub-frames stamped a day ahead after a failure do not move the clock or erase the failure",
            refs: &["RG 2.1", "RG 5.3"],
            build: b_far_future,
            bars: || json!({
                "overall": "failed",
                "satellites": {"E05": "failed"},
                "exit": 3,
                "fail_reasons": ["tag_mismatch"]
            }),
        },
    ]
}
