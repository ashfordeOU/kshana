# SPDX-License-Identifier: AGPL-3.0-only
"""GMAT adapter for the flight-dynamics reference integration (roadmap C7).

GMAT reads a trajectory through its ephemeris propagators: `CCSDS-OEM` for an OEM (interpolated
with Lagrange polynomials) and `SPK` for a SPICE kernel. This adapter writes one GMAT script per
file, so that one leg's failure cannot stop the other. In each, a spacecraft loads Kshana's file and
GMAT steps it through the file at 600 s, which is the trajectory's own node spacing, starting at the
file's first epoch. Each step stops at the next node's TDB epoch (a `TDBModJulian` stop condition),
not after a fixed elapsed time: GMAT counts elapsed time in A.1 seconds, and over the file's 30 days
the TDB−TT periodic term drifts 600 A.1 seconds away from 600 TDB seconds, by about 0.28 ms by the
end. The second run of the job, stepping by elapsed time, ended 3.2e-9 day past the kernel's
coverage and GMAT halted. At every step GMAT reports the epoch (`TDBModJulian`) and the Moon-centred state,
at 16 significant digits:

- the OEM in a Moon-centred ICRF frame (its `REF_FRAME` is ICRF);
- the SPK in a Moon-centred MJ2000Eq frame. The kernel's frame code is 1 (J2000), which GMAT
  reads as MJ2000Eq, so no frame-bias rotation is applied to the stored states.

GMAT R2026a, as shipped, refuses an OEM of version 2.0 (`CCSDS_OEM_VERS = 2.0`, the version Kshana
writes): its `CCSDS-OEM` propagator stops the mission with `OEM_V2_REFUSAL` unless GMAT runs in its
TESTING mode. The adapter does not turn that mode on, since GMAT would then no longer be the tool as
shipped. `run_oem` returns GMAT's outcome either way, and the notebook accepts exactly two: the OEM
carried, or that refusal.

Each script runs in GMAT's console program, `GmatConsole --run <script>`, in GMAT's `bin`
directory. `GMAT_ROOT` names the installation, the directory that holds `bin/`.

GMAT reports its states rather than handing back the file's records. So the comparison is the one
for an evaluating tool (`kshana_fd.evaluated_compare`), with SPICE's evaluation printed at the
report's 16 digits so that both pass through the same readout (NAMING.md, the 8-9 November
amendment). GMAT's own epoch arithmetic is part of what is compared.

Written without running GMAT in the session that wrote it; GMAT's binaries run only in the workflow
job, whose logs drive the fixes. The first run reached the OEM leg and stopped there with
OEM_V2_REFUSAL, before the SPK leg. The second ran the SPK leg to its last step, which stepped
past the kernel's coverage (see above); the epoch stop condition is the fix, tested by the next job.
"""
from __future__ import annotations

import os
import subprocess
from pathlib import Path

#: GMAT's modified Julian date is JD - 2430000.0, so J2000 (JD 2451545.0) is MJD 21545.0.
GMAT_MJD_J2000 = 21545.0

OEM_SCRIPT = """
Create Spacecraft OemSat;
OemSat.EphemerisName = '{oem}';

Create Propagator OemProp;
OemProp.Type = 'CCSDS-OEM';
OemProp.StepSize = {step};

Create CoordinateSystem LunaICRF;
LunaICRF.Origin = Luna;
LunaICRF.Axes = ICRF;

Create ReportFile OemReport;
OemReport.Filename = '{out}/gmat_oem.txt';
OemReport.Precision = {digits};
OemReport.WriteHeaders = false;

Create Variable k t;

BeginMissionSequence;

Report OemReport OemSat.TDBModJulian OemSat.LunaICRF.X OemSat.LunaICRF.Y OemSat.LunaICRF.Z OemSat.LunaICRF.VX OemSat.LunaICRF.VY OemSat.LunaICRF.VZ;
For k = 1:{steps};
   t = {mjd0} + k * {step_days};
   Propagate OemProp(OemSat) {{OemSat.TDBModJulian = t}};
   Report OemReport OemSat.TDBModJulian OemSat.LunaICRF.X OemSat.LunaICRF.Y OemSat.LunaICRF.Z OemSat.LunaICRF.VX OemSat.LunaICRF.VY OemSat.LunaICRF.VZ;
EndFor;
"""

SPK_SCRIPT = """
Create Spacecraft SpkSat;
SpkSat.NAIFId = {naif};
SpkSat.OrbitSpiceKernelName = {{'{bsp}'}};
SpkSat.DateFormat = TDBGregorian;
SpkSat.Epoch = '{start_gregorian}';

Create Propagator SpkProp;
SpkProp.Type = SPK;
SpkProp.StepSize = {step};
SpkProp.CentralBody = Luna;
SpkProp.StartEpoch = FromSpacecraft;

Create CoordinateSystem LunaJ2000;
LunaJ2000.Origin = Luna;
LunaJ2000.Axes = MJ2000Eq;

Create ReportFile SpkReport;
SpkReport.Filename = '{out}/gmat_spk.txt';
SpkReport.Precision = {digits};
SpkReport.WriteHeaders = false;

Create Variable k t;

BeginMissionSequence;

Report SpkReport SpkSat.TDBModJulian SpkSat.LunaJ2000.X SpkSat.LunaJ2000.Y SpkSat.LunaJ2000.Z SpkSat.LunaJ2000.VX SpkSat.LunaJ2000.VY SpkSat.LunaJ2000.VZ;
For k = 1:{steps};
   t = {mjd0} + k * {step_days};
   Propagate SpkProp(SpkSat) {{SpkSat.TDBModJulian = t}};
   Report SpkReport SpkSat.TDBModJulian SpkSat.LunaJ2000.X SpkSat.LunaJ2000.Y SpkSat.LunaJ2000.Z SpkSat.LunaJ2000.VX SpkSat.LunaJ2000.VY SpkSat.LunaJ2000.VZ;
EndFor;
"""

#: Significant digits of GMAT's reports: ReportFile's largest Precision. The comparison prints
#: SPICE's evaluation at the same precision (NAMING.md, the 8-9 November amendment).
REPORT_DIGITS = 16

#: What GMAT R2026a prints when its `CCSDS-OEM` propagator is given an OEM of version 2.0 outside
#: its TESTING mode (first CI run of the `gmat` job, at open commit 150df8d41).
OEM_V2_REFUSAL = "Usage of CCSDS OEM v2 ephemeris data file is only allowed for running in TESTING mode"

MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]


def gmat_root() -> Path:
    """The GMAT installation named by GMAT_ROOT."""
    root = os.environ.get("GMAT_ROOT")
    if not root:
        raise RuntimeError("GMAT_ROOT is not set: it names the GMAT installation (the directory with bin/)")
    return Path(root)


def gregorian(label: str) -> str:
    """`2023-03-01T00:00:00.0000` as GMAT's `01 Mar 2023 00:00:00.000`."""
    date, time = label.split("T")
    y, m, d = date.split("-")
    hh, mm, ss = time.split(":")
    return f"{int(d):02d} {MONTHS[int(m) - 1]} {y} {hh}:{mm}:{float(ss):06.3f}"


def tdb_mjd(et: float) -> float:
    """TDB seconds past J2000 as GMAT's TDB modified Julian date, rounded once."""
    from decimal import Decimal

    return float(Decimal(repr(et)) / Decimal(86400) + Decimal(repr(GMAT_MJD_J2000)))


def _console(script: Path, log_name: str) -> tuple[int, str]:
    """Run one script in GmatConsole; returns (exit code, console output), the output also saved."""
    p = subprocess.run(["./GmatConsole", "--run", str(script.resolve())], cwd=gmat_root() / "bin",
                       capture_output=True, text=True, timeout=3600)
    log = p.stdout + p.stderr
    (script.parent / log_name).write_text(log)
    return p.returncode, log


def run_spk(bsp: Path, out: Path, first_label: str, first_et: float, n: int, naif: int = -1176,
            step_s: float = 600.0) -> tuple[Path, str]:
    """GMAT's SPK propagator through Kshana's kernel. Returns (report, console output); raises if
    GMAT fails."""
    out.mkdir(parents=True, exist_ok=True)
    script = out / "kshana_c7_spk.script"
    script.write_text(SPK_SCRIPT.format(bsp=Path(bsp).resolve(), out=out.resolve(), naif=naif,
                                        start_gregorian=gregorian(first_label), step=step_s, steps=n - 1,
                                        mjd0=repr(tdb_mjd(first_et)), step_days=repr(step_s / 86400.0),
                                        digits=REPORT_DIGITS))
    code, log = _console(script, "gmat_console_spk.log")
    if code != 0:
        raise RuntimeError(f"GmatConsole exited with {code} on the SPK script:\n{log[-4000:]}")
    return out / "gmat_spk.txt", log


def run_oem(oem: Path, out: Path, first_et: float, n: int, step_s: float = 600.0) -> tuple[Path | None, str]:
    """GMAT's CCSDS-OEM propagator through Kshana's OEM, as written. Returns (report, console output)
    when GMAT runs it, and (None, console output) when GMAT refuses the file with OEM_V2_REFUSAL.
    Any other failure raises."""
    out.mkdir(parents=True, exist_ok=True)
    script = out / "kshana_c7_oem.script"
    script.write_text(OEM_SCRIPT.format(oem=Path(oem).resolve(), out=out.resolve(), step=step_s, steps=n - 1,
                                        mjd0=repr(tdb_mjd(first_et)), step_days=repr(step_s / 86400.0),
                                        digits=REPORT_DIGITS))
    code, log = _console(script, "gmat_console_oem.log")
    if code == 0:
        return out / "gmat_oem.txt", log
    if OEM_V2_REFUSAL in log:
        return None, log
    raise RuntimeError(f"GmatConsole exited with {code} on the OEM script:\n{log[-4000:]}")


def read_report(path: Path) -> tuple[list[float], list[list[float]], list[str]]:
    """A GMAT report written by `run`: (epochs as TDB seconds past J2000, states, epoch texts)."""
    ets, states, texts = [], [], []
    for line in Path(path).read_text().splitlines():
        f = line.split()
        if len(f) != 7:
            continue
        texts.append(f[0])
        ets.append((float(f[0]) - GMAT_MJD_J2000) * 86400.0)
        states.append([float(x) for x in f[1:]])
    return ets, states, texts


def epochs_equal(texts: list[str], want_ets: list[float]) -> tuple[list[bool], float]:
    """Each reported epoch against the written one, to the precision of the report: equal when the
    written epoch, as a GMAT MJD, is within one unit of the last digit GMAT printed (the printed
    value is itself the rounding of a double). Also returns the largest difference in seconds."""
    from decimal import Decimal

    ok, worst = [], 0.0
    for t, e in zip(texts, want_ets):
        got = Decimal(t)
        want = Decimal(repr(e)) / Decimal(86400) + Decimal(repr(GMAT_MJD_J2000))
        unit = Decimal(1).scaleb(got.as_tuple().exponent)
        ok.append(abs(got - want) <= unit)
        worst = max(worst, float(abs(got - want)) * 86400.0)
    return ok, worst
