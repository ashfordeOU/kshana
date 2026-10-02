### Added

- **LunaNet Augmented Forward Signal (AFS) reference generator** (`lunar_afs`), pinned to the
  LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 of 29 January 2025 and naming that
  version in every output: the 2492.028 MHz carrier; the AFS-I binary phase-shift keying
  BPSK(1) data channel at 500 symbols per second with its 2046-chip Gold code; the AFS-Q
  BPSK(5) pilot with its 10230-chip Weil primary, 4-chip secondary and 1500-chip tertiary
  codes; the frame identifier 0 frame (synchronisation pattern, Bose–Chaudhuri–Hocquenghem
  (51, 8) subframe 1, 24-bit cyclic redundancy check, rate one-half low-density parity-check
  (LDPC) subframes 2 to 4, 60 by 98 block interleaver) with an exhaustive subframe-1 decoder
  and a min-sum LDPC decoder written from the parity-check matrix alone; and baseband IQ
  synthesis with truth labels written as a Signal Metadata Format (SigMF) recording. Codes are
  generated from the standard's shift registers and Legendre/Weil constructions, not from its
  tables. Nothing copied from the standard is redistributed (it carries no reuse terms): the
  AFS-Q primary indices come from IS-GPS-800J, and what only the standard's attachments define
  (AFS-I G2 delays, tertiary codes, LDPC submatrices) is read at run time from a local cache
  that `xval/lunar-afs/fetch_lsis.sh` fills from the NASA-hosted PDF, every file checked
  against a pinned SHA-256 (`lunar_afs::lsis`). Every ambiguity in the standard is a stated
  assumption. The model is a conformance reference, not a channel, propagation or link-budget
  model.
- `sigmf::meta_to_json_with_extensions` and `sigmf::annotation_extension_fields`: a recording
  can carry namespaced extension fields declared in `core:extensions`. Existing structures and
  read behaviour are unchanged.

### Validation

- VALIDATED (proposed), **LunaNet AFS baseband rendering against an independent generator,
  given its channel state**: against LANS-AFS-SIM (BSD-2-Clause, pinned commit, S-band build),
  zero chip mismatches over the three codes of PRNs 1 to 210, zero symbol mismatches over the
  three frames of the run, and a normalised complex correlation of 0.999990 over 23.9 s of its
  own samples (worst 2 ms block 0.999948), all inside bars fixed before the comparison. The
  comparison drives the renderer with the simulator's own channel state; it does not cover the
  power split from the carrier-to-noise density or the SigMF and 8-bit writing.
- VALIDATED (proposed), **LunaNet AFS frame channel coding, FID 0**: the full 6000-symbol
  frames equal LANS-AFS-SIM's symbol for symbol; the subframe-1 code reproduces the LSIS
  Figure 8 worked example bit for bit; the CRC-24 reproduces the CRC-24/LTE-A catalogue check
  value; every codeword satisfies the parity-check matrix assembled from the printed tables.
- Finding, **LunaNet AFS spreading-code generation**: 2 937 232 generated chips and bits
  compared with the standard's tables and Annex 3 files; one item differs, the "last 24
  chips" Table E-5 prints for tertiary PRN 147, which duplicates the PRN 151 cell while the
  standard's own Annex 3 file agrees with the generator. The pre-registered zero-mismatch
  criterion is therefore missed and the row stays MODELLED.
- Finding, **LunaNet AFS closed-loop decodability**: three pre-registered runs against
  PocketSDR-AFS. The first could not test the signal (the receiver keeps 4 bits per component
  and the recording spanned 8 bits); the second missed by one carrier-to-noise reading 0.3 dB
  low and one first frame never synchronised; the third, with fresh inputs and the same
  criteria, met its tracking and decoding bars in full (all six frames decoded with the right
  TOI and subframe content) but not its guard that a print-only receiver build reproduces the
  pinned build's log: two runs of the unmodified receiver already differ in their acquisition
  records. The row stays MODELLED. It states that it concerns conformance and label
  consistency, not channel physics or link budgets.

- Draft erratum for the LSIS authors (Table E-5 PRN 147): `.fold/feat-dom-d6-erratum.md`.

### Fixed

- `lunar_service`: the per-satellite export antenna's default carrier was a rounded 2.4 GHz;
  it is now the LSIS-020 AFS carrier, 2492.028 MHz (`LSIS_AFS_CARRIER_HZ`). Every link
  evaluated at the default understated free-space loss by 0.327 dB and overstated the dish
  half-power beamwidth by 3.8 per cent. The `lunar-jamming` and `lunar-attack-surface` packs
  had the same rounded default and now use the same constant.
- `lunar_afs`: SigMF truth-label annotations are sorted by `core:sample_start` (multi-node
  recordings broke that rule), and `DecodedFrame::sb1_valid` flags a decoded TOI outside 0..99.

### Revisions to published numbers

- Default carrier, 2.4e9 -> 2.492028e9 Hz, in `lunar_service` (`export_antenna.carrier_hz`),
  `lunar_jamming` (`carrier_hz`) and `attack_surface` (`carrier_hz`). No published number
  moves: every bundled scenario, golden and fixture names its carrier, and the unit tests
  pinning the P1 paper baseline and the documented lunar-jamming operating point name the
  paper's 2.4 GHz explicitly (their pinned values are unchanged). The `default 2.4e9` comment in
  `scenarios/moonlight-service-volume.toml` changes with the next site re-port (its web copy
  is a pinned port output).
