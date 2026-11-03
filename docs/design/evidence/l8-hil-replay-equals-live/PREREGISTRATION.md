<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration L8 (0.41): hardware in the loop, replay equals live

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Every numeric bar here is new and marked *proposed*.

**Timing.** The bench hardware is not bought yet. By the owner's decision of 3 November 2026 the hardware-in-the-loop
part of L8 moves to 0.41.x; all connectors are built and tested on recorded data in 0.41. The bar is fixed now so that it
exists before the bench, the live code paths or any recorded live data.

## Why this row

Every external comparison in the ledger runs on recorded data through the replay engine. Kshana's live paths (a receiver
on a serial port, an SDR stream, a PTP servo log) are separate entry points. Nothing yet shows that a live path computes
the same thing as a replay of the same data. Roadmap item L8 files a ledger row per live path as MODELLED with this
equality bar, and makes it VALIDATED when the bar holds for 30 nights.

## The bench (receive-only)

| Path | Device | Data into Kshana | Live entry point |
|---|---|---|---|
| P1 | one u-blox F9-class GNSS receiver, USB serial, firmware version recorded | UBX and NMEA at 1 Hz | `receiver-trust live` following the serial port |
| P2 | one RTL-SDR v4 at the GPS L1 centre frequency, 2.048 MS/s, 8-bit I/Q, driver version recorded | a growing SigMF recording | `iq monitor --follow` |
| P3 | one PTP-capable NIC with hardware timestamping, linuxptp (`ptp4l`, `phc2sys`) | the servo log lines | the clock-log live follower |

Antenna: one fixed GNSS antenna with a clear sky view, shared by P1 and P2 through a powered splitter. The bench transmits nothing. It
runs on a dedicated host that is also the CI runner for this test; host, kernel and Kshana build are recorded per night.

## What "equal" means (the bar)

**The capture.** The live run records, at Kshana's ingest boundary (after the operating system read, before any
parsing), every byte it consumed, in the order consumed, with each read's monotonic and UTC arrival stamps, in a framed
capture file. What Kshana did not read is not in the capture; what it read is all there.

**The replay.** The same Kshana binary replays the capture through the replay engine: the same bytes, the same read
boundaries, the same arrival stamps, the same order.

**Equality.** For each path, every output file the live run writes (result documents, alarm and event streams, trust
states, reports) is **byte-identical** to the replay's, after removing one declared block, `run_meta`, which holds only:
run start wall-clock time, host name, process id, binary path, and wall-clock processing latency per output. The list is
fixed now; adding a field to it later is a change to this bar and needs a new registration. Every timestamp in every
other field (alarm times, epoch times, window times) comes from the data or from the capture's arrival stamps, never from
the processing clock, so it is covered by the equality.

**No tolerances.** None is needed: the same binary on the same bytes, read boundaries and stamps must give the same
outputs. A difference means non-determinism, a live-only code path, or a read that the capture did not record, and each of
these is a defect this test exists to find. A tolerance would hide them. The one quantity that legitimately differs,
processing latency, is excluded by name and reported, not compared.

## Nightly protocol

1. Start at 01:47 local time (*proposed*), from a clean state, the build of the night's main commit.
2. Live run: P1 and P3 for **60 minutes**, P2 for **20 minutes** (*proposed*; about 4.9 GB of I/Q), all starting
   together.
3. Replay each capture on the same host. Compare per path as defined above.
4. **Comparator control:** for each path, the comparator is given a copy of one output with one byte changed and must
   report a difference. If it does not, the night is invalid.
5. **Validity (*proposed*):** a path's night is valid if it delivered at least **95 %** of its expected units (P1:
   epochs at 1 Hz; P2: samples at 2.048 MS/s, with any driver-reported drops counted; P3: log lines at the configured
   rate) and the comparator control passed. An invalid night for a path is "no run" for that path: neither a pass nor a
   failure.
6. Publish per path per night: valid or not, pass or fail, the SHA-256 of the capture and of every output, the commit and
   binary hash, the device firmware and driver versions, the latency figures. A failing night is published with its diff.
   Captures of failing nights are kept; passing ones may be deleted after 7 days except one per week.

## The 30-night rule

A path's ledger row moves from MODELLED to **VALIDATED** (the claim: "the live path computes byte-identically what the
replay of its consumed data computes, on this bench") when:

- it has **30 valid nights**, all passing, with **no failing night** among them (a failure resets the count to zero);
- the 30 nights fall within **45 calendar days** (*proposed*);
- the declared live and replay modules for that path are unchanged across the 30 nights (their source hash is recorded
  each night; a change resets the count, *proposed*). Unrelated changes to the engine do not reset it.

After VALIDATED the nightly run continues. Any later failing night returns the row to MODELLED, publishes the failure, and
starts a new count after the fix.

## What VALIDATED would and would not mean

It would mean that, for these device classes on this host, a result obtained by replaying a recorded stream is the
result the live path would have given, so replay-based evidence transfers to the live path. It would not mean: that the
devices' data are correct; anything about detection quality, accuracy or latency (latency has its own bars elsewhere);
anything about other receivers, firmware, SDRs, NICs, operating systems or architectures; or anything about data a
device produced but Kshana never read.

## Owner decisions at sign-off

1. The nightly start time and durations (60 min for P1 and P3, 20 min for P2).
2. The validity threshold (95 %), the 45-day window and the reset rule on module changes.
3. The `run_meta` exclusion list as fixed above.
4. Confirm the bench purchase and commissioning date (L8 hardware in the loop in 0.41.x); nights count from the first
   night after commissioning and after this file is signed.
