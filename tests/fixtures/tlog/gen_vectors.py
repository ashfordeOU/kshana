#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the transparency-log test fixtures in this directory.

Written independently of src/tlog.rs (Python, `cryptography` for Ed25519, OpenSSL 3 for the
RFC 3161 token) so that the Rust verifier is checked against a second implementation.

Every key here is a TEST key from a published seed: SHA-256 of the ASCII text
"tlog test vector key <n>". They prove nothing about any real log. The timestamp authority
is a throwaway test CA made by OpenSSL in a temporary directory; its private keys are deleted.
The token and the authority's certificates are not reproducible (new keys, new time), so
regenerate them together; everything else is deterministic.

The log is the five-entry vector log of docs/TLOG.md: pack_sha256 = SHA-256("vector i"), signer
"kid-vector", logged 2026-11-20T0i:00:00Z, classes (none), evidence_pack, calibration_record,
evidence_pack, calibration_record, kinds kshana-dossier/1, kshana-dossier/1,
delay-calibration/1, kshana-dossier/1, delay-calibration/1.

usage: python3 -I tests/fixtures/tlog/gen_vectors.py [--no-token]
"""
import base64, datetime, hashlib, json, os, subprocess, sys, tempfile
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives import serialization

OUT = os.path.dirname(os.path.abspath(__file__))
H = lambda b: hashlib.sha256(b).digest()
hx = lambda b: b.hex()


def canon(v):
    return json.dumps(v, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode()


def key(n):
    sk = Ed25519PrivateKey.from_private_bytes(H(f"tlog test vector key {n}".encode()))
    pk = sk.public_key().public_bytes(serialization.Encoding.Raw, serialization.PublicFormat.Raw)
    return sk, pk.hex()


def leaf(d):
    return H(b"\x00" + d)


def node(l, r):
    return H(b"\x01" + l + r)


def mth(ds):
    n = len(ds)
    if n == 0:
        return H(b"")
    if n == 1:
        return leaf(ds[0])
    k = 1
    while k * 2 < n:
        k *= 2
    return node(mth(ds[:k]), mth(ds[k:]))


def path(m, ds):  # RFC 9162 2.1.3.1
    n = len(ds)
    if n == 1:
        return []
    k = 1
    while k * 2 < n:
        k *= 2
    if m < k:
        return path(m, ds[:k]) + [mth(ds[k:])]
    return path(m - k, ds[k:]) + [mth(ds[:k])]


def subproof(m, ds, b):  # RFC 9162 2.1.4.1
    n = len(ds)
    if m == n:
        return [] if b else [mth(ds)]
    k = 1
    while k * 2 < n:
        k *= 2
    if m <= k:
        return subproof(m, ds[:k], b) + [mth(ds[k:])]
    return subproof(m - k, ds[k:], False) + [mth(ds[:k])]


def chain(ds):
    c = bytes(32)
    for d in ds:
        c = H(b"\x02" + c + leaf(d))
    return c


KINDS = ["kshana-dossier/1", "kshana-dossier/1", "delay-calibration/1", "kshana-dossier/1", "delay-calibration/1"]
CLASSES = [None, "evidence_pack", "calibration_record", "evidence_pack", "calibration_record"]


def entry(i):
    d = {"pack_sha256": hx(H(f"vector {i}".encode())), "kind": KINDS[i], "signer_key_id": "kid-vector",
         "logged_utc": f"2026-11-20T0{i}:00:00Z"}
    if CLASSES[i]:
        d["class"] = CLASSES[i]
    return d


ENTRIES = [entry(i) for i in range(5)]
LEAVES = [json.dumps(e, separators=(",", ":")).encode() for e in ENTRIES]  # the leaf order
FORMAT_STH = "example-sth/1"
FORMAT_DAILY = "example-daily-root/1"
FORMAT_KEYS = "example-key-record/1"
LOG_KEY_ID = "kid-log-1"


def verdict(sk, key_id, method, evidence_class, utc, payload):
    body = canon({"evidence_class": evidence_class, "key_id": key_id, "method": method,
                  "service": "example-log", "utc": utc, "verdict": payload})
    return {"service": "example-log", "method": method, "evidence_class": evidence_class, "utc": utc,
            "key_id": key_id, "verdict": payload, "verdict_sha256": hx(H(body)),
            "signature": hx(sk.sign(body))}


def write(name, obj):
    with open(os.path.join(OUT, name), "w") as f:
        f.write(json.dumps(obj, indent=1) + "\n")


def main():
    sk0, pk0 = key(0)
    sk1, pk1 = key(1)
    # Entries as a server might serve them: keys sorted (the verifier must rebuild the order).
    with open(os.path.join(OUT, "entries.jsonl"), "w") as f:
        for e in ENTRIES:
            f.write(json.dumps(e, sort_keys=True) + "\n")
    def sth(n, utc):
        return {"format": FORMAT_STH, "log_key_id": LOG_KEY_ID, "size": n, "root_hash": hx(mth(LEAVES[:n])),
                "chain_head": hx(chain(LEAVES[:n])), "timestamp_utc": utc}
    write("sth-3.json", verdict(sk1, "kid-log-1", "sth", "log_state", "2026-11-20T02:30:00Z", sth(3, "2026-11-20T02:30:00Z")))
    write("sth-5.json", verdict(sk1, "kid-log-1", "sth", "log_state", "2026-11-20T04:30:00Z", sth(5, "2026-11-20T04:30:00Z")))
    write("inclusion-2-of-5.json", verdict(sk1, "kid-log-1", "inclusion", "log_proof", "2026-11-20T04:31:00Z", {
        "index": 2, "size": 5, "leaf_hash": hx(leaf(LEAVES[2])), "root_hash": hx(mth(LEAVES)),
        "path": [hx(p) for p in path(2, LEAVES)]}))
    write("consistency-3-to-5.json", verdict(sk1, "kid-log-1", "consistency", "log_proof", "2026-11-20T04:32:00Z", {
        "from": 3, "to": 5, "from_root": hx(mth(LEAVES[:3])), "to_root": hx(mth(LEAVES)),
        "path": [hx(p) for p in subproof(3, LEAVES, True)]}))
    # RFC 6962 reference data (the Go/C++ reference implementations' test leaves).
    rfc = ["", "00", "10", "2021", "3031", "40414243", "5051525354555657", "606162636465666768696a6b6c6d6e6f"]
    rl = [bytes.fromhex(x) for x in rfc]
    write("rfc6962.json", {
        "leaves_hex": rfc,
        "roots": [hx(mth(rl[:n])) for n in range(9)],
        "inclusion": [{"index": m, "size": n, "path": [hx(p) for p in path(m, rl[:n])]}
                      for n in range(1, 9) for m in range(n)],
        "consistency": [{"from": m, "to": n, "path": [hx(p) for p in subproof(m, rl[:n], True)]}
                        for n in range(1, 9) for m in range(1, n + 1)]})
    # Key history: key 0 from 2026-01-01, rotated to key 1 on 2026-11-01, endorsed by key 0.
    r0 = {"format": FORMAT_KEYS, "seq": 0, "key_id": "kid-log-0", "algorithm": "ed25519", "public_key": pk0,
          "not_before": "2026-01-01T00:00:00Z", "previous_key_id": None, "previous_record_sha256": "0" * 64}
    r1 = {"format": FORMAT_KEYS, "seq": 1, "key_id": "kid-log-1", "algorithm": "ed25519", "public_key": pk1,
          "not_before": "2026-11-01T00:00:00Z", "previous_key_id": "kid-log-0",
          "previous_record_sha256": hx(H(canon(r0)))}
    endorse = canon({"format": FORMAT_KEYS, "next_key_id": "kid-log-1", "next_public_key": pk1, "previous_key_id": "kid-log-0"})
    lines = [
        {"record": r0, "record_sha256": hx(H(canon(r0))), "signature": hx(sk0.sign(canon(r0))), "previous_key_endorsement": None},
        {"record": r1, "record_sha256": hx(H(canon(r1))), "signature": hx(sk1.sign(canon(r1))),
         "previous_key_endorsement": hx(sk0.sign(endorse))},
    ]
    with open(os.path.join(OUT, "key-history.jsonl"), "w") as f:
        for l in lines:
            f.write(json.dumps(l, sort_keys=True) + "\n")
    # Daily root, stamped by the test authority.
    daily = {"chain_head": hx(chain(LEAVES)), "date": "2026-11-20", "format": FORMAT_DAILY,
             "log_key_id": LOG_KEY_ID, "root_hash": hx(mth(LEAVES)), "size": 5}
    stamped = canon(daily)
    with open(os.path.join(OUT, "daily-root-stamped.bin"), "wb") as f:
        f.write(stamped)
    stamps = []
    if "--no-token" not in sys.argv:
        stamps.append(tsa_token(stamped))
    elif os.path.exists(os.path.join(OUT, "daily-root.json")):
        stamps = json.load(open(os.path.join(OUT, "daily-root.json")))["verdict"]["timestamps"]
    payload = {"daily_root": daily, "daily_root_sha256": hx(H(stamped)), "anchoring": "rfc3161",
               "statement": "test vector: a daily root of the five-entry vector log", "timestamps": stamps}
    write("daily-root.json", verdict(sk1, "kid-log-1", "daily-root", "log_anchor", "2026-11-21T00:05:00Z", payload))
    payload_none = dict(payload, timestamps=[])
    write("daily-root-unanchored.json", verdict(sk1, "kid-log-1", "daily-root", "log_anchor", "2026-11-21T00:05:00Z", payload_none))
    print("public keys: kid-log-0", pk0, "kid-log-1", pk1)


def tsa_token(data):
    with tempfile.TemporaryDirectory() as k:
        run = lambda *a: subprocess.run(a, cwd=k, check=True, capture_output=True)
        open(os.path.join(k, "ext.cnf"), "w").write(
            "[req]\ndistinguished_name = dn\n[dn]\n[v3ca]\nbasicConstraints = critical,CA:TRUE\n"
            "keyUsage = critical,keyCertSign,cRLSign\nsubjectKeyIdentifier = hash\n[tsa]\n"
            "basicConstraints = critical,CA:FALSE\nkeyUsage = critical,digitalSignature,nonRepudiation\n"
            "extendedKeyUsage = critical,timeStamping\nsubjectKeyIdentifier = hash\nauthorityKeyIdentifier = keyid\n")
        run("openssl", "genpkey", "-algorithm", "EC", "-pkeyopt", "ec_paramgen_curve:P-256", "-out", "root.key")
        run("openssl", "req", "-x509", "-new", "-key", "root.key", "-subj", "/CN=Kshana Test tlog Root", "-days", "7300",
            "-sha256", "-extensions", "v3ca", "-config", "ext.cnf", "-out", "root.pem")
        run("openssl", "genpkey", "-algorithm", "EC", "-pkeyopt", "ec_paramgen_curve:P-256", "-out", "tsa.key")
        run("openssl", "req", "-new", "-key", "tsa.key", "-subj", "/CN=Kshana Test tlog TSA", "-out", "tsa.csr")
        run("openssl", "x509", "-req", "-in", "tsa.csr", "-CA", "root.pem", "-CAkey", "root.key", "-CAcreateserial",
            "-days", "7300", "-extfile", "ext.cnf", "-extensions", "tsa", "-sha256", "-out", "tsa.pem")
        open(os.path.join(k, "data.bin"), "wb").write(data)
        open(os.path.join(k, "serial"), "w").write("01\n")
        open(os.path.join(k, "ts.cnf"), "w").write(
            f"[t]\nserial = {k}/serial\ncrypto_device = builtin\nsigner_cert = {k}/tsa.pem\nsigner_key = {k}/tsa.key\n"
            "signer_digest = sha256\ndefault_policy = 1.2.3.4.1\ndigests = sha256\naccuracy = secs:1\nordering = no\n"
            "tsa_name = no\ness_cert_id_chain = no\ness_cert_id_alg = sha256\n")
        run("openssl", "ts", "-query", "-data", "data.bin", "-sha256", "-cert", "-out", "q.tsq")
        run("openssl", "ts", "-reply", "-queryfile", "q.tsq", "-config", "ts.cnf", "-section", "t", "-out", "r.tsr")
        der = open(os.path.join(k, "r.tsr"), "rb").read()
        gen = subprocess.run(["openssl", "ts", "-reply", "-in", "r.tsr", "-text"], cwd=k, check=True,
                             capture_output=True, text=True).stdout
        gen_time = [l.split(":", 1)[1].strip() for l in gen.splitlines() if l.startswith("Time stamp:")][0]
        gen_time = datetime.datetime.strptime(gen_time, "%b %d %H:%M:%S %Y %Z").strftime("%Y-%m-%dT%H:%M:%SZ")
        open(os.path.join(OUT, "tsa-root.pem"), "w").write(open(os.path.join(k, "root.pem")).read())
        open(os.path.join(OUT, "tsa-other-root.pem"), "w").write(other_root(k))
        return {"authority": "Kshana test TSA (throwaway, generated by gen_vectors.py)", "status": "granted",
                "gen_time_utc": gen_time, "token_sha256": hx(H(der)),
                "token_der_base64": base64.b64encode(der).decode()}


def other_root(k):
    subprocess.run(["openssl", "genpkey", "-algorithm", "EC", "-pkeyopt", "ec_paramgen_curve:P-256", "-out", "o.key"],
                   cwd=k, check=True, capture_output=True)
    subprocess.run(["openssl", "req", "-x509", "-new", "-key", "o.key", "-subj", "/CN=Kshana Test tlog Other Root",
                    "-days", "7300", "-sha256", "-extensions", "v3ca", "-config", "ext.cnf", "-out", "o.pem"],
                   cwd=k, check=True, capture_output=True)
    return open(os.path.join(k, "o.pem")).read()


if __name__ == "__main__":
    main()
