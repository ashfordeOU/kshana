// SPDX-License-Identifier: AGPL-3.0-only
//
// PropDriver — Orekit 12.2 NumericalPropagator (DormandPrince853) reference driver for the
// kshana numerical Cowell propagator + six-perturbation force model.
//
// Oracle: Orekit 12.2 (CS GROUP, Apache-2.0) + Hipparchus 3.1, DormandPrince853 integrator.
//
// It reads ONE JSON request per invocation on stdin and prints 25 hourly ECI states (m, m/s)
// to stdout, for the requested force tier. The force set is selected by "tier":
//   T1 two-body            : NewtonianAttraction only
//   T2 +J2                 : + HolmesFeatherstone(2x0) with kshana's J2
//   T3 +full J2..J6 zonal  : + HolmesFeatherstone(6x0) with kshana's J2..J6
//   T4 +Sun/Moon third body: + ThirdBodyAttraction(Sun) + ThirdBodyAttraction(Moon)
//   T5 +cannonball SRP      : + SolarRadiationPressure / IsotropicRadiationSingleCoefficient
//   T6 +exponential drag    : + DragForce / IsotropicDrag against an exponential atmosphere
//
// HONEST SCOPE / why this isolates the integrator + force algebra, not ephemeris fidelity:
//   * GM = 3.986004418e14, Re = 6378137, J2..J6 are pinned to kshana's exact literals.
//   * Integration is performed in a STATIC inertial frame that is an identity transform of
//     GCRF (no precession/nutation/Earth-rotation), matching kshana's plain ECI. The zonal
//     field is axially symmetric (depends only on z and r), so feeding HolmesFeatherstone a
//     static z-aligned body frame reproduces kshana's inertial zonal acceleration exactly.
//   * For T4/T5 the Sun and Moon positions are supplied by a port of kshana's OWN
//     Montenbruck-Gill low-precision analytic series (KshanaEphem below), wired into Orekit
//     through an ExtendedPositionProvider. So Orekit's third-body and SRP forces consume the
//     IDENTICAL perturber positions kshana uses. The comparison therefore isolates the
//     integrator + force-algebra; the absolute ephemeris/density input fidelity stays MODELLED.
//   * For T5 the SRP physics is matched to kshana's cannonball model with a conical
//     umbra+penumbra shadow (Orekit's default), Cr and A/m from the request, P0 = 1361/c and
//     1 AU = 1.495978707e11 m (kshana literals), so the radiation-pressure algebra lines up.
//   * For T6 a single-band exponential atmosphere matching kshana's drag at the reported
//     altitude is supplied so the quadratic-drag + co-rotating-atmosphere algebra is compared;
//     the absolute density model is characterised, not validated (kshana uses a 28-band
//     piecewise-exponential model, this driver a local-fit exponential).
//
// Compile: javac -cp "$OREKIT_CP" PropDriver.java
// Run:     java -cp ".:$OREKIT_CP" PropDriver   (reads JSON on stdin)

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.ode.nonstiff.DormandPrince853Integrator;
import org.orekit.bodies.CelestialBody;
import org.orekit.bodies.OneAxisEllipsoid;
import org.orekit.data.DataContext;
import org.orekit.data.DirectoryCrawler;
import org.orekit.forces.ForceModel;
import org.orekit.forces.drag.DragForce;
import org.orekit.forces.drag.IsotropicDrag;
import org.orekit.forces.gravity.HolmesFeatherstoneAttractionModel;
import org.orekit.forces.gravity.NewtonianAttraction;
import org.orekit.forces.gravity.ThirdBodyAttraction;
import org.orekit.forces.gravity.potential.NormalizedSphericalHarmonicsProvider;
import org.orekit.forces.gravity.potential.TideSystem;
import org.orekit.forces.radiation.IsotropicRadiationSingleCoefficient;
import org.orekit.forces.radiation.SolarRadiationPressure;
import org.orekit.frames.Frame;
import org.orekit.frames.FramesFactory;
import org.orekit.frames.Transform;
import org.orekit.frames.TransformProvider;
import org.orekit.models.earth.atmosphere.Atmosphere;
import org.orekit.orbits.CartesianOrbit;
import org.orekit.orbits.Orbit;
import org.orekit.propagation.SpacecraftState;
import org.orekit.propagation.numerical.NumericalPropagator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.DateComponents;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.time.TimeComponents;
import org.orekit.time.TimeScale;
import org.orekit.time.TimeScalesFactory;
import org.orekit.utils.PVCoordinates;
import org.orekit.utils.TimeStampedPVCoordinates;
import org.hipparchus.CalculusFieldElement;
import org.hipparchus.Field;
import org.hipparchus.geometry.euclidean.threed.FieldVector3D;

public class PropDriver {

    // ---- kshana physical literals (must match src/forces.rs / src/ephem.rs) ----
    static final double MU_EARTH = 3.986004418e14;
    static final double RE_EARTH = 6378137.0;
    static final double[] JN = {1.08262668e-3, -2.5327e-6, -1.6196e-6, -2.2730e-7, 5.4068e-7}; // J2..J6
    static final double MU_SUN = 1.32712440018e20;
    static final double MU_MOON = 4.902800066e12;
    static final double AU_M = 1.495978707e11;
    static final double SOLAR_IRRADIANCE_AU = 1361.0;
    static final double SPEED_OF_LIGHT = 299792458.0;
    static final double SECONDS_PER_DAY = 86400.0;
    static final double JD_J2000 = 2451545.0;
    static final double OBLIQUITY_J2000 = 23.43929111 * Math.PI / 180.0;
    static final double EARTH_ROTATION_RATE = 7.2921151467e-5;

    // ============================================================================
    // kshana Montenbruck-Gill low-precision Sun/Moon series, ported verbatim from
    // src/ephem.rs. t is Julian centuries TT since J2000. Returns m, mean-equator
    // of date (treated as the inertial integration frame, exactly as kshana does).
    // ============================================================================
    static Vector3D kshanaSun(double t) {
        double deg = Math.PI / 180.0;
        double m = (357.5256 + 35999.049 * t) * deg;
        double lambda = (282.94) * deg + m
                + (6892.0 * Math.sin(m) + 72.0 * Math.sin(2.0 * m)) * (deg / 3600.0);
        double r = (149.619 - 2.499 * Math.cos(m) - 0.021 * Math.cos(2.0 * m)) * 1e9;
        double sl = Math.sin(lambda), cl = Math.cos(lambda);
        double se = Math.sin(OBLIQUITY_J2000), ce = Math.cos(OBLIQUITY_J2000);
        return new Vector3D(r * cl, r * sl * ce, r * sl * se);
    }

    static Vector3D kshanaMoon(double t) {
        double deg = Math.PI / 180.0;
        double asec = deg / 3600.0;
        double l0 = (218.31617 + 481267.88088 * t - 1.3972 * t) * deg;
        double l = (134.96292 + 477198.86753 * t) * deg;
        double lp = (357.52543 + 35999.04944 * t) * deg;
        double f = (93.27283 + 483202.01873 * t) * deg;
        double d = (297.85027 + 445267.11135 * t) * deg;
        double dlon = 22640.0 * Math.sin(l) + 769.0 * Math.sin(2.0 * l)
                - 4586.0 * Math.sin(l - 2.0 * d) + 2370.0 * Math.sin(2.0 * d)
                - 668.0 * Math.sin(lp) - 412.0 * Math.sin(2.0 * f)
                - 212.0 * Math.sin(2.0 * l - 2.0 * d) - 206.0 * Math.sin(l + lp - 2.0 * d)
                + 192.0 * Math.sin(l + 2.0 * d) - 165.0 * Math.sin(lp - 2.0 * d)
                + 148.0 * Math.sin(l - lp) - 125.0 * Math.sin(d)
                - 110.0 * Math.sin(l + lp) - 55.0 * Math.sin(2.0 * f - 2.0 * d);
        double lambda = l0 + dlon * asec;
        double beta = 18520.0 * Math.sin(f + (lambda - l0)
                + (412.0 * Math.sin(2.0 * f) + 541.0 * Math.sin(lp)) * asec)
                - 526.0 * Math.sin(f - 2.0 * d) + 44.0 * Math.sin(l + f - 2.0 * d)
                - 31.0 * Math.sin(-l + f - 2.0 * d) - 23.0 * Math.sin(lp + f - 2.0 * d)
                + 11.0 * Math.sin(-2.0 * l + f - 2.0 * d) - 25.0 * Math.sin(-2.0 * l + f)
                + 21.0 * Math.sin(-l + f);
        beta = beta * asec;
        double r = (385000.0 - 20905.0 * Math.cos(l) - 3699.0 * Math.cos(2.0 * d - l)
                - 2956.0 * Math.cos(2.0 * d) - 570.0 * Math.cos(2.0 * l)
                + 246.0 * Math.cos(2.0 * l - 2.0 * d) - 205.0 * Math.cos(lp - 2.0 * d)
                - 171.0 * Math.cos(l + 2.0 * d) - 152.0 * Math.cos(l + lp - 2.0 * d)) * 1e3;
        double sb = Math.sin(beta), cb = Math.cos(beta);
        double sl = Math.sin(lambda), cl = Math.cos(lambda);
        double se = Math.sin(OBLIQUITY_J2000), ce = Math.cos(OBLIQUITY_J2000);
        double xe = r * cb * cl, ye = r * cb * sl, ze = r * sb;
        return new Vector3D(xe, ce * ye - se * ze, se * ye + ce * ze);
    }

    // A CelestialBody (so it plugs into ThirdBodyAttraction and SolarRadiationPressure) that
    // returns the kshana M&G series in the integration (inertial, identity-of-GCRF) frame, at
    // epoch jd_tt = epochJdTt + secondsFromRef/86400. Only the POSITION is load-bearing
    // (third-body and SRP forces use the body position, not its velocity); the PV velocity is
    // supplied via a small finite-difference for interface completeness.
    static class KshanaBody implements CelestialBody {
        final boolean isSun;
        final AbsoluteDate ref;     // the AbsoluteDate corresponding to epochJdTt
        final double epochJdTt;
        final Frame inertial;
        final double gm;
        final String name;
        KshanaBody(boolean isSun, AbsoluteDate ref, double epochJdTt, Frame inertial) {
            this.isSun = isSun; this.ref = ref; this.epochJdTt = epochJdTt; this.inertial = inertial;
            this.gm = isSun ? MU_SUN : MU_MOON;
            this.name = isSun ? "Sun" : "Moon";
        }
        double tjc(AbsoluteDate date) {
            double dt = date.durationFrom(ref);              // seconds from reference epoch
            double jdTt = epochJdTt + dt / SECONDS_PER_DAY;  // kshana's advanced epoch
            return (jdTt - JD_J2000) / 36525.0;
        }
        @Override
        public Vector3D getPosition(AbsoluteDate date, Frame frame) {
            double t = tjc(date);
            Vector3D pInertial = isSun ? kshanaSun(t) : kshanaMoon(t);
            if (frame == inertial) return pInertial;
            Transform tr = inertial.getTransformTo(frame, date);
            return tr.transformPosition(pInertial);
        }
        @Override
        public <T extends CalculusFieldElement<T>> FieldVector3D<T> getPosition(
                FieldAbsoluteDate<T> date, Frame frame) {
            AbsoluteDate d = date.toAbsoluteDate();
            Vector3D p = getPosition(d, frame);
            Field<T> fld = date.getField();
            return new FieldVector3D<>(fld.getZero().add(p.getX()),
                                       fld.getZero().add(p.getY()),
                                       fld.getZero().add(p.getZ()));
        }
        @Override
        public TimeStampedPVCoordinates getPVCoordinates(AbsoluteDate date, Frame frame) {
            double h = 1.0; // s, central difference for velocity (not load-bearing)
            Vector3D pm = getPosition(date.shiftedBy(-h), frame);
            Vector3D pp = getPosition(date.shiftedBy(h), frame);
            Vector3D p = getPosition(date, frame);
            Vector3D vel = pp.subtract(pm).scalarMultiply(1.0 / (2.0 * h));
            return new TimeStampedPVCoordinates(date, p, vel, Vector3D.ZERO);
        }
        @Override
        public <T extends CalculusFieldElement<T>>
        org.orekit.utils.TimeStampedFieldPVCoordinates<T> getPVCoordinates(
                FieldAbsoluteDate<T> date, Frame frame) {
            TimeStampedPVCoordinates pv = getPVCoordinates(date.toAbsoluteDate(), frame);
            Field<T> fld = date.getField();
            FieldVector3D<T> p = new FieldVector3D<>(
                    fld.getZero().add(pv.getPosition().getX()),
                    fld.getZero().add(pv.getPosition().getY()),
                    fld.getZero().add(pv.getPosition().getZ()));
            FieldVector3D<T> v = new FieldVector3D<>(
                    fld.getZero().add(pv.getVelocity().getX()),
                    fld.getZero().add(pv.getVelocity().getY()),
                    fld.getZero().add(pv.getVelocity().getZ()));
            return new org.orekit.utils.TimeStampedFieldPVCoordinates<>(date, p, v,
                    FieldVector3D.getZero(fld));
        }
        @Override public String getName() { return name; }
        @Override public double getGM() { return gm; }
        @Override public Frame getInertiallyOrientedFrame() { return inertial; }
        @Override public Frame getBodyOrientedFrame() { return inertial; }
    }

    // A static inertial frame: identity transform of GCRF (no precession/nutation/rotation),
    // matching kshana's plain ECI. Used both as the integration frame and the gravity body
    // frame (legitimate because the zonal field is axially symmetric about z).
    static class IdentityProvider implements TransformProvider {
        @Override public Transform getTransform(AbsoluteDate date) {
            return Transform.IDENTITY;
        }
        @Override public <T extends CalculusFieldElement<T>>
        org.orekit.frames.FieldTransform<T> getTransform(FieldAbsoluteDate<T> date) {
            return org.orekit.frames.FieldTransform.getIdentity(date.getField());
        }
    }

    // Single-band exponential atmosphere matching kshana's drag at the seed altitude:
    // rho(h) = rho0 * exp(-(h - h0)/H), with a co-rotating wind (omega_earth about z),
    // mirroring src/forces.rs drag_accel which uses v_rel = v - omega x r.
    static class ExpAtmosphere implements Atmosphere {
        final Frame inertial;
        final double rho0, h0, H; // h0,H in metres
        final OneAxisEllipsoid earthShape; // only for getFrame contract; density is spherical
        ExpAtmosphere(Frame inertial, double rho0, double h0, double H, OneAxisEllipsoid shape) {
            this.inertial = inertial; this.rho0 = rho0; this.h0 = h0; this.H = H; this.earthShape = shape;
        }
        @Override public Frame getFrame() { return inertial; }
        @Override public double getDensity(AbsoluteDate date, Vector3D position, Frame frame) {
            Vector3D r = (frame == inertial) ? position
                    : frame.getTransformTo(inertial, date).transformPosition(position);
            double alt = r.getNorm() - RE_EARTH; // spherical altitude, exactly as kshana
            return rho0 * Math.exp(-(alt - h0) / H);
        }
        @Override public Vector3D getVelocity(AbsoluteDate date, Vector3D position, Frame frame) {
            Vector3D r = (frame == inertial) ? position
                    : frame.getTransformTo(inertial, date).transformPosition(position);
            // co-rotating atmosphere velocity = omega_z x r = (-w*ry, w*rx, 0)
            return new Vector3D(-EARTH_ROTATION_RATE * r.getY(),
                                 EARTH_ROTATION_RATE * r.getX(), 0.0);
        }
        @Override public <T extends CalculusFieldElement<T>> T getDensity(
                FieldAbsoluteDate<T> date, FieldVector3D<T> position, Frame frame) {
            T altT = position.getNorm().subtract(RE_EARTH);
            return altT.subtract(h0).divide(-H).exp().multiply(rho0);
        }
        @Override public <T extends CalculusFieldElement<T>> FieldVector3D<T> getVelocity(
                FieldAbsoluteDate<T> date, FieldVector3D<T> position, Frame frame) {
            T w = date.getField().getZero().add(EARTH_ROTATION_RATE);
            return new FieldVector3D<>(position.getY().multiply(w).negate(),
                                       position.getX().multiply(w),
                                       date.getField().getZero());
        }
    }

    public static void main(String[] args) throws Exception {
        // Register Orekit data (UTC/TT, but we drive ephemerides ourselves for T4/T5).
        File orekitData = new File(System.getenv("OREKIT_DATA"));
        DataContext.getDefault().getDataProvidersManager()
                .addProvider(new DirectoryCrawler(orekitData));

        // ---- read the JSON request from stdin ----
        StringBuilder sb = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in))) {
            String ln;
            while ((ln = br.readLine()) != null) sb.append(ln).append('\n');
        }
        String json = sb.toString();

        double[] r0 = jsonVec(json, "r0");
        double[] v0 = jsonVec(json, "v0");
        double epochJdTt = jsonNum(json, "epoch_jd_tt");
        String tier = jsonStr(json, "tier");
        double cr = jsonNum(json, "cr");
        double areaOverMass = jsonNum(json, "area_over_mass");
        double cdAreaOverMass = jsonNum(json, "cd_area_over_mass");
        double dragRho0 = jsonNumOpt(json, "drag_rho0", 0.0);
        double dragH0 = jsonNumOpt(json, "drag_h0", 0.0);
        double dragScale = jsonNumOpt(json, "drag_scale", 1.0);
        double arcSeconds = jsonNum(json, "arc_seconds");
        int nEpochs = (int) jsonNum(json, "n_epochs");
        double tol = jsonNum(json, "tol");

        // ---- inertial integration frame = identity transform of GCRF ----
        Frame gcrf = FramesFactory.getGCRF();
        Frame inertial = new Frame(gcrf, new IdentityProvider(), "KSHANA_ECI", true);

        // Reference epoch (the absolute date at integration t = 0). We use the TT scale and
        // convert kshana's epoch_jd_tt to a calendar date; the absolute instant is internally
        // consistent (the ephemerides are driven off durationFrom(ref) + epoch_jd_tt).
        TimeScale tt = TimeScalesFactory.getTT();
        AbsoluteDate epoch = jdTtToDate(epochJdTt, tt);

        // ---- initial orbit ----
        PVCoordinates pv0 = new PVCoordinates(new Vector3D(r0[0], r0[1], r0[2]),
                                              new Vector3D(v0[0], v0[1], v0[2]));
        Orbit initialOrbit = new CartesianOrbit(pv0, inertial, epoch, MU_EARTH);
        SpacecraftState initialState = new SpacecraftState(initialOrbit);

        // ---- DormandPrince853 adaptive integrator (Orekit reference) ----
        double minStep = 1.0e-6, maxStep = 600.0;
        double[][] tolerances = NumericalPropagator.tolerances(tol, initialOrbit, initialOrbit.getType());
        DormandPrince853Integrator integ =
                new DormandPrince853Integrator(minStep, maxStep, tolerances[0], tolerances[1]);
        NumericalPropagator prop = new NumericalPropagator(integ);
        prop.setOrbitType(initialOrbit.getType());
        prop.setInitialState(initialState);

        // ---- force model assembly per tier ----
        List<ForceModel> forces = new ArrayList<>();
        // Two-body central attraction is added by NumericalPropagator from the orbit's mu by
        // default; add it explicitly so the set is self-documenting and uniform across tiers.
        forces.add(new NewtonianAttraction(MU_EARTH));

        boolean addJ2 = tier.equals("T2");
        boolean addZonal = tier.equals("T3") || tier.equals("T4") || tier.equals("T5") || tier.equals("T6");
        boolean addThird = tier.equals("T4") || tier.equals("T5") || tier.equals("T6");
        boolean addSrp = tier.equals("T5") || tier.equals("T6");
        boolean addDrag = tier.equals("T6");

        if (addJ2 || addZonal) {
            int degree = addJ2 ? 2 : 6;
            NormalizedSphericalHarmonicsProvider shp = zonalUnnormalizedToNormalized(degree);
            forces.add(new HolmesFeatherstoneAttractionModel(inertial, shp));
        }

        KshanaBody kSun = new KshanaBody(true, epoch, epochJdTt, inertial);
        KshanaBody kMoon = new KshanaBody(false, epoch, epochJdTt, inertial);
        if (addThird) {
            forces.add(new ThirdBodyAttraction(kSun));
            forces.add(new ThirdBodyAttraction(kMoon));
        }
        if (addSrp) {
            // Match kshana's cannonball SRP: P0 = 1361/c at 1 AU = 1.495978707e11 m, conical
            // umbra+penumbra shadow (Orekit default), Cr & A/m from the request.
            IsotropicRadiationSingleCoefficient rad =
                    new IsotropicRadiationSingleCoefficient(areaOverMass, cr); // area is A/m here (mass=1)
            OneAxisEllipsoid earthShape =
                    new OneAxisEllipsoid(RE_EARTH, 0.0 /*spherical, like kshana*/, inertial);
            double p0 = SOLAR_IRRADIANCE_AU / SPEED_OF_LIGHT; // N/m^2 at 1 AU = kshana SRP_PRESSURE_AU
            SolarRadiationPressure srp = new SolarRadiationPressure(AU_M, p0, kSun, earthShape, rad);
            forces.add(srp);
        }
        if (addDrag) {
            OneAxisEllipsoid earthShape =
                    new OneAxisEllipsoid(RE_EARTH, 0.0, inertial);
            ExpAtmosphere atm = new ExpAtmosphere(inertial, dragRho0, dragH0, dragScale, earthShape);
            // IsotropicDrag with mass = 1 kg and cross-section = Cd*A/m (so Cd*A/m / mass = the
            // ballistic term kshana uses); pass Cd = 1 so the product is exactly cd_area_over_mass.
            IsotropicDrag drag = new IsotropicDrag(cdAreaOverMass, 1.0);
            forces.add(new DragForce(atm, drag));
        }

        for (ForceModel fm : forces) prop.addForceModel(fm);
        // Mass = 1 kg so per-mass force terms (SRP, drag) use A/m and Cd*A/m directly.
        prop.setInitialState(new SpacecraftState(initialOrbit, 1.0));

        // ---- propagate to each hourly epoch, print ECI state in the integration frame ----
        double dt = arcSeconds / (nEpochs - 1);
        StringBuilder out = new StringBuilder();
        for (int k = 0; k < nEpochs; k++) {
            AbsoluteDate target = epoch.shiftedBy(k * dt);
            SpacecraftState st = prop.propagate(target);
            PVCoordinates pv = st.getPVCoordinates(inertial);
            Vector3D r = pv.getPosition();
            Vector3D v = pv.getVelocity();
            out.append(String.format(Locale.ROOT,
                    "STATE %s %d %.6f %.9e,%.9e,%.9e %.9e,%.9e,%.9e%n",
                    tier, k, k * dt,
                    r.getX(), r.getY(), r.getZ(),
                    v.getX(), v.getY(), v.getZ()));
        }
        System.out.print(out);
    }

    // Build a normalized SH provider carrying ONLY the zonal Jn (n=2..degree), with kshana's
    // GM/Re. Orekit stores normalized coefficients; convert each unnormalized zonal:
    //   Cbar_{n,0} = C_{n,0} / N_n,  with N_n = sqrt(2n+1) for m=0, and C_{n,0} = -Jn.
    static NormalizedSphericalHarmonicsProvider zonalUnnormalizedToNormalized(int degree) {
        double[][] cbar = new double[degree + 1][];
        double[][] sbar = new double[degree + 1][];
        for (int n = 0; n <= degree; n++) {
            cbar[n] = new double[1];
            sbar[n] = new double[1];
        }
        for (int n = 2; n <= degree; n++) {
            double j = JN[n - 2];
            double cn0 = -j;                       // unnormalized C_{n,0} = -J_n
            double nn = Math.sqrt(2.0 * n + 1.0);  // m=0 normalization factor
            cbar[n][0] = cn0 / nn;
        }
        return new ConstantZonalProvider(MU_EARTH, RE_EARTH, degree, cbar, sbar);
    }

    // A minimal constant NormalizedSphericalHarmonicsProvider for a zero-tide zonal field.
    static class ConstantZonalProvider implements NormalizedSphericalHarmonicsProvider {
        final double mu, ae; final int degree; final double[][] cbar, sbar;
        ConstantZonalProvider(double mu, double ae, int degree, double[][] cbar, double[][] sbar) {
            this.mu = mu; this.ae = ae; this.degree = degree; this.cbar = cbar; this.sbar = sbar;
        }
        @Override public double getMu() { return mu; }
        @Override public double getAe() { return ae; }
        @Override public AbsoluteDate getReferenceDate() { return AbsoluteDate.J2000_EPOCH; }
        @Override public int getMaxDegree() { return degree; }
        @Override public int getMaxOrder() { return 0; }
        @Override public TideSystem getTideSystem() { return TideSystem.ZERO_TIDE; }
        @Override public NormalizedSphericalHarmonics onDate(AbsoluteDate date) {
            return new NormalizedSphericalHarmonics() {
                @Override public double getNormalizedCnm(int n, int m) {
                    return (m == 0 && n <= degree) ? cbar[n][0] : 0.0;
                }
                @Override public double getNormalizedSnm(int n, int m) { return 0.0; }
                @Override public AbsoluteDate getDate() { return date; }
            };
        }
    }

    // kshana epoch_jd_tt (Julian Date, TT) -> Orekit AbsoluteDate on the TT scale.
    static AbsoluteDate jdTtToDate(double jdTt, TimeScale tt) {
        // J2000.0 = JD 2451545.0 TT = 2000-01-01T12:00:00 TT.
        double secondsFromJ2000 = (jdTt - JD_J2000) * SECONDS_PER_DAY;
        AbsoluteDate j2000Tt = new AbsoluteDate(new DateComponents(2000, 1, 1),
                new TimeComponents(12, 0, 0.0), tt);
        return j2000Tt.shiftedBy(secondsFromJ2000);
    }

    // ---- tiny dependency-free JSON scalar/array readers (flat object only) ----
    static double jsonNum(String json, String key) {
        Double d = findNum(json, key);
        if (d == null) throw new RuntimeException("missing JSON key: " + key);
        return d;
    }
    static double jsonNumOpt(String json, String key, double dflt) {
        Double d = findNum(json, key);
        return d == null ? dflt : d;
    }
    static Double findNum(String json, String key) {
        String pat = "\"" + key + "\"";
        int i = json.indexOf(pat);
        if (i < 0) return null;
        int c = json.indexOf(':', i + pat.length());
        int j = c + 1;
        while (j < json.length() && (json.charAt(j) == ' ' || json.charAt(j) == '\t')) j++;
        int s = j;
        while (j < json.length() && "+-0123456789.eE".indexOf(json.charAt(j)) >= 0) j++;
        return Double.parseDouble(json.substring(s, j));
    }
    static String jsonStr(String json, String key) {
        String pat = "\"" + key + "\"";
        int i = json.indexOf(pat);
        int c = json.indexOf(':', i + pat.length());
        int q1 = json.indexOf('"', c + 1);
        int q2 = json.indexOf('"', q1 + 1);
        return json.substring(q1 + 1, q2);
    }
    static double[] jsonVec(String json, String key) {
        String pat = "\"" + key + "\"";
        int i = json.indexOf(pat);
        int lb = json.indexOf('[', i);
        int rb = json.indexOf(']', lb);
        String[] parts = json.substring(lb + 1, rb).split(",");
        double[] v = new double[parts.length];
        for (int k = 0; k < parts.length; k++) v[k] = Double.parseDouble(parts[k].trim());
        return v;
    }
}
