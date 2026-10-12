# lunar_station_clk: synthetic RINEX clock fixture

**SYNTHETIC. Not a measurement, not a product of any agency, network or mission.**

`station_clock_synthetic.clk` is a hand-written RINEX 3.04 clock file, written for this
repository on 2026-10-12. Its header declares `TIME SYSTEM ID` GPS and its body carries three
receiver/station clock (`AR`) records for a station named `LRS1` (a placeholder for "lunar
reference station"; no real station has this name), 30 s apart, with made-up offsets.

It exists to exercise `realdata::clk::rinex_clock_series` on a station clock record and to show
that the time system of the epochs is explicit in its output. The test that reads it
(`tests/rinex_clock_time_system.rs`) also rewrites the declared system to `LTC` in memory and
checks that the reader refuses it rather than treating it as GPS time.

No corrections-file or clock-file format for a lunar station is defined here, because no public
one exists.

Licence: written for this repository; AGPL-3.0-only with the rest of the source.
