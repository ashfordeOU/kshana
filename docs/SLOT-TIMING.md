# Slot timing

The `slot-timing` scenario kind answers three questions for a clock that free-runs
between synchronisations and must keep traffic inside a **time-indexed slot**: a
routing, tasking or contact slot whose **guard** is the largest absolute time error, on
either side, at which the slot still works.

1. **When does the guard break?** Seconds from the last fix until the predicted time
   error reaches the guard, with every contributing term itemised and the dominant one
   named.
2. **How much time is left now?** The same figure minus the time already elapsed since
   the fix.
3. **How often must the clock take a fix?** The largest interval between fixes that
   keeps the error inside the guard, net of the latency before a fix takes effect.

An optional `spoofing` section adds the timing protection level (TPL) for a receiver in
orbit; see [Spoofing a receiver in orbit](#spoofing-a-receiver-in-orbit).

Run the bundled example with `kshana example slot-timing-ocxo-leo`.

Abbreviations: GNSS, Global Navigation Satellite System; TCXO, temperature-compensated
crystal oscillator; OCXO, oven-controlled crystal oscillator; RAFS, rubidium atomic
frequency standard; CSAC, chip-scale atomic clock; USO, ultra-stable oscillator; DSAC,
deep-space atomic clock; ADEV, Allan deviation; FM, frequency modulation (here, noise on
the clock's frequency); PM, phase modulation (noise on its phase); IEEE, Institute of
Electrical and Electronics Engineers; ITU-T, the Telecommunication Standardization Sector
of the International Telecommunication Union; TIE, time interval error; MTIE, maximum
time interval error; TDEV, time deviation; max|TE|, maximum absolute time error; CUSUM,
cumulative-sum change detector; TPL, timing protection level; LEO, low Earth orbit.

## The error model

The predicted time error after coasting `t` seconds from a fix is

```text
E(t) = k·√(σ₀² + σ_x²(t))  +  (|y₀| + |c_T·ΔT|)·t  +  ½·|D|·t²
σ_x²(t) = σ_PM² + q_wf·t + h_F·t² + q_rw·t³/3 + q_rr·t⁵/20
```

| Symbol | Meaning |
|---|---|
| `k` | coverage factor (3 is about 99.7 % of a Gaussian error) |
| `σ₀` | one-sigma time error of the fix |
| `σ_PM²` | white phase-noise variance: jitter of the time error, a constant floor |
| `q_wf`, `q_rw`, `q_rr` | white, random-walk and random-run FM densities (the van Loan terms of `holdover::coast_phase_variance`) |
| `h_F` | flicker-FM floor of the Allan variance |
| `y₀` | residual fractional-frequency offset left after the fix |
| `c_T·ΔT` | frequency offset from a temperature change `ΔT` through the temperature coefficient `c_T` |
| `D` | linear ageing rate |

Each FM term equals `t²·σ_y²(t)` for its own noise type, with
`σ_y²(τ) = 3σ_PM²/τ² + q_wf/τ + h_F + q_rw·τ/3 + q_rr·τ³/20` (Zucca and Tavella, IEEE
Trans. UFFC 52(2), 2005). For white, random-walk and random-run FM that relation is
exact. For flicker FM it is the conventional estimate of the time-prediction error
(Riley, NIST SP 1065): flicker FM has no closed form without a low-frequency cut-off. The
frequency offsets add in magnitude because their signs are unknown, so the deterministic
part is a worst case. Every term is non-negative and non-decreasing in `t`, so
`E(t) = guard` has one root, found by bracketing and bisection.

## Where the clock comes from

| Source | Scenario key | What it is | Tier |
|---|---|---|---|
| Class default | `oscillator.class` | one cited one-second ADEV and a red-noise floor synthesised two and four decades below it | MODELLED: the answer for a stable clock is governed by the assumed floor |
| Datasheet preset | `oscillator.preset` | the telecom-timing presets (`ocxo`, `rubidium`, `caesium`, `csac`), each a named Microchip datasheet | MODELLED: an envelope of datasheet maxima |
| Inline datasheet | `oscillator.datasheet` | the customer's own ADEV table, ageing and temperature coefficient | MODELLED: an envelope of the maxima given |
| Measured record | `oscillator.record` | a phase record; its overlapping ADEV is fitted by weighted least squares | the inversion is VALIDATED on a held-out real record (below) |

The three classes added in 0.28.0 each cite one public datasheet:

| Class | One-second ADEV | Source |
|---|---|---|
| `tcxo` | 2.0e-10 | EndRun Technologies, *Disciplined Oscillator Options*, basic TCXO column |
| `ocxo` | 5e-12 | Microchip OX-208 datasheet, Rev 12-1-2021 |
| `rafs` | 3e-11 | Microchip 8040C Rubidium Frequency Standard datasheet, DS00003047A |

The EndRun long-averaging-time rows (10 000 s and 100 000 s) converge for every
oscillator in that table, which suggests they describe the disciplined product rather
than the free-running oscillator, so they are not used.

**The record fit is weighted.** An Allan-variance estimate with `edf` equivalent degrees
of freedom has variance about `2σ⁴/edf`, so each point enters with residual
`√(edf/2)·(model/σ² − 1)`. An unweighted fit let the short averaging times decide the
long-averaging-time terms: on a white-FM test record it produced a spurious flicker floor
that shortened a 2 000 s breach by 30 %. A datasheet or record only supports averaging
times up to its longest point; a breach beyond that is flagged `extrapolated`.

## Validation: the inversion on a held-out real clock

`tests/slot_timing_cs5071a_holdout.rs` uses the 556 990-sample record of a 5071A caesium
standard measured against a hydrogen maser (A. Wallin, distributed with `allantools`; the
same record the estimator oracle `tests/cs5071a_reference.rs` uses). With the maser as
the reference the record is a 6.4-day free run.

1. Fit the noise model on the **first third** of the record only.
2. Predict, from that model, the coast time at which the one-sigma time error reaches
   0.5, 0.75, 1, 1.5, 2 and 2.5 ns.
3. On the **other two thirds**, coast from a sync point every 997 s with the frequency
   estimated from the preceding third, and measure where the root-mean-square coast
   error reaches each threshold.

The pass bar, fixed before the test first ran, is every predicted breach within a factor
of 1.5 of the measured one. A control, the one-second ADEV read as white FM, must fail
that bar, so the bar can tell a good model from a bad one. The test prints its table; a
mutation that halves the white-FM level fails it. The raw record is git-ignored
third-party data: `scripts/fetch_cs5071a.sh` fetches it, and the `realdata-clock`
workflow runs the test with `KSHANA_REQUIRE_REALDATA=1`, so a missing file fails there
rather than skipping.

What this validates: the fit-then-invert path, on a white-FM-dominated atomic standard,
over coasts up to about 50 000 s. What it does not: a crystal oscillator, whose flicker
and random-walk terms and ageing dominate sooner (see the bench run below); the
datasheet and class sources; the deterministic terms.

### A bench run for a flight-representative part (scoped, not done)

The caesium record proves the method, not the oscillator class a smallsat flies. The
next step is a measured free run of an OCXO or a CSAC against a reference:

- a time-interval counter comparing the oscillator's 1 PPS with a GNSS-disciplined
  or maser reference, at least 10 days at one sample per second, temperature logged;
- the same held-out protocol: fit on the first third, predict the breaches, measure on
  the rest, with the same bar and control;
- the record and its hash published beside the test so the row is reproducible.

It is blocked on access to reference hardware and is not promised.

## Which wander metric should a slot be accepted against?

Timing standards offer three families of metric. For a time-indexed slot only one of
them measures the thing that breaks the slot.

- **MTIE** (ITU-T G.810) is the largest peak-to-peak TIE inside any window of a given
  length. It is blind to a constant offset: a clock that is 1 µs off but perfectly
  steady has an MTIE near zero and misses every slot. It measures how much the error
  *changes*, not where it *is*.
- **TDEV** (ITU-T G.810) is built from second differences of averaged phase. It removes a
  constant offset and a constant frequency error, which are exactly the terms that
  dominate a coast. It characterises the noise type; it is not an acceptance metric for
  absolute timing.
- **max|TE|** (ITU-T G.8260; the budget metric of G.8271) is the largest absolute time
  error against the reference timescale. It compares directly with a guard.

**Conclusion.** Accept a slot against max|TE| relative to the network's reference
timescale, evaluated as a predicted envelope from the last fix at a stated coverage
factor. That is what `E(t)` is: because every term grows with `t`, the maximum over a
coast of length `T` is `E(T)`. MTIE and TDEV stay useful as diagnostics: TDEV to
identify which noise term to attack, MTIE(L) to bound how much the error moves during a
slot of length `L`.

Two refinements the metric choice implies:

- **The guard applies to the relative error between two nodes.** If transmitter and
  receiver both coast independently, their stochastic errors add in quadrature and their
  deterministic errors add in magnitude. When the stochastic part dominates, each node
  can be given `guard/√2`; when ageing or temperature dominates, `guard/2`.
- **The coverage factor is a design choice, not a property of the clock.** `k = 3`
  bounds about 99.7 % of Gaussian errors at one instant, not over every slot in a day;
  a routing plan with many slots per day needs the per-slot risk it can tolerate.

## Spoofing a receiver in orbit

The `spoofing` section evaluates `orbital_timing::orbital_timing` for the same clock:

- **Geometry.** A ground spoofer reaches a LEO satellite only while the satellite is
  above its horizon: at 550 km, at most about twelve minutes per overhead pass. A
  spoofer ramping at rate `ρ` can therefore pull the clock by at most `ρ` times that
  window, or times the gap to the next independent check if that is shorter
  (`ramp_limited_pull_ns`).
- **Dynamics.** A common-mode time pull shifts every pseudorange equally and is absorbed
  into the clock bias, not the position, so an orbit-propagator position check does not
  count as a timing cross-check.
- **Cross-checks.** A satellite rarely has a second independent timing receiver. It has
  its own clock's coast (the monitor of `tpl`), a two-way time transfer with a ground
  station during contacts, and time comparisons over inter-satellite links. A crosslink
  is independent of one ground spoofer only if the neighbour is outside that spoofer's
  footprint at the same moment, which the report checks from the number of satellites
  per plane.
- **Conditional bound.** The monitor floor plus the clock's coast over the CUSUM
  detection latency, reducing exactly to `tpl::timing_protection_level_ns` when the
  clock has no flicker, white-phase or random-run term. Like that bound it holds only
  given detection.

All of it is MODELLED: a spherical, non-rotating Earth, an overhead pass, one
terrestrial spoofer with a stated maximum ramp rate. The arrival direction of the signals
at a zenith-pointing antenna is a real cross-check that needs an antenna pattern and is
not modelled. [`DECEIVED-TIME.md`](DECEIVED-TIME.md) explains why a signed control
message does not remove this threat.

## Not modelled

Frequency jumps, radiation effects and relativistic frequency offsets; a thermal model
(the temperature change is a step at the fix); the synchronisation protocol itself (a fix
resets the error to `fix_sigma_ns`).
