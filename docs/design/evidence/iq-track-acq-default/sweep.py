#!/usr/bin/env python3
"""Seeded false-lock sweep of the iq track acquisition hand-off, driving the release CLI."""
import json, os, random, subprocess, sys, tempfile, time
from multiprocessing import Pool

KS = sys.argv[1]
OUT = sys.argv[2]
N_SCENES = int(sys.argv[3]) if len(sys.argv) > 3 else 40
RATE = 2.046e6
DUR = 1.5
T_CODE = 1e-3
# (label, acq_coherent, doppler_step or None for default 2/(3 N T))
CANDS = [
    ("N1-default(667Hz)", 1, None),
    ("N2-default(333Hz)", 2, None),
    ("N4-default(167Hz)", 4, None),
    ("N1-step167", 1, 2 / (3 * 4 * T_CODE)),
    ("N2-step167", 2, 2 / (3 * 4 * T_CODE)),
]
FALSE_LOCK_HZ = 25.0

def scene(i):
    rng = random.Random(1000 + i)
    prns = rng.sample(range(1, 33), 3)
    dops = [round(rng.uniform(-5000, 5000), 1) for _ in prns]
    cn0 = rng.choice([38.0, 41.0, 44.0, 47.0])
    data = rng.random() < 0.5
    return dict(i=i, prns=prns, dops=dops, cn0=cn0, data=data, seed=7 + i)

def run(sc):
    d = tempfile.mkdtemp(dir=os.environ.get("SWEEP_TMP"))
    f = os.path.join(d, "s.bin")
    args = [KS, "iq", "scene", f, "--rate", str(RATE), "--duration", str(DUR), "--signal", "gps-l1ca",
            "--prn", ",".join(map(str, sc["prns"])), "--doppler", ",".join(map(str, sc["dops"])),
            "--cn0", str(sc["cn0"]), "--seed", str(sc["seed"])]
    if sc["data"]:
        args.append("--data")
    subprocess.run(args, check=True, capture_output=True)
    rows = []
    for prn, dop in zip(sc["prns"], sc["dops"]):
        for label, n, step in CANDS:
            j = os.path.join(d, "t.json")
            a = [KS, "iq", "track", f, "--signal", "gps-l1ca", "--prn", str(prn),
                 "--acq-coherent", str(n), "--json", j]
            if sc["data"]:
                a += ["--periods-per-bit", "20"]
            if step is not None:
                a += ["--doppler-step", repr(step)]
            p = subprocess.run(a, capture_output=True, text=True)
            row = dict(scene=sc["i"], prn=prn, truth=dop, cn0=sc["cn0"], data=sc["data"], cand=label)
            if p.returncode != 0:
                row["outcome"] = "not_acquired" if "not acquired" in p.stderr else "error:" + p.stderr.strip()[:80]
            else:
                ep = json.load(open(j))["channels"][0]["epochs"]
                last = ep[-1]
                err = last["doppler_hz"] - dop
                tail = ep[len(ep) // 2:]
                plf = sum(e["phase_lock"] for e in tail) / len(tail)
                row.update(final_err_hz=err, plf_tail=plf, cn0_end=last["cn0_nwpr_dbhz"])
                row["outcome"] = "false_lock" if abs(err) > FALSE_LOCK_HZ else "ok"
            rows.append(row)
    subprocess.run(["rm", "-rf", d])
    return rows

def acq_cost(KS):
    """Wall time of the acquisition search alone per candidate (median of repeats)."""
    d = tempfile.mkdtemp(dir=os.environ.get("SWEEP_TMP"))
    f = os.path.join(d, "s.bin")
    subprocess.run([KS, "iq", "scene", f, "--rate", str(RATE), "--duration", "0.05", "--signal", "gps-l1ca",
                    "--prn", "1,2,3,4,5,6,7,8", "--cn0", "45"], check=True, capture_output=True)
    out = {}
    for label, n, step in CANDS:
        a = [KS, "iq", "acquire", f, "--signal", "gps-l1ca", "--prn", "1,2,3,4,5,6,7,8", "--coherent", str(n)]
        if step is not None:
            a += ["--doppler-step", repr(step)]
        ts = []
        for _ in range(15):
            t = time.perf_counter(); subprocess.run(a, check=True, capture_output=True); ts.append(time.perf_counter() - t)
        ts.sort()
        out[label] = ts[len(ts) // 2] / 8
    # Subtract process start-up: an acquisition of a 1-PRN, smallest search.
    subprocess.run(["rm", "-rf", d])
    return out

if __name__ == "__main__":
    scenes = [scene(i) for i in range(N_SCENES)]
    with Pool(4) as p:
        rows = [r for rs in p.map(run, scenes) for r in rs]
    cost = acq_cost(KS)
    json.dump(dict(rows=rows, cost_s_per_prn=cost, cands=CANDS, scenes=scenes), open(OUT, "w"), indent=1)
    from collections import Counter, defaultdict
    by = defaultdict(Counter)
    for r in rows:
        by[r["cand"]][r["outcome"]] += 1
    base = cost[CANDS[0][0]]
    for label, *_ in CANDS:
        c = by[label]; tot = sum(c.values())
        print(f"{label:20s} ok {c['ok']:3d}  false_lock {c['false_lock']:3d}  not_acq {c['not_acquired']:3d}  other {tot-c['ok']-c['false_lock']-c['not_acquired']:2d}  / {tot}   acq {cost[label]*1e3:.2f} ms/PRN ({cost[label]/base:.1f}x)")
