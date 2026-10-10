#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Published-vector oracle for the evidence-pack cryptography.

Writes ``tests/fixtures/ed25519_rfc8032/vectors.json`` for ``tests/evidence_crypto_reference.rs``.

WHAT THE FIXTURE HOLDS
----------------------
* The four Ed25519 test vectors of RFC 8032 section 7.1 (TEST 1, TEST 2, TEST 3, TEST 1024),
  parsed from the RFC text itself, not retyped.
* The SHA-256 examples of FIPS 180-4 appendix B (``abc``; the 448-bit message; one million
  ``a``) and the empty message.
* A ladder of SHA-256 digests for the messages ``bytes(i % 251 for i in range(n))``,
  n = 0..=130, computed with ``hashlib`` (this crosses the 55/56/63/64/65-byte padding
  boundaries).

CROSS-CHECKS (the script stops if any fails, so a mis-parse cannot reach the fixture)
-----------------------------------------------------------------------------------
* every Ed25519 vector is reproduced by ``cryptography`` (OpenSSL) and by PyNaCl
  (libsodium): same public key, same signature, and both verify it;
* the SHA-256 digests written in this file for the published examples equal ``hashlib``.

LICENCE OF THE VECTORS
----------------------
RFC 8032 is Copyright (c) 2017 IETF Trust and the persons identified as the document
authors. Its code components, which include these test vectors, are licensed under the
Simplified BSD licence (IETF Trust Legal Provisions, section 4). The notice is copied into
the fixture. No other key material is in the repository's evidence tests: every pack key is
a throw-away test seed.

PINNED ORACLES
--------------
Python 3.13, cryptography==50.0.2, PyNaCl==1.6.2, hashlib (CPython's OpenSSL/HACL SHA-256).
RFC text: https://www.rfc-editor.org/rfc/rfc8032.txt (its SHA-256 is recorded in the fixture).

Usage::

    python3 scripts/gen_ed25519_rfc8032_ref.py [--rfc-text path/to/rfc8032.txt]
"""
import argparse
import hashlib
import json
import os
import re
import sys
import urllib.request

import nacl.signing
from cryptography.hazmat.primitives.asymmetric.ed25519 import (
    Ed25519PrivateKey,
    Ed25519PublicKey,
)
from cryptography.hazmat.primitives import serialization

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "..", "tests", "fixtures", "ed25519_rfc8032", "vectors.json")
RFC_URL = "https://www.rfc-editor.org/rfc/rfc8032.txt"

# FIPS 180-4 appendix B / NIST examples, as published. hashlib must agree (asserted below).
SHA256_PUBLISHED = [
    ("FIPS 180-4 B.1 abc", {"ascii": "abc", "repeat": 1},
     "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"),
    ("FIPS 180-4 B.2 448-bit",
     {"ascii": "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq", "repeat": 1},
     "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1"),
    ("FIPS 180-4 B.3 one million a", {"ascii": "a", "repeat": 1000000},
     "cdc76e5c9914fb9281a1c7e284d73e67f1809a48a497200e046d39ccc7112cd0"),
    ("empty message", {"hex": ""},
     "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"),
]


def message_bytes(m):
    if "hex" in m:
        return bytes.fromhex(m["hex"])
    return m["ascii"].encode() * m["repeat"]


def rfc_text(path):
    if path:
        return open(path, "rb").read()
    with urllib.request.urlopen(RFC_URL, timeout=60) as r:
        return r.read()


def parse_vectors(text):
    # The headings also appear in the table of contents, so anchor on the first vector.
    start = text.index("-----TEST 1\n")
    sec = text[start: text.index("7.2.  Test Vectors for Ed25519ctx", start)]
    # Drop RFC page furniture so a vector split across pages is contiguous.
    lines = [
        l for l in sec.splitlines()
        if not l.startswith("Josefsson & Liusvaara") and not l.startswith("RFC 8032  ")
        and "\x0c" not in l
    ]
    sec = "\n".join(lines)
    out = []
    for block in re.split(r"-----TEST ", sec)[1:]:
        label = block.split("\n", 1)[0].strip()
        if not label.isdigit():
            continue  # e.g. the Ed25519ph `SHA(abc)` vector: a different scheme, not tested here
        name = "TEST " + label

        def field(label, nxt):
            m = re.search(re.escape(label) + r"\s*\n(.*?)\n\s*\n?\s*" + nxt, block, re.S)
            return re.sub(r"\s+", "", m.group(1)) if m else ""

        sk = field("SECRET KEY:", "PUBLIC KEY:")
        pk = field("PUBLIC KEY:", "MESSAGE")
        mm = re.search(r"MESSAGE \(length (\d+) bytes?\):\s*\n(.*?)\n\s*SIGNATURE:", block, re.S)
        n = int(mm.group(1))
        msg = re.sub(r"\s+", "", mm.group(2))
        sg = re.search(r"SIGNATURE:\s*\n(.*?)(?:\n\s*\n|\Z)", block, re.S)
        sig = re.sub(r"\s+", "", sg.group(1))
        assert len(msg) == 2 * n, (name, len(msg), n)
        assert len(sk) == 64 and len(pk) == 64 and len(sig) == 128, (name, len(sk), len(pk), len(sig))
        out.append({"name": name, "secret_key": sk, "public_key": pk, "message": msg, "signature": sig})
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--rfc-text")
    args = ap.parse_args()
    raw = rfc_text(args.rfc_text)
    text = raw.decode("utf-8")
    vecs = parse_vectors(text)
    assert [v["name"] for v in vecs] == ["TEST 1", "TEST 2", "TEST 3", "TEST 1024"], [v["name"] for v in vecs]
    assert [len(v["message"]) // 2 for v in vecs] == [0, 1, 2, 1023]

    for v in vecs:
        sk, pk = bytes.fromhex(v["secret_key"]), bytes.fromhex(v["public_key"])
        msg, sig = bytes.fromhex(v["message"]), bytes.fromhex(v["signature"])
        # cryptography (OpenSSL)
        priv = Ed25519PrivateKey.from_private_bytes(sk)
        pub = priv.public_key().public_bytes(serialization.Encoding.Raw, serialization.PublicFormat.Raw)
        assert pub == pk, (v["name"], "cryptography public key")
        assert priv.sign(msg) == sig, (v["name"], "cryptography signature")
        Ed25519PublicKey.from_public_bytes(pk).verify(sig, msg)
        # PyNaCl (libsodium)
        sg = nacl.signing.SigningKey(sk)
        assert bytes(sg.verify_key) == pk, (v["name"], "pynacl public key")
        assert sg.sign(msg).signature == sig, (v["name"], "pynacl signature")
        nacl.signing.VerifyKey(pk).verify(msg, sig)

    sha = []
    for name, m, digest in SHA256_PUBLISHED:
        assert hashlib.sha256(message_bytes(m)).hexdigest() == digest, (name, "hashlib disagrees with the published value")
        sha.append({"name": name, "message": m, "digest": digest})
    ladder = []
    for n in range(131):
        msg = bytes(i % 251 for i in range(n))
        ladder.append({"len": n, "digest": hashlib.sha256(msg).hexdigest()})

    fixture = {
        "source": "RFC 8032 section 7.1, " + RFC_URL,
        "rfc_text_sha256": hashlib.sha256(raw).hexdigest(),
        "copyright": "RFC 8032 Copyright (c) 2017 IETF Trust and the persons identified as the document authors. All rights reserved. Code components extracted from the RFC, including these test vectors, are licensed under the Simplified BSD License (IETF Trust Legal Provisions, section 4).",
        "oracles": "parsed from the RFC text; cross-checked with cryptography==50.0.2 (OpenSSL) and PyNaCl==1.6.2 (libsodium); SHA-256 digests cross-checked with hashlib",
        "ed25519": vecs,
        "sha256": sha,
        "sha256_pattern_ladder": ladder,
    }
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w") as f:
        json.dump(fixture, f, indent=1)
        f.write("\n")
    print(f"wrote {OUT}: {len(vecs)} Ed25519 vectors, {len(sha)} published SHA-256 vectors, {len(ladder)} ladder digests")


if __name__ == "__main__":
    sys.exit(main())
