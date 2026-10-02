# LuGRE mission data in Kshana

Kshana's lunar-distance tests use the Lunar GNSS Receiver Experiment (LuGRE) Mission Data,
Zenodo record 16411687, flown on Firefly's Blue Ghost Mission 1 (January to March 2025).

**Attribution (CC BY 4.0).** Contains data from the Lunar GNSS Receiver Experiment (LuGRE)
Mission Data, J. Parker, F. Dovis et al., NASA and Agenzia Spaziale Italiana, Zenodo,
doi 10.5281/zenodo.16411687, licensed under CC BY 4.0. Kshana's fixtures are derived extracts
(C/N0 values, acquisition records, header times, predictions); no sample file is
redistributed. The data are read with `kshana::realdata::{ion_sdr, lugre}`; the tests that need
the sample files read them from `KSHANA_LUGRE_DIR` and say so when they skip.

Reading convention: one byte per 4-bit complex sample, I in the high nibble (the reader's
default since D7; the low-nibble reading gives the conjugate signal, shown against
orbit-predicted Doppler). Any comparison that relies on this reading must be registered anew.
