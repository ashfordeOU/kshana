// SPDX-License-Identifier: AGPL-3.0-only
// Scenario library for the redesigned playground: every bundled scenario file, grouped
// by mission domain. Titles and questions for the files the live playground already
// listed are carried over verbatim from web/app.js's SCENARIOS table; the rest are
// written from each file's own header comment. Pure data + lookups; tested in
// catalog.test.mjs against the scenarios/ directory so no file can go missing.

import { t } from "./t.mjs";

// The titles, questions and domain texts are read through getters (and the rows through row()) so that
// they are looked up when read, in the current language, never frozen at import.
function row(file, domain, title, question) {
  const r = [file, domain, undefined, undefined];
  Object.defineProperty(r, 2, { get: title, enumerable: true });
  Object.defineProperty(r, 3, { get: question, enumerable: true });
  return r;
}

// Each domain carries the design-token colour it is drawn in (tokens.css).
export const DOMAINS = [
  { id: "interference", get label() { return t("js-cat-domain-interference-label", "Jamming & interference"); }, color: "var(--int)" },
  { id: "spectrum", get label() { return t("js-cat-domain-spectrum-label", "Spectrum"); }, color: "var(--int)" },
  { id: "spoofing", get label() { return t("js-cat-domain-spoofing-label", "Spoofing & signal security"); }, color: "var(--spf)" },
  { id: "timing", get label() { return t("js-cat-domain-timing-label", "Clocks & timing"); }, color: "var(--tim)" },
  { id: "navigation", get label() { return t("js-cat-domain-navigation-label", "Inertial & alternative navigation"); }, color: "var(--nav)" },
  { id: "integrity", get label() { return t("js-cat-domain-integrity-label", "Integrity & positioning"); }, color: "var(--itg)" },
  { id: "orbits", get label() { return t("js-cat-domain-orbits-label", "Orbits & GNSS geometry"); }, color: "var(--orb)" },
  { id: "constellations", get label() { return t("js-cat-domain-constellations-label", "Constellation design"); }, color: "var(--orb)" },
  { id: "leo", get label() { return t("js-cat-domain-leo-label", "Low Earth orbit (LEO) navigation"); }, color: "var(--tim)" },
  { id: "leo-missions", get label() { return t("js-cat-domain-leo-missions-label", "LEO missions & studies"); }, color: "var(--tim)" },
  { id: "campaigns", get label() { return t("js-cat-domain-campaigns-label", "Campaigns"); }, color: "var(--itg)" },
  { id: "spaceops", get label() { return t("js-cat-domain-spaceops-label", "Mission analysis & space operations"); }, color: "var(--orb)" },
  { id: "deepspace", get label() { return t("js-cat-domain-deepspace-label", "Moon, cislunar & Mars"); }, color: "var(--ink-2)" },
  { id: "solar", get label() { return t("js-cat-domain-solar-label", "Solar system"); }, color: "var(--orb)" },
  { id: "studies", get label() { return t("js-cat-domain-studies-label", "Quantum, trade studies & interoperability"); }, color: "var(--spf)" },
];

// One line per domain: what it covers, in plain words. Shown on the Studio's area screens and
// read by the search, so "coverage" finds the constellation-design area.
export const DOMAIN_LINES = {
  get interference() { return t("js-cat-domain-interference-line", "Jammers against satellite navigation receivers: what is lost, and when."); },
  get spectrum() { return t("js-cat-domain-spectrum-line", "Waterfalls of the radio band: jammers, signals and what the receiver tracks."); },
  get spoofing() { return t("js-cat-domain-spoofing-line", "False signals and meaconing, and the monitors that catch them."); },
  get timing() { return t("js-cat-domain-timing-line", "Clocks without satellites: holdover, stability, telecom masks, time transfer."); },
  get navigation() { return t("js-cat-domain-navigation-line", "Inertial, terrain, gravity and other navigation without satellites."); },
  get integrity() { return t("js-cat-domain-integrity-line", "Position fixes and whether they can be trusted: RAIM (receiver autonomous integrity monitoring) and its advanced form, ARAIM."); },
  get orbits() { return t("js-cat-domain-orbits-line", "Orbit propagation, ephemerides and the geometry of navigation satellites."); },
  get constellations() { return t("js-cat-domain-constellations-line", "Design a constellation and map its coverage and PDOP (position dilution of precision)."); },
  get leo() { return t("js-cat-domain-leo-line", "Low Earth orbit navigation signals, passes, messages and fixes."); },
  get "leo-missions"() { return t("js-cat-domain-leo-missions-line", "Studies and services built on a low Earth orbit layer."); },
  get campaigns() { return t("js-cat-domain-campaigns-line", "Chained missions, sweeps and Monte Carlo runs on one clock."); },
  get spaceops() { return t("js-cat-domain-spaceops-line", "Passes, launch windows, re-entry, link and attitude budgets."); },
  get deepspace() { return t("js-cat-domain-deepspace-line", "Navigation and time at the Moon, in cislunar space and at Mars."); },
  get solar() { return t("js-cat-domain-solar-line", "Every planet and moon at one epoch, with light times."); },
  get studies() { return t("js-cat-domain-studies-line", "Quantum sensors, trade studies and interoperability formats."); },
};

// [file, domain, title, question]. `question` is the one line the scenario answers.
export const SCENARIOS = [
  // Jamming & interference
  row("jamming-demo.toml", "interference", () => t("js-cat-jamming-demo-title", "Jamming"), () => t("js-cat-jamming-demo-question", "At what jammer-to-signal ratio does the receiver lose lock?")),
  row("maritime-strait-jamming.toml", "interference", () => t("js-cat-maritime-strait-jamming-title", "Ship jammed in a strait"), () => t("js-cat-maritime-strait-jamming-question", "Across 30 km of open water, does a 50 W jammer take a vessel's GNSS away? (modelled)")),
  row("jamming-harbour-approach-skyline.toml", "interference", () => t("js-cat-jamming-harbour-approach-skyline-title", "Ship jammed entering harbour"), () => t("js-cat-jamming-harbour-approach-skyline-question", "Under a 2 W shore jammer, how many satellites does a ship keep, and how many does the quay itself hide? (modelled; representative skyline)")),
  row("maritime-spoof-position-push.toml", "spoofing", () => t("js-cat-maritime-spoof-position-push-title", "Ship position spoofed"), () => t("js-cat-maritime-spoof-position-push-question", "When a spoofer drags a ship's fix 500 m, which detection layers catch it? (modelled)")),
  row("maritime-port-approach-coast.toml", "navigation", () => t("js-cat-maritime-port-approach-coast-title", "Port approach on inertial"), () => t("js-cat-maritime-port-approach-coast-question", "Entering port without GNSS, when does a navigation-grade INS leave the harbour and ocean budgets? (modelled)")),
  row("automotive-urban-canyon.toml", "navigation", () => t("js-cat-automotive-urban-canyon-title", "Car through an urban canyon"), () => t("js-cat-automotive-urban-canyon-question", "Through an underpass and a roadside jammer, does a car stay inside a half-lane budget? (modelled)")),
  row("rail-tunnel-coast.toml", "navigation", () => t("js-cat-rail-tunnel-coast-title", "Train through a tunnel"), () => t("js-cat-rail-tunnel-coast-question", "At 160 km/h through a tunnel, how soon does a tactical-grade INS leave its budget? (modelled)")),
  row("small-uas-jammed-nav.toml", "interference", () => t("js-cat-small-uas-jammed-nav-title", "Small drone under jamming"), () => t("js-cat-small-uas-jammed-nav-question", "After a jammer takes GNSS away, how far does a flight-controller-class inertial unit drift, against a tactical-grade one?")),
  row("tracking-loop.toml", "interference", () => t("js-cat-tracking-loop-title", "Tracking loop"), () => t("js-cat-tracking-loop-question", "At what C/N0 does a receiver actually lose lock, and can a spoofer pull the loops over? (modelled)")),
  row("impairment-eval.toml", "interference", () => t("js-cat-impairment-eval-title", "RF-impairment eval"), () => t("js-cat-impairment-eval-question", "How well does a detector separate jamming / spoofing / multipath from nominal? (modelled ROC/AUC)")),
  row("conflict-resilience.toml", "interference", () => t("js-cat-conflict-resilience-title", "Conflict resilience"), () => t("js-cat-conflict-resilience-question", "How does a layered PNT architecture degrade under jamming / spoofing / kinetic / cyber threats? (modelled)")),
  // Spoofing & signal security
  row("spoof-attack.toml", "spoofing", () => t("js-cat-spoof-attack-title", "Spoof detection"), () => t("js-cat-spoof-attack-question", "Is a ramping time-spoof caught before it reaches spec?")),
  row("spoof-detect.toml", "spoofing", () => t("js-cat-spoof-detect-title", "Multi-layer spoof detect"), () => t("js-cat-spoof-detect-question", "Can a fused RF + measurement monitor catch a coordinated spoof?")),
  row("spoof-meaconing.toml", "spoofing", () => t("js-cat-spoof-meaconing-title", "Spoof detector statistics"), () => t("js-cat-spoof-meaconing-question", "With an explicit attack shape, how often does a clock-aided energy detector catch the spoof at a fixed false-alarm rate?")),
  // Clocks & timing
  row("clock-holdover.toml", "timing", () => t("js-cat-clock-holdover-title", "Clock holdover"), () => t("js-cat-clock-holdover-question", "How long can a clock keep time after GNSS drops out?")),
  row("clock-holdover-labsr.toml", "timing", () => t("js-cat-clock-holdover-labsr-title", "Clock holdover, lab optical clock"), () => t("js-cat-clock-holdover-labsr-question", "How does a laboratory-grade strontium optical clock compare with a chip-scale atomic clock in holdover?")),
  row("clock-ensemble.toml", "timing", () => t("js-cat-clock-ensemble-title", "Clock holdover ensemble"), () => t("js-cat-clock-ensemble-question", "Across many noise draws, what confidence band does holdover fall in?")),
  row("slot-timing-ocxo-leo.toml", "timing", () => t("js-cat-slot-timing-ocxo-leo-title", "Slot timing"), () => t("js-cat-slot-timing-ocxo-leo-question", "How long does an oven-controlled crystal oscillator on a low-orbit smallsat stay inside its slot guard after the last GNSS fix? (modelled)")),
  row("telecom-prtc-holdover-24h.toml", "timing", () => t("js-cat-telecom-prtc-holdover-24h-title", "Telecom holdover, 24 h"), () => t("js-cat-telecom-prtc-holdover-24h-question", "Does a rubidium reference that loses GNSS for 24 hours stay inside the ITU-T time-error masks? (modelled)")),
  row("telecom-tie-ingest.toml", "timing", () => t("js-cat-telecom-tie-ingest-title", "Telecom mask check, your data"), () => t("js-cat-telecom-tie-ingest-question", "Does a time interval error record pass the ITU-T MTIE and TDEV masks?")),
  row("timetransfer.toml", "timing", () => t("js-cat-timetransfer-title", "Time transfer"), () => t("js-cat-timetransfer-question", "How tightly can two sites stay synchronised over a link?")),
  row("quantum-time-transfer.toml", "timing", () => t("js-cat-quantum-time-transfer-title", "Quantum time transfer"), () => t("js-cat-quantum-time-transfer-question", "What does trusted quantum timing buy over a classical CSAC + RF chain? (modelled)")),
  row("sweep-clock-stability.toml", "timing", () => t("js-cat-sweep-clock-stability-title", "Parameter sweep"), () => t("js-cat-sweep-clock-stability-question", "How does holdover change as one clock parameter is swept?")),
  // Inertial & alternative navigation
  row("imu-deadreckoning.toml", "navigation", () => t("js-cat-imu-deadreckoning-title", "Inertial dead-reckoning"), () => t("js-cat-imu-deadreckoning-question", "How far does position drift coasting on an IMU alone?")),
  row("ins-trn-coast.toml", "navigation", () => t("js-cat-ins-trn-coast-title", "INS/TRN coast"), () => t("js-cat-ins-trn-coast-question", "How far does position drift during a navigation outage, and when does it cross 10 m and 50 m? (modelled)")),
  row("gnss-ins.toml", "navigation", () => t("js-cat-gnss-ins-title", "GNSS/INS fusion"), () => t("js-cat-gnss-ins-question", "How well does an aided inertial navigator coast through a GNSS outage?")),
  row("fusion-pnt.toml", "navigation", () => t("js-cat-fusion-pnt-title", "Sensor fusion"), () => t("js-cat-fusion-pnt-question", "What does a single joint estimator buy across clock + position?")),
  row("hybrid-pnt.toml", "navigation", () => t("js-cat-hybrid-pnt-title", "Hybrid PNT"), () => t("js-cat-hybrid-pnt-question", "What does a combined clock + inertial suite buy you?")),
  row("hybrid-ukf.toml", "navigation", () => t("js-cat-hybrid-ukf-title", "Hybrid 17-state UKF"), () => t("js-cat-hybrid-ukf-question", "Is the 17-state tightly-coupled UKF self-consistent (NEES + innovation-whiteness)? A self-consistency check, not an accuracy claim.")),
  row("terrain-nav.toml", "navigation", () => t("js-cat-terrain-nav-title", "Terrain nav"), () => t("js-cat-terrain-nav-question", "Can an altimeter fix INS drift by matching a terrain elevation profile?")),
  row("terrain-slam.toml", "navigation", () => t("js-cat-terrain-slam-title", "Terrain SLAM"), () => t("js-cat-terrain-slam-question", "Can a particle filter track a time-varying INS drift against a terrain map?")),
  row("gravity-map-nav.toml", "navigation", () => t("js-cat-gravity-map-nav-title", "Gravity-map navigation"), () => t("js-cat-gravity-map-nav-question", "Can a cold-atom gravimeter hold position with no GNSS by matching the gravity field it flies through?")),
  row("gps-denied-gravity-nav.toml", "navigation", () => t("js-cat-gps-denied-gravity-nav-title", "GNSS-free nav"), () => t("js-cat-gps-denied-gravity-nav-question", "How far does position drift over a full hour without GNSS — and can a gravity map rein it in?")),
  row("combined-altpnt.toml", "navigation", () => t("js-cat-combined-altpnt-title", "Combined alt-PNT"), () => t("js-cat-combined-altpnt-question", "What does fusing three scalar map channels buy over any one alone?")),
  row("quantum-gnss-free-nav.toml", "navigation", () => t("js-cat-quantum-gnss-free-nav-title", "Quantum GNSS-free nav"), () => t("js-cat-quantum-gnss-free-nav-question", "How far does a cold-atom navigator coast vs a nav-grade INS with no GNSS? (modelled)")),
  row("quantum-cai-coast.toml", "navigation", () => t("js-cat-quantum-cai-coast-title", "Quantum accelerometer coast"), () => t("js-cat-quantum-cai-coast-question", "How long does a cold-atom interferometer, specified by its physics, keep dead reckoning inside 100 m after GNSS is lost, against a nav-grade quartz accelerometer? (modelled)")),
  row("hybrid-optical-rf.toml", "navigation", () => t("js-cat-hybrid-optical-rf-title", "Optical/RF hybrid"), () => t("js-cat-hybrid-optical-rf-question", "What continuity and integrity does combining optical and RF PNT buy? (modelled)")),
  row("fusion-pnt-coupled.toml", "navigation", () => t("js-cat-fusion-pnt-coupled-title", "Coupled sensor-fusion navigator"), () => t("js-cat-fusion-pnt-coupled-question", "With one stacked Kalman filter over position, clock and accelerometer bias, how does the navigator ride out a GNSS outage? (modelled)")),
  row("gnss-ins-aviation.toml", "navigation", () => t("js-cat-gnss-ins-aviation-title", "Aircraft turn through a GNSS gap"), () => t("js-cat-gnss-ins-aviation-question", "Through a two-minute GNSS denial that covers a banked turn, how far does a tightly coupled navigation-grade or tactical-grade INS drift? (modelled)")),
  row("gnss-ins-maritime.toml", "navigation", () => t("js-cat-gnss-ins-maritime-title", "Ship weaving through a GNSS outage"), () => t("js-cat-gnss-ins-maritime-question", "After a five-minute GNSS outage on a weaving vessel, how far does a navigation-grade or tactical-grade INS drift? (modelled)")),
  row("gnss-ins-rail.toml", "navigation", () => t("js-cat-gnss-ins-rail-title", "Train through a cutting and a tunnel"), () => t("js-cat-gnss-ins-rail-question", "Through a deep cutting with two satellites and then a tunnel, how far does a tightly coupled INS drift? (modelled)")),
  row("gravity-map-error-mc.toml", "navigation", () => t("js-cat-gravity-map-error-mc-title", "Gravity-map error Monte Carlo"), () => t("js-cat-gravity-map-error-mc-question", "As the stored gravity map gets noisier, how often does map matching still keep a GPS-denied fix inside its target? (modelled)")),
  row("gps-denied-gravity-nav-egm2008.toml", "navigation", () => t("js-cat-gps-denied-gravity-nav-egm2008-title", "Gravity navigation on the real field"), () => t("js-cat-gps-denied-gravity-nav-egm2008-question", "On the real EGM2008 gravity field to degree 70, can map matching hold a GPS-denied track? (modelled)")),
  // Integrity & positioning
  row("integrity-raim.toml", "integrity", () => t("js-cat-integrity-raim-title", "RAIM integrity"), () => t("js-cat-integrity-raim-question", "Does the geometry meet the alert limits (HPL / VPL)?")),
  row("integrity-harbour-approach.toml", "integrity", () => t("js-cat-integrity-harbour-approach-title", "ARAIM entering harbour"), () => t("js-cat-integrity-harbour-approach-question", "With quay buildings and a breakwater hiding low satellites, do GPS and Galileo keep ARAIM protection inside the alert limits? (modelled; representative skyline)")),
  row("araim-gps-galileo.toml", "integrity", () => t("js-cat-araim-gps-galileo-title", "Dual-constellation ARAIM"), () => t("js-cat-araim-gps-galileo-question", "With GPS + Galileo and the constellation-wide fault hypothesis, how available is advanced RAIM?")),
  row("araim-reference-check.toml", "integrity", () => t("js-cat-araim-reference-check-title", "ARAIM reference check"), () => t("js-cat-araim-reference-check-question", "Do the engine's protection levels land on the published Working Group C worked examples?")),
  row("gnss-sim-raim.toml", "integrity", () => t("js-cat-gnss-sim-raim-title", "GNSS measurements"), () => t("js-cat-gnss-sim-raim-question", "How do the ionosphere and troposphere shape raw pseudoranges, and does RAIM still protect?")),
  row("gnss-sim-container-terminal-skyline.toml", "integrity", () => t("js-cat-gnss-sim-container-terminal-skyline-title", "Straddle carrier on a container quay"), () => t("js-cat-gnss-sim-container-terminal-skyline-question", "With cranes to seaward and stacks to landward, how many satellites are left, and what happens to RAIM protection? (modelled; representative skyline)")),
  row("pvt-abmf.toml", "integrity", () => t("js-cat-pvt-abmf-title", "Positioning (SPP)"), () => t("js-cat-pvt-abmf-question", "Can a real receiver position be solved from raw RINEX measurements?")),
  row("time-transfer-budget.toml", "timing", () => t("js-cat-time-transfer-budget-title", "Two-way satellite time transfer"), () => t("js-cat-time-transfer-budget-question", "What do station, transponder, ionosphere and Sagnac terms do to a two-way time offset, and what is its uncertainty budget? (modelled)")),
  row("optical-atmosphere-network.toml", "timing", () => t("js-cat-optical-atmosphere-network-title", "Optical link through the atmosphere, three sites"), () => t("js-cat-optical-atmosphere-network-question", "How often is an optical timing link up through clouds and turbulence, and what do extra ground sites buy? (modelled; illustrative cloud climates)")),
  row("optical-atmosphere-techniques.toml", "timing", () => t("js-cat-optical-atmosphere-techniques-title", "Optical link techniques"), () => t("js-cat-optical-atmosphere-techniques-question", "What do a larger aperture, another wavelength or adaptive optics buy one optical uplink in cloud and turbulence? (modelled; illustrative cloud climate)")),
  row("holdover-test-example.toml", "timing", () => t("js-cat-holdover-test-example-title", "Holdover test: a time-error record against the masks"), () => t("js-cat-holdover-test-example-question", "Pull the antenna, score the holdover: a record split at the two times the operator states, each step measured against the ITU-T masks written for it. (modelled; the record is invented for the example)")),
  row("holdover-test-ptp4l.toml", "timing", () => t("js-cat-holdover-test-ptp4l-title", "Holdover test: a linuxptp log"), () => t("js-cat-holdover-test-ptp4l-question", "The same four steps read from a ptp4l servo log: how far does the daemon's own offset stay from the masks while GNSS is away? (modelled; the log is invented for the example)")),
  row("telecom-synce-eec.toml", "timing", () => t("js-cat-telecom-synce-eec-title", "Frequency sync against SyncE masks"), () => t("js-cat-telecom-synce-eec-question", "Does a free-running oven-controlled oscillator stay inside the synchronous Ethernet equipment-clock wander masks? (modelled)")),
  // Orbits & GNSS geometry
  row("orbit-gnss-challenged.toml", "orbits", () => t("js-cat-orbit-gnss-challenged-title", "GNSS availability"), () => t("js-cat-orbit-gnss-challenged-question", "When is a fix even possible from the satellite geometry?")),
  row("orbit-sgp4-gps.toml", "orbits", () => t("js-cat-orbit-sgp4-gps-title", "SGP4 orbits"), () => t("js-cat-orbit-sgp4-gps-question", "How does a real GPS-like constellation propagate over a day?")),
  row("orbit-multignss.toml", "orbits", () => t("js-cat-orbit-multignss-title", "Multi-GNSS availability"), () => t("js-cat-orbit-multignss-question", "How much do GPS + Galileo together lift availability and tighten dilution of precision?")),
  row("orbit-urban-canyon-skyline.toml", "orbits", () => t("js-cat-orbit-urban-canyon-skyline-title", "City street availability"), () => t("js-cat-orbit-urban-canyon-skyline-question", "At the bottom of a city street, how much of the day do GPS and Galileo give four satellites, and what does the strip of sky do to PDOP? (modelled; representative skyline)")),
  row("orbit-molniya.toml", "orbits", () => t("js-cat-orbit-molniya-title", "Molniya user"), () => t("js-cat-orbit-molniya-question", "Can a highly-eccentric Molniya-orbit user still see enough GNSS satellites near apogee?")),
  row("orbit-real-tle.toml", "orbits", () => t("js-cat-orbit-real-tle-title", "Real two-line elements"), () => t("js-cat-orbit-real-tle-question", "What coverage does an actual constellation, given as two-line element sets, provide?")),
  row("orbit-rinex.toml", "orbits", () => t("js-cat-orbit-rinex-title", "Broadcast ephemeris"), () => t("js-cat-orbit-rinex-question", "What availability comes out of a real RINEX 3 broadcast ephemeris?")),
  row("ephemeris.toml", "orbits", () => t("js-cat-ephemeris-title", "Ground track"), () => t("js-cat-ephemeris-question", "Where is the satellite, and when does it pass overhead?")),
  row("passes.toml", "orbits", () => t("js-cat-passes-title", "Ground passes"), () => t("js-cat-passes-question", "When does a satellite rise and set over a station, and for how long?")),
  // Mission analysis & space operations
  row("launch-window.toml", "spaceops", () => t("js-cat-launch-window-title", "Launch window"), () => t("js-cat-launch-window-question", "What launch azimuth and dogleg Δv reach a target inclination from a site?")),
  row("reentry.toml", "spaceops", () => t("js-cat-reentry-title", "Re-entry corridor"), () => t("js-cat-reentry-question", "What peak-g and peak-heating velocity does a ballistic re-entry see?")),
  row("eo-coverage.toml", "spaceops", () => t("js-cat-eo-coverage-title", "EO coverage"), () => t("js-cat-eo-coverage-question", "What swath, ground sample distance and revisit does an EO orbit give?")),
  row("link-budget.toml", "spaceops", () => t("js-cat-link-budget-title", "Link budget"), () => t("js-cat-link-budget-question", "Does the one-way link close with margin at the given range and data rate?")),
  row("attitude-budget.toml", "spaceops", () => t("js-cat-attitude-budget-title", "Pointing budget"), () => t("js-cat-attitude-budget-question", "What is the worst-case disturbance torque and pointing-error budget?")),
  row("space-weather.toml", "spaceops", () => t("js-cat-space-weather-title", "Space weather"), () => t("js-cat-space-weather-question", "How does solar / geomagnetic activity change thermospheric density? (modelled)")),
  row("aperture-duty-cycle.toml", "spaceops", () => t("js-cat-aperture-duty-cycle-title", "Aperture duty cycle"), () => t("js-cat-aperture-duty-cycle-question", "When one aperture serves both navigation and communications, what outage does that cost? (modelled)")),
  row("acm-link.toml", "spaceops", () => t("js-cat-acm-link-title", "Satellite downlink with adaptive coding"), () => t("js-cat-acm-link-question", "Along each pass, which DVB-S2 mode does the link hold, and how much data does the pass move? (modelled)")),
  row("aocs-slew.toml", "spaceops", () => t("js-cat-aocs-slew-title", "Reaction-wheel slew"), () => t("js-cat-aocs-slew-question", "Does the feedback law settle a large-angle slew with four wheels, and how hard do the wheels work? (the control loop is validated; the spacecraft is illustrative)")),
  row("aocs-slew-mekf.toml", "spaceops", () => t("js-cat-aocs-slew-mekf-title", "Slew on an attitude estimate"), () => t("js-cat-aocs-slew-mekf-question", "With the controller fed by an attitude filter and a biased gyro, how does the slew compare with the true-state case? (modelled)")),
  row("ascent-losses.toml", "spaceops", () => t("js-cat-ascent-losses-title", "Launch ascent losses"), () => t("js-cat-ascent-losses-question", "How much of a two-stage launcher's ideal speed gain do gravity, drag, steering and back-pressure take? (modelled)")),
  row("contact-schedule.toml", "spaceops", () => t("js-cat-contact-schedule-title", "Ground-contact plan"), () => t("js-cat-contact-schedule-question", "For three satellites and three stations over 12 hours, which passes does a conflict-free plan keep, and how much data does it move? (modelled)")),
  row("entry-heating-stardust.toml", "spaceops", () => t("js-cat-entry-heating-stardust-title", "Stardust capsule entry"), () => t("js-cat-entry-heating-stardust-question", "Does the entry model reproduce the published peak deceleration of the Stardust sample-return capsule?")),
  row("eo-radiometry.toml", "spaceops", () => t("js-cat-eo-radiometry-title", "Imager radiometry and image quality"), () => t("js-cat-eo-radiometry-question", "For a small Earth-observation camera, what signal-to-noise, MTF at Nyquist and NIIRS does a 15 % reflectance scene give? (modelled)")),
  // Moon, cislunar & Mars
  row("moonlight-service-volume.toml", "deepspace", () => t("js-cat-moonlight-service-volume-title", "Lunar service volume"), () => t("js-cat-moonlight-service-volume-question", "What DOP, coverage and integrity does a Moonlight/LCNS-class constellation give the south pole? (modelled)")),
  row("lunanet-araim.toml", "deepspace", () => t("js-cat-lunanet-araim-title", "Lunar integrity"), () => t("js-cat-lunanet-araim-question", "Does a sparse lunar relay set meet the integrity limits for an Artemis-region receiver?")),
  row("lunar-jamming.toml", "deepspace", () => t("js-cat-lunar-jamming-title", "Lunar jamming"), () => t("js-cat-lunar-jamming-question", "How far off can a jammer sit and still deny a lunar surface receiver? (modelled)")),
  row("lunar-attack-surface.toml", "deepspace", () => t("js-cat-lunar-attack-surface-title", "Lunar attack surface"), () => t("js-cat-lunar-attack-surface-question", "What does it take to spoof or deny a lunar surface receiver, and what authentication budget answers it? (modelled)")),
  row("lunar-time-offset.toml", "deepspace", () => t("js-cat-lunar-time-offset-title", "Lunar time offset"), () => t("js-cat-lunar-time-offset-question", "How fast does a lunar clock diverge from Earth time (~56–59 µs/day)?")),
  row("lunar-time-budget.toml", "deepspace", () => t("js-cat-lunar-time-budget-title", "Lunar time budget"), () => t("js-cat-lunar-time-budget-question", "How large is the Earth–Moon coordinate-time offset, and its error budget? (modelled)")),
  row("earth-gnss-lunar.toml", "deepspace", () => t("js-cat-earth-gnss-lunar-title", "Earth-GNSS at the Moon"), () => t("js-cat-earth-gnss-lunar-question", "Can a receiver near the Moon hear Earth's GNSS, and is it ever enough for a fix? (modelled)")),
  row("lunar-beacon.toml", "deepspace", () => t("js-cat-lunar-beacon-title", "Lunar surface beacons"), () => t("js-cat-lunar-beacon-question", "How much does a handful of surveyed surface beacons collapse south-polar DOP? (modelled)")),
  row("lunar-differential-pnt.toml", "deepspace", () => t("js-cat-lunar-differential-pnt-title", "Lunar differential PNT"), () => t("js-cat-lunar-differential-pnt-question", "How much does differential correction cancel common-mode error vs baseline on the Moon? (modelled)")),
  row("lunar-station-coverage.toml", "deepspace", () => t("js-cat-lunar-station-coverage-title", "Lunar reference station coverage"), () => t("js-cat-lunar-station-coverage-question", "Over the south-polar region and a day, what corrected error does a lunar reference station give, and how far from it does coverage hold? (modelled; not a statement about any real system)")),
  row("lunar-station-coverage-public-sources.toml", "deepspace", () => t("js-cat-lunar-station-coverage-public-sources-title", "Lunar reference station, public assumptions"), () => t("js-cat-lunar-station-coverage-public-sources-question", "Under only the publicly stated assumptions, what corrected error does the station give over the south pole? The result is dominated by the orbit elements, which are not public and set ILLUSTRATIVE; this is the input of the frozen prediction. (modelled; not a statement about any real system)")),
  row("lunar-station-time-lab.toml", "deepspace", () => t("js-cat-lunar-station-time-lab-title", "Lunar station time laboratory"), () => t("js-cat-lunar-station-time-lab-question", "After a station's miniature rubidium clock is last steered to lunar time, how long does it stay within 1, 10 and 100 ns, and which error term dominates? (modelled)")),
  row("lunar-vlbi.toml", "deepspace", () => t("js-cat-lunar-vlbi-title", "Lunar VLBI"), () => t("js-cat-lunar-vlbi-question", "What delay does an Earth-baseline VLBI pair see for a lunar surface beacon? (modelled)")),
  row("lunar-vlbi-fim.toml", "deepspace", () => t("js-cat-lunar-vlbi-fim-title", "Lunar VLBI information"), () => t("js-cat-lunar-vlbi-fim-question", "What station-coordinate accuracy does a given VLBI tracking schedule actually buy? (modelled)")),
  row("lunar-joint-od-clock.toml", "deepspace", () => t("js-cat-lunar-joint-od-clock-title", "Lunar joint OD+clock"), () => t("js-cat-lunar-joint-od-clock-question", "Does an Earth-baseline VLBI tie make a lunar station's absolute position observable? (modelled)")),
  row("lunar-frame-realisation.toml", "deepspace", () => t("js-cat-lunar-frame-realisation-title", "Lunar frame"), () => t("js-cat-lunar-frame-realisation-question", "Can a Helmert datum fit recover a lunar reference-frame transform? (modelled)")),
  row("lunar-frame-campaign.toml", "deepspace", () => t("js-cat-lunar-frame-campaign-title", "Lunar frame campaign"), () => t("js-cat-lunar-frame-campaign-question", "What datum accuracy comes out of an observing campaign rather than an injected transform? (modelled)")),
  row("lunar-llr-datum.toml", "deepspace", () => t("js-cat-lunar-llr-datum-title", "Lunar laser-ranging datum"), () => t("js-cat-lunar-llr-datum-question", "What does the lunar datum look like when the campaign is real archived lunar laser ranging (LLR)? (modelled; a run recorded with the native engine)")),
  row("lunar-station-geodesy-baseline.toml", "deepspace", () => t("js-cat-lunar-station-geodesy-baseline-title", "Lunar station geodesy: the five arrays alone"), () => t("js-cat-lunar-station-geodesy-baseline-question", "How well do today's five retroreflector arrays pin the lunar datum on a real schedule, before any station is added? The baseline of a pair. (modelled; a run recorded with the native engine)")),
  row("lunar-station-geodesy-with-station.toml", "deepspace", () => t("js-cat-lunar-station-geodesy-with-station-title", "Lunar station geodesy: with a south-polar station"), () => t("js-cat-lunar-station-geodesy-with-station-question", "The same archived schedule with one added south-polar reflector and VLBI beacon: how much does the datum bound tighten? (modelled, illustrative site; a run recorded with the native engine)")),
  row("gnss-ssv-shell.toml", "deepspace", () => t("js-cat-gnss-ssv-shell-title", "GNSS signals above the satellites: a shell at 36 000 km"), () => t("js-cat-gnss-ssv-shell-question", "How often does a spacecraft at geostationary height hear at least one, and at least four, navigation signals, per constellation and band? (modelled; a run recorded with the native engine)")),
  row("gnss-ssv-heo.toml", "deepspace", () => t("js-cat-gnss-ssv-heo-title", "GNSS signals in a highly elliptical orbit"), () => t("js-cat-gnss-ssv-heo-question", "What does a highly elliptical orbit hear along its path: signals in view, best C/N0, main lobe against sidelobe, DOP and grazing signals? (modelled; a run recorded with the native engine)")),
  row("gnss-ssv-lunar-weak.toml", "deepspace", () => t("js-cat-gnss-ssv-lunar-weak-title", "GNSS signals on a lunar transfer, weak-signal receiver"), () => t("js-cat-gnss-ssv-lunar-weak-question", "What can a receiver designed for the weakest signals use on the way to the Moon? (modelled; a run recorded with the native engine)")),
  row("gnss-ssv-nav-lunar.toml", "deepspace", () => t("js-cat-gnss-ssv-nav-lunar-title", "Onboard GNSS filter on a lunar transfer"), () => t("js-cat-gnss-ssv-nav-lunar-question", "How well does an onboard filter hold a lunar transfer, against the bound it states? (modelled; a run recorded with the native engine)")),
  row("gnss-ssv-formation-heo.toml", "deepspace", () => t("js-cat-gnss-ssv-formation-heo-title", "Formation relative navigation, highly elliptical orbit"), () => t("js-cat-gnss-ssv-formation-heo-question", "How well does a filter know the relative position of two spacecraft a kilometre apart, against differencing their absolute fixes? (modelled; a run recorded with the native engine)")),
  row("lunar-infrastructure-od-consistency.toml", "deepspace", () => t("js-cat-lunar-infrastructure-od-consistency-title", "Lunar orbit determination: onboard GNSS against ground tracking"), () => t("js-cat-lunar-infrastructure-od-consistency-question", "Do onboard Earth-GNSS orbit determination in a lunar halo orbit and independent ground radiometric orbit determination agree to within their stated uncertainties? (modelled; a run recorded with the native engine)")),
  row("lunar-infrastructure-od-consistency-model-error.toml", "deepspace", () => t("js-cat-lunar-infrastructure-od-consistency-model-error-title", "Lunar orbit determination, with an injected modelling error"), () => t("js-cat-lunar-infrastructure-od-consistency-model-error-question", "The same comparison with a small unmodelled acceleration injected: does the consistency check notice it? (modelled; a run recorded with the native engine)")),
  row("lunar-infrastructure-carrier-phase.toml", "deepspace", () => t("js-cat-lunar-infrastructure-carrier-phase-title", "Lunar carrier phase: surface station and orbiter"), () => t("js-cat-lunar-infrastructure-carrier-phase-question", "Can a surface station and an orbiter fix the integer carrier-phase ambiguities of Earth-GNSS signals together? The quick example run. (modelled; a run recorded with the native engine)")),
  row("lunar-infrastructure-frame-coestimation.toml", "deepspace", () => t("js-cat-lunar-infrastructure-frame-coestimation-title", "Lunar frame co-estimation with orbiter links"), () => t("js-cat-lunar-infrastructure-frame-coestimation-question", "How much more information do orbiter-to-surface-station ranges add to the seven parameters of the lunar datum? (modelled; a run recorded with the native engine)")),
  row("lunar-infrastructure-space-tie.toml", "deepspace", () => t("js-cat-lunar-infrastructure-space-tie-title", "Space tie: GNSS, VLBI and laser ranging on one spacecraft"), () => t("js-cat-lunar-infrastructure-space-tie-question", "How precisely can the offsets between three techniques be tied, against the error of the local tie? (modelled; a run recorded with the native engine)")),
  row("lunar-infrastructure-geodesy-sensitivity.toml", "deepspace", () => t("js-cat-lunar-infrastructure-geodesy-sensitivity-title", "Lunar Love numbers and libration sensitivity"), () => t("js-cat-lunar-infrastructure-geodesy-sensitivity-question", "How sensitive are laser ranging, orbiter tracking, a gravimeter and a surface clock to h2, k2, l2 and the libration? (modelled; a run recorded with the native engine)")),
  row("lunar-interop-export.toml", "deepspace", () => t("js-cat-lunar-interop-export-title", "Lunar interop export"), () => t("js-cat-lunar-interop-export-question", "Can lunar frame / time / ephemeris round-trip through CCSDS OEM + a KIF envelope?")),
  row("realtime-frame-eop.toml", "deepspace", () => t("js-cat-realtime-frame-eop-title", "Real-time frame/EOP"), () => t("js-cat-realtime-frame-eop-question", "How much frame error does real-time (predicted) Earth-orientation introduce? (modelled)")),
  row("cislunar-observability.toml", "deepspace", () => t("js-cat-cislunar-observability-title", "Cislunar observability"), () => t("js-cat-cislunar-observability-question", "How much of a cislunar spacecraft's state does an inter-satellite arc make observable?")),
  row("cislunar-arc-recovery.toml", "deepspace", () => t("js-cat-cislunar-arc-recovery-title", "Cislunar arc recovery"), () => t("js-cat-cislunar-arc-recovery-question", "Does an independent least-squares estimator actually recover the state from the arc length the rank test predicts? (modelled; slow — about 15 s in a browser)")),
  row("mars-pnt-lmo.toml", "deepspace", () => t("js-cat-mars-pnt-lmo-title", "Mars PNT, low orbit"), () => t("js-cat-mars-pnt-lmo-question", "Can a MARCONI relay constellation navigate a user at Mars? (covariance FoM, not a certified PL)")),
  row("mars-pnt-surface.toml", "deepspace", () => t("js-cat-mars-pnt-surface-title", "Mars PNT, surface"), () => t("js-cat-mars-pnt-surface-question", "How well can a lander or rover on the rotating Mars surface be navigated against the relay constellation?")),
  row("mars-pnt-transfer.toml", "deepspace", () => t("js-cat-mars-pnt-transfer-title", "Mars PNT, transfer"), () => t("js-cat-mars-pnt-transfer-question", "How well is a vehicle on a high, eccentric approach or capture arc navigated at Mars?")),
  row("lunar-station-coverage-terrain.toml", "deepspace", () => t("js-cat-lunar-station-coverage-terrain-title", "Lunar station with real terrain"), () => t("js-cat-lunar-station-coverage-terrain-question", "With each site's horizon ray-marched over a real lunar elevation model, how much coverage does the station lose to terrain? (modelled)")),
  // Spectrum
  row("l-band-waterfall-jamming.toml", "spectrum", () => t("js-cat-l-band-waterfall-jamming-title", "L-band waterfall under jamming"), () => t("js-cat-l-band-waterfall-jamming-question", "What does the whole GNSS L band look like while a chirp, a tone and a noise jammer switch on, and which signals does each one take away? (modelled)")),
  row("multi-band-jamming-waterfall.toml", "spectrum", () => t("js-cat-multi-band-jamming-waterfall-title", "Multi-band jamming waterfall"), () => t("js-cat-multi-band-jamming-waterfall-question", "With navigation signals spread over four bands, what does a jammer built for one band leave standing? (modelled)")),
  row("leo-resilience-js-margin.toml", "spectrum", () => t("js-cat-leo-resilience-js-margin-title", "Jammer margin from received power"), () => t("js-cat-leo-resilience-js-margin-question", "How much more jamming does a stronger low-orbit signal survive than a GNSS signal from medium orbit? (modelled)")),
  // Constellation design
  row("constellation-multi-gnss-coverage.toml", "constellations", () => t("js-cat-constellation-multi-gnss-coverage-title", "Four GNSS constellations, one map"), () => t("js-cat-constellation-multi-gnss-coverage-question", "With the four global systems together, how many satellites are in view and how good is the geometry, everywhere on Earth? (modelled)")),
  row("leo-pnt-mega-shell.toml", "constellations", () => t("js-cat-leo-pnt-mega-shell-title", "5,000-satellite low-orbit design"), () => t("js-cat-leo-pnt-mega-shell-question", "What coverage and geometry does a 5,000-satellite navigation constellation in low Earth orbit give? (modelled; an example design)")),
  row("lunar-relay-constellation.toml", "constellations", () => t("js-cat-lunar-relay-constellation-title", "Lunar relay constellation"), () => t("js-cat-lunar-relay-constellation-question", "What coverage does a relay and navigation constellation in frozen and low lunar orbits give over the whole Moon? (modelled; an example design)")),
  // Low Earth orbit (LEO) navigation
  row("leo-band-trade.toml", "leo", () => t("js-cat-leo-band-trade-title", "Band trade, UHF to C band"), () => t("js-cat-leo-band-trade-question", "What does a low-orbit navigation signal gain and lose in each band, from ultra high frequency (UHF) to C band? (representative designs)")),
  row("xona-pulsar-signals.toml", "leo", () => t("js-cat-xona-pulsar-signals-title", "Xona Pulsar signals"), () => t("js-cat-xona-pulsar-signals-question", "How precisely can a receiver range on the published X1 and X5 signals, and how large is the acquisition search? (public signal table)")),
  row("leo-pass-vs-gnss-cn0.toml", "leo", () => t("js-cat-leo-pass-vs-gnss-cn0-title", "One pass against GNSS"), () => t("js-cat-leo-pass-vs-gnss-cn0-question", "How does the signal strength of one low-orbit pass compare with the Galileo satellites in view? (modelled)")),
  row("leo-pass-xona-pulsar.toml", "leo", () => t("js-cat-leo-pass-xona-pulsar-title", "Xona Pulsar pass"), () => t("js-cat-leo-pass-xona-pulsar-question", "What do the X1 and X5 signals look like over one pass, for a ship in the Bay of Biscay? (modelled)")),
  row("leo-pass-iridium.toml", "leo", () => t("js-cat-leo-pass-iridium-title", "Iridium bursts from an aircraft"), () => t("js-cat-leo-pass-iridium-question", "What signal strength and Doppler does an airliner see over one Iridium pass? (modelled)")),
  row("leo-indoor-uhf.toml", "leo", () => t("js-cat-leo-indoor-uhf-title", "Indoors on UHF"), () => t("js-cat-leo-indoor-uhf-question", "Why does a UHF carrier reach inside a building when the L, S and C bands struggle? (modelled)")),
  row("leo-iot-energy.toml", "leo", () => t("js-cat-leo-iot-energy-title", "Energy per fix for a tracker"), () => t("js-cat-leo-iot-energy-question", "How much energy does a battery tag spend on each position fix from a low-orbit signal? (modelled)")),
  row("leo-focus-science-iono-sounding.toml", "leo", () => t("js-cat-leo-focus-science-iono-sounding-title", "Ionosphere sounding from two bands"), () => t("js-cat-leo-focus-science-iono-sounding-question", "How well does the delay difference between two bands measure the electron content below a low-orbit satellite? (modelled)")),
  row("leo-resilience-spoof-doppler.toml", "leo", () => t("js-cat-leo-resilience-spoof-doppler-title", "Spoofing caught by Doppler"), () => t("js-cat-leo-resilience-spoof-doppler-question", "When a spoofer moves the computed position 30 m, how quickly does a Doppler and pass-geometry check catch it? (modelled)")),
  row("leo-navmsg-fit-interval-trade.toml", "leo", () => t("js-cat-leo-navmsg-fit-interval-trade-title", "Navigation message: fit interval"), () => t("js-cat-leo-navmsg-fit-interval-trade-question", "How long can one broadcast message cover before its orbit error outgrows the target? (modelled; slow, about 30 s in a browser)")),
  row("leo-navmsg-model-comparison.toml", "leo", () => t("js-cat-leo-navmsg-model-comparison-title", "Navigation message: four models"), () => t("js-cat-leo-navmsg-model-comparison-question", "Which ephemeris model represents a low orbit best, and how does it sit beside a published table? (modelled)")),
  row("leo-navmsg-midpass-update.toml", "leo", () => t("js-cat-leo-navmsg-midpass-update-title", "Navigation message: mid-pass update"), () => t("js-cat-leo-navmsg-midpass-update-question", "When a satellite switches to a new message in the middle of a pass, does the user see a jump? (modelled)")),
  row("leo-navmsg-encode-decode.toml", "leo", () => t("js-cat-leo-navmsg-encode-decode-title", "Navigation message: binary frame"), () => t("js-cat-leo-navmsg-encode-decode-question", "What does each field's quantisation cost, and does the frame survive encoding, decoding and a corrupted bit? (modelled)")),
  row("meo-leo-fused-pvt.toml", "leo", () => t("js-cat-meo-leo-fused-pvt-title", "Fused GNSS and low-orbit fix"), () => t("js-cat-meo-leo-fused-pvt-question", "What does adding a low-orbit layer to GPS and Galileo do to position error and geometry? (modelled)")),
  row("leo-pvt-fjord-skyline.toml", "leo", () => t("js-cat-leo-pvt-fjord-skyline-title", "Ferry deep in a fjord"), () => t("js-cat-leo-pvt-fjord-skyline-question", "Where the fjord walls leave a strip of sky along the channel, how much does a low-orbit layer add to GPS and Galileo? (modelled; representative skyline)")),
  row("leo-doppler-positioning.toml", "leo", () => t("js-cat-leo-doppler-positioning-title", "Positioning from Doppler alone"), () => t("js-cat-leo-doppler-positioning-question", "How good is a fix from ten minutes of Doppler on a low-orbit navigation constellation? (modelled)")),
  row("starlink-sop-doppler-positioning.toml", "leo", () => t("js-cat-starlink-sop-doppler-positioning-title", "Broadband signals of opportunity"), () => t("js-cat-starlink-sop-doppler-positioning-question", "How well can a receiver position itself from the Doppler of a broadband constellation that sends no navigation message? (modelled)")),
  row("leo-timing-utc.toml", "leo", () => t("js-cat-leo-timing-utc-title", "Time transfer to UTC"), () => t("js-cat-leo-timing-utc-question", "How closely can a receiver recover Coordinated Universal Time (UTC) from low-orbit satellites, by oscillator and signal level? (modelled)")),
  row("polar-arctic-leo-coverage.toml", "leo", () => t("js-cat-polar-arctic-leo-coverage-title", "Equator to pole"), () => t("js-cat-polar-arctic-leo-coverage-question", "From the equator to the pole, how do satellites in view and geometry change with GNSS alone, a polar low-orbit layer alone, and both? (modelled)")),
  row("leo-ppp-convergence.toml", "leo", () => t("js-cat-leo-ppp-convergence-title", "Precise positioning convergence"), () => t("js-cat-leo-ppp-convergence-question", "How much faster does precise point positioning (PPP) converge when a low-orbit layer is added? (modelled; slow, about 30 s in a browser)")),
  row("ntn-5g-positioning.toml", "leo", () => t("js-cat-ntn-5g-positioning-title", "5G satellite downlink positioning"), () => t("js-cat-ntn-5g-positioning-question", "How precisely can a handset position itself from a 5G non-terrestrial network downlink, by signal bandwidth? (modelled)")),
  row("leo-pnt-end-to-end.toml", "leo", () => t("js-cat-leo-pnt-end-to-end-title", "End to end, generic constellation"), () => t("js-cat-leo-pnt-end-to-end-question", "From signal design to the final fix, what does each stage hand to the next? (modelled)")),
  row("xona-pulsar-end-to-end.toml", "leo", () => t("js-cat-xona-pulsar-end-to-end-title", "End to end, Xona Pulsar"), () => t("js-cat-xona-pulsar-end-to-end-question", "The same chain on public Xona Pulsar numbers: signal, pass, message, fused fix and precise positioning. (modelled)")),
  // LEO missions & studies (campaigns built from the LEO kinds)
  row("leo-focus-data-services.toml", "leo-missions", () => t("js-cat-leo-focus-data-services-title", "Service data against frame length"), () => t("js-cat-leo-focus-data-services-question", "What does each extra data service cost in navigation-message bits? (modelled)")),
  row("leo-focus-fused-pnt-sisre.toml", "leo-missions", () => t("js-cat-leo-focus-fused-pnt-sisre-title", "Fused fix against orbit and clock error"), () => t("js-cat-leo-focus-fused-pnt-sisre-question", "How good must the low-orbit signal-in-space range error be before the low-orbit layer helps a fused fix? (modelled)")),
  row("leo-focus-indoor-uhf.toml", "leo-missions", () => t("js-cat-leo-focus-indoor-uhf-title", "Indoor reception by band and building"), () => t("js-cat-leo-focus-indoor-uhf-question", "Which band still reaches a user inside a traditional and a thermally efficient building? (modelled)")),
  row("leo-focus-iot-eirp.toml", "leo-missions", () => t("js-cat-leo-focus-iot-eirp-title", "Tracker energy against transmit power"), () => t("js-cat-leo-focus-iot-eirp-question", "How much satellite transmit power does a battery tag need to last? (modelled)")),
  row("leo-focus-ntn-bandwidth.toml", "leo-missions", () => t("js-cat-leo-focus-ntn-bandwidth-title", "5G downlink positioning against bandwidth"), () => t("js-cat-leo-focus-ntn-bandwidth-question", "How does the positioning error fall as the reference signal widens from 180 kHz to 20 MHz? (modelled)")),
  row("leo-focus-ppp-altitude.toml", "leo-missions", () => t("js-cat-leo-focus-ppp-altitude-title", "Precise positioning against layer altitude"), () => t("js-cat-leo-focus-ppp-altitude-question", "Does a lower or a higher low-orbit layer shorten convergence more? (modelled; slow, about a minute in a browser)")),
  row("leo-resilience-gnss-jammed-leo-carries.toml", "leo-missions", () => t("js-cat-leo-resilience-gnss-jammed-leo-carries-title", "GNSS jammed, low orbit carries on"), () => t("js-cat-leo-resilience-gnss-jammed-leo-carries-question", "When GNSS is jammed, can a low-orbit layer in other bands keep the fix and its integrity? (modelled)")),
  row("leo-resilience-multiband-diversity.toml", "leo-missions", () => t("js-cat-leo-resilience-multiband-diversity-title", "Band diversity under a barrage jammer"), () => t("js-cat-leo-resilience-multiband-diversity-question", "As one L-band jammer is turned up, which of four bands keep tracking? (modelled)")),
  row("leo-resilience-spoof-monitors.toml", "leo-missions", () => t("js-cat-leo-resilience-spoof-monitors-title", "Spoofing monitors against four spoofers"), () => t("js-cat-leo-resilience-spoof-monitors-question", "Which monitor sees which kind of spoofer? (modelled)")),
  row("leo-vertical-5g-network-timing.toml", "leo-missions", () => t("js-cat-leo-vertical-5g-network-timing-title", "5G base-station timing"), () => t("js-cat-leo-vertical-5g-network-timing-question", "When GNSS is lost for a day, does low-orbit time keep a base station inside its timing limit? (modelled)")),
  row("leo-vertical-asset-tracking-iot.toml", "leo-missions", () => t("js-cat-leo-vertical-asset-tracking-iot-title", "Container tracking"), () => t("js-cat-leo-vertical-asset-tracking-iot-question", "Along a container's journey, what does each position fix cost a battery tag? (modelled)")),
  row("leo-vertical-autonomous-vehicle.toml", "leo-missions", () => t("js-cat-leo-vertical-autonomous-vehicle-title", "Vehicle in an urban canyon"), () => t("js-cat-leo-vertical-autonomous-vehicle-question", "When buildings hide the low satellites, does a low-orbit layer keep a car inside a lane-level error? (modelled)")),
  row("leo-vertical-autonomous-vehicle-skyline.toml", "leo-missions", () => t("js-cat-leo-vertical-autonomous-vehicle-skyline-title", "Vehicle in a street, not a flat cut-off"), () => t("js-cat-leo-vertical-autonomous-vehicle-skyline-question", "Modelled as a real street instead of a flat 35° cut-off, does a low-orbit layer still keep a car inside a lane-level error? (modelled; representative skyline)")),
  row("leo-vertical-critical-infrastructure-timing.toml", "leo-missions", () => t("js-cat-leo-vertical-critical-infrastructure-timing-title", "Substation timing"), () => t("js-cat-leo-vertical-critical-infrastructure-timing-question", "When GNSS is lost, does low-orbit time hold a substation's synchronisation? (modelled)")),
  row("leo-vertical-polar-arctic.toml", "leo-missions", () => t("js-cat-leo-vertical-polar-arctic-title", "Arctic journey"), () => t("js-cat-leo-vertical-polar-arctic-question", "From Tromsø to the North Pole, what does a polar low-orbit layer add to GNSS? (modelled)")),
  row("leo-vertical-rail-maritime.toml", "leo-missions", () => t("js-cat-leo-vertical-rail-maritime-title", "Rail and maritime with a low-orbit layer"), () => t("js-cat-leo-vertical-rail-maritime-question", "When the bundled ship and train scenarios lose GNSS, does a low-orbit pass still reach them? (modelled)")),
  // Campaigns
  row("campaign-jam-spoof-holdover-integrity.toml", "campaigns", () => t("js-cat-campaign-jam-spoof-holdover-integrity-title", "Chained mission: jam, spoof, hold over, alarm"), () => t("js-cat-campaign-jam-spoof-holdover-integrity-question", "What happens to one receiver through jamming, spoofing, GNSS loss, an integrity alarm and recovery, on one timeline? (modelled)")),
  row("campaign-spectrum-holdover-integrity.toml", "campaigns", () => t("js-cat-campaign-spectrum-holdover-integrity-title", "Spectrum-driven mission"), () => t("js-cat-campaign-spectrum-holdover-integrity-question", "A jammer takes two L-band signals, the clock holds over and the receiver falls back to Galileo alone: does integrity monitoring still hold? (modelled)")),
  row("campaign-sweep-jammer-power.toml", "campaigns", () => t("js-cat-campaign-sweep-jammer-power-title", "Jammer power sweep"), () => t("js-cat-campaign-sweep-jammer-power-question", "As a jammer 1 km away is turned up from 10 nW to 10 W, when does the receiver lose its fix? (modelled)")),
  row("campaign-monte-carlo-clock-holdover.toml", "campaigns", () => t("js-cat-campaign-monte-carlo-clock-holdover-title", "Monte Carlo clock holdover"), () => t("js-cat-campaign-monte-carlo-clock-holdover-question", "Over many seeded runs, does a free-running clock's time error match its closed-form spread?")),
  row("campaign-shared-jammer-sea-road.toml", "campaigns", () => t("js-cat-campaign-shared-jammer-sea-road-title", "One jammer, a ship and a car"), () => t("js-cat-campaign-shared-jammer-sea-road-question", "Under one jammer, which platform loses its fix: the ship 30 km away or the car 50 km away? (modelled)")),
  row("campaign-optimize-link-budget.toml", "campaigns", () => t("js-cat-campaign-optimize-link-budget-title", "Optimise a link budget"), () => t("js-cat-campaign-optimize-link-budget-question", "Over range and data rate, where does an X-band link leave exactly 3 dB of margin?")),
  // Solar system
  row("solar-system-tour.toml", "solar", () => t("js-cat-solar-system-tour-title", "Solar system at one epoch"), () => t("js-cat-solar-system-tour-question", "Where is every body the engine knows, from the Sun to Pluto and the large moons, and how long does light take between them?")),
  row("mars-orbit-pnt.toml", "solar", () => t("js-cat-mars-orbit-pnt-title", "Mars orbiter with relays and an Earth link"), () => t("js-cat-mars-orbit-pnt-question", "How well is a low Mars orbiter positioned from twelve navigation relays, and what does a range from Earth add? (modelled)")),
  row("europa-surface-pnt.toml", "solar", () => t("js-cat-europa-surface-pnt-title", "Lander on Europa"), () => t("js-cat-europa-surface-pnt-question", "Can a lander on Jupiter's moon Europa be positioned from a small relay constellation and a range from Earth? (modelled)")),
  // Quantum, trade studies & interoperability
  row("quantum-trade.toml", "studies", () => t("js-cat-quantum-trade-title", "Quantum PNT trade"), () => t("js-cat-quantum-trade-question", "What timing / inertial holdover does a candidate clock buy over a classical baseline? (modelled)")),
  row("quantum-anomaly-detect.toml", "studies", () => t("js-cat-quantum-anomaly-detect-title", "Quantum anomaly detect"), () => t("js-cat-quantum-anomaly-detect-question", "How well are quantum-system faults detected at a fixed false-alarm rate? (modelled)")),
  row("sweep-nd-inertial.toml", "studies", () => t("js-cat-sweep-nd-inertial-title", "N-D sweep"), () => t("js-cat-sweep-nd-inertial-question", "How does a figure of merit vary across a multi-parameter grid?")),
  row("oem-interop.toml", "studies", () => t("js-cat-oem-interop-title", "CCSDS OEM bridge"), () => t("js-cat-oem-interop-question", "Can an OEM ephemeris from GMAT / Orekit / STK be imported and round-tripped?")),
  row("space-packet.toml", "studies", () => t("js-cat-space-packet-title", "Space Packet"), () => t("js-cat-space-packet-question", "Does a CCSDS 133.0 packet stream encode and decode bit-exactly?")),
  row("quantum-pnt-demonstrator.suite.toml", "studies", () => t("js-cat-quantum-pnt-demonstrator-suite-title", "Quantum PNT demonstrator study"), () => t("js-cat-quantum-pnt-demonstrator-suite-question", "The three quantum application areas as one study (a command-line study suite: kshana --study).")),
];

// Files the browser engine cannot run, with the reason shown in the library.
export const NOT_IN_BROWSER = {
  get "lunar-llr-datum.toml"() { return t("js-cat-notinbrowser-laser-ranging-data", "Needs the archived laser-ranging data slice that ships with the repository, not with the browser build."); },
  get "lunar-station-geodesy-baseline.toml"() { return t("js-cat-notinbrowser-laser-ranging-data", "Needs the archived laser-ranging data slice that ships with the repository, not with the browser build."); },
  get "lunar-station-geodesy-with-station.toml"() { return t("js-cat-notinbrowser-laser-ranging-data", "Needs the archived laser-ranging data slice that ships with the repository, not with the browser build."); },
  get "lunar-station-coverage-terrain.toml"() { return t("js-cat-notinbrowser-elevation-model", "Needs the lunar elevation-model crop ({ $path }) that ships with the repository, not with the browser build.", { path: "data/lunar-dem/" }); },
  get "quantum-pnt-demonstrator.suite.toml"() { return t("js-cat-notinbrowser-study-suite", "A study suite, not a single scenario. Run it with the command-line tool: { $command }.", { command: "kshana --study" }); },
};
// Of those, the files the Studio shows as a run recorded with the native command-line engine.
export const RECORDED_NATIVELY = ["lunar-llr-datum.toml", "lunar-station-coverage-terrain.toml", "lunar-station-geodesy-baseline.toml", "lunar-station-geodesy-with-station.toml"];
// Bundled scenarios that need a newer engine than an older package has: what they need (a kind the engine lists, or
// a function it exports) and the release that brings it. With an engine that lacks it, the Studio shows the recording
// made with one that has it and does not run them (an older engine refuses their fields, or runs without them).
// The test is the engine's own capability, not its version string: a build from a branch before the release still
// reports the previous version. The 0.36 skyline and ground-site scenarios, and the lunar reference-station kind.
const SKYLINE_036 = Object.freeze({ release: "0.36", fn: "skyline_profile" });
export const NEEDS_ENGINE = Object.freeze({
  "gnss-sim-container-terminal-skyline.toml": SKYLINE_036, "integrity-harbour-approach.toml": SKYLINE_036,
  "jamming-harbour-approach-skyline.toml": SKYLINE_036, "leo-pvt-fjord-skyline.toml": SKYLINE_036,
  "leo-vertical-autonomous-vehicle-skyline.toml": SKYLINE_036, "orbit-urban-canyon-skyline.toml": SKYLINE_036,
  "lunar-station-coverage.toml": Object.freeze({ release: "0.36", kind: "lunar-station-coverage" }),
  "lunar-station-coverage-public-sources.toml": Object.freeze({ release: "0.36", kind: "lunar-station-coverage" }),
  // The lunar-time-budget kind is older, but its [time_lab] block is not: it ships with the station study, whose kind
  // stands in for it.
  "lunar-station-time-lab.toml": Object.freeze({ release: "0.36", kind: "lunar-station-coverage" }),
  // 0.38: the holdover test (a time-error record split at the operator's two times and measured against ITU-T masks).
  "holdover-test-example.toml": Object.freeze({ release: "0.38", kind: "holdover-test" }),
  "holdover-test-ptp4l.toml": Object.freeze({ release: "0.38", kind: "holdover-test" }),
});
// What the engine running here can do: {version, kinds, fns} (kinds from list_kinds(), fns its exported functions).
export function engineCaps(mod) {
  const fns = new Set(Object.keys(mod || {}).filter((k) => typeof mod[k] === "function"));
  let kinds = null;
  try { const k = JSON.parse(mod.list_kinds()); if (Array.isArray(k)) kinds = new Set(k.map((x) => (x && typeof x === "object" ? x.name : x)).filter((x) => typeof x === "string")); } catch { /* an engine without list_kinds */ }
  return { version: typeof mod?.version === "function" ? String(mod.version()) : "", kinds, fns };
}
// The release a scenario needs, as "0.36", when the engine (caps, or a bare version string) lacks what it needs; else
// null. Without capability facts, the version decides.
export function needsNewerEngine(file, caps) {
  const need = NEEDS_ENGINE[file];
  if (!need) return null;
  const c = typeof caps === "string" || caps == null ? { version: caps || "" } : caps;
  if (need.kind && c.kinds) return c.kinds.has(need.kind) ? null : need.release;
  if (need.fn && c.fns) return c.fns.has(need.fn) ? null : need.release;
  const [a, b] = String(c.version || "").split(".").map((x) => parseInt(x, 10) || 0), [ma, mb] = need.release.split(".").map(Number);
  return a > ma || (a === ma && b >= mb) ? null : need.release;
}

export const DEFAULT_SCENARIO = "clock-holdover.toml";

// Folder a scenario's files live under ("" for the bundled set, the group's own folder for an optional group).
const DIRS = new Map();
// What may stand in a request path. An optional group's folder ("name/") and its scenario file names come from
// JSON files; they are checked against these plain patterns before they are used in any address, so no file
// content can point a request elsewhere (another folder, another origin, a scheme).
export const isGroupDir = (d) => typeof d === "string" && /^[a-z0-9][a-z0-9-]{0,40}\/$/.test(d);
export const isScenarioFile = (f) => typeof f === "string" && /^[a-z0-9][a-z0-9._-]{0,100}\.toml$/.test(f);
// The fixed files a folder holds that the Studio fetches; `dir` is "" (the Studio's own folder) or a checked group folder.
const GROUP_FILES = new Set(["recorded/index.json", "native/index.json", "areas.json", "index.json"]);
export function groupFileUrl(dir, tail) {
  if (!GROUP_FILES.has(tail) || (dir !== "" && !isGroupDir(dir))) return null;
  if (tail === "areas.json" && dir === "") return "data/areas.json";
  return `${dir}${tail}`;
}

export function dirOf(file) {
  return DIRS.get(file) || "";
}

// Add an optional group of scenarios that ships in its own folder (so it can be left out by
// deleting that folder): { dir, domain: { id, label, color }, scenarios: [[file, title, question]] }.
// Returns how many entries were added.
export function registerGroup(group) {
  if (!group || !group.domain || !Array.isArray(group.scenarios)) return 0;
  if (!isGroupDir(group.dir)) return 0; // a folder name read from a file never becomes a request path unless it is a plain folder here
  if (!DOMAINS.some((d) => d.id === group.domain.id)) DOMAINS.push({ id: group.domain.id, label: String(group.domain.label), color: group.domain.color || "var(--ink-2)" });
  let n = 0;
  for (const s of group.scenarios) {
    if (!Array.isArray(s) || !isScenarioFile(s[0]) || SCENARIOS.some((x) => x[0] === s[0])) continue;
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
  if (!isScenarioFile(file) || !entryFor(file)) return null;
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
