# SPDX-License-Identifier: AGPL-3.0-only
"""Generate Orekit 12.2 reference states for the kshana numerical Cowell propagator.

ORACLE
------
Orekit 12.2 (CS GROUP, Apache-2.0) + Hipparchus 3.1, the de-facto open-source
flight-dynamics reference library, driving its `NumericalPropagator` with the
`DormandPrince853` adaptive integrator. The force models matched are:
  HolmesFeatherstoneAttractionModel (unnormalised J2..J6 zonal, GM=3.986004418e14,
  Re=6378137), ThirdBodyAttraction (Sun, Moon), SolarRadiationPressure /
  IsotropicRadiationSingleCoefficient (cannonball), DragForce / IsotropicDrag.

WHAT THIS VALIDATES (honest scope)
----------------------------------
This is an INTEGRATOR + FORCE-ALGEBRA cross-check. The two codebases integrate the
SAME dynamics from byte-identical initial states and physical constants, with two
independent adaptive RK integrators (kshana RK4 step-doubling / DP5(4); Orekit
DP8(5,3)). It validates that kshana's Cowell propagator and its six-perturbation
force model produce the same forward integral as Orekit, tier by tier:
  T1 two-body | T2 +J2 | T3 +full J2..J6 zonal | T4 +Sun/Moon third body |
  T5 +cannonball SRP | T6 +exponential drag.

To keep T4/T5 a TRUE integrator/force-algebra check (and not a test of two
DIFFERENT ephemerides), the Java driver is fed kshana's OWN Montenbruck-Gill
low-precision Sun/Moon series (ported verbatim into PropDriver.java) through an
Orekit CelestialBody, so both stacks consume the IDENTICAL perturber positions.

What it does NOT validate: the absolute fidelity of the perturber ephemerides
(kshana's M&G series is low-precision by design) and the absolute atmospheric
density (kshana's 28-band piecewise-exponential vs the local exponential fit fed
to Orekit for T6). Those input models stay MODELLED; T6 is therefore a
CHARACTERISATION tier (order-of-magnitude / directional), not a tight validation.

Integration frame: kshana integrates in a plain non-rotating ECI; the Orekit
driver integrates in a STATIC inertial frame that is an identity transform of GCRF
(no precession/nutation/Earth-rotation). The zonal field is axially symmetric, so a
static z-aligned gravity body frame reproduces kshana's inertial zonal acceleration
exactly.

REPRODUCE
---------
  source /tmp/kshana-oracles/orekit/cp.sh
  cd tests/fixtures/numerical_cowell_propagator/java && javac -cp "$OREKIT_CP" PropDriver.java
  cd ../  # back to the fixture dir
  /tmp/kshana-oracles/.venv/bin/python generate_numerical_cowell_propagator_reference.py \
      > numerical_cowell_propagator_reference.txt
The .txt is COMMITTED so the Rust test has no Java/Python runtime dependency.
"""

import json
import math
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
JAVA_DIR = os.path.join(HERE, "java")

MU_EARTH = 3.986004418e14
RE_EARTH = 6378137.0
JD_J2000 = 2451545.0
ARC_SECONDS = 86400.0   # 24 h
N_EPOCHS = 25           # hourly, inclusive of t=0
TOL = 1e-11             # Orekit position-tolerance seed for DP853


def orekit_cp():
    d = "/tmp/kshana-oracles/orekit"
    jars = [
        "orekit-12.2.jar",
        "hipparchus-core-3.1.jar",
        "hipparchus-geometry-3.1.jar",
        "hipparchus-ode-3.1.jar",
        "hipparchus-optim-3.1.jar",
        "hipparchus-fitting-3.1.jar",
        "hipparchus-stat-3.1.jar",
        "hipparchus-filtering-3.1.jar",
    ]
    return ":".join(os.path.join(d, j) for j in jars)


def run_driver(req):
    cp = ".:" + orekit_cp()
    env = dict(os.environ)
    env["OREKIT_DATA"] = "/tmp/kshana-oracles/orekit/orekit-data-main"
    p = subprocess.run(
        ["java", "-cp", cp, "PropDriver"],
        input=json.dumps(req),
        capture_output=True,
        text=True,
        cwd=JAVA_DIR,
        env=env,
    )
    if p.returncode != 0:
        sys.stderr.write(p.stdout)
        sys.stderr.write(p.stderr)
        raise RuntimeError(f"PropDriver failed for tier {req['tier']} ({req.get('regime')})")
    return p.stdout


def circular_leo():
    """a = 7000 km, i = 45 deg circular (the propagator.rs canonical LEO state)."""
    a = 7.0e6
    v = math.sqrt(MU_EARTH / a)
    inc = math.radians(45.0)
    r0 = [a, 0.0, 0.0]
    v0 = [0.0, v * math.cos(inc), v * math.sin(inc)]
    return r0, v0


def gto():
    """A geostationary-transfer orbit: perigee ~ 400 km alt, apogee ~ GEO, i = 28.5 deg.
    Start at perigee on +x, velocity in a plane inclined 28.5 deg about x."""
    rp = RE_EARTH + 400e3          # perigee radius
    ra = 42164e3                   # apogee radius (GEO)
    a = 0.5 * (rp + ra)
    # vis-viva speed at perigee
    vp = math.sqrt(MU_EARTH * (2.0 / rp - 1.0 / a))
    inc = math.radians(28.5)
    r0 = [rp, 0.0, 0.0]
    v0 = [0.0, vp * math.cos(inc), vp * math.sin(inc)]
    return r0, v0


# Drag band that kshana's 28-band piecewise-exponential atmosphere uses at the seed
# altitude. For the LEO-drag case below the satellite sits in the 400-450 km band, whose
# kshana parameters are (h0=400 km, rho0=3.725e-12 kg/m^3, H=58.515 km). Feeding Orekit
# this exact band makes the quadratic-drag + co-rotating-atmosphere ALGEBRA comparable
# over the arc where the orbit stays within that band.
DRAG_BAND = dict(rho0=3.725e-12, h0=400e3, scale=58.515e3)


def make_req(tier, regime, r0, v0, drag_seed=None):
    req = dict(
        r0=r0,
        v0=v0,
        epoch_jd_tt=JD_J2000,
        tier=tier,
        cr=1.5,
        area_over_mass=0.02,
        cd_area_over_mass=0.02,
        arc_seconds=ARC_SECONDS,
        n_epochs=N_EPOCHS,
        tol=TOL,
        regime=regime,
    )
    if drag_seed:
        req["drag_rho0"] = drag_seed["rho0"]
        req["drag_h0"] = drag_seed["h0"]
        req["drag_scale"] = drag_seed["scale"]
    else:
        # harmless defaults (unused unless tier == T6)
        req["drag_rho0"] = DRAG_BAND["rho0"]
        req["drag_h0"] = DRAG_BAND["h0"]
        req["drag_scale"] = DRAG_BAND["scale"]
    return req


def drag_leo():
    """A 400 km circular orbit for the drag tier (denser atmosphere => measurable decay)."""
    a = RE_EARTH + 400e3
    v = math.sqrt(MU_EARTH / a)
    inc = math.radians(45.0)
    r0 = [a, 0.0, 0.0]
    v0 = [0.0, v * math.cos(inc), v * math.sin(inc)]
    return r0, v0


def emit_header():
    print("# Orekit 12.2 (Apache-2.0) NumericalPropagator + DormandPrince853 reference states.")
    print("# Generated by generate_numerical_cowell_propagator_reference.py (see its docstring).")
    print("# Force tiers: T1 two-body, T2 +J2, T3 +J2..J6 zonal, T4 +Sun/Moon, T5 +SRP, T6 +drag.")
    print("# Perturber positions for T4/T5 are kshana's OWN M&G series (isolates integrator+algebra).")
    print("# Constants: GM=3.986004418e14 Re=6378137; J2..J6 = 1.08262668e-3,-2.5327e-6,-1.6196e-6,")
    print("#            -2.2730e-7,5.4068e-7; MU_SUN=1.32712440018e20 MU_MOON=4.902800066e12;")
    print("#            AU=1.495978707e11 P0=1361/c. epoch_jd_tt=2451545.0 (J2000 TT).")
    print("# CASE line:  CASE <tier> <regime> | r0(m)=x,y,z | v0(m/s)=x,y,z | cr | area_over_mass |")
    print("#             cd_area_over_mass | drag_rho0 | drag_h0 | drag_scale")
    print("# STATE line: STATE <tier> <regime> <k> <t_s> | rx,ry,rz (m) | vx,vy,vz (m/s)")


def emit_case(req, raw):
    r0 = req["r0"]
    v0 = req["v0"]
    print(
        "CASE {tier} {regime} | r0={r0} | v0={v0} | {cr} | {aom} | {cdaom} | "
        "{rho0} | {h0} | {scale}".format(
            tier=req["tier"],
            regime=req["regime"],
            r0="{:.9e},{:.9e},{:.9e}".format(*r0),
            v0="{:.9e},{:.9e},{:.9e}".format(*v0),
            cr=req["cr"],
            aom=req["area_over_mass"],
            cdaom=req["cd_area_over_mass"],
            rho0=req["drag_rho0"],
            h0=req["drag_h0"],
            scale=req["drag_scale"],
        )
    )
    for line in raw.splitlines():
        if not line.startswith("STATE "):
            continue
        # STATE <tier> <k> <t> <r-csv> <v-csv>   (driver does not know the regime)
        parts = line.split()
        tier = parts[1]
        k = parts[2]
        t = parts[3]
        rcsv = parts[4]
        vcsv = parts[5]
        print(
            "STATE {tier} {regime} {k} {t} | {r} | {v}".format(
                tier=tier, regime=req["regime"], k=k, t=t, r=rcsv, v=vcsv
            )
        )


def main():
    emit_header()

    leo_r0, leo_v0 = circular_leo()
    gto_r0, gto_v0 = gto()
    dleo_r0, dleo_v0 = drag_leo()

    # Conservative tiers over both regimes (LEO + GTO).
    for tier in ("T1", "T2", "T3", "T4", "T5"):
        for regime, (r0, v0) in (("LEO", (leo_r0, leo_v0)), ("GTO", (gto_r0, gto_v0))):
            req = make_req(tier, regime, r0, v0)
            raw = run_driver(req)
            emit_case(req, raw)

    # Drag tier (T6): on the dense 400 km LEO orbit, with kshana's matching atmosphere band.
    req = make_req("T6", "LEO", dleo_r0, dleo_v0, drag_seed=DRAG_BAND)
    raw = run_driver(req)
    emit_case(req, raw)


if __name__ == "__main__":
    main()
