<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# DO-316 / DO-229E integrity compliance map

This document maps the RTCA **DO-229E** (SBAS MOPS) and **DO-316** (GPS/SBAS airborne
equipment) protection-level and integrity-monitoring requirements to the Kshana functions that
implement them. It is an **engineering traceability aid**, not a certified conformance
statement — Kshana implements the published algorithms; it is not certified avionics.

The machine-readable form is [`sbas::do316_compliance_map`](../src/sbas.rs); this prose is its
companion (mirroring [`docs/ARAIM_REFERENCE.md`](ARAIM_REFERENCE.md)).

## Weighted-least-squares protection levels (DO-229E Appendix J)

For each satellite *i* with elevation `Elᵢ` and azimuth `Azᵢ` at the user, the local-level
(ENU + clock) observation row is

```
Gᵢ = [ −cos Elᵢ·sin Azᵢ,  −cos Elᵢ·cos Azᵢ,  −sin Elᵢ,  1 ]
```

with weight `wᵢ = 1/σᵢ²`, `σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²` (the UDRE/GIVE/airborne/
tropo budget). The position covariance is `D = (GᵀWG)⁻¹`; its ENU block gives

```
d_major = √( (d_E² + d_N²)/2 + √( ((d_E² − d_N²)/2)² + d_EN² ) )
d_U     = √(d_U²)
HPL = K_H · d_major        VPL = K_V · d_U
```

Kshana computes `D` by inverting the 4×4 normal matrix with the same routine the RAIM stack uses
(`orbit::invert4`), and validates the result two ways (the covariance route `D[2][2]` and the
projection route `Σᵢ S_{U,i}²·σᵢ²` must agree) plus against an independent numpy `inv(GᵀG)`
reference geometry.

## K-factors

| Mode | K_H | K_V | Source |
|---|---|---|---|
| En-route → NPA (horizontal only) | 6.18 | — | Rayleigh `√(−2·ln 5e-9)` = 6.1829 |
| Precision Approach | **6.0** | 5.33 | DO-229E MOPS |

Honesty note: the MOPS uses the rounded horizontal constant **6.0**; the exact two-sided normal
quantile `Φ⁻¹(1 − 1e-9/2)` is **6.109**. Kshana uses the published 6.0 in code and derives
`K_V = Φ⁻¹(1 − 1e-7/2) = 5.327` from the same `raim::normal_quantile` the RAIM stack uses, a
non-circular cross-check (the value rounds to the MOPS 5.33).

## L1/L5 dual-frequency ionosphere-free combination (IS-GPS-705)

With `f₁ = 1575.42 MHz`, `f₅ = 1176.45 MHz`, `γ₁₅ = (f₁/f₅)² = 1.79327`:

```
ρ_IF = (f₁²·ρ₁ − f₅²·ρ₅) / (f₁² − f₅²) = c₁·ρ₁ + c₅·ρ₅
c₁ = +2.260604,  c₅ = −1.260604   (c₁ + c₅ = 1, unit gain)
```

The first-order ionospheric delay (`40.3·10¹⁶·TEC/f²`) cancels exactly — verified against the
engine's independent `timetransfer_adv::iono_delay_m` physics for a range of TEC. The noise
amplification for equal-variance inputs is `√(c₁² + c₅²) = 2.588`.

## Validation status

- **In-repo, automated** (every commit): the K-factors against their distributional definitions,
  `γ₁₅` and the IF coefficients against the IS-GPS-705 frequencies, first-order iono cancellation
  against the independent delay physics, and the WLS protection levels against a numpy `inv(GᵀG)`
  reference geometry.
- **Founder-gated, external**: reproducing a *published* WAAS/EGNOS protection level from a real
  RINEX-OBS + augmentation-message epoch (as RTKLIB `rtkpos` / ESA gLAB do) requires
  Earthdata-authenticated CDDIS data and is tracked as a roadmap item. DO-229E/DO-316 themselves
  are RTCA-paywalled; the open derivation source is ESA Navipedia's ICAO/EGNOS SBAS pages.
