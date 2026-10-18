<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# LunaNet Augmented Forward Signal: codes, message format and `lunanet-afs-check`

Kshana implements the spreading codes and the message layer of the LunaNet **Augmented Forward
Signal (AFS)** as one edition of the specification defines them, and checks itself against that
edition's printed tables.

**Pin.** LunaNet Interoperability Specification (LNIS) **Version 5**, Applicable Document 1
Volume A: *LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal* (LSIS-AFS)
**Version 1.0, 29 January 2025** (NASA). Retrieved 2026-10-18; PDF SHA-256
`986e0795…e61b6` ([provenance](../xval/lunanet-afs/oracle/PROVENANCE.md)). A later edition is a
different pin and may change the codes: the document marks its code tables {LSIS-TBC} and says
they are "included to facilitate test and integration efforts only". Every report names this
edition.

Advisory: analysis output from a research and engineering tool, not type-approved navigation
equipment and not a safety-of-life service.

## What is implemented

| Layer | What | Where |
|---|---|---|
| AFS-I (data) | Gold code 2047 short-cycled to 2046 chips, G2 delayed by a per-PRN number of chips, 1.023 Mchip/s, BPSK(1), 500 symbol/s, PRN 1 to 210 | `iq::signals::lunanet::afs_i`, signal name `lunanet-afs-i` |
| AFS-Q (pilot) | Weil code 10230 (the GPS L1C construction) tiered with a 4-chip secondary code (S0 to S3) and a 1500-chip tertiary Weil code (12 s), 5.115 Mchip/s, BPSK(5), no data. `afs_q` and the signal name `lunanet-afs-q` are the receiver replica, primary x secondary (8 ms): the 12 s tertiary frame-synchronisation overlay is left out of it, because acquisition and tracking do not correlate against a 12 s replica. `afs_q_tiered` is the full 12 s code | `afs_q`, `afs_q_with`, `afs_q_tiered` |
| Carrier | 2492.028 MHz (LSIS-020) | `AFS_HZ` |
| Frame | SP 68 + SB1 52 + 5880 interleaved symbols = 6000 symbols = 12 s at 500 symbol/s | `iq::lunanet_afs` |
| SB1 | 9 bits (FID 2, TOI 7), BCH(51,8), generator 763 octal, with the document's 256-hypothesis correlation decoder | `sb1_encode`, `sb1_decode` |
| CRC | CRC-24Q, generator (1+X)P(X) (Appendix H) | `crc24q_bits`, `crc24q_bytes` |
| Interleaver | 60 rows x 98 columns, written by row and read by column | `interleave`, `deinterleave` |

The two components are accepted by `kshana iq scene`, `acquire`, `track` and `sweep` like any other
signal, so a recording can be searched for AFS-I or AFS-Q (`kshana iq acquire --signal
lunanet-afs-i`) and a synthetic scene can be made for software-receiver tests. A synthetic scene,
as for every other signal, is a file for a software receiver; nothing here drives radio hardware.

## What is **not** implemented

- **The rate-1/2 LDPC coding of subframes 2 to 4.** Its check matrices are in Annex 1, a separate
  file that is not in the PDF and is not vendored. Subframes 2 to 4 are carried and checked as
  opaque symbol blocks of the specified length, and the CRC-24Q words inside them are not
  verified. A stream that passes `lunanet-afs-check symbols` is not shown to hold valid
  codewords.
- **Message content** (MSG-G1, MSG-G2, MSG-G4, ...): the document leaves several definitions
  to be written (TBW).
- **Code assignment per LunaNet node** (Table F-1 is TBD). PRNs 1 to 12 have interim test
  assignments (Table 11). `afs_q(prn)` uses PRN *n*'s primary code with secondary S((n-1) mod 4); beyond
  PRN 12 that is this implementation's pattern, not the document's. `afs_q_with` and `afs_q_tiered`
  take any combination, with the tertiary code of any PRN.
- Link budget, signal-in-space error, power and coherency requirements (LSIS-100 and following).

## `kshana lunanet-afs-check`

```sh
kshana lunanet-afs-check spec [--json] [--strict]
kshana lunanet-afs-check symbols <file> [--max-sp-errors <n>] [--json]
kshana lunanet-afs-check generate --frames <n> [--toi0 <t>] --out <file>
```

- `spec` runs the implementation against the document's printed tables and worked examples (bars
  B1 to B10 of [the pre-registration](../xval/lunanet-afs/PREREGISTRATION.md)) and prints each
  with its count and status. `--strict` exits 1 unless every bar is met.
- `symbols` reads a hard-decision symbol stream (text of `0` and `1`; white space ignored) and
  checks the synchronisation pattern, SB1 decoding, FID (only 0 is defined), TOI continuity
  (advancing by one modulo 100) and frame spacing (6000 symbols). It exits 1 on any problem.
- `generate` writes a test stream: the document's synchronisation pattern, SB1 and frame
  lengths, with **placeholder** subframes 2 to 4 (the alternating fill of LSIS-300, not LDPC coded,
  no message). It is symbols for testing a checker or a decoder, not a waveform; Kshana writes no
  signal.

Python: `lunanet_afs_check_spec`, `lunanet_afs_check_symbols`, `lunanet_afs_generate`. WebAssembly:
the same names. MCP: `lunanet_afs_check` (`mode` spec, symbols or generate). Plugin:
`/kshana-lunanet-afs-check`. Studio and JetBrains: N/A ([SURFACES.md](SURFACES.md)).

## Results

Bars stated in `xval/lunanet-afs/PREREGISTRATION.md` before the generator existed; tests in
`tests/lunanet_afs_codes.rs`.

| Bar | Claim | Result |
|---|---|---|
| B1 | AFS-I first and last 24 chips, 210 PRNs | **MET**, 420 of 420 |
| B1b | the printed G2 initial state is the state after the printed delay | **NOT MET**, 0 of 210: the claim had the direction wrong. Post hoc (B1c, not pre-registered): the printed state is the state after 2047 minus the delay, 210 of 210 |
| B2 | Legendre(10223) equals Table D-1 | **MET** |
| B3 | AFS-Q primary first and last 24 chips, 210 PRNs | **MET**, 420 of 420 |
| B4 | Legendre(1499) equals Table E-1 and tertiary first and last 24 chips, 210 PRNs | **NOT MET**, 420 of 421: the Legendre sequence matches and 419 of 420 code columns match. The last 24 chips printed for PRN 147 (`A14850`) are the same value printed for PRN 151, whose code the generator reproduces; two different Weil indices (607 and 612) do not give the same last 24 chips, so the PRN 147 entry is most likely a misprint in the document. It cannot be settled without the separate Annex 3 code file. Pinned by a test |
| B5 | secondary codes S0 to S3 equal Table 10 | **MET** (the document's own constants) |
| B6 | SB1 worked example of Figure 8 | **MET**: 0x045 encodes to 0x229F61DBB84A0 and decodes to FID 0, TOI 69 (one example) |
| B7 | CRC-24Q check value for `123456789` | **MET**: 0xCDE703 (the catalogue value, outside the specification) |
| B8 | frame arithmetic | **MET** |
| B9 | interleave then de-interleave | **MET** (a property, MODELLED) |
| B10 | synchronisation pattern | **MET** (68 symbols; a transcription check) |

B1 to B4 are VALIDATED against the printed tables of the cited edition, which the document marks
{LSIS-TBC}. A scene-to-acquire-to-track round trip of both components passes the same bars as the
other signals (`tests/iq_signal_matrix.rs`).
