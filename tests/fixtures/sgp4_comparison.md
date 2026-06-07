# SGP4/SDP4 head-to-head: Kshana vs the `sgp4` crate

Independent cross-validation of Kshana's SGP4/SDP4 propagator against the [`sgp4`](https://crates.io/crates/sgp4) crate (neuromorphicsystems/sgp4), the most widely used Rust SGP4 implementation. Both are propagated over the official **AIAA 2006-6753** verification vectors (Vallado et al., *Revisiting Spacetrack Report #3*) bundled at `tests/fixtures/sgp4/`, and each TEME position is compared against the reference `tcppver.out` table.

Both propagators use the **WGS72** gravity model the AIAA vectors are defined in. The crate's default `Constants::from_elements` constructor uses WGS84 and so differs from this WGS72 reference by up to ~3 km — a modelling choice, not an error; we therefore drive the crate through `from_elements_afspc_compatibility_mode`, which selects WGS72, for an apples-to-apples comparison against the reference and Kshana.

Worst-case position error per regime (km). `kshana↔ref` and `crate↔ref` are each implementation against the published reference; `kshana↔crate` is the two independent implementations against **each other** — the agreement that establishes pedigree. `rows` counts the reference rows compared for Kshana; `crate rows` the subset the crate could also propagate (it rejects a few pathological cases at construction).

| Regime | Cases | Rows | Crate rows | kshana↔ref (km) | crate↔ref (km) | kshana↔crate (km) |
|---|---:|---:|---:|---:|---:|---:|
| near-earth (LEO/MEO) | 9 | 158 | 158 | 7.31e-9 | 7.32e-9 | 4.42e-10 |
| deep-space (non-resonant) | 12 | 215 | 205 | 4.12e-6 | 2.05e-7 | 4.12e-6 |
| deep-space resonance (1/2-day) | 5 | 125 | 125 | 8.05e-9 | 7.65e-9 | 2.22e-9 |
| deep-space resonance (1-day) | 7 | 168 | 95 | 8.18e-9 | 7.83e-9 | 2.15e-9 |
| **all** | **33** | **666** | **583** | **4.12e-6** | **2.05e-7** | **4.12e-6** |

Total reference rows compared: **666** for Kshana, **583** of them also propagated by the crate.

The `sgp4` crate could not initialise 4 deliberately-pathological AIAA case(s) (`11801`, `33333`, `33334`, `33335`) — it rejects out-of-range orbits at construction, where Kshana accepts the element set and returns an error only on the propagation steps that decay or diverge (exactly where the reference table also stops). Those cases are excluded from the cross-implementation columns; Kshana's own agreement with the reference on every supported row is unaffected.

Regenerate with `KSHANA_REGEN_FIXTURES=1 cargo test --test sgp4_crate_comparison`. The figures are produced deterministically from the bundled fixtures and the pinned toolchain; no wall-clock time is embedded, so an unchanged run reproduces this file byte-for-byte. The live assertions in `tests/sgp4_crate_comparison.rs` enforce that both implementations stay within 2e-5 km of the reference and agree with each other to within 4e-5 km across all regimes — a regression guard, not just a one-off table.
