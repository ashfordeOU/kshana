# LEO navigation message

The `leo-navmsg` scenario kind builds the broadcast ephemeris and clock message of a low
Earth orbit (LEO) positioning, navigation and timing (PNT) satellite, and answers the
questions a message designer asks: how long can one message cover, what does each extra
parameter buy, what does a user see when the message changes in the middle of a pass,
and how many bits does it take to carry it to the centimetre.

It is system-agnostic. Any orbit, any carrier and any of four ephemeris models run with
no preset at all; the named presets are optional data (see [Presets](#presets)).

Run the bundled examples with `kshana example leo-navmsg-fit-interval-trade`,
`leo-navmsg-model-comparison`, `leo-navmsg-midpass-update` and
`leo-navmsg-encode-decode`.

Code: `src/leo_navmsg/` — `elements.rs` (records and user algorithm), `truth.rs` (truth
orbit and clock), `fit.rs` (fitter), `sisre.rs` (signal-in-space range error),
`services.rs` (ionosphere and Coordinated Universal Time (UTC)), `codec.rs` (binary format), `text.rs` (Receiver
Independent Exchange Format (RINEX)-style and comma-separated values (CSV) exports), `presets/` (one file per preset), `mod.rs` (the kind).

## What a message carries

| Part | Content |
|---|---|
| Auxiliary | space-vehicle identifier (SVID), issue of data (IOD), band identifier, signal health status (Galileo convention: 0 OK, 1 out of service, 2 extended operations, 3 in test) |
| Synchronisation | week number, time of week (TOW) of transmission, and a second-order clock polynomial `af0 + af1·(t − toc) + af2·(t − toc)²` |
| Ephemeris | one of the four models below |
| Other services | a Klobuchar broadcast ionospheric set, Galileo NeQuick-G coefficients `ai0, ai1, ai2` with five storm flags, and system-time-to-UTC parameters `A0, A1, ΔtLS, t0t, WNot, WNLSF, DN, ΔtLSF` |

### Ephemeris models

| Code | Model | Parameters |
|---|---|---|
| `kepler16` | the Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) Keplerian set: `√A, e, i0, Ω0, ω, M0, Δn, Ω̇, i̇, Cuc, Cus, Crc, Crs, Cic, Cis, toe` | 16 |
| `kepler-rac` | the same, plus along-track, cross-track and radial (RAC) correction polynomials `a0…`, `c0…`, `r0…` in `τ = tk / tau_s`, coefficients in metres, `tau_s` the power of two at or above half the fit interval (transmitted), degrees set by `rac_degrees` (default 7, 5, 6) | 16 + 21 by default, plus the time scale |
| `liu22` | the 22-parameter model of Liu, Su, Xie, Zhou and Qu (2025, *Remote Sensing* 17(16):2894, doi [10.3390/rs17162894](https://doi.org/10.3390/rs17162894)): the 16 plus `ȧ, ṅ, Crs3, Crc3, Crs1, Crc1` | 22 |
| `ecef-poly` | the ATOMIC "zero-clock" model: an Earth-centred Earth-fixed (ECEF) polynomial per axis in `τ = (t − t_ref) / 64 s` (default degree 6), no clock terms because the satellite clock is steered to system time ([InsideGNSS](https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/)) | 22 by default |

The user algorithm (`elements::sat_state`) is the Galileo ICD sequence (Kepler's
equation, second-harmonic corrections, Earth-fixed node) followed, for `kepler-rac`, by
the three polynomials along the Keplerian orbit's own frame: radial along the evaluated
position, cross-track along the orbit normal from the corrected inclination and node,
along-track completing the triad. The clock adds the ICD relativistic term
`F·e·√A·sin E`; for `ecef-poly` it is the general form `−2 r·v / c²` from the polynomial
and its derivative.

Three readings are Kshana's own and are stated as such:

- The RAC frame and the `τ = tk / tau_s` normalisation. No public document defines a LEO
  correction frame for a broadcast message.
- The Liu et al. terms. The paper's full text was not accessible, so Kshana evaluates
  `A = A0 + ȧ·tk`, `n = n0 + Δn + ½·ṅ·tk` (the Global Positioning System (GPS) civil-navigation convention) and adds
  `Crs1·sin Φ + Crc1·cos Φ + Crs3·sin 3Φ + Crc3·cos 3Φ` to the radius, `Φ` the argument
  of latitude.
- A zero-clock message's clock is zero in total: the steering loop is taken to hold the
  apparent clock, relativistic term included, to system time.

## The fitter

`truth.rs` integrates the orbit with a fixed-step fourth-order Runge–Kutta in a frame
that turns into Earth-fixed axes by one rotation, `θ(t) = θ0 + Ω̇e·t`, the same single
rotation a broadcast user algorithm applies. Gravity is two-body (`gravity_degree = 0`),
the zonal harmonics J2 to J6 (2 to 6), or the EGM2008 field to degree and order 7 to 70,
whose tesseral terms carry the short-period signature that makes a LEO fit hard. Drag is
optional (static exponential density). The clock is free-running (bias, drift, drift
rate and white frequency noise at a stated one-second Allan deviation, plus the periodic
relativistic term) or steered (a first-order Gauss–Markov residual).

`fit.rs` fits the Keplerian set with Levenberg–Marquardt on non-singular elements
(`e·cos ω`, `e·sin ω`, `λ0 = M0 + ω`): a LEO orbit is almost circular, so `ω` and `M0`
alone are nearly indistinguishable. It starts from the osculating state at `toe` with
the J2 node rate. Weak zero-centred priors bound the rates and harmonics that a short
arc cannot resolve; with a 1 cm observation weight they act only in those null
directions. The RAC polynomials are then fitted to the along/cross/radial residuals by
linear least squares, and the clock polynomial to the truth clock minus the relativistic
term the user will add back.

A finding the defaults encode: after a least-squares Keplerian fit, the residual is by
construction what the 16 parameters cannot span, so it oscillates across the window
(several zero crossings in each component) rather than drifting. A correction polynomial
removes it only when its degree exceeds what the Keplerian set already spans: along-track
7, cross-track 5 and radial 6 take a 15-minute residual of centimetres to about a
millimetre, while lower cross-track degrees remove almost nothing (the cross-track
residual is odd about the window centre). A system that derives its Keplerian part some
other way leaves a residual of a different shape, and the degrees it needs follow from
that. The Celeste preset's own correction degrees (lower than these; they live only in the
preset file, `src/celeste_iod.rs`) run here on Kshana's least-squares base, which
is why its cross-track terms contribute little in this engine: a statement about Kshana's
fitter, not about any real system. `toe` and `toc` are whole seconds, as the binary format
carries them.

Each message is used over a period centred in its fit window (the first trade table uses
the whole window). What the signal-in-space range error (SISRE) figures measure is the **representation error** of the
message against the truth it was fitted to. The error of orbit determination and orbit
prediction, which a real ground or on-board segment adds on top, is not modelled.

## Signal-in-space range error

`sisre.rs` uses the global-average SISRE of Montenbruck, Steigenberger and Hauschild
(2018, *Advances in Space Research* 61(12):3020–3038,
doi [10.1016/j.asr.2018.03.041](https://doi.org/10.1016/j.asr.2018.03.041)):

    SISRE_orb = sqrt( w_R² R² + w_AC² (A² + C²) )
    SISRE     = sqrt( (w_R R − c·dT)² + w_AC² (A² + C²) )

The weights are the averages over users spread uniformly on the visible Earth cap of
`cos² η` and `½ sin² η`, with `η` the nadir angle of the line of sight at the satellite,
computed for the orbit's own radius and elevation mask. At a 0° mask the computation
reproduces the paper's table for medium Earth orbit (GPS 0.98 and 1/49, GLONASS 1/45,
Galileo 1/61, BeiDou 1/54) and geostationary orbit (0.99 and 1/126): that is the
**VALIDATED** check. At LEO the same average gives

| Altitude | `w_R` | `1 / w_AC²` | horizon nadir angle |
|---|---|---|---|
| 320 km | 0.384 | 2.35 | 72.2° |
| 510 km | 0.459 | 2.53 | 67.8° |
| 550 km | 0.472 | 2.57 | 67.0° |
| 786 km | 0.536 | 2.81 | 62.9° |
| 1080 km | 0.597 | 3.11 | 58.8° |
| 1336 km | 0.638 | 3.37 | 55.8° |

so a LEO user, who sees the satellite far from nadir, feels along- and cross-track
errors much more than a medium-orbit user does.

## Analyses

`analysis = [...]` picks any of the four (default all).

### Fit-interval trade

`[trade]` sets the span, the fit intervals, the update periods and the models.
`scenarios/leo-navmsg-fit-interval-trade.toml` (550 km, 97.6°, EGM2008 to degree 20
and drag, 30 minutes of messages) gives, with the usage period equal to the fit
interval:

| Model | Fit interval | SISRE orbit RMS | SISRE orbit max | SISRE with clock RMS | radial / along / cross RMS |
|---|---|---|---|---|---|
| `kepler16` | 60 s | 0.041 cm | 0.179 cm | 0.069 cm | 0.09 / 0.01 / 0.00 cm |
| `kepler16` | 120 s | 0.032 cm | 0.160 cm | 0.079 cm | 0.06 / 0.01 / 0.01 cm |
| `kepler16` | 180 s | 0.093 cm | 0.540 cm | 0.134 cm | 0.18 / 0.06 / 0.00 cm |
| `kepler16` | 300 s | 0.310 cm | 1.033 cm | 0.329 cm | 0.09 / 0.49 / 0.02 cm |
| `kepler16` | 450 s | 1.690 cm | 7.542 cm | 1.696 cm | 0.72 / 2.65 / 0.04 cm |
| `kepler16` | 600 s | 2.875 cm | 10.219 cm | 2.866 cm | 1.72 / 4.42 / 0.26 cm |
| `kepler16` | 900 s | 9.345 cm | 34.032 cm | 9.349 cm | 6.46 / 14.14 / 0.91 cm |
| `kepler-rac` | 60 s | 0.000 cm | 0.000 cm | 0.057 cm | 0.00 / 0.00 / 0.00 cm |
| `kepler-rac` | 120 s | 0.000 cm | 0.000 cm | 0.074 cm | 0.00 / 0.00 / 0.00 cm |
| `kepler-rac` | 180 s | 0.000 cm | 0.001 cm | 0.090 cm | 0.00 / 0.00 / 0.00 cm |
| `kepler-rac` | 300 s | 0.004 cm | 0.014 cm | 0.106 cm | 0.00 / 0.00 / 0.01 cm |
| `kepler-rac` | 450 s | 0.037 cm | 0.176 cm | 0.127 cm | 0.05 / 0.01 / 0.04 cm |
| `kepler-rac` | 600 s | 0.214 cm | 0.643 cm | 0.229 cm | 0.28 / 0.09 / 0.26 cm |
| `kepler-rac` | 900 s | 1.015 cm | 3.695 cm | 1.062 cm | 1.52 / 0.70 / 0.91 cm |

And with a 300 s fit, varying how often a new message takes over:

| Model | Update period | SISRE orbit RMS | SISRE orbit max |
|---|---|---|---|
| `kepler16` | 30 s | 0.314 cm | 0.850 cm |
| `kepler16` | 60 s | 0.288 cm | 0.859 cm |
| `kepler16` | 150 s | 0.219 cm | 0.830 cm |
| `kepler16` | 300 s | 0.310 cm | 1.033 cm |
| `kepler-rac` | 30 s | 0.004 cm | 0.009 cm |
| `kepler-rac` | 60 s | 0.004 cm | 0.009 cm |
| `kepler-rac` | 150 s | 0.004 cm | 0.010 cm |
| `kepler-rac` | 300 s | 0.004 cm | 0.014 cm |

The 16-parameter Keplerian set degrades from 0.04 cm at 60 s to 9.35 cm at 900 s: one Keplerian set with twice-per-revolution harmonics cannot follow the higher-frequency gravity terms and the drag of a LEO arc for more than a few minutes, and its least-squares residual oscillates across the window. The along/cross/radial polynomials (degrees 7, 5, 6) absorb what is left: 1.01 cm at 900 s, 0.21 cm at 600 s. At the shortest intervals the Keplerian figures are sub-millimetre and no longer strictly ordered (the fit is then limited by conditioning, not by the model).

### Model comparison

`scenarios/leo-navmsg-model-comparison.toml` runs the four models at 1, 5 and 10 minutes
on the same orbit, with the number of parameters and the ephemeris-and-clock bits in
Kshana's encoding:

| Model | Fit interval | Parameters | Ephemeris + clock bits | SISRE orbit RMS | SISRE with clock RMS |
|---|---|---|---|---|---|
| `kepler16` | 60 s | 16 | 570 | 0.022 cm | 0.049 cm |
| `kepler16` | 300 s | 16 | 570 | 0.230 cm | 0.260 cm |
| `kepler16` | 600 s | 16 | 570 | 3.061 cm | 3.071 cm |
| `kepler-rac` | 60 s | 37 | 1045 | 0.000 cm | 0.044 cm |
| `kepler-rac` | 300 s | 37 | 1045 | 0.005 cm | 0.120 cm |
| `kepler-rac` | 600 s | 37 | 1045 | 0.160 cm | 0.208 cm |
| `liu22` | 60 s | 22 | 730 | 0.011 cm | 0.046 cm |
| `liu22` | 300 s | 22 | 730 | 0.068 cm | 0.139 cm |
| `liu22` | 600 s | 22 | 730 | 0.269 cm | 0.299 cm |
| `ecef-poly` (zero clock) | 60 s | 22 | 750 | 0.000 cm | 28.784 cm |
| `ecef-poly` (zero clock) | 300 s | 22 | 750 | 0.005 cm | 28.784 cm |
| `ecef-poly` (zero clock) | 600 s | 22 | 750 | 0.561 cm | 28.774 cm |

The zero-clock row is scored against a clock steered with a 0.24 m residual (the ATOMIC
figure), the others against the free-running clock they fit.

**Liu et al. 2025, SISRE versus altitude (MODELLED).** The same scenario fits Kshana's
22-parameter model over 20-minute arcs at the five altitudes of the paper, at each
satellite's inclination:

| Satellite | Altitude | Inclination | Liu et al. 2025 | Kshana (orbit-only RMS) | ratio |
|---|---|---|---|---|---|
| GRACE-A | 320 km | 89.00° | 8.88 cm | 5.40 cm | 0.61 |
| GRACE-C | 475 km | 89.00° | 6.21 cm | 4.12 cm | 0.66 |
| Sentinel-2A | 786 km | 98.57° | 2.87 cm | 2.95 cm | 1.03 |
| HY-2A | 966 km | 99.34° | 2.11 cm | 2.38 cm | 1.13 |
| Sentinel-6A | 1336 km | 66.04° | 0.75 cm | 0.70 cm | 0.94 |

This is **not** a validation. The paper fitted real precise science orbits of the named
satellites (with their full gravity, drag and non-gravitational history); Kshana fits its
own integrated orbit, reads the six added parameters as described above, and uses its
own SISRE weights. The comparison shows the trend and the order of magnitude.

### Mid-pass update

`[midpass]` places a user (default 45° N, 10° E), finds the highest pass above the mask
within `search_s`, and schedules messages every `update_period_s`. At each switch inside
the pass it reports the position jump, the clock jump, the user's pseudorange jump (new
message minus old), the largest jump any visible user could see (closed form over the
nadir cone), the range error before and after, and PASS or FAIL against `threshold_m`.
`scenarios/leo-navmsg-midpass-update.toml` (300 s fits updated every 150 s):

The highest pass in a day reaches 43.7° and lasts 455 s. Its switches:

| Switch | Elevation | Position jump | Clock jump | User range jump | Worst-geometry jump |
|---|---|---|---|---|---|
| IOD 270 → 271 | 12.7° | 0.07 mm | 0.19 mm | -0.17 mm | 0.27 mm |
| IOD 271 → 272 | 37.4° | 0.14 mm | 0.14 mm | -0.24 mm | 0.27 mm |
| IOD 272 → 273 | 28.2° | 0.27 mm | -0.22 mm | 0.35 mm | 0.48 mm |

Largest user range jump 0.35 mm against a 5 cm threshold: **PASS**.

### Encode and decode

`scenarios/leo-navmsg-encode-decode.toml` encodes the first of three messages, decodes
it, checks the CRC and rejects a corrupted copy, prints the quantisation budget, and
writes and reads back the RINEX-style block and the CSV table:

- frame: 171 bytes (1310 payload bits, of which 1045 are ephemeris and clock), CRC-24Q `0x19105F`;
- largest half-step effect of any single field: `af0`, 0.545 mm;
- whole message after quantisation: position within 1.126 mm and clock within 0.185 mm of the exact message; SISRE 0.113 cm exact, 0.129 cm decoded;
- a frame with one flipped bit is rejected: true;
- RINEX-style round trip within 5.0e-06 m, CSV round trip within 0.0e+00 m.

## Platform independence

A frame is transmitted integers, so it has to be the same integers wherever and however
the scenario runs: the native binary on any operating system, a debug or a release
build, and the WebAssembly (WASM) build in a browser. Three things stood in the way.
The sine, cosine, arctangent and exponential of a host's mathematics library are not
required to be correctly rounded and differ between hosts in the last place. An optimised
build on macOS takes a sine and a cosine of one argument from the system's combined
routine, which does not always return the lone sine's value, so a debug and a release
build differed too. And the usual normal sampler calls the host exponential and logarithm
in its rare branches. The fit turns a difference that small into different quantised
fields. The whole kind (truth orbit and clock, fit, user algorithm, signal-in-space range
error (SISRE), codec) therefore computes every such function with the pure-Rust `libm`
crate through `src/portable_math.rs`, integer powers as explicit products, and normal
deviates by the polar method on the generator's raw output.
`leo_navmsg::tests::the_encoded_frame_is_the_same_bytes_on_every_platform` pins the
171-byte frame of the encode-and-decode scenario below and one check value per ephemeris
model; a debug build, a release build and the WASM build give byte-identical result
documents for all five bundled `leo-navmsg` scenarios.

## Binary format

**This is Kshana's own documented encoding.** It carries the components the published
descriptions of LEO navigation messages name, modelled on the Galileo ICD field set. It
is **not** the bit layout of Celeste or of any other system: none is public.

Frame: preamble `0xA7` (8 bits), version 1 (4), model (4: 1 `kepler16`, 2
`kepler-rac`, 3 `liu22`, 4 `ecef-poly`), payload length in bytes (12), payload
zero-padded to a byte, CRC-24Q (a 24-bit cyclic redundancy check, 24 bits) over every
preceding byte. CRC-24Q is the check of the Radio Technical Commission for Maritime
Services standard RTCM 10403 and the Galileo ICD (polynomial `0x1864CFB`, initial value 0); the code
reproduces the catalogue check value `0xCDE703` for `123456789` and the check bytes of
the RTCM 10403 message-type 1005 example frame (**VALIDATED**).

The Galileo ICD steps were chosen for medium Earth orbit and are too coarse for a
centimetre-level LEO message: `Crs` in steps of 2⁻⁵ m (3.1 cm), `Cuc` 2⁻²⁹ rad (1.3 cm at
LEO radius), the angles 2⁻³¹ semicircles (1.0 cm) and `af0` 2⁻³⁴ s (1.7 cm). Kshana
keeps the ICD units and the semicircle convention, refines the steps so that every
field's half-step error stays below 1 mm of position or range over a 15-minute window,
and widens the fields to keep the ranges a LEO fit needs:

| Block | Field | Bits | Step | Unit |
|---|---|---|---|---|
| auxiliary and synchronisation | `SVID` | 8 | 1 | - |
| auxiliary and synchronisation | `IOD` | 10 | 1 | - |
| auxiliary and synchronisation | `Band` | 4 | 1 | - |
| auxiliary and synchronisation | `Health` | 2 | 1 | - |
| auxiliary and synchronisation | `WeekNumber` | 13 | 1 | week |
| auxiliary and synchronisation | `ToW` | 20 | 1 | s |
| auxiliary and synchronisation | `Flags` | 4 | 1 | - |
| clock (flag bit 0) | `toc` | 20 | 1 | s |
| clock (flag bit 0) | `af0` | 34 | 2^-38 | s |
| clock (flag bit 0) | `af1` | 28 | 2^-50 | s/s |
| clock (flag bit 0) | `af2` | 20 | 2^-62 | s/s^2 |
| Keplerian (models 1-3) | `toe` | 20 | 1 | s |
| Keplerian (models 1-3) | `M0` | 36 | 2^-35 | semicircle |
| Keplerian (models 1-3) | `e` | 32 | 2^-33 | - |
| Keplerian (models 1-3) | `sqrtA` | 36 | 2^-23 | m^0.5 |
| Keplerian (models 1-3) | `Omega0` | 36 | 2^-35 | semicircle |
| Keplerian (models 1-3) | `i0` | 36 | 2^-35 | semicircle |
| Keplerian (models 1-3) | `omega` | 36 | 2^-35 | semicircle |
| Keplerian (models 1-3) | `deltaN` | 29 | 2^-43 | semicircle/s |
| Keplerian (models 1-3) | `OmegaDot` | 29 | 2^-43 | semicircle/s |
| Keplerian (models 1-3) | `iDot` | 22 | 2^-43 | semicircle/s |
| Keplerian (models 1-3) | `Cuc` | 26 | 2^-34 | rad |
| Keplerian (models 1-3) | `Cus` | 26 | 2^-34 | rad |
| Keplerian (models 1-3) | `Crc` | 26 | 2^-10 | m |
| Keplerian (models 1-3) | `Crs` | 26 | 2^-10 | m |
| Keplerian (models 1-3) | `Cic` | 26 | 2^-34 | rad |
| Keplerian (models 1-3) | `Cis` | 26 | 2^-34 | rad |
| along/cross/radial corrections (model 2) | `degA` | 3 | 1 | - |
| along/cross/radial corrections (model 2) | `degC` | 3 | 1 | - |
| along/cross/radial corrections (model 2) | `degR` | 3 | 1 | - |
| along/cross/radial corrections (model 2) | `racTauExp` | 4 | 1 | log2(s) |
| along/cross/radial corrections (model 2) | `a_k, c_k, r_k` | 22 | 2^-14 | m |
| Liu et al. 2025 extras (model 3) | `aDot` | 26 | 2^-20 | m/s |
| Liu et al. 2025 extras (model 3) | `nDot` | 30 | 2^-60 | semicircle/s^2 |
| Liu et al. 2025 extras (model 3) | `Crs3` | 26 | 2^-10 | m |
| Liu et al. 2025 extras (model 3) | `Crc3` | 26 | 2^-10 | m |
| Liu et al. 2025 extras (model 3) | `Crs1` | 26 | 2^-10 | m |
| Liu et al. 2025 extras (model 3) | `Crc1` | 26 | 2^-10 | m |
| ECEF polynomial (model 4) | `tref` | 20 | 1 | s |
| ECEF polynomial (model 4) | `degP` | 4 | 1 | - |
| ECEF polynomial (model 4) | `x0, y0, z0` | 38 | 2^-11 | m |
| ECEF polynomial (model 4) | `x_k, y_k, z_k (k >= 1)` | 34 | 2^-12 | m |
| Klobuchar (flag bit 1) | `alpha0` | 8 | 2^-30 | s |
| Klobuchar (flag bit 1) | `alpha1` | 8 | 2^-27 | s/semicircle |
| Klobuchar (flag bit 1) | `alpha2` | 8 | 2^-24 | s/semicircle^2 |
| Klobuchar (flag bit 1) | `alpha3` | 8 | 2^-24 | s/semicircle^3 |
| Klobuchar (flag bit 1) | `beta0` | 8 | 2^11 | s |
| Klobuchar (flag bit 1) | `beta1` | 8 | 2^14 | s/semicircle |
| Klobuchar (flag bit 1) | `beta2` | 8 | 2^16 | s/semicircle^2 |
| Klobuchar (flag bit 1) | `beta3` | 8 | 2^16 | s/semicircle^3 |
| NeQuick-G (flag bit 2) | `ai0` | 11 | 2^-2 | sfu |
| NeQuick-G (flag bit 2) | `ai1` | 11 | 2^-8 | sfu/deg |
| NeQuick-G (flag bit 2) | `ai2` | 14 | 2^-15 | sfu/deg^2 |
| NeQuick-G (flag bit 2) | `SF1-5` | 5 | 1 | - |
| UTC (flag bit 3) | `A0` | 32 | 2^-30 | s |
| UTC (flag bit 3) | `A1` | 24 | 2^-50 | s/s |
| UTC (flag bit 3) | `dtLS` | 8 | 1 | s |
| UTC (flag bit 3) | `t0t` | 8 | 3600 | s |
| UTC (flag bit 3) | `WNot` | 8 | 1 | week |
| UTC (flag bit 3) | `WNLSF` | 8 | 1 | week |
| UTC (flag bit 3) | `DN` | 3 | 1 | day |
| UTC (flag bit 3) | `dtLSF` | 8 | 1 | s |

A value outside its field's range is refused, not wrapped. The ranges were checked by
encoding fits at 300 to 2000 km, inclinations from 0° to 140° and fit intervals up to
20 minutes: `deltaN` and `OmegaDot` are wide because on a near-equatorial orbit the node
is poorly defined and the fit shares the J2 drift of the argument of latitude between
them, and `aDot` and `nDot` because the 22-parameter fit over 20 minutes absorbs part of
the short-period oscillation of the semi-major axis. The degree-7 along-track
corrections of `kepler-rac` fit the 22-bit coefficient range up to 15 minutes; a longer
fit can exceed it and is then refused. `quantisation_budget` reports,
for every ephemeris and clock field, the largest position and range change a half-step
change makes over the usage period, and the whole-message change after quantisation.

## Text exports

**RINEX 4.02 defines no LEO navigation records** (its system letters are G, R, E, J, C, I
and S; [International Global Navigation Satellite System (GNSS) Service (IGS) RINEX 4.02](https://files.igs.org/pub/data/format/rinex_4.02.pdf)). The
block `text.rs` writes borrows the RINEX 4 shape — a `> EPH` record header, a satellite
and epoch line with three clock terms, broadcast-orbit lines of four `D19.12` fields —
and is a **documented Kshana extension**: system letter `L`, record types `KP16`, `KRAC`,
`LU22`, `APOL`, and three header comments that say so. Prior art for LEO orbits in
RINEX-4-style navigation records: [arXiv 2401.17767](https://arxiv.org/abs/2401.17767).

```
> EPH L04 KRAC
L04 yyyy mm dd hh mm ss  af0 af1 af2
     IOD      Crs      deltaN   M0
     Cuc      e        Cus      sqrtA
     toe      Cic      Omega0   Cis
     i0       Crc      omega    OmegaDot
     IDOT     Band     Week     Health
     txTOW    clock    degA     degC
     degR     tau_s    a0       a1         then the rest of a_k, c_k and r_k, four per line
```

The CSV table carries `kepler16` and `kepler-rac` messages one per row. The default
columns use the Galileo ICD names (`SVID, IOD, Band, WeekNumber, ToW, Health, toc, af0,
af1, af2, toe, M0, sqrtA, e, deltaN, Omega0, OmegaDot, iDot, i0, omega, Crc, Crs, Cic,
Cis, Cuc, Cus, a0…, c0…, r0…, racTau`); `csv_schema` selects a preset's spelling instead. Both
formats read back.

## Ionosphere and UTC

- **Klobuchar**: the engine's L1 model (`gnss_sim::klobuchar_delay_m`, checked against
  RTKLIB) scaled to the carrier by the first-order `(f_L1 / f)²` law.
- **NeQuick-G**: the coefficients travel in the message and `effective_ionisation_level`
  returns `Az = ai0 + ai1·μ + ai2·μ²` for a modified dip latitude `μ`, with the
  algorithm's rules (all-zero coefficients give 63.7 solar flux units, sfu; the result is clamped to
  [0, 400] sfu). The NeQuick electron-density model and its slant integration, which turn
  `Az` into a delay, are **not** implemented.
- A satellite at a few hundred kilometres flies inside the ionosphere. Neither broadcast
  model accounts for the electron content above the satellite, and no correction for it
  is applied.
- **UTC**: `system_to_utc` applies the three cases of the Galileo ICD §5.1.7 (before,
  within six hours of, and after a leap-second event); an inserted second reads 86400.

## Presets

Presets are data, one file each under `src/leo_navmsg/presets/`, with their sources.
The engine and every bundled scenario except the Celeste one run without them.

| Key | Source | Orbit | Carrier | Message model |
|---|---|---|---|---|
| `xona-pulsar` | PUBLIC, [arXiv 2509.19551](https://arxiv.org/abs/2509.19551) | 1080 km, 53° | X1 1593.3225 MHz | not published |
| `xona-pulsar-0` | PUBLIC, arXiv 2509.19551 | 520 km, 97° | X1 | not published |
| `iridium` | PUBLIC, [RNTF report](https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf), constellation description | 781 km, 86.4° | 1621 MHz (1616–1626 MHz band) | none broadcast |
| `starlink` | PUBLIC, [NAVIGATION 72(1)](https://navi.ion.org/content/72/1/navi.685), constellation description | 550 km, 53° | Ku band, mid-band value (representative) | none (signals of opportunity) |
| `centispace` | PUBLIC, [Sensors 2023](https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/), [Satellite Navigation 2026](https://link.springer.com/article/10.1186/s43020-026-00212-0) | 700 km, 55° | near B1 (masked in the source; L1 as stand-in) | not published |
| `cband-generic` | REPRESENTATIVE | 600 km, 97.8° | 5020 MHz (RNSS C-band centre) | not published |
| `atomic` | PUBLIC, [InsideGNSS](https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/) | 500 km (representative) | L1 (representative) | `ecef-poly`, degree 6, 60 s, refreshed every 30 s, zero clock, 0.24 m steering residual |
| `celeste-iod` | WORKSHOP and PUBLIC | 510 km, 97.4° | 1191.795 MHz | `kepler-rac`, degrees and record spacing in the preset file |

RNSS is the radionavigation-satellite service; RNTF the Resilient Navigation and Timing
Foundation.

**Celeste IOD.** The European Space Agency's (ESA's) Celeste in-orbit demonstration (IOD) preset is the only one that
uses material presented at the ESA Navigation Innovation and Support Programme (NAVISP)
LEO-PNT workshop, 2026: the message structure (Galileo Keplerian set plus
along/cross/radial correction polynomials, clock polynomial, SVID,
health, IOD, ionospheric and UTC parameters), the record spacing and the CSV
column names. The orbit (510 km, near-polar sun-synchronous) and carrier come from
public sources cited in the file. The Celeste bit layout is not public and is not
reproduced; later Celeste phases and the EU LEO-PNT system may differ. Every
workshop-derived value sits in the `navmsg` module of `src/celeste_iod.rs`, used by
`scenarios/leo-navmsg-celeste-iod.toml`. How the preset is withheld: every workshop-derived number of the engine lives in one file,
`src/celeste_iod.rs`, which `build.rs` compiles in only when it exists, and in the
repository-only scenarios `scenarios/*celeste-iod*.toml`. Deleting that file and those
scenarios withholds the preset with no source edit; every other test, oracle and scenario
runs without it, and the README's scenario-file count still counts the withheld files.

## Verification

| Row | Label | Oracle |
|---|---|---|
| SISRE weights | VALIDATED | Montenbruck et al. 2018 table (GPS, GLONASS, Galileo, BeiDou, geostationary) |
| Galileo ICD user algorithm | VALIDATED | RTKLIB `eph2pos` on four real Galileo broadcast ephemerides, 1 mm per axis (`tests/leo_navmsg_reference.rs`) |
| CRC-24Q | VALIDATED | catalogue check value `0xCDE703`; RTCM 10403 1005 example frame |
| Fitter and SISRE trade | MODELLED | two-body truth recovered to 1 mm; corrected J2–J6 fit to 1 mm; monotonic growth with interval |
| Mid-pass continuity | MODELLED | jump identity; closed-form cone bound against sampling |
| Binary format and budget | MODELLED | round trips; every field's half step under 1 mm |
| RINEX-style and CSV | MODELLED | round trips |
| Liu 22-parameter and ATOMIC models | MODELLED | published Liu table printed beside Kshana's, not pinned |
| Ionosphere and UTC | MODELLED | ICD closed forms; the RTKLIB-checked Klobuchar model |

## Limitations

- SISRE is representation error only: no orbit determination or prediction error.
- The truth is a Kshana integration (no third body, solar radiation pressure or tides),
  not a real satellite's precise orbit.
- The binary format and the RINEX-style block are Kshana's own.
- NeQuick-G is carried, not integrated into a delay; no correction for a satellite inside
  the ionosphere.
- The Liu et al. comparison differs in orbits, parameter reading and weights.
