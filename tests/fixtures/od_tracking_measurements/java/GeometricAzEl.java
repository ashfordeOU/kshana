// SPDX-License-Identifier: AGPL-3.0-only
// Custom Orekit measurement used only by the OrekitTrackingOd oracle driver (not shipped in the crate).
import java.util.Collections;
import org.hipparchus.analysis.differentiation.Gradient;
import org.hipparchus.geometry.euclidean.threed.FieldVector3D;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.util.MathUtils;
import org.orekit.estimation.measurements.AbstractMeasurement;
import org.orekit.estimation.measurements.EstimatedMeasurement;
import org.orekit.estimation.measurements.EstimatedMeasurementBase;
import org.orekit.estimation.measurements.ObservableSatellite;
import org.orekit.propagation.SpacecraftState;
import org.orekit.time.AbsoluteDate;
import org.orekit.utils.TimeStampedFieldPVCoordinates;
import org.orekit.utils.TimeStampedPVCoordinates;

/** Instantaneous geometric azimuth/elevation of the satellite seen from a FIXED inertial station
 *  point, in the station's topocentric east-north-up frame with zenith along the station's
 *  geocentric radius (spherical Earth): NO light time, NO aberration, NO refraction. This is
 *  exactly kshana::orbit_determination's AzEl model. The driver cross-checks these values against
 *  Orekit's own TopocentricFrame.getAzimuth/getElevation (OneAxisEllipsoid with zero flattening on
 *  the inertial frame) and records the difference in the fixture header. (Orekit's AngularAzEl
 *  measurement includes the down-link light time; it is not used, so the two sides model identical
 *  physics.) The estimated azimuth is shifted by 2*pi towards the observed value, as Orekit's
 *  AngularAzEl does. Partials by Hipparchus Gradient automatic differentiation. */
public class GeometricAzEl extends AbstractMeasurement<GeometricAzEl> {
    private final Vector3D station;
    private final Vector3D east, north, up;

    public GeometricAzEl(Vector3D stationInertial, AbsoluteDate date, double[] azEl,
                         double[] sigma, double[] weight, ObservableSatellite sat) {
        super(date, azEl, sigma, weight, Collections.singletonList(sat));
        this.station = stationInertial;
        Vector3D[] ax = axes(stationInertial);
        east = ax[0]; north = ax[1]; up = ax[2];
    }

    /** [east, north, up] exactly as kshana's topocentric_axes. */
    public static Vector3D[] axes(Vector3D s) {
        double sn = s.getNorm();
        Vector3D up = new Vector3D(s.getX() / sn, s.getY() / sn, s.getZ() / sn);
        double h = Math.sqrt(up.getX() * up.getX() + up.getY() * up.getY());
        Vector3D east = new Vector3D(-up.getY() / h, up.getX() / h, 0.0);
        Vector3D north = Vector3D.crossProduct(up, east);
        return new Vector3D[]{east, north, up};
    }

    /** Plain-double model [az in [0, 2pi), el]. */
    public static double[] value(Vector3D station, Vector3D p) {
        Vector3D[] ax = axes(station);
        Vector3D d = p.subtract(station);
        double de = d.dotProduct(ax[0]), dn = d.dotProduct(ax[1]), du = d.dotProduct(ax[2]);
        double az = Math.atan2(de, dn);
        if (az < 0.0) az += 2.0 * Math.PI;
        double el = Math.atan2(du, Math.sqrt(de * de + dn * dn));
        return new double[]{az, el};
    }

    private double wrap(double az) {
        return MathUtils.normalizeAngle(az, getObservedValue()[0]) - az;
    }

    @Override
    protected EstimatedMeasurementBase<GeometricAzEl> theoreticalEvaluationWithoutDerivatives(
            int iteration, int evaluation, SpacecraftState[] states) {
        SpacecraftState s = states[0];
        double[] ae = value(station, s.getPVCoordinates().getPosition());
        ae[0] += wrap(ae[0]);
        EstimatedMeasurementBase<GeometricAzEl> est = new EstimatedMeasurementBase<>(
            this, iteration, evaluation, new SpacecraftState[]{s},
            new TimeStampedPVCoordinates[]{s.getPVCoordinates()});
        est.setEstimatedValue(ae);
        return est;
    }

    @Override
    protected EstimatedMeasurement<GeometricAzEl> theoreticalEvaluation(
            int iteration, int evaluation, SpacecraftState[] states) {
        SpacecraftState s = states[0];
        TimeStampedFieldPVCoordinates<Gradient> g = getCoordinates(s, 0, 6);
        FieldVector3D<Gradient> p = g.getPosition();
        Gradient dx = p.getX().subtract(station.getX());
        Gradient dy = p.getY().subtract(station.getY());
        Gradient dz = p.getZ().subtract(station.getZ());
        Gradient de = dx.multiply(east.getX()).add(dy.multiply(east.getY())).add(dz.multiply(east.getZ()));
        Gradient dn = dx.multiply(north.getX()).add(dy.multiply(north.getY())).add(dz.multiply(north.getZ()));
        Gradient du = dx.multiply(up.getX()).add(dy.multiply(up.getY())).add(dz.multiply(up.getZ()));
        Gradient az = de.atan2(dn);
        if (az.getValue() < 0.0) az = az.add(2.0 * Math.PI);
        az = az.add(wrap(az.getValue()));
        Gradient el = du.atan2(de.multiply(de).add(dn.multiply(dn)).sqrt());
        EstimatedMeasurement<GeometricAzEl> est = new EstimatedMeasurement<>(
            this, iteration, evaluation, new SpacecraftState[]{s},
            new TimeStampedPVCoordinates[]{s.getPVCoordinates()});
        est.setEstimatedValue(az.getValue(), el.getValue());
        est.setStateDerivatives(0, az.getGradient(), el.getGradient());
        return est;
    }
}
