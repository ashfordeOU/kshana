# RTKLIB decode of Kshana LNAV subframes

- `harness.c` (BSD-2-Clause, to match RTKLIB): a separate oracle program calling RTKLIB
  v2.4.2-p13 (commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807, BSD-2-Clause,
  <https://github.com/tomojitakasu/RTKLIB>) `decode_word` and `decode_frame`. Never compiled
  into Kshana.
- `generate.sh`: builds the harness against an RTKLIB clone at that commit and decodes
  `kshana_words.txt` into `rtklib_decoded.json`.
- `kshana_words.txt`: Kshana's transmitted words (`write_kshana_words` in the test), inputs the
  32 ephemerides of gps-sdr-sim's bundled `brdc0010.22n` as recorded in
  `../gps_l1ca_gpssdrsim_cross_generator/gpssdrsim_output.json`.
- Generated 2026-10-02 after the pre-registration commit ca5f0142 was pushed (gcc 13,
  Ubuntu 24.04). SHA-256 `kshana_words.txt`
  ba666bf58a9a0b753ea763d60744357d6ce558e8b74a3a8c79604eacd585ee27, `rtklib_decoded.json`
  19f60608b8ec7f60bb0c7f1d5658ac6cdab514384f9be1f042064c9a954d7935.
