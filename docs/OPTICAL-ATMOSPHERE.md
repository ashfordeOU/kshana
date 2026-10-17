<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Optical PNT through the atmosphere

The `optical-atmosphere` scenario kind answers how often an optical link to the ground works, why
it fails, what margin or technique would help, and what a clock does while it is down.

Kshana is the analysis side only. It does not run an optical-ground-station experiment, and it
names no measurement partner. The kind is **MODELLED**: its numerics are checked against an
independent program, but no measured availability record has been compared, and every weather,
technique and clock input is an assumption. It is an advisory analysis, not a certified
availability, integrity or navigation product.

```sh
kshana scenarios/optical-atmosphere-network.toml
kshana scenarios/optical-atmosphere-techniques.toml
```

Both bundled scenarios carry ILLUSTRATIVE cloud climates. They are inputs, not measurements and
not any dataset's values.

## What is computed

1. **Clear-air loss** at the wavelength and elevation: aerosol extinction from the Kim, McArthur
   and Korevaar visibility law, exponential in height, plus Rayleigh scattering and a stated
   gas-absorption input. This replaces the single lumped `atmospheric_loss_db` of
   `optical_linkbudget` when an atmosphere is supplied. Without one, the link budget is
   bit-identical to 0.36 (pre-registered bar A5).
2. **Turbulence.** A Hufnagel–Valley `Cn²` profile (HV 5/7 by default) integrated along the slant
   path gives the plane- or spherical-wave Rytov variance, uplink or downlink. From it come the
   Andrews–Phillips scintillation index, the gamma-gamma parameters, the weak-turbulence
   aperture-averaging factor (Churnside) and the gamma-gamma fade probability and fade margin.
   Aperture averaging is applied by moment matching: the scintillation index is scaled by the
   averaging factor and both log variances are rescaled to give it exactly.
3. **Cloud.** A site's cloud climate is the ITU-R P.840 form: a probability of cloud and, given
   cloud, a log-normal liquid-water column. P.840 supplies the amount of cloud. The attenuation is
   the geometric-optics optical depth `τ = 3L/(2 ρ_w r_e)`, because P.840's own attenuation law is
   a microwave law and does not apply at 0.85 to 1.55 µm, where droplets are far larger than the
   wavelength.
4. **Availability** of a site: the link is up while the cloud and turbulence fades together stay
   inside the margin left after the clear-air loss. Cloud and turbulence are taken as
   independent. The report gives the availability, the clear-sky availability, the **ceiling** no
   margin can lift (an optical link cannot pass thick cloud), and the extra margin needed for each
   target availability, or `null` if the target is above the ceiling.
5. **Outages.** Durations are log-normal with a stated mean and spread. The report gives the
   outages per year, the duration at the median, 90th and 99th percentile, and the probability and
   share of outage time beyond 1, 6, 24 and 72 hours.
6. **Site diversity.** The best `N` sites combined with independent weather (`1 − Π(1−a_i)`) and
   with distance-correlated weather: pair correlation `exp(−d/d₀)`, combined in a one-factor
   Gaussian copula. At `d₀ → 0` it is the independent union, and at full correlation the best
   single site.
7. **Techniques.** Each `[[technique]]` is a what-if: a new wavelength (the clear-sky budget, the
   clear-air loss and the aperture averaging are re-evaluated), a new receive aperture, a stated
   fractional scintillation reduction (adaptive optics) and extra margin. The result is the
   availability gain over the baseline at the same site. Kshana does not model an adaptive-optics
   loop, so the gains are inputs.
8. **Timing and ranging through an outage.** Each outage duration is mapped through the closed-form
   coast variance of the clock holdover model, for the clocks listed in `[clock]`. The report gives
   the timing and ranging error at stated outage durations, the holdover to the timing threshold,
   the share of outages inside it, and the timing availability
   `A + U·E[min(D, T_h)]/E[D]`. The class power-law floors are the holdover module's synthesised
   ones, so a tight threshold is governed by that assumed floor, as `holdover.rs` states.

## Scenario fields

All top-level fields are optional. A bare `kind = "optical-atmosphere"` runs three illustrative
sites. See the two bundled files for every key: `wavelength_nm`, `elevation_deg`,
`availability_targets_pct`, `[link]`, `[atmosphere]`, `[network]`, `[clock]`, `[[site]]`,
`[[technique]]`.

## Verification status

| Claim | Status | Evidence |
|---|---|---|
| Rytov variance, scintillation index, gamma-gamma fade probability, aperture-averaging factor, cloud and clear-air optical depth are computed as the stated formulas say | MODELLED row; numerics checked against an independent mpmath program | bars A1 to A3, all met (`xval/optical-atmosphere/RESULTS.md`) |
| Link budget and existing availability unchanged without an atmosphere | met | bar A5, bit-identical over 1,000 parameter sets |
| Diversity limits and monotonicity; holdover coupling bit-exact | met (identities) | bars A4, A6 |
| Availability of a real site, real scintillation, real cloud statistics | **not claimed** | no external oracle was compared |

The oracle checks the implementation of the stated formulas, not the atmosphere, so no row is
VALIDATED. ITU-R validation values are not used and are kept out of the repository.

## Data

No weather dataset is bundled. Cloud-climate inputs for a real site would come from a public
dataset (Copernicus ERA5, NASA MODIS or ISCCP); each dataset's licence has to be read and
recorded before use, and raw data fetched at test time with a pinned SHA-256. The one climatology
already in the repository is the Cavazzani et al. clear-night table used by `optical_availability`.

## References

- Andrews and Phillips, *Laser Beam Propagation through Random Media*, 2nd ed. (Rytov variance,
  scintillation index, gamma-gamma parameters).
- Kim, McArthur and Korevaar, *Comparison of laser beam propagation at 785 nm and 1550 nm in
  fog and haze for optical wireless communications*, Proc. SPIE 4214 (2001) (visibility law).
- Churnside, *Aperture averaging of optical scintillations in the turbulent atmosphere*, Appl. Opt.
  30 (1991) (aperture-averaging factor).
- ITU-R P.840 (cloud liquid-water statistics), P.1814 and P.1817 (free-space-optics methods).
