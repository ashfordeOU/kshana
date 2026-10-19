<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: LunaNet Augmented Forward Signal (AFS) codes and message format

Committed before the generator (`src/iq/signals/lunanet.rs`) and the checker
(`src/iq/lunanet_afs/`) exist, and before any comparison with the tables below. The bars are
exact: a code either matches the printed chips or it does not, and nothing here is loosened
after a run. A miss is pinned by a test that asserts it.

## What is pinned

LunaNet Interoperability Specification (LNIS) **Version 5**, Applicable Document 1 Volume A:
**LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS), Version 1.0,
29 January 2025** (NASA; <https://www.nasa.gov/wp-content/uploads/2025/02/lunanet-signal-in-space-recommended-standard-augmented-forward-signal-vol-a.pdf>),
the PDF whose SHA-256 is recorded in `oracle/*.csv` (986e0795…e61b6). A different edition is a
different pin; the checker names this one in every report.

The document marks its code tables and several parameters {LSIS-TBC} or {LSIS-TBD}: it says the
codes are "included to facilitate test and integration efforts only" and that implementers should
support a flexible code configuration. Kshana therefore implements the construction and the tables
of V1.0 as printed, labels them as that edition's, and makes no claim about a later one. NASA's
specification is a US Government publication; only its code-defining constants and the first and
last 24 chips of each code are reproduced here, with provenance, under `oracle/`. The Annex files
(the code CSV and the LDPC matrices) are separate downloads and are not vendored.

## The oracle

The printed columns of Tables C-1 to C-5, D-1 to D-6 and E-1 to E-6, extracted by
`scripts/extract_lunanet_afs_tables.py` into `xval/lunanet-afs/oracle/`. Parameters (G2 delay, Weil
index k, insertion index p, tertiary index k) are inputs to the generator; the printed first and
last 24 chips and the two printed Legendre sequences are never given to it, only compared with its
output.

## Bars

| ID | Claim | Bar |
|---|---|---|
| B1 | AFS-I primary code: 2046-chip Gold code short-cycled from 2047, G2 delayed by the printed number of chips | first 24 and last 24 chips equal the printed hex for all 210 PRNs (420 of 420) |
| B1b | The printed G2 initial state (hex) is the state reached by advancing the all-ones G2 register by the printed delay | 210 of 210 |
| B2 | Legendre sequence of length 10223 (quadratic residues modulo 10223) | equals Table D-1 bit for bit |
| B3 | AFS-Q primary code: Weil code W(t; k) with the 7-chip expansion `0110100` inserted before position p | first 24 and last 24 chips equal the printed hex for all 210 PRNs (420 of 420) |
| B4 | Legendre sequence of length 1499 and tertiary Weil code of length 1500 (one `0` appended) | the Legendre sequence equals Table E-1; first and last 24 chips equal the printed hex for all 210 PRNs (420 of 420) |
| B5 | Secondary codes S0 to S3 | equal Table 10 (`1110`, `0111`, `1011`, `1101`) |
| B6 | Subframe 1: BCH(51,8), generator polynomial 763 octal, with the MSB added modulo 2 to the 51 symbols | the worked example of Figure 8 reproduces: SB1 field 0x045 (FID 0, TOI 69) encodes to 0x229F61DBB84A0; and the decoder of section 2.4.2.1 returns FID 0, TOI 69 from it |
| B7 | CRC-24Q of Appendix H (generator (1+X)P(X)) | the standard CRC-24Q check value for the ASCII bytes `123456789` is 0xCDE703 |
| B8 | Frame arithmetic stated in the document | 68 sync + 52 SB1 + 2400 + 1740 + 1740 = 6000 symbols = 12 s at 500 symbols/s; the interleaver holds 5880 = 60 x 98 symbols; tertiary code 1500 chips |
| B9 | Block interleaver of section 2.4.3.1.5 | de-interleaving an interleaved 5880-symbol block returns it unchanged |
| B10 | Synchronization pattern | 68 symbols from the printed hex `CC63F74536F49E04A` |

## Status labels

- B1 to B4 VALIDATED against the printed tables of the cited edition, which the document itself
  marks {LSIS-TBC}; a later edition may change them.
- B5, B8, B10 are the document's own constants and arithmetic (a transcription check, not an
  independent oracle).
- B6 is checked against **one** worked example (n = 1); the code's other properties are MODELLED.
- B7 is checked against the CRC catalogue's published check value for CRC-24Q, an oracle outside
  the specification.
- B9 is a property of the construction (MODELLED).
- **Not implemented:** the rate-1/2 LDPC coding of subframes 2 to 4. The check matrices are in
  Annex 1, a separate file that is not in the PDF; subframes 2 to 4 are therefore carried and
  checked as opaque symbol blocks of the specified length, and `lunanet-afs-check` says so.
- The link budget, signal-in-space error and message content (MSG-G1 and the rest) are outside
  this check (the specification leaves several of them TBW).
