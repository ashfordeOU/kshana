# SDR, IQ recordings and laboratory simulators (0.42 I4)

## SigMF

SigMF recordings (`.sigmf-meta` and `.sigmf-data`, `cf32_le`, `ci16_le`, `ci8`) are read and
written by `kshana::sigmf` (`read`, `write`, `parse_meta`, `meta_to_json`) and read by the `spectrum`
kind's `[recording]` block and the `kshana iq` tools ([SPECTRUM.md](SPECTRUM.md)). This was present
before 0.42.

## SoapySDR capture (optional feature)

```sh
cargo install kshana --features soapy
kshana connect sdr-capture --args driver=rtlsdr --freq 1575.42e6 --rate 2.048e6 --gain 30 --samples 2048000 --out l1
# writes l1.sigmf-data (ci16_le) and l1.sigmf-meta
```

The `soapy` feature (Unix only, off by default) opens the user's own SoapySDR library at run time
(`libSoapySDR.so.0.8`, `libSoapySDR.so` or `libSoapySDR.dylib`) with its installed device modules.
The crate gains no dependency and no link to it; a build without the feature says so when the
command is used. Only the receive direction is used: nothing is transmitted. The library must report
ABI 0.8. Without the feature, any tool that writes SigMF or raw IQ (`rx_sdr`, `rtl_sdr`,
`hackrf_transfer`) can feed `kshana iq record` instead.

## gps-sdr-sim motion

`kshana connect sim-motion <scenario.toml> [--layout ecef|llh] [--epoch <UTC ISO>]` prints the
scenario's trajectory in the layouts of the open-source simulator gps-sdr-sim (MIT): `ecef` for its
`-u` option (`time, x, y, z`) and `llh` for `-x` (`time, latitude, longitude, height`). The motion is
resampled to gps-sdr-sim's fixed 10 Hz by linear interpolation of the Earth-fixed position, written
with no header and at most 3000 rows (300 s, a message on standard error says when the trajectory
was cut). The file reads back with `kshana::interop::testbench::read_sim_motion`; positions at the
trajectory's own sample times match within 1 mm (`tests/connect_042_w2.rs`). The broadcast
ephemeris file gps-sdr-sim also needs is the user's. See [TEST-BENCH.md](TEST-BENCH.md) for the
full test-bench export (motion CSV, NMEA, waypoints, events).

Kshana writes motion and timing only. It never writes a signal, and what a laboratory does with a
simulator's output is the operator's responsibility, where authorised.

## Commercial simulator scenario formats

| Simulator | Scenario or motion format | Status |
|---|---|---|
| gps-sdr-sim | user motion `-u`, `-x`, NMEA `-g` | built (`sim-motion`, `bench-export`) |
| Safran Skydel | scenario files and automation API | documented to licensees, not built |
| Spirent SimGEN / PosApp | scenario and user motion files | documented to licensees, not built |
| Rohde & Schwarz SMBV / SMW GNSS | scenario and trajectory files | documented to licensees, not built |
| LabSat (Racelogic) SatGen | scenario files | documented to licensees, not built |

Many laboratory simulators import an NMEA GGA log or a CSV trajectory; the test-bench export writes
both ([TEST-BENCH.md](TEST-BENCH.md)). Check the simulator's own manual for what it accepts. A vendor
format is added only once its documentation can be used in an open repository.
