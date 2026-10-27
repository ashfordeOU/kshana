# Mission thread, Earth segment (0.40 workstream H): handover

Branch `feat/mission-thread-0.40` on kshana, from `origin/main` bc04e98f. Plan: kshana-pro `ws/coordination`,
`docs/plans/0.40-PLAN.md`, rows H and I. W59 builds the lunar segment (row I) against the interface below.
Identity for every commit: `Ashforde OÜ <ashfordegithub@cbaweja.org>` as author and committer, no trailers, no
AI attribution; check `git var GIT_AUTHOR_IDENT` and `git var GIT_COMMITTER_IDENT` before each commit (a worker
restart once reset the identity to the container default). Never rewrite pushed history. No PR, no comments.

Public sources only. No agency logos, no agency name in product branding, no endorsement claimed; the example
is called "Artemis-class" and the word Artemis appears nowhere else except the oracle id for the public Horizons
target. Never mention where any work request came from.

## What exists (pushed)

| Commit | What |
|---|---|
| a70d0261 | the interface: `src/mission_thread/{mod,phase,budget,handover,sensors}.rs`, registry `PHASE_KINDS` with stubs |
| d165d315 | `PhaseCtx { index, id, duration_s, seed, .. }`, `ThreadCtx::phase_seed(id)`, `PhaseCtx::require_duration`, `run_phase` stamping the document id |
| fe6beaaa | frame and timescale conversions, `src/mission_thread/conversions.rs` |
| 6c5e5d96 | the Moon's state from an optional DE440 SPK kernel for Gcrf and Mci; two kernel cuts and pinned Horizons tables in `tests/fixtures/mission_thread/` |
| b03bdc04 | `src/mission_thread/scenario.rs`: the document, `run_thread`, the report `kshana-mission-thread/1`, the SVG timeline |
| 0850337f | `src/mission_thread/earth/{mod,filter,model,orbit,launch}.rs`, the `launch-ascent` phase, `PhaseCtx.nav`/`time` |

All of it is checked: `cargo fmt`, `cargo clippy --release --lib --tests -- -D warnings`, `scripts/check-doc-coverage.sh`
(964, the ceiling), and the `mission_thread` unit tests (49). **Not yet wired into `api.rs`**: no kind is exposed, so
no surface, count or ledger moves.

## Decisions (do not re-litigate)

- Covariance is always the full 6x6 of `[x, y, z, vx, vy, vz]` in SI; `ClockState` carries a `timescale` tag
  (Tt | Tdb | Utc | Ltc). Frames: Gcrf, Itrf, Mci, Mcmf, Lvlh. Conversions happen in `ThreadCtx` at the handover,
  never inside a phase, and each conversion is its own budget row. Itrf and Lvlh are refused loudly.
- `EvidenceLabel` mirrors the ledger tiers (Validated | Modelled | Partner, with a row id); the thread label is
  the weakest phase label (Partner < Modelled < Validated). Switch to W54's type at integration.
- Handover rules: `carry`; `inflate` (white acceleration noise over a stated gap, straight-line model, states its
  noise and gap in the row); `reacquire` (dead reckoning for `acquire_s`, then an axis is set to the source floor
  only where the floor is smaller, never below the floor, never a reset). A handover never resets a covariance.
- A phase seed comes from SHA-256(thread seed LE || phase id), not the index and not the kind. A model length key
  (`arc_s`, `descent_s`, ...) must equal `duration_s` or the phase refuses (`PhaseCtx::require_duration`).
- The thread overwrites `PhaseBudget.phase_id` with the document's id (`run_phase`).
- The conversion rows are placed in the budget of the phase being entered; the previous phase's handover rows too.
- Gcrf<->Mci: kernel where it covers the epoch (stand-in 5 m and 1 mm/s; measured worst 2.63 m and 7.4e-6 m/s against
  pinned Horizons, which is DE441 while the kernel is DE440s), analytic series only as the stated fallback with its
  measured 195.7 km RMS (`tests/lunar_llr_real_data.rs`, 12 weekly Horizons states). A 195.7 km floor would make
  every lunar handover meaningless, so any lunar example must carry a kernel covering its epoch.
- Mci<->Mcmf is the mean sidereal rotation (27.321661 d), axes aligned at the thread epoch, no libration, and the row
  says so. Timescales go through TT: Utc<->Tt exact; Tdb<->Tt adds 14 us (the next Fairhead-Bretagnon term);
  Tt<->Ltc uses the secular rate from `lunar_time` with its 56 to 59 us/day band as the rate uncertainty.
- Lunar kind names (W59 owns all four): `lunar-orbit-rendezvous`, `lunar-descent`, `lunar-surface`, `lunar-ascent`.
  A document asks for a frame or timescale with `[phase] frame = "mci"` / `timescale = "ltc"`; the thread converts.

## What remains (mine)

1. **`leo-rendezvous`** (`src/mission_thread/earth/rendezvous.rs`). Model: `target_alt_m`, `[[legs]]` with
   `range_m`, `end_range_m`, `duration_s`, `sensor` (`optical-camera` | `lidar` | `rf-ranging`, models in
   `sensors.rs`), `interval_s`, the target's absolute sigmas (`target_abs_sigma_pos_m`, `target_abs_sigma_vel_mps`),
   the capture envelope (`capture_pos_m`, `capture_vel_mps`) and an optional `min_window_s`. Relative state in LVLH
   with the closed-form Clohessy-Wiltshire transition from `src/cw_dynamics.rs` (it agrees with Orekit), a 6x6
   Kalman covariance with position updates of variance `sensor_sigma(range).pos_sigma_m^2 / 3` per axis. Docking
   window = the first time the relative position and velocity sigmas are below the capture envelope, to the end of
   the phase. The budget's sigmas are the RELATIVE ones; the absolute (chaser) covariance is carried unchanged and
   says so in a row. Repeats are separate phases with separate ids; they are deterministic (no Monte Carlo).
2. **`tli-and-cruise`**. Mean state by the engine's Cowell propagator (`src/propagator.rs`, `ForceModel` with Sun
   and Moon third bodies; the opt-in ephemeris tier takes a `KernelEphemeris`, whose cut must then also hold the Sun,
   segment (10, 0): add it to `KEEP` in `tests/fixtures/mission_thread/make_moon_kernel_cut.py` and regenerate both
   cuts). Covariance by a finite-difference state-transition matrix of that propagation (seven runs), TLI burn error
   injected as `dv * fraction` along the burn and `dv * pointing` across it. Updates: GNSS from `gnss-ssv` along an
   osculating HEO standing in for the TLI arc (`ssv::sweep::run_trajectory` returns per-epoch signals in view and a
   PDOP summary; fix sigma = PDOP median x a stated UERE), ground tracking from the ground-network overlay, whose
   duty cycle comes from `passes::predict_passes` / `contact_schedule`. Handover to the lunar segment is Gcrf to Mci.
3. **`ground-network` overlay** (not a phase): per-phase coverage and station handover; output is the tracking duty
   cycle that scales the ground-tracking update rate in any phase that lists `ground-tracking`.
4. **`entry`**: pre-entry covariance mapped to the entry interface (straight-line or the cruise STM), flight-path
   angle sigma from the perpendicular velocity sigma over V, corridor from `reentry::` (Allen-Eggers) against a
   stated corridor, landing footprint from the entry-interface covariance; MODELLED, every number a stated input.
5. **Wire the kind**: `ScenarioKind::MissionThread` in `src/api.rs` (enum, name, classify, `ScenarioMeta`, run),
   `src/api/builtins.rs` (`Scenario` + `BuiltinKind` for `MissionThreadScenario`; `moon_kernel_path` is a file key:
   add it to `inline_only::FILE_SOURCE_KEYS`, and note `tests/scenario_file_sources_guard.rs` walks only top-level
   `pub` fields), `src/registry.rs` (enum and `KIND_MODULES`), `src/advanced_report.rs`, `src/fom_label.rs`,
   `src/interop/scene.rs`, `src/bundled_scenarios.rs` (the example), `src/wasm_types.d.ts`, `kshana.pyi`, a `UNITS`
   table for the report (`tests/field_units_global.rs` audits every numeric leaf; the `budget_rows[].sigma` field
   has a per-row unit), ledger rows in `src/verification.rs`, docs (`docs/MISSION-THREAD.md`, `docs/SURFACES.md`,
   `commands/kshana-run.md`), then regenerate with `cargo run --release --bin gen_validation_artifacts`,
   `tools/gen_kinds_index.py` and the field-units schema
   (`cargo test --test field_units_global zzz_emit_field_units_schema -- --ignored`). The checklist is the diff of
   commit a396a84c (the `holdover-test` kind). Adding a kind moves the kind-count surfaces
   (README x4, CAPABILITY.md, ARCHITECTURE.md, diagrams, tutorials README, MCP README, `commands/kshana-run.md`);
   the 0.39 integration notes (`docs/design/integration-0.38-handover.md`) say how those are regenerated.
   Wire it together with the first runnable example: a kind that only has stubs fails the bundled-scenario tests.
6. **The Artemis-class example** (`scenarios/mission-thread-artemis-class.toml`), built only from NASA's public
   Artemis IV ConOps material: depot and lander launches, repeated LEO propellant-transfer rendezvous and docking,
   Orion launch, TLI, cislunar cruise, lunar orbits, descent, surface, ascent, redock, return and entry. Cite the
   document title and date in the header; ILLUSTRATIVE numbers must say so. Epoch 2028-01-01, with the committed
   2028 kernel cut (`de440s_moon_2028-01-01_2028-04-01.bsp`) for the Moon.
7. **Oracle**: Artemis I Orion from JPL Horizons (target -1023), fetched and hash-pinned, never vendored (use the
   `scripts/fetch_cs5071a.sh` pattern and `tests/fixtures/mission_thread/horizons_moon_geocentric_*.url`).
   Pre-register in a committed file BEFORE any run: the interval, what is compared (the propagated cislunar arc
   against Horizons) and the bar. The 2022-11-16 to 2022-12-12 kernel cut is already committed for it. VALIDATED
   only through the matrix process if it passes; MODELLED otherwise, and a missed bar is recorded as missed.
8. **Docs and release items**: `docs/MISSION-THREAD.md` (W59 adds its sections), the kind pages via
   `tools/gen_kinds_index.py`, CHANGELOG `[Unreleased]`, a README mention if the owner wants one. Do not claim
   conformance or endorsement anywhere.

## Gotchas

- `cargo test` of the whole crate is slow; use `cargo test --release --lib mission_thread` while developing, and
  run clippy with `-D warnings` on `--lib --tests` and READ its output (`clippy::unwrap_used` is denied in the
  library, `needless_range_loop` is allowed in files that opt in with `#![allow(clippy::needless_range_loop)]`).
- `cargo fmt` reorders `pub mod` lines alphabetically.
- Doc-coverage ceiling is 964 missing docs: every new public item needs a doc comment.
- `palette_sync` forbids hex colour literals in `src/*.rs` outside `palette.rs`; the timeline figure uses
  `palette::chart` constants.
- Hold every pin-bearing test to its `PIN-SCOPE` / `PIN-EXCLUDES` comment (`tests/source_guards.rs`).
- A tooling run of `pkill -f` kills your own shell; do not use it.
- Test fixtures cut from NAIF are made with `tests/fixtures/mission_thread/make_moon_kernel_cut.py`, which needs
  `spiceypy` and the pinned NAIF files in `$KSHANA_NAIF_DIR`; it refuses unpinned inputs.
- The permission system may switch a session to auto mode and deny a `git commit` or a port; retry once, report,
  and ask the coordinator to have the owner switch the mode.
