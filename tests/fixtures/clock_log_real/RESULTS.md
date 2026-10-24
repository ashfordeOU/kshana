<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Results: clock-log ingest on real public data against allantools

Pre-registration: `PREREGISTRATION.md` (b1c7112d, Addendum 1 aa12830f). Fixtures, generator and test were
committed as pre-registered (d043f924) before the first run. Environment: allantools 2024.6, numpy,
rustc 1.93.0, release profile, Linux x86-64.

## Run 1: the reader as shipped (main bc04e98f), bars unchanged

One harness change between the first attempt and this run: the test reports every miss of a bar together
instead of stopping at the first (the first attempt stopped at B1's first miss). No bar was touched.

| bar | result | numbers |
|---|---|---|
| B1 phase, 1e-14 s | **missed, 5 of 11 cases** | TICC logs only: D1 `TICC-0` 5.7e-14 s, D1 `TICC-3` 2.9e-11 s, D2 `TICC-0` 5.8e-12 s, D2 `TICC-3` 4.2e-11 s, D1 `TICC-11` 5.7e-14 s. TimeLab phase and frequency (D1, D2) and the IGS cuts (D3, D4): 0 (bit-identical). Counts, `tau0` and its source agree everywhere. |
| B2 estimators | **missed** | Met (largest relative difference): D1 `TL-P` 8.8e-16, D1 `TL-F` 1.4e-15, D2 `TL-P` 9.7e-15, D3 (G01) 2.8e-11, D4 (ABMF) 1.4e-12. Missed: the five TICC cases above, through the time stamp error (largest relative differences: D1 `TICC-0` 4.0e-5, D1 `TICC-3` 3.5e-2, D2 `TICC-0` 3.4e-3, D2 `TICC-3` 4.5e-3, D1 `TICC-11` 7.7e-5), and MTIE of D2 `TL-F` (1.7e-5 at 1 s to 6.8e-2 at the longest windows; its ADEV and TDEV are met). 192 comparisons missed in all. |
| B3 malformed input | **missed, 7 of 24 cases** | The error is returned (no panic) in every case but E12 and E13. Phrase misses: E7 (says "unit", not "units"), E9 (no line number), E17 (no "clock bias"), E18 (no "at least"), E19 (no "no readings"). E12 and E13: a version 4.00 and a version 3.05 header were read, not refused. |
| B4 versions | **missed** | 2.00 and 3.00 to 3.04 read. 1.00, 3.05, 4.00, 4.02 and 5.00 were all read: the header version is not checked. |
| B5 no change elsewhere | not yet run | |
| non-vacuity | met | 28 averaging factors per curve for D1, 46 for D2, 33 for D3, 24 for D4 |

### Causes found

- **TICC (B1, B2).** The reader holds each time stamp as an `f64`; the spacing of `f64` at 3.0e5 s is
  5.8e-11 s, about the counter's resolution, and at 1e3 s it is 1.1e-13 s. The stated expectation
  (PREREGISTRATION, "Expected") held, and it also shows at small offsets on D1 because the series is a few
  nanoseconds.
- **MTIE on the frequency path (B2).** Not an engine defect. allantools 2024.6 `frequency2phase`
  subtracts the mean frequency before it integrates (`freqdata - nanmean(freqdata)`, a precision
  measure), so the phase it hands to `mtie` differs from the plain integral (NIST SP 1065 section 4.1,
  which the engine and the independent reader use) by a linear ramp. ADEV and TDEV are second differences
  and do not see a ramp; MTIE does. The bar as written stays missed on this pair. As a diagnostic (not a
  replacement of the bar), allantools' own phase-mode `mtie` on the plain integral agrees with the engine.
- **Versions, messages (B3, B4).** `parse_rinex` never reads the `RINEX VERSION / TYPE` record; five
  messages lack the pre-registered phrase.

## Fixes and re-run

Each fix is a separate commit after this record; the comparison is then re-run unchanged and the table
below is extended, never rewritten.

### Run 3: the reader after the fixes (ab4ebfd0), bars unchanged

| bar | result | numbers |
|---|---|---|
| B1 phase, 1e-14 s | **met, 11 of 11 cases** | the largest phase difference is 0 s in every case (bit-identical), including the TICC logs 3.5 days after power-up and the 11-decimal log |
| B2 estimators | **met except one pair** | largest relative difference: D1 `TL-P` 8.8e-16, D1 `TL-F` 1.4e-15, D1 `TICC-0` and `TICC-3` 1.6e-15, D1 `TICC-11` 1.7e-15, D2 `TL-P` 9.7e-15, D2 `TICC-0` and `TICC-3` 1.7e-14, D3 (G01) 2.8e-11, D4 (ABMF) 1.4e-12. **NOT MET:** MTIE of D2 `TL-F` against allantools (16 values, 1.7e-5 at 1 s to 6.8e-2 at 32 768 s); its ADEV and TDEV are met. |
| B3 malformed input | **met, 24 of 24** | |
| B4 versions | **met** | 2.00 and 3.00 to 3.04 read; 1.00, 3.05, 4.00, 4.02 and 5.00 refused, naming the version and 3.04 |
| B5 no change elsewhere | **met, with one recorded change** | 3 591 library tests, `prediction_frozen`, `field_units_global`, `source_guards`, `gnss_denied_clock_holdover_reference`, `cti_holdover_coverage_reference` pass. `tests/clock_log_allantools.rs` failed on the TICC log, because its reference reader shared the engine's float rounding; its reference was regenerated with an exact reader (addendum in `tests/fixtures/clock_log/RESULTS.md`), bars and test unchanged. |

The one pair not met is **pinned** by `b2_adev_tdev_and_mtie_agree_with_allantools` (sixteen values, their
range) and is not a defect of the engine: allantools 2024.6 `frequency2phase` removes the mean frequency
before it integrates, which leaves ADEV and TDEV unchanged and moves MTIE. The like-for-like comparison,
the engine's MTIE against allantools' phase-mode MTIE of the plain integral (`mtie_of_plain_integral` in
`reference.json`, added to the generator after run 1 as a diagnostic, not a substitute for the bar), agrees
within 1e-10 at every window; the test asserts it.

Verdict, by the rule in the pre-registration: the ledger row for the clock-log formats stays **MODELLED**.
Everything above is on measured clocks (D1, D2 caesium and a standards-laboratory series, D3 and D4 IGS
clocks), but the TICC logs are re-encoded, the reference reader has the same author, and allantools checks the
estimators, which are validated elsewhere.
