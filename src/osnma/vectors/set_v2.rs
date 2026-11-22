// SPDX-License-Identifier: AGPL-3.0-only
//! Version 2 of the open synthetic OSNMA vector set: every vector of version 1, unchanged,
//! plus the cases of the SIS ICD Issue 1.1 and the Receiver Guidelines Issue 1.3 that can be
//! made without the Galileo private keys and that version 1 did not cover: other key and look-up
//! table layouts, a P-521 public key through the Merkle tree, look-up table rules (ADKD not in
//! the table, reserved ADKD, unknown entry), the KROOT padding, Tag0 and slow-MAC tags, missing
//! data, a reception gap in the key chain, the test status and a forged status, and the
//! end-of-chain, new-public-key and new-Merkle-tree announcements.
//!
//! As in version 1 the bars are written here by hand from the documented behaviour and never
//! derived from a run of the verifier; their SHA-256 is pinned in [`super::BARS_SHA256_V2`].
//! All keys are throwaway synthetic keys ([`super::gen::Signer`]); they authenticate nothing
//! real. Section numbers refer to the ICD and the Receiver Guidelines ("RG"), © European Union;
//! they are citations, not copies.

use super::gen::{
    dsm_hk, dsm_kroot, plain_hkroot, stream, subframe_pages, tree_for, words, Ctx, Frame, Signer,
    PRNA, PRN_X,
};
use super::set_v1::{
    ctx_stream, kroot_frames, none, sk1, sk2, std_hk, std_stream, Built, VectorDef, PK1, PK2,
};
use serde_json::json;

/// The categories version 2 adds to those of version 1.
pub const NEW_CATEGORIES: &[&str] = &["maclt"];

// ------------------------------------------------------------------------- builders ---

fn b_key_256_maclt_40() -> Built {
    let mut c = Ctx::std();
    c.key_bits = 256;
    c.maclt = 40;
    ctx_stream(c, sk1(), 26)
}

fn b_maclt_33() -> Built {
    let mut c = Ctx::std();
    c.maclt = 33;
    ctx_stream(c, sk1(), 24)
}

fn b_pkr_p521() -> Built {
    // A P-521 public key reaches the receiver only through the Merkle tree (a 16-block
    // DSM-PKR), then the chain's KROOT signed with it (13 blocks).
    let ctx = Ctx::std();
    let chain = ctx.chain(60);
    let signer = Signer::p521(0x44);
    let pk = signer.public(PK1);
    let tree = tree_for(std::slice::from_ref(&pk));
    let pkr = tree.dsm_pkr(0, &super::gen::key_leaf(&pk));
    let kroot = dsm_kroot(&ctx, &chain[0], &signer, ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| Frame {
        hk: if n < 16 {
            dsm_hk(ctx.header(1), 12, &pkr, n as usize)
        } else {
            dsm_hk(ctx.header(1), 0, &kroot, (n - 16) as usize % 13)
        },
        mack: ctx.mack(&chain, gst),
    };
    let pages = stream(super::gen::GST0, 40, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree.root()),
        ..Built::keys(pages, Vec::new())
    }
}

fn swapped(i: usize, prnd: u8, adkd: u8) -> Built {
    let mut c = Ctx::std();
    c.swap_even = Some((i, prnd, adkd));
    // Twenty sub-frames: the stream ends before the IODnav changes at the tenth minute.
    ctx_stream(c, sk1(), 20)
}

fn b_adkd_not_in_table() -> Built {
    // The fixed slot for satellite 2's ADKD 4 carries ADKD 0 instead.
    swapped(1, PRNA, 0)
}

fn b_reserved_adkd() -> Built {
    // A flexible slot carries ADKD 7 (reserved), covered by a correct MACSEQ.
    swapped(0, PRN_X, 7)
}

fn b_unknown_maclt() -> Built {
    let mut c = Ctx::std();
    c.maclt = 50;
    ctx_stream(c, sk1(), 20)
}

fn b_kroot_padding() -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let mut dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let last = dsm.len() - 1;
    dsm[last] ^= 0x01; // a padding bit; the signature itself is intact
    let pages = stream(
        super::gen::GST0,
        18,
        None,
        &mut kroot_frames(ctx, chain, dsm),
        &mut none(),
    );
    Built::keys(pages, vec![sk1().public(PK1)])
}

/// The standard stream with one bit of satellite 2's MACK in sub-frame 12 flipped.
fn flip_mack(nsf: u32, byte: usize, mask: u8) -> Built {
    let ctx = Ctx::std();
    let chain = ctx.chain(nsf + 20);
    std_stream(nsf, &mut |n, gst, svid, pgs| {
        if n == 12 && svid == PRNA {
            let mut m = ctx.mack(&chain, gst);
            m[byte] ^= mask;
            let hk = std_hk(n);
            *pgs = subframe_pages(PRNA, gst, &words(PRNA, gst), Some((&hk, &m)));
        }
    })
}

fn b_tag0_flipped() -> Built {
    flip_mack(20, 2, 0x01) // inside Tag0 (bits 0 to 39)
}

fn b_slow_mac_flipped() -> Built {
    // Sub-frame 12 starts a GST minute: its tag 4 (bits 224 to 263) is satellite 2's ADKD 12.
    flip_mack(30, 29, 0x01)
}

fn b_no_nav_data() -> Built {
    std_stream(20, &mut |n, _, svid, pgs| {
        if n == 11 && svid == PRN_X {
            pgs.clear();
        }
    })
}

fn b_key_gap() -> Built {
    std_stream(26, &mut |n, _, _, pgs| {
        if (10..16).contains(&n) {
            pgs.clear(); // six sub-frames of nothing from any satellite
        }
    })
}

fn b_test_status() -> Built {
    let mut c = Ctx::std();
    c.nmas = 1;
    ctx_stream(c, sk1(), 20)
}

fn b_forged_status() -> Built {
    // From sub-frame 12 the header says "test" while the tags were made under "operational".
    let ctx = Ctx::std();
    let chain = ctx.chain(40);
    let dsm = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| {
        let mut c = ctx.clone();
        if n >= 12 {
            c.nmas = 1;
        }
        Frame {
            hk: dsm_hk(c.header(1), 0, &dsm, n as usize % 8),
            mack: ctx.mack(&chain, gst),
        }
    };
    let pages = stream(super::gen::GST0, 20, None, &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_renewal_eoc() -> Built {
    // As R01, but the hour before the switch is announced with CPKS "end of chain".
    let a = Ctx::std();
    let mut b = Ctx::std();
    b.cid = 1;
    b.alpha = [9, 8, 7, 6, 5, 4];
    b.gst0 = super::gen::GST0 + 3600;
    b.seed = 77;
    let chain_a = a.chain(140);
    let chain_b = b.chain(40);
    let dsm_a = dsm_kroot(&a, &chain_a[0], &sk1(), a.header(2), PK1);
    let dsm_b = dsm_kroot(&b, &chain_b[0], &sk1(), b.header(1), PK1);
    let start = b.gst0 - 30 * 14;
    let mut frames = |n: u32, gst: u32| {
        let (c, chain, cpks) = if gst < b.gst0 {
            (&a, &chain_a, 2)
        } else {
            (&b, &chain_b, 1)
        };
        Frame {
            hk: if n % 16 < 8 {
                dsm_hk(c.header(cpks), 0, &dsm_a, n as usize % 8)
            } else {
                dsm_hk(c.header(cpks), 1, &dsm_b, n as usize % 8)
            },
            mack: c.mack(chain, gst),
        }
    };
    let pages = stream(start, 28, None, &mut frames, &mut none());
    Built::keys(pages, vec![sk1().public(PK1)])
}

fn b_pk_renewal_npk() -> Built {
    // As R03, with CPKS "new public key" while the new key's DSM-PKR is broadcast.
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
            dsm_hk(ctx.header(4), 12, &pkr2, (n - 8) as usize)
        } else {
            dsm_hk(ctx.header(1), 1, &k2, (n - 21) as usize % 8)
        },
        mack: ctx.mack(&chain, gst),
    };
    let pages = stream(super::gen::GST0, 32, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree.root()),
        ..Built::keys(pages, vec![p1])
    }
}

fn b_new_merkle_tree() -> Built {
    // Key 1 arrives through the trusted tree and signs the chain. Then, under CPKS "new
    // Merkle tree", a DSM-PKR of another tree is broadcast: the receiver holds no root for
    // it, so the key it carries is refused and the chain in force goes on.
    let ctx = Ctx::std();
    let chain = ctx.chain(60);
    let p1 = sk1().public(PK1);
    let tree_a = tree_for(std::slice::from_ref(&p1));
    let pkr_a = tree_a.dsm_pkr(0, &super::gen::key_leaf(&p1));
    let p2 = sk2().public(PK2);
    let tree_b = tree_for(&[p2.clone()]);
    let pkr_b = tree_b.dsm_pkr(0, &super::gen::key_leaf(&p2));
    let kroot = dsm_kroot(&ctx, &chain[0], &sk1(), ctx.header(1), PK1);
    let mut frames = |n: u32, gst: u32| Frame {
        hk: if n < 13 {
            dsm_hk(ctx.header(1), 12, &pkr_a, n as usize)
        } else if n < 21 {
            dsm_hk(ctx.header(1), 0, &kroot, (n - 13) as usize)
        } else if n < 34 {
            dsm_hk(ctx.header(6), 12, &pkr_b, (n - 21) as usize)
        } else {
            plain_hkroot(ctx.header(6))
        },
        mack: ctx.mack(&chain, gst),
    };
    let pages = stream(super::gen::GST0, 36, None, &mut frames, &mut none());
    Built {
        merkle_root: Some(tree_a.root()),
        ..Built::keys(pages, Vec::new())
    }
}

// --------------------------------------------------------------------------- the set ---

/// The vectors version 2 adds, in order.
pub fn added() -> Vec<VectorDef> {
    vec![
        VectorDef {
            id: "V05-key-256-maclt-40",
            category: "valid",
            title: "256-bit TESLA keys with look-up entry 40 (four tags per MACK, fixed slots)",
            refs: &["ICD 3.2.3", "ICD 3.2.3.8", "ICD 6.4", "ICD 6.7"],
            build: b_key_256_maclt_40,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 10, "failed_max": 0},
                "adkd_authenticated": [0, 4, 12],
                "events_present": [{"kind": "kroot_verified", "key_bits": 256, "tag_bits": 40, "maclt": 40}],
                "events_absent": [{"kind": "key_rejected"}]
            }),
        },
        VectorDef {
            id: "V06-maclt-33-fixed",
            category: "valid",
            title: "Look-up entry 33: every slot fixed, no flexible Tag-Info",
            refs: &["ICD 3.2.3.8", "ICD 4.1.2", "RG 5.5.3"],
            build: b_maclt_33,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 10, "failed_max": 0},
                "adkd_authenticated": [0, 4, 12],
                "events_present": [{"kind": "kroot_verified", "maclt": 33}]
            }),
        },
        VectorDef {
            id: "V07-pkr-p521",
            category: "valid",
            title: "A P-521 public key delivered by a 16-block DSM-PKR and checked against the Merkle root, then the P-521 KROOT it signed",
            refs: &["ICD 3.2.2", "ICD 5.4", "ICD 6.2", "ICD 6.3", "RG 5.1"],
            build: b_pkr_p521,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 5, "failed_max": 0},
                "events_present": [{"kind": "public_key_verified", "pkid": 1}, {"kind": "kroot_verified", "pkid": 1}],
                "events_absent": [{"kind": "public_key_rejected"}, {"kind": "kroot_rejected"}]
            }),
        },
        VectorDef {
            id: "M01-adkd-not-in-table",
            category: "maclt",
            title: "A fixed look-up slot carries an ADKD other than the table's: the tag is discarded unchecked, nothing fails",
            refs: &["ICD 3.2.3.8", "ICD 4.1.2", "RG 5.5.3"],
            build: b_adkd_not_in_table,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0},
                "discard_reasons": ["adkd_not_in_table"]
            }),
        },
        VectorDef {
            id: "M02-reserved-adkd",
            category: "maclt",
            title: "A flexible slot names a reserved ADKD under a correct MACSEQ: the tag is discarded unchecked, nothing fails",
            refs: &["ICD 4.1.2", "ICD 4.2.1", "RG 5.5.3"],
            build: b_reserved_adkd,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0},
                "discard_reasons": ["reserved_field"],
                "fail_reasons_absent": ["macseq_mismatch"]
            }),
        },
        VectorDef {
            id: "M03-unknown-maclt",
            category: "maclt",
            title: "The KROOT announces a look-up entry the receiver has no table for: keys verify, no tag is decided",
            refs: &["ICD 3.2.3.8", "RG 5.5.3"],
            build: b_unknown_maclt,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"authenticated_max": 0, "failed_max": 0},
                "pending_reasons": ["unknown_maclt"],
                "events_present": [{"kind": "kroot_verified", "maclt": 50}, {"kind": "key_verified"}]
            }),
        },
        VectorDef {
            id: "C05-kroot-padding",
            category: "corruption",
            title: "A DSM-KROOT whose padding does not match its message is refused before the signature check",
            refs: &["ICD 3.2.3", "ICD 6.3", "RG 5.2"],
            build: b_kroot_padding,
            bars: || json!({
                "overall": "unavailable", "exit": 0,
                "tags": {"authenticated_max": 0},
                "events_present": [{"kind": "kroot_rejected", "reason": "Malformed"}],
                "events_absent": [{"kind": "kroot_verified"}]
            }),
        },
        VectorDef {
            id: "T05-tag0-flipped",
            category: "mack-tags",
            title: "Tag0 with one flipped bit fails, charged to the transmitting satellite only",
            refs: &["ICD 4.1.1", "ICD 6.7", "RG 5.5.5"],
            build: b_tag0_flipped,
            bars: || json!({
                "overall": "failed",
                "satellites": {"E02": "failed"},
                "satellites_not": {"E05": "failed"},
                "exit": 3,
                "fail_reasons": ["tag_mismatch"],
                "fail_reasons_absent": ["macseq_mismatch"]
            }),
        },
        VectorDef {
            id: "T06-slow-mac-flipped",
            category: "mack-tags",
            title: "An ADKD 12 (slow MAC) tag with one flipped bit fails when its delayed key arrives; the other slow tags authenticate",
            refs: &["ICD 4.2.1", "ICD 6.7", "RG 5.5.5"],
            build: b_slow_mac_flipped,
            bars: || json!({
                "overall": "failed",
                "satellites": {"E02": "failed"},
                "exit": 3,
                "adkd_authenticated": [0, 4, 12],
                "fail_reasons": ["tag_mismatch"]
            }),
        },
        VectorDef {
            id: "T07-no-nav-data",
            category: "mack-tags",
            title: "Satellite 5's sub-frame is not received: the tags covering it stay undecided, never failed",
            refs: &["ICD 6.7", "RG 5.5.5"],
            build: b_no_nav_data,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0},
                "pending_reasons": ["no_nav_data"]
            }),
        },
        VectorDef {
            id: "K06-key-gap",
            category: "key-chain",
            title: "Six sub-frames lost: the next key is verified back to the last verified one over the gap",
            refs: &["ICD 6.4", "RG 5.4.3"],
            build: b_key_gap,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 10, "failed_max": 0},
                "events_absent": [{"kind": "key_rejected"}]
            }),
        },
        VectorDef {
            id: "S03-test-status",
            category: "alert",
            title: "NMA status \"test\": the status is reported and the tags, which bind it, authenticate",
            refs: &["ICD 3.1.1", "ICD 6.7", "RG 4.2.1"],
            build: b_test_status,
            bars: || json!({
                "nma_status": 1, "exit": 0,
                "tags": {"authenticated_min": 10, "failed_max": 0}
            }),
        },
        VectorDef {
            id: "S04-forged-status",
            category: "mack-tags",
            title: "The header's NMA status is changed from operational to test after the tags were made: the tags, which bind it, fail",
            refs: &["ICD 3.1.1", "ICD 6.7", "RG 5.5.5"],
            build: b_forged_status,
            bars: || json!({
                "overall": "failed", "exit": 3,
                "satellites": {"E02": "failed"},
                "tags": {"failed_min": 1},
                "fail_reasons": ["tag_mismatch"]
            }),
        },
        VectorDef {
            id: "R05-renewal-end-of-chain",
            category: "renewal-revocation",
            title: "Chain renewal announced with CPKS \"end of chain\": nothing is revoked and the new chain takes over at the hour",
            refs: &["ICD 3.1.3", "ICD 5.5.3", "RG B.4.1"],
            build: b_renewal_eoc,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"authenticated_min": 20, "failed_max": 0},
                "events_present": [{"kind": "kroot_verified", "cid": 3}, {"kind": "kroot_verified", "cid": 1}],
                "events_absent": [{"kind": "chain_revoked"}]
            }),
        },
        VectorDef {
            id: "R06-public-key-renewal-npk",
            category: "renewal-revocation",
            title: "Public-key renewal announced with CPKS \"new public key\": key id 2 arrives through the Merkle tree and re-signs the chain",
            refs: &["ICD 3.1.3", "ICD 5.4.1", "ICD 6.2", "RG B.4.3"],
            build: b_pk_renewal_npk,
            bars: || json!({
                "overall": "authenticated",
                "satellites": {"E02": "authenticated", "E05": "authenticated"},
                "exit": 0,
                "tags": {"failed_max": 0},
                "events_present": [{"kind": "public_key_verified", "pkid": 2}, {"kind": "kroot_verified", "pkid": 2}],
                "events_absent": [{"kind": "public_key_revoked"}]
            }),
        },
        VectorDef {
            id: "R07-new-merkle-tree",
            category: "renewal-revocation",
            title: "CPKS \"new Merkle tree\": a key from a tree the receiver holds no root for is refused; the chain in force goes on",
            refs: &["ICD 3.1.3", "ICD 6.2", "RG B.4.5"],
            build: b_new_merkle_tree,
            bars: || json!({
                "overall": "authenticated", "exit": 0,
                "tags": {"failed_max": 0},
                "events_present": [{"kind": "public_key_verified", "pkid": 1}, {"kind": "public_key_rejected", "reason": "RootMismatch"}],
                "events_absent": [{"kind": "public_key_verified", "pkid": 2}]
            }),
        },
    ]
}

/// The vectors of set version 2, in order: version 1's, then [`added`].
pub fn vectors() -> Vec<VectorDef> {
    let mut v = super::set_v1::vectors();
    v.extend(added());
    v
}
