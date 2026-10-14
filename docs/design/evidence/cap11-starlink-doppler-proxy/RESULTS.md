# Results: the Starlink Doppler-positioning proxy (CAP-11, part)

Run once on 2026-10-14 against `PREREGISTRATION.md` (7a3249d3, committed alone before the run).
Test: `tests/starlink_doppler_published_proxy.rs`. Nothing in the pre-registration was changed
after the run.

- Mask rule: 47 deg is the smallest integer mask giving at most 3 satellites in the 20 s window
  at seed 1. Every one of the 200 seeds then used exactly 3.
- The 90th-percentile 3-D error over seeds 1 to 200 (no height aid, 30 Hz, 10 Hz measurements):

| bar | window | model p90 | published p90 | bar range | outcome |
|---|---|---|---|---|---|
| P1 | 20 s | 92.2 m | 2 m | 1 to 4 m | NOT MET (high) |
| P2 | 8 s | 870 m | 10 m | 5 to 20 m | NOT MET (high) |

## Reading

The prediction expected an optimistic model (a perfect ephemeris and a high measurement rate)
and a possible miss on the low side. The model is instead pessimistic by a factor of 45 to 90.
The likeliest reason, not tested: the experiment's "average of three" satellites came from 63
satellites over 10 minutes, with each satellite switching channel every 15 s and the window
swept through the capture. The model's three satellites are fixed and close together near the
zenith of a representative shell, and with no height aid the vertical is barely observable over
20 s. A model of the experiment's actual satellite turnover (its TLEs and channel schedule)
would be a new pre-registration, not a re-run of this one. Both misses are asserted. The preset
stays MODELLED.
