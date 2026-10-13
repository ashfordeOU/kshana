// SPDX-License-Identifier: AGPL-3.0-only
// Orekit 12.2 reference for the propagator's opt-in NRLMSISE-00 drag tier (WP-01, RM-13/DS-PA-15).
// Point-mass gravity + DragForce(NRLMSISE00, IsotropicDrag) integrated in GCRF with
// DormandPrince853. The Earth-fixed frame rotates about GCRF z by the IAU 2000 Earth rotation
// angle at UT1 = TT (kshana's convention for this tier); the body shape is WGS-84 on that frame.
// NRLMSISE00 gets a "mean Sun" placed in the Earth-fixed frame at longitude (12 h - UT)*15 deg so
// its hour-angle local solar time equals UT + lon/15 (the NRL convention kshana uses), and the TT
// time scale as its UT (kshana takes the day of year and seconds of day from JD(TT)).
// Constant F10.7a, F10.7, Ap from the request.
import java.io.*;
import java.util.*;
import org.hipparchus.CalculusFieldElement;
import org.hipparchus.geometry.euclidean.threed.*;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.orekit.bodies.*;
import org.orekit.data.*;
import org.orekit.forces.drag.*;
import org.orekit.forces.gravity.NewtonianAttraction;
import org.orekit.frames.*;
import org.orekit.models.earth.atmosphere.*;
import org.orekit.orbits.*;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.*;
import org.orekit.utils.*;

public class DragDriver {
    static final double MU = 3.986004418e14, JD_J2000 = 2451545.0, DAY = 86400.0;
    static final double ERA_RATE = 2.0 * Math.PI * 1.00273781191135448 / DAY;

    static double era(double jdUt1) { // kshana src/cio.rs earth_rotation_angle, ported
        double t = jdUt1 - JD_J2000, f = jdUt1 % 1.0;
        double w = (2.0 * Math.PI * (f + 0.7790572732640 + 0.00273781191135448 * t)) % (2.0 * Math.PI);
        return w < 0.0 ? w + 2.0 * Math.PI : w;
    }

    static class EraProvider implements TransformProvider {
        final AbsoluteDate ref; final double epochJdTt;
        EraProvider(AbsoluteDate ref, double e) { this.ref = ref; this.epochJdTt = e; }
        public Transform getTransform(AbsoluteDate d) {
            double th = era(epochJdTt + d.durationFrom(ref) / DAY);
            return new Transform(d, new Rotation(Vector3D.PLUS_K, th, RotationConvention.FRAME_TRANSFORM),
                                 new Vector3D(0.0, 0.0, ERA_RATE));
        }
        public <T extends CalculusFieldElement<T>> FieldTransform<T> getTransform(FieldAbsoluteDate<T> d) {
            return new FieldTransform<>(d.getField(), getTransform(d.toAbsoluteDate()));
        }
    }

    static double num(String j, String k) {
        int i = j.indexOf("\"" + k + "\""); i = j.indexOf(':', i) + 1; int e = i;
        while (e < j.length() && ",}]".indexOf(j.charAt(e)) < 0) e++;
        return Double.parseDouble(j.substring(i, e).trim());
    }
    static double[] vec(String j, String k) {
        int i = j.indexOf("\"" + k + "\""); i = j.indexOf('[', i) + 1; String[] p = j.substring(i, j.indexOf(']', i)).split(",");
        return new double[]{Double.parseDouble(p[0].trim()), Double.parseDouble(p[1].trim()), Double.parseDouble(p[2].trim())};
    }

    public static void main(String[] a) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        String json = new String(System.in.readAllBytes());
        double[] r0 = vec(json, "r0"), v0 = vec(json, "v0");
        double epochJdTt = num(json, "epoch_jd_tt"), arc = num(json, "arc_seconds");
        int n = (int) num(json, "n_epochs");
        double tol = num(json, "tol"), cdam = num(json, "cd_area_over_mass");
        final double f107a = num(json, "f107a"), f107 = num(json, "f107"), ap = num(json, "ap");

        TimeScale tt = TimeScalesFactory.getTT();
        AbsoluteDate j2000 = new AbsoluteDate(new DateComponents(2000, 1, 1), new TimeComponents(12, 0, 0.0), tt);
        AbsoluteDate epoch = j2000.shiftedBy((epochJdTt - JD_J2000) * DAY);
        Frame gcrf = FramesFactory.getGCRF();
        Frame body = new Frame(gcrf, new EraProvider(epoch, epochJdTt), "KSHANA_ERA_ECEF", false);
        OneAxisEllipsoid earth = new OneAxisEllipsoid(6378137.0, 1.0 / 298.257223563, body);

        PVCoordinatesProvider meanSun = new PVCoordinatesProvider() {
            public TimeStampedPVCoordinates getPVCoordinates(AbsoluteDate d, Frame f) {
                DateTimeComponents c = d.getComponents(tt);
                double sec = c.getTime().getSecondsInLocalDay();
                double lon = Math.toRadians((12.0 - sec / 3600.0) * 15.0);
                Vector3D pBody = new Vector3D(1.5e11 * Math.cos(lon), 1.5e11 * Math.sin(lon), 0.0);
                return new TimeStampedPVCoordinates(d, body.getTransformTo(f, d).transformPosition(pBody), Vector3D.ZERO);
            }
        };
        NRLMSISE00InputParameters par = new NRLMSISE00InputParameters() {
            public AbsoluteDate getMinDate() { return AbsoluteDate.PAST_INFINITY; }
            public AbsoluteDate getMaxDate() { return AbsoluteDate.FUTURE_INFINITY; }
            public double getDailyFlux(AbsoluteDate x) { return f107; }
            public double getAverageFlux(AbsoluteDate x) { return f107a; }
            public double[] getAp(AbsoluteDate x) { return new double[]{ap, ap, ap, ap, ap, ap, ap}; }
        };
        NRLMSISE00 atm = new NRLMSISE00(par, meanSun, earth, tt);

        Orbit orbit = new CartesianOrbit(new PVCoordinates(new Vector3D(r0[0], r0[1], r0[2]),
            new Vector3D(v0[0], v0[1], v0[2])), gcrf, epoch, MU);
        double[][] t = NumericalPropagator.tolerances(tol, orbit, OrbitType.CARTESIAN);
        NumericalPropagator prop = new NumericalPropagator(new DormandPrince853Integrator(1e-6, 300.0, t[0], t[1]));
        prop.setOrbitType(OrbitType.CARTESIAN);
        prop.addForceModel(new NewtonianAttraction(MU));
        prop.addForceModel(new DragForce(atm, new IsotropicDrag(cdam, 1.0)));
        prop.setInitialState(new SpacecraftState(orbit, 1.0));
        double dt = arc / (n - 1);
        StringBuilder out = new StringBuilder();
        for (int k = 0; k < n; k++) {
            PVCoordinates pv = prop.propagate(epoch.shiftedBy(k * dt)).getPVCoordinates(gcrf);
            Vector3D r = pv.getPosition(), v = pv.getVelocity();
            out.append(String.format(Locale.ROOT, "STATE %d %.6f %.12e,%.12e,%.12e %.12e,%.12e,%.12e%n",
                k, k * dt, r.getX(), r.getY(), r.getZ(), v.getX(), v.getY(), v.getZ()));
        }
        System.out.print(out);
    }
}
