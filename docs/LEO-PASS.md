# LEO pass and link budget (`leo-pass`)

LEO-PNT is positioning, navigation and timing (PNT) from satellites in low Earth orbit (LEO).
The `leo-pass` kind simulates one or more LEO satellite passes over a user and works out the
link budget band by band, next to the medium Earth orbit (MEO) GNSS (global navigation
satellite system) satellites in view. The engine is **system-agnostic**: any constellation,
any signal design and any band, written straight into a scenario. Named systems are optional
presets, each in its own file with its source.

- Code: [`src/leo_pass.rs`](../src/leo_pass.rs) (the kind) and
  [`src/leo_link/`](../src/leo_link/) (public building blocks other modules can call).
- Scenarios: `leo-pass-vs-gnss-cn0`, `leo-indoor-uhf`, `leo-iot-energy`,
  `leo-pass-xona-pulsar`, `leo-pass-iridium`, `leo-resilience-spoof-doppler`,
  `leo-focus-science-iono-sounding`, and the optional `leo-pass-celeste-iod-multiband`
  (results in [Bundled scenarios](#bundled-scenarios)). The kind is also a member of the
  campaigns `leo-resilience-spoof-monitors`, `leo-focus-iot-eirp`, `leo-focus-indoor-uhf` and
  every `leo-vertical-*` scenario, and the pass stage of the `leo-pnt-chain` kind.
- Overview of every LEO-PNT kind and scenario: [LEO-PNT.md](LEO-PNT.md).
- Oracles: [`tests/leo_link_reference.rs`](../tests/leo_link_reference.rs), fixtures in
  `tests/fixtures/leo_link/` with their source URLs.

## What one run computes

For every LEO satellite, band and epoch:

| Term | Model | Label |
|---|---|---|
| Elevation, azimuth, range | WGS-84 (World Geodetic System 1984) user, satellite in an inertial frame aligned with the Earth-fixed frame at the epoch | computed |
| Range rate `ρ̇ = d·Δv/ρ`, range acceleration `ρ̈ = (|Δv|² − ρ̇² + d·Δa)/ρ` | closed form; every run checks both against central differences of the propagated range and reports the largest difference | closed form |
| Doppler `−f·ρ̇/c`, Doppler rate `−f·ρ̈/c` | first order, per band | closed form |
| Free-space path loss | Friis, `20·log10(4πRf/c)` | VALIDATED |
| Satellite EIRP (equivalent isotropically radiated power) and pattern | isoflux to an edge elevation, Gaussian main lobe `−12(η/θ₃)²` dB, or flat | MODELLED |
| User antenna | patch `G_z + 10·q·log10(sin el)` dBic, hemispherical or isotropic | MODELLED |
| Gaseous attenuation | ITU-R (International Telecommunication Union, Radiocommunication Sector) P.676-10 Annex 2 simplified expressions (superseded by P.676-13, whose tabulated coefficients the engine does not carry) | MODELLED |
| Rain attenuation | ITU-R P.838-3 coefficients and the P.618-14 § 2.2.1.1 procedure, from a rain rate R0.01 and a rain height | VALIDATED |
| Tropospheric scintillation | ITU-R P.618-14 § 2.4.1; below 4 GHz an extrapolation, flagged in the report | VALIDATED (4–55 GHz) |
| Building entry loss (indoor user) | ITU-R P.2109-2, traditional or thermally-efficient, at the elevation of the path at the facade | VALIDATED |
| Polarisation mismatch | polarisation loss factor from axial ratios and senses, averaged over ellipse orientation | closed form |
| System noise temperature | antenna floor + sky emission of the absorbing path (275 K) + cosmic 2.7 K + receiver `290(10^(NF/10) − 1)` | MODELLED |
| C/N0 (carrier-to-noise density) | `EIRP + G_sat − L_fs − L_gas − L_rain − L_scint − L_BEL − L_pol + G_user − 10·log10(kT) − L_impl` | MODELLED |
| Ionospheric group delay | `40.3·STEC/f²`, STEC (slant total electron content) from the Klobuchar model or a vertical total electron content (TEC), scaled by the fraction of a Chapman layer below the satellite | scaling VALIDATED, TEC MODELLED |

Per band pair: the ionosphere-free coefficients, the noise amplification `√(a₁² + a₂²)` and
the thermal code noise of each band and of the combination at the pass peak. The MEO GNSS
comparison uses the same user antenna and receiver, with each signal's interface-document
minimum received power (Galileo Open Service Signal-in-Space Interface Control Document,
OS SIS ICD, Issue 2.1 Table 12; GPS from IS-GPS-200 and
IS-GPS-705), plus a stated excess, scaled by range. The optional `[iot]` (Internet of Things)
section gives time to first fix, energy per fix and battery life against duty cycle for a stated receiver power
budget (MODELLED, every assumption an input and listed in the report).

## Satellites

- `orbit = "pass"` (default): a circular orbit placed so the user sees one pass with a chosen
  maximum elevation at a chosen time, ascending or descending, east or west of the user; the
  inclination can be sun-synchronous.
- `orbit = "elements"`: explicit Keplerian elements.
- `orbit = "tle"`: a two-line element set (TLE) through the engine's Simplified General
  Perturbations 4 (SGP4) propagator.
- `[[leo_constellation]]`: a Walker constellation built by the `constellation-design` code
  (its `ConstellationCfg`, or the preset's shells); the highest passes in the window are
  reported.

## Bands and signal designs

Bands: `system = "<preset>"` with an optional `bands` subset, and `[[satellite.band]]` entries
that add a band or override any field of a preset band. `system = "none"` with only
`[[satellite.band]]` entries uses no preset at all.

A band can also name a `leo-signal` design (`signal = "xona-x5"`, any design under
`data/leo-signals/`, or one the `leo-pnt-chain` kind hands in; see
[LEO-SIGNAL.md](LEO-SIGNAL.md)). The band then takes the design's centre frequency (unless
`frequency_mhz` is given), transmit bandwidth and tracked-component chip rate, splits its
EIRP across the design's components by their power shares, and reports at every epoch the
tracked component's C/N0 and its band-limited early-late code-tracking jitter (Betz and
Kolodziejski 2009, the `leo-signal` kind's formula) as the ranging error.

## Presets

Each preset marks its numbers PUBLIC (with URL), REPRESENTATIVE (a documented design choice,
never a claim about a real system) or WORKSHOP.

| Preset | Source | Bands | Orbit |
|---|---|---|---|
| `generic-leo` (default) | REPRESENTATIVE; L, S and C carriers from public documents | UHF 450 MHz (representative), L 1191.795 MHz (Galileo E5 centre), S 2492.028 MHz (NavIC S, the Navigation with Indian Constellation S-band carrier), C 5020 MHz (centre of the 5010–5030 MHz RNSS (radionavigation-satellite service) allocation), each 0 dBW | 550 km sun-synchronous, Walker 240/12/1 |
| `generic-c-band` | REPRESENTATIVE, for C-band systems whose parameters are not public (for example TrustPoint) | C 5020 MHz, BPSK(10) (binary phase-shift keying at 10 × 1.023 Mchip/s), isoflux | 550 km, 53° |
| `xona-pulsar` | PUBLIC, [arXiv 2509.19551](https://arxiv.org/abs/2509.19551) Tables 1–2 | X1 1593.3225 MHz, X5 1190.51625 MHz; EIRP from the published minimum received power at 10° | 1080 km, 53° (192) and 97° (66) |
| `iridium-stl` | PUBLIC, [Resilient Navigation and Timing Foundation (RNTF)](https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf) and the published orbit | Satellite Time and Location (STL) at 1621 MHz (middle of 1616–1626 MHz); EIRP from "300 times GPS" | 781 km, 86.4°, 66 in 6 planes |
| `starlink-soop` | PUBLIC signal figures ([NAVIGATION 72(1)](https://navi.ion.org/content/72/1/navi.685)), REPRESENTATIVE orbit and EIRP | Ku 240 MHz beacon, Doppler-only | 550 km, 53° |
| `centispace` | PUBLIC signal structure ([PMC10301026](https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/)), REPRESENTATIVE orbit and EIRP | BPSK 2.046 Mchip/s near L1 and L5 | 1000 km, 55° |
| `celeste-iod` (optional) | WORKSHOP signal parameters, PUBLIC orbit | seven bands of configuration #1 | 510 km sun-synchronous |

**The Celeste IOD (in-orbit demonstration) preset is optional.** Its signal parameters were
presented at the European Space Agency (ESA) Navigation Innovation and Support Programme
(NAVISP) LEO-PNT workshop,
2026, and have no public source yet; they live in the `link` module of
`src/celeste_iod.rs`, used by `scenarios/leo-pass-celeste-iod-multiband.toml`. How the
preset is withheld: every workshop-derived number of the engine lives in one file,
`src/celeste_iod.rs`, which `build.rs` compiles in only when it exists, and in the
repository-only scenarios `scenarios/*celeste-iod*.toml`. Deleting that file and those
scenarios withholds the preset with no source edit; every other test, oracle and scenario
runs without it, and the README's scenario-file count still counts the withheld files. Its
EIRP and beam are calibrated to a C/N0 trace shown at the workshop, so that scenario reproduces the trace by construction.

The ATOMIC "zero-clock" polynomial broadcast-ephemeris model is a navigation-message preset
and is not part of this kind.

## The LEO-versus-GNSS observation

`scenarios/leo-pass-vs-gnss-cn0.toml` reproduces qualitatively what LEO-PNT demonstrations
show: the LEO C/N0 rises and falls in a bell that stays above the mask for 590 s and peaks
at 56.8 dB-Hz, 8.9 dB above the median of the flat MEO GNSS carriers (Galileo E1, 40.5 to
52.0 dB-Hz, median 47.8 dB-Hz). The margin comes from the range, not from a stronger
transmitter: at the pass peak the satellite is 569 km away, about 40 times closer than a
Galileo satellite at the zenith (23 222 km), which is 32 dB less free-space loss; the generic
preset radiates 0 dBW (1 W).

## Bundled scenarios

Each row is one run of `kshana scenarios/<name>.toml` (engine 0.30.0):

| Scenario | Setup | Result of one run |
|---|---|---|
| `leo-pass-vs-gnss-cn0` | `generic-leo` L band, 550 km, 80° pass over Munich | L peak 56.8 dB-Hz, median 42.2 dB-Hz; Galileo E1 median 47.8 dB-Hz |
| `leo-pass-xona-pulsar` | `xona-pulsar`, a designed 70° pass and four inclined-shell satellites, maritime user | X1 peak 65.6 dB-Hz and X5 68.9 dB-Hz on the designed pass; largest X1 Doppler 31.4 kHz |
| `leo-pass-iridium` | `iridium-stl`, 65° pass, airborne user | STL peak 80.5 dB-Hz, 34.3 dB above the GPS L1 median; largest Doppler 35.4 kHz |
| `leo-indoor-uhf` | `generic-leo`, indoor user in Rome (traditional building) | peak UHF 34.1, L 24.2, S 16.5, C 8.5 dB-Hz; Galileo E1 median 22.4 dB-Hz |
| `leo-iot-energy` | `generic-leo` UHF and L with the `[iot]` section | hot fix 0.90 s and 18.0 mJ on every signal; cold fix UHF 19.0 s (381 mJ), L 47.0 s (939 mJ), GPS L1 38.1 s (762 mJ) |
| `leo-focus-science-iono-sounding` | `generic-leo`, four bands, 70° pass over Tromsø | see [Ionosphere sounding](#ionosphere-sounding) |
| `leo-resilience-spoof-doppler` | 16 satellites of a 1080 km generic layer, L and C, a 30 m jump | see [Spoofing monitors](#spoofing-monitors-spoofer) |

`kshana scenarios/<name>.toml --animate html --export all` also writes the interactive
player (`.animation.html`, the pass epochs) and CZML (the Cesium Language), KML (Keyhole
Markup Language), GeoJSON and STK (Systems Tool Kit) ephemeris files of the pass geometry
([ANIMATION.md](ANIMATION.md), [INTEROP.md](INTEROP.md)).

## Ionosphere sounding

Every band pair also gives the slant TEC its geometry-free code combination recovers at the
pass peak, `STEC = (P₂ − P₁)·f₁²f₂² / (40.3·(f₁² − f₂²))`, and the 1-sigma of that estimate
from the two bands' code noise at the peak (`geometry_free_stec_tecu`,
`geometry_free_stec_sigma_tecu`). The estimate equals the model's slant TEC by construction:
the combination is exact at first order. The sigma is what makes a band plan a better or
worse sounder: `scenarios/leo-focus-science-iono-sounding.toml` (four bands over Tromsø)
recovers 18.85 TEC units from every pair, with a 1-sigma of 0.017 TEC units for UHF with L
and 2.9 for S with C. Thermal code noise only; no multipath or inter-frequency bias.
MODELLED.

## Spoofing monitors (`[spoofer]`)

The optional `[spoofer]` section counterfeits the signals a receiver would see at a claimed
position. From `onset_s` the claimed position jumps by `offset_m` and then moves
horizontally at `push_rate_m_s` toward `push_azimuth_deg`; the counterfeit range and range
rate are exactly those of the claimed position, on the LEO bands named in `bands` (default
all) and on the MEO GNSS signal unless `gnss = false`. `simulate_iono` says whether the
counterfeit pseudoranges carry the ionospheric delay (a ground transmitter's do not).

The receiver runs two monitors ([`src/leo_link/spoof.rs`](../src/leo_link/spoof.rs)), each
at a stated false-alarm probability per epoch (`p_fa`, default 1e-5), and declares
detection at the first epoch its detection probability reaches `1 − p_md` (default 0.999).
Detection probabilities are exact for the stated Gaussian noise, evaluated on the
noise-free mean residual; no noise is drawn.

| Monitor | Statistic | What it sees |
|---|---|---|
| Doppler and pass-geometry consistency | measured range rates against those predicted from the orbits and an independent prior position and velocity (`prior_sigma_m`, `prior_velocity_sigma_m_s`); a generalised least-squares chi-square over a window of `window_s` (default one step), with the clock drift a nuisance (or given `drift_sigma_m_s`); frequency-lock-loop noise from C/N0 (Kaplan & Hegarty 2006, § 5.6.2), on the GNSS channels, the LEO channels and all channels | a position error `δx` moves a range rate by `g·δx`, `g = −(Δv − ρ̇u)/ρ`: a LEO satellite's transverse speed over its range is about 25 times a MEO satellite's, so the same error is about 25 times larger in LEO Doppler |
| Cross-band consistency | the epoch-to-epoch step of each LEO band pair's geometry-free pseudorange combination, the receiver's ionospheric model removed, against `√(2(σ₁² + σ₂²))` code noise and a tolerated unmodelled ionospheric rate (`iono_rate_bound_m_s`) | a spoofer that counterfeits some bands and not others, or every band without the ionosphere, at its onset; not one that counterfeits every band and simulates the ionosphere |

`scenarios/leo-resilience-spoof-doppler.toml`: a 30 m jump at a surveyed site in Frankfurt
changes the GNSS range rates by about 4 mm/s and the LEO ones by about 10 cm/s (median
gradients 1.4e-4 and 3.5e-3 per second). The GNSS-only test never detects it (largest
non-centrality 0.06); the test on every channel detects it 105 s after the onset.
`scenarios/leo-resilience-spoof-monitors.toml` runs four spoofers against both monitors.

Limitations, stated in every result: the spoofer is an idealised, self-consistent position
push that compensates its own path (no power, angle-of-arrival or correlation-peak
signature); the prior is independent of the spoofed fixes; the receiver's ionospheric
model is the engine's, so the authentic cross-band residual is zero in the mean. MODELLED
(two rows in [VERIFICATION-MATRIX.md](VERIFICATION-MATRIX.md)).

## Validation

| Oracle | Test | Result |
|---|---|---|
| ITU-R P.838-3 Table 5, 115 frequencies | `p838_coefficients_reproduce_table5_to_its_printed_digits` | every coefficient within 0.6 of its last printed digit (worst observed 0.51) |
| ITU-R Study Group 3 validation examples (CG-3M3J-13-ValEx-Rev8.3.0), P.618-14 rain | `p618_rain_attenuation_matches_the_itu_validation_examples` | 56 cases within 1e-4 dB (observed 5e-6 dB) |
| Same examples, P.618-14 scintillation | `p618_scintillation_matches_the_itu_validation_examples` | 42 cases within 1e-5 dB |
| ITU-R Study Group 3 Clutter and BEL workbook, P.2109 | `p2109_building_entry_loss_matches_the_itu_workbook` | 568 values within 0.001 dB |
| IS-GPS-200 group-delay ratio `γ = (77/60)²` | `first_order_iono_reproduces_the_is_gps_200_group_delay_ratio` | to 1e-12; L1/L2 and L1/L5 amplification 2.978 and 2.588 |
| Friis kilometre–megahertz form | `free_space_loss_is_the_friis_kilometre_megahertz_form` | to 1e-4 dB |
| arXiv 2509.19551 Table 1 (Pulsar in-orbit validation (IOV), full operational capability (FOC) polar, FOC inclined, GPS) | `doppler_envelope_reproduces_the_pulsar_paper_table_1` | 20 speeds and Doppler maxima within 0.05 % |

The rain and scintillation oracles take the rain height and the wet refractivity as the
validation examples give them: the engine carries neither the ITU-R P.839 nor the P.453 map.

## Limitations

- EIRPs and patterns are published received powers turned into an EIRP, or representative
  choices; no satellite's measured pattern is used and no LEO C/N0 is compared with a
  measurement.
- The gaseous term is the superseded P.676-10 simplified method; below 1 GHz it is the 1 GHz
  value scaled by f², and rain is taken as zero there.
- The fraction of TEC below a LEO satellite comes from a single Chapman layer (no
  plasmasphere), overridable by a stated fraction.
- The designed-pass and Walker orbits are two-body with an optional secular J2 (the Earth's
  second zonal harmonic); the TLE path
  uses SGP4. The user's own acceleration is left out of the closed-form Doppler rate (the
  numerical check reports what that costs for a moving user).
- RINEX (Receiver Independent Exchange Format) 4.02 has no LEO navigation records; any RINEX-style LEO export belongs to the
  navigation-message code and is a documented Kshana extension (prior art: arXiv 2401.17767).
