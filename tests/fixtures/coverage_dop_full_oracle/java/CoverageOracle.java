// SPDX-License-Identifier: AGPL-3.0-only
//
// Oracle driver for tests/coverage_dop_full_oracle.rs (geometry side), run by make_fixture.py.
//
// Orekit 12.2 (CS GROUP, Apache-2.0) and Hipparchus 3.1 on OpenJDK 21:
//   - positions: KeplerianPropagator from the generator's element sets with the body's
//     gravitational parameter, in an inertial frame aligned with the body-fixed frame at the
//     epoch; the body-fixed position is that inertial position rotated by -omega*t about +z;
//   - elevation and azimuth: TopocentricFrame on a OneAxisEllipsoid of the body radius with
//     flattening 0 (the spherical user model), one per grid-cell centre; the ellipsoid's frame
//     is the frame the body-fixed positions are expressed in, so no frame transform enters;
//   - ground tracks: OneAxisEllipsoid.transform of the body-fixed positions at the track times.
//
// Usage: java -cp ".:$OREKIT_CP" CoverageOracle <input.txt> <positions.txt> <tracks.txt>
// Input (written by make_fixture.py): line 1 "mu re omega mask_deg grid_step_deg";
// line 2 the epochs; line 3 the track times; line 4 "stride"; then one element set per line
// "cons a e i raan argp m0" (m, rad).
// Writes the two text files and streams, for each grid cell (latitude rows south to north,
// longitude columns west to east) and each epoch, an int count followed by that many
// (int satellite, double elevation rad, double azimuth rad) of satellites at or above the
// mask, big-endian, to standard output.

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
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
import org.orekit.frames.TopocentricFrame;
import org.orekit.orbits.KeplerianOrbit;
import org.orekit.orbits.PositionAngleType;
import org.orekit.propagation.analytical.KeplerianPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScalesFactory;

public class CoverageOracle {
    static double[] nums(String line) {
        String[] f = line.trim().split("\\s+");
        double[] v = new double[f.length];
        for (int i = 0; i < f.length; i++) v[i] = Double.parseDouble(f[i]);
        return v;
    }

    public static void main(String[] args) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
                .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        BufferedReader in = new BufferedReader(new FileReader(args[0]));
        double[] h = nums(in.readLine());
        double mu = h[0], re = h[1], omega = h[2], maskDeg = h[3], step = h[4];
        double[] epochs = nums(in.readLine());
        double[] trackTimes = nums(in.readLine());
        int stride = (int) nums(in.readLine())[0];
        List<double[]> els = new ArrayList<>();
        for (String l = in.readLine(); l != null; l = in.readLine()) {
            if (!l.isBlank()) els.add(nums(l));
        }
        in.close();
        int ns = els.size();

        Frame frame = FramesFactory.getGCRF();
        AbsoluteDate t0 = new AbsoluteDate(2026, 1, 1, 0, 0, 0.0, TimeScalesFactory.getTAI());
        KeplerianPropagator[] props = new KeplerianPropagator[ns];
        for (int k = 0; k < ns; k++) {
            double[] e = els.get(k);
            KeplerianOrbit o = new KeplerianOrbit(e[1], e[2], e[3], e[5], e[4], e[6],
                    PositionAngleType.MEAN, frame, t0, mu);
            props[k] = new KeplerianPropagator(o);
        }
        OneAxisEllipsoid body = new OneAxisEllipsoid(re, 0.0, frame);

        // Body-fixed positions at every epoch, written for the test.
        Vector3D[][] pos = new Vector3D[epochs.length][ns];
        try (PrintWriter pw = new PrintWriter(args[1])) {
            pw.println("# Orekit 12.2 KeplerianPropagator, body-fixed (rotated by -omega t): epoch_s sat x y z (m)");
            for (int n = 0; n < epochs.length; n++) {
                for (int k = 0; k < ns; k++) {
                    pos[n][k] = fixed(props[k], t0, epochs[n], omega, frame);
                    Vector3D p = pos[n][k];
                    pw.println(String.format(Locale.ROOT, "%s %d %.17e %.17e %.17e",
                            Double.toString(epochs[n]), k, p.getX(), p.getY(), p.getZ()));
                }
            }
        }
        // Ground tracks of every stride-th satellite.
        try (PrintWriter pw = new PrintWriter(args[2])) {
            pw.println("# Orekit 12.2 sub-satellite point (OneAxisEllipsoid, flattening 0): sat t_s lat_deg lon_deg");
            for (int k = 0; k < ns; k += stride) {
                for (double t : trackTimes) {
                    Vector3D p = fixed(props[k], t0, t, omega, frame);
                    GeodeticPoint g = body.transform(p, frame, t0);
                    pw.println(String.format(Locale.ROOT, "%d %.17g %.17e %.17e", k, t,
                            Math.toDegrees(g.getLatitude()), Math.toDegrees(g.getLongitude())));
                }
            }
        }

        // Elevation and azimuth stream.
        double mask = Math.toRadians(maskDeg);
        int nla = (int) Math.round(180.0 / step), nlo = (int) Math.round(360.0 / step);
        DataOutputStream out = new DataOutputStream(new BufferedOutputStream(System.out, 1 << 20));
        int[] sat = new int[ns];
        double[] el = new double[ns], az = new double[ns];
        for (int a = 0; a < nla; a++) {
            double lat = Math.toRadians(-90.0 + (a + 0.5) * step);
            for (int o = 0; o < nlo; o++) {
                double lon = Math.toRadians(-180.0 + (o + 0.5) * step);
                TopocentricFrame topo = new TopocentricFrame(body, new GeodeticPoint(lat, lon, 0.0), "c");
                for (int n = 0; n < epochs.length; n++) {
                    int m = 0;
                    for (int k = 0; k < ns; k++) {
                        double e = topo.getElevation(pos[n][k], frame, t0);
                        if (e >= mask) {
                            sat[m] = k;
                            el[m] = e;
                            az[m] = topo.getAzimuth(pos[n][k], frame, t0);
                            m++;
                        }
                    }
                    out.writeInt(m);
                    for (int j = 0; j < m; j++) {
                        out.writeInt(sat[j]);
                        out.writeDouble(el[j]);
                        out.writeDouble(az[j]);
                    }
                }
            }
        }
        out.flush();
    }

    static Vector3D fixed(KeplerianPropagator p, AbsoluteDate t0, double t, double omega, Frame frame) {
        Vector3D r = p.propagate(t0.shiftedBy(t)).getPosition(frame);
        double c = Math.cos(omega * t), s = Math.sin(omega * t);
        return new Vector3D(c * r.getX() + s * r.getY(), -s * r.getX() + c * r.getY(), r.getZ());
    }
}
