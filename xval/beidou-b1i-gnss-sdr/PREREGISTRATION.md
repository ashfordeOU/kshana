# Pre-registration: BeiDou B1I primary codes against GNSS-SDR's generator (DS-GIQ-06b)

Committed before the crate's B1I codes are compared with the GNSS-SDR output for the first
time. The bar and the comparison rule below are not loosened after the comparison has run.

## What is compared

- **Under test:** `kshana::iq::signals::beidou::b1i_bits(prn, 2046)` (logic bits, BDS-SIS-ICD-B1I-3.0
  Gold code truncated to 2046 chips), PRN 1..63.
- **Oracle:** GNSS-SDR v0.0.19 (tag `v0.0.19`, commit `1ddd4562723040fd66cb334b578a5b69455625f4`),
  `beidou_b1i_code_gen_int(dest, prn, chip_shift = 0)` from
  `src/algorithms/libs/beidou_b1i_signal_replica.cc`, compiled standalone with a small harness
  (in this repository) for PRN 1..63, the PRNs that function supports.
- **Fixture:** `tests/fixtures/iq_signals/beidou_b1i_gnss_sdr.txt` (program output only): per PRN,
  the first 64 chips as hex and the SHA-256 of the full 2046-chip `'0'/'1'` ASCII string.

## Sign convention (fixed now)

GNSS-SDR writes `+1` where `G1 XOR G2 = 1` and `-1` where it is 0, so its logic bit is
`value == +1`. The comparison uses exactly this mapping. A code that matches only after an
inversion, a chip shift or a PRN relabelling is a **miss**, not a pass.

## The bar

**All 2046 chips of all 63 PRNs identical**: for every PRN 1..63, the crate's 64-chip prefix
equals the fixture's hex prefix and the SHA-256 of the crate's 2046-character `'0'/'1'` string
equals the fixture's hash. No tolerance; one differing chip in one PRN fails the bar.

## Outcomes

- Pass: the ledger row for the BeiDou B1I chips may cite GNSS-SDR's generator as an external
  oracle (an independent implementation of the same ICD). Rows for other signals do not change.
- Miss: recorded as a finding with the PRNs and the first differing chip index; the row stays
  as it is and the code is not changed to match within this item.
