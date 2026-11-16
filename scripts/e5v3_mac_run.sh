#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# The owner's run of B4a E5 v3 (docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION-E5-v3.md),
# step by step as docs/design/evidence/b4a-benchmark-classes/MAC-RUN.md describes.
#
# Data: Tuni2025 Datasets for GNSS, GPS Spoofing (Syed Muneeb Ur Rahman, Tampere University), Zenodo record
# 17249727, CC BY 4.0, "SS-33 GPS Delayed Spoofer Injection (All PRNs Spoofed).bin", 39 999 912 000 bytes,
# MD5 2320ab15af06dd66bfe459094e24381e (Zenodo's published checksum). The recording stays outside the
# repository and is never committed; only window scores and the score file leave the computer.
#
# Usage: bash scripts/e5v3_mac_run.sh metadata|check|data|build|score|send
#   E5V3_WORK  working directory outside the repository (default ~/kshana-e5v3)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="${E5V3_WORK:-$HOME/kshana-e5v3}"
DATA="$WORK/data"
OUT="$WORK/out"
REC=17249727
API="https://zenodo.org/api/records/$REC"
KEY="SS-33 GPS Delayed Spoofer Injection (All PRNs Spoofed).bin"
URL="https://zenodo.org/api/records/$REC/files/SS-33%20GPS%20Delayed%20Spoofer%20Injection%20(All%20PRNs%20Spoofed).bin/content"
LOCAL="$DATA/SS-33.bin"
BYTES=39999912000
MD5=2320ab15af06dd66bfe459094e24381e
PREREG="docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION-E5-v3.md"
RESDIR="xval/bench-e/tuni2025"
NEED_GB=45

die() { echo "E5v3 STOP: $*" >&2; exit 1; }
sha256_of() { if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1; else shasum -a 256 "$1" | cut -d' ' -f1; fi; }
md5_of() { if command -v md5 >/dev/null 2>&1; then md5 -q "$1"; else md5sum "$1" | cut -d' ' -f1; fi; }
size_of() { stat -f%z "$1" 2>/dev/null || stat -c%s "$1"; }
free_gb() { df -Pk "$1" | awk 'NR==2 { printf "%d", $4 / 1048576 }'; }

# Zenodo's published list for the record must still match the pinned name, size and MD5.
zenodo_check() {
  curl -fsSL "$API" | python3 -I -c '
import json, sys
key, size, md5 = sys.argv[1], int(sys.argv[2]), sys.argv[3]
files = {f["key"]: f for f in json.load(sys.stdin)["files"]}
f = files.get(key)
if f is None:
    sys.exit("the recording is no longer listed on Zenodo record 17249727")
print("Zenodo lists:", f["key"], f["size"], f["checksum"])
if f["size"] != size or f["checksum"] != "md5:" + md5:
    sys.exit("Zenodo record changed since 16 Nov 2026: stop and tell the team")
' "$KEY" "$BYTES" "$MD5"
}

cmd_metadata() {
  # No download: prints every version of the release and the counts behind section 5 of the pre-registration.
  curl -fsSL "$API/versions?size=25" | python3 -I -c '
import json, sys
hits = json.load(sys.stdin)["hits"]["hits"]
seen = {}
for h in sorted(hits, key=lambda h: h["id"]):
    for f in h["files"]:
        if f["key"].endswith(".bin"):
            print(h["id"], f["size"], f["checksum"], f["key"])
            seen.setdefault(f["checksum"], []).append(h["id"])
print()
for md5, ids in seen.items():
    if len(ids) > 1:
        print("same bytes in records", ids, md5)
print("distinct recordings:", len(seen))
'
}

cmd_check() {
  for t in git curl python3 tar cargo rustup; do command -v "$t" >/dev/null || die "missing tool: $t"; done
  cd "$ROOT"
  rustup toolchain install "$(sed -n 's/^channel = "\(.*\)"/\1/p' rust-toolchain.toml)" --profile minimal -c rustfmt -c clippy >/dev/null
  echo "repository at $(git rev-parse HEAD) ($(git rev-parse --abbrev-ref HEAD))"
  echo "toolchain: $(rustup show active-toolchain)"
  rustup show active-toolchain | grep -q '^1\.93\.0' || die "active toolchain is not 1.93.0"
  grep -m1 '^\*\*Status:' "$PREREG" | grep -q 'APPROVED' || die "the E5 v3 pre-registration is not approved on this checkout"
  grep -q '"e5v3-windows"' src/bench/cli.rs || die "kshana bench e5v3-windows is not in this checkout yet"
  grep -q '"e5v3-score"' src/bench/cli.rs || die "kshana bench e5v3-score is not in this checkout yet"
  [ -f "$RESDIR/oracle_e5v3.py" ] || die "the independent oracle $RESDIR/oracle_e5v3.py is not committed yet"
  grep -q "$MD5" bench/manifests/b-iq.json || die "bench/manifests/b-iq.json does not pin the SS-33 MD5 yet"
  if git ls-files --error-unmatch "$RESDIR/E5v3-SCORE.json" >/dev/null 2>&1; then die "E5 v3 is already scored (scored once)"; fi
  [ ! -e "$OUT/.scored" ] || die "this computer already ran the score ($OUT/.scored); scored once"
  echo "check: OK"
}

cmd_data() {
  mkdir -p "$DATA" "$OUT"
  zenodo_check
  if [ -f "$LOCAL" ] && [ "$(size_of "$LOCAL")" = "$BYTES" ]; then
    echo "found $LOCAL with the right size; checking MD5"
  else
    [ "$(free_gb "$DATA")" -ge "$NEED_GB" ] || die "less than $NEED_GB GB free under $DATA"
    echo "downloading 40 GB from Zenodo (resumable: re-run this step after an interruption)"
    curl -fgL --retry 10 --retry-delay 30 -C - -o "$LOCAL.part" "$URL"
    mv "$LOCAL.part" "$LOCAL"
  fi
  [ "$(size_of "$LOCAL")" = "$BYTES" ] || die "size differs from $BYTES"
  got_md5="$(md5_of "$LOCAL")"
  [ "$got_md5" = "$MD5" ] || { rm -f "$LOCAL"; die "MD5 $got_md5 differs from Zenodo's $MD5 (file deleted)"; }
  got_sha="$(sha256_of "$LOCAL")"
  printf 'SS-33.bin\t%s\tmd5:%s\tsha256:%s\n' "$BYTES" "$got_md5" "$got_sha" > "$DATA/SS-33.verified"
  echo "data: OK"; cat "$DATA/SS-33.verified"
}

cmd_build() {
  cd "$ROOT"
  cargo build --release --locked --bin kshana
  echo "build: OK at $(git rev-parse HEAD)"
}

cmd_score() {
  cmd_check
  [ -f "$DATA/SS-33.verified" ] || die "run the data step first"
  grep -q "md5:$MD5" "$DATA/SS-33.verified" || die "the verified record does not carry the pinned MD5"
  [ "$(size_of "$LOCAL")" = "$BYTES" ] || die "the recording changed since it was verified"
  K="$ROOT/target/release/kshana"
  [ -x "$K" ] || die "run the build step first"
  mkdir -p "$OUT"; touch "$OUT/.scored"
  start="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  {
    "$K" bench e5v3-windows "$LOCAL" --out "$OUT/SS-33.bin.e5v3.json"
    "$K" bench e5v3-score "$OUT" --out "$OUT/E5v3-SCORE.json"
  } 2>&1 | tee "$OUT/e5v3_stdout.log"
  tar -czf "$OUT/e5v3-results.tgz" -C "$OUT" SS-33.bin.e5v3.json E5v3-SCORE.json
  {
    echo "=== E5 v3 run summary ==="
    echo "started_utc   $start"
    echo "finished_utc  $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo "repo_head     $(git -C "$ROOT" rev-parse HEAD)"
    echo "toolchain     $(rustup show active-toolchain)"
    echo "machine       $(sw_vers -productVersion 2>/dev/null || uname -sr) $(uname -m)"
    echo "data          $(cat "$DATA/SS-33.verified")"
    echo "archive       e5v3-results.tgz sha256 $(sha256_of "$OUT/e5v3-results.tgz")"
  } | tee -a "$OUT/e5v3_stdout.log"
  echo "score: done. Do not run score again."
}

cmd_send() {
  echo "Send back exactly these two things:"
  echo "  1. the file $OUT/e5v3-results.tgz (window scores and the score file; no IQ)"
  echo "  2. the output of: tail -n 60 $OUT/e5v3_stdout.log"
  echo "Nothing under $DATA leaves this computer."
}

case "${1:-}" in
  metadata) cmd_metadata ;; check) cmd_check ;; data) cmd_data ;; build) cmd_build ;; score) cmd_score ;; send) cmd_send ;;
  *) echo "usage: bash scripts/e5v3_mac_run.sh metadata|check|data|build|score|send" >&2; exit 2 ;;
esac
