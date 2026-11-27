# Continuous-UTC readiness scanner

`kshana utc-readiness` finds the leap-second assumptions in configuration files, logs, code and
data that will break or drift once **continuous UTC** takes effect.

**Source.** CGPM 2026, Resolution 5
(<https://www.bipm.org/en/cgpm-2026/resolution-5>): continuous UTC will become effective on
**20 May 2027**; the maximum |UT1 − UTC| becomes **3600 s**. From that date no leap second is
to be inserted, so TAI − UTC stays at the value then in force (37 s since 2017-01-01, if no leap
second is inserted before 20 May 2027; none was announced when this was written, to confirm
with IERS Bulletin C), and UT1 − UTC is free to grow beyond the 0.9 s that software has long
assumed.

```
kshana utc-readiness /etc/ntp.conf /etc/chrony /opt/app          # text, one line per finding
kshana utc-readiness --json --as-of 2027-01-15 /opt/app > r.json  # kshana.utc-readiness/1
```

Exit status: 0 with no `breaks` finding, 1 with at least one, 2 on a usage or input error.
Directories are walked in sorted order (`.git`, `target`, `node_modules` skipped); binary files
and files over 8 MiB are skipped and counted. `--as-of` sets the date expiry is judged against
(default: today, UTC).

## Rules

| Rule | Looks for | Class after 20 May 2027 |
|---|---|---|
| `leap-file-expiry` | the expiry of an IETF/NIST `leap-seconds.list` (`#@` line, NTP seconds) or a tzdata `leapseconds` file (`Expires` line) | `breaks` if already expired at `--as-of`, else `review` |
| `leap-file-stale` | a `leap-seconds.list` whose last entry is below TAI − UTC = 37 s | `drifts` |
| `tai-utc-constant` | `TAI-UTC`, `tai_utc`, `currentUtcOffset`, `utc_offset`, `leap_seconds` … followed by an integer | `holds` at 37, `drifts` below |
| `gps-utc-constant` | `GPS-UTC`, `gps_utc`, `gps_leap` … followed by an integer | `holds` at 18, `drifts` below |
| `dut1-limit` | a DUT1 / UT1-UTC mention on a line with a 0.9 s (or 0.8 s) limit | `breaks`: a check, clamp or field range at 0.9 s rejects, clips or overflows valid values |
| `dut1-field` | any other DUT1 / UT1-UTC value or field | `review`: width, units, sign handling, validation |
| `leap-handling` | `leapfile`, `leapsectz`, `leapsecmode`, leap smearing, the NTP leap indicator | `review`: behaviour when the leap file stops changing or expires, alarms tied to the leap indicator |
| `leap-feed` | `Leap_Second.dat`, `leap-seconds.list`, Bulletin C fetched or named | `review` |
| `leap-second-label` | `23:59:60` handling | `review`: still needed for past data |

Every finding carries the rule, the class, the file and line, the line itself (cut to 160
characters) and a message. The rules are text matches: a finding is a pointer for a person to
check, not proof that the software misbehaves, and a file the rules do not match is not shown to
be ready.

## Test vectors for |UT1 − UTC| beyond 0.9 s

`data/conformance/time/ut1-utc.json` (run with `kshana time-vectors`, docs/TIME-VECTORS.md):
UT1 from UTC for DUT1 from 0.1 s to ±3600 s, with the UT1 label to the millisecond, the Earth
rotation angle (IERS Conventions 2010, eq. 5.15) and the rotation error a 0.9 s clamp would
leave (about 15.04 arcsec per second beyond 0.9 s), and TAI − UTC = 37 s on and after
20 May 2027. Another project can run the same file against its own UT1 handling.

Code: `src/utc_readiness.rs`. Fixtures: `tests/fixtures/utc-readiness/`. Tests:
`tests/utc_readiness.rs`.
