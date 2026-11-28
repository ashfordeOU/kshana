#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate data/conformance/roughtime/roughtime-vectors.json (format kshana.roughtime-vectors/1).

Independent of the Rust checker it feeds: Python standard library plus the `cryptography`
package for Ed25519. Three groups of vectors:

* "rfc-example": the malfeasance report of RFC 10049 Appendix B as published
  (https://www.rfc-editor.org/rfc/rfc10049.html, fetched 2026-11-28). Its signatures verify only
  with the context strings "RoughTime v1 delegation signature" and "RoughTime v1 response
  signature" (capital T), not with the strings of Sections 5.2.1 and 5.2.6, and its first
  response, not the third, is the inconsistent one: both are reported in erratum 9238 (status
  Reported, https://www.rfc-editor.org/errata/eid9238).
* "errata-reported": the replacement example of erratum 9238, signed with the RFC's context
  strings; the third response is inconsistent with the first two.
* "synthetic": packets built here with fixed keys (seeds are SHA-256 of fixed labels), one valid
  exchange with a four-leaf Merkle tree and one defect per negative vector.

The two RFC-derived examples are reproduced from RFC 10049 and its erratum; the RFC's code
components are under the Revised BSD License (IETF Trust Legal Provisions, Section 4.e).

Usage: gen_roughtime_vectors.py RFC_APPENDIX_B.json ERRATUM_9238.json
(the two JSON reports, as extracted from the RFC HTML and the erratum page).
"""
import base64
import hashlib
import json
import os
import struct
import sys

from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives import serialization

HERE = os.path.dirname(os.path.abspath(__file__))
FETCHED = "2026-11-28"
RFC = {"title": "RFC 10049, Roughtime: A Protocol for Rough Time Synchronization (Experimental, October 2026)",
       "url": "https://www.rfc-editor.org/rfc/rfc10049.html", "fetched": FETCHED}
ERRATUM = {"title": "RFC 10049 erratum 9238 (Technical, status Reported, 2026-10-25): replacement Appendix B example",
           "url": "https://www.rfc-editor.org/errata/eid9238", "fetched": FETCHED}

CTX_DELE = b"Roughtime v1 delegation signature\x00"
CTX_SREP = b"Roughtime v1 response signature\x00"


def H(x):
    return hashlib.sha512(x).digest()[:32]


def b64(x):
    return base64.b64encode(x).decode()


def tag_u32(t):
    b = t.encode().ljust(4, b"\x00")
    return struct.unpack("<I", b)[0], b


def encode(pairs, sort=True):
    """pairs: list of (tag, bytes). Values padded? No: Roughtime values are given as is."""
    items = [(tag_u32(t)[0], tag_u32(t)[1], v) for t, v in pairs]
    if sort:
        items.sort(key=lambda x: x[0])
    n = len(items)
    offs, pos = [], 0
    for i, (_, _, v) in enumerate(items):
        if i > 0:
            offs.append(pos)
        pos += len(v)
    out = struct.pack("<I", n) + b"".join(struct.pack("<I", o) for o in offs)
    out += b"".join(t for _, t, _ in items) + b"".join(v for _, _, v in items)
    return out


def packet(msg):
    return b"ROUGHTIM" + struct.pack("<I", len(msg)) + msg


def key(label):
    seed = hashlib.sha256(("kshana roughtime vector " + label).encode()).digest()
    sk = Ed25519PrivateKey.from_private_bytes(seed)
    pk = sk.public_key().public_bytes(serialization.Encoding.Raw, serialization.PublicFormat.Raw)
    return sk, pk


u32 = lambda x: struct.pack("<I", x)
u64 = lambda x: struct.pack("<Q", x)

LT_SK, LT_PK = key("long-term")
DL_SK, DL_PK = key("delegated")
MIDP = 1796083200  # 2026-12-01T12:00:00Z
MINT, MAXT = MIDP - 86400, MIDP + 86400


def request(nonce, pad_to=1024, ver=(1,), srv=True, typ=0, extra=None, drop=None, zz=0):
    pairs = [("VER", b"".join(u32(v) for v in ver)), ("NONC", nonce), ("TYPE", u32(typ))]
    if srv:
        pairs.append(("SRV", H(b"\xff" + LT_PK)))
    if extra:
        pairs += extra
    if drop:
        pairs = [p for p in pairs if p[0] != drop]
    base = len(encode(pairs + [("ZZZZ", b"")]))
    pairs.append(("ZZZZ", bytes([zz]) * max(0, pad_to - base)))
    return packet(encode(pairs))


def merkle(leaves):
    level = [H(b"\x00" + x) for x in leaves]
    tree = [level]
    while len(level) > 1:
        level = [H(b"\x01" + level[i] + level[i + 1]) for i in range(0, len(level), 2)]
        tree.append(level)
    return tree


def response(req, idx=0, others=(), midp=MIDP, radi=3, ver=1, vers=(1,), mint=MINT, maxt=MAXT,
             typ=1, nonce=None, break_cert=False, break_srep=False, path_override=None,
             indx_override=None, root_override=None, drop=None, extra=None):
    leaves = list(others)
    leaves.insert(idx, req)
    tree = merkle(leaves)
    path = b""
    i = idx
    for level in tree[:-1]:
        path += level[i ^ 1]
        i >>= 1
    root = tree[-1][0]
    srep = encode([("VER", u32(ver)), ("RADI", u32(radi)), ("MIDP", u64(midp)),
                   ("VERS", b"".join(u32(v) for v in vers)), ("ROOT", root_override or root)])
    dele = encode([("PUBK", DL_PK), ("MINT", u64(mint)), ("MAXT", u64(maxt))])
    csig = LT_SK.sign(CTX_DELE + dele)
    if break_cert:
        csig = bytes([csig[0] ^ 1]) + csig[1:]
    cert = encode([("SIG", csig), ("DELE", dele)])
    ssig = DL_SK.sign(CTX_SREP + srep)
    if break_srep:
        ssig = bytes([ssig[0] ^ 1]) + ssig[1:]
    req_msg = req[12:]
    # The request's nonce, read back from its message.
    n = struct.unpack("<I", req_msg[:4])[0]
    tags = [req_msg[4 * n + 4 * k:4 * n + 4 * k + 4] for k in range(n)]
    offs = [0] + [struct.unpack("<I", req_msg[4 + 4 * k:8 + 4 * k])[0] for k in range(n - 1)]
    ni = tags.index(b"NONC")
    start = 8 * n + offs[ni]
    req_nonce = req_msg[start:start + 32]
    pairs = [("SIG", ssig), ("NONC", nonce or req_nonce), ("TYPE", u32(typ)),
             ("PATH", path if path_override is None else path_override), ("SREP", srep),
             ("CERT", cert), ("INDX", u32(idx if indx_override is None else indx_override))]
    if extra:
        pairs += extra
    if drop:
        pairs = [p for p in pairs if p[0] != drop]
    return packet(encode(pairs))


vectors = []


def add(vid, kind, status, source, clause, expect, req=None, resp=None, pk=None, report=None,
        note=None, transport="udp"):
    v = {"id": vid, "kind": kind, "status": status,
         "source": dict(source, clause=clause), "transport": transport, "expect": expect}
    if req is not None:
        v["request"] = b64(req)
    if resp is not None:
        v["response"] = b64(resp)
    if pk is not None:
        v["public_key"] = b64(pk)
    if report is not None:
        v["report"] = report
    if note:
        v["note"] = note
    vectors.append(v)


def ok(**extra):
    return dict({"valid": True, "errors": []}, **extra)


def bad(*codes, **extra):
    return dict({"valid": False, "errors": sorted(codes)}, **extra)


NONCE = H(b"kshana roughtime vector nonce")
OTHERS = [request(H(b"other %d" % k)) for k in range(3)]
REQ = request(NONCE)
RESP = response(REQ, idx=2, others=OTHERS)
S = RFC

# Requests.
add("req-valid", "request", "synthetic", S, "5.1", ok(), req=REQ, pk=LT_PK)
add("req-short-udp", "request", "synthetic", S, "5.1 (SHOULD be at least 1024 bytes over UDP)",
    ok(warnings=["request.shorter-than-1024"]), req=request(NONCE, pad_to=200), pk=LT_PK)
add("req-short-tcp", "request", "synthetic", S, "5.1 (the 1024-byte size applies to UDP)", ok(),
    req=request(NONCE, pad_to=200), pk=LT_PK, transport="tcp")
add("req-no-srv", "request", "synthetic", S, "5.1 (SHOULD include SRV)",
    ok(warnings=["request.no-srv"]), req=request(NONCE, srv=False), pk=LT_PK)
add("req-type-1", "request", "synthetic", S, "5.1.3 (TYPE MUST be 0 in a request)",
    bad("request.type-not-zero"), req=request(NONCE, typ=1), pk=LT_PK)
add("req-no-nonc", "request", "synthetic", S, "5.1 (VER, NONC and TYPE are mandatory)",
    bad("request.missing-NONC"), req=request(NONCE, drop="NONC"), pk=LT_PK)
add("req-short-nonce", "request", "synthetic", S, "5.1.2 (a 32-byte nonce)",
    bad("request.nonce-length"), req=request(NONCE[:16]), pk=LT_PK)
add("req-ver-unsorted", "request", "synthetic", S, "5.1.1 (versions sorted ascending, no repeats)",
    bad("request.ver-not-sorted"), req=request(NONCE, ver=(2, 1)), pk=LT_PK)
add("req-ver-repeat", "request", "synthetic", S, "5.1.1 (versions MUST NOT repeat)",
    bad("request.ver-not-sorted"), req=request(NONCE, ver=(1, 1)), pk=LT_PK)
add("req-ver-33", "request", "synthetic", S, "5.1.1 (at most 32 versions)",
    bad("request.ver-count"), req=request(NONCE, ver=tuple(range(1, 34))), pk=LT_PK)
add("req-zzzz-nonzero", "request", "synthetic", S, "5.1.5 (ZZZZ is all zero bytes)",
    bad("request.zzzz-not-zero"), req=request(NONCE, zz=7), pk=LT_PK)
add("req-srv-other-key", "request", "synthetic", S, "5.1.4 (SRV = H(0xff || public_key))",
    bad("request.srv-not-key"), req=request(NONCE), pk=DL_PK)
# Message-level defects, built by hand.
m = encode([("NONC", NONCE), ("VER", u32(1)), ("TYPE", u32(0)), ("ZZZZ", bytes(980))], sort=False)
add("msg-tags-unsorted", "request", "synthetic", S, "4.2 (tags sorted ascending by uint32 value)",
    bad("message.tags-not-ascending"), req=packet(m), pk=LT_PK)
m = encode([("VER", u32(1)), ("NONC", NONCE), ("TYPE", u32(0)), ("ZZZZ", bytes(980))])
mm = bytearray(m)
mm[4:8] = struct.pack("<I", 2)  # first offset not a multiple of four
add("msg-offset-misaligned", "request", "synthetic", S, "4.2 (all offsets are multiples of four)",
    bad("message.offset-alignment"), req=packet(bytes(mm)), pk=LT_PK)
dup = struct.pack("<I", 2) + struct.pack("<I", 4) + b"VER\x00VER\x00" + u32(1) + u32(1)
add("msg-duplicate-tag", "request", "synthetic", S, "4.2 (a tag MUST NOT appear more than once)",
    bad("message.tags-not-ascending"), req=packet(dup), pk=LT_PK)
add("pkt-bad-magic", "request", "synthetic", S, "5 (the packet starts with ROUGHTIM)",
    bad("packet.magic"), req=b"ROUGHTIN" + REQ[8:], pk=LT_PK)
add("pkt-length", "request", "synthetic", S, "5 (the length field gives the message length)",
    bad("packet.length"), req=REQ[:8] + struct.pack("<I", len(REQ) - 8) + REQ[12:], pk=LT_PK)

# Responses.
add("resp-valid-path2", "response", "synthetic", S, "5.2-5.4 (a four-leaf Merkle tree, index 2)",
    ok(midp=MIDP, radi=3), req=REQ, resp=RESP, pk=LT_PK)
add("resp-cert-sig", "response", "synthetic", S, "5.4 (CERT signed with the long-term key)",
    bad("response.cert-signature"), req=REQ, resp=response(REQ, 2, OTHERS, break_cert=True), pk=LT_PK)
add("resp-srep-sig", "response", "synthetic", S, "5.4 (SREP signed with the key in DELE)",
    bad("response.srep-signature"), req=REQ, resp=response(REQ, 2, OTHERS, break_srep=True), pk=LT_PK)
add("resp-wrong-key", "response", "synthetic", S, "5.4 (the long-term key known to the client)",
    bad("response.cert-signature"), req=request(NONCE, srv=False), resp=response(request(NONCE, srv=False), 2, OTHERS), pk=DL_PK)
add("resp-midp-after-maxt", "response", "synthetic", S, "5.2.6 (MIDP <= MAXT)",
    bad("response.midp-outside-delegation"), req=REQ, resp=response(REQ, 2, OTHERS, maxt=MIDP - 1), pk=LT_PK)
add("resp-midp-before-mint", "response", "synthetic", S, "5.2.6 (MIDP >= MINT)",
    bad("response.midp-outside-delegation"), req=REQ, resp=response(REQ, 2, OTHERS, mint=MIDP + 1), pk=LT_PK)
add("resp-wrong-index", "response", "synthetic", S, "5.3.1 (the root from PATH, INDX and the request)",
    bad("response.merkle-root"), req=REQ, resp=response(REQ, 2, OTHERS, indx_override=1), pk=LT_PK)
add("resp-index-extra-bits", "response", "synthetic", S, "5.3.1 (remaining bits of INDX must be zero)",
    bad("response.merkle-root"), req=REQ, resp=response(REQ, 2, OTHERS, indx_override=2 | 8), pk=LT_PK)
add("resp-path-misaligned", "response", "synthetic", S, "5.2.4 (PATH is a multiple of 32 bytes)",
    bad("response.path-length"), req=REQ, resp=response(REQ, 2, OTHERS, path_override=bytes(36)), pk=LT_PK)
add("resp-nonce", "response", "synthetic", S, "5.2.2 (NONC of the request responded to)",
    bad("response.nonce-mismatch"), req=REQ, resp=response(REQ, 2, OTHERS, nonce=bytes(32)), pk=LT_PK)
add("resp-type-0", "response", "synthetic", S, "5.2.3 (TYPE MUST be 1 in a response)",
    bad("response.type-not-one"), req=REQ, resp=response(REQ, 2, OTHERS, typ=0), pk=LT_PK)
add("resp-radi-zero", "response", "synthetic", S, "5.2.5 (RADI MUST NOT be zero)",
    bad("response.radi-zero"), req=REQ, resp=response(REQ, 2, OTHERS, radi=0), pk=LT_PK)
add("resp-ver-not-in-vers", "response", "synthetic", S, "5.2.5 (VERS MUST contain VER)",
    bad("response.ver-not-in-vers"), req=REQ, resp=response(REQ, 2, OTHERS, ver=1, vers=(2,)), pk=LT_PK)
add("resp-ver-not-offered", "response", "synthetic", S, "5.2.5 (VER SHOULD be one the client offered)",
    ok(midp=MIDP, radi=3, warnings=["response.ver-not-offered"]), req=REQ,
    resp=response(REQ, 2, OTHERS, ver=2, vers=(1, 2)), pk=LT_PK)
add("resp-no-cert", "response", "synthetic", S, "5.2 (SIG, NONC, TYPE, PATH, SREP, CERT, INDX)",
    bad("response.missing-CERT"), req=REQ, resp=response(REQ, 2, OTHERS, drop="CERT"), pk=LT_PK)
add("resp-unknown-tag", "response", "synthetic", S, "7 (clients MUST ignore undefined tags)",
    ok(midp=MIDP, radi=3), req=request(NONCE, pad_to=1200), resp=response(request(NONCE, pad_to=1200), 2, OTHERS, extra=[("ZZZY", bytes(4))]), pk=LT_PK)
small = request(NONCE, pad_to=300)
add("resp-larger-than-request", "response", "synthetic", S, "9.7 (no response larger than the request)",
    bad("response.larger-than-request"), req=small, resp=response(small, 2, OTHERS), pk=LT_PK,
    note="a short request answered with a response longer than it")

# The RFC example and the erratum replacement as reports and as single responses.
for path, status, src, label in [(sys.argv[1], "rfc-example", RFC, "rfc10049-appb"),
                                 (sys.argv[2], "errata-reported", ERRATUM, "erratum-9238")]:
    rep = json.load(open(path))
    ex = {"rfc-example": dict(valid=False, errors=["report.response-invalid"],
                              legacy_context_signatures=[True, True, True],
                              inconsistent_pairs=[[0, 1], [0, 2]], nonce_chain=True,
                              proves_inconsistency=False),
          "errata-reported": dict(valid=True, errors=[], legacy_context_signatures=[False, False, False],
                                  inconsistent_pairs=[[0, 2], [1, 2]], nonce_chain=True,
                                  proves_inconsistency=True)}[status]
    clause = "8.4.1 and Appendix B" if status == "rfc-example" else "replacement for Appendix B"
    note = ("published example: signed with the pre-RFC context strings \"RoughTime v1 ...\", so "
            "Section 5.4 validation fails; its first response, not the third named in the text, is "
            "the inconsistent one (both reported in erratum 9238)") if status == "rfc-example" else \
        "erratum 9238 (Reported, not verified by the stream): third response inconsistent with the first two"
    add(f"{label}-report", "report", status, src, clause, ex, report=rep, note=note)
    for k, r in enumerate(rep["responses"]):
        e = ok(midp=None, radi=3) if status == "errata-reported" else bad("response.cert-signature", "response.srep-signature")
        e.pop("midp", None)
        add(f"{label}-response-{k + 1}", "response", status, src, clause, e,
            req=base64.b64decode(r["request"]), resp=base64.b64decode(r["response"]),
            pk=base64.b64decode(r["publicKey"]))

doc = {"format": "kshana.roughtime-vectors/1", "set": "rfc10049", "version": "1.0.0",
       "description": "Roughtime (RFC 10049) request, response and malfeasance-report vectors: the RFC's Appendix B example as published, the replacement of erratum 9238, and synthetic packets with one defect each.",
       "generator": "data/conformance/roughtime/gen_roughtime_vectors.py", "vectors": vectors}
with open(os.path.join(HERE, "roughtime-vectors.json"), "w") as f:
    json.dump(doc, f, indent=1)
    f.write("\n")
print(len(vectors), "vectors")
