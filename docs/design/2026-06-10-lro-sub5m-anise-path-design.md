# Metre-level selenocentric force-model validation by ephemeris fitting: the DE-grade (ANISE) path for LRO < 5 m

- **Date:** 2026-06-10
- **Status:** **IMPLEMENTED (Approach A) — outcome below.** Built as `xval/anise-lunar-od`. The hypothesis in §1/§7 (that the floor was orientation/ephemeris fidelity) was **tested and refuted for the reduced-dynamic tier**: DE-grade DE440 orientation + ephemeris improve the dynamic fit (12.6 → 12.0 m) but leave the **reduced-dynamic** residual unchanged (6.65 → 6.67 m), so the operational floor is *not* frame fidelity but an empirical-tier-irreducible residual (most consistent with LRO non-gravitational dynamics over the short arc). The lean analytic stack already matches DE-grade for the reduced-dynamic orbit; LRO stays honestly above 5 m and the milestone holds 3/6. Full result in `docs/AGENCY-ORBIT-VALIDATION.md`. The §7 residual-attribution fallback is exactly what played out.
- **Roadmap milestone:** P4 "Precise astrodynamics", step 4 ("validate vs 3 agency datasets, < 5 m RMS") — the one dataset still above the bar
- **Author:** Chakshu Baweja
- **Supersedes nothing.** Extends `docs/design/2026-06-09-precise-astrodynamics-design.md` (the agency-orbit force-model-validation design) and the W4b LRO result recorded in `docs/AGENCY-ORBIT-VALIDATION.md`.

## 1. The problem, and what is already proven

Kshana fits its full force model to three real agency precise orbits through one
Gauss–Newton batch estimator (`precise_od::fit` over the `precise_od::ForceModel` trait):

| Dataset | Regime | Reduced-dynamic 3-D RMS | < 5 m bar |
|---|---|---|---|
| Galileo E11 | MEO | 0.07 m | ✓ |
| Swarm-A | LEO | 0.10 m | ✓ |
| **LRO (NAIF −85)** | **lunar** | **6.6 m** (12.6 m dynamic) | **✗ — honestly above** |

The LRO residual is **not an estimator limitation**. W4b proved this exhaustively: the
dynamic residual is **identical at field degree/order 100 and 150** and at integrator
tolerance **1 × 10⁻⁶ vs 1 × 10⁻⁹**, and adding the **2-per-rev** empirical tier moved the
reduced-dynamic fit only **6.9 → 6.6 m**. After the empirical tier the residual is roughly
**isotropic ≈ 7 m** (RTN 3.49 / 4.56 / 3.35 m), which is the signature of a broadband frame
error, not a missing dynamical basis.

The floor is the fidelity of the two **analytic** inputs the Moon-centred force model uses:

1. **Lunar body-fixed orientation** — `lunar_frame::icrf_to_moon_pa(jd)` is the IAU 2015 /
   WGCCRE *analytic* libration series (13 terms), accurate to **tens of arc-seconds**
   against the JPL DE numerically-integrated `MOON_PA` orientation. The GRGM gravity field
   is sectoral/tesseral; mis-orienting it by tens of arc-seconds smears the non-radial
   acceleration.
2. **Earth/Sun ephemeris** — `ephem::{moon_position, sun_position}` is the built-in
   Montenbruck–Gill mean-equator-of-date analytic series, ~**0.3°** from the ICRF DE
   directions. The Earth third body is the **dominant** lunar-orbit perturbation
   (~3 × 10⁻⁵ m/s² at ~98 km), so a 0.3° direction error injects a near-static out-of-plane
   bias the empirical constant terms only partly absorb.

The single lever not yet pulled is to replace both analytic inputs with **DE-grade**
orientation and ephemeris — i.e. the JPL Development Ephemeris and its consistent
numerically-integrated lunar orientation, read from binary NAIF kernels via **ANISE** (the
pure-Rust SPICE reimplementation already vendored, workspace-excluded, in
`xval/anise-frames/`).

## 2. Goal and the honest success criterion

**Goal:** determine whether DE-grade orientation + ephemeris brings the LRO reduced-dynamic
fit **below 5 m**, and if so, flip P4 step 4 to **3/3 datasets under the bar** (milestone
`me862131d` → 4/6).

**This is a hypothesis to be tested, not a promise.** The honesty contract that governs the
whole force-model-validation-by-ephemeris-fitting record applies in full:

- The harness reports the **true** post-fit RMS, whatever it is.
- `empirical_sigma` stays at the Swarm-consistent **1 × 10⁻⁷** and is **never cranked** to
  manufacture a sub-5 m number. No parameter is tuned to hit a target.
- The milestone flips **only** if the genuine residual is < 5 m. If it lands above, we
  publish the real figure plus a residual-attribution analysis (Section 7) naming the next
  floor, exactly as W4b did at 6.6 m.

**Definition of done for this design's implementation:** a reproducible, kernel-fed LRO fit
exists in a workspace-excluded crate; its real RMS is recorded in `docs/AGENCY-ORBIT-VALIDATION.md`
with kernel SHAs and commit hash; and `me862131d` step-status reflects the honest outcome.

## 3. Non-negotiable constraints (the ethos)

The published `kshana` crate is **pure-coefficient, reproducible, and kernel-free**, and the
default CI gates must stay byte-for-byte untouched. Concretely:

- **MSRV 1.75 / edition 2021.** `cargo` 1.75 cannot even parse an edition-2024 manifest in
  the resolved graph. ANISE + hifitime are **edition 2024 (≥ 1.85)**.
- **`cargo deny` license allow-list.** ANISE + hifitime are **MPL-2.0**, outside the strict
  allow-list. They must never enter the published graph.
- **No network, no binary kernels at library run time.** The lean crate, its tests, and the
  WASM/Python builds must remain fetch-free and data-light.

The frame cross-validation (`xval/anise-frames/`, WE3) already solved this exact tension for
the Earth frame chain. **This design reuses that proven containment pattern verbatim.** The
DE-grade LRO result is produced by an **optional, workspace-excluded cross-validation crate**,
not baked into the published library — so it is an *additional, stronger* validation, not a
dependency the product takes on.

## 4. Approaches considered

| # | Approach | Verdict |
|---|---|---|
| **A** | **ANISE-backed force model running the *same* `kshana` estimator, in a new workspace-excluded crate `xval/anise-lunar-od/`.** | **RECOMMENDED** |
| B | Pre-compute DE orientation/ephemeris into a committed interpolation table that a main-crate provider reads at run time (kernel-free at run time, DE-grade accuracy). | Deferred — see §4.2 |
| C | Improve the analytic stack only (more libration terms; ELP/MPP02 lunar theory; higher-order precession) — no kernels. | Rejected for the < 5 m goal — see §4.3 |
| D | Add ANISE to the main crate behind a cargo feature. | Rejected — breaks the MSRV + `cargo deny` gates (§3) |

### 4.1 Approach A (recommended)

`precise_od::{ForceModel, fit, FitConfig, propagate_samples, Observation, EmpiricalAccel,
OdReport}` are **all public and generic over `F: ForceModel`**. Therefore a workspace-excluded
crate that depends on `kshana` (path) **and** `anise` can:

1. implement a `ForceModel` whose orientation and third-body directions come from ANISE
   (DE-grade), while the **gravity-field evaluation reuses `kshana::gravity_sh`** (pure math,
   unchanged) and the **empirical tier reuses `kshana::precise_od::EmpiricalAccel`**; and
2. call **`kshana::precise_od::fit`** — the *identical* estimator the Earth datasets use.

So the estimator is **shared, never forked**; only the two analytic inputs are swapped for
DE-grade ones. This is the cleanest possible expression of "the limit was the inputs, not the
estimator": we change *only* the inputs and re-measure.

To avoid duplicating `LunarForceModel::accel_rv` (the body-fixed gravity rotation + third-body
+ empirical wiring) inside the xval crate, we make one **small, pure refactor in the main
crate** (Section 5.1): factor the two analytic inputs behind a `LunarEnvironment` provider
trait, with the current analytic code as the default provider. The xval crate then supplies an
ANISE provider, and the *same* `LunarForceModel::accel_rv` runs with DE-grade inputs. Existing
tests stay green because the default is bit-for-bit the current behaviour.

### 4.2 Approach B (deferred, not rejected)

Once Approach A establishes the DE-grade result, we *could* pre-compute the lunar PA
orientation (e.g. every 60 s) and the Earth/Sun positions (every few minutes) over the
validation arc into a **committed, checksummed interpolation table**, and have a main-crate
`LunarEnvironment` provider Lagrange/Chebyshev-interpolate it — giving the DE-grade LRO result
**reproducibly from the lean crate with no kernel and no ANISE at run time**.

This is attractive but is a **larger ethos change**: it ships *derived ephemeris data* in the
published crate (provenance, licensing, and ~repo-size implications) and only reproduces one
fixed arc. It is deliberately **out of scope here** and noted as a possible follow-up the
founder may want *after* seeing whether A clears 5 m. Approach A's provider trait is designed
so B would later be a drop-in second provider, no further refactor.

### 4.3 Approach C (rejected for this goal)

Adding libration terms or swapping in ELP/MPP02 narrows but does not close the gap: the
DE-grade lunar PA orientation is a **numerically integrated** quantity with no closed form, so
an analytic series cannot *match* it — that residual is precisely the floor. C would buy a
modest improvement at real complexity and still likely miss 5 m. Honest verdict: not the lever.

## 5. Recommended architecture (Approach A) in detail

### 5.1 Main crate — one small, pure refactor (no new dependency)

Introduce a provider trait that abstracts the two analytic inputs, defaulting to today's
behaviour:

```rust
// src/lunar_od.rs (or a new src/lunar_env.rs)

/// DE-grade-pluggable source of the Moon-centred force model's frame inputs.
/// All quantities are Moon-centred ICRF/J2000 (the frame the LRO truth is in).
pub trait LunarEnvironment: Clone {
    /// ICRF → Moon body-fixed principal-axis rotation at `jd` (TDB).
    fn icrf_to_moon_pa(&self, jd_tdb: f64) -> [[f64; 3]; 3];
    /// Geocentric Sun and Moon positions (m, GCRS/ICRF) at `jd` (TDB).
    fn geocentric_sun_moon(&self, jd_tdb: f64) -> ([f64; 3], [f64; 3]);
}

/// The built-in analytic provider — IAU 2015 libration + Montenbruck–Gill ephemeris.
/// This is the current code, moved verbatim; it is the default so nothing changes.
#[derive(Clone, Debug, Default)]
pub struct AnalyticLunarEnvironment;
impl LunarEnvironment for AnalyticLunarEnvironment {
    fn icrf_to_moon_pa(&self, jd: f64) -> [[f64; 3]; 3] { crate::lunar_frame::icrf_to_moon_pa(jd) }
    fn geocentric_sun_moon(&self, jd: f64) -> ([f64;3],[f64;3]) { /* current LunarForceModel::geocentric body */ }
}
```

`LunarForceModel` gains a provider field (default `AnalyticLunarEnvironment`) and
`accel_rv` calls `self.env.icrf_to_moon_pa(jd)` / `self.env.geocentric_sun_moon(jd)` instead of
the free functions. Two ways to carry it, decided at build time:

- **generic** `LunarForceModel<E: LunarEnvironment = AnalyticLunarEnvironment>` — zero-cost,
  but `fit` is already generic over `F: ForceModel`, so this composes cleanly; **preferred**; or
- **boxed** `Box<dyn LunarEnvironment>` if the generic ripples too far into call sites.

This refactor is **behaviour-preserving**: the existing `tests/agency_lro.rs`,
`src/lunar_od.rs` unit tests, and the 679 lib tests must pass **unchanged** (the default
provider *is* the current path). That green run is the gate that the refactor is pure.

### 5.2 New crate `xval/anise-lunar-od/` (workspace-excluded)

Mirrors `xval/anise-frames/` exactly:

```
xval/anise-lunar-od/
  Cargo.toml          # publish=false, edition 2021; deps: kshana (path), anise 0.10
                      #   (default-features=false), serde, serde_json
  Cargo.lock          # its own lock — MPL-2.0/edition-2024 confined here
  README.md           # result table + the "why a separate crate" rationale (reuse WE3 text)
  src/
    kernel.rs         # resolve + curl-fetch the kernel set (pattern from anise-frames)
    anise_env.rs      # AniseLunarEnvironment: impl kshana::lunar_od::LunarEnvironment via ANISE
    truth.rs          # read the committed Horizons LRO fixture (or a longer dispatch arc)
    fit.rs            # build LunarForceModel<AniseLunarEnvironment>, call kshana::precise_od::fit
    report.rs         # RTN/3-D report model -> report.{json,md}
    main.rs           # the `lunar-od-xval` binary
  tests/
    lunar_od_xval.rs  # self-skipping gate (no kernels -> skip, never red offline)
  kernels/            # gitignored; curl-fetched .bsp/.bpc/.tpc/.tf/.tls
```

`AniseLunarEnvironment` implements the §5.1 trait against an ANISE `Almanac` loaded with the
kernel set:

- `icrf_to_moon_pa(jd)` → ANISE rotation from `J2000`/`ICRF` to the **`MOON_PA`** frame
  (DE440 lunar orientation, frame id 31008) at `Epoch::from_jde_tdb(jd)`.
- `geocentric_sun_moon(jd)` → ANISE state of `SUN` and `MOON` relative to `EARTH` in `J2000`.

> **API note (confirm at build):** the exact ANISE calls (`Almanac::rotate`,
> `Almanac::translate`, the `MOON_PA` frame constant, `Epoch` TDB constructor) must be pinned
> against `anise` 0.10's API during implementation; the *shape* above is what `xval/anise-frames`
> already does for the Earth `ITRF93` rotation, so the pattern is proven.

The fit harness reuses the **exact** reduced-dynamic config from `tests/agency_lro.rs` cfg2
(`FIT_DEGREE = 100`, `estimate_empirical: true`, `estimate_empirical_2cpr: true`,
`empirical_sigma: 1e-7`) so the *only* difference from the published 6.6 m result is the
DE-grade environment. A `--degree 150` switch lets us check whether field truncation becomes
the next floor once orientation/ephemeris are fixed.

### 5.3 Kernel set

| Kernel | Purpose | Approx size | Source (NAIF generic_kernels) |
|---|---|---|---|
| `de440s.bsp` | Earth/Sun/Moon ephemeris (DE440, 1849–2150) | ~32 MB | `spk/planets/` |
| `moon_pa_de440_200625.bpc` | DE440 lunar orientation (principal axis) | ~3 MB | `pck/` |
| `moon_de440_200625.tf` | frame kernel defining `MOON_PA` / `MOON_ME` | ~3 KB | `fk/satellites/` |
| `pck00011.tpc` | body constants (radii, base orientation) | ~130 KB | `pck/` |
| `naif0012.tls` | leap seconds | ~5 KB | `lsk/` |

All **gitignored** (extend `.gitignore` with `/xval/anise-lunar-od/kernels/*` and the
`report.{json,md}`), **curl-fetched** into `kernels/` on first run, **SHA-256 recorded** in the
crate README and in `docs/AGENCY-ORBIT-VALIDATION.md`. ANISE + hifitime stay **MPL-2.0-confined** to
this crate's `Cargo.lock`; kernels are NASA/JPL public-domain data, **referenced not
redistributed**.

### 5.4 Truth

Reuse the **already-committed** Horizons LRO fixture
(`tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv`, 241 epochs / 4 h, SHA `574e3518…`).
It is the LRO project's own DE-grade reconstruction, so truth fidelity is not the limiter. An
optional `#[ignore]`/dispatch path can pull a **longer arc** (more revolutions → a stronger,
less geometry-favourable test) the founder downloads, exactly like `swarm_full_arc_dispatch`.

## 6. Data flow

```
                    committed Horizons LRO truth (DE-grade, Moon-ctr ICRF)
                                   │  (read by truth.rs)
                                   ▼
 NAIF kernels ──ANISE Almanac──► AniseLunarEnvironment ──┐
 (de440s,moon_pa,                (DE orientation+ephem)   │ impl kshana::lunar_od::LunarEnvironment
  moon.tf,pck,lsk)                                        ▼
                          kshana::lunar_od::LunarForceModel<AniseLunarEnvironment>
                          (GRGM660PRIM via kshana::gravity_sh + Earth/Sun 3rd body + empirical)
                                   │  implements kshana::precise_od::ForceModel
                                   ▼
                          kshana::precise_od::fit  ◄── the SAME estimator as Galileo/Swarm
                                   │
                                   ▼
                          honest RTN/3-D RMS ──► report.{json,md} + docs/AGENCY-ORBIT-VALIDATION.md
```

Everything below the `AniseLunarEnvironment` box is **existing, unchanged `kshana` code**.

## 7. Accuracy budget (honest) and the residual-attribution fallback

DE-grade inputs remove the two **proven** dominant error sources:

- **Orientation:** tens of arc-seconds → sub-milliarcsecond. Eliminates the sectoral-field
  mis-rotation that the 2-per-rev tier was straining to absorb (the transverse 4.56 m term).
- **Ephemeris:** ~0.3° → sub-µas Earth/Sun directions. Removes the near-static out-of-plane
  bias on the dominant Earth third body (the normal 3.35 m term).

**Expected outcome:** the dynamic residual should fall well below 12.6 m and the
reduced-dynamic fit has a **real chance of clearing 5 m**. It is **not guaranteed** — once
orientation/ephemeris are DE-grade, the next floors become, in likely order:

1. **GRGM truncation** at d/o 100/150 at ~98 km altitude (test the `--degree 150` switch; go
   higher if needed — the loader already handles it).
2. **Unmodelled LRO non-gravitational accelerations** (thermal re-radiation, outgassing) —
   real, and the reason operational LRO POD itself estimates empirical accelerations; our
   1+2-per-rev reduced-dynamic tier is the right tool, but a residual may remain on a 4 h arc.
3. Minor terms (solid-Moon tides, relativistic correction at the Moon) — small.

**If the genuine fit is still ≥ 5 m**, the deliverable is the **true number + this attribution
broken out by RTN and by degree** (a one-page residual analysis), and the milestone stays 3/6 —
the same honest outcome shape as W4b, just one floor deeper. That is a legitimate, publishable
result, not a failure.

## 8. Build sequence (TDD, atomic commits)

Each step: TDD where there is logic to test; `fmt` + `clippy -D warnings` +
`cargo test` (main crate) + the xval crate's own build/test; the no-attribution + naming-hygiene
guards; atomic commit; author `Chakshu Baweja <contact@ashforde.org>`, no trailers.

1. **Main-crate provider refactor** (§5.1). RED: none (behaviour-preserving). GREEN gate: the
   **entire existing suite passes unchanged**, including `tests/agency_lro.rs` still reporting
   12.6 / 6.6 m. Commit: "lunar-od: factor frame inputs behind a LunarEnvironment provider".
2. **xval crate scaffold** — `Cargo.toml` (publish=false), `kernel.rs` (resolve + curl, unit
   tests with no network), `.gitignore` entries, README skeleton. Commit.
3. **`AniseLunarEnvironment`** against ANISE — with a **kernel-free sanity unit test**: at a
   fixed epoch, assert the ANISE PA rotation and the analytic one differ by only tens of
   arc-seconds (proves the provider is wired to the right frame, and quantifies the very error
   we are removing). Commit.
4. **The fit harness** — build `LunarForceModel<AniseLunarEnvironment>`, run `kshana::…::fit`
   with the cfg2 config, print RTN/3-D dynamic + reduced-dynamic, write `report.{json,md}`.
   Self-skipping test gate (skips without kernels). Commit.
5. **Record the honest result** — `docs/AGENCY-ORBIT-VALIDATION.md` LRO row updated with the DE-grade
   figure, kernel SHAs, commit hash; `xval/anise-lunar-od/README.md` result table; the residual
   analysis if ≥ 5 m. Commit.
6. **CI** — `.github/workflows/lunar-od-xval.yml`, **`workflow_dispatch` only** (never gates
   `main`), mirroring `frame-xval.yml`: build, fetch kernels, run, upload report. Commit.
7. **Milestone + memory** — flip `me862131d` step-status **only if** genuinely < 5 m (→ 4/6,
   re-score); otherwise hold 3/6 with the deeper-floor note. `sync_doc.py`, verify the bake.

## 9. Validation, gates, and what flips the milestone

- **Pure-crate untouched:** Step 1's full-suite-green run proves the published crate's
  behaviour is unchanged; the default CI gates (`cargo deny`, MSRV, fmt, clippy, test,
  reproducibility matrix) never see ANISE.
- **The result is independently meaningful** even at the current 6.6 m: a *third* external
  check (DE-grade) on the lunar dynamics, the selenocentric analogue of the Earth frame
  cross-validation.
- **Milestone flip is earned, not assumed:** `me862131d` step-4 → true (3/3 < 5 m, milestone
  4/6, score re-computed) **iff** the real reduced-dynamic RMS < 5 m with `empirical_sigma`
  held at 1e-7. No other path moves it.

## 10. Ethos and reversibility

- **What this does *not* change:** the published `kshana` crate (no new dependency, no kernel,
  no network); the default CI gates; the analytic lunar stack (it remains the **default**
  provider and the lean-crate answer); the reproducibility story for everything except the
  one optional DE-grade cross-check.
- **What it adds:** an *optional* DE-grade validation in an isolated crate, and a tiny
  provider seam in the main crate that is itself pure (default = analytic).
- **Reversibility:** deleting `xval/anise-lunar-od/` removes the entire ANISE surface; the
  provider trait can stay (it is a clean abstraction) or be inlined back. There is no one-way
  door here — the ethos-sensitive part (ANISE/kernels) is quarantined exactly as WE3 quarantined
  it for the Earth frames, and the founder can stop after Step 1, Step 4, or any step.

## 11. Risks / open questions

- **R1 — does it actually reach < 5 m?** Honestly unknown until measured (§7). The design is
  valuable either way (it either flips the milestone or names the next floor with evidence).
- **R2 — ANISE `MOON_PA` API specifics.** The frame id / rotation call must be pinned against
  `anise` 0.10 at build; mitigated by the proven `xval/anise-frames` ITRF93 precedent.
- **R3 — kernel size in CI.** `de440s.bsp` is ~32 MB; the job is manual `workflow_dispatch`
  and caches kernels, so it never burdens gating CI.
- **R4 — TDB vs the truth's time tag.** Horizons LRO vectors are TDB; ANISE `Epoch` is TDB —
  consistent, no GPS/UTC conversion needed (a simplification the Earth datasets did not enjoy).

## 12. Effort and decision

- **Effort:** ~1 focused session (the heaviest items — Moon-centred force model, GRGM loader,
  IAU orientation, the estimator trait, the truth harness — already exist from W4b; this is
  *one provider impl + one fit harness + kernels + CI*, on the proven WE3 template).
- **Decision required (founder go/no-go):** approve building Approach A? It takes on **zero**
  new obligation in the shipped product (ANISE stays workspace-excluded, MPL-2.0-confined,
  manual-CI-only) and yields either a milestone flip to **4/6** or an evidence-backed deeper
  floor. The only thing "spent" is the build session and a ~38 MB one-time kernel fetch on the
  optional job.

*No implementation begins until this proposal is approved.*
