#!/usr/bin/env bash
# Recreate the Kshana oracle toolchain and public datasets from nothing.
#
#   ~/Code/kshana-oracles/setup.sh [--no-data] [--no-xval] [--kshana <worktree>]
#
# Idempotent: every step skips work that is already done, so a re-run only fills gaps.
# Kept in the repository under xval/oracles/; copy the folder to ~/Code/kshana-oracles and run it
# there, so the downloads and builds stay outside the checkout:
#   mkdir -p ~/Code/kshana-oracles && cp -r xval/oracles/. ~/Code/kshana-oracles/ && bash ~/Code/kshana-oracles/setup.sh --kshana "$PWD"
# CPU-light by design: every build and install runs under `nice -n 15` with
# CARGO_BUILD_JOBS=3, because the release gate may be running on the same machine.
#
# Result: see README.md. The dataset manifest is written to data/MANIFEST.tsv and
# data/MANIFEST.md; a per-step log to logs/setup-<date>.log.
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KSHANA="${KSHANA:-$HOME/Code/kshana}"
DO_DATA=1
DO_XVAL=1
while [ $# -gt 0 ]; do
  case "$1" in
    --no-data) DO_DATA=0 ;;
    --no-xval) DO_XVAL=0 ;;
    --kshana) shift; KSHANA="$1" ;;
    *) echo "unknown option: $1" >&2; exit 2 ;;
  esac
  shift
done

export CARGO_BUILD_JOBS=3
NICE="nice -n 15"
mkdir -p "$ROOT/logs" "$ROOT/data" "$ROOT/build"
LOG="$ROOT/logs/setup-$(date -u +%Y%m%dT%H%M%SZ).log"
exec > >(tee -a "$LOG") 2>&1
FAILS=()
step() { printf '\n==== %s\n' "$*"; }
fail() { echo "FAIL: $*"; FAILS+=("$*"); }

fetch() { # fetch <url> <dest>; resumable, retried, never overwrites a complete file
  local url="$1" dest="$2"
  [ -s "$dest" ] && return 0
  mkdir -p "$(dirname "$dest")"
  if $NICE curl -fL --retry 3 --retry-delay 5 --connect-timeout 30 -m 3600 \
       -A "kshana-oracles-setup/1 (+https://kshana.dev)" -C - -o "$dest.part" "$url"; then
    mv "$dest.part" "$dest"
  else
    rm -f "$dest.part"; return 1
  fi
}

# ── 1. Java runtime ────────────────────────────────────────────────────────────
step "1. Java runtime check"
if command -v java >/dev/null && command -v javac >/dev/null; then
  JV="$(java -version 2>&1 | head -1)"
  echo "java: $JV"
  java -version 2>&1 | grep -qE '"(1[7-9]|2[0-9])' || fail "Java >= 17 needed for Orekit 12.2 (found: $JV)"
else
  fail "java/javac not on PATH (install a JDK >= 17, e.g. Temurin 21)"
fi

# ── 2. Orekit 12.2 + Hipparchus 3.1 (the versions the committed fixtures name) ─
step "2. Orekit 12.2 + Hipparchus 3.1 + orekit-data"
OK_DIR="$ROOT/orekit"
mkdir -p "$OK_DIR/jars"
MVN=https://repo1.maven.org/maven2
fetch "$MVN/org/orekit/orekit/12.2/orekit-12.2.jar" "$OK_DIR/jars/orekit-12.2.jar" || fail "orekit-12.2.jar"
for m in core geometry ode fitting optim filtering stat; do
  fetch "$MVN/org/hipparchus/hipparchus-$m/3.1/hipparchus-$m-3.1.jar" \
        "$OK_DIR/jars/hipparchus-$m-3.1.jar" || fail "hipparchus-$m-3.1.jar"
done
# Maven Central publishes a .sha1 beside each jar: verify it.
for j in "$OK_DIR"/jars/*.jar; do
  b="$(basename "$j")"; a="${b%-*}"; v="${b##*-}"; v="${v%.jar}"
  case "$a" in orekit) g=org/orekit;; *) g=org/hipparchus;; esac
  want="$(curl -fsL -m 60 "$MVN/$g/$a/$v/$b.sha1" | cut -c1-40)"
  have="$(shasum -a 1 "$j" | cut -c1-40)"
  [ -n "$want" ] && [ "$want" = "$have" ] && echo "sha1 ok  $b" || fail "sha1 mismatch or unavailable: $b"
done
if [ ! -d "$OK_DIR/orekit-data-main" ]; then
  fetch "https://gitlab.orekit.org/orekit/orekit-data/-/archive/main/orekit-data-main.zip" \
        "$OK_DIR/orekit-data-main.zip" && (cd "$OK_DIR" && unzip -q orekit-data-main.zip) \
    || fail "orekit-data-main"
fi
cat > "$OK_DIR/cp.sh" <<EOF
# source this: exports the Orekit classpath and data directory the fixture drivers expect
export OREKIT_HOME="$OK_DIR"
export OREKIT_CP="\$(ls "$OK_DIR"/jars/*.jar | tr '\n' ':')"
export OREKIT_DATA="$OK_DIR/orekit-data-main"
EOF
mkdir -p "$ROOT/gg_torque"
# Smoke test: compile and run a two-line Orekit program against the data directory.
if command -v javac >/dev/null; then
  SMOKE="$ROOT/build/orekit-smoke"; mkdir -p "$SMOKE"
  cat > "$SMOKE/Smoke.java" <<'EOF'
import org.orekit.data.*; import org.orekit.time.*; import java.io.File;
public class Smoke { public static void main(String[] a) {
  DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
  System.out.println("orekit ok: " + new AbsoluteDate(2026, 9, 30, TimeScalesFactory.getUTC())); } }
EOF
  ( . "$OK_DIR/cp.sh" && cd "$SMOKE" && $NICE javac -cp "$OREKIT_CP" Smoke.java && java -cp "$OREKIT_CP:." Smoke ) \
    || fail "Orekit smoke test"
fi

# ── 3. Python virtual environment ─────────────────────────────────────────────
step "3. Python 3.12 virtual environment (gnss_lib_py 1.0.4 needs Python < 3.13)"
VENV="$ROOT/.venv"
if command -v uv >/dev/null; then
  [ -x "$VENV/bin/python" ] || $NICE uv venv --python 3.12 "$VENV" || fail "uv venv"
  if [ ! -s "$ROOT/requirements.lock" ]; then
    $NICE uv pip compile --python 3.12 "$ROOT/requirements.in" -o "$ROOT/requirements.lock" || fail "uv pip compile"
  fi
  $NICE uv pip install --python "$VENV/bin/python" -r "$ROOT/requirements.lock" || fail "uv pip install"
else
  PY312="$(command -v python3.12 || true)"
  [ -n "$PY312" ] || fail "neither uv nor python3.12 found"
  [ -x "$VENV/bin/python" ] || $NICE "$PY312" -m venv "$VENV"
  $NICE "$VENV/bin/pip" install -r "$ROOT/requirements.lock" || fail "pip install"
fi
"$VENV/bin/python" - <<'EOF' || fail "python import check"
import importlib, sys
mods = ["numpy","scipy","allantools","gnss_lib_py","skyfield","sgp4","spiceypy","pymsis","sigmf",
        "filterpy","sklearn","lamberthub","pymcdm","oem","ppigrf","astropy","erfa","jplephem","h5py",
        "pandas","openpyxl","georinex","jsonschema","spacepackets","Basilisk"]
bad = []
for m in mods:
    try:
        mod = importlib.import_module(m); print(f"  {m:12s} {getattr(mod, '__version__', '?')}")
    except Exception as e:
        bad.append(f"{m}: {e}")
if bad:
    print("import failures:", *bad, sep="\n  "); sys.exit(1)
EOF
"$VENV/bin/python" -m pip --version >/dev/null 2>&1 || true
"$VENV/bin/python" -c "import sys; print('python', sys.version.split()[0])"
( cd "$ROOT" && uv pip freeze --python "$VENV/bin/python" > requirements.frozen.txt 2>/dev/null ) || true

# ── 4. RTKLIB v2.4.2-p13 (commit 71db0ff) and NaveGo v1.4 ─────────────────────
step "4. RTKLIB v2.4.2-p13 + NaveGo v1.4"
if [ ! -d "$ROOT/RTKLIB/.git" ]; then
  $NICE git clone -q https://github.com/tomojitakasu/RTKLIB "$ROOT/RTKLIB" || fail "RTKLIB clone"
fi
git -C "$ROOT/RTKLIB" -c advice.detachedHead=false checkout -q v2.4.2-p13 2>/dev/null || fail "RTKLIB checkout v2.4.2-p13"
echo "RTKLIB at $(git -C "$ROOT/RTKLIB" rev-parse --short HEAD 2>/dev/null)"
RNX="$ROOT/RTKLIB/app/rnx2rtkp/gcc"
[ -d "$RNX" ] || RNX="$ROOT/RTKLIB/app/consapp/rnx2rtkp/gcc"
if [ ! -x "$RNX/rnx2rtkp" ] && [ -d "$RNX" ]; then
  # The upstream makefile uses -ansi (hides strtok_r, which clang then rejects) and links
  # -lrt (absent on macOS): override both, keep its OPTS.
  ( cd "$RNX" && $NICE make -j3 \
      CFLAGS='-std=gnu99 -O2 -w -D_DARWIN_C_SOURCE -I../../../src -DTRACE -DENAGLO -DENAQZS -DENAGAL -DNFREQ=3' \
      LDLIBS='-lm' >/dev/null ) || fail "rnx2rtkp build"
fi
[ -x "$RNX/rnx2rtkp" ] && echo "rnx2rtkp built: $RNX/rnx2rtkp"
if [ ! -d "$ROOT/NaveGo/.git" ]; then
  $NICE git clone -q https://github.com/rodralez/NaveGo "$ROOT/NaveGo" || fail "NaveGo clone"
fi
git -C "$ROOT/NaveGo" -c advice.detachedHead=false checkout -q v1.4 2>/dev/null || fail "NaveGo checkout v1.4"
command -v octave >/dev/null && echo "octave: $(octave --version 2>/dev/null | head -1)" || echo "octave not found (NaveGo drivers need it)"

# ── 4b. GMAT R2026a (Apache-2.0) and GNSS-SDR 0.0.19 (GPL-3.0): run-only oracle tools ──
# Founder decision 5 (2026-10-01): installed as run-only tools, outside every release gate.
step "4b. GMAT R2026a + GNSS-SDR"
GMAT_SHA=fe124b4a606b2e3b704a6fbb1c37b87598d5df0d18cb661c304b5f60074a7754
if [ ! -x "$ROOT/tools/gmat/GMAT/R2026a/bin/GmatConsole" ]; then
  mkdir -p "$ROOT/tools/gmat"
  fetch "https://sourceforge.net/projects/gmat/files/GMAT/GMAT-R2026a/gmat-ubuntu-x64-R2026a.tar.gz/download" "$ROOT/tools/gmat/gmat.tar.gz"
  echo "$GMAT_SHA  $ROOT/tools/gmat/gmat.tar.gz" | sha256sum -c - >/dev/null || fail "GMAT tarball SHA-256"
  nice -n 15 tar -xzf "$ROOT/tools/gmat/gmat.tar.gz" -C "$ROOT/tools/gmat" && rm -f "$ROOT/tools/gmat/gmat.tar.gz"
fi
[ -x "$ROOT/tools/gmat/GMAT/R2026a/bin/GmatConsole" ] && echo "GMAT R2026a at tools/gmat/GMAT/R2026a" || fail "GMAT install"
if ! command -v gnss-sdr >/dev/null; then
  if command -v apt-get >/dev/null; then nice -n 15 sudo apt-get install -y --no-install-recommends gnss-sdr || fail "gnss-sdr apt install"
  elif command -v brew >/dev/null; then nice -n 15 brew install gnss-sdr || fail "gnss-sdr brew install"
  else fail "gnss-sdr: no package manager"; fi
fi
command -v gnss-sdr >/dev/null && echo "gnss-sdr: $(gnss-sdr --version 2>&1 | tail -1)"

# ── 5. Public datasets ────────────────────────────────────────────────────────
if [ "$DO_DATA" = 1 ]; then
  step "5. Public datasets (sources.tsv + generated series)"
  D="$ROOT/data"
  META="$D/.meta"; mkdir -p "$META"
  getone() { # id dest url licence rows mutable
    local id="$1" dest="$2" url="$3"
    if [ -s "$D/$dest" ]; then echo "have  $dest"; return 0; fi
    if fetch "$url" "$D/$dest"; then
      date -u +%Y-%m-%d > "$META/$id.date"; echo "got   $dest"
    else
      fail "dataset $id ($url)"; echo "$(date -u +%Y-%m-%d) FAILED" > "$META/$id.failed"
    fi
  }
  while IFS=$'\t' read -r id dest url lic rows mut; do
    case "$id" in ''|\#*) continue;; esac
    getone "$id" "$dest" "$url"
  done < "$ROOT/sources.tsv"

  # IERS Bulletin A weekly vintages, volumes XXXVI (2023) to XXXIX (2026): the archived
  # predictions M034/M073 score against later finals.
  GEN="$ROOT/sources.generated.tsv"; : > "$GEN"
  for vol in xxxvi xxxvii xxxviii xxxix; do
    for n in $(seq -w 1 53); do
      n3="$(printf %03d "$((10#$n))")"
      id="iers-bulla-$vol-$n3"; dest="iers/bulletinA/bulletina-$vol-$n3.txt"
      url="https://datacenter.iers.org/data/6/bulletina-$vol-$n3.txt"
      if [ ! -s "$D/$dest" ] && [ ! -e "$META/$id.absent" ]; then
        if fetch "$url" "$D/$dest"; then date -u +%Y-%m-%d > "$META/$id.date"
        else touch "$META/$id.absent"; fi   # future weeks / week 53 do not exist: not a failure
      fi
      [ -s "$D/$dest" ] && printf '%s\t%s\t%s\t%s\t%s\t0\n' "$id" "$dest" "$url" \
        "IERS products, free use with citation" "M034 M073" >> "$GEN"
    done
  done
  # BIPM Circular T 405-464 (about five years) and the per-laboratory UTC-UTC(k) series.
  for n in $(seq 405 470); do
    id="bipm-cirt-$n"; dest="bipm/circular-t/cirt.$n"
    url="https://webtai.bipm.org/ftp/pub/tai/Circular-T/cirt/cirt.$n"
    if [ ! -s "$D/$dest" ] && [ ! -e "$META/$id.absent" ]; then
      if fetch "$url" "$D/$dest"; then date -u +%Y-%m-%d > "$META/$id.date"; else touch "$META/$id.absent"; fi
    fi
    [ -s "$D/$dest" ] && printf '%s\t%s\t%s\t%s\t%s\t0\n' "$id" "$dest" "$url" \
      "BIPM, free use with citation" "M003 M083" >> "$GEN"
  done
  LABS="$(curl -fsL -m 60 https://webtai.bipm.org/ftp/pub/tai/other-products/utclab/ \
          | grep -oE 'href="utc-[a-z0-9-]+"' | sed 's/href="//;s/"//' | sort -u)"
  [ -n "$LABS" ] || fail "BIPM utclab listing"
  for f in $LABS; do
    id="bipm-utclab-$f"; dest="bipm/utclab/$f"
    url="https://webtai.bipm.org/ftp/pub/tai/other-products/utclab/$f"
    [ -s "$D/$dest" ] || { fetch "$url" "$D/$dest" && date -u +%Y-%m-%d > "$META/$id.date"; } || fail "dataset $id"
    [ -s "$D/$dest" ] && printf '%s\t%s\t%s\t%s\t%s\t1\n' "$id" "$dest" "$url" \
      "BIPM, free use with citation" "M083" >> "$GEN"
  done

  # Real-data records the repository's own fetch scripts produce (the caesium, OCXO and
  # PHASE.DAT records pinned by SHA-256 in scripts/fetch_*.sh, and 14 days of IGS final
  # clocks). BKG keeps only recent IGS weeks, so an existing cache is copied rather than
  # re-fetched; the fetch scripts run only when no cache exists.
  CACHE="${KSHANA_REALDATA_CACHE:-$HOME/Code/kshana/realdata-cache}"
  for r in cs5071a ocxo phasedat igs; do
    if [ ! -d "$D/realdata/$r" ] || [ -z "$(ls -A "$D/realdata/$r" 2>/dev/null)" ]; then
      mkdir -p "$D/realdata/$r"
      if [ -d "$CACHE/$r" ]; then cp -Rp "$CACHE/$r/." "$D/realdata/$r/"
      elif [ -x "$KSHANA/scripts/fetch_$r.sh" ] || [ -f "$KSHANA/scripts/fetch_$r.sh" ]; then
        bash "$KSHANA/scripts/fetch_$r.sh" "$D/realdata/$r" || fail "realdata $r"
      elif [ "$r" = igs ] && [ -f "$KSHANA/scripts/fetch_igs_clocks.sh" ]; then
        bash "$KSHANA/scripts/fetch_igs_clocks.sh" "$D/realdata/$r" || fail "realdata $r"
      else fail "realdata $r: no cache and no fetch script"; fi
    fi
    for f in "$D/realdata/$r"/*; do
      [ -f "$f" ] || continue
      b="$(basename "$f")"
      case "$r" in igs) lic="IGS products, open with attribution"; url="https://igs.bkg.bund.de/root_ftp/IGS/products/";;
                   *) lic="allantools test data (A. Wallin), no explicit redistribution licence: git-ignored in the repo";
                      url="https://github.com/aewallin/allantools/tree/master/tests";; esac
      printf '%s\t%s\t%s\t%s\t%s\t0\n' "realdata-$r-$b" "realdata/$r/$b" "$url" "$lic" \
        "M002 M102 (and the existing data-gated rows)" >> "$GEN"
    done
  done

  # Unpack what the per-row agents read directly (archives stay beside them).
  [ -s "$D/navcen/GPS_IIR_IIR-M_LM.zip" ] && [ ! -d "$D/navcen/GPS_IIR_IIR-M_LM" ] && \
    (cd "$D/navcen" && mkdir -p GPS_IIR_IIR-M_LM && unzip -q -o GPS_IIR_IIR-M_LM.zip -d GPS_IIR_IIR-M_LM)
  [ -s "$D/sigmf/SigMF-v1.2.6.tar.gz" ] && [ ! -d "$D/sigmf/SigMF-1.2.6" ] && \
    (cd "$D/sigmf" && tar xzf SigMF-v1.2.6.tar.gz)
  [ -s "$D/sigmf/sigmf-python-v1.13.0.tar.gz" ] && [ ! -d "$D/sigmf/sigmf-python-1.13.0" ] && \
    (cd "$D/sigmf" && tar xzf sigmf-python-v1.13.0.tar.gz)
  [ -s "$D/lugre/LuGRE.zip" ] && [ ! -e "$D/lugre/.listed" ] && \
    (cd "$D/lugre" && unzip -l LuGRE.zip > LuGRE.contents.txt && touch .listed)
  [ -s "$D/jammertest2024/GNSS_DATASET_JAMMING_SPOOFING.tar.gz" ] && [ ! -e "$D/jammertest2024/.listed" ] && \
    (cd "$D/jammertest2024" && tar tzf GNSS_DATASET_JAMMING_SPOOFING.tar.gz > contents.txt && touch .listed)

  # Manifest: one row per file on disk, from sources.tsv + the generated series.
  step "5b. Writing data/MANIFEST.tsv and data/MANIFEST.md"
  "$VENV/bin/python" "$ROOT/tools/manifest.py" "$ROOT" || fail "manifest"
fi

# ── 6. xval ANISE crates (built from the Kshana worktree, target dir kept here) ─
if [ "$DO_XVAL" = 1 ]; then
  step "6. xval/ ANISE crates (CARGO_BUILD_JOBS=3, nice 15)"
  if [ -d "$KSHANA/xval" ]; then
    # The committed xval Cargo.lock files pin an old kshana version, so a --locked build
    # fails and an unlocked one would rewrite files in the worktree. Build a copy instead:
    # each crate is copied to build/xval-src/xval/, its `kshana = { path = "../.." }` pointed at
    # the worktree, and resolved there; the lock cargo writes stays in the copy.
    export CARGO_TARGET_DIR="$ROOT/build/xval-target"
    for c in anise-frames anise-lunar-od anise-mars-od anise-service-geometry; do
      [ -f "$KSHANA/xval/$c/Cargo.toml" ] || continue
      # Mirror the repo layout so the crates' relative include_str! paths into tests/ resolve.
      mkdir -p "$ROOT/build/xval-src/xval"; ln -sfn "$KSHANA/tests" "$ROOT/build/xval-src/tests"
      dst="$ROOT/build/xval-src/xval/$c"; mkdir -p "$dst"
      rsync -a --delete --exclude target --exclude kernels "$KSHANA/xval/$c/" "$dst/"
      sed -i '' "s#path = \"\.\./\.\.\"#path = \"$KSHANA\"#" "$dst/Cargo.toml"
      ( cd "$dst" && $NICE cargo build --release -q && $NICE cargo test --release --no-run -q ) \
        && echo "built xval/$c (copy at $dst)" || fail "xval/$c build"
    done
  else
    fail "Kshana worktree not found at $KSHANA (pass --kshana <path>)"
  fi
fi

# ── 7. Environment file ───────────────────────────────────────────────────────
step "7. env.sh"
cat > "$ROOT/env.sh" <<EOF
# source ~/Code/kshana-oracles/env.sh — every path a fixture generator or xval crate reads
export KSHANA_ORACLES="$ROOT"
. "$ROOT/orekit/cp.sh"
export RTKLIB="$ROOT/RTKLIB"
export NAVEGO="$ROOT/NaveGo"
export ORACLE_PY="$ROOT/.venv/bin/python"
export KSHANA_ANISE_BPC="$ROOT/data/naif/earth_latest_high_prec.bpc"
export KSHANA_ANISE_DE440S="$ROOT/data/naif/de440s.bsp"
export KSHANA_ANISE_DE="$ROOT/data/naif/de440s.bsp"
export KSHANA_ANISE_MOON_PA="$ROOT/data/naif/moon_pa_de440_200625.bpc"
export CARGO_TARGET_DIR_XVAL="$ROOT/build/xval-target"
export KSHANA_GMAT="$ROOT/tools/gmat/GMAT/R2026a/bin/GmatConsole"
EOF
# The committed fixture generators still name /tmp/kshana-oracles; point it here so
# they run unchanged. The link is recreated on every run; nothing lives in /tmp.
ln -sfn "$ROOT" /tmp/kshana-oracles 2>/dev/null && echo "/tmp/kshana-oracles -> $ROOT" || true
mkdir -p "$ROOT/kernels"
for k in de440s.bsp moon_pa_de440_200625.bpc naif0012.tls pck00011.tpc gm_de440.tpc moon_de440_250416.tf; do
  [ -e "$ROOT/data/naif/$k" ] && ln -sfn "../data/naif/$k" "$ROOT/kernels/$k"
done

step "Summary"
if [ ${#FAILS[@]} -eq 0 ]; then
  echo "setup complete, no failures. Log: $LOG"
else
  echo "setup finished with ${#FAILS[@]} failure(s):"; printf '  - %s\n' "${FAILS[@]}"
  echo "Log: $LOG"
fi
# A failed optional dataset must not hide the toolchain result: exit 0 only when clean.
[ ${#FAILS[@]} -eq 0 ]
