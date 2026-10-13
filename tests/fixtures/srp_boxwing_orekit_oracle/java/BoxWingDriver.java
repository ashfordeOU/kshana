// SPDX-License-Identifier: AGPL-3.0-only
// Orekit 12.2 reference for the box-wing / ECOM2 SRP comparison (DS-PA-14).
// Pre-registration: xval/srp-boxwing-orekit/PREREGISTRATION.md (conventions 1-7, geometry, bars).
// Writes the fixture to stdout: the panel tables it used, every geometry (r, v, s), the
// attitudes, and Orekit's accelerations and partials. Full double precision (%.17e).
import java.util.*;
import org.hipparchus.CalculusFieldElement;
import org.hipparchus.analysis.differentiation.Gradient;
import org.hipparchus.analysis.differentiation.GradientField;
import org.hipparchus.geometry.euclidean.threed.*;
import org.orekit.attitudes.Attitude;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.forces.*;
import org.orekit.forces.radiation.*;
import org.orekit.frames.*;
import org.orekit.gnss.attitude.GenericGNSS;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.propagation.FieldSpacecraftState;
import org.orekit.propagation.SpacecraftState;
import org.orekit.time.*;
import org.orekit.utils.*;

public class BoxWingDriver {
    static final double MU = 3.986004418e14;
    static final double AU = 1.495978707e11;           // kshana ephem::AU_M
    static final double P_AU = 1361.0 / 299792458.0;   // kshana forces::SRP_PRESSURE_AU
    static final double A = 29599801.0, INC = Math.toRadians(56.0), RE = 6378137.0;
    static final double H = 1e-3;                      // finite-difference step on rho, delta

    static String f(double x) { return String.format(Locale.ROOT, "%.17e", x); }
    static String v3(Vector3D v) { return f(v.getX()) + "," + f(v.getY()) + "," + f(v.getZ()); }

    // ---- panel tables (IGS body frame; convention 1) --------------------------------------
    // One row: kind (0 fixed, 1 wing about +Y), area, normal (mechanical frame for fixed), alpha, rho, delta.
    static double[][] foc() {
        double[] a = {0.93, 0.00, 0.07}, b = {0.57, 0.22, 0.21}, c = {0.08, 0.73, 0.19},
                 d = {0.90, 0.10, 0.00}, e = {0.92, 0.08, 0.00};
        return new double[][] {
            fx(0.440, 1, 0, 0, a), fx(0.880, 1, 0, 0, c), fx(1.320, -1, 0, 0, a),
            fx(1.129, 0, 1, 0, a), fx(1.654, 0, 1, 0, c), fx(1.244, 0, -1, 0, a), fx(1.539, 0, -1, 0, c),
            fx(1.053, 0, 0, 1, a), fx(1.969, 0, 0, 1, b), fx(2.077, 0, 0, -1, a), fx(0.959, 0, 0, -1, c),
            wg(3.880, e), wg(1.530, d), wg(3.880, e), wg(1.530, d)};
    }
    static double[][] iov(boolean eol) {
        double[] mli = {0.94, 0.00, 0.06}, osr = eol ? new double[] {0.25, 0.60, 0.15} : new double[] {0.10, 0.72, 0.18},
                 ge = {0.57, 0.22, 0.21}, cells = {0.92, 0.08, 0.00}, hn = {0.90, 0.10, 0.00};
        return new double[][] {
            fx(1.32, -1, 0, 0, mli), fx(0.54, 1, 0, 0, mli), fx(0.78, 1, 0, 0, osr),
            fx(1.00, 0, 1, 0, mli), fx(2.00, 0, 1, 0, osr), fx(1.03, 0, -1, 0, mli), fx(1.97, 0, -1, 0, osr),
            fx(1.72, 0, 0, 1, mli), fx(1.28, 0, 0, 1, ge), fx(3.00, 0, 0, -1, mli),
            wg(3.88, cells), wg(1.53, hn), wg(3.88, cells), wg(1.53, hn)};
    }
    // Mechanical -> IGS frame: 180 deg about Z (x -> -x, y -> -y).
    static double[] fx(double area, double x, double y, double z, double[] m) {
        return new double[] {0, area, -x == 0 ? 0.0 : -x, -y == 0 ? 0.0 : -y, z, m[0], m[1], m[2]};
    }
    static double[] wg(double area, double[] m) { return new double[] {1, area, 0, 1, 0, m[0], m[1], m[2]}; }

    static List<Panel> panels(double[][] t, ExtendedPVCoordinatesProvider sun, int which, double dRho, double dDelta) {
        List<Panel> out = new ArrayList<>();
        for (int i = 0; i < t.length; i++) {
            double rho = t[i][6], delta = t[i][7];
            if (i == which) { rho += dRho; delta += dDelta; }
            double alpha = 1.0 - rho - delta;   // Orekit's diffuse is 1 - alpha - rho = delta
            Vector3D n = new Vector3D(t[i][2], t[i][3], t[i][4]);
            out.add(t[i][0] == 0
                ? new FixedPanel(n, t[i][1], false, 0.0, 0.0, alpha, rho)
                : new PointingPanel(n, sun, t[i][1], 0.0, 0.0, alpha, rho));
        }
        return out;
    }

    static ExtendedPVCoordinatesProvider fixedSun(final Vector3D s) {
        return new ExtendedPVCoordinatesProvider() {
            public TimeStampedPVCoordinates getPVCoordinates(AbsoluteDate d, Frame fr) {
                return new TimeStampedPVCoordinates(d, s, Vector3D.ZERO);
            }
            public <T extends CalculusFieldElement<T>> TimeStampedFieldPVCoordinates<T>
            getPVCoordinates(FieldAbsoluteDate<T> d, Frame fr) {
                return new TimeStampedFieldPVCoordinates<>(d.getField(), new TimeStampedPVCoordinates(d.toAbsoluteDate(), s, Vector3D.ZERO));
            }
        };
    }

    /** Body-to-inertial matrix (row-major) of an Orekit attitude (convention 2). */
    static String mat(Rotation rot) {
        Vector3D[] col = {rot.applyInverseTo(Vector3D.PLUS_I), rot.applyInverseTo(Vector3D.PLUS_J), rot.applyInverseTo(Vector3D.PLUS_K)};
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < 3; i++)
            for (int j = 0; j < 3; j++) {
                if (b.length() > 0) b.append(',');
                b.append(f(col[j].toArray()[i]));
            }
        return b.toString();
    }

    public static void main(String[] args) {
        Frame gcrf = FramesFactory.getGCRF();
        AbsoluteDate date = AbsoluteDate.J2000_EPOCH;
        String[] names = {"foc", "iov", "iov_eol"};
        double[][][] tables = {foc(), iov(false), iov(true)};
        double[] masses = {707.879, 696.802, 696.802};

        System.out.println("# Orekit 12.2 box-wing / ECOM2 reference (DS-PA-14); see xval/srp-boxwing-orekit/PREREGISTRATION.md.");
        System.out.println("# PANEL model i | kind | area | normal_or_axis | alpha | rho | delta");
        System.out.println("# GEOM g | sun_case | r | v | s ; ATT g yaw|rand | body_to_inertial(row-major)");
        System.out.println("# A1 model g yaw|rand | a ; A2 model g | lighting_ratio | a | a_default_pressure ; C model g | da/dk");
        System.out.println("# D model g i | fd_rho | fd_delta ; E g k | a  (k 0-8: unit 1e-9 on kshana parameter k, 9: dense)");
        for (int m = 0; m < 3; m++) {
            for (int i = 0; i < tables[m].length; i++) {
                double[] p = tables[m][i];
                System.out.println("PANEL " + names[m] + " " + i + " | " + (p[0] == 0 ? "fixed" : "wing") + " | " + f(p[1])
                    + " | " + v3(new Vector3D(p[2], p[3], p[4])) + " | " + f(p[5]) + " | " + f(p[6]) + " | " + f(p[7]));
            }
            System.out.println("MASS " + names[m] + " | " + f(masses[m]));
        }

        // ---- geometry ---------------------------------------------------------------------
        Vector3D p1 = Vector3D.PLUS_I, p2 = new Vector3D(0, Math.cos(INC), Math.sin(INC)), hh = new Vector3D(0, -Math.sin(INC), Math.cos(INC));
        double[][] sunCases = {{-60, 1.0}, {-20, 1.0}, {5, 1.0}, {30, 1.0}, {75, 1.0}, {30, 0.9833}, {30, 1.0167}};
        double lam = Math.toRadians(40.0), vc = Math.sqrt(MU / A);
        List<Vector3D[]> geoms = new ArrayList<>();
        for (int c = 0; c < sunCases.length; c++) {
            double beta = Math.toRadians(sunCases[c][0]);
            Vector3D sdir = new Vector3D(Math.cos(beta) * Math.cos(lam), p1, Math.cos(beta) * Math.sin(lam), p2, Math.sin(beta), hh);
            Vector3D s = sdir.scalarMultiply(sunCases[c][1] * AU);
            for (int k = 0; k < 36; k++) {
                double u = Math.toRadians(10.0 * k);
                Vector3D r = new Vector3D(A * Math.cos(u), p1, A * Math.sin(u), p2);
                Vector3D v = new Vector3D(-vc * Math.sin(u), p1, vc * Math.cos(u), p2);
                System.out.println("GEOM " + geoms.size() + " | " + c + " | " + v3(r) + " | " + v3(v) + " | " + v3(s));
                geoms.add(new Vector3D[] {r, v, s});
            }
        }

        // ---- random attitudes (seed 20261013, Shoemake uniform quaternions) ----------------
        Random rng = new Random(20261013L);
        Rotation[] rand = new Rotation[100];
        for (int g = 0; g < 100; g++) {
            double u1 = rng.nextDouble(), u2 = rng.nextDouble(), u3 = rng.nextDouble();
            double a = Math.sqrt(1 - u1), b = Math.sqrt(u1);
            rand[g] = new Rotation(a * Math.sin(2 * Math.PI * u2), a * Math.cos(2 * Math.PI * u2),
                                   b * Math.sin(2 * Math.PI * u3), b * Math.cos(2 * Math.PI * u3), true);
        }

        GradientField gf = GradientField.getField(1);
        for (int g = 0; g < geoms.size(); g++) {
            Vector3D r = geoms.get(g)[0], v = geoms.get(g)[1], s = geoms.get(g)[2];
            ExtendedPVCoordinatesProvider sun = fixedSun(s);
            CartesianOrbit orbit = new CartesianOrbit(new PVCoordinates(r, v), gcrf, date, MU);
            GenericGNSS law = new GenericGNSS(AbsoluteDate.PAST_INFINITY, AbsoluteDate.FUTURE_INFINITY, sun, gcrf);
            Attitude yaw = law.getAttitude(orbit, date, gcrf);
            System.out.println("ATT " + g + " yaw | " + mat(yaw.getRotation()));
            Attitude ra = null;
            if (g < 100) {
                ra = new Attitude(date, gcrf, rand[g], Vector3D.ZERO, Vector3D.ZERO);
                System.out.println("ATT " + g + " rand | " + mat(rand[g]));
            }
            Vector3D sh = s.subtract(r);
            double d = sh.getNorm();
            Vector3D flux = sh.scalarMultiply(-P_AU * (AU / d) * (AU / d) / d);   // from the Sun, magnitude P(AU/d)^2
            OneAxisEllipsoid earth = new OneAxisEllipsoid(RE, 0.0, gcrf);

            for (int m = 0; m < 3; m++) {
                BoxAndSolarArraySpacecraft bw = new BoxAndSolarArraySpacecraft(panels(tables[m], sun, -1, 0, 0));
                SpacecraftState st = new SpacecraftState(orbit, yaw, masses[m]);
                Vector3D a1 = bw.radiationPressureAcceleration(st, flux, new double[] {1.0});
                System.out.println("A1 " + names[m] + " " + g + " yaw | " + v3(a1));
                if (ra != null) {
                    SpacecraftState sr = new SpacecraftState(orbit, ra, masses[m]);
                    System.out.println("A1 " + names[m] + " " + g + " rand | " + v3(bw.radiationPressureAcceleration(sr, flux, new double[] {1.0})));
                }
                SolarRadiationPressure srp = new SolarRadiationPressure(AU, P_AU, sun, earth, bw);
                SolarRadiationPressure srpDefault = new SolarRadiationPressure(sun, earth, bw);
                System.out.println("A2 " + names[m] + " " + g + " | " + f(srp.getLightingRatio(st)) + " | "
                    + v3(srp.acceleration(st, new double[] {1.0})) + " | " + v3(srpDefault.acceleration(st, new double[] {1.0})));
                // C: derivative w.r.t. the global radiation factor (Gradient, one free parameter)
                FieldSpacecraftState<Gradient> fst = new FieldSpacecraftState<>(gf, st);
                FieldVector3D<Gradient> fflux = new FieldVector3D<>(gf, flux);
                Gradient[] prm = {Gradient.variable(1, 0, 1.0)};
                FieldVector3D<Gradient> fa = bw.radiationPressureAcceleration(fst, fflux, prm);
                System.out.println("C " + names[m] + " " + g + " | " + f(fa.getX().getGradient()[0]) + ","
                    + f(fa.getY().getGradient()[0]) + "," + f(fa.getZ().getGradient()[0]));
                // D: central differences per panel
                for (int i = 0; i < tables[m].length; i++) {
                    Vector3D rp = new BoxAndSolarArraySpacecraft(panels(tables[m], sun, i, H, 0)).radiationPressureAcceleration(st, flux, new double[] {1.0});
                    Vector3D rm = new BoxAndSolarArraySpacecraft(panels(tables[m], sun, i, -H, 0)).radiationPressureAcceleration(st, flux, new double[] {1.0});
                    Vector3D dp = new BoxAndSolarArraySpacecraft(panels(tables[m], sun, i, 0, H)).radiationPressureAcceleration(st, flux, new double[] {1.0});
                    Vector3D dm = new BoxAndSolarArraySpacecraft(panels(tables[m], sun, i, 0, -H)).radiationPressureAcceleration(st, flux, new double[] {1.0});
                    System.out.println("D " + names[m] + " " + g + " " + i + " | " + v3(rp.subtract(rm).scalarMultiply(0.5 / H))
                        + " | " + v3(dp.subtract(dm).scalarMultiply(0.5 / H)));
                }
            }

            // E: ECOM2 (convention 6). kshana order [D0, Y0, B0, D2c, D2s, D4c, D4s, B1c, B1s];
            // Orekit order [B0, B1c, B1s, D0, D2c, D4c, D2s, D4s, Y0].
            int[] toOrekit = {3, 8, 0, 4, 6, 5, 7, 1, 2};   // kshana index -> Orekit index
            double[] dense = new double[9];                  // kshana order
            double[] denseOrekit = {2, -1, 0.5, -80, 3, -1.5, 2.5, 0.7, 0.4};
            for (int k = 0; k < 9; k++) dense[k] = denseOrekit[toOrekit[k]] * 1e-9;
            if (g == 0) {
                StringBuilder b = new StringBuilder("EDENSE |");
                for (int k = 0; k < 9; k++) b.append(k == 0 ? " " : ",").append(f(dense[k]));
                System.out.println(b);
            }
            ECOM2 ecom = new ECOM2(2, 1, 0.0, sun, RE);
            SpacecraftState se = new SpacecraftState(orbit, yaw, masses[0]);
            for (int k = 0; k < 10; k++) {
                double[] po = new double[9];
                for (int j = 0; j < 9; j++) po[toOrekit[j]] = (k < 9) ? (j == k ? 1e-9 : 0.0) : dense[j];
                System.out.println("E " + g + " " + k + " | " + v3(ecom.acceleration(se, po)));
            }
        }
    }
}
