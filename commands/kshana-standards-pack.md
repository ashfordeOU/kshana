---
description: List and run the standards packs (DHS Resilient PNT framework test profiles, IMO MSC.1/Circ.1575, ICAO Doc 9849 Appendix F): scored scenarios against bars stated before the run, via the kshana-mcp server
argument-hint: "[which pack or standard, e.g. 'run the IMO integrity pack' or 'what packs are there']"
---

# Run a standards pack

A standards pack is a set of Kshana scenarios scored against **bars stated before the run**, tied
to the compliance rows the tests support evidence for. It measures modelled scenarios; it does not
rate or approve any product, and Kshana is not an assessment body. Use the `kshana` MCP server.

Request: **$ARGUMENTS**

1. **Which packs?** Call `list_standards_packs`.
2. **Run one.** Call `run_standards_pack` with the pack id (`dhs-rpcf`, `imo-circ-1575`,
   `icao-doc9849-appf`). Each test comes back `MET`, `NOT MET` or `NEEDS INPUT`, each bar with its
   measured and expected value. `NEEDS INPUT` means the test needs a receiver log or laboratory
   evidence the operator must supply; it is not scored (score a log with `/kshana-assess-receiver`
   against events stated before the run).
3. **See the rows.** Pass the report JSON (without `markdown`) to `compliance_report` as a run:
   its `standards_packs` section lists the rows the pack's tests support evidence for and what
   their bars came to.

**Always say** that a MET bar means a modelled scenario met a stated bar, that a NOT MET is a
result kept on record (bars are never loosened after a run), and that nothing shows a product or a
framework is met. Advisory only: analysis output, not type-approved navigation equipment.
Details: `docs/compliance/README.md`.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
