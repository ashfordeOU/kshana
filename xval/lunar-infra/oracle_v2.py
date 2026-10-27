#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent half of the lunar-infrastructure v2 campaigns (PREREGISTRATION-v2.md).

Reads the Rust output of `cargo run --release --example lunar_infra_v2 rust.json`, adds the scipy values
(scipy.special.ndtr, scipy.stats.ncx2) and scores the registered bars. Writes results-v2.json.
Usage: python3 oracle_v2.py rust.json results-v2.json
"""
import json, math, sys
import numpy as np, scipy
from scipy.special import ndtr
from scipy.stats import chi2, ncx2

rust = json.load(open(sys.argv[1]))
here = __file__.rsplit("/", 1)[0]
POINT = 12.592
out = {"scipy_version": scipy.__version__, "numpy_version": np.__version__}

# C3a / C3b
rows = []
for r in rust["c"]["rows"]:
    n = r["trials"]
    p = float(ncx2.sf(POINT, 6, r["noncentrality"]))
    se = math.sqrt(p * (1 - p) / n)
    mc = r["fraction_exceeding_95"]
    pe = float(ncx2.sf(float(chi2.ppf(0.95, 6)), 6, r["noncentrality"]))  # the exact 95 % point the Rust code uses
    rows.append({**r, "analytic_power": p, "analytic_power_exact_point": pe, "binomial_se": se,
                 "within_3se": abs(mc - p) <= 3 * se + 1e-12,
                 "within_3se_exact_point": abs(mc - pe) <= 3 * math.sqrt(pe * (1 - pe) / n) + 1e-12})
detect = next((r for r in rows if r["analytic_power"] >= 0.5), None)
c3a = all(r["within_3se"] for r in rows)
c3a_exact = all(r["within_3se_exact_point"] for r in rows)
if detect is None:
    c3b, a_detect = False, "above 1e-7 m/s2"
else:
    a_detect = detect["accel_m_s2"]
    top = rows[-1]
    c3b = (detect["fraction_exceeding_95"] >= 0.5 - 3 * detect["binomial_se"]) and top["fraction_exceeding_95"] >= 0.9
out["C"] = {"rows": rows, "a_detect_m_s2": a_detect, "C3a_met": c3a, "C3a_met_with_exact_95_point": c3a_exact, "C3b_met": c3b,
            "control_c3_fraction_at_3e-10": rows[0]["fraction_exceeding_95"], "original_C3_bar": "NOT MET (unchanged)"}

# Q3a / Q3b
q = rust["q"]
xs = np.array(q["cdf_args"]); ys = np.array(q["cdf_values"])
ref = ndtr(xs)
tiny = ref < 1e-300
err = np.where(tiny, np.abs(ys - ref), np.abs(ys - ref) / ref)
worst_rel = float(err.max())
oracle = json.load(open(f"{here}/../../tests/fixtures/lunar_infra/phase_oracle.json"))
ob = oracle["bootstrap"]
rel_old = abs(q["design_bootstrap_old"] - ob) / ob
rel_new = abs(q["design_bootstrap_accurate"] - ob) / ob
full = json.load(open(f"{here}/../../tests/fixtures/lunar_infra/phase_full_run.json"))
q1 = []
for a, s in zip(q["arcs"], full["arcs"]):
    mc, se = s["monte_carlo_success_rate"], s["monte_carlo_standard_error"]
    q1.append({"arc_days": a["arc_days"], "bootstrap_old": a["bootstrapped_old"], "bootstrap_accurate": a["bootstrapped_accurate"],
               "stored_bootstrap": s["bootstrapped_success_rate"], "mc_rate": mc, "mc_se": se,
               "q1_old_holds": mc >= s["bootstrapped_success_rate"] - 3 * se, "q1_new_holds": mc >= a["bootstrapped_accurate"] - 3 * se,
               "relative_change": abs(a["bootstrapped_accurate"] - a["bootstrapped_old"]) / a["bootstrapped_old"]})
mcs = [s["monte_carlo_success_rate"] for s in full["arcs"]]
ses = [s["monte_carlo_standard_error"] for s in full["arcs"]]
q2 = all(mcs[i] - mcs[i + 1] <= 3 * math.hypot(ses[i], ses[i + 1]) for i in range(len(mcs) - 1))
out["Q"] = {"Q3a_worst_relative_error": worst_rel, "Q3a_arguments": len(xs), "Q3a_met": worst_rel <= 1e-12,
            "Q3b_oracle_bootstrap": ob, "Q3b_rust_old": q["design_bootstrap_old"], "Q3b_rust_accurate": q["design_bootstrap_accurate"],
            "Q3b_relative_difference_old": rel_old, "Q3b_relative_difference_accurate": rel_new, "Q3b_tolerance": 1e-9,
            "Q3b_met": rel_new <= 1e-9, "q1_re_evaluated": q1, "q1_verdict_unchanged": all(r["q1_old_holds"] == r["q1_new_holds"] for r in q1),
            "q2_unchanged_by_construction": q2, "original_Q3_bar": "NOT MET (unchanged)"}

# G
g = rust["g"]
out["G"] = {"original_g3_statistic": g["original_g3_statistic"],
            "G3_prime_EXPLORATORY": {k: v for k, v in g["g3_prime"].items() if k != "subsets"},
            "G3_prime_sensitivity_EXPLORATORY": g["g3_prime_sensitivity"],
            "G3_double_prime": g["g3_double_prime"], "original_G3_bar": "NOT MET (unchanged)"}
json.dump(out, open(sys.argv[2], "w"), indent=1, sort_keys=True)
print(json.dumps({"C3a": c3a, "C3b": c3b, "a_detect": a_detect, "Q3a": out["Q"]["Q3a_met"], "worst": worst_rel,
                  "Q3b": out["Q"]["Q3b_met"], "rel_old": rel_old, "rel_new": rel_new,
                  "G3p": g["g3_prime"]["met"], "G3pp": g["g3_double_prime"]["met"]}, indent=1))
