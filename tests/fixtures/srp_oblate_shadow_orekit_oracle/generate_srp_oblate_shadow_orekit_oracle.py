# SPDX-License-Identifier: AGPL-3.0-only
"""Orekit 12.2 lighting ratios for the oblate-Earth SRP shadow (FUT-09 / RM-11).

Geometry (all inertial, metres; the WGS-84 ellipsoid axis is the inertial z axis):
  Sun s = AU * (cos d, 0, sin d) for Sun declination d in {0, +23.44, -23.44} deg.
  Anti-Sun unit a = -s/|s|; e1 = unit(z x a); e2 = a x e1.
  Satellite r = rho * (cos(th) a + sin(th) (cos(psi) e1 + sin(psi) e2)), for
  rho in {6778.137, 7378.137, 26560, 42164} km, psi in 0..315 deg step 45, and th swept over
  +-0.012 rad around the spherical shadow edge asin(Re/rho) in 25 steps.
The fixture stores (id, rho, d, psi, th) and Orekit's lighting ratio with a WGS-84 and with a
spherical (f = 0) OneAxisEllipsoid of equatorial radius 6378137 m (Sun radius: Orekit's
Constants.SUN_RADIUS = 6.957e8 m, AU = 1.495978707e11 m). The Rust test rebuilds r and s with the
same formulas.

REPRODUCE
  source /root/kshana-oracles/orekit/cp.sh
  (cd java && javac -cp "$OREKIT_CP" ShadowDriver.java)
  /root/kshana-oracles/.venv/bin/python generate_srp_oblate_shadow_orekit_oracle.py > srp_oblate_shadow_orekit_oracle.txt
"""
import math, os, subprocess

AU, RE = 1.495978707e11, 6378137.0
HERE = os.path.dirname(os.path.abspath(__file__))


def geometry(rho, d_deg, psi_deg, th):
    d, psi = math.radians(d_deg), math.radians(psi_deg)
    s = [AU * math.cos(d), 0.0, AU * math.sin(d)]
    a = [-math.cos(d), 0.0, -math.sin(d)]
    e1 = [-a[1], a[0], 0.0]  # z x a
    n = math.hypot(e1[0], e1[1]); e1 = [e1[0] / n, e1[1] / n, 0.0]
    e2 = [a[1] * e1[2] - a[2] * e1[1], a[2] * e1[0] - a[0] * e1[2], a[0] * e1[1] - a[1] * e1[0]]
    u = [math.cos(psi) * e1[k] + math.sin(psi) * e2[k] for k in range(3)]
    r = [rho * (math.cos(th) * a[k] + math.sin(th) * u[k]) for k in range(3)]
    return r, s


def main():
    rows, lines = [], []
    k = 0
    for rho_km in (6778.137, 7378.137, 26560.0, 42164.0):
        rho = rho_km * 1e3
        edge = math.asin(RE / rho)
        for d in (0.0, 23.44, -23.44):
            for psi in range(0, 360, 45):
                for i in range(25):
                    th = edge - 0.012 + 0.024 * i / 24
                    r, s = geometry(rho, d, float(psi), th)
                    rows.append((k, rho, d, float(psi), th))
                    lines.append(f"{k} {r[0]!r} {r[1]!r} {r[2]!r} {s[0]!r} {s[1]!r} {s[2]!r}")
                    k += 1
    p = subprocess.run(["java", "-cp", ".:" + os.environ["OREKIT_CP"], "ShadowDriver"],
                       input="\n".join(lines) + "\n", capture_output=True, text=True,
                       cwd=os.path.join(HERE, "java"), check=True)
    nu = {int(l.split()[0]): l.split()[1:] for l in p.stdout.splitlines()}
    print("# Orekit 12.2 SolarRadiationPressure.getLightingRatio; see the generator docstring.")
    print("# id rho_m sun_dec_deg psi_deg theta_rad nu_wgs84 nu_sphere")
    for k, rho, d, psi, th in rows:
        print(f"{k} {rho!r} {d!r} {psi!r} {th!r} {nu[k][0]} {nu[k][1]}")


if __name__ == "__main__":
    main()
