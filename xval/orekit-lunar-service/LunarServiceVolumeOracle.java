// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle driver for the lunar service volume (row M076):
// tests/lunar_service_volume_orekit_oracle.rs.
//
// ORACLE: Orekit 12.2 (Apache-2.0) with Hipparchus 3.1 (Apache-2.0), run as a separate
// program; no Kshana code. It reproduces the pre-registered scenario from its own
// components and writes the statistics and positions Kshana is compared against:
//
//   * epoch 2025-11-09T00:00:00 UTC (the navi.613 scenario start), 15 days;
//   * the LNCSS case-study elements of navi.613 Table 1, read from the committed
//     tests/fixtures/lunar_ephemeris/lncss_case_{a,b,c}_navi613.csv, interpreted in the Earth
//     orbital-plane (OP) frame at the epoch: z along the normal of the Earth's apparent orbit
//     about the Moon (r x v of the Earth relative to the Moon, Orekit's DE440), x = p x z with p
//     the lunar pole of Orekit's IAU Moon body frame, y = z x x; two-body elements with the
//     gm_de440 lunar GM, converted by Orekit's KeplerianOrbit;
//   * Orekit NumericalPropagator in a Moon-centred frame with ICRF axes (a translation of
//     GCRF), Dormand-Prince 8(5,3), position tolerance 1e-3 m, with
//     Holmes-Featherstone lunar gravity (degree and order 2: J2 = 2.0321e-4, C22 = 2.2382e-5
//     unnormalised, S22 = 0, reference radius 1737.4 km) in Orekit's IAU Moon body frame, and
//     Earth and Sun third-body attraction from Orekit's DE440 (lnxp1990.440), GM values of
//     gm_de440 (checked against Orekit's DE440 header values);
//   * 346 users on the 1737.4 km sphere at or south of 80 S (rings every 1 deg from 80 S to
//     89 S with round(360 cos lat) longitudes from 0 E, plus the pole), in the IAU Moon body
//     frame; a satellite is visible when the elevation above the local spherical horizontal
//     is at least the mask (5 deg and 20 deg);
//   * every 60 s: per user the visible count, and with at least four the DOP from the inverse
//     of G^T G (G rows [-e, 1]), Hipparchus LU decomposition.
//
// OUTPUT (stdout, CSV): header comments, then
//   figures,case,mask_deg,availability_pct,failure_tolerance_pct,coverage_pct,pdop_median,gdop_median,n_dop
//   position,case,sat,hour,x_m,y_m,z_m     (Moon-centred, ICRF axes, every 6 h)
//
// Run:
//   source ~/Code/kshana-oracles/env.sh          # exports OREKIT_CP and OREKIT_DATA
//   javac -cp "$OREKIT_CP" LunarServiceVolumeOracle.java
//   java -cp ".:$OREKIT_CP" LunarServiceVolumeOracle <repo>/tests/fixtures/lunar_ephemeris \
//     > <repo>/tests/fixtures/lunar_service_volume_orekit_oracle/orekit_lncss.csv

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.linear.Array2DRowRealMatrix;
import org.hipparchus.linear.LUDecomposition;
import org.hipparchus.linear.RealMatrix;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.orekit.bodies.CelestialBody;
import org.orekit.bodies.CelestialBodyFactory;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.forces.gravity.HolmesFeatherstoneAttractionModel;
import org.orekit.forces.gravity.ThirdBodyAttraction;
import org.orekit.forces.gravity.potential.GravityFieldFactory;
import org.orekit.forces.gravity.potential.NormalizedSphericalHarmonicsProvider;
import org.orekit.forces.gravity.potential.TideSystem;
import org.hipparchus.CalculusFieldElement;
import org.orekit.frames.FieldTransform;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.Transform;
import org.orekit.frames.TransformProvider;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.KeplerianOrbit;
import org.orekit.orbits.OrbitType;
import org.orekit.orbits.PositionAngleType;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScale;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.PVCoordinates;

public class LunarServiceVolumeOracle {

    // ---- pre-registered constants ----
    static final double GM_MOON = 4.902800118457549e12;   // gm_de440 BODY301_GM, m^3/s^2
    static final double GM_EARTH = 3.986004355070226e14;  // gm_de440 BODY399_GM
    static final double GM_SUN = 1.3271244004127939e20;   // gm_de440 BODY10_GM
    static final double J2 = 2.0321e-4;
    static final double C22 = 2.2382e-5;
    static final double R_REF = 1737400.0;
    static final double R_SPHERE = 1737400.0;
    static final double STEP = 60.0;
    static final int DAYS = 15;
    static final double[] MASKS_DEG = {5.0, 20.0};

    static double[][] users() {
        List<double[]> u = new ArrayList<>();
        for (int lat = 80; lat < 90; lat++) {
            double latDeg = -lat;
            long n = Math.round(360.0 * Math.cos(Math.toRadians(latDeg)));
            for (int k = 0; k < n; k++) {
                u.add(sphere(latDeg, 360.0 * k / n));
            }
        }
        u.add(sphere(-90.0, 0.0));
        return u.toArray(new double[0][]);
    }

    static double[] sphere(double latDeg, double lonDeg) {
        double la = Math.toRadians(latDeg), lo = Math.toRadians(lonDeg);
        return new double[] {R_SPHERE * Math.cos(la) * Math.cos(lo),
            R_SPHERE * Math.cos(la) * Math.sin(lo), R_SPHERE * Math.sin(la)};
    }

    /** Elements rows (sma_km, ecc, inc, raan, argp, M) of a committed LNCSS fixture. */
    static List<double[]> elements(File f) throws Exception {
        List<double[]> out = new ArrayList<>();
        for (String line : Files.readAllLines(f.toPath())) {
            if (line.startsWith("#") || line.startsWith("sat") || line.isBlank()) {
                continue;
            }
            String[] t = line.split(",");
            double[] e = new double[6];
            for (int i = 0; i < 6; i++) {
                e[i] = Double.parseDouble(t[i + 1].trim());
            }
            out.add(e);
        }
        return out;
    }

    /** A growable array of doubles (the DOP samples run to millions). */
    static final class Doubles {
        double[] a = new double[1 << 20];
        int n = 0;

        void add(double v) {
            if (n == a.length) {
                a = Arrays.copyOf(a, 2 * n);
            }
            a[n++] = v;
        }
    }

    static double median(Doubles v) {
        double[] a = Arrays.copyOf(v.a, v.n);
        Arrays.sort(a);
        int m = a.length / 2;
        return a.length % 2 == 0 ? 0.5 * (a[m - 1] + a[m]) : a[m];
    }

    /**
     * The Moon-centred frame with ICRF (GCRF) axes the pre-registration names: a pure
     * translation of GCRF to the Moon's centre. (Orekit's own Moon "inertially oriented"
     * frame follows the IAU lunar pole at date, so its axes turn slowly; integrating in it as
     * if it were inertial drops the fictitious forces.)
     */
    static final class MoonIcrf implements TransformProvider {
        private static final long serialVersionUID = 1L;
        private final CelestialBody moon;
        private final Frame gcrf;

        MoonIcrf(CelestialBody moon, Frame gcrf) {
            this.moon = moon;
            this.gcrf = gcrf;
        }

        @Override
        public Transform getTransform(AbsoluteDate date) {
            // Coordinates of the GCRF origin (the Earth) in the new, Moon-centred frame.
            return new Transform(date, moon.getPVCoordinates(date, gcrf).negate());
        }

        @Override
        public <T extends CalculusFieldElement<T>> FieldTransform<T> getTransform(FieldAbsoluteDate<T> date) {
            throw new UnsupportedOperationException("field transforms are not used here");
        }
    }

    public static void main(String[] args) throws Exception {
        File fixtures = new File(args[0]);
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        TimeScale utc = TimeScalesFactory.getUTC();
        AbsoluteDate epoch = new AbsoluteDate(2025, 11, 9, 0, 0, 0.0, utc);
        CelestialBody moon = CelestialBodyFactory.getMoon();
        CelestialBody earth = CelestialBodyFactory.getEarth();
        CelestialBody sun = CelestialBodyFactory.getSun();
        Frame gcrf = FramesFactory.getGCRF();
        Frame moonBody = moon.getBodyOrientedFrame();
        Frame moonInertial = new Frame(gcrf, new MoonIcrf(moon, gcrf), "MOON_ICRF", true);

        // The masses Orekit's DE440 carries must be the pre-registered gm_de440 values.
        for (Object[] b : new Object[][] {{moon, GM_MOON}, {earth, GM_EARTH}, {sun, GM_SUN}}) {
            double gm = ((CelestialBody) b[0]).getGM();
            double want = (Double) b[1];
            if (Math.abs(gm - want) > 1e-12 * want) {
                throw new IllegalStateException(((CelestialBody) b[0]).getName() + " GM " + gm
                    + " differs from the pre-registered " + want);
            }
        }

        // OP frame at the epoch, in ICRF (GCRF) axes.
        PVCoordinates moonPv = moon.getPVCoordinates(epoch, gcrf);
        Vector3D rE = moonPv.getPosition().negate();
        Vector3D vE = moonPv.getVelocity().negate();
        Vector3D z = Vector3D.crossProduct(rE, vE).normalize();
        Vector3D pole = moonBody.getTransformTo(gcrf, epoch).transformVector(Vector3D.PLUS_K);
        Vector3D x = Vector3D.crossProduct(pole, z).normalize();
        Vector3D y = Vector3D.crossProduct(z, x);

        // Lunar field, fully normalised: C20 = -J2/sqrt(5), C22 = C22/sqrt(5/12).
        double[][] cn = {{1.0}, {0.0, 0.0}, {-J2 / Math.sqrt(5.0), 0.0, C22 / Math.sqrt(5.0 / 12.0)}};
        double[][] sn = {{0.0}, {0.0, 0.0}, {0.0, 0.0, 0.0}};
        NormalizedSphericalHarmonicsProvider field =
            GravityFieldFactory.getNormalizedProvider(R_REF, GM_MOON, TideSystem.UNKNOWN, cn, sn);
        HolmesFeatherstoneAttractionModel hf = new HolmesFeatherstoneAttractionModel(moonBody, field);

        System.out.println("# Orekit 12.2 + Hipparchus 3.1 reference for tests/lunar_service_volume_orekit_oracle.rs");
        System.out.println("# generated by xval/orekit-lunar-service/LunarServiceVolumeOracle.java; epoch 2025-11-09T00:00:00 UTC, 15 days, 60 s");
        System.out.printf("# Orekit DE440 GM (m^3/s^2): Moon %.16e Earth %.16e Sun %.16e%n",
            moon.getGM(), earth.getGM(), sun.getGM());
        System.out.printf("# OP axes in ICRF: x %s y %s z %s; IAU lunar pole %s%n", x, y, z, pole);

        // Check the field configuration against the closed form at one point.
        {
            Vector3D rb = new Vector3D(1.2e6, -0.9e6, -2.1e6);
            Transform b2i = moonBody.getTransformTo(moonInertial, epoch);
            Vector3D ri = b2i.transformPosition(rb);
            SpacecraftState s = new SpacecraftState(new CartesianOrbit(
                new PVCoordinates(ri, new Vector3D(0, 1500, 0)), moonInertial, epoch, GM_MOON));
            Vector3D ahf = b2i.getInverse().transformVector(hf.acceleration(s, hf.getParameters(epoch)));
            double r = rb.getNorm(), r2 = r * r, r5 = r2 * r2 * r;
            double mr2 = GM_MOON * R_REF * R_REF;
            double zr2 = 5.0 * rb.getZ() * rb.getZ() / r2;
            double cj = -1.5 * J2 * mr2 / r5, k = 3.0 * mr2 * C22 / r5;
            double dxy = rb.getX() * rb.getX() - rb.getY() * rb.getY();
            Vector3D closed = new Vector3D(
                cj * rb.getX() * (1 - zr2) + k * (2 * rb.getX() - 5 * rb.getX() * dxy / r2),
                cj * rb.getY() * (1 - zr2) + k * (-2 * rb.getY() - 5 * rb.getY() * dxy / r2),
                cj * rb.getZ() * (3 - zr2) + k * (-5 * rb.getZ() * dxy / r2));
            double central = GM_MOON / r2;
            double gap = ahf.subtract(closed).getNorm();
            System.out.printf("# field check: |a_HF - a_closed(J2,C22)| = %.3e m/s^2 (central term %.3e)%n", gap, central);
            if (gap > 1e-12) {
                throw new IllegalStateException("Holmes-Featherstone field is not the pre-registered J2 + C22 field");
            }
        }

        double[][] users = users();
        String[] cases = {"A", "B", "C"};
        System.out.println("# figures,case,mask_deg,availability_pct,failure_tolerance_pct,coverage_pct,pdop_median,gdop_median,n_dop");
        List<String> positions = new ArrayList<>();
        int nOut = (int) Math.round(DAYS * 86400.0 / STEP);
        for (String c : cases) {
            List<double[]> el = elements(new File(fixtures, "lncss_case_" + c.toLowerCase() + "_navi613.csv"));
            int ns = el.size();
            // mcmf[k][sat] and the 6-hourly ICRF positions
            double[][][] mcmf = new double[nOut][ns][];
            for (int si = 0; si < ns; si++) {
                double[] e = el.get(si);
                KeplerianOrbit kep = new KeplerianOrbit(e[0] * 1e3, e[1], Math.toRadians(e[2]),
                    Math.toRadians(e[4]), Math.toRadians(e[3]), Math.toRadians(e[5]),
                    PositionAngleType.MEAN, moonInertial, epoch, GM_MOON);
                // Components of the Keplerian state are OP components; rotate to ICRF axes.
                Vector3D po = kep.getPosition();
                Vector3D vo = kep.getPVCoordinates().getVelocity();
                Vector3D pr = new Vector3D(po.getX(), x, po.getY(), y, po.getZ(), z);
                Vector3D vr = new Vector3D(vo.getX(), x, vo.getY(), y, vo.getZ(), z);
                PVCoordinates inGcrf = new PVCoordinates(moonPv.getPosition().add(pr),
                    moonPv.getVelocity().add(vr));
                PVCoordinates inMi = gcrf.getTransformTo(moonInertial, epoch).transformPVCoordinates(inGcrf);
                CartesianOrbit orbit = new CartesianOrbit(inMi, moonInertial, epoch, GM_MOON);

                double[][] tol = NumericalPropagator.tolerances(1e-3, orbit, OrbitType.CARTESIAN);
                DormandPrince853Integrator integ = new DormandPrince853Integrator(1e-3, 300.0, tol[0], tol[1]);
                NumericalPropagator prop = new NumericalPropagator(integ);
                prop.setOrbitType(OrbitType.CARTESIAN);
                prop.setInitialState(new SpacecraftState(orbit));
                prop.addForceModel(hf);
                prop.addForceModel(new ThirdBodyAttraction(earth));
                prop.addForceModel(new ThirdBodyAttraction(sun));
                final int sat = si;
                final String cs = c;
                prop.setStepHandler(STEP, st -> {
                    double dt = st.getDate().durationFrom(epoch);
                    int k = (int) Math.round(dt / STEP);
                    if (k >= nOut) {
                        return;
                    }
                    Vector3D pb = st.getPosition(moonBody);
                    mcmf[k][sat] = new double[] {pb.getX(), pb.getY(), pb.getZ()};
                    if (k % 360 == 0) {
                        Vector3D pg = st.getPosition(gcrf).subtract(moon.getPosition(st.getDate(), gcrf));
                        positions.add(String.format("position,%s,%d,%d,%.6f,%.6f,%.6f", cs, sat, k / 60,
                            pg.getX(), pg.getY(), pg.getZ()));
                    }
                });
                SpacecraftState end = prop.propagate(epoch.shiftedBy(DAYS * 86400.0));
                // The final 6-hourly epoch (t = 15 d) is past the last 60 s sample.
                Vector3D pg = end.getPosition(gcrf).subtract(moon.getPosition(end.getDate(), gcrf));
                positions.add(String.format("position,%s,%d,%d,%.6f,%.6f,%.6f", c, si, DAYS * 24,
                    pg.getX(), pg.getY(), pg.getZ()));
            }
            int perDay = (int) Math.round(86400.0 / STEP);
            for (double maskDeg : MASKS_DEG) {
                double sinMask = Math.sin(Math.toRadians(maskDeg));
                double[] worst = {100.0, 100.0};
                long nFour = 0, nAll = 0;
                Doubles pd = new Doubles(), gd = new Doubles();
                for (int day = 0; day < DAYS; day++) {
                    int[][] counts = new int[users.length][2];
                    for (int s = 0; s < perDay; s++) {
                        int k = day * perDay + s;
                        for (int u = 0; u < users.length; u++) {
                            double[] us = users[u];
                            double un = Math.sqrt(us[0] * us[0] + us[1] * us[1] + us[2] * us[2]);
                            List<double[]> los = new ArrayList<>();
                            for (int si = 0; si < ns; si++) {
                                double[] sp = mcmf[k][si];
                                double dx = sp[0] - us[0], dy = sp[1] - us[1], dz = sp[2] - us[2];
                                double dn = Math.sqrt(dx * dx + dy * dy + dz * dz);
                                double cosz = (dx * us[0] + dy * us[1] + dz * us[2]) / (dn * un);
                                if (dn > 0 && cosz >= sinMask) {
                                    los.add(new double[] {dx / dn, dy / dn, dz / dn});
                                }
                            }
                            nAll++;
                            if (los.size() >= 4) {
                                counts[u][0]++;
                                nFour++;
                                double[][] a = new double[4][4];
                                for (double[] e : los) {
                                    double[] row = {-e[0], -e[1], -e[2], 1.0};
                                    for (int i = 0; i < 4; i++) {
                                        for (int j = 0; j < 4; j++) {
                                            a[i][j] += row[i] * row[j];
                                        }
                                    }
                                }
                                LUDecomposition lu = new LUDecomposition(new Array2DRowRealMatrix(a));
                                if (lu.getSolver().isNonSingular()) {
                                    RealMatrix q = lu.getSolver().getInverse();
                                    double pos = q.getEntry(0, 0) + q.getEntry(1, 1) + q.getEntry(2, 2);
                                    pd.add(Math.sqrt(pos));
                                    gd.add(Math.sqrt(pos + q.getEntry(3, 3)));
                                }
                            }
                            if (los.size() >= 5) {
                                counts[u][1]++;
                            }
                        }
                    }
                    for (int[] cnt : counts) {
                        for (int q = 0; q < 2; q++) {
                            worst[q] = Math.min(worst[q], 100.0 * cnt[q] / perDay);
                        }
                    }
                }
                System.out.printf("figures,%s,%.1f,%.10f,%.10f,%.10f,%.12f,%.12f,%d%n", c, maskDeg,
                    worst[0], worst[1], 100.0 * nFour / nAll, median(pd), median(gd), pd.n);
            }
        }
        System.out.println("# position,case,sat,hour,x_m,y_m,z_m (Moon-centred, ICRF axes)");
        for (String p : positions) {
            System.out.println(p);
        }
    }
}
