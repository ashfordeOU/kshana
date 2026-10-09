// SPDX-License-Identifier: AGPL-3.0-only
// Scenario library for the redesigned playground: every bundled scenario file, grouped
// by mission domain. Titles and questions for the files the live playground already
// listed are carried over verbatim from web/app.js's SCENARIOS table; the rest are
// written from each file's own header comment. Pure data + lookups; tested in
// catalog.test.mjs against the scenarios/ directory so no file can go missing.

// Each domain carries the design-token colour it is drawn in (tokens.css).
export const DOMAINS = [
  { id: "interference", label: "Jamming & interference", color: "var(--int)" },
  { id: "spectrum", label: "Spectrum", color: "var(--int)" },
  { id: "spoofing", label: "Spoofing & signal security", color: "var(--spf)" },
  { id: "timing", label: "Clocks & timing", color: "var(--tim)" },
  { id: "navigation", label: "Inertial & alternative navigation", color: "var(--nav)" },
  { id: "integrity", label: "Integrity & positioning", color: "var(--itg)" },
  { id: "orbits", label: "Orbits & GNSS geometry", color: "var(--orb)" },
  { id: "constellations", label: "Constellation design", color: "var(--orb)" },
  { id: "leo", label: "Low Earth orbit (LEO) navigation", color: "var(--tim)" },
  { id: "leo-missions", label: "LEO missions & studies", color: "var(--tim)" },
  { id: "campaigns", label: "Campaigns", color: "var(--itg)" },
  { id: "spaceops", label: "Mission analysis & space operations", color: "var(--orb)" },
  { id: "deepspace", label: "Moon, cislunar & Mars", color: "var(--ink-2)" },
  { id: "solar", label: "Solar system", color: "var(--orb)" },
  { id: "studies", label: "Quantum, trade studies & interoperability", color: "var(--spf)" },
];

// One line per domain: what it covers, in plain words. Shown on the Studio's area screens and
// read by the search, so "coverage" finds the constellation-design area.
export const DOMAIN_LINES = {
  interference: "Jammers against satellite navigation receivers: what is lost, and when.",
  spectrum: "Waterfalls of the radio band: jammers, signals and what the receiver tracks.",
  spoofing: "False signals and meaconing, and the monitors that catch them.",
  timing: "Clocks without satellites: holdover, stability, telecom masks, time transfer.",
  navigation: "Inertial, terrain, gravity and other navigation without satellites.",
  integrity: "Position fixes and whether they can be trusted: RAIM (receiver autonomous integrity monitoring) and its advanced form, ARAIM.",
  orbits: "Orbit propagation, ephemerides and the geometry of navigation satellites.",
  constellations: "Design a constellation and map its coverage and PDOP (position dilution of precision).",
  leo: "Low Earth orbit navigation signals, passes, messages and fixes.",
  "leo-missions": "Studies and services built on a low Earth orbit layer.",
  campaigns: "Chained missions, sweeps and Monte Carlo runs on one clock.",
  spaceops: "Passes, launch windows, re-entry, link and attitude budgets.",
  deepspace: "Navigation and time at the Moon, in cislunar space and at Mars.",
  solar: "Every planet and moon at one epoch, with light times.",
  studies: "Quantum sensors, trade studies and interoperability formats.",
};

// [file, domain, title, question]. `question` is the one line the scenario answers.
export const SCENARIOS = [
  // Jamming & interference
  ["jamming-demo.toml", "interference", "Jamming", "At what jammer-to-signal ratio does the receiver lose lock?"],
  ["maritime-strait-jamming.toml", "interference", "Ship jammed in a strait", "Across 30 km of open water, does a 50 W jammer take a vessel's GNSS away? (modelled)"],
  ["maritime-spoof-position-push.toml", "spoofing", "Ship position spoofed", "When a spoofer drags a ship's fix 500 m, which detection layers catch it? (modelled)"],
  ["maritime-port-approach-coast.toml", "navigation", "Port approach on inertial", "Entering port without GNSS, when does a navigation-grade INS leave the harbour and ocean budgets? (modelled)"],
  ["automotive-urban-canyon.toml", "navigation", "Car through an urban canyon", "Through an underpass and a roadside jammer, does a car stay inside a half-lane budget? (modelled)"],
  ["rail-tunnel-coast.toml", "navigation", "Train through a tunnel", "At 160 km/h through a tunnel, how soon does a tactical-grade INS leave its budget? (modelled)"],
  ["small-uas-jammed-nav.toml", "interference", "Small drone under jamming", "After a jammer takes GNSS away, how far does a flight-controller-class inertial unit drift, against a tactical-grade one?"],
  ["tracking-loop.toml", "interference", "Tracking loop", "At what C/N0 does a receiver actually lose lock, and can a spoofer pull the loops over? (modelled)"],
  ["impairment-eval.toml", "interference", "RF-impairment eval", "How well does a detector separate jamming / spoofing / multipath from nominal? (modelled ROC/AUC)"],
  ["conflict-resilience.toml", "interference", "Conflict resilience", "How does a layered PNT architecture degrade under jamming / spoofing / kinetic / cyber threats? (modelled)"],
  // Spoofing & signal security
  ["spoof-attack.toml", "spoofing", "Spoof detection", "Is a ramping time-spoof caught before it reaches spec?"],
  ["spoof-detect.toml", "spoofing", "Multi-layer spoof detect", "Can a fused RF + measurement monitor catch a coordinated spoof?"],
  ["spoof-meaconing.toml", "spoofing", "Spoof detector statistics", "With an explicit attack shape, how often does a clock-aided energy detector catch the spoof at a fixed false-alarm rate?"],
  // Clocks & timing
  ["clock-holdover.toml", "timing", "Clock holdover", "How long can a clock keep time after GNSS drops out?"],
  ["clock-holdover-labsr.toml", "timing", "Clock holdover, lab optical clock", "How does a laboratory-grade strontium optical clock compare with a chip-scale atomic clock in holdover?"],
  ["clock-ensemble.toml", "timing", "Clock holdover ensemble", "Across many noise draws, what confidence band does holdover fall in?"],
  ["slot-timing-ocxo-leo.toml", "timing", "Slot timing", "How long does an oven-controlled crystal oscillator on a low-orbit smallsat stay inside its slot guard after the last GNSS fix? (modelled)"],
  ["telecom-prtc-holdover-24h.toml", "timing", "Telecom holdover, 24 h", "Does a rubidium reference that loses GNSS for 24 hours stay inside the ITU-T time-error masks? (modelled)"],
  ["telecom-tie-ingest.toml", "timing", "Telecom mask check, your data", "Does a time interval error record pass the ITU-T MTIE and TDEV masks?"],
  ["timetransfer.toml", "timing", "Time transfer", "How tightly can two sites stay synchronised over a link?"],
  ["quantum-time-transfer.toml", "timing", "Quantum time transfer", "What does trusted quantum timing buy over a classical CSAC + RF chain? (modelled)"],
  ["sweep-clock-stability.toml", "timing", "Parameter sweep", "How does holdover change as one clock parameter is swept?"],
  // Inertial & alternative navigation
  ["imu-deadreckoning.toml", "navigation", "Inertial dead-reckoning", "How far does position drift coasting on an IMU alone?"],
  ["ins-trn-coast.toml", "navigation", "INS/TRN coast", "How far does position drift during a navigation outage, and when does it cross 10 m and 50 m? (modelled)"],
  ["gnss-ins.toml", "navigation", "GNSS/INS fusion", "How well does an aided inertial navigator coast through a GNSS outage?"],
  ["fusion-pnt.toml", "navigation", "Sensor fusion", "What does a single joint estimator buy across clock + position?"],
  ["hybrid-pnt.toml", "navigation", "Hybrid PNT", "What does a combined clock + inertial suite buy you?"],
  ["hybrid-ukf.toml", "navigation", "Hybrid 17-state UKF", "Is the 17-state tightly-coupled UKF self-consistent (NEES + innovation-whiteness)? A self-consistency check, not an accuracy claim."],
  ["terrain-nav.toml", "navigation", "Terrain nav", "Can an altimeter fix INS drift by matching a terrain elevation profile?"],
  ["terrain-slam.toml", "navigation", "Terrain SLAM", "Can a particle filter track a time-varying INS drift against a terrain map?"],
  ["gravity-map-nav.toml", "navigation", "Gravity-map navigation", "Can a cold-atom gravimeter hold position with no GNSS by matching the gravity field it flies through?"],
  ["gps-denied-gravity-nav.toml", "navigation", "GNSS-free nav", "How far does position drift over a full hour without GNSS — and can a gravity map rein it in?"],
  ["combined-altpnt.toml", "navigation", "Combined alt-PNT", "What does fusing three scalar map channels buy over any one alone?"],
  ["quantum-gnss-free-nav.toml", "navigation", "Quantum GNSS-free nav", "How far does a cold-atom navigator coast vs a nav-grade INS with no GNSS? (modelled)"],
  ["hybrid-optical-rf.toml", "navigation", "Optical/RF hybrid", "What continuity and integrity does combining optical and RF PNT buy? (modelled)"],
  // Integrity & positioning
  ["integrity-raim.toml", "integrity", "RAIM integrity", "Does the geometry meet the alert limits (HPL / VPL)?"],
  ["araim-gps-galileo.toml", "integrity", "Dual-constellation ARAIM", "With GPS + Galileo and the constellation-wide fault hypothesis, how available is advanced RAIM?"],
  ["araim-reference-check.toml", "integrity", "ARAIM reference check", "Do the engine's protection levels land on the published Working Group C worked examples?"],
  ["gnss-sim-raim.toml", "integrity", "GNSS measurements", "How do the ionosphere and troposphere shape raw pseudoranges, and does RAIM still protect?"],
  ["pvt-abmf.toml", "integrity", "Positioning (SPP)", "Can a real receiver position be solved from raw RINEX measurements?"],
  // Orbits & GNSS geometry
  ["orbit-gnss-challenged.toml", "orbits", "GNSS availability", "When is a fix even possible from the satellite geometry?"],
  ["orbit-sgp4-gps.toml", "orbits", "SGP4 orbits", "How does a real GPS-like constellation propagate over a day?"],
  ["orbit-multignss.toml", "orbits", "Multi-GNSS availability", "How much do GPS + Galileo together lift availability and tighten dilution of precision?"],
  ["orbit-molniya.toml", "orbits", "Molniya user", "Can a highly-eccentric Molniya-orbit user still see enough GNSS satellites near apogee?"],
  ["orbit-real-tle.toml", "orbits", "Real two-line elements", "What coverage does an actual constellation, given as two-line element sets, provide?"],
  ["orbit-rinex.toml", "orbits", "Broadcast ephemeris", "What availability comes out of a real RINEX 3 broadcast ephemeris?"],
  ["ephemeris.toml", "orbits", "Ground track", "Where is the satellite, and when does it pass overhead?"],
  ["passes.toml", "orbits", "Ground passes", "When does a satellite rise and set over a station, and for how long?"],
  // Mission analysis & space operations
  ["launch-window.toml", "spaceops", "Launch window", "What launch azimuth and dogleg Δv reach a target inclination from a site?"],
  ["reentry.toml", "spaceops", "Re-entry corridor", "What peak-g and peak-heating velocity does a ballistic re-entry see?"],
  ["eo-coverage.toml", "spaceops", "EO coverage", "What swath, ground sample distance and revisit does an EO orbit give?"],
  ["link-budget.toml", "spaceops", "Link budget", "Does the one-way link close with margin at the given range and data rate?"],
  ["attitude-budget.toml", "spaceops", "Pointing budget", "What is the worst-case disturbance torque and pointing-error budget?"],
  ["space-weather.toml", "spaceops", "Space weather", "How does solar / geomagnetic activity change thermospheric density? (modelled)"],
  ["aperture-duty-cycle.toml", "spaceops", "Aperture duty cycle", "When one aperture serves both navigation and communications, what outage does that cost? (modelled)"],
  // Moon, cislunar & Mars
  ["moonlight-service-volume.toml", "deepspace", "Lunar service volume", "What DOP, coverage and integrity does a Moonlight/LCNS-class constellation give the south pole? (modelled)"],
  ["lunanet-araim.toml", "deepspace", "Lunar integrity", "Does a sparse lunar relay set meet the integrity limits for an Artemis-region receiver?"],
  ["lunar-jamming.toml", "deepspace", "Lunar jamming", "How far off can a jammer sit and still deny a lunar surface receiver? (modelled)"],
  ["lunar-attack-surface.toml", "deepspace", "Lunar attack surface", "What does it take to spoof or deny a lunar surface receiver, and what authentication budget answers it? (modelled)"],
  ["lunar-time-offset.toml", "deepspace", "Lunar time offset", "How fast does a lunar clock diverge from Earth time (~56–59 µs/day)?"],
  ["lunar-time-budget.toml", "deepspace", "Lunar time budget", "How large is the Earth–Moon coordinate-time offset, and its error budget? (modelled)"],
  ["earth-gnss-lunar.toml", "deepspace", "Earth-GNSS at the Moon", "Can a receiver near the Moon hear Earth's GNSS, and is it ever enough for a fix? (modelled)"],
  ["lunar-beacon.toml", "deepspace", "Lunar surface beacons", "How much does a handful of surveyed surface beacons collapse south-polar DOP? (modelled)"],
  ["lunar-differential-pnt.toml", "deepspace", "Lunar differential PNT", "How much does differential correction cancel common-mode error vs baseline on the Moon? (modelled)"],
  ["lunar-vlbi.toml", "deepspace", "Lunar VLBI", "What delay does an Earth-baseline VLBI pair see for a lunar surface beacon? (modelled)"],
  ["lunar-vlbi-fim.toml", "deepspace", "Lunar VLBI information", "What station-coordinate accuracy does a given VLBI tracking schedule actually buy? (modelled)"],
  ["lunar-joint-od-clock.toml", "deepspace", "Lunar joint OD+clock", "Does an Earth-baseline VLBI tie make a lunar station's absolute position observable? (modelled)"],
  ["lunar-frame-realisation.toml", "deepspace", "Lunar frame", "Can a Helmert datum fit recover a lunar reference-frame transform? (modelled)"],
  ["lunar-frame-campaign.toml", "deepspace", "Lunar frame campaign", "What datum accuracy comes out of an observing campaign rather than an injected transform? (modelled)"],
  ["lunar-llr-datum.toml", "deepspace", "Lunar laser-ranging datum", "What does the lunar datum look like when the campaign is real archived lunar laser ranging (LLR)? (modelled; a run recorded with the native engine)"],
  ["lunar-interop-export.toml", "deepspace", "Lunar interop export", "Can lunar frame / time / ephemeris round-trip through CCSDS OEM + a KIF envelope?"],
  ["realtime-frame-eop.toml", "deepspace", "Real-time frame/EOP", "How much frame error does real-time (predicted) Earth-orientation introduce? (modelled)"],
  ["cislunar-observability.toml", "deepspace", "Cislunar observability", "How much of a cislunar spacecraft's state does an inter-satellite arc make observable?"],
  ["cislunar-arc-recovery.toml", "deepspace", "Cislunar arc recovery", "Does an independent least-squares estimator actually recover the state from the arc length the rank test predicts? (modelled; slow — about 15 s in a browser)"],
  ["mars-pnt-lmo.toml", "deepspace", "Mars PNT, low orbit", "Can a MARCONI relay constellation navigate a user at Mars? (covariance FoM, not a certified PL)"],
  ["mars-pnt-surface.toml", "deepspace", "Mars PNT, surface", "How well can a lander or rover on the rotating Mars surface be navigated against the relay constellation?"],
  ["mars-pnt-transfer.toml", "deepspace", "Mars PNT, transfer", "How well is a vehicle on a high, eccentric approach or capture arc navigated at Mars?"],
  // Spectrum
  ["l-band-waterfall-jamming.toml", "spectrum", "L-band waterfall under jamming", "What does the whole GNSS L band look like while a chirp, a tone and a noise jammer switch on, and which signals does each one take away? (modelled)"],
  ["multi-band-jamming-waterfall.toml", "spectrum", "Multi-band jamming waterfall", "With navigation signals spread over four bands, what does a jammer built for one band leave standing? (modelled)"],
  ["leo-resilience-js-margin.toml", "spectrum", "Jammer margin from received power", "How much more jamming does a stronger low-orbit signal survive than a GNSS signal from medium orbit? (modelled)"],
  // Constellation design
  ["constellation-multi-gnss-coverage.toml", "constellations", "Four GNSS constellations, one map", "With the four global systems together, how many satellites are in view and how good is the geometry, everywhere on Earth? (modelled)"],
  ["leo-pnt-mega-shell.toml", "constellations", "5,000-satellite low-orbit design", "What coverage and geometry does a 5,000-satellite navigation constellation in low Earth orbit give? (modelled; an example design)"],
  ["lunar-relay-constellation.toml", "constellations", "Lunar relay constellation", "What coverage does a relay and navigation constellation in frozen and low lunar orbits give over the whole Moon? (modelled; an example design)"],
  // Low Earth orbit (LEO) navigation
  ["leo-band-trade.toml", "leo", "Band trade, UHF to C band", "What does a low-orbit navigation signal gain and lose in each band, from ultra high frequency (UHF) to C band? (representative designs)"],
  ["xona-pulsar-signals.toml", "leo", "Xona Pulsar signals", "How precisely can a receiver range on the published X1 and X5 signals, and how large is the acquisition search? (public signal table)"],
  ["leo-pass-vs-gnss-cn0.toml", "leo", "One pass against GNSS", "How does the signal strength of one low-orbit pass compare with the Galileo satellites in view? (modelled)"],
  ["leo-pass-xona-pulsar.toml", "leo", "Xona Pulsar pass", "What do the X1 and X5 signals look like over one pass, for a ship in the Bay of Biscay? (modelled)"],
  ["leo-pass-iridium.toml", "leo", "Iridium bursts from an aircraft", "What signal strength and Doppler does an airliner see over one Iridium pass? (modelled)"],
  ["leo-indoor-uhf.toml", "leo", "Indoors on UHF", "Why does a UHF carrier reach inside a building when the L, S and C bands struggle? (modelled)"],
  ["leo-iot-energy.toml", "leo", "Energy per fix for a tracker", "How much energy does a battery tag spend on each position fix from a low-orbit signal? (modelled)"],
  ["leo-focus-science-iono-sounding.toml", "leo", "Ionosphere sounding from two bands", "How well does the delay difference between two bands measure the electron content below a low-orbit satellite? (modelled)"],
  ["leo-resilience-spoof-doppler.toml", "leo", "Spoofing caught by Doppler", "When a spoofer moves the computed position 30 m, how quickly does a Doppler and pass-geometry check catch it? (modelled)"],
  ["leo-navmsg-fit-interval-trade.toml", "leo", "Navigation message: fit interval", "How long can one broadcast message cover before its orbit error outgrows the target? (modelled; slow, about 30 s in a browser)"],
  ["leo-navmsg-model-comparison.toml", "leo", "Navigation message: four models", "Which ephemeris model represents a low orbit best, and how does it sit beside a published table? (modelled)"],
  ["leo-navmsg-midpass-update.toml", "leo", "Navigation message: mid-pass update", "When a satellite switches to a new message in the middle of a pass, does the user see a jump? (modelled)"],
  ["leo-navmsg-encode-decode.toml", "leo", "Navigation message: binary frame", "What does each field's quantisation cost, and does the frame survive encoding, decoding and a corrupted bit? (modelled)"],
  ["meo-leo-fused-pvt.toml", "leo", "Fused GNSS and low-orbit fix", "What does adding a low-orbit layer to GPS and Galileo do to position error and geometry? (modelled)"],
  ["leo-doppler-positioning.toml", "leo", "Positioning from Doppler alone", "How good is a fix from ten minutes of Doppler on a low-orbit navigation constellation? (modelled)"],
  ["starlink-sop-doppler-positioning.toml", "leo", "Broadband signals of opportunity", "How well can a receiver position itself from the Doppler of a broadband constellation that sends no navigation message? (modelled)"],
  ["leo-timing-utc.toml", "leo", "Time transfer to UTC", "How closely can a receiver recover Coordinated Universal Time (UTC) from low-orbit satellites, by oscillator and signal level? (modelled)"],
  ["polar-arctic-leo-coverage.toml", "leo", "Equator to pole", "From the equator to the pole, how do satellites in view and geometry change with GNSS alone, a polar low-orbit layer alone, and both? (modelled)"],
  ["leo-ppp-convergence.toml", "leo", "Precise positioning convergence", "How much faster does precise point positioning (PPP) converge when a low-orbit layer is added? (modelled; slow, about 30 s in a browser)"],
  ["ntn-5g-positioning.toml", "leo", "5G satellite downlink positioning", "How precisely can a handset position itself from a 5G non-terrestrial network downlink, by signal bandwidth? (modelled)"],
  ["leo-pnt-end-to-end.toml", "leo", "End to end, generic constellation", "From signal design to the final fix, what does each stage hand to the next? (modelled)"],
  ["xona-pulsar-end-to-end.toml", "leo", "End to end, Xona Pulsar", "The same chain on public Xona Pulsar numbers: signal, pass, message, fused fix and precise positioning. (modelled)"],
  // LEO missions & studies (campaigns built from the LEO kinds)
  ["leo-focus-data-services.toml", "leo-missions", "Service data against frame length", "What does each extra data service cost in navigation-message bits? (modelled)"],
  ["leo-focus-fused-pnt-sisre.toml", "leo-missions", "Fused fix against orbit and clock error", "How good must the low-orbit signal-in-space range error be before the low-orbit layer helps a fused fix? (modelled)"],
  ["leo-focus-indoor-uhf.toml", "leo-missions", "Indoor reception by band and building", "Which band still reaches a user inside a traditional and a thermally efficient building? (modelled)"],
  ["leo-focus-iot-eirp.toml", "leo-missions", "Tracker energy against transmit power", "How much satellite transmit power does a battery tag need to last? (modelled)"],
  ["leo-focus-ntn-bandwidth.toml", "leo-missions", "5G downlink positioning against bandwidth", "How does the positioning error fall as the reference signal widens from 180 kHz to 20 MHz? (modelled)"],
  ["leo-focus-ppp-altitude.toml", "leo-missions", "Precise positioning against layer altitude", "Does a lower or a higher low-orbit layer shorten convergence more? (modelled; slow, about a minute in a browser)"],
  ["leo-resilience-gnss-jammed-leo-carries.toml", "leo-missions", "GNSS jammed, low orbit carries on", "When GNSS is jammed, can a low-orbit layer in other bands keep the fix and its integrity? (modelled)"],
  ["leo-resilience-multiband-diversity.toml", "leo-missions", "Band diversity under a barrage jammer", "As one L-band jammer is turned up, which of four bands keep tracking? (modelled)"],
  ["leo-resilience-spoof-monitors.toml", "leo-missions", "Spoofing monitors against four spoofers", "Which monitor sees which kind of spoofer? (modelled)"],
  ["leo-vertical-5g-network-timing.toml", "leo-missions", "5G base-station timing", "When GNSS is lost for a day, does low-orbit time keep a base station inside its timing limit? (modelled)"],
  ["leo-vertical-asset-tracking-iot.toml", "leo-missions", "Container tracking", "Along a container's journey, what does each position fix cost a battery tag? (modelled)"],
  ["leo-vertical-autonomous-vehicle.toml", "leo-missions", "Vehicle in an urban canyon", "When buildings hide the low satellites, does a low-orbit layer keep a car inside a lane-level error? (modelled)"],
  ["leo-vertical-critical-infrastructure-timing.toml", "leo-missions", "Substation timing", "When GNSS is lost, does low-orbit time hold a substation's synchronisation? (modelled)"],
  ["leo-vertical-polar-arctic.toml", "leo-missions", "Arctic journey", "From Tromsø to the North Pole, what does a polar low-orbit layer add to GNSS? (modelled)"],
  ["leo-vertical-rail-maritime.toml", "leo-missions", "Rail and maritime with a low-orbit layer", "When the bundled ship and train scenarios lose GNSS, does a low-orbit pass still reach them? (modelled)"],
  // Campaigns
  ["campaign-jam-spoof-holdover-integrity.toml", "campaigns", "Chained mission: jam, spoof, hold over, alarm", "What happens to one receiver through jamming, spoofing, GNSS loss, an integrity alarm and recovery, on one timeline? (modelled)"],
  ["campaign-spectrum-holdover-integrity.toml", "campaigns", "Spectrum-driven mission", "A jammer takes two L-band signals, the clock holds over and the receiver falls back to Galileo alone: does integrity monitoring still hold? (modelled)"],
  ["campaign-sweep-jammer-power.toml", "campaigns", "Jammer power sweep", "As a jammer 1 km away is turned up from 10 nW to 10 W, when does the receiver lose its fix? (modelled)"],
  ["campaign-monte-carlo-clock-holdover.toml", "campaigns", "Monte Carlo clock holdover", "Over many seeded runs, does a free-running clock's time error match its closed-form spread?"],
  ["campaign-shared-jammer-sea-road.toml", "campaigns", "One jammer, a ship and a car", "Under one jammer, which platform loses its fix: the ship 30 km away or the car 50 km away? (modelled)"],
  // Solar system
  ["solar-system-tour.toml", "solar", "Solar system at one epoch", "Where is every body the engine knows, from the Sun to Pluto and the large moons, and how long does light take between them?"],
  ["mars-orbit-pnt.toml", "solar", "Mars orbiter with relays and an Earth link", "How well is a low Mars orbiter positioned from twelve navigation relays, and what does a range from Earth add? (modelled)"],
  ["europa-surface-pnt.toml", "solar", "Lander on Europa", "Can a lander on Jupiter's moon Europa be positioned from a small relay constellation and a range from Earth? (modelled)"],
  // Quantum, trade studies & interoperability
  ["quantum-trade.toml", "studies", "Quantum PNT trade", "What timing / inertial holdover does a candidate clock buy over a classical baseline? (modelled)"],
  ["quantum-anomaly-detect.toml", "studies", "Quantum anomaly detect", "How well are quantum-system faults detected at a fixed false-alarm rate? (modelled)"],
  ["sweep-nd-inertial.toml", "studies", "N-D sweep", "How does a figure of merit vary across a multi-parameter grid?"],
  ["oem-interop.toml", "studies", "CCSDS OEM bridge", "Can an OEM ephemeris from GMAT / Orekit / STK be imported and round-tripped?"],
  ["space-packet.toml", "studies", "Space Packet", "Does a CCSDS 133.0 packet stream encode and decode bit-exactly?"],
  ["quantum-pnt-demonstrator.suite.toml", "studies", "Quantum PNT demonstrator study", "The three quantum application areas as one study (a command-line study suite: kshana --study)."],
];

// Files the browser engine cannot run, with the reason shown in the library.
export const NOT_IN_BROWSER = {
  "lunar-llr-datum.toml": "Needs the archived laser-ranging data slice that ships with the repository, not with the browser build.",
  "quantum-pnt-demonstrator.suite.toml": "A study suite, not a single scenario. Run it with the command-line tool: kshana --study.",
};
// Of those, the files the Studio shows as a run recorded with the native command-line engine.
export const RECORDED_NATIVELY = ["lunar-llr-datum.toml"];

export const DEFAULT_SCENARIO = "clock-holdover.toml";

// Folder a scenario's files live under ("" for the bundled set, the group's own folder for an optional group).
const DIRS = new Map();
export function dirOf(file) {
  return DIRS.get(file) || "";
}

// Add an optional group of scenarios that ships in its own folder (so it can be left out by
// deleting that folder): { dir, domain: { id, label, color }, scenarios: [[file, title, question]] }.
// Returns how many entries were added.
export function registerGroup(group) {
  if (!group || !group.domain || !Array.isArray(group.scenarios)) return 0;
  if (!DOMAINS.some((d) => d.id === group.domain.id)) DOMAINS.push({ id: group.domain.id, label: String(group.domain.label), color: group.domain.color || "var(--ink-2)" });
  let n = 0;
  for (const s of group.scenarios) {
    if (!Array.isArray(s) || typeof s[0] !== "string" || SCENARIOS.some((x) => x[0] === s[0])) continue;
    SCENARIOS.push([s[0], group.domain.id, String(s[1]), String(s[2])]);
    DIRS.set(s[0], group.dir || "");
    n++;
  }
  return n;
}

export function domainOf(id) {
  return DOMAINS.find((d) => d.id === id) || null;
}

// Where a bundled scenario's text is served from, relative to the page: the group's own folder or
// scenarios/. null for a name that is not in the catalogue, so a name from the address or from
// saved state can never become a request path.
export function scenarioPath(file) {
  if (!entryFor(file)) return null;
  const dir = dirOf(file);
  return dir ? `${dir}${file}` : `scenarios/${file}`;
}

export function entryFor(file) {
  const s = SCENARIOS.find((x) => x[0] === file);
  return s ? { file: s[0], domain: s[1], title: s[2], question: s[3] } : null;
}

// Entries grouped in DOMAINS order, filtered by a case-insensitive query over file,
// title, question, domain label and domain line. Empty groups are dropped.
export function groupedLibrary(query = "") {
  const q = query.trim().toLowerCase();
  const out = [];
  for (const d of DOMAINS) {
    const items = SCENARIOS.filter((s) => s[1] === d.id)
      .map((s) => ({ file: s[0], domain: s[1], title: s[2], question: s[3] }))
      .filter((e) => !q || [e.file, e.title, e.question, d.label, DOMAIN_LINES[d.id] || ""].some((t) => t.toLowerCase().includes(q)));
    if (items.length) out.push({ domain: d, items });
  }
  return out;
}

// Search results ranked for a reader. A match in the domain (its label or its one-line
// description) or in the title counts most; then the file name, then the question. A
// match at the start of a word beats one inside a word ("orbit" in "SGP4 orbits" beats
// "suborbital"). So every title or domain match ranks above every match found only in a
// description. Ties keep library order. Matches exactly the entries groupedLibrary(query) keeps.
export function searchScenarios(query = "") {
  const q = query.trim().toLowerCase();
  if (!q) return [];
  const hit = (text, weight) => {
    const t = String(text).toLowerCase();
    const i = t.indexOf(q);
    if (i < 0) return 0;
    const atWord = i === 0 || !/[a-z0-9]/.test(t[i - 1]);
    return atWord ? weight : weight / 2;
  };
  return groupedLibrary(q)
    .flatMap((g) => g.items.map((e) => ({ e, d: g.domain })))
    .map(({ e, d }, n) => {
      // The domain is what a scenario is about; its title is how it is named. A domain match
      // (label or line) leads by a little, so "orbit" lists the orbits area before a low-orbit
      // scenario elsewhere, and "coverage" the constellation-design area before EO coverage.
      // A domain named for the word ("Orbits & GNSS geometry" for "orbit") leads by a little more.
      const named = d.label.toLowerCase().startsWith(q) ? 4 : 0;
      const dom = Math.max(hit(d.label, 16), hit(DOMAIN_LINES[d.id] || "", 16)), tit = hit(e.title, 14);
      const strong = (dom ? dom + named : 0) + (dom && tit ? Math.min(dom, tit) / 4 : tit);
      const weak = hit(e.file.replace(/\.toml$/, "").replace(/-/g, " "), 2) + hit(e.question, 1);
      return { e, n, strong, weak };
    })
    .sort((a, b) => b.strong - a.strong || b.weak - a.weak || a.n - b.n)
    .map((x) => x.e);
}
