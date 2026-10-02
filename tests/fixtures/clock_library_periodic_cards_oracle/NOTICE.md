# NOTICE: periodic-card oracle fixture (GPS Block IIF clocks, 2026-04-01 to 14)

Used by `tests/clock_library_periodic_cards_oracle.rs` and, decimated to 300 s and conditioned,
by `tests/clock_state_ext_igs_conditioned_oracle.rs`. Cut by `generate.py` (a format converter
reusing the converter and selection rule of `../clock_library_device_cards_oracle/generate.py`).
Retrieved 2026-10-02.

- Source: IGS final combined 30 s clocks `IGS0OPSFIN_2026{091..104}0000_01D_30S_CLK.CLK.gz`
  (2026-04-01 to 2026-04-14), BKG IGS data centre, https://igs.bkg.bund.de/root_ftp/IGS/products/
  (GPS weeks 2412-2414). Satellites: PRNs held by a GPS-IIF SVN for the whole window in the IGS
  satellite metadata SINEX (https://files.igs.org/pub/station/general/igs_satellite_metadata.snx):
  G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32.
- Licence: IGS products are openly available for any use with attribution; cite the IGS.
- Content and encoding as the March fixture (1e-14 s increments).
- SHA-256 of `igs_iif_30s.txt`: 3691d1591176a07d3f09bb9b66e7f23c40d4c8faf5add580e1051b520c9ae4e9. Every
  downloaded file's SHA-256 is in `sources.sha256`.
