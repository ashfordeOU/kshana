# LEO-PNT in Kshana

LEO-PNT is positioning, navigation and timing (PNT) from satellites in low Earth orbit
(LEO), alongside or instead of the medium Earth orbit (MEO) global navigation satellite
systems (GNSS) such as the Global Positioning System (GPS) and Galileo. This page ties together every LEO-PNT kind and scenario of the engine: what
each computes, the bands and signal presets and where their numbers come from, what the
navigation message carries, what is VALIDATED and what is MODELLED, and how to run each
scenario. The kind pages go deeper:

| Page | Kinds |
|---|---|
| [LEO-SIGNAL.md](LEO-SIGNAL.md) | `leo-signal` (signal designs) and the multi-band `spectrum` panels |
| [LEO-PASS.md](LEO-PASS.md) | `leo-pass` (pass geometry and link budget per band, low-energy fixes, ionosphere sounding, spoofing monitors) |
| [LEO-NAVMSG.md](LEO-NAVMSG.md) | `leo-navmsg` (the broadcast message: fitter, user algorithm, binary and text formats) |
| [LEO-PNT-FUSION.md](LEO-PNT-FUSION.md) | `leo-pvt`, `leo-ppp`, `ntn-positioning` (fused positioning, precise point positioning, 5G non-terrestrial network (NTN) positioning, timing, polar coverage) |
| [SPECTRUM.md](SPECTRUM.md) | `spectrum` (jamming waterfalls and the jammer-to-signal ratio (J/S) per band) |
| [CAMPAIGNS.md](CAMPAIGNS.md) | `campaign` (chains, sweeps, Monte Carlo and compositions of any kinds) |

## System-agnostic first

The engine is a generic LEO-PNT simulator. Any constellation (a Walker pattern, explicit
orbital elements, a two-line element set (TLE) through the Simplified General Perturbations 4 (SGP4) propagator, or a designed single pass), any
signal design (any band, any mix of binary phase-shift keying (BPSK), binary offset carrier
(BOC) and frequency-division multiple access (FDMA) components), any navigation-message
model. Named systems are optional presets: data files, each with its source, which fill
only what a scenario leaves out. Every capability, test, oracle and bundled scenario runs
with no Celeste data present.

The Celeste IOD (in-orbit demonstration) preset is one optional preset among them. Its
signal parameters were presented at the ESA NAVISP (European Space Agency Navigation
Innovation and Support Programme) LEO-PNT workshop, 2026, and have no public source yet.
Every workshop-derived number of the engine lives in one file,
[`src/celeste_iod.rs`](../src/celeste_iod.rs), which `build.rs` compiles in only when it
exists, and in the repository-only scenarios `scenarios/*celeste-iod*.toml`. Deleting that
file and those scenarios withholds the preset with no source edit; every other test, oracle
and scenario runs without it (`tests/workshop_preset_isolation.rs` guards which files may
name it). This page gives none of its numbers.

## The kinds and how they connect

| Kind | What one run computes | Label |
|---|---|---|
| `leo-signal` | a signal design's band-limited power spectral density (PSD), power in band, root-mean-square (Gabor) bandwidth, code-tracking jitter against carrier-to-noise density (C/N0), acquisition search, and spectral separation coefficients (SSC) against GNSS signals; a band trade (ultra high frequency (UHF), L, S, C) | closed forms VALIDATED, designs and trade MODELLED |
| `spectrum` (multi-band panels) | per-band waterfalls with per-band jammers (continuous wave (CW), chirp, narrowband, wideband, matched), each signal's J/S and effective C/N0 over a timeline | spectra VALIDATED, jammers MODELLED |
| `leo-pass` | pass geometry, Doppler and Doppler rate, free-space loss, satellite and user antennas, ITU-R (International Telecommunication Union, Radiocommunication Sector) gaseous, rain, scintillation and building entry loss, C/N0 per band and epoch beside the MEO GNSS carriers; ionosphere per band and the ionosphere-free pairs; low-energy fixes; ionosphere sounding; spoofing monitors | components VALIDATED, pass MODELLED |
| `leo-navmsg` | the broadcast ephemeris and clock message: fitter, signal-in-space range error (SISRE) against fit interval and update period, mid-pass update continuity, user algorithm, binary frame with a 24-bit cyclic redundancy check (CRC-24Q), exports in the style of RINEX 4 (Receiver Independent Exchange Format) and as comma-separated values (CSV) | user algorithm, weights and CRC VALIDATED, fits MODELLED |
| `leo-pvt` | Doppler positioning, joint GNSS + LEO pseudorange fixes with inter-system biases, polar and Arctic geometry, time transfer to Coordinated Universal Time (UTC), with an optional per-epoch time-error trace | maximum Doppler VALIDATED, rest MODELLED |
| `leo-ppp` | precise point positioning (PPP) convergence with GNSS only and with LEO layers | MODELLED |
| `ntn-positioning` | 5G NTN positioning accuracy from the downlink bandwidth (Cramér-Rao bound) | MODELLED |
| `leo-pnt-chain` | one system end to end: signal design, pass, message, fused fix and PPP, every hand-off listed | MODELLED |
| `campaign` | any of the above chained on one timeline, swept, run as a Monte Carlo ensemble or composed under shared conditions | MODELLED |

The chain hands values in code (see [End-to-end LEO-PNT chain](#end-to-end-leo-pnt-chain)
below): the signal design sets the pass band's EIRP (equivalent isotropically radiated
power) split and tracked chip rate; the pass gives the tracked C/N0 and code jitter; the
navigation message's SISRE and the pass C/N0 weight the LEO measurements of the fused fix.

## Bands

The generic designs use public band centres; each is REPRESENTATIVE, not any system's
signal (`data/leo-signals/generic-bands.toml`, `generic-c-band.toml`).

| Band | Allocation | Generic design | Centre | Transmit bandwidth | Components | First-order ionospheric delay relative to L |
|---|---|---|---|---|---|---|
| UHF | not a radionavigation allocation (representative); carrier from the public [openRECEIVER survey](https://open-receiver.com/blogs/leo-pnt-signals-celeste/) (page since withdrawn; see [LEO-SIGNAL.md](LEO-SIGNAL.md#references)) | `generic-uhf` | 465 MHz | 10 MHz | BPSK(5) pilot and data | 6.6 × |
| L | radionavigation-satellite service (RNSS), the Galileo E5 centre | `generic-l` | 1191.795 MHz | 20.46 MHz | BPSK(10) pilot and data | 1 |
| S | radiodetermination-satellite service (RDSS), the S carrier of NavIC (Navigation with Indian Constellation) | `generic-s` | 2492.028 MHz | 16.5 MHz | BPSK(5) pilot and data | 0.23 × |
| C | RNSS, centre of the 5010–5030 MHz allocation | `generic-c`, `generic-c-band-leo` | 5020 MHz | 20 MHz | BPSK(10) pilot and data | 0.056 × |
| C extended | outside the RNSS allocation (representative) | `generic-c-wide` | 5100 MHz | 120 MHz | BPSK(50) pilot and data | 0.055 × |
| S (mobile-satellite service, MSS) | MSS downlink, 3GPP (Third Generation Partnership Project) band n256 | used by `ntn-positioning` | 2172.5 MHz | 0.18 to 20 MHz | 5G New Radio positioning signals | 0.30 × |

BPSK(n) is binary phase-shift keying at n × 1.023 Mchip/s. The delay ratio is `(f_L/f)²`
with `f_L` = 1191.795 MHz. The free-space loss grows by `20·log10(f/f_L)` at the same
range (−8.2 dB at UHF, +6.4 dB at S, +12.5 dB at C).

## Signal and system presets

| Preset | Source | What it carries |
|---|---|---|
| `generic-bands`, `generic-leo` | REPRESENTATIVE, band centres from the ITU Radio Regulations | `generic-bands` (signal designs): the band table above; `generic-leo` (the `leo-pass` default): UHF at 450 MHz, L, S and C at the centres above, 0 dBW EIRP per band, a 550 km sun-synchronous Walker 240/12/1 layer |
| `generic-c-band` | REPRESENTATIVE, for C-band systems whose parameters are not public (for example TrustPoint) | BPSK(10) at 5020 MHz, isoflux beam |
| `xona-pulsar` | PUBLIC: Leclère, Marathe and Reid, Institute of Navigation (ION) GNSS+ 2025, [arXiv 2509.19551](https://arxiv.org/abs/2509.19551) | X1 at 1593.3225 MHz (1.023 Mchip/s) and X5 at 1190.51625 MHz (10.23 Mchip/s), the published minimum and maximum received powers, 258 satellites at about 1080 km (53 and 97 deg shells) |
| `iridium-stl` | PUBLIC: [Resilient Navigation and Timing Foundation (RNTF) briefing](https://rntfnd.org/wp-content/uploads/Recent-PNT-Improvements-and-Test-Results-Based-on-Low-Earth-Orbit-Satellites.pdf) | bursts in 1616–1626 MHz, Doppler up to ±36 kHz, 66 satellites at 780 km (781 km in the `leo-pass` preset), received power "300 to 2400 times GPS" |
| `starlink-soo` / `starlink-soop` / `starlink-sop` (signal, pass and positioning kinds) | PUBLIC signal figures: Kozhaya, Saroufim and Kassas, [NAVIGATION 72(1)](https://navi.ion.org/content/72/1/navi.685); REPRESENTATIVE orbit | a 240 MHz Ku-band beacon used for Doppler only, C/N0 about 57 dB-Hz |
| `centispace` | PUBLIC signal structure: [PMC10301026](https://pmc.ncbi.nlm.nih.gov/articles/PMC10301026/); REPRESENTATIVE orbit and power | BPSK at 2.046 Mchip/s near L1 and L5 |
| `atomic-zero-clock` (`atomic` in the message kind) | PUBLIC: [InsideGNSS, ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations) payload](https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/) | a 6th-order polynomial ephemeris with no clock terms (the clock is steered to GNSS time) |
| `celeste-iod` (optional) | WORKSHOP: presented at the ESA NAVISP LEO-PNT workshop, 2026 | the in-orbit demonstration's signal configuration #1 and message layout, in the one withholdable file |

Every preset marks its numbers PUBLIC (with a URL), REPRESENTATIVE (a documented design
choice, never a claim about a real system) or WORKSHOP, and the result of every run that
uses one says which.

## The navigation message

A LEO navigation message ([LEO-NAVMSG.md](LEO-NAVMSG.md)) carries four parts, the
structure the Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD)
and the published LEO proposals share:

| Part | Content |
|---|---|
| Ephemeris | the Galileo ICD 16-parameter Keplerian set (square root of the semi-major axis, eccentricity, inclination and its rate, right ascension of the node and its rate, argument of perigee, mean anomaly, mean-motion correction, six harmonic corrections, reference time), plus along-track, cross-track and radial correction polynomials; or the Liu et al. 2025 22-parameter model ([doi 10.3390/rs17162894](https://doi.org/10.3390/rs17162894)); or the ATOMIC zero-clock polynomial |
| Synchronisation | week number and time of week (TOW), and a second-order clock polynomial (af0, af1, af2 about toc) |
| Auxiliary | space-vehicle identifier (SVID), issue of data (IOD), signal health |
| Other services | ionospheric corrections for single-frequency users (a Klobuchar-style set and NeQuick-G ai0–ai2) and the system-time-to-UTC offset (A0, A1, leap seconds and their schedule) |

The binary frame is Kshana's own documented encoding modelled on these components, not any
system's bit layout. RINEX 4.02 defines no LEO navigation records, so the RINEX-style
export is a documented Kshana extension (prior art: [arXiv 2401.17767](https://arxiv.org/abs/2401.17767)).

## Resilience

| Scenario | Kind | Result of one run |
|---|---|---|
| `leo-resilience-multiband-diversity` | `campaign` sweep of `spectrum` | a 50 MHz barrage at 1185 MHz swept from −140 to −80 dBW: GPS L5 is lost at −105 dBW, Galileo E5a and the LEO L-band signal at −100 dBW; the UHF, S- and C-band LEO signals keep 49.4, 49.2 and 47.4 dB-Hz at every power |
| `leo-resilience-js-margin` | `spectrum` | a 40 MHz barrage at 1185 MHz stepping up 5 dB every 10 s from −125 dBW: GPS L5 lost at −105 dBW, Galileo E5a at −100 dBW, Xona X5 (at its published minimum, −144.9 dBW) at −95 dBW; a generic LEO signal at −135 dBW still tracks at −90 dBW (28.9 dB-Hz). Received power buys J/S margin dB for dB |
| `leo-resilience-spoof-doppler` | `leo-pass` `[spoofer]` | a 30 m position jump at a surveyed site: the GNSS-only Doppler test never detects it; the test on every channel does, 105 s after the onset (see [LEO-PASS.md](LEO-PASS.md#spoofing-monitors-spoofer)) |
| `leo-resilience-spoof-monitors` | `campaign` compose of `leo-pass` | four spoofers, both monitors: an L-band-only spoofer and an all-band spoofer without ionosphere are caught by the cross-band monitor at the onset (300 s) and by the Doppler monitor at 420 s and 395 s; an ionosphere-aware all-band spoofer only by the Doppler monitor (395 s); a GNSS-only 30 m push by neither |
| `leo-resilience-gnss-jammed-leo-carries` | `campaign` chain (`spectrum`, `integrity`) | GNSS jammed for 15 minutes (GPS L1 coarse/acquisition (C/A) code to about 10 dB-Hz, E5a to 17.4 dB-Hz against a 25 dB-Hz floor) while the S- and C-band LEO signals hold 49.2 and 47.4 dB-Hz; receiver autonomous integrity monitoring (RAIM) on the LEO layer alone forms a protection level at every epoch, under the 50 m vertical alert limit at 28 of 30 grid times, with the alarm raised at the other two; nominal and recovery phases 5.4 to 15.6 m |

The spoofing monitors, their statistics and their limits are on
[LEO-PASS.md](LEO-PASS.md#spoofing-monitors-spoofer). The multi-band waterfall with a
different jammer per band is `multi-band-jamming-waterfall` ([LEO-SIGNAL.md](LEO-SIGNAL.md)).

## One scenario per experiment focus area

The eight experiment focus areas of the Celeste IOD call for third-party experimentation
(ESA Open Space Innovation Platform, OSIP) are generic LEO-PNT questions; each has a
system-agnostic scenario:

| Focus area | Scenario | Kind | Result of one run |
|---|---|---|---|
| High-accuracy positioning (PPP) | `leo-focus-ppp-altitude` | `campaign` sweep of `leo-ppp` | a 192-satellite layer at 500, 1000 and 1500 km cuts multi-GNSS float PPP convergence at Munich from 13.0 min to 3.25, 3.25 and 3.5 min (six realisations, 30 s epochs) |
| PNT resilience (L, S, C) | `leo-resilience-multiband-diversity` | `campaign` sweep of `spectrum` | see Resilience |
| 5G/6G NTN compatibility | `leo-focus-ntn-bandwidth` | `campaign` sweep of `ntn-positioning` | positioning-reference bandwidth 180 kHz to 20 MHz: zenith range sigma 6.5 m to 5.8 cm, time-of-arrival 3D error 30.1 m to 2.1 m, floored by the 1 m network synchronisation error |
| Low-energy PNT for the Internet of Things (IoT) and mobile | `leo-focus-iot-eirp` | `campaign` sweep of `leo-pass` `[iot]` | UHF EIRP −35 to +5 dBW: below a median C/N0 of about 35 dB-Hz the hot-start energy per fix climbs from 18 mJ to 55 J; above it the battery life at one fix per hour is 8334 days, set by the sleep current |
| LEO-PNT science | `leo-focus-science-iono-sounding` | `leo-pass` | slant total electron content (TEC) from every band pair of a four-band pass over Tromsø: 18.85 TEC units recovered by each pair, 1-sigma 0.017 (UHF with L) to 2.9 TEC units (S with C) |
| Additional PNT data services | `leo-focus-data-services` | `campaign` compose of `leo-navmsg` | the Kshana message frame grows from 146 bytes (ephemeris and clock, 1045 bits) to 154 with the Klobuchar set, 159 with NeQuick-G and 171 with the UTC parameters |
| Indoor navigation (UHF) | `leo-focus-indoor-uhf` | `campaign` compose of `leo-pass` | peak indoor C/N0 in a traditional building: UHF 34.1, L 24.2, S 16.5, C 9.0 dB-Hz; in a thermally efficient one UHF 15.3 dB-Hz and every other band lower |
| MEO + LEO fused PNT | `leo-focus-fused-pnt-sisre` | `campaign` sweep of `leo-pvt` | Xona X5 fused with GPS and Galileo over Madrid: GNSS-only 3D error 1.06 m root mean square (RMS); fused 0.08 m at a 5 cm LEO SISRE, 0.57 m at 0.5 m and 1.01 m at 5 m |

## One scenario per end-user vertical

Each vertical is a `campaign` chain on one timeline, so it animates, and each has a
`leo-pass` member, so it exports geometry (see [Running](#running-a-scenario)).

| Vertical | Scenario | Result of one run |
|---|---|---|
| Autonomous vehicles | `leo-vertical-autonomous-vehicle` | a car in Munich: open road, fused error 0.30 m mean; in a 35 deg urban canyon GPS and Galileo keep 8 satellites and a 5.8 m mean error, the generic LEO layer adds 4 to 5 and brings it to 2.1 m, still above the 1.5 m lane-level threshold at about half the canyon epochs |
| Railway and maritime | `leo-vertical-rail-maritime` | the bundled `maritime-strait-jamming` ship loses every GNSS satellite (12.1 dB-Hz) while its S- and C-band LEO pass reaches 44.2 and 38.1 dB-Hz; the bundled `rail-tunnel-coast` train reaches 2 m of inertial error 35.8 s into the tunnel; in the open its LEO pass gives 35 to 50 dB-Hz in L |
| Critical infrastructure | `leo-vertical-critical-infrastructure-timing` | a substation time server's TCXO-class oscillator (temperature-compensated crystal) free-running through a day without GNSS reaches 29 µs, past the 1 µs guard between 75 and 80 minutes after the loss (on the 5-minute grid); the same class disciplined to Iridium stays within −40 to +11 ns |
| Polar and Arctic users | `leo-vertical-polar-arctic` | GPS + Galileo mean position dilution of precision (PDOP) 1.38, 1.57 and 1.62 at Tromsø, Svalbard and the North Pole; with Iridium 1.29, 1.34 and 1.26, from 3.0, 5.5 and 6.8 Iridium satellites in view |
| Wireless networks 5G/6G | `leo-vertical-5g-network-timing` | a base station's oven-controlled crystal oscillator (OCXO) in holdover crosses the 1.1 µs network limit after 8863 s and the 1.5 µs end-application limit after 10006 s (the `telecom-timing` kind's analysis); disciplined to Xona X5 its time error stays between −0.7 and +0.3 ns all day, with a predicted 1-sigma of 5 ns, the broadcast UTC offset's stated uncertainty |
| Asset tracking and IoT | `leo-vertical-asset-tracking-iot` | a container tag's hot UHF fix costs 18 mJ on the quay and at sea (8334 days of battery at one fix an hour) and 34 mJ in a warehouse (5770 days), where L band falls to 20 to 24 dB-Hz |

## VALIDATED and MODELLED

A row is VALIDATED only when a test reproduces a published setup and pins the published
figure within a stated tolerance; everything else is MODELLED with its rationale
([VERIFICATION-MATRIX.md](VERIFICATION-MATRIX.md), [MODELLED-RATIONALE.md](MODELLED-RATIONALE.md)).

VALIDATED LEO-PNT rows:

- closed-form band-limited signal power and early-late code-tracking jitter at published operating points (Betz and Kolodziejski 2009), with the Gabor bandwidth and SSC cross-checked;
- the maximum Doppler of a LEO navigation satellite (Xona Pulsar X1 32–34 kHz, Iridium ±36 kHz), and the static-user Doppler envelope against arXiv 2509.19551 Table 1;
- ITU-R P.838-3 rain coefficients, P.618-14 rain attenuation and tropospheric scintillation, and P.2109-2 building entry loss against the ITU-R Study Group 3 validation data;
- the first-order ionospheric delay scaling and free-space loss (IS-GPS-200 group-delay ratio, the Friis form);
- the global-average SISRE weights (Montenbruck et al. 2018), the Galileo ICD user algorithm against RTKLIB on real broadcast ephemerides, and CRC-24Q against its catalogue check value.

MODELLED LEO-PNT rows: every signal design and band trade, the multi-band waterfall, every
pass and link budget as a whole, the presets, low-energy fixes, the message fitter and
formats, Doppler and joint positioning, PPP convergence, NTN positioning, time transfer,
polar coverage, the end-to-end chain, the spoofing monitors and ionosphere sounding, and
every campaign (a campaign composes kinds and adds no physics; its composition identities
are tested, [CAMPAIGNS.md](CAMPAIGNS.md)). No LEO C/N0, ranging error or positioning figure
is compared with a measurement of any satellite.

## Running a scenario

Every scenario above is bundled: `kshana example <name>` prints it, and

```
kshana scenarios/<name>.toml --animate html --export all
```

writes, next to the file, the result (`.result.json`), the chart (`.chart.svg`), the
advanced report (`.report.html` and `.report.json`, with a section that embeds the animated
run and lists the exports), the interactive player (`.animation.html`) and the exports.
What applies depends on the kind:

- a run with a time axis animates: `leo-pass` epochs, the `spoof.series` of a spoofing run,
  `spectrum` timelines, `leo-pvt` joint epochs and timing traces, `leo-ppp` error curves
  and every campaign chain. A sweep or a composition has no time axis: `--animate` refuses
  it with exit status 1 and then the command writes nothing at all, so run the eight
  sweeps and compositions above (`leo-resilience-multiband-diversity`,
  `leo-resilience-spoof-monitors` and every `leo-focus-*` scenario except
  `leo-focus-science-iono-sounding`) without `--animate`;
- `leo-pass` and `leo-pnt-chain` export CZML (the Cesium Language), KML (Keyhole Markup
  Language), GeoJSON and STK (Systems Tool Kit) ephemerides of the pass geometry; a
  campaign exports each member that has geometry as its own file set, the member label in
  the file name (`<name>.<member>.czml`), so every vertical exports its LEO passes; the
  other LEO kinds state why a format does not apply ([INTEROP.md](INTEROP.md)).

The remaining LEO scenarios, by kind (details on each kind's page):

| Kind | Scenarios |
|---|---|
| `leo-signal` | `leo-band-trade`, `xona-pulsar-signals`, optional `celeste-iod-classical-pilot-signals` |
| `spectrum` | `multi-band-jamming-waterfall` |
| `leo-pass` | `leo-pass-vs-gnss-cn0`, `leo-pass-xona-pulsar`, `leo-pass-iridium`, `leo-indoor-uhf`, `leo-iot-energy`, optional `leo-pass-celeste-iod-multiband` |
| `leo-navmsg` | `leo-navmsg-fit-interval-trade`, `leo-navmsg-model-comparison`, `leo-navmsg-midpass-update`, `leo-navmsg-encode-decode`, optional `leo-navmsg-celeste-iod` |
| `leo-pvt` | `leo-doppler-positioning`, `starlink-sop-doppler-positioning`, `meo-leo-fused-pvt`, `polar-arctic-leo-coverage`, `leo-timing-utc`, optional `celeste-iod-fused-pvt` |
| `leo-ppp` | `leo-ppp-convergence` |
| `ntn-positioning` | `ntn-5g-positioning` |
| `leo-pnt-chain` | `leo-pnt-end-to-end`, `xona-pulsar-end-to-end`, optional `celeste-iod-end-to-end` |
| `constellation-design` | `leo-pnt-mega-shell` |
| `slot-timing` | `slot-timing-ocxo-leo` |

The optional scenarios are repository-only and are withheld with the Celeste preset file.

Two of them sit in other kinds. `leo-pnt-mega-shell` (`constellation-design`) sizes a
5000-satellite LEO-PNT constellation in four illustrative Walker shells: availability
99.22 % at a PDOP of 3 or less above a 20° mask, median PDOP 1.11 and 39.4 satellites in
view on average over 648 grid points and 12 epochs. `slot-timing-ocxo-leo` (`slot-timing`)
asks how long the datasheet OCXO of a LEO smallsat stays inside a 100 ns slot guard at k = 3
after its last GNSS fix: the guard breaks 650.8 s after a fix, so it needs a fix at least
every 645.8 s (133.8 a day), with random-walk frequency noise the dominant term.

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
| `celeste-iod-end-to-end` (optional) | Celeste IOD E5 configuration #1 with the Celeste message preset (withheld with the preset) | the pass reproduces the peak total C/N0 the preset is calibrated to (the value lives in the preset file); two satellites barely move a 95-minute fused fix (1.50 m to 1.48 m RMS 3D) |

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
