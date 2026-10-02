#!/usr/bin/env bash
# Oracle toolchain of package D8 (one validated propagation, frame and time path):
# Orekit 13.1.8 with Hipparchus 4.0.3, a data directory holding only the leap-second table
# (so no Earth orientation parameters are loaded), and a Python environment with the pinned
# numpy, pyerfa and python-sgp4. Everything lands under ~/Code/kshana-oracles, outside the
# checkout, and an env13.sh there exports what the fixture generators read:
#   OREKIT13_CP, OREKIT13_DATA_NO_EOP, ORACLE13_PY.
#
#   bash xval/d8-orekit13/setup.sh && source ~/Code/kshana-oracles/env13.sh
#
# Maven Central is reached through its storage mirror (repo1 rate-limits); every jar is
# checked against the .sha1 Maven Central publishes beside it. Idempotent.
set -euo pipefail
ROOT="$HOME/Code/kshana-oracles"
OK="$ROOT/orekit13"
M=https://maven-central.storage-download.googleapis.com/maven2
mkdir -p "$OK/jars" "$OK/data-no-eop"
get() { # get <group path> <artifact> <version>
  local f="$2-$3.jar"
  [ -s "$OK/jars/$f" ] || curl -fsSL --retry 5 --retry-delay 5 -o "$OK/jars/$f" "$M/$1/$2/$3/$f"
  local want have
  want="$(curl -fsSL --retry 5 "$M/$1/$2/$3/$f.sha1" | cut -c1-40)"
  have="$(sha1sum "$OK/jars/$f" | cut -c1-40)"
  [ "$want" = "$have" ] || { echo "SHA-1 mismatch: $f" >&2; exit 1; }
  echo "sha1 ok $f"
}
get org/orekit orekit 13.1.8
for m in core geometry ode fitting optim filtering stat; do
  get org/hipparchus "hipparchus-$m" 4.0.3
done
if [ ! -s "$OK/data-no-eop/tai-utc.dat" ]; then
  [ -s "$OK/orekit-data-main.zip" ] || curl -fsSL --retry 5 -o "$OK/orekit-data-main.zip" \
    https://gitlab.orekit.org/orekit/orekit-data/-/archive/main/orekit-data-main.zip
  unzip -q -o -j "$OK/orekit-data-main.zip" 'orekit-data-main/tai-utc.dat' -d "$OK/data-no-eop"
fi
sha256sum "$OK/data-no-eop/tai-utc.dat"
VENV="$ROOT/.venv13"
[ -x "$VENV/bin/python" ] || python3 -m venv "$VENV"
"$VENV/bin/pip" install -q numpy==2.4.6 pyerfa==2.0.1.5 sgp4==2.24
cat > "$ROOT/env13.sh" <<ENV
# source this: package D8 oracle toolchain
export OREKIT13_CP="\$(ls "$OK"/jars/*.jar | tr '\n' ':')"
export OREKIT13_DATA_NO_EOP="$OK/data-no-eop"
export ORACLE13_PY="$VENV/bin/python"
ENV
echo "done: source $ROOT/env13.sh"
