// SPDX-License-Identifier: AGPL-3.0-only
// The convention probe named in PREREGISTRATION.md ("Convention check"): how Orekit 12.2's
// ElevationMask interpolates between sorted points and across north. Run before the
// pre-registration, on synthetic points only, never on the comparison inputs.
//
//   javac -cp "$CP" xval/orekit-skyline/ElevationMaskProbe.java -d /tmp/orekit-probe
//   java -cp "$CP:/tmp/orekit-probe" ElevationMaskProbe
import org.orekit.utils.ElevationMask;

public class ElevationMaskProbe {
  public static void main(String[] a) {
    double d = Math.PI / 180.0;
    // Two points at 10 and 350 deg: 0 deg is halfway across north; 180 is halfway the long way.
    ElevationMask m = new ElevationMask(new double[][] {{10 * d, 20 * d}, {350 * d, 40 * d}});
    for (double az : new double[] {0, 5, 10, 100, 180, 355, 359.999}) {
      System.out.printf("%.3f %.12f%n", az, m.getElevation(az * d) / d);
    }
    // Unsorted input.
    ElevationMask u =
        new ElevationMask(
            new double[][] {{270 * d, 20 * d}, {90 * d, 30 * d}, {0, 10 * d}, {180 * d, 10 * d}});
    for (double az : new double[] {45, 135, 225, 315}) {
      System.out.printf("u %.3f %.12f%n", az, u.getElevation(az * d) / d);
    }
  }
}
