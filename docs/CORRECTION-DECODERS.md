# Correction decoders

Open decoders for the precise-correction messages that GNSS satellites broadcast, and test vectors for
them. `kshana corrections decode` reads frames a receiver has already channel-decoded and prints what
they carry as JSON; `kshana corrections vectors` runs the vector set against the decoders.

| Decoder | Service and signal | Interface document | What is read |
|---|---|---|---|
| `has` | Galileo High Accuracy Service, E6-B C/NAV | Galileo HAS SIS ICD, Issue 1.0 (May 2022), sections 2 to 7 | C/NAV page and CRC, HAS page header and dummy pages, the RS(255,32) outer code (any `MS` distinct pages recover a message), message type 1: mask, orbit, clock full-set, clock subset, code and phase biases |
| `b2b` | BeiDou-3 PPP-B2b | BDS-SIS-ICD-PPP-B2b-1.0 (July 2020), section 6 | CRC, message types 1 (mask), 2 (orbit, URAI), 3 (code biases), 4 (clock), 5 (URAI), 6 and 7 (clock and orbit), 63 (null) |
| `l6` | QZSS L6: CLAS (L6D) and MADOCA-PPP (L6E, and its L6D ionospheric messages) | IS-QZSS-L6-008 (18 March 2026), section 4.1; IS-QZSS-MDC-005, sections 4.2 and 6.3 | L6 header (vendor, facility, subframe start, alert), subframe assembly across data parts, Compact SSR sub types 1 to 12, MADOCA-PPP STEC coverage and correction messages |

All three read open-service data only. They report fields with the scale factors of the documents,
`null` for the "data not available" codes, and satellites as `G01`, `E12`, `C19`, `J01` and so on. They
do not apply the corrections to a position (the PPP engine does not use them yet).

## Run

```sh
kshana corrections decode --format has  pages.txt     # or b2b, l6; "-" reads standard input
kshana corrections vectors                           # the built-in set (data/conformance/corrections)
kshana corrections vectors --json my-vectors.json    # other files, or every *.json in a directory
```

A frame file has one frame per line in hexadecimal; blank lines and `#` comments are skipped.

* `has`: a C/NAV page of 492 bits or more (14 reserved bits, the 448-bit HAS page, CRC, tail; longer
  lines are cut at 492 bits), or a bare 448-bit HAS page (no CRC). Pages of all satellites go in one
  file, in reception order.
* `b2b`: the 486 bits after LDPC decoding (61 bytes; the last two bits are ignored).
* `l6`: at least the first 1744 bits of the 2000-bit message (header and data part). The Reed-Solomon
  parity is not checked: the receiver has already decoded it.

`decode` prints one JSON report: counters (frames, bad CRC or preamble, dummy, redundant, orphan and so
on) and the decoded messages in order. `vectors` prints a pass/fail table and exits 1 when a vector
fails, 2 on a usage or file error.

### What the decoders keep between frames

* HAS: pages are grouped by message type and Message ID. When `MS` distinct pages are in, the message
  is recovered by inverting the `MS x MS` sub-matrix of the received PIDs (ICD section 6.4). Pages with a PID above `MS` and up to 32 carry only zeros (section 6.3, never transmitted) and are
  counted as `zero_pid` and skipped. A later page
  with the same Message ID is re-encoded against the recovered message: if it matches it is counted as
  redundant, if not it starts a new message. Masks are kept by Mask ID, so a clock-only message uses the
  mask of an earlier one (section 7.6); without one it reports `error: "no_mask"`. The 150-second
  completion time-out (section 6.4.1) needs reception times, which frame files do not carry, and is not
  applied. Clock corrections are given as sent (`dcc_m`) and times the multiplier (`correction_m`,
  section 7.3).
* B2b: masks are kept by IODP; types 4, 5 and 6 map their entries to satellites through the mask with
  the same IODP, and without one keep the position in the mask (`sat: null`, `note: "no_mask"`).
* L6: data parts are concatenated per stream (PRN, vendor, facility; for MADOCA-PPP also clock and
  orbit apart from ionosphere) from a subframe start to the next, then read as consecutive messages.
  The Compact SSR mask is kept per stream across subframes. Reading stops at a message number that is
  not 4073 (or 1 and 2 for the ionospheric messages), and the report lists subframes that stopped early
  (`truncated`, `no_mask`, `iod_ssr_mismatch`, `unknown_subtype`). GNSS IDs that the service's tables
  do not define are listed in `unknown_gnss_ids`, so a mask from a newer interface version is visible
  rather than silently mislabelled; MADOCA-PPP GNSS ID 7 (BDS-3, mask position 1 = `C19`, added in
  IS-QZSS-MDC-005) is decoded.

### Readings to know about

* Sub type 12 availability fields (IS-QZSS-L6-008 Table 4.1.2-41): bit 0 (value 1) is read as the
  polynomial (hydrostatic) term and bit 1 (value 2) as the residual (wet) term, with the troposphere
  quality present whenever either is set. CLAS fixes both bits to one, so live CLAS data does not depend
  on this reading.
* Sub type 10 is read with 22 header bits (message number, sub type, multiple message indicator,
  counter, data size), as its stated length `22 + 40 x X` implies.
* CLAS SBAS satellites are labelled `S120` upwards (mask position plus 119).

## Test vectors: `kshana.correction-vectors/1`

The set (24 vectors, set version 1.0.0) is `has.json`, `b2b.json` and `l6.json` in
`data/conformance/corrections/`. They are written by `gen_correction_vectors.py`, a Python standard-library encoder that shares
no code with the Rust decoders: from field values it chooses it builds the frames bit by bit (including
the HAS Reed-Solomon parity by polynomial division and the CRCs) and writes the values it expects back.

**Provenance: self-derived.** These are round-trip vectors from a second implementation of our own
reading of the documents. They show that the two implementations agree, not that the reading matches the
services, and no interface-document example or recorded signal is stored in this repository.
`python3 data/conformance/corrections/gen_correction_vectors.py --check` fails when the committed files
differ from what the generator writes (`tests/correction_decoders_cli.rs` runs it).

```json
{
 "format": "kshana.correction-vectors/1",
 "set": "b2b", "version": "1.0.0", "source": "...", "provenance": "...", "generator": "...",
 "vectors": [
  {"id": "b2b-mt1-mask", "decoder": "b2b", "frames": ["04...", "..."],
   "expect": {"frames": 1, "messages": [{"type": 1, "iodp": 5, "mask": ["C01", "C19"]}]},
   "note": "optional prose"}
 ]
}
```

`expect` is matched against the decoder's JSON report: objects as subsets (the report may hold more
keys), arrays element by element with equal length, numbers within `tolerance` (default `1e-9`),
everything else exactly.

| Set | What it covers |
|---|---|
| `has` | a message with every block type and a cell mask, from parity and systematic pages, from C/NAV pages and from bare HAS pages; redundant, dummy, corrupted, zero-carrying and reserved-PID pages; a clock-only and a clock-subset message using an earlier mask; a message whose mask never arrived; an incomplete message; a Message ID reused with new content |
| `b2b` | each message type, the not-available codes, URAI 0 and 63, entries past the mask, a clock message without its mask, null, reserved type, bad CRC and short frames |
| `l6` | a CLAS subframe with sub types 1 to 12 across three data parts, the mask carried to the next subframe, no mask, IOD SSR mismatch and a truncated subframe; MADOCA-PPP with GNSS ID 7 and Galileo E6; the MADOCA-PPP ionospheric coverage and correction messages; QZNMA and orphan data parts, wrong preamble, short frames |

### Checking against the HAS ICD's own examples (opt-in)

The HAS ICD comes with its Reed-Solomon generator matrix (Annex B) and two worked message decoding
examples (Annexes C and D) as attachments. Its terms restrict reproduction, so they are not stored here.
`tests/correction_icd_examples.rs` checks the decoder against a copy you download yourself:

```sh
pdfdetach -saveall -o has-icd Galileo_HAS_SIS_ICD_v1.0.pdf
KSHANA_HAS_ICD_DIR=has-icd cargo test --test correction_icd_examples -- --nocapture
```

It compares the computed generator matrix with Annex B entry by entry, the message recovered from each
example's pages with the hex the annex prints, and the decoded header, mask, orbit, clock, code-bias and
phase-bias values with the annex's (the annex prints the 2-bit multiplier code, the decoder the
multiplier). Without the variable the test does nothing. The BeiDou PPP-B2b and QZSS documents give no
worked examples of their messages, so for B2b and L6 only the self-derived vectors exist.

## Not covered

* Channel decoding: E6-B Viterbi and de-interleaving, the B2b 64-ary LDPC, the L6 Reed-Solomon code.
* Applying corrections in a position solution, and the HAS completion time-out.
* QZNMA (L6E) and QZSS L1S (SLAS, DC Report), and CLAS message authentication (no published final
  interface).
* Authorised or restricted services of any system.

MODELLED: no live or recorded broadcast has been decoded with these decoders in this repository.
