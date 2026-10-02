// SPDX-License-Identifier: AGPL-3.0-only
// Oracle driver for tests/leo_polar_coverage_orekit_oracle.rs (verification row M131).
//
// Runs Orekit 12.2 (Apache-2.0) as a separate program on the committed inputs:
//   inputs_<c>.json  sweep grid (latitudes, longitudes, epochs) and each system's role, mask
//                    and clock model;
//   states_<c>.csv   Earth-fixed satellite positions and velocities at every epoch.
// For every sample (latitude, longitude, epoch) it builds the site on a WGS 84 OneAxisEllipsoid
// in ITRF, a TopocentricFrame there, and one Orekit Ephemeris per satellite from its tabulated
// Earth-fixed states (taken as ITRF); a satellite is in view when Orekit's elevation is at or
// above its system's mask. It prints, per sample: the in-view count of each system, the
// smallest |elevation - mask| over all satellites, the topocentric (east, north, zenith)
// line-of-sight unit vector of every satellite in view, and for each group (gnss, leo, all)
// Orekit's DOPComputer result on the group's visible satellites (minimum elevation set to the
// bottom of the sky because visibility per system mask was already applied).
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
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.analytical.Ephemeris;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.AbsolutePVCoordinates;
import org.orekit.utils.Constants;
import org.orekit.utils.IERSConventions;

public class LeoPolarOrekitDriver {

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
                .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        String inputs = new String(Files.readAllBytes(Paths.get(dir, "inputs_" + cfg + ".json")));
        double[] lats = nums(inputs, "lats_deg");
        double[] lons = nums(inputs, "lons_deg");
        double[] times = nums(inputs, "times_s");
        // Systems: role and mask, in order.
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

        Frame itrf = FramesFactory.getITRF(IERSConventions.IERS_2010, true);
        OneAxisEllipsoid earth = new OneAxisEllipsoid(Constants.WGS84_EARTH_EQUATORIAL_RADIUS,
                Constants.WGS84_EARTH_FLATTENING, itrf);
        AbsoluteDate t0 = new AbsoluteDate(2026, 9, 28, 0, 0, 0.0, TimeScalesFactory.getUTC());

        // Tabulated states per satellite: key (system, satellite) in file order.
        List<int[]> keys = new ArrayList<>();
        List<List<SpacecraftState>> tab = new ArrayList<>();
        for (String line : Files.readAllLines(Paths.get(dir, "states_" + cfg + ".csv"))) {
            if (line.startsWith("#") || line.isEmpty()) {
                continue;
            }
            String[] f = line.split(",");
            int sys = Integer.parseInt(f[2]);
            int sat = Integer.parseInt(f[3]);
            int idx = -1;
            for (int k = 0; k < keys.size(); k++) {
                if (keys.get(k)[0] == sys && keys.get(k)[1] == sat) {
                    idx = k;
                    break;
                }
            }
            if (idx < 0) {
                keys.add(new int[] {sys, sat});
                tab.add(new ArrayList<>());
                idx = keys.size() - 1;
            }
            AbsoluteDate d = t0.shiftedBy(Double.parseDouble(f[1]));
            Vector3D p = new Vector3D(Double.parseDouble(f[4]), Double.parseDouble(f[5]),
                    Double.parseDouble(f[6]));
            Vector3D v = new Vector3D(Double.parseDouble(f[7]), Double.parseDouble(f[8]),
                    Double.parseDouble(f[9]));
            tab.get(idx).add(new SpacecraftState(new AbsolutePVCoordinates(itrf, d, p, v)));
        }
        List<Ephemeris> eph = new ArrayList<>();
        for (List<SpacecraftState> states : tab) {
            eph.add(new Ephemeris(states, 2));
        }

        PrintWriter out = new PrintWriter(Paths.get(dir, "orekit_" + cfg + ".txt").toFile());
        out.println("# Orekit 12.2 oracle output, configuration " + cfg + " (LeoPolarOrekitDriver.java)");
        out.println("# S lat_i lon_i epoch | in_view_by_system | min_margin_rad");
        out.println("# L system e n z            (line of sight of a satellite in view, topocentric)");
        out.println("# D group n gdop pdop hdop vdop tdop   (Orekit DOPComputer on the group; NaN if under 4)");
        out.println("# C max_position_reproduction_error_m");
        double worstRepro = 0.0;
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
                    List<Propagator>[] sel = new List[3];
                    for (int g = 0; g < 3; g++) {
                        sel[g] = new ArrayList<>();
                    }
                    StringBuilder los = new StringBuilder();
                    for (int k = 0; k < keys.size(); k++) {
                        int sys = keys.get(k)[0];
                        SpacecraftState st = eph.get(k).propagate(d);
                        Vector3D p = st.getPosition(itrf);
                        worstRepro = FastMath.max(worstRepro,
                                p.distance(tab.get(k).get(ei).getPosition()));
                        double el = topo.getElevation(p, itrf, d);
                        minMargin = FastMath.min(minMargin, FastMath.abs(el - masks.get(sys)));
                        if (el >= masks.get(sys)) {
                            inView[sys]++;
                            Vector3D u = st.getPosition(topo).normalize();
                            los.append(String.format(Locale.ROOT, "L %d %.17g %.17g %.17g%n",
                                    sys, u.getX(), u.getY(), u.getZ()));
                            String role = roles.get(sys);
                            if (role.equals("gnss")) {
                                sel[0].add(eph.get(k));
                            }
                            if (role.equals("leo")) {
                                sel[1].add(eph.get(k));
                            }
                            sel[2].add(eph.get(k));
                        }
                    }
                    StringBuilder iv = new StringBuilder();
                    for (int s = 0; s < nSys; s++) {
                        iv.append(s == 0 ? "" : " ").append(inView[s]);
                    }
                    out.printf(Locale.ROOT, "S %d %d %d | %s | %.17g%n", li, oi, ei, iv, minMargin);
                    out.print(los);
                    for (int g = 0; g < 3; g++) {
                        int n = sel[g].size();
                        if (n >= 4) {
                            DOP dop = dc.compute(d, sel[g]);
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
        out.printf(Locale.ROOT, "C %.6e%n", worstRepro);
        out.close();
        System.out.printf(Locale.ROOT, "config %s: done; worst tabulated-state reproduction %.3e m%n",
                cfg, worstRepro);
    }
}
