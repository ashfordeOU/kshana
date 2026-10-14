#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Compile and run the ADM oracle driver (Orekit 13.1.8 + Hipparchus 4.0.3).
#
# usage: bash xval/adm-orekit/run.sh write <inputs.txt> <outdir>
#        bash xval/adm-orekit/run.sh read  <dir> <dump.txt>
#
# Environment:
#   ORACLE_ENV   script exporting OREKIT13_CP and OREKIT13_DATA_NO_EOP
#                (default $HOME/Code/kshana-oracles/env13.sh)
#   ADM_CLASSES  directory for the compiled classes (default under $TMPDIR or /tmp)
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
env_script="${ORACLE_ENV:-$HOME/Code/kshana-oracles/env13.sh}"
# shellcheck disable=SC1090
source "$env_script"
: "${OREKIT13_CP:?OREKIT13_CP not set by $env_script}"
: "${OREKIT13_DATA_NO_EOP:?OREKIT13_DATA_NO_EOP not set by $env_script}"
export OREKIT13_DATA_NO_EOP

classes="${ADM_CLASSES:-${TMPDIR:-/tmp}/kshana-adm-orekit-classes}"
mkdir -p "$classes"
javac -nowarn -encoding UTF-8 -d "$classes" -cp "$OREKIT13_CP" "$here/AdmOracle.java"
exec java -cp "$classes:$OREKIT13_CP" AdmOracle "$@"
