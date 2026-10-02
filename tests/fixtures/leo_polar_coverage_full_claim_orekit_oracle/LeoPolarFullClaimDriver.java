// SPDX-License-Identifier: AGPL-3.0-only
// Oracle driver for tests/leo_polar_coverage_full_claim_orekit_oracle.rs (row M131, full claim).
//
// Runs Orekit 13.1.8 (Apache-2.0) as a separate program on the committed inputs:
//   inputs_<c>.json    sweep grid (latitudes, longitudes, epochs as seconds after the sweep
//                      epoch), the sweep epoch (UTC calendar), each system's role and mask;
//   elements_<c>.csv   one SGP4 mean element set per satellite (epoch, Kozai mean motion in
//                      rad/min, eccentricity, inclination, TEME node, argument of perigee,
//                      mean anomaly, B*).
// Each element set becomes an Orekit TLE (double precision, mean-motion derivatives zero),
// propagated by TLEPropagator.selectExtrapolator (Orekit's own SGP4/SDP4 choice and WGS-72
// constants) and transformed TEME -> ITRF (IERS 2010 conventions). The data directory holds
// only the leap-second table, so no Earth orientation parameters are loaded (UT1 = UTC, zero
// pole offsets). For every sample (latitude, longitude, epoch) the site is a TopocentricFrame
// on a WGS 84 OneAxisEllipsoid; a satellite is in view when Orekit's elevation is at or above
// its system's mask. Output, per configuration:
//   P e k x y z                ITRF position (m) of satellite k at epoch e
//   S lat_i lon_i epoch | in_view_by_system | min_margin_rad
//   L system e n z             line of sight of a satellite in view (topocentric unit vector)
//   D group n gdop pdop hdop vdop tdop   DOPComputer on the group's visible satellites
//
// Build and run: see generate.sh.

import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.util.FastMath;
import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.gnss.DOP;
import org.orekit.gnss.DOPComputer;
import org.orekit.propagation.Propagator;
import org.orekit.propagation.analytical.tle.TLE;
import org.orekit.propagation.analytical.tle.TLEPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScale;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.Constants;
import org.orekit.utils.IERSConventions;

public class LeoPolarFullClaimDriver {

    static double[] nums(String json, String key) {
        int i = json.indexOf("\"" + key + "\"");
        int a = json.indexOf('[', i);
        int b = json.indexOf(']', a);
        String[] f = json.substring(a + 1, b).split(",");
        double[] out = new double[f.length];
        for (int k = 0; k < f.length; k++) {
            out[k] = Double.parseDouble(f[k].trim());
        }
        return out;
    }

    public static void main(String[] args) throws Exception {
        String dir = args[0];
        String cfg = args[1];
        DataContext.getDefault().getDataProvidersManager()
                .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT13_DATA_NO_EOP"))));
        TimeScale utc = TimeScalesFactory.getUTC();
        String inputs = new String(Files.readAllBytes(Paths.get(dir, "inputs_" + cfg + ".json")));
        double[] lats = nums(inputs, "lats_deg");
        double[] lons = nums(inputs, "lons_deg");
        double[] times = nums(inputs, "times_s");
        double[] ep = nums(inputs, "epoch_utc");
        AbsoluteDate t0 = new AbsoluteDate((int) ep[0], (int) ep[1], (int) ep[2], (int) ep[3],
                (int) ep[4], ep[5], utc);
        List<String> roles = new ArrayList<>();
        List<Double> masks = new ArrayList<>();
        int at = inputs.indexOf("\"systems\"");
        while (true) {
            int r = inputs.indexOf("\"role\"", at);
            if (r < 0) {
                break;
            }
            int q1 = inputs.indexOf('"', inputs.indexOf(':', r) + 1);
            int q2 = inputs.indexOf('"', q1 + 1);
            roles.add(inputs.substring(q1 + 1, q2));
            int m = inputs.indexOf("\"mask_rad\"", at);
            int c = inputs.indexOf(':', m);
            int e = c + 1;
            while (",}\n".indexOf(inputs.charAt(e)) < 0) {
                e++;
            }
            masks.add(Double.parseDouble(inputs.substring(c + 1, e).trim()));
            at = Math.max(q2, e);
        }
        int nSys = roles.size();

        // One TLE propagator per element set, in file order.
        List<Integer> sysOf = new ArrayList<>();
        List<Propagator> props = new ArrayList<>();
        int number = 0;
        for (String line : Files.readAllLines(Paths.get(dir, "elements_" + cfg + ".csv"))) {
            if (line.startsWith("#") || line.isEmpty()) {
                continue;
            }
            String[] f = line.split(",");
            number++;
            double noKozaiRadMin = Double.parseDouble(f[4]);
            TLE tle = new TLE(number, 'U', 2000, 1, "A", 0, 1, t0,
                    noKozaiRadMin / 60.0, 0.0, 0.0,
                    Double.parseDouble(f[5]), Double.parseDouble(f[6]),
                    Double.parseDouble(f[8]), Double.parseDouble(f[7]),
                    Double.parseDouble(f[9]), 0, Double.parseDouble(f[10]), utc);
            props.add(TLEPropagator.selectExtrapolator(tle));
            sysOf.add(Integer.parseInt(f[0]));
        }

        Frame itrf = FramesFactory.getITRF(IERSConventions.IERS_2010, true);
        OneAxisEllipsoid earth = new OneAxisEllipsoid(Constants.WGS84_EARTH_EQUATORIAL_RADIUS,
                Constants.WGS84_EARTH_FLATTENING, itrf);
        PrintWriter out = new PrintWriter(Paths.get(dir, "orekit_" + cfg + ".txt").toFile());
        out.println("# Orekit 13.1.8 oracle output, configuration " + cfg + " (LeoPolarFullClaimDriver.java)");
        out.printf(Locale.ROOT, "# UT1-UTC at the sweep epoch: %.3e s%n",
                FramesFactory.getEOPHistory(IERSConventions.IERS_2010, true).getUT1MinusUTC(t0));
        // Earth-fixed positions at every epoch.
        Vector3D[][] pos = new Vector3D[times.length][props.size()];
        for (int ei = 0; ei < times.length; ei++) {
            AbsoluteDate d = t0.shiftedBy(times[ei]);
            for (int k = 0; k < props.size(); k++) {
                pos[ei][k] = props.get(k).propagate(d).getPosition(itrf);
                out.printf(Locale.ROOT, "P %d %d %.17g %.17g %.17g%n", ei, k,
                        pos[ei][k].getX(), pos[ei][k].getY(), pos[ei][k].getZ());
            }
        }
        String[] groups = {"gnss", "leo", "all"};
        for (int li = 0; li < lats.length; li++) {
            for (int oi = 0; oi < lons.length; oi++) {
                GeodeticPoint gp = new GeodeticPoint(FastMath.toRadians(lats[li]),
                        FastMath.toRadians(lons[oi]), 0.0);
                TopocentricFrame topo = new TopocentricFrame(earth, gp, "site");
                DOPComputer dc = DOPComputer.create(earth, gp).withMinElevation(-0.5 * FastMath.PI + 1e-9);
                for (int ei = 0; ei < times.length; ei++) {
                    AbsoluteDate d = t0.shiftedBy(times[ei]);
                    int[] inView = new int[nSys];
                    double minMargin = Double.POSITIVE_INFINITY;
                    List<List<Propagator>> sel = new ArrayList<>();
                    for (int g = 0; g < 3; g++) {
                        sel.add(new ArrayList<>());
                    }
                    StringBuilder los = new StringBuilder();
                    for (int k = 0; k < props.size(); k++) {
                        int sys = sysOf.get(k);
                        Vector3D p = pos[ei][k];
                        double el = topo.getElevation(p, itrf, d);
                        minMargin = FastMath.min(minMargin, FastMath.abs(el - masks.get(sys)));
                        if (el >= masks.get(sys)) {
                            inView[sys]++;
                            Vector3D u = itrf.getStaticTransformTo(topo, d).transformPosition(p).normalize();
                            los.append(String.format(Locale.ROOT, "L %d %.17g %.17g %.17g%n",
                                    sys, u.getX(), u.getY(), u.getZ()));
                            String role = roles.get(sys);
                            if (role.equals("gnss")) {
                                sel.get(0).add(props.get(k));
                            }
                            if (role.equals("leo")) {
                                sel.get(1).add(props.get(k));
                            }
                            sel.get(2).add(props.get(k));
                        }
                    }
                    StringBuilder iv = new StringBuilder();
                    for (int s = 0; s < nSys; s++) {
                        iv.append(s == 0 ? "" : " ").append(inView[s]);
                    }
                    out.printf(Locale.ROOT, "S %d %d %d | %s | %.17g%n", li, oi, ei, iv, minMargin);
                    out.print(los);
                    for (int g = 0; g < 3; g++) {
                        int n = sel.get(g).size();
                        if (n >= 4) {
                            DOP dop = dc.compute(d, sel.get(g));
                            out.printf(Locale.ROOT, "D %s %d %.17g %.17g %.17g %.17g %.17g%n", groups[g],
                                    dop.getGnssNb(), dop.getGdop(), dop.getPdop(), dop.getHdop(),
                                    dop.getVdop(), dop.getTdop());
                        } else {
                            out.printf(Locale.ROOT, "D %s %d NaN NaN NaN NaN NaN%n", groups[g], n);
                        }
                    }
                }
            }
        }
        out.close();
        System.out.printf(Locale.ROOT, "config %s: done, %d satellites%n", cfg, props.size());
    }
}
