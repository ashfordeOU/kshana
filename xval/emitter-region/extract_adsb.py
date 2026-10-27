#!/usr/bin/env python3
"""Fetch one adsb.lol daily readsb history (ODbL 1.0) and write the airborne ADS-B rows inside a box as CSV in
the documented `kshana interference-map` input format. Public data only.

  python3 -I extract_adsb.py <tag> <out.csv> <south> <west> <north> <east>
  e.g. v2025.09.16-planes-readsb-prod-0 day16.csv 62 0 76 32

The release is a split tar (`<tag>.tar.aa`, `.ab`, ...) at
https://github.com/adsblol/globe_history_2025/releases/download/<tag>/. Each part is downloaded with resume and
read in order; the SHA-256 of the concatenated tar is printed and is what the pre-registration pins. Aircraft
addresses are hashed with a FIXED, documented salt so the CSV is reproducible; the address itself is never
written. Rows with `ground` or no altitude are dropped; every other filter is Kshana's.
"""
import gzip, hashlib, io, json, os, subprocess, sys, tarfile

SALT = b"kshana-emitter-region-prereg-v1"
UA = "kshana-emitter-region (https://kshana.dev; research, aggregate regions only)"
tag, out = sys.argv[1], sys.argv[2]
south, west, north, east = map(float, sys.argv[3:7])
base = f"https://github.com/adsblol/globe_history_2025/releases/download/{tag}/{tag}.tar."


def location(url):
    r = subprocess.run(["curl", "-sS", "-A", UA, "-I", url], capture_output=True, text=True)
    loc = [l.split(" ", 1)[1].strip() for l in r.stdout.splitlines() if l.lower().startswith("location:")]
    return loc[0] if loc else None


class Parts(io.RawIOBase):
    def __init__(self, workdir):
        self.files, self.sizes, self.sha, self.n, self.f, self.idx = [], [], hashlib.sha256(), 0, None, 0
        os.makedirs(workdir, exist_ok=True)
        for i in range(26):
            url = base + "a" + "abcdefghijklmnopqrstuvwxyz"[i]
            loc = location(url)
            if not loc:
                break
            path = os.path.join(workdir, f"part{i}")
            for _ in range(40):
                if subprocess.run(["curl", "-sS", "-A", UA, "-f", "-C", "-", "-o", path, loc]).returncode == 0:
                    break
                loc = location(url) or loc
            self.files.append(path)
            self.sizes.append(os.path.getsize(path))

    def readable(self):
        return True

    def readinto(self, b):
        while True:
            if self.f is None:
                if self.idx >= len(self.files):
                    return 0
                self.f = open(self.files[self.idx], "rb")
            k = self.f.readinto(b)
            if k:
                self.sha.update(memoryview(b)[:k])
                self.n += k
                return k
            self.f.close()
            os.remove(self.files[self.idx])
            self.f, self.idx = None, self.idx + 1


parts = Parts(out + ".parts")
tf = tarfile.open(fileobj=io.BufferedReader(parts, 1 << 20), mode="r|")
files = rows = with_rows = 0
with open(out, "w") as o:
    o.write("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type\n")
    for m in tf:
        if not m.isfile() or "trace_full_" not in m.name:
            continue
        files += 1
        data = tf.extractfile(m).read()
        try:
            if data[:2] == b"\x1f\x8b":
                data = gzip.decompress(data)
            j = json.loads(data)
        except Exception:
            continue
        t0 = j.get("timestamp")
        aid = hashlib.sha256(SALT + str(j.get("icao", "")).encode()).hexdigest()[:12]
        got = False
        for t in j.get("trace", []):
            try:
                lat, lon, alt = t[1], t[2], t[3]
            except Exception:
                continue
            if alt in ("ground", None) or not (south <= lat <= north and west <= lon <= east):
                continue
            d = t[8] if len(t) > 8 and isinstance(t[8], dict) else {}
            o.write(f"{t0 + t[0]:.1f},{aid},{lat},{lon},{alt},{d.get('nic', '')},{d.get('nac_p', '')},{t[9] if len(t) > 9 else ''}\n")
            rows += 1
            got = True
        with_rows += got
sha = hashlib.sha256(open(out, "rb").read()).hexdigest()
print(json.dumps({"tag": tag, "tar_bytes": parts.n, "tar_sha256": parts.sha.hexdigest(), "part_sizes": parts.sizes,
                  "trace_files": files, "aircraft_with_rows_in_box": with_rows, "rows": rows, "csv_sha256": sha}))
