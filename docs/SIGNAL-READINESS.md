# Future-signal readiness

`kshana signal-readiness` checks whether a receiver configuration is ready for the constellations
as they are now published: extended PRN and satellite-number ranges, the new civil signals (GPS L1C,
L5, Galileo E1/E5a, BeiDou B1C/B2a, SBAS L5), and BeiDou used as a core constellation. It also checks
real observation files against the configuration, listing satellites and signals in the data that
the configuration would drop.

It is a check of declared numbers and codes against public documents. It does not test a receiver,
and it is not a statement about any avionics standard or approval.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| BDS | BeiDou Navigation Satellite System |
| ICD | interface control document |
| JSON | JavaScript Object Notation |
| PRN | pseudo-random noise (code number) |
| QZSS | Quasi-Zenith Satellite System |
| RINEX | Receiver Independent Exchange Format |
| SBAS | satellite-based augmentation system |
| SVID | space vehicle identifier |
| TOML | Tom's Obvious Minimal Language |

## Command

```bash
kshana signal-readiness examples/signal-readiness/legacy-receiver.toml \
  tests/fixtures/rinex4_obs_mao0_2023198/MAO000USA_R_20231980000_4EP_30S_MO.rnx
```

It writes a `kshana.signal-readiness/1` report as JSON: the reference ranges used, the profile's
findings, and per file its summary (version, epochs, satellites and observation codes per system)
and findings. The example observation file is a slice of a real IGS/MGEX RINEX 4 file
(see its `NOTICE.md`); it carries BeiDou satellites C57, C59 and C62, GPS L1C and BDS B1C and B2a.

## The profile

```toml
name = "my receiver"
[gps]                          # also [sbas], [galileo], [beidou], [qzss]
max_number = 32                # the highest PRN accepted (SBAS: the PRN, not Snn; QZSS: J number)
codes = ["C1C", "C2W"]         # RINEX pseudorange codes tracked
in_solution = true             # used in the solution
```

## Reference values

| System | Range | Source |
|---|---|---|
| GPS | PRN 1–63 reserved for GPS | gps.gov, *L1 C/A PRN Code Assignments*, January 2026 edition |
| SBAS | PRN 120–158; allocations above 138 listed in the report | the same table |
| Galileo | SVID 1–36 | Galileo OS SIS ICD, Issue 2.1, November 2023 (codes assigned to SVID n = 1 to 36) |
| BeiDou | PRN 1–63 | BDS SIS ICD Open Service Signal B2a, Version 1.0, December 2017, section 7.1 (B1C and B2a of one satellite share the PRN) |
| QZSS | J01–J10 | RINEX 4.01 (10 July 2023), section 4.5 and Table 6 |

Signals, by their RINEX 4.01 pseudorange codes (Tables 10, 12, 13 and 15): GPS L1C `C1S` `C1L`
`C1X`; GPS L5 `C5I` `C5Q` `C5X`; Galileo E1 OS `C1B` `C1C` `C1X`; Galileo E5a `C5I` `C5Q` `C5X`; BDS
B1C `C1D` `C1P` `C1X`; BDS B2a `C5D` `C5P` `C5X`; SBAS L5 `C5I` `C5Q` `C5X`.

## Findings

| Check | Level | Meaning |
|---|---|---|
| `system-absent` | gap | the profile has no entry for a system in the reference table |
| `number-range` | gap | the profile's highest number is below the published range (SBAS: the allocated PRNs it would drop are listed) |
| `not-in-solution` | gap | GPS, Galileo or BeiDou is tracked but not used in the solution |
| `signal-not-tracked` | gap | none of a signal's codes is in the profile |
| `system-dropped` | drop | the file has satellites of a system the profile lacks |
| `satellites-beyond-range` | drop | the file has satellites above the profile's highest number |
| `codes-not-tracked` | drop | the file declares pseudorange codes the profile does not track |
| `signal-in-data` | info | a signal of the table is present in the file |

## Limits

- The ranges are as published on the dates given; allocations change (the SBAS table is reissued).
- A GPS ICD (IS-GPS-200, IS-GPS-800) could not be retrieved from gps.gov when this was written; the
  GPS range is taken from gps.gov's own PRN assignment table, which refers to IS-GPS-200.
- Only RINEX 3 and 4 observation files are read.
