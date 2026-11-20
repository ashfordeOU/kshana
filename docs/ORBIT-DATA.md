# Orbit data: CDM, OEM and OCM checks, conversion, TLE monitors, covariance

`kshana orbit-data` checks orbit-data messages against the public CCSDS standards, converts between the OEM and the
OCM with their provenance kept, monitors two-line element sets (TLE) for quality, and handles orbit covariances.
Everything reads local files and prints to standard output; nothing is written to disk and nothing goes on the
network. The library is `kshana::orbit_data` (`src/orbit_data/`).

Exit status: 0 when the result is clean, 1 when it is not (invalid message, flagged object, error finding, a
covariance that is not positive definite), 2 on a usage or input error.

A validator says **valid against** or **invalid against** a named standard and section. That is this tool's reading
of the public text; it is not an endorsement by CCSDS or any data provider. Numbers computed through a model (SGP4 differences, propagated covariances, realism statistics) are
**MODELLED**.

## Standards read

| Message | Standard | Sections the checks cite |
|---|---|---|
| CDM (KVN and XML) | CCSDS 508.0-B-1, *Conjunction Data Message*, Recommended Standard, Issue 1, June 2013, with Technical Corrigendum 2 (October 2021) | Tables 3-1 to 3-4; 4.2, 4.3; 5.2.8, 5.2.9; 6.2.2, 6.2.3, 6.2.4; 6.3.1 to 6.3.3; annex E (RTN) |
| OEM (KVN) | CCSDS 502.0-B-3, *Orbit Data Messages*, Recommended Standard, Issue 3, April 2023, section 5 | 5.2.2 to 5.2.5, Tables 5-2 to 5-4, 7.5.10 |
| OCM (KVN and XML) | CCSDS 502.0-B-3, section 6 | 6.2.2.3 to 6.2.2.5, 6.2.5.6, 6.2.5.9, 6.2.7.6, 6.2.7.10, 6.2.7.12, Tables 6-3 and 6-4 |

The blue books are public at <https://public.ccsds.org/Pubs/>. The OCM syntax and keyword checks are those of the
engine's OCM reader (`kshana::odm::OcmMessage`, checked against Orekit in `tests/odm_orekit_oracle.rs`); `PERT` and
`OD` blocks, which that reader does not support, are set aside and listed under "not checked". OEM in XML is not
read by `check` yet.

## `kshana orbit-data check <file>`

```
kshana orbit-data check <cdm|oem|ocm file> [--json] [--aliases <map.json>] [--min-span-days <d>] [--max-gap-s <s>]
```

The message type comes from the first keyword (`CCSDS_CDM_VERS`, `CCSDS_OEM_VERS`, `CCSDS_OCM_VERS`) or the XML root
(`<cdm>`, `<ocm>`). Each finding has a severity, a stable code, the rule (standard and section), the line (KVN) and
keyword, and a message. `--json` prints the report as JSON.

**Errors** (a shall-clause is broken; the message is invalid): line length over 254 characters and characters that
are not printable ASCII (CDM 6.2.2); a line that is not `KEYWORD = value`; a keyword with a blank or in lower case;
units not after a blank or not in brackets (6.3.3); the first keyword; a keyword the section does not define, given
twice or out of the fixed order (6.3.1.3, 6.3.1.9); a missing obligatory keyword; an empty value (6.2.3.1); time tags
that are not `yyyy-mm-ddThh:mm:ss[.d]` or `yyyy-dddThh:mm:ss[.d]` (6.3.2.6); numbers outside the KVN notation
(6.3.2.1 to 6.3.2.3); normative values (`OBJECT`, `OBJECT_TYPE`, `COVARIANCE_METHOD`, `MANEUVERABLE`, `REF_FRAME`,
`SCREEN_VOLUME_FRAME`/`SHAPE`, the YES/NO flags); `COLLISION_PROBABILITY` outside 0 to 1 and `RESIDUALS_ACCEPTED`
outside 0 to 100; lower-case text values (6.2.3.3); units that differ from the tables (6.2.4.1); the international
designator format (Table 3-3); identifier characters (5.2.9); the two object sections, OBJECT1 then OBJECT2; the
same `REF_FRAME` for both; the 9x9 covariance row rule (5.2.8). For the OEM: header and metadata keywords (5.2.2,
5.2.3), `INTERPOLATION_DEGREE` with `INTERPOLATION`, a fixed `TIME_SYSTEM` (5.2.4.5), data lines of 6 or 9 values
(5.2.4.1), data and useable times inside START_TIME..STOP_TIME (Table 5-3), useable spans of consecutive segments
that overlap (5.2.4.4), enough data lines for the interpolation degree (5.2.4.7), covariance `EPOCH`, 21 values and
increasing epochs (5.2.5). For the OCM: one time form per block (6.2.2.5), no repeated tags (6.2.2.4), increasing
tags (6.2.5.6, 6.2.7.6), enough trajectory lines for the interpolation degree (6.2.5.9), the covariance layout for
`LTM`, `UTM` and `FULL` (6.2.7.12) and positive definiteness (6.2.7.10).

**Warnings** (the message is valid, but something does not add up): in a CDM, `MISS_DISTANCE`, `RELATIVE_SPEED` and
the RTN components of `RELATIVE_POSITION_*`/`RELATIVE_VELOCITY_*` against the two objects' states, by the definitions
in Table 3-2 and annex E, within 1 m (or 1 m/s) plus 0.5 % (the tolerance is this tool's choice, to absorb values
given to whole metres); the screening period, the screening-volume entry and exit, and `TCA`; the last-observation
interval and `CREATION_DATE`; `OBS_USED` and `TRACKS_USED` against what was available; a 6x6 covariance that is not
positive definite (judged on the correlation matrix) or has a zero variance (5.2.8). In an OEM: repeated or
decreasing ephemeris epochs (5.2.4.7 needs interpolable data), a covariance that is not positive definite (the OEM
states no such rule; the OCM does, 6.2.7.10). In an OCM: `TIME_SPAN` against START_TIME and STOP_TIME (Table 6-3),
data outside them, useable times outside the trajectory's data.

**Profile** (`--min-span-days`, `--max-gap-s`): limits a receiving system may set, such as a screening service that
drops ephemerides shorter than a stated span. They are reported as warnings with the rule `profile`, never as a
breach of the standard. No default is applied: the limit is the caller's statement.

**Aliases** (`--aliases map.json`, CDM only): a JSON object mapping a provider's own field names to the standard
keywords, for example `{"MISS_DIST": "MISS_DISTANCE", "NORAD_ID": "OBJECT_DESIGNATOR"}`. Names are matched in upper
case; a target that is not a CDM keyword is refused. The message is then checked as the standard keywords.

### What the standard's own examples show

The three CDM examples of CCSDS 508.0-B-1 are fixtures (`tests/fixtures/orbit_data/`, transcribed with ASCII minus
signs where the PDF renders U+2212). The checker reports, and the tests pin:

- Section 3.6.2 (obligatory keywords only): valid. Object1's 6x6 covariance is **not positive definite**: the
  correlation of T and R_dot is -5.476 / sqrt(2533 x 0.005744) = -1.44, beyond -1.
- Section 3.6.3 (with optional keywords): **invalid**: `TRACKS USED` has a blank in the keyword (6.3.1.5), and
  `START_SCREEN_PERIOD` and `STOP_SCREEN_PERIOD` use a colon before the fraction of a second (6.3.2.6). The same
  covariance warning. `MISS_DISTANCE` (715 m against 715.8 m from the states), `RELATIVE_SPEED` and the R components
  agree with the states; `RELATIVE_POSITION_T` (-70.2 m against -93.7 m) and `RELATIVE_VELOCITY_N` (-1437.2 m/s
  against -1923.6 m/s) do not: the given T and N components are rotated by about 1.9 degrees about R from those that
  annex E's definition gives in the stated EME2000 frame. The standard does not say how the example was made.
- Section 4.4 (XML): valid, with the same three warnings.

Figure G-11 of CCSDS 502.0-B-3, as committed in `tests/fixtures/ccsds/`, elides most data lines; with four lines per
segment its stated `INTERPOLATION_DEGREE = 7` cannot be carried (5.2.4.7), and the checker says so. Nothing else is
reported.

## `kshana orbit-data convert <file> --to <ocm|oem|cdm>`

- **OEM to OCM**: each OEM segment becomes a `TRAJ` block (`CARTPV`, or `CARTPVA` with accelerations); `REF_FRAME`,
  `REF_FRAME_EPOCH`, `CENTER_NAME`, `USEABLE_*` and `INTERPOLATION*` are carried; the covariance matrices become `COV`
  blocks (`CARTPV`, `LTM`, one block per run of the same frame). An OEM with more than one object is refused (an OCM
  holds one, 502.0-B-3 6.1.2). `OBJECT_ID` goes to `INTERNATIONAL_DESIGNATOR` when it has that form, else to
  `OBJECT_DESIGNATOR`.
- **OCM to OEM**: each `CARTPV`/`CARTPVA` trajectory becomes a segment; each `CARTPV` covariance (`LTM`, `UTM` or
  `FULL`) becomes a lower-triangular matrix in the segment whose span holds its epoch. Relative time tags are made
  absolute (to the microsecond). Position-only trajectories and other covariance types have no OEM form and are
  refused.
- **CDM to CDM**: the message (KVN or XML, with `--aliases`) written as KVN in the standard keyword order with the
  standard units; keywords the standard does not define are dropped.

Numbers are carried as the text written, so states, covariances and absolute epochs survive OEM to OCM to OEM
unchanged (`tests/orbit_data.rs` checks this for three OEMs, comparing the engine's own OEM reader's states). A
segment's START_TIME and STOP_TIME are rebuilt from its first and last data line.

**Provenance.** The source's header comments, `CLASSIFICATION`, `CREATION_DATE`, `ORIGINATOR` and `MESSAGE_ID` are
kept, and each conversion adds one header comment

```
COMMENT PROVENANCE SOURCE=<OEM|OCM> ORIGINATOR=<o> MESSAGE_ID=<id|NONE> CREATION_DATE=<t> TOOL=kshana-orbit-data-convert
```

Earlier `PROVENANCE` lines are kept, so a chain of conversions (for example OEM to OCM to OEM) carries one line per
step and the original originator survives. The line is a comment: any reader of the standard ignores it.

## `kshana orbit-data gp-compare <a.tle> <b.tle>`

```
kshana orbit-data gp-compare <a.tle> <b.tle> [--hours <h>] [--step-min <min>] [--threshold-km <km>] [--json]
```

Two sources of element sets for the same objects: for example the public GP catalogue and an operator's
supplemental GP, two providers, or two archive days. For each catalogue number in both, the latest set of each source
is propagated with the engine's SGP4 (WGS-72, improved mode) from the later of the two epochs over the window
(default 24 h every 10 min), and the position difference is reported: largest, RMS, and the radial, transverse and
normal components (in source B's RTN axes) at the largest. An object is flagged above the threshold (default 25 km,
a choice of this tool) or when SGP4 fails. Catalogue numbers in only one source are listed. Exit 1 when any object is
flagged. The differences are MODELLED: they compare two element sets through one model and say nothing about which
is closer to the true orbit.

## `kshana orbit-data gp-audit <sets.tle> ...`

```
kshana orbit-data gp-audit <sets.tle> ... [--at <epoch>] [--stale-days <d>] [--jump-km <km>] [--json]
```

One source on its own (several files are read as one). Per set: the column-69 checksums of both lines; line 1 and
line 2 naming the same catalogue number (digits or Alpha-5); that the elements parse; a perigee below the Earth's
surface; SGP4 failing at the epoch (error) or a day later (warning); and, with `--at`, the age of the epoch: older than
`--stale-days` (default 30) or after the reference time. Per object with several sets, in epoch order: an element set
number that goes back; two sets with the same epoch and different elements; and consecutive sets whose earlier one,
propagated to the later epoch, differs from the later one by more than `--jump-km` (default 25 km): a manoeuvre or a
bad set. Exit 1 when any finding is an error.

## `kshana orbit-data cov <command> <input.json>`

The input is JSON with `state_km` (position km, velocity km/s, inertial) and either `cov_km` (6x6 rows, km², km²/s,
km²/s²) or `cov_ltm_km` (the 21 lower-triangular values); `"frame": "RTN"` marks an RTN covariance for `check`.

| Command | What it does |
|---|---|
| `check` | positive definiteness in the inertial frame and in RTN (the covariance is rotated and checked again); prints both matrices |
| `propagate --dt-s <s> [--step-s <s>]` | the state and covariance at `t0 + dt` (negative goes back) through the variational state-transition matrix of the two-body + J2 dynamics (RK4, `kshana::orbit_determination::propagate_with_stm`); prints inertial and RTN |
| `monte-carlo --dt-s <s> [--samples <n>] [--seed <n>]` | draws from N(state, cov), propagates each draw with the same dynamics, and compares the sample covariance with the linear one (largest variance-ratio error, largest correlation error, and the sampling sigma of a variance ratio, sqrt(2/(n-1))) |
| `synthetic --sigma-rtn r,t,n,rdot,tdot,ndot` | a covariance from stated 1-sigma values in RTN (m, m/s), uncorrelated in RTN, in the inertial frame of the state |
| `realism [--full]` | covariance-realism statistics over `{"predictions": [{"predicted_km", "cov_km", "reference_km"}...]}`: squared Mahalanobis distances (3 degrees of freedom, or 6 with `--full`), their mean against the degrees of freedom, the share inside the 95 % chi-square bound, the scale factor, and the Kolmogorov-Smirnov distance to the chi-square distribution |

All results are MODELLED. The dynamics are two-body + J2 only: a propagated covariance shows how a covariance maps
under that model, not how a real orbit's uncertainty grows with drag, third bodies and solar pressure. The tests check
the linear propagation against Monte Carlo over 30 minutes in low Earth orbit (variance ratios within four sampling
sigmas), forward-then-back propagation returning the covariance, and the realism statistics on draws from a known
covariance (scale factor near 1, near 4 when the stated covariance is halved in sigma).

## Not here

- Conjunction screening, collision-probability methods and conjunction-assessment verification are not part of this
  module; it checks the data formats and their consistency only.
- SatNOGS database checks (transmitter status) need that database and are not built.
- OEM in XML, the OCM `PERT` and `OD` blocks, and CDM version 2 are not checked.

## Fixtures

`tests/fixtures/orbit_data/README.md` lists every fixture and where it comes from. The element sets are SELF-MADE
(`gen_selfmade_tles.py`, placeholder catalogue numbers 90001 to 90014; the consistent pair is built with the SGP4
secular rates written out in Python from Hoots and Roehrich, Spacetrack Report No. 3, so the engine's SGP4 carries one
onto the other to within 50 m).
