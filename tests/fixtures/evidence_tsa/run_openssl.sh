#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# The oracle: runs OpenSSL on every case of cases.tsv and writes openssl-verdicts.txt
# (one line per case: id, verdict PASS/FAIL, the `openssl ts -verify` verdict, and the
# token's genTime as Unix seconds, which is passed to OpenSSL as -attime so certificate
# validity is judged at the time the authority stated, as Kshana judges it).
#
# oracle "ts":  openssl ts -verify -in TOKEN -data DATA -CAfile ANCHORS [-untrusted U] -attime T
# oracle "cms": for RSA-PSS tokens, which `openssl ts -verify` cannot check (its PKCS#7 code
#               verifies PKCS#1 v1.5 only): openssl cms -verify -cades -purpose timestampsign
#               (signature, signingCertificateV2, chain, EKU) AND the TSTInfo message imprint,
#               read with openssl asn1parse, equal to openssl dgst -sha256 of DATA.
# usage: run_openssl.sh [dir]   (default: this directory)
set -euo pipefail
D="${1:-$(cd "$(dirname "$0")" && pwd)}"
W="$(mktemp -d)"; trap 'rm -rf "$W"' EXIT
out="$D/openssl-verdicts.txt"
# OpenSSL's reason: the certificate-verification error if there is one, else the reason
# field of the first error line ("<id>:error:<code>:<library>:<function>:<reason>:<file>...").
reason() {
  local r; r=$(sed -n 's/.*Verify error: *//p' "$1" | head -n1)
  [ -z "$r" ] && r=$(grep -m1 ':error:' "$1" | cut -d: -f6)
  echo "${r:-?}"
}
{
echo "# $(openssl version)"
echo "# id verdict ts_verify_verdict gen_time_unix reason(OpenSSL's first error, or -)"
grep -v '^#' "$D/cases.tsv" | while IFS=$'\t' read -r id tok data anchors untrusted oracle; do
  ti=; case "$tok" in *.tst) ti=-token_in;; esac
  : > "$W/ca.pem"; IFS=, read -ra A <<< "$anchors"; for a in "${A[@]}"; do cat "$D/certs/$a" >> "$W/ca.pem"; done
  un=(); [ "$untrusted" != "-" ] && un=(-untrusted "$D/certs/$untrusted")
  gt=$(openssl ts -reply $ti -in "$D/tokens/$tok" -text 2>/dev/null | sed -n 's/^Time stamp: //p')
  t=$(date -u -d "$gt" +%s)
  if openssl ts -verify $ti -in "$D/tokens/$tok" -data "$D/$data" -CAfile "$W/ca.pem" "${un[@]}" \
       -attime "$t" >/dev/null 2>"$W/err"; then tsv=PASS; else tsv=FAIL; fi
  why=$(reason "$W/err")
  v=$tsv
  if [ "$oracle" = cms ]; then
    v=FAIL
    why="message imprint mismatch"
    if openssl cms -verify -cades -purpose timestampsign -binary -inform DER -in "$D/tokens/$tok" \
         -CAfile "$W/ca.pem" "${un[@]}" -attime "$t" -out "$W/tst.der" >/dev/null 2>"$W/err"; then
      imp=$(openssl asn1parse -inform DER -in "$W/tst.der" | awk '/OCTET STRING/ {sub(/.*\[HEX DUMP\]:/,""); print; exit}')
      dg=$(openssl dgst -sha256 -hex < "$D/$data" | awk '{print toupper($NF)}')
      [ -n "$imp" ] && [ "$imp" = "$dg" ] && v=PASS && why=-
    else
      why=$(reason "$W/err")
    fi
  fi
  [ "$v" = PASS ] && why=-
  echo "$id $v $tsv $t $why"
done
} > "$out"
cat "$out"
