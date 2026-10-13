# SPDX-License-Identifier: AGPL-3.0-only
"""Orekit 12.2 reference states for the opt-in NRLMSISE-00 drag tier (RM-13, DS-PA-15).

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0), run as a separate program (java/DragDriver.java):
point-mass gravity (3.986004418e14) + DragForce(NRLMSISE00, IsotropicDrag(Cd*A/m, Cd = 1), mass
1 kg), DormandPrince853 in GCRF. Earth-fixed frame: rotation about GCRF z by the IAU 2000 Earth
rotation angle at UT1 = TT; WGS-84 shape; NRLMSISE00 driven with a "mean Sun" so its local solar
time is UT + lon/15 and with TT as its UT (kshana's conventions for this tier; checked separately
against pymsis to 5.2e-5). Constant F10.7a, F10.7 and Ap per case. Epoch 2024-06-01 00:00 TT.

REPRODUCE
  source /root/kshana-oracles/orekit/cp.sh
  (cd java && javac -cp "$OREKIT_CP" DragDriver.java)
  /root/kshana-oracles/.venv/bin/python generate_drag_tier_orekit_oracle.py > drag_tier_orekit_oracle.txt
"""
import json, math, os, subprocess, sys

MU, RE = 3.986004418e14, 6378137.0
EPOCH = 2460462.5
HERE = os.path.dirname(os.path.abspath(__file__))


def circ(alt, inc):
    a = RE + alt; v = math.sqrt(MU / a); i = math.radians(inc)
    return [a, 0.0, 0.0], [0.0, v * math.cos(i), v * math.sin(i)]


ACT = {"low": (70.0, 68.0, 4.0), "moderate": (150.0, 160.0, 15.0), "high": (230.0, 250.0, 80.0)}
CASES = [("L400", 400e3, "low"), ("M400", 400e3, "moderate"), ("H400", 400e3, "high"),
         ("M300", 300e3, "moderate")]


def main():
    print("# Orekit 12.2 NRLMSISE-00 drag-tier reference; see the generator docstring.")
    print("# CASE <id> | epoch_jd_tt | r0 | v0 | f107a | f107 | ap | cd_area_over_mass ; STATE <id> <k> <t_s> | r | v")
    for cid, alt, act in CASES:
        r0, v0 = circ(alt, 51.6)
        f107a, f107, ap = ACT[act]
        req = dict(r0=r0, v0=v0, epoch_jd_tt=EPOCH, arc_seconds=86400.0, n_epochs=25, tol=1e-11,
                   cd_area_over_mass=0.02, f107a=f107a, f107=f107, ap=ap)
        p = subprocess.run(["java", "-cp", ".:" + os.environ["OREKIT_CP"], "DragDriver"],
                           input=json.dumps(req), capture_output=True, text=True, cwd=os.path.join(HERE, "java"))
        if p.returncode != 0:
            sys.stderr.write(p.stdout + p.stderr); raise SystemExit(1)
        print(f"CASE {cid} | {EPOCH!r} | {r0[0]!r},{r0[1]!r},{r0[2]!r} | {v0[0]!r},{v0[1]!r},{v0[2]!r} | {f107a} | {f107} | {ap} | 0.02")
        for line in p.stdout.splitlines():
            f = line.split()
            print(f"STATE {cid} {f[1]} {f[2]} | {f[3]} | {f[4]}")


if __name__ == "__main__":
    main()
