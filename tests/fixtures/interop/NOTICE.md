# Interop fixtures — provenance

These files exercise Kshana's standard-format **import** path (the bridge that lets
Kshana ingest ephemerides produced by external flight-dynamics tools — GMAT, Orekit,
STK — which all emit CCSDS OEM).

| File | What it is | Provenance |
|------|------------|------------|
| `external_leo.oem` | A CCSDS 502.0-B-2 OEM (KVN) LEO arc in the style an external FDS tool exports — extra metadata keywords (`USEABLE_*`, `INTERPOLATION*`), `COMMENT` lines, and a `COVARIANCE` block the importer must skip. | **Hand-authored**, not real tracking data. Row-0 position/velocity is the classic Vallado worked-example state vector; later rows are illustrative format fillers. |

Honesty note: this is a format-conformance fixture, not a validation dataset. It proves
the importer parses what GMAT/Orekit/STK emit; it makes no claim about orbit accuracy.
