# BeiDou B1I primary codes against GNSS-SDR's generator (DS-GIQ-06b): results

Pre-registration: `PREREGISTRATION.md` (committed at `911106d1`, before the comparison). The bar
was not changed.

**MET.** All 2046 chips of all 63 PRNs are identical
(`tests/iq_signals.rs::beidou_b1i_matches_gnss_sdr_generator_for_all_63_prns`).

The fixture was re-derived on 2026-10-13 before the test was run:
- GNSS-SDR checked out fresh at tag `v0.0.19` (commit `1ddd4562723040fd66cb334b578a5b69455625f4`);
- `beidou_b1i_signal_replica.cc` has SHA-256 `d4331988…`, as the provenance records;
- the generator was built standalone with g++ 13.3.0 and the committed harness;
- the regenerated `beidou_b1i_gnss_sdr.txt` is byte-identical to the committed one
  (SHA-256 `af3a7153…`).

Only program output is committed: a 64-chip prefix and a hash per PRN, the B1I PRN codes the
public BDS-SIS-ICD-B1I-3.0 defines. No GNSS-SDR source, header or binary is in the repository.
Ledger row "BeiDou B1I primary ranging codes against an independent generator" (VALIDATED,
basis Library).
