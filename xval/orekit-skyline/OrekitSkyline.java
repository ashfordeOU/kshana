// SPDX-License-Identifier: AGPL-3.0-only
// Oracle driver for tests/skyline_orekit_oracle.rs (see PREREGISTRATION.md beside this file).
//
// Reads <dir>/inputs/{sites,sats,masks}.csv and writes <dir>/outputs/orekit.csv: for every
// site, epoch and satellite above the geometric horizon, Orekit's azimuth and elevation
// (TopocentricFrame on a WGS-84 OneAxisEllipsoid) and, for every mask table, Orekit's
// ElevationMask at that azimuth. The positions are given in the body frame itself, so no
// Earth-orientation data is read. Orekit and Hipparchus are Apache-2.0 and are not part of
// the published crate (xval/ is workspace-excluded).
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.orekit.bodies.GeodeticPoint;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.TopocentricFrame;
import org.orekit.time.AbsoluteDate;
import org.orekit.utils.Constants;
import org.orekit.utils.ElevationMask;

public class OrekitSkyline {
  private static List<String[]> rows(Path p) throws IOException {
    List<String[]> out = new ArrayList<>();
    List<String> lines = Files.readAllLines(p);
    for (String line : lines.subList(1, lines.size())) { // the first line is the header
      if (line.isBlank() || line.startsWith("#")) {
        continue;
      }
      out.add(line.split(","));
    }
    return out;
  }

  public static void main(String[] args) throws IOException {
    Path dir = Path.of(args[0]);
    Frame body = FramesFactory.getGCRF();
    OneAxisEllipsoid earth = new OneAxisEllipsoid(
        Constants.WGS84_EARTH_EQUATORIAL_RADIUS, Constants.WGS84_EARTH_FLATTENING, body);
    AbsoluteDate date = AbsoluteDate.ARBITRARY_EPOCH;
    double d = Math.PI / 180.0;

    Map<String, List<double[]>> tables = new LinkedHashMap<>();
    for (String[] r : rows(dir.resolve("inputs/masks.csv"))) {
      tables.computeIfAbsent(r[0], k -> new ArrayList<>())
          .add(new double[] {Double.parseDouble(r[1]) * d, Double.parseDouble(r[2]) * d});
    }
    Map<String, ElevationMask> masks = new LinkedHashMap<>();
    for (Map.Entry<String, List<double[]>> e : tables.entrySet()) {
      masks.put(e.getKey(), new ElevationMask(e.getValue().toArray(new double[0][])));
    }

    StringBuilder out = new StringBuilder();
    out.append("site_id,epoch_s,sat_id,az_deg,el_deg");
    for (String m : masks.keySet()) {
      out.append(",cut_").append(m);
    }
    out.append('\n');
    List<String[]> sats = rows(dir.resolve("inputs/sats.csv"));
    for (String[] s : rows(dir.resolve("inputs/sites.csv"))) {
      GeodeticPoint gp = new GeodeticPoint(
          Double.parseDouble(s[1]) * d, Double.parseDouble(s[2]) * d, Double.parseDouble(s[3]));
      TopocentricFrame topo = new TopocentricFrame(earth, gp, s[0]);
      for (String[] r : sats) {
        Vector3D p = new Vector3D(
            Double.parseDouble(r[2]), Double.parseDouble(r[3]), Double.parseDouble(r[4]));
        double el = topo.getElevation(p, body, date);
        if (el < 0.0) {
          continue;
        }
        double az = topo.getAzimuth(p, body, date);
        out.append(String.format(Locale.ROOT, "%s,%s,%s,%.15f,%.15f", s[0], r[0], r[1], az / d, el / d));
        for (ElevationMask m : masks.values()) {
          out.append(String.format(Locale.ROOT, ",%.15f", m.getElevation(az) / d));
        }
        out.append('\n');
      }
    }
    Files.createDirectories(dir.resolve("outputs"));
    Files.writeString(dir.resolve("outputs/orekit.csv"), out.toString());
  }
}
