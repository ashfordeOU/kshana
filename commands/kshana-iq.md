---
description: Generate, inspect, acquire, track and front-end-process GNSS IQ recordings in the kshana-mcp work directory, and run lab-replay campaigns
argument-hint: "[what to do with IQ, e.g. 'make a 2 s GPS L1 C/A scene with PRNs 5 and 12 and acquire it']"
---

# GNSS IQ: scene, acquire, track, front end, campaign

The IQ tools are the signal-level layer of the **Kshana engine** (`kshana iq`). No sample ever
crosses the protocol: the tools read and write files in one **work directory** the server owner
configures (`KSHANA_MCP_IQ_DIR`), and each reply is a compact JSON summary. They process
recordings and generate synthetic scenes for software receivers; nothing is transmitted and no
radio hardware is driven. Use the `kshana` MCP server.

Request: **$ARGUMENTS**

1. **Start with `iq_signals`.** It says whether the IQ tools are on, the work directory, the
   per-call sample budget and the signal names. If they are off, say why and stop: the rest of
   the server is unaffected.
2. **Make or find a recording.**
   - `iq_scene`: write a synthetic multi-satellite scene (`signal` + `prns`, or a RINEX
     navigation file in the work directory plus `rx_pos` for true broadcast geometry). The scene
     must fit the sample budget (`rate_hz x duration_s`). The reply gives the truth for the
     first epoch of each satellite to score acquisition against.
   - `iq_info`: describe an existing recording (format, rate, length, annotations; `hash` adds
     SHA-256). Give a raw file's format and rate in `raw` when it has no sidecar.
3. **Process it.**
   - `iq_acquire`: FFT acquisition per PRN (Doppler, code phase, detection statistic against its
     threshold). `surface_out` keeps the whole correlation surface for one PRN.
   - `iq_track`: acquire then track (PLL/DLL, optionally a loop-design file) and report lock
     state and C/N0 per channel; per-epoch tables go to files you name, never into the reply.
   - `iq_frontend`: band-pass, notch, blanking, excision, AGC and a quantiser, written as a new
     recording.
4. **Campaigns.** `iq_campaign` runs the pending cells of a lab-replay campaign (recordings x
   front-end chains x loop designs, scored against stated test conditions); it resumes on the
   next call. `iq_campaign_status` reports progress.
5. **Rules.** Paths are relative to the work directory; an output that exists is refused unless
   `overwrite`. A call over the sample budget is refused with the numbers that fit; narrow the
   span (`max_seconds`). Jamming or spoofing synthesis is not part of this layer. Report what the
   tool measured, with its evidence tier (MODELLED where it says so).
