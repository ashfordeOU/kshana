<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B3a (0.41): fixed-station emitter locator by power difference (C/N0 and AGC)

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are for the owner to fix at sign-off. After sign-off the bars may
be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified navigation equipment.

**No scored run happens until the reference campaign's station data and transmitter positions are public** (section 3).
The locator is built and checked on synthetic data in 0.41 and stays MODELLED until then.

## Why this row

The 0.40 emitter-region estimator (`docs/emitter-region/`, ledger row `VM-bc70cb57`) was **NOT ASSESSABLE** on
Jammertest 2025: crowd ADS-B and AIS reports were too sparse near the sites (2 scheduled sessions of a minimum of 4;
0 for AIS). Roadmap row D3 closes that gap through B3. Fixed reference stations at known positions are dense where the
crowd is not, and they report the two observables a power-difference fit needs: per-satellite C/N0 and the front-end
AGC level. B3a turns several stations' C/N0 and AGC logs into a probability region, an ellipse and a timeline for the
position of an interference source. B3b (TDOA from IQ snapshots) follows and has its own pre-registration.

## 1. The method (fixed now)

**Per-station received interference power.** For station `i` at epoch `t`, two independent estimates of the interference
power at the antenna, `J_i(t)` (dBW):

- *From C/N0:* invert the anti-jam equation already in `src/jamming.rs` (`effective_cn0_dbhz`):
  `J/S = Q·R_c·(1/(C/N0)_eff − 1/(C/N0)_nom)`, with `(C/N0)_nom` the station's per-satellite baseline from the
  calibration window (receiver-trust calibration, unchanged), averaged over satellites above 15° elevation with a
  median, `S` the nominal received signal power, `R_c` the chip rate, and `Q` = `Q_BROADBAND` unless the catalogue states
  a waveform. Epochs where the median drop is below 3 dB (*proposed*) carry no C/N0 power estimate (the inversion is
  ill-conditioned there).
- *From AGC:* `J_i = N_i + 10·log10(10^(ΔAGC_i·κ_i/10) − 1)`, `ΔAGC_i` the AGC change from baseline, `κ_i` the station's
  dB-per-AGC-unit scale and `N_i` its in-band noise power, both from the station metadata (obs/1, row A1). A station
  without a stated `κ_i` uses C/N0 only.
- The two estimates are combined by inverse-variance weighting with fixed variances `σ_C/N0 = 2 dB`, `σ_AGC = 3 dB`
  (*proposed*: a C/N0 reporting resolution of 1 dB-Hz plus baseline scatter, and a wider figure for AGC because its
  scale `κ_i` is a datasheet value; set by judgement, not fitted to any locator result).

**Propagation model.** `J_i = P_0 − 10·n·log10(d_i(x)/1 m) + G_i(x) + ε_i`, with source position `x` (horizontal, on
the emitter-region grid, height above ground from the grid's antenna-height set), unknown reference power `P_0`
(profiled out in closed form), path-loss exponent `n` ∈ {2.0, 2.5, 3.0} marginalised with equal prior, station antenna
gain toward the horizon `G_i` from metadata (0 dBi if unstated), and `ε_i ~ N(0, σ_sh²)` with `σ_sh` = 6 dB
(*proposed*; a common log-normal shadowing figure for ground links, set from the literature, not from data). Stations
that report no interference at an epoch contribute a censored term: `P(J_i < J_min,i)`, `J_min,i` the power at which the
3 dB drop gate is met. Stations with no line of sight to `x` (the existing emitter-region line-of-sight model and,
where a DEM is given, `jamming_terrain`) get an extra 20 dB of mean loss (*proposed*).

**Posterior and outputs.** Flat prior over the search domain (the convex hull of the stations buffered by 20 km,
*proposed*). Per **session** (a maximal run of epochs in which at least 3 stations carry an estimate, split at a 120 s
gap): the posterior on the grid accumulated over the session's epochs with the same tempering exponent rule as the
emitter-region estimator (a power posterior; exponent fixed on synthetic data before the scored run and written into the
output). Outputs: highest-posterior regions at 50%, 90% and 95%; the posterior mean (centroid); the 2x2 covariance and
its 95% ellipse; a timeline of these per 60 s. Method identifier `kshana-locate/power-difference/v1`.

**Parameters.** Every number above is written into `PowerDifferenceParams::preregistered_v1` and into every output.
None is set from or checked against any real interference-event log with known transmitter positions.

## 2. Synthetic gate (before any real data)

A seeded synthetic network (`tests/locator_power_difference_synthetic.rs`): 6 to 12 stations on a 5 to 30 km layout,
sources drawn uniformly in the domain, data generated **from a different model than the locator assumes** (log-distance
with `n` drawn from [1.8, 3.5], shadowing correlated between nearby stations with a 1 km correlation length, AGC scale
errors of ±1 dB), 1 000 sessions.

| Id | Bar (*proposed*) |
|---|---|
| S1 coverage | 95% region contains the truth in at least **0.90** of sessions (below 0.95 is allowed because the generating model differs on purpose; the shortfall is reported) |
| S2 non-vacuity | median 95% region area at most **25%** of the search domain |
| S3 centroid | median centroid error at most **0.5 ×** the median nearest-neighbour station spacing |
| S4 determinism | byte-identical output across platforms and surfaces |

Failing the synthetic gate stops the row; the real run is not made with a method that fails its own synthetic test.

## 3. The reference campaign and the blind rule (owner gate 4)

**Owner decision, 3 November 2026 (gate 4):** the Jammertest 2026 test catalogue and plan, transmitter positions
included, were published in May 2026 (https://jammertest.no and the public `NPRA/jammertest-plan` repository,
https://github.com/NPRA/jammertest-plan). A bar set now could not be blind to them. B3a is therefore pre-registered
against **Jammertest 2027**. Nobody working on this row opens the 2026 positions; 2026 data is not used to tune or score
this locator.

**Data needed, all public, none vendored:**

1. The 2027 test catalogue and transmission plan (schedule and transmitter positions), from the same public
   repository, fetched at a pinned commit by `xval/locator-power-difference/fetch.sh`, SHA-256 per file in `MANIFEST.tsv`.
2. Multi-station receiver logs recorded during the 2027 campaign at known positions with C/N0 (and AGC where available),
   from a public dataset with a stated licence (for example a Zenodo record of the kind of the 2024 dataset, record
   15911589). Fetched by script, SHA-256 pinned, extracted outside the repository.

**Order:** this file signed and committed → locator code and synthetic gate committed → station-log dataset fetched and
its station metadata (positions, receiver types, time span) read, **without** the transmitter positions → station
selection and session list committed → transmitter positions fetched → one scored run.

If either item is not public by the 0.41.x line, the row stays MODELLED with result "not run: reference not published".

## 4. Population, truth and metrics

- **Truth events:** catalogue jamming tests (type 1) at a fixed transmitter position, from the plan; moving sources are
  excluded. Truth = the published transmitter coordinates.
- **Scored sessions:** sessions that overlap a truth event by at least 50% of their duration and have at least 4
  stations (*proposed*) with an estimate. One scored session per (event, contiguous slot).
- **Metrics:** the B2 referee definitions (`docs/design/evidence/b2-referee-metrics/PREREGISTRATION.md`), which must be
  MET first: centroid error `e` (geodesic), 95% region containment, 95% region area, time to first location, time to
  locate at 1 km.

## 5. Bars on the real run (*proposed*)

Let `n` be the number of scored sessions, `h` the number whose 95% region contains the truth.

| Id | Metric | Bar |
|---|---|---|
| min | `n` | at least **6**; otherwise NOT ASSESSABLE |
| L1 coverage | `h` of `n` | `h ≥ k(n)`, the largest `k` with `P(Bin(n, 0.95) ≥ k) ≥ 0.95` (`k(6)` = 5, `k(10)` = 8, `k(20)` = 17) |
| L2 non-vacuity | median 95% region area | at most **25%** of the search domain, and at most **π·(5 km)²** |
| L3 centroid | median centroid error | at most **0.5 ×** the median nearest-neighbour spacing of the contributing stations, and at most **3 km** |
| L4 timeliness | median time to first location | at most **60 s** after the slot start (scheduled truth: an upper bound on the true delay) |

**Derivation of L3.** With log-distance loss and `σ_sh` = 6 dB, one station's range estimate has relative error about
`σ_sh·ln 10 / (10·n)` = 0.69 at `n` = 2; with `N` independent stations around the source this falls roughly as
`1/sqrt(N)`, about 0.3 at `N` = 5. For a source inside the network the range is of the order of the station spacing, so
0.3 to 0.4 of the spacing is the expected median; 0.5 leaves room for terrain and correlated shadowing. The 3 km cap
keeps the bar meaningful for sparse layouts.

MET only if L1 to L4 are all met. D3 is closed only by a MET.

## What a MET and a NOT MET mean

- **MET** means: on one public campaign, unseen when the bars were set, the power-difference fit from fixed stations put
  a calibrated 95% region around fixed transmitters and a centroid within the stated distance. The ledger row becomes
  VALIDATED for that campaign's geometry class (fixed, ground-level, single source).
- **MET does not mean** it works for moving sources, several simultaneous sources, sparse networks outside the tested
  spacing, other terrain, or other receiver types; nor that the schedule's on-air times were exact.
- **NOT MET** is published with every number; the row stays MODELLED. **NOT ASSESSABLE** (too few sessions, data not
  public) is not a pass and not a miss.

## Out of scope

TDOA and FDOA (B3b); angle of arrival; moving or airborne sources; several simultaneous sources (a session overlapping
two fixed-site tests at once is excluded and listed); identifying the waveform; any statement about who operates a
source or why.

## Open questions for sign-off

1. Confirm the reference is Jammertest 2027 (gate 4 decision) and that 2026 data is not used even for development.
2. If no public multi-station log dataset is published for 2027, whether a campaign with public multi-station logs from
   another public test event may be named instead (by the same blind rule) or the row waits.
3. `σ_sh` = 6 dB, the 3 dB C/N0 gate, `min n` = 6, and the L2/L3 caps.
