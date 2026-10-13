// SPDX-License-Identifier: AGPL-3.0-only
// Orekit 12.2 lighting ratio for the oblate-Earth SRP shadow (WP-01, FUT-09/RM-11).
// stdin: one geometry per line "id rx ry rz sx sy sz" (metres, inertial; the ellipsoid axis is
// the inertial z axis). stdout: "id nu_wgs84 nu_sphere" from SolarRadiationPressure.getLightingRatio
// with a WGS-84 OneAxisEllipsoid and with a sphere of the WGS-84 equatorial radius.
import java.io.*;
import java.util.*;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.*;
import org.orekit.forces.radiation.*;
import org.orekit.frames.*;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.propagation.SpacecraftState;
import org.orekit.time.*;
import org.orekit.utils.*;

public class ShadowDriver {
    public static void main(String[] a) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        Frame inertial = FramesFactory.getGCRF();
        AbsoluteDate date = AbsoluteDate.J2000_EPOCH;
        double ae = 6378137.0, f = 1.0 / 298.257223563;
        OneAxisEllipsoid wgs = new OneAxisEllipsoid(ae, f, inertial);
        OneAxisEllipsoid sph = new OneAxisEllipsoid(ae, 0.0, inertial);
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder out = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            String[] p = line.trim().split("\\s+");
            if (p.length < 7) continue;
            Vector3D r = new Vector3D(Double.parseDouble(p[1]), Double.parseDouble(p[2]), Double.parseDouble(p[3]));
            Vector3D s = new Vector3D(Double.parseDouble(p[4]), Double.parseDouble(p[5]), Double.parseDouble(p[6]));
            ExtendedPVCoordinatesProvider sun = new ExtendedPVCoordinatesProvider() {
                public TimeStampedPVCoordinates getPVCoordinates(AbsoluteDate d, Frame fr) {
                    return new TimeStampedPVCoordinates(d, s, Vector3D.ZERO);
                }
                public <T extends org.hipparchus.CalculusFieldElement<T>> TimeStampedFieldPVCoordinates<T>
                getPVCoordinates(FieldAbsoluteDate<T> d, Frame fr) {
                    return new TimeStampedFieldPVCoordinates<>(d.getField(), new TimeStampedPVCoordinates(d.toAbsoluteDate(), s, Vector3D.ZERO));
                }
            };
            // Velocity is irrelevant to the lighting ratio; any non-collinear vector keeps the orbit valid.
            Vector3D v = r.crossProduct(Vector3D.PLUS_K).getNorm() > 1.0
                ? r.crossProduct(Vector3D.PLUS_K).normalize().scalarMultiply(7000.0)
                : new Vector3D(7000.0, 0.0, 0.0);
            SpacecraftState st = new SpacecraftState(new CartesianOrbit(new PVCoordinates(r, v), inertial, date, 3.986004418e14));
            IsotropicRadiationSingleCoefficient iso = new IsotropicRadiationSingleCoefficient(1.0, 1.0);
            double nuW = new SolarRadiationPressure(sun, wgs, iso).getLightingRatio(st);
            double nuS = new SolarRadiationPressure(sun, sph, iso).getLightingRatio(st);
            out.append(String.format(Locale.ROOT, "%s %.17e %.17e%n", p[0], nuW, nuS));
        }
        System.out.print(out);
    }
}
