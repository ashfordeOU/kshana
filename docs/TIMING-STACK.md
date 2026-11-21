# Linux timing-stack verification

`kshana timing-stack` checks a Linux timing stack (linuxptp, chrony or ntpd, gpsd SHM, PPS) from
the status outputs and PPS data a host already prints. It reads only; nothing changes a clock, a
servo or a device. It reuses the parsers of `kshana connect timing` and `kshana clock-live`.
Source: `src/timing_stack.rs`. Output: JSON (`kshana.timing-stack/1`); exit 1 when a check fails
or alarms. MODELLED: the thresholds are this tool's conventions.

```
kshana timing-stack tai --pmc time_properties.txt --phc-ctl phc_ctl_cmp.txt --chrony tracking.txt
kshana timing-stack ts2phc ts2phc.log --end 1000080
kshana timing-stack pps assert.txt --end 1700000060
kshana timing-stack shm ntpshmmon.txt --end 1700000040
kshana timing-stack ntpq ntpq_p.txt --rv ntpq_rv.txt
kshana timing-stack nts --client chrony-4.5=authdata_a.txt --client chrony-4.6=authdata_b.txt
```

| check | reads | reports |
|---|---|---|
| `tai` | `pmc 'GET TIME_PROPERTIES_DATA_SET'`, `phc_ctl <dev> cmp`, `chronyc tracking` | `currentUtcOffset` against TAI−UTC from the leap-second table (or `--tai-utc`), `currentUtcOffsetValid`, `ptpTimescale`; the PHC-to-system offset, which is TAI−UTC for a PTP-timescale PHC beside a UTC system clock: 0 s (the PHC set to UTC) or any other value is an error; chrony's leap status, an offset over 1 ms, and an offset of TAI−UTC (a TAI source taken for UTC). The sign `phc_ctl` prints is not interpreted (to confirm per version) |
| `ts2phc` | a ts2phc log | readings, locked readings, the largest offset while locked against `--max-offset` (1 µs), lost locks, missed pulses, stale alarms |
| `pps` | `/sys/class/pps/ppsN/assert` stamps | pulses, repeated reads, missed pulses (sequence gaps), the detrended RMS of the host clock against the pulse, the path that jitter suggests (≤ 20 µs `kernel-pps`, ≥ 50 µs `dcd-polling-likely`, otherwise `indeterminate`), stale alarms |
| `shm` | `ntpshmmon` output (gpsd) | per SHM unit: samples, median interval and offset, stale alarms when a unit stops |
| `ntpq` | `ntpq -p` and `ntpq -c rv` | misreports: a selected (`*`) peer with reach 0 or silent for over eight polls, a system offset that disagrees with the selected peer's by more than ten jitters (and 1 ms), body lines the column layout broke |
| `nts` | `chronyc -N authdata`, one or more clients | the interoperability matrix of servers and clients: mode, AEAD algorithm (15 AES-SIV-CMAC-256, 30 AES-128-GCM-SIV), NAKs, cookies; `ok`, `degraded` (NAKs or no cookies) or `not-authenticated` |

**Stale alarms.** A source is stale when its last sample is older than `--stale-after` (3 s) at
the next sample or at the capture end `--end` (in the clock the input uses). The alarm carries
`last_t` and `alarm_t = last_t + stale_after`, the time a live monitor watching the same data would
have raised it. Acceptance (tests/timing_stack.rs): the stopped-SHM and stale-PPS fixtures alarm
within 10 s of their last sample (3 s with the default).

The fixtures in `tests/fixtures/timing_stack/` are synthetic (`gen_fixtures.py`), not host
captures. The `ntpshmmon` column order and the `phc_ctl` wording are as those tools print them in
current versions (to confirm against other versions).
