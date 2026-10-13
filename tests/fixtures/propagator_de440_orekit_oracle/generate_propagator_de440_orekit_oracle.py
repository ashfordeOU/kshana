# SPDX-License-Identifier: AGPL-3.0-only
"""Orekit 12.2 reference states for the propagator's opt-in DE440 ephemeris tier.

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0), run as a separate program (java/De440Driver.java):
NumericalPropagator + DormandPrince853 in GCRF, NewtonianAttraction (GM 3.986004418e14),
ThirdBodyAttraction for the Sun and the Moon from Orekit's own DE440 reader on orekit-data's
DE-440-ephemerides/lnxp1990.440 (tier D1), plus cannonball SRP (P0 = 1361/c at 1 AU, spherical
Earth conical shadow, Cr 1.5, A/m 0.02 m^2/kg) on the same DE440 Sun (tier D2). kshana reads the
Sun and Moon from de440s_2024-03-18_2024-03-23.bsp (a bit-for-bit cut of NAIF de440s.bsp) through
KernelEphemeris: same DE440 integration, different file, format and reader.

Also prints Orekit's Sun and Moon GCRF positions at each output epoch (BODY lines).

REPRODUCE
  source /root/kshana-oracles/orekit/cp.sh
  (cd java && javac -cp "$OREKIT_CP" De440Driver.java)
  /root/kshana-oracles/.venv/bin/python generate_propagator_de440_orekit_oracle.py > propagator_de440_orekit_oracle.txt
"""
import json, math, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
MU = 3.986004418e14
EPOCH = 2460388.5  # 2024-03-19 00:00 TT


def circ(a, inc_deg):
    v = math.sqrt(MU / a); i = math.radians(inc_deg)
    return [a, 0.0, 0.0], [0.0, v * math.cos(i), v * math.sin(i)]


def heo():
    rp, ra = 6378137.0 + 1000e3, 40000e3
    a = 0.5 * (rp + ra); vp = math.sqrt(MU * (2 / rp - 1 / a)); i = math.radians(63.4)
    return [rp, 0.0, 0.0], [0.0, vp * math.cos(i), vp * math.sin(i)]


CASES = [("D1", "LEO", circ(7.0e6, 45.0)), ("D1", "GEO", circ(42164.0e3, 0.1)),
         ("D1", "HEO", heo()), ("D2", "LEO", circ(7.0e6, 45.0)), ("D2", "GEO", circ(42164.0e3, 0.1))]


def main():
    print("# Orekit 12.2 DE440 (lnxp1990.440) third-body / SRP reference; see the generator docstring.")
    print("# CASE <tier> <regime> | epoch_jd_tt | r0 | v0 ; STATE <tier> <regime> <k> <t_s> | r | v ; BODY <regime> <k> <t_s> | sun | moon (GCRF, m)")
    for tier, regime, (r0, v0) in CASES:
        req = dict(tier=tier, r0=r0, v0=v0, epoch_jd_tt=EPOCH, arc_seconds=86400.0, n_epochs=25,
                   tol=1e-11, cr=1.5, area_over_mass=0.02)
        p = subprocess.run(["java", "-cp", ".:" + os.environ["OREKIT_CP"], "De440Driver"],
                           input=json.dumps(req), capture_output=True, text=True,
                           cwd=os.path.join(HERE, "java"))
        if p.returncode != 0:
            sys.stderr.write(p.stdout + p.stderr); raise SystemExit(1)
        print("CASE {} {} | {!r} | {:.17e},{:.17e},{:.17e} | {:.17e},{:.17e},{:.17e}".format(tier, regime, EPOCH, *r0, *v0))
        for line in p.stdout.splitlines():
            f = line.split()
            if f[0] == "STATE":
                print(f"STATE {f[1]} {regime} {f[2]} {f[3]} | {f[4]} | {f[5]}")
            elif f[0] == "BODY":
                print(f"BODY {regime} {f[1]} {f[2]} | {f[3]} | {f[4]}")


if __name__ == "__main__":
    main()
