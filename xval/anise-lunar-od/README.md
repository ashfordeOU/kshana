# `kshana-anise-lunar-od` — DE-grade selenocentric OD cross-validation

An **independent, DE-grade cross-check** of `kshana`'s Moon-centred precise orbit determination.

`kshana`'s lunar fit reaches **6.6 m** (reduced-dynamic) against the real NASA/JPL **Horizons
LRO** orbit — a residual proven (in `tests/agency_lro.rs` and the W4b validation record) to be
limited by the **analytic** lunar orientation and ephemeris, *not* the estimator. This crate swaps
**only those two inputs** for DE-grade ones and re-runs the **same** reference-grade estimator:

| input | analytic (`kshana` default) | DE-grade (here) |
|-------|------------------------------|-----------------|
| lunar body-fixed orientation | IAU 2015 analytic libration (~tens of arc-seconds) | **DE440 `MOON_PA`** (numerically integrated, `moon_pa_de440_200625.bpc`) |
| Earth/Sun ephemeris | Montenbruck–Gill analytic (~0.3°) | **JPL DE440** (`de440s.bsp`) |
| gravity field, estimator, empirical tier | — unchanged — | — unchanged — |

Both inputs are read through `kshana`'s `lunar_od::LunarEnvironment` provider seam (the
`AniseLunarEnvironment` here), so the swap is dependency injection, not a fork. Everything else —
the GRAIL GRGM660PRIM field evaluation (`kshana::gravity_sh`), the third-body and empirical
dynamics, and the Gauss–Newton batch estimator with its variational STM (`kshana::precise_od::fit`)
— is the identical `kshana` code the Galileo and Swarm-A datasets use.

## What this tests

The analytic fit's residual was orientation/ephemeris-limited. So the question is simple and
honest: with DE-grade orientation and ephemeris, what is the true post-fit residual, and does it
cross the 5 m reference-grade bar? **The harness reports whatever number the fit produces.** The
empirical-acceleration a-priori 1σ is held at the Swarm-consistent `1e-7` — it is never tuned to
chase the bar.

## Result

Produced by `cargo run --release --bin lunar-od-xval`, which writes `report.json` + `report.md`.
The committed result and its interpretation live in `docs/REFERENCE-GRADE-OD.md` (the citable
validation record). The DE-grade orientation is verified, in the test gate, to genuinely differ
from the analytic one by the tens of arc-seconds the cross-validation exists to remove.

## Running it

```sh
cd xval/anise-lunar-od

# Full DE-grade fit: fetches de440s.bsp (~32 MB) + moon_pa_de440_200625.bpc (~13 MB) into
# kernels/ if absent, runs the dynamic + reduced-dynamic fits, prints the table, writes
# report.{json,md}.
cargo run --release --bin lunar-od-xval

# The fast test gate (self-skips if no kernels, so it never reddens offline): verifies the
# DE-grade environment is wired and genuinely differs from kshana's analytic orientation.
cargo test

# Offline: point at local kernel copies and the download is skipped.
KSHANA_ANISE_DE440S=/path/de440s.bsp KSHANA_ANISE_MOON_PA=/path/moon_pa_de440_200625.bpc cargo test
```

## Why this is a separate crate (not a `kshana` cargo feature)

Identical to `xval/anise-frames`: ANISE and its time library `hifitime` are licensed **MPL-2.0**
and built on **Rust edition 2024** (≥ 1.85). Adding either to the main crate's dependency graph
would **break the required `cargo deny` gate** (MPL-2.0 is outside `kshana`'s strict allow-list)
and **break the MSRV job** (cargo 1.75 cannot parse an edition-2024 manifest in the resolved graph).
So this ships as a **standalone, workspace-excluded crate** with its own `Cargo.lock`. The root
package declares no `[workspace]` and lists `/xval` in its `exclude`, so this crate is invisible to
root `cargo` commands and to the published `kshana` crate. ANISE is pinned `default-features =
false`, confining the two unavoidable MPL-2.0 crates (anise, hifitime) entirely here. The published
crate's default path remains the analytic, kernel-free, fully-reproducible one.

## Data sources

- **DE440 ephemeris:** `de440s.bsp` —
  <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp>
- **DE440 lunar orientation:** `moon_pa_de440_200625.bpc` —
  <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de440_200625.bpc>
- **Truth:** the same vendored Horizons LRO arc the analytic fit uses
  (`tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv`).
- **Reference:** ANISE v0.10 — <https://github.com/nyx-space/anise> (MPL-2.0).

NAIF kernels are public-domain NASA/JPL data, referenced not redistributed (gitignored).

## Layout

```
src/kernel.rs     resolve + curl-download the DE440 SPK and lunar PA BPC
src/anise_env.rs  AniseLunarEnvironment: the DE-grade LunarEnvironment provider
src/truth.rs      the vendored Horizons LRO truth parser
src/fit.rs        the dynamic + reduced-dynamic fit via kshana::precise_od::fit
src/report.rs     the honest residual report model
src/main.rs       the `lunar-od-xval` binary
tests/            the self-skipping wiring gate
```

License: Apache-2.0 (this crate's own code). ANISE and hifitime are MPL-2.0; this crate links them
but they are not redistributed here.
