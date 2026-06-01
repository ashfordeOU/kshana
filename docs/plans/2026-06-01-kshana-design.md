# Kshana — Platform Design

**Date:** 2026-06-01
**Status:** Approved (design phase complete; implementation plan to follow)
**Repo:** own clean git repository at `spacerepo/kshana` (public open core) + a separate private overlay repo `kshana-private`

> **Kshana** (क्षण, Sanskrit "the precise instant / smallest unit of time"). Time is the foundation of position — lose the instant, lose the fix.

---

## 1. Vision & strategy

Build the open, neutral, reference-grade **hybrid quantum/classical PNT performance simulator** — the tool anyone (including ESA, primes, and labs) reaches for to quantify what quantum sensors, clocks, and time-transfer buy a navigation system over classical PNT.

- **The wedge.** One capability, world-class: *prove the quantum-PNT advantage in hard, reproducible numbers.* No good **open** tool exists for this today.
- **Open-infrastructure play.** Become the neutral reference layer the field builds on (the OreKit / gLAB / RTKLIB pattern). Leverage = becoming infrastructure, earned through adoption + validation over time, not declared.
- **Build in public**, under three guardrails: (1) export-control/dual-use boundary enforced from commit #1; (2) radical honesty about model maturity/validation; (3) the *tool* is public, the *bid* is private.
- **Open-core.** Public engine + generic published models. Private overlay = export-sensitive resilience/anti-spoof depth + ESA-contract foreground + the proprietary SETU (MBSE reasoning) and NITI (programme execution) layers that complete the paid suite.
- **Funding flywheel.** Open tool ← NAVISP Element 1 (fully ESA-funded novel-PNT feasibility, incl. paper studies — likely the first realistic ESA money) → validation/credibility → ESA "Quantum-Enabled PNT Demonstrator" study (Phase 0/A/B1) win + consulting → more capability → more adoption. The ESA ITT (closes 9 July 2026) is the lighthouse use-case, not the only goal.

## 2. Scope

**Is:** a deterministic simulation engine that scores hybrid quantum/classical navigation concepts against ESA's six PNT figures of merit, with a CLI, Python bindings, and a browser (WASM) demo.

**Is not:** flight hardware, a quantum-payload design, or a full GNSS receiver. Quantum hardware fidelity comes from partner-contributed models.

**v0.1:** the **clock-holdover-during-GNSS-outage** scenario, end-to-end through every layer (minimal but real), proving the architecture before widening.

## 3. Architecture — one engine, four model-packs

The engine is built once; the four scenarios are swappable model-packs (~80 % shared infrastructure). The engine knows nothing about "quantum" vs "classical" — only how to ask a model to evolve and to measure.

```
SCENARIO (truth source: orbit/trajectory + time grid + GNSS-availability timeline)
   → SENSOR/CLOCK MODELS (the 4 packs plug in here, common trait)
   → ESTIMATOR (nav filter: EKF / factor-graph fuses available measurements)
   → FoM SCORING (estimate vs truth → ESA's six figures of merit)
   → REPORTING (deterministic results artifact + plot data)
   [Monte-Carlo wrapper: seeded ensembles → FoM distributions]
```

**Cargo workspace (`kshana-*`):** `core` (types, time, traits) · `scenario` (truth propagation, GNSS timeline) · `models` (trait + 4 packs) · `estimator` (filters) · `fom` (6-FoM scoring) · `report` (artifacts) · `cli` · `py` (PyO3) · `wasm`.

**Build vs reuse:** reuse **Hifitime** (precise time), **Nyx** (orbit determination + nav filtering), **ANISE** (ephemerides) — validated, which buys velocity *and* reviewer trust. **Novel IP = (1) quantum sensor/clock error models, (2) FoM scoring tied to ESA's six, (3) the hybrid fusion estimator.**

**Pack sequencing (by real-data credibility):**
1. **Clock holdover** (GNSS outage) — FIRST; real ACES/PHARAO/SOC stability data = the most credible, least-fakeable chart.
2. **Quantum-IMU dead-reckoning** — Exail/CARIOQA error models.
3. **Quantum/optical time-transfer** — maps directly to ESA's OpSTAR flight build (strategic alignment).
4. **Hybrid fusion** — capstone; the full hybrid quantum-classical estimator combining the packs.

## 4. The error-model plugin interface (the heart)

```rust
/// A sensor or clock error model: turns ground truth into a realistic,
/// imperfect measurement, evolving its internal error state over time.
pub trait ErrorModel {
    type Measurement;
    fn step(&mut self, dt: Duration, rng: &mut dyn RngCore);          // evolve error state
    fn measure(&self, truth: &TruthState, t: Epoch,
               rng: &mut dyn RngCore) -> Self::Measurement;            // corrupt truth → measurement
    fn spec(&self) -> ModelSpec;                                       // params + provenance/sources
}
```

- **Determinism via injected, seeded RNG:** `(scenario, seed) → bit-identical result`, forever (reproducibility = the trust mechanism; identical across CLI and WASM).
- **Stateful error evolution is the physics:** accumulated clock phase (white/flicker/random-walk FM), accumulated accelerometer bias drift — the divergence that *is* the holdover story.
- **Quantum and classical implement the same trait:** the advantage chart is "same engine, same scenario, two parameter sets, overlay the divergence." Apples-to-apples.
- **`ModelSpec` carries provenance:** every error figure traceable to a source — no anonymous constants.
- **Model registry** (`register("aces-pharao", …)`): community/partners contribute new models as plugins without touching the engine. *This is the adoption flywheel and the export-control seam.*

## 5. Data contracts & FoM scoring

**Scenario (input):** one declarative TOML file — time grid, platform/orbit, the **GNSS-availability timeline** (the outage driver), model assignment by id (`clock = "aces-pharao"` vs `"csac"`), estimator config, Monte-Carlo runs + seed.

**Result (output):** versioned, self-describing JSON + Parquet — per-step time series (truth, estimate, error, protection level), the six FoM scores, and a provenance block (model specs + sources, engine version, seed, **scenario hash**).

**The six FoMs, operationally defined:**

| ESA FoM | Computation |
|---|---|
| Positioning/Timing Performance | RMS + 95th-pct position error (m) & timing error (ns) |
| Autonomy | holdover duration — time in-spec after GNSS loss |
| Resilience | error-growth slope under outage/jamming + recovery time |
| Availability | fraction of time a valid in-spec solution exists |
| Integrity | does the protection level contain true error? (misleading-info rate) |
| Security | spoof/threat-model response — *export-sensitive → private; v0.1 marks `not_modeled` honestly* |

**Reproducibility envelope:** `scenario + seed + engine version → result hash`. Every published chart ships those three. FoMs not yet defensibly computable are emitted as `not_modeled` with a reason — never faked.

The scenario/result schema is versioned and stable; if others adopt it as an interchange format, Kshana owns the standard.

## 6. Repo structure & the public/private (export-control) boundary

The plugin trait *is* the boundary. Two repos, **never nested**:

```
spacerepo/kshana/         PUBLIC, own clean git → github.com/AshfordeOU/kshana
  crates/ (engine + generic models) · scenarios/ · examples/ · docs/
  LICENSE (Apache-2.0) · CONTRIBUTING + EXPORT-NOTICE · .github/ (CI guards)

spacerepo/kshana-private/ PRIVATE, separate repo (NOT a subfolder)
  crates/kshana-models-sensitive  (resilience/anti-spoof depth, plugs in via trait)
  esa-bid/ (the ITT proposal, win-themes, financials)
  contract-foreground/            (anything generated under an ESA contract)
  (depends on public kshana crates as a path/git dependency)
```

**Three hard pre-commit / CI guards on the public repo:**
1. `check-export-control` — per-file export classification tag; CI refuses anything above the public threshold + greps a dual-use marker list.
2. `check-no-claude` — scans content **and commit messages** for AI-attribution markers; exits non-zero if found. (No `Co-Authored-By`, no "Generated with …", none in docs/comments/commits — ever.)
3. `check-reproducible` — reference scenarios must reproduce their committed result-hash.

**License:** Apache-2.0 on the public core (permissive + patent grant → maximizes adoption; OreKit precedent). The moat is the private layer, not the license. *(EUPL-1.2 is the alternative if European-sovereignty signaling outweighs adoption; decided at publish time.)*

## 7. Validation strategy (the credibility engine)

Three levels, all published as part of build-in-public:
1. **Component:** each model reproduces *published* characteristics (ACES/PHARAO Allan-deviation curve; Exail accelerometer noise) — golden test pins output to the cited literature value.
2. **Engine/estimator:** cross-validate against the incumbents the reviewers already trust — GNSS-only positioning vs gLAB/RTKLIB; orbit propagation vs Nyx/STK references.
3. **End-to-end:** holdover drift vs published clock-coasting / GNSS-denied experiments.

Each model ships a `VALIDATION.md`: model vs reference, gap quantified honestly, status badge `validated` / `partial` / `unvalidated`. This converts "solo-founder tool" → "rigorous reference."

## 8. Testing approach

- **TDD with hand-derived expecteds** — derive expected values by hand from the physics/math *before* writing the test ("caught and fixed inline" is not acceptable).
- **Golden/snapshot tests** — reference scenarios pin their result-hash (→ `check-reproducible`).
- **Property tests** (proptest) — zero-noise ⇒ estimate == truth; longer outage ⇒ monotonically non-decreasing error; covariance positive-definite.
- **Cross-tool validation tests** (§7 level 2) in CI.
- **Determinism tests** — same seed ⇒ identical bits across CLI and WASM.

## 9. Tech stack

Rust core (the engine — reference-grade, memory-safe, fast, on-target ecosystem) → **Python bindings** (PyO3/maturin, for scientific-community adoption) + **WASM** (wasm-bindgen, for in-browser live demos). Python prototyping in parallel to validate physics/methodology fast while the durable Rust core is built in public.

## 10. Open gates & external dependencies (must resolve)

1. **Estonia eligibility — Gate #1, make-or-break.** Has Estonia subscribed to FutureNAV / the CM25 "Future PNT Demonstrators" component? Confirm with the Estonian delegation / Estonian Space Office (resource: their Nov-2025 "Essentials Guide to Bidding into ESA — Estonia"). Entity `Ashforde OÜ` esa-star light registration submitted 2026-06-01 (ID 83208); resolve the declared-nationality-Estonia vs ops-criteria-Germany note (matters for geo-return advantage).
2. **The actual esa-star AO** — reference #, contract type, price ceiling, duration, # contracts, SME-only (C1/C3) / flight-heritage clauses. Only in the tender package; log into esa-star.
3. **Export-control read** before publishing resilience depth in the public repo.
4. **Quantum-hardware partner** — harden the partnership (Estonian Univ. of Tartu cold-atom/optical groups + a metrology institute are credible EU routes).
5. **Namespace reservation** — `kshana` on crates.io / PyPI / npm + GitHub org (needs user auth). Trademark-counsel check before heavy branding.

## 11. Verified research context

Per deep-research pass (2026-06-01): FutureNAV created CM22 (2022); "Future PNT Demonstrators" pillar added CM25 (Nov 2025) = OpSTAR + NovaMoon (flight builds) + a **Phase 0/A/B1 study line (quantum + AI)** — the quantum study line is *feasibility/concept, not a flight build*, which favors a study-led MBSE/simulation small prime. ESA figures of merit confirmed (the six in §5). NAVISP Element 1 + ESA SME initiative + geo-return = the enabling levers. Tech SOA: ACES/PHARAO live on ISS since Apr 2025; CARIOQA cold-atom accelerometer (~2030 target); Exail 3-axis hybrid quantum inertial sensor (2022). Detail held in project memory.
