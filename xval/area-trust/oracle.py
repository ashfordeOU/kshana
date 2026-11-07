# SPDX-License-Identifier: AGPL-3.0-only
"""B5 area trust: the independent oracle for the area rule (section 2 of the pre-registration, with the
readings in README.md). Python standard library only; shares no code with the engine.

    python3 -I xval/area-trust/oracle.py stations.json > timeline.jsonl
"""
import json
import math
import sys

RANK = {"nominal": 0, "degraded": 1, "untrusted": 2}
AREA = ["TRUSTED", "DEGRADED", "UNTRUSTED"]
STALE_AFTER = 5
HOLD = 10


def station_states(epochs, g0, g1):
    """Per grid second g0..g1: the station's state, or None when stale."""
    last_in = {}
    for t, s in epochs:
        last_in[math.floor(t)] = s  # the last epoch of a second wins (epochs are in time order)
    out = []
    state, g_last = None, None
    for g in range(g0, g1 + 1):
        if g in last_in:
            state, g_last = last_in[g], g
        if g_last is None or g - g_last >= STALE_AFTER:
            out.append(None)
        else:
            out.append(state)
    return out


def raw(states):
    live = [s for s in states if s is not None]
    n = len(live)
    n_d = sum(1 for s in live if RANK[s] >= 1)
    n_u = sum(1 for s in live if RANK[s] == 2)
    if n < 2:
        return "UNKNOWN", n, n_d, n_u
    k = max(2, math.ceil(n / 3))
    if n_u >= k:
        r = "UNTRUSTED"
    elif n_d >= k or n_u >= 1:
        r = "DEGRADED"
    else:
        r = "TRUSTED"
    return r, n, n_d, n_u


def timeline(doc):
    stations = doc["stations"]
    times = [t for st in stations for t, _ in st["epochs"]]
    if not times:
        return []
    g0, g1 = math.floor(min(times)), math.floor(max(times))
    per = [station_states(st["epochs"], g0, g1) for st in stations]
    out = []
    pub = None
    raws = []
    for i, g in enumerate(range(g0, g1 + 1)):
        col = [p[i] for p in per]
        r, n, n_d, n_u = raw(col)
        raws.append(r)
        prev = pub
        if pub is None or r == "UNKNOWN" or pub == "UNKNOWN":
            pub = r
        elif AREA.index(r) > AREA.index(pub):
            pub = r
        elif AREA.index(r) < AREA.index(pub):
            last = raws[-HOLD:]
            if len(last) == HOLD and all(x != "UNKNOWN" and AREA.index(x) < AREA.index(pub) for x in last):
                pub = max(last, key=AREA.index)
        alert = (
            prev is not None
            and pub in ("DEGRADED", "UNTRUSTED")
            and (prev == "UNKNOWN" or AREA.index(pub) > AREA.index(prev))
        )
        stale = sum(1 for s in col if s is None)
        out.append({"g": g, "state": pub, "alert": alert, "n": n, "n_d": n_d, "n_u": n_u, "stale": stale})
    return out


def main():
    with open(sys.argv[1]) as f:
        doc = json.load(f)
    for row in timeline(doc):
        sys.stdout.write(json.dumps(row, separators=(",", ":")) + "\n")


if __name__ == "__main__":
    main()
