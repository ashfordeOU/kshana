# gps-sdr-sim IQ cross-check fixture

Reference output for `tests/iq_gpssdrsim_cross_generator.rs` (the GNSS IQ layer against an
independent GPS L1 C/A baseband generator). Regenerate with `scripts/gen_iq_gpssdrsim_ref.sh`
(needs network, a C compiler and make; nothing here is run at test time).

- Oracle: gps-sdr-sim, Takuji Ebinuma, MIT licence,
  <https://github.com/osqzss/gps-sdr-sim>, commit 28ca29a6719475195e3aabd5930c4ed02d67190f
  (2025-01-07), built with its own Makefile (`-O3 -Wall -D_FILE_OFFSET_BITS=64`).
- Input: `brdc0010.22n`, the GPS broadcast ephemeris file for 1 January 2022 that gps-sdr-sim
  ships in its repository (an IGS/NASA CDDIS daily broadcast file, public).
  SHA-256 7db04513dd2d0e13c0ee20cb4eaa8f71e5a28ab58b65c9b5b789f86eeab436cd.
- Run: `gps-sdr-sim -e brdc0010.22n -l 35.681298,139.766247,10.0 -d 0.2 -b 8 -s 2600000 -i`
  (static mode at the example location of the program's usage text, scenario start at the
  first time of clock in the file, GPS week 2190 518 400 s, ionosphere off, 8-bit I/Q).

Files:

- `harness.c` (MIT, to match the program it links): a separate oracle program that repeats the
  program's channel set-up with gps-sdr-sim's own functions and prints the per-channel state
  behind the first block of samples. It is never compiled into Kshana.
- `harness_output.json`: its output. SHA-256
  fa10643cc8e25c9efc312e53a46b845f2d02ba5d8d4f594bffbd397d9f57d769.
- `gpssdrsim_first20ms.ci8`: the first 20 ms (52 000 complex samples, interleaved signed 8-bit
  I then Q, 2.6 MHz, zero IF, no noise) of the program's output file. SHA-256
  dcefe087a3927726c41e0ccad9a398af7bd36f4e003569f72401383cf16ce3df.
- `gpssdrsim_stderr.txt`: the program's deterministic console output (start time and the
  channel listing; progress and timing lines removed). SHA-256
  08d6a285735a9fcdbc94ac6d703b5d86f21be5a601d2113a49a110e9ada430d8.

Generated 2026-10-07 with `scripts/gen_iq_gpssdrsim_ref.sh` (gcc, Linux x86-64), after the
pre-registration commit 7777da53 that fixed the test's bars.
