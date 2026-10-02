// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle driver for the full lunar service-volume report on retrieved geometry
// (row "Lunar service volume from real, retrieved constellation geometry"):
// tests/lunar_service_requirement_orekit_oracle.rs. No Kshana code.
//
// ORACLE: Orekit 12.2 (Apache-2.0) with Hipparchus 3.1 (Apache-2.0), run as a separate program.
//
//   Geometry
//     * LNCSS cases A, B, C (navi.613 Table 1, committed fixtures): elements in the Earth
//       orbital-plane (OP) frame at 2025-11-09T00:00:00 UTC (z along r x v of the Earth about the
//       Moon from Orekit's DE440, x = p x z with p the pole of Orekit's IAU Moon frame,
//       y = z x x), gm_de440 lunar GM, Orekit NumericalPropagator (Dormand-Prince 8(5,3),
//       1e-3 m) in a Moon-centred frame with ICRF axes, Holmes-Featherstone J2 = 2.0321e-4 and
//       C22 = 2.2382e-5 in Orekit's IAU Moon frame, Earth and Sun ThirdBodyAttraction (DE440);
//     * LANS demonstration set: Orekit KeplerianPropagator from the ICRF elements (true anomaly)
//       at the stated TDB epoch, lunar GM 4.902800118e12 m^3/s^2;
//     * the four lunar orbiters: Orekit TimeStampedPVCoordinatesHermiteInterpolator, nine
//       nodes, positions only, over the committed JPL Horizons table, TDB epoch from the file.
//   Users: the engine's grid rule on Orekit's OneAxisEllipsoid (1737.4 km, flattening 0) in
//     Orekit's IAU Moon body frame.
//   Visibility and DOP: Orekit DOPComputer (minimum elevation = the mask) for the visible
//     count and PDOP; the protection-level satellites from TopocentricFrame elevations at or
//     above the mask, line of sight in Orekit's topocentric (east, north, zenith) frame. The
//     run aborts if the two counts differ.
//   Protection levels (six or more visible): single-fault MHSS bound, zero nominal bias,
//     per-satellite prior 1e-4, P_FA 1e-5 split two-sided over n, budget p_hmi / 2 per axis;
//     (G^T G)^-1 by Hipparchus LUDecomposition; K_fa by Erf.erfcInv; tails by Erf.erfc; roots
//     by BracketingNthOrderBrentSolver. The requirement: per sample, the sigma at which its HPL
//     equals the alert limit (Brent on sigma, the protection level re-solved at each trial
//     sigma); sigma_required = the smallest; sigma_required_p95 = the (n - r + 1)-th smallest,
//     r = ceil(0.95 n), the sigma at which the nearest-rank 95th-percentile HPL meets the alert
//     limit (each HPL increases with sigma).
//
// OUTPUT (stdout, CSV): comments, then one row per (run, config):
//   run,config,n_samples,min_sats,max_sats,coverage_pct,pdop_min,pdop_mean,pdop_max,
//   n_pl_samples,hpl_min_m,hpl_max_m,vpl_min_m,vpl_max_m,pl_availability_pct,hpl_p95_m,
//   sigma_required_m,sigma_required_p95_m
// with the report's sentinels: 0 for PDOP and envelope fields without samples, NA for an
// absent requirement.
//
// Run:
//   source ~/Code/kshana-oracles/env.sh
//   javac -cp "$OREKIT_CP" LunarServiceRequirementOracle.java
//   java -cp ".:$OREKIT_CP" LunarServiceRequirementOracle <repo>/tests/fixtures/lunar_ephemeris \
//     > <repo>/tests/fixtures/lunar_service_requirement_orekit_oracle/orekit_requirement.csv

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hipparchus.CalculusFieldElement;
import org.hipparchus.analysis.solvers.BracketingNthOrderBrentSolver;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.linear.Array2DRowRealMatrix;
import org.hipparchus.linear.LUDecomposition;
import org.hipparchus.linear.RealMatrix;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.hipparchus.special.Erf;
import org.orekit.bodies.CelestialBody;
import org.orekit.bodies.CelestialBodyFactory;
import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.forces.gravity.HolmesFeatherstoneAttractionModel;
import org.orekit.forces.gravity.ThirdBodyAttraction;
import org.orekit.forces.gravity.potential.GravityFieldFactory;
import org.orekit.forces.gravity.potential.NormalizedSphericalHarmonicsProvider;
import org.orekit.forces.gravity.potential.TideSystem;
import org.orekit.frames.FieldTransform;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.frames.Transform;
import org.orekit.frames.TransformProvider;
import org.orekit.gnss.DOP;
import org.orekit.gnss.DOPComputer;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.KeplerianOrbit;
import org.orekit.orbits.OrbitType;
import org.orekit.orbits.PositionAngleType;
import org.orekit.propagation.Propagator;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.analytical.Ephemeris;
import org.orekit.propagation.analytical.KeplerianPropagator;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.DateComponents;
import org.orekit.time.TimeComponents;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.CartesianDerivativesFilter;
import org.orekit.utils.PVCoordinates;
import org.orekit.utils.TimeStampedPVCoordinates;
import org.orekit.utils.TimeStampedPVCoordinatesHermiteInterpolator;

public class LunarServiceRequirementOracle {

    // ---- pre-registered constants ----
    static final double GM_MOON_DE440 = 4.902800118457549e12;
    static final double GM_MOON_ENGINE = 4.902800118e12;
    static final double J2 = 2.0321e-4;
    static final double C22 = 2.2382e-5;
    static final double R_MOON = 1737400.0;
    static final double HORIZON_S = 12.0 * 3600.0;
    static final double MASK_DEG = 5.0;
    static final double PDOP_THRESHOLD = 6.0;
    static final double ALERT_LIMIT_M = 50.0;
    static final double P_HMI = 1e-4;
    static final double P_FA = 1e-5;
    static final double P_SAT = 1e-4;
    static final double SIGMA_URE_M = 30.0;

    /** Config: lat min, lat max, lat step, lon min, lon max, lon step, step minutes. */
    static final Object[][] CONFIGS = {
        {"S", new double[] {-90, -60, 10, -180, 180, 60, 60}},
        {"D", new double[] {-90, -80, 1, -180, 180, 15, 10}},
    };

    static Frame gcrf;
    static Frame moonBody;
    static Frame moonIcrf;
    static CelestialBody moon;
    static OneAxisEllipsoid moonShape;
    // Two solver instances: a Hipparchus solver keeps per-solve state, so the protection-level
    // root (inner) and the requirement root on sigma (outer) must not share one.
    static final BracketingNthOrderBrentSolver SOLVER =
        new BracketingNthOrderBrentSolver(1e-15, 1e-12, 1e-300, 5);
    static final BracketingNthOrderBrentSolver SIGMA_SOLVER =
        new BracketingNthOrderBrentSolver(1e-15, 1e-12, 1e-300, 5);

    /** The engine's grid rule (LunarServiceScenario::grid), in degrees. */
    static List<double[]> grid(double[] c) {
        List<double[]> pts = new ArrayList<>();
        double lat = c[0];
        double latStep = Math.abs(c[2]) < 1e-9 ? 1.0 : Math.abs(c[2]);
        int nLat = (int) Math.max(Math.ceil((c[1] + 1e-9 - c[0]) / latStep), 0.0) + 2;
        for (int i = 0; i < nLat; i++) {
            if (lat > c[1] + 1e-9) {
                break;
            }
            double lon = c[3];
            double lonStep = Math.abs(c[5]) < 1e-9 ? 1.0 : Math.abs(c[5]);
            double lonHi = Math.abs(c[4] - c[3] - 360.0) < 1e-6 ? c[4] - lonStep + 1e-9 : c[4] + 1e-9;
            int nLon = (int) Math.max(Math.ceil((lonHi - c[3]) / lonStep), 0.0) + 2;
            for (int j = 0; j < nLon; j++) {
                if (lon > lonHi) {
                    break;
                }
                pts.add(new double[] {lat, lon});
                lon += lonStep;
            }
            lat += latStep;
        }
        return pts;
    }

    /** The engine's time rule (LunarServiceScenario::times), seconds. */
    static List<Double> times(double stepMin) {
        List<Double> ts = new ArrayList<>();
        double step = Math.abs(stepMin) < 1e-9 ? 3600.0 : Math.abs(stepMin) * 60.0;
        double t = 0.0;
        int n = (int) Math.max(Math.ceil((HORIZON_S - 1e-6) / step), 0.0) + 2;
        for (int i = 0; i < n; i++) {
            if (t >= HORIZON_S - 1e-6) {
                break;
            }
            ts.add(t);
            t += step;
        }
        return ts;
    }

    static List<String[]> rows(File f) throws Exception {
        List<String[]> out = new ArrayList<>();
        for (String line : Files.readAllLines(f.toPath())) {
            if (line.startsWith("#") || line.startsWith("sat") || line.isBlank()) {
                continue;
            }
            out.add(line.split(","));
        }
        return out;
    }

    static String meta(File f, String key) throws Exception {
        for (String line : Files.readAllLines(f.toPath())) {
            if (line.startsWith("# " + key + ":")) {
                return line.substring(key.length() + 3).trim();
            }
        }
        throw new IllegalStateException("no " + key + " in " + f);
    }

    /** Moon-centred frame with ICRF axes: a pure translation of GCRF. */
    static final class MoonIcrf implements TransformProvider {
        private static final long serialVersionUID = 1L;

        @Override
        public Transform getTransform(AbsoluteDate date) {
            return new Transform(date, moon.getPVCoordinates(date, gcrf).negate());
        }

        @Override
        public <T extends CalculusFieldElement<T>> FieldTransform<T> getTransform(FieldAbsoluteDate<T> date) {
            throw new UnsupportedOperationException("field transforms are not used here");
        }
    }

    /** LNCSS case: numerical propagation from OP-frame elements, states at the sample times. */
    static List<Propagator> lncss(File f, AbsoluteDate epoch, List<Double> ts) throws Exception {
        CelestialBody earth = CelestialBodyFactory.getEarth();
        CelestialBody sun = CelestialBodyFactory.getSun();
        PVCoordinates moonPv = moon.getPVCoordinates(epoch, gcrf);
        Vector3D rE = moonPv.getPosition().negate();
        Vector3D vE = moonPv.getVelocity().negate();
        Vector3D z = Vector3D.crossProduct(rE, vE).normalize();
        Vector3D pole = moonBody.getTransformTo(gcrf, epoch).transformVector(Vector3D.PLUS_K);
        Vector3D x = Vector3D.crossProduct(pole, z).normalize();
        Vector3D y = Vector3D.crossProduct(z, x);
        double[][] cn = {{1.0}, {0.0, 0.0}, {-J2 / Math.sqrt(5.0), 0.0, C22 / Math.sqrt(5.0 / 12.0)}};
        double[][] sn = {{0.0}, {0.0, 0.0}, {0.0, 0.0, 0.0}};
        NormalizedSphericalHarmonicsProvider field =
            GravityFieldFactory.getNormalizedProvider(R_MOON, GM_MOON_DE440, TideSystem.UNKNOWN, cn, sn);
        List<Propagator> out = new ArrayList<>();
        for (String[] t : rows(f)) {
            double[] e = new double[6];
            for (int i = 0; i < 6; i++) {
                e[i] = Double.parseDouble(t[i + 1].trim());
            }
            KeplerianOrbit kep = new KeplerianOrbit(e[0] * 1e3, e[1], Math.toRadians(e[2]),
                Math.toRadians(e[4]), Math.toRadians(e[3]), Math.toRadians(e[5]),
                PositionAngleType.MEAN, moonIcrf, epoch, GM_MOON_DE440);
            Vector3D po = kep.getPosition();
            Vector3D vo = kep.getPVCoordinates().getVelocity();
            Vector3D pr = new Vector3D(po.getX(), x, po.getY(), y, po.getZ(), z);
            Vector3D vr = new Vector3D(vo.getX(), x, vo.getY(), y, vo.getZ(), z);
            CartesianOrbit orbit = new CartesianOrbit(new PVCoordinates(pr, vr), moonIcrf, epoch,
                GM_MOON_DE440);
            double[][] tol = NumericalPropagator.tolerances(1e-3, orbit, OrbitType.CARTESIAN);
            NumericalPropagator prop =
                new NumericalPropagator(new DormandPrince853Integrator(1e-3, 300.0, tol[0], tol[1]));
            prop.setOrbitType(OrbitType.CARTESIAN);
            prop.setInitialState(new SpacecraftState(orbit));
            prop.addForceModel(new HolmesFeatherstoneAttractionModel(moonBody, field));
            prop.addForceModel(new ThirdBodyAttraction(earth));
            prop.addForceModel(new ThirdBodyAttraction(sun));
            List<SpacecraftState> states = new ArrayList<>();
            for (double tt : ts) {
                states.add(prop.propagate(epoch.shiftedBy(tt)));
            }
            states.add(prop.propagate(epoch.shiftedBy(HORIZON_S)));
            out.add(new Ephemeris(states, 2));
        }
        return out;
    }

    /** LANS: two-body propagation of ICRF elements (true anomaly). */
    static List<Propagator> lans(File f, AbsoluteDate epoch) throws Exception {
        List<Propagator> out = new ArrayList<>();
        for (String[] t : rows(f)) {
            double a = Double.parseDouble(t[2].trim()) * 1e3;
            double ecc = Double.parseDouble(t[3].trim());
            double inc = Math.toRadians(Double.parseDouble(t[4].trim()));
            double raan = Math.toRadians(Double.parseDouble(t[5].trim()));
            double argp = Math.toRadians(Double.parseDouble(t[6].trim()));
            double nu = Math.toRadians(Double.parseDouble(t[7].trim()));
            KeplerianOrbit kep = new KeplerianOrbit(a, ecc, inc, argp, raan, nu,
                PositionAngleType.TRUE, moonIcrf, epoch, GM_MOON_ENGINE);
            out.add(new KeplerianPropagator(kep));
        }
        return out;
    }

    /** Orbiters: nine-node Hermite interpolation on positions of the Horizons table. */
    static List<Propagator> orbiters(File f, AbsoluteDate epoch, List<Double> ts) throws Exception {
        List<List<TimeStampedPVCoordinates>> tracks = new ArrayList<>();
        for (String[] t : rows(f)) {
            int sat = Integer.parseInt(t[0].trim());
            while (tracks.size() <= sat) {
                tracks.add(new ArrayList<>());
            }
            Vector3D p = new Vector3D(Double.parseDouble(t[2].trim()) * 1e3,
                Double.parseDouble(t[3].trim()) * 1e3, Double.parseDouble(t[4].trim()) * 1e3);
            tracks.get(sat).add(new TimeStampedPVCoordinates(
                epoch.shiftedBy(Double.parseDouble(t[1].trim())), p, Vector3D.ZERO));
        }
        TimeStampedPVCoordinatesHermiteInterpolator interp =
            new TimeStampedPVCoordinatesHermiteInterpolator(9, CartesianDerivativesFilter.USE_P);
        List<Propagator> out = new ArrayList<>();
        for (List<TimeStampedPVCoordinates> tr : tracks) {
            List<SpacecraftState> states = new ArrayList<>();
            List<Double> all = new ArrayList<>(ts);
            all.add(ts.get(ts.size() - 1) + 1.0);
            for (double tt : all) {
                TimeStampedPVCoordinates pv = interp.interpolate(epoch.shiftedBy(tt), tr);
                states.add(new SpacecraftState(new CartesianOrbit(pv, moonIcrf, GM_MOON_ENGINE)));
            }
            out.add(new Ephemeris(states, 2));
        }
        return out;
    }

    static double q(double z) {
        return 0.5 * Erf.erfc(z / Math.sqrt(2.0));
    }

    /** Smallest PL with sum p Q((PL - T)/s) = budget, modes {p, T, s}. */
    static double pl(List<double[]> modes, double budget) {
        double tMax = 0.0, sMax = 0.0;
        for (double[] m : modes) {
            tMax = Math.max(tMax, m[1]);
            sMax = Math.max(sMax, m[2]);
        }
        final double hi = tMax + 40.0 * sMax;
        return SOLVER.solve(10000, v -> {
            double r = -budget;
            for (double[] m : modes) {
                if (m[2] > 0.0) {
                    r += m[0] * q((v - m[1]) / m[2]);
                }
            }
            return r;
        }, 0.0, hi);
    }

    static RealMatrix inverseOrNull(double[][] g) {
        double[][] a = new double[4][4];
        for (double[] row : g) {
            for (int i = 0; i < 4; i++) {
                for (int j = 0; j < 4; j++) {
                    a[i][j] += row[i] * row[j];
                }
            }
        }
        LUDecomposition lu = new LUDecomposition(new Array2DRowRealMatrix(a));
        return lu.getSolver().isNonSingular() ? lu.getSolver().getInverse() : null;
    }

    /**
     * The sigma-free geometry of one sample: per hypothesis (all-in-view first) the vertical
     * and horizontal variance per unit ranging variance, and the separation variances; null
     * when fewer than six satellites or a singular all-in-view geometry.
     */
    static double[][] geometry(List<Vector3D> los) {
        int n = los.size();
        if (n < 6) {
            return null;
        }
        double[][] g = new double[n][];
        for (int i = 0; i < n; i++) {
            Vector3D e = los.get(i);
            g[i] = new double[] {-e.getX(), -e.getY(), -e.getZ(), 1.0};
        }
        RealMatrix q0 = inverseOrNull(g);
        if (q0 == null) {
            return null;
        }
        double v0 = q0.getEntry(2, 2), h0 = q0.getEntry(0, 0) + q0.getEntry(1, 1);
        List<double[]> out = new ArrayList<>();
        out.add(new double[] {n, v0, h0});
        for (int k = 0; k < n; k++) {
            double[][] sub = new double[n - 1][];
            for (int i = 0, j = 0; i < n; i++) {
                if (i != k) {
                    sub[j++] = g[i];
                }
            }
            RealMatrix qk = inverseOrNull(sub);
            if (qk == null) {
                continue;
            }
            out.add(new double[] {qk.getEntry(2, 2), qk.getEntry(0, 0) + qk.getEntry(1, 1)});
        }
        return out.toArray(new double[0][]);
    }

    /** {HPL, VPL} at sigma for a sample's geometry. */
    static double[] protectionLevels(double[][] geo, double sigma) {
        return protectionLevels(geo, sigma, P_HMI, P_FA);
    }

    static double[] protectionLevels(double[][] geo, double sigma, double pHmi, double pFa) {
        int n = (int) geo[0][0];
        double v0 = geo[0][1], h0 = geo[0][2];
        double kfa = Math.sqrt(2.0) * Erf.erfcInv(pFa / n);
        double pff = Math.max(1.0 - n * P_SAT, 0.0);
        List<double[]> mv = new ArrayList<>(), mh = new ArrayList<>();
        mv.add(new double[] {pff, 0.0, sigma * Math.sqrt(v0)});
        mh.add(new double[] {pff, 0.0, sigma * Math.sqrt(h0)});
        for (int k = 1; k < geo.length; k++) {
            double vk = geo[k][0], hk = geo[k][1];
            mv.add(new double[] {P_SAT, kfa * sigma * Math.sqrt(Math.max(vk - v0, 0.0)), sigma * Math.sqrt(vk)});
            mh.add(new double[] {P_SAT, kfa * sigma * Math.sqrt(Math.max(hk - h0, 0.0)), sigma * Math.sqrt(hk)});
        }
        return new double[] {pl(mh, pHmi / 2.0), pl(mv, pHmi / 2.0)};
    }

    /**
     * Self-check of this protection-level assembly against the committed RTKLIB + SciPy oracle
     * fixture of the "Lunar ARAIM protection-level kernel" row (seven cases, MCMF geometry):
     * returns the largest |HPL| and |VPL| difference in metres.
     */
    static double plSelfCheck(File fixture) throws Exception {
        double worst = 0.0;
        double[] user = null;
        List<Vector3D> sats = new ArrayList<>();
        double sigma = 0, pv = 0, ph = 0, pfa = 0;
        for (String line : Files.readAllLines(fixture.toPath())) {
            String[] t = line.trim().split("\\s+");
            if (t[0].equals("CASE")) {
                sats.clear();
                sigma = Double.parseDouble(t[3]);
                pv = Double.parseDouble(t[4]);
                ph = Double.parseDouble(t[5]);
                pfa = Double.parseDouble(t[6]);
            } else if (t[0].equals("USER")) {
                user = new double[] {Double.parseDouble(t[1]), Double.parseDouble(t[2]), Double.parseDouble(t[3])};
            } else if (t[0].equals("SAT")) {
                sats.add(new Vector3D(Double.parseDouble(t[1]), Double.parseDouble(t[2]), Double.parseDouble(t[3])));
            } else if (t[0].equals("ORACLE")) {
                Vector3D up = new Vector3D(user[0], user[1], user[2]).normalize();
                Vector3D east = Vector3D.crossProduct(Vector3D.PLUS_K, up);
                east = east.getNorm() < 1e-9 ? Vector3D.PLUS_I : east.normalize();
                Vector3D north = Vector3D.crossProduct(up, east);
                List<Vector3D> los = new ArrayList<>();
                for (Vector3D sp : sats) {
                    Vector3D e = sp.subtract(new Vector3D(user[0], user[1], user[2])).normalize();
                    los.add(new Vector3D(e.dotProduct(east), e.dotProduct(north), e.dotProduct(up)));
                }
                if (pv != ph) {
                    throw new IllegalStateException("self-check expects equal vertical and horizontal budgets");
                }
                double[] pl = protectionLevels(geometry(los), sigma, ph, pfa);
                worst = Math.max(worst, Math.abs(pl[0] - Double.parseDouble(t[1])));
                worst = Math.max(worst, Math.abs(pl[1] - Double.parseDouble(t[2])));
            }
        }
        return worst;
    }

    /** The sigma at which this sample's HPL equals the alert limit (Brent on sigma). */
    static double sigmaStar(double[][] geo) {
        return SIGMA_SOLVER.solve(10000, s -> protectionLevels(geo, s)[0] - ALERT_LIMIT_M, 1e-6, 1e5);
    }

    static String fmt(double v) {
        return String.format("%.12e", v);
    }

    static String run(String label, String cfg, double[] c, List<Propagator> props, AbsoluteDate epoch) {
        double mask = Math.toRadians(MASK_DEG);
        List<double[]> pts = grid(c);
        List<Double> ts = times(c[6]);
        List<TopocentricFrame> topos = new ArrayList<>();
        List<DOPComputer> dops = new ArrayList<>();
        for (double[] p : pts) {
            GeodeticPoint gp = new GeodeticPoint(Math.toRadians(p[0]), Math.toRadians(p[1]), 0.0);
            topos.add(new TopocentricFrame(moonShape, gp, "user"));
            dops.add(DOPComputer.create(moonShape, gp).withMinElevation(mask));
        }
        long nSamples = 0, nAvail = 0, nPdop = 0, nPl = 0, nPlAvail = 0;
        int minSats = Integer.MAX_VALUE, maxSats = 0;
        double pdopMin = Double.POSITIVE_INFINITY, pdopMax = 0.0, pdopSum = 0.0;
        double hplMin = Double.POSITIVE_INFINITY, hplMax = 0.0, vplMin = Double.POSITIVE_INFINITY, vplMax = 0.0;
        List<Double> hpls = new ArrayList<>(), sigmas = new ArrayList<>();
        for (double t : ts) {
            AbsoluteDate date = epoch.shiftedBy(t);
            for (int u = 0; u < pts.size(); u++) {
                nSamples++;
                TopocentricFrame topo = topos.get(u);
                DOP dop = dops.get(u).compute(date, props);
                List<Vector3D> los = new ArrayList<>();
                for (Propagator pr : props) {
                    Vector3D pt = pr.getPosition(date, topo);
                    if (topo.getElevation(pt, topo, date) >= mask) {
                        los.add(pt.normalize());
                    }
                }
                int nv = los.size();
                if (nv != dop.getGnssNb()) {
                    throw new IllegalStateException(label + " " + cfg + ": DOPComputer counts "
                        + dop.getGnssNb() + " visible, TopocentricFrame " + nv);
                }
                minSats = Math.min(minSats, nv);
                maxSats = Math.max(maxSats, nv);
                if (nv >= 4 && Double.isFinite(dop.getPdop())) {
                    double pdop = dop.getPdop();
                    nPdop++;
                    pdopMin = Math.min(pdopMin, pdop);
                    pdopMax = Math.max(pdopMax, pdop);
                    pdopSum += pdop;
                    if (pdop < PDOP_THRESHOLD) {
                        nAvail++;
                    }
                }
                double[][] geo = geometry(los);
                double[] pl = geo == null ? null : protectionLevels(geo, SIGMA_URE_M);
                if (pl != null) {
                    nPl++;
                    hplMin = Math.min(hplMin, pl[0]);
                    hplMax = Math.max(hplMax, pl[0]);
                    vplMin = Math.min(vplMin, pl[1]);
                    vplMax = Math.max(vplMax, pl[1]);
                    hpls.add(pl[0]);
                    sigmas.add(sigmaStar(geo));
                    if (pl[0] <= ALERT_LIMIT_M) {
                        nPlAvail++;
                    }
                }
            }
        }
        String hplP95 = "0", sReq = "NA", sReq95 = "NA";
        if (nPl > 0) {
            int n = hpls.size();
            int r = Math.max(1, Math.min(n, (int) Math.ceil(0.95 * n)));
            double[] h = hpls.stream().mapToDouble(Double::doubleValue).toArray();
            double[] s = sigmas.stream().mapToDouble(Double::doubleValue).toArray();
            Arrays.sort(h);
            Arrays.sort(s);
            hplP95 = fmt(h[r - 1]);
            sReq = fmt(s[0]);
            sReq95 = fmt(s[n - r]);
        }
        return String.join(",", label, cfg, Long.toString(nSamples), Integer.toString(minSats),
            Integer.toString(maxSats), fmt(100.0 * nAvail / nSamples),
            nPdop > 0 ? fmt(pdopMin) : "0", nPdop > 0 ? fmt(pdopSum / nPdop) : "0",
            nPdop > 0 ? fmt(pdopMax) : "0", Long.toString(nPl),
            nPl > 0 ? fmt(hplMin) : "0", fmt(hplMax), nPl > 0 ? fmt(vplMin) : "0", fmt(vplMax),
            nPl > 0 ? fmt(100.0 * nPlAvail / nPl) : "0", hplP95, sReq, sReq95);
    }

    public static void main(String[] args) throws Exception {
        File fx = new File(args[0]);
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        gcrf = FramesFactory.getGCRF();
        moon = CelestialBodyFactory.getMoon();
        moonBody = moon.getBodyOrientedFrame();
        moonIcrf = new Frame(gcrf, new MoonIcrf(), "MOON_ICRF", true);
        moonShape = new OneAxisEllipsoid(R_MOON, 0.0, moonBody);

        System.out.println("# Orekit 12.2 + Hipparchus 3.1 reference for tests/lunar_service_requirement_orekit_oracle.rs");
        System.out.println("# generated by xval/orekit-lunar-service/LunarServiceRequirementOracle.java; horizon 12 h, mask 5 deg, PDOP threshold 6, AL 50 m, p_hmi 1e-4, sigma_URE 30 m");
        File plFixture = new File(fx.getParentFile(), "lunar_protection_level/lunar_protection_level_reference.txt");
        double plGap = plSelfCheck(plFixture);
        System.out.printf("# self-check against the RTKLIB + SciPy protection-level fixture (7 cases): worst |dPL| %.3e m%n", plGap);
        if (plGap > 1e-6) {
            throw new IllegalStateException("protection-level assembly disagrees with the RTKLIB + SciPy fixture");
        }
        System.out.println("run,config,n_samples,min_sats,max_sats,coverage_pct,pdop_min,pdop_mean,pdop_max,n_pl_samples,hpl_min_m,hpl_max_m,vpl_min_m,vpl_max_m,pl_availability_pct,hpl_p95_m,sigma_required_m,sigma_required_p95_m");
        AbsoluteDate lncssEpoch = new AbsoluteDate(2025, 11, 9, 0, 0, 0.0, TimeScalesFactory.getUTC());
        String[][] geoms = {
            {"lncss_a", "lncss_case_a_navi613.csv"},
            {"lncss_b", "lncss_case_b_navi613.csv"},
            {"lncss_c", "lncss_case_c_navi613.csv"},
            {"lans", "lans_demo_ntrs20250009447.csv"},
            {"orbiters", "horizons_lunar_orbiters_2023001_12h.csv"},
        };
        for (String[] gm : geoms) {
            File f = new File(fx, gm[1]);
            for (Object[] cf : CONFIGS) {
                double[] c = (double[]) cf[1];
                List<Double> ts = times(c[6]);
                AbsoluteDate epoch;
                List<Propagator> props;
                if (gm[0].startsWith("lncss")) {
                    epoch = lncssEpoch;
                    props = lncss(f, epoch, ts);
                } else {
                    // The file's TDB epoch, as a TDB calendar date (whole days past 2000-01-01).
                    double jd = Double.parseDouble(meta(f, "epoch_jd_tdb"));
                    int days = (int) Math.floor(jd - 2451544.5);
                    double secs = (jd - 2451544.5 - days) * 86400.0;
                    epoch = new AbsoluteDate(new DateComponents(DateComponents.J2000_EPOCH, days),
                        new TimeComponents(secs), TimeScalesFactory.getTDB());
                    props = gm[0].equals("lans") ? lans(f, epoch) : orbiters(f, epoch, ts);
                }
                System.out.println(run(gm[0], (String) cf[0], c, props, epoch));
                System.out.flush();
            }
        }
    }
}
