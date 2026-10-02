# NOTICE: device-card oracle fixture (GPS Block IIF clocks)

Used by `tests/clock_library_device_cards_oracle.rs` (shared loader in
`tests/clock_library_support/mod.rs`). Cut by `generate.py` in this directory, a format
converter that computes no statistic. Retrieved 2026-10-02.

## `igs_iif_30s.txt`: IGS final combined satellite clocks

- Source: International GNSS Service (IGS) final combined 30 s clock products
  `IGS0OPSFIN_2026{060..073}0000_01D_30S_CLK.CLK.gz` (2026-03-01 to 2026-03-14), from the BKG
  IGS data centre, https://igs.bkg.bund.de/root_ftp/IGS/products/2408/ and `.../2409/`.
- Satellite selection: IGS satellite metadata SINEX,
  https://files.igs.org/pub/station/general/igs_satellite_metadata.snx (as retrieved);
  PRNs held by a GPS-IIF SVN for the whole window: G03 (G069), G06 (G067), G08 (G072),
  G09 (G068), G10 (G073), G24 (G065), G25 (G062), G26 (G071), G27 (G066), G30 (G064),
  G32 (G070).
- Licence: IGS products are openly available for any use with attribution; cite the IGS
  (Johnston, Riddell and Hausler, "The International GNSS Service", Springer Handbook of Global
  Navigation Satellite Systems, 2017).
- Content: per PRN, the satellite clock bias of every 30 s epoch present, delta-encoded in
  units of 1e-14 s (the source resolution is finer than 1e-16 s at these magnitudes).
- SHA-256 of `igs_iif_30s.txt`: c51c7a60c243220b9227566662be16d3da5451eaa520f15d6deaa47240b4bab5.
  The SHA-256 of every downloaded source file is in `sources.sha256`.

Regenerate: `python3 generate.py <download directory>`.
