// SPDX-License-Identifier: AGPL-3.0-only
// Oracle driver for tests/pass_predictor_on_path_orekit_oracle.rs (package D8, leg 3 of the
// three-leg oracle). The round-1 PassesApparentDriver.java with one change: TLEPropagator runs
// in a TEME frame Orekit builds to the definition the engine states, a child of
// FramesFactory.getTOD(IERS_2010, true) rotated about the pole by the IERS 2010 equation of the
// equinoxes (GAST - GMST from IERSConventions.IERS_2010), instead of Orekit's default TEME
// (built on the IERS 1996 conventions).
//
// Runs Orekit 13.1.8 with Hipparchus 4.0.3 (Apache-2.0) as a separate program on round 1's cases.csv:
// per case an SGP4 mean element set (Orekit TLE in double precision, TLEPropagator), a
// sea-level WGS 84 station and a mask, over a 24-hour window from the element epoch. The data
// directory holds only the leap-second table, so no Earth orientation parameters are loaded.
// Refraction: ITURP834AtmosphericRefraction(0.0).
//   Q3: ElevationDetector (no refraction) + ElevationExtremumDetector, max check 10 s,
//       threshold 1e-6 s, EventsLogger.
//   Q2: the same with withRefraction(ITU-R P.834); the maximum elevation is the extremum
//       detector's elevation with the refraction model applied.
//   Q1: AngularAzEl theoretical evaluation (downlink light time) with
//       AngularRadioRefractionModifier; AOS and LOS are the roots of its elevation minus the
//       mask by BracketingNthOrderBrentSolver on +/- 2 s around the Q2 events; the maximum by
//       BrentOptimizer on +/- 30 s around the Q2 culmination, within the pass.
//   Q4: the Q1 model's azimuth and elevation every 30 s inside every Q1 pass, from AOS
//       rounded up to a multiple of 30 s.
// Output lines: "P case q aos tca los max_el_deg" and "S case t az_rad el_rad".
//
// Build and run: see generate.sh.

import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.hipparchus.analysis.UnivariateFunction;
import org.hipparchus.analysis.solvers.AllowedSolution;
import org.hipparchus.analysis.solvers.BracketingNthOrderBrentSolver;
import org.hipparchus.optim.MaxEval;
import org.hipparchus.optim.nonlinear.scalar.GoalType;
import org.hipparchus.optim.univariate.BrentOptimizer;
import org.hipparchus.optim.univariate.SearchInterval;
import org.hipparchus.optim.univariate.UnivariateObjectiveFunction;
import org.hipparchus.CalculusFieldElement;
import org.hipparchus.geometry.euclidean.threed.Rotation;
import org.hipparchus.geometry.euclidean.threed.RotationConvention;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.util.FastMath;
import org.hipparchus.util.MathUtils;
import org.orekit.frames.FieldTransform;
import org.orekit.frames.Transform;
import org.orekit.frames.TransformProvider;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.time.TimeScalarFunction;
import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.estimation.measurements.AngularAzEl;
import org.orekit.estimation.measurements.GroundStation;
import org.orekit.estimation.measurements.ObservableSatellite;
import org.orekit.estimation.measurements.modifiers.AngularRadioRefractionModifier;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.models.AtmosphericRefractionModel;
import org.orekit.models.earth.ITURP834AtmosphericRefraction;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.analytical.tle.TLE;
import org.orekit.propagation.analytical.tle.TLEPropagator;
import org.orekit.propagation.events.ElevationDetector;
import org.orekit.propagation.events.ElevationExtremumDetector;
import org.orekit.propagation.events.EventsLogger;
import org.orekit.propagation.events.handlers.ContinueOnEvent;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScale;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.Constants;
import org.orekit.utils.IERSConventions;
import org.orekit.utils.ParameterDriver;

public class PassesOnPathDriver {

    static final double DURATION = 86400.0;

    static Frame temeFrame;

    /** The TEME of the stated definition: Orekit's IERS 2010 TOD rotated by GAST - GMST. */
    static Frame buildTeme() {
        Frame tod = FramesFactory.getTOD(IERSConventions.IERS_2010, true);
        TimeScale ut1 = TimeScalesFactory.getUT1(IERSConventions.IERS_2010, true);
        TimeScalarFunction gast = IERSConventions.IERS_2010.getGASTFunction(ut1,
                FramesFactory.getEOPHistory(IERSConventions.IERS_2010, true));
        TimeScalarFunction gmst = IERSConventions.IERS_2010.getGMSTFunction(ut1);
        TransformProvider provider = new TransformProvider() {
            @Override
            public Transform getTransform(final AbsoluteDate date) {
                double eqe = MathUtils.normalizeAngle(gast.value(date) - gmst.value(date), 0.0);
                return new Transform(date, new Rotation(Vector3D.PLUS_K, eqe, RotationConvention.FRAME_TRANSFORM));
            }

            @Override
            public <T extends CalculusFieldElement<T>> FieldTransform<T> getTransform(final FieldAbsoluteDate<T> date) {
                throw new UnsupportedOperationException("field transforms are not used");
            }
        };
        return new Frame(tod, provider, "TEME-IERS2010", true);
    }

    static TLEPropagator propagator(TLE tle) {
        return TLEPropagator.selectExtrapolator(tle, temeFrame);
    }

    /** Passes [aos, tca, los, maxEl(deg)] from Orekit's detectors, with or without refraction. */
    static List<double[]> detect(TLE tle, TopocentricFrame topo, Frame itrf, double mask,
                                 AtmosphericRefractionModel refr, AbsoluteDate t0) {
        TLEPropagator p = propagator(tle);
        ElevationDetector det = new ElevationDetector(topo).withConstantElevation(mask)
                .withMaxCheck(10.0).withThreshold(1e-6).withHandler(new ContinueOnEvent());
        if (refr != null) {
            det = det.withRefraction(refr);
        }
        ElevationExtremumDetector ext = new ElevationExtremumDetector(10.0, 1e-6, topo)
                .withHandler(new ContinueOnEvent());
        EventsLogger logger = new EventsLogger();
        p.addEventDetector(logger.monitorDetector(det));
        p.addEventDetector(logger.monitorDetector(ext));
        SpacecraftState s0 = p.propagate(t0);
        p.propagate(t0, t0.shiftedBy(DURATION));
        List<double[]> crossings = new ArrayList<>();
        List<double[]> maxima = new ArrayList<>();
        for (EventsLogger.LoggedEvent ev : logger.getLoggedEvents()) {
            double t = ev.getState().getDate().durationFrom(t0);
            if (ev.getEventDetector() instanceof ElevationExtremumDetector) {
                if (!ev.isIncreasing()) {
                    double el = ext.getElevation(ev.getState());
                    maxima.add(new double[] {t, apparent(el, refr)});
                }
            } else {
                crossings.add(new double[] {t, ev.isIncreasing() ? 1.0 : 0.0});
            }
        }
        java.util.function.DoubleUnaryOperator elAt = t -> {
            SpacecraftState s = propagator(tle).propagate(t0.shiftedBy(t));
            return apparent(topo.getElevation(s.getPosition(), s.getFrame(), s.getDate()), refr);
        };
        List<double[]> passes = new ArrayList<>();
        Double aos = elAt.applyAsDouble(0.0) >= mask ? 0.0 : null;
        for (double[] c : crossings) {
            if (c[1] == 1.0 && aos == null) {
                aos = c[0];
            } else if (c[1] == 0.0 && aos != null) {
                passes.add(close(aos, c[0], maxima, elAt));
                aos = null;
            }
        }
        if (aos != null) {
            passes.add(close(aos, DURATION, maxima, elAt));
        }
        return passes;
    }

    static double apparent(double el, AtmosphericRefractionModel refr) {
        return refr == null ? el : el + refr.getRefraction(el);
    }

    static double[] close(double aos, double los, List<double[]> maxima,
                          java.util.function.DoubleUnaryOperator elAt) {
        double tca = Double.NaN;
        double best = Double.NEGATIVE_INFINITY;
        for (double[] m : maxima) {
            if (m[0] >= aos && m[0] <= los && m[1] > best) {
                best = m[1];
                tca = m[0];
            }
        }
        for (double edge : new double[] {aos, los}) {
            double e = elAt.applyAsDouble(edge);
            if (e > best) {
                best = e;
                tca = edge;
            }
        }
        return new double[] {aos, tca, los, FastMath.toDegrees(best)};
    }

    public static void main(String[] args) throws Exception {
        String dir = args[0];
        DataContext.getDefault().getDataProvidersManager()
                .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT13_DATA_NO_EOP"))));
        TimeScale utc = TimeScalesFactory.getUTC();
        Frame itrf = FramesFactory.getITRF(IERSConventions.IERS_2010, true);
        temeFrame = buildTeme();
        OneAxisEllipsoid earth = new OneAxisEllipsoid(Constants.WGS84_EARTH_EQUATORIAL_RADIUS,
                Constants.WGS84_EARTH_FLATTENING, itrf);
        PrintWriter out = new PrintWriter(Paths.get(dir, "orekit.txt").toFile());
        out.println("# Orekit 13.1.8 oracle output (PassesOnPathDriver.java)");
        out.println("# P case q aos_s tca_s los_s max_el_deg   (q = 1, 2, 3)");
        out.println("# S case t_s az_rad el_rad                 (Q4)");
        for (String line : Files.readAllLines(Paths.get(args[1], "cases.csv"))) {
            if (line.startsWith("#") || line.isEmpty()) {
                continue;
            }
            String[] f = line.split(",");
            double[] x = new double[f.length];
            for (int k = 0; k < f.length; k++) {
                x[k] = Double.parseDouble(f[k]);
            }
            int ci = (int) x[0];
            AbsoluteDate t0 = new AbsoluteDate((int) x[1], (int) x[2], (int) x[3], (int) x[4],
                    (int) x[5], x[6], utc);
            TLE tle = new TLE(ci + 1, 'U', 2000, 1, "A", 0, 1, t0, x[7] / 60.0, 0.0, 0.0,
                    x[8], x[9], x[11], x[10], x[12], 0, x[13], utc);
            GeodeticPoint gp = new GeodeticPoint(FastMath.toRadians(x[14]),
                    FastMath.toRadians(x[15]), x[16]);
            TopocentricFrame topo = new TopocentricFrame(earth, gp, "station");
            double mask = FastMath.toRadians(x[17]);
            ITURP834AtmosphericRefraction refr = new ITURP834AtmosphericRefraction(x[16]);
            List<double[]> q3 = detect(tle, topo, itrf, mask, null, t0);
            List<double[]> q2 = detect(tle, topo, itrf, mask, refr, t0);

            // Q1: AngularAzEl (light time) with the refraction modifier.
            GroundStation gs = new GroundStation(topo);
            for (ParameterDriver d : new ParameterDriver[] {gs.getClockOffsetDriver(),
                    gs.getClockDriftDriver(), gs.getClockAccelerationDriver(),
                    gs.getPrimeMeridianOffsetDriver(), gs.getPrimeMeridianDriftDriver(),
                    gs.getPolarOffsetXDriver(), gs.getPolarDriftXDriver(),
                    gs.getPolarOffsetYDriver(), gs.getPolarDriftYDriver()}) {
                d.setReferenceDate(t0);
            }
            TLEPropagator p1 = propagator(tle);
            ObservableSatellite sat = new ObservableSatellite(0);
            AngularRadioRefractionModifier modifier = new AngularRadioRefractionModifier(refr);
            java.util.function.DoubleFunction<double[]> azel = t -> {
                AbsoluteDate d = t0.shiftedBy(t);
                AngularAzEl m = new AngularAzEl(gs, d, new double[] {0.0, 0.0},
                        new double[] {1.0, 1.0}, new double[] {1.0, 1.0}, sat);
                m.addModifier(modifier);
                return m.estimateWithoutDerivatives(0, 0, new SpacecraftState[] {p1.propagate(d)})
                        .getEstimatedValue();
            };
            UnivariateFunction g = t -> azel.apply(t)[1] - mask;
            BracketingNthOrderBrentSolver solver = new BracketingNthOrderBrentSolver(1e-15, 1e-7, 5);
            BrentOptimizer opt = new BrentOptimizer(1e-12, 1e-7);
            List<double[]> q1 = new ArrayList<>();
            for (double[] p : q2) {
                double aos = p[0] == 0.0 && g.value(0.0) >= 0.0 ? 0.0
                        : solver.solve(1000, g, FastMath.max(0.0, p[0] - 2.0), p[0] + 2.0, AllowedSolution.ANY_SIDE);
                double los = p[2] == DURATION && g.value(DURATION) >= 0.0 ? DURATION
                        : solver.solve(1000, g, p[2] - 2.0, FastMath.min(DURATION, p[2] + 2.0), AllowedSolution.ANY_SIDE);
                double lo = FastMath.max(aos, p[1] - 30.0);
                double hi = FastMath.min(los, p[1] + 30.0);
                double tca = p[1];
                double best = azel.apply(tca)[1];
                if (hi - lo > 1e-6) {
                    double start = FastMath.min(FastMath.max(p[1], lo), hi);
                    var pt = opt.optimize(new MaxEval(1000),
                            new UnivariateObjectiveFunction(t -> azel.apply(t)[1]), GoalType.MAXIMIZE,
                            new SearchInterval(lo, hi, start));
                    tca = pt.getPoint();
                    best = pt.getValue();
                }
                for (double edge : new double[] {aos, los}) {
                    double e = azel.apply(edge)[1];
                    if (e > best) {
                        best = e;
                        tca = edge;
                    }
                }
                q1.add(new double[] {aos, tca, los, FastMath.toDegrees(best)});
            }
            List<List<double[]>> all = List.of(q1, q2, q3);
            for (int q = 0; q < 3; q++) {
                for (double[] p : all.get(q)) {
                    out.printf(Locale.ROOT, "P %d %d %.17g %.17g %.17g %.17g%n", ci, q + 1,
                            p[0], p[1], p[2], p[3]);
                }
            }
            for (double[] p : q1) {
                for (double t = FastMath.ceil(p[0] / 30.0) * 30.0; t <= p[2]; t += 30.0) {
                    double[] v = azel.apply(t);
                    out.printf(Locale.ROOT, "S %d %.17g %.17g %.17g%n", ci, t, v[0], v[1]);
                }
            }
            System.out.printf(Locale.ROOT, "case %d: %d passes%n", ci, q1.size());
        }
        out.close();
    }
}
