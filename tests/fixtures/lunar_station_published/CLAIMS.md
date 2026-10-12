# Lunar reference station: numeric claims in the public sources

Every numeric claim in sources S1 to S5 (`tests/fixtures/lunar_station/SOURCES.md`) that bears on what a
lunar differential reference station delivers. Each claim has its source, page (PDF page = slide number
for the decks), table or figure, the source's exact wording, and the assumptions the source states.
Each claim is then classified as:

- **comparable**: the `lunar-station-coverage` kind computes the same quantity under the same stated
  assumptions;
- **partly comparable**: the kind computes a closely related quantity, but some assumptions are missing
  from the source or differ. The missing ones are listed, with the values used in their place;
- **not comparable**: the reason is given.

Only the first two classes are scored, under the bars in `PREREGISTRATION.md`. "NovaMoon" and "Moonlight"
appear below only inside quotations and source titles. The project's own term is "lunar reference
station". Nothing here is a statement about the performance of any real system. The sources' claims are
recorded as claims.

Transcribed 2026-10-12 from the files whose SHA-256 is in `SOURCES.md`.

## 1. Accuracy and coverage claims for the differential service

| claim | source | where | exact wording | number | assumptions the source states | class | scored as |
|---|---|---|---|---|---|---|---|
| C1 | S1 | p2, Abstract | "NovaMoon will enable sub-metre to decimetre positioning in the south polar region, provide local differential corrections for lunar navigation users" | < 1 m (code); ~0.1 m (not separated) | none: no percentile, region, constellation, SISE or technique (code or carrier phase) stated | partly comparable (the sub-metre half). The decimetre half is not comparable: it needs carrier phase (S2 p13), which the kind does not model | K3 |
| C2 | S1 | p3, §1 | "Its purpose is to enhance the accuracy of Moonlight's PNT services to sub-metre levels across the lunar South Pole region." | < 1 m | region "South Pole region" not bounded in S1 | partly comparable | K1, K3 |
| C3 | S1 | p4, §2 item 1 | "...to lunar users (e.g., rovers, astronauts, landers) across the entire South Pole region. This will enable Moonlight differential code-only (DGNSS) and code-plus-phase (RTK) positioning across the whole South Pole." | none (coverage statement) | code-only and code-plus-phase; region unbounded | partly comparable (code-only coverage) | K1 |
| C4 | S1 | p5, §2 | "By broadcasting real-time range corrections, it augments LunaNet Service Provider (LNSP) such as Moonlight, facilitating sub-meter level positioning" | < 1 m | real-time range corrections | partly comparable (same as C2) | K3 |
| C5 | S2 | p8 | "Sub-meter level accuracies over the whole Lunar South Pole !" | < 1 m | none on the slide | partly comparable | K1 |
| C6 | S2 | p10 (title, figure, text) | "Single NOVAMOON station may provide Sub-meter accuracies over the whole South pole (Artemis Lunar exploration area)"; "Our analysis demonstrate that a Single station will serve the whole South Pole" | < 1 m. Figure: circles at 80° (300 km) and 70° (600 km) from the pole, labelled "ARTEMIS SERVICE AREA" | "NO ionosphere", "NO troposphere", "Minimum Orbital projection error", "Lunar South pole message reception"; ODTS estimation; MSG-G31 differential corrections | partly comparable. The region is drawn but not said to be the 300 km or the 600 km circle, so both are scored. Percentile not stated (95 used) | K1 (300 km), K2 (600 km) |
| C7 | S3 | p20 | "A well-placed single Moonlight LCNS Differential Station could serve all South Pole area allowing sub-metre accuracies in real time." | < 1 m | "R&D on-going" | partly comparable (same claim as C6) | K1 |
| C8 | S3 | p23 | "NOVAMOON performances: Sub-meter accuracies over the whole South pole (Artemis Lunar exploration area)"; "Our analysis demonstrate that a Single station will cover the whole South Pole" | < 1 m; same 300 km / 600 km figure as S2 p10 | same four bullets as S2 p10 | partly comparable (duplicate of C6) | K1, K2 |
| C9 | S3 | p22 | "...will compute Moonlight NAV satellite pseudorange error corrections and broadcast these via the Moonlight PNT Channel allowing decimeter level navigation accuracies over the whole Lunar South Pole (ARTEMIS service area) to standard LunaNet users." | ~0.1 m from pseudorange (code) corrections | pseudorange corrections; ARTEMIS service area | partly comparable. Note: this disagrees with S2 p13, which gives sub-metre for code-only corrections and few-dm only with carrier phase | K4 |
| C10 | S5 | p5 | "Compute and broadcast Moonlight NAV satellite pseudo-range corrections → decimeter level navigation accuracies over the Lunar South Pole to standard LunaNet users." | ~0.1 m from pseudorange corrections | as C9 | partly comparable (duplicate of C9) | K4 |
| C11 | S2 | p13, figure | "Expected performance Moonlight + NovaMoon at Lunar South Pole (covariance analysis)"; "Precision at: sub-meter level [code-only corrections] / few-dm level [code and phase corrections]" | formal 1-σ E/N/U precision of a filter after convergence; plotted values ~0.3–1.0 m (code-only, E and N) and < 0.25 m (code and phase) | covariance analysis of a filter over ~5×10⁴ epochs | not comparable: a filter's formal (covariance) precision, not an empirical error percentile. The kind is a snapshot Monte Carlo of the actual error | – |
| C12 | S2 | p15, figure | "Lunar surface rover in dynamic mode (15 hours simulation)"; "Sub-meter performance can be consistently achieved" | East and North errors within about ±1 m after convergence (read from the plot, not printed) | 1 s update rate; "soft height-constraint"; "~constant # sats" (4, PDOP about 1.3–3.3 on the plot); "cor. transm. period = 1 s"; the p14 set-up below | partly comparable. Missing: filter, height constraint and DEM (the kind is an unconstrained 3-D snapshot), baseline (p14 lists 10, 100 and 500 km), percentile. Scored on the 3-D p95, which is stricter than the source's horizontal error | K3 |
| C13 | S2 | p16, figure | "Impact of delays in the corrections transmission"; "Simulation Analysis when corrections provided with a delay of 600 secs and limited satellite availability"; "Sub-meter performances are maintained with corrections latency reaching 600s and with limited satellite availability" | East and North within about ±1 m (plot) at 600 s latency | "hard height-constraint", "varying # sats", "cor. transm. period = 600s" | partly comparable (as C12, with latency 600 s) | K5 |
| C14 | S2 | p17, figure | "Time-To-First-Fix (TTFF): timespan needed to reach HNSE of 1m"; "A longer the baseline affects the TTFF but maintains the same accuracy performances upon convergence" | TTFF about 48–290 s (bars for 10, 100 and 500 km baselines; 4 or 3 sats; height constraint on or off; high or low data quality) | filter convergence; p14 set-up | TTFF: not comparable (filter convergence; the kind is a snapshot). The clause "maintains the same accuracy performances upon convergence" across 10 to 500 km is partly comparable as a ratio of corrected errors at two distances | K6 |
| C15 | S2 | p14 | set-up of the C12–C14 simulation (inputs, not claims): see section 3 | – | – | inputs | – |
| C16 | S2 | p21, table | "The Moonlight SISE requirement is 10m 95% (FOC) and NovaMoon estimated SISE improvements to 0.5m (TBC) 95%." | SISE 10 m → 0.5 m (TBC), 95 % | none beyond the slide | not comparable through the kind: it reports position-domain errors, not the range-domain residual SISE. It is recorded so a later range-domain check can use it | – |
| C17 | S2 | p21, table | "NovaMoon, by providing differential correction which would reduce the SISE of the satellites, will improve landing accuracy ~ 4 meters (rms)"; table "3D error: Min 0.18179 m, Max 42.911 m, Mean 3.5585 m, 68th perc. 4.1379 m, 95th perc. 8.3266 m, 99th perc. 11.932 m" | landing 3-D error statistics | lander descent with reduced SISE; landing GNC not described | not comparable: a dynamic lander GNC solution with sensors the kind does not model | – |
| C18 | S2 p22, p27; S1 p2 | p22, p27 | "With NOVAMOON submetre/decimetre-level navigation accuracies will be available on real time on the Moon." / "A first-ever PNT local differential station on the lunar surface providing sub-metre accuracies" | < 1 m | none | partly comparable (duplicate of C1 and C5) | K3 |

## 2. Claims about the uncorrected service and other quantities (not scored)

| claim | source | where | exact wording | number | why not scored |
|---|---|---|---|---|---|
| U1 | S2 p3, S3 p11 | table | "Moonlight FOC PNT Performances (from 2030)": "Surface Rover Real time < 10 m (95%)", "Post-processing < 3 m (95%)", "3-5 meters"; "Lunar Lander Real time < 50 m (95%)", landing "~20 meters"; "Lunar Orbiter < 100 m (95%)", LLO "30-60 meters" | as stated | Uncorrected accuracy. In the kind it is driven by the injected SISE, which is itself taken from the sources, so a "reproduction" would be close to circular (plan B2). The rover figures also use DEM aiding (S3 p18) and a filter. Reported descriptively next to the run, not scored |
| U2 | S3 p16 | figure | "the achieved final landing horizontal precision obtained is around 20 m !! (bellow 50 m Spec)"; "0.28 m/s", "19.6 m" | 19.6 m, 0.28 m/s | lander GNC with IMU and altimeter; not modelled |
| U3 | S3 p18 | figure | "Combining Moonlight LCNS signals with Digital Elevation model (DEM) information Position errors obtained are around 5 meters (3 sigma) - below 10 m spec !" | ~5 m, 3-σ | DEM-aided rover, uncorrected; circular in the sense of U1 |
| U4 | S3 p6 | figure | "Kalman Filter Position Error 3D: 93.83 m"; "Kalman Filter Velocity 3D RMS = 0.08453 m/s" | 93.83 m; 0.0845 m/s | Lunar Pathfinder hardware-in-the-loop test with Earth GNSS in lunar orbit; a different system |
| U5 | S4 p8 | text | "OWR Real time SISE velocity. 1,5 mm/s at least 95% of the time over any 24 hours"; "OWR service availability. 95%, computed over 3 months"; "PVT Service availability 95%, computed over 3 months" | 1.5 mm/s; 95 %; 95 % | Velocity is not modelled. Service availability includes outages and operations over 3 months, while the kind's availability is geometric only |
| U6 | S1 p4, p5; S2 p12, p27; S3 p22; S5 p5 | text | station localisation: "sub-decimetre accuracy" (S1 p4); "centimetre- to sub-decimetre-level" (S1 p5); "cm-level position determination" and "3D localisation accuracies down to cm-level" (S2 p12); "A lunar reference 3D position established at cm-level" (S2 p27); "locate the Argonaut lander station at cm-level accuracy" (S3 p22); "at few cm-level accuracy" (S5 p5) | 0.01–0.1 m | Geodetic localisation of the station (workstream E), not a coverage output. Used as the input `survey_sigma_m` (section 3) |
| U7 | S1 p47–48, Table 6 | table | "VLBI < 1mas (TBC), 2 weekly sessions of 24 hours"; "LLR < 1 cm (TBC), 1/3 of Apollo 15's data"; "AFS As per LNIS service definition, continuous"; "GNSS [opt.] < 10 m (TBC), continuous"; "DWE 1 cm (TBC), During LLR gaps"; final positioning requirement "at centimetre level or below" (p47) | as stated | measurement requirements for workstream E; not a coverage output |
| U8 | S1 p42, Table 4 | table | candidate clocks (accuracy; stability /h; stability /day; mass; power): "PHM few e-12, 0.06 ns, 0.001us, 18kg, ~60W"; "RAFS < 1e-10, 0.5 ns, 0.1us, 3.2kg, ~30W"; "miniRAFS < 1e-10, 0.7 ns, 0.1us, 500g, <10W, ... 2028"; "CSAC few e-10, 5 ns, 1us, 300g, < 5W"; "Low Power-CSAC few e-10, 5 ns, 1us, 150g, < 0.5W" | as stated | inputs for workstream D (time laboratory), not a coverage output |
| U9 | S3 p22; S1 p41; S5 p3 | text | "embarking a miniRAFS atomic clock, setting the lunar international standard time (at ns-level)" (S3 p22); "one order of magnitude below the NovaMoon objectives (1ns)" (S1 p41); "Time w.r.t. reference timescale / UTC: 10 ns / 100 ns" (S5 p3, needs) | 1 ns; 10 ns; 100 ns | time targets for workstream D, quoted and not adopted as claims (plan D1) |
| U10 | S1 p16 | text | "the gravitational redshift due to the altitude, maximum 3 x 10-13 (or about 30 ns/day) as seen in Figure 5 or Figure 6, centred on the South Pole" | 3×10⁻¹³; ~30 ns/day | lunar-time consistency, not coverage (section 4) |
| U11 | S1 p18 | text | "the contribution from item (iii) (i.e. TCG-TCL) in the proper time difference shows a 1.5 µs/day secular drift (i.e. a 1.7 10-11 relative frequency shift) plus monthly and diurnal variations. The monthly term has an amplitude of about 300 ns, and the diurnal terms have an amplitude of about 60 ns"; "If the NovaMoon clock frequency accuracy is better than 1e -11 ... a first demonstration of the gravitational redshift ... will not be sufficient to distinguish the NovaMoon altitude, which would require a frequency accuracy at the level of 1e-13 or better" | 1.5 µs/day; 1.7×10⁻¹¹; 300 ns; 60 ns; 1e-11; 1e-13 | lunar-time consistency (section 4) |
| U12 | S5 p7 | text | "Option 1: Lunar Coordinate Time (TCL) ... A perfect clock on the moon selenoid would drift about ~3 μs/day w.r.t. the reference." | ~3 µs/day | lunar-time consistency (section 4) |
| U13 | S5 p5, p6 | text | "The NovaMoon baseline clock is not sufficiently accurate to sense the frequency offset between TCL and TL."; "Early clocks on the moon deployed by ESA are expected to not be able to sense the frequency difference between TCL and TL." | qualitative | lunar-time consistency (section 4) |
| U14 | S1 p43 | text | "NovaMoon mission is expected to reach 15 dB-Hz sensitivity in tracking and 18 dB-Hz in acquisition"; "up to 16 satellites could be visible when considering GPS+Galileo constellations, whereas limited to around 6 for a low gain antenna" | 15 / 18 dB-Hz; 16; 6 | the station's Earth-GNSS receiver; not modelled by the kind |
| U15 | S2 p25 | table | "Total Baseline 185 [W peak] 101 [W nominal] 28.6 [kg]"; "w/ Margin (20%) 222 121.2 34.32"; "w/ options 260 131 40.125"; with margin "312 157.2 48.15" | as stated | payload budget; not modelled |
| U16 | S1 p2–3; S2 p2, p6, p26; S3 p8, p21, p27; S4 p3, p10 | text | launch and service dates (see `SOURCES.md`, notes) | 2028–2031 | dates; recorded discrepancy, not modelled |

## 3. Input values the sources give (for the scenario TOML)

`lunar-station-coverage` scenarios should cite these by id. Where no public value exists, the in-tree
value is used and labelled `ILLUSTRATIVE (no public source)`.

| input (plan A3 name) | value | source and exact wording | label |
|---|---|---|---|
| `n_sats` | 4 | S2 p14: "Moonlight NAV Constellation of 4 satellites (SISE ~ 10m 95%)". S4 p10: "PFM NAV available for Launch Q4 2028 (IOC)"; "FM 2, 3, 4 available for Launch Q2 2030 (FOC) (TBC)". S4 p12: "a constellation of 4/5 satellites" | S2 p14, S4 p10 |
| orbit type | elliptical lunar frozen orbit | S4 p6: "Elliptical Lunar Frozen Orbits (ELFOs) to obtain a constant eccentricity, inclination and argument of pericenter" | S4 p6 |
| period / `sma_km` | 24 h; 9737.4 km (in-tree default, which gives 23.95 h) | S4 p6: "The NAV satellites have an orbital period of 24hr and a semi-major axis of about 10000 km". 10000 km would give 24.93 h about the Moon (GM 4902.80 km³/s²), so the 24 h period is the binding figure | S4 p6 (period); value in-tree |
| `eccentricity`, `inc_deg`, `argp_deg`, node and phasing | 0.6, 57.7°, 90° (in-tree defaults) | not given in S1 to S5 (S4 p6 states only that they are frozen) | ILLUSTRATIVE (no public source) |
| SISE, 95 % | 10 m | S4 p8: "OWR Real time SISE positioning. 10 m at least 95% of the time over any 24 hours". S2 p21: "The Moonlight SISE requirement is 10m 95% (FOC)". S2 p14: "SISE ~ 10m 95%" | S4 p8, S2 p21 |
| `sise_sigma_m` | 5.10 m (= 10 / 1.95996) | derived from the row above, assuming a zero-mean Gaussian line-of-sight error and reading 95 % as two-sided. The sources state neither | S4 p8 (derived); the Gaussian reading is this project's |
| orbit/clock split of the SISE variance | 50/50 | not given | ILLUSTRATIVE (no public source) |
| `noise_m` | 0.30 m (high-quality code) or 1.0 m (low-quality code), at zenith | S2 p14: "Quality of measurements is assumed to be identical at both receivers. Code: 30 cm (high quality) or 1 m (low quality) at zenith" | S2 p14 (no elevation dependence modelled) |
| `latency_s` | 1 s; 600 s for the latency case | S2 p15: "cor. transm. period = 1 s"; S2 p16: "corrections provided with a delay of 600 secs"; S2 p14: "1 Hz code and phase measurements" | S2 p15, p16 |
| `survey_sigma_m` | 0.10 m | S1 p4: "precise localisation of the NovaMoon station with sub-decimetre accuracy"; S1 p5: "centimetre- to sub-decimetre-level"; S2 p12: "cm-level"; S5 p5: "few cm-level". These are the end-state targets of the co-located geodesy, not a survey available on day one. 0.10 m is the loosest of them | S1 p4 |
| `quantization_bits` | 8 (in-tree default) | not given. The message is named: S2 p9–10, "MSG-G31 Augmentation Differential Corrections, Category O, Subframe SB3 and/or SB4, Ad-hoc", LunaNet Signal-In-Space Recommended Standard – Augmented Forward Signal | ILLUSTRATIVE (no public source) |
| `mask_deg` | `lunar_service` default | not given | ILLUSTRATIVE (no public source) |
| `station_lat_deg`, `station_lon_deg` | −89.4765, −138.135 | S2 p19, "Selected example site for NovaMoon simulation analysis", row 2 "Shackleton-Henson Ridge, lat -89.4765, lon -138.135". Other rows: 1 "Shackleton Crater Rim" −89.7552, −158.162; 6 "Peak near Slater" −88.8107, 123.624; 7 "Peak at De Gerlache Rim (DGR2)" −88.6406, −68.1379 | S2 p19 |
| `station_height_m` | 0 | not given | ILLUSTRATIVE |
| region | lat ≤ −80° (300 km circle) and lat ≤ −70° (600 km circle) | S2 p10, S3 p23 figure: "70°", "80°", "600 Km", "300 Km", "ARTEMIS SERVICE AREA". S4 p3 and S3 p9: "Optimised For South Pole services [ 70-90° South]". S4 p7: "SV1 – South Pole (surface of the Moon -75° - 90°)" | S2 p10 |
| `accuracy_threshold_m` | 1.0 m | the "sub-metre" of C1–C8 | S2 p10 and others |
| `percentile` | 95 | not stated with any accuracy claim. 95 matches the Moonlight requirement convention (S4 p8; S2 p3) | this project's reading |
| simulated set-up (for reference) | 15 h, 1 Hz, ≥ 3 satellites in common view, baselines 10, 100 and 500 km, DEM with 5 m uncertainty, 5 m/pixel | S2 p14 | S2 p14 |
| `alert_limit_m` | none public for a surface user | not given | ILLUSTRATIVE (no public source) |

## 4. Lunar time: consistency of S1 and S5 with `src/lunar_time.rs` (for workstream D; not scored here)

| quantity | source | in-tree | consistent? |
|---|---|---|---|
| surface clock against TCL | S5 p7: "~3 μs/day" | `LunarSurfacePotential::KSHANA.l_m()` (`src/lunar_gauge.rs`) ≈ 3.14×10⁻¹¹, i.e. ≈ 2.71 µs/day (GM/R/c² with R = 1737.4 km gives the same) | yes, to the precision quoted ("~3") |
| geoid potential used for the redshift map | S1 p17, Figure 6: "2.82100e+06 m²/s²" | GM_moon / 1737.4 km = 2.8219×10⁶ m²/s² | yes (0.03 %) |
| TCG−TCL secular rate | S1 p18: "1.5 µs/day ... (i.e. a 1.7 10-11 relative frequency shift)" | `TCG_TCL_RATE_REF_NS_DAY` = 1469 ns/day; `tcg_tcl_secular_rate_ns_per_day()` ≈ 1499 ns/day | yes |
| redshift spread over the south-polar region | S1 p16: "maximum 3 x 10-13 (or about 30 ns/day)" | `topographic_spread_ns_per_day()` ≈ 26 ns/day over a 16.67 km elevation span | yes, same order (different spans) |
| can a miniRAFS-class clock sense TCL−TL? | S5 p5, p6: no | miniRAFS accuracy "< 1e-10" (S1 Table 4) exceeds L_m ≈ 3.1×10⁻¹¹ | yes, consistent with S5 |
