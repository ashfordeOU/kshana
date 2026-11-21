<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# SIL observations: RINEX for continuous integration, with a street canyon

`kshana sil-obs generate` writes a RINEX 3.04 observation file and a JSON Lines truth file from a scenario
and a real broadcast navigation file, so receiver-processing software can be tested in continuous
integration (CI) without a radio, simulator hardware or a licence. `kshana sil-obs compare` compares two
observation files, for example a recorded urban drive and a simulation of it, on what can be measured
from the observations alone.

**MODELLED.** The open-sky observations follow the broadcast orbit and clock and the stated atmosphere
models exactly, and are checked by recovering the antenna position with the engine's own single-point
solver. The street-canyon multipath and NLOS (non-line-of-sight) model is a geometric model with stated
simplifications. It has **not** yet been compared with a recorded urban dataset in this repository; the
`compare` command and the procedure below exist to do that, and until a comparison is published the
urban output stays MODELLED.

```
kshana sil-obs generate <scenario.toml> --nav <nav.rnx> --out <sim.obs> [--truth <truth.jsonl>]
kshana sil-obs compare <a.obs> <b.obs> [--json] [--out <file.json>]
```

Example (GPS L1 C/A and L2C, a walk along an 18 m street with 35 m and 25 m walls):

```
kshana sil-obs generate examples/sil-obs/urban-canyon.toml \
  --nav tests/fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx --out sim.obs --truth truth.jsonl
```

## What the observations contain

For each satellite of the requested systems (`G` GPS, `E` Galileo) in the navigation file, at each epoch
above the elevation mask:

| Term | Model |
|---|---|
| Geometric range | broadcast position at the transmit time, iterated on the light time, rotated by the Earth's rotation over the travel time |
| Receiver clock | the epoch tag is receiver time; bias and drift as stated (`clock_bias_m`, `clock_drift_m_per_s`) |
| Satellite clock | broadcast polynomial with the relativistic term, minus the reference group delay (GPS `TGD`, Galileo `BGD` of the record's clock pair); the second frequency adds `(γ − 1)·TGD` with `γ = (f1/f2)²` |
| Ionosphere | Klobuchar with the nav file's `GPSA`/`GPSB` (IS-GPS-200 example set when absent), scaled by `(f1/f)²`; delay on code, advance on carrier |
| Troposphere | Saastamoinen zenith delays with Niell mapping, standard atmosphere (the models of `gnss-sim` and `pvt`) |
| Multipath / NLOS | the street canyon below |
| Noise | coherent early-minus-late DLL and PLL thermal jitter from the C/N0 (Kaplan & Hegarty, 3rd ed., section 8.7) |
| Carrier ambiguity | a random integer per satellite, signal and carrier arc |

Signals: GPS `C1C L1C D1C S1C` and, with `dual_frequency = true`, `C2L L2L D2L S2L`; Galileo `C1C ...`
and `C5Q ...`. The C/N0 in open sky is `cn0_zenith_dbhz − cn0_slope_db·(1 − sin el)` (a stated line, not a
receiver's); below `track_threshold_dbhz` a signal is not written. A carrier arc breaks (loss-of-lock
indicator set, new ambiguity) when a signal is reacquired or enters or leaves NLOS.

## The street canyon

One straight street (`[canyon]`): axis azimuth, wall-to-wall width, the heights of the left-hand and
right-hand walls (the right-hand wall is at axis + 90°), the antenna's offset from the centreline toward
the right-hand wall and its height above the ground, and the reflection loss. The street moves with the
antenna. For a satellite at azimuth `az` and elevation `el`, with `s = |sin(az − axis)|`, `d_sat` and
`d_opp` the antenna's distances to the wall on the satellite's side and to the opposite wall:

- the direct ray is clear when `a + tan(el)·d_sat/s ≥ h_sat`;
- a specular reflection off the opposite wall exists when its reflection point `a + tan(el)·d_opp/s` is on
  that wall (at or below `h_opp`) and the ray after it clears the satellite-side wall,
  `a + tan(el)·(2·d_opp + d_sat)/s ≥ h_sat`;
- the reflection's excess path is `2·d_opp·cos(el)·s` and its amplitude relative to the direct signal is
  `10^(−loss/20)`, with a phase of `2π·excess/λ + π`.

| State | Code | Carrier | C/N0 |
|---|---|---|---|
| `los` | no multipath | no multipath | open-sky line |
| `los_multipath` | coherent DLL error of one reflection (four-region envelope, Braasch 1996) | `atan2(α sin θ, 1 + α cos θ)·λ/2π` | `+ 10·log10(1 + α² + 2α cos θ)` |
| `nlos` | the whole excess path | the whole excess path | `+ 20·log10(α)` |
| `blocked` | not written | not written | not written |

The DLL error uses an ideal triangular correlation of the code's chip length (293 m at 1.023 Mchip/s,
29.3 m at 10.23 Mchip/s) and the stated early-late spacing. The unit tests check the envelope against a
numerical solution of the discriminator's zero.

**Simplifications (stated, not hidden):** one infinite street with flat vertical walls; no street ends,
diffraction over the roof edge, ground reflection, foliage or diffuse scattering; one reflection per
satellite; Galileo E1 BOC(1,1) treated as a 1.023 Mchip/s BPSK correlation, which over-states its
multipath error.

## The truth file

`kshana.sil-obs-truth/1`, JSON Lines. The first line is a header (schema, `"label": "MODELLED"`, start,
step, seed, the canyon, the method). Every later line is one satellite signal at one epoch: `t`, `sat`,
`signal`, `state`, `el_deg`, `az_deg`, `cn0_dbhz`, `excess_path_m`, `code_multipath_m`,
`carrier_multipath_m`, `code_noise_m`, `carrier_noise_m`, `iono_m`, `tropo_m`, `geometric_range_m`,
`tracked`, `arc_break`. These are the labels a CI test of an NLOS detector or a multipath mitigation
scores against.

## Compare

`compare` reads two RINEX observation files and, without any ephemeris, computes for each: satellites per
epoch (mean, 10th, 50th, 90th percentile); the C/N0 distribution of each system's primary signal (the first
band-1 code with a matching carrier phase); the detrended code-minus-carrier (CMC: code minus carrier
phase in metres, a least-squares line removed per carrier arc of at least ten epochs, which removes the
ambiguity and most of the ionospheric divergence and leaves multipath plus code noise), overall and per
5 dB-Hz C/N0 bin; and carrier-arc breaks per 100 satellite-epochs. The two files are then compared:
two-sample Kolmogorov–Smirnov distances of the C/N0 and |CMC| distributions, differences of the medians
and means, and the ratio of the CMC RMS overall and per C/N0 bin. The document is
`kshana.sil-obs-compare/1` with `"label": "MODELLED"`: a small distance is agreement of these statistics,
not validation of every effect.

## Validating against UrbanNav (procedure; not yet run here)

The UrbanNav dataset (Hong Kong Polytechnic University, `github.com/IPNL-POLYU/UrbanNavDataset`) publishes
RINEX observations of urban drives with a reference trajectory. The dataset is not redistributed here.
The intended comparison:

1. Take one UrbanNav drive's RINEX observation file and the broadcast navigation file of that day (IGS
   BRDC).
2. Describe the drive's street as a `[canyon]` (axis, width and wall heights from the dataset's
   description or a map), the start time and the receiver position from the reference trajectory, and the
   receiver's correlator spacing where known (to confirm per receiver).
3. Run `kshana sil-obs generate` for the same time span and `kshana sil-obs compare <urbannav.obs> <sim.obs>`.
4. Publish the comparison document, the scenario and the dataset version. The model is labelled VALIDATED
   for those statistics only once a comparison is published with a pre-stated acceptance (for example
   `ks_cn0 < 0.2` and a CMC RMS ratio within 0.5 to 2 per C/N0 bin; thresholds to confirm before the run).

A single straight canyon will not reproduce a whole drive through junctions and open squares; the
comparison is meaningful on a segment along one street.

## Tests

`tests/sil_obs.rs`: noise-free open-sky observations from the real 2018-05-13 IGS broadcast file recover
the IGS station ABMF's position within 5 cm and the receiver clock within 5 cm through `pvt::solve_spp`,
single-frequency and ionosphere-free; the same seed gives the same bytes; with noise the error is metres;
the canyon produces NLOS and blocked satellites, the truth file labels them consistently and the NLOS bias
reaches the solution; `compare` separates open sky from the canyon and gives zero distance for a file
against itself; the command line writes and compares. Unit tests in `src/sil_obs.rs` cover the canyon
geometry cases, the DLL envelope (continuity, closed-form regions, a numerical discriminator) and the
jitter formulas.
