<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B1a (0.41): the monitoring-network planner (detection and location-accuracy maps, station count and placement)

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are for the owner to fix at sign-off. After sign-off the bars may
be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified navigation equipment.

## Why this row

A fixed-station interference-monitoring network is sited before it exists. The questions are: from where on a site
would an interference source of a stated power be detected, how well would it be located, and how many stations, where,
are needed. Kshana has the pieces but not the planner: TDOA/FDOA solvers and their lower bounds on the error covariance (CRLB)
(`src/geolocation.rs`: `tdoa_crlb`, `tdoa_crlb_cov`, `tdoa_crlb_on_sphere`), detection closed forms
(`src/detection.rs`: `analytic_pd`, `detection_boundary`), network detection sizing written for the lunar surface
(`src/monitor_network.rs`), a knife-edge terrain loss (`src/jamming_terrain.rs`) and the emitter-region grid
(`src/interference_map/grid.rs`). B1a composes them into maps over an Earth site. The roadmap's done-test is that the
planner **reproduces a published multi-station TDOA campaign's geometry within a pre-registered bound**; this file fixes
that bound and the internal checks that come before it.

The planner is MODELLED. Its maps are predictions from a geometry and a link budget, not measurements.

## What the planner computes (fixed now)

Inputs: a site (WGS 84 bounding box and grid spacing), candidate station positions, a source set (EIRP in dBW, height
above ground, frequency band), station parameters (antenna gain toward the horizon, noise figure, detection statistic
and `P_fa`), the TDOA measurement standard deviation `σ_τ` (s) or the inputs it is derived from (signal bandwidth `B`
and integrated SNR, `σ_τ = 1/(2π·B_rms·sqrt(2·SNR))`), and a propagation model (free space; optional single knife-edge
terrain loss from `jamming_terrain`).

Per grid cell `x` (the source at `x`):

1. **Received power** at station `i`: `P_i(x) = EIRP − L_fs(d_i) − L_terrain,i + G_i`, `L_fs = 20·log10(4π·d_i/λ)`.
2. **Detection probability** at station `i`: the existing closed form, `P_d,i = analytic_pd(μ_i, σ_i, γ)` with
   `γ = detection_boundary(σ_i, P_fa)` and `μ_i` the excess of the statistic over the noise floor at `P_i`;
   **network detection** `P_D(x) = 1 − Π_i (1 − P_d,i)`; **k-station detection** `P_k(x)`, the probability that at least
   `k` stations detect (the exact distribution of the number of detecting stations, independent stations with unequal probabilities, by recursion), with `k = 4` for 3-D TDOA and `k = 3` for TDOA constrained to
   the surface.
3. **Location accuracy** from the stations that detect with `P_d,i ≥ 0.5` (*proposed*): the 2-D horizontal covariance
   `C(x)` from `tdoa_crlb_on_sphere` (surface source) or the horizontal block of `tdoa_crlb` (3-D), and the reported
   figure `DRMS(x) = sqrt(trace C_h(x))` in metres, plus the 95% ellipse semi-axes `sqrt(χ²₂(0.95)·λ_{1,2}(C_h))`.
   Cells with fewer than `k` such stations are "not locatable".
4. **Placement:** given `N_c` candidates and a budget of `m` stations, the planner returns the subset maximising the
   **objective** `F(S)` = fraction of site cells with `P_k ≥ 0.9` and `DRMS ≤ D_req` (`D_req` an input), ties broken by
   the lower median `DRMS`, then by lexicographic candidate index. Exhaustive search when `C(N_c, m) ≤ 10 000`; greedy
   otherwise, with the method stated in the output.
5. **Station count:** the smallest `m` whose best subset reaches a stated `F_req`, or "not reached with these candidates".

## Bars, part 1: internal and independent checks (no external data)

| Id | Bar (*proposed* numbers) |
|---|---|
| P1 independent recomputation | For three fixed layouts written into the test now (a square of 4 stations at 5 km; a line of 5 stations at 2 km, the degenerate case; 6 stations on a 10 km circle), on a 41 x 41 grid, a numpy script that shares no code with the engine (`xval/planner/oracle.py`) computes `P_i`, `P_d,i`, `P_D`, `P_k`, `C_h` and `DRMS`. Agreement: `P_d,i`, `P_D`, `P_k` within **1e-12** absolute; `DRMS` within **1e-9** relative on every locatable cell; identical "not locatable" cells. |
| P2 the bound is attained where it should be | At 20 cells per layout chosen by a fixed seed among locatable cells, 10 000 Monte Carlo trials of `solve_tdoa` with normal TDOA noise at `σ_τ` = 10 ns: the empirical horizontal RMS error is within **±5%** of `DRMS` at every cell with `DRMS < 0.05 ×` the mean station distance (the near-linear regime). Cells outside that regime are reported, not barred. |
| P3 detection by simulation | At the same cells, 100 000 draws of the station statistic: the empirical `P_D` and `P_k` lie inside the two-sided 99.9% binomial interval of the closed-form value. |
| P4 placement | For a 12-candidate, `m` = 4 instance (495 subsets) the planner's subset equals the exhaustive optimum of `F` under the stated tie-break, exactly. For a 30-candidate, `m` = 6 instance the greedy objective is reported with the best of 1 000 seeded random subsets beside it; bar: greedy ≥ that best. |
| P5 determinism | Same input, same engine version: byte-identical map files on Linux, macOS and Windows and through the CLI, Python and WebAssembly. |
| P6 additivity | No existing scenario output changes. |

## Bars, part 2: reproducing a published campaign's geometry

### The reference (chosen by rule, named at sign-off)

One publication describing a multi-station TDOA field campaign for locating a GNSS-band interference source. To qualify
it must, all of:

1. be freely readable (open access or a public technical report) at a stable URL or DOI;
2. give the station coordinates and the true source coordinates **as numbers in text or a table** (not read off a
   figure), or in a local frame whose origin is given;
3. state the TDOA measurement standard deviation, or the signal bandwidth and SNR from which it follows;
4. report, for stated source positions, either the predicted accuracy of the geometry (a GDOP, CRLB or error-ellipse
   value) or the achieved location errors with their sample size;
5. be openly published and use no non-public data.

The owner names the publication at sign-off (see Open questions). Its PDF or page is fetched by
`xval/planner/fetch.sh` with its SHA-256 recorded in `xval/planner/MANIFEST.tsv`, and is **not vendored** unless its
licence allows. Only the numbers transcribed from it (coordinates, `σ_τ`, reported values) are committed, with the page
and table they come from. The transcription is committed **before** the planner is run on it.

### Metrics and bars (*proposed*)

| Id | Metric | Bar |
|---|---|---|
| G1 transcription | Station-to-station and station-to-source distances recomputed from the transcribed coordinates against any distances the publication states | each within **1 m** or the publication's printed precision, whichever is larger |
| G2 predicted geometry | Where the publication reports a predicted accuracy (GDOP, CRLB or ellipse) at stated source positions: ratio `ρ = DRMS_planner / value_published` (after converting both to the same measure, the conversion written down before the run) | every `ρ` in **[0.90, 1.10]** |
| G3 achieved errors | Where the publication reports achieved errors only: `ρ_a = RMS_achieved / DRMS_planner` per source position | median `ρ_a` in **[0.7, 3.0]**; a value below 0.7 means the planner is pessimistic beyond sampling error, above 3.0 that the published campaign was limited by effects the planner does not model |
| G4 ordering | Where several source positions are reported: Rank correlation (correlation of the ranks) between published and planner accuracy | **≥ 0.8** when at least 5 positions are reported; reported only below 5 |

G2 is used if the publication reports predicted accuracy; G3 only if it does not. B1a is MET when P1 to P6 and the
applicable G-bars are all met.

**Derivation of the G3 band.** The CRLB is a lower bound for an unbiased estimator; a real campaign adds station
synchronisation error, multipath and biased TDOA estimates, so the achieved error is expected above it. A factor of 3 is
the room left for those unmodelled terms; it is not fitted to any campaign. The lower edge 0.7 allows for the sampling
spread of an RMS over about 10 trials (the relative standard error of an RMS from `n` normal samples is about
`1/sqrt(2n)`, 0.22 at `n` = 10).

## What a MET and a NOT MET mean

- **MET** means the planner's maps are computed as defined, its accuracy figure is the bound its solver attains in the
  regime it claims, its placement search returns the stated optimum, and its geometry reproduces one published campaign
  within the bound. The planner row moves from MODELLED to a row with one external comparison recorded as met.
- **MET does not mean** the planner predicts any real site's performance, that its propagation model is right (free
  space and one knife edge only), or that a network sited with it will meet its numbers.
- **NOT MET** on part 1 is a defect and blocks B1b. NOT MET on part 2 is published as a finding with the ratios; the
  planner stays MODELLED and part 1 still stands.
- If no publication meets the five criteria, part 2 is recorded as **NOT ASSESSABLE** and B1a is not done.

## Out of scope

Angle-of-arrival and hybrid accuracy (computed by the planner, checked only for determinism here); multipath, clutter,
foliage and multiple knife edges; moving sources; station synchronisation error as a separate input (it enters only
through `σ_τ`); cost (B1b); any claim about a particular site or network.

## Open questions for sign-off

1. The publication for part 2 (the owner names it, from the rule above).
2. Whether `P_d,i ≥ 0.5` is the right gate for a station contributing to the accuracy map, or the map should weight by
   `P_d,i`.
3. The G3 band [0.7, 3.0].
