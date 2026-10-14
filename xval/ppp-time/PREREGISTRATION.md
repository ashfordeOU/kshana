# Pre-registration: PPP receiver-clock time solution against the IGS final station clock (FUT-19)

Committed on its own on 2026-10-14, before Kshana's PPP receiver clock has been compared with the
IGS clock. The bars are not loosened after a run. A miss is recorded with its numbers as a
FINDING, and the row stays MODELLED.

## Disclosure

While extracting the fixture, the first two IGS WTZR clock values (00:00 and 00:05, about
69.22 ns) were seen. No Kshana clock value has been looked at on these inputs. The Kshana PPP
position solution on the same inputs is already VALIDATED against ITRF2020
(`tests/ppp_real_wettzell_oracle.rs`), and its receiver-clock state was never compared or
inspected.

## Oracle

The IGS final combined clock for station WTZR, 2025-02-24, from the IGS final 5-minute clock
product `IGS0OPSFIN_20250550000_01D_05M_CLK.CLK.gz`:

- source: https://igs.bkg.bund.de/root_ftp/IGS/products/2355/;
- SHA-256 of the compressed file:
  d19f3d45fb5a4f7a95e7131c1b9c363427d63fcb0f883e68311863cc7155993d, the same file whose
  satellite records are already the fixture `igs_2025055_G_05m_0006.clk`;
- IGS products may be used without restriction, with attribution.

The fixture `tests/fixtures/gnss_wettzell_2025055/igs_2025055_WTZR_05m_0006.clk` is that file's
header plus its `AR WTZR` records from 00:00 to 06:05: 74 epochs, receiver clock in seconds. The
IGS combination is an estimate from several analysis centres' independent solutions on the
global network. It is external to Kshana.

## Kshana side (fixed now)

`ppp_real::run_ppp` on the WTZR observations, IGS final orbits and clocks and ANTEX. The
configuration is the one in `tests/ppp_real_wettzell_oracle.rs`: `PppConfig::default()` plus the
receiver antenna. The receiver clock is `PppEpoch::clock_m / c` (s), compared at the epochs
whose time tags equal an IGS 5-minute epoch.

## Bars (window 04:00-05:55, the converged part the position bars also use)

| Id | Quantity | Bar | Basis |
|---|---|---|---|
| T1 | standard deviation of (Kshana − IGS) over the window | ≤ 0.20 ns | float-PPP clock noise of about 0.05 ns, plus satellite code biases Kshana leaves uncorrected (C1C against the P1/P2 reference of the IGS clocks) changing with the satellites in view |
| T2 | absolute mean of (Kshana − IGS) over the window | ≤ 5.0 ns | a constant offset from the receiver's C1C−C1W code bias entering the ionosphere-free combination (×2.55) and from the analysis centres' reference handling; not a timing error of the method |
| N | common epochs in the window | ≥ 20 | 24 expected |

Recorded without a bar: the same statistics over the whole 00:00-05:55, including convergence.

## Outcome rule

If T1, T2 and N hold, the ledger row "PPP receiver-clock time solution against the IGS final
station clock" is VALIDATED (ExternalDataset), stated narrowly: one station, one day window, IGS
time. If a bar misses, it is recorded as a FINDING and the row is MODELLED.

## What this does not check

UTC(k) traceability, Circular T, calibrated absolute receiver delays, and other stations or days.

## Result (first and only comparison run, 2026-10-14)

| Bar | Result | Verdict |
|---|---|---|
| T1 | std 0.075 ns over 04:00-05:55 | holds |
| T2 | mean −0.659 ns | holds |
| N | 24 common epochs | holds |

Recorded without a bar: over the whole 00:00-05:55, including convergence, the mean is −0.892 ns
and the std is 0.623 ns over 71 epochs.

Disclosed procedure: the first attempt stopped before any comparison. The fixture as first
committed (661ad138) lacked the clock file's `END OF HEADER` line, dropped by the extraction
script, so the parser read no records. The fixture was rebuilt from the same checksummed source
file with that line kept. Its records are byte-identical, and its new SHA-256 is in the fixture
NOTICE. The ledger row is VALIDATED.
