# Pre-registration: the corrected LuGRE sample reader

Committed before the change is written or run. It fixes what the change is, which outputs may
move, which must stay byte-identical, and how that is shown. The expectations below are not
changed after the comparison has been run.

## Background

Three registered comparisons on the LuGRE (Lunar GNSS Receiver Experiment) L1 sample batches
(768cb62b, 0d1839d2, a81a9a4e) and one held-out run (2108e6ff) found three faults in how the
batches were read and searched:

1. **I/Q order.** Read with I in the low nibble, the strongest pairs of acquisitions came out
   with the Doppler sign reversed against the orbit prediction: the conjugate of the signal.
   `realdata::ion_sdr` already fills words from the most significant bit by default since
   3c480336 (I in the high nibble); `SdrLayout::fill_lsb_first = true` keeps the old reading.
2. **DC offset.** The bare two's-complement levels `v` carry a mean of -1/2 on I and on Q, a
   zero-frequency line that both Kshana and GNSS-SDR acquire. The mid-rise reconstruction
   `2v + 1` (`ion_sdr::to_mid_rise`) removes it, but only when a caller remembers to apply it.
3. **Statistic.** The sample-power statistic (`PcpsResult::statistic`, `acquired`) does not see
   the band-limited front end's raised cell noise (about 1.46 times). The noise-floor-normalised
   statistic `PcpsResult::cell_average_statistic` / `acquired_cell_average` (peak over the
   grid's own mean cell) exists since a81a9a4e but nothing names it as the LuGRE decision.

## The change

| part | before (release/0.36.0-rc @ c9e37402) | after |
|---|---|---|
| `ion_sdr::SdrLayout` | no mid-rise option; `decode` returns the coding's integer levels | new field `mid_rise: bool`. When true and the coding is two's complement, `decode` (and so `iq::io::SdrxSource`) returns `2v + 1`, the symmetric odd levels -15..+15 for 4 bits. `parse_sdrx` sets it **false**: the generic ION reader keeps the standard's signed integer, because mid-rise is a property of the LuGRE converter, not of the TC coding |
| LuGRE reader | none of its own: callers used `parse_sdrx`, then `to_mid_rise` by hand | new `realdata::lugre::parse_iqs_sdrx(text)`: `parse_sdrx`, refuses any coding but two's complement, sets `mid_rise = true` and `fill_lsb_first = false` (I in the high nibble, Q in the low). Its output equals `parse_sdrx` + `decode` + `to_mid_rise` sample for sample |
| acquisition decision on LuGRE IQ | the caller chose between `acquired` and `acquired_cell_average` | unchanged API. The LuGRE path (new tests and the comparison registered separately) decides with `acquired_cell_average`; `statistic` / `acquired` stay as they are, since GNSS-SDR's CFAR mode normalises by the input power the same way and its comparison needs them |
| GNSS-SDR converter `xval/gnss-sdr-lugre/run_acq.py` | I in the low nibble, bare integers | new opt-in flag `--corrected`: I in the high nibble, levels `2v + 1` (fits int8). Without the flag the converter is unchanged, so the committed records reproduce |

The old behaviour stays reachable: `fill_lsb_first = true`, `mid_rise = false`, the sample-power
decision. The pinned historic findings
(`tests/lugre_acquisition_gnss_sdr_oracle.rs`, `tests/lugre_acquisition_predicted_doppler_oracle.rs`,
`tests/lugre_acquisition_cell_average_doppler_oracle.rs`,
`tests/lugre_surface_acquisition_doppler_oracle.rs`) keep reading exactly as registered and are
not re-pinned.

## Which outputs move (fixed now)

1. **New outputs only.** The decode of a LuGRE batch through `lugre::parse_iqs_sdrx`: every
   sample component `v` of the old `parse_sdrx` + `decode` becomes `2v + 1` (with I and Q as
   `parse_sdrx` already reads them, I in the high nibble). Acquisition results computed on it
   are new results of the new tests.
2. **Byte-identical, everything else:**
   - `ion_sdr::parse_sdrx` + `decode` and `iq::io::SdrxSource` on any file (the generic reader),
     and every other reader (`iq::io` formats, SigMF, RINEX, SP3, ...);
   - `acquisition::pcps_acquire` and every field of `PcpsResult`;
   - every scenario under `scenarios/` (none reads an `.sdrx` file);
   - the registry, the cross-platform goldens, `docs/predictions/`;
   - the four pinned LuGRE findings and their fixtures under `tests/fixtures/lugre_*`;
   - `run_acq.py` without `--corrected`.

## Method

1. Build release `kshana` binaries of c9e37402 ("before") and of the change ("after") in
   separate target directories.
2. Run every scenario file under `scenarios/` with each binary (`kshana <file>`, on a copy of
   the directory per binary, which writes `<name>.result.json` beside each file) and compare the
   `*.result.json` files byte for byte; list every file that differs.
3. Run the library tests of `realdata::ion_sdr`, `realdata::lugre`, `acquisition` and
   `iq::io`, `tests/iq_io.rs`, and the LuGRE test files on the change (the data-gated ones with
   the LuGRE data present).
4. A unit test shows `parse_iqs_sdrx` + `decode` equal to `parse_sdrx` + `decode` +
   `to_mid_rise` on hand-packed bytes, and a mid-rise sum of zero over all sixteen codes.

## Decision rule

- **Expected:** no existing output differs (item 2); the only new values are item 1's.
- **Finding:** any existing output that differs. It is reported with the file and field, and
  its cause is traced before anything is changed; this file is not edited to fit it.

No ledger row changes tier on this change alone. The comparison that could change a tier is
registered separately, before it is run, on batches not opened before.
