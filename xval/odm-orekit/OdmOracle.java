// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle driver for the CCSDS Orbit Data Messages (OPM, OMM, OCM) of
// CCSDS 502.0-B-3, run against Orekit 13.1.8 + Hipparchus 4.0.3 (Apache-2.0).
// See PREREGISTRATION.md (legs L1, L2) and FORMAT.md (dump format).
//
// usage: OdmOracle <dir> <dump.txt> <rewrite_dir>
//   Parses every <id>.kvn / <id>.xml in <dir> (sorted by name) with
//   ParserBuilder().buildOpmParser() / buildOmmParser() / buildOcmParser(),
//   appends one FORMAT.md block per file to dump.txt (values read from Orekit's
//   parsed objects, converted from SI to the message units), then writes the
//   parsed message back out with Orekit's own writer (WriterBuilder) as
//   <rewrite_dir>/<id>.kvn or .xml, in the notation it was read from.
//
// Anything Orekit refuses is reported on stderr as a line starting with
// "FINDING:" and in the dump as parse_error= / write_error=; the driver carries on.
//
// Harness accommodation, as in the ADM driver: the oracle data directory holds
// only tai-utc.dat; a stub Earth (GCRF axes, EIGEN-5C mu, no ephemeris) is
// registered so that CENTER_NAME = EARTH resolves by name. Orekit's OCM parser also builds
// ICRF as the default trajectory frame before reading TRAJ_REF_FRAME, which needs the solar
// system barycenter; a stub barycenter (same stub, no ephemeris) is registered for that. No
// value compared here goes through either stub: any call needing an ephemeris throws.

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hipparchus.CalculusFieldElement;
import org.hipparchus.geometry.euclidean.threed.FieldVector3D;
import org.hipparchus.geometry.euclidean.threed.Vector3D;
import org.hipparchus.linear.RealMatrix;
import org.orekit.bodies.CelestialBody;
import org.orekit.bodies.CelestialBodyFactory;
import org.orekit.bodies.LazyLoadedCelestialBodies;
import org.orekit.data.DataContext;
import org.orekit.data.DataSource;
import org.orekit.data.DirectoryCrawler;
import org.orekit.files.ccsds.definitions.BodyFacade;
import org.orekit.files.ccsds.definitions.FrameFacade;
import org.orekit.files.ccsds.definitions.TimeSystem;
import org.orekit.files.ccsds.definitions.Units;
import org.orekit.files.ccsds.ndm.ParserBuilder;
import org.orekit.files.ccsds.ndm.WriterBuilder;
import org.orekit.files.ccsds.ndm.odm.CartesianCovariance;
import org.orekit.files.ccsds.ndm.odm.KeplerianElements;
import org.orekit.files.ccsds.ndm.odm.OdmCommonMetadata;
import org.orekit.files.ccsds.ndm.odm.SpacecraftParameters;
import org.orekit.files.ccsds.ndm.odm.StateVector;
import org.orekit.files.ccsds.ndm.odm.UserDefined;
import org.orekit.files.ccsds.ndm.odm.ocm.ManeuverFieldType;
import org.orekit.files.ccsds.ndm.odm.ocm.Ocm;
import org.orekit.files.ccsds.ndm.odm.ocm.OcmData;
import org.orekit.files.ccsds.ndm.odm.ocm.OcmMetadata;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitCovariance;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitCovarianceHistory;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitCovarianceHistoryMetadata;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitManeuver;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitManeuverHistory;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitManeuverHistoryMetadata;
import org.orekit.files.ccsds.ndm.odm.ocm.OrbitPhysicalProperties;
import org.orekit.files.ccsds.ndm.odm.ocm.TrajectoryState;
import org.orekit.files.ccsds.ndm.odm.ocm.TrajectoryStateHistory;
import org.orekit.files.ccsds.ndm.odm.ocm.TrajectoryStateHistoryMetadata;
import org.orekit.files.ccsds.ndm.odm.omm.Omm;
import org.orekit.files.ccsds.ndm.odm.omm.OmmData;
import org.orekit.files.ccsds.ndm.odm.omm.OmmMetadata;
import org.orekit.files.ccsds.ndm.odm.omm.OmmTle;
import org.orekit.files.ccsds.ndm.odm.opm.Maneuver;
import org.orekit.files.ccsds.ndm.odm.opm.Opm;
import org.orekit.files.ccsds.ndm.odm.opm.OpmData;
import org.orekit.files.ccsds.section.Header;
import org.orekit.files.ccsds.utils.generation.Generator;
import org.orekit.files.ccsds.utils.generation.KvnGenerator;
import org.orekit.files.ccsds.utils.generation.XmlGenerator;
import org.orekit.frames.Frame;
import org.orekit.orbits.PositionAngleType;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.time.TimeScale;
import org.orekit.utils.AccurateFormatter;
import org.orekit.utils.Constants;
import org.orekit.utils.IERSConventions;
import org.orekit.utils.TimeStampedPVCoordinates;
import org.orekit.utils.units.Unit;

public class OdmOracle {

    private static final Unit KM = Unit.KILOMETRE;
    private static final Unit DEG = Unit.DEGREE;

    /** Time scale of the message being dumped. */
    private static TimeScale scale;

    private static org.orekit.files.ccsds.utils.ContextBinding context(final TimeSystem ts) {
        return new org.orekit.files.ccsds.utils.ContextBinding(
            () -> IERSConventions.IERS_2010, () -> true, DataContext::getDefault,
            () -> org.orekit.files.ccsds.ndm.ParsedUnitsBehavior.STRICT_COMPLIANCE,
            () -> null, () -> ts, () -> 0.0, () -> 1.0);
    }

    private static String date(final AbsoluteDate d) {
        return d.getComponents(scale).toStringWithoutUtcOffset(60, 9);
    }

    private static String num(final double v) {
        return Double.toString(v);
    }

    private static String si(final double v, final Unit u) {
        return Double.toString(u.fromSI(v));
    }

    private static String oneLine(final Throwable t) {
        String m = t.getMessage();
        if (m == null) {
            m = t.getClass().getName();
        }
        return m.replace('\n', ' ').replace('\r', ' ');
    }

    private static String frameName(final FrameFacade f) {
        return f == null ? null : f.getName();
    }

    private static String bodyName(final BodyFacade b) {
        return b == null ? null : b.getName();
    }

    /** Dump helper: prints key=value when the value is set. */
    private static final class Out {
        final PrintStream p;
        Out(final PrintStream p) {
            this.p = p;
        }
        void block(final String name, final List<String> comments) {
            p.println("block=" + name);
            if (comments != null) {
                for (final String c : comments) {
                    p.println("comment=" + c);
                }
            }
        }
        void s(final String key, final String value) {
            if (value != null) {
                p.println(key + "=" + value);
            }
        }
        void d(final String key, final AbsoluteDate value) {
            if (value != null) {
                p.println(key + "=" + date(value));
            }
        }
        void x(final String key, final double value, final Unit unit) {
            if (!Double.isNaN(value)) {
                p.println(key + "=" + si(value, unit));
            }
        }
        void i(final String key, final int value) {
            p.println(key + "=" + value);
        }
    }

    private static void header(final Out o, final Header h) {
        o.s("version", Double.toString(h.getFormatVersion()));
        o.block("header", h.getComments());
        o.s("CLASSIFICATION", h.getClassification());
        scale = TimeSystem.UTC.getConverter(context(TimeSystem.UTC)).getTimeScale();
        o.d("CREATION_DATE", h.getCreationDate());
        o.s("ORIGINATOR", h.getOriginator());
        o.s("MESSAGE_ID", h.getMessageId());
    }

    private static void commonMeta(final Out o, final OdmCommonMetadata md) {
        o.block("meta", md.getComments());
        o.s("OBJECT_NAME", md.getObjectName());
        o.s("OBJECT_ID", md.getObjectID());
        o.s("CENTER_NAME", bodyName(md.getCenter()));
        o.s("REF_FRAME", frameName(md.getReferenceFrame()));
        o.d("REF_FRAME_EPOCH", md.getFrameEpoch());
        o.s("TIME_SYSTEM", md.getTimeSystem().name());
    }

    private static void spacecraft(final Out o, final SpacecraftParameters sp) {
        if (sp == null) {
            return;
        }
        o.block("spacecraft", sp.getComments());
        o.x("MASS", sp.getMass(), Unit.KILOGRAM);
        o.x("SOLAR_RAD_AREA", sp.getSolarRadArea(), Units.M2);
        o.x("SOLAR_RAD_COEFF", sp.getSolarRadCoeff(), Unit.ONE);
        o.x("DRAG_AREA", sp.getDragArea(), Units.M2);
        o.x("DRAG_COEFF", sp.getDragCoeff(), Unit.ONE);
    }

    private static final String[] COV_TERMS = {
        "CX_X", "CY_X", "CY_Y", "CZ_X", "CZ_Y", "CZ_Z",
        "CX_DOT_X", "CX_DOT_Y", "CX_DOT_Z", "CX_DOT_X_DOT",
        "CY_DOT_X", "CY_DOT_Y", "CY_DOT_Z", "CY_DOT_X_DOT", "CY_DOT_Y_DOT",
        "CZ_DOT_X", "CZ_DOT_Y", "CZ_DOT_Z", "CZ_DOT_X_DOT", "CZ_DOT_Y_DOT", "CZ_DOT_Z_DOT"
    };

    private static void covariance(final Out o, final CartesianCovariance cov) {
        if (cov == null) {
            return;
        }
        o.block("cov", cov.getComments());
        o.s("COV_REF_FRAME", frameName(cov.getReferenceFrame()));
        final RealMatrix m = cov.getCovarianceMatrix();
        int k = 0;
        for (int r = 0; r < 6; ++r) {
            for (int c = 0; c <= r; ++c) {
                // m^2, m^2/s, m^2/s^2 to km^2, km^2/s, km^2/s^2: the same factor 1e-6
                o.x(COV_TERMS[k++], m.getEntry(r, c), Units.KM2);
            }
        }
    }

    private static void user(final Out o, final UserDefined u) {
        if (u == null) {
            return;
        }
        o.block("user", u.getComments());
        for (final Map.Entry<String, String> e : u.getParameters().entrySet()) {
            o.s(e.getKey(), e.getValue());
        }
    }

    private static void dumpOpm(final Out o, final Opm opm) {
        header(o, opm.getHeader());
        final OdmCommonMetadata md = opm.getMetadata();
        scale = md.getTimeSystem().getConverter(context(md.getTimeSystem())).getTimeScale();
        commonMeta(o, md);
        final OpmData data = opm.getData();
        final StateVector sv = data.getStateVectorBlock();
        o.block("state", sv.getComments());
        o.d("EPOCH", sv.getEpoch());
        final TimeStampedPVCoordinates pv = sv.toTimeStampedPVCoordinates();
        o.x("X", pv.getPosition().getX(), KM);
        o.x("Y", pv.getPosition().getY(), KM);
        o.x("Z", pv.getPosition().getZ(), KM);
        o.x("X_DOT", pv.getVelocity().getX(), Units.KM_PER_S);
        o.x("Y_DOT", pv.getVelocity().getY(), Units.KM_PER_S);
        o.x("Z_DOT", pv.getVelocity().getZ(), Units.KM_PER_S);
        final KeplerianElements ke = data.getKeplerianElementsBlock();
        if (ke != null) {
            o.block("kepler", ke.getComments());
            o.x("SEMI_MAJOR_AXIS", ke.getA(), KM);
            o.x("ECCENTRICITY", ke.getE(), Unit.ONE);
            o.x("INCLINATION", ke.getI(), DEG);
            o.x("RA_OF_ASC_NODE", ke.getRaan(), DEG);
            o.x("ARG_OF_PERICENTER", ke.getPa(), DEG);
            o.x(ke.getAnomalyType() == PositionAngleType.TRUE ? "TRUE_ANOMALY" : "MEAN_ANOMALY",
                ke.getAnomaly(), DEG);
            o.x("GM", ke.getMu(), Units.KM3_PER_S2);
        }
        spacecraft(o, data.getSpacecraftParametersBlock());
        covariance(o, data.getCovarianceBlock());
        for (final Maneuver m : data.getManeuvers()) {
            o.block("man", m.getComments());
            o.d("MAN_EPOCH_IGNITION", m.getEpochIgnition());
            o.x("MAN_DURATION", m.getDuration(), Unit.SECOND);
            o.x("MAN_DELTA_MASS", m.getDeltaMass(), Unit.KILOGRAM);
            o.s("MAN_REF_FRAME", frameName(m.getReferenceFrame()));
            final Vector3D dv = m.getDV();
            o.x("MAN_DV_1", dv.getX(), Units.KM_PER_S);
            o.x("MAN_DV_2", dv.getY(), Units.KM_PER_S);
            o.x("MAN_DV_3", dv.getZ(), Units.KM_PER_S);
        }
        user(o, data.getUserDefinedBlock());
    }

    private static void dumpOmm(final Out o, final Omm omm) {
        header(o, omm.getHeader());
        final OmmMetadata md = omm.getMetadata();
        scale = md.getTimeSystem().getConverter(context(md.getTimeSystem())).getTimeScale();
        commonMeta(o, md);
        o.s("MEAN_ELEMENT_THEORY", md.getMeanElementTheory());
        final OmmData data = omm.getData();
        final KeplerianElements ke = data.getKeplerianElementsBlock();
        o.block("mean", ke.getComments());
        o.d("EPOCH", ke.getEpoch());
        o.x("SEMI_MAJOR_AXIS", ke.getA(), KM);
        o.x("MEAN_MOTION", ke.getMeanMotion(), Units.REV_PER_DAY);
        o.x("ECCENTRICITY", ke.getE(), Unit.ONE);
        o.x("INCLINATION", ke.getI(), DEG);
        o.x("RA_OF_ASC_NODE", ke.getRaan(), DEG);
        o.x("ARG_OF_PERICENTER", ke.getPa(), DEG);
        o.x("MEAN_ANOMALY", ke.getAnomaly(), DEG);
        o.x("GM", ke.getMu(), Units.KM3_PER_S2);
        spacecraft(o, data.getSpacecraftParametersBlock());
        final OmmTle tle = data.getTLEBlock();
        if (tle != null) {
            o.block("tle", tle.getComments());
            o.i("EPHEMERIS_TYPE", tle.getEphemerisType());
            o.s("CLASSIFICATION_TYPE", Character.toString(tle.getClassificationType()));
            o.i("NORAD_CAT_ID", tle.getNoradID());
            o.i("ELEMENT_SET_NO", tle.getElementSetNumber());
            o.i("REV_AT_EPOCH", tle.getRevAtEpoch());
            o.x("BSTAR", tle.getBStar(), Units.ONE_PER_ER);
            o.x("BTERM", tle.getBTerm(), Units.M2_PER_KG);
            o.x("MEAN_MOTION_DOT", tle.getMeanMotionDot(), Units.REV_PER_DAY2_SCALED);
            o.x("MEAN_MOTION_DDOT", tle.getMeanMotionDotDot(), Units.REV_PER_DAY3_SCALED);
            o.x("AGOM", tle.getAGoM(), Units.M2_PER_KG);
        }
        covariance(o, data.getCovarianceBlock());
        user(o, data.getUserDefinedBlock());
    }

    private static <T> List<T> orEmpty(final List<T> l) {
        return l == null ? new ArrayList<>() : l;
    }

    private static String join(final List<?> l) {
        if (l == null || l.isEmpty()) {
            return null;
        }
        final StringBuilder sb = new StringBuilder();
        for (final Object x : l) {
            if (sb.length() > 0) {
                sb.append(',');
            }
            sb.append(x.toString());
        }
        return sb.toString();
    }

    private static void dumpOcm(final Out o, final Ocm ocm) {
        header(o, ocm.getHeader());
        final OcmMetadata md = ocm.getMetadata();
        scale = md.getTimeSystem().getConverter(context(md.getTimeSystem())).getTimeScale();
        o.block("meta", md.getComments());
        o.s("OBJECT_NAME", md.getObjectName());
        o.s("INTERNATIONAL_DESIGNATOR", md.getInternationalDesignator());
        o.s("CATALOG_NAME", md.getCatalogName());
        o.s("OBJECT_DESIGNATOR", md.getObjectDesignator());
        o.s("ALTERNATE_NAMES", join(md.getAlternateNames()));
        o.s("ORIGINATOR_POC", md.getOriginatorPOC());
        o.s("ORIGINATOR_POSITION", md.getOriginatorPosition());
        o.s("ORIGINATOR_PHONE", md.getOriginatorPhone());
        o.s("ORIGINATOR_EMAIL", md.getOriginatorEmail());
        o.s("ORIGINATOR_ADDRESS", md.getOriginatorAddress());
        o.s("TECH_ORG", md.getTechOrg());
        o.s("PREVIOUS_MESSAGE_ID", md.getPreviousMessageID());
        o.s("NEXT_MESSAGE_ID", md.getNextMessageID());
        o.s("OPERATOR", md.getOperator());
        o.s("OWNER", md.getOwner());
        o.s("COUNTRY", md.getCountry());
        o.s("CONSTELLATION", md.getConstellation());
        o.s("TIME_SYSTEM", md.getTimeSystem().name());
        o.d("EPOCH_TZERO", md.getEpochT0());
        o.x("SCLK_OFFSET_AT_EPOCH", md.getSclkOffsetAtEpoch(), Unit.SECOND);
        o.x("SCLK_SEC_PER_SI_SEC", md.getSclkSecPerSISec(), Unit.ONE);
        o.d("START_TIME", md.getStartTime());
        o.d("STOP_TIME", md.getStopTime());
        final OcmData data = ocm.getData();
        for (final TrajectoryStateHistory h : orEmpty(data.getTrajectoryBlocks())) {
            final TrajectoryStateHistoryMetadata tm = h.getMetadata();
            o.block("traj", tm.getComments());
            o.s("TRAJ_ID", tm.getTrajID());
            o.s("TRAJ_PREV_ID", tm.getTrajPrevID());
            o.s("TRAJ_NEXT_ID", tm.getTrajNextID());
            o.s("TRAJ_BASIS", tm.getTrajBasis());
            o.s("CENTER_NAME", bodyName(tm.getCenter()));
            o.s("TRAJ_REF_FRAME", frameName(tm.getTrajReferenceFrame()));
            o.d("USEABLE_START_TIME", tm.getUseableStartTime());
            o.d("USEABLE_STOP_TIME", tm.getUseableStopTime());
            o.s("TRAJ_TYPE", tm.getTrajType().name());
            for (final TrajectoryState s : h.getTrajectoryStates()) {
                final StringBuilder sb = new StringBuilder(date(s.getDate()));
                for (final double v : s.getElements()) {
                    // Cartesian types only: m, m/s, m/s^2 to km, km/s, km/s^2
                    sb.append(' ').append(si(v, KM));
                }
                o.s("line", sb.toString());
            }
        }
        final OrbitPhysicalProperties ph = data.getPhysicBlock();
        if (ph != null) {
            o.block("phys", ph.getComments());
            o.s("MANUFACTURER", ph.getManufacturer());
            o.s("BUS_MODEL", ph.getBusModel());
            o.x("DRAG_CONST_AREA", ph.getDragConstantArea(), Units.M2);
            o.x("DRAG_COEFF_NOM", ph.getDragCoefficient(), Unit.ONE);
            o.x("INITIAL_WET_MASS", ph.getInitialWetMass(), Unit.KILOGRAM);
            o.x("WET_MASS", ph.getWetMass(), Unit.KILOGRAM);
            o.x("DRY_MASS", ph.getDryMass(), Unit.KILOGRAM);
            o.x("SRP_CONST_AREA", ph.getSrpConstantArea(), Units.M2);
            o.x("SOLAR_RAD_COEFF", ph.getSrpCoefficient(), Unit.ONE);
        }
        for (final OrbitCovarianceHistory h : orEmpty(data.getCovarianceBlocks())) {
            final OrbitCovarianceHistoryMetadata cm = h.getMetadata();
            o.block("cov", cm.getComments());
            o.s("COV_ID", cm.getCovID());
            o.s("COV_PREV_ID", cm.getCovPrevID());
            o.s("COV_REF_FRAME", frameName(cm.getCovReferenceFrame()));
            o.s("COV_TYPE", cm.getCovType().name());
            o.s("COV_ORDERING", cm.getCovOrdering().name());
            for (final OrbitCovariance c : h.getCovariances()) {
                final StringBuilder sb = new StringBuilder(date(c.getDate()));
                final RealMatrix m = c.getMatrix();
                for (int r = 0; r < m.getRowDimension(); ++r) {
                    for (int k = 0; k <= r; ++k) {
                        sb.append(' ').append(si(m.getEntry(r, k), Units.KM2));
                    }
                }
                o.s("line", sb.toString());
            }
        }
        for (final OrbitManeuverHistory h : orEmpty(data.getManeuverBlocks())) {
            final OrbitManeuverHistoryMetadata mm = h.getMetadata();
            o.block("man", mm.getComments());
            o.s("MAN_ID", mm.getManID());
            o.s("MAN_BASIS", mm.getManBasis() == null ? null : mm.getManBasis().name());
            o.s("MAN_DEVICE_ID", mm.getManDeviceID());
            o.s("MAN_PURPOSE", join(mm.getManPurpose()));
            o.s("MAN_REF_FRAME", frameName(mm.getManReferenceFrame()));
            o.s("DC_TYPE", mm.getDcType().name());
            o.s("MAN_COMPOSITION", join(mm.getManComposition()));
            for (final OrbitManeuver m : h.getManeuvers()) {
                final StringBuilder sb = new StringBuilder();
                for (final ManeuverFieldType f : mm.getManComposition()) {
                    if (sb.length() > 0) {
                        sb.append(' ');
                    }
                    switch (f) {
                        case TIME_ABSOLUTE:
                        case TIME_RELATIVE:
                            sb.append(date(m.getDate()));
                            break;
                        case MAN_DURA:
                            sb.append(num(m.getDuration()));
                            break;
                        case DELTA_MASS:
                            sb.append(num(m.getDeltaMass()));
                            break;
                        case ACC_X:
                            sb.append(si(m.getAcceleration().getX(), Units.KM_PER_S2));
                            break;
                        case ACC_Y:
                            sb.append(si(m.getAcceleration().getY(), Units.KM_PER_S2));
                            break;
                        case ACC_Z:
                            sb.append(si(m.getAcceleration().getZ(), Units.KM_PER_S2));
                            break;
                        case DV_X:
                            sb.append(si(m.getDv().getX(), Units.KM_PER_S));
                            break;
                        case DV_Y:
                            sb.append(si(m.getDv().getY(), Units.KM_PER_S));
                            break;
                        case DV_Z:
                            sb.append(si(m.getDv().getZ(), Units.KM_PER_S));
                            break;
                        default:
                            sb.append("UNSUPPORTED_").append(f.name());
                    }
                }
                o.s("line", sb.toString());
            }
        }
        user(o, data.getUserDefinedBlock());
    }

    private static Generator generator(final StringBuilder out, final boolean xml, final String name,
                                       final int padding) throws IOException {
        if (xml) {
            return new XmlGenerator(out, XmlGenerator.DEFAULT_INDENT, name, Constants.JULIAN_DAY, true,
                                    null, new AccurateFormatter());
        }
        return new KvnGenerator(out, padding, name, Constants.JULIAN_DAY, 0, new AccurateFormatter());
    }

    private static void run(final Path dir, final Path dump, final Path rewrite) throws IOException {
        Files.createDirectories(rewrite);
        final File[] files = dir.toFile().listFiles();
        final List<String> names = new ArrayList<>();
        if (files != null) {
            for (final File f : files) {
                final String n = f.getName();
                if (f.isFile() && (n.endsWith(".kvn") || n.endsWith(".xml"))) {
                    names.add(n);
                }
            }
        }
        names.sort(null);
        final java.io.ByteArrayOutputStream bytes = new java.io.ByteArrayOutputStream();
        try (PrintStream p = new PrintStream(bytes, true, StandardCharsets.UTF_8)) {
            for (final String n : names) {
                final String id = n.substring(0, n.length() - 4);
                final boolean xml = n.endsWith(".xml");
                final String fmt = xml ? "XML" : "KVN";
                final File f = dir.resolve(n).toFile();
                final String content = new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
                final String kind = content.contains("CCSDS_OPM_VERS") ? "OPM"
                                  : content.contains("CCSDS_OMM_VERS") ? "OMM" : "OCM";
                p.println("case=" + id);
                p.println("kind=" + kind);
                p.println("format=" + fmt);
                final java.io.ByteArrayOutputStream block = new java.io.ByteArrayOutputStream();
                Object message = null;
                try (PrintStream b = new PrintStream(block, true, StandardCharsets.UTF_8)) {
                    final Out o = new Out(b);
                    final ParserBuilder pb = new ParserBuilder();
                    switch (kind) {
                        case "OPM": {
                            final Opm m = pb.buildOpmParser().parseMessage(new DataSource(f));
                            dumpOpm(o, m);
                            message = m;
                            break;
                        }
                        case "OMM": {
                            final Omm m = pb.buildOmmParser().parseMessage(new DataSource(f));
                            dumpOmm(o, m);
                            message = m;
                            break;
                        }
                        default: {
                            final Ocm m = pb.buildOcmParser().parseMessage(new DataSource(f));
                            dumpOcm(o, m);
                            message = m;
                        }
                    }
                    b.flush();
                    p.print(block.toString(StandardCharsets.UTF_8));
                } catch (Exception e) {
                    System.err.println("FINDING: " + n + ": Orekit cannot parse: " + oneLine(e));
                    if (System.getenv("ODM_TRACE") != null) {
                        e.printStackTrace();
                    }
                    p.println("parse_error=" + oneLine(e));
                }
                if (message != null) {
                    try {
                        final StringBuilder out = new StringBuilder();
                        final WriterBuilder wb = new WriterBuilder();
                        if (message instanceof Opm) {
                            try (Generator g = generator(out, xml, n, 20)) {
                                wb.buildOpmWriter().writeMessage(g, (Opm) message);
                            }
                        } else if (message instanceof Omm) {
                            try (Generator g = generator(out, xml, n, 20)) {
                                wb.buildOmmWriter().writeMessage(g, (Omm) message);
                            }
                        } else {
                            try (Generator g = generator(out, xml, n, 20)) {
                                wb.buildOcmWriter().writeMessage(g, (Ocm) message);
                            }
                        }
                        Files.write(rewrite.resolve(n), out.toString().getBytes(StandardCharsets.UTF_8));
                    } catch (Exception e) {
                        System.err.println("FINDING: " + n + ": Orekit cannot write the parsed message: " +
                                           oneLine(e));
                        p.println("write_error=" + oneLine(e));
                    }
                }
                p.println("end");
                p.println();
            }
        }
        Files.write(dump, bytes.toByteArray(), StandardOpenOption.CREATE, StandardOpenOption.TRUNCATE_EXISTING);
    }

    /** A body without ephemeris, so that names resolve without JPL files. */
    private static final class StubBody implements CelestialBody {
        private final String name;
        StubBody(final String name) {
            this.name = name;
        }
        @Override
        public Frame getInertiallyOrientedFrame() {
            return DataContext.getDefault().getFrames().getGCRF();
        }
        @Override
        public Frame getBodyOrientedFrame() {
            throw new UnsupportedOperationException("stub " + name + " has no body-oriented frame");
        }
        @Override
        public String getName() {
            return name;
        }
        @Override
        public double getGM() {
            return Constants.EIGEN5C_EARTH_MU;
        }
        @Override
        public <T extends CalculusFieldElement<T>> FieldVector3D<T> getPosition(final FieldAbsoluteDate<T> date,
                                                                                final Frame frame) {
            throw new UnsupportedOperationException("stub " + name + " has no ephemeris");
        }
        @Override
        public TimeStampedPVCoordinates getPVCoordinates(final AbsoluteDate date, final Frame frame) {
            throw new UnsupportedOperationException("stub " + name + " has no ephemeris");
        }
    }

    public static void main(final String[] args) throws Exception {
        if (args.length != 3) {
            System.err.println("usage: OdmOracle <dir> <dump.txt> <rewrite_dir>");
            System.exit(2);
        }
        final String dataDir = System.getenv("OREKIT13_DATA_NO_EOP");
        if (dataDir == null || dataDir.isEmpty()) {
            System.err.println("OREKIT13_DATA_NO_EOP is not set");
            System.exit(2);
        }
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(new File(dataDir)));
        ((LazyLoadedCelestialBodies) DataContext.getDefault().getCelestialBodies())
            .addCelestialBodyLoader(CelestialBodyFactory.EARTH, StubBody::new);
        ((LazyLoadedCelestialBodies) DataContext.getDefault().getCelestialBodies())
            .addCelestialBodyLoader(CelestialBodyFactory.SOLAR_SYSTEM_BARYCENTER, StubBody::new);
        run(Path.of(args[0]), Path.of(args[1]), Path.of(args[2]));
    }

}
