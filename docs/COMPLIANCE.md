<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# DO-316 / DO-229E integrity compliance map

This document maps the RTCA (formerly the Radio Technical Commission for Aeronautics) **DO-229E** (SBAS (satellite-based augmentation system) MOPS (minimum operational performance standards)) and **DO-316** (GPS/SBAS (GPS: Global Positioning System) airborne
equipment) protection-level and integrity-monitoring requirements to the Kshana functions that
implement them. It is an **engineering traceability aid**, not a statement that any requirement is
met — Kshana implements the published algorithms; it is not approved avionics.

The machine-readable form is [`sbas::do316_compliance_map`](../src/sbas.rs); this prose is its
companion (mirroring [`docs/ARAIM_REFERENCE.md`](ARAIM_REFERENCE.md)).

## Weighted-least-squares protection levels (DO-229E Appendix J)

For each satellite *i* with elevation `Elᵢ` and azimuth `Azᵢ` at the user, the local-level
(ENU (east-north-up) + clock) observation row is

```
Gᵢ = [ −cos Elᵢ·sin Azᵢ,  −cos Elᵢ·cos Azᵢ,  −sin Elᵢ,  1 ]
```

with weight `wᵢ = 1/σᵢ²`, `σᵢ² = σ_flt² + σ_uire² + σ_air² + σ_tropo²` (the UDRE (user differential range error) /
GIVE (grid ionospheric vertical error) / airborne / troposphere budget). The position covariance is `D = (GᵀWG)⁻¹`; its ENU block gives the horizontal and vertical protection levels (HPL, VPL):

```
d_major = √( (d_E² + d_N²)/2 + √( ((d_E² − d_N²)/2)² + d_EN² ) )
d_U     = √(d_U²)
HPL = K_H · d_major        VPL = K_V · d_U
```

Kshana computes `D` by inverting the 4×4 normal matrix with the same routine the RAIM (receiver autonomous integrity monitoring) stack uses
(`orbit::invert4`), and validates the result two ways (the covariance route `D[2][2]` and the
projection route `Σᵢ S_{U,i}²·σᵢ²` must agree) plus against an independent numpy `inv(GᵀG)`
reference geometry.

## K-factors

| Mode | K_H | K_V | Source |
|---|---|---|---|
| En-route → NPA (non-precision approach; horizontal only) | 6.18 | — | Rayleigh `√(−2·ln 5e-9)` = 6.1829 |
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
engine's independent `timetransfer_adv::iono_delay_m` physics for a range of TEC (total electron content). The noise
amplification for equal-variance inputs is `√(c₁² + c₅²) = 2.588`.

## Validation status

- **In-repo, automated** (every commit): the K-factors against their distributional definitions,
  `γ₁₅` and the ionosphere-free (IF) coefficients against the IS-GPS-705 (IS: Interface
  Specification) frequencies, first-order iono cancellation against the independent delay
  physics, and the weighted-least-squares (WLS) protection levels against a numpy
  `inv(GᵀG)` reference geometry (`sbas::tests::wls_pl_matches_numpy_on_five_satellite_geometry`).
- **External oracle, automated** (`tests/sbas_reference.rs`): given each satellite's
  elevation, azimuth and total 1-σ, `sbas_protection_level` reproduces the HPL of an
  independent implementation, `waasprotlevels()` in the RTKLIB (an open-source real-time
  kinematic positioning library) SBAS protection-level fork `zsiki/rtklib_ws` (Siki &
  Takács 2017), on six epochs that tool computed from **real EGNOS (European Geostationary
  Navigation Overlay Service)** broadcast messages (geostationary PRN (pseudo-random noise
  code number) 120) and real RINEX (Receiver Independent Exchange Format) observations
  from the BUTE station in Budapest (2017-02-19), to **< 2e-3 m**. The oracle rounds
  K_V to 5.33, so the vertical is compared K-factor-free, as `d_U` against its VPL / 5.33.
  ESA (European Space Agency) gLAB v6.0.0 (`core/filter.c`) uses the same formula.
- **Not done**: the per-satellite σ is the oracle's own; modelling σ from raw UDRE/GIVE
  messages is out of scope, and no official published WAAS (Wide Area Augmentation
  System) or EGNOS protection-level product has been reproduced end to end. DO-229E/DO-316
  themselves are RTCA-paywalled; the open derivation source is ESA Navipedia's ICAO/EGNOS
  (ICAO: International Civil Aviation Organization) SBAS pages.
