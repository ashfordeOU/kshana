#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external gravity-gradient disturbance-torque reference.

ORACLE (independent, third-party): **Orekit 12.2 + Hipparchus 3.1** (CS GROUP /
the Hipparchus project, Apache-2.0), driven from a small Java program
`GgTorqueDriver.java`. Orekit/Hipparchus is the de-facto open-source flight-
dynamics library; Hipparchus supplies the tested Vector3D / RealMatrix linear
algebra used here.

WHAT IS VALIDATED AND WHY IT IS INDEPENDENT
-------------------------------------------
kshana's `attitude_budget::gravity_gradient_torque_max(alt, dI)` ships the SCALAR
peak closed form

        |T_max| = (3/2) * (mu / R^3) * |Imax - Imin|

which is the analytic maximum, over attitude, of the gravity-gradient torque on a
rigid body (attained at 45 deg between the minimum-inertia axis and nadir).

The oracle does NOT use that closed form. `GgTorqueDriver.java` evaluates the
FULL TENSOR torque

        T(body) = (3 mu / R^3) * ( nHat x ( I . nHat ) )

with Hipparchus `Vector3D.crossProduct` and `RealMatrix.operate` on a diagonal
principal-inertia tensor I = diag(Imin, Imid, Imax), and then NUMERICALLY
MAXIMISES |T| over a dense sweep of the nadir direction nHat in the body frame
(coarse spherical grid + iterative local refinement). The numeric peak of the
tensor expression is produced by a genuinely different code path (matrix-vector
product + cross product + brute-force search) than kshana's (3/2) scalar form, so
agreement is an external corroboration of kshana's *peak-attitude claim*, not a
self-consistency tautology.

CONSTANT PINNING (per the verification plan): mu and the geocentric radius are
pinned to kshana's exact constants (MU_EARTH = 3.986004418e14, R_eq = 6378137.0,
r = R_eq + altitude) so the comparison isolates the torque physics. As it
happens, Orekit's WGS84 constants equal these to the printed digits (the driver
prints both for the record). The genuine independence lives in the tensor
cross-product / numeric-maximisation, not in the constants.

PUBLISHED CROSS-LIST (Wertz/Sidi): the closed form itself is the textbook one —
Wertz, "Spacecraft Attitude Determination and Control" (SMAD lineage), and Sidi,
"Spacecraft Dynamics and Control" (Cambridge, 1997), eq. for T_gg =
(3/2)(mu/Rc^3)|Iz - Iy| sin(2 theta), maximised at theta = 45 deg. The published
LEO magnitude of the coefficient (3/2)(mu/R^3) is O(1e-6) s^-2 (e.g. ~2.0e-6 at
300 km / R = 6678 km geocentric); the reference rows below sit squarely in that
published band, which the Rust test asserts as an order-of-magnitude cross-check.

HONEST SCOPE: this validates the gravity-gradient TORQUE sub-claim (magnitude and
peak attitude) only. The RSS pointing-error budget (quadrature sum of 1 sigma
contributors) stays MODELLED — it has no external oracle here and is exercised by
the module's own unit tests.

Reproduce (offline; NO kshana code is imported here):

    source /tmp/kshana-oracles/orekit/cp.sh        # OREKIT_CP, OREKIT_DATA
    cp GgTorqueDriver.java /tmp/kshana-oracles/gg_torque/
    cd /tmp/kshana-oracles/gg_torque
    javac -cp "$OREKIT_CP" GgTorqueDriver.java
    java  -cp ".:$OREKIT_CP" GgTorqueDriver > attitude_gg_torque_reference.txt
    # (this script wraps those steps and copies the .txt next to itself)

The committed .txt IS the Orekit driver output, so the Rust test reads pinned
numbers and needs no Java/Python at CI time (same committed-fixture pattern as
tests/fixtures/lambert/).
"""

import os
import shutil
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DRIVER = "GgTorqueDriver.java"
WORK = "/tmp/kshana-oracles/gg_torque"
CP_SH = "/tmp/kshana-oracles/orekit/cp.sh"


def main() -> int:
    # Resolve OREKIT_CP by sourcing cp.sh in a subshell.
    cp = subprocess.run(
        ["bash", "-c", f"source {CP_SH} && echo $OREKIT_CP"],
        capture_output=True, text=True,
    )
    if cp.returncode != 0 or not cp.stdout.strip():
        sys.stderr.write("could not source Orekit classpath from cp.sh\n")
        return 1
    orekit_cp = cp.stdout.strip()

    os.makedirs(WORK, exist_ok=True)
    src = os.path.join(HERE, DRIVER)
    if not os.path.exists(src):
        sys.stderr.write(f"missing {src}\n")
        return 1
    shutil.copy(src, os.path.join(WORK, DRIVER))

    # Compile + run the Orekit driver.
    subprocess.run(["javac", "-cp", orekit_cp, DRIVER], cwd=WORK, check=True)
    run = subprocess.run(
        ["java", "-cp", f".:{orekit_cp}", "GgTorqueDriver"],
        cwd=WORK, capture_output=True, text=True, check=True,
    )
    sys.stdout.write(run.stdout)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
