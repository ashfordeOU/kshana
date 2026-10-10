---
name: marine-integrations
description: Explain how to show the Kshana vessel trust score in Signal K or OpenCPN, and how the reference build runs it on a small computer next to the receiver. Use when the user asks about Signal K, OpenCPN, a chart plotter feed, or running the gate on a boat. How-to only; no tools are called.
---

# Marine integrations (how-to)

Answer from `docs/MARINE-INTEGRATIONS.md`; see `/kshana-marine-integrations` for the step
list. Code: `integrations/signalk/`, `integrations/opencpn/`, `deploy/reference-build/`.

Rules that apply every time:

- **Advisory only.** Not type-approved navigation equipment (IEC 61108, IEC 61162), not assessed
  against any performance standard; the operator remains responsible. The monitors are
  **MODELLED**, and the checks cannot see a spoofer consistent with every other sensor.
- State how far each piece has been tested, as the page does (the Signal K plugin on recorded
  synthetic output and one scripted run in one server version; OpenCPN by consumer-side replay;
  the reference build not on a vessel). Do not claim a vessel trial.
- The Signal K plugin never writes `navigation.position` and never gates; the gate is a
  separate, opt-in `kshana receiver-trust live --gate` and marks a fix invalid while untrusted.
- Start the monitor before the voyage so it has a clean baseline.
- These are command-line processes: do not offer to run them from a tool, and use made-up
  addresses (`192.0.2.0/24`) in examples.
