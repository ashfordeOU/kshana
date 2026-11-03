<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B5 (0.41): one area trust state from several reference stations

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Numbers marked *proposed* are for the owner to fix at sign-off. After sign-off the bars may
be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified navigation equipment.

## Why this row

`receiver_trust` answers "can this one receiver's fix be trusted now" (`TrustState`: `Nominal`, `Degraded`,
`Untrusted`, from the monitors in `src/receiver_trust/monitors.rs`). An operator of a port, an airport or a grid site
asks the same question for the **area**, with several reference stations at surveyed positions. One station alarming
can be a local fault; several stations agreeing is an area event. B5 combines per-station evidence into one area state
with a stated latency. The roadmap's done-test is **alert latency ≤ 5 s end to end on replay** (K3); this file fixes that
measurement and the correctness checks it depends on.

## 1. The per-station evidence (fixed now)

For station `s` with surveyed position `p_s` (ECEF), per epoch:

1. **Position error** `ε_s = ‖x̂_s − p_s‖` horizontal and vertical, `x̂_s` the receiver's (or the engine's) fix.
   Alarm when horizontal `ε_s > H_s`, `H_s` = 5 × the 95th percentile of horizontal `ε_s` over the station's
   calibration window, floor 10 m (*proposed*).
2. **Clock offset**: the existing clock monitor (`Monitor::Clock`), unchanged.
3. **C/N0 against an elevation template**: per satellite, `δ = C/N0 − T_s(el)`, `T_s(el)` the station's median C/N0 in
   5° elevation bins over its calibration period (at least 24 h of data, *proposed*; a sidereal day covers the
   geometry). Station statistic: the median `δ` over satellites above 15°. Alarm when it is below −6 dB (*proposed*).
4. **AGC**, **jamming indicator**, **loss of lock**: the existing monitors, unchanged.
5. **OSNMA status** where the station reports it (`src/osnma/`): a failed tag verification is a fix-domain alarm; a
   station with no OSNMA data marks the monitor "unavailable", which is never read as "passed".

Each station's epoch state is the existing mapping: no alarm → `Nominal`; measurement-domain alarm only →
`Degraded`; fix-domain alarm (position error, clock, OSNMA, RAIM) → `Untrusted`. A station with no epoch for 5 s
(*proposed*) is `Stale` and is excluded from the counts below (and counted itself).

## 2. The area rule (fixed now)

With `N` non-stale stations, `n_D` in `Degraded` or worse and `n_U` in `Untrusted`, and `k = max(2, ⌈N/3⌉)`
(*proposed*):

- **UNTRUSTED** if `n_U ≥ k`;
- **DEGRADED** if `n_D ≥ k`, or `n_U ≥ 1`;
- **TRUSTED** otherwise;
- **UNKNOWN** if `N < 2`.

An **alert** is a transition of the area state to a worse state; a transition to a better state needs the condition to
hold for 10 s (hysteresis, *proposed*). The rule uses only the epoch's station states; it has no memory beyond the
hysteresis. Epochs are aligned on a 1 s grid by the obs/1 time alignment (row A3a); a station epoch belongs to the grid
second that contains its time tag.

## 3. Data

1. **Synthetic replay** (truth exact): `receiver_trust::synth` extended to `N` stations, with seeded injected events:
   C/N0 drops of 3 to 20 dB, AGC rises, position offsets of 10 to 500 m, clock steps, OSNMA tag failures, applied to a
   chosen subset of stations with stated onsets. Generated from a seed; same seed, same file.
2. **Real station data, clean** (false alarms): public IGS RINEX 3 daily 30 s observation files and broadcast
   navigation files from the BKG IGS data centre (https://igs.bkg.bund.de/root_ftp/IGS/), and station coordinates from
   the IGS weekly SINEX products at the same centre. **Stations chosen by rule:** the clusters of at least 4 IGS stations
   within 100 km of each other that publish `S1C` in RINEX 3 on every scored day; from each cluster the 4 stations with
   the lowest SHA-256 of the 9-character station name; at most 3 clusters, by the same hash order. **Days:** 14
   consecutive UTC days chosen as the first fortnight of 2025 with daily maximum Kp ≤ 4 on every day (GFZ Kp,
   https://kp.gfz.de/app/files/Kp_ap_Ap_SN_F107_since_1932.txt, CC BY 4.0), so that natural disturbance is not scored
   as a false alarm. Every file is fetched by `xval/area-trust/fetch.sh`, SHA-256 written to `MANIFEST.tsv`, never
   vendored. The first 24 h of each station are its calibration.
3. **Real station data with injected events** (latency on real noise): the clean data of item 2 with the synthetic
   events of item 1 overlaid on the observables (C/N0 reduced, position offset added), labelled "real background,
   injected event". This is not a real interference event and is never reported as one.

## 4. Metrics

- **State agreement**: the share of epochs where the engine's area state equals the oracle's (an independent script
  applying section 2 to the per-station states).
- **Data-time latency** per injected event: first epoch whose area state is the expected state, minus the injected
  onset, in seconds of data time.
- **End-to-end latency** per injected event: the replay feeds stations' records into the live ingest path (A3a) at 1x
  real time, timestamped on send; the alert is received by a test webhook and an MQTT subscriber (A4) and timestamped on
  receipt, both clocks the same host clock. Latency = receipt time − send time of the record that carries the injected
  onset. It includes the data-time latency and all processing.
- **False area alerts** per station-day and per area-day on the clean real data.

## 5. Bars (*proposed*)

| Id | Bar |
|---|---|
| T1 rule exactness | On the synthetic replay (at least 500 events, 4 to 50 stations): state agreement **= 1.0** with the independent oracle, every epoch |
| T2 detection | Synthetic events that put at least `k` stations in alarm by the per-station rules: the expected area alert raised in **100%**; events affecting fewer than `k` stations: no `UNTRUSTED` alert |
| T3 end-to-end latency (K3) | On replay of the real-background injected events with 100 stations at 1 Hz on the reference box of A3a: **95th percentile ≤ 5 s** and **maximum ≤ 10 s**, over at least 200 alerts, delivered to both the webhook and MQTT |
| T4 false alerts | On the clean real data after calibration: area alerts to `DEGRADED` or worse **≤ 1 per area-day**, alerts to `UNTRUSTED` **≤ 0.1 per area-day** (at most 3 over 3 areas x 13 scored days) |
| T5 determinism | Same input files and seed: byte-identical area-state timeline on every platform and surface; T3 excepted (wall-clock) |

MET only if T1 to T5 are all met.

**Derivation of T3.** With 1 Hz records and a monitor that alarms on the epoch it first sees the change, the data-time
part is 1 to 2 s (alignment to the 1 s grid plus one epoch); the remaining 3 s is the budget for ingest, the area rule
and delivery. The maximum of 10 s bounds the tail that a percentile hides.

## What a MET and a NOT MET mean

- **MET** means the area state is computed exactly as defined, raises the expected alert on every synthetic event,
  meets the K3 latency on replay at 100 stations, and keeps false alerts within the bar on clean public reference data.
- **MET does not mean** the area state detects real interference events at the stated rates (no public multi-station
  event data with truth is used here), that the thresholds suit any particular site, or that the latency holds on other
  hardware or at 1 000 stations (A3b).
- **NOT MET** on T3 blocks K3b; on T4 it is published with the alert counts by station and monitor.

## Out of scope

Real interference events (B5 does not score detection on real events; B3a and B4a do); 1 000-station scale (A3b);
the maritime two-way exchange (B9); natural disturbance days (B8 supplies the environmental baseline that may later
suppress such alerts); any statement about the cause of an alert.

## Open questions for sign-off

1. `k = max(2, ⌈N/3⌉)` and the single-`Untrusted`-station rule for `DEGRADED`.
2. Whether K3's "≤ 5 s" is read as the 95th percentile (this draft) or as the maximum.
3. The station-selection rule and the 14-day quiet fortnight in 2025.
4. The calibration length (24 h) and the C/N0 template threshold (−6 dB).

## Sign-off (3 November 2026)

Latency is fixed as the 95th percentile ≤ 5 s with a maximum ≤ 10 s. The station-agreement rule, the −6 dB C/N0 threshold, the 24 h calibration and the station and quiet-day selection rules are fixed as written.
