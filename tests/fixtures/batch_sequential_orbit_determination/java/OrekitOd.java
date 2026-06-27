// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle generator for kshana's batch & sequential orbit determination.
//
// Oracle: Orekit 12.2 (CS GROUP, Apache-2.0) + Hipparchus 3.1, on OpenJDK 21.
//   - BatchLSEstimator with the Levenberg-Marquardt optimizer  -> batch OD
//   - KalmanEstimator (extended Kalman, sequential)            -> sequential OD
//
// The point of this driver is to ISOLATE THE ESTIMATOR. kshana's range-only OD
// (src/orbit_determination.rs) uses a very specific, simplified observation+dynamics
// model, and this driver reproduces that model BYTE-FOR-BYTE inside Orekit so the only
// thing being compared is the estimator machinery (Gauss-Newton vs Levenberg-Marquardt;
// kshana's UKF vs Orekit's EKF KalmanEstimator):
//
//   * Dynamics  : two-body + J2 ONLY, evaluated in an INERTIAL frame (GCRF), integrated
//                 by a FIXED-STEP classical RK4 of step dt -> Orekit
//                 J2OnlyPerturbation(MU,RE,J2,GCRF) + ClassicalRungeKuttaIntegrator(dt).
//                 (Reconnaissance confirmed Orekit's J2-only RK4 1-step matches kshana's
//                 gravity_accel + rk4_step to sub-micron.)
//   * Stations  : FIXED points in the inertial frame (NO Earth rotation). Achieved by
//                 building the OneAxisEllipsoid on the inertial GCRF as its body frame,
//                 so the TopocentricFrame does not rotate (verified 0 m drift / 1000 s).
//   * Range     : INSTANTANEOUS geometric Euclidean distance |r_sat - r_station|, NO
//                 light-time, NO aberration -> a custom GeometricRange measurement with
//                 Gradient (auto-diff) partials. This is exactly kshana's range_to().
//   * Epochs    : kshana propagates epoch k = x0 advanced by k*dt for k = 1..=n_epochs
//                 (epoch 0 is NOT measured), so observations are placed at t0 + k*dt.
//
// kshana's sequential filter returns the FINAL-epoch filtered state (ukf.x after the last
// update). Orekit's KalmanEstimator likewise returns the filtered state at the LAST processed
// measurement epoch (the returned propagator's initial-state date is t0 + nSeq*dt, verified),
// so the two are directly like-for-like; this driver emits Orekit's last-epoch state as
// OREKIT_SEQ_FINAL (and, for completeness, back-propagates it to t0 as OREKIT_SEQ_EPOCH).
//
// Honest scope: this validates the ESTIMATORS (batch LM and sequential Kalman) against
// kshana over the simplified two-body+J2 / geometric-range / fixed-inertial-station model
// that kshana's teaching OD implements. It does NOT exercise light-time, Earth rotation,
// real station coordinates, range-rate/angles, or a high-fidelity force model (those are
// the precise_od / agency_* harnesses' job).
//
// Reproduce:
//   source /tmp/kshana-oracles/orekit/cp.sh
//   javac -cp "$OREKIT_CP" GeometricRange.java OrekitOd.java
//   java  -cp ".:$OREKIT_CP" OrekitOd > ../batch_sequential_orbit_determination_reference.txt

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.linear.QRDecomposer;
import org.hipparchus.ode.nonstiff.ClassicalRungeKuttaIntegrator;
import org.hipparchus.optim.nonlinear.vector.leastsquares.LevenbergMarquardtOptimizer;

import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.estimation.leastsquares.BatchLSEstimator;
import org.orekit.estimation.measurements.GroundStation;
import org.orekit.estimation.measurements.ObservableSatellite;
import org.orekit.estimation.measurements.ObservedMeasurement;
import org.orekit.estimation.sequential.ConstantProcessNoise;
import org.orekit.estimation.sequential.KalmanEstimator;
import org.orekit.estimation.sequential.KalmanEstimatorBuilder;
import org.orekit.forces.gravity.J2OnlyPerturbation;
import org.orekit.frames.EOPHistory;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.Orbit;
import org.orekit.orbits.OrbitType;
import org.orekit.orbits.PositionAngleType;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.conversion.ClassicalRungeKuttaIntegratorBuilder;
import org.orekit.propagation.conversion.NumericalPropagatorBuilder;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.IERSConventions;
import org.orekit.utils.PVCoordinates;

public class OrekitOd {

    // kshana constants (src/forces.rs) — must match EXACTLY.
    static final double MU = 3.986004418e14;
    static final double RE = 6378137.0;
    static final double J2 = 1.08262668e-3;

    static Frame eci;
    static AbsoluteDate t0;
    static EOPHistory eop;

    /** A single OD scenario. */
    static final class Scenario {
        final String name;
        final double[] truth;       // [r(3) m, v(3) m/s] epoch state
        final double[][] stations;  // fixed inertial station positions (m)
        final double dt;            // RK4 step / epoch spacing (s)
        final int nBatch;           // epochs in the batch arc
        final int nSeq;             // epochs in the sequential arc
        final double sigma;         // ranging noise std (m); 0 = noiseless
        Scenario(String name, double[] truth, double[][] stations, double dt,
                 int nBatch, int nSeq, double sigma) {
            this.name = name; this.truth = truth; this.stations = stations;
            this.dt = dt; this.nBatch = nBatch; this.nSeq = nSeq; this.sigma = sigma;
        }
    }

    static double[] kepState(double a, double incDeg, double raanDeg, double argpDeg,
                             double taDeg, double ecc) {
        // Build a cartesian state from classical elements via Orekit (consistent with kshana's
        // frame conventions: GCRF inertial, the same MU). Returns [r(3), v(3)].
        double inc = Math.toRadians(incDeg);
        double raan = Math.toRadians(raanDeg);
        double argp = Math.toRadians(argpDeg);
        double ta = Math.toRadians(taDeg);
        org.orekit.orbits.KeplerianOrbit ko = new org.orekit.orbits.KeplerianOrbit(
            a, ecc, inc, argp, raan, ta, PositionAngleType.TRUE, eci, t0, MU);
        PVCoordinates pv = ko.getPVCoordinates();
        Vector3D p = pv.getPosition(), v = pv.getVelocity();
        return new double[]{p.getX(), p.getY(), p.getZ(), v.getX(), v.getY(), v.getZ()};
    }

    public static void main(String[] args) throws Exception {
        File data = new File(System.getenv("OREKIT_DATA"));
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(data));
        eci = FramesFactory.getGCRF();
        t0 = new AbsoluteDate(2025, 1, 1, 0, 0, 0.0, TimeScalesFactory.getUTC());
        eop = FramesFactory.getEOPHistory(IERSConventions.IERS_2010, true);

        // Three- and four-station ground networks (fixed inertial points, m). The 4th station
        // breaks the up/down ambiguity for the eccentric / high-altitude geometries.
        double[][] net3 = {
            {6.378e6, 0.0, 0.0}, {0.0, 6.378e6, 0.0}, {3.5e6, 3.5e6, 4.0e6}
        };
        double[][] net4 = {
            {6.378e6, 0.0, 0.0}, {0.0, 6.378e6, 0.0}, {3.5e6, 3.5e6, 4.0e6},
            {-4.5e6, -2.0e6, 3.5e6}
        };

        List<Scenario> scen = new ArrayList<>();
        // Noiseless, identical-dynamics scenarios (the tight <1 m / <1 mm/s comparison).
        scen.add(new Scenario("leo_i35",      kepState(7.000e6, 35.0, 10.0, 40.0, 0.0, 0.0),    net3, 20.0, 30, 60, 0.0));
        scen.add(new Scenario("leo_sunsync",  kepState(7.078e6, 98.0, 120.0, 90.0, 30.0, 0.001), net3, 20.0, 30, 60, 0.0));
        scen.add(new Scenario("meo",          kepState(2.0e7, 56.0, 200.0, 60.0, 80.0, 0.002),  net4, 60.0, 30, 60, 0.0));
        scen.add(new Scenario("eccentric",    kepState(1.2e7, 63.4, 80.0, 270.0, 20.0, 0.25),   net4, 30.0, 30, 60, 0.0));
        scen.add(new Scenario("leo_3station", kepState(6.9e6, 51.6, 300.0, 45.0, 120.0, 0.0007), net3, 20.0, 40, 70, 0.0));
        scen.add(new Scenario("meo_4station", kepState(1.5e7, 64.0, 15.0, 200.0, 150.0, 0.01),  net4, 45.0, 30, 60, 0.0));
        // Noisy (sigma = 5 m) scenarios: both estimators should agree <3 m and post-fit RMS ~sigma.
        scen.add(new Scenario("leo_i35_noisy",   kepState(7.000e6, 35.0, 10.0, 40.0, 0.0, 0.0),  net3, 20.0, 40, 70, 5.0));
        scen.add(new Scenario("leo_sunsync_noisy", kepState(7.078e6, 98.0, 120.0, 90.0, 30.0, 0.001), net4, 20.0, 40, 70, 5.0));

        System.out.println("# Orekit 12.2 BatchLSEstimator (Levenberg-Marquardt) + KalmanEstimator reference");
        System.out.println("# for kshana batch & sequential orbit determination. Oracle: Orekit 12.2");
        System.out.println("# (CS GROUP, Apache-2.0) + Hipparchus 3.1, OpenJDK 21. Generated by OrekitOd.java.");
        System.out.println("# Dynamics: two-body + J2 only in GCRF, fixed-step classical RK4 (dt). Stations:");
        System.out.println("# fixed inertial points. Range: instantaneous geometric distance (no light-time).");
        System.out.println("# These match kshana::orbit_determination byte-for-byte, isolating the estimator.");
        System.out.println("#");
        System.out.println("# Record format (one block per scenario):");
        System.out.println("#   SCEN name | dt | nBatch | nSeq | sigma | nStations");
        System.out.println("#   TRUTH rx,ry,rz,vx,vy,vz");
        System.out.println("#   STATION i | sx,sy,sz                       (i = 0..nStations-1)");
        System.out.println("#   RANGE_BATCH k | r0,r1,...                  (k = 1..nBatch, one range per station)");
        System.out.println("#   RANGE_SEQ   k | r0,r1,...                  (k = 1..nSeq,   one range per station)");
        System.out.println("#   OREKIT_BATCH rx,ry,rz,vx,vy,vz | rmsResidual   (recovered EPOCH state)");
        System.out.println("#   OREKIT_SEQ_EPOCH rx,ry,rz,vx,vy,vz             (Kalman recovered epoch state)");
        System.out.println("#   OREKIT_SEQ_FINAL rx,ry,rz,vx,vy,vz             (epoch state propagated to last epoch)");
        System.out.println("# Units: m, s, m/s. Reproduce: see header of OrekitOd.java.");

        for (Scenario s : scen) {
            runScenario(s);
        }
    }

    static J2OnlyPerturbation j2() {
        return new J2OnlyPerturbation(MU, RE, J2, eci);
    }

    static NumericalPropagator truthProp(double[] s, double dt) {
        NumericalPropagator p = new NumericalPropagator(new ClassicalRungeKuttaIntegrator(dt));
        p.setOrbitType(OrbitType.CARTESIAN);
        p.addForceModel(j2());
        PVCoordinates pv = new PVCoordinates(new Vector3D(s[0], s[1], s[2]), new Vector3D(s[3], s[4], s[5]));
        p.setInitialState(new SpacecraftState(new CartesianOrbit(pv, eci, t0, MU)));
        return p;
    }

    static GroundStation[] makeStations(double[][] stECEF) {
        OneAxisEllipsoid earth = new OneAxisEllipsoid(RE, 0.0, eci); // spherical, INERTIAL body frame
        GroundStation[] g = new GroundStation[stECEF.length];
        for (int i = 0; i < stECEF.length; i++) {
            GeodeticPoint gp = earth.transform(new Vector3D(stECEF[i]), eci, t0);
            TopocentricFrame topo = new TopocentricFrame(earth, gp, "S" + i);
            g[i] = new GroundStation(topo, eop);
        }
        return g;
    }

    // Deterministic Gaussian noise (Box-Muller on a seeded LCG) so the committed fixture is
    // reproducible and the Rust test can be fed the IDENTICAL noisy ranges.
    static final class Rng {
        long st;
        Rng(long seed) { st = seed; }
        double u() { // xorshift64*
            st ^= st >>> 12; st ^= st << 25; st ^= st >>> 27;
            long x = st * 0x2545F4914F6CDD1DL;
            double d = ((x >>> 11) & ((1L << 53) - 1)) / (double) (1L << 53);
            return Math.min(Math.max(d, 1e-15), 1 - 1e-15);
        }
        double gauss() { return Math.sqrt(-2.0 * Math.log(u())) * Math.cos(2.0 * Math.PI * u()); }
    }

    static void runScenario(Scenario s) {
        GroundStation[] stations = makeStations(s.stations);
        Vector3D[] stInertial = new Vector3D[stations.length];
        for (int i = 0; i < stations.length; i++) {
            stInertial[i] = stations[i].getBaseFrame().getPVCoordinates(t0, eci).getPosition();
        }
        ObservableSatellite sat = new ObservableSatellite(0);

        // Generate noiseless geometric ranges over the (longer of the two) arcs once.
        int nMax = Math.max(s.nBatch, s.nSeq);
        NumericalPropagator tp = truthProp(s.truth, s.dt);
        double[][] cleanRanges = new double[nMax + 1][stations.length]; // index by epoch k (1..nMax)
        for (int k = 1; k <= nMax; k++) {
            AbsoluteDate tk = t0.shiftedBy(k * s.dt);
            Vector3D satPos = tp.propagate(tk).getPVCoordinates(eci).getPosition();
            for (int i = 0; i < stations.length; i++) {
                cleanRanges[k][i] = satPos.subtract(stInertial[i]).getNorm();
            }
        }

        // Add seeded noise (per scenario name hash) if sigma > 0; the SAME noisy ranges are
        // emitted, so kshana fits identical data.
        double[][] obsRanges = new double[nMax + 1][stations.length];
        Rng rng = new Rng(0xC0FFEEL ^ (long) s.name.hashCode());
        for (int k = 1; k <= nMax; k++) {
            for (int i = 0; i < stations.length; i++) {
                double n = (s.sigma > 0.0) ? s.sigma * rng.gauss() : 0.0;
                obsRanges[k][i] = cleanRanges[k][i] + n;
            }
        }

        // A perturbed initial guess (kshana uses ~1 km / ~5 m/s; same here).
        double[] guess = {
            s.truth[0] + 1000.0, s.truth[1] - 800.0, s.truth[2] + 600.0,
            s.truth[3] + 5.0, s.truth[4] - 4.0, s.truth[5] + 3.0
        };
        double sigmaW = (s.sigma > 0.0) ? s.sigma : 1.0; // measurement sigma for weighting

        // ---- Orekit BATCH (Levenberg-Marquardt) ----
        double[] batch = new double[6];
        double batchRms = Double.NaN;
        {
            List<GeometricRange> meas = new ArrayList<>();
            for (int k = 1; k <= s.nBatch; k++) {
                AbsoluteDate tk = t0.shiftedBy(k * s.dt);
                for (int i = 0; i < stations.length; i++) {
                    meas.add(new GeometricRange(stInertial[i], tk, obsRanges[k][i], sigmaW, 1.0, sat));
                }
            }
            NumericalPropagatorBuilder b = builder(guess, s.dt);
            BatchLSEstimator est = new BatchLSEstimator(new LevenbergMarquardtOptimizer(), b);
            est.setMaxIterations(50);
            est.setMaxEvaluations(200);
            est.setParametersConvergenceThreshold(s.sigma > 0.0 ? 1e-4 : 1e-9);
            for (GeometricRange m : meas) est.addMeasurement(m);
            org.orekit.propagation.Propagator[] res = est.estimate();
            PVCoordinates pv = res[0].getInitialState().getPVCoordinates(eci);
            batch = pv6(pv);
            // Post-fit residual RMS over the batch arc, recomputed from the recovered epoch state.
            batchRms = postfitRms(batch, s.dt, s.nBatch, stInertial, obsRanges);
        }

        // ---- Orekit SEQUENTIAL (KalmanEstimator, EKF) ----
        double[] seqFinal = new double[6];
        {
            NumericalPropagatorBuilder b = builder(guess, s.dt);
            // Initial covariance ~ kshana's p0 = diag(1e6,1e6,1e6,1e2,1e2,1e2); process noise tiny.
            double[][] p0 = diag(new double[]{1.0e6, 1.0e6, 1.0e6, 1.0e2, 1.0e2, 1.0e2});
            double[][] q  = diag(new double[]{1.0e-3, 1.0e-3, 1.0e-3, 1.0e-6, 1.0e-6, 1.0e-6});
            ConstantProcessNoise noise = new ConstantProcessNoise(
                org.hipparchus.linear.MatrixUtils.createRealMatrix(p0),
                org.hipparchus.linear.MatrixUtils.createRealMatrix(q));
            KalmanEstimator kf = new KalmanEstimatorBuilder()
                .decomposer(new QRDecomposer(1e-11))
                .addPropagationConfiguration(b, noise)
                .build();
            List<ObservedMeasurement<?>> meas = new ArrayList<>();
            for (int k = 1; k <= s.nSeq; k++) {
                AbsoluteDate tk = t0.shiftedBy(k * s.dt);
                for (int i = 0; i < stations.length; i++) {
                    meas.add(new GeometricRange(stInertial[i], tk, obsRanges[k][i], sigmaW, 1.0, sat));
                }
            }
            org.orekit.propagation.Propagator[] res = kf.processMeasurements(meas);
            // Orekit's KalmanEstimator returns the filtered state at the LAST processed
            // measurement epoch (verified: the returned propagator's initial-state date is
            // t0 + nSeq*dt, not t0). That is exactly the quantity kshana's UKF returns
            // (ukf.x = the final-epoch filtered state), so this IS the like-for-like state.
            seqFinal = pv6(res[0].getInitialState().getPVCoordinates(eci));
        }
        // Recover the t0 epoch state too, by propagating the final-epoch state back to t0 with
        // the identical RK4 dynamics (reported for completeness; the comparison uses FINAL).
        double[] seqEpoch = propagateFrom(seqFinal, t0.shiftedBy(s.nSeq * s.dt), t0, s.dt);

        // ---- Emit the record ----
        System.out.printf(Locale.ROOT, "SCEN %s | %s | %d | %d | %s | %d%n",
            s.name, repr(s.dt), s.nBatch, s.nSeq, repr(s.sigma), stations.length);
        System.out.printf(Locale.ROOT, "TRUTH %s%n", csv(s.truth));
        for (int i = 0; i < stations.length; i++) {
            System.out.printf(Locale.ROOT, "STATION %d | %s%n", i, csv3(s.stations[i]));
        }
        for (int k = 1; k <= s.nBatch; k++) {
            System.out.printf(Locale.ROOT, "RANGE_BATCH %d | %s%n", k, csvRow(obsRanges[k], stations.length));
        }
        for (int k = 1; k <= s.nSeq; k++) {
            System.out.printf(Locale.ROOT, "RANGE_SEQ %d | %s%n", k, csvRow(obsRanges[k], stations.length));
        }
        System.out.printf(Locale.ROOT, "OREKIT_BATCH %s | %s%n", csv(batch), repr(batchRms));
        System.out.printf(Locale.ROOT, "OREKIT_SEQ_EPOCH %s%n", csv(seqEpoch));
        System.out.printf(Locale.ROOT, "OREKIT_SEQ_FINAL %s%n", csv(seqFinal));
    }

    static NumericalPropagatorBuilder builder(double[] guess, double dt) {
        PVCoordinates pv = new PVCoordinates(new Vector3D(guess[0], guess[1], guess[2]),
                                             new Vector3D(guess[3], guess[4], guess[5]));
        Orbit orb = new CartesianOrbit(pv, eci, t0, MU);
        ClassicalRungeKuttaIntegratorBuilder ib = new ClassicalRungeKuttaIntegratorBuilder(dt);
        NumericalPropagatorBuilder b = new NumericalPropagatorBuilder(orb, ib, PositionAngleType.TRUE, 1.0);
        b.addForceModel(j2());
        return b;
    }

    /** Propagate state s0 (defined at date `from`) to date `to` with the identical fixed-step
     *  RK4 two-body+J2 dynamics. Works for forward or backward propagation. */
    static double[] propagateFrom(double[] s0, AbsoluteDate from, AbsoluteDate to, double dt) {
        NumericalPropagator p = new NumericalPropagator(new ClassicalRungeKuttaIntegrator(dt));
        p.setOrbitType(OrbitType.CARTESIAN);
        p.addForceModel(j2());
        PVCoordinates pv = new PVCoordinates(new Vector3D(s0[0], s0[1], s0[2]),
                                             new Vector3D(s0[3], s0[4], s0[5]));
        p.setInitialState(new SpacecraftState(new CartesianOrbit(pv, eci, from, MU)));
        return pv6(p.propagate(to).getPVCoordinates(eci));
    }

    static double postfitRms(double[] epoch, double dt, int nBatch, Vector3D[] st, double[][] obs) {
        NumericalPropagator p = truthProp(epoch, dt);
        double sum = 0.0; int cnt = 0;
        for (int k = 1; k <= nBatch; k++) {
            Vector3D satPos = p.propagate(t0.shiftedBy(k * dt)).getPVCoordinates(eci).getPosition();
            for (int i = 0; i < st.length; i++) {
                double pred = satPos.subtract(st[i]).getNorm();
                double d = obs[k][i] - pred;
                sum += d * d; cnt++;
            }
        }
        return Math.sqrt(sum / cnt);
    }

    static double[] pv6(PVCoordinates pv) {
        Vector3D p = pv.getPosition(), v = pv.getVelocity();
        return new double[]{p.getX(), p.getY(), p.getZ(), v.getX(), v.getY(), v.getZ()};
    }
    static double[][] diag(double[] d) {
        double[][] m = new double[d.length][d.length];
        for (int i = 0; i < d.length; i++) m[i][i] = d[i];
        return m;
    }
    static String repr(double x) { return Double.toString(x); }
    static String csv(double[] x) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < x.length; i++) { if (i > 0) sb.append(','); sb.append(Double.toString(x[i])); }
        return sb.toString();
    }
    static String csv3(double[] x) { return csv(new double[]{x[0], x[1], x[2]}); }
    static String csvRow(double[] row, int n) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < n; i++) { if (i > 0) sb.append(','); sb.append(Double.toString(row[i])); }
        return sb.toString();
    }
}
