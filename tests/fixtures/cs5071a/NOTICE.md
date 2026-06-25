# Cs5071A real-hardware clock-stability oracle — provenance

This directory holds the **external reference deviations** used by
`tests/cs5071a_reference.rs` to validate the Kshana overlapping Allan and
overlapping Hadamard estimators against a **real atomic-clock measurement**.

## Measurement
- **Device under test:** a 5071A caesium primary frequency standard, 1 pulse-per-second
  output, measured against a hydrogen maser reference.
- **Instrument:** Keysight/Agilent 53230A time-interval counter.
- **Series:** 556 990 phase samples at τ₀ = 1 s (≈ 6.4 days), collected Feb 2014.
- **Collector:** Anders Wallin; distributed with the open-source `allantools`
  package, directory `tests/Cs5071A/`.

## Oracle files (committed here)
- `oadev_decade.txt` — Stable32 **Overlapping Allan** deviation, decade τ ladder.
- `ohdev_decade.txt` — Stable32 **Overlapping Hadamard** deviation, decade τ ladder.

Each row is `AF  τ  #  α  MinSigma  Sigma  MaxSigma`; `Sigma` is the point estimate
and `[MinSigma, MaxSigma]` the 1‑σ (0.683) confidence band Stable32 reports.
These are independently-computed reference values from **Stable32** (Hamilton
Technical Services / W. Riley), the de-facto reference frequency-stability tool.

## Raw data is NOT committed
The 556 990-point phase file (`5071A_phase.txt.gz`, ≈ 3 MB) is third-party data
without an explicit redistribution licence, so it is **git-ignored** and not
vendored here. Reproduce it locally with:

```
scripts/fetch_cs5071a.sh           # downloads into ./realdata-cache/cs5071a/
cargo test --test cs5071a_reference -- --nocapture
```

The test reads the raw file from `realdata-cache/cs5071a/5071A_phase.txt`
(override with `KSHANA_CS5071A_PATH`); when the file is absent it prints a skip
notice and passes, so CI without the data stays green.

## Attribution
- `allantools` — Anders Wallin et al., https://github.com/aewallin/allantools (LGPL-3.0).
- Stable32 reference deviations — W. J. Riley, *Handbook of Frequency Stability
  Analysis*, NIST SP 1065 (2008); Stable32 (Hamilton Technical Services).

Cited, not endorsed. Kshana is not affiliated with the above.
