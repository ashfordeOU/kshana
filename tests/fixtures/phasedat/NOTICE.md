# PHASE.DAT reference oracle — provenance

External reference deviations used by `tests/phasedat_reference.rs` to validate the
Kshana overlapping-Allan, modified-Allan and time-deviation estimators against the
**canonical Stable32 reference dataset**.

## Dataset
- **PHASE.DAT** — the 1001-point phase reference series distributed with **Stable32**
  (W. J. Riley / Hamilton Technical Services), the de-facto reference
  frequency-stability tool. It is the standard regression series independent tools
  (e.g. `allantools`) check themselves against.

## Oracle files (committed here)
- `phase_dat_oadev.txt` — Stable32 **Overlapping Allan** deviation, full AF ladder.
- `phase_dat_mdev.txt`  — Stable32 **Modified Allan** deviation, full AF ladder.
- `phase_dat_tdev.txt`  — Stable32 **Time** deviation, full AF ladder.

Each row is `AF  τ  #  α  MinSigma  Sigma  MaxSigma`; `Sigma` is the Stable32 point
estimate (the `Min/Max` band is not populated for this series, so the test checks
the point estimate directly).

## Raw data is NOT committed
`PHASE.DAT` ships with the commercial Stable32 tool; it is **git-ignored** and not
vendored here. Reproduce it locally with:

```
scripts/fetch_phasedat.sh           # downloads into ./realdata-cache/phasedat/
cargo test --test phasedat_reference -- --nocapture
```

The test reads the raw file from `realdata-cache/phasedat/PHASE.DAT` (override with
`KSHANA_PHASEDAT_PATH`); when absent it prints a skip notice and passes, so CI
without the data stays green.

## Attribution
- Stable32 / PHASE.DAT — W. J. Riley, *Handbook of Frequency Stability Analysis*,
  NIST SP 1065 (2008); Stable32 (Hamilton Technical Services).
- Mirror — `allantools`, Anders Wallin et al., https://github.com/aewallin/allantools (LGPL-3.0).

Cited, not endorsed. Kshana is not affiliated with the above.
