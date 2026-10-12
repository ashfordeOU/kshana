#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Clean-room oracle for evidence-pack verification.

Runs ``scripts/evidence_verify_cleanroom.py`` (an independent verifier written from the
normative section of ``docs/EVIDENCE-PACKS.md`` alone, with hashlib and ``cryptography``'s
Ed25519) over the packs and tamper cases of ``tests/fixtures/evidence_pack_oracle/`` and writes
``reference.json`` for ``tests/evidence_pack_reference.rs``.

The inputs (``packs/``, ``attacks/``, ``log/``, ``cases.json``) come from
``cargo run --example gen_evidence_pack_oracle_packs``-style generator
``examples/gen_evidence_oracle_packs.rs``; they are synthetic, with throw-away test seeds.

PRE-REGISTERED comparison (see the header of the Rust test): for every case, exact agreement
on ``ok``, the failure set of (code, file name), ``signature_valid``, the chain head
recomputed from the files, and the chain head the manifest records.

PINNED ORACLES
--------------
Python 3.13, cryptography==50.0.2, hashlib. The Rust implementation uses sha2 and
ed25519-dalek, so the SHA-256 and Ed25519 code, the language and the author of the
verification logic all differ.

Usage::

    python3 scripts/gen_evidence_pack_ref.py
"""
import importlib.util
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, ".."))
FIX = os.path.join(ROOT, "tests", "fixtures", "evidence_pack_oracle")

spec = importlib.util.spec_from_file_location("cleanroom", os.path.join(HERE, "evidence_verify_cleanroom.py"))
cleanroom = importlib.util.module_from_spec(spec)
spec.loader.exec_module(cleanroom)


def read_pack(rel):
    d = os.path.join(FIX, rel)
    return {n: open(os.path.join(d, n), "rb").read() for n in sorted(os.listdir(d))}


def apply(files, op):
    k = op["op"]
    if k == "flip":
        b = bytearray(files[op["file"]])
        b[op["offset"]] ^= 1 << op["bit"]
        files[op["file"]] = bytes(b)
    elif k == "truncate":
        files[op["file"]] = files[op["file"]][: op["len"]]
    elif k == "append":
        files[op["file"]] = files[op["file"]] + bytes.fromhex(op["hex"])
    elif k == "remove":
        del files[op["file"]]
    elif k == "rename":
        files[op["to"]] = files.pop(op["from"])
    elif k == "swap":
        files[op["a"]], files[op["b"]] = files[op["b"]], files[op["a"]]
    elif k == "add":
        files[op["file"]] = bytes.fromhex(op["hex"])
    elif k == "replace":
        files[op["file"]] = open(os.path.join(FIX, op["with"]), "rb").read()
    else:
        raise SystemExit(f"unknown op {k}")


def main():
    cases = json.load(open(os.path.join(FIX, "cases.json")))
    out = {}
    for c in cases["cases"]:
        pack = cases["packs"][c["pack"]]
        files = read_pack(pack["dir"])
        for op in c["ops"]:
            apply(files, op)
        o = c["options"]
        pin = {"right": bytes.fromhex(pack["public_key"]), "wrong": bytes.fromhex(cases["wrong_public_key"])}.get(o["pin"])
        full = open(os.path.join(FIX, o["full_log"]), "rb").read() if o["full_log"] else None
        r = cleanroom.verify(files, pin=pin, full_log=full, require_timestamp=o["require_timestamp"])
        out[c["id"]] = {
            "ok": r["ok"],
            "failures": sorted(r["failures"], key=lambda f: (f["code"], f["name"] or "")),
            "signature_valid": r["signature_valid"],
            "chain_head_of_files": r["chain_head_of_files"],
            "manifest_chain_head": r["manifest_chain_head"],
        }
    doc = {
        "oracle": "scripts/evidence_verify_cleanroom.py (clean-room, hashlib + cryptography==50.0.2 Ed25519)",
        "cases": out,
    }
    with open(os.path.join(FIX, "reference.json"), "w") as f:
        json.dump(doc, f, indent=1, sort_keys=True)
        f.write("\n")
    print(f"wrote reference.json: {len(out)} cases, {sum(1 for v in out.values() if v['ok'])} verified")


if __name__ == "__main__":
    sys.exit(main())
