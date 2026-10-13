// SPDX-License-Identifier: AGPL-3.0-only
// Custom Orekit measurement used only by the OrekitTrackingOd oracle driver (not shipped in the crate).
import java.util.Collections;
import org.hipparchus.analysis.differentiation.Gradient;
import org.hipparchus.geometry.euclidean.threed.FieldVector3D;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.orekit.estimation.measurements.AbstractMeasurement;
import org.orekit.estimation.measurements.EstimatedMeasurement;
import org.orekit.estimation.measurements.EstimatedMeasurementBase;
import org.orekit.estimation.measurements.ObservableSatellite;
import org.orekit.propagation.SpacecraftState;
import org.orekit.time.AbsoluteDate;
import org.orekit.utils.TimeStampedFieldPVCoordinates;
import org.orekit.utils.TimeStampedPVCoordinates;

/** Instantaneous geometric range-rate (r - s).v / |r - s| from a FIXED inertial station point
 *  (at rest) to the satellite at the measurement date: NO light time, NO Earth rotation, NO
 *  Doppler/relativistic terms. This is exactly kshana::orbit_determination's RangeRate model.
 *  (Orekit's own RangeRate measurement includes the down/up-link light time; it is not used, so
 *  that the two sides model identical physics and the estimator chain is what is compared.)
 *  Partials by Hipparchus Gradient automatic differentiation. */
public class GeometricRangeRate extends AbstractMeasurement<GeometricRangeRate> {
    private final Vector3D station;

    public GeometricRangeRate(Vector3D stationInertial, AbsoluteDate date, double rangeRate,
                              double sigma, double weight, ObservableSatellite sat) {
        super(date, rangeRate, sigma, weight, Collections.singletonList(sat));
        this.station = stationInertial;
    }

    /** Plain-double model (used for simulation and post-fit residuals). */
    public static double value(Vector3D station, Vector3D p, Vector3D v) {
        Vector3D d = p.subtract(station);
        return d.dotProduct(v) / d.getNorm();
    }

    @Override
    protected EstimatedMeasurementBase<GeometricRangeRate> theoreticalEvaluationWithoutDerivatives(
            int iteration, int evaluation, SpacecraftState[] states) {
        SpacecraftState s = states[0];
        EstimatedMeasurementBase<GeometricRangeRate> est = new EstimatedMeasurementBase<>(
            this, iteration, evaluation, new SpacecraftState[]{s},
            new TimeStampedPVCoordinates[]{s.getPVCoordinates()});
        est.setEstimatedValue(value(station, s.getPVCoordinates().getPosition(),
                                    s.getPVCoordinates().getVelocity()));
        return est;
    }

    @Override
    protected EstimatedMeasurement<GeometricRangeRate> theoreticalEvaluation(
            int iteration, int evaluation, SpacecraftState[] states) {
        SpacecraftState s = states[0];
        TimeStampedFieldPVCoordinates<Gradient> g = getCoordinates(s, 0, 6);
        FieldVector3D<Gradient> p = g.getPosition();
        FieldVector3D<Gradient> v = g.getVelocity();
        Gradient dx = p.getX().subtract(station.getX());
        Gradient dy = p.getY().subtract(station.getY());
        Gradient dz = p.getZ().subtract(station.getZ());
        Gradient rho = dx.multiply(dx).add(dy.multiply(dy)).add(dz.multiply(dz)).sqrt();
        Gradient rr = dx.multiply(v.getX()).add(dy.multiply(v.getY())).add(dz.multiply(v.getZ()))
                        .divide(rho);
        EstimatedMeasurement<GeometricRangeRate> est = new EstimatedMeasurement<>(
            this, iteration, evaluation, new SpacecraftState[]{s},
            new TimeStampedPVCoordinates[]{s.getPVCoordinates()});
        est.setEstimatedValue(rr.getValue());
        est.setStateDerivatives(0, rr.getGradient());
        return est;
    }
}
