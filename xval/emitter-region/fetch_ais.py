#!/usr/bin/env python3
"""Fetch Kystverket open AIS positions for one UTC day in a box through the Kystdatahuset API (NLOD 2.0) and write
the documented `kshana interference-map` AIS CSV (`timestamp,vessel_id,lat,lon,sog_kn`). Public data only.

  python3 -I fetch_ais.py <YYYY-MM-DD> <out.csv> <west> <south> <east> <north>

Endpoint: POST https://kystdatahuset.kystverket.no/ws/api/ais/positions/within-bbox-time. Observed behaviour
(2026-10-27, recorded in the pre-registration): `start` is ignored and a request with `end` = D 00:00 returns the
stamps D-1 02:00:00 to D 01:59:59, i.e. the UTC day D-1 if the stamps are Norwegian local time (UTC+2 in September)
although the documentation labels them UTC. This script asks for end = (D + 1 day) 00:00 and converts the stamps
as local time to UTC (`--stamps utc` keeps them as documented), then keeps only rows inside UTC day D. MMSI numbers
are hashed with a FIXED salt and never written. Row layout: mmsi, time, lon, lat, cog, sog, message nr, ...
"""
import datetime as dt, hashlib, json, subprocess, sys

SALT = b"kshana-emitter-region-prereg-v1"
UA = "kshana-emitter-region (https://kshana.dev; research, aggregate regions only)"
day, out = sys.argv[1], sys.argv[2]
west, south, east, north = sys.argv[3:7]
stamps = "utc" if "--stamps" in sys.argv and sys.argv[sys.argv.index("--stamps") + 1] == "utc" else "local"
d = dt.date.fromisoformat(day)
end = (d + dt.timedelta(days=1)).strftime("%Y%m%d") + "0000"
body = json.dumps({"bbox": f"{west},{south},{east},{north}", "start": end, "end": end, "minSpeed": 0})
raw = subprocess.run(["curl", "-sS", "-A", UA, "-m", "600", "-X", "POST", "https://kystdatahuset.kystverket.no/ws/api/ais/positions/within-bbox-time",
                      "-H", "Content-Type: application/json", "-d", body], capture_output=True).stdout
rows = json.loads(raw)["data"]
shift = dt.timedelta(hours=2) if stamps == "local" else dt.timedelta(0)
lo = dt.datetime.combine(d, dt.time(0))
hi = lo + dt.timedelta(days=1)
n = 0
with open(out, "w") as o:
    o.write("timestamp,vessel_id,lat,lon,sog_kn\n")
    for r in sorted(rows, key=lambda r: (r[1], r[0])):
        t = dt.datetime.fromisoformat(r[1]) - shift
        if not (lo <= t < hi):
            continue
        vid = hashlib.sha256(SALT + str(r[0]).encode()).hexdigest()[:12]
        o.write(f"{t.isoformat()}Z,{vid},{r[3]},{r[2]},{r[5]}\n")
        n += 1
print(json.dumps({"day": day, "stamps": stamps, "raw_sha256": hashlib.sha256(raw).hexdigest(), "raw_rows": len(rows),
                  "rows_in_day": n, "csv_sha256": hashlib.sha256(open(out, "rb").read()).hexdigest()}))
