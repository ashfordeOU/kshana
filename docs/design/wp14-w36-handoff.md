<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# WP-14 handoff (W36 part), 2026-10-14

## Branch heads

| Branch | Package | Head | Ledger on that branch |
|---|---|---|---|
| `feat/new-domains-0.36` | WP-14 (W36 part) | this commit | 284 rows: 136 VALIDATED / 144 MODELLED / 4 PARTNER; 83 kinds; 157 scenario files |
| `feat/new-domains-b-0.36` | WP-14 (W45 part: CAP-20c/d, CAP-11) | 032c8231 | cut from 3728730c |
| `feat/gnss-realdata-0.36` | WP-07, plus FUT-19 part 1 | da25eafd | 284 rows: 140 V / 140 M / 4 P |
| `feat/fusion-ins-0.36` | WP-09 | 5e6486db | 280 rows: 136 V / 140 M / 4 P |

None of these has the release candidate merged in since the coordinator's last instruction.
Every count above is regenerated on its own branch, so merges will need the counts regenerated
again with the tools: `gen_validation_artifacts`, the README and diagram count updates,
`tools/render-diagram.sh` and `tools/gen_readme_assets.py`, run with a binary built from the
merged tree.

## Done on `feat/new-domains-0.36`

| Item | Kinds | Evidence |
|---|---|---|
| CAP-22/23 contact scheduling and ACM | `contact-schedule`, `acm-link` | MODELLED (exact solver against brute force; Table 13 transcription) |
| CAP-21 AOCS | `aocs` | control law and wheel dynamics VALIDATED against Basilisk 2.9.1 (pre-registered 27d6831a; round-off agreement); MEKF MODELLED |
| CAP-28 entry, EO, ascent | `entry-heating`, `eo-radiometry`, `ascent-losses` | Stardust peak deceleration VALIDATED (35.44 g against the published 33.4 g, pre-registered 62cde2b8); heating, EO and ascent MODELLED |
| FUT-19 time transfer | `time-transfer-budget` | MODELLED here; the PPP time solution is VALIDATED on `feat/gnss-realdata-0.36` (IGS WTZR clock, std 0.075 ns, pre-registered 661ad138) |
| CAP-30 stage 1: ODF reader | (module `odf`, no kind) | MODELLED: against the PDS label, R1, R2, R4, R5 and R6 hold and R3 misses by one record on the end-of-file table, a label inconsistency (pre-registered d54306bf) |

## Open caveats

- **Inherited `web/*` failures.** `web/*` pages state 75 kinds and 263 rows, so
  `scenario_count_doc_sync` (site pages), `matrix_total_no_stale_count_doc_sync` and
  `web_validation_counts_doc_sync` fail. They fail identically on the rc. Whoever owns `web/`
  should fix them after the merges.
- **Count conflicts at merge.** `feat/new-domains-0.36` and `feat/new-domains-b-0.36` both add
  ledger rows and kinds. Expect conflicts in `src/verification.rs`, `src/api.rs`,
  `src/registry.rs`, `tests/field_units_global.rs` (RUNNERS must stay in registry order),
  `src/bundled_scenarios.rs` (sorted) and every generated count. Keep both sides, then
  regenerate.
- **`entry-heating` closed-form line.** It prints the Allen–Eggers closed form, 60.2 g for
  Stardust, beside the integrated 35.4 g. The closed form neglects gravity and suits steep
  entries only, as the module documents, and the summary should not be read as a check of the
  shallow Stardust case.
- **`time-transfer-budget` cost.** It generates flicker noise by direct convolution, O(N²).
  The scenario limits N to 20 000.

## CAP-30 notes for the next worker (beyond W45's plan, bb5ea10b)

- **Stage 1 is done.** `odf::parse_odf` reads TRK-2-18. The MRO ODF
  `mromagr2007_304_1424xmmmv1.odf` (2007-304T14:24 to 2007-305T14:45; DSS 14, 43, 63) and its
  label are vendored in `tests/fixtures/mro_odf/` (NASA PDS, public; SHA-256 values in its
  NOTICE). Data types on this ODF:
  - 2-way Doppler: 40 814 records;
  - 1-way Doppler: 8 612;
  - 3-way Doppler: 2 544;
  - sequential range: 15;
  - ramp records: 973, across the three stations.
- **The archive's own format document.** `NAV023-ODF-2-18_Rev3.htm`, under `document/` of
  volume `mrors_0xxx`, gives the bit layouts. `src/odf.rs` follows Table 3-3b: words 6-7 and 8-9
  are packed as 64-bit pairs.
- **The observable is not yet checked.** The reader's decoded values (observable, reference
  frequency, compression time) are checked only by a hand-built round trip, not by an external
  decoder. Stage 2 is the real check.
  - The 2-way X-band Doppler is ramped. The ODF reference frequency is the receiver frequency
    when ramped, so the predicted Doppler must integrate the ramp tables (`Odf::ramps`, per
    station) over each count interval (`compression_time_s`).
  - Use the 2-way data type 12, with `tx_station == rx_station`.
- **Stage 2 inputs still to fetch:**
  - the NAIF `mro_psp` reconstructed SPK covering 2007-304/305;
  - the DSN station coordinates (NAIF `earthstns_itrf93` SPK or the DSN 810-005 301 table);
  - Earth orientation parameters for 2007;
  - a Mars gravity field. GMM-3 via `gravity_sh::from_gfc` is already readable.
- **Stage 2 needs its own pre-registration before the first run.** The bars should be honest
  about what 3-DoF dynamics without full media calibration can reach. A post-fit residual RMS
  on 2-way Doppler (mHz level) and a position difference against the reconstructed SPK
  (km level) are realistic.
