# Precise astrodynamics: high-order gravity, tides, SRP, and force-model validation by ephemeris fitting against agency datasets

- **Date:** 2026-06-09
- **Status:** Design — pending review
- **Roadmap milestone:** P4 "Precise astrodynamics: high-order gravity, SRP, validation vs agency datasets"
- **Author:** Chakshu Baweja

## 1. Goal

Take Kshana's orbit-dynamics stack from "validated forces in isolation" to a **force-model validation by ephemeris fitting against real agency precise-orbit products** — a result a hostile ESA/NASA procurement reviewer would accept. Concretely: fit Kshana's full force model to real Galileo (MEO), Swarm-A (LEO), and LRO (lunar) orbits and report honest position residuals, with a citable, commit-hash-stamped validation record.

## 2. Honest scope

P4 has six steps. This design covers what code + public data can deliver and pre-stages the rest.

| Step | Status | This design |
|------|--------|-------------|
| 1. EGM2008 d/o-70 gravity | Done | — |
| 2. Ocean + atmospheric tides | **Build** | `tides.rs` (extended to solid + ocean + atmospheric) |
| 3. GR (Schwarzschild + Lense-Thirring) | Done | — |
| 4. Validate vs 3 agency datasets, <5m RMS | **Build** | `precise_od.rs` + validation harnesses |
| 5. Companion JOSS *data paper* + DOI | **Pre-stage** | Draft + residual tables, founder submits |
| 6. University co-author for governance | **Founder** | Outreach draft on request; cannot be done in code |

**Definition of done for this design:** P4 moves 2/6 → 4/6 with real validated capability, step 5 pre-staged to one-click, step 6 explicitly the founder's.

## 3. Non-goals (YAGNI)

- Operational-grade orbit products competitive with IGS/ESA (we validate the *engine*, not produce official orbits).
- Box-wing / ECOM2 SRP models (cannonball + estimated `C_R` + empirical accelerations is the credible minimum; box-wing is a future enhancement, and if cannonball can't hit the bar that is an honest reported finding).
- Pole tides, relativistic time-transfer in the measurement model, higher-order ionospheric terms.
- A general-purpose estimation framework — the estimator is scoped to position-observation batch LS for this validation.

## 4. What "validated" means here (the bar)

A reviewer accepts the result when:

1. The force model includes every perturbation that matters at the target accuracy: high-degree geopotential (EGM2008-70), **solid + ocean + atmospheric tides**, sun/moon third-body, SRP with shadow, drag (LEO), Schwarzschild + Lense-Thirring GR.
2. The estimator is a real batch least-squares with a **state-transition matrix** (variational equations), proper **observation weighting**, and **outlier editing**.
3. Frames/time use **real EOP** (finals2000A) through the already-validated CIO chain.
4. Residuals are reported in **RTN** (radial/along/cross-track), not only 3D RMS, **with and without** empirical accelerations.
5. Every number is **reproducible** (open-data CI gate) and **citable** (commit hash + dataset reference + fixture checksum).

## 5. Force model

Existing and validated (`forces.rs`, `gravity_sh.rs`): two-body, EGM2008 d/o-70, J2/zonal, third-body (sun/moon), SRP (cannonball + conical shadow), drag (static exponential density), Schwarzschild, Lense-Thirring.

**New — `src/tides.rs`:** tidal corrections expressed as time-varying perturbations ΔC̄_nm, ΔS̄_nm to the Stokes coefficients, summed into the EGM2008 coefficients before the existing spherical-harmonic synthesis. Three contributions:

- **Solid-Earth tide** — IERS Conventions 2010 §6.2 two-step Love-number model: frequency-independent step 1 (nominal Love numbers k_nm, degrees 2–3) + frequency-dependent step 2 corrections for the dominant constituents.
- **Ocean tide** — IERS §6.3, the 8 dominant constituents (M2, S2, N2, K2, K1, O1, P1, Q1) from a truncated FES-type coefficient set.
- **Atmospheric tide** — the dominant S1/S2 atmospheric thermal-tide terms.

Driven by Doodson/Delaunay fundamental arguments (reuse the nutation argument machinery already in `nutation.rs`).

**Tide validation oracle:** bit-for-bit against the IERS-published reference routine numerical test cases (same standard held for SOFA/ERFA nutation), plus a magnitude/sign sanity check against the analytic expectation. Report the worst-case ΔC̄/ΔS̄ and the induced acceleration at the reference epoch.

## 6. Precise-OD engine — `src/precise_od.rs`

Keeps the existing range-only `orbit_determination.rs` untouched (it remains the teaching/range example). New module, focused responsibility: fit a full-force trajectory to position observations.

- **Observations:** position fixes (SP3 records, or SPK-sampled positions for LRO), transformed ECEF→inertial (GCRS) via the validated CIO frame chain with real per-epoch EOP.
- **Dynamics:** `forces.rs` + `gravity_sh.rs` (EGM2008-70) + `tides.rs` + GR, integrated by the existing Dormand–Prince integrator.
- **Estimated parameters:** initial state `[r, v]` (6) + SRP coefficient `C_R` (1) + **optional** cycle-per-revolution (CPR) empirical accelerations in RTN (a labeled second tier).
- **Jacobian:** variational equations — integrate the 6×N state-transition matrix Φ alongside the state using an analytic dynamics matrix A = ∂f/∂x built from the dominant terms (two-body + J2 + third-body partials), **cross-checked against whole-arc finite difference** (agreement validates the STM implementation; whole-arc FD is the documented fallback).
- **Estimator:** Gauss–Newton batch least squares via the existing `batch_ls::gauss_newton`, with **observation weighting** from SP3 accuracy codes and **iterative outlier rejection** (n-sigma editing).
- **Reporting:** `OdReport { rms_3d, rms_rtn: [r, t, n], n_obs, n_edited, n_params, params_estimated, converged }` — always emitted with and without the empirical-acceleration tier.

## 7. Frames, time, EOP

- **Frames:** ECEF↔GCRS through the validated IAU 2006/2000A CIO chain (`cio.rs`), real polar motion.
- **EOP:** finals2000A (UT1−UTC, x_p, y_p) interpolated per epoch — reuse the IERS parser from the ANISE cross-check (`xval/`); vendor a small finals2000A slice covering each validation arc as a fixture.
- **Time:** SP3 is GPS time → TT for integration (fixed GPS−TAI offset + TAI−TT); LRO SPK is TDB/ET. Explicit, tested conversions via `timescales.rs`.

## 8. Datasets — open spine + exact-named layer

Both, per the chosen data strategy: an open-data path that runs in CI with zero login (the reproducible/citable gate), plus the exact named products layered on where fetchable.

| Sat | Domain | Open source (CI spine, scripted fetch) | Exact-named (founder fetch if gated) | Honest caveat |
|-----|--------|----------------------------------------|--------------------------------------|---------------|
| **Galileo IOV** | MEO | IGS MGEX SP3 (open mirror) | CDDIS MGEX (Earthdata login) | Cleanest case; proves the bar is hittable. |
| **Swarm-A** | LEO | ESA Swarm dissemination server (open) | ESA GPOD | Drag-dominated; static-density model may honestly land **above** 5m — reported, not hidden. |
| **LRO** | Lunar | NAIF LRO SPK + GRAIL/GRGM lunar gravity (ICGEM) | — | **Not native SP3** (radiometric/LOLA, distributed as SPICE); validate lunar propagation against the NAIF ephemeris — arguably a stronger truth source. Lunar central body via `gravity_sh::from_gfc` loading a GRGM field. |

**Data acquisition is Phase 0:** verify each source's accessibility first. Anything truly gated becomes a precise download link handed to the founder; nothing in the CI spine requires a login. Vendor small fixture slices (a few hours of each arc) for the reproducible gate, following the existing `tests/igs_real_data.rs` pattern; the full-arc online fetch runs under a `workflow_dispatch` job so it never reddens a normal CI run.

## 9. Validation methodology & acceptance

For each dataset:

- Report **post-fit RMS in RTN + 3D**, both with and without empirical accelerations.
- Report **raw propagation overlap** (no fit) alongside the post-fit number, so the reader sees what the estimator is absorbing.
- State **which parameters were estimated** and **how many observations** were used/edited.
- **Green** = <5m 3D RMS post-fit on Galileo MEO (the achievable cleanest case). Swarm LEO and LRO lunar report their **honest** numbers; if either exceeds 5m, the cause (drag model, lunar gravity degree) is documented as a known limitation, not papered over.

### Honesty contract (non-negotiable)

- If a dataset can't hit <5m honestly, **publish the real RMS** with the reason.
- Empirical-accel-assisted vs pure-force-model results are always reported **separately**.
- Every residual record carries **commit hash + dataset reference + fixture checksum** so it is independently citable.

## 10. Wave sequencing

Each wave: TDD (RED→GREEN), all gates (fmt, clippy -D, `cargo test --all`, reproducibility, no-attribution, version-sync, banned-naming guard), atomic commit, push to main, tracker rebuild, memory update.

1. **W1 — Tides.** `src/tides.rs` (solid + ocean + atmospheric), IERS reference-routine bit-for-bit validation. Wire into the force model as an opt-in `ForceModel` term.
2. **W2 — Precise-OD engine.** `src/precise_od.rs` with variational STM. Validated first on **synthetic** data: fit a Kshana-propagated arc back to itself → recovers state to ~0; STM vs finite-difference agreement.
3. **W3 — Galileo MEO validation.** The cleanest real dataset; demonstrates <5m is hittable. Open-data CI gate + exact-named layer.
4. **W4 — Swarm LEO + LRO lunar validation.** The two harder/heterogeneous datasets; lunar central-body path via GRGM.
5. **W5 — JOSS data paper.** Draft + RTN/3D residual-statistics table with commit hash, test-fixture checksums, and the three dataset references — the citable record, pre-staged for founder submission.

## 11. Module / file layout

```
src/tides.rs            NEW  solid+ocean+atmospheric tide ΔC̄/ΔS̄ corrections
src/precise_od.rs       NEW  full-force position-observation batch LS + variational STM
src/forces.rs           edit add tides as an opt-in ForceModel term
tests/tides_iers.rs     NEW  IERS reference-routine bit-for-bit
tests/precise_od_synth.rs NEW  synthetic self-recovery + STM-vs-FD
tests/agency_galileo.rs NEW  Galileo MEO (vendored fixture; full fetch via dispatch)
tests/agency_swarm.rs   NEW  Swarm-A LEO
tests/agency_lro.rs     NEW  LRO lunar (NAIF SPK truth via xval/ANISE pattern)
tests/fixtures/agency/  NEW  small vendored SP3 / EOP / ephemeris slices + checksums
paper/kshana-od-data-paper.md NEW  step-5 data-paper draft
docs/VALIDATION.md      edit add the agency-validation results table
docs/AGENCY-ORBIT-VALIDATION.md NEW  methodology + per-dataset results (citable doc)
```

## 12. Risks & honest failure modes

- **Swarm LEO <5m may not be reachable** with a static exponential density model. Mitigation: report the honest RMS; note NRLMSISE-00 as the documented upgrade path. This is an acceptable, transparent outcome.
- **Galileo SRP mismodeling** (cannonball vs box-wing) absorbed by CPR empirical accels. Mitigation: report with/without; transparency over a hidden fudge.
- **A named dataset portal is login-gated.** Mitigation: the open-data CI spine is self-sufficient; the gated product is a founder download, not a blocker.
- **LRO lunar gravity degree** governs lunar-fit accuracy. Mitigation: load a sufficient GRGM degree; report the field used.
- **Variational STM implementation subtlety.** Mitigation: whole-arc finite-difference cross-check is the validated fallback and a correctness gate in its own right.

## 13. Acceptance

- `tides.rs` validated bit-for-bit against IERS reference test cases.
- `precise_od.rs` recovers a synthetic arc to ~0 and STM agrees with finite difference.
- Galileo MEO post-fit <5m 3D RMS (green); Swarm-A and LRO report honest RTN+3D numbers.
- `docs/AGENCY-ORBIT-VALIDATION.md` + `docs/VALIDATION.md` carry the commit-hash-stamped, RTN-decomposed, with/without-empirical-accel results.
- `paper/kshana-od-data-paper.md` drafted with the residual table, ready for founder submission.
- All gates green; zero attribution; tracker reflects P4 at 4/6 with steps 5–6 honestly external.
