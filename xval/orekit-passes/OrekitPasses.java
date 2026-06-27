// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle driver for kshana ground-station pass prediction.
//
// ORACLE: Orekit 12.2 (CS GROUP, BSD-3-Clause-like Apache-2.0) + Hipparchus 3.1.
//   org.orekit.propagation.events.ElevationDetector + EventsLogger, run over an
//   org.orekit.propagation.analytical.Ephemeris, with the station built as a
//   TopocentricFrame on a WGS-84 OneAxisEllipsoid.
//
// WHAT THIS ISOLATES (and why it is a genuine, independent geometry check):
//   The quantity kshana's passes.rs computes is the PASS GEOMETRY: given a
//   satellite trajectory and a ground station on the WGS-84 ellipsoid, find the
//   rise/set crossings of an elevation mask (AOS/LOS), the culmination (TCA / max
//   elevation), the per-pass duration, the pass count, and the total access time.
//   The propagator (circular two-body Kepler) and the TEME->ECEF rotation
//   (IAU-1982 GMST only) are NOT the subject of this validation and are matched
//   exactly on the Orekit side so the comparison isolates the geometry.
//
//   To do that the driver reproduces ONLY kshana's orbit + GMST rotation to obtain
//   the satellite's ECEF (ITRF) position samples, then hands those samples to
//   Orekit as an ITRF-frame Ephemeris. The station is an Orekit WGS-84 ellipsoid
//   TopocentricFrame. From there everything is Orekit's OWN, independent code:
//     * the geodetic station ECEF and the local ENU / ellipsoid-normal elevation,
//     * the ElevationDetector zero-crossing root-finding (AOS/LOS), and
//     * the EventsLogger pass bookkeeping.
//   Because both the satellite samples and the station live in the SAME Earth-fixed
//   ITRF frame, Orekit's elevation depends only on the supplied geometry, not on
//   any Earth-rotation/EOP model, so the only thing being compared is the
//   pass-geometry algorithm: Orekit's vs kshana's.
//
//   Max elevation is taken as the Orekit-evaluated topocentric elevation
//   (TopocentricFrame.getElevation, Orekit's own ellipsoid geometry) refined to
//   0.01 s around the culmination, independent of kshana's sample-step TCA.
//
// INPUT  (stdin, one JSON object): see generate_..._reference.py.
// OUTPUT (stdout): one "PASS ..." line per detected pass plus a "SUMMARY ..." line.
//
// Compile/run:
//   source /tmp/kshana-oracles/orekit/cp.sh
//   javac -cp "$OREKIT_CP" OrekitPasses.java
//   java  -cp ".:$OREKIT_CP" OrekitPasses < request.json

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.ode.events.Action;
import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.attitudes.AttitudeProvider;
import org.orekit.attitudes.FrameAlignedProvider;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.SpacecraftStateInterpolator;
import org.orekit.propagation.analytical.Ephemeris;
import org.orekit.propagation.events.ElevationDetector;
import org.orekit.propagation.events.EventsLogger;
import org.orekit.propagation.events.handlers.EventHandler;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeInterpolator;
import org.orekit.time.TimeScalesFactory;
import org.orekit.time.TimeScale;
import org.orekit.utils.AbsolutePVCoordinates;
import org.orekit.utils.AbsolutePVCoordinatesHermiteInterpolator;
import org.orekit.utils.CartesianDerivativesFilter;

public class OrekitPasses {

    // ---- kshana constants (must match src/orbit.rs and src/frames.rs) ----
    static final double MU_EARTH = 3.986004418e14;          // m^3/s^2 (orbit.rs)
    static final double R_EARTH_EQUATORIAL_M = 6378137.0;   // m (orbit.rs / WGS84_A)
    static final double WGS84_A = 6378137.0;                // m (frames.rs)
    static final double WGS84_F = 1.0 / 298.257223563;      // frames.rs
    static final double TWO_PI = 2.0 * Math.PI;

    // kshana::timescales::julian_date (Meeus eq 7.1, Gregorian).
    static double julianDate(int year, int month, int day, int hour, int minute, double second) {
        int y = year, m = month;
        if (month <= 2) { y = year - 1; m = month + 12; }
        double a = Math.floor(y / 100.0);
        double b = 2.0 - a + Math.floor(a / 4.0);
        double dayFraction = day + (hour * 3600.0 + minute * 60.0 + second) / 86400.0;
        return Math.floor(365.25 * (y + 4716.0)) + Math.floor(30.6001 * (m + 1.0))
                + dayFraction + b - 1524.5;
    }

    // kshana::sgp4::gstime (Vallado 2004 eq 3-45), radians.
    static double gstime(double jdut1) {
        double tut1 = (jdut1 - 2451545.0) / 36525.0;
        double temp = -6.2e-6 * tut1 * tut1 * tut1
                + 0.093104 * tut1 * tut1
                + (876600.0 * 3600.0 + 8640184.812866) * tut1
                + 67310.54841;
        temp = (temp * (Math.PI / 180.0) / 240.0) % TWO_PI;
        if (temp < 0.0) temp += TWO_PI;
        return temp;
    }

    // kshana circular Orbit::position_eci (orbit.rs is_circular fast path), TEME (m).
    static double[] positionTeme(double radiusM, double incRad, double raanRad,
                                 double u0Rad, double t) {
        double n = Math.sqrt(MU_EARTH / (radiusM * radiusM * radiusM));
        double si = Math.sin(incRad), ci = Math.cos(incRad);
        double u = u0Rad + n * t;
        double su = Math.sin(u), cu = Math.cos(u);
        double so = Math.sin(raanRad), co = Math.cos(raanRad);
        double r = radiusM;
        double x = r * cu, y = r * su * ci, z = r * su * si;
        return new double[] { x * co - y * so, x * so + y * co, z };
    }

    // kshana::frames::teme_to_ecef: R3(theta) with theta = gstime(jd_ut1).
    static double[] temeToEcef(double[] rTeme, double jdUt1) {
        double theta = gstime(jdUt1);
        double s = Math.sin(theta), c = Math.cos(theta);
        return new double[] {
            c * rTeme[0] + s * rTeme[1],
            -s * rTeme[0] + c * rTeme[1],
            rTeme[2]
        };
    }

    // ---- minimal JSON value reader (numbers only, by key) ----
    static double num(String json, String key, double dflt) {
        int i = json.indexOf("\"" + key + "\"");
        if (i < 0) return dflt;
        int colon = json.indexOf(':', i);
        int j = colon + 1;
        while (j < json.length() && (json.charAt(j) == ' ' || json.charAt(j) == '\t')) j++;
        int k = j;
        while (k < json.length() && "+-0123456789.eE".indexOf(json.charAt(k)) >= 0) k++;
        return Double.parseDouble(json.substring(j, k));
    }

    public static void main(String[] args) throws Exception {
        // Register Orekit data (UTC/EOP/ephemerides) — needed only to build a UTC
        // TimeScale for AbsoluteDate labelling; the geometry is frame-independent.
        File data = new File(System.getenv("OREKIT_DATA"));
        DataContext.getDefault().getDataProvidersManager()
                .addProvider(new DirectoryCrawler(data));

        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in))) {
            String line;
            while ((line = br.readLine()) != null) sb.append(line).append('\n');
        }
        String json = sb.toString();

        double altitudeKm   = num(json, "altitude_km", 550.0);
        double inclDeg       = num(json, "inclination_deg", 97.6);
        double raanDeg       = num(json, "raan_deg", 0.0);
        double argLatDeg     = num(json, "arg_lat_deg", 0.0);
        double stationLatDeg = num(json, "station_lat_deg", 52.2);
        double stationLonDeg = num(json, "station_lon_deg", 0.0);
        double stationAltM   = num(json, "station_alt_m", 0.0);
        double maskDeg       = num(json, "mask_deg", 10.0);
        double durationHours = num(json, "duration_hours", 24.0);
        int yr = (int) num(json, "year", 2024);
        int mo = (int) num(json, "month", 1);
        int dy = (int) num(json, "day", 1);
        int hr = (int) num(json, "hour", 0);
        int mi = (int) num(json, "minute", 0);
        double se = num(json, "second", 0.0);

        double radiusM = R_EARTH_EQUATORIAL_M + altitudeKm * 1000.0;
        double incRad  = Math.toRadians(inclDeg);
        double raanRad = Math.toRadians(raanDeg);
        double u0Rad   = Math.toRadians(argLatDeg);
        double maskRad = Math.toRadians(maskDeg);
        double durationS = durationHours * 3600.0;

        double jd0 = julianDate(yr, mo, dy, hr, mi, se);

        // Earth-fixed ITRF frame and WGS-84 ellipsoid (Orekit's own geometry).
        Frame itrf = FramesFactory.getITRF(org.orekit.utils.IERSConventions.IERS_2010, true);
        OneAxisEllipsoid earth = new OneAxisEllipsoid(WGS84_A, WGS84_F, itrf);
        GeodeticPoint stationGp = new GeodeticPoint(
                Math.toRadians(stationLatDeg), Math.toRadians(stationLonDeg), stationAltM);
        TopocentricFrame station = new TopocentricFrame(earth, stationGp, "GS");

        TimeScale utc = TimeScalesFactory.getUTC();
        AbsoluteDate t0 = new AbsoluteDate(yr, mo, dy, hr, mi, se, utc);

        // Build the satellite trajectory in ITRF by applying kshana's exact orbit +
        // GMST rotation, sampled finely. Orekit interpolates between samples and runs
        // its own elevation root-finder over this ephemeris.
        double sampleStep = 1.0; // s — dense enough for Hermite interpolation
        int nSamples = (int) Math.round(durationS / sampleStep) + 1;
        List<SpacecraftState> states = new ArrayList<>(nSamples);
        for (int i = 0; i < nSamples; i++) {
            double t = i * sampleStep;
            double[] rTeme = positionTeme(radiusM, incRad, raanRad, u0Rad, t);
            double[] rEcef = temeToEcef(rTeme, jd0 + t / 86400.0);
            // Velocity by central finite difference of the same ECEF samples (for the
            // ephemeris interpolator only; elevation uses position).
            double h = 1.0;
            double[] rp = temeToEcef(positionTeme(radiusM, incRad, raanRad, u0Rad, t + h),
                                     jd0 + (t + h) / 86400.0);
            double[] rm = temeToEcef(positionTeme(radiusM, incRad, raanRad, u0Rad, t - h),
                                     jd0 + (t - h) / 86400.0);
            Vector3D pos = new Vector3D(rEcef[0], rEcef[1], rEcef[2]);
            Vector3D vel = new Vector3D((rp[0] - rm[0]) / (2 * h),
                                        (rp[1] - rm[1]) / (2 * h),
                                        (rp[2] - rm[2]) / (2 * h));
            AbsoluteDate d = t0.shiftedBy(t);
            // AbsolutePVCoordinates accepts the Earth-fixed ITRF frame (an Orbit
            // would reject the non-pseudo-inertial frame); this carries the raw
            // ECEF state Orekit's elevation geometry consumes directly.
            AbsolutePVCoordinates apv = new AbsolutePVCoordinates(itrf, d, pos, vel);
            states.add(new SpacecraftState(apv));
        }

        // Interpolate the ITRF AbsolutePV samples directly (Hermite on position +
        // velocity); pass a null orbit interpolator so the non-inertial ITRF frame
        // is accepted (an Orbit interpolator would require a pseudo-inertial frame).
        AttitudeProvider attProv = new FrameAlignedProvider(itrf);
        TimeInterpolator<AbsolutePVCoordinates> pvInterp =
                new AbsolutePVCoordinatesHermiteInterpolator(
                        6, itrf, CartesianDerivativesFilter.USE_PV);
        SpacecraftStateInterpolator ssInterp = new SpacecraftStateInterpolator(
                6, 60.0, itrf, null, pvInterp, null, null, null);
        Ephemeris ephem = new Ephemeris(states, ssInterp);
        ephem.setAttitudeProvider(attProv);

        // ElevationDetector with a fine max-check and tight convergence so AOS/LOS
        // are root-found to well under a second. Continue at each event so we log
        // them all over the window.
        EventsLogger logger = new EventsLogger();
        ElevationDetector det = new ElevationDetector(station)
                .withConstantElevation(maskRad)
                .withMaxCheck(30.0)
                .withThreshold(1.0e-3)
                .withHandler((s, d, increasing) -> Action.CONTINUE);
        ephem.addEventDetector(logger.monitorDetector(det));

        AbsoluteDate end = t0.shiftedBy(durationS);

        // Detect whether we start already in a pass (clamped AOS = 0).
        double el0 = station.getElevation(
                ephem.propagate(t0).getPVCoordinates(itrf).getPosition(), itrf, t0);

        ephem.propagate(t0, end);
        List<EventsLogger.LoggedEvent> events = logger.getLoggedEvents();

        // Pair the logged increasing (AOS) / decreasing (LOS) events into passes,
        // clamping a pass in progress at the window edges (matching passes.rs).
        List<double[]> passes = new ArrayList<>(); // {aos_s, los_s}
        Double openAos = null;
        if (el0 >= maskRad) openAos = 0.0; // already up at window start
        for (EventsLogger.LoggedEvent ev : events) {
            double ts = ev.getState().getDate().durationFrom(t0);
            if (ev.isIncreasing()) {
                if (openAos == null) openAos = ts;
            } else {
                double aos = (openAos == null) ? 0.0 : openAos;
                passes.add(new double[] { aos, ts });
                openAos = null;
            }
        }
        if (openAos != null) {
            passes.add(new double[] { openAos, durationS }); // still up at window end
        }

        // For each pass, find the max elevation by Orekit's own topocentric geometry,
        // refined finely between AOS and LOS (independent of kshana's TCA step).
        double totalAccess = 0.0;
        StringBuilder out = new StringBuilder();
        int idx = 0;
        for (double[] p : passes) {
            double aos = p[0], los = p[1];
            double dur = los - aos;
            // Coarse scan then golden-ish refine for the elevation maximum.
            double bestT = aos, bestEl = -Math.PI;
            int coarse = Math.max(50, (int) (dur / 1.0));
            for (int i = 0; i <= coarse; i++) {
                double t = aos + dur * i / coarse;
                double el = elevationAt(station, ephem, itrf, t0, t);
                if (el > bestEl) { bestEl = el; bestT = t; }
            }
            // Refine around bestT to 0.01 s.
            double lo = Math.max(aos, bestT - dur / coarse);
            double hi = Math.min(los, bestT + dur / coarse);
            for (int iter = 0; iter < 60 && (hi - lo) > 0.01; iter++) {
                double m1 = lo + (hi - lo) / 3.0;
                double m2 = hi - (hi - lo) / 3.0;
                double e1 = elevationAt(station, ephem, itrf, t0, m1);
                double e2 = elevationAt(station, ephem, itrf, t0, m2);
                if (e1 < e2) lo = m1; else hi = m2;
            }
            double tca = (lo + hi) / 2.0;
            double maxEl = elevationAt(station, ephem, itrf, t0, tca);
            totalAccess += dur;
            out.append(String.format(
                "PASS %d | aos_s=%.6f | tca_s=%.6f | los_s=%.6f | max_el_deg=%.9f | duration_s=%.6f%n",
                idx, aos, tca, los, Math.toDegrees(maxEl), dur));
            idx++;
        }

        System.out.print(out);
        System.out.printf("SUMMARY | pass_count=%d | total_access_s=%.6f%n",
                passes.size(), totalAccess);
    }

    static double elevationAt(TopocentricFrame station, Ephemeris ephem, Frame itrf,
                              AbsoluteDate t0, double t) {
        AbsoluteDate d = t0.shiftedBy(t);
        Vector3D pos = ephem.propagate(d).getPVCoordinates(itrf).getPosition();
        return station.getElevation(pos, itrf, d);
    }
}
