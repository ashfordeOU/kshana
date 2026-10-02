#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the IGS GPS Block IIF 30 s clock fixture of 2026-04-01..14 (IGS0OPSFIN_2026091..104).

The same converter, selection rule and format as
tests/fixtures/clock_library_device_cards_oracle/generate.py, on a second window that no test
has opened. Used by tests/clock_library_periodic_cards_oracle.rs and, decimated to 300 s, by
tests/clock_state_ext_igs_conditioned_oracle.rs. Committed with their pre-registration, before
it was first run.

Usage: generate.py <directory for the downloads>
"""
import gzip
import sys
from datetime import datetime, timedelta
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "clock_library_device_cards_oracle"))
import generate as d9  # noqa: E402

d9.START = datetime(2026, 4, 1)
START, DAYS, EPOCHS, UNIT = d9.START, d9.DAYS, d9.EPOCHS, d9.UNIT


def main():
    dl = Path(sys.argv[1])
    dl.mkdir(parents=True, exist_ok=True)
    meta = d9.fetch(d9.META, dl / "igs_satellite_metadata.snx")
    prns = d9.iif_prns(meta.read_text(errors="replace"))
    srcs = [f"{d9.sha(meta)}  igs_satellite_metadata.snx"]
    series = {p: {} for p in prns}
    for k in range(DAYS):
        d = START + timedelta(days=k)
        doy = d.timetuple().tm_yday
        week = (d - datetime(1980, 1, 6)).days // 7
        name = f"IGS0OPSFIN_{d.year}{doy:03d}0000_01D_30S_CLK.CLK.gz"
        p = d9.fetch(f"https://igs.bkg.bund.de/root_ftp/IGS/products/{week}/{name}", dl / name)
        srcs.append(f"{d9.sha(p)}  {name}")
        for ln in gzip.decompress(p.read_bytes()).decode().splitlines():
            if not ln.startswith("AS "):
                continue
            f = ln.split()
            if f[1] not in series:
                continue
            t = datetime(int(f[2]), int(f[3]), int(f[4]), int(f[5]), int(f[6])) + timedelta(
                seconds=float(f[7]))
            idx = (t - START).total_seconds() / 30.0
            if abs(idx - round(idx)) > 1e-6 or not 0 <= round(idx) < EPOCHS:
                continue
            series[f[1]].setdefault(int(round(idx)), float(f[9].replace("D", "E")))
    with open(HERE / "igs_iif_30s.txt", "w") as fh:
        fh.write("# IGS final combined 30 s clocks 2026-04-01..14 (IGS0OPSFIN_2026091..104), GPS Block IIF\n")
        fh.write("# per PRN: @PRN svn=SVN first_bias_s=B; then 'k d': epoch index, bias increment in 1e-14 s\n")
        for p in sorted(series):
            s = series[p]
            if not s:
                continue
            ks = sorted(s)
            base = s[ks[0]]
            fh.write(f"@{p} svn={prns[p]} first_bias_s={base!r}\n")
            prev = 0
            for k in ks:
                q = round((s[k] - base) / UNIT)
                fh.write(f"{k} {q - prev}\n")
                prev = q
    (HERE / "sources.sha256").write_text("\n".join(srcs) + "\n")
    print("PRNs:", " ".join(f"{p}({prns[p]})" for p in sorted(prns)))


if __name__ == "__main__":
    main()
