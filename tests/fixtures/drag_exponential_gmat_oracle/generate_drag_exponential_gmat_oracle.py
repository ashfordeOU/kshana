# SPDX-License-Identifier: AGPL-3.0-only
"""GMAT R2022a reference for the default exponential drag (WP-01, drag cross-check, GMAT leg).

Pre-registration: xval/drag-exponential-gmat/PREREGISTRATION.md (cases, conventions, bars).
For each case GMAT runs twice (Exponential drag, Cd = 2.0, DragArea = 0.01 m^2, DryMass = 1 kg;
and no drag), point-mass Earth (JGM-2 degree 0), PrinceDormand78 (Accuracy 1e-13, MaxStep 60 s),
EarthMJ2000Eq, epoch 2000-01-01 12:00:00.000 TT, reporting the state every hour for 24 h.

REPRODUCE
  GMAT=/path/to/GMAT/R2022a   (gmat-ubuntu-x64-R2022a.tar.gz from sourceforge.net/projects/gmat)
  python3 -I generate_drag_exponential_gmat_oracle.py "$GMAT" > drag_exponential_gmat_oracle.txt
"""
import math
import os
import subprocess
import sys
import tempfile

MU = 3.986004418e14   # only to build kshana-convention initial velocities; GMAT uses its own mu
RE = 6378137.0
CASES = [  # id, perigee altitude m, apogee altitude m, inclination deg
    ("E400", 400e3, 400e3, 0.0),
    ("E300", 300e3, 300e3, 0.0),
    ("E250x600", 250e3, 600e3, 0.0),
    ("I400", 400e3, 400e3, 51.6),
]


def initial_state(hp, ha, inc_deg):
    rp, ra = RE + hp, RE + ha
    a = 0.5 * (rp + ra)
    vp = math.sqrt(MU * (2.0 / rp - 1.0 / a))
    i = math.radians(inc_deg)
    return [rp, 0.0, 0.0], [0.0, vp * math.cos(i), vp * math.sin(i)]


def script(r, v, drag, report):
    fm = [
        "Create ForceModel FM;",
        "GMAT FM.CentralBody = Earth;",
        "GMAT FM.PrimaryBodies = {Earth};",
        "GMAT FM.GravityField.Earth.Degree = 0;",
        "GMAT FM.GravityField.Earth.Order = 0;",
        "GMAT FM.GravityField.Earth.PotentialFile = 'JGM2.cof';",
        "GMAT FM.Drag.AtmosphereModel = %s;" % ("Exponential" if drag else "None"),
        "GMAT FM.SRP = Off;",
    ]
    lines = [
        "Create Spacecraft S;",
        "GMAT S.DateFormat = TTGregorian;",
        "GMAT S.Epoch = '01 Jan 2000 12:00:00.000';",
        "GMAT S.CoordinateSystem = EarthMJ2000Eq;",
        "GMAT S.DisplayStateType = Cartesian;",
    ] + ["GMAT S.%s = %.17g;" % (k, x / 1000.0) for k, x in zip(("X", "Y", "Z", "VX", "VY", "VZ"), r + v)] + [
        "GMAT S.Cd = 2.0;",
        "GMAT S.DragArea = 0.01;",
        "GMAT S.DryMass = 1.0;",
    ] + fm + [
        "Create Propagator PR;",
        "GMAT PR.FM = FM;",
        "GMAT PR.Type = PrinceDormand78;",
        "GMAT PR.Accuracy = 1e-13;",
        "GMAT PR.MinStep = 0;",
        "GMAT PR.MaxStep = 60;",
        "GMAT PR.InitialStepSize = 10;",
        "Create ReportFile RF;",
        "GMAT RF.Filename = '%s';" % report,
        "GMAT RF.Precision = 17;",
        "GMAT RF.WriteHeaders = false;",
        "Create Variable I;",
        "BeginMissionSequence;",
        "Report RF S.TTModJulian S.EarthMJ2000Eq.X S.EarthMJ2000Eq.Y S.EarthMJ2000Eq.Z S.EarthMJ2000Eq.VX S.EarthMJ2000Eq.VY S.EarthMJ2000Eq.VZ;",
        "For I = 1:24;",
        "   Propagate PR(S) {S.ElapsedSecs = 3600};",
        "   Report RF S.TTModJulian S.EarthMJ2000Eq.X S.EarthMJ2000Eq.Y S.EarthMJ2000Eq.Z S.EarthMJ2000Eq.VX S.EarthMJ2000Eq.VY S.EarthMJ2000Eq.VZ;",
        "EndFor;",
    ]
    return "\n".join(lines) + "\n"


def run(gmat, r, v, drag):
    with tempfile.TemporaryDirectory() as d:
        rep = os.path.join(d, "states.txt")
        path = os.path.join(d, "case.script")
        with open(path, "w") as f:
            f.write(script(r, v, drag, rep))
        bindir = os.path.join(gmat, "bin")
        res = subprocess.run([os.path.join(bindir, "GmatConsole"), "--run", path], cwd=bindir,
                             capture_output=True, text=True, timeout=1800)
        if res.returncode != 0 or not os.path.exists(rep):
            sys.exit("GMAT failed:\n" + res.stdout[-3000:] + res.stderr[-3000:])
        rows = [list(map(float, l.split())) for l in open(rep) if l.strip()]
    if len(rows) != 25:
        sys.exit("expected 25 states, got %d" % len(rows))
    return rows


def main():
    gmat = sys.argv[1]
    print("# GMAT R2022a exponential-drag reference; see xval/drag-exponential-gmat/PREREGISTRATION.md.")
    print("# CASE id | r0 (m) | v0 (m/s) ; STATE id drag|nodrag k | t_s | r (m) | v (m/s)")
    for cid, hp, ha, inc in CASES:
        r, v = initial_state(hp, ha, inc)
        print("CASE %s | %s | %s" % (cid, ",".join("%.17g" % x for x in r), ",".join("%.17g" % x for x in v)))
        for tag, drag in (("drag", True), ("nodrag", False)):
            rows = run(gmat, r, v, drag)
            for k, row in enumerate(rows):
                t = (row[0] - rows[0][0]) * 86400.0   # TTModJulian, so t is TT seconds past the epoch
                rr = ",".join("%.17e" % (x * 1000.0) for x in row[1:4])
                vv = ",".join("%.17e" % (x * 1000.0) for x in row[4:7])
                print("STATE %s %s %d | %.6f | %s | %s" % (cid, tag, k, t, rr, vv))


if __name__ == "__main__":
    main()
