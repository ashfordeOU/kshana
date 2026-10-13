// SPDX-License-Identifier: AGPL-3.0-only
// Orekit 12.2 oracle for kshana's high-degree spherical-harmonic gravity
// (SphericalHarmonicField::acceleration_hf / potential_hf).
//
// Usage: java HdGravDriver <orekit-data dir> <.gfc file> <points file> <degree> [<degree> ...]
// Points file: one point per line, "id x y z" (metres, Earth-fixed), '#' comments.
// Output (stdout): "N id ax ay az U" with the NON-CENTRAL gradient (m/s^2) from
// HolmesFeatherstoneAttractionModel.gradient and the non-central potential (m^2/s^2) from
// nonCentralPart, both evaluated in the body frame, for a NormalizedSphericalHarmonicsProvider
// truncated to degree = order = N read by Orekit's own ICGEMFormatReader from the given file.
// Values are printed with %.17e (round-trip exact).

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.forces.gravity.HolmesFeatherstoneAttractionModel;
import org.orekit.forces.gravity.potential.GravityFieldFactory;
import org.orekit.forces.gravity.potential.ICGEMFormatReader;
import org.orekit.forces.gravity.potential.NormalizedSphericalHarmonicsProvider;
import org.orekit.frames.FramesFactory;
import org.orekit.time.AbsoluteDate;

public class HdGravDriver {
    public static void main(String[] args) throws Exception {
        File orekitData = new File(args[0]);
        File gfc = new File(args[1]).getAbsoluteFile();
        List<String[]> pts = new ArrayList<>();
        for (String line : Files.readAllLines(new File(args[2]).toPath())) {
            line = line.trim();
            if (line.isEmpty() || line.startsWith("#")) continue;
            pts.add(line.split("\\s+"));
        }
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(orekitData));
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(gfc.getParentFile()));
        GravityFieldFactory.clearPotentialCoefficientsReaders();
        // EGM2008 carries no degree-1 lines: missing coefficients are zero.
        GravityFieldFactory.addPotentialCoefficientsReader(
                new ICGEMFormatReader(Pattern.quote(gfc.getName()), true));
        AbsoluteDate date = AbsoluteDate.J2000_EPOCH;
        for (int k = 3; k < args.length; k++) {
            int n = Integer.parseInt(args[k]);
            NormalizedSphericalHarmonicsProvider p = GravityFieldFactory.getNormalizedProvider(n, n);
            HolmesFeatherstoneAttractionModel hf =
                    new HolmesFeatherstoneAttractionModel(FramesFactory.getGCRF(), p);
            double mu = p.getMu();
            System.out.printf(Locale.ROOT, "# N %d mu %.17e ae %.17e maxdeg %d tide %s%n",
                    n, mu, p.getAe(), p.getMaxDegree(), p.getTideSystem());
            for (String[] pt : pts) {
                Vector3D r = new Vector3D(Double.parseDouble(pt[1]), Double.parseDouble(pt[2]),
                        Double.parseDouble(pt[3]));
                double[] g = hf.gradient(date, r, mu);
                double u = hf.nonCentralPart(date, r, mu);
                System.out.printf(Locale.ROOT, "%d %s %.17e %.17e %.17e %.17e%n",
                        n, pt[0], g[0], g[1], g[2], u);
            }
        }
    }
}
