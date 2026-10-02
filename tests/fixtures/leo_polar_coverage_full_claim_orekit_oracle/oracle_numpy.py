# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle aggregation for tests/leo_polar_coverage_full_claim_orekit_oracle.rs (row M131, full
claim). Adapted from the round-2 script of tests/fixtures/leo_polar_coverage_orekit_oracle/.

Reads Orekit's output (orekit_<c>.txt: ITRF positions of every satellite at every epoch from
Orekit's own TLE propagation, and per sample the in-view counts per system, line-of-sight
unit vectors in the topocentric east-north-zenith frame, DOPComputer results) and the
configuration (inputs_<c>.json: each system's role and clock model, the grid, the PDOP
threshold). For each sample and group:

* the clock unknowns are one per estimated system in view (a known-offset system shares the
  reference clock; with no estimated system in view there is one plain clock unknown);
* with one clock unknown the DOP is Orekit's DOPComputer value;
* with several, the DOP is NumPy's LAPACK inverse (numpy.linalg.inv) of H^T H, H stacked
  from Orekit's line-of-sight vectors with one clock column per clock unknown; a fix exists
  when the group has at least as many satellites as unknowns and H has full column rank
  (numpy.linalg.matrix_rank).

The per-latitude mean in view, medians (numpy.median) and availability are plain counting.
Writes oracle_<c>.json.
"""
import json
import sys

import numpy as np

GROUPS = ("gnss", "leo", "all")
OUT_GROUP = {"gnss": "gnss", "leo": "leo", "all": "fused"}


def parse(path):
    samples = []
    positions = {}
    cur = None
    for line in open(path):
        if line.startswith("#") or not line.strip():
            continue
        tag = line[0]
        if tag == "P":
            f = line.split()
            positions.setdefault(int(f[1]), []).append([float(x) for x in f[3:6]])
        elif tag == "S":
            head, iv, margin = line[1:].split("|")
            li, oi, ei = (int(x) for x in head.split())
            cur = {
                "lat_i": li,
                "lon_i": oi,
                "epoch": ei,
                "in_view_by_system": [int(x) for x in iv.split()],
                "min_margin_rad": float(margin),
                "los": [],
                "orekit": {},
            }
            samples.append(cur)
        elif tag == "L":
            f = line.split()
            cur["los"].append((int(f[1]), np.array([float(x) for x in f[2:5]])))
        elif tag == "D":
            f = line.split()
            cur["orekit"][f[1]] = {
                "n": int(f[2]),
                "gdop": float(f[3]),
                "pdop": float(f[4]),
                "hdop": float(f[5]),
                "vdop": float(f[6]),
            }
    return samples, [positions[e] for e in sorted(positions)]


def numpy_dop(los, systems):
    """DOP of the line-of-sight list [(system, unit vector)] with per-system clock columns."""
    est = sorted({s for s, _ in los if systems[s]["clock"] == "estimated"})
    own = est[1:]
    n_clock = 1 + len(own)
    n_unknown = 3 + n_clock
    if len(los) < n_unknown:
        return n_clock, None
    h = np.zeros((len(los), n_unknown))
    for i, (s, u) in enumerate(los):
        h[i, :3] = -u
        h[i, 3 + (own.index(s) + 1 if s in own else 0)] = 1.0
    if np.linalg.matrix_rank(h) < n_unknown:
        return n_clock, None
    q = np.linalg.inv(h.T @ h)
    return n_clock, {
        "pdop": float(np.sqrt(q[0, 0] + q[1, 1] + q[2, 2])),
        "hdop": float(np.sqrt(q[0, 0] + q[1, 1])),
        "vdop": float(np.sqrt(q[2, 2])),
    }


def main(directory, cfg):
    inputs = json.load(open(f"{directory}/inputs_{cfg}.json"))
    systems = inputs["systems"]
    thr = inputs["pdop_threshold"]
    samples, positions = parse(f"{directory}/orekit_{cfg}.txt")
    roles = [s["role"] for s in systems]
    acc = {}
    src_count = {"orekit_dopcomputer": 0, "numpy_lapack": 0}
    worst_orekit_vs_numpy = 0.0
    for smp in samples:
        for g in GROUPS:
            los = [(s, u) for s, u in smp["los"] if g == "all" or roles[s] == g]
            n_clock, nd = numpy_dop(los, systems)
            if n_clock == 1:
                o = smp["orekit"][g]
                assert o["n"] == len(los)
                d = None
                if len(los) >= 4 and np.isfinite(o["pdop"]):
                    d = {k: o[k] for k in ("pdop", "hdop", "vdop")}
                    src_count["orekit_dopcomputer"] += 1
                    if nd is not None:
                        for k in d:
                            worst_orekit_vs_numpy = max(
                                worst_orekit_vs_numpy, abs(d[k] - nd[k]) / abs(nd[k])
                            )
            else:
                d = nd
                if d is not None:
                    src_count["numpy_lapack"] += 1
            a = acc.setdefault((smp["lat_i"], g), {"n": 0, "in_view": 0, "dops": [], "ok": 0})
            a["n"] += 1
            a["in_view"] += len(los)
            if d is not None:
                a["dops"].append(d)
                if d["pdop"] <= thr:
                    a["ok"] += 1
    rows = []
    for li, lat in enumerate(inputs["lats_deg"]):
        row = {"lat_deg": lat}
        for g in GROUPS:
            a = acc[(li, g)]
            med = lambda k: float(np.median([d[k] for d in a["dops"]])) if a["dops"] else None
            row[OUT_GROUP[g]] = {
                "mean_in_view": a["in_view"] / a["n"],
                "median_pdop": med("pdop"),
                "median_hdop": med("hdop"),
                "median_vdop": med("vdop"),
                "availability": a["ok"] / a["n"],
                "samples": a["n"],
                "samples_with_fix": len(a["dops"]),
            }
        rows.append(row)
    out = {
        "config": cfg,
        "oracle": "Orekit 13.1.8 (TLEPropagator, ITRF, TopocentricFrame elevation, DOPComputer) and NumPy "
        + np.__version__
        + " numpy.linalg.inv (LAPACK) for groups with several clock unknowns",
        "self_check": {
            "worst_orekit_vs_numpy_single_clock_rel": worst_orekit_vs_numpy,
            "dop_source_counts": src_count,
        },
        "rows": rows,
        "positions_m": positions,
        "samples": [
            {k: s[k] for k in ("lat_i", "lon_i", "epoch", "in_view_by_system", "min_margin_rad")}
            for s in samples
        ],
    }
    with open(f"{directory}/oracle_{cfg}.json", "w") as fh:
        json.dump(out, fh, indent=None, separators=(",", ":"))
        fh.write("\n")
    print(f"config {cfg}: {len(samples)} samples; self-check {out['self_check']}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
