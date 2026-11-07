# WP-11b (receiver DSP) on `feat/iq-ext-0.36`: scope record

Where each WP-11b item of the 0.36 scope audit stands on this branch. Each one was
pre-registered before its code or run, and each verdict is in that item's `RESULTS.md`. Misses
are asserted by tests that pin the recorded verdict.

| item | what | pre-registration | result | verdict |
|---|---|---|---|---|
| CAP-07a | BOC(1,1) DLL scaling and bump-jump (opt-in) | 700d95df | 514760cc, 18341b5e | B4 missed on 11 grid points; MODELLED |
| PRO-39 | GPS L1C codes against the IS-GPS-800J check columns | c6063eb2 | d27687ba, ffa4109e | all met; VALIDATED |
| DS-GIQ-06b | BeiDou B1I codes against GNSS-SDR's generator | db9dd696 | ffa4109e | all met; VALIDATED |
| MR-09 | the corrected LuGRE reader, before and after | 10f78906 | b6295797 | as recorded in its results |
| PRO-34 | Cornell scintillation model against measured 50 Hz data | 653a2195 | 63409d03, 18341b5e | B1 and B4 not met; MODELLED |
| PRO-37 | CA-CFAR acquisition detector | 8af30331 | e7496296, 18341b5e | C4 not met; MODELLED |
| CAP-12 | GLONASS, BeiDou and Galileo E6 bands | 502af4a7 | c7c4e382, 18341b5e | S2 and S3 not met; MODELLED. Galileo E1/E5a revision: 1f777603 |
| PRO-33 | iq::track against GNSS-SDR 0.0.19 | b1f25cce; Amendment 1 at 9496b6b0 | fefe01d7 (not run), 340fa5e3 | B1–B3 met, B4–B6 not; MODELLED |
| CAP-06a | CRPA antenna gains in the jamming kind | 716de66a | 396e181d, 64d8e0e4 | A3 on the MVDR jammer gain not met (float64 cancellation); MODELLED |
| CAP-06b | terrain shadowing of the jammer | 3b0ebdd4 | 83c3b269 | all met; MODELLED |
| CAP-06c | acquisition hysteresis and the front-end quantiser | 2ca31ee1, supplement 2ef7427a | 805d9860 | H3 uninformative on the registered runs (not met), met on the supplement; MODELLED |
| DS-LOOP-05 | the FLL→PLL hand-over floor of the default design (opt-in cap) | 8aceabcb | (this commit) | control met; D2 and D3 not met (16 of 20 runs hold at 33 dB-Hz); MODELLED |

## PRO-38 (vector tracking): not done separately

The scope audit marks PRO-38 (B3.9 vector / EKF tracking) as a duplicate of CAP-07. It is not
carried as a separate item on this branch, and no PRO-38 work, ledger row or claim exists here.
Vector tracking stays out of 0.36 under CAP-07's scope.
