// SPDX-License-Identifier: AGPL-3.0-only
// Custom Orekit measurement used only by the OrekitOd oracle driver (not shipped in the crate).
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

/** Instantaneous geometric (Euclidean) range from a FIXED inertial station point to the
 *  satellite at the measurement date — NO light-time, NO Earth rotation. This is exactly
 *  kshana::orbit_determination's range model, so the estimator (BatchLS / Kalman) is fed an
 *  observation model byte-identical to kshana's, isolating the estimator. */
public class GeometricRange extends AbstractMeasurement<GeometricRange> {
    private final Vector3D stationInertial;

    public GeometricRange(Vector3D stationInertial, AbsoluteDate date, double range,
                          double sigma, double weight, ObservableSatellite sat) {
        super(date, range, sigma, weight, Collections.singletonList(sat));
        this.stationInertial = stationInertial;
    }

    @Override
    protected EstimatedMeasurementBase<GeometricRange> theoreticalEvaluationWithoutDerivatives(
            int iteration, int evaluation, SpacecraftState[] states) {
        SpacecraftState state = states[0];
        double rho = state.getPVCoordinates().getPosition().subtract(stationInertial).getNorm();
        EstimatedMeasurementBase<GeometricRange> est = new EstimatedMeasurementBase<>(
            this, iteration, evaluation, new SpacecraftState[]{state},
            new TimeStampedPVCoordinates[]{state.getPVCoordinates()});
        est.setEstimatedValue(rho);
        return est;
    }

    @Override
    protected EstimatedMeasurement<GeometricRange> theoreticalEvaluation(
            int iteration, int evaluation, SpacecraftState[] states) {
        SpacecraftState state = states[0];
        TimeStampedFieldPVCoordinates<Gradient> g = getCoordinates(state, 0, 6);
        FieldVector3D<Gradient> ps = g.getPosition();
        Gradient dx = ps.getX().subtract(stationInertial.getX());
        Gradient dy = ps.getY().subtract(stationInertial.getY());
        Gradient dz = ps.getZ().subtract(stationInertial.getZ());
        Gradient rho = dx.multiply(dx).add(dy.multiply(dy)).add(dz.multiply(dz)).sqrt();
        EstimatedMeasurement<GeometricRange> est = new EstimatedMeasurement<>(
            this, iteration, evaluation, new SpacecraftState[]{state},
            new TimeStampedPVCoordinates[]{state.getPVCoordinates()});
        est.setEstimatedValue(rho.getValue());
        est.setStateDerivatives(0, rho.getGradient());
        return est;
    }
}
