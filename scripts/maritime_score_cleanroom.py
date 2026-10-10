#!/usr/bin/env python3
"""Clean-room implementation of the Kshana vessel trust score.

Written 2026-10-10 by a reader given ONLY docs/RECEIVER-TRUST.md and
docs/MARITIME-TRUST.md (no source, tests, examples or history were read;
note: a tool hook auto-attached docs/AGENTS.md to a read, it contains no
scoring detail and was not used).

Ambiguities / silences / inconsistencies found, and what was assumed:
 1. Order of deductions: docs say "largest points first" (MARITIME-TRUST live
    schema) but give no tie-break. Assumed: sort by points descending, ties
    keep the order of iteration of `ratios` (stable sort).
 2. Which deductions are listed: "only monitors that cost points are listed".
    Assumed points > 0 strictly (ratio <= onset_ratio is not listed).
 3. Rounding of per-deduction `points` and `ratio`: unspecified (only the score
    is stated to be rounded to 0.1). Assumed unrounded, raw values reported;
    the score is the rounded sum of the UNROUNDED points.
 4. Band is "the band of its score": assumed to use the ROUNDED score (after
    round-to-0.1), with score >= nominal_min -> nominal, >= degraded_min ->
    degraded, else untrusted. Differs from using the raw score only at edges.
 5. Monitor with no documented default weight and no override (e.g. a future
    monitor; docs say consumers treat unknown names as a monitor but give no
    weight): assumed weight 0, so it costs nothing and is not listed.
 6. osnma: "any failure ... costs its whole weight" while the generic formula
    gives only half the weight at ratio 1. Assumed the caller supplies a ratio
    >= full_ratio for a failure; the formula is applied as written, no special
    case. (Doc is silent on what ratio an osnma failure carries.)
 7. Degenerate config (full_ratio <= onset_ratio): division by zero/negative,
    unspecified. Assumed ValueError.
 8. Negative or NaN ratios: unspecified; negative clamps to 0 cost via the
    formula; NaN is treated as absent (no cost).
 9. Weight table says 60-point monitors "one clear violation leaves the
    degraded band", but 60 points at full strength gives score 40, which is
    untrusted (<55); at its threshold it gives 70 (degraded). Inconsistent or
    loosely worded; formula and band edges followed, not the prose.
10. Doc examples do not reconcile with the formula: the live JSON line shows
    score 23.4 with only heading-course 40.0 deducted (would be 60.0), and the
    $PKSHT example shows 23.4 with 40.0+30.0 deducted (would be 30.0). Taken
    as illustrative; formula followed.
11. Overrides for a monitor absent from the documented list are accepted in
    `weights`. `evidence_hold_s` and holding of last statistics are the
    caller's job (outside this function); doc is clear on that part.
12. Clamp is applied to 100 - sum before rounding; ties at x.x5 round half
    away from zero via floor(x*10+0.5)/10 (binary float representation can
    still affect exact decimal halves; unspecified).
"""
import math

DEFAULT_WEIGHTS = {
    "osnma": 70.0,
    "kinematic": 60.0, "raim": 60.0, "clock": 60.0,
    "position-jump": 60.0, "time-consistency": 60.0,
    "heading-course": 40.0, "speed-log": 40.0, "solve-failure": 40.0,
    "sea-level": 30.0, "cn0-spread": 30.0, "cn0-rise": 30.0, "cn0-drop": 30.0,
    "loss-of-lock": 25.0, "agc": 25.0, "jam-ind": 25.0,
}


def _clamp(x, lo, hi):
    return lo if x < lo else hi if x > hi else x


def score(ratios, cfg=None):
    cfg = cfg or {}
    nominal_min = float(cfg.get("nominal_min", 90.0))
    degraded_min = float(cfg.get("degraded_min", 55.0))
    onset = float(cfg.get("onset_ratio", 0.5))
    full = float(cfg.get("full_ratio", 1.5))
    if full <= onset:
        raise ValueError("full_ratio must exceed onset_ratio")
    weights = dict(DEFAULT_WEIGHTS)
    weights.update(cfg.get("weights") or {})

    deductions = []
    total = 0.0
    for name, ratio in ratios.items():
        if ratio is None or (isinstance(ratio, float) and math.isnan(ratio)):
            continue
        w = float(weights.get(name, 0.0))
        pts = w * _clamp((ratio - onset) / (full - onset), 0.0, 1.0)
        if pts > 0.0:
            deductions.append({"monitor": name, "ratio": ratio, "points": pts})
            total += pts
    deductions.sort(key=lambda d: -d["points"])  # stable

    raw = _clamp(100.0 - total, 0.0, 100.0)
    s = math.floor(raw * 10.0 + 0.5) / 10.0
    band = "nominal" if s >= nominal_min else "degraded" if s >= degraded_min else "untrusted"
    return {"score": s, "band": band, "deductions": deductions}


if __name__ == "__main__":
    print(score({"heading-course": 1.5, "speed-log": 1.5}))
