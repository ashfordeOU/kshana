#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Run gLAB and RTKLIB on the WTZR inputs of tests/fixtures/gnss_wettzell_2025055 and write the
# oracle CSVs (sod,x,y,z; ECEF metres) the parity test reads. See PREREGISTRATION.md.
#   RTKLIB=<clone at v2.4.2-p13 with app/rnx2rtkp/gcc built>  GLAB=<path to gLAB_linux 6.0.0>  bash run.sh
# Either tool may be omitted; its files are then not written.
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FX="$HERE/../../tests/fixtures/gnss_wettzell_2025055"
OUT="$FX/oracle"; mkdir -p "$OUT"
OBS="$FX/wtzr_2025055_0006_G.rnx"; SP3="$FX/../sp3_clock_igs_oracle/igs_2025055_G.sp3"
CLK="$FX/igs_2025055_G_05m_0006.clk"; ATX="$FX/igs20_2025055_G_LEIAR25.atx"
NAV="$FX/brdc_2025055_G_0008.rnx"   # RTKLIB needs it for transmit times (Amendment 1)
{ echo "# Oracle run record"; date -u; sha256sum "$OBS" "$NAV" "$SP3" "$CLK" "$ATX"; } > "$OUT/RUN.md"
if [ -n "${RTKLIB:-}" ]; then
  [ "$(git -C "$RTKLIB" rev-parse HEAD)" = 71db0ffa0d9735697c6adfd06fdf766d0e5ce807 ] || { echo "RTKLIB is not v2.4.2-p13"; exit 1; }
  BIN="$RTKLIB/app/rnx2rtkp/gcc/rnx2rtkp"
  cd "$HERE"
  for m in ppp spp; do
    "$BIN" -k "rtklib_$m.conf" -o "$OUT/rtklib_$m.pos" "$OBS" "$NAV" "$SP3" "$CLK"
    # .pos xyz rows: "yyyy/mm/dd hh:mm:ss.sss x y z Q ns ..."
    awk '!/^%/ { split($2,t,":"); printf "%.3f,%s,%s,%s\n", t[1]*3600+t[2]*60+t[3], $3, $4, $5 }' \
      "$OUT/rtklib_$m.pos" > "$OUT/rtklib_$m.csv"
  done
  echo "RTKLIB v2.4.2-p13 71db0ffa" >> "$OUT/RUN.md"
fi
if [ -n "${GLAB:-}" ]; then
  COMMON=(-input:obs "$OBS" -input:orb "$SP3" -input:clk "$CLK" -input:ant "$ATX"
          -pre:elevation 10 -pre:dec 30 -model:recphasecenter ANTEX -pre:availf G12
          -print:none -print:output)
  "$GLAB" "${COMMON[@]}" -filter:trop -filter:phase -filter:static > "$OUT/glab_ppp.out"
  "$GLAB" "${COMMON[@]}" -filter:nophase -filter:kinematic > "$OUT/glab_spp.out"
  # gLAB OUTPUT messages: field 4 is the second of day and fields 6-8 the estimated X, Y, Z
  # (gLAB -messages, "OUTPUT"). The parity test rejects a file whose positions are not within
  # 100 m of the station, which catches a column mismatch.
  for m in ppp spp; do
    awk '$1=="OUTPUT" { printf "%s,%s,%s,%s\n", $4, $6, $7, $8 }' "$OUT/glab_$m.out" > "$OUT/glab_$m.csv"
  done
  "$GLAB" -v >> "$OUT/RUN.md" 2>&1 || true
fi
sha256sum "$OUT"/*.csv >> "$OUT/RUN.md" 2>/dev/null || true
