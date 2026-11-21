#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Pack the translated engine catalogues into the one file the published crate carries.

The seventeen translated catalogues `i18n/<lang>/engine.ftl` are the source of truth and stay in the
repository; translators edit them. They cost about 3.8 MB of the `.crate` as separate gzip members, so
the package leaves them out (Cargo.toml `exclude`) and carries this file instead: the same bytes,
concatenated behind a short index and compressed as one xz stream (LZMA2, preset 9e, CRC32), about
1.9 MB. LZMA's large window finds the text the languages share, which per-file gzip cannot.

The output is GENERATED, never committed: CI (the `package` job) and the release (`publish.yml`, the
crates.io and sdist steps) run this script right before `cargo package`. A build from a checkout never
reads it: `build.rs` embeds the `.ftl` files themselves whenever they are present, and decodes this
file only in a build of the published crate, where they are not (`src/i18n/packed.rs`).

Layout of the decompressed bytes (UTF-8):

    kshana-engine-catalogues 1\n
    <tag> <byte length>\n           one line per language, in the order of LANGS in src/i18n/mod.rs
    \n
    <the catalogues, concatenated in the same order, byte for byte>

Usage:
    python3 scripts/pack_catalogues.py                 write data/i18n/catalogues.xz
    python3 scripts/pack_catalogues.py --out PATH      write PATH instead
    python3 scripts/pack_catalogues.py --check         exit 1 unless data/i18n/catalogues.xz (or --out)
                                                       holds exactly the current .ftl files
"""
import argparse
import lzma
import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
MAGIC = b"kshana-engine-catalogues 1\n"
DEFAULT_OUT = ROOT / "data" / "i18n" / "catalogues.xz"
FILTERS = [{"id": lzma.FILTER_LZMA2, "preset": 9 | lzma.PRESET_EXTREME}]


def tags():
    """The translated languages: LANGS in src/i18n/mod.rs, without English (embedded as-is)."""
    src = (ROOT / "src" / "i18n" / "mod.rs").read_text(encoding="utf-8")
    m = re.search(r"pub const LANGS: \[&str; \d+\] = \[(.*?)\];", src, re.S)
    if not m:
        sys.exit("pack_catalogues: LANGS not found in src/i18n/mod.rs")
    return [t for t in re.findall(r'"([^"]+)"', m.group(1)) if t != "en"]


def payload():
    parts = [(t, (ROOT / "i18n" / t / "engine.ftl").read_bytes()) for t in tags()]
    for t, b in parts:
        b.decode("utf-8")  # a catalogue that is not UTF-8 fails here, not in a user's build
    index = b"".join(f"{t} {len(b)}\n".encode() for t, b in parts)
    return MAGIC + index + b"\n" + b"".join(b for _, b in parts)


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--out", type=pathlib.Path, default=DEFAULT_OUT)
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    want = payload()
    if a.check:
        try:
            have = lzma.decompress(a.out.read_bytes(), format=lzma.FORMAT_XZ)
        except (OSError, lzma.LZMAError) as e:
            sys.exit(f"pack_catalogues --check: {a.out}: {e}")
        if have != want:
            sys.exit(f"pack_catalogues --check: {a.out} is stale; run python3 scripts/pack_catalogues.py")
        print(f"pack_catalogues --check: {a.out} matches the {len(tags())} catalogues")
        return
    packed = lzma.compress(want, format=lzma.FORMAT_XZ, check=lzma.CHECK_CRC32, filters=FILTERS)
    a.out.parent.mkdir(parents=True, exist_ok=True)
    a.out.write_bytes(packed)
    print(f"pack_catalogues: {a.out}: {len(want)} bytes -> {len(packed)} bytes ({len(tags())} catalogues)")


if __name__ == "__main__":
    main()
