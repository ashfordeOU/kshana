// SPDX-License-Identifier: AGPL-3.0-only
// Disclosure driver for tests/pass_predictor_apparent_orekit_oracle.rs: Orekit 13.1.8's
// ITURP834AtmosphericRefraction.getRefraction (rad) at station heights 0, 0.5, 1, 2 and 3 km and
// free-space elevations 0 to 90 deg, to pin the size of its h * theta0^2 coefficient (0.011380
// in Orekit, 0.01380 printed in ITU-R P.834-9 equation (14)). Output: "R h_m theta0_deg tau_rad".
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Locale;
import org.hipparchus.util.FastMath;
import org.orekit.models.earth.ITURP834AtmosphericRefraction;

public class RefractionTableDriver {
    public static void main(String[] args) throws Exception {
        PrintWriter out = new PrintWriter(Paths.get(args[0], "orekit_refraction.txt").toFile());
        out.println("# Orekit 13.1.8 ITURP834AtmosphericRefraction: R h_m theta0_deg tau_rad");
        for (double h : new double[] {0.0, 500.0, 1000.0, 2000.0, 3000.0}) {
            ITURP834AtmosphericRefraction m = new ITURP834AtmosphericRefraction(h);
            for (double e : new double[] {0.0, 1.0, 2.0, 5.0, 10.0, 20.0, 45.0, 90.0}) {
                out.printf(Locale.ROOT, "R %.1f %.1f %.17g%n", h, e, m.getRefraction(FastMath.toRadians(e)));
            }
        }
        out.close();
    }
}
