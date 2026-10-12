#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
# PIN-SCOPE:    the derived numbers of tests/iq_track_gnss_sdr_oracle.rs (results.csv,
#               calibration.csv, engine_epochs.sha256): GNSS-SDR 0.0.19 and `kshana iq track`
#               on the same numpy recordings, measured against the analytic truth
# PIN-EXCLUDES: the recordings and the tracking dumps themselves (regenerated, not committed);
#               every other engine output
"""Driver of tests/iq_track_gnss_sdr_oracle.rs (pre-registration: PREREGISTRATION.md here).

For each recording: generate the IF with ../tracking_loop_gnss_sdr_oracle/ifgen.py (numpy,
independent of the engine), run GNSS-SDR 0.0.19 on it with gnss_sdr_template.conf and
`kshana iq track` on it with design.toml, and measure both receivers' carrier and code error,
Doppler, C/N0, phase lock indicator and lock against the analytic truth. The recordings, the
GNSS-SDR dumps and the engine epoch files are deleted after use (unless --keep).

Usage:
  KSHANA_BIN=<path to a release kshana> python3 make_fixture.py <work dir> [--keep]
  python3 make_fixture.py <work dir> --recordings-only   # regenerate the recordings only
Writes results.csv, calibration.csv and engine_epochs.sha256 next to this script.
"""
import csv
import hashlib
import json
import os
import subprocess
import sys

import h5py
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "tracking_loop_gnss_sdr_oracle"))
import ifgen  # noqa: E402

T0 = 6.0  # statistics window start (s)
TRUE_DOPPLER = ifgen.FD
# (name, C/N0 after the 4 s lead, duration s); seeds 201 onwards in this order
RECORDINGS = [("cal", 60.0, 12.0), ("t30", 30.0, 66.0), ("t35", 35.0, 66.0),
              ("t40", 40.0, 66.0), ("t45", 45.0, 66.0)]
SEED0 = 201
DESIGN = """schema = "kshana.loop-design/1"
[[design]]
name = "gnss-sdr-matched"
[design.integration]
coherent_periods = 1
spacing_chips = 0.5
[design.carrier]
kind = "pll"
pll_order = 2
pll_bw_hz = 15.0
pll_discriminator = "costas-atan"
[design.code]
order = 1
bw_hz = 2.0
discriminator = "eml-envelope"
carrier_aiding = true
"""


def write_recording(work, name, cn0, dur, seed):
    data = os.path.join(work, name + ".sigmf-data")
    ifgen.write(data, cn0, dur, seed=seed)
    meta = {"global": {"core:datatype": "ci8", "core:sample_rate": ifgen.FS,
                       "core:version": "1.0.0"},
            "captures": [{"core:sample_start": 0, "core:frequency": 1575420000.0}],
            "annotations": []}
    with open(os.path.join(work, name + ".sigmf-meta"), "w") as f:
        json.dump(meta, f)
    return data


def run_gnss_sdr(work, name, infile):
    with open(os.path.join(HERE, "gnss_sdr_template.conf")) as f:
        conf = f.read()
    dump = os.path.join(work, name + "_trk_ch")
    conf = conf.replace("{infile}", infile).replace("{dump}", dump)
    cpath = os.path.join(work, name + ".conf")
    with open(cpath, "w") as f:
        f.write(conf)
    with open(os.path.join(work, name + ".gnss-sdr.log"), "w") as log:
        subprocess.run(["nice", "-n", "10", "gnss-sdr", "--config_file=" + cpath, "--log_dir=" + work],
                       check=True, stdout=log, stderr=subprocess.STDOUT, cwd=work)
    m = h5py.File(dump + "0.mat", "r")
    d = {k: np.ravel(m[k][()]).astype(float) for k in m.keys()}
    os.remove(dump + "0.mat")
    return d


def run_engine(work, name):
    kshana = os.environ.get("KSHANA_BIN", "kshana")
    dpath = os.path.join(work, "design.toml")
    with open(dpath, "w") as f:
        f.write(DESIGN)
    out = os.path.join(work, name + ".epochs.csv")
    with open(os.path.join(work, name + ".kshana.log"), "w") as log:
        subprocess.run(["nice", "-n", "10", kshana, "iq", "track", os.path.join(work, name + ".sigmf-meta"),
                        "--signal", "gps-l1ca", "--prn", "1", "--design", dpath, "--epochs", out],
                       check=True, stdout=log, stderr=subprocess.STDOUT, cwd=work)
    with open(out, "rb") as f:
        sha = hashlib.sha256(f.read()).hexdigest()
    cols = {}
    with open(out) as f:
        rows = list(csv.DictReader(f))
    os.remove(out)
    for k in ("sample_index", "t_coh_s", "p_i", "p_q", "doppler_hz", "code_rate_hz",
              "code_phase_chips", "pli", "cn0_nwpr_dbhz", "cn0_m2m4_dbhz", "cn0_beaulieu_dbhz"):
        cols[k] = np.array([float(r[k]) if r[k] != "" else np.nan for r in rows])
    cols["locked"] = np.array([r["state"] == "LOCKED" for r in rows])
    return cols, sha


def correlate(binfile, ends, lengths, chi_end, rate):
    """X: the recording over the `lengths[i]` samples ending before `ends[i]`, correlated with
    a code replica of phase `chi_end[i]` at sample `ends[i]` running at `rate[i]` chips/s (the
    receiver's own replica), and with the TRUE carrier."""
    x = np.memmap(binfile, dtype=np.int8, mode="r")
    code = ifgen.ca_code(1)
    out = np.empty(len(ends), complex)
    for i in range(len(ends)):
        e, n0 = int(ends[i]), int(lengths[i])
        n = np.arange(e - n0, e)
        seg = x[2 * (e - n0): 2 * e].astype(float)
        phi, _ = ifgen.truth(n / ifgen.FS)
        chi = chi_end[i] - (e - n) * rate[i] / ifgen.FS
        out[i] = np.sum((seg[0::2] + 1j * seg[1::2]) * code[np.floor(chi).astype(np.int64) % 1023]
                        * np.exp(-1j * phi))
    return out


def wrap_code(c):
    return (c + 511.5) % 1023.0 - 511.5


def measure_gnss_sdr(d, binfile):
    s = d["PRN_start_sample_count"]
    sel = s / ifgen.FS >= T0
    a1 = d["aux1"]
    # receiver code epoch (its replica's chip 0) at sample s + aux1
    _, chi = ifgen.truth((s + a1) / ifgen.FS)
    code = -wrap_code(chi)
    P = d["Prompt_I"] + 1j * d["Prompt_Q"]
    # the replica's phase at sample s: 1023 - aux1 * rate / fs (its epoch is aux1 samples on)
    rate = d["code_freq_chips"]
    X = correlate(binfile, s[sel], np.full(sel.sum(), 4000), 1023.0 - a1[sel] * rate[sel] / ifgen.FS,
                  rate[sel])
    return {"P": P[sel], "X": X, "code": code[sel], "t": s[sel] / ifgen.FS,
            "doppler": d["carrier_doppler_hz"][sel], "cn0": d["CN0_SNV_dB_Hz"][sel],
            "pli": d["carrier_lock_test"][sel]}


def measure_engine(e, binfile):
    s = e["sample_index"]
    sel = s / ifgen.FS >= T0
    idx = np.nonzero(sel)[0]
    _, chi = ifgen.truth(s / ifgen.FS)
    code = wrap_code(e["code_phase_chips"] - chi)
    lengths = np.round(e["t_coh_s"] * ifgen.FS)
    rate_prev = e["code_rate_hz"][idx - 1]
    X = correlate(binfile, s[sel], lengths[sel], e["code_phase_chips"][sel], rate_prev)
    P = e["p_i"] + 1j * e["p_q"]
    return {"P": P[sel], "X": X, "code": code[sel], "t": s[sel] / ifgen.FS,
            "doppler": e["doppler_hz"][sel], "cn0": e["cn0_nwpr_dbhz"][sel], "pli": e["pli"][sel],
            "m2m4": e["cn0_m2m4_dbhz"][sel], "beaulieu": e["cn0_beaulieu_dbhz"][sel],
            "locked": e["locked"][sel]}


def carrier_error(m, off=0.0):
    """Unwrapped (period pi, the Costas ambiguity) carrier error arg(P X*) - off, rad."""
    return np.unwrap(2.0 * (np.angle(m["P"] * np.conj(m["X"])) - off)) / 2.0


def wrapped_std_deg(e):
    mu = np.angle(np.mean(np.exp(2j * e))) / 2.0
    w = (e - mu + np.pi / 2) % np.pi - np.pi / 2
    return float(np.degrees(w.std()))


def slips(e, t):
    c = np.concatenate([[0.0], np.cumsum(e)])
    lo = np.searchsorted(t, t - 0.05)
    hi = np.searchsorted(t, t + 0.05, side="right")
    ebar = (c[hi] - c[lo]) / (hi - lo)
    return int(np.count_nonzero(np.diff(np.round(ebar / np.pi))))


def stats(m, off):
    car = carrier_error(m, off[0])
    code = m["code"] - off[1]
    df = m["doppler"] - TRUE_DOPPLER
    last = m["t"] >= m["t"][-1] - 1.0
    n_slip = slips(car, m["t"])
    max_code = float(np.abs(code).max())
    last_df = float(df[last].mean())
    held = n_slip == 0 and max_code < 0.5 and abs(last_df) < 5.0
    out = {"sigma_pll_deg": wrapped_std_deg(car), "sigma_dll_chips": float(code.std()),
           "doppler_mean_hz": float(df.mean()), "doppler_std_hz": float(df.std()),
           "cn0_mean_dbhz": float(np.nanmean(m["cn0"])), "pli_mean": float(np.mean(m["pli"])),
           "slips": n_slip, "max_code_err_chips": max_code, "last_s_doppler_err_hz": last_df,
           "lock_held": int(held), "epochs": len(car),
           "pp_ratio": float(np.mean(np.abs(m["P"]) / np.abs(m["X"])))}
    for k in ("m2m4", "beaulieu"):
        out["cn0_%s_mean_dbhz" % k] = float(np.nanmean(m[k])) if k in m else float("nan")
    out["locked_fraction"] = float(np.mean(m["locked"])) if "locked" in m else float("nan")
    return out


RESULT_COLS = ["recording", "cn0_dbhz", "receiver", "sigma_pll_deg", "sigma_dll_chips",
               "doppler_mean_hz", "doppler_std_hz", "cn0_mean_dbhz", "pli_mean", "slips",
               "max_code_err_chips", "last_s_doppler_err_hz", "lock_held", "epochs", "pp_ratio",
               "cn0_m2m4_mean_dbhz", "cn0_beaulieu_mean_dbhz", "locked_fraction"]


def main():
    work = sys.argv[1]
    keep = "--keep" in sys.argv
    os.makedirs(work, exist_ok=True)
    if "--recordings-only" in sys.argv:
        with open(os.path.join(work, "design.toml"), "w") as f:
            f.write(DESIGN)
        for k, (name, cn0, dur) in enumerate(RECORDINGS):
            write_recording(work, name, cn0, dur, SEED0 + k)
        return
    results, cal_rows, shas = [], [], []
    off = {}
    for k, (name, cn0, dur) in enumerate(RECORDINGS):
        f = write_recording(work, name, cn0, dur, SEED0 + k)
        meas = {"gnss-sdr": measure_gnss_sdr(run_gnss_sdr(work, name, f), f)}
        eng, sha = run_engine(work, name)
        meas["kshana"] = measure_engine(eng, f)
        shas.append("%s  %s" % (sha, name))
        if not keep:
            os.remove(f)
        if name == "cal":
            for rx, m in meas.items():
                car = carrier_error(m)
                o_car = float(np.angle(np.mean(np.exp(2j * car))) / 2.0)
                o_code = float(m["code"].mean())
                car = carrier_error(m, o_car)
                rms_car = float(np.degrees(np.sqrt(np.mean(((car + np.pi / 2) % np.pi - np.pi / 2) ** 2))))
                rms_code = float(np.sqrt(np.mean((m["code"] - o_code) ** 2)))
                ppr = float(np.mean(np.abs(m["P"]) / np.abs(m["X"])))
                off[rx] = (o_car, o_code)
                cal_rows.append("%s,%.6f,%.7f,%.6f,%.6f,%.7f" % (rx, rms_car, rms_code, ppr, o_car, o_code))
                print("calibration", rx, rms_car, rms_code, ppr, flush=True)
                if not (rms_car < 1.0 and rms_code < 0.005 and abs(ppr - 1.0) <= 0.01):
                    with open(os.path.join(HERE, "calibration.csv"), "w") as fo:
                        fo.write("# receiver,carrier_rms_deg,code_rms_chips,mean_P_over_X,carrier_offset_rad,code_offset_chips\n")
                        fo.write("\n".join(cal_rows) + "\n")
                    sys.exit("calibration failed for %s: comparison not run" % rx)
            continue
        for rx, m in meas.items():
            st = stats(m, off[rx])
            row = [name, "%g" % cn0, rx] + [("%.7g" % st[c]) if isinstance(st[c], float) else str(st[c])
                                           for c in RESULT_COLS[3:]]
            results.append(",".join(row))
            print(",".join(row), flush=True)
    with open(os.path.join(HERE, "calibration.csv"), "w") as fo:
        fo.write("# PIN-SCOPE: convention calibration of make_fixture.py (60 dB-Hz recording)\n")
        fo.write("# PIN-EXCLUDES: everything else\n")
        fo.write("# receiver,carrier_rms_deg,code_rms_chips,mean_P_over_X,carrier_offset_rad,code_offset_chips\n")
        fo.write("\n".join(cal_rows) + "\n")
    with open(os.path.join(HERE, "results.csv"), "w") as fo:
        fo.write("# PIN-SCOPE: GNSS-SDR 0.0.19 and kshana iq track on the make_fixture.py recordings\n")
        fo.write("# PIN-EXCLUDES: the recordings and dumps (regenerated); see PREREGISTRATION.md\n")
        fo.write("# " + ",".join(RESULT_COLS) + "\n")
        fo.write("\n".join(results) + "\n")
    with open(os.path.join(HERE, "engine_epochs.sha256"), "w") as fo:
        fo.write("\n".join(shas) + "\n")


if __name__ == "__main__":
    main()
