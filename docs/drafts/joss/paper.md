---
title: 'DRAFT: Kshana, a neutral referee for GNSS interference and PNT-resilience evidence'
tags:
  - Rust
  - GNSS
  - PNT
  - interference
  - benchmark
  - reproducibility
authors:
  - name: Ashforde OÜ
    affiliation: 1
affiliations:
  - index: 1
    name: Ashforde OÜ, Estonia
date: DRAFT
bibliography: paper.bib
---

<!--
DRAFT for owner approval. Not submitted. Author list, ORCIDs, any external co-author
and the decision to submit are the owner's. The existing paper/paper.md is the 0.2x-era
submission text; this draft covers 0.38. Claims below are limited to what the 0.38
ledger labels VALIDATED; regenerate the counts at the final SHA before use.
-->

# Summary

Kshana is a deterministic, open Rust engine (also usable from Python, a browser via
WebAssembly, and an MCP server) that scores how a positioning, navigation and timing
system behaves under interference and outage. Version 0.38 adds the pieces that let it
act as a neutral referee: receiver-log scoring against events stated before a run,
a published test-conditions interchange format linking a scenario, a laboratory set-up
and a receiver log by hash, standards evidence packs, and a public benchmark. Every
result is reproducible from a scenario, seed and engine version, and every capability
is labelled VALIDATED only where an external oracle agrees.

# Statement of need

Receiver makers, test laboratories and regulators compare resilience claims across
incompatible logs, simulators and ad hoc spreadsheets. Open tools process real
signals [@takasu2009]; frameworks describe levels and test classes in prose
[@dhs_rpcf2022; @imo_msc401] but ship no executable, neutral scoring. Kshana supplies
the scoring and the evidence format, and states plainly what each output does and does
not support evidence for.

# Design

Pre-registered bars are committed before any scored run and never loosened; a miss is
pinned by a test. No transmit path exists: laboratory use consumes exported motion and
events, and a simulator operator supplies signals where that is authorised. Third-party
data is referenced by manifest and pinned SHA-256, never redistributed.

# Quality control

A machine-checked verification matrix separates VALIDATED from MODELLED rows. Native and
WebAssembly builds produce byte-identical results for the same scenario.

# Acknowledgements

DRAFT: none until the owner decides who is named.

# References
