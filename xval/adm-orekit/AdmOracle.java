// SPDX-License-Identifier: AGPL-3.0-only
//
// External-oracle driver for the CCSDS Attitude Data Messages (AEM, APM) of
// CCSDS 504.0-B-2, run against Orekit 13.1.8 + Hipparchus 4.0.3 (Apache-2.0).
// See PREREGISTRATION.md (legs L1, L2, L3) and FORMAT.md (case / dump format).
//
// Modes:
//   write <inputs.txt> <outdir>
//       Builds every case of the input file through Orekit's own objects
//       (AemMetadata + AttitudeType.build for AEM records, ApmQuaternion, Euler,
//       AngularVelocity, SpinStabilized, Inertia, Maneuver and ApmData for APM)
//       and writes it with Orekit's AemWriter / ApmWriter: <id>.kvn for every
//       case, <id>.xml for every version-2.0 case. Numbers are written with
//       Orekit's AccurateFormatter (shortest round-trip representation).
//   read <dir> <dump.txt>
//       Parses every <id>.kvn / <id>.xml in <dir> (sorted by name) with
//       ParserBuilder().buildAemParser() / buildApmParser() and appends one
//       FORMAT.md block per file to dump.txt. AEM records are dumped through
//       Orekit's inverse mapping (AttitudeType.generateData with the parsed
//       metadata), in the message units, in the canonical value order, each
//       followed by the rot= line of AemSegment.getAngularCoordinates().
//
// Anything Orekit refuses or cannot express is reported on stderr as a line
// starting with "FINDING:" and the driver carries on with the other cases.
//
// Harness accommodation: the oracle data directory holds only tai-utc.dat, and
// Orekit's parser resolves CENTER_NAME = EARTH through CelestialBodies.getEarth(),
// which needs JPL ephemerides. The driver registers a stub Earth body (GCRF axes,
// EIGEN-5C mu, no ephemeris) with the default data context so that the centre is
// carried by name. AEM and APM attitude data never use the centre's ephemeris;
// any call that would throws UnsupportedOperationException.

import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.hipparchus.complex.Quaternion;
import org.hipparchus.geometry.euclidean.threed.Rotation;
import org.hipparchus.geometry.euclidean.threed.RotationOrder;
import org.hipparchus.linear.RealMatrix;
import org.hipparchus.CalculusFieldElement;
import org.hipparchus.geometry.euclidean.threed.FieldVector3D;
import org.orekit.bodies.CelestialBody;
import org.orekit.bodies.CelestialBodyFactory;
import org.orekit.bodies.LazyLoadedCelestialBodies;
import org.orekit.data.DataContext;
import org.orekit.frames.Frame;
import org.orekit.time.FieldAbsoluteDate;
import org.orekit.utils.TimeStampedPVCoordinates;
import org.orekit.data.DataSource;
import org.orekit.data.DirectoryCrawler;
import org.orekit.files.ccsds.definitions.BodyFacade;
import org.orekit.files.ccsds.definitions.CcsdsFrameMapper;
import org.orekit.files.ccsds.definitions.CenterName;
import org.orekit.files.ccsds.definitions.FrameFacade;
import org.orekit.files.ccsds.definitions.OrekitCcsdsFrameMapper;
import org.orekit.files.ccsds.definitions.TimeConverter;
import org.orekit.files.ccsds.definitions.TimeSystem;
import org.orekit.files.ccsds.definitions.Units;
import org.orekit.files.ccsds.ndm.ParsedUnitsBehavior;
import org.orekit.files.ccsds.ndm.ParserBuilder;
import org.orekit.files.ccsds.ndm.WriterBuilder;
import org.orekit.files.ccsds.ndm.adm.AdmHeader;
import org.orekit.files.ccsds.ndm.adm.AdmMetadata;
import org.orekit.files.ccsds.ndm.adm.AttitudeEndpoints;
import org.orekit.files.ccsds.ndm.adm.AttitudeType;
import org.orekit.files.ccsds.ndm.adm.aem.Aem;
import org.orekit.files.ccsds.ndm.adm.aem.AemData;
import org.orekit.files.ccsds.ndm.adm.aem.AemMetadata;
import org.orekit.files.ccsds.ndm.adm.aem.AemSegment;
import org.orekit.files.ccsds.ndm.adm.aem.AemWriter;
import org.orekit.files.ccsds.ndm.adm.apm.AngularVelocity;
import org.orekit.files.ccsds.ndm.adm.apm.Apm;
import org.orekit.files.ccsds.ndm.adm.apm.ApmData;
import org.orekit.files.ccsds.ndm.adm.apm.ApmQuaternion;
import org.orekit.files.ccsds.ndm.adm.apm.ApmWriter;
import org.orekit.files.ccsds.ndm.adm.apm.Euler;
import org.orekit.files.ccsds.ndm.adm.apm.Inertia;
import org.orekit.files.ccsds.ndm.adm.apm.Maneuver;
import org.orekit.files.ccsds.ndm.adm.apm.SpinStabilized;
import org.orekit.files.ccsds.section.CommentsContainer;
import org.orekit.files.ccsds.section.Header;
import org.orekit.files.ccsds.section.Segment;
import org.orekit.files.ccsds.utils.ContextBinding;
import org.orekit.files.ccsds.utils.generation.Generator;
import org.orekit.files.ccsds.utils.generation.KvnGenerator;
import org.orekit.files.ccsds.utils.generation.XmlGenerator;
import org.orekit.time.AbsoluteDate;
import org.orekit.time.TimeScale;
import org.orekit.utils.AccurateFormatter;
import org.orekit.utils.Constants;
import org.orekit.utils.IERSConventions;
import org.orekit.utils.TimeStampedAngularCoordinates;
import org.orekit.utils.units.Unit;

public class AdmOracle {

    private static final IERSConventions CONVENTIONS = IERSConventions.IERS_2010;
    private static final CcsdsFrameMapper MAPPER = new OrekitCcsdsFrameMapper();

    // ------------------------------------------------------------------
    // input model
    // ------------------------------------------------------------------

    /** One key=value line of a case. */
    private static final class Line {
        final String key;
        final String value;
        Line(final String key, final String value) {
            this.key = key;
            this.value = value;
        }
    }

    /** One case of inputs.txt: id plus its lines in order. */
    private static final class Case {
        String id;
        String kind;
        double version = 2.0;
        final List<Line> lines = new ArrayList<>();
    }

    private static List<Case> readCases(final Path input) throws IOException {
        final List<Case> cases = new ArrayList<>();
        Case current = null;
        for (final String raw : Files.readAllLines(input, StandardCharsets.UTF_8)) {
            final String line = raw.strip();
            if (line.isEmpty()) {
                continue;
            }
            final int eq = line.indexOf('=');
            final String key = eq < 0 ? line : line.substring(0, eq);
            final String value = eq < 0 ? "" : line.substring(eq + 1);
            if ("case".equals(key)) {
                current = new Case();
                current.id = value;
                cases.add(current);
                continue;
            }
            if (current == null) {
                continue;
            }
            if ("end".equals(key)) {
                current = null;
                continue;
            }
            if ("kind".equals(key)) {
                current.kind = value;
            } else if ("version".equals(key)) {
                current.version = Double.parseDouble(value);
            }
            current.lines.add(new Line(key, value));
        }
        return cases;
    }

    // ------------------------------------------------------------------
    // shared helpers
    // ------------------------------------------------------------------

    private static ContextBinding context(final TimeSystem timeSystem) {
        return new ContextBinding(() -> CONVENTIONS, () -> true, DataContext::getDefault,
                                  () -> ParsedUnitsBehavior.STRICT_COMPLIANCE,
                                  () -> null, () -> timeSystem, () -> 0.0, () -> 1.0);
    }

    private static TimeConverter converter(final TimeSystem timeSystem) {
        return timeSystem.getConverter(context(timeSystem));
    }

    private static AbsoluteDate parseDate(final TimeSystem timeSystem, final String text) {
        return converter(timeSystem).parse(text);
    }

    private static String formatDate(final TimeSystem timeSystem, final AbsoluteDate date) {
        final TimeScale scale = converter(timeSystem).getTimeScale();
        return date.getComponents(scale).toStringWithoutUtcOffset(60, 9);
    }

    private static FrameFacade frame(final String name) {
        return FrameFacade.parse(name, CONVENTIONS, true, DataContext.getDefault(), true, true, true);
    }

    private static BodyFacade center(final String name) {
        try {
            final CenterName cn = CenterName.valueOf(name.toUpperCase().replace(' ', '_'));
            return new BodyFacade(name, cn.getCelestialBody(DataContext.getDefault().getCelestialBodies()));
        } catch (RuntimeException e) {
            return new BodyFacade(name, null);
        }
    }

    private static RotationOrder rotationOrder(final String seq) {
        return RotationOrder.valueOf(seq.toUpperCase().replace('1', 'X').replace('2', 'Y').replace('3', 'Z'));
    }

    private static double[] numbers(final String text) {
        final String[] fields = text.trim().split("\\s+");
        final double[] v = new double[fields.length];
        for (int i = 0; i < fields.length; ++i) {
            v[i] = Double.parseDouble(fields[i]);
        }
        return v;
    }

    private static String join(final double... values) {
        final StringBuilder sb = new StringBuilder();
        for (int i = 0; i < values.length; ++i) {
            if (i > 0) {
                sb.append(' ');
            }
            sb.append(Double.toString(values[i]));
        }
        return sb.toString();
    }

    private static String oneLine(final Throwable t) {
        String m = t.getMessage();
        if (m == null) {
            m = t.getClass().getName();
        }
        return m.replace('\n', ' ').replace('\r', ' ');
    }

    /** Units of the record values of an AEM attitude type, in the order of a data line. */
    private static Unit[] units(final AttitudeType type) {
        final Unit one = Unit.ONE;
        final Unit deg = Unit.DEGREE;
        final Unit dps = Units.DEG_PER_S;
        final Unit ops = Units.ONE_PER_S;
        switch (type) {
            case QUATERNION:
                return new Unit[] {one, one, one, one};
            case QUATERNION_DERIVATIVE:
                return new Unit[] {one, one, one, one, ops, ops, ops, ops};
            case QUATERNION_EULER_RATES:
            case QUATERNION_ANGVEL:
                return new Unit[] {one, one, one, one, dps, dps, dps};
            case EULER_ANGLE:
                return new Unit[] {deg, deg, deg};
            case EULER_ANGLE_DERIVATIVE:
            case EULER_ANGLE_ANGVEL:
                return new Unit[] {deg, deg, deg, dps, dps, dps};
            case SPIN:
                return new Unit[] {deg, deg, deg, dps};
            case SPIN_NUTATION:
                return new Unit[] {deg, deg, deg, dps, deg, Unit.SECOND, deg};
            case SPIN_NUTATION_MOMENTUM:
                return new Unit[] {deg, deg, deg, dps, deg, deg, dps};
            default:
                throw new IllegalArgumentException("unsupported attitude type " + type);
        }
    }

    private static boolean isQuaternionType(final AttitudeType type) {
        return type == AttitudeType.QUATERNION || type == AttitudeType.QUATERNION_DERIVATIVE ||
               type == AttitudeType.QUATERNION_EULER_RATES || type == AttitudeType.QUATERNION_ANGVEL;
    }

    /**
     * Canonical order (Q1 Q2 Q3 QC [Q1_DOT Q2_DOT Q3_DOT QC_DOT]) to data-line order.
     * Only QUATERNION_TYPE = FIRST changes the order (QC first, and QC_DOT first among rates).
     */
    private static double[] canonicalToLine(final AttitudeType type, final boolean first, final double[] c) {
        if (!first || !isQuaternionType(type)) {
            return c.clone();
        }
        final double[] l = c.clone();
        l[0] = c[3]; l[1] = c[0]; l[2] = c[1]; l[3] = c[2];
        if (type == AttitudeType.QUATERNION_DERIVATIVE) {
            l[4] = c[7]; l[5] = c[4]; l[6] = c[5]; l[7] = c[6];
        }
        return l;
    }

    private static double[] lineToCanonical(final AttitudeType type, final boolean first, final double[] l) {
        if (!first || !isQuaternionType(type)) {
            return l.clone();
        }
        final double[] c = l.clone();
        c[0] = l[1]; c[1] = l[2]; c[2] = l[3]; c[3] = l[0];
        if (type == AttitudeType.QUATERNION_DERIVATIVE) {
            c[4] = l[5]; c[5] = l[6]; c[6] = l[7]; c[7] = l[4];
        }
        return c;
    }

    // ------------------------------------------------------------------
    // write mode
    // ------------------------------------------------------------------

    private static AdmHeader buildHeader(final Case c) {
        final AdmHeader header = new AdmHeader();
        header.setFormatVersion(c.version);
        for (final Line l : c.lines) {
            switch (l.key) {
                case "header.comment":
                    header.addComment(l.value);
                    break;
                case "header.classification":
                    header.setClassification(l.value);
                    break;
                case "header.creation_date":
                    header.setCreationDate(parseDate(TimeSystem.UTC, l.value));
                    break;
                case "header.originator":
                    header.setOriginator(l.value);
                    break;
                case "header.message_id":
                    header.setMessageId(l.value);
                    break;
                default:
                    break;
            }
        }
        return header;
    }

    /** Raw values of one AEM segment of the input. */
    private static final class SegmentInput {
        final List<Line> meta = new ArrayList<>();
        final List<String> dataComments = new ArrayList<>();
        final List<String> records = new ArrayList<>();

        String get(final String key) {
            for (final Line l : meta) {
                if (l.key.equals(key)) {
                    return l.value;
                }
            }
            return null;
        }
    }

    private static Aem buildAem(final Case c) {
        final List<SegmentInput> inputs = new ArrayList<>();
        SegmentInput current = null;
        for (final Line l : c.lines) {
            if ("segment".equals(l.key)) {
                current = new SegmentInput();
                inputs.add(current);
            } else if (current != null) {
                if (l.key.startsWith("meta.")) {
                    current.meta.add(l);
                } else if ("data.comment".equals(l.key)) {
                    current.dataComments.add(l.value);
                } else if ("record".equals(l.key)) {
                    current.records.add(l.value);
                }
            }
        }

        final List<AemSegment> segments = new ArrayList<>();
        for (final SegmentInput si : inputs) {
            final AemMetadata md = new AemMetadata(1, MAPPER);
            // comments first: Orekit refuses comments once other entries are set
            for (final Line l : si.meta) {
                if ("meta.comment".equals(l.key)) {
                    md.addComment(l.value);
                }
            }
            md.setObjectName(si.get("meta.object_name"));
            md.setObjectID(si.get("meta.object_id"));
            if (si.get("meta.center_name") != null) {
                md.setCenter(center(si.get("meta.center_name")));
            }
            final String frameA = si.get("meta.ref_frame_a");
            md.getEndpoints().setFrameA(frame(frameA));
            md.getEndpoints().setFrameB(frame(si.get("meta.ref_frame_b")));
            if (si.get("meta.attitude_dir") != null) {
                md.getEndpoints().setA2b("A2B".equalsIgnoreCase(si.get("meta.attitude_dir")));
            }
            final TimeSystem ts = TimeSystem.parse(si.get("meta.time_system"));
            md.setTimeSystem(ts);
            md.setStartTime(parseDate(ts, si.get("meta.start_time")));
            if (si.get("meta.useable_start_time") != null) {
                md.setUseableStartTime(parseDate(ts, si.get("meta.useable_start_time")));
            }
            if (si.get("meta.useable_stop_time") != null) {
                md.setUseableStopTime(parseDate(ts, si.get("meta.useable_stop_time")));
            }
            md.setStopTime(parseDate(ts, si.get("meta.stop_time")));
            final AttitudeType type = AttitudeType.parseType(si.get("meta.attitude_type"));
            md.setAttitudeType(type);
            if (si.get("meta.quaternion_type") != null) {
                md.setIsFirst("FIRST".equalsIgnoreCase(si.get("meta.quaternion_type")));
            }
            if (si.get("meta.euler_rot_seq") != null) {
                md.setEulerRotSeq(rotationOrder(si.get("meta.euler_rot_seq")));
            }
            if (si.get("meta.angvel_frame") != null) {
                final FrameFacade angvel = frame(si.get("meta.angvel_frame"));
                md.setAngvelFrame(angvel);
                // the rate is expressed in frame A when ANGVEL_FRAME names frame A
                md.setRateFrameIsA(angvel.getName().equals(md.getEndpoints().getFrameA().getName()));
            }
            if (si.get("meta.interpolation_method") != null) {
                md.setInterpolationMethod(si.get("meta.interpolation_method"));
            }
            if (si.get("meta.interpolation_degree") != null) {
                md.setInterpolationDegree(Integer.parseInt(si.get("meta.interpolation_degree")));
            }

            final AemData data = new AemData();
            for (final String comment : si.dataComments) {
                data.addComment(comment);
            }
            final Unit[] units = units(type);
            final boolean first = md.isFirst();
            for (final String record : si.records) {
                final String[] fields = record.trim().split("\\s+");
                final AbsoluteDate date = parseDate(ts, fields[0]);
                final double[] canonical = numbers(record.trim().substring(fields[0].length()));
                if (canonical.length != units.length) {
                    throw new IllegalArgumentException("record of " + canonical.length + " values for " +
                                                       type + " (" + units.length + " expected)");
                }
                final double[] line = canonicalToLine(type, first, canonical);
                final double[] si1 = new double[line.length];
                for (int i = 0; i < line.length; ++i) {
                    si1[i] = units[i].toSI(line[i]);
                }
                final TimeStampedAngularCoordinates tsac =
                    type.build(first, md.getEndpoints().isExternal2SpacecraftBody(), md.getEulerRotSeq(),
                               md.isSpacecraftBodyRate(), date, si1);
                data.addData(tsac);
            }
            segments.add(new AemSegment(md, data));
        }
        return new Aem(buildHeader(c), segments, CONVENTIONS, DataContext.getDefault());
    }

    private static void setEndpoints(final AttitudeEndpoints ep, final String a, final String b) {
        if (a != null) {
            ep.setFrameA(frame(a));
        }
        if (b != null) {
            ep.setFrameB(frame(b));
        }
    }

    private static Apm buildApm(final Case c) {
        final AdmMetadata md = new AdmMetadata(MAPPER);
        final CommentsContainer dataComments = new CommentsContainer();
        for (final Line l : c.lines) {
            if ("meta.comment".equals(l.key)) {
                md.addComment(l.value);
            } else if ("data.comment".equals(l.key)) {
                dataComments.addComment(l.value);
            }
        }
        TimeSystem ts = TimeSystem.UTC;
        for (final Line l : c.lines) {
            if ("meta.time_system".equals(l.key)) {
                ts = TimeSystem.parse(l.value);
            }
        }
        md.setTimeSystem(ts);

        AbsoluteDate epoch = null;
        ApmQuaternion quat = null;
        Euler euler = null;
        AngularVelocity angvel = null;
        SpinStabilized spin = null;
        Inertia inertia = null;
        final List<Maneuver> maneuvers = new ArrayList<>();
        Maneuver man = null;
        // pending frames per block (set before values, after comments)
        String fa = null;
        String fb = null;
        for (final Line l : c.lines) {
            final String k = l.key;
            final String v = l.value;
            switch (k) {
                case "meta.object_name": md.setObjectName(v); break;
                case "meta.object_id":   md.setObjectID(v); break;
                case "meta.center_name": md.setCenter(center(v)); break;
                case "epoch":            epoch = parseDate(ts, v); break;

                case "quat":   quat = new ApmQuaternion(MAPPER); fa = null; fb = null; break;
                case "quat.comment": quat.addComment(v); break;
                case "quat.ref_frame_a": fa = v; break;
                case "quat.ref_frame_b": fb = v; setEndpoints(quat.getEndpoints(), fa, fb); break;
                case "quat.q": {
                    final double[] q = numbers(v);
                    quat.setQ(1, q[0]); quat.setQ(2, q[1]); quat.setQ(3, q[2]); quat.setQ(0, q[3]);
                    break;
                }
                case "quat.q_dot": {
                    final double[] q = numbers(v);
                    quat.setQDot(1, q[0]); quat.setQDot(2, q[1]); quat.setQDot(3, q[2]); quat.setQDot(0, q[3]);
                    break;
                }

                case "euler":  euler = new Euler(MAPPER); fa = null; fb = null; break;
                case "euler.comment": euler.addComment(v); break;
                case "euler.ref_frame_a": fa = v; break;
                case "euler.ref_frame_b": fb = v; setEndpoints(euler.getEndpoints(), fa, fb); break;
                case "euler.rot_seq": euler.setEulerRotSeq(rotationOrder(v)); break;
                case "euler.angles": {
                    final double[] a = numbers(v);
                    for (int i = 0; i < 3; ++i) {
                        euler.setIndexedRotationAngle(i, Unit.DEGREE.toSI(a[i]));
                    }
                    break;
                }
                case "euler.rates": {
                    final double[] r = numbers(v);
                    for (int i = 0; i < 3; ++i) {
                        euler.setIndexedRotationRate(i, Units.DEG_PER_S.toSI(r[i]));
                    }
                    break;
                }

                case "angvel": angvel = new AngularVelocity(MAPPER); fa = null; fb = null; break;
                case "angvel.comment": angvel.addComment(v); break;
                case "angvel.ref_frame_a": fa = v; break;
                case "angvel.ref_frame_b": fb = v; setEndpoints(angvel.getEndpoints(), fa, fb); break;
                case "angvel.angvel_frame": angvel.setFrame(frame(v)); break;
                case "angvel.xyz": {
                    final double[] w = numbers(v);
                    angvel.setAngVelX(Units.DEG_PER_S.toSI(w[0]));
                    angvel.setAngVelY(Units.DEG_PER_S.toSI(w[1]));
                    angvel.setAngVelZ(Units.DEG_PER_S.toSI(w[2]));
                    break;
                }

                case "spin":   spin = new SpinStabilized(MAPPER); fa = null; fb = null; break;
                case "spin.comment": spin.addComment(v); break;
                case "spin.ref_frame_a": fa = v; break;
                case "spin.ref_frame_b": fb = v; setEndpoints(spin.getEndpoints(), fa, fb); break;
                case "spin.values": {
                    final double[] s = numbers(v);
                    spin.setSpinAlpha(Unit.DEGREE.toSI(s[0]));
                    spin.setSpinDelta(Unit.DEGREE.toSI(s[1]));
                    spin.setSpinAngle(Unit.DEGREE.toSI(s[2]));
                    spin.setSpinAngleVel(Units.DEG_PER_S.toSI(s[3]));
                    break;
                }
                case "spin.nutation": {
                    final double[] s = numbers(v);
                    spin.setNutation(Unit.DEGREE.toSI(s[0]));
                    spin.setNutationPeriod(Unit.SECOND.toSI(s[1]));
                    spin.setNutationPhase(Unit.DEGREE.toSI(s[2]));
                    break;
                }
                case "spin.momentum": {
                    final double[] s = numbers(v);
                    spin.setMomentumAlpha(Unit.DEGREE.toSI(s[0]));
                    spin.setMomentumDelta(Unit.DEGREE.toSI(s[1]));
                    spin.setNutationVel(Units.DEG_PER_S.toSI(s[2]));
                    break;
                }

                case "inertia": inertia = new Inertia(MAPPER); break;
                case "inertia.comment": inertia.addComment(v); break;
                case "inertia.ref_frame": inertia.setFrame(frame(v)); break;
                case "inertia.values": {
                    final double[] in = numbers(v);
                    inertia.setInertiaMatrixEntry(0, 0, in[0]);
                    inertia.setInertiaMatrixEntry(1, 1, in[1]);
                    inertia.setInertiaMatrixEntry(2, 2, in[2]);
                    inertia.setInertiaMatrixEntry(0, 1, in[3]);
                    inertia.setInertiaMatrixEntry(0, 2, in[4]);
                    inertia.setInertiaMatrixEntry(1, 2, in[5]);
                    break;
                }

                case "man": man = new Maneuver(); maneuvers.add(man); break;
                case "man.comment": man.addComment(v); break;
                case "man.epoch_start": man.setEpochStart(parseDate(ts, v)); break;
                case "man.duration": man.setDuration(Unit.SECOND.toSI(Double.parseDouble(v))); break;
                case "man.ref_frame": man.setFrame(frame(v)); break;
                case "man.torque": {
                    final double[] t = numbers(v);
                    for (int i = 0; i < 3; ++i) {
                        man.setTorque(i, t[i]);
                    }
                    break;
                }
                case "man.delta_mass": man.setDeltaMass(Double.parseDouble(v)); break;
                default:
                    break;
            }
        }

        final ApmData data = new ApmData(dataComments, epoch, quat, euler, angvel, spin, inertia);
        for (final Maneuver m : maneuvers) {
            data.addManeuver(m);
        }
        final List<Segment<AdmMetadata, ApmData>> segments = new ArrayList<>();
        segments.add(new Segment<>(md, data));
        return new Apm(buildHeader(c), segments, CONVENTIONS, DataContext.getDefault());
    }

    private static Generator generator(final StringBuilder out, final boolean xml, final String name,
                                       final int padding)
        throws IOException {
        if (xml) {
            return new XmlGenerator(out, XmlGenerator.DEFAULT_INDENT, name, Constants.JULIAN_DAY, true,
                                    null, new AccurateFormatter());
        }
        return new KvnGenerator(out, padding, name, Constants.JULIAN_DAY, 0, new AccurateFormatter());
    }

    private static void write(final Path inputs, final Path outdir) throws IOException {
        Files.createDirectories(outdir);
        for (final Case c : readCases(inputs)) {
            final boolean aem = "AEM".equalsIgnoreCase(c.kind);
            final List<Boolean> formats = new ArrayList<>();
            formats.add(false);
            if (c.version >= 2.0) {
                formats.add(true);
            }
            for (final boolean xml : formats) {
                final String fmt = xml ? "XML" : "KVN";
                final String name = c.id + (xml ? ".xml" : ".kvn");
                try {
                    final StringBuilder out = new StringBuilder();
                    // rebuild the message for every file: the writers may update header fields
                    if (aem) {
                        final Aem message = buildAem(c);
                        final AemWriter writer = new WriterBuilder().buildAemWriter();
                        try (Generator g = generator(out, xml, name, AemWriter.KVN_PADDING_WIDTH)) {
                            writer.writeMessage(g, message);
                        }
                    } else {
                        final Apm message = buildApm(c);
                        final ApmWriter writer = new WriterBuilder().buildApmWriter();
                        try (Generator g = generator(out, xml, name, ApmWriter.KVN_PADDING_WIDTH)) {
                            writer.writeMessage(g, message);
                        }
                    }
                    final String text = out.toString();
                    for (final String l : text.split("\n")) {
                        if (l.contains("NaN")) {
                            System.err.println("FINDING: " + c.id + " " + fmt +
                                               ": Orekit writer emitted a NaN value: " + l.strip());
                        }
                    }
                    Files.write(outdir.resolve(name), text.getBytes(StandardCharsets.UTF_8));
                } catch (Exception e) {
                    System.err.println("FINDING: " + c.id + " " + fmt + ": Orekit cannot write the case: " +
                                       oneLine(e));
                }
            }
        }
    }

    // ------------------------------------------------------------------
    // read mode
    // ------------------------------------------------------------------

    private static void dumpHeader(final PrintStream p, final Header h) {
        p.println("version=" + Double.toString(h.getFormatVersion()));
    }

    private static void dumpHeaderBody(final PrintStream p, final Header h) {
        for (final String comment : h.getComments()) {
            p.println("header.comment=" + comment);
        }
        if (h.getClassification() != null) {
            p.println("header.classification=" + h.getClassification());
        }
        if (h.getCreationDate() != null) {
            p.println("header.creation_date=" + formatDate(TimeSystem.UTC, h.getCreationDate()));
        }
        if (h.getOriginator() != null) {
            p.println("header.originator=" + h.getOriginator());
        }
        if (h.getMessageId() != null) {
            p.println("header.message_id=" + h.getMessageId());
        }
    }

    private static void dumpAem(final PrintStream p, final Aem aem) {
        final Header h = aem.getHeader();
        final double version = h.getFormatVersion();
        dumpHeader(p, h);
        p.println("format=" + FORMAT_HOLDER[0]);
        dumpHeaderBody(p, h);
        for (final AemSegment seg : aem.getSegments()) {
            final AemMetadata md = seg.getMetadata();
            final TimeSystem ts = md.getTimeSystem();
            final AttitudeType type = md.getAttitudeType();
            p.println("segment");
            for (final String comment : md.getComments()) {
                p.println("meta.comment=" + comment);
            }
            p.println("meta.object_name=" + md.getObjectName());
            p.println("meta.object_id=" + md.getObjectID());
            if (md.getCenter() != null) {
                p.println("meta.center_name=" + md.getCenter().getName());
            }
            p.println("meta.ref_frame_a=" + md.getEndpoints().getFrameA().getName());
            p.println("meta.ref_frame_b=" + md.getEndpoints().getFrameB().getName());
            if (version < 2.0) {
                p.println("meta.attitude_dir=" + (md.getEndpoints().isA2b() ? "A2B" : "B2A"));
            }
            p.println("meta.time_system=" + ts.name());
            p.println("meta.start_time=" + formatDate(ts, md.getStartTime()));
            if (md.getUseableStartTime() != null) {
                p.println("meta.useable_start_time=" + formatDate(ts, md.getUseableStartTime()));
            }
            if (md.getUseableStopTime() != null) {
                p.println("meta.useable_stop_time=" + formatDate(ts, md.getUseableStopTime()));
            }
            p.println("meta.stop_time=" + formatDate(ts, md.getStopTime()));
            p.println("meta.attitude_type=" + type.getName(version));
            if (version < 2.0 && isQuaternionType(type)) {
                p.println("meta.quaternion_type=" + (md.isFirst() ? "FIRST" : "LAST"));
            }
            if (md.getEulerRotSeq() != null) {
                final String seq = md.getEulerRotSeq().name();
                p.println("meta.euler_rot_seq=" +
                          (version < 2.0 ? seq.replace('X', '1').replace('Y', '2').replace('Z', '3') : seq));
            }
            if (md.getFrameAngvelFrame() != null) {
                p.println("meta.angvel_frame=" + md.getFrameAngvelFrame().getName());
            }
            if (md.getInterpolationMethod() != null) {
                p.println("meta.interpolation_method=" + md.getInterpolationMethod());
                p.println("meta.interpolation_degree=" + md.getInterpolationDegree());
            }
            for (final String comment : seg.getData().getComments()) {
                p.println("data.comment=" + comment);
            }
            final Unit[] units = units(type);
            final boolean first = md.isFirst();
            final List<TimeStampedAngularCoordinates> raw = seg.getData().getAngularCoordinates();
            final List<TimeStampedAngularCoordinates> acs = seg.getAngularCoordinates();
            for (int i = 0; i < raw.size(); ++i) {
                final TimeStampedAngularCoordinates tsac = raw.get(i);
                final double[] si = type.generateData(first, md.getEndpoints().isExternal2SpacecraftBody(),
                                                      md.getEulerRotSeq(), md.isSpacecraftBodyRate(), tsac);
                final double[] line = new double[si.length];
                for (int j = 0; j < si.length; ++j) {
                    line[j] = units[j].fromSI(si[j]);
                }
                final double[] canonical = lineToCanonical(type, first, line);
                p.println("record=" + formatDate(ts, tsac.getDate()) + " " + join(canonical));
                final Rotation r = acs.get(i).getRotation();
                p.println("rot=" + join(r.getQ0(), r.getQ1(), r.getQ2(), r.getQ3()));
            }
        }
    }

    private static void dumpApm(final PrintStream p, final Apm apm) {
        final Header h = apm.getHeader();
        dumpHeader(p, h);
        p.println("format=" + FORMAT_HOLDER[0]);
        dumpHeaderBody(p, h);
        final AdmMetadata md = apm.getMetadata();
        final TimeSystem ts = md.getTimeSystem();
        for (final String comment : md.getComments()) {
            p.println("meta.comment=" + comment);
        }
        p.println("meta.object_name=" + md.getObjectName());
        p.println("meta.object_id=" + md.getObjectID());
        if (md.getCenter() != null) {
            p.println("meta.center_name=" + md.getCenter().getName());
        }
        p.println("meta.time_system=" + ts.name());
        final ApmData data = apm.getData();
        p.println("epoch=" + formatDate(ts, data.getEpoch()));
        for (final String comment : data.getComments()) {
            p.println("data.comment=" + comment);
        }

        final ApmQuaternion quat = data.getQuaternionBlock();
        if (quat != null) {
            p.println("quat");
            for (final String comment : quat.getComments()) {
                p.println("quat.comment=" + comment);
            }
            p.println("quat.ref_frame_a=" + quat.getEndpoints().getFrameA().getName());
            p.println("quat.ref_frame_b=" + quat.getEndpoints().getFrameB().getName());
            final Quaternion q = quat.getQuaternion();
            p.println("quat.q=" + join(q.getQ1(), q.getQ2(), q.getQ3(), q.getQ0()));
            if (quat.hasRates()) {
                final Quaternion qd = quat.getQuaternionDot();
                p.println("quat.q_dot=" + join(qd.getQ1(), qd.getQ2(), qd.getQ3(), qd.getQ0()));
            }
        }

        final Euler euler = data.getEulerBlock();
        if (euler != null) {
            p.println("euler");
            for (final String comment : euler.getComments()) {
                p.println("euler.comment=" + comment);
            }
            p.println("euler.ref_frame_a=" + euler.getEndpoints().getFrameA().getName());
            p.println("euler.ref_frame_b=" + euler.getEndpoints().getFrameB().getName());
            p.println("euler.rot_seq=" + euler.getEulerRotSeq().name());
            final double[] a = euler.getRotationAngles();
            p.println("euler.angles=" + join(Unit.DEGREE.fromSI(a[0]), Unit.DEGREE.fromSI(a[1]),
                                             Unit.DEGREE.fromSI(a[2])));
            if (euler.hasRates()) {
                final double[] r = euler.getRotationRates();
                p.println("euler.rates=" + join(Units.DEG_PER_S.fromSI(r[0]), Units.DEG_PER_S.fromSI(r[1]),
                                                Units.DEG_PER_S.fromSI(r[2])));
            }
        }

        final AngularVelocity av = data.getAngularVelocityBlock();
        if (av != null) {
            p.println("angvel");
            for (final String comment : av.getComments()) {
                p.println("angvel.comment=" + comment);
            }
            p.println("angvel.ref_frame_a=" + av.getEndpoints().getFrameA().getName());
            p.println("angvel.ref_frame_b=" + av.getEndpoints().getFrameB().getName());
            p.println("angvel.angvel_frame=" + av.getFrame().getName());
            p.println("angvel.xyz=" + join(Units.DEG_PER_S.fromSI(av.getAngVelX()),
                                           Units.DEG_PER_S.fromSI(av.getAngVelY()),
                                           Units.DEG_PER_S.fromSI(av.getAngVelZ())));
        }

        final SpinStabilized spin = data.getSpinStabilizedBlock();
        if (spin != null) {
            p.println("spin");
            for (final String comment : spin.getComments()) {
                p.println("spin.comment=" + comment);
            }
            p.println("spin.ref_frame_a=" + spin.getEndpoints().getFrameA().getName());
            p.println("spin.ref_frame_b=" + spin.getEndpoints().getFrameB().getName());
            p.println("spin.values=" + join(Unit.DEGREE.fromSI(spin.getSpinAlpha()),
                                            Unit.DEGREE.fromSI(spin.getSpinDelta()),
                                            Unit.DEGREE.fromSI(spin.getSpinAngle()),
                                            Units.DEG_PER_S.fromSI(spin.getSpinAngleVel())));
            if (spin.hasNutation()) {
                p.println("spin.nutation=" + join(Unit.DEGREE.fromSI(spin.getNutation()),
                                                  Unit.SECOND.fromSI(spin.getNutationPeriod()),
                                                  Unit.DEGREE.fromSI(spin.getNutationPhase())));
            }
            if (spin.hasMomentum()) {
                p.println("spin.momentum=" + join(Unit.DEGREE.fromSI(spin.getMomentumAlpha()),
                                                  Unit.DEGREE.fromSI(spin.getMomentumDelta()),
                                                  Units.DEG_PER_S.fromSI(spin.getNutationVel())));
            }
        }

        final Inertia inertia = data.getInertiaBlock();
        if (inertia != null) {
            p.println("inertia");
            for (final String comment : inertia.getComments()) {
                p.println("inertia.comment=" + comment);
            }
            if (inertia.getFrame() != null) {
                p.println("inertia.ref_frame=" + inertia.getFrame().getName());
            }
            final RealMatrix m = inertia.getInertiaMatrix();
            p.println("inertia.values=" + join(m.getEntry(0, 0), m.getEntry(1, 1), m.getEntry(2, 2),
                                               m.getEntry(0, 1), m.getEntry(0, 2), m.getEntry(1, 2)));
        }

        for (final Maneuver man : data.getManeuvers()) {
            p.println("man");
            for (final String comment : man.getComments()) {
                p.println("man.comment=" + comment);
            }
            p.println("man.epoch_start=" + formatDate(ts, man.getEpochStart()));
            p.println("man.duration=" + Double.toString(Unit.SECOND.fromSI(man.getDuration())));
            if (man.getFrame() != null) {
                p.println("man.ref_frame=" + man.getFrame().getName());
            }
            p.println("man.torque=" + join(man.getTorque().getX(), man.getTorque().getY(), man.getTorque().getZ()));
            if (!Double.isNaN(man.getDeltaMass())) {
                p.println("man.delta_mass=" + Double.toString(man.getDeltaMass()));
            }
        }
    }

    /** Format of the file being dumped (KVN or XML), shared with the dump helpers. */
    private static final String[] FORMAT_HOLDER = new String[1];

    private static void read(final Path dir, final Path dump) throws IOException {
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
                final String fmt = n.endsWith(".xml") ? "XML" : "KVN";
                FORMAT_HOLDER[0] = fmt;
                final File f = dir.resolve(n).toFile();
                final String content = new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
                final boolean apm = content.contains("CCSDS_APM_VERS") || content.contains("<apm") ||
                                    (!content.contains("CCSDS_AEM_VERS") && !content.contains("<aem") &&
                                     id.startsWith("P"));
                final java.io.ByteArrayOutputStream block = new java.io.ByteArrayOutputStream();
                try (PrintStream b = new PrintStream(block, true, StandardCharsets.UTF_8)) {
                    b.println("case=" + id);
                    b.println("kind=" + (apm ? "APM" : "AEM"));
                    if (apm) {
                        final Apm message = new ParserBuilder().buildApmParser().parseMessage(new DataSource(f));
                        dumpApm(b, message);
                    } else {
                        final Aem message = new ParserBuilder().buildAemParser().parseMessage(new DataSource(f));
                        dumpAem(b, message);
                    }
                    b.println("end");
                    b.println();
                    b.flush();
                    p.print(block.toString(StandardCharsets.UTF_8));
                } catch (Exception e) {
                    System.err.println("FINDING: " + n + ": " + oneLine(e));
                    p.println("case=" + id);
                    p.println("format=" + fmt);
                    p.println("parse_error=" + oneLine(e));
                    p.println("end");
                    p.println();
                }
            }
        }
        Files.write(dump, bytes.toByteArray(), StandardOpenOption.CREATE, StandardOpenOption.APPEND);
    }

    /** Earth without ephemeris, so that CENTER_NAME = EARTH resolves without JPL files. */
    private static final class StubEarth implements CelestialBody {
        @Override
        public Frame getInertiallyOrientedFrame() {
            return DataContext.getDefault().getFrames().getGCRF();
        }
        @Override
        public Frame getBodyOrientedFrame() {
            throw new UnsupportedOperationException("stub Earth has no body-oriented frame");
        }
        @Override
        public String getName() {
            return CelestialBodyFactory.EARTH;
        }
        @Override
        public double getGM() {
            return Constants.EIGEN5C_EARTH_MU;
        }
        @Override
        public <T extends CalculusFieldElement<T>> FieldVector3D<T> getPosition(final FieldAbsoluteDate<T> date,
                                                                                final Frame frame) {
            throw new UnsupportedOperationException("stub Earth has no ephemeris");
        }
        @Override
        public TimeStampedPVCoordinates getPVCoordinates(final AbsoluteDate date, final Frame frame) {
            throw new UnsupportedOperationException("stub Earth has no ephemeris");
        }
    }

    // ------------------------------------------------------------------

    public static void main(final String[] args) throws Exception {
        if (args.length != 3 || !Arrays.asList("write", "read").contains(args[0])) {
            System.err.println("usage: AdmOracle write <inputs.txt> <outdir> | read <dir> <dump.txt>");
            System.exit(2);
        }
        final String dataDir = System.getenv("OREKIT13_DATA_NO_EOP");
        if (dataDir == null || dataDir.isEmpty()) {
            System.err.println("OREKIT13_DATA_NO_EOP is not set");
            System.exit(2);
        }
        DataContext.getDefault().getDataProvidersManager().addProvider(new DirectoryCrawler(new File(dataDir)));
        ((LazyLoadedCelestialBodies) DataContext.getDefault().getCelestialBodies())
            .addCelestialBodyLoader(CelestialBodyFactory.EARTH, name -> new StubEarth());
        if ("write".equals(args[0])) {
            write(Path.of(args[1]), Path.of(args[2]));
        } else {
            read(Path.of(args[1]), Path.of(args[2]));
        }
    }

}
