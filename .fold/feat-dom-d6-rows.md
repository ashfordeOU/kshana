# D6 proposed verification rows and their records

Package D6, branch `feat/dom-d6`: the LunaNet Augmented Forward Signal (AFS) reference
generator, pinned to the LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 of
29 January 2025. Four NEW rows are proposed; no existing row is changed. The service volume
("Lunar navigation service volume") is untouched by this branch.

| Row | Outcome | Basis |
|---|---|---|
| LunaNet AFS spreading-code generation (LSIS V1.0) | FINDING (stays MODELLED) | Reference, criterion missed by one misprinted cell |
| LunaNet AFS baseband rendering against an independent generator, given its channel state (LSIS V1.0) | PROMOTE | Library (LANS-AFS-SIM) |
| LunaNet AFS frame channel coding, FID 0 (LSIS V1.0) | PROMOTE | Library (LANS-AFS-SIM), with LSIS printed vectors |
| LunaNet AFS closed-loop decodability by an independent receiver (LSIS V1.0) | FINDING (stays MODELLED) | Library (PocketSDR-AFS); third run: C1, C2 hold, G0 not as written |

Pre-registration commits (each pushed before its fixture was cut or its oracle run):
`986ac280` (2026-10-02T15:46:03Z, all four comparisons), `825768f4` (second decodability
comparison), `b62f9fe2` (2026-10-02T19:59:59Z, third decodability comparison).

## Licence design (integrator decision 1)

LSIS V1.0 and its attachments carry no reuse terms, so nothing copied from them is committed
on the branch head (the fold is a squash, so earlier commits that carried such files never
reach main). Commits: `cdc9bc07` (removal and fetch design), on top of `ea4e08b3`.

- Removed: `src/lunar_afs/ldpc_tables/` (Annex 1 index CSVs) and
  `tests/fixtures/lunar_afs_codes_lsis_reference/` (printed values, Legendre tables, the three
  Annex 3 code files); the AFS-I and tertiary records of the committed LANS-AFS-SIM code dump.
- Kept, with a public source: the AFS-Q primary (w, p) indices in `src/lunar_afs/params.rs`,
  now extracted from IS-GPS-800J (US Government; Table 3.2-2 and Table 6.3-1) by
  `xval/lunar-afs/extract_isgps800_l1cp.py`; all 210 pairs equal LSIS Tables D-2 to D-6.
  Short citations only elsewhere (the 68-bit sync pattern, the Figure 8 BCH example, four
  Table E-5 / Annex 3 numbers pinning the finding).
- Fetch and verify: `xval/lunar-afs/fetch_lsis.sh` downloads the NASA-hosted PDF (URL and
  SHA-256 pinned), extracts its attachments (`pdfdetach`) and the printed check values
  (`pdftotext` + `extract_lsis_tables.py`) into `$KSHANA_LSIS_DIR` or `~/.cache/kshana/lsis`,
  and verifies 14 pinned digests. `kshana::lunar_afs::lsis::read_verified` re-checks the
  SHA-256 of every file on every load; a missing or altered file is an error naming the script.
- Run time: AFS-Q primary codes generated from IS-GPS-800J indices (no cache needed); AFS-I Gold
  codes generated from the two registers with the G2 delay recovered from the cached Annex 3
  Gold file (loading fails unless all 2046 chips of every PRN follow the Gold construction; the
  recovered delays equal the printed Table C delays); tertiary codes from the cached Annex 3
  file; LDPC tables from the cached Annex 1 CSVs (`LdpcCode::load`, `FrameCoder::load`).
- Tests: everything that needs LSIS content skips with a notice without the cache. With the
  cache every comparison gives exactly the earlier result (2 937 232 code items with the one
  Table E-5 finding; W1 630 codes, W2 3 frames, W3 |rho| 0.999990333). Test results with and
  without the cache are in the final report.

## Proposed `verification.rs` rows (exact text)

```rust
        VerificationItem {
            requirement: "LunaNet AFS spreading-code generation (LSIS V1.0)",
            capability: "The Augmented Forward Signal codes of LSIS V1.0 (29 January 2025): the AFS-Q 10230-chip primary generated from the IS-GPS-800 L1C pilot construction with the IS-GPS-800J indices (the same 210 assignments LSIS Appendix D prints), the AFS-I 2046-chip Gold codes generated from g1 = x^11 + x^2 + 1 and g2 = x^11 + x^8 + x^5 + x^2 + 1 with each PRN's G2 delay recovered from the standard's Annex 3 file, the four secondary codes, the 1500-chip tertiary codes, the interim Table 11 node assignment and the tiered pilot code. LSIS content is read at run time from a SHA-256-verified local cache filled from the NASA-hosted PDF, never redistributed",
            module: "lunar_afs::codes, lunar_afs::lsis, lunar_afs::params (IS-GPS-800J indices)",
            tests: "lunar_afs::codes::tests (maximal-length registers, Legendre balance, G2 delay round trip, tier composition); tests/lunar_afs_codes_lsis_reference.rs::afs_codes_finding_one_misprinted_table_cell (without the LSIS cache: four cited numbers pin the finding; with it: 2 937 232 chips and bits vs the LSIS Annex 3 files, printed first/last 24 chips, Legendre Tables D-1 and E-1 and G2 initialisations give exactly one differing item, the Table E-5 PRN 147 'last 24 chips' cell, which duplicates PRN 151's while the Annex 3 file agrees with the generator); the strict pre-registered test afs_codes_match_lsis_v1_tables_and_annex3_bit_exact is ignored with that gap",
            oracle: "Reference: the values LSIS V1.0 prints for validation (Tables C-1 to C-5, D-1 to D-6, E-1 to E-6) and its Annex 3 electronic code files, under a zero-mismatch criterion fixed before the comparison. The criterion is missed by one printed cell that is internally inconsistent with the standard's own Annex 3 file, so the row stays MODELLED; an erratum note is drafted. The same chips also equal LANS-AFS-SIM's (row 'LunaNet AFS baseband rendering against an independent generator, given its channel state')",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Modelled,
        },
        VerificationItem {
            requirement: "LunaNet AFS baseband rendering against an independent generator, given its channel state (LSIS V1.0)",
            capability: "The rendering core of the AFS baseband (LSIS-130: complex envelope I + jQ, I = the AFS-I Gold code times the 500 symbol/s frame at 1.023 Mchip/s, Q = the tiered AFS-Q pilot at 5.115 Mchip/s, carrier rotation, chip and symbol alignment) reproduces an independent generator's samples when driven by that generator's own recorded channel state (code phases and rates, carrier phase and frequency, per-channel amplitude). Not covered: the node model that derives that state from a Doppler, delay and carrier-to-noise density, the 50/50 power split computed from the carrier-to-noise density (the amplitudes are taken from the simulator), and the SigMF metadata and 8-bit sample writing",
            module: "lunar_afs::waveform::render, lunar_afs::codes, lunar_afs::frame",
            tests: "tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_chips_match_lans_afs_sim (the 210 AFS-Q primary codes always; with KSHANA_LANS_RUN and the LSIS cache all 630 codes, zero chip mismatches); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (with the LSIS cache: 3 frames, zero symbol mismatches; 24 committed 2 ms windows, |rho| = 0.999990); tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_full_run_matches_lans_afs_sim (data-gated: whole 23.9 s run, |rho| = 0.999990, worst 2 ms block 0.999948, phase 8e-9 rad)",
            oracle: "Library: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae, S-band build, run as a separate program); Kshana's samples are driven only by the simulator's recorded channel state, and a print-only trace build is checked byte-identical to the unpatched one. Bars fixed before the run: zero chip and symbol mismatches, |rho| >= 0.999 over the run and >= 0.99 per 2 ms block, phase within 0.05 rad. Equal I and Q amplitudes are an input of the comparison, so the power split is not tested by it. LANS-AFS-SIM reads its tertiary codes from the LSIS Annex 3 file, so that part is not independent of the code row. LANS-AFS-SIM and PocketSDR-AFS share an author and count as one independent implementation",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "LunaNet AFS frame channel coding, FID 0 (LSIS V1.0)",
            capability: "The 12 s, 6000-symbol FID 0 frame of LSIS V1.0: 68-symbol synchronisation pattern, BCH (51, 8) subframe 1 (octal-763 generator), CRC-24 ((1 + X)·P(X)) on subframes 2-4, rate 1/2 LDPC encoding with the printed A, B^-1, C, D (LSIS Annex 1, read at run time from the SHA-256-verified local cache) and the standard's puncturing, 60 x 98 block interleaver; an exhaustive subframe-1 decoder that flags a TOI outside 0..99, and a normalised min-sum LDPC decoder written from H = [[A, B, 0], [C, D, I]] alone",
            module: "lunar_afs::frame, lunar_afs::ldpc, lunar_afs::lsis",
            tests: "tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim (with the LSIS cache: the 3 frames LANS-AFS-SIM transmits, built from the same FID, TOI and data bits: zero of 18 000 symbols differ); tests/lunar_afs_frame_coding_oracle.rs::bch_worked_example_and_crc24_check_value_are_bit_exact (LSIS Figure 8: 0x045 -> 0x229f61dbb84a0; CRC-24/LTE-A check value 0xCDE703; always runs); tests/lunar_afs_frame_coding_oracle.rs::ldpc_codewords_satisfy_the_printed_parity_check_matrices (100 codewords, zero unsatisfied checks of the printed H); tests/lunar_afs_frame_coding_oracle.rs::decoder_from_parity_check_matrices_recovers_every_frame (decoder from H alone, noise-free and at 3 dB Es/N0, and 10 full frames); lunar_afs::ldpc::tests::printed_b_inverse_inverts_printed_b; lunar_afs::frame::tests",
            oracle: "Library: LANS-AFS-SIM (T. Ebinuma, BSD-2-Clause, commit 480c6bf353717bafc04b5ee5bafb38ed90e61aae), whose own BCH, CRC, LDPC and interleaver produce frames symbol-identical to Kshana's for the same content (zero mismatches, bar fixed before the run). Corroborated by Reference values: the LSIS V1.0 Figure 8 BCH worked example and the CRC-24/LTE-A check value (Greg Cook's catalogue of parametrised CRC algorithms), both bit-exact; and by PocketSDR-AFS decoding every subframe of the frames it synchronised in three runs with passing CRC and matching subframe-2 bits. The parity-check test is close to an internal identity (it confirms the printed B^-1 inverts the printed B) and is not counted as an oracle",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Validated,
        },
        VerificationItem {
            requirement: "LunaNet AFS closed-loop decodability by an independent receiver (LSIS V1.0)",
            capability: "A Kshana AFS recording acquired, tracked and decoded by an independent software receiver and compared with the recording's own truth labels. This proves conformance to the standard and label consistency only; it is not a statement about channel physics, propagation, received power or link budgets, whose values in the recording are chosen inputs",
            module: "lunar_afs::waveform (recording and truth labels), xval/lunar-afs/run_pocketsdr.sh",
            tests: "tests/lunar_afs_decodability_pocketsdr_v3_oracle.rs::third_run_finding_c1_c2_hold_g0_is_receiver_nondeterminism (third pre-registration: 2 nodes, 4 channels tracked, worst Doppler error 0.57 Hz, worst code offset error 0.008 chip, all 6 frames decoded with the right TOI across the 99 -> 0 wrap and matching subframe 2; G0 not met as written, the receiver's own run-to-run variation in its acquisition records); tests/lunar_afs_decodability_pocketsdr_4bit_oracle.rs::decodability_finding_five_violations (second: 5 violations); tests/lunar_afs_decodability_pocketsdr_oracle.rs::first_run_finding_no_acquisition_outside_the_receivers_4_bit_range (first: void); the strict tests of the three files are ignored with their gaps",
            oracle: "Library: PocketSDR-AFS (T. Ebinuma after T. Takasu's PocketSDR 0.13, BSD-2-Clause, commit 5b23809f30d68518b7fad7a564fd0fac57cc497d, S-band build, print-only log-level copy), under criteria fixed before each run. The third pre-registered comparison meets its decoding and tracking bars C1 and C2 in full but not its guard G0 as written (two runs of the unmodified receiver differ in the same four acquisition records), and the second missed by 5 violations, so the row stays MODELLED. LANS-AFS-SIM and PocketSDR-AFS share an author and count as one independent implementation; the frame-coding row's printed-vector checks guard against a shared misreading",
            oracle_kind: OracleKind::ExternalDataset,
            status: VerificationStatus::Modelled,
        },
```

## Proposed `validated_oracle_basis()` entries

```rust
        OracleBasisEntry {
            requirement: "LunaNet AFS baseband rendering against an independent generator, given its channel state (LSIS V1.0)",
            basis: Library,
            oracle_test: "tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim",
            source: "LANS-AFS-SIM",
            flag: "",
        },
        OracleBasisEntry {
            requirement: "LunaNet AFS frame channel coding, FID 0 (LSIS V1.0)",
            basis: Library,
            oracle_test: "tests/lunar_afs_waveform_lans_afs_sim_oracle.rs::afs_frames_and_baseband_match_lans_afs_sim",
            source: "LANS-AFS-SIM",
            flag: "",
        },
```

Both oracle tests are real, non-ignored `#[test]`s. Since the licence change they are
data-gated on the LSIS cache (they skip with a notice without it, the repository's realdata
pattern); the gate needs `xval/lunar-afs/fetch_lsis.sh` run once for them to compare.

## Records

### Row 1: LunaNet AFS spreading-code generation — FINDING

- Pre-registration: `986ac280`, `tests/lunar_afs_codes_lsis_reference.rs` header (quantity,
  inputs, oracle, tolerance, assumptions A1-A5).
- Oracle: LSIS V1.0 printed tables C-1..C-5, D-1..D-6, E-1..E-6 and its Annex 3 files
  (embedded in the PDF, SHA-256 `986e0795…61b6`), Reference. Tolerance: zero mismatches.
- Result (first full run, unchanged after the licence refactor): 2 937 232 chips and bits
  compared; 1 differs: Table E-5 prints `A14850` as the last 24 chips of tertiary PRN 147 and of
  PRN 151. The generated PRN 147 code matches the Annex 3 file (ends `5677E8`) and the printed
  first 24 chips `0CE365`. Erratum note: `.fold/feat-dom-d6-erratum.md`.
- Disclosures: (D1) the standard was read before pre-registration; PRN 1's printed G2
  initialisation was checked by hand against its printed first 24 chips. (D2) The first run
  stopped on the harness's own length check (three E-5 fields printed without leading zeros);
  left-padded, no tolerance or engine change. (D3) Licence refactor: the oracle values are now
  read from the verified cache; same comparison, same count, same finding. (A5) Table D-1's
  caption says 10233; Tables D-2 (and IS-GPS-800J 3.2-2) print PRN 38 as "3".
- Mutations: G2 feedback tap 8 -> 9: red (~984 chips per PRN differ). Last expansion chip
  0 -> 1: red (exactly 1 chip per AFS-Q PRN). Reverted.
- Decision (integrator): stays a FINDING.

### Row 2: LunaNet AFS baseband rendering, given the channel state — PROMOTE

- Pre-registration: `986ac280`, `tests/lunar_afs_waveform_lans_afs_sim_oracle.rs` (W0-W3).
- Oracle: LANS-AFS-SIM `480c6bf3…1aae`, BSD-2-Clause, S-band. Tolerances: W1/W2 zero mismatches;
  W3 |rho| >= 0.999 whole run, >= 0.99 per 2 ms block, phase within 0.05 rad; W0 patched IQ
  byte-identical.
- Result: W0 held; W1 630 codes, zero mismatches; W2 3 frames, zero mismatches; W3 |rho| =
  0.999990333 over 11 950 blocks of 2 ms, worst block 0.999948, phase 7.9e-9 rad. Re-run after
  the licence refactor: identical.
- Scope (integrator decision 2): the comparison drives `render` with the simulator's own channel
  state, amplitudes included; it does not test the node model, the power split from C/N0, or the
  SigMF and 8-bit writing. The requirement name and text now say so.
- Disclosed forced deviations: `-b` accepts only `2` (16-bit default used without it); PRN-01 is
  below the horizon at the default start, so PRN-02 was used; the subframe-1 TOI field (LSIS-415,
  next frame's count) passed as traced.
- Mutations: interleaver read by rows -> W2 red (2950 of 6000 symbols); AFS-Q chip sign flipped
  -> W3 red (|rho| = 0.0047). Reverted.

### Row 3: LunaNet AFS frame channel coding — PROMOTE

- Pre-registration: `986ac280`, `tests/lunar_afs_frame_coding_oracle.rs` (D1-D5) and W2.
- Result: all pass (W2 zero of 18 000 symbols; D1, D2 bit-exact; D3 zero unsatisfied checks over
  100 codewords; D4 140 words and D5 10 frames decoded exactly). Unchanged after the refactor
  (D3-D5 now need the cache; D1, D2 always run).
- Disclosure: the D1 header said the printed word drops three padding zeros; it has none.
- Mutations: BCH feedback without stage 4 -> D1 red; encoder with B instead of B^-1 -> D3, D4 red.
- Review fix `ea4e08b3`: `DecodedFrame::sb1_valid` flags a decoded TOI outside 0..99.

### Row 4: LunaNet AFS closed-loop decodability — FINDING

- Pre-registrations: `986ac280` (v1), `825768f4` (v2), `b62f9fe2` (v3, integrator decision 4).
- Oracle: PocketSDR-AFS `5b23809f…c497d`, BSD-2-Clause, S-band, Library; bars C1 (Doppler 10 Hz,
  C/N0 3 dB, code offset 0.25 chip, absent PRNs never synchronised), C2 (TOI, subframe 2,
  subframes 3/4 decoded, no frame errors), guard G0 (print-only build reproduces the pinned log).
- v1: void (0 of 194 acquisitions; the receiver keeps 4 bits per component, the recording
  spanned 8 bits).
- v2 (nodes 5, 11): 5 violations (one C/N0 reading 0.3 dB low; node 11's first frame never
  synchronised in three receiver runs); G0 not as written.
- v3 (nodes 7, 10; fresh inputs; same criteria): C1 and C2 hold in full (152 status lines,
  worst Doppler 0.57 Hz, worst C/N0 departure 2.79 dB, worst code offset 0.008 chip; all six
  frames with TOI 31, 32, 33 and 99, 0, 1; subframe 2 matches; subframes 3/4 decoded; no
  frame error; no absent-PRN sync). G0 not as written: the four `SIGNAL FOUND` records differ
  between the pinned and print-only builds, and two runs of the pinned build differ in exactly
  those four (wall-clock-paced acquisition). Inputs deliberately not adapted to v2's misses.
- Mutation (v2 recording): uninterleaved recording decodes nothing.
- Decision for the integrator: the pre-registered criteria include G0, which the receiver's
  own nondeterminism defeats; promotion would need G0 restated (for example "every
  non-acquisition record reproduced") in a FOURTH pre-registration, not re-read on v3.

## Other items

- Carrier defaults (integrator decision 3): `lunar_service` (`85a7b6f4`), `lunar_jamming` and
  `attack_surface` (`0a139fce`) default to 2.492028e9 Hz. No published number moves: both
  bundled scenarios name their 2.4 GHz carrier, and the unit tests that pin the P1 paper
  baseline and the documented lunar-jamming operating point now name it too (pinned values and
  tolerances unchanged). The `default 2.4e9` comment in `scenarios/moonlight-service-volume.toml`
  could not be changed on the branch: its `web/studio` copy and the embedded index are port
  outputs pinned by `web/site.test.mjs` (`da8e5bb3` restores it). Proposed for the next site
  re-port: `#   carrier_hz = 2.492028e9 # default 2.492028e9 (LSIS-020 lunar AFS carrier)`.
- Scenario file not delivered (it changes the README's scenario count). Proposed
  `scenarios/lunar-afs-recording.toml`, for a future `lunar-afs` kind:

  ```toml
  # LunaNet Augmented Forward Signal reference recording (LSIS V1.0, 29 January 2025).
  # Conformance reference only: Doppler, delay and C/N0 are chosen inputs, not a channel model.
  # Needs the LSIS cache: xval/lunar-afs/fetch_lsis.sh.
  kind = "lunar-afs"
  sample_rate_hz = 12.0e6
  duration_s = 30.0
  noise_seed = 1
  ci8_scale = 2.0
  ci8_clip = 7            # PocketSDR-AFS keeps 4 bits per component
  [[node]]
  node_id = 3             # interim LSIS Table 11 assignment
  doppler_hz = 1234.5
  frame_arrival_s = 4.0
  toi_at_arrival = 17
  cn0_dbhz = 50.0
  ```
- Contact T. Ebinuma (founder): PocketSDR-AFS's `INT8X2` input silently wraps above 4 bits.
- Repository placement (open repository or kshana-pro) and a reference relay-constellation
  preset from public orbital elements: not acted on.
- The April 2026 Aerospace Corporation performance assessment (NTRS 20260003089) was not used.
