---
description: Check the LunaNet Augmented Forward Signal (LNIS V5, LSIS-AFS V1.0) - the implementation against the published code tables, or a symbol stream against the frame format - via the kshana-mcp server
argument-hint: "[what to check, e.g. 'check the AFS codes against the spec' or 'check this symbol stream']"
---

# Check the LunaNet Augmented Forward Signal

Kshana implements the LunaNet AFS spreading codes and message format as one edition of the
specification defines them: LNIS Version 5, Applicable Document 1 Volume A (LSIS-AFS V1.0,
29 January 2025). It checks itself against the document's printed code tables and worked examples,
and checks a symbol stream against the frame format. Use the `kshana` MCP server.

Request: **$ARGUMENTS**

1. **The implementation against the document.** Call `lunanet_afs_check` with `mode: "spec"`.
   Report each bar B1 to B10 with its count and status. B4 reports one miss: the document prints
   the same last 24 chips for tertiary PRN 147 and PRN 151, and the generator reproduces PRN 151's,
   so the PRN 147 entry is most likely a misprint. Say that, not that the code is wrong.
2. **A symbol stream.** Call it with `mode: "symbols"` and the stream as text of `0` and `1`.
   It checks the synchronisation pattern, SB1 (BCH(51,8)) decoding, FID, TOI continuity and frame
   spacing. **Subframes 2 to 4 (rate-1/2 LDPC, CRC-24Q) are NOT verified**: the LDPC matrices are in
   a separate annex that is not implemented. Say so.
3. **A test stream.** `mode: "generate"` returns symbols with placeholder subframes: for testing
   a checker, not a waveform. Kshana writes no signal.
4. **The waveform in a recording.** Use `kshana iq acquire --signal lunanet-afs-i` (or
   `lunanet-afs-q`) on the command line (`/kshana-iq`).

**Always say** the codes are VALIDATED only against the printed tables of that edition, which the
document marks TBC, and that a pass says nothing about any LunaNet node or service. Advisory only.
Details: `docs/LUNANET-AFS.md`.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
