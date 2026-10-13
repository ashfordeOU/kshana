# Results: SPK writer (types 9 and 13) and reader against the NAIF SPICE Toolkit

Pre-registration: `PREREGISTRATION.md` (5059fd2a), committed alone before any comparison. The
writer, reader, OEM export and test were committed in a189d6b7 before SPICE read any
Kshana-written kernel or wrote its own. Judged by `tests/spk_writer_spice_oracle.rs`.

Oracle: CSPICE N0067 through spiceypy 8.3.0, leapseconds kernel `naif0012.tls`
(SHA-256 678e32bd...600a039b, fetched from NAIF; not committed). Run on 2026-10-13.

## Reproduce

```sh
python3 -m venv /tmp/spk && /tmp/spk/bin/pip install spiceypy==8.3.0
D=tests/fixtures/spk_writer_spice_oracle
python3 -I $D/generate.py inputs $D                       # seeded inputs (already committed)
KSHANA_XVAL_WRITE=1 cargo test --release --test spk_writer_spice_oracle kshana_kernels_hash
NAIF_LSK=/path/to/naif0012.tls /tmp/spk/bin/python -I $D/generate.py oracle $D
cargo test --release --test spk_writer_spice_oracle -- --nocapture
```

## Outcome (first comparison run): every leg MET

| Leg | Result |
|---|---|
| W1 inventory (`spkobj`, `spkcov`, every descriptor and name) of F1-F4 | exact |
| W2 SPICE `spkpvn`/`spkgeo` vs Kshana on Kshana files (5 516 epochs, plus 690 chain evaluations) | bit-identical (worst |d|/bar = 0) |
| W3 SPICE at every node vs the inputs | inside the bar (worst 0.022 of it) |
| R1 Kshana on SPICE-written files vs SPICE | bit-identical (worst 0) |
| B1 data words and summary records | bit-identical |
| B2 whole files | identical: 0 differing bytes in F1-F4 (not even in the allowed name/comment record tails) |
| T1 OEM epoch to ET vs `str2et` (72 lines, UTC with a leap-second line, TDB) | worst 6.0e-8 s (bar 1e-6 s) |
| T2 SPICE on the OEM export at the SPICE ETs vs the OEM states | worst 0.060 of the bar |
| T3 inventory of the OEM export | exact |

Mutation checks (planned in the pre-registration), each turning the test red and then reverted:
(1) odd-window tie rule `<` to `<=`: 2 tests fail; (2) bracketing index off by one: 2 fail;
(3) the Hermite slope difference term dropped: 2 fail; (4) the epoch directory omitted: 4 fail.

## Notes on the run

* `str2et` rejects a time-system token after the ISO "T" form; the generator passes the same
  calendar epoch with a blank separator (`2016-12-31 23:59:60.500 UTC`), which is the call the
  pre-registration names. The first oracle run stopped on this before writing any output, as
  did a JSON serialisation of raw summaries; neither touched a compared value.
* Readings of the pre-registration's table that it left open (per-segment Kepler elements, the
  F1 S3 start window, the F3 degree cycle, the OEM leap-second line) are fixed in the
  generator's docstring, committed in 8617323a before any SPICE call.
* Inputs are synthetic Kepler arcs with noise; nothing is claimed about physical accuracy.
* The writer refuses comments that need more than the reserved records (SPICE would move the
  arrays then, writing uninitialised bytes that no other writer can reproduce).
