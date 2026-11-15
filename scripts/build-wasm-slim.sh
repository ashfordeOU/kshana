#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Build the feature-limited WebAssembly module (`--features wasm-slim`, src/wasm_slim.rs): version,
# run and export_sp3 over the four kinds Arksa calls (constellation-design, gnss-sim, orbit, pvt),
# optimised for size, then print its size and digests and check it against the size limit.
#
#   ./scripts/build-wasm-slim.sh [out-dir]          default: target/wasm-slim/pkg
#
# Deterministic from the source tree: the compiler is the one rust-toolchain.toml pins, the
# dependencies the ones Cargo.lock pins (--locked), wasm-pack and binaryen are checked at exact
# versions, every path that would be embedded (panic locations) is remapped to a fixed prefix,
# and the release profile has one codegen unit. Two builds of one commit give the same bytes,
# wherever the checkout is.
#
# Needs: the rust-toolchain.toml toolchain with the wasm32-unknown-unknown target, wasm-pack
# 0.13.1, wasm-opt from binaryen version_117 (the release wasm-pack 0.13.1 uses) on PATH or in
# $WASM_OPT, and python3 (sizes and digests).
#
# Environment:
#   KSHANA_SLIM_GZIP_LIMIT_KB  size limit, gzip level 9, kB of 1024 bytes (default 2800: Arksa's
#                              WebAssembly budget, measured the way its bundle report measures it)
#   WASM_OPT                   the wasm-opt binary (default: wasm-opt on PATH)
#
# It publishes nothing.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"
out="${1:-target/wasm-slim/pkg}"
limit_kb="${KSHANA_SLIM_GZIP_LIMIT_KB:-2800}"
wasm_opt="${WASM_OPT:-wasm-opt}"

want_pack="wasm-pack 0.13.1"
want_opt="wasm-opt version 117"
have_pack="$(wasm-pack --version 2>/dev/null || true)"
have_opt="$("$wasm_opt" --version 2>/dev/null || true)"
[ "$have_pack" = "$want_pack" ] || { echo "need $want_pack, found: ${have_pack:-none}" >&2; exit 1; }
case "$have_opt" in "$want_opt"*) ;; *) echo "need $want_opt (binaryen version_117), found: ${have_opt:-none}" >&2; exit 1 ;; esac

cargo_home="${CARGO_HOME:-$HOME/.cargo}"
rustup_home="${RUSTUP_HOME:-$HOME/.rustup}"
# Embedded source paths name the crate and its dependencies, not the machine they were built on.
export RUSTFLAGS="--remap-path-prefix=$root=/kshana --remap-path-prefix=$cargo_home=/cargo --remap-path-prefix=$rustup_home=/rustup"
export CARGO_INCREMENTAL=0
export SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-1700000000}"

echo "Building the feature-limited WebAssembly module (wasm-slim)…"
rm -rf "$out"
# --no-opt: wasm-pack would run wasm-opt -O from a download; the size pass below is -Oz with the
# pinned binaryen instead.
wasm-pack build --target web --out-dir "$out" --out-name kshana --release --no-opt --no-pack \
  -- --locked --features wasm-slim
# --no-pack leaves out package.json and the README; the module is kshana.js + kshana_bg.wasm (+ .d.ts).
rm -f "$out/.gitignore"

echo "Optimising for size (wasm-opt -Oz)…"
"$wasm_opt" -Oz \
  --enable-bulk-memory --enable-nontrapping-float-to-int --enable-sign-ext --enable-mutable-globals \
  --enable-multivalue --enable-reference-types \
  "$out/kshana_bg.wasm" -o "$out/kshana_bg.opt.wasm"
mv "$out/kshana_bg.opt.wasm" "$out/kshana_bg.wasm"

python3 - "$out" "$limit_kb" <<'PY'
import base64, gzip, hashlib, os, sys
out, limit_kb = sys.argv[1], float(sys.argv[2])
names = sorted(f for f in os.listdir(out) if os.path.isfile(os.path.join(out, f)))
lines = []
for name in names:
    data = open(os.path.join(out, name), "rb").read()
    lines.append(f"{hashlib.sha256(data).hexdigest()}  {name}")
open(os.path.join(out, "SHA256SUMS"), "w").write("\n".join(lines) + "\n")
wasm = open(os.path.join(out, "kshana_bg.wasm"), "rb").read()
gz = len(gzip.compress(wasm, 9, mtime=0))
sha512 = hashlib.sha512(wasm)
print(f"kshana_bg.wasm raw     {len(wasm):,} bytes")
print(f"kshana_bg.wasm gzip-9  {gz:,} bytes = {gz / 1024:,.1f} kB (limit {limit_kb:,.0f} kB)")
print(f"SHA-256  {hashlib.sha256(wasm).hexdigest()}")
print(f"SHA-512  {sha512.hexdigest()}")
print(f"SRI      sha512-{base64.b64encode(sha512.digest()).decode()}")
print(f"files    {out}/SHA256SUMS")
for l in lines:
    print(f"         {l}")
if gz / 1024 > limit_kb:
    sys.exit(f"FAIL: {gz / 1024:,.1f} kB gzip is over the {limit_kb:,.0f} kB limit")
print("OK: under the size limit")
PY
