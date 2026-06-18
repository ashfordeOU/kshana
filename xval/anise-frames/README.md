# `kshana-anise-xval` — reference-frame cross-validation against ANISE/SPICE

An **independent, third-party numerical cross-check** of `kshana`'s IAU 2006/2000A
celestial-to-terrestrial reduction (`kshana::cio`, GCRS→CIRS→ITRS) against
[**ANISE**](https://github.com/nyx-space/anise) — the pure-Rust reimplementation of
NASA/NAIF's SPICE toolkit — rotating to the high-precision Earth body-fixed frame
**ITRF93** from JPL's `earth_latest_high_prec.bpc` kernel.

`kshana`'s frame chain is already anchored **bit-for-bit** to the published SOFA/ERFA
test vectors (`eraXys06a` / `eraC2ixys` / `eraEra00`). This crate adds an *external*
sanity bound: it drives both implementations with the **same IERS Earth-orientation
parameters** and measures how far the two independent frame realizations actually
disagree on a physical position.

## Result

Eight quarterly epochs, 2020–2023, identical IERS `finals2000A` EOP fed to both sides:

| date | UT1−UTC (s) | xp (″) | yp (″) | angle (″) | surface (m) | GPS (m) |
|------|------------:|-------:|-------:|----------:|------------:|--------:|
| 2020-01-01 | −0.1771554 | 0.076577 | 0.282336 | 0.026652 | 0.824 | 3.432 |
| 2020-07-01 | −0.2401335 | 0.166823 | 0.431629 | 0.018747 | 0.580 | 2.414 |
| 2021-01-01 | −0.1753606 | 0.068691 | 0.304048 | 0.027077 | 0.837 | 3.487 |
| 2021-07-01 | −0.1674334 | 0.205014 | 0.419363 | 0.018708 | 0.578 | 2.409 |
| 2022-01-01 | −0.1104988 | 0.054644 | 0.276986 | 0.027010 | 0.835 | 3.478 |
| 2022-07-01 | −0.0686589 | 0.230021 | 0.460837 | 0.018180 | 0.562 | 2.341 |
| 2023-01-01 | −0.0198682 | 0.062781 | 0.200905 | 0.027792 | 0.859 | 3.579 |
| 2023-07-01 | −0.0361418 | 0.183657 | 0.508485 | 0.018113 | 0.560 | 2.332 |

**Maximum relative rotation 0.028″ → ≤ 0.86 m on the ground, ≤ 0.93 m at LEO, ≤ 3.6 m
at GNSS orbit** (mean angle 0.023″). This meets the ROADMAP "< 10 m" frame cross-check
target with large margin.

`surface`/`LEO`/`GPS` are the worst-case position disagreement `2·R·sin(θ/2)` at the
WGS-84 equatorial radius, ~550 km LEO, and the GPS/MEO radius. (The committed numbers
are a representative run; regenerate with `frame-xval` — they are stable across BPC
updates because the EOP for these past dates is final.)

## Why this is a separate crate (not a `kshana` cargo feature)

ANISE and its time library `hifitime` are licensed **MPL-2.0** and built on **Rust
edition 2024** (≥ 1.85). Adding either to the main crate's dependency graph would:

- **break the required `cargo deny` gate** — MPL-2.0 is outside `kshana`'s strict
  license allow-list; and
- **break the MSRV job** — `cargo` 1.75 cannot even parse an edition-2024 manifest in
  the resolved graph.

So WE3 ships as a **standalone, workspace-excluded crate** with its own `Cargo.lock`.
The root package declares no `[workspace]` and lists `/xval` in its `exclude`, so this
crate is invisible to root `cargo` commands and to the published `kshana` crate. ANISE
is pinned `default-features = false`, which keeps its tree to MIT/Apache/BSD/etc. plus
the two unavoidable MPL-2.0 crates (anise, hifitime) — confined entirely here.

## Running it

```sh
cd xval/anise-frames

# Full cross-validation: fetches earth_latest_high_prec.bpc (~5 MB) into kernels/ if
# absent, prints the table, writes report.json + report.md, exits non-zero on regression.
cargo run --bin frame-xval

# The test gate (self-skips if no kernel is available, so it never reddens offline):
cargo test

# Offline: point at a local kernel copy and the download is skipped.
KSHANA_ANISE_BPC=/path/to/earth_latest_high_prec.bpc cargo test
```

The pure logic (matrix metrics, the IERS `finals2000A` parser, the time-scale
conversions) is tested with **no kernel and no network**; only the live ANISE
comparison needs the BPC.

## What the residual is — and is not

- `kshana` realizes the rigorous **IERS 2010 / IAU 2006/2000A CIO** transform.
- ANISE's **ITRF93** is JPL's `earth_latest_high_prec.bpc` realization (IAU 1976/1980
  precession-nutation + interpolated IERS EOP), tied to the ITRF93 datum.

Fed identical UT1 and polar motion, the ~0.02–0.03″ residual is dominated by the
precession-nutation **model** difference, the **ITRF93-vs-ITRF20xx frame tie**, and the
omitted sub-mas celestial-pole offsets (dX, dY). It is correctly **not** bit-for-bit —
two different but both-authoritative frame realizations are expected to agree at the
sub-metre-to-few-metre level, which is exactly what is observed. The bit-for-bit
correctness anchor for `kshana` remains the SOFA/ERFA vectors in `kshana::cio`.

## Data sources

- **Kernel:** `earth_latest_high_prec.bpc` —
  <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/earth_latest_high_prec.bpc>
- **EOP:** IERS `finals2000A.all` (Bulletin A final) —
  <https://datacenter.iers.org/data/latestVersion/finals.all.iau2000.txt>;
  the eight validation rows are committed verbatim in `fixtures/finals2000A_excerpt.txt`.
- **Reference:** ANISE v0.10 — <https://github.com/nyx-space/anise> (MPL-2.0).

## Layout

```
src/compare.rs       rotation-matrix metrics (relative angle, ground separation)
src/eop.rs           IERS finals2000A fixed-column parser
src/timeconv.rs      UTC -> (TT, UT1) Julian dates via kshana::timescales
src/kshana_chain.rs  the kshana side (gcrs_to_itrs)
src/anise_bridge.rs  the ANISE side (GCRF/EME2000 -> ITRF93)
src/kernel.rs        BPC resolution + curl download
src/xval.rs          epoch grid, comparison driver, report model
src/main.rs          the `frame-xval` binary
tests/               the headline cross-validation gate
fixtures/            committed IERS EOP excerpt
```

License: AGPL-3.0-only (this crate's own code). ANISE and hifitime are MPL-2.0; this crate
links them but they are not redistributed here.
