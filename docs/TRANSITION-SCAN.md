# Semi-codeless dependency scan

`kshana transition scan` reads the RINEX observation headers and IGS site logs of a fleet of GNSS
stations and says, for each station, whether its declared GPS observations depend on codeless or
semi-codeless tracking of the encrypted P(Y) signal, and whether it tracks the modernised civil
signals L2C and L5. It writes a text and a JSON report with a fleet summary.

## Why

Many dual-frequency geodetic, survey and reference-station receivers form their second GPS
frequency by tracking L2 P(Y) (and sometimes L1 P(Y)) without the code: semi-codeless tracking such
as Z-tracking. The United States commitment to keep that possible is conditional. On the gps.gov
page [Codeless/Semi-Codeless GPS Access Commitments](https://www.gps.gov/codelesssemi-codeless-gps-access-commitments)
(read 27 November 2026), quoting section 3.2.8 of the 2019 Federal Radionavigation Plan:

> The USG commits to maintaining the existing GPS L1 C/A, L1 P(Y), L2C, and L2 P(Y) signal
> characteristics that enable codeless and semi-codeless GPS access until at least two years after
> there are 24 operational satellites broadcasting L5 with fully functional navigation messages.

The same page says this supersedes the commitment in the 2008 Federal Register notice
(Vol. 73 No. 185, 23 September 2008) to maintain those characteristics through 31 December 2020.
The report carries this wording and its source, so the condition it is measured against is
stated in the output.

## Usage

```sh
kshana transition scan <obs.rnx|obs.crx|obs.gz|sitelog.log|dir>... [--json] [--out <base>]
kshana transition scan tests/fixtures/transition_scan
kshana transition scan /data/rinex /data/sitelogs --json --out fleet-2026-11
```

Each input is a file or a directory (its files, not recursive). Each file is read as a RINEX
observation file (2.x, 3.x or 4.x; plain, Hatanaka CRINEX, or gzip-compressed) or an IGS-format
site log; anything else is listed as skipped with the reason. Unix compress (`.Z`) is not read.
Only the header is needed. Text is printed by default, JSON with `--json`; `--out <base>` also
writes `<base>.json` and `<base>.txt`.

Files are grouped into stations by the first four characters of `MARKER NAME` (or of the file
name) and by the site log's Four or Nine Character ID. When a station has several observation
files, the verdict uses the one with the latest `TIME OF FIRST OBS`.

## How the codes are read

| RINEX | codes | meaning |
|---|---|---|
| 3.x / 4.x | band 1 or 2 with attribute `D`, `W`, `P`, `N` (for example `C2W`, `L2W`, `C2D`, `C1W`) | formed with P(Y) access: `D` = L1 C/A + (P2 − P1) (semi-codeless), `W` = Z-tracking and similar (AS on), `P` = P code (AS off; with anti-spoofing on, a civil receiver forms it codelessly), `N` = codeless |
| 3.x / 4.x | band 2 with `S`, `L`, `X` | L2C |
| 3.x / 4.x | band 5 with `I`, `Q`, `X` | L5 |
| 2.11 | `P1`, `P2` | P-code observations (semi-codeless in a civil receiver) |
| 2.11 | `C2` | L2C pseudorange |
| 2.11 | `C5`, `L5`, `D5`, `S5` | L5 |
| 2.11 | `L2`, `D2`, `S2` alone | L2 whose tracking the code does not say |

Code meanings follow the GPS observation-code tables of RINEX 3.05 and 4.01 and the RINEX 2.11
text.

## Verdicts

| `semi_codeless_dependent` | `readiness` | when |
|---|---|---|
| `yes` | `not-ready` | P(Y)-derived codes and no L2C or L5 code |
| `partial` | `switch-needed` | P(Y)-derived codes beside L2C or L5: the civil signals are tracked, and processing that uses the P(Y) codes must move to them |
| `no` | `ready` | L2C or L5 and no P(Y)-derived code |
| `no` | `single-frequency` | GPS L1 only: not affected |
| `unknown` | `unknown` | no GPS codes, a RINEX 2 `L2` with no code that says how it was tracked, or a site log with no observation header |

Each verdict lists its reasons (the codes it rests on). With a site log, the installed receiver
(the last receiver entry with no removal date) and its firmware are reported, and a receiver type
that differs from the observation header's `REC # / TYPE / VERS` is noted. Each observation file
is listed with the SHA-256 of its bytes, so a report can be tied to the files it read (for
example inside an evidence pack).

## Limits

**Evidence: MODELLED** (an inference from what the files declare). A header lists the codes a
file may contain, not that every epoch has them; a site log does not list signals at all; and a
processing chain (a network RTK or PPP service, a geodetic analysis) can depend on P(Y) codes even
where the station also tracks L2C. The scan does not test a receiver, does not know which
receiver models can be reconfigured or upgraded, and does not say when the condition will be met.

Tests: `tests/transition_scan.rs` (synthetic headers for each verdict, a CRINEX and a gzip input,
a site log, and two real IGS header extracts already in the repository).
