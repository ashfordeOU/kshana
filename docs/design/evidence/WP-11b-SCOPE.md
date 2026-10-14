# WP-11b (receiver DSP) on `feat/iq-ext-0.36`: scope record

Where each WP-11b item of the 0.36 scope audit stands on this branch. Each one was
pre-registered before its code or run, and each verdict is in that item's `RESULTS.md`. Misses
are asserted by tests that pin the recorded verdict.

| item | what | pre-registration | result | verdict |
|---|---|---|---|---|
| CAP-07a | BOC(1,1) DLL scaling and bump-jump (opt-in) | 6b68f6cc | 556f919e, b9e62406 | B4 missed on 11 grid points; MODELLED |
| PRO-39 | GPS L1C codes against the IS-GPS-800J check columns | fe372e26 | 859fb4b2, e833686a | all met; VALIDATED |
| DS-GIQ-06b | BeiDou B1I codes against GNSS-SDR's generator | 911106d1 | e833686a | all met; VALIDATED |
| MR-09 | the corrected LuGRE reader, before and after | 0c438b26 | 14a14a83 | as recorded in its results |
| PRO-34 | Cornell scintillation model against measured 50 Hz data | b6ccb499 | 10e49e26, b9e62406 | B1 and B4 not met; MODELLED |
| PRO-37 | CA-CFAR acquisition detector | 3724aefa | 795d6d1a, b9e62406 | C4 not met; MODELLED |
| CAP-12 | GLONASS, BeiDou and Galileo E6 bands | 5806f28b | e01e8d62, b9e62406 | S2 and S3 not met; MODELLED. Galileo E1/E5a revision: ebf44620 |
| PRO-33 | iq::track against GNSS-SDR 0.0.19 | 48edd4a5; Amendment 1 at 1e4288c4 | b63d8275 (not run), 59d9ef5a | B1–B3 met, B4–B6 not; MODELLED |
| CAP-06a | CRPA antenna gains in the jamming kind | 08d83b4d | 8ed3ec8e, 48a75761 | A3 on the MVDR jammer gain not met (float64 cancellation); MODELLED |
| CAP-06b | terrain shadowing of the jammer | 92cd2bfd | e69e1fd6 | all met; MODELLED |
| CAP-06c | acquisition hysteresis and the front-end quantiser | 70c72fcc, supplement 37793290 | 6b29e8d8 | H3 uninformative on the registered runs (not met), met on the supplement; MODELLED |
| DS-LOOP-05 | the FLL→PLL hand-over floor of the default design (opt-in cap) | 58789af0 | (this commit) | control met; D2 and D3 not met (16 of 20 runs hold at 33 dB-Hz); MODELLED |

## PRO-38 (vector tracking): not done separately

The scope audit marks PRO-38 (B3.9 vector / EKF tracking) as a duplicate of CAP-07. It is not
carried as a separate item on this branch, and no PRO-38 work, ledger row or claim exists here.
Vector tracking stays out of 0.36 under CAP-07's scope.
