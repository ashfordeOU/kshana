# Speed and station sizing

`kshana bench-speed` times the live paths a station runs, on input it builds itself, and prints a sizing
table. It measures speed only: accuracy is benchmarked elsewhere, and no result here changes any output
(the same inputs give the same bytes however fast the machine).

```sh
kshana bench-speed --repeats 5 --json bench.json
kshana bench-speed --baseline bench.json          # fails if a workload is over 10 % slower
```

| Workload | What is timed |
|---|---|
| `obs-decode-ubx` | a UBX log (NAV-PVT and NAV-SAT, 12 satellites) decoded to `kshana.obs/1` |
| `obs-live-ubx` | the same through the live decoder, fed in 512-byte pieces |
| `receiver-trust-nmea` | the receiver trust assessment of an NMEA log (RMC, GGA, GSV) |
| `iq-monitor` | the power and spectral interference monitors over complex samples at 4 MS/s |
| `clock-live-ptp4l` | the live clock-log reader on ptp4l servo lines |

Each workload runs `--repeats` times after a warm-up and the median is kept. Each is also given as a
ratio to a calibration workload (SHA-256 over 8 MiB) timed in the same run. The ratio is what
`--baseline` compares, because the machines of a CI service differ from run to run, and the ratio of two
timings on the same machine moves much less than either timing.

## Measured

One run (`--repeats 5`) of the release build on a 4-CPU Linux x86-64 virtual machine (Intel Xeon,
2.3 GHz), engine 0.41 in development. A per-core figure leaves half of each core free.

| Workload | Throughput | Sizing, per core |
|---|---:|---|
| `obs-decode-ubx` | 190,602 epochs/s | |
| `obs-live-ubx` | 7,589 epochs/s | 3,794 receivers at 1 Hz, live decode |
| `receiver-trust-nmea` | 66,923 epochs/s | 33,462 receivers at 1 Hz, trust assessment |
| `iq-monitor` | 31.1 M samples/s | 4 SDR channels at 4 MS/s |
| `clock-live-ptp4l` | 3,776,155 lines/s | servo logs at 1 line/s: not a limit |

So on such a machine the IQ monitors are the cost that sizes a station (about one core per 4 MS/s
channel, with headroom), while receiver logs and clock logs are cheap. A real station also spends time
on its network input and on writing results, which these figures leave out. With the L4b recorder, the
recording itself is a copy to disk and is limited by the disk, not by Kshana.

The live decoder holds a window of the stream and reads it again as each piece arrives; its window of
256 frames (reduced from 4,096 when this was measured: 618 epochs/s before) keeps it about 25 times
slower than a replay, which is far above a receiver's rate. Live still equals replay field for field at
any window size (`tests/obs_live.rs` uses a window of 8).

## Per platform

The CI job `bench-speed` runs the command on Linux, macOS and Windows runners and keeps each run as an
artifact. The 10 % gate (`--baseline`) is switched on in CI once three runs per platform have set the
baselines. Raspberry Pi 5 and Apple-silicon figures need those machines; they are not measured yet.
