# ARAIM reference — advanced RAIM protection levels in Kshana

This note documents Kshana's open implementation of **Advanced Receiver Autonomous
Integrity Monitoring (ARAIM)**: the algorithm, every assumption, the integrity
support message it consumes, and the validation status. The implementation lives in
[`src/raim.rs`](../src/raim.rs); this document is the prose companion that an
auditor (or a procurement reviewer) can read alongside the code.

ARAIM is the dual-constellation, multi-frequency successor to classic RAIM that the
GPS–Galileo Working Group C (WG-C) defined to support horizontal and vertical
guidance down to LPV-200. It answers a single question for every epoch:

> How large must the position-error bound (the *protection level*) be so that the
> residual probability of *hazardously misleading information* — an error larger
> than the bound while the bound is still inside the alert limit — stays under the
> integrity risk budget `P_HMI`?

## 1. The integrity support message (ISM)

The ISM is the per-constellation parameter set the user applies. It is modelled
explicitly by [`IntegritySupportMessage`](../src/raim.rs):

| Field | Symbol | Meaning |
|------|--------|---------|
| `sigma_ure_m` | σ_URE / SISE | range-error RMS used for **accuracy and continuity** |
| `sigma_ura_m` | σ_URA / SISA | range-error bound used for **integrity** (≥ σ_URE) |
| `b_nom_m` | b_nom | maximum nominal range bias folded one-sided into the integrity bound |
| `p_sat` | P_sat | prior probability of an undetected single-satellite fault |
| `p_const` | P_const | prior probability of a constellation-wide fault |

`IntegritySupportMessage::gps_galileo_reference()` returns the published WG-C
reference values: **σ_URA = 0.75 m**, **σ_URE = 0.67 m**, **b_nom = 0.75 m**,
**P_sat = 1×10⁻⁵**, **P_const = 1×10⁻⁴** over the exposure interval. These are the
values used to size ARAIM availability in the reference literature; the operational
ISM is broadcast/ground-assembled and is configurable per constellation. The
distinction between σ_URA (integrity) and σ_URE (accuracy) is deliberate and is the
defining feature of the ISM concept.

`.fault_priors()` and `.dual_fault_priors()` hand these straight to the two engines.

## 2. Fault hypotheses

ARAIM is a *multiple hypothesis solution separation* (MHSS) method. For each fault
hypothesis `H_k` it forms the all-in-view solution and the sub-solution that
excludes the faulted set, and bounds the position error under that hypothesis:

- **Fault-free** `H_0` (prior `≈ 1`): the full all-in-view least-squares fix.
- **Single-satellite faults** `H_i` (prior `P_sat` each): every one-satellite
  exclusion sub-solution. This is the classic single-fault ARAIM baseline,
  [`araim_raim`](../src/raim.rs).
- **Constellation-wide faults** `H_c` (prior `P_const` each): the sub-solution that
  removes *all* satellites of one constellation at once, the EU ARAIM TN / DO-316
  extension implemented in [`araim_dual_raim`](../src/raim.rs). With `P_const = 0`
  this reduces **bit-for-bit** to `araim_raim`.

## 3. Protection levels

For each axis (vertical, horizontal) and each hypothesis the engine builds a mode
`(p_fault, threshold, σ)` where the threshold is the solution-separation detection
limit at the false-alert multiplier `K_fa = Φ⁻¹(1 − P_fa / 2N)` (a Bonferroni split
of the continuity budget over the `N` hypotheses). The protection level is the
smallest bound `PL` whose summed integrity risk

```
Σ_k p_fault,k · Q( (PL − b_k − T_k) / σ_k )  ≤  P_HMI
```

meets the allocated budget ([`araim_protection_level`] /
[`araim_integrity_risk`](../src/raim.rs)). VPL and HPL are the vertical and
horizontal answers. The result also reports the integrity risk actually achieved
(`≤` the allocation) and whether a sub-solution separated beyond its threshold.

This is the explicit ARAIM contract — "how large must the bound be?" — rather than
the implicit, geometry-dependent risk of a fixed-multiplier classic RAIM.

## 4. Stanford diagram

[`StanfordDiagram`](../src/raim.rs) accumulates `(error, PL)` per epoch against a
fixed alert limit and [`classify_stanford`](../src/raim.rs) sorts each into
*available*, *system-unavailable* (PL > AL, conservative), *misleading
information* (PL < error ≤ AL) or *hazardously misleading information* (error > AL
and > PL). [`stanford_svg`](../src/raim.rs) renders the classic scatter — the
`PL = error` integrity boundary, the alert-limit guides, and one colour-coded
marker per epoch — as a self-contained SVG.

## 5. The dual-constellation benefit

Two effects are demonstrated in
`raim::tests::dual_constellation_improves_geometry_and_tolerates_a_constellation_fault`:

1. **Geometry / redundancy** — pooling a second constellation's satellites tightens
   the single-fault HPL: more measurements and a larger single-SV sub-solution set
   give a strictly smaller bound.
2. **Constellation-fault tolerance** — with `P_const` active, the dual user stays
   available when a whole constellation can fail (satellites of the *other*
   constellation survive), whereas a single-constellation user provably cannot be
   protected against its own constellation fault (`araim_dual_raim` returns `None`).

A subtlety worth stating honestly: because the constellation-fault hypothesis
requires surviving the loss of an *entire* constellation, the dual-constellation
*snapshot* protection level is bounded below by the residual single-constellation
geometry — it is not automatically smaller than the GPS-only PL at every instant.
The headline EU ARAIM TN result that GPS+Galileo gives a **15–25 % smaller HPL** is
an **availability** result accumulated over realistic constellations and user
locations, not a per-snapshot guarantee.

## 6. Validation status

- **In-repo, automated:** the MHSS algebra (`P_const = 0` ⇒ bit-for-bit
  single-fault; constellation-fault widens the PL; budget never exceeded), the
  geometry and constellation-fault benefits above, and exercise on **real IGS
  precise-orbit (SP3) geometry** (`tests/igs_real_data.rs`), not only synthetic
  constellations.
- **Honest residual (external / founder-gated):** numerically reproducing the EU
  ARAIM Technical Note worked example (Table A-3) and the 15–25 % availability
  figure against a **version-locked real Celestrak TLE snapshot**, and depositing
  the ARAIM test fixtures as a citable **Zenodo** record. Wiring `araim_dual_raim`
  into the scenario-file runner (today the TOML runner uses classic
  solution-separation RAIM) is a further follow-on.

## References

- GPS–Galileo Working Group C, *ARAIM Technical Subgroup Milestone 3 Report* (2016).
- EU–US Cooperation on Satellite Navigation, *ARAIM Technical Note*.
- RTCA DO-316 / DO-229 MOPS; DO-316 ARAIM MASPS material.
- Blanch et al., *Baseline Advanced RAIM User Algorithm and Possible Improvements*,
  IEEE TAES / ION ITM.
- Walter, Enge, Blanch, Pervan, *Worldwide Vertical Guidance of Aircraft Based on
  Modernized GPS and New Integrity Augmentations* (Stanford-diagram methodology).
