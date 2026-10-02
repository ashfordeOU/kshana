// SPDX-License-Identifier: AGPL-3.0-only
//
// TruthOrekitDriver: Orekit 12.2 (CS GROUP, Apache-2.0) reference for the integrated truth orbit
// of Kshana's LEO navigation-message kind (tests/leo_navmsg_full_claim_oracle.rs, M120 round 2,
// Part B). Reads one case per line on stdin:
//   label degree cd_area_over_mass theta0 duration_s out_step_s rx ry rz vx vy vz
// (the node-0 state in Kshana's pseudo-inertial frame) and prints "label t x y z" Earth-fixed
// positions (m) every out_step_s seconds.
//
// Frames: the integration frame is GCRF taken as Kshana's pseudo-inertial frame (no other frame
// is used); the body frame is turned about z by theta0 + OMEGA_E t. Forces: Orekit's
// NewtonianAttraction; zonal J2..J6 (Kshana's constants, normalised) or EGM2008 read by Orekit's
// ICGEM reader from tools/egm2008_to70.gfc, through HolmesFeatherstoneAttractionModel; drag
// through DragForce / IsotropicDrag (area = cd_area_over_mass, Cd = 1, mass 1 kg) in an
// atmosphere co-rotating with the body frame whose density is Kshana's 28-band table at the
// spherical altitude |r| - 6378137 m. Integrator: DormandPrince853, position tolerance 1e-6 m.
//
// Compile: javac -cp "$OREKIT_CP" TruthOrekitDriver.java
// Run:     java -cp ".:$OREKIT_CP" TruthOrekitDriver <repo>/tools < cases.txt

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.Locale;

import org.hipparchus.CalculusFieldElement;
import org.hipparchus.geometry.euclidean.threed.FieldRotation;
import org.hipparchus.geometry.euclidean.threed.FieldVector3D;
import org.hipparchus.geometry.euclidean.threed.Rotation;
import org.hipparchus.geometry.euclidean.threed.RotationConvention;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.forces.drag.DragForce;
import org.orekit.forces.drag.IsotropicDrag;
import org.orekit.forces.gravity.HolmesFeatherstoneAttractionModel;
import org.orekit.forces.gravity.NewtonianAttraction;
import org.orekit.forces.gravity.potential.GravityFieldFactory;
import org.orekit.forces.gravity.potential.ICGEMFormatReader;
import org.orekit.forces.gravity.potential.NormalizedSphericalHarmonicsProvider;
import org.orekit.forces.gravity.potential.TideSystem;
import org.orekit.frames.FieldTransform;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.Transform;
import org.orekit.frames.TransformProvider;
import org.orekit.models.earth.atmosphere.Atmosphere;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.OrbitType;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.PVCoordinates;

public class TruthOrekitDriver {
    static final double MU = 3.986004418e14, RE = 6378137.0, OMEGA_E = 7.2921151467e-5;
    static final double[] JN = {1.08262668e-3, -2.5327e-6, -1.6196e-6, -2.2730e-7, 5.4068e-7};
    // Kshana's 28-band piecewise-exponential density table (h0 km, rho0 kg/m^3, H km).
    static final double[][] BANDS = {
        {0.0, 1.225, 7.249}, {25.0, 3.899e-2, 6.349}, {30.0, 1.774e-2, 6.682}, {40.0, 3.972e-3, 7.554},
        {50.0, 1.057e-3, 8.382}, {60.0, 3.206e-4, 7.714}, {70.0, 8.770e-5, 6.549}, {80.0, 1.905e-5, 5.799},
        {90.0, 3.396e-6, 5.382}, {100.0, 5.297e-7, 5.877}, {110.0, 9.661e-8, 7.263}, {120.0, 2.438e-8, 9.473},
        {130.0, 8.484e-9, 12.636}, {140.0, 3.845e-9, 16.149}, {150.0, 2.070e-9, 22.523}, {180.0, 5.464e-10, 29.740},
        {200.0, 2.789e-10, 37.105}, {250.0, 7.248e-11, 45.546}, {300.0, 2.418e-11, 53.628}, {350.0, 9.518e-12, 53.298},
        {400.0, 3.725e-12, 58.515}, {450.0, 1.585e-12, 60.828}, {500.0, 6.967e-13, 63.822}, {600.0, 1.454e-13, 71.835},
        {700.0, 3.614e-14, 88.667}, {800.0, 1.170e-14, 124.64}, {900.0, 5.245e-15, 181.05}, {1000.0, 3.019e-15, 268.00}};

    static double density(double altM) {
        double h = Math.max(altM / 1000.0, 0.0);
        int i = 0;
        while (i + 1 < BANDS.length && BANDS[i + 1][0] <= h) i++;
        return BANDS[i][1] * Math.exp(-(h - BANDS[i][0]) / BANDS[i][2]);
    }

    static class Spin implements TransformProvider {
        final AbsoluteDate t0; final double th0;
        Spin(AbsoluteDate t0, double th0) { this.t0 = t0; this.th0 = th0; }
        @Override public Transform getTransform(AbsoluteDate date) {
            double th = th0 + OMEGA_E * date.durationFrom(t0);
            return new Transform(date, new Rotation(Vector3D.PLUS_K, th, RotationConvention.FRAME_TRANSFORM),
                                 new Vector3D(0, 0, OMEGA_E));
        }
        @Override public <T extends CalculusFieldElement<T>> FieldTransform<T> getTransform(FieldAbsoluteDate<T> date) {
            T th = date.durationFrom(t0).multiply(OMEGA_E).add(th0);
            FieldRotation<T> rot = new FieldRotation<>(FieldVector3D.getPlusK(date.getField()), th,
                                                        RotationConvention.FRAME_TRANSFORM);
            return new FieldTransform<>(date, rot,
                new FieldVector3D<>(date.getField().getZero(), date.getField().getZero(),
                                    date.getField().getZero().add(OMEGA_E)));
        }
    }

    // Co-rotating atmosphere with Kshana's density at spherical altitude.
    static class KshanaAtmosphere implements Atmosphere {
        final Frame body;
        KshanaAtmosphere(Frame body) { this.body = body; }
        @Override public Frame getFrame() { return body; }
        @Override public double getDensity(AbsoluteDate date, Vector3D position, Frame frame) {
            return density(position.getNorm() - RE);
        }
        @Override public <T extends CalculusFieldElement<T>> T getDensity(FieldAbsoluteDate<T> date,
                FieldVector3D<T> position, Frame frame) {
            return date.getField().getZero().add(density(position.getNorm().getReal() - RE));
        }
    }

    public static void main(String[] args) throws Exception {
        DataContext.getDefault().getDataProvidersManager()
            .addProvider(new DirectoryCrawler(new File(System.getenv("OREKIT_DATA"))));
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(new File(args[0])));
        GravityFieldFactory.clearPotentialCoefficientsReaders();
        GravityFieldFactory.addPotentialCoefficientsReader(new ICGEMFormatReader("egm2008_to70.gfc", false));
        Frame inertial = FramesFactory.getGCRF();
        AbsoluteDate t0 = new AbsoluteDate(2026, 10, 2, 0, 0, 0.0, TimeScalesFactory.getTAI());
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        String ln;
        while ((ln = br.readLine()) != null) {
            if (ln.isBlank()) continue;
            String[] f = ln.trim().split("\\s+");
            String label = f[0];
            int degree = Integer.parseInt(f[1]);
            double cd = Double.parseDouble(f[2]), th0 = Double.parseDouble(f[3]);
            double dur = Double.parseDouble(f[4]), outStep = Double.parseDouble(f[5]);
            Vector3D r0 = new Vector3D(Double.parseDouble(f[6]), Double.parseDouble(f[7]), Double.parseDouble(f[8]));
            Vector3D v0 = new Vector3D(Double.parseDouble(f[9]), Double.parseDouble(f[10]), Double.parseDouble(f[11]));
            Frame body = new Frame(inertial, new Spin(t0, th0), "BODY_" + label, false);
            double mu = MU;
            NormalizedSphericalHarmonicsProvider field = null;
            if (degree >= 2 && degree <= 6) {
                double[][] c = new double[degree + 1][];
                double[][] s = new double[degree + 1][];
                for (int n = 0; n <= degree; n++) { c[n] = new double[n + 1]; s[n] = new double[n + 1]; }
                c[0][0] = 1.0;
                for (int n = 2; n <= degree; n++) c[n][0] = -JN[n - 2] / Math.sqrt(2 * n + 1);
                field = GravityFieldFactory.getNormalizedProvider(RE, MU, TideSystem.UNKNOWN, c, s);
            } else if (degree >= 7) {
                field = GravityFieldFactory.getNormalizedProvider(degree, degree);
                mu = field.getMu();
            }
            CartesianOrbit orbit = new CartesianOrbit(new PVCoordinates(r0, v0), inertial, t0, mu);
            double[][] tol = NumericalPropagator.tolerances(1e-6, orbit, OrbitType.CARTESIAN);
            DormandPrince853Integrator integ = new DormandPrince853Integrator(1e-6, 60.0, tol[0], tol[1]);
            NumericalPropagator prop = new NumericalPropagator(integ);
            prop.setOrbitType(OrbitType.CARTESIAN);
            prop.setInitialState(new SpacecraftState(orbit, 1.0));
            prop.setMu(mu);
            prop.addForceModel(new NewtonianAttraction(mu));
            if (field != null) prop.addForceModel(new HolmesFeatherstoneAttractionModel(body, field));
            if (cd > 0) prop.addForceModel(new DragForce(new KshanaAtmosphere(body), new IsotropicDrag(cd, 1.0)));
            for (double t = 0; t <= dur + 1e-9; t += outStep) {
                AbsoluteDate d = t0.shiftedBy(t);
                SpacecraftState st = prop.propagate(d);
                Vector3D p = inertial.getTransformTo(body, d).transformPosition(st.getPosition(inertial));
                System.out.println(String.format(Locale.ROOT, "%s %.1f %.6f %.6f %.6f", label, t, p.getX(), p.getY(), p.getZ()));
            }
        }
    }
}
