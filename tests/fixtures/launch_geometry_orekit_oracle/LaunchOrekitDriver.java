// SPDX-License-Identifier: AGPL-3.0-only
//
// LaunchOrekitDriver: Orekit 12.2 (Apache-2.0) reference values for the launch-window geometry.
//
// Reads "INCREQ lat_deg lon_deg i_deg az_asc_rad az_desc_rad" lines on stdin (the azimuths Kshana
// computed, dumped by the ignored test `dump_kshana_launch_azimuths`) and writes, to stdout:
//   INC     the inclination Orekit's KeplerianOrbit reads back from a burnout state at the site
//           (radius R_eq + 400 km, GCRF, spherical latitude) with horizontal velocity v_circ along
//           each azimuth;
//   MININC  the smallest Orekit inclination over an azimuth sweep (every 1 deg plus 90 and 270);
//   VCIRC   |v| of an Orekit circular KeplerianOrbit at a = R_eq + h;
//   DOGLEG  |v2 - v1| between two Orekit circular orbits at a shared node, inclinations i1 and i2;
//   ROT     the GCRF speed of an Earth-fixed point on a spherical Orekit body (ITRF, IERS 2010,
//           simple EOP) at latitude lat;
//   OPP     sign changes, found by an Orekit FunctionalDetector on a propagator, of
//           g = site . h_hat / |site| over one sidereal day, where the site is fixed in TIRF on a
//           sphere and the orbit plane is fixed in CIRF (TIRF to CIRF is the Earth rotation angle
//           alone, so polar motion and precession do not blur the tangent cases); plus the closest
//           approach min |g| (10 s sampling, golden-section refinement) and the time between the
//           first and last event.
// Constants are Kshana's: mu = 3.986004418e14 m^3/s^2, R_eq = 6378137 m.
//
// Mode "site-speed" (round 2, third step, pre-registered 2026-10-02): reads nothing and writes
//   ROT2    the GCRF speed of an Earth-fixed point on a spherical Orekit body (ITRF, IERS 2010,
//           simple EOP) at 2025-07-17T06:30:00 UTC, for latitudes {0, 28.5, 45.6, 62.9, -28.5, -60}
//           and longitudes {0, 90, 123.4, -75} deg;
//   EOP2    Orekit's interpolated x_p, y_p (arcsec) and LOD (s) at that epoch (diagnostic).
// Run it with OREKIT_DATA pointing at a directory whose only Earth-orientation file is the frozen
// 2026-09-30 IERS finals2000A.all (see gen_site_speed_true_pole.sh).
//
// Compile and run: see gen_launch_geometry_orekit_oracle.sh.

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.Transform;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.KeplerianOrbit;
import org.orekit.orbits.PositionAngleType;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.analytical.KeplerianPropagator;
import org.orekit.propagation.events.EventDetector;
import org.orekit.propagation.events.FunctionalDetector;
import org.orekit.propagation.events.handlers.ContinueOnEvent;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.Constants;
import org.orekit.utils.IERSConventions;
import org.orekit.utils.PVCoordinates;

public class LaunchOrekitDriver {
    static final double MU = 3.986004418e14;
    static final double RE = 6378137.0;
    static final double H_BURNOUT = 400.0e3;
    static final double SIDEREAL_DAY = 86164.0905;

    static Frame gcrf;
    static AbsoluteDate t0;

    static double inclinationFor(double lat, double lon, double az) {
        double r = RE + H_BURNOUT;
        double v = Math.sqrt(MU / r);
        Vector3D up = new Vector3D(Math.cos(lat) * Math.cos(lon), Math.cos(lat) * Math.sin(lon), Math.sin(lat));
        Vector3D east = new Vector3D(-Math.sin(lon), Math.cos(lon), 0.0);
        Vector3D north = new Vector3D(-Math.sin(lat) * Math.cos(lon), -Math.sin(lat) * Math.sin(lon), Math.cos(lat));
        Vector3D vel = new Vector3D(v * Math.cos(az), north, v * Math.sin(az), east);
        CartesianOrbit c = new CartesianOrbit(new PVCoordinates(up.scalarMultiply(r), vel), gcrf, t0, MU);
        return new KeplerianOrbit(c).getI();
    }

    static Vector3D circularVelocity(double a, double inc, double raan, double argLat) {
        KeplerianOrbit k = new KeplerianOrbit(a, 0.0, inc, 0.0, raan, argLat, PositionAngleType.TRUE, gcrf, t0, MU);
        return k.getPVCoordinates().getVelocity();
    }

    public static void main(String[] args) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
                .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        Locale.setDefault(Locale.ROOT);
        gcrf = FramesFactory.getGCRF();
        if (args.length > 0 && args[0].equals("site-speed")) {
            siteSpeed();
            return;
        }
        t0 = new AbsoluteDate(2026, 3, 1, 0, 0, 0.0, TimeScalesFactory.getUTC());

        System.out.println("# Launch geometry reference values, Orekit 12.2 (Apache-2.0); see LaunchOrekitDriver.java and NOTICE.md.");
        System.out.printf("# mu = %.10e m^3/s^2, R_eq = %.1f m, burnout radius R_eq + %.1f m, epoch 2026-03-01T00:00:00 UTC%n", MU, RE, H_BURNOUT);
        System.out.println("# INC lat_deg lon_deg i_deg | az_asc_rad az_desc_rad (Kshana's, as fed) | i_orekit_asc_rad i_orekit_desc_rad");
        System.out.println("# MININC lat_deg lon_deg | min_i_rad | az_at_min_deg");
        System.out.println("# VCIRC h_km | v_m_s");
        System.out.println("# DOGLEG lat_deg i_deg h_km | dv_m_s");
        System.out.println("# ROT lat_deg | speed_m_s");
        System.out.println("# OPP lat_deg i_deg | events | min_abs_g | first_to_last_event_s");

        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        List<double[]> sites = new ArrayList<>();
        String line;
        while ((line = in.readLine()) != null) {
            if (!line.startsWith("INCREQ ")) {
                continue;
            }
            String[] t = line.substring(7).trim().split("\\s+");
            double latD = Double.parseDouble(t[0]);
            double lonD = Double.parseDouble(t[1]);
            double iD = Double.parseDouble(t[2]);
            double asc = Double.parseDouble(t[3]);
            double desc = Double.parseDouble(t[4]);
            double lat = Math.toRadians(latD);
            double lon = Math.toRadians(lonD);
            System.out.printf("INC %s %s %s | %s %s | %.17e %.17e%n", t[0], t[1], t[2], t[3], t[4],
                    inclinationFor(lat, lon, asc), inclinationFor(lat, lon, desc));
            boolean seen = false;
            for (double[] s : sites) {
                seen |= s[0] == latD && s[1] == lonD;
            }
            if (!seen) {
                sites.add(new double[] {latD, lonD});
            }
        }
        for (double[] s : sites) {
            double lat = Math.toRadians(s[0]);
            double lon = Math.toRadians(s[1]);
            double best = Double.POSITIVE_INFINITY;
            double bestAz = Double.NaN;
            List<Double> azs = new ArrayList<>();
            for (int k = 0; k < 360; k++) {
                azs.add((double) k);
            }
            azs.add(90.0);
            azs.add(270.0);
            for (double azD : azs) {
                double i = inclinationFor(lat, lon, Math.toRadians(azD));
                if (i < best) {
                    best = i;
                    bestAz = azD;
                }
            }
            System.out.printf("MININC %s %s | %.17e | %.1f%n", fmt(s[0]), fmt(s[1]), best, bestAz);
        }

        for (double hKm : new double[] {200.0, 400.0, 800.0, 2000.0, 35786.0}) {
            Vector3D v = circularVelocity(RE + hKm * 1e3, Math.toRadians(51.6), 0.3, 1.1);
            System.out.printf("VCIRC %s | %.17e%n", fmt(hKm), v.getNorm());
        }

        double[][] dogleg = {{28.5, 0.0, 400.0}, {28.5, 10.0, 400.0}, {45.6, 28.5, 200.0}, {62.9, 51.6, 400.0},
            {51.6, 5.0, 800.0}};
        for (double[] d : dogleg) {
            double a = RE + d[2] * 1e3;
            Vector3D v1 = circularVelocity(a, Math.toRadians(d[0]), 0.0, 0.0);
            Vector3D v2 = circularVelocity(a, Math.toRadians(d[1]), 0.0, 0.0);
            System.out.printf("DOGLEG %s %s %s | %.17e%n", fmt(d[0]), fmt(d[1]), fmt(d[2]), v2.subtract(v1).getNorm());
        }

        Frame itrf = FramesFactory.getITRF(IERSConventions.IERS_2010, true);
        OneAxisEllipsoid sphere = new OneAxisEllipsoid(RE, 0.0, itrf);
        for (double latD : new double[] {0.0, 5.0, 28.5, 45.6, 51.6, 62.9, -28.5}) {
            Vector3D p = sphere.transform(new GeodeticPoint(Math.toRadians(latD), 0.0, 0.0));
            PVCoordinates pv = itrf.getTransformTo(gcrf, t0).transformPVCoordinates(new PVCoordinates(p, Vector3D.ZERO));
            System.out.printf("ROT %s | %.17e%n", fmt(latD), pv.getVelocity().getNorm());
        }

        Frame tirf = FramesFactory.getTIRF(IERSConventions.IERS_2010, true);
        Frame cirf = FramesFactory.getCIRF(IERSConventions.IERS_2010, true);
        double[] oppLats = {5.0, 28.5, 45.6, 51.6, 62.9, -28.5, 0.0};
        for (double latD : oppLats) {
            double l = Math.abs(latD);
            double[] incs = {l, l - 5.0, l + 5.0, 51.6, 90.0, 97.8, 180.0 - l, 175.0};
            for (double iD : incs) {
                if (iD < 0.0 || iD > 180.0) {
                    continue;
                }
                if (latD == 0.0 && (iD == 0.0 || iD == 180.0)) {
                    continue; // degenerate: an equatorial site lies in an equatorial plane all day
                }
                double inc = Math.toRadians(iD);
                Vector3D h = new Vector3D(0.0, -Math.sin(inc), Math.cos(inc));
                Vector3D site = new Vector3D(Math.cos(Math.toRadians(latD)), 0.0, Math.sin(Math.toRadians(latD)))
                        .scalarMultiply(RE);
                java.util.function.ToDoubleFunction<AbsoluteDate> g = d -> {
                    Transform tr = tirf.getTransformTo(cirf, d);
                    Vector3D s = tr.transformPosition(site);
                    return Vector3D.dotProduct(s, h) / s.getNorm();
                };
                KeplerianOrbit carrier = new KeplerianOrbit(RE + 500e3, 0.0, 0.5, 0.0, 0.0, 0.0,
                        PositionAngleType.TRUE, gcrf, t0, Constants.WGS84_EARTH_MU);
                KeplerianPropagator prop = new KeplerianPropagator(carrier);
                List<Double> events = new ArrayList<>();
                EventDetector det = new FunctionalDetector()
                        .withFunction((SpacecraftState st) -> g.applyAsDouble(st.getDate()))
                        .withMaxCheck(60.0)
                        .withThreshold(1e-6)
                        .withHandler((st, dd, inc2) -> {
                            events.add(st.getDate().durationFrom(t0));
                            return org.hipparchus.ode.events.Action.CONTINUE;
                        });
                prop.addEventDetector(det);
                prop.propagate(t0.shiftedBy(SIDEREAL_DAY));

                double minG = Double.POSITIVE_INFINITY;
                double tMin = 0.0;
                for (double t = 0.0; t <= SIDEREAL_DAY; t += 10.0) {
                    double v = Math.abs(g.applyAsDouble(t0.shiftedBy(t)));
                    if (v < minG) {
                        minG = v;
                        tMin = t;
                    }
                }
                double lo = Math.max(0.0, tMin - 10.0);
                double hi = Math.min(SIDEREAL_DAY, tMin + 10.0);
                double gr = (Math.sqrt(5.0) - 1.0) / 2.0;
                for (int k = 0; k < 80; k++) {
                    double m1 = hi - gr * (hi - lo);
                    double m2 = lo + gr * (hi - lo);
                    if (Math.abs(g.applyAsDouble(t0.shiftedBy(m1))) < Math.abs(g.applyAsDouble(t0.shiftedBy(m2)))) {
                        hi = m2;
                    } else {
                        lo = m1;
                    }
                }
                minG = Math.min(minG, Math.abs(g.applyAsDouble(t0.shiftedBy(0.5 * (lo + hi)))));
                double spread = events.size() >= 2 ? events.get(events.size() - 1) - events.get(0) : 0.0;
                System.out.printf("OPP %s %s | %d | %.6e | %.3f%n", fmt(latD), fmt(iD), events.size(), minG, spread);
            }
        }
    }

    static String fmt(double x) {
        return Double.toString(x);
    }

    static void siteSpeed() {
        AbsoluteDate t = new AbsoluteDate(2025, 7, 17, 6, 30, 0.0, TimeScalesFactory.getUTC());
        System.out.println("# True-pole site speed reference values, Orekit 12.2 (Apache-2.0); see LaunchOrekitDriver.java and NOTICE.md.");
        System.out.printf("# R_eq = %.1f m (sphere), ITRF IERS 2010 simple EOP, epoch 2025-07-17T06:30:00 UTC%n", RE);
        System.out.println("# ROT2 lat_deg lon_deg | speed_m_s");
        System.out.println("# EOP2 | x_p_arcsec y_p_arcsec | lod_s");
        Frame itrf = FramesFactory.getITRF(IERSConventions.IERS_2010, true);
        org.orekit.frames.EOPHistory eop = FramesFactory.getEOPHistory(IERSConventions.IERS_2010, true);
        org.orekit.frames.PoleCorrection pole = eop.getPoleCorrection(t);
        double asec = Math.toDegrees(1.0) * 3600.0;
        System.out.printf("EOP2 | %.9f %.9f | %.9e%n", pole.getXp() * asec, pole.getYp() * asec, eop.getLOD(t));
        OneAxisEllipsoid sphere = new OneAxisEllipsoid(RE, 0.0, itrf);
        for (double latD : new double[] {0.0, 28.5, 45.6, 62.9, -28.5, -60.0}) {
            for (double lonD : new double[] {0.0, 90.0, 123.4, -75.0}) {
                Vector3D p = sphere.transform(new GeodeticPoint(Math.toRadians(latD), Math.toRadians(lonD), 0.0));
                PVCoordinates pv = itrf.getTransformTo(gcrf, t).transformPVCoordinates(new PVCoordinates(p, Vector3D.ZERO));
                System.out.printf("ROT2 %s %s | %.17e%n", fmt(latD), fmt(lonD), pv.getVelocity().getNorm());
            }
        }
    }
}
