# RTCM 3 SSR decoding oracle: provenance

This directory holds the external reference used by `tests/rtcm_ssr_pyrtcm.rs` to check
`src/rtcm_ssr.rs`.

## Files
- `pygpsdata-RTCM3.log` (sha256 06e1285a489da02d822d2ee240b9fe4aec62bbdaf17e7d61bbf91e12a103ad0e)
  and `pygpsdata-1240-1264.log` (sha256 45d0c727b5cfa099924f4722fa152041820ae0b4005dedffa7d674c13783e452):
  public sample streams from the pyrtcm repository (github.com/semuconsulting/pyrtcm, tag v1.2.0,
  `tests/`), BSD 3-Clause, Copyright (c) 2020 semuadmin (Steve Smith). The licence text is in the
  repository's `NOTICE`.
- `expected_ssr.json`: the decoded field values that pyrtcm's own test suite
  (`tests/test_stream.py`, `EXPECTED_RESULTS`) records for the SSR messages in those streams,
  transcribed from the test file. pyrtcm was not run to produce them.

## Limits
- The field widths in `src/rtcm_ssr.rs` come from the same open decoder, so this check confirms
  the decoding of the frames and the scaling. It does not independently confirm the tables against
  the RTCM standard; applying the corrections in PPP against IGS products (item R1.5) does that.
- For message 1264, pyrtcm records no ionospheric layer for the sample; only its header is compared.
