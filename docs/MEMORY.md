# Memory and CPU

Kshana uses every core and a fixed amount of memory wherever it can, and it says so up front
where it cannot.

## CPU: `KSHANA_THREADS`

Monte Carlo ensembles, campaigns, sweeps (generic and N-D), the LEO PPP ensemble and the
per-chunk channel correlation of `iq track` and `iq sweep` run on every core. Set
`KSHANA_THREADS=<n>` to use fewer (`1` runs everything on the calling thread). The output never
depends on the number: the same scenario gives the same bytes on one core and on many, which
`tests/parallel_determinism.rs` checks for every parallel kind at 1 and 8 threads.

## Memory: `KSHANA_MAX_MEMORY`

IQ recordings are read in fixed-size chunks, so tracking a recording of any length holds the same
memory when its outputs stream to disk:

| Command (two GPS L1 C/A channels, 2.046 MS/s, debug build) | 4 s recording | 16 s recording |
|---|---|---|
| `iq scene` (writing the recording) | 37 MiB | 37 MiB |
| `iq track --epochs … --summary …` | 42 MiB | 43 MiB |
| `iq track` (table only) | 42 MiB | 42 MiB |
| `iq track --json …` | 89 MiB | 229 MiB |

`--epochs`, `--summary`, `--events` and `--csv` stream. `--json` holds every epoch until the end,
about 6 KiB per epoch per channel, so it grows with the recording: a 50 GB recording would need
tens of GiB.

Set `KSHANA_MAX_MEMORY` (bytes, or with `K`, `M`, `G` or `T`: `2G` is 2 GiB) to cap what one
command may plan to hold. A command that would hold a whole document over the cap (today: the
`--json` of `iq track`) estimates its size from the recording before it starts and stops with a
message naming the streaming output to use instead. Streaming paths are never refused.
`tests/memory_bounded.rs` checks both: peak memory does not grow with the recording, and `--json`
is refused under a cap.

Still to come in 0.41: streaming readers for long receiver logs, and the Station's per-job budget
and seven-day soak (with the Station service).
