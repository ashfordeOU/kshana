// SPDX-License-Identifier: AGPL-3.0-only
//
// Independent gravity-gradient disturbance-torque oracle, built on Orekit 12.2 +
// Hipparchus 3.1 (CS GROUP / Hipparchus, Apache-2.0). Java 21.
//
// WHAT THIS COMPUTES (and why it is an INDEPENDENT check):
// The gravity-gradient torque on a rigid body in a central field is the FULL
// tensor expression
//        T(body) = (3 * mu / R^3) * ( nHat x ( I . nHat ) )
// where nHat is the unit nadir vector expressed in the body frame and I is the
// principal inertia tensor (diagonal: Imin, Imid, Imax). kshana instead ships
// the *scalar peak* closed form |T_max| = (3/2)(mu/R^3) * |Imax - Imin|, which is
// the analytic maximum of |T(theta)| over attitude (attained at 45 deg between
// the minimum-inertia axis and nadir).
//
// This driver does NOT use kshana's closed form. It evaluates the tensor
// cross-product T(body) with Hipparchus Vector3D / RealMatrix linear algebra and
// then NUMERICALLY MAXIMISES |T| over a dense grid of body attitudes (the nadir
// direction swept over the sphere). The numeric maximum of the tensor expression
// is therefore produced by a genuinely different code path (matrix.operate +
// cross product + brute-force search) than kshana's analytic (3/2) formula. If
// the two agree, kshana's *peak-attitude claim* is externally corroborated.
//
// CONVENTION PINNING: per the task brief, mu and the geocentric radius are pinned
// to kshana's exact constants (MU_EARTH = 3.986004418e14, R_eq = 6378137.0, r =
// R_eq + altitude) so the comparison isolates the torque physics, not constant
// drift. The driver also PRINTS Orekit's own WGS84 mu / equatorial radius so the
// (small) convention difference is documented in the fixture header.
//
// Reproduce:
//   source /tmp/kshana-oracles/orekit/cp.sh
//   javac -cp "$OREKIT_CP" GgTorqueDriver.java
//   java  -cp ".:$OREKIT_CP" GgTorqueDriver

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.linear.Array2DRowRealMatrix;
import org.hipparchus.linear.RealMatrix;
import org.orekit.utils.Constants;

public class GgTorqueDriver {

    // Pinned to kshana::orbit constants exactly (see task brief: same mu + radius).
    static final double MU_EARTH = 3.986004418e14;      // m^3/s^2
    static final double R_EQ     = 6378137.0;            // m (equatorial radius)

    // Altitude grid (km) x delta-inertia grid (kg*m^2), per the planned matrix.
    static final double[] ALT_KM    = {300.0, 400.0, 600.0, 800.0, 1200.0};
    static final double[] DELTA_I   = {1.0, 10.0, 40.0, 100.0};

    /** Tensor gravity-gradient torque magnitude at a given nadir direction (body frame). */
    static double torqueMag(RealMatrix inertia, double coeff, Vector3D nHat) {
        // I . nHat
        double[] n = {nHat.getX(), nHat.getY(), nHat.getZ()};
        double[] In = inertia.operate(n);
        Vector3D inertiaTimesN = new Vector3D(In[0], In[1], In[2]);
        // T = coeff * ( nHat x (I . nHat) ),  coeff = 3 mu / R^3
        Vector3D t = new Vector3D(coeff, Vector3D.crossProduct(nHat, inertiaTimesN));
        return t.getNorm();
    }

    /** Brute-force numeric maximum of |T| over attitude, using ONLY the tensor form. */
    static double numericTmax(double imin, double imid, double imax, double coeff) {
        // Body principal-inertia tensor, diagonal. Body axes = principal axes.
        RealMatrix inertia = new Array2DRowRealMatrix(new double[][] {
                {imin, 0.0, 0.0},
                {0.0, imid, 0.0},
                {0.0, 0.0, imax},
        }, false);

        double best = 0.0;
        // Coarse spherical sweep of the nadir direction in body frame, then a
        // fine local refinement around the best coarse point. The maximum of the
        // tensor torque is found purely numerically (no closed form used).
        int nTheta = 1440;  // polar  [0, pi]
        int nPhi   = 2880;  // azimuth[0, 2pi)
        double bestTheta = 0.0, bestPhi = 0.0;
        for (int i = 0; i <= nTheta; i++) {
            double theta = Math.PI * i / nTheta;
            double st = Math.sin(theta), ct = Math.cos(theta);
            for (int j = 0; j < nPhi; j++) {
                double phi = 2.0 * Math.PI * j / nPhi;
                Vector3D nHat = new Vector3D(st * Math.cos(phi), st * Math.sin(phi), ct);
                double m = torqueMag(inertia, coeff, nHat);
                if (m > best) { best = m; bestTheta = theta; bestPhi = phi; }
            }
        }
        // Fine refinement around the coarse optimum.
        for (int pass = 0; pass < 6; pass++) {
            double dTheta = Math.PI / nTheta / Math.pow(8.0, pass);
            double dPhi   = 2.0 * Math.PI / nPhi / Math.pow(8.0, pass);
            double bt = bestTheta, bp = bestPhi;
            for (int i = -20; i <= 20; i++) {
                double theta = bt + dTheta * i;
                if (theta < 0 || theta > Math.PI) continue;
                double st = Math.sin(theta), ct = Math.cos(theta);
                for (int j = -20; j <= 20; j++) {
                    double phi = bp + dPhi * j;
                    Vector3D nHat = new Vector3D(st * Math.cos(phi), st * Math.sin(phi), ct);
                    double m = torqueMag(inertia, coeff, nHat);
                    if (m > best) { best = m; bestTheta = theta; bestPhi = phi; }
                }
            }
        }
        return best;
    }

    public static void main(String[] args) {
        System.out.println("# Gravity-gradient disturbance-torque reference (INDEPENDENT oracle).");
        System.out.println("# Oracle: Orekit 12.2 + Hipparchus 3.1 (CS GROUP / Hipparchus, Apache-2.0), Java 21.");
        System.out.println("# Method: full tensor T = (3 mu/R^3) (nHat x (I.nHat)) evaluated with Hipparchus");
        System.out.println("#   Vector3D/RealMatrix linear algebra, then |T| NUMERICALLY MAXIMISED over attitude.");
        System.out.println("#   This is a different code path from kshana's scalar (3/2)(mu/R^3)|Imax-Imin| peak.");
        System.out.printf ("# Pinned constants (== kshana::orbit): MU_EARTH=%.10e m^3/s^2, R_eq=%.1f m, r=R_eq+alt.%n", MU_EARTH, R_EQ);
        System.out.printf ("# Orekit WGS84 reference (for the record): MU=%.10e m^3/s^2, R_eq=%.4f m (NOT used here; we pin to kshana's).%n",
                Constants.WGS84_EARTH_MU, Constants.WGS84_EARTH_EQUATORIAL_RADIUS);
        System.out.println("# Consumed by tests/attitude_gg_torque_reference.rs. See generate_attitude_gg_torque_reference.py / GgTorqueDriver.java.");
        System.out.println("# GG name | altitude_km | delta_inertia_kg_m2 | T_max_Nm   [SI]");

        for (double altKm : ALT_KM) {
            double altM = altKm * 1000.0;
            double r = R_EQ + altM;
            double coeff = 3.0 * MU_EARTH / (r * r * r);  // 3 mu / R^3
            for (double dI : DELTA_I) {
                // Build a body with min-inertia Imin and max-inertia Imax = Imin + dI.
                // The peak GG torque depends only on (Imax - Imin); the middle axis
                // value (Imid) does not change the global maximum. We place Imid at
                // the midpoint to exercise a non-degenerate full tensor.
                double imin = 50.0;
                double imax = imin + dI;
                double imid = 0.5 * (imin + imax);
                double tmax = numericTmax(imin, imid, imax, coeff);
                String name = String.format("alt%.0f_dI%.0f", altKm, dI);
                System.out.printf("GG %s | %.1f | %.1f | %.15e%n", name, altKm, dI, tmax);
            }
        }
    }
}
