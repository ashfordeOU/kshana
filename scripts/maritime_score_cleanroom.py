#!/usr/bin/env python3
"""Clean-room implementation of the vessel "Trust score" rule.

Written 2026-10-10 by a reader given ONLY docs/RECEIVER-TRUST.md and
docs/MARITIME-TRUST.md (no source code, tests, examples or git history).

Ambiguities / silences / inconsistencies in the documentation and what was assumed:
 1. Ratio for pass/fail monitors (solve-failure, osnma): the docs say they are
    "given the ratio 1.5", but this function receives ratios from the caller.
    Assumed: the caller already supplies 1.5; ratios are used as given, not
    overridden. Also unclear whether raim/clock count as pass/fail (the docs
    call raim "parity" RAIM and give clock a statistic); treated as ordinary.
 2. Monitors not among the 16 documented names and without a weight override:
    the docs say consumers should treat an unknown name "as a monitor" but give
    no weight. Assumed weight 0 (costs nothing, not listed). If a weights
    override supplies one, it is scored, and tie order places unknown names
    after the 16 known ones, alphabetically (the docs give no rule; this is an
    invented fallback only for names the docs do not cover).
 3. Weight overrides for documented monitors replace the default; docs say
    "a monitor not listed keeps its default". Overrides of 0 or negative
    weights are not discussed; used as given (points <= 0 are not listed).
 4. "Only monitors whose points are above zero are listed": strictly > 0.
 5. "Unrounded points ... before the clamp at 0": read as the per-monitor
    points (after the per-monitor 0..1 ramp clamp, which is part of the
    formula), not affected by the final score clamp. Listed points are not rounded.
 6. Ordering: largest points first; ties (exact float equality of points)
    broken by the documented monitor-name order. Docs do not say whether
    "equal" is exact or within a tolerance; exact assumed. Sorting is
    independent of the input dict order.
 7. Rounding: floor(x*10+0.5)/10 applied after clamping to [0,100]; band from
    the rounded score: >= nominal_min nominal, >= degraded_min degraded, else
    untrusted. Docs do not say how float noise in x*10 is treated; none added.
 8. Non-finite ratios (NaN/inf), negative ratios, full_ratio <= onset_ratio:
    unspecified. NaN ratios are skipped (no decision); +inf gives full weight
    by the clamp; negative ratios cost nothing by the clamp; full_ratio <=
    onset_ratio raises ValueError (division by zero / meaningless ramp).
 9. evidence_hold_s, calibration and the "score is absent while calibrating"
    behaviour are stream concerns and out of scope here.
10. The documentation says the points formula's weight table gives
    "cn0-drop" 30 (RECEIVER-TRUST table); no conflict found there. The
    MARITIME doc does not restate weights, so there was no inconsistency.
    The band-edge phrase "the lightest monitor at its threshold costs 12.5"
    agrees with weight 25 * 0.5 (loss-of-lock, agc, jam-ind).
"""
import math

ORDER = ["cn0-drop", "agc", "jam-ind", "loss-of-lock", "position-jump", "raim",
         "clock", "solve-failure", "kinematic", "heading-course", "speed-log",
         "sea-level", "cn0-spread", "cn0-rise", "time-consistency", "osnma"]

DEFAULT_WEIGHTS = {
    "osnma": 70.0,
    "kinematic": 60.0, "raim": 60.0, "clock": 60.0, "position-jump": 60.0,
    "time-consistency": 60.0,
    "heading-course": 40.0, "speed-log": 40.0, "solve-failure": 40.0,
    "sea-level": 30.0, "cn0-spread": 30.0, "cn0-rise": 30.0, "cn0-drop": 30.0,
    "loss-of-lock": 25.0, "agc": 25.0, "jam-ind": 25.0,
}

DEFAULTS = {"nominal_min": 90.0, "degraded_min": 55.0,
            "onset_ratio": 0.5, "full_ratio": 1.5}


def _rank(name):
    if name in ORDER:
        return (0, ORDER.index(name), "")
    return (1, 0, name)


def score(ratios, cfg=None):
    cfg = cfg or {}
    nominal_min = float(cfg.get("nominal_min", DEFAULTS["nominal_min"]))
    degraded_min = float(cfg.get("degraded_min", DEFAULTS["degraded_min"]))
    onset = float(cfg.get("onset_ratio", DEFAULTS["onset_ratio"]))
    full = float(cfg.get("full_ratio", DEFAULTS["full_ratio"]))
    if not full > onset:
        raise ValueError("full_ratio must exceed onset_ratio")
    weights = dict(DEFAULT_WEIGHTS)
    weights.update(cfg.get("weights") or {})

    deductions = []
    for name, ratio in ratios.items():
        ratio = float(ratio)
        if math.isnan(ratio):
            continue
        w = weights.get(name)
        if w is None:
            continue
        frac = min(max((ratio - onset) / (full - onset), 0.0), 1.0)
        pts = float(w) * frac
        if pts > 0:
            deductions.append({"monitor": name, "ratio": ratio, "points": pts})

    deductions.sort(key=lambda d: (-d["points"], _rank(d["monitor"])))
    total = sum(d["points"] for d in deductions)
    raw = min(max(100.0 - total, 0.0), 100.0)
    rounded = math.floor(raw * 10 + 0.5) / 10
    if rounded >= nominal_min:
        band = "nominal"
    elif rounded >= degraded_min:
        band = "degraded"
    else:
        band = "untrusted"
    return {"score": rounded, "band": band, "deductions": deductions}


if __name__ == "__main__":
    print(score({"heading-course": 1.5, "speed-log": 1.5}))
