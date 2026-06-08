# Concepts — a plain-language primer

This page explains *what Kshana does and why*, starting from zero and building up to the
physics. No prior background is assumed for the first part; the later sections add the
precise relations for specialists. For word-by-word definitions see the
[Glossary](GLOSSARY.md).

## 1. The problem, in one paragraph

Almost everything that needs to know *where it is* or *what time it is* — phones,
aircraft, ships, satellites, power grids, financial systems — leans on signals from
navigation satellites (GPS and its siblings, collectively **GNSS**). Those signals are
weak and easily lost: jammed, blocked, or simply out of view in space. When that
happens, a system has to **keep going on its own** using onboard sensors — a clock to
hold time, and inertial sensors to track motion. The question Kshana answers is simple
to state and hard to measure: **how long, and how well, can it keep going?**

## 2. Why "quantum"?

Onboard sensors drift. A clock slowly loses time; an inertial sensor slowly loses track
of position. **Quantum** clocks and inertial sensors drift *far more slowly* than the
classical parts in use today — so a vehicle could coast through a much longer GNSS
outage while staying within its accuracy limits. That advantage is the entire promise of
quantum PNT. But "far more slowly" needs to be turned into **numbers**: how many extra
minutes of holdover? how many fewer metres of drift? Those numbers decide whether a
quantum payload is worth its cost, mass, and power.

## 3. What Kshana actually does

Kshana is a **simulator**, not hardware and not a hardware design. It:

1. Takes a **scenario** — a timeline with a stretch of GNSS outage, and the published
   performance figures of a sensor.
2. Drives a **sensor error model** through that timeline: while GNSS is available the
   model is disciplined to the truth; during the outage it free-runs, accumulating
   error exactly as the physics says it should.
3. **Scores** the result against operational figures of merit (how big the error gets,
   how long it stays in spec, how trustworthy the estimate is).
4. Does this **twice** — once for a quantum sensor, once for its classical counterpart —
   on the *same* scenario, so the comparison is apples-to-apples.

Crucially, the engine knows nothing about "quantum" vs "classical". Both are just error
models with different (published, cited) parameters. The difference you see in the output
is the difference in the published physics — nothing is hand-tuned to favour one side.

## 4. The four building blocks ("packs")

| Pack | Sensor | What it answers |
|------|--------|-----------------|
| Clock holdover | atomic clock | How long does *time* stay accurate without GNSS? |
| Inertial dead-reckoning | accelerometer (+ gyro) | How fast does *position* drift without GNSS? |
| Time transfer | optical / RF link | How precisely can two craft share time? |
| Hybrid fusion | all of the above | Does the *combined* PNT solution hold? |

The hybrid pack is the punchline: a navigation solution needs *both* good time *and*
good position. It shows that an optical timing link can keep even a modest clock
locked — which means the **inertial** sensor becomes the weakest link, and that is
exactly where a quantum accelerometer pays off.

## 5. Honesty by construction

A simulator is only useful if you can trust it. Kshana is built so that you can:

- **Every parameter is cited.** Each sensor figure carries a `provenance` string naming
  the datasheet or paper it came from. No anonymous constants.
- **Every model is validated against a textbook relation,** not just against itself —
  e.g. the simulated clock's Allan deviation must match the published stability figure,
  and the inertial drift must match the standard error-growth law.
- **Maturity is labelled.** [VALIDATION.md](VALIDATION.md) marks each effect `validated`
  or `not modeled`, and states plainly that the optical-clock figures are *laboratory /
  space-goal* numbers — no strontium optical clock has flown.
- **Results are reproducible to the bit:** the same scenario, seed, and version always
  produce the identical answer.

## 6. The physics, for specialists

The relations Kshana implements and tests (full detail and tolerances in
[VALIDATION.md](VALIDATION.md)):

- **Clock holdover.** Two-state phase/frequency model with white FM (PSD `q_wf`),
  random-walk FM (`q_rw`), flicker FM (a sum of log-spaced Ornstein–Uhlenbeck processes
  calibrated to a flat Allan floor), and deterministic aging. Validated by overlapping
  Allan deviation against the published `σ_y(τ)` (Riley, NIST SP 1065).
- **Inertial dead-reckoning.** Residual accelerometer bias → `½·b·T²`; velocity random
  walk → `σ_x(T) = √(S_a·T³/3)`; optional gyro bias and angular random walk produce a
  tilt error that couples gravity (`g·θ`) into horizontal acceleration (Groves).
- **Time transfer.** White timing jitter → synchronisation precision → one-way ranging
  (`range = c·dt`, 1 ps ≈ 0.3 mm); the sample mean averages as `σ/√N`.
- **Fusion & integrity.** A two-state Kalman filter whose process noise matches the
  truth model; coasting, its phase-error variance grows to exactly `q_wf·T + q_rw·T³/3`
  — the analytic holdover relation — and its 1-σ bound feeds the Integrity figure of
  merit.
- **Geometry.** Circular two-body propagation, a Walker-delta constellation, and
  line-of-sight visibility (Earth occultation + elevation mask) derive GNSS availability
  from real orbital geometry rather than hand-authored windows.

## 7. Where to go next

- Work through it: the [tutorials](tutorials/README.md) — three worked examples + graded exercises.
- Run it: see the [README](../README.md) quick start.
- Understand the structure: [ARCHITECTURE.md](ARCHITECTURE.md).
- Check what is and isn't validated: [VALIDATION.md](VALIDATION.md).
- Look up a term: [GLOSSARY.md](GLOSSARY.md).
