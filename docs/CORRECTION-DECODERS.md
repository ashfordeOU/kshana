# Correction decoders

Open decoders for the precise-correction messages that GNSS satellites broadcast, and test vectors for
them. `kshana corrections decode` reads frames a receiver has already channel-decoded and prints what
they carry as JSON; `kshana corrections vectors` runs the vector set against the decoders.

| Decoder | Service and signal | Interface document | What is read |
|---|---|---|---|
| `has` | Galileo High Accuracy Service, E6-B C/NAV | Galileo HAS SIS ICD, Issue 1.0 (May 2022), sections 2 to 7 | C/NAV page and CRC, HAS page header and dummy pages, the RS(255,32) outer code (any `MS` distinct pages recover a message), message type 1: mask, orbit, clock full-set, clock subset, code and phase biases |
| `b2b` | BeiDou-3 PPP-B2b | BDS-SIS-ICD-PPP-B2b-1.0 (July 2020), section 6 | CRC, message types 1 (mask), 2 (orbit, URAI), 3 (code biases), 4 (clock), 5 (URAI), 6 and 7 (clock and orbit), 63 (null) |
| `l6` | QZSS L6: CLAS (L6D) and MADOCA-PPP (L6E, and its L6D ionospheric messages) | IS-QZSS-L6-008 (18 March 2026), section 4.1; IS-QZSS-MDC-005, sections 4.2 and 6.3 | L6 header (vendor, facility, subframe start, alert), subframe assembly across data parts, Compact SSR sub types 1 to 12, MADOCA-PPP STEC coverage and correction messages |
| `l1s` | QZSS L1S: Sub-meter Level Augmentation Service (SLAS), the JMA DC Report and the DCX message | IS-QZSS-L1S-009 (20 February 2026), section 4.1; IS-QZSS-DCR-017, section 4.1.2.3; IS-QZSS-DCX-004, sections 4.2 to 4.3 and 5.6 to 5.7 | preamble pattern, message type and CRC-24Q; MT47 monitoring stations, MT48 PRN mask, MT49 data issue numbers and MT50 pseudorange corrections (mapped to satellites through the MT48 of the same IODP), MT51 satellite health, MT0 test mode, MT63 null; MT43 JMA DC Report: common header and the body of each of the twelve disaster categories; MT44 DCX message: Satellite Designation, CAMF fields A1 to A18, the extended message of each kind, the NULL message |
| `qznma` | QZSS L6E QZNMA, and (DRAFT) the CLAS correction-authentication slot | IS-QZSS-SAS-001, sections 6.1, 6.6 and 6.8 to 6.10; IS-QZSS-SAS-002 **draft**, sections 7.2, 7.4 and 9.1 | L6 header with vendor `011`; the two 605-bit Reformat Digital Signatures per frame (NMA ID, RTOW, SV ID, message type, references, key ID, signature, SALT); DRAFT: ST13,1 authentication information, ST13,3 root key information and ST13,11 segments with their reassembly |

All five read open-service data only. They report fields with the scale factors of the documents,
`null` for the "data not available" codes, and satellites as `G01`, `E12`, `C19`, `J01` and so on. They
do not apply the corrections to a position (the PPP engine does not use them yet).

## Run

```sh
kshana corrections decode --format has  pages.txt     # or b2b, l6, l1s, qznma; "-" reads standard input
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
* `l1s`: the 250-bit message block after the 1/2-rate convolutional code is removed (63 hexadecimal
  digits; the last two bits are ignored). Messages of one satellite go in one file, in reception order.
  The 63-digit message field of a `$QZQSM` receiver sentence (DCR-017 section 4.3, DCX-004 section 4.4)
  is such a line.
* `qznma`: L6 frames as for `l6`; frames of other vendors are counted and skipped.

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
* L1S: PRN masks are kept by IODP; MT49 and MT50 map their selected satellites (the `Mask-SV` bits, in
  mask order) through the MT48 with the same IODP, and without one report only the header with
  `note`. A pseudorange-correction code of −2048 (−81.92 m) is given as `prc_m: null` with
  `unhealthy_30s: true` (IS-QZSS-L1S-009 Table 4.1.2-8). QZSS PRN 193 to 201 are labelled `J01` to
  `J09`. Message validity periods (Table 4.1.1-2) need reception times and are not applied.
  L1S-009 changed the Fukuoka station's table coordinates and states that the MT47 broadcast location
  takes precedence; the decoder reports only what MT47 broadcasts.
* QZNMA (DRAFT part): ST13,11 segments are joined per stream indicator and issue of data, in counter
  order, once the segment with multiple indicator 0 and every earlier counter are in. Streams 1 and 2
  may combine segments from different satellites (SAS-002 draft Table 7-12); other streams are kept per
  satellite. A new issue of data drops the older one of the same stream.

### DC Report bodies (MT43)

Each of the twelve categories of IS-QZSS-DCR-017 Table 4.1.2-2 has its own 171-bit layout (Figures
4.1.2-1 to 4.1.2-12). The decoder reads every field and reports it by name; `body.table` names the
parameter table that defines it. Only layouts are transcribed: codes that the document resolves through
its lookup tables (notifications on disaster prevention, epicentre, regions, prefectures, volcanoes,
warning codes, local governments, forecast regions) are reported as numbers, to look up in the cited
table. Region lists stop reporting at all-zero groups, which the document uses for unused regions.
Depth 501 and 511 and magnitude 101, 126 and 127 are reported as codes with `depth_km` or `magnitude`
`null`; tsunami arrival hour 31 / minute 63 is `arrived` (north-west Pacific: `arrived_or_unknown`) and
30 / 62 `no_data`. The Nankai Trough headline is given as hexadecimal and, when its bytes are whole
UTF-8, as text (a page can end inside a character). Spare bits that are not zero are flagged with
`spare_nonzero`. Categories 7 and 13 are unused and keep only `body_hex`.

### DCX messages (MT44)

The kind follows DCX-004 section 5.7 (A2 and A3): `l_alert`, `j_alert`, `local_government`,
`outside_japan`, `discarded`, or `null` for the NULL message of Table 4.3-1. Names are given for the
document's small tables (message type, severity, onset week and time, duration, library, the Japanese
instruction library of Table 4.2-14, the J-Alert prefecture flags of Table 4.2-25, the SD satellites of
Table 5.6-3); the country, provider, hazard and target-area codes stay numbers. When the Japanese basic
instruction is `00`, the 10-bit value is a pattern of Table 4.2-15 and only the code is given. The
Specific Settings field A18 is defined in the CAMF document, which was not read, and is given as a
number.

### QZNMA signatures and the draft CLAS checks (library)

`kshana::corrections::qznma` builds the 1000-bit GPS LNAV RAND of SAS-001 Figure 6-9 from an RDS and
subframes 1 to 3 (MASK of Figures 6-5 to 6-7; the TOW count of each subframe moved so subframe 1
carries the RTOW, section 6.6.2) and checks the RDS signature: ECDSA P-256 with SHA-256 over RAND
(Appendix B). `public_key_from_der` reads a DER public key as SAS-001 section 7.3.3 distributes them.
`kshana::corrections::cma` (DRAFT) gives the KROOT message `M` and its ECDSA check (9.1.2), the
truncated hash `F` and the check of a TESLA key against KROOT (9.1.3, pattern 1: TBA 10 s, ΔT 5 s), and
the MAC of a target message (9.1.4, HMAC-SHA-256 or CMAC-AES). The QZSS subframe time is not in the
messages and is a parameter.

The public keys and the test data of SAS-001 Appendix A are given only to registered users, so these
checks are tested with keys made by the tests (signatures) and with values computed by Python's
`hashlib` and `hmac` (the truncated hash and the MAC): they test our composition of the inputs, not
agreement with QZSS-generated data.

### Readings to know about

* Sub type 12 availability fields (IS-QZSS-L6-008 Table 4.1.2-41): bit 0 (value 1) is read as the
  polynomial (hydrostatic) term and bit 1 (value 2) as the residual (wet) term, with the troposphere
  quality present whenever either is set. CLAS fixes both bits to one, so live CLAS data does not depend
  on this reading.
* SAS-001 section 6.8 says in its text that a QZNMA frame holds "two 576 bits of RDS data and 543 bits
  of reserved data", while its Figures 6-52 to 6-54 and Table 6-2 give 605-bit RDS and 485 bits. The
  decoder follows the figures and table (their fields add up to 605); to confirm.
* The RTOW replacement for subframes 2 and 3 (SAS-001 Figure 6-51 shows subframe 1 only): each
  subframe's TOW count is moved by the same offset; to confirm.
* SAS-002 draft MAC input (9.1.4): the PRN is taken as the 8-bit PRN of the L6 header; the draft does
  not give its width. To confirm.
* DCX-004 Table 4.2-17 (ellipse axis lengths) lies up to 0.1 % above the formula the section states
  (code 3: formula 0.534 km, table 0.535 km; the table steps by a ratio of 1.35228, which fits a minimum
  near 0.21636 km rather than 0.216 km). The decoder uses the table; to confirm.
* Sub type 10 is read with 22 header bits (message number, sub type, multiple message indicator,
  counter, data size), as its stated length `22 + 40 x X` implies.
* CLAS SBAS satellites are labelled `S120` upwards (mask position plus 119).

## Test vectors: `kshana.correction-vectors/1`

The set (54 vectors, set version 1.0.0) is `has.json`, `b2b.json`, `l6.json`, `l1s.json` and `qznma.json` in
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
| `l1s` | a PRN mask over all five systems, data issue numbers and pseudorange corrections through it (with the −81.92 m code and the extreme values), corrections without a mask, monitoring stations with unused slots, satellite health, a DC Report of each of the twelve categories (with depth and magnitude codes, arrival states, a UTF-8 headline, a non-zero spare) and of an unused category, DCX messages of each kind built from the field values of DCX-004's section 5 examples and calculation examples, the NULL and a discarded message, test mode, null and a broken CRC |
| `qznma` | two RDS (GPS LNAV, Galileo I/NAV) with a DRAFT ST13,1 of seven MACs; a filler RDS, an unused RDS and the DRAFT default ST13,1; a DRAFT ST13,3 split into two ST13,11 segments received out of order from two satellites; other vendors, a short frame and a wrong preamble |
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
worked bit-level examples of their messages, so for B2b, L6, L1S and QZNMA only the self-derived vectors
exist. Where a QZSS document gives decoded examples or calculation examples (DCX-004 section 5 and the
calculation examples of sections 4.2.3.12 to 4.2.4.1.7), the vectors and unit tests use those values.

## Not covered

* Channel decoding: E6-B Viterbi and de-interleaving, the B2b 64-ary LDPC, the L6 Reed-Solomon code.
* Applying corrections in a position solution, and the HAS completion time-out.
* QZNMA RAND for GPS CNAV and CNAV2, Galileo I/NAV and F/NAV, and the QZSS signals (LNAV, CNAV,
  CNAV2 digital signature segments in the QZSS navigation messages); a command-line verification
  mode (the checks are library functions).
* A final CLAS correction-message-authentication interface: what is here follows the SAS-002 draft.
* The lookup tables of the DC Report and DCX documents (region, volcano, warning and other codes,
  mostly in Japanese) and the receiver sentence output of DCR-017 section 4.3.
* Authorised or restricted services of any system.

MODELLED: no live or recorded broadcast has been decoded with these decoders in this repository.
