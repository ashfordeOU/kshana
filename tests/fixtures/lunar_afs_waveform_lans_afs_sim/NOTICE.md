# Fixture: LANS-AFS-SIM outputs for the AFS waveform comparison

Oracle: LANS-AFS-SIM, T. Ebinuma, <https://github.com/osqzss/LANS-AFS-SIM>, commit
`480c6bf353717bafc04b5ee5bafb38ed90e61aae` (2 May 2026), BSD-2-Clause licence
(Copyright (c) 2025, Takuji Ebinuma). Run 2026-10-02 as a separate program; no line of it is
in this repository. Built by `xval/lunar-afs/build_oracles.sh` with `#define DEMO_L1`
removed (S-band 2492.028 MHz); run by `xval/lunar-afs/run_lans.sh`
(`afs_sim -t 24 -e one_node_almanac.txt iq16.bin`, default 12 MHz, default 16-bit output,
one OpenMP thread); fixture cut by `make_fixture.py`.

| file | content | SHA-256 |
|---|---|---|
| `lans_codes.txt` | the simulator's own AFS-Q primary codes (the IS-GPS-800 L1C pilot codes) for PRNs 1-210, printed by `xval/lunar-afs/lans_codes_harness.c` linked against its `afs_sim.c`; its AFS-I and tertiary records (full dump SHA-256 `5c386ba3d8181d7af654e94d9dcd61701b6e41221d62df635dfb560cfc6dea1b`) carry LSIS-only content and are not committed | `b4a6ff07346f5d9ab9e7bef8f2fbb7e77ea8261bd4c90ee86318e479374e6bc1` |
| `trace.txt` | print-only trace of the patched build (`apply_lans_trace.py`): subframe data bits, the 6000 frame symbols each time subframe 1 is rewritten, the channel state at each 0.1 s update | `4fddab676c37a2c1169821bc57b67ad141b78ec0332546a3bbf092c1e944b1ab` |
| `one_node_almanac.txt` | the PRN-02 entry of the simulator's `default_almanac.txt` | `260583859246e607047b272868c6a41157d01ec65b47e818b05a9a61e1bba446` |
| `windows.bin` | int16 little-endian I, Q: the first 2 ms (24 000 samples) of 0.1 s blocks 0, 10, ..., 230 of the simulator's IQ file | `334707adbde70d3e53bfdb8086915eef2012cb0ebf7835a7afba7dd52e682db0` |
| `iq16.sha256` | SHA-256 of the full 1 147 200 000-byte IQ file (not committed) | `04712f685dae08cce162451d9e73893ba90772c1fe8d94af8145b825ff6abb7b` |
| `full_run_results.tsv` | the data-gated whole-run comparison printed by `afs_full_run_matches_lans_afs_sim` | see file |

The simulator reads its tertiary codes from the standard's Annex 3 file, so the tertiary part
of the full dump is not independent of the LSIS Annex 3 file.
