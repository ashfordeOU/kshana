# Stream 6: signals and codes (`iq::signals`)

Branch `claude/gnss-iq-signals`. Module `src/iq/signals/` (`mod.rs`, `gps.rs`,
`galileo.rs`, `beidou.rs`, `glonass.rs`, `tables.rs`); tests `tests/iq_signals.rs` plus unit
tests in each file; data `data/galileo-os-sis-icd/`; fixtures `tests/fixtures/iq_signals/`.

## What it provides

One generic `SignalCode` (primary code x secondary code x chip modulation) implementing
the contract's `SpreadingCode`, built by per-signal constructors:

| Signal | Constructor | Length (primary / tiered) | Chip rate | Carrier |
|---|---|---|---|---|
| GPS L1 C/A | `gps::l1ca(prn)` 1..=32 | 1023 | 1.023 M | 1575.42 MHz |
| GPS L5 I5 | `gps::l5_i5(prn)` 1..=210 | 10230 / 102300 (NH10) | 10.23 M | 1176.45 MHz |
| GPS L5 Q5 | `gps::l5_q5(prn)` 1..=210 | 10230 / 204600 (NH20) | 10.23 M | 1176.45 MHz |
| GPS L2 CM | `gps::l2c_cm(prn)` 1..=63 | 10230 | 511.5 k | 1227.60 MHz |
| GPS L2 CL | `gps::l2c_cl(prn)` 1..=63 | 767250 | 511.5 k | 1227.60 MHz |
| GPS L2C (CM/CL time-multiplexed) | `gps::l2c(prn)` | 1534500 | 1.023 M | 1227.60 MHz |
| Galileo E1-B | `galileo::e1b(prn)` 1..=50 | 4092, CBOC(6,1,1/11) in-phase | 1.023 M | 1575.42 MHz |
| Galileo E1-C | `galileo::e1c(prn)` 1..=50 | 4092 / 102300 (CS25), CBOC anti-phase | 1.023 M | 1575.42 MHz |
| Galileo E5a-I | `galileo::e5a_i(prn)` 1..=50 | 10230 / 204600 (CS20) | 10.23 M | 1176.45 MHz |
| Galileo E5a-Q | `galileo::e5a_q(prn)` 1..=50 | 10230 / 1023000 (CS100_n) | 10.23 M | 1176.45 MHz |
| BeiDou B1C data | `beidou::b1c_data(prn)` 1..=63 | 10230, BOC(1,1) | 1.023 M | 1575.42 MHz |
| BeiDou B1C pilot | `beidou::b1c_pilot(prn)` 1..=63 | 10230 / 18414000 (Weil 1800), QMBOC(6,1,4/33) | 1.023 M | 1575.42 MHz |
| BeiDou B1I | `beidou::b1i(prn)` 1..=63 | 2046 / 40920 (NH20, MEO/IGSO only) | 2.046 M | 1561.098 MHz |
| GLONASS L1OF | `glonass::l1of(k)` k = -7..=6 | 511 | 0.511 M | 1602 + 0.5625k MHz |

`value_at(phase)` wraps over the tiered period and applies the subcarrier at the fractional
chip position. `SignalCode::primary_only()` drops the overlay code for a replica.
`galileo::MemoryCodeTable::parse` loads a user-supplied table in the ICD Annex C format.
The B1C pilot is its own type (`beidou::B1cPilot`) because QMBOC is complex:
`value_at` returns one unit-amplitude part (BOC(1,1) by default, BOC(6,1) on request) and
`ComplexSpreadingCode::complex_at` returns `√(29/33)·BOC(1,1) − j·√(4/33)·BOC(6,1)`.

## Sources (retrieved 2026-10-04)

| ICD | URL | SHA-256 of the PDF |
|---|---|---|
| IS-GPS-200N (01-AUG-2022) | <https://www.gps.gov/sites/default/files/2025-07/IS-GPS-200N.pdf> | `54ec544bfe7e6acd97daaa1de0ca248e5abec6b418f23c1a69991e5c7bcf749a` |
| IS-GPS-705J (01-AUG-2022) | <https://www.gps.gov/sites/default/files/2025-07/IS-GPS-705J.pdf> | `532fc3b89061dff84e34406b9a5b41e34b83bdc8cc194b7b7f75a70b15391885` |
| Galileo OS SIS ICD Issue 2.1 (Nov 2023) | <https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.1.pdf> | `15b09498518c3c3c802606c26a35fef26d72de8b5941f27f58d8f26d0ca47fc0` |
| Galileo OS SIS ICD Issue 2.0 (Jan 2021), Annex C attachments | <https://www.gsc-europa.eu/sites/default/files/sites/all/files/Galileo_OS_SIS_ICD_v2.0.pdf> | `ce97057a9e9d74cc41a6b986c6e9ef03ce420eda474787b4f8f0456b369a81c0` |
| BDS-SIS-ICD-B1C-1.0 (2017-12) | <http://www.beidou.gov.cn/xt/gfxz/201712/P020171226741342013031.pdf> | `a297befc287fe4598735ccc99246c58e299375d79770a788538123ed4a20d137` |
| BDS-SIS-ICD-B1I-3.0 (2019-02) | <http://www.beidou.gov.cn/xt/gfxz/201902/P020190227593621142475.pdf> | `7f2de6f69af3eb970627d43e5ad6645e76486e1cbaedfdf5f697210ede9ce2e8` |
| GLONASS ICD Edition 5.1 (2008) | <https://www.unavco.org/help/glossary/docs/ICD_GLONASS_5.1_(2008)_en.pdf> | `5c6226de34720656f8d195b7132a3778a7c377d263bb50954c0c581ff08cd3e0` |

The GLONASS ICD's publisher site (russianspacesystems.ru) failed TLS verification
(self-signed chain) from this environment, so the copy hosted by UNAVCO was used; its text
identifies itself as Edition 5.1, 2008. The BeiDou PDFs are served over plain HTTP by the
publisher.

`src/iq/signals/tables.rs` was produced mechanically from `pdftotext -layout` output of the
PDFs above (no hand edits); each table states its ICD issue and table number.

## What was verified, and against what

| Check | Oracle (independent column of the ICD) | Coverage | Status |
|---|---|---|---|
| L1 C/A first 10 chips | IS-GPS-200N Table 3-Ia "First 10 Chips Octal" | PRN 1-9 (all 32 already in `sdr`) | VALIDATED |
| L5 XB advance -> initial XB state | IS-GPS-705J Tables 3-Ia, 3-Ib, 6-I print both | PRN 1-210, I5 and Q5 | VALIDATED |
| L5 first 13 chips = complement of XB state | same tables, note ** | PRN 1-210, I5 and Q5 | VALIDATED |
| L5 NH10 / NH20 | IS-GPS-705J §3.3.3.1.2 / §3.3.2.3 | - | VALIDATED |
| L2 CM end state | IS-GPS-200N Tables 3-IIa/3-IIb "End Shift Register State" | PRN 1-63 | VALIDATED |
| L2 CL end state | same | PRN 1-63 | VALIDATED |
| L2C CM/CL chip interleave | IS-GPS-200N §3.2.2, Figure 3-12 text (no printed chips) | - | MODELLED |
| E5a first 24 chips | Galileo ICD Tables 16 / 17 | codes 1-50, I and Q | VALIDATED |
| E5a complete code | Galileo ICD Annex C.3 / C.4 attachments (fixtures) | all 10230 chips, codes 1-50, I and Q | VALIDATED |
| E5a / E1-C secondary codes | Galileo ICD Tables 20/21, §3.5.1 binary example of CS25 | CS20, CS25, CS100_1..100 | VALIDATED |
| E1-B / E1-C memory codes | the ICD's own Annex C.7 / C.8 tables (committed, hashed); Issue 1.3 identical | codes 1-50 | VALIDATED (by provenance) |
| CBOC power split | Galileo ICD Eq. 11: α² = 10/11, β² = 1/11, measured from the waveform | E1-B and E1-C | VALIDATED (closed form) |
| B1C Weil codes first and last 24 chips | BDS-SIS-ICD-B1C-1.0 Tables 5-2, 5-3, 5-4 | PRN 1-63 data, pilot and pilot secondary (378 values) | VALIDATED |
| Legendre two-level autocorrelation | closed form for prime N ≡ 3 mod 4 | N = 3607 all lags, N = 10243 sample lags | VALIDATED |
| QMBOC power split 29:4 | BDS-SIS-ICD-B1C-1.0 Eq. 4-10, Table 4-2, measured from the waveform | pilot | VALIDATED (closed form) |
| B1I chips | ICD prints no per-PRN chips; checked polynomials, initial phase, Table 4-1 taps, Gold balance, 2047 period | PRN 1-63 | structure VALIDATED, chips MODELLED |
| GLONASS ranging code | ICD §3.3.2.1 first group `111111100`; m-sequence balance and 511/-1 autocorrelation | - | VALIDATED |
| GLONASS FDMA carriers | ICD Table 3.1 | k = -7, -1, 0, 1, 6 | VALIDATED |

## Entries for integration to merge

### CHANGELOG (Unreleased, Added)

- `iq::signals`: spreading codes for GPS L1 C/A, L5 (I5/Q5 with Neuman-Hofman), L2C
  (CM, CL, time-multiplexed), Galileo E1-B/E1-C (CBOC(6,1,1/11), ICD memory codes) and
  E5a-I/E5a-Q (LFSR, secondary codes), BeiDou B1C (Weil codes, BOC(1,1), QMBOC pilot
  parts) and B1I, and GLONASS L1OF (FDMA channels -7..+6), all through `SpreadingCode`
  with fractional code phase and subcarrier. Each is checked against its ICD: L5 and L2C
  register states for every PRN, E5a against the complete Annex C codes, B1C against the
  first and last 24 chips of all 189 codes. The Galileo E1 memory codes ship under
  `data/galileo-os-sis-icd/` with provenance and are used under the EU's Annex H
  authorisation, not the repository licence.

### docs/VALIDATION.md

One section "GNSS spreading codes (iq::signals)" carrying the verification table above.

### docs/VERIFICATION-MATRIX.md rows

| Capability | Oracle | Tests | Status |
|---|---|---|---|
| GPS L5 I5/Q5 codes | IS-GPS-705J Tables 3-Ia/3-Ib/6-I (advance vs state vs first chips), PRN 1-210 | `tests/iq_signals.rs` `gps_l5_*` | Validated (ICD table) |
| GPS L2 CM/CL codes | IS-GPS-200N Tables 3-IIa/3-IIb end states, PRN 1-63 | `gps_l2_cm_*`, `gps_l2_cl_*` | Validated (ICD table) |
| Galileo E5a-I/Q codes | ICD Tables 16/17 and complete Annex C.3/C.4 | `galileo_e5a_*` | Validated (ICD table) |
| Galileo E1-B/C codes + CBOC | ICD Annex C.7/C.8 (hashed provenance); Eq. 11 power split | `galileo_e1_*`, `galileo_cboc_*` | Validated (ICD table / closed form) |
| BeiDou B1C Weil codes + QMBOC | BDS-SIS-ICD-B1C-1.0 Tables 5-2/5-3/5-4; Eq. 4-10 | `beidou_b1c_*`, `legendre_*` | Validated (ICD table / closed form) |
| BeiDou B1I codes | BDS-SIS-ICD-B1I-3.0 §4.3 structure only | `beidou_b1i_*` | Modelled chips, structure checked |
| GLONASS L1OF code + FDMA | GLONASS ICD 5.1 §3.3.2.1 first group, Table 3.1 | `glonass_*` | Validated (ICD statement / table) |

## Limitations

- B1I: no independent chip oracle. The ICD prints no first-chip table; the generator follows
  the stated polynomials, initial phase and tap selections, and is checked only for
  structure. An independent implementation's output committed as a fixture would close this.
- L2C interleaving order (CM chip first) follows the ICD text; no printed interleaved
  chips exist to check it against.
- E1 memory codes come from Issue 2.0's attachments because the Issue 2.1 PDF no longer
  carries them. Their correctness rests on the ICD's own table (provenance hash, identical in
  Issue 1.3), not on a separate generator; memory codes have no generator to compare with.
- Components only: no E5 AltBOC multiplex, no full E1 or B1C complex envelope, no data
  symbols, no GLONASS 100 Hz meander, no L2C data on CM. NH codes are applied as overlay
  codes; on I5 and B1I they ride on the data symbols.
- E5b, E6, B2a, B3I, L1C, GLONASS L2OF / CDMA signals are not implemented.
- GPS L1 C/A is limited to PRN 1-32 by `crate::sdr::CaCode`.
- Licensing: the E1 code files are EU technical data, used under ICD Annex H. The repository
  owner should confirm this sits with the dual-licensing model before a release.
