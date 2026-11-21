# LEO-PNT verification tools

`kshana leo-verify` answers the questions a buyer, an integrator or a test house asks before relying on a
low-Earth-orbit positioning, navigation and timing (LEO-PNT) service: how a timing receiver fed by short LEO
bursts behaves, what an oscillator's datasheet predicts for holdover wander, what a subscription buys against
outages, what is left of a signal indoors or in rain, how likely an RTK user is to fix ambiguities with a given
set of carriers, what a stated power advantage means against a jammer, and how far a Doppler-only fix can be
trusted. Source: `src/leo_verify/`. Tests: `tests/leo_verify.rs`. Example inputs: `examples/leo-verify/`.

```
kshana leo-verify burst-timing      examples/leo-verify/burst-timing.json
kshana leo-verify holdover-tdev     examples/leo-verify/holdover-tdev.json
kshana leo-verify cost              examples/leo-verify/cost.json
kshana leo-verify indoor            examples/leo-verify/indoor.json
kshana leo-verify rain-fade         examples/leo-verify/rain-fade.json
kshana leo-verify rtk-ar            examples/leo-verify/rtk-ar.json
kshana leo-verify jam-claim         examples/leo-verify/jam-claim.json
kshana leo-verify doppler-integrity examples/leo-verify/doppler-integrity-arctic.json
```

Each prints one JSON report (`part`, `label`, `result`) to standard output and writes no file. The tools are
system-agnostic: every signal, constellation, oscillator and price is an input. The figures in the example
files (costs, C/N0 values, a signal "30 dB stronger") are placeholders to show the shape of an input, not
statements about any product or service.

## Evidence

Every report is **MODELLED** (`"label": "MODELLED"`). The tools apply closed forms and simulations to stated
inputs; none is a measurement of a service or a receiver, and no output states that a system meets a
requirement. A row says only whether a modelled figure is above or below a threshold the user stated. Where a
tool builds on a procedure that the engine has validated elsewhere, that is said below; the tool's own result
is still a model of the stated case.

## burst-timing: LEO-burst timing simulator

A timing receiver sees its LEO time source in short bursts (a pass, a paging slot, a subscription window) and
coasts on its oscillator in between. Input: the oscillator (a preset id `ocxo`, `rubidium`, `caesium`, `csac`
from the telecom-timing datasheet presets, or a full datasheet as in [Oscillators](OSCILLATOR.md)), a regular
burst pattern (`period_s`, `length_s`, `sigma_ns`) and/or explicit `schedule` windows, `outages` with no
measurement (indoor, interference, a lapsed subscription), the time-error `threshold_ns` and the `coverage_factor`.

The run is the two-state Kalman filter and seeded truth clock of the `leo-pvt` timing mode over `runs` seeds.
The report gives the median RMS and 95th-percentile time error, the worst error, how many runs and what share
of epochs exceeded the threshold, the filter's predicted bound (`k` times its largest one-sigma), the TDEV and
MTIE of the first run's time error, and `longest_gap_allowed_s`: the longest gap after a burst whose predicted
error, with the flicker floor and the uncompensated ageing included, stays under the threshold. The simulated
clock has white and random-walk frequency noise only, so the gap budget is the more conservative figure.

## holdover-tdev: holdover TDEV predictor

`TDEV²(τ) = (τ²/3) · Mod σ_y²(τ)` with `Mod σ_y²(τ) = ½ q_wf/τ + 0.6747 h_F + (33/40) q_rw τ/3 + D² τ²/2`: the
power-law levels fitted to the datasheet Allan deviation, the large-averaging-factor ratios of the modified to
the normal Allan variance (Riley, NIST SP 1065; the flicker ratio is evaluated numerically from the two transfer
functions) and the ageing drift `D`. Each row gives the total and each term, and which term dominates. With
`mask` set to a telecom-timing mask id (`kshana`'s `telecom-timing` kind lists them) the predicted curve is
checked against that mask's TDEV limits. With `simulate`, a phase record of the white and random-walk terms is
generated and its TDEV computed; `simulated_ratio` is simulated over predicted. The backlog acceptance, "TDEV
prediction matches the analytic model", is that ratio staying within 20 % (`tests/leo_verify.rs`).

## cost: subscription cost against resilience

For each option (an oscillator, optionally with LEO time aiding every `interval_s` at `sigma_ns`) and each GNSS
outage length: the predicted error after coasting on the clock alone, whether that holds the threshold, and the
probability of holding with LEO aiding, `availability · [LEO bound holds] + (1 − availability) · [clock holds]`.
`availability` is the user's statement of how often the LEO service stays usable through the same event (a
jammer or a building may take both). Cost of ownership is `capex + annual · years`, undiscounted. The report is
unranked: `non_dominated` marks the options no other option beats on both cost and mean probability of holding.

## indoor: building entry loss and the indoor penetration protocol

Each signal's C/N0 indoors is its outdoor C/N0 minus the ITU-R P.2109-2 building entry loss for the class
(`traditional`, `thermally-efficient`), the probability that the loss is not exceeded and the elevation at the
façade. The engine's P.2109 implementation is validated against the ITU workbook (VERIFICATION-MATRIX, building
entry loss row); the indoor C/N0 is a model of a building population, not of one building.

### Indoor penetration protocol (measurement)

To check the model in a real building, record the same receiver outdoors and indoors:

1. Outdoor reference: an open-sky point within 100 m of the building, 30 min, logging per-satellite C/N0 and
   elevation for both the LEO and the GNSS signals, with the same antenna and cable used indoors.
2. Indoor points: at least five positions per floor (window, middle of the room, core), 10 min each, the antenna
   fixed and its height recorded; note the façade type and glazing.
3. Loss per signal and point: outdoor C/N0 at the same elevation (interpolated over the reference) minus indoor
   C/N0, per satellite pass; keep the elevation of each sample.
4. Compare the empirical distribution of the loss with `kshana leo-verify indoor` for the matching class and
   elevations; report the percentile of the measured median in the P.2109 distribution.
5. Publish the raw logs with the result. Only a comparison against such logs may be labelled VALIDATED.

## rain-fade: C-band rain-fade availability

For each band and elevation: the ITU-R P.618-14 rain attenuation exceeded for 0.001 % to 5 % of an average
year, and the time percentage at which it equals the stated margin. Availability is `100 − p`; outside the
procedure's range the report gives the range end with `bound` = `at_least` or `at_most`. The rain height
(P.839) and `R0.01` (P.837) are inputs. The attenuation procedure is the engine's, validated against the ITU-R
Study Group 3 examples; the inversion is checked by reproducing one of those examples' time percentage from its
attenuation (`tests/leo_verify.rs`).

## rtk-ar: cascaded ambiguity resolution with L and C band

Each stage fixes one combination, a wide lane of two carriers or one carrier, widest first; the first stage
against the narrow-lane code of its own carriers (Melbourne-Wübbena), each later stage against the combination
fixed before it. The float ambiguity's one-sigma is `d · sqrt(σ_Φ² + σ_R²)/(λ sqrt(n))` (`d = 2` double
differenced) with the bias `ΔI/λ` from the stated residual first-order ionosphere; the success rate of one
ambiguity is the bias-affected bootstrapping rate `Φ((1 − 2b)/2σ) + Φ((1 + 2b)/2σ) − 1`, raised to the number of
double-difference ambiguities and multiplied over the stages. White noise only, no multipath, no geometry: a
real receiver with a geometry-based float solution does better on the first stages.

## jam-claim: jamming-resistance claims, quantified

For each signal: the nominal C/N0, the J/S at which tracking reaches the threshold from the anti-jam equation
of the `jamming` kind, the jammer power that takes, and the free-space radius inside which a jammer of each
stated EIRP stops tracking. Against the first signal, the power advantage, the tolerance advantage and the
radius and area ratios (`10^(−Δ/20)` and its square). A vendor's stated J/S tolerance is set beside the model's
(`model_reaches_stated`) with the effective C/N0 at that J/S. Free space is the worst case for the victim. The
tool computes the effect of interference on a receiver; it neither designs nor locates an emitter.

## doppler-integrity: Doppler-only integrity at any latitude

Protection levels of a static Doppler fix (position and clock drift, optionally with the height held) over
Walker shells, for windows starting at `starts_s`. The fault is a constant range-rate bias on one satellite over
the window (a satellite frequency offset); its slope is `|(Q g_s)_EN| / sqrt(Σ W_i − g_sᵀ Q g_s)` with
`Q = (HᵀWH)⁻¹` and `g_s = Σ_{i∈s} W_i h_i`, and `HPL = max_s slope · sqrt(λ)` for the detection threshold at
`p_fa` and the non-centrality missed with `p_md`. A satellite whose bias the clock drift absorbs completely has
no finite slope and the window is reported unavailable: one satellite in view cannot protect itself. With
`fault` set, noisy measurements with the bias are solved and the result is placed on a Stanford diagram. The
Arctic example puts the user at 78° N under an inclined and a polar shell.

### Cross-checking a LEO Doppler fix at sea

A LEO Doppler fix is an independent cross-check on GNSS, not a replacement: compare the two positions only when
the Doppler window's HPL is below the distance that would matter for the passage, treat a disagreement larger
than both protection levels as a reason to fall back to other aids (radar, visual bearings, depth), and log both
solutions with their protection levels. The tool gives the HPL to use; the decision stays with the watch officer.

### Comparing LEO systems

To compare two LEO-PNT systems neutrally, run the same `doppler-integrity`, `burst-timing`, `indoor` and
`rain-fade` inputs with each system's published parameters, the same site list (include a polar site), the same
noise assumptions, and report every input file next to the results. A comparison that changes inputs between
systems is not a comparison.

## Not covered here

Urban signal-of-opportunity benchmarks need recordings and are not part of these tools.
