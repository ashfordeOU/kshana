<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Lunar time-scale vectors: `kshana lunar-time-vectors`

Test vectors for software that has to carry time to and from the Moon: Lunar Coordinate Time
(TCL) as the IAU defined it in 2024, the relations it rests on, published TCL ephemeris rates,
leap-second handling on the UTC side, scale tags, and **provisional** vectors for Coordinated
Lunar Time (LTC), which has no published definition yet. Each vector cites its source and says
how firm its value is.

```
kshana lunar-time-vectors [--json] [<vectors.json|dir> ...]
```

With no path the built-in set (`data/conformance/lunar-time/lunar-time.json`, 21 vectors) runs
against kshana. Exit codes: 0 every vector passes, 1 one fails, 2 a usage or input error. No
network.

**Evidence: MODELLED.** A pass means kshana's arithmetic reproduces the cited values within the
stated tolerance. It is not a statement about any other software, and kshana does not define
LTC.

## What is published, and what is not (sources fetched 2026-11-28)

| Text | What it fixes | Status in the vectors |
|---|---|---|
| IAU 2024 Resolution II, *to establish a standard Lunar Celestial Reference System (LCRS) and Lunar Coordinate Time (TCL)* ([PDF](https://drive.google.com/file/d/1-Ps-YyCjmjzg2NGi0A-VE0kWqr8w7LnE/view), linked from the [IAU list of resolutions](https://iau.org/Iau/Publications/List-of-Resolutions)) | TCL is the time coordinate of the LCRS, built like the GCRS (recommends 1, 2); its unit is consistent with the SI second (3); TCL reads 1977 January 1, 0h 0m 32.184s when TCB reads the same at the centre of the Moon (4); TCL−TCB follows IAU 2000 Resolution B1.5 with lunar quantities (5) | `defined` |
| IAU 2024 Resolution III, *on the establishment of a coordinated lunar time standard by international agreement* ([PDF](https://drive.google.com/file/d/1G5WG8cu2tiTIsCUkiOcaxfL0Z0rs1alm/view)) | only that the relation between a lunar reference time scale and UTC be pursued by agreement among international organisations | the reason LTC vectors are `provisional` |
| IAU 2000 Resolution B1.9 ([PDF](https://drive.google.com/file/d/1ZXjFjgcq5hdEpPk8PCEDBgf9dgGn1CB_/view)) | dTT/dTCG = 1 − L_G, L_G = 6.969290134e−10 | `defined` |
| IAU 2006 Resolution B3 ([PDF](https://drive.google.com/file/d/16Jf6YgA7Nlf3ZSnKbWOhXcmU7M7TA6HH/view)) | TDB = TCB − L_B (JD_TCB − T0) 86400 s + TDB0, L_B = 1.550519768e−8, TDB0 = −6.55e−5 s, T0 = 2443144.5003725 | `defined` |
| IERS Bulletin C 52 (<https://hpiers.obspm.fr/iers/bul/bulc/bulletinc.52>) | the leap second at the end of 2016 (UTC−TAI −36 s, then −37 s) | `defined` |
| Lu, Yang and Xie, *Lunar Time Ephemeris LTE440: User Manual* (<https://arxiv.org/abs/2506.19213>) | ⟨dTCL/dTCB⟩ = 1 − 1.48253621667e−8, ⟨dTCL/dTDB⟩ = 1 + 6.798355238e−10; annual term about 1651 µs, monthly 126 µs | `published-model` |
| Ashby and Patla, *A Relativistic Framework to Establish Coordinate Time on the Moon and Beyond* (<https://arxiv.org/abs/2402.11150>) | a clock near the Moon's equator gains 56.02 µs per day over a lunar orbit against one near the Earth's equator | `provisional` (not LTC) |
| NASA, *Lunar Time* (<https://www.nasa.gov/?p=1034651>) | LTC will be determined by an ensemble of lunar clocks and remain traceable to UTC; the White House policy calls for its adoption across Artemis Accords signatories | the reason LTC vectors are `provisional` |

**LTC is not defined in any text read.** No published document gives LTC's rate, origin, its
relation to TCL, or its leap-second policy, so no vector asserts any of them. The LTC vectors say
only that the tag has no definition and compare a lunar-surface clock model with one published
relativistic result; they will be replaced when a definition is published.

## The vectors

| Operation | Input | Expected | Status |
|---|---|---|---|
| `tcg_minus_tt` | a TT epoch (whole Julian day `jd0` and seconds `s`) | TCG − TT = L_G/(1 − L_G) (TT − T0), exact | defined (B1.9) |
| `tcb_minus_tdb` | a TCB epoch | TCB − TDB = L_B (TCB − T0) − TDB0, exact | defined (2006 B3) |
| `tcb_minus_tcl` | TCB at the origin | 0 | defined (2024 II, rec. 4) |
| `tcb_minus_tcl` | TCB at 2000, 2026, 2030 | the LTE440 secular rate times (TCB − T0); tolerance 3.3 ms (the published periodic amplitudes and kshana's stated rate bound) | published-model |
| `tcl_mean_rate` | a TDB window (1950-2050) | 1.48253621667e−8 and the dTCL/dTDB rate that follows with L_B; tolerance 2e−12 | published-model |
| `utc_to_scale` | UTC around the 2016 leap second | TT labels, through 23:59:60 | defined (Bulletin C 52) |
| `scale_tag` | TT, TDB, TCL, LTC | whether a published text defines the tag, and which | defined; LTC provisional |
| `lunar_surface_rate` | an epoch | 56.02 µs/day; tolerance 1.5 µs/day (kshana's choice: the figure depends on reference surfaces and averaging) | provisional |

The expected values come from `data/conformance/lunar-time/gen_lunar_time_vectors.py` (Python
standard library, exact rational arithmetic on the defining constants), not from the Rust code
the runner checks. Each vector is `{id, op, input, expect, tolerance, status, status_reason?,
source: {title, url, fetched, clause}, note?}`; the runner fails a vector with no source URL, an
unknown status, or a non-`defined` status without a reason. Operations it does not know are
passed to the [time-scale vector](TIME-VECTORS.md) runner, so a file can mix both.

The TCL origin kshana integrates from (`src/lunar_timescale.rs`, [lunar-ref](LUNAR-REF.md)) is
the one Resolution II recommends 4 states: `tcl-origin` checks it.

Tests: `tests/lunar_time_vectors.rs`.
