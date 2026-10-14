# CRPA antenna gains in the jamming kind: pre-registration

Item CAP-06 (a). Written and committed **before** any of the code below exists and before any
run. The bars may be tightened after a run, never loosened. A miss is recorded in `RESULTS.md`
with its numbers, and its test asserts the recorded miss.

## The change (additive)

An optional `[crpa]` section in a `jamming` scenario:
- `elements_enu_m`: element positions in the receiver's local east-north-up frame, in metres.
  The elements are identical, each with the existing `rx_antenna_gain_db(elevation)` pattern.
- `weighting`: `"null-steering"` or `"mvdr"`.
- `bandwidth_mhz`: the front-end bandwidth for the MVDR noise power. The default is twice the
  chip rate.

Without the section every output is byte-identical (bar A1).

With the section, each tracking channel forms its own beam toward its satellite, with weights
`w` that are distortionless toward the satellite (`wᴴ a_sv = 1`), computed by `crate::crpa`:
- `null-steering`: `null_steering_weights` with the jammer direction as the one null;
- `mvdr`: `mvdr_weights` with `R = σ²I + P_j a_j a_jᴴ`, where `P_j/σ²` is the jammer-to-noise
  ratio per element over `bandwidth_mhz`, from the received jammer power and the noise density
  `kT`.

Steering vectors use the carrier wavelength `c/freq_hz` and the look direction from the existing
`look_angles`. With the output noise scaled by `‖w‖²` and the jammer power by `|wᴴ a_j|²`:

```
cn0_nominal_out = cn0_nominal − 10·log10 ‖w‖²
js_out          = js + 10·log10 |wᴴ a_j|²
cn0_effective   = the existing anti-jam equation on (cn0_nominal_out, js_out, Q, Rc)
```

Each satellite link gains a `crpa` block (`array_noise_gain_db = −10·log10 ‖w‖²`,
`jammer_gain_db = 10·log10 |wᴴ a_j|²`), present only with the section.

## Bars

- **A1 (additivity).**
  - Every `jamming` scenario under `scenarios/`, and every campaign that composes one, gives a
    byte-identical `result.json` with this build as before it.
  - The jamming tests, the registry golden and the cross-platform golden pass unchanged.
- **A2 (one element is no array).** A `[crpa]` section with a single element at the origin, under
  either weighting, gives every satellite link's `js_db`, `cn0_nominal_dbhz` and
  `cn0_effective_dbhz` equal to the run without the section to 1e-12 dB.
- **A3 (independent recomputation).** For a 4-element square array (0.095 m spacing) on the
  `jamming-demo` geometry under both weightings, a numpy script recomputes every link's array
  noise gain, jammer gain and effective C/N0. It is given only:
  - the element positions;
  - the per-link unit look vectors to the satellite and the jammer;
  - the per-link `js_db` and `cn0_nominal_dbhz` without the array, `Q`, `Rc`, the JNR and the
    wavelength.

  It shares no code with `crate::crpa`: numpy builds the steering vectors and uses
  `numpy.linalg.solve` and `inv`. Bar: every link within **1e-9 dB** on the three quantities.
  For null-steering the jammer gain is compared only as `< −200 dB` (a numerical null).
- **A4 (MVDR tends to the null).** On the same geometry, as the jammer's JNR rises to 80 dB, the
  MVDR effective C/N0 of every link is within **0.1 dB** of the null-steering one.

## Out of scope

Mutual coupling, element gain and phase mismatch, wideband (space-time) processing, multiple
jammers, steering-vector estimation error, and any antenna hardware. The jamming kind's other
limits (terrain, AGC, hysteresis) are items (b) and (c).
