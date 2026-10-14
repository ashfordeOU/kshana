#!/usr/bin/env bash
# Reproducible ICGEM calcgrid request: EGM2008 truncated at n=70.
# usage: icgem_fetch.sh <outdir> <func> <region_tag> <W> <E> <S> <N> [send_height=1]
set -euo pipefail
OUT=$1; FUNC=$2; TAG=$3; W=$4; E=$5; S=$6; N=$7; SENDH=${8:-1}
BASE=https://icgem.gfz.de
EGM2008=c50128797a9cb62e936337c890e4425f03f0461d7329b09a8cc8561504465340  # from /json_modelmap/name?modeltype=longtime&usefor=calc
JAR=$(mktemp)
H=(); [ "$SENDH" = 1 ] && H=(-F grid_height=0)   # browser omits grid_height (disabled) for non-'height' functionals
loc=$(curl -sS -c "$JAR" -b "$JAR" -o /dev/null -w '%{redirect_url}' \
  -F sel_type=longtime -F sel_model=$EGM2008 \
  -F grid_left=$W -F grid_right=$E -F grid_bottom=$S -F grid_top=$N -F grid_step=0.25 "${H[@]}" \
  -F sel_func=$FUNC -F sel_refsys=WGS84 -F sel_tidesys=unmodified -F zero_term=on \
  -F trunc_gentle=70 -F trunc_max=70 -F filter=none -F flength=1.0 -F funit=degree \
  $BASE/calcsrvgrid)
ID=${loc##*/}; echo "job $ID"
curl -sS -c "$JAR" -b "$JAR" -o /dev/null $BASE/calc_stat/$ID          # attaches job to session
curl -sS -c "$JAR" -b "$JAR" -o /dev/null -X POST -H 'Content-Length: 0' $BASE/api_key/$(date +%s)
for i in $(seq 1 60); do
  st=$(curl -sS -b "$JAR" $BASE/calc_updates/0)
  echo "$st" | grep -q '"calc_end": [0-9]' && break
  sleep 5
done
echo "$st"
# result is stored gzipped; plain GET returns 502, so ask for gzip and decompress
curl -sS -b "$JAR" -H 'Accept-Encoding: gzip' -o "$OUT/egm2008_n70_${FUNC}_${TAG}.gdf.gz" $BASE/calc_res_gdf/$ID
gunzip -c "$OUT/egm2008_n70_${FUNC}_${TAG}.gdf.gz" > "$OUT/egm2008_n70_${FUNC}_${TAG}.gdf"
rm -f "$JAR"
