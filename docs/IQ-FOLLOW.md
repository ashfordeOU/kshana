<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Watching a recording while it is written, and describing a scene for other tools

Two receive-only additions to `kshana iq` (hardware-safety stage 1, see
[`HARDWARE-SAFETY.md`](HARDWARE-SAFETY.md)). Neither produces a signal; both only read or describe
files.

## `iq monitor --follow`: monitor a SigMF file that is still growing

```sh
kshana iq monitor capture.sigmf-meta --follow --idle-timeout 10 --power --spectral \
  --max-seconds 3600 --json report.json --csv report
```

`--follow` reads the recording's `.sigmf-data` read-only and keeps reading as the recorder appends to
it, running the same monitors as `iq monitor` without it (total power and AGC gain, and the spectral,
kurtosis and pulse monitor; with `--signal --prn`, also the C/N0, SQM and lock monitors). It stops when:

- the data file has not grown for `--idle-timeout` seconds (default 5), which is how it learns the
  recorder has finished; or
- `--max-seconds` of signal have been read; or
- the file is replaced by a shorter one (a rewritten file ends the stream rather than being read from
  the middle).

The report (events, series, notes) is written when it stops, not while it runs, so give
`--max-seconds` a bound if the recorder may run for ever. Nothing is written to the recording, and no
lock is taken.

What it reads, stated so it is not mistaken for more:

- **One SigMF recording, one channel, at most one `captures` entry.** The `.sigmf-meta` is read once, at
  the start. A recorder that rewrites it later (a second capture, a changed sample rate) is not followed,
  and a metadata file with more than one capture or channel is refused with the reason.
- **Both files must exist when the monitor starts.** Write the metadata first (below); the data file
  may be empty, and the idle time then runs from the start.
- A sample cut in two by the recorder's write is completed by the next read, never dropped.
- With `--signal`, acquisition runs first over the start of the recording, as it does without `--follow`,
  so the file must already hold enough samples for the search.
- `--follow` is for SigMF only; any other input is refused. `--idle-timeout` without `--follow` is refused.

A minimal `.sigmf-meta` for an 8-bit complex recording at 2.046 MHz around the GPS L1 carrier:

```json
{
  "global": {
    "core:datatype": "ci8",
    "core:sample_rate": 2046000,
    "core:version": "1.0.0",
    "core:description": "receive-only capture; replace with your own notes"
  },
  "captures": [{ "core:sample_start": 0, "core:frequency": 1575420000 }],
  "annotations": []
}
```

Any receive-only tool that appends interleaved I/Q to a file in one of the SigMF data types
(`ci8`, `cu8`, `ci16_le`, `cf32_le`, ...) can feed it. Which tool, which gain and which antenna are the
operator's choices; Kshana contains no capture code and no transmit code. Recording radio signals can
raise privacy and legality questions in some places: see the legal notes in
[`HARDWARE-SAFETY.md`](HARDWARE-SAFETY.md).

The evidence is MODELLED: the test that checks it writes a quiet half second, appends a much stronger
half second in steps while the monitor runs, and asserts that the appended samples are read and the
power rise is flagged after the step. It does not claim anything about a particular recorder.

## `iq scene --format sdrx`: ION GNSS SDR metadata beside the samples

```sh
kshana iq scene scene.sdrx --rate 2046000 --duration 1 --signal gps-l1ca --prn 3,11 \
  --doppler 1000,-1500 --cn0 45                      # 8-bit complex samples (the default)
kshana iq scene scene.sdrx --format sdrx:ci16_le ...  # 16-bit
```

The samples go to `scene.bin` and the description to `scene.sdrx`, in the ION GNSS SDR Metadata
Standard form that `realdata::ion_sdr` reads (one lane, one stream, one block, two's-complement I then
Q). The standard has no floating-point coding, so `cf32` output is refused with `sdrx`. The metadata's
`<comment>` says the scene is simulated, not a recording; the truth sidecar is written beside it as
for any scene.

The writer and the reader are tested against each other (`write_sdrx` then `parse_sdrx` returns the
layout), and the stream the reader returns from the `.sdrx` equals, sample for sample, the plain `ci8`
or `ci16_le` file the same scene writes. That checks the pair agrees with itself. No other receiver
software has been run on the file, so a reader that interprets the standard differently is not
excluded.
