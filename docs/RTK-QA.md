<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# RTK, NTRIP and correction-service quality

`kshana rtk-qa` checks the parts of an RTK workflow that fail quietly: a correction stream that
stops on a connection that stays open, a base station broadcasting the wrong coordinate or the
right one in another frame, a fix that is wrong, a post-processing run that never fixes, a caster
or client that handles NTRIP 2 differently than expected, credentials in a log, and a
correction-source failover policy. Every result is JSON on standard output with a one-line summary
on standard error, and every result is labelled **MODELLED**: the thresholds and the score are this
module's conventions, checked on the fixtures in `tests/rtk_qa.rs`, not validated in a field
campaign. Library: `kshana::rtk_qa`.

```sh
kshana rtk-qa monitor caster.example:2101 --mount TLL00EST0 --user rover --password-env NTRIP_PASSWORD --seconds 600
kshana rtk-qa sources caster.example:2101 --near 59.44,24.75
kshana rtk-qa base examples/rtk-qa/base.rtcm3 --reference examples/rtk-qa/reference.toml --epoch 2026.9
kshana rtk-qa fix examples/rtk-qa/session.pos --control CP1,59.437,24.753,40.0
kshana rtk-qa ppk rover.obs --base base.obs
kshana rtk-qa probe caster.example:2101 --mount TLL00EST0 --user rover --password-env NTRIP_PASSWORD
kshana rtk-qa caster --listen 127.0.0.1:2101 --stream examples/rtk-qa/base.rtcm3 --mount KSH0 --chunk-ext --clients 1
kshana rtk-qa log-check client.log --user rover --password-env NTRIP_PASSWORD
kshana rtk-qa failover examples/rtk-qa/failover.json
```

Passwords are read from the environment variable named by `--password-env`, never from the
command line, and nothing `rtk-qa` prints carries them.

## Stream liveness and the mountpoint scorecard (`monitor`)

The monitor opens the mountpoint with Kshana's NTRIP client and reads it on its own thread; every
100 ms it checks:

- **stale**: no RTCM 3 frame with a valid CRC-24Q for `--stale-after` seconds (default 3) while
  the connection is still open. Bytes that are not valid frames do not count. One alarm per
  silence, then **recovered** when frames come back. A stream that stops is alarmed 3 s after its
  last frame, inside the 5 s the requirement asks for (`tests/rtk_qa.rs`).
- **message-gap**: a message type that arrived at least three times has been missing for three
  of its median intervals (while the stream as a whole is alive), then **message-resumed**.
- **closed**: the caster closed the connection.
- **link-over-budget**: with `--link-bps`, the busiest second of the stream needs more than the
  link (a radio or telemetry link that would drop corrections).

Alarms are JSON lines as they happen; the scorecard follows: availability (the share of the run
not stale), stale events, longest silence, MSM latency (the receiving computer's clock minus the
MSM epoch time: GPS time for GPS, Galileo, QZSS, SBAS and NavIC, BeiDou time, GLONASS time of day;
it includes that computer's clock error), completeness of the MSM epochs (received over the epochs
the median interval implies), CRC failures, per-message counts and intervals, the last 1005/1006
station message, mean and peak bit rate, and a 0-100 score: 40 for availability, 20 for latency
(full at a median of 1 s or less, none at 5 s), 20 for completeness, 10 for intact frames (none at
10 % CRC failures) and 10 for a station message. The weights are a convention, not a standard.

`sources` reads a caster's source table (from a file or from the caster) and lists the `STR`
records with their format, carrier, systems, position, whether the caster wants a GGA position,
network or single-base solution, authentication, fee and bit rate; `--near <lat,lon>` sorts them by
great-circle distance, those without a position last.

## Base coordinate, frame and epoch (`base`)

The 1005/1006 messages of a recorded stream are compared with a reference file (TOML or JSON;
unknown fields are refused):

```toml
[project]
frame = "ETRF2020"        # the frame the project's coordinates are in
epoch = 2026.9            # their epoch
tolerance_m = 0.02        # default 0.02
height_tide = "tide-free" # GNSS heights (the default)
geoid_tide = "mean-tide"  # the geoid model's tide system

[[station]]
id = 7                    # RTCM station id (without one: the nearest broadcast within 100 m)
name = "TLL0"
frame = "ITRF2020"
epoch = 2015.0
ecef_m = [2952564.8, 1361338.5, 5468884.0]
velocity_m_per_yr = [-0.0187, 0.0131, 0.0069]
antenna_height_m = 0.0
# geoid_undulation_m and orthometric_height_m: checked against the broadcast height
```

For each station the broadcast antenna reference point is compared with candidates: the published
coordinate moved to the observation epoch (`--epoch`, a decimal year; default today) with its
velocity, the same in every other frame and at the published epoch, and the published coordinate
shifted by the antenna height along the vertical. The verdict is **ok** when it matches the
published coordinate within the tolerance; **warn** with `frame-epoch-mismatch` (naming the frame
and epoch it matches, for example `ETRF2020@2026.90` or `ITRF2020@2015.00`) or
`marker-arp-confusion` when it matches another candidate; and **fail** with `unexplained-offset`
when it matches none (a base shifted by 5 cm fails; `tests/rtk_qa.rs`). It also reports
`project-frame-mismatch` (the network's frame and epoch against the project's: an ITRF2020 network
for an ETRF2020 project is about 0.9 m off in Europe in 2026), `coordinates-changed` (the
coordinate moved during the stream), `antenna-height-differs`, `non-physical-station` (a virtual
reference station), `itrf-year-field`, `height-inconsistent` (broadcast height minus the geoid
undulation against the published orthometric height) and `tide-system-mismatch`.

Frames: ITRF2014 and ITRF2020 (IGS14/IGb14 and IGS20/IGb20 are read as these), ETRF2014 and
ETRF2020. ITRF2020 to ITRF2014 uses the 14 parameters published by the IGN ITRF centre (epoch
2015.0); ITRFyy to ETRFyy uses the rotation rates of EUREF Technical Note 1 (epoch 1989.0). Other
frames (ETRF2000, national realisations): give the station's coordinate in one of these. Permanent
tide follows Ekman (1989): with `P = 0.099 - 0.296 sin²φ` m, the mean-tide geoid is `1.3 P` above
the tide-free one, the zero-tide geoid `0.3 P`, and the mean- or zero-tide crust `0.6 P`; mixing
tide-free GNSS heights with a mean-tide geoid puts orthometric heights about 7 cm off at 59° N.

## Fix verification and float warnings (`fix`)

A solution file (RTKLIB-style `.pos` in latitude/longitude/height or ECEF, or NMEA GGA) is split
into occupations (the antenna staying within `--radius` metres, default 2, for 5 epochs or more)
and each is checked on its positions, independently of the receiver's fix flag:

| Finding | When |
|---|---|
| `inconsistent-fixes` (fail) | two runs of fixed epochs of one occupation (a run ends at any epoch that is not fixed) disagree by more than `--h-tol` (3 cm) horizontally or `--v-tol` (5 cm) vertically; the run with fewer epochs, or the one farther from a control point, is named. When the difference is within 1.5 cm of a carrier wavelength (L1 19.0 cm, L2 24.4 cm, L5 25.5 cm, wide-lane 86.2 cm) the finding names it: one wrong integer is the likely cause |
| `fix-jump` (fail) | consecutive fixed epochs differ by more than the tolerance |
| `control-mismatch` (fail) / `control-ok` | the fixed position against a `--control <name,lat,lon,h>` point within the occupation radius |
| `fix-disagrees-with-float` | the fixed position is more than four float standard deviations, and the tolerance, from the converged float positions |
| `optimistic-sigma` | the scatter of the fixed run is more than three times the reported standard deviation, and over 1 cm |
| `float-precision-misleads` | no fix, yet the reported horizontal standard deviation is under 2 cm |
| `low-ratio`, `stale-corrections` | more than a fifth of the fixed epochs under a ratio of 3; an age of differential over 10 s |

Kshana's own RTK engine writes this file: `kshana::rtk_real::to_pos` turns a run into a `.pos` with
the standard deviations and covariances of the filter (the float baseline block, or after a fix the
covariance conditioned on the integers) rotated into east, north and up. On the real WTZR/WTZZ
session (`tests/rtk_qa_wettzell.rs`) the check passes, with the published ITRF2020 coordinate of
WTZZ as control point within 2 cm, and the same session with one L1 wavelength added to a later
run of fixes fails with `inconsistent-fixes`, wavelength L1.

The verdict per occupation is `pass`, `warn`, `fail` or `no-fix`; the exit code is 1 when any
occupation fails. A wrong fix that every run of an occupation shares is invisible to these checks
without a control point.

## PPK: why there is no fix (`ppk`)

From the rover's RINEX observation file and, with `--base`, the base's, `ppk` lists the likely
causes, failures first: `no-carrier-phase` (the rover, or `base-no-carrier-phase` the base, logged
no phase: raw measurement output was off), `no-time-overlap`, `no-common-epochs`, `short-overlap`
(under 10 minutes), `few-common-satellites` (fail under 4, warn under 6), `few-satellites`,
`single-frequency`, `frequent-loss-of-lock` (over 10 loss-of-lock flags per satellite-hour),
`data-gaps`, `low-signal` (mean first-band C/N0 under 35 dB-Hz), `base-interval-coarse` and
`long-baseline` (over 20 km between the header positions).

## NTRIP v2 behaviour checks (`probe`, `caster`, `log-check`)

These are behaviour checks against the request layout casters publish. RTCM 10410.1 is not
reproduced or consulted, and passing them is not a statement of conformance to it.

`probe` checks a caster from the client side: the source table with NTRIP 2 (`200`,
`gnss/sourcetable`, `ENDSOURCETABLE`) and NTRIP 1, the mountpoint listed, a request without
credentials and one with a wrong password refused with `401` and a `WWW-Authenticate` header, an
unknown mountpoint not answered with a stream, and the stream with NTRIP 2 (well-formed chunks,
chunk extensions noted) and NTRIP 1, each holding intact RTCM 3 frames.

`caster` is a reference caster for testing clients: one mountpoint serving a file, NTRIP 2 with
chunked transfer encoding (`--chunk-ext` adds a chunk extension a client must skip) and NTRIP 1,
Basic authentication, the source table, and limits for a caster that has to stay up: at most
`--max-clients` at once (default 16; more get `503`), a 5 s deadline for the request head and an
8 KiB cap on it (`431`). For every client it prints what the client sent against NTRIP 2 practice:
the request line, `Ntrip-Version: Ntrip/2.0`, a `User-Agent` beginning `NTRIP`, `Host`, the
credentials, the GGA checksum, no credentials in the URL, and whether the whole stream was taken.
Kshana's own client meets every check and curl meets every one but the `User-Agent`
(`tests/rtk_qa.rs`).

`log-check` scans a client's log for the password, the Base64 Basic token, an unredacted
`Authorization` header or a `user:password@` URL, with line numbers; the exit code is 1 when it
finds any. `kshana::rtk_qa::protocol::redact` removes them from a line.

## Correction-source failover (`failover`)

A JSON or TOML test describes the sources (latency, correction interval, outages), the policy
(preference order, switch away when nothing has arrived from the active source for
`switch_after_s`, switch back once a preferred source has been healthy for `switch_back_hold_s`) and
the rover's limit on the age of its corrections (`max_age_s`). A source is healthy while its
corrections keep arriving at their interval:

```json
{"duration_s": 900, "max_age_s": 8,
 "policy": {"order": ["radio", "ntrip", "lband"], "switch_after_s": 5, "switch_back_hold_s": 60},
 "sources": [{"name": "radio", "latency_s": 0.5, "outages": [[100, 200]]},
             {"name": "ntrip", "latency_s": 1.5, "outages": [[150, 400]]},
             {"name": "lband", "latency_s": 6.0, "interval_s": 5}]}
```

The result lists the switches, the largest correction age at the rover, the time above
`max_age_s`, and `age-over-limit` and `flapping` (more than four switches in 600 s) findings; the
exit code is 1 with any finding.
