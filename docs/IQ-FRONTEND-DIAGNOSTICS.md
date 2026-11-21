<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Front-end diagnostics and GNSS-SDR configurations for a recording

Two receive-only additions to `kshana iq` for people who record with low-cost front ends (PlutoSDR,
USRP, LabSat and the like) and process the recordings with a software receiver. Neither produces or
transmits a signal.

## `iq diagnose`: what the recording says about the radio

```sh
kshana iq diagnose capture.bin                                   # raw file with a sidecar, or SigMF
kshana iq diagnose capture.bin --format ci16_le --rate 4e6 --center 1575.42e6
kshana iq diagnose capture.sigmf-data --signal gps-l1ca --prn 1,3,7,11,19,24 \
  --coherent 4 --noncoherent 5 --doppler-max 40000              # with the oscillator and clock check
```

It reads the recording once (all of it, or `--max-seconds`) in bounded memory and prints a JSON
document (the same in every language; it is read by programs). Every measurement comes with the
threshold it was compared with, and `findings` lists the ones that crossed it:

| Code | Measured | Threshold (default) |
|---|---|---|
| `dc-offset` | `|mean(I, Q)| / RMS` | 0.05 |
| `iq-gain-imbalance` | `10·log10(E[I²]/E[Q²])` after the DC is removed | 0.5 dB |
| `iq-phase-imbalance` | quadrature skew `asin(E[IQ]/√(E[I²]E[Q²]))` | 3° |
| `clipping` | fraction of components at the format's extreme codes (integer formats of 4 bits or more) | 0.001 |
| `dropouts` | runs of at least 64 samples exactly zero | any |
| `repeated-samples` | samples equal to the one before, minus the rate equal to the sample 2, 3 and 4 before (the chance rate at this quantisation); the period, when the repeats fall on one position of one | 0.001 and 5 binomial σ |
| `gain-steps` | power change between consecutive 10 ms blocks (`--block`, `--gain-step-db`) | 3 dB |
| `oscillator-offset` | with `--signal`/`--prn`: the interval the receiver's own frequency offset must lie in if it is static (every satellite within ±5 kHz of its carrier, `--max-sat-doppler`); reported when the interval excludes zero, as its end nearest zero | interval excludes 0 |
| `clock-mismatch` | with `--signal`/`--prn`: each acquired code is acquired again every 0.2 s (`--step`, `--steps`); its code-phase drift gives the code's rate against the sample clock and its Doppler the carrier's; their difference, median over codes | 1 ppm |
| `no-acquisition` | no code crossed its acquisition threshold | — |

What the clock check can and cannot see. When the oscillator and the sample clock come from one
reference (most SDRs), an oscillator offset moves the carrier and the code rate equally: it shows as
`oscillator-offset`, not as `clock-mismatch`. A `clock-mismatch` means the sample clock and the
oscillator disagree, or samples were dropped or repeated on the way to the disk; a repeat as gross
as one sample in eight stops acquisition altogether, and `repeated-samples` names it instead. The
oscillator interval is only as good as the static-receiver assumption and the detections: a false
detection can empty it (then it is `null`).

Evidence: MODELLED. The measurements are checked on self-made fixtures with one fault injected each
(`src/iq/frontdiag.rs` tests and `tests/iq_frontdiag.rs`): DC and imbalance, clipping, a run of zeros,
a 10 dB gain step, one sample in eight written twice (period 9 found), an oscillator 10 ppm off on a
common reference (offset found, mismatch below 1 ppm) and a sample clock 20 ppm fast against an exact
oscillator (mismatch of −20 ppm found within 2 ppm). They have not been run on a set of real faulty
recordings.

## `iq gnss-sdr-conf`: a GNSS-SDR configuration for the recording

```sh
kshana iq gnss-sdr-conf capture.bin --signal gps-l1ca:8,galileo-e1b:4 --out run.conf
kshana iq gnss-sdr-conf capture.bin --profile narrowband --out narrow.conf   # 20 ms GPS L1 C/A tracking
gnss-sdr --config_file=run.conf
```

It writes the configuration file GNSS-SDR needs for a recording Kshana already opens: the file source
(`File_Signal_Source` with `item_type` `ishort`, `ibyte` or `gr_complex` for `ci16_le`, `ci8` or
`cf32_le`, and the matching data-type adapter), the channels, acquisition, tracking and telemetry
blocks of each signal (`gps-l1ca` → `1C`, `galileo-e1b` → `1B`, `beidou-b1i` → `B1`), `Hybrid_Observables`,
`RTKLIB_PVT`, and both monitor streams to `127.0.0.1` (ports 1234 and 1235, or `--monitor-ports`, or
`--no-monitor`). Block and parameter names are those of the GNSS-SDR documentation (gnss-sdr.org, read
20 November 2026); only these three signals are written because they are the ones whose blocks were
checked there. The values are GNSS-SDR's documented defaults unless stated: a starting point, not a
tuned receiver. Nothing here runs GNSS-SDR, and the generated file has not been run with it in this
repository.

The `narrowband` profile sets GPS L1 C/A to a 20 ms coherent integration after bit synchronisation
(`extend_correlation_symbols = 20`) with a 2 Hz PLL and 0.25 Hz DLL: the same benchmark configuration
for everyone, to compare against the default profile on the same recording.

Refused with the reason, rather than written wrong: a sample format GNSS-SDR's file source does not read
(convert with `kshana iq convert --to ci16_le`), a header or interleaved streams (extract first), a
non-zero IF, a signal more than 1 kHz from the recording's centre frequency, an output rate that is not
a multiple of 20 ms.

**Scoring the run with Kshana.** `integrations/gnss-sdr/relay.py` turns the two monitor streams into
JSON lines that `receiver-trust` reads with `format = "gnss-sdr"`; GNSS-SDR's own RINEX observation and
NMEA files are read with `format = "rinex"` and `format = "nmea"`. `kshana iq sweep` replays the same
recording across Kshana's own loop designs for the comparison on Kshana's receiver.
