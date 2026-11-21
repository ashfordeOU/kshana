#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the synthetic signed directories under tests/fixtures/signed_dir/ (kshana-dossier-signature/1):
pack/, and one pack per operating-envelope family under families/<family>/.

Independent of src/evidence/signed_dir.rs (Python, `cryptography` for Ed25519), so the Rust
verifier is checked against a second implementation. The key is a TEST key from a published seed:
SHA-256 of the ASCII text "signed directory test vector". It proves nothing about any signer.
Deterministic: running it again gives the same bytes.

usage: python3 -I tests/fixtures/signed_dir/gen_pack.py
"""
import hashlib, json, os, shutil
from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey
from cryptography.hazmat.primitives import serialization

OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pack")
FILES = {
    "operating-envelope.json": json.dumps({"format": "example-pack/1", "family": "example",
                                           "statement": "synthetic test pack"}, indent=1) + "\n",
    "result.json": json.dumps({"schema": "example-result/1", "value": 1.25, "label": "MODELLED"}, indent=1) + "\n",
    "README.txt": "A synthetic signed directory for tests. Not a real product output.\n",
    "data/series.csv": "t,x\n0,1\n1,2\n",
    "data/nested/notes.txt": "nested file\n",
}


FAMILIES = ["interference-and-forensics", "maritime", "aviation-and-airspace",
            "land-transport-agriculture-and-cellular", "timing", "insurance-and-finance",
            "eloran-and-terrestrial", "receivers-space-and-test", "evidence-and-governance"]
ROOT = os.path.dirname(OUT)


def family_files(fam):
    return {
        "operating-envelope.json": json.dumps({"format": f"example-{fam}/1", "family": fam,
                                               "statement": "synthetic test pack"}, indent=1) + "\n",
        "report.json": json.dumps({"schema": f"example-{fam}/1", "label": "MODELLED", "value": len(fam)}, indent=1) + "\n",
        f"inputs/{fam}.txt": f"synthetic input for the {fam} family\n",
    }


def main():
    write_pack(OUT, FILES, "2026-11-21T09:00:00Z")
    fams = os.path.join(ROOT, "families")
    if os.path.isdir(fams):
        shutil.rmtree(fams)
    for i, fam in enumerate(FAMILIES):
        write_pack(os.path.join(fams, fam), family_files(fam), f"2026-11-21T10:{i:02d}:00Z")


def write_pack(OUT, FILES, utc):
    if os.path.isdir(OUT):
        shutil.rmtree(OUT)
    for rel, text in FILES.items():
        p = os.path.join(OUT, *rel.split("/"))
        os.makedirs(os.path.dirname(p), exist_ok=True)
        open(p, "w", newline="\n").write(text)
    sk = Ed25519PrivateKey.from_private_bytes(hashlib.sha256(b"signed directory test vector").digest())
    pk = sk.public_key().public_bytes(serialization.Encoding.Raw, serialization.PublicFormat.Raw)
    files = sorted(({"path": rel, "sha256": hashlib.sha256(t.encode()).hexdigest()} for rel, t in FILES.items()),
                   key=lambda f: (f["path"], f["sha256"]))
    st = {"format": "kshana-dossier-signature/1", "signer": "Test signer (synthetic)",
          "utc": utc, "public_key": pk.hex(),
          "key_id": hashlib.sha256(pk).hexdigest()[:16], "files": files}
    signed = json.dumps(st, separators=(",", ":"), ensure_ascii=False).encode()
    st["signature"] = sk.sign(signed).hex()
    open(os.path.join(OUT, "signature.json"), "w", newline="\n").write(json.dumps(st, indent=2) + "\n")
    print(OUT, "public key", pk.hex())


if __name__ == "__main__":
    main()
