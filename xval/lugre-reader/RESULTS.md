# The corrected LuGRE sample reader: results

Pre-registration: `PREREGISTRATION.md` (committed at `0c438b26`, before the change was written
or run). Outcome: **expected**. No existing output differs; the only new values are those of
the new reader. No ledger row changes tier.

## The change

- `ion_sdr::SdrLayout::mid_rise`: when set on a two's-complement layout, `decode` returns
  `2v + 1`. `parse_sdrx` leaves it false.
- `realdata::lugre::parse_iqs_sdrx`: `parse_sdrx`, two's complement only, `mid_rise = true`,
  `fill_lsb_first = false` (I in the high nibble).
- `xval/gnss-sdr-lugre/run_acq.py --corrected`: the same reading for GNSS-SDR. It is opt-in, so
  without the flag the converter is unchanged.

## Method and results (run 2026-10-13)

1. **Binaries.** Release `kshana` built from c9e37402 ("before") and from the change ("after",
   branch `feat/iq-ext-0.36`), in separate target directories.
2. **Scenarios.** Every top-level scenario under `scenarios/` (150 files) was run with each
   binary on its own copy of the directory, and the `*.result.json` files compared byte for
   byte.
   - 149 result files, 0 differ, 0 missing.
   - Exit codes are identical. The one non-zero exit on both sides is
     `quantum-pnt-demonstrator.suite.toml`, which is a study, not a scenario.
   - Run as a study (`kshana --study`), its `.study.json` and `.study.html` are byte-identical.
   - The four files under `scenarios/training/` are not standalone scenarios. Both binaries
     refuse them with the same message.
3. **Tests on the change:**
   - Library tests: `realdata::ion_sdr` 11 passed, `realdata::lugre` 4 passed, `acquisition`
     16 passed, `iq::io` 12 passed. `tests/iq_io.rs`: 12 passed.
   - The LuGRE test files ran with the LuGRE data present (Zenodo record 16411687,
     `LuGRE.zip`, md5 `cec32df1ca17cb95887762762c16629f`; none skipped). Each pinned finding
     still reads exactly as registered:
     - `lugre_acquisition_gnss_sdr_oracle` (`finding_dc_artefacts_and_no_contemporaneous_flight_cn0`);
     - `lugre_acquisition_predicted_doppler_oracle` (`noise_alone_crosses_the_sample_power_threshold_on_lugre_iq`);
     - `lugre_acquisition_cell_average_doppler_oracle` (`strong_pairs_match_the_prediction_only_with_the_doppler_sign_reversed`);
     - `lugre_surface_acquisition_doppler_oracle` (`each_surface_acquisition_is_a_single_predicted_visible_satellite`);
     - `lugre_relative_cn0_visibility` (`too_few_iir_records_at_lunar_distance_for_the_relative_cn0_bar`).
   - Goldens: `cross_platform_golden`, `golden`, `prediction_frozen` and `registry_golden` all
     pass unchanged.
4. **Unit tests.**
   - `the_corrected_reader_is_high_nibble_i_and_mid_rise`
     (`src/realdata/lugre.rs`): on all 256 byte values, `parse_iqs_sdrx` + `decode` equals
     `parse_sdrx` + `decode` + `to_mid_rise`, and each component sums to zero over the sixteen
     codes. It also refuses a coding other than two's complement.
   - `the_mid_rise_field_equals_to_mid_rise_and_leaves_other_codings_alone`
     (`src/realdata/ion_sdr.rs`).

**Extra check, beyond the registration: `run_acq.py` without `--corrected`.** The converter of
c9e37402 and the changed converter were run on the same 9 non-surface L1 batches the registered
comparison uses (OP5 and OP12 excluded as there). Their `.ibyte` outputs and returned facts are
identical on 9 of 9 batches.

## Not done here

The comparison that could change a tier, on batches not opened before, is registered separately
and has not been run.
