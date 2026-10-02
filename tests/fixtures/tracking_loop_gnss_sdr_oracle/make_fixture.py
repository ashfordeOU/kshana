#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle side of tests/tracking_loop_gnss_sdr_oracle.rs.

For each recording: generate the IF with ifgen.py (numpy, independent of the engine), run
GNSS-SDR 0.0.19 on it with gnss_sdr_template.conf, read the tracking dump (MATLAB 7.3 file) and
compare the receiver's carrier and code phase with the analytic truth. The IF files are deleted
after use (they are regenerated bit for bit from the seeds below).

Usage (oracle toolchain: `source ~/Code/kshana-oracles/env.sh`):
  $ORACLE_PY make_fixture.py <work dir>
Writes gnss_sdr_results.csv (the rows the test reads) and gnss_sdr_runs.csv (every run's
statistics) next to this script.
"""
import os
import subprocess
import sys

import h5py
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import ifgen  # noqa: E402

T0 = 6.0  # statistics window start (s)
JITTER_CN0 = [30.0, 35.0, 40.0, 45.0]
SWEEP_CN0 = [float(c) for c in range(22, 35)]
PLL, PLL_PULLIN, DLL = 10.0, 20.0, 1.0
RATE, SLEW = 10.0, 0.1


def run_gnss_sdr(work, name, infile, pll_bw, dll_bw):
    with open(os.path.join(HERE, "gnss_sdr_template.conf")) as f:
        conf = f.read()
    dump = os.path.join(work, name + "_trk_ch")
    conf = conf.replace("{infile}", infile).replace("{pll_bw}", str(pll_bw)).replace(
        "{dll_bw}", str(dll_bw)).replace("{dump}", dump)
    cpath = os.path.join(work, name + ".conf")
    with open(cpath, "w") as f:
        f.write(conf)
    with open(os.path.join(work, name + ".log"), "w") as log:
        subprocess.run(["nice", "-n", "10", "gnss-sdr", "--config_file=" + cpath, "--log_dir=" + work],
                       check=True, stdout=log, stderr=subprocess.STDOUT, cwd=work)
    m = h5py.File(dump + "0.mat", "r")
    return {k: np.ravel(m[k][()]).astype(float) for k in m.keys()}


def own_corr(binfile, starts, rate=0.0, slew=0.0, length=4000):
    """Correlate the recording with the TRUE replica (code and carrier, no data sign) over
    [start, start + length) for each block start."""
    x = np.memmap(binfile, dtype=np.int8, mode="r")
    code = ifgen.ca_code(1)
    out = np.empty(len(starts), complex)
    for i, b in enumerate(starts.astype(np.int64)):
        n = np.arange(b, b + length)
        seg = x[2 * b: 2 * (b + length)].astype(float)
        phi, chi = ifgen.truth(n / ifgen.FS, rate, slew)
        out[i] = np.sum((seg[0::2] + 1j * seg[1::2]) * code[np.floor(chi).astype(np.int64) % 1023]
                        * np.exp(-1j * phi))
    return out


def errors(d, binfile, rate=0.0, slew=0.0, off=(0.0, 0.0)):
    """Carrier error (rad), code error (chips) and prompt phase (rad) in the statistics window.

    Carrier (amendment 2): the receiver's prompt correlator over the block that ends at
    PRN_start_sample_count is P = exp(j*eps) * X, where X is the same correlation taken with the
    true replica and eps the closed-loop carrier error; so eps = arg(P * conj(X)). The data sign
    and the measurement noise are common to P and X and cancel; the result is unwrapped (period
    pi, the Costas ambiguity) for slip counting."""
    s = d["PRN_start_sample_count"]
    sel = s / ifgen.FS >= T0
    tc = (s + d["aux1"]) / ifgen.FS
    _, chi = ifgen.truth(tc, rate, slew)
    code = (chi + 511.5) % 1023 - 511.5 - off[1]
    P = d["Prompt_I"] + 1j * d["Prompt_Q"]
    X = own_corr(binfile, s[sel] - 4000, rate, slew)
    car = np.unwrap(2.0 * (np.angle(P[sel] * np.conj(X)) - off[0])) / 2.0
    prompt = np.arctan(d["Prompt_Q"] / d["Prompt_I"])
    return car, code[sel], prompt[sel], s[sel] / ifgen.FS


def wrapped_std_deg(e):
    """Standard deviation (deg) of the error wrapped to +-90 deg about its circular mean."""
    mu = np.angle(np.mean(np.exp(2j * e))) / 2.0
    w = (e - mu + np.pi / 2) % np.pi - np.pi / 2
    return float(np.degrees(w.std()))


def slips(e, t):
    """Changes of round(ebar/pi), ebar the 100 ms moving average (in time) of the unwrapped
    carrier error."""
    c = np.concatenate([[0.0], np.cumsum(e)])
    lo = np.searchsorted(t, t - 0.05)
    hi = np.searchsorted(t, t + 0.05, side="right")
    ebar = (c[hi] - c[lo]) / (hi - lo)
    k = np.round(ebar / np.pi)
    return int(np.count_nonzero(np.diff(k)))


def main():
    work = sys.argv[1]
    os.makedirs(work, exist_ok=True)
    runs, res = [], []
    seed = [100]

    def recording(name, cn0, dur, rate=0.0, slew=0.0):
        seed[0] += 1
        path = os.path.join(work, name + ".bin")
        ifgen.write(path, cn0, dur, rate, slew, seed=seed[0])
        return path

    # convention calibration, 60 dB-Hz (constant Doppler)
    f = recording("cal", 60.0, 12.0)
    d = run_gnss_sdr(work, "cal", f, PLL, DLL)
    car, code, _, _ = errors(d, f)
    off_car = float(np.angle(np.mean(np.exp(2j * car))) / 2.0)
    off_code = float(code.mean())
    car, code, _, _ = errors(d, f, off=(off_car, off_code))
    os.remove(f)
    rms_car = float(np.degrees(np.sqrt(np.mean(((car + np.pi / 2) % np.pi - np.pi / 2) ** 2))))
    rms_code = float(np.sqrt(np.mean(code ** 2)))
    runs.append(("calibration", 60.0, PLL, DLL, rms_car, rms_code, 0, len(car)))
    assert rms_car < 1.0 and rms_code < 0.005, (rms_car, rms_code)
    off = (off_car, off_code)
    print("calibration: offsets %.4f rad %.5f chip; rms %.3f deg %.5f chip" % (off_car, off_code, rms_car, rms_code))

    for cn0 in JITTER_CN0:
        f = recording("jit%02d" % cn0, cn0, 126.0)
        d = run_gnss_sdr(work, "jit%02d" % cn0, f, PLL, DLL)
        car, code, _, t = errors(d, f, off=off)
        os.remove(f)
        sp, sd = wrapped_std_deg(car), float(code.std())
        runs.append(("jitter", cn0, PLL, DLL, sp, sd, slips(car, t), len(car)))
        res.append("pll_jitter_deg,%g,%g,%.6f" % (PLL, cn0, sp))
        res.append("dll_jitter_chips,%g,%g,%.7f" % (DLL, cn0, sd))
        print("jitter", cn0, sp, sd, flush=True)

    sweep = {PLL: [], PLL_PULLIN: []}
    for cn0 in SWEEP_CN0:
        f = recording("swp%02d" % cn0, cn0, 66.0)
        for bw in (PLL, PLL_PULLIN):
            name = "swp%02d_b%02d" % (cn0, bw)
            d = run_gnss_sdr(work, name, f, bw, DLL)
            car, code, _, t = errors(d, f, off=off)
            sp, sd, n = wrapped_std_deg(car), float(code.std()), slips(car, t)
            sweep[bw].append((cn0, sp, sd, n, len(car)))
            runs.append(("sweep", cn0, bw, DLL, sp, sd, n, len(car)))
            if n >= 1:
                res.append("slip_log10_mean_time_s,%g,%g,%d,%.4f" % (bw, cn0, n, np.log10((t[-1] - t[0]) / n)))
            print("sweep", cn0, bw, sp, sd, n, flush=True)
        os.remove(f)

    def crossing(rows):
        """Highest C/N0 where 3 sigma crosses 45 deg (linear in dB-Hz between bracketing points)."""
        rows = sorted(rows, reverse=True)
        for (c1, s1, *_), (c0, s0, *_) in zip(rows, rows[1:]):
            if 3 * s1 <= 45.0 < 3 * s0:
                return c1 + (45.0 - 3 * s1) * (c0 - c1) / (3 * s0 - 3 * s1)
        return float("nan")

    drop = crossing(sweep[PLL])
    relock = crossing(sweep[PLL_PULLIN])
    res.append("carrier_threshold_dbhz,%g,%.4f" % (PLL, drop))
    res.append("carrier_threshold_dbhz,%g,%.4f" % (PLL_PULLIN, relock))
    cs = sorted((c, sd) for c, _, sd, _, _ in sweep[PLL])
    dll3 = 3 * float(np.interp(drop, [c for c, _ in cs], [s for _, s in cs]))
    res.append("dll_3sigma_at_drop_chips,%g,%.6f" % (DLL, dll3))

    # dynamic stress: mean prompt-correlator phase under a Doppler rate
    f = recording("ramp", 45.0, 66.0, rate=RATE)
    d = run_gnss_sdr(work, "ramp", f, PLL, DLL)
    _, _, prompt, _ = errors(d, f, rate=RATE, off=off)
    os.remove(f)
    mean_deg = abs(float(np.degrees(prompt.mean())))
    runs.append(("ramp", 45.0, PLL, DLL, mean_deg, float("nan"), 0, len(prompt)))
    res.append("doppler_rate_mean_error_deg,%g,%g,%.5f" % (PLL, RATE, mean_deg))

    # code ramp lag under a code-carrier divergence
    f = recording("slew", 45.0, 66.0, slew=SLEW)
    d = run_gnss_sdr(work, "slew", f, PLL, DLL)
    _, code, _, _ = errors(d, f, slew=SLEW, off=off)
    os.remove(f)
    lag = abs(float(code.mean()))
    runs.append(("slew", 45.0, PLL, DLL, float("nan"), lag, 0, len(code)))
    res.append("code_ramp_lag_chips,%g,%g,%.6f" % (DLL, SLEW, lag))

    with open(os.path.join(HERE, "gnss_sdr_results.csv"), "w") as fo:
        fo.write("# GNSS-SDR 0.0.19 on ifgen.py recordings, by make_fixture.py; see the test header\n")
        fo.write("\n".join(res) + "\n")
    with open(os.path.join(HERE, "gnss_sdr_runs.csv"), "w") as fo:
        fo.write("# kind,cn0_dbhz,pll_bw_hz,dll_bw_hz,carrier_stat_deg,code_stat_chips,slips,epochs\n")
        fo.write("# carrier_stat: wrapped sigma (jitter, sweep), rms (calibration), |mean prompt phase| (ramp);"
                 " code_stat: sigma, rms (calibration), |mean| (slew)\n")
        for r in runs:
            fo.write("%s,%g,%g,%g,%.6f,%.7f,%d,%d\n" % r)


if __name__ == "__main__":
    main()
