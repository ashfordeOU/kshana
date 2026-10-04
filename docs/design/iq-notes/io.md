# Stream 5: large-dataset handling (`iq::io`)

Branch `claude/gnss-iq-io`. Everything is under `src/iq/io/`. Outside it there are three
small changes: one `pub mod io;` line in `src/iq/mod.rs`, a five-line `iq` dispatch and a
usage line in `src/main.rs`, and the tests in `tests/iq_io.rs`.

## What it provides

| Submodule | Contents |
|---|---|
| `format` | `SampleFormat` = `Encoding` (i8, i16 LE/BE, f32 LE/BE, packed 2-bit) × `Components` (I/Q, Q/I, real). Packed 2-bit has three code mappings (two's complement, sign-magnitude, offset binary) and two bit orders, all tabulated in the module docs. Format names (`ci16_le`, `r2sm_msb`, `c2tc_lsb_qi`, ...) match the SigMF `core:datatype` names for the byte-aligned formats. `decode_samples` and `encode_samples` handle one in-memory buffer at a time; `ci8`/`ci16_le` decoding delegates to `realdata::iqif::load_iq`. |
| `stream` | `IqReader<R: Read>` (`IqSource`) and `IqWriter<W: Write>` (`IqSink`), each with one staging buffer of fixed size (64 KiB by default). The reader has `seek_to_sample` when `R: Seek`. Also `skip_samples`, `copy_samples` and `extract_window` (time window, via `SampleSpec::samples_in`). Native only: `open_raw` (with a header offset) and `create_raw`. |
| `resample` | `PolyphaseResampler` (rational `up/down`, Kaiser-windowed sinc, 80 dB / 0.8·Nyquist by default, state carried across chunks), `ResampledSource` adapter, `RealIfToBaseband` (mix by −f_IF, low-pass, decimate ≥ 2, optional spectral inversion). |
| `sigmf_stream` | Builds on `crate::sigmf` (reuses `Meta`/`Capture`/`Annotation`; `sigmf.rs` itself is unchanged). Adds the data types `ci16_be`, `cf32_be`, `ri8`, `ri16_le`, `ri16_be`, `rf32_le` and `rf32_be`. `SigmfStream` reads several recordings back to back as one stream. Every capture becomes a `CaptureBoundary` at its index in the whole stream, annotations are moved to stream indices, and no `read` returns a chunk that crosses a boundary. Native only: `open_sigmf_files`, `open_sigmf_collection` (checks each stream's SHA-512 when present) and `write_sigmf_collection`. |
| `report` | `BatchResult<T>`, `results_to_csv` / `results_to_json`, `rows_to_csv` / `rows_to_json` (RFC 4180 quoting, columns sorted by name, so the output is deterministic). |
| `batch` (native) | `run_batch` / `run_batch_items`: `std::thread::scope` with a bounded `sync_channel` work queue. Results come back in input order, and a panic is caught and reported as that input's error. |
| `inventory` (native) | `RawSidecar` (JSON or TOML: `format`, `sample_rate_hz`, `center_hz`, `if_hz`, `header_bytes`, `datetime`), `open_recording` (SigMF, collection, or raw + sidecar, all as one `IqSource`), `scan_dir` (format, rate, sample count, duration, size, streamed SHA-256 per data file, capture boundaries, annotation count; errors are recorded in the row instead of aborting the scan). |
| `cli` (native) | `kshana iq inventory | info | extract | convert | decimate`. An output path ending in `.sigmf*` gets a SigMF pair; any other output is written raw with a JSON sidecar. |

## Proposed CHANGELOG entry

```
### Added
- `kshana::iq::io`: streaming IQ dataset handling in bounded memory. int8, int16 (LE/BE),
  float32 (LE/BE) and packed 2-bit readers and writers over any Read/Write (2-bit code
  mappings and bit orders are stated, not guessed), real-IF to complex baseband, polyphase
  decimation and rational resampling, time-window extraction, SigMF streaming with every
  capture and annotation and multi-file recordings (SigMF collections) as one stream with
  capture boundaries, a dataset-folder inventory with streamed SHA-256, and a bounded
  worker-thread batch runner with CSV and JSON output.
- `kshana iq inventory|info|extract|convert|decimate` command group.
```

## Proposed VALIDATION / VERIFICATION-MATRIX entries

All in `tests/iq_io.rs`, plus unit tests in each submodule.

| Claim | Reference | Test |
|---|---|---|
| Every format (5 encodings + 6 packed 2-bit variants, × I/Q, Q/I, real) round-trips bytes → reader → writer bit for bit, and the streaming decode equals the one-shot decode | identity (encoder inverts decoder) | `every_format_round_trips_bit_exact` |
| Integer-valued samples round-trip; int8 saturation is counted exactly | closed form (115 of 200 values out of range) | `integer_samples_round_trip_and_saturation_is_counted` |
| 2-bit unpacking and packing match hand-built bytes for each mapping, bit order and component layout; padding of a partial last byte is reported | hand-built vectors from the documented tables | `two_bit_packing_matches_hand_built_vectors` |
| Real IF → complex puts `cos(2π(f_IF+δ)t)` at `+δ` with amplitude ½ (±10⁻³), the image is more than 70 dB down, and the inverted mode puts the tone at `−δ` | closed form of mixing | `real_if_to_complex_recovers_a_tone_at_the_right_baseband_frequency` |
| The resampler passes pass-band tones at unit gain (±10⁻³); interpolation images and an aliasing tone are more than 75 dB down (designed for 80); DC gain is 1 | sinusoid through an LTI filter; Kaiser (1974) β formula checked to closed form | `resampler_response_passes_the_band_and_rejects_images_and_aliases`, `kaiser_beta_matches_the_closed_form` |
| Chunked resampling gives the same bits as a single call, for any chunking | identity | `resampler_is_bit_identical_across_chunkings` |
| A 4 MiB file read in 4 KiB chunks equals the one-shot decode by `realdata::iqif::load_iq`; reader, writer and resampler buffer capacities never change | independent decoder in the crate | `chunked_read_of_a_multi_megabyte_file_equals_one_shot_in_bounded_memory` |
| A two-file SigMF collection reads as one stream: boundaries at the expected indices, the first capture's `sample_start` skipped, no read crossing a boundary, and a changed meta file rejected by SHA-512 | constructed fixture | `sigmf_collection_reads_as_one_stream_with_capture_boundaries` |
| The inventory's SHA-256 equals `sha2` over the whole file; format, rate and duration come from the sidecar or SigMF meta; a raw file without a sidecar is reported in its row | `sha2` one-shot digest | `inventory_reports_each_recording_and_its_sha256` |
| The batch runner returns results in input order, identically across worker counts and runs, and a panic does not stop the batch | identity | `batch_runner_orders_results_deterministically`, `a_panicking_input_is_an_error_and_the_rest_still_run` |
| CLI convert raw → SigMF cf32 → raw ci16 reproduces the original bytes; extract cuts the right window; decimate writes the right rate and length | identity / closed form | `iq_cli_converts_extracts_and_decimates` |

Status labels: the encoders and decoders are verified bit-exact. The resampler and the
real-IF converter are MODELLED DSP, checked against the closed-form behaviour of tones. No
external recording was used as an oracle.

## Limitations and decisions for integration

- **SigMF collections are read as consecutive time segments** in the order `core:streams`
  lists them. The SigMF specification does not fix what the streams of a collection mean
  (they are often the channels of an array), so this is an interpretation, and the module
  docs say so.
- Samples before the first capture's `core:sample_start` are skipped. This matches
  `sigmf::read`. Annotations that start before the first capture are dropped.
- `SigmfStream` takes its boundaries from the data-file lengths. A data file that is
  truncated while it is being read would shift the later boundaries.
- Every file in a multi-file stream must have the same data type and sample rate. The
  centre frequency may change at each capture. `SampleSpec.center_hz` holds the first
  capture's value, and the rest are reported in the boundaries.
- Packed 2-bit has no SigMF data type, so it is written raw with a sidecar. Layouts that
  store one 2-bit sample per byte are not covered.
- Integer saturation is counted. Float32 overflow to infinity is not.
- `ResampledSource` does not flush the filter tail after the last input, so the output
  length is `ceil(n·up/down)` with the filter's start-up transient at the front, and the
  group delay is `PolyphaseResampler::delay_out_samples()`.
- `extract` on the command line reads through the samples before the window in bounded
  memory, without seeking. `IqReader::seek_to_sample` exists for raw files but the CLI does
  not use it yet. The extracted output keeps a single capture, at the source's centre
  frequency.
- `batch`, `inventory`, `cli` and the file conveniences are compiled out on `wasm32`. The
  wasm32 target was not built in this stream (it is not installed in the build container).
- The CLI change to `src/main.rs` is the dispatch only. Python, WebAssembly and MCP
  surfaces are left to integration.
