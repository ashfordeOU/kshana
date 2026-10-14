# Provenance

* `inputs.json`: synthetic type 3 and type 21 records, type 13 Kepler states and evaluation
  epochs drawn by `generate.py inputs` from the seed fixed in
  `xval/spk-3-21-spice/PREREGISTRATION.md` (the SHA-1 of its commit).
* `kshana/*.bsp`: written by Kshana (`src/spk_writer.rs`) from `inputs.json`.
* `spice/*.bsp`: written by the NAIF SPICE Toolkit (CSPICE N0067, through spiceypy 8.3.0) from
  the same records, by `generate.py oracle`.
* `outputs/spice.json`: SPICE's inventory and evaluations of both sets of files.

SPICE is used only as a separately run oracle; none of its code is in Kshana.
