#!/usr/bin/env python3
"""Fresh held-out IGS clocks and the tuned noise parameters for the extended clock filter.

Pre-registered protocol (see the header of tests/clock_state_ext_igs_fresh_oracle.rs); this
script is committed with that pre-registration, before the data it reads were fetched.

1. Fetch IGS final 30 s combined clocks IGS0OPSFIN_2025{244..257}0000_01D_30S_CLK.CLK.gz
   (2025-09-01 to 2025-09-14) from the BKG mirror of the IGS products into
   $KSHANA_ORACLES/data/realdata/igs/2025-09/ and record each file's SHA-256 (NOTICE.md).
2. Extract the GPS Block IIF PRNs G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32 (SVN 64-73
   and 62, IGS satellite metadata SINEX), keep epochs at whole multiples of 300 s.
3. Per satellite, on the FIRST HALF only (t < 7 days): maximum-likelihood tuning of
   theta = log10(R, q_wf, h_-1, q_rw, q_h) by Nelder-Mead (scipy.optimize.minimize, start
   (-24, -24, -29, -33, -26), xatol 0.02, fatol 0.05, maxfev 1500) of the Gaussian
   innovation negative log-likelihood sum(ln S + nu^2/S) over first-half epochs at
   t >= 86 400 s, from the same filter structure as `kshana::clock_state::ClockStateExt`
   (re-implemented here in numpy only to tune; the scored run is Kshana's own filter in
   the Rust test). Informational only: the allantools 2024.6 overlapping ADEV of the
   first half after removing a quadratic and the four periodic terms, and its
   non-negative fit sigma^2 = 3R/tau^2 + q_wf/tau + 2 ln2 h_-1 + q_rw tau/3.
4. Write clocks.txt (format below), ml_fit.csv, adev_first_half.csv.

clocks.txt:
    @<prn> R=<s^2> q_wf=<s^2/s> h_m1=<1> q_rw=<1/s> q_h=<s^2/s> first_bias_s=<s> nll=<..>
    <t / 300 s> <increment of (bias - first_bias) in integer units of 1e-13 s>

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/clock_state_ext_igs_fresh_oracle/generate.py
"""

import gzip
import hashlib
import os
import urllib.request

import allantools
import numpy as np
import scipy
from scipy.optimize import minimize, nnls

HERE = os.path.dirname(os.path.abspath(__file__))
ORACLES = os.environ.get("KSHANA_ORACLES", os.path.expanduser("~/Code/kshana-oracles"))
DEST = os.path.join(ORACLES, "data", "realdata", "igs", "2025-09")
BASE = "https://igs.bkg.bund.de/root_ftp/IGS/products"
DOYS = list(range(244, 258))  # 2025-09-01 .. 2025-09-14
DOY0 = 244
PRNS = "G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32".split()
STEP = 300
HALF = 7 * 86400
UNIT = 1e-13
T_REV = 43_082.05  # GPS orbital period, half a sidereal day (s)
N_HARM = 4
W = [2 * np.pi * k / T_REV for k in range(1, N_HARM + 1)]
TK = [1e2 * 10 ** (k / 2) for k in range(9)]  # flicker bank, 1e2 .. 1e6 s, two per decade
LOG_RATIO = np.log(10.0) / 2
TAUS = [STEP * 2**k for k in range(8)]
THETA0 = [-24.0, -24.0, -29.0, -33.0, -26.0]


def gps_week(doy):
    # 2025-08-31 (day 243) starts GPS week 2382.
    return 2382 + (doy - 243) // 7


def fetch():
    os.makedirs(DEST, exist_ok=True)
    shas = []
    for doy in DOYS:
        f = f"IGS0OPSFIN_2025{doy:03d}0000_01D_30S_CLK.CLK.gz"
        path = os.path.join(DEST, f)
        if not os.path.exists(path):
            url = f"{BASE}/{gps_week(doy)}/{f}"
            with urllib.request.urlopen(url, timeout=120) as r:
                data = r.read()
            open(path + ".part", "wb").write(data)
            os.replace(path + ".part", path)
        shas.append((f, hashlib.sha256(open(path, "rb").read()).hexdigest()))
    return shas


def extract():
    series = {p: {} for p in PRNS}
    for doy in DOYS:
        f = os.path.join(DEST, f"IGS0OPSFIN_2025{doy:03d}0000_01D_30S_CLK.CLK.gz")
        day = doy - DOY0
        with gzip.open(f, "rt") as fh:
            for ln in fh:
                if not ln.startswith("AS "):
                    continue
                p = ln.split()
                if p[1] not in series:
                    continue
                s = day * 86400 + int(p[5]) * 3600 + int(p[6]) * 60 + float(p[7])
                if abs(s - round(s)) > 1e-6:
                    continue
                s = int(round(s))
                if s % STEP == 0:
                    series[p[1]][s] = float(p[9])
    return series


def model(th, dt):
    r, qwf, h1, qrw, qh = th
    nb = len(TK)
    n = 3 + nb + 2 * N_HARM
    f = np.eye(n)
    q = np.zeros((n, n))
    f[0, 1] = dt
    f[0, 2] = dt * dt / 2
    f[1, 2] = dt
    q[0, 0] = qwf * dt + qrw * dt**3 / 3
    q[0, 1] = q[1, 0] = qrw * dt**2 / 2
    q[1, 1] = qrw * dt
    s2 = h1 * LOG_RATIO
    for i, t in enumerate(TK):
        a = 1 / t
        qk = 2 * s2 / t
        k = 3 + i
        e1 = -np.expm1(-a * dt)
        e2 = -np.expm1(-2 * a * dt)
        f[k, k] = 1 - e1
        f[0, k] = t * e1
        q[k, k] += qk * e2 / (2 * a)
        q[0, k] += qk / a * (e1 / a - e2 / (2 * a))
        q[k, 0] = q[0, k]
        q[0, 0] += qk / a**2 * (dt - 2 * e1 / a + e2 / (2 * a))
    for j, w in enumerate(W):
        k = 3 + nb + 2 * j
        c, s = np.cos(w * dt), np.sin(w * dt)
        f[k : k + 2, k : k + 2] = [[c, -s], [s, c]]
        q[k, k] += qh * dt
        q[k + 1, k + 1] += qh * dt
    h = np.zeros(n)
    h[0] = 1
    for j in range(N_HARM):
        h[3 + nb + 2 * j] = 1
    return f, q, h


def nll(theta, ts, z):
    th = 10.0 ** np.asarray(theta)
    cache = {}
    f, q, h = model(th, STEP)
    n = len(h)
    x = np.zeros(n)
    x[0] = z[0]
    p = np.zeros((n, n))
    p[0, 0], p[1, 1], p[2, 2] = 1e-12, 1e-18, 1e-32
    for i in range(len(TK)):
        p[3 + i, 3 + i] = th[2] * LOG_RATIO
    for k in range(3 + len(TK), n):
        p[k, k] = 1e-16
    r = th[0]
    tp = ts[0]
    out = 0.0
    for t, zz in zip(ts[1:], z[1:]):
        if t >= HALF:
            break
        dt = t - tp
        tp = t
        if dt not in cache:
            cache[dt] = model(th, dt)
        f, q, _ = cache[dt]
        x = f @ x
        p = f @ p @ f.T + q
        s = h @ p @ h + r
        nu = zz - h @ x
        if t >= 86400:
            out += np.log(s) + nu * nu / s
        k = p @ h / s
        x = x + k * nu
        a = np.eye(n) - np.outer(k, h)
        p = a @ p @ a.T + r * np.outer(k, k)
    return out


def adev_fit(ts, z):
    m = ts < HALF
    grid = np.arange(0, HALF, STEP).astype(float)
    x = np.interp(grid, ts[m], z[m])
    cols = [np.ones_like(grid), grid, grid * grid]
    for w in W:
        cols += [np.cos(w * grid), np.sin(w * grid)]
    d = np.column_stack(cols)
    sc = np.abs(d).max(0)
    coef, *_ = np.linalg.lstsq(d / sc, x, rcond=None)
    res = x - (d / sc) @ coef
    tau, ad, _, _ = allantools.oadev(res, rate=1.0 / STEP, data_type="phase", taus=np.array(TAUS, float))
    a = np.column_stack([3 / tau**2, 1 / tau, 2 * np.log(2) * np.ones_like(tau), tau / 3])
    c, _ = nnls(a / (ad**2)[:, None], np.ones_like(ad))
    return tau, ad, c


def main():
    shas = fetch()
    series = extract()
    out = [
        f"# IGS final clocks 2025-09-01..14, GPS IIF, {STEP} s; allantools {allantools.__version__}, "
        f"scipy {scipy.__version__}, numpy {np.__version__}\n"
    ]
    ml_rows = ["prn,n_first_half,n_second_half,log10_R,log10_q_wf,log10_h_m1,log10_q_rw,log10_q_h,nll,nfev"]
    adev_rows = ["prn,tau_s,oadev,nnls_R,nnls_q_wf,nnls_h_m1,nnls_q_rw"]
    for prn in PRNS:
        s = series[prn]
        tsi = sorted(s)
        if not tsi:
            print(f"{prn}: no records")
            continue
        b0 = s[tsi[0]]
        ts = np.array(tsi, float)
        z = np.array([s[t] - b0 for t in tsi])
        n1 = int((ts < HALF).sum())
        n2 = len(ts) - n1
        res = minimize(
            nll, THETA0, args=(ts, z), method="Nelder-Mead",
            options=dict(xatol=0.02, fatol=0.05, maxfev=1500),
        )
        th = 10.0 ** res.x
        tau, ad, c = adev_fit(ts, z)
        for t_, a_ in zip(tau, ad):
            adev_rows.append(f"{prn},{t_:.0f},{a_:.6e},{c[0]:.6e},{c[1]:.6e},{c[2]:.6e},{c[3]:.6e}")
        ml_rows.append(
            f"{prn},{n1},{n2}," + ",".join(f"{v:.4f}" for v in res.x) + f",{res.fun:.4f},{res.nfev}"
        )
        out.append(
            f"@{prn} R={th[0]:.6e} q_wf={th[1]:.6e} h_m1={th[2]:.6e} q_rw={th[3]:.6e} "
            f"q_h={th[4]:.6e} first_bias_s={b0!r} nll={res.fun:.4f}\n"
        )
        prev = 0
        for t in tsi:
            v = round((s[t] - b0) / UNIT)
            out.append(f"{t // STEP} {v - prev}\n")
            prev = v
        print(f"{prn}: n={len(ts)} ({n1}+{n2}) theta={np.round(res.x, 3)} nfev={res.nfev}", flush=True)
    open(os.path.join(HERE, "clocks.txt"), "w").write("".join(out))
    open(os.path.join(HERE, "ml_fit.csv"), "w").write("\n".join(ml_rows) + "\n")
    open(os.path.join(HERE, "adev_first_half.csv"), "w").write("\n".join(adev_rows) + "\n")
    open(os.path.join(HERE, "sources.sha256"), "w").write("".join(f"{h}  {f}\n" for f, h in shas))


if __name__ == "__main__":
    main()
