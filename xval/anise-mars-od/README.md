# `kshana-anise-mars-od` — DE-grade heliocentric Mars cross-validation

An **independent, DE-grade cross-check** of `kshana`'s Sun-central (heliocentric) Mars propagation —
the planetary analogue of `xval/anise-lunar-od`.

`kshana`'s core ships only the kernel-free, analytic deep-space path: the Sun-central two-body force
model (`ForceModel::two_body().with_body(Body::sun())`) and the Mars body constants. That path is
validated against **ephemeris-free analytic truth** in `tests/mars_propagation.rs` (closed
Low-Mars-Orbit, specific-energy conservation, the Mars-J2 nodal-regression rate, and the ≈687-day
Mars-year period). What the core cannot do without external data is check the propagation against the
**real JPL ephemeris**. This crate does exactly that.

| input | analytic (`kshana` core / `tests/mars_propagation.rs`) | DE-grade (here) |
|-------|---------------------------------------------------------|-----------------|
| Mars heliocentric truth | none (only closed-form Keplerian self-consistency) | **JPL DE440** Mars barycenter wrt Sun (`de440s.bsp`, via ANISE) |
| force model, propagator, Sun μ | — unchanged — | — unchanged — |

## What this tests

Seed `kshana`'s Sun-central two-body propagator from a **DE440 Mars-barycenter state** at an epoch,
propagate forward, and report the honest position/velocity residual against the DE440 Mars ephemeris
at a sequence of arc lengths (1, 5, 10, 30, 90 days). A two-body Sun-central model deliberately omits
the planetary perturbations (Jupiter chiefly) and the Mars-system internal motion the DE440
**barycenter** ephemeris carries, so the residual is non-zero and **grows with arc length** — that
growth is the honest signature of the unmodelled n-body dynamics, not an integrator error. A short
arc stays a tiny fraction of the ~2.3e11 m heliocentric distance, confirming the Sun-central
machinery is correct.

> Why the **barycenter** (NAIF 4) and not the Mars body centre (499): `de440s.bsp` contains body 4
> but not 499, and the Mars-centre↔barycenter offset is the tiny pull of Phobos/Deimos (~ tens of
> metres), far below the heliocentric two-body residual measured here. The 499 variant would need the
> extra Mars-system SPK `mar097.bsp` (resolvable via `$KSHANA_ANISE_MAR097`); the core check uses the
> barycenter so it needs only the one DE440 kernel the lunar cross-check already uses.

## Running it

```sh
cd xval/anise-mars-od

# Full per-arc residual sweep: resolves/fetches de440s.bsp (~32 MB) into kernels/ (or set
# $KSHANA_ANISE_DE440S), seeds the Sun-central propagator from DE440, prints the table, writes
# report.{json,md}. Skips cleanly with a clear message if the kernel is absent and unfetchable.
cargo run --release --bin mars-od-xval

# The fast test gate (self-skips if no kernel, so it never reddens offline): verifies the DE440
# ephemeris matches real JPL Horizons truth and the Sun-central propagation tracks DE440 short-arc.
cargo test

# Offline: point at a local DE440 copy (the SAME variable xval/anise-lunar-od uses).
KSHANA_ANISE_DE440S=/path/de440s.bsp cargo test
```

## Why this is a separate crate (not a `kshana` cargo feature)

Identical to `xval/anise-lunar-od` and `xval/anise-frames`: ANISE and its time library `hifitime`
are licensed **MPL-2.0** and built on **Rust edition 2024** (≥ 1.85). Adding either to the main
crate's dependency graph would **break the required `cargo deny` gate** (MPL-2.0 is outside
`kshana`'s strict allow-list) and **break the MSRV job** (cargo 1.75 cannot parse an edition-2024
manifest in the resolved graph). So this ships as a **standalone, workspace-excluded crate** with its
own `Cargo.lock`. The root package declares no `[workspace]` and lists `/xval` in its `exclude`, so
this crate is invisible to root `cargo` commands and to the published `kshana` crate. ANISE is pinned
`default-features = false`, confining the two unavoidable MPL-2.0 crates (anise, hifitime) entirely
here. The published crate's default path remains the analytic, kernel-free, fully-reproducible one.

## Data sources

- **DE440 ephemeris:** `de440s.bsp` —
  <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp> (carries the Mars
  barycenter NAIF 4 and the Sun NAIF 10).
- **Optional Mars-system SPK (499 variant only):** `mar097.bsp` —
  <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/mar097.bsp>
- **Truth in the test gate:** real JPL Horizons Mars-barycenter heliocentric states
  (`ssd.jpl.nasa.gov/api/horizons.api`, CENTER='500@10', ICRF, TDB), quoted verbatim with provenance.
- **Reference:** ANISE v0.10 — <https://github.com/nyx-space/anise> (MPL-2.0).

NAIF kernels are public-domain NASA/JPL data, referenced not redistributed (gitignored).

## Layout

```
src/kernel.rs     resolve + curl-download the DE440 SPK
src/anise_env.rs  AniseMarsEnvironment: the DE440 Mars/Sun/Earth ephemeris provider
src/xval.rs       seed the Sun-central propagator from DE440 and measure per-arc residuals
src/report.rs     the honest residual report model
src/main.rs       the `mars-od-xval` binary
tests/            the self-skipping wiring + Horizons-truth gate
```

License: Apache-2.0 (this crate's own code). ANISE and hifitime are MPL-2.0; this crate links them
but they are not redistributed here.
