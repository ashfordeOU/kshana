// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle generator for kshana's range / range-rate / azimuth-elevation batch orbit
// determination with an elevation mask (kshana::orbit_determination::determine_orbit_batch_tracking).
//
// Oracle: Orekit 12.2 (CS GROUP, Apache-2.0) + Hipparchus 3.1, on OpenJDK 21:
//   BatchLSEstimator (Levenberg-Marquardt) over a NumericalPropagatorBuilder, i.e. Orekit's own
//   variational-equation state-transition matrix and its own measurement-partial chain.
//
// As in ../../batch_sequential_orbit_determination/java/OrekitOd.java, the physics is made identical
// on both sides so that what is compared is the estimator and its Jacobian chain:
//   * Dynamics : two-body + J2 ONLY in GCRF, fixed-step classical RK4 of step dt
//                (J2OnlyPerturbation + ClassicalRungeKuttaIntegrator).
//   * Stations : FIXED inertial points on a 6378 km sphere (no Earth rotation).
//   * Measurements : INSTANTANEOUS GEOMETRIC range, range-rate and az/el, NO light time, NO
//                aberration, NO refraction, via the custom GeometricRange, GeometricRangeRate and
//                GeometricAzEl classes (Gradient auto-diff partials). Orekit's stock RangeRate and
//                AngularAzEl include light time and are deliberately not used. The custom az/el,
//                range and range-rate values are cross-checked against Orekit's own
//                TopocentricFrame (zero-flattening OneAxisEllipsoid on GCRF) getAzimuth /
//                getElevation / getRange / getRangeRate, and the worst difference is printed.
//   * Visibility : a measurement exists only where the elevation is >= the scenario mask; the
//                mask is applied here, once, while simulating, and kshana's is_visible must
//                reproduce the same visible set from the truth state.
//   * Noise    : seeded (xorshift64* + Box-Muller) Gaussian noise is added here, once, and the
//                noisy values are written to the fixture so both estimators fit identical data.
//
// Also emitted: Orekit's state-transition matrix Phi(t_k, t0) at a few epochs along the truth
// trajectory (NumericalPropagator.setupMatricesComputation), for a direct check of kshana's
// variational STM.
//
// Reproduce:
//   source /root/kshana-oracles/orekit/cp.sh
//   javac -cp "$OREKIT_CP" -d /tmp/odtrk GeometricRange.java GeometricRangeRate.java GeometricAzEl.java OrekitTrackingOd.java
//   java  -cp "/tmp/odtrk:$OREKIT_CP" OrekitTrackingOd > ../od_tracking_measurements_reference.txt

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.linear.RealMatrix;
import org.hipparchus.ode.nonstiff.ClassicalRungeKuttaIntegrator;
import org.hipparchus.optim.nonlinear.vector.leastsquares.LevenbergMarquardtOptimizer;
import org.hipparchus.util.MathUtils;

import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.estimation.leastsquares.BatchLSEstimator;
import org.orekit.estimation.measurements.ObservableSatellite;
import org.orekit.forces.gravity.J2OnlyPerturbation;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.KeplerianOrbit;
import org.orekit.orbits.Orbit;
import org.orekit.orbits.OrbitType;
import org.orekit.orbits.PositionAngleType;
import org.orekit.propagation.MatricesHarvester;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.conversion.ClassicalRungeKuttaIntegratorBuilder;
import org.orekit.propagation.conversion.NumericalPropagatorBuilder;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.PVCoordinates;

public class OrekitTrackingOd {

    static final double MU = 3.986004418e14;
    static final double RE = 6378137.0;
    static final double J2 = 1.08262668e-3;
    static final double R_STATION = 6.378e6;

    static final double SIG_R = 5.0, SIG_RR = 5.0e-3, SIG_ANG = 1.0e-4;

    static Frame eci;
    static AbsoluteDate t0;
    static OneAxisEllipsoid earth;

    static final class Scenario {
        final String name, kinds; final double[] truth; final double dt; final int n, nStations;
        final double maskDeg; final boolean noisy;
        Scenario(String name, double[] truth, double dt, int n, int nStations, double maskDeg,
                 String kinds, boolean noisy) {
            this.name = name; this.truth = truth; this.dt = dt; this.n = n; this.nStations = nStations;
            this.maskDeg = maskDeg; this.kinds = kinds; this.noisy = noisy;
        }
    }

    static final class Obs {
        int k, st; String type; double[] v;
        Obs(int k, int st, String type, double[] v) { this.k = k; this.st = st; this.type = type; this.v = v; }
    }

    static double[] kep(double a, double inc, double raan, double argp, double ta, double e) {
        KeplerianOrbit ko = new KeplerianOrbit(a, e, Math.toRadians(inc), Math.toRadians(argp),
            Math.toRadians(raan), Math.toRadians(ta), PositionAngleType.TRUE, eci, t0, MU);
        return pv6(ko.getPVCoordinates());
    }

    public static void main(String[] args) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        eci = FramesFactory.getGCRF();
        t0 = new AbsoluteDate(2025, 1, 1, 0, 0, 0.0, TimeScalesFactory.getUTC());
        earth = new OneAxisEllipsoid(R_STATION, 0.0, eci); // sphere, inertial body frame

        double[] sso = kep(7.078e6, 98.0, 120.0, 90.0, 30.0, 0.001);
        double[] iss = kep(6.9e6, 51.6, 300.0, 45.0, 120.0, 0.0007);
        double[] i35 = kep(7.0e6, 35.0, 10.0, 40.0, 0.0, 0.0);
        double[] meo = kep(2.0e7, 56.0, 200.0, 60.0, 80.0, 0.002);

        List<Scenario> sc = new ArrayList<>();
        sc.add(new Scenario("rr_leo",          sso, 60.0, 100, 6, 10.0, "RR",      false));
        sc.add(new Scenario("azel_leo",        iss, 60.0, 100, 6, 10.0, "AE",      false));
        sc.add(new Scenario("mixed_leo",       i35, 60.0, 100, 6,  5.0, "R,RR,AE", false));
        sc.add(new Scenario("azel_meo",        meo, 240.0, 90, 4, 10.0, "AE",     false));
        sc.add(new Scenario("rr_leo_noisy",    sso, 60.0, 100, 6, 10.0, "RR",      true));
        sc.add(new Scenario("azel_leo_noisy",  iss, 60.0, 100, 6, 10.0, "AE",      true));
        sc.add(new Scenario("mixed_leo_noisy", i35, 60.0, 100, 6,  5.0, "R,RR,AE", true));
        sc.add(new Scenario("mixed_meo_noisy", meo, 240.0, 90, 4, 10.0, "R,RR,AE", true));

        System.out.println("# Orekit 12.2 BatchLSEstimator (Levenberg-Marquardt) reference for kshana's range /");
        System.out.println("# range-rate / az-el batch OD with an elevation mask. Oracle: Orekit 12.2 (CS GROUP,");
        System.out.println("# Apache-2.0) + Hipparchus 3.1, OpenJDK 21. Generated by java/OrekitTrackingOd.java.");
        System.out.println("# Dynamics two-body + J2 in GCRF, fixed-step RK4 (dt); stations fixed inertial points;");
        System.out.println("# measurements instantaneous geometric (no light time) via custom Gradient classes.");
        System.out.println("# Record format (one block per scenario):");
        System.out.println("#   SCEN name | dt | n | maskDeg | nStations | kinds | noisy");
        System.out.println("#   TRUTH x6 / GUESS x6 / STATION i | x,y,z / SIGMA range,rangeRate,angle");
        System.out.println("#   OBS k | station | R|RR|AE | value[,value]   (epoch-major, station, kinds order)");
        System.out.println("#   STM k | 36 values row-major   (Orekit Phi(t_k,t0) along the truth trajectory; noiseless scenarios only)");
        System.out.println("#   TOPOCHECK maxAbs dRange(m) dRangeRate(m/s) dAz(rad) dEl(rad)  (custom vs TopocentricFrame)");
        System.out.println("#   OREKIT_BATCH x6 | iterations     (recovered epoch state)");
        System.out.println("#   OREKIT_RMS range rangeRate az el (post-fit residual RMS per type; NaN = none)");
        System.out.println("# Units: m, s, m/s, rad.");
        for (Scenario s : sc) run(s);
    }

    static J2OnlyPerturbation j2() { return new J2OnlyPerturbation(MU, RE, J2, eci); }

    static NumericalPropagator prop(double[] s, double dt) {
        NumericalPropagator p = new NumericalPropagator(new ClassicalRungeKuttaIntegrator(dt));
        p.setOrbitType(OrbitType.CARTESIAN);
        p.addForceModel(j2());
        p.setInitialState(new SpacecraftState(new CartesianOrbit(
            new PVCoordinates(new Vector3D(s[0], s[1], s[2]), new Vector3D(s[3], s[4], s[5])), eci, t0, MU)));
        return p;
    }

    static final class Rng {
        long st; Rng(long seed) { st = seed; }
        double u() {
            st ^= st >>> 12; st ^= st << 25; st ^= st >>> 27;
            long x = st * 0x2545F4914F6CDD1DL;
            double d = ((x >>> 11) & ((1L << 53) - 1)) / (double) (1L << 53);
            return Math.min(Math.max(d, 1e-15), 1 - 1e-15);
        }
        double gauss() { return Math.sqrt(-2.0 * Math.log(u())) * Math.cos(2.0 * Math.PI * u()); }
    }

    static double[] model(String type, Vector3D st, Vector3D p, Vector3D v) {
        switch (type) {
            case "R": return new double[]{p.subtract(st).getNorm()};
            case "RR": return new double[]{GeometricRangeRate.value(st, p, v)};
            default: return GeometricAzEl.value(st, p);
        }
    }

    static void run(Scenario s) {
        // Stations under the truth orbit, displaced off the sub-satellite point (as the kshana unit
        // test's helper does), at fixed fractions of the arc.
        double[] fr = {0.08, 0.27, 0.45, 0.63, 0.81, 0.95};
        NumericalPropagator tp = prop(s.truth, s.dt);
        Vector3D[] st = new Vector3D[s.nStations];
        for (int i = 0; i < s.nStations; i++) {
            int k = Math.min((int) (s.n * fr[i]), s.n - 1) + 1;
            Vector3D p = tp.propagate(t0.shiftedBy(k * s.dt)).getPVCoordinates(eci).getPosition();
            double off = (i % 2 == 0) ? 0.06 : -0.05;
            Vector3D q = new Vector3D(p.getX() + off * p.getZ(), p.getY(), p.getZ() - off * p.getX());
            st[i] = q.scalarMultiply(R_STATION / q.getNorm());
        }
        TopocentricFrame[] topo = new TopocentricFrame[s.nStations];
        for (int i = 0; i < s.nStations; i++) {
            GeodeticPoint gp = earth.transform(st[i], eci, t0);
            topo[i] = new TopocentricFrame(earth, gp, "S" + i);
        }
        String[] kinds = s.kinds.split(",");
        double mask = Math.toRadians(s.maskDeg);

        // Simulate (mask applied once, here) and cross-check the custom models against Orekit's
        // TopocentricFrame.
        Rng rng = new Rng(0x0D7ACL ^ (long) s.name.hashCode());
        List<Obs> obs = new ArrayList<>();
        double[] topoMax = new double[4];
        NumericalPropagator tp2 = prop(s.truth, s.dt);
        for (int k = 1; k <= s.n; k++) {
            AbsoluteDate tk = t0.shiftedBy(k * s.dt);
            PVCoordinates pv = tp2.propagate(tk).getPVCoordinates(eci);
            Vector3D p = pv.getPosition(), v = pv.getVelocity();
            for (int i = 0; i < s.nStations; i++) {
                double[] ae = GeometricAzEl.value(st[i], p);
                if (!(ae[1] >= mask)) continue;
                topoMax[0] = Math.max(topoMax[0], Math.abs(p.subtract(st[i]).getNorm() - topo[i].getRange(p, eci, tk)));
                topoMax[1] = Math.max(topoMax[1], Math.abs(GeometricRangeRate.value(st[i], p, v) - topo[i].getRangeRate(pv, eci, tk)));
                double azO = MathUtils.normalizeAngle(topo[i].getAzimuth(p, eci, tk), ae[0]);
                topoMax[2] = Math.max(topoMax[2], Math.abs(ae[0] - azO));
                topoMax[3] = Math.max(topoMax[3], Math.abs(ae[1] - topo[i].getElevation(p, eci, tk)));
                for (String t : kinds) {
                    double[] val = model(t, st[i], p, v);
                    if (s.noisy) {
                        if (t.equals("R")) val[0] += SIG_R * rng.gauss();
                        else if (t.equals("RR")) val[0] += SIG_RR * rng.gauss();
                        else { val[0] += SIG_ANG * rng.gauss(); val[1] += SIG_ANG * rng.gauss(); }
                    }
                    obs.add(new Obs(k, i, t, val));
                }
            }
        }

        // Orekit STM along the truth trajectory.
        NumericalPropagator sp = prop(s.truth, s.dt);
        MatricesHarvester hv = sp.setupMatricesComputation("stm", null, null);
        int[] stmK = {s.n / 4, s.n / 2, s.n};
        double[][] stms = new double[stmK.length][];
        for (int j = 0; j < stmK.length; j++) {
            SpacecraftState ss = sp.propagate(t0.shiftedBy(stmK[j] * s.dt));
            RealMatrix phi = hv.getStateTransitionMatrix(ss);
            double[] flat = new double[36];
            for (int a = 0; a < 6; a++) for (int b = 0; b < 6; b++) flat[a * 6 + b] = phi.getEntry(a, b);
            stms[j] = flat;
        }

        double[] guess = {s.truth[0] + 1000.0, s.truth[1] - 800.0, s.truth[2] + 600.0,
                          s.truth[3] + 1.0, s.truth[4] - 0.8, s.truth[5] + 0.6};

        // Orekit batch LS.
        ObservableSatellite sat = new ObservableSatellite(0);
        NumericalPropagatorBuilder b = new NumericalPropagatorBuilder(
            new CartesianOrbit(new PVCoordinates(new Vector3D(guess[0], guess[1], guess[2]),
                                                 new Vector3D(guess[3], guess[4], guess[5])), eci, t0, MU),
            new ClassicalRungeKuttaIntegratorBuilder(s.dt), PositionAngleType.TRUE, 1.0);
        b.addForceModel(j2());
        BatchLSEstimator est = new BatchLSEstimator(new LevenbergMarquardtOptimizer(), b);
        est.setMaxIterations(50);
        est.setMaxEvaluations(200);
        est.setParametersConvergenceThreshold(1e-9);
        for (Obs o : obs) {
            AbsoluteDate tk = t0.shiftedBy(o.k * s.dt);
            switch (o.type) {
                case "R": est.addMeasurement(new GeometricRange(st[o.st], tk, o.v[0], SIG_R, 1.0, sat)); break;
                case "RR": est.addMeasurement(new GeometricRangeRate(st[o.st], tk, o.v[0], SIG_RR, 1.0, sat)); break;
                default: est.addMeasurement(new GeometricAzEl(st[o.st], tk, o.v,
                    new double[]{SIG_ANG, SIG_ANG}, new double[]{1.0, 1.0}, sat));
            }
        }
        double[] x = pv6(est.estimate()[0].getInitialState().getPVCoordinates(eci));
        int iters = est.getIterationsCount();

        // Post-fit RMS per type from the recovered state, same dynamics and models.
        double[] sum = new double[4]; int[] cnt = new int[4];
        NumericalPropagator fp = prop(x, s.dt);
        int lastK = -1; Vector3D p = null, v = null;
        for (Obs o : obs) {
            if (o.k != lastK) {
                PVCoordinates pv = fp.propagate(t0.shiftedBy(o.k * s.dt)).getPVCoordinates(eci);
                p = pv.getPosition(); v = pv.getVelocity(); lastK = o.k;
            }
            double[] h = model(o.type, st[o.st], p, v);
            if (o.type.equals("R")) { sum[0] += sq(o.v[0] - h[0]); cnt[0]++; }
            else if (o.type.equals("RR")) { sum[1] += sq(o.v[0] - h[0]); cnt[1]++; }
            else {
                sum[2] += sq(o.v[0] - MathUtils.normalizeAngle(h[0], o.v[0])); cnt[2]++;
                sum[3] += sq(o.v[1] - h[1]); cnt[3]++;
            }
        }

        System.out.printf(Locale.ROOT, "SCEN %s | %s | %d | %s | %d | %s | %d%n", s.name, d(s.dt), s.n,
            d(s.maskDeg), s.nStations, s.kinds, s.noisy ? 1 : 0);
        System.out.printf(Locale.ROOT, "TRUTH %s%n", csv(s.truth));
        System.out.printf(Locale.ROOT, "GUESS %s%n", csv(guess));
        for (int i = 0; i < s.nStations; i++)
            System.out.printf(Locale.ROOT, "STATION %d | %s%n", i, csv(new double[]{st[i].getX(), st[i].getY(), st[i].getZ()}));
        System.out.printf(Locale.ROOT, "SIGMA %s%n", csv(new double[]{SIG_R, SIG_RR, SIG_ANG}));
        for (Obs o : obs) System.out.printf(Locale.ROOT, "OBS %d | %d | %s | %s%n", o.k, o.st, o.type, csv(o.v));
        if (!s.noisy) for (int j = 0; j < stmK.length; j++) System.out.printf(Locale.ROOT, "STM %d | %s%n", stmK[j], csv(stms[j]));
        System.out.printf(Locale.ROOT, "TOPOCHECK %s%n", csv(topoMax));
        System.out.printf(Locale.ROOT, "OREKIT_BATCH %s | %d%n", csv(x), iters);
        double[] rms = new double[4];
        for (int j = 0; j < 4; j++) rms[j] = cnt[j] > 0 ? Math.sqrt(sum[j] / cnt[j]) : Double.NaN;
        System.out.printf(Locale.ROOT, "OREKIT_RMS %s%n", csv(rms));
    }

    static double sq(double x) { return x * x; }
    static double[] pv6(PVCoordinates pv) {
        Vector3D p = pv.getPosition(), v = pv.getVelocity();
        return new double[]{p.getX(), p.getY(), p.getZ(), v.getX(), v.getY(), v.getZ()};
    }
    static String d(double x) { return Double.toString(x); }
    static String csv(double[] x) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < x.length; i++) { if (i > 0) sb.append(','); sb.append(Double.toString(x[i])); }
        return sb.toString();
    }
}
