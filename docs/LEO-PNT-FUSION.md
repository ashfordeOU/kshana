# Fused MEO and LEO positioning, navigation and timing

Three scenario kinds provide positioning, navigation and timing (PNT) with satellites in low
Earth orbit (LEO) alone or fused with the medium-Earth-orbit (MEO) global navigation satellite systems
(GNSS): `leo-pvt` (position, velocity and time), `leo-ppp` (precise point positioning) and
`ntn-positioning` (a 5G non-terrestrial network). Source: `src/leo_fusion/`.

The engine is **system-agnostic**. Every constellation is Walker shells, explicit orbital
elements or a GNSS preset of the `constellation-design` kind; every signal is a carrier, a
chip rate and a carrier-to-noise density (C/N0) envelope; every error budget is an explicit
one-sigma. Named systems are optional **presets**, one file each, and every capability, test
and bundled scenario runs without any particular one of them.

## Systems and presets

A scenario lists its systems as `[[system]]` tables. This complete scenario joins the GPS
baseline constellation with a generic LEO layer and runs as written (`kshana <file>.toml`;
engine 0.29.2 gives a median position dilution of precision of 2.43 for GPS alone and 1.17
fused, and a root-mean-square 3D error of 2.06 m and 0.47 m):

```toml
kind = "leo-pvt"
mode = "joint"
seed = 3
duration_s = 600.0
step_s = 60.0
[user]
lat_deg = 40.42
lon_deg = -3.70
height_m = 650.0
[[system]]
name = "GPS"
preset = "gps-baseline"
cn0_dbhz = [38.0, 48.0]
sisre_m = 0.6

[[system]]
name = "Any LEO layer"
carrier_hz = 1.5e9          # any band
chip_rate_hz = 10.23e6      # omit with doppler_only = true for a signal of opportunity
cn0_dbhz = [45.0, 55.0]     # at the elevation mask and at the zenith
sisre_m = 0.3               # signal-in-space range error of orbit and clock, one sigma
clock = "estimated"         # its own receiver clock (inter-system bias solved) or "known"
isb_ns = 40.0               # true inter-system bias used to simulate its pseudoranges
[[system.shell]]
total = 240
planes = 12
phasing = 1
altitude_km = 1000.0
inclination_deg = 60.0
```

`preset = "gps-baseline"` (the Global Positioning System, GPS; or `galileo`, `beidou-meo`,
`glonass`) takes a published GNSS
constellation; `leo_preset = "..."` fills whatever the table leaves out from a LEO preset.
The C/N0 runs linearly in the sine of the elevation from the mask to the zenith (a modelling
choice: a real pass envelope depends on the transmit antenna pattern). The pseudorange
one-sigma is the engine's delay-lock-loop (DLL) thermal noise (`navsignal::dll_code_jitter_chips`)
at that C/N0 combined with the signal-in-space range error (SISRE), unless `sigma_pr_m` fixes it; the range-rate one-sigma
is the wavelength times `sigma_doppler_hz`. Because the sigma is an input, a separate signal
model can feed it without the positioning code knowing where it came from.

| Preset | What it carries | Sources |
|---|---|---|
| `xona-pulsar` | X1 at 1593.3225 MHz, 1.023 Mchip/s, received power −148.2 to −139.1 dBW; X5 at 1190.51625 MHz, 10.23 Mchip/s, −144.9 to −136.2 dBW; 258 satellites in 18 planes at 1080 km, 53 and 97 deg | PUBLIC: [arXiv:2509.19551](https://arxiv.org/abs/2509.19551). Representative: the split between the two inclinations, the phasing, the range error |
| `iridium-stl` | Iridium Satellite Time and Location (STL): 66 satellites, six near-polar planes at 780 km and 86.4 deg; bursts at 1616 to 1626 MHz, quadrature phase-shift keying (QPSK) at 25 000 symbol/s; received power 300 to 2400 times the GPS minimum | PUBLIC: [Resilient Navigation and Timing Foundation (RNTF)](https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf), [National Institute of Standards and Technology (NIST)](https://www.nist.gov/publications/validating-timing-performance-improvement-ionospheric-corrections-iridium-pnt-receivers), [constellation](https://en.wikipedia.org/wiki/Iridium_satellite_constellation). DERIVED: the power in dBW. Representative: carrier at the band centre, range error |
| `starlink-sop` | Doppler only: 11.325 GHz, 240 MHz orthogonal frequency-division multiplexing (OFDM) beacon, C/N0 up to 57.07 dB-Hz, Doppler error 30 Hz; first shell of 1584 satellites at 550 km and 53 deg | PUBLIC: [Kozhaya, Saroufim and Kassas 2025](https://navi.ion.org/content/72/1/navi.685), [Federal Communications Commission (FCC) 21-48](https://docs.fcc.gov/public/attachments/FCC-21-48A1.pdf). Representative: phasing, horizon C/N0 |
| `centispace` | Binary phase-shift keying (BPSK) at 2.046 Mchip/s near L1 and L5; centimetre orbit determination | PUBLIC: [initial assessment](https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/), [GPS Solutions](https://doi.org/10.1007/s10291-023-01589-0). Representative: carriers, power, the whole operational constellation |
| `generic-c-band` | A C-band system in the 5010 to 5030 MHz radionavigation-satellite service (RNSS) allocation, for systems whose parameters are not public | PUBLIC: the [International Telecommunication Union (ITU) Radio Regulations](https://www.itu.int/pub/R-REG-RR) allocation. Everything else **representative** |
| `atomic-zero-clock` | An ephemeris-and-clock model: sixth-order polynomial ephemeris, 30 s refresh, clock steered to GNSS time; SISRE 0.26 m | PUBLIC: [InsideGNSS](https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/). DERIVED: the SISRE. Combine with any constellation through `ephemeris_preset` |
| `celeste-iod` | European Space Agency (ESA) Celeste in-orbit demonstration (IOD), one configuration of a parameterised signal design | PUBLIC orbit ([ESA](https://www.esa.int/Applications/Satellite_navigation/Celeste/Celeste_IOD_-_Facts_and_figures), [Institute of Navigation (ION) abstract 16907](https://www.ion.org/gnss/abstracts.cfm?paperID=16907)); WORKSHOP signal parameters, presented at the ESA Navigation Innovation and Support Programme (NAVISP) LEO-PNT workshop, 2026 |

Every workshop-derived number is in the `fusion` module of `src/celeste_iod.rs`, used by
`scenarios/celeste-iod-fused-pvt.toml` (`tests/workshop_preset_isolation.rs` enforces
where they may appear). How the preset is withheld: every workshop-derived number of the engine lives in one file,
`src/celeste_iod.rs`, which `build.rs` compiles in only when it exists, and in the
repository-only scenarios `scenarios/*celeste-iod*.toml`. Deleting that file and those
scenarios withholds the preset with no source edit; every other test, oracle and scenario
runs without it, and the README's scenario-file count still counts the withheld files.

## `leo-pvt`

One kind, four modes (`mode = "doppler" | "joint" | "polar" | "timing"`).

**Doppler.** A receiver measuring Doppler `f_D` at wavelength `λ` observes the range rate
`ρ̇ = −λ f_D = u·(v_s − v_u) + ḋ`, with `u` the line of sight and `ḋ` the receiver clock
drift. A batch Gauss-Newton fit solves the position, the drift and optionally a constant
velocity, with analytic partials `∂ρ̇/∂r = −(I − u uᵀ)(v_s − v_u)/ρ`: only the satellite
velocity across the line of sight carries position information, so the geometry is how the
lines of sight turn during the window. The report gives the error against window length, the
Doppler, Doppler-rate and jerk envelope of each system, and a single-pass table. One pass
locates the user along the track (the time of zero Doppler) and across it (the steepness of
the Doppler curve); the cross-track error grows without bound as the pass goes overhead, and
the mirror image across the ground track fits almost as well (only the Earth's rotation
separates them). A Doppler-only system (`doppler_only = true`, the `starlink-sop` preset)
runs in this mode.

**Joint.** Each epoch, weighted least squares over the pseudoranges of the GNSS systems
alone, the LEO systems alone and all of them, one receiver clock per system (the inter-system
bias, ISB, is estimated) or a known broadcast offset on the reference time scale. It reports
the geometric, position, horizontal, vertical and time dilution of precision (GDOP, PDOP,
HDOP, VDOP, TDOP), the errors, the estimated biases, and the DOP against the number of LEO
satellites added to the GNSS geometry.

**Polar.** Satellites in view, median DOP and availability against latitude for MEO GNSS,
LEO and both.

**Timing.** At a known position every LEO pseudorange is a clock measurement. The receiver
runs a two-state (phase, frequency) Kalman filter whose process noise is the oscillator
class's white and random-walk frequency noise (the `slot-timing` and clock models), holds
time between passes, and converts system time to Coordinated Universal Time (UTC) with the
IS-GPS-200 expression `Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))`; the
uncertainty of the broadcast offset is a per-run bias.

## `leo-ppp`

A float precise point positioning (PPP) extended Kalman filter (EKF) on ionosphere-free code
and phase: static coordinates, a white receiver clock, one inter-system bias per extra
system, a random-walk zenith wet delay, and a float ambiguity per satellite arc. The precise
orbit-and-clock error is common to a satellite's code and phase, so each satellite is one
correlated two-row update, in a Joseph-stabilised form that keeps the covariance positive
definite over thousands of millimetre-level phase updates. Measurements are simulated from
the same model, so the normalised estimation error squared (NEES) of the position must follow
a chi-square law with three degrees of freedom; the test checks it over Monte Carlo seeds.
Convergence is the first epoch after which the horizontal and vertical errors stay below the
thresholds (10 cm) until the end of the run.

A LEO satellite crosses the sky in about ten minutes, a MEO satellite moves a few degrees, so
LEO arcs separate the ambiguities from the position far sooner.

## `ntn-positioning`

A 5G non-terrestrial network (NTN) downlink in the mobile-satellite service (MSS) S band,
3rd Generation Partnership Project (3GPP) band n256 (2170 to 2200 MHz). The Cramér-Rao bound (CRB) on time of arrival is
`c / (2π β sqrt(2 (C/N0) T))`, with `β` the root-mean-square (Gabor) bandwidth (`B/√12` for a
flat OFDM spectrum), and on the frequency of a tone `sqrt(3 / (2π² (C/N0) T³))`. The kind
compares channels (by default a 5 MHz New Radio channel and a 200 kHz narrowband channel)
through downlink time-of-arrival fixes with an unknown receiver clock and a single-satellite
Doppler fix over a pass.

## Bundled scenarios

| Scenario | Kind, mode | What it shows (seeded, deterministic) |
|---|---|---|
| `leo-doppler-positioning` | `leo-pvt`, doppler | Xona Pulsar X1 layer (258 satellites), 1 Hz Doppler noise: 3D error 7.5 m after ten minutes (26 satellites); on a single pass the cross-track one-sigma is 303 m when the pass goes nearly overhead (25 km off track) against 43 m at 250 km off track |
| `starlink-sop-doppler-positioning` | `leo-pvt`, doppler | Doppler-only signals of opportunity, 30 Hz Doppler error at 10 Hz: formal horizontal one-sigma about 10 m after 20 s with 12 satellites and 6 m after 60 s |
| `meo-leo-fused-pvt` | `leo-pvt`, joint | GPS and Galileo median PDOP 1.47 and root-mean-square (RMS) 3D error 1.06 m; Xona X5 alone 1.73 and 0.49 m; fused 1.06 and 0.41 m; the 40 ns LEO bias (11.99 m) estimated as 12.06 m |
| `leo-ppp-convergence` | `leo-ppp` | Convergence 7.4 min (MEO GNSS only), 4.8, 3.2, 2.7 and 2.3 min with 60, 96, 192 and 288 LEO satellites |
| `ntn-5g-positioning` | `ntn-positioning` | Range bound 0.26 to 1.03 m for 4.5 MHz and 6.5 to 26 m for 180 kHz; fixes near 2 m against 26 m |
| `polar-arctic-leo-coverage` | `leo-pvt`, polar | GPS and Galileo VDOP 1.20 at the equator, 1.51 at 89.9 deg; with Iridium 1.14 at the pole |
| `leo-timing-utc` | `leo-pvt`, timing | Iridium time transfer over 6 hours at Boulder: 9.9 to 11.4 ns RMS at nominal C/N0 across four oscillator classes, 15.1 to 25.0 ns 30 dB lower |
| `celeste-iod-fused-pvt` (optional) | `leo-pvt`, joint | GNSS joined by the two IOD satellites on the reference time scale (repository-only, withheld with the preset) |

The kinds also run inside other scenarios: `leo-pvt` is a member of the
`leo-focus-fused-pnt-sisre` sweep and of the `leo-vertical-autonomous-vehicle`,
`leo-vertical-polar-arctic`, `leo-vertical-critical-infrastructure-timing` and
`leo-vertical-5g-network-timing` campaigns; `leo-ppp` of the `leo-focus-ppp-altitude` sweep;
`ntn-positioning` of the `leo-focus-ntn-bandwidth` sweep; and `leo-pvt` and `leo-ppp` are the
fused-fix and PPP stages of the `leo-pnt-chain` kind. Their results are on
[LEO-PNT.md](LEO-PNT.md).

## Published figures and labels

| Figure | Source | Kshana | Label |
|---|---|---|---|
| Iridium Doppler up to ±36 kHz | RNTF | 35.9 kHz, the maximum over a day of passes, within 5% | VALIDATED (`tests/leo_doppler_reference.rs`) |
| Xona Pulsar X1 maximum Doppler 32 to 34 kHz | arXiv:2509.19551 | 33.6 kHz from one satellite of each published shell (1080 km, 53 and 97 deg), inside the interval with no widening; the 53 deg shell alone peaks at 31.8 kHz, since the Earth's rotation slows a prograde orbit relative to the ground | VALIDATED (same test) |
| Xona Pulsar X1 jerk ±1.26 Hz/s² | arXiv:2509.19551 | about 1.0 Hz/s² on an overhead pass | reported, not validated |
| PPP convergence 9.6 → 7.0, 3.2, 2.1, 1.3 min with 60/96/192/288 LEO | Li et al., *Journal of Geodesy* 93:749 (2019), [doi 10.1007/s00190-018-1195-2](https://link.springer.com/article/10.1007/s00190-018-1195-2) | 7.4 → 4.8, 3.2, 2.7, 2.3 min, monotone | MODELLED consistency of the trend (constellations, noise and stations not reproduced) |
| Starlink about 2 m in 20 s with three satellites | Kozhaya, Saroufim and Kassas 2025 | formal horizontal one-sigma about 10 m after 20 s with 12 satellites, with a perfect ephemeris and every error in a 30 Hz Doppler sigma at 10 Hz | MODELLED comparison (receiver and measurement rate not reproduced) |
| Iridium timing under 40 ns from UTC(NIST) | NIST | about 10 ns RMS modelled | MODELLED comparison |

Everything else is MODELLED with its rationale in the verification matrix
(`docs/VERIFICATION-MATRIX.md`): the DOP is checked against a hand-derived four-satellite
case, the fixes against their covariance, the Doppler model against the range-acceleration
identity, the PPP filter against the chi-square NEES band, and the bounds against quadrature.

## Limits, stated plainly

- Two-body orbits with the secular drift from J2, the Earth's second zonal harmonic; no broadcast-ephemeris fit error beyond the
  SISRE one-sigma, no satellite antenna pattern.
- No ionospheric or tropospheric delay in `leo-pvt` (the PPP filter carries a wet delay
  state; its ionosphere-free combination removes the first-order ionosphere), no
  scintillation, multipath, cycle slips or integer ambiguity resolution.
- The NTN accuracy is a bound, not an achieved result.
- Preset values marked representative are illustrative and describe no operator's design.
