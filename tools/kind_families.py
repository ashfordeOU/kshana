#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""The family every scenario kind is filed under, shared by tools/gen_readme_blocks.py and tools/gen_kinds_index.py.

A kind the engine adds and that no family names makes both tools fail, so a new kind cannot be left out of the
README, of docs/KINDS.md or of its family page.
"""
import re

# family -> (docs pages, one command that runs a kind of the family, kinds)
FAMILIES = [
    ("Clocks, timing and holdover", ("docs/TELECOM-TIMING.md", "docs/SLOT-TIMING.md", "docs/TIMING-HIL.md", "docs/CLOCK-LOG-FORMATS.md"), "kshana scenarios/clock-holdover.toml",
     ["clock", "sweep", "sweep-nd", "telecom-timing", "slot-timing", "timetransfer", "time-transfer-budget", "holdover-test", "quantum-time-transfer"]),
    ("Inertial, fusion and quantum sensors", ("docs/QUANTUM-MODELS.md", "docs/QUANTUM.md", "docs/LEO-PNT-FUSION.md"), "kshana scenarios/gnss-ins.toml",
     ["inertial", "hybrid", "fusion", "hybrid-ukf", "gnss-ins", "ins-trn-coast", "quantum-gnss-free-nav", "quantum-anomaly-detect", "quantum-trade"]),
    ("GPS-denied alternative PNT", ("docs/CAPABILITY.md", "docs/RESILIENCE-CROSSWALK.md"), "kshana scenarios/combined-altpnt.toml",
     ["gravity-map", "terrain-nav", "terrain-slam", "combined-altpnt", "conflict-resilience"]),
    ("Constellations, coverage and geometry", ("docs/CONSTELLATION-DESIGN.md", "docs/COVERAGE.md", "docs/SOLAR-SYSTEM.md", "docs/SKYLINE.md"), "kshana scenarios/orbit-gnss-challenged.toml",
     ["orbit", "ephemeris", "constellation-design", "solar-system", "body-pnt", "mars-pnt", "passes"]),
    ("GNSS measurements, positioning and integrity", ("docs/INTEGRITY.md", "docs/POSITIONING.md", "docs/ARAIM_REFERENCE.md", "docs/OSNMA.md"), "kshana scenarios/integrity-raim.toml",
     ["integrity", "gnss-sim", "pvt", "araim-reference-check", "space-weather", "realtime-frame-eop"]),
    ("Jamming, spoofing and the spectrum", ("docs/SPECTRUM.md", "docs/DECEIVED-TIME.md", "docs/IQ-FOLLOW.md"), "kshana scenarios/jamming-demo.toml",
     ["jamming", "spoof", "spoof-detect", "tracking-loop", "spectrum", "impairment-eval"]),
    ("Low-Earth-orbit navigation", ("docs/LEO-PNT.md", "docs/LEO-SIGNAL.md", "docs/LEO-PASS.md", "docs/LEO-NAVMSG.md"), "kshana scenarios/leo-pnt-end-to-end.toml",
     ["leo-signal", "leo-pass", "leo-navmsg", "leo-pvt", "leo-ppp", "ntn-positioning", "leo-pnt-chain"]),
    ("Lunar and cislunar", ("docs/LUNAR-REFERENCE-STATION.md", "docs/LUNAR-INFRASTRUCTURE.md", "docs/LUNANET-AFS.md"), "kshana scenarios/lunar-infrastructure-od-consistency.toml",
     ["lunar-integrity", "lunar-time-offset", "lunar-time-budget", "lunar-ascent", "lunar-surface", "lunar-descent", "lunar-orbit-rendezvous", "lunar-vlbi", "lunar-vlbi-fim", "lunar-joint-od-clock", "lunar-frame-realisation",
      "lunar-frame-campaign", "lunar-llr-datum", "moonlight-service-volume", "lunar-differential-pnt", "lunar-station-coverage", "lunar-beacon",
      "lunar-interop-export", "cislunar-observability", "cislunar-arc-recovery", "lunar-attack-surface", "lunar-jamming", "earth-gnss-lunar",
      "lunar-infrastructure"]),
    ("Space-user navigation", ("docs/SSV.md",), "kshana scenarios/gnss-ssv-shell.toml", ["gnss-ssv"]),
    ("Optical PNT", ("docs/OPTICAL-ATMOSPHERE.md",), "kshana scenarios/optical-atmosphere-network.toml", ["optical-atmosphere", "hybrid-optical-rf"]),
    ("Mission analysis, links and space operations", ("docs/ENTRY-EO-ASCENT.md", "docs/CONTACT-SCHEDULING.md", "docs/AOCS.md"), "kshana scenarios/launch-window.toml",
     ["launch-window", "ascent-losses", "reentry", "entry-heating", "eo-coverage", "eo-radiometry", "attitude-budget", "aocs", "link-budget",
      "acm-link", "contact-schedule", "aperture-duty-cycle", "space-packet", "oem-interop"]),
    ("Mission threads", ("docs/MISSION-THREAD.md", "docs/MISSION-THREAD-LUNAR.md", "docs/mission-thread/lunar-phases.md"), "kshana scenarios/mission-thread-artemis-class.toml", ["mission-thread"]),
    ("Campaigns", ("docs/CAMPAIGNS.md",), "kshana scenarios/campaign-jam-spoof-holdover-integrity.toml", ["campaign"]),
]


def slug(name: str) -> str:
    return re.sub(r"[^a-z0-9]+", "-", name.lower()).strip("-")


# One line on what each family answers (prose, not a count).
BLURB = {
    "Clocks, timing and holdover": "how long a clock keeps time without GNSS, and how a timing system holds up against its masks",
    "Inertial, fusion and quantum sensors": "dead reckoning and sensor fusion through a GNSS outage, with classical and quantum sensors",
    "GPS-denied alternative PNT": "navigating from gravity, terrain and other fields when GNSS is gone",
    "Constellations, coverage and geometry": "where satellites are, who sees them and how good the geometry is, around the Earth, the Moon or Mars",
    "GNSS measurements, positioning and integrity": "pseudoranges, position fixes, protection levels and the space environment",
    "Jamming, spoofing and the spectrum": "how interference reaches a receiver and whether it is detected",
    "Low-Earth-orbit navigation": "a pass, a link, a navigation message and a fused fix, stage by stage",
    "Lunar and cislunar": "navigation, time, frames and geodesy at the Moon",
    "Space-user navigation": "GNSS signals for spacecraft above, around and beyond the GNSS orbits",
    "Optical PNT": "optical links through the atmosphere and optical-plus-RF figures of merit",
    "Mission analysis, links and space operations": "launch, ascent, entry, attitude, links, contact planning and file formats",
    "Mission threads": "the navigation and timing error budget of a chain of phases from launch to entry",
    "Campaigns": "chained missions, sweeps and ensembles built from the other kinds",
}
