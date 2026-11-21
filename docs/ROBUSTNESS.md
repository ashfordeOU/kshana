# Parser robustness

Every byte and text parser in kshana reads input that came from outside: receiver logs, RINEX and
SP3 products, RTCM streams from a caster, CCSDS messages from another tool. Public GNSS software has
a long record of out-of-bounds reads and crashes in exactly these readers (RTCM, NTRIP and RINEX
parsing among them). kshana's rule is that a parser **returns a value or an error, never panics, and
never makes a large allocation because a field in the input asked for one**.

`tests/parser_robustness.rs` holds the parsers to that rule.

## How it works

* **Deterministic mutation fuzzer** (no extra dependency). A SplitMix64 stream seeded from each
  target's name drives the mutations, so a failure reproduces from the test name alone. Each target
  gets:
  * the empty input and a few one-byte inputs;
  * every line-boundary prefix of each seed, and every byte prefix of a small seed (a sample of a
    large one): truncated files and streams cut mid-record;
  * `KSHANA_FUZZ_CASES` mutated copies of the seeds (default 600): bit flips, "interesting" bytes
    (0, 0xFF, sync bytes, separators), deleted, inserted and duplicated runs, swapped lines, and
    numeric fields replaced by extreme values (`99999999999999999999`, `4294967296`, `-1`, `NaN`,
    `inf`, `1e308`, `60`, `61`, ...);
  * for framed binary protocols (UBX, SBF, RTCM 3), randomly filled frames with **valid framing and
    checksums** (UBX Fletcher, SBF CRC-16, RTCM CRC-24Q), so the payload decoders are reached and not
    only the framers.
* **Allocation accounting.** The test binary installs a counting global allocator that records, per
  thread, the largest single allocation request and the peak growth of live heap during each parser
  call. On an input of at most 64 KiB, a call that asks for more than 64 MiB at once or grows the heap
  by more than 256 MiB fails the test. (An allocation so large that the system refuses it aborts the
  test process with a backtrace naming the parser; that is still a failure, just a louder one.)
* **Reports.** Failures are grouped by panic location (with the kshana frames of the backtrace, so a
  panic inside the standard library still names the parser) and printed with the shortest input that
  triggered each one.

The seeds are real files from `tests/fixtures/` (IGS RINEX navigation and observation files, SP3,
RINEX clock, ANTEX, DCB, IONEX, RTCM 3 logs, C37.118 and ASTERIX streams, CCSDS OEM/TDM/AEM/APM, NMEA
voyages, Celestrak TLE sets) or short synthetic samples written in the test.

## What is covered

| Area | Parsers |
|---|---|
| GNSS products | RINEX 3/4 navigation (`rinex::parse_nav`), GLONASS navigation, RINEX observation (`rinex_obs::parse_obs`, `realdata::rinex`), SP3 (orbits and accuracy), RINEX clock (`precise_products`, `realdata::clk`), ANTEX, code DCB, Bias-SINEX, IONEX (`parse_ionex`, `parse_ionex_file`), IERS EOP (finals, Bulletin B) |
| Time transfer and clocks | CGGTTS, BIPM Circular T section 1, BIPM UTC(k) tables, every clock-log format (`rinex-clk`, TimeLab, TICC, ptp4l, phc2sys, ts2phc, chrony tracking/statistics, ntpd loopstats/peerstats, White Rabbit, CGGTTS, PPS) under all three gap policies |
| Receiver logs | NMEA 0183, IEC 61162-450, u-blox UBX (receiver trust, `realdata::ubx`, OSNMA page extraction), Septentrio SBF, RTCM 3 (MSM reader, MSM decoder, SSR reader), NovAtel, Swift SBP, Javad GREIS, Unicore, RTKLIB `.pos`, Android GnssLogger, GNSS-SDR monitor, `kshana.obs/1` |
| Orbits | TLE (sets, propagator dispatch, identity, checksum), Alpha-5 catalogue fields, OMM to SGP4, CCSDS OEM (and covariance), TDM, AEM, APM, OPM, OMM, OCM, NDM/XML |
| Other protocols | IEEE C37.118, ASTERIX CAT021, CCSDS Space Packet, PTP management, NMEA 2000 candump, SigMF, LEO navigation-message frames, ODF, ArduPilot DataFlash and PX4 ULog (drone pre-arm reader), drone epoch JSON Lines and estimator traces |
| Other text | YUMA almanac, LOLA DEM text, ILRS CRD, LuGRE logs, ION SDR metadata, sat-grid and scintillation logs, PDS SHADR gravity tables, OSNMA page files, RFC 3339 and CCSDS epochs |

## What it found and what changed (this round)

| Parser | Defect | Fix |
|---|---|---|
| `ccsds_tdm` | `PARTICIPANT_<n>` resized the participant list to `n`: `PARTICIPANT_999999999999` asked for ~100 GB | indices above 5 (the standard's maximum) are kept as unrecognised keys |
| `clock_library::series` (all clock logs, RINEX clock series) | the grid length came from the time span over the sample interval: a corrupt time stamp or `tau0` asked for tens of GB | the grid is bounded (1024 epochs per sample, at least 4096, at most 2^26); a longer one is refused with an error and counted in `GriddingLog::grid_refused` |
| `ionex` | node counts from `LAT1/LAT2/DLAT` overflowed (`attempt to add/multiply with overflow`) or sized a 100+ MB grid | node counts computed in floating point and bounded to 2^20 per map; a larger grid is an error |
| `rinex_obs` | a negative satellite count became a huge `usize` capacity (`capacity overflow`) | the count must be a non-negative integer, and the reservation never exceeds the lines left |
| `realdata::lola_dem` | `n_lat × n_lon` from the header sized the reservation (overflow or OOM) | checked product, reservation capped by the text length |
| `receiver_trust::ingest` (SBF) | `sbf_tools` 0.4 indexes a `MeasEpoch` sub-block before checking its declared length, so `SB1Length < 3` panicked | `MeasEpoch` blocks with sub-block lengths below the format's 20/12 bytes are skipped records before they reach `sbf_tools` |
| `cggtts` | a non-ASCII byte made the checksum split land inside a UTF-8 character | non-ASCII lines are malformed; the MJD arithmetic no longer overflows on an extreme MJD |
| `sp3` | the same for the `+` satellite-list line | the list is read as byte triples |
| `precise_products` (RINEX clock, ANTEX) | the same at the column-60/61 label | `str::get` slicing |
| `n2k` | the same in the candump data field | non-ASCII data is not a frame |
| `realdata::llr_crd` | a 7-field normal-point record indexed the optional 8th field | optional fields read with `get` |

## Run

```sh
cargo test --test parser_robustness                          # default: 600 mutations per target
KSHANA_FUZZ_CASES=50000 cargo test --release --test parser_robustness   # a longer soak
```

The default run takes about a minute in a debug build. The longer soak is the one to run before a
release or after touching a parser. When a target fails, the report prints the failing input; copy it
into a unit test next to the parser when fixing it.

## Adding a parser

Add a `fuzz("name", &seeds, generator, |bytes| { let _ = my_parser(...); })` call to the right test
in `tests/parser_robustness.rs`, with a real file from `tests/fixtures/` as the seed where one
exists. For a framed binary protocol, add a generator that writes valid frames with random payloads
(see `gen_ubx`, `gen_sbf`, `gen_rtcm3`). For a parser whose input sizes an allocation, bound the
allocation by the input (lines or bytes left) or by a documented maximum, and return an error beyond
it.

## Limits (honest)

* This is a mutation fuzzer, not a coverage-guided one: it finds the defects random corruption of
  real files reaches. A coverage-guided fuzzer (cargo-fuzz/libFuzzer) would go deeper; it is not wired
  in because it needs a nightly toolchain and an extra harness crate.
* Time is not bounded: a parser that loops forever on some input would hang the test rather than fail
  it. None did in the runs so far.
* The allocation check sees allocations made on the calling thread; the parsers here are
  single-threaded.
* Third-party decoders (`sbf_tools`) are fuzzed through kshana's wrappers; a panic found there is
  guarded in kshana (as above) rather than fixed upstream.
