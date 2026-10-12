#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Stage the Grafana dashboards under deploy/grafana as release assets.
#
#   scripts/stage-grafana.sh <out-dir>
#
# Every deploy/grafana/**/*.json must parse and look like a dashboard (a `panels` list,
# possibly under a `dashboard` key); each is copied to <out-dir>/kshana-grafana-<name>.json.
# Fails when there are none: the release is meant to carry the dashboard, and an empty
# directory must not read as a pass.
set -euo pipefail
out="${1:?usage: stage-grafana.sh <out-dir>}"
root="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$out"
n=0
while IFS= read -r f; do
  python3 - "$f" <<'PY'
import json, sys
d = json.load(open(sys.argv[1], encoding="utf-8"))
d = d.get("dashboard", d)
assert isinstance(d.get("panels"), list) and d["panels"], f"{sys.argv[1]}: no panels, not a dashboard"
PY
  cp "$f" "$out/kshana-grafana-$(basename "$f")"
  n=$((n+1))
done < <(find "$root/deploy/grafana" -name '*.json' -type f 2>/dev/null | LC_ALL=C sort)
[ "$n" -gt 0 ] || { echo "FAIL: no Grafana dashboard JSON under deploy/grafana" >&2; exit 1; }
echo "staged $n Grafana dashboard(s)"
