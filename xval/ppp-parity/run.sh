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
{ echo; echo "# Oracle run record"; date -u; sha256sum "$OBS" "$NAV" "$SP3" "$CLK" "$ATX"; } >> "$OUT/RUN.md"
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
  # Amendment 4: gLAB 6.0.0 options and OUTPUT columns from `gLAB_linux -help` / `-messages`.
  COMMON=(-input:obs "$OBS" -input:orb "$SP3" -input:clk "$CLK" -input:ant "$ATX"
          -pre:elevation 10 -pre:dec 30 -pre:availf G12
          -model:recphasecenter ANTEX -model:arp RINEX -model:solidtides -model:relpath
          --model:satphasevar -print:none -print:output)
  "$GLAB" "${COMMON[@]}" -filter:meastype carrierphase -filter:nav static -filter:trop > "$OUT/glab_ppp.out"
  "$GLAB" "${COMMON[@]}" -filter:meastype pseudorange -filter:nav kinematic -filter:combtype dualfreq > "$OUT/glab_spp.out"
  # OUTPUT message: field 4 second of day, fields 12-14 the estimated X, Y, Z (m).
  for m in ppp spp; do
    awk '$1=="OUTPUT" { printf "%s,%s,%s,%s\n", $4, $12, $13, $14 }' "$OUT/glab_$m.out" > "$OUT/glab_$m.csv"
  done
  { echo "gLAB 6.0.0 Linux sha256 046ab9fd269eda066bb774fe74d24ca2d38d8b7d8e6d372d887364a3403921dd"; "$GLAB" -v 2>&1 | head -1; } >> "$OUT/RUN.md" || true
fi
sha256sum "$OUT"/*.csv >> "$OUT/RUN.md" 2>/dev/null || true
