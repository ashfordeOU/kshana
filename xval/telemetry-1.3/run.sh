#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Run the four consumers of the schema-1.3 telemetry corpus (PREREGISTRATION.md beside this
# script) and write their outputs into tests/fixtures/telemetry_oracle_13/:
#   prometheus_reference.json, otlp_reference.json   prometheus_client / OTLP proto (Python)
#   promtool.txt                                     promtool check metrics (Prometheus 3.5.0)
#   collector_post.txt, collector_export.json,
#   collector_reference.json                         OpenTelemetry Collector contrib 0.135.0
#
# Data-gated: downloads the two release tarballs and checks them against the SHA-256 digests
# below (a mismatch fails); needs python3 with venv, curl and tar. Tools land in
# ${TOOLS:-$HOME/Code/kshana-oracles/telemetry13}, outside the checkout.
#
#   cargo run --example gen_telemetry_oracle_inputs --features otlp   # exposition.prom, otlp.json
#   bash xval/telemetry-1.3/run.sh
#   cargo test --features otlp --test telemetry_formats_reference
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root="$(cd "$here/../.." && pwd)"
fix="$root/tests/fixtures/telemetry_oracle_13"
tools="${TOOLS:-$HOME/Code/kshana-oracles/telemetry13}"
mkdir -p "$tools"

PROM_URL=https://github.com/prometheus/prometheus/releases/download/v3.5.0/prometheus-3.5.0.linux-amd64.tar.gz
PROM_SHA=e811827af26d822afb09a4f28314f61b618b12cff5369835a67f674d8b46f39a
OTEL_URL=https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.135.0/otelcol-contrib_0.135.0_linux_amd64.tar.gz
OTEL_SHA=43132748eb0effb56b9d508ca789149684bf7ab6ade5d65cd0b22c4d265a30c0

fetch() { # fetch <url> <sha256> <file>
  [ -s "$3" ] || curl -fsSL --retry 3 -o "$3" "$1"
  echo "$2  $3" | sha256sum -c --quiet - || { echo "SHA-256 mismatch: $3" >&2; exit 1; }
}
fetch "$PROM_URL" "$PROM_SHA" "$tools/prometheus.tgz"
fetch "$OTEL_URL" "$OTEL_SHA" "$tools/otelcol.tgz"
tar -xzf "$tools/prometheus.tgz" -C "$tools" prometheus-3.5.0.linux-amd64/promtool
tar -xzf "$tools/otelcol.tgz" -C "$tools" otelcol-contrib
promtool="$tools/prometheus-3.5.0.linux-amd64/promtool"

# O1, O2: the pinned Python parsers.
venv="$tools/.venv"
[ -x "$venv/bin/python" ] || python3 -m venv "$venv"
"$venv/bin/pip" install -q prometheus_client==0.26.0 opentelemetry-proto==1.45.1 protobuf==7.36.2
"$venv/bin/python" -I "$root/scripts/gen_telemetry_formats_ref.py" telemetry_oracle_13

# O3: promtool check metrics, exposition on standard input; output and exit status recorded.
set +e
out="$("$promtool" check metrics < "$fix/exposition.prom" 2>&1)"
status=$?
set -e
{ echo "tool=promtool 3.5.0 check metrics"; echo "exit=$status"; printf '%s' "$out"; echo; } > "$fix/promtool.txt"

# O4: the Collector, OTLP/HTTP receiver to file exporter, no processor.
work="$(mktemp -d)"
trap 'kill "${pid:-0}" 2>/dev/null || true; rm -rf "$work"' EXIT
cat > "$work/config.yaml" <<YAML
receivers:
  otlp:
    protocols:
      http:
        endpoint: 127.0.0.1:14318
exporters:
  file:
    path: $work/export.json
service:
  pipelines:
    metrics:
      receivers: [otlp]
      exporters: [file]
  telemetry:
    metrics:
      level: none
YAML
"$tools/otelcol-contrib" --config "$work/config.yaml" > "$work/collector.log" 2>&1 &
pid=$!
for _ in $(seq 1 50); do
  curl -s -o /dev/null http://127.0.0.1:14318/ 2>/dev/null && break
  sleep 0.2
done
code="$(curl -s -o "$work/response" -w '%{http_code}' -H 'Content-Type: application/json' \
  --data-binary @"$fix/otlp.json" http://127.0.0.1:14318/v1/metrics)"
for _ in $(seq 1 50); do
  [ -s "$work/export.json" ] && break
  sleep 0.2
done
kill "$pid"; wait "$pid" 2>/dev/null || true
{ echo "tool=otelcol-contrib 0.135.0 otlp(http) -> file"; echo "status=$code"; echo "response=$(cat "$work/response")"; } > "$fix/collector_post.txt"
head -n 1 "$work/export.json" > "$fix/collector_export.json"
"$venv/bin/python" -I "$root/scripts/gen_telemetry_formats_ref.py" telemetry_oracle_13 --collector
echo "done: $fix"
