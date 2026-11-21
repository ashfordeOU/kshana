<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Teaching kit: Kshana from MATLAB, LabVIEW and Python

Three lab sheets for a course or a lab session on positioning, navigation, timing and space links,
each with worked answers and a solution script. Students call the engine from the tool their
department already uses: MATLAB, LabVIEW, or Python. All three tracks call the same C library
(`capi/kshana-capi`), so all three get the same numbers.

> **Advisory.** Everything here is analysis on shipped scenarios and synthetic or illustrative data.
> It is not type-approved navigation equipment, not a safety-of-life service, and not a finding about
> any receiver, product or standard. Evidence tier: **MODELLED**.

## The labs

| # | Lab | Students learn | Data | Time |
|---|---|---|---|---|
| 1 | [First calls](lab-1-first-calls.md) | load a C library from their tool; validate, run and read a result; check a figure by hand; handle an error | `scenarios/link-budget.toml` | 45 min |
| 2 | [Link-budget sweep](lab-2-link-budget-sweep.md) | drive the engine from a loop; the 20 dB per decade range law, the rate term, the band term; the longest range and the highest rate that close | the same scenario, edited in memory | 60 min |
| 3 | [Map a receiver log](lab-3-connect-a-log.md) | turn a vendor-style log into standard records; GPS time against UTC; units; reading C/N0, gain control and a receiver's own flags, and what they cannot prove | `examples/connect/` (synthetic) | 45 min |

Solutions are in [`solutions/`](solutions/): `labN.m` for MATLAB, `labN.py` for Python, and the
LabVIEW steps in each sheet's *Track notes*. Hand out the sheets without the *Worked answers*
section if you want to mark the answers.

**How the answers are kept true.** Each `labN.py` runs the lab on the engine, checks each worked
answer, and checks that the sheet states it. `capi/kshana-capi/tests/sdk_wrappers.rs` runs the three
scripts in the `capi-check` CI job, so a sheet cannot drift from the engine.

**What has not been run.** The MATLAB scripts and the LabVIEW steps have **not been run on the
target tools** (no MATLAB or LabVIEW licence on the CI runners). The C calls they make are replayed
with Python `ctypes` in the same CI job
([`wrapper_patterns.py`](../../capi/kshana-capi/sdk/python/wrapper_patterns.py)). If you run them,
please report what you find.

## Set up

Build the C library once (Rust toolchain needed; students can share a prebuilt copy):

```sh
cd capi/kshana-capi && cargo build --release
# target/release/libkshana_capi.so (Linux), libkshana_capi.dylib (macOS), kshana_capi.dll (Windows)
```

- **MATLAB:** a supported C compiler for `loadlibrary` (`mex -setup C`), then
  `lab1('…/libkshana_capi.so')` from `docs/teaching/solutions`. Package guide:
  [`sdk/matlab/README.md`](../../capi/kshana-capi/sdk/matlab/README.md).
- **LabVIEW:** build the VIs in [`VI-LIBRARY.md`](../../capi/kshana-capi/sdk/labview/VI-LIBRARY.md)
  from the node settings in [`sdk/labview/README.md`](../../capi/kshana-capi/sdk/labview/README.md).
  Worth building once before the session: it is a good exercise in itself for an instrumentation
  course.
- **Python:** `python3 -I docs/teaching/solutions/lab1.py …/libkshana_capi.so` (standard library
  only). Without a Rust toolchain, `pip install kshana` gives `kshana.run` and `kshana.connect_map`
  with the same results; it has no validate call, so lab 1 exercise 1 needs the C library.

## More material

- [Tutorials](../tutorials/README.md): three longer worked examples (an orbit, clock holdover,
  quantum against classical resilience), each pinned by a test.
- [Course notebooks](../../notebooks/course/README.md): six Jupyter notebooks (jamming, spoofing,
  holdover, integrity, OSNMA, interference map), each ending with exercises.
- [Academic use](../ACADEMIC.md): using Kshana in teaching and research, citing it, and reproducing
  a result.

Licence of this kit: AGPL-3.0-only, like the rest of the repository; the sheets may be copied and
adapted for teaching under that licence.
