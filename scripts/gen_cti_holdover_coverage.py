#!/usr/bin/env python3
"""Independent oracle for the CTI holdover-envelope coverage claim.

Reads the real BIPM [UTC-UTC(USNO)] 5-day series, fits a running-max holdover
envelope on a disjoint early segment, and checks overbound coverage on a
disjoint late segment. Emits tests/fixtures/cti/reference.json. numpy/scipy
only -- independent of the Rust implementation.
"""
import csv
import json
import math
from pathlib import Path

import numpy as np
from scipy.stats import norm

HERE = Path(__file__).resolve().parent.parent
FIX = HERE / "tests" / "fixtures" / "cti"
SERIES = FIX / "utc_utcusno.csv"

FIT_MJD_MAX = 58000.0      # disjoint split
IR = 1e-2                  # target integrity risk for the coverage test
TAU_WINDOWS_DAYS = [30.0, 90.0, 180.0, 365.0, 730.0]  # τ grid (days)


def k_running_max(ir: float) -> float:
    # K(IR/2) = Phi^-1(1 - IR/4)
    return float(norm.ppf(1.0 - ir / 4.0))


def load_series():
    mjd, x_ns = [], []
    with open(SERIES) as f:
        for line in f:
            if line.startswith("#") or not line.strip():
                continue
            row = next(csv.reader([line]))
            mjd.append(float(row[0]))
            x_ns.append(float(row[1]))
    return np.array(mjd), np.array(x_ns) * 1e-9  # seconds


def running_max_excursion(mjd, x, tau_days):
    """Max |x(t+τ) - x(t)| over all windows of length ~τ (seconds)."""
    out = 0.0
    for i in range(len(mjd)):
        j0 = np.searchsorted(mjd, mjd[i] + tau_days)
        for j in range(i + 1, min(j0 + 1, len(mjd))):
            out = max(out, abs(x[j] - x[i]))
    return out


def main():
    mjd, x = load_series()
    fit = mjd < FIT_MJD_MAX
    test = ~fit
    # Fit a white-FM diffusion from the early-segment 1-step increments.
    dt_s = np.diff(mjd[fit]) * 86400.0
    dx = np.diff(x[fit])
    q_wf = float(np.mean(dx**2 / dt_s))  # white-FM PSD estimate (s)
    k = k_running_max(IR)

    rows = []
    exceed = 0
    total = 0
    for tau_days in TAU_WINDOWS_DAYS:
        tau_s = tau_days * 86400.0
        envelope_s = k * math.sqrt(q_wf * tau_s)
        emp_s = running_max_excursion(mjd[test], x[test], tau_days)
        rows.append(
            dict(
                tau_days=tau_days,
                envelope_ns=envelope_s * 1e9,
                empirical_max_ns=emp_s * 1e9,
                covered=bool(emp_s <= envelope_s),
            )
        )
        total += 1
        if emp_s > envelope_s:
            exceed += 1

    out = dict(
        oracle="BIPM Circular-T [UTC-UTC(USNO)] 5-day, MJD 56074-60429, 872 pts, webtai API",
        fit_mjd_max=FIT_MJD_MAX,
        ir=IR,
        q_wf=q_wf,
        k_running_max=k,
        exceedance_frac=exceed / total,
        coverage_ok=bool(exceed / total <= IR + 1.0 / total),
        rows=rows,
    )
    (FIX / "reference.json").write_text(json.dumps(out, indent=2) + "\n")
    print(json.dumps(out, indent=2))


if __name__ == "__main__":
    main()
