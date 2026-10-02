# D7 rows: proposed `verification.rs` text and the record of each comparison

Package D7 (real lunar IQ: acquisition and C/N0 on LuGRE, and Earth GNSS reception at lunar
distance), branch `feat/dom-d7`. Every comparison below was pre-registered in a pushed commit
before its oracle was run or its data fetched, and every one ended as a FINDING. No row is
proposed as VALIDATED, so there is no `validated_oracle_basis()` entry to add. The surface-phase
LuGRE snapshots were never opened and remain held out.

Abbreviations: C/A coarse/acquisition; C/N0 carrier-to-noise density; LNAV legacy navigation
message; IQ in-phase and quadrature samples; PRN pseudorandom noise number; SVN space vehicle
number; CFAR constant false-alarm rate.

---

## D7-a. GPS L1 C/A cross-generator conformance (new row, MODELLED)

Proposed row:

```rust
VerificationItem {
    requirement: "GPS L1 C/A cross-generator conformance",
    capability: "GPS L1 C/A spreading codes (sdr::CaCode) and LNAV subframes 1-3 (gps_lnav: IS-GPS-200 field quantisation with the specification's pi, two's complement packing, TLM and HOW words, Table 20-XIV parity with D29*/D30* inversion, the parity-solving bits of words 2 and 10) compared bit for bit with gps-sdr-sim on its bundled brdc0010.22n (32 satellites)",
    module: "gps_lnav, sdr",
    tests: "tests/gps_l1ca_gpssdrsim_cross_generator.rs::gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding (pinned finding); gps_l1ca_gpssdrsim_cross_generator::ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly (strict, ignored with the gap); gps_lnav::tests",
    oracle: "gps-sdr-sim (MIT, commit 28ca29a6, run as a separate program through a committed harness), pre-registered f88f2969 with a bit-exact bar on (A) C/A chips, (B) every computed LNAV field, (C) every parity bit. FINDING: (A) 0 of 32 736 chips differ, (C) the parity of 0 of 1 920 words differs, (B) 230 of 1 152 computed fields differ by one unit: gps-sdr-sim's eph2sbf truncates toward zero with C casts where the broadcast integer needs rounding (every differing value lies within 0.01 of a unit of Kshana's rounded integer). Stays MODELLED: the registered bar was the conjunction",
    oracle_kind: InternalConsistency,
    status: Modelled,
},
```

Record:
- Pre-registration: `f88f2969` (2026-10-02T16:01:13Z), pushed before the harness was built.
- Oracle: gps-sdr-sim, Takuji Ebinuma, MIT, commit 28ca29a6719475195e3aabd5930c4ed02d67190f;
  harness `tests/fixtures/gps_l1ca_gpssdrsim_cross_generator/harness.c`.
- Tolerance: zero differing bits (integers the specification defines).
- Result: chips 0/32 736; parity 0/1 920 words; fields 230/1 152 differ by one unit, all toward
  zero on gps-sdr-sim's side (af0, af1, tgd, Δn, M0, e, √A, Ω0, i0, ω, Ω̇, IDOT, Cuc, Cus, Cic, Cis).
- Mutation evidence: dropping data bit 23 from the D25 parity set gives 575 parity differences
  (strict and pin red); changing PRN 1's G2 taps (2,6)→(2,7) gives 512 chip differences (both
  red). Both edited back.
- Disclosures: `gpssim.h`, `codegen` and `generateNavMsg` were read to write the harness;
  `eph2sbf` was read only after the run, to explain the finding.

## D7-a2. GPS LNAV encoding decoded by RTKLIB (new row, new method, MODELLED)

Proposed row:

```rust
VerificationItem {
    requirement: "GPS LNAV encoding decoded by an independent receiver library",
    capability: "Kshana's LNAV subframes 1-3 (gps_lnav::encode_subframes) for the 32 brdc0010.22n ephemerides fed to RTKLIB's decode_word and decode_frame: parity of every word, subframe decoding with consistent issue of data, and every decoded parameter against Kshana's integer and against the input value",
    module: "gps_lnav",
    tests: "tests/gps_lnav_rtklib_decode_oracle.rs::rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43 (pinned finding); gps_lnav_rtklib_decode_oracle::kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters (strict, ignored with the gap)",
    oracle: "RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) decode_word/decode_frame as a separate program, pre-registered ca5f0142: R1 parity and decoding, R2 decoded value equal to Kshana's integer times the IS-GPS-200 scale within 2^-52 relative, R3 within half a quantum of the input. FINDING: R1 960 of 960 words and 96 of 96 subframes; R3 every parameter, week and reference times exact; R2 fails on 41 values (af1, delta-n, IDOT) by 1 to 4 units in the last place because RTKLIB's P2_43 is the decimal 1.136868377216160E-13, 2.6e-16 relative from 2^-43; dividing by RTKLIB's constant returns Kshana's integer in every case. Stays MODELLED: the registered R2 bar was too tight for the oracle's own constant",
    oracle_kind: InternalConsistency,
    status: Modelled,
},
```

Record:
- Pre-registration: `ca5f0142` (2026-10-02T16:58:09Z). Designed after the D7-a finding
  (disclosed in the header); `decode_word` and `decode_subfrm1..3` read to write the harness.
- Result as above. Mutation evidence: quantising by truncation instead of rounding gives 272
  failures, 230 of them half-quantum (R3) violations, exactly the 230 fields where gps-sdr-sim
  differs; strict and pin red; edited back.
- Founder note: a registration that compares decoded INTEGERS (not scaled values) would remove
  the constant-precision issue, but its outcome is now known, so it should not be registered on
  these inputs as if blind.

## D7-b. Acquisition and C/N0 estimation on real lunar IQ (new row, MODELLED)

Proposed row:

```rust
VerificationItem {
    requirement: "Acquisition and C/N0 estimation on real lunar IQ",
    capability: "Parallel code-phase search (acquisition::pcps_acquire: portable FFT, coherent folding, non-coherent accumulation, chi-square threshold for a search-wide false-alarm probability), refinement, open-loop prompt correlation with code Doppler and the M2M4 C/N0 estimator, run on the LuGRE L1 4-bit IQ batches read through realdata::ion_sdr",
    module: "acquisition, portable_math, realdata::ion_sdr, realdata::lugre",
    tests: "tests/lugre_acquisition_gnss_sdr_oracle.rs::finding_dc_artefacts_and_no_contemporaneous_flight_cn0 (pinned finding, data-gated); lugre_acquisition_gnss_sdr_oracle::acquisition_and_relative_cn0_on_lugre_iq_match_gnss_sdr_and_the_flight_receiver (strict, ignored with the gap); acquisition::tests; realdata::ion_sdr::tests; realdata::lugre::tests",
    oracle: "GNSS-SDR 0.0.19 (GPL-3.0, separate program, pinned configuration) on the nine non-surface L1 batches and the flight receiver's RAW C/N0 (LuGRE Mission Data, Zenodo 16411687, CC BY 4.0), pre-registered 768cb62b. FINDING: Kshana's reader decodes all 288 compared spans identically to an independent converter; GNSS-SDR declares 266 of 288 searches positive and Kshana agrees on all 266 decisions, but only 250 are located on GNSS-SDR's cell (A2 fails); the C/N0 leg is vacuous, no flight RAW epoch lying within 30 s of any batch (nearest 141 s). Most positives are artefacts: the bare two's-complement levels carry a -0.5 mean on I and Q, a zero-frequency line 32 dB above the noise in a 1 kHz bin, which both receivers acquire. Two batches (OP5, OP12) have .sdrx metadata that contradicts their binary headers. Stays MODELLED",
    oracle_kind: InternalConsistency,
    status: Modelled,
},
```

Record:
- Pre-registration: `768cb62b` (2026-10-02T16:16:29Z), before the dataset was downloaded.
- Oracle: GNSS-SDR 0.0.19 (Ubuntu 0.0.19-1build3), `xval/gnss-sdr-lugre/acq_L1.conf.template`;
  converter and driver `xval/gnss-sdr-lugre/run_acq.py`; flight extract `extract_flight_cn0.py`.
- Tolerances: A1 ≥20 positives from ≥3 batches; A2 every positive within one 500 Hz bin and
  2 + code-drift samples; A3 ≥95 % decision agreement; C1 ≥10 pairs from ≥3 batches; C2 pair
  residual RMS ≤3.0 dB and median ≤2.0 dB (bar from a prior Monte Carlo of the estimator).
- Result: A0 288/288; A1 266 from 9; A2 250/266 (fail); A3 266/266; C1 0 pairs (fail).
- Mutation evidence: flipping the sign of the carrier wipe in `pcps_grid` turns the pin red
  (OP2 PRN 18's Doppler no longer GNSS-SDR's); edited back.
- Disclosures: OP5 and OP12 excluded after download, before any run (metadata contradicts the
  binary header); flight C/N0 extracted over 120 s (test applies 30 s); the first run was stopped
  by a tool time limit at 226 of 266 cases and restarted unchanged.

## D7-b2. Acquisition on real lunar IQ against orbit-predicted Doppler, sample-power decision (new row, MODELLED)

Pre-registration `0d1839d2` (2026-10-02T16:41:26Z), designed after D7-b showed the DC artefact
(disclosed). Mid-rise levels (`ion_sdr::to_mid_rise`); Doppler differences between acquired PRNs
against predictions from ESA final orbits and the Firefly-reconstructed trajectory (NAIF CLPS
archive); P1 ≥2 batches with ≥2 visible acquisitions, P2 every pair within 50 Hz, P3 ≥90 %
predicted visible.

RESULT: PENDING_PD

## D7-b3. Acquisition on real lunar IQ against orbit-predicted Doppler, cell-averaging decision (new row, MODELLED)

Proposed row:

```rust
VerificationItem {
    requirement: "Acquisition on real lunar IQ scored by orbit-predicted Doppler",
    capability: "acquisition::pcps_acquire with the cell-averaging decision (peak over the grid's mean cell, robust to band-limited noise) on the nine non-surface LuGRE L1 batches with mid-rise levels; Doppler differences between acquired satellites compared with differences predicted from ESA final orbits and the Firefly-reconstructed Blue Ghost trajectory",
    module: "acquisition, realdata::ion_sdr",
    tests: "tests/lugre_acquisition_cell_average_doppler_oracle.rs::strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed (pinned finding, data-gated); lugre_acquisition_cell_average_doppler_oracle::cell_average_acquisitions_on_lugre_iq_match_the_orbit_predicted_doppler (strict, ignored with the gap)",
    oracle: "Predicted Doppler from ESA/ESOC final orbits and the NAIF CLPS reconstructed trajectory (xval/lugre-predicted-doppler/predict.py, independent of Kshana), pre-registered a81a9a4e. FINDING: P1 and P3 hold (4 batches, 12 of 12 acquisitions predicted visible) but P2 fails on 8 of 8 pairs. The two strongest pairs match the prediction in magnitude with the sign reversed (OP2 PRN 18/24: +7670.0 Hz measured, -7693.9 predicted; OP17 PRN 11/30: +11155.0, -11114.4), so the registered I-in-the-low-nibble order is the conjugate of the batches; the six detections just above threshold match neither sign. The refinement's Doppler scatter (30 to 50 Hz between two runs) was also underestimated by the registration. Stays MODELLED",
    oracle_kind: InternalConsistency,
    status: Modelled,
},
```

Record:
- Pre-registration: `a81a9a4e` (2026-10-02T16:55:59Z). Disclosed: decided after the first 23
  searches of the D7-b2 run had all crossed on noise, and after measuring a lag-one noise
  correlation of 0.27 on OP23; predictions computed after `0d1839d2`, not compared before.
- Result: as in the row. Mirrored residuals 23.9 Hz and −40.6 Hz in the registered run; 53.9 and
  90.6 Hz in the narrow-window re-search of the pin (hence its descriptive 150 Hz bound).
- Mutation evidence: swapping I and Q in `ion_sdr::decode` turns the pin red (PRN 18 no longer
  acquired at +11 kHz); edited back.
- Engine change it motivated: `PcpsResult::cell_average_statistic` / `acquired_cell_average`
  (commit 917890e0), unit-tested on coloured synthetic noise.

## D7-c. Earth-GNSS at lunar distance, M039 (row 91): relative C/N0 plus visibility (MODELLED, unchanged status)

The existing row stays MODELLED. Proposed addition to its `tests` and `oracle` text (the
founder decides the re-wording, see below):

- tests: append `tests/lugre_relative_cn0_visibility.rs::too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar (pinned finding)`.
- oracle: append "0.30+ D7, a finding (stays MODELLED): the restated quantity, the C/N0
  DIFFERENCE between Block IIR/IIR-M satellites tracked at one epoch, predicted with the NAVCEN
  per-SVN measured L1 patterns (two-dimensional, yaw-steering frame) against the LuGRE flight
  C/N0 (pre-registered 768cb62b: 99 % visible, pair RMS ≤3.0 dB, median ≤2.0 dB, at least 50
  records and 30 pairs) has too little data: the 26 qualifying transit and lunar-orbit epochs
  hold 15 tracked IIR/IIR-M records (mostly IIF and III are tracked) and one pair. All 15 are
  predicted visible and the single pair's residual is −0.06 dB; nothing is claimed."

Record:
- Pre-registration: `768cb62b`. Inputs: NAVCEN `GPS_IIR_IIR-M_LM.zip` (Appendix B directivity
  minus gain correction factor), ESA0MGNFIN orbits, IGS satellite metadata, NAIF CLPS
  `clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp`; generator `xval/lugre-relative-cn0/generate.py`.
- Result: V 15/15; R1 1 pair (bar 30); non-vacuity fails.
- Mutation evidence: zeroing the transmit gain in `transmit_side_db` moves the pair residual
  from −0.06 to −4.29 dB (strict and pin red); edited back.
- Disclosure: a first generator run admitted commissioning epochs against the registration
  (18 records, 1 pair, seen) and was replaced by the registered selection.

---

## Revisions (published numbers changed)

None. No golden file, docs figure or existing row value changed; `src/verification.rs` was not
edited.

## Founder decisions requested (proposals only; nothing acted on)

1. **M039 re-wording (D1).** Proposed capability addendum: "Relative carrier-to-noise density
   between Block IIR/IIR-M satellites at one epoch, from measured two-dimensional transmit
   patterns (NAVCEN), and geometric visibility; the absolute C/N0 at lunar distance is not
   claimed (Parker et al. report a 7 to 12 dB common loss)." Status unchanged (MODELLED) until a
   dataset with enough IIR/IIR-M pairs exists.
2. **CC BY 4.0 attribution text for LuGRE.** Proposed: "Contains data from the Lunar GNSS
   Receiver Experiment (LuGRE) Mission Data, J. Parker, F. Dovis et al., NASA and Agenzia
   Spaziale Italiana, Zenodo, doi 10.5281/zenodo.16411687, licensed under CC BY 4.0. Kshana's
   fixtures are derived extracts (C/N0 values, acquisition records, header times); no sample
   file is redistributed."
3. **I/Q order of the LuGRE batches.** The evidence (D7-b3) says the registered order is the
   conjugate. Options: change `ion_sdr` to fill sub-byte samples from the most significant bit
   whatever the byte order (the reader's first draft), or keep the standard-driven reading and
   add an explicit `swap_iq`. Either is an engine change whose next comparison needs a fresh
   registration.
4. **A clean acquisition registration on held-out data.** The surface-phase L1 batches (OP38 to
   OP78) were never opened. A registration fixed now (corrected I/Q order, mid-rise levels,
   cell-averaging decision, a lower false-alarm probability, a phase-coherent Doppler
   refinement, and the D7-b3 bar with a tolerance from the refinement's measured scatter) could
   be run on them blind. This is also the positioning leg's data (out of scope here).
5. **New module `src/gps_lnav.rs`.** Not in the roadmap's owned list; added for the
   cross-generator leg. Keep, or fold into `sdr`?
