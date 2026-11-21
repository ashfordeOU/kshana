# Pre-registration: kshana-bench task (h), urban positioning accuracy (UrbanNav Hong Kong)

Written on 21 November 2026, after the task (h) code was written and before any task (h) score was computed. Bars
may be tightened later, never loosened; a miss is recorded as NOT MET.

## Data

UrbanNav (IPNL, The Hong Kong Polytechnic University), https://github.com/IPNL-POLYU/UrbanNavDataset. The README
(section "License") states that the MIT licence covers the dataset files, including the RINEX, IMU and ground-truth
data; LICENSE "Copyright (c) 2026 UrbanNav contributors". Four Hong Kong sequences: medium-urban-1 (TST, 17 May
2021), deep-urban-1 (Whampoa, 21 May 2021), harsh-urban-1 (Mong Kok, 18 May 2021; the publisher's file is a partial,
verified ground truth) and tunnel-1 (Cross-Harbour Tunnel, 18 May 2021). Two receivers each: u-blox ZED-F9P and
Xiaomi Mi 8 (RINEX observations and each receiver's own NMEA). Broadcast navigation: IGS BRDC merged files for
day-of-year 137, 138 and 141 of 2021 from the BKG IGS data centre. Everything is fetched by
`scripts/fetch_urbannav.sh`, which checks the SHA-256 of every file it keeps, and nothing is committed.

## What was seen before this was written (disclosed)

- The two header lines and the first and last rows of the medium-urban-1 ground-truth file.
- The RINEX headers (observation types, time of first observation, approximate position) of the eight observation
  files, and the first GGA sentences of the medium-urban-1 F9P NMEA file.
- The publisher's README, including its note (issue 11) that the F9P malfunctioned for a period of medium-urban-1.
- NOT seen: any position error, any score, any solver output on these files.

## Task

- **Unit:** one ground-truth epoch (1 Hz) of one trace `<sequence>/<receiver>`.
- **Truth:** the sequence's reference latitude and longitude (NovAtel SPAN-CPT, as the publisher states it). Its own
  error is not removed.
- **Metric:** the task (g) metric: per trace the mean of the 50th and 95th percentile horizontal errors (haversine,
  6,371,000 m sphere); primary `gsdc_score_m`, the mean over traces.
- **Splits:** sequences sorted by the SHA-256 of their name; the first half (rounded up) `test`, the rest `dev`. No
  holdout: the truth is public.

## Baselines (fixed)

1. `provided-nmea`: the receiver's own GGA fix at the nearest epoch.
2. `kshana-spp`: the engine's code single-point solution (`src/pvt.rs`), single frequency with the broadcast
   Klobuchar model, in two passes that do not use the truth: no elevation mask from the Earth's centre, then a 10°
   mask from the median of the first pass's fixes; the fix at the nearest epoch.

## Bars

- **H1 (alignment sanity):** `provided-nmea` on `medium-urban-1/ublox-f9p` scores under 50 m. A miss means the time
  or coordinate alignment between the truth and the receiver files is wrong, not that the receiver is poor.
- No accuracy bar is set for either baseline: the first run is descriptive.
