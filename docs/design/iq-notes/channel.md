# Stream 2: propagation channel (`iq::channel`)

Status: built on `claude/gnss-iq-channel`. All submodules are **MODELLED**: each implements a
published model, and its tests check the code against closed forms and the model's own
statistics. None of it is checked against measured channel data.

## What it provides

- `LineOfSight`: elevation, azimuth, range, range rate, receiver latitude, longitude and height.
- `ChannelModel::snapshot(sat, t_s, &LineOfSight) -> ChannelSnapshot`, plus `ChannelEffect`
  (edits a snapshot in place) and `Composite` (geometric direct path on one carrier, then
  effects in order). Atmospheric effects apply to every path. Reflection effects copy the
  direct path as it is when they run, so put them last if the reflections should carry the
  atmosphere too. Carrier phase stays unwrapped.
- `iono::Ionosphere`: group delay `+I`, carrier phase advance `-I`. The source is the engine's
  Klobuchar (`gnss_sim::klobuchar_delay_m`, scaled `(f_L1/f)²`), a vertical TEC through the
  thin-shell `ionex::slant_tec`, or a fixed slant TEC. TEC is converted with
  `timetransfer_adv::iono_delay_m` (40.3·TEC/f²).
- `tropo::Troposphere`: the engine's `gnss_sim::tropo_delay_m` (Saastamoinen + Niell), applied as
  equal group and phase delay.
- `scint::Scintillation`: the Cornell scintillation model (Humphreys et al. 2009, 2010).
  Amplitude is Rice-distributed: `z = ẑ + ξ`, with `ξ` a complex Gaussian through a
  2nd-order Butterworth filter, diffuse power `P = 1 − √(1−S4²)`, and `ωn = 1.2396464·√2/τ0`.
  τ0 is the 1/e lag of the autocorrelation of `ξ`. The filter is discretised exactly, so the
  statistics do not depend on the update interval. There is an optional extra phase term
  (σ, same τ0) that is outside the Cornell model and off by default. Each satellite gets its
  own ChaCha8 stream.
- `multipath::GroundReflector`: one specular reflection off a ground plane. Excess path is
  `2h·sin(el)`. Fresnel `Γh`, `Γv` use the complex permittivity `εr − j60λσ`, with RHCP
  co-polar and cross-polar combinations. Ground presets are representative and illustrative.
  Extra Doppler is the rate of the excess phase between updates.
- `land_mobile::LandMobile`: a three-state (LOS, shadowed, blocked) discrete-time Markov chain
  with Loo fading (log-normal direct path plus a Rayleigh diffuse path), in the style of
  ITU-R P.681 / Fontán 2001. The blocked state sets the direct amplitude to 0 and keeps the
  diffuse path, so `is_nlos()` is true. The default parameters are illustrative and do not
  come from a P.681 table.

## Tests (`cargo test --lib iq::channel`, `cargo test --test iq_channel`)

- Iono: 1 TECU = 0.162 m at L1 (Misra & Enge). Code and carrier diverge by `±I`, matching the
  closed form. The Klobuchar source matches the engine function bit for bit and scales
  `(f1/f2)²`. The VTEC source matches the closed-form thin-shell factor.
- Tropo: equals the engine function. Group and phase delays are equal.
- Scintillation: the Butterworth 1/e constant solves `e^{-x}(cos x + sin x) = 1/e`. The Rice
  `P(2−P) = S4²` closed form holds. Sample S4 of 400 000 samples (about 10⁵ τ0) is within
  4 % of the target for S4 = 0.3, 0.6 and 0.9. The measured 1/e decorrelation lag is within
  5 % of τ0. Output is bit-identical per seed and does not depend on the order satellites
  are queried in. The extra phase σ is within 4 %.
- Multipath: excess delay equals `2h·sin(el)/c`. Lossless normal incidence gives `∓1/3` for
  εr = 4. Grazing incidence tends to −1. The Brewster null holds. The result agrees with an
  independent Snell-law form of the Fresnel equations. Phase and amplitude follow Γ, and the
  extra Doppler equals the excess-phase rate.
- Land mobile: π solves `πP = π` (checked against power iteration). Occupancy over 10⁶ steps
  is within 0.015 of π. The blocked state gives `is_nlos()` and a zero direct path. Loo α, ψ
  and MP are recovered. Output is bit-identical per seed.
- Integration (`tests/iq_channel.rs`): a dual-frequency chain stays consistent with a
  first-order ionosphere, reflections inherit the atmosphere, and the scintillated chain is
  deterministic per seed.

## Limitations

- Ionosphere is first order only. It has no higher-order terms and no bending, and its rate
  is not put into `extra_doppler_hz`.
- Scintillation parameters are per carrier and are not scaled across frequencies. In the
  Cornell model, phase scintillation is tied to S4. Independent σφ comes only from the
  optional extension.
- Ground reflector: one flat smooth plane, no roughness or diffraction, and a scalar antenna
  gain.
- Land mobile: fast fading is redrawn independently each step (no Doppler spectrum). The
  transitions run on time, not distance. One diffuse path stands for the multipath cluster.
- Every model keeps per-satellite state and expects non-decreasing time per satellite.

## Entries for integration to merge

### CHANGELOG.md (Unreleased → Added)

- `iq::channel`: propagation channel models producing `ChannelSnapshot`s. Included: the
  `ChannelModel` trait and `Composite` chain, a first-order ionosphere (Klobuchar or TEC) with
  code-carrier divergence, troposphere (Saastamoinen + Niell, reused), Cornell-model
  scintillation (seeded), a specular ground reflector with Fresnel coefficients, and a
  three-state Loo land-mobile channel (ITU-R P.681 style). All are MODELLED.

### docs/VALIDATION.md

| Claim | Reference | Test | Label |
|---|---|---|---|
| Iono delay 0.162 m/TECU at L1; code +I, carrier −I | Misra & Enge §5.3.2 closed form | `iq::channel::iono::tests::*` | MODELLED (closed form) |
| Cornell scintillation S4 and τ0 | Humphreys et al. 2009/2010; Rice closed form | `iq::channel::scint::tests::*` | MODELLED (statistical) |
| Ground-reflection excess delay and Fresnel Γ | Image geometry; Fresnel/Snell closed forms | `iq::channel::multipath::tests::*` | MODELLED (closed form) |
| LMS Markov occupancy and Loo parameters | Markov stationary distribution; Loo 1985 | `iq::channel::land_mobile::tests::*` | MODELLED (statistical) |
