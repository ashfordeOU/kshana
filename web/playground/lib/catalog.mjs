// SPDX-License-Identifier: AGPL-3.0-only
// Scenario library for the redesigned playground: every bundled scenario file, grouped
// by mission domain. Titles and questions for the files the live playground already
// listed are carried over verbatim from web/app.js's SCENARIOS table; the rest are
// written from each file's own header comment. Pure data + lookups; tested in
// catalog.test.mjs against the scenarios/ directory so no file can go missing.

// Each domain carries the design-token colour it is drawn in (tokens.css).
export const DOMAINS = [
  { id: "interference", label: "Jamming & interference", color: "var(--int)" },
  { id: "spoofing", label: "Spoofing & signal security", color: "var(--spf)" },
  { id: "timing", label: "Clocks & timing", color: "var(--tim)" },
  { id: "navigation", label: "Inertial & alternative navigation", color: "var(--nav)" },
  { id: "integrity", label: "Integrity & positioning", color: "var(--itg)" },
  { id: "orbits", label: "Orbits & GNSS geometry", color: "var(--orb)" },
  { id: "spaceops", label: "Mission analysis & space operations", color: "var(--orb)" },
  { id: "deepspace", label: "Moon, cislunar & Mars", color: "var(--ink-2)" },
  { id: "studies", label: "Quantum, trade studies & interoperability", color: "var(--spf)" },
];

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
  ["lunar-llr-datum.toml", "deepspace", "Lunar LLR datum", "What does the lunar datum look like when the campaign is real archived laser ranging? (modelled)"],
  ["lunar-interop-export.toml", "deepspace", "Lunar interop export", "Can lunar frame / time / ephemeris round-trip through CCSDS OEM + a KIF envelope?"],
  ["realtime-frame-eop.toml", "deepspace", "Real-time frame/EOP", "How much frame error does real-time (predicted) Earth-orientation introduce? (modelled)"],
  ["cislunar-observability.toml", "deepspace", "Cislunar observability", "How much of a cislunar spacecraft's state does an inter-satellite arc make observable?"],
  ["cislunar-arc-recovery.toml", "deepspace", "Cislunar arc recovery", "Does an independent least-squares estimator actually recover the state from the arc length the rank test predicts? (modelled; slow — about 15 s in a browser)"],
  ["mars-pnt-lmo.toml", "deepspace", "Mars PNT, low orbit", "Can a MARCONI relay constellation navigate a user at Mars? (covariance FoM, not a certified PL)"],
  ["mars-pnt-surface.toml", "deepspace", "Mars PNT, surface", "How well can a lander or rover on the rotating Mars surface be navigated against the relay constellation?"],
  ["mars-pnt-transfer.toml", "deepspace", "Mars PNT, transfer", "How well is a vehicle on a high, eccentric approach or capture arc navigated at Mars?"],
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
  "lunar-llr-datum.toml": "Needs the archived laser-ranging data slice that ships with the repository, not with the browser build. Run it from the command line.",
  "quantum-pnt-demonstrator.suite.toml": "A study suite, not a single scenario. Run it with the command-line tool: kshana --study.",
};

export const DEFAULT_SCENARIO = "clock-holdover.toml";

export function domainOf(id) {
  return DOMAINS.find((d) => d.id === id) || null;
}

export function entryFor(file) {
  const s = SCENARIOS.find((x) => x[0] === file);
  return s ? { file: s[0], domain: s[1], title: s[2], question: s[3] } : null;
}

// Entries grouped in DOMAINS order, filtered by a case-insensitive query over file,
// title, question and domain label. Empty groups are dropped.
export function groupedLibrary(query = "") {
  const q = query.trim().toLowerCase();
  const out = [];
  for (const d of DOMAINS) {
    const items = SCENARIOS.filter((s) => s[1] === d.id)
      .map((s) => ({ file: s[0], domain: s[1], title: s[2], question: s[3] }))
      .filter((e) => !q || [e.file, e.title, e.question, d.label].some((t) => t.toLowerCase().includes(q)));
    if (items.length) out.push({ domain: d, items });
  }
  return out;
}
