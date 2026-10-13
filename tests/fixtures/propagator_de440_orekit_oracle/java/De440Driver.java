// SPDX-License-Identifier: AGPL-3.0-only
// Orekit 12.2 reference for the propagator's opt-in DE440 ephemeris tier (WP-01, RM-33/FUT-10).
// Two-body + Sun/Moon third-body attraction (tier D1), plus cannonball SRP with a spherical-Earth
// conical shadow (tier D2), Sun and Moon from Orekit's OWN DE440 reader on orekit-data's
// DE-440-ephemerides/lnxp1990.440 (an independent file and reader from kshana's SPK path).
// Integration frame GCRF; NumericalPropagator + DormandPrince853.
// Usage: java -cp "$OREKIT_CP:." De440Driver <json on stdin>; prints STATE lines.
import java.io.*;
import java.util.*;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.orekit.bodies.*;
import org.orekit.data.*;
import org.orekit.forces.gravity.*;
import org.orekit.forces.radiation.*;
import org.orekit.frames.*;
import org.orekit.orbits.*;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.*;
import org.orekit.utils.*;

public class De440Driver {
    static final double MU_EARTH = 3.986004418e14, RE_EARTH = 6378137.0;
    static final double AU_M = 1.495978707e11, P0 = 1361.0 / 299792458.0;

    static double num(String j, String k) {
        int i = j.indexOf("\"" + k + "\""); i = j.indexOf(':', i) + 1;
        int e = i; while (e < j.length() && ",}]".indexOf(j.charAt(e)) < 0) e++;
        return Double.parseDouble(j.substring(i, e).trim());
    }
    static double[] vec(String j, String k) {
        int i = j.indexOf("\"" + k + "\""); i = j.indexOf('[', i) + 1; int e = j.indexOf(']', i);
        String[] p = j.substring(i, e).split(",");
        return new double[]{Double.parseDouble(p[0].trim()), Double.parseDouble(p[1].trim()), Double.parseDouble(p[2].trim())};
    }
    static String str(String j, String k) {
        int i = j.indexOf("\"" + k + "\""); i = j.indexOf(':', i); i = j.indexOf('"', i) + 1;
        return j.substring(i, j.indexOf('"', i));
    }

    public static void main(String[] a) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        String json = new String(System.in.readAllBytes());
        String tier = str(json, "tier");
        double[] r0 = vec(json, "r0"), v0 = vec(json, "v0");
        double epochJdTt = num(json, "epoch_jd_tt"), arc = num(json, "arc_seconds");
        int n = (int) num(json, "n_epochs");
        double tol = num(json, "tol"), cr = num(json, "cr"), aom = num(json, "area_over_mass");

        TimeScale tt = TimeScalesFactory.getTT();
        AbsoluteDate j2000 = new AbsoluteDate(new DateComponents(2000, 1, 1), new TimeComponents(12, 0, 0.0), tt);
        AbsoluteDate epoch = j2000.shiftedBy((epochJdTt - 2451545.0) * 86400.0);
        Frame gcrf = FramesFactory.getGCRF();
        Orbit orbit = new CartesianOrbit(new PVCoordinates(new Vector3D(r0[0], r0[1], r0[2]),
            new Vector3D(v0[0], v0[1], v0[2])), gcrf, epoch, MU_EARTH);
        double[][] t = NumericalPropagator.tolerances(tol, orbit, OrbitType.CARTESIAN);
        NumericalPropagator prop = new NumericalPropagator(new DormandPrince853Integrator(1e-6, 600.0, t[0], t[1]));
        prop.setOrbitType(OrbitType.CARTESIAN);
        prop.addForceModel(new NewtonianAttraction(MU_EARTH));
        CelestialBody sun = CelestialBodyFactory.getSun(), moon = CelestialBodyFactory.getMoon();
        prop.addForceModel(new ThirdBodyAttraction(sun));
        prop.addForceModel(new ThirdBodyAttraction(moon));
        if (tier.equals("D2")) {
            OneAxisEllipsoid earth = new OneAxisEllipsoid(RE_EARTH, 0.0, gcrf);
            prop.addForceModel(new SolarRadiationPressure(AU_M, P0, sun, earth,
                new IsotropicRadiationSingleCoefficient(aom, cr)));
        }
        prop.setInitialState(new SpacecraftState(orbit, 1.0));
        double dt = arc / (n - 1);
        StringBuilder out = new StringBuilder();
        for (int k = 0; k < n; k++) {
            PVCoordinates pv = prop.propagate(epoch.shiftedBy(k * dt)).getPVCoordinates(gcrf);
            Vector3D r = pv.getPosition(), v = pv.getVelocity();
            out.append(String.format(Locale.ROOT, "STATE %s %d %.6f %.12e,%.12e,%.12e %.12e,%.12e,%.12e%n",
                tier, k, k * dt, r.getX(), r.getY(), r.getZ(), v.getX(), v.getY(), v.getZ()));
        }
        // The Sun and Moon positions Orekit used, at each output epoch (for the direct check).
        for (int k = 0; k < n; k++) {
            AbsoluteDate d = epoch.shiftedBy(k * dt);
            Vector3D s = sun.getPosition(d, gcrf), m = moon.getPosition(d, gcrf);
            out.append(String.format(Locale.ROOT, "BODY %d %.6f %.12e,%.12e,%.12e %.12e,%.12e,%.12e%n",
                k, k * dt, s.getX(), s.getY(), s.getZ(), m.getX(), m.getY(), m.getZ()));
        }
        System.out.print(out);
    }
}
