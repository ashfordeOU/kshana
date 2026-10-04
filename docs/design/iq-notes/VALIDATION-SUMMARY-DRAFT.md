<!--
DRAFT — one-page validation summary for the Kenn Gold follow-up.
Filled from the IQ streams' own test output (docs/design/iq-notes/*.md) after the
merge. Still a DRAFT: before sending, re-confirm each figure against the test it
cites on the released 0.31.0 tag, and keep the honest rule — a line reads
"validated" only when an oracle INDEPENDENT of Kshana agrees within a tolerance
fixed before the comparison; everything else is MODELLED and labelled so.
Numbers below are the enforced test bars and the measured results on committed
seeds, not marketing figures.
-->

# Kshana — how the GNSS signal layer is checked

One page, for a receiver engineer deciding whether the numbers can be trusted.

## The rule we hold ourselves to

Every quantity below is in one of two states, and we always say which:

- **Validated** — an independent reference (a published standard or interface
  control document, a third-party tool, or measured data) agrees with Kshana
  within a tolerance we fixed *before* running the comparison.
- **Modelled** — a physics model we implement and test against its own closed
  forms and statistics, but have not checked against measured field data.
  Useful, clearly labelled, never dressed up as validated.

Across the whole engine that ledger is **249 rows, 123 validated, 122 modelled,
4 partner** — each row linked to its test, module and committed reference data at
kshana.dev. The signal layer below adds no validated-matrix rows; its physical
models are MODELLED, checked against closed forms and injected truth as shown.

One piece is externally validated: the GPS L1 C/A spreading codes and the LNAV
navigation-message bits (fields and parity) the scene generates are **bit-exact
against gps-sdr-sim**, an independent open GPS signal simulator, in a
pre-registered comparison (`tests/gps_l1ca_gpssdrsim_cross_generator.rs`).

## The signal layer, mapped to what you asked about

| What you drill into | How Kshana checks it | Result (bar) | State |
|---|---|---|---|
| **Raw IQ, multi-satellite, long runs** | An independent software receiver re-acquires and tracks the generated scene and recovers the injected truth; a real IGS broadcast scene is solved back to position | refined code phase 0.003 chip (0.05); Doppler < 0.5 Hz (2 Hz); C/N0 44.9 / 37.8 dB-Hz (±0.3 / 0.6); GPS L1 C/A codes + LNAV bits + parity **bit-exact vs gps-sdr-sim**; real broadcast scene position **2.3e-9 m**; Doppler = −range-rate/λ to **1e-12** | Validated (gps-sdr-sim) + injected truth |
| **Acquisition** | Empirical detection/false-alarm rates vs the engine's own Marcum-Q statistics; FFT vs the defining DFT | FFT = DFT to **1e-9**; Pfa 0.0471 (target 0.05); Pd 0.527 vs Marcum-Q 0.523 | Checked vs published detector theory |
| **Tracking loops** | Loop bandwidth, steady-state jitter and steady-state error vs Kaplan & Hegarty / Gardner closed forms; sweep one recording across loop designs | loop Bn within 0.5–3.5% (6%); Costas jitter +8% / +2% (12%); DLL jitter −3.5% / −0.4% (15%); 2nd-order ramp error < 1e-12 rel; NWPR/Beaulieu C/N0 unbiased to 0.3 dB | Checked vs published loop theory |
| **Ionospheric scintillation** | Sample statistics of long runs vs the Cornell model's closed forms | sample S4 within **4%** of target (S4 = 0.3/0.6/0.9); 1/e decorrelation within **5%** of τ0 | MODELLED (Cornell model) |
| **Troposphere** | Reuses the engine's Saastamoinen/Niell model | zenith hydrostatic ≈ 2.3 m; Niell = 1 at zenith | Validated (existing) |
| **Multipath & NLOS** | Fresnel coefficients and excess delay vs closed form; land-mobile occupancy vs the Markov stationary distribution | Fresnel matches an independent Snell-law form; Brewster null holds; excess delay = 2h·sin(el)/c; occupancy within **0.015** of π | MODELLED, closed-form checked |
| **Signals beyond L1 C/A** | Each code's chips vs its official interface control document (PDF SHA-256 pinned) | GPS L1/L5/L2C (IS-GPS-200N, 705J); Galileo E1/E5a (OS SIS ICD 2.0/2.1, real memory codes); BeiDou B1C/B1I (BDS-SIS-ICD); GLONASS L1OF | Validated vs official ICDs |
| **Calibrate to your lab data** | Nelder-Mead fit recovers known parameters; leave-one-run-out hold-out; extrapolation labelled | Rosenbrock min to 1e-6; noise-free recovery exact; noisy within 0.4 dB / 0.5 s and 4 bootstrap sd | MODELLED (fit method validated) |

## What this layer does not do, stated plainly

- It does not generate jammer or spoofer RF, and has no over-the-air transmit.
  Your simulator supplies the stimulus; Kshana is the receiving and analysis side.
- Results on *your* receiver are a fitted model of its observed behaviour, with
  the fit error stated — not a copy of its proprietary loops.
- The channel and loop models are MODELLED. They are checked against closed forms
  and injected truth, not against measured field data — which is exactly what your
  lab runs would let us do next.

## If you want to go deeper

- The full machine-checked ledger (per-row tests, modules, reference data):
  kshana.dev validation ledger / docs/VERIFICATION-MATRIX.md.
- We can run this against one of your recordings and hand you the report plus the
  exact commands, so you reproduce every number yourself.
