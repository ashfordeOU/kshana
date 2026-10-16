# Case and dump format of the ADM comparison

One plain-text format serves three uses: the case inputs the test writes (`inputs.txt`), and the
dumps of what Orekit parsed (`orekit_reads_kshana.txt`). One `key=value` per line, no spaces
around `=`; the value runs to the end of the line (it may contain spaces). Numbers are written
in Java/Rust shortest round-trip form (`1.0E-5` and `1e-5` both parse). Blank lines are ignored.

```
case=A01                 starts a case; ids A01..A14 (AEM), P01..P04 (APM)
kind=AEM | APM
version=2.0 | 1.0
format=KVN | XML         dumps only: which file of the case was parsed
header.comment=...       repeatable, in order
header.classification=...   optional
header.creation_date=2026-10-13T00:00:00.000
header.originator=...
header.message_id=...    optional
```

AEM, per segment (repeatable):

```
segment
meta.comment=...         repeatable
meta.object_name=...
meta.object_id=...
meta.center_name=...     optional
meta.ref_frame_a=...
meta.ref_frame_b=...
meta.attitude_dir=A2B | B2A          version 1.0 only
meta.time_system=UTC | TAI | GPS | TT | TDB
meta.start_time=...
meta.useable_start_time=...          optional
meta.useable_stop_time=...           optional
meta.stop_time=...
meta.attitude_type=QUATERNION | QUATERNION/DERIVATIVE | QUATERNION/ANGVEL | EULER_ANGLE |
                   EULER_ANGLE/DERIVATIVE | EULER_ANGLE/ANGVEL | SPIN | SPIN/NUTATION |
                   SPIN/NUTATION_MOM
meta.quaternion_type=FIRST | LAST    version 1.0 only
meta.euler_rot_seq=ZYX               letters (2.0) or digits (1.0, e.g. 321)
meta.angvel_frame=...                optional
meta.interpolation_method=...        optional
meta.interpolation_degree=...        optional
data.comment=...                     repeatable
record=<epoch> <v1> <v2> ...         one per data line
rot=<q0> <q1> <q2> <q3>              dumps only, after each record: Orekit's rotation of
                                     AemSegment.getAngularCoordinates() at that record
                                     (Hipparchus order, scalar first)
```

Record values are in the canonical order of CCSDS 504.0-B-2 table 4-4 whatever the message
version (quaternion `Q1 Q2 Q3 QC`, then `Q1_DOT Q2_DOT Q3_DOT QC_DOT` or `ANGVEL_X Y Z`; Euler
`ANGLE_1 ANGLE_2 ANGLE_3`, then the three rates or `ANGVEL_X Y Z`; spin `SPIN_ALPHA SPIN_DELTA
SPIN_ANGLE SPIN_ANGLE_VEL`, then `NUTATION NUTATION_PER NUTATION_PHASE` or `MOMENTUM_ALPHA
MOMENTUM_DELTA NUTATION_VEL`), in the message units: deg, deg/s, s, 1/s. For version 1.0 the
values are those of the line as written (no direction flip), reordered only for
`QUATERNION_TYPE = FIRST`.

APM (version 2.0), after the header:

```
meta.comment=...      repeatable
meta.object_name=...
meta.object_id=...
meta.center_name=...  optional
meta.time_system=...
data.comment=...      repeatable
epoch=...
quat                  starts a quaternion block
quat.comment=...
quat.ref_frame_a=...
quat.ref_frame_b=...
quat.q=Q1 Q2 Q3 QC
quat.q_dot=Q1_DOT Q2_DOT Q3_DOT QC_DOT          optional
euler                 starts an Euler block
euler.comment=...
euler.ref_frame_a=...
euler.ref_frame_b=...
euler.rot_seq=ZXZ
euler.angles=A1 A2 A3                            deg
euler.rates=R1 R2 R3                             deg/s, optional
angvel                starts an angular-velocity block
angvel.comment=...
angvel.ref_frame_a=...
angvel.ref_frame_b=...
angvel.angvel_frame=...
angvel.xyz=X Y Z                                 deg/s
spin                  starts a spin block
spin.comment=...
spin.ref_frame_a=...
spin.ref_frame_b=...
spin.values=ALPHA DELTA ANGLE ANGLE_VEL          deg, deg/s
spin.nutation=NUTATION NUTATION_PER NUTATION_PHASE           optional (deg, s, deg)
spin.momentum=MOMENTUM_ALPHA MOMENTUM_DELTA NUTATION_VEL     optional (deg, deg, deg/s)
inertia               starts an inertia block
inertia.comment=...
inertia.ref_frame=...
inertia.values=IXX IYY IZZ IXY IXZ IYZ           kg m^2
man                   starts a maneuver block
man.comment=...
man.epoch_start=...
man.duration=...                                 s
man.ref_frame=...
man.torque=X Y Z                                 N m
man.delta_mass=...                               kg, optional
```

`end` closes a case. Epochs are calendar strings `YYYY-MM-DDThh:mm:ss[.f]`; dumps write them
with nine fractional digits in the segment's own time system.
