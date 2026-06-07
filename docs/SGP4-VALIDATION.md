<!-- SPDX-License-Identifier: Apache-2.0 -->
# SGP4/SDP4 validation against the community reference

Kshana's orbit propagator is validated against the **canonical community
reference** for SGP4/SDP4: the verification vectors published with Vallado et
al., *"Revisiting Spacetrack Report #3"* (AIAA 2006-6753), distributed as
`SGP4-VER.TLE` (the test TLEs) and `tcppver.out` (the expected TEME state at each
time). This is the same reference the public C++/Python/MATLAB implementations
validate against, so agreement here is agreement with the de-facto standard.

## Result

| Quantity | Value |
|---|---|
| Reference states compared | **666** (all rows in `tcppver.out`, pinned in the test) |
| Worst position error | **≈ 4 mm** (< `2e-5` km tolerance) |
| Worst velocity error | **≈ 1.85e-9 km/s** (< `1e-6` km/s tolerance) |
| Cases covered | near-Earth SGP4, deep-space SDP4 (lunar-solar + 12 h/24 h resonance), and the deliberate error-code cases |

The deep-space and resonant cases matter specifically for this project: GNSS
satellites sit in ~12 h orbits that are deep-space and resonant, which a
two-body + J2-secular model cannot reproduce — SGP4/SDP4 can.

## Method

- The implementation (`src/sgp4.rs`) is a dependency-free Rust port of the
  public-domain Vallado algorithm; epoch handling is days-since-1950, the
  `improved` (not `afspc`) mode is used, and WGS-72 gravity constants are applied
  as the reference specifies.
- The test (`tests/sgp4_verification.rs`) parses the vendored `SGP4-VER.TLE` and
  `tcppver.out` fixtures (`tests/fixtures/sgp4/`), propagates each test satellite
  to every reference time, and asserts the TEME position and velocity match within
  the tolerances above. The compared-row count is pinned at exactly **666** so a
  fixture or skip-behaviour regression cannot quietly reduce coverage.

## Reproduce it

```sh
cargo test --test sgp4_verification -- --nocapture
```

The test prints the number of rows compared and the worst-case position and
velocity errors. The fixtures are committed, so the check is fully offline and
deterministic.

## Independent cross-check against the `sgp4` crate

Matching the published reference proves correctness against a *table*. To also
prove correctness against an *independent implementation*, `tests/sgp4_crate_comparison.rs`
runs the most widely used Rust SGP4 library — the
[`sgp4`](https://crates.io/crates/sgp4) crate (neuromorphicsystems/sgp4) — over
the same 666 AIAA vectors and compares the two codebases head-to-head. Both are
driven with the **WGS72** gravity model the vectors are defined in (the crate's
default `from_elements` uses WGS84, which differs from the WGS72 reference by
~km — a modelling choice, surfaced honestly, not an error).

| Regime | kshana ↔ reference | crate ↔ reference | kshana ↔ crate |
|---|---:|---:|---:|
| near-earth (LEO/MEO) | 7.3e-9 km | 7.3e-9 km | **4.4e-10 km** |
| deep-space (non-resonant) | 4.1e-6 km | 2.1e-7 km | **4.1e-6 km** |
| deep-space resonance (½-day) | 8.1e-9 km | 7.7e-9 km | **2.2e-9 km** |
| deep-space resonance (1-day) | 8.2e-9 km | 7.8e-9 km | **2.2e-9 km** |

Two independent implementations agree to **sub-micron** on near-earth and
resonant orbits and to **4.12 mm worst-case** across all regimes — the same
4.12 mm that is Kshana's own deviation from the reference, i.e. the disagreement
*is* that one deep-space case, with the crate sitting between Kshana and the
table. The full table (with per-regime row counts and the four pathological cases
the crate rejects at construction) is committed at
[`tests/fixtures/sgp4_comparison.md`](../tests/fixtures/sgp4_comparison.md) and
regenerated via `KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison`.

## Status of "publishing" this result

The cross-validation itself is complete and in-tree. Submitting the result to
external venues (a community catalogue, a short note, a DOI-archived record) is a
maintainer action tracked separately on the roadmap; this document is the
in-repository record those submissions would point to.
