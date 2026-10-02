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
