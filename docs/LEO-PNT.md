# LEO-PNT pass and link budget (`leo-pass`)

LEO-PNT is positioning, navigation and timing (PNT) from satellites in low Earth orbit (LEO).
The `leo-pass` kind simulates one or more LEO satellite passes over a user and works out the
link budget band by band, next to the medium Earth orbit (MEO) GNSS (global navigation
satellite system) satellites in view. The engine is **system-agnostic**: any constellation,
any signal design and any band, written straight into a scenario. Named systems are optional
presets, each in its own file with its source.

- Code: [`src/leo_pass.rs`](../src/leo_pass.rs) (the kind) and
  [`src/leo_link/`](../src/leo_link/) (public building blocks other modules can call).
- Scenarios: `leo-pass-vs-gnss-cn0`, `leo-indoor-uhf`, `leo-iot-energy`,
  `leo-pass-xona-pulsar`, `leo-pass-iridium`, and the optional `leo-pass-celeste-iod-multiband`.
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
| Ionospheric group delay | `40.3·STEC/f²`, STEC (slant total electron content) from the Klobuchar model or a vertical TEC, scaled by the fraction of a Chapman layer below the satellite | scaling VALIDATED, TEC MODELLED |

Per band pair: the ionosphere-free coefficients, the noise amplification `√(a₁² + a₂²)` and
the thermal code noise of each band and of the combination at the pass peak. The MEO GNSS
comparison uses the same user antenna and receiver, with each signal's interface-document
minimum received power (Galileo OS SIS ICD Issue 2.1 Table 12; GPS from IS-GPS-200 and
IS-GPS-705), plus a stated excess, scaled by range. The optional `[iot]` section gives time to
first fix, energy per fix and battery life against duty cycle for a stated receiver power
budget (MODELLED, every assumption an input and listed in the report).

## Satellites

- `orbit = "pass"` (default): a circular orbit placed so the user sees one pass with a chosen
  maximum elevation at a chosen time, ascending or descending, east or west of the user; the
  inclination can be sun-synchronous.
- `orbit = "elements"`: explicit Keplerian elements.
- `orbit = "tle"`: a two-line element set (TLE) through the engine's SGP4.
- `[[leo_constellation]]`: a Walker constellation built by the `constellation-design` code
  (its `ConstellationCfg`, or the preset's shells); the highest passes in the window are
  reported.

Bands: `system = "<preset>"` with an optional `bands` subset, and `[[satellite.band]]` entries
that add a band or override any field of a preset band. `system = "none"` with only
`[[satellite.band]]` entries uses no preset at all.

## Presets

Each preset marks its numbers PUBLIC (with URL), REPRESENTATIVE (a documented design choice,
never a claim about a real system) or WORKSHOP.

| Preset | Source | Bands | Orbit |
|---|---|---|---|
| `generic-leo` (default) | REPRESENTATIVE; carriers from public documents | UHF 450 MHz, L 1191.795 MHz (Galileo E5 centre), S 2492.028 MHz (NavIC S), C 5020 MHz (centre of the 5010–5030 MHz RNSS (radionavigation-satellite service) allocation), each 0 dBW | 550 km sun-synchronous, Walker 240/12/1 |
| `generic-c-band` | REPRESENTATIVE, for C-band systems whose parameters are not public (for example TrustPoint) | C 5020 MHz, BPSK(10) (binary phase-shift keying at 10 × 1.023 Mchip/s), isoflux | 550 km, 53° |
| `xona-pulsar` | PUBLIC, [arXiv 2509.19551](https://arxiv.org/abs/2509.19551) Tables 1–2 | X1 1593.3225 MHz, X5 1190.51625 MHz; EIRP from the published minimum received power at 10° | 1080 km, 53° (192) and 97° (66) |
| `iridium-stl` | PUBLIC, [RNTF](https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf) and the published orbit | STL at 1621 MHz (middle of 1616–1626 MHz); EIRP from "300 times GPS" | 781 km, 86.4°, 66 in 6 planes |
| `starlink-soop` | PUBLIC signal figures ([NAVIGATION 72(1)](https://navi.ion.org/content/72/1/navi.685)), REPRESENTATIVE orbit and EIRP | Ku 240 MHz beacon, Doppler-only | 550 km, 53° |
| `centispace` | PUBLIC signal structure ([PMC10301026](https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/)), REPRESENTATIVE orbit and EIRP | BPSK 2.046 Mchip/s near L1 and L5 | 1000 km, 55° |
| `celeste-iod` (optional) | WORKSHOP signal parameters, PUBLIC orbit | seven bands of configuration #1 | 510 km sun-synchronous |

**The Celeste IOD (in-orbit demonstration) preset is optional.** Its signal parameters were
presented at the ESA NAVISP (Navigation Innovation and Support Programme) LEO-PNT workshop,
2026, and have no public source yet; they live in the `link` module of
`src/celeste_iod.rs`, used by `scenarios/leo-pass-celeste-iod-multiband.toml`. How the preset is withheld: every workshop-derived number of the engine lives in one file,
`src/celeste_iod.rs`, which `build.rs` compiles in only when it exists, and in the
repository-only scenarios `scenarios/*celeste-iod*.toml`. Deleting that file and those
scenarios withholds the preset with no source edit; every other test, oracle and scenario
runs without it, and the README's scenario-file count still counts the withheld files. Its EIRP and beam are calibrated to a C/N0 trace shown at
the workshop, so that scenario reproduces the trace by construction.

The ATOMIC "zero-clock" polynomial broadcast-ephemeris model is a navigation-message preset
and is not part of this kind.

## The LEO-versus-GNSS observation

`scenarios/leo-pass-vs-gnss-cn0.toml` reproduces qualitatively what LEO-PNT demonstrations
show: the LEO C/N0 rises and falls in a bell a few minutes long and peaks several dB above
the flat MEO GNSS carriers in the mid-40s to about 50 dB-Hz. The margin comes from the range
(about 40 times shorter, 26 to 32 dB less free-space loss), not from a stronger transmitter:
the generic preset radiates 1 W.

## Validation

| Oracle | Test | Result |
|---|---|---|
| ITU-R P.838-3 Table 5, 115 frequencies | `p838_coefficients_reproduce_table5_to_its_printed_digits` | every coefficient within 0.6 of its last printed digit (worst observed 0.51) |
| ITU-R Study Group 3 validation examples (CG-3M3J-13-ValEx-Rev8.3.0), P.618-14 rain | `p618_rain_attenuation_matches_the_itu_validation_examples` | 56 cases within 1e-4 dB (observed 5e-6 dB) |
| Same examples, P.618-14 scintillation | `p618_scintillation_matches_the_itu_validation_examples` | 42 cases within 1e-5 dB |
| ITU-R Study Group 3 Clutter and BEL workbook, P.2109 | `p2109_building_entry_loss_matches_the_itu_workbook` | 568 values within 0.001 dB |
| IS-GPS-200 group-delay ratio `γ = (77/60)²` | `first_order_iono_reproduces_the_is_gps_200_group_delay_ratio` | to 1e-12; L1/L2 and L1/L5 amplification 2.978 and 2.588 |
| Friis kilometre–megahertz form | `free_space_loss_is_the_friis_kilometre_megahertz_form` | to 1e-4 dB |
| arXiv 2509.19551 Table 1 (Pulsar IOV, FOC polar, FOC inclined, GPS) | `doppler_envelope_reproduces_the_pulsar_paper_table_1` | 20 speeds and Doppler maxima within 0.05 % |

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
- The designed-pass and Walker orbits are two-body with an optional secular J2; the TLE path
  uses SGP4. The user's own acceleration is left out of the closed-form Doppler rate (the
  numerical check reports what that costs for a moving user).
- RINEX 4.02 has no LEO navigation records; any RINEX-style LEO export belongs to the
  navigation-message code and is a documented Kshana extension (prior art: arXiv 2401.17767).

## End-to-end LEO-PNT chain

The `leo-pnt-chain` kind ([`src/leo_pnt_chain.rs`](../src/leo_pnt_chain.rs)) follows one
LEO-PNT system from its signal design to the user's position. Each stage is the engine's own
kind, run on its own table of the chain scenario, and the chain hands values from one stage
to the next in code:

| From | To | What is handed on |
|---|---|---|
| `leo-signal` (`[signal]`, `signal_design`) | `leo-pass` | the tracked component's power share, the in-band fraction and the tracked chip rate (the band's EIRP split and its C/N0 offset) |
| `leo-pass` (`[pass]`) | `leo-navmsg` | the chain satellite's altitude and inclination (the message's truth orbit), unless `[navmsg.orbit]` states them |
| `leo-pass` | `leo-pvt` (`[fusion]`) | the tracked C/N0 at the positioning mask and at the zenith, from a least-squares line in sin(elevation) fitted to the pass |
| `leo-navmsg` (`[navmsg]`) | `leo-pvt`, `leo-ppp` (`[ppp]`) | the signal-in-space range error (SISRE): the message's representation error (root mean square, orbit and clock) with the scenario's `od_sisre_m` orbit-determination term in root-sum-square |
| `leo-signal` | `leo-pvt` | the carrier frequency and the tracked chip rate |

A value is handed on only where the downstream table leaves it unset, and every hand-off is
listed in the result's `handoffs` array with its value, unit and target. A band of `[pass]`
must name the design (`signal = "<design>"`); that is how a `leo-pass` band carries any
`leo-signal` design on its own too: it takes the design's centre frequency, transmit
bandwidth and tracked chip rate, splits its EIRP across the components, and reports the
tracked-component C/N0 and the band-limited coherent early-late code-tracking jitter
(Betz and Kolodziejski 2009; half-chip spacing, 1 Hz loop, 20 ms) at every epoch.

Scenarios:

| Scenario | System | Result of one run |
|---|---|---|
| `leo-pnt-end-to-end` | generic: the representative `generic-l` design, a 1080 km, 53° pass over Madrid, a 240-satellite Walker layer | tracked C/N0 peak 58.2 dB-Hz, median code jitter 0.050 m; SISRE 0.250 m handed on; GNSS-only root-mean-square (RMS) 3D error 1.60 m, GNSS + LEO 0.43 m; precise point positioning (PPP) convergence 11.5 min GNSS only, 7.5 min with the LEO layer |
| `xona-pulsar-end-to-end` | Xona Pulsar X5 (arXiv 2509.19551), the inclined shell for positioning and both shells for PPP | tracked C/N0 peak 66.3 dB-Hz, median code jitter 0.018 m; GNSS-only RMS 3D error 1.49 m, GNSS + LEO 0.68 m; PPP convergence 20.6 min GNSS only, 5.9 min with Pulsar |
| `celeste-iod-end-to-end` (optional) | Celeste IOD E5 configuration #1 with the Celeste message preset (withheld with the preset) | peak total C/N0 57.5 dB-Hz (the preset's calibration); two satellites barely move a 95-minute fused fix (1.50 m to 1.48 m RMS 3D) |

```
kshana scenarios/leo-pnt-end-to-end.toml --animate html --export all
```

writes the result, the chart, the advanced report (which embeds the animated pass and links
the exports), the interactive player, and CZML (the Cesium Language), KML (Keyhole Markup Language),
GeoJSON and STK (Systems Tool Kit) ephemeris files of the pass geometry.

The chain is MODELLED: it adds no physics, and each stage keeps its own labels. The
positioning stage's C/N0 model is a straight line in sin(elevation), so a pass-specific
shape is reduced to two numbers; the message stage models no orbit determination, which is
why `od_sisre_m` is a stated input (0.25 m in the bundled scenarios, representative of the
decimetre-level on-board orbit determination and steered chip-scale clock the ATOMIC payload
reports: <https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/>).
