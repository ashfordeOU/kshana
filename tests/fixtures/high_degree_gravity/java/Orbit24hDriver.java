// SPDX-License-Identifier: AGPL-3.0-only
// Orekit 12.2 reference for a 24 h LEO propagation in a 200x200 EGM2008 field, for the
// cross-check of kshana's propagator tesseral path (propagator::Geopotential with
// EarthFixedFrame::Era and ut1_minus_tt_s = 0).
//
// Dynamics: point mass (NewtonianAttraction, mu of the .gfc) + HolmesFeatherstoneAttractionModel
// (degree = order = N, coefficients read by Orekit's ICGEMFormatReader from the .gfc). Nothing else.
// Inertial frame: GCRF, used as a plain inertial frame (no precession/nutation enters: the body
// frame below is defined directly from it).
// Body frame: a rotation about the inertial z axis by the Earth Rotation Angle
//   ERA(t) = 2*pi*(0.7790572732640 + 1.00273781191135448*Du),  Du = JD_UT1 - 2451545.0,
// with UT1 = TT (JD_UT1 = JD_TT of the instant), no polar motion, no precession/nutation:
//   r_body = R3(ERA) r_inertial,  R3(a) = [[cos a, sin a, 0], [-sin a, cos a, 0], [0, 0, 1]],
// angular rate 2*pi*1.00273781191135448/86400 rad/s about z.
// Epoch: 2024-01-01T12:00:00 TT (JD_TT 2460311.0). Initial state (inertial, exact literals):
//   r0 = (6778136.3, 0, 0) m,  v0 = (0, 4766.0, 6008.0) m/s.
// Integrator: DormandPrince853, min step 1e-3 s, max step 300 s, Cartesian tolerances from
// NumericalPropagator.tolerances(dP = 1e-6 m). Output every 600 s for 86400 s.
//
// Usage: java Orbit24hDriver <orekit-data dir> <.gfc file> <N>
// Output: "t_s x y z vx vy vz" (inertial, m and m/s, %.17e), comment lines start with '#'.

import java.io.File;
import java.util.Locale;
import java.util.regex.Pattern;

import org.hipparchus.geometry.euclidean.threed.Rotation;
import org.hipparchus.geometry.euclidean.threed.RotationConvention;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.forces.gravity.HolmesFeatherstoneAttractionModel;
import org.orekit.forces.gravity.NewtonianAttraction;
import org.orekit.forces.gravity.potential.GravityFieldFactory;
import org.orekit.forces.gravity.potential.ICGEMFormatReader;
import org.orekit.forces.gravity.potential.NormalizedSphericalHarmonicsProvider;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.Transform;
import org.orekit.frames.TransformProvider;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.OrbitType;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.AngularCoordinates;
import org.orekit.utils.PVCoordinates;
import org.orekit.utils.TimeStampedPVCoordinates;

import org.hipparchus.CalculusFieldElement;
import org.orekit.frames.FieldTransform;

public class Orbit24hDriver {
    static final double ERA0 = 0.7790572732640;
    static final double ERA1 = 1.00273781191135448;

    /** ERA rotation about inertial z with UT1 = TT. */
    static class EraProvider implements TransformProvider {
        public Transform getTransform(AbsoluteDate date) {
            double du = date.durationFrom(AbsoluteDate.J2000_EPOCH) / 86400.0; // TT days since J2000.0 TT
            double frac = (ERA0 + ERA1 * du) % 1.0;
            double era = 2.0 * Math.PI * frac;
            double rate = 2.0 * Math.PI * ERA1 / 86400.0;
            Rotation rot = new Rotation(Vector3D.PLUS_K, era, RotationConvention.FRAME_TRANSFORM);
            return new Transform(date, new AngularCoordinates(rot, new Vector3D(0, 0, rate)));
        }

        public <T extends CalculusFieldElement<T>> FieldTransform<T> getTransform(FieldAbsoluteDate<T> date) {
            throw new UnsupportedOperationException("field transform not needed");
        }
    }

    public static void main(String[] args) throws Exception {
        File orekitData = new File(args[0]);
        File gfc = new File(args[1]).getAbsoluteFile();
        int n = Integer.parseInt(args[2]);
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(orekitData));
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(gfc.getParentFile()));
        GravityFieldFactory.clearPotentialCoefficientsReaders();
        GravityFieldFactory.addPotentialCoefficientsReader(
                new ICGEMFormatReader(Pattern.quote(gfc.getName()), true));
        NormalizedSphericalHarmonicsProvider p = GravityFieldFactory.getNormalizedProvider(n, n);
        double mu = p.getMu();

        Frame inertial = FramesFactory.getGCRF();
        Frame body = new Frame(inertial, new EraProvider(), "ERA-only body frame", false);
        AbsoluteDate epoch = new AbsoluteDate(2024, 1, 1, 12, 0, 0.0, TimeScalesFactory.getTT());
        Vector3D r0 = new Vector3D(6778136.3, 0.0, 0.0);
        Vector3D v0 = new Vector3D(0.0, 4766.0, 6008.0);
        CartesianOrbit orbit = new CartesianOrbit(
                new TimeStampedPVCoordinates(epoch, new PVCoordinates(r0, v0)), inertial, mu);

        double[][] tol = NumericalPropagator.tolerances(1e-6, orbit, OrbitType.CARTESIAN);
        DormandPrince853Integrator integ = new DormandPrince853Integrator(1e-3, 300.0, tol[0], tol[1]);
        NumericalPropagator prop = new NumericalPropagator(integ);
        prop.setOrbitType(OrbitType.CARTESIAN);
        prop.setMu(mu);
        prop.addForceModel(new NewtonianAttraction(mu));
        prop.addForceModel(new HolmesFeatherstoneAttractionModel(body, p));
        prop.setInitialState(new SpacecraftState(orbit));

        System.out.printf(Locale.ROOT, "# Orekit 12.2, EGM2008 %dx%d (%s), mu %.17e ae %.17e%n",
                n, n, gfc.getName(), mu, p.getAe());
        System.out.printf(Locale.ROOT, "# epoch 2024-01-01T12:00:00 TT, JD_TT %.6f, ERA(epoch) %.17e rad%n",
                2451545.0 + epoch.durationFrom(AbsoluteDate.J2000_EPOCH) / 86400.0,
                2.0 * Math.PI * ((ERA0 + ERA1 * epoch.durationFrom(AbsoluteDate.J2000_EPOCH) / 86400.0) % 1.0));
        System.out.println("# t_s x y z vx vy vz (inertial GCRF axes, m, m/s)");
        for (int k = 0; k <= 144; k++) {
            double t = 600.0 * k;
            SpacecraftState s = prop.propagate(epoch.shiftedBy(t));
            PVCoordinates pv = s.getPVCoordinates(inertial);
            Vector3D r = pv.getPosition();
            Vector3D v = pv.getVelocity();
            System.out.printf(Locale.ROOT, "%.1f %.17e %.17e %.17e %.17e %.17e %.17e%n",
                    t, r.getX(), r.getY(), r.getZ(), v.getX(), v.getY(), v.getZ());
        }
    }
}
