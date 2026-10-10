#!/usr/bin/env python3
# Clean-room independent verifier for Kshana evidence packs.
# Written from docs/EVIDENCE-PACKS.md ALONE (the failure-code table and the section
# "Pack format and verification procedure (normative)"), plus RFC 8032, RFC 3161 and
# FIPS 180-4. It was written without reading any Rust source, example, test or history.
# Libraries: Python standard library (hashlib, json, os, sys, argparse, datetime) and
# `cryptography` (Ed25519 signature verification only). No ASN.1 library: the RFC 3161
# token is read with the small DER reader below.
import argparse
import datetime
import hashlib
import json
import os
import re
import sys

from cryptography.exceptions import InvalidSignature
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PublicKey

ARTIFACTS = ["log-slice.bin", "config.json", "epochs.json", "summary.html"]
L_ORDER = 2**252 + 27742317777372353535851937790883648493
P25519 = 2**255 - 19
D25519 = (-121665 * pow(121666, P25519 - 2, P25519)) % P25519
HEX64 = re.compile(r"\A[0-9a-f]{64}\Z")
HEX128 = re.compile(r"\A[0-9a-f]{128}\Z")


def sha(b):
    return hashlib.sha256(b).digest()


def _name_bytes(n):
    return n.encode("utf-8", "surrogatepass")


def chain_links(entries):
    """entries: list of (name, sha256_bytes). Returns list of links (bytes)."""
    link = sha(b"kshana-evidence-chain/1")
    out = []
    for name, h in entries:
        nb = _name_bytes(name)
        link = sha(link + h + len(nb).to_bytes(4, "big") + nb)
        out.append(link)
    return out


def valid_pubkey_encoding(k):
    """Encoding validity per RFC 8032 5.1.3 (y canonical, x recoverable)."""
    if not isinstance(k, (bytes, bytearray)) or len(k) != 32:
        return False
    v = int.from_bytes(k, "little")
    sign = v >> 255
    y = v & ((1 << 255) - 1)
    if y >= P25519:
        return False
    u = (y * y - 1) % P25519
    w = (D25519 * y * y + 1) % P25519
    x2 = u * pow(w, P25519 - 2, P25519) % P25519
    if x2 == 0:
        return sign == 0
    x = pow(x2, (P25519 + 3) // 8, P25519)
    if (x * x - x2) % P25519 != 0:
        x = x * pow(2, (P25519 - 1) // 4, P25519) % P25519
    return (x * x - x2) % P25519 == 0


def ed_verify(pub, sig, msg):
    if int.from_bytes(sig[32:], "little") >= L_ORDER:
        return False
    try:
        Ed25519PublicKey.from_public_bytes(pub).verify(sig, msg)
        return True
    except (InvalidSignature, ValueError):
        return False


# ---------------------------------------------------------------- JSON
def _no_const(x):
    raise ValueError("non-finite number")


def parse_json(b):
    try:
        return True, json.loads(b.decode("utf-8"), parse_constant=_no_const)
    except Exception:
        return False, None


def is_str(x):
    return isinstance(x, str)


def is_num(x):
    return isinstance(x, (int, float)) and not isinstance(x, bool)


def is_uint(x):
    return isinstance(x, int) and not isinstance(x, bool) and x >= 0


def is_obj(x):
    return isinstance(x, dict)


def manifest_well_formed(m):
    if not is_obj(m):
        return False
    try:
        for k in ("format", "title", "engine_version", "disclaimer", "chain_head"):
            if not is_str(m[k]):
                return False
        if not (m["created_utc"] is None or is_str(m["created_utc"])):
            return False
        w = m["window"]
        if not (is_obj(w) and is_num(w["from_s"]) and is_num(w["to_s"])):
            return False
        if not is_uint(m["epochs_in_window"]):
            return False
        lg = m["log"]
        if not is_obj(lg):
            return False
        if not (is_str(lg["format"]) and is_str(lg["file_name"]) and is_str(lg["full_sha256"])
                and is_uint(lg["full_bytes"])):
            return False
        if not (lg["start_label"] is None or is_str(lg["start_label"])):
            return False
        s = lg["slice"]
        if not is_obj(s):
            return False
        if s["kind"] not in ("byte-range", "whole-log") or not is_str(s["kind"]):
            return False
        if not (is_uint(s["start"]) and is_uint(s["end"]) and is_str(s["sha256"])):
            return False
        sg = m["signer"]
        if not (is_obj(sg) and is_str(sg["algorithm"]) and is_str(sg["public_key"])
                and is_str(sg["fingerprint"])):
            return False
        a = m["artifacts"]
        if not isinstance(a, list):
            return False
        for e in a:
            if not is_obj(e):
                return False
            if not (is_str(e["name"]) and is_str(e["role"]) and is_uint(e["bytes"])
                    and is_str(e["sha256"]) and is_str(e["link"])):
                return False
    except KeyError:
        return False
    return True


# ---------------------------------------------------------------- DER
class DerError(Exception):
    pass


def der_read(buf, pos):
    """Returns (tag, value_start, value_end). Indefinite length rejected."""
    if pos + 2 > len(buf):
        raise DerError("short")
    tag = buf[pos]
    if tag & 0x1F == 0x1F:
        raise DerError("high tag")
    ln = buf[pos + 1]
    p = pos + 2
    if ln == 0x80:
        raise DerError("indefinite")
    if ln & 0x80:
        n = ln & 0x7F
        if n == 0 or n > 4 or p + n > len(buf):
            raise DerError("len")
        ln = int.from_bytes(buf[p:p + n], "big")
        p += n
    if p + ln > len(buf):
        raise DerError("truncated")
    return tag, p, p + ln


def der_children(buf, start, end):
    out = []
    p = start
    while p < end:
        tag, s, e = der_read(buf[:end], p)
        out.append((tag, s, e))
        p = e
    return out


def oid_str(b):
    if not b:
        raise DerError("oid")
    parts = []
    v = 0
    for i, x in enumerate(b):
        v = (v << 7) | (x & 0x7F)
        if not x & 0x80:
            parts.append(v)
            v = 0
        elif i == len(b) - 1:
            raise DerError("oid")
    first = parts[0]
    a = min(first // 40, 2)
    return ".".join(map(str, [a, first - 40 * a] + parts[1:]))


def expect(buf, node, tag):
    if node[0] != tag:
        raise DerError("tag")
    return node


OID_SIGNED = "1.2.840.113549.1.7.2"
OID_TSTINFO = "1.2.840.113549.1.9.16.1.4"
HASHES = {"2.16.840.1.101.3.4.2.1": ("sha256", 32),
          "2.16.840.1.101.3.4.2.2": ("sha384", 48),
          "2.16.840.1.101.3.4.2.3": ("sha512", 64)}


def parse_gentime(b):
    s = b.decode("ascii")
    m = re.fullmatch(r"(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})(\.\d+)?Z", s)
    if not m:
        raise DerError("gentime")
    y, mo, d, h, mi, se = (int(m.group(i)) for i in range(1, 7))
    if se == 60:
        se = 59
    datetime.datetime(y, mo, d, h, mi, se)  # raises ValueError if not real


def parse_timestamp(buf):
    """Returns (hash_name, digest) of the message imprint, or raises."""
    try:
        top = der_read(buf, 0)
        if top[0] != 0x30 or top[2] != len(buf):
            raise DerError("top")
        kids = der_children(buf, top[1], top[2])
        if not kids:
            raise DerError("empty")
        if kids[0][0] == 0x06:
            ci = (0x30, top[1], top[2])
        elif kids[0][0] == 0x30:
            # TimeStampResp: PKIStatusInfo, token
            st = der_children(buf, kids[0][1], kids[0][2])
            if not st or st[0][0] != 0x02:
                raise DerError("status")
            status = int.from_bytes(buf[st[0][1]:st[0][2]], "big", signed=True)
            if status not in (0, 1):
                raise DerError("status value")
            if len(kids) != 2 or kids[1][0] != 0x30:
                raise DerError("no token")
            ci = kids[1]
        else:
            raise DerError("shape")
        ck = der_children(buf, ci[1], ci[2])
        if len(ck) != 2 or ck[0][0] != 0x06 or ck[1][0] != 0xA0:
            raise DerError("contentinfo")
        if oid_str(buf[ck[0][1]:ck[0][2]]) != OID_SIGNED:
            raise DerError("not signeddata")
        sd = der_children(buf, ck[1][1], ck[1][2])
        if len(sd) != 1 or sd[0][0] != 0x30:
            raise DerError("signeddata")
        sk = der_children(buf, sd[0][1], sd[0][2])
        if len(sk) < 3 or sk[0][0] != 0x02 or sk[1][0] != 0x31 or sk[2][0] != 0x30:
            raise DerError("signeddata members")
        ec = der_children(buf, sk[2][1], sk[2][2])
        if len(ec) != 2 or ec[0][0] != 0x06 or ec[1][0] != 0xA0:
            raise DerError("encap")
        if oid_str(buf[ec[0][1]:ec[0][2]]) != OID_TSTINFO:
            raise DerError("not tstinfo")
        oc = der_children(buf, ec[1][1], ec[1][2])
        if len(oc) != 1 or oc[0][0] != 0x04:
            raise DerError("octet")
        tb = buf[oc[0][1]:oc[0][2]]
        tt = der_read(tb, 0)
        if tt[0] != 0x30 or tt[2] != len(tb):
            raise DerError("tstinfo")
        tk = der_children(tb, tt[1], tt[2])
        if len(tk) < 5 or tk[0][0] != 0x02 or tk[1][0] != 0x06 or tk[2][0] != 0x30 \
                or tk[3][0] != 0x02 or tk[4][0] != 0x18:
            raise DerError("tstinfo members")
        mi = der_children(tb, tk[2][1], tk[2][2])
        if len(mi) != 2 or mi[0][0] != 0x30 or mi[1][0] != 0x04:
            raise DerError("imprint")
        ai = der_children(tb, mi[0][1], mi[0][2])
        if not ai or ai[0][0] != 0x06:
            raise DerError("alg")
        alg = oid_str(tb[ai[0][1]:ai[0][2]])
        if alg not in HASHES:
            raise DerError("alg unsupported")
        name, n = HASHES[alg]
        digest = tb[mi[1][1]:mi[1][2]]
        if len(digest) != n:
            raise DerError("digest length")
        parse_gentime(tb[tk[4][1]:tk[4][2]])
        return name, digest
    except (DerError, ValueError, UnicodeDecodeError, IndexError):
        raise DerError("malformed")


# ---------------------------------------------------------------- verify
def verify(files, pin=None, full_log=None, require_timestamp=False):
    fails = {}

    def fail(code, name=None):
        fails[(code, name)] = True

    res = {"ok": False, "failures": [], "signature_valid": None,
           "chain_head_of_files": None, "manifest_chain_head": None}

    if all(n in files for n in ARTIFACTS):
        res["chain_head_of_files"] = chain_links([(n, sha(files[n])) for n in ARTIFACTS])[-1].hex()

    def finish():
        res["failures"] = [{"code": c, "name": n} for (c, n) in fails]
        res["ok"] = not fails
        return res

    if "manifest.json" not in files:
        fail("manifest-missing")
        return finish()
    mb = files["manifest.json"]
    parsed_ok, m = parse_json(mb)
    readable = parsed_ok and manifest_well_formed(m)
    if parsed_ok and is_obj(m) and is_str(m.get("chain_head")):
        res["manifest_chain_head"] = m["chain_head"]
    if not readable:
        fail("manifest-malformed")
    else:
        if m["format"] != "kshana-evidence/1":
            fail("unsupported-format")

    # step 3 (performed whether or not the manifest was readable)
    named = None
    if readable:
        pk = m["signer"]["public_key"]
        if not HEX64.match(pk):
            fail("public-key-malformed")
        else:
            named = bytes.fromhex(pk)
            if m["signer"]["fingerprint"] != sha(named).hex()[:32]:
                fail("public-key-malformed")
    if pin is not None and named is not None and bytes(pin) != named:
        fail("public-key-mismatch")
    check = bytes(pin) if pin is not None else named
    if "manifest.sig" not in files:
        fail("signature-missing")
    else:
        sg = files["manifest.sig"]
        ok_form = False
        if len(sg) == 129 and sg[128:] == b"\n":
            try:
                ok_form = bool(HEX128.match(sg[:128].decode("ascii")))
            except UnicodeDecodeError:
                ok_form = False
        if not ok_form:
            fail("signature-malformed")
        elif check is not None and not valid_pubkey_encoding(check):
            fail("public-key-malformed")
        elif check is not None:
            good = ed_verify(check, bytes.fromhex(sg[:128].decode()), mb)
            res["signature_valid"] = good
            if not good:
                fail("signature-invalid")

    if not readable:
        return finish()

    arts = m["artifacts"]
    # step 5
    if [e["name"] for e in arts] != ARTIFACTS:
        fail("artifact-list-malformed")
    for e in arts:
        n = e["name"]
        if n not in files:
            fail("file-missing", n)
            continue
        if len(files[n]) != e["bytes"]:
            fail("file-size-mismatch", n)
        if sha(files[n]).hex() != e["sha256"]:
            fail("file-hash-mismatch", n)
    # step 6
    listed = {e["name"] for e in arts}
    for n in files:
        if n in ("manifest.json", "manifest.sig", "timestamp.tsr") or n in listed:
            continue
        fail("unlisted-file", n)
    # step 7
    link = sha(b"kshana-evidence-chain/1")
    abandoned = False
    for e in arts:
        if not HEX64.match(e["sha256"]):
            fail("manifest-malformed")
            abandoned = True
            break
        nb = _name_bytes(e["name"])
        link = sha(link + bytes.fromhex(e["sha256"]) + len(nb).to_bytes(4, "big") + nb)
        if link.hex() != e["link"]:
            fail("chain-mismatch", e["name"])
    if not abandoned and link.hex() != m["chain_head"]:
        fail("chain-head-mismatch")
    # step 8
    s = m["log"]["slice"]
    fb = m["log"]["full_bytes"]
    bad = s["start"] > s["end"] or s["end"] > fb
    sl = next((e for e in arts if e["name"] == "log-slice.bin"), None)
    if sl is not None:
        if sl["sha256"] != s["sha256"]:
            bad = True
        if sl["bytes"] != s["end"] - s["start"]:
            bad = True
    if s["kind"] == "whole-log":
        if s["start"] != 0 or s["end"] != fb or s["sha256"] != m["log"]["full_sha256"]:
            bad = True
    if bad:
        fail("slice-record-inconsistent")
    if "epochs.json" in files:
        ok, ep = parse_json(files["epochs.json"])
        if ok and isinstance(ep, list) and len(ep) != m["epochs_in_window"]:
            fail("epoch-count-mismatch")
    # step 9
    if full_log is not None:
        if sha(full_log).hex() != m["log"]["full_sha256"]:
            fail("full-log-hash-mismatch")
        elif (s["start"] > s["end"] or s["end"] > len(full_log)
              or full_log[s["start"]:s["end"]] != files.get("log-slice.bin")):
            fail("slice-not-from-full-log")
    # step 10
    if "timestamp.tsr" not in files:
        if require_timestamp:
            fail("timestamp-missing")
    else:
        try:
            alg, digest = parse_timestamp(files["timestamp.tsr"])
        except DerError:
            fail("timestamp-malformed")
        else:
            if hashlib.new(alg, mb).digest() != digest:
                fail("timestamp-imprint-mismatch")
    return finish()


def main(argv=None):
    ap = argparse.ArgumentParser()
    ap.add_argument("pack_dir")
    ap.add_argument("--pin")
    ap.add_argument("--log")
    ap.add_argument("--require-timestamp", action="store_true")
    a = ap.parse_args(argv)
    files = {}
    for n in sorted(os.listdir(a.pack_dir)):
        p = os.path.join(a.pack_dir, n)
        if os.path.isfile(p):
            with open(p, "rb") as f:
                files[n] = f.read()
    pin = bytes.fromhex(a.pin) if a.pin else None
    log = open(a.log, "rb").read() if a.log else None
    r = verify(files, pin, log, a.require_timestamp)
    print(json.dumps(r, indent=2))
    return 0 if r["ok"] else 1


if __name__ == "__main__":
    sys.exit(main())
