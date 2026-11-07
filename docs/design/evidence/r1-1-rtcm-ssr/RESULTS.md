<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# R1.1 (0.41): SSR correction messages decoded into `kshana.obs/1` corrections: results

**Status: MODELLED.** There is no pre-registration for this item: the RTCM SSR reader and its check
against the open decoder were written before the item had one, and the sample streams below were read
while writing it. Nothing here is claimed as VALIDATED, and no bar is stated after the fact. A
VALIDATED row needs a pre-registration with bars set before fresh data (for example, a stream recorded
after the pre-registration is committed, decoded by an independent decoder that does not share
pyrtcm's tables).

Reproduce with `cargo test --test rtcm_ssr_pyrtcm --test obs_ssr_corrections` and
`cargo test --lib rtcm_ssr`.

## What is decoded

`src/rtcm_ssr.rs` reads, from any RTCM 3 byte stream (CRC-24Q checked):

- RTCM SSR: orbit, clock, code bias, combined orbit and clock, URA and high-rate clock for GPS
  (1057–1062), GLONASS (1063–1068), Galileo (1240–1245), QZSS (1246–1251), SBAS (1252–1257) and BeiDou
  (1258–1263), and the global ionosphere as spherical harmonics (1264);
- IGS SSR (RTCM 4076, IGS SSR version 1): the same kinds plus phase biases with yaw, for the same six
  systems, and the global ionosphere (IGS message 201).

`kshana obs convert <stream> --format rtcm-ssr --station <stream.toml>` writes them as `kshana.obs/1`
correction records (`docs/OBS-SCHEMA.md`): one record per satellite of each message and one per
ionosphere message, in stream order, with `t_s` on GPS time (`kshana::rtcm_ssr::to_obs`).

## The check

The oracle is pyrtcm 1.2.0 (BSD 3-Clause), through the field values its own test suite records for
three public sample streams in its repository (`tests/fixtures/rtcm_ssr/`, provenance and hashes in
`NOTICE.md`). pyrtcm was not run; its recorded values were transcribed.

| Stream | Messages | Kinds | Result |
|---|---|---|---|
| `pygpsdata-RTCM3.log` | 2 | GPS code bias, GPS combined | every field equal (integers exactly, scaled values within half a least-significant bit) |
| `pygpsdata-1240-1264.log` | 13 | Galileo and BeiDou orbit, clock, code bias, combined; ionosphere 1264 | every field equal; 1264: header and quality only (see limits) |
| `pygpsdata-NTRIP-4076.log` | 11 | IGS combined (GPS, GLONASS, Galileo, BeiDou), code bias (GPS, GLONASS, Galileo), ionosphere 201 | every field equal, including all 169 ionosphere coefficients |

`tests/obs_ssr_corrections.rs` converts each stream to correction records, writes them as JSON Lines,
reads them back through `kshana obs check`, and compares every value of every record with pyrtcm's
values the same way: 676 records over the three streams. The records read back equal the records
written. Every record is valid against `docs/spec/obs-1.schema.json` (checked once with a JSON Schema
2020-12 validator; the test checks keys and required fields on every run).

## Limits

- **Layouts checked only against hand-built frames.** No public sample holds IGS orbit-only,
  clock-only, high-rate clock, phase-bias or URA messages. Those layouts are checked only against frames
  built by hand in `src/rtcm_ssr.rs`'s unit tests, which test the bit handling against the same layout
  description the reader follows, not against an external decoder. The phase-bias fields (signal,
  integer and wide-lane indicators, discontinuity counter, bias, yaw, yaw rate, the two consistency
  indicators) have no external check.
- **The tables share their source with the oracle.** The field widths, scales and order come from
  pyrtcm's tables, so agreement with pyrtcm confirms the frame decoding and scaling, not the tables
  against the RTCM or IGS documents.
- **pyrtcm's IGS orbit-only definition** lists the cross-track and radial-rate fields in the other
  order from its combined definition. Kshana reads orbit-only messages in the combined order, which is
  also the order of the RTCM orbit messages. No sample shows which is right.
- **Message 1264**: pyrtcm takes the 2-bit layer field as the count and records no layer for the
  sample. Kshana reads it as the count minus one, which uses every bit of the frame (one layer of degree
  and order 12); its coefficients have no external check. The IGS 201 message, where pyrtcm adds one,
  agrees with Kshana on every coefficient.
- **Time.** `t_s` puts every epoch on GPS time: BeiDou RTCM epochs are moved by 14 s; GLONASS RTCM
  epochs (GLONASS time of day) are moved with GPS − UTC = 18 s, the value since 1 January 2017, and
  placed in the day of the message before them. Each epoch is put in the week nearest the message
  before it, so messages more than half a week apart are ambiguous. The sample streams are short or
  joined captures and do not exercise a leap second.
- **Not applied.** The corrections are decoded, not applied to broadcast orbits and clocks; PPP with
  them is a later item.
- `obs live` does not accept `rtcm-ssr`; convert reads a whole stream.
