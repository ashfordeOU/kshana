<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Academic use: teaching and research with Kshana

This page is for students, teachers and researchers. It says how to get the engine, which teaching
material exists, and how to cite and reproduce a result. It sets no terms of its own: the licence is
in [`LICENSE`](../LICENSE) and explained in [`LICENSING.md`](../LICENSING.md).

## Access

The open engine is published under the GNU AGPL-3.0-only, which [`LICENSING.md`](../LICENSING.md)
describes as the right choice for academic work, research and teaching. There is no sign-up, no
account and no licence key: every route below installs the same engine.

| You use | Route | Guide |
|---|---|---|
| a terminal | `cargo install kshana`, then `kshana <scenario.toml>` | [`README.md`](../README.md) |
| Python, Jupyter | `pip install kshana` | [`PYTHON_API.md`](PYTHON_API.md) |
| JavaScript, a browser | `npm install kshana` (WebAssembly) | [`SDK.md`](SDK.md) |
| MATLAB | the `+kshana` package over the C library | [`capi/kshana-capi/sdk/matlab/`](../capi/kshana-capi/sdk/matlab/README.md) |
| LabVIEW | Call Library Function Nodes, a VI library described in text | [`capi/kshana-capi/sdk/labview/`](../capi/kshana-capi/sdk/labview/README.md) |
| C, C++, Go, Java, .NET, Julia | the C library `capi/kshana-capi` | [`capi/kshana-capi/sdk/`](../capi/kshana-capi/sdk/README.md) |

The MATLAB package and the LabVIEW guide have not been run on MATLAB or LabVIEW (no licences on the
CI runners); their C calls are replayed in CI with Python `ctypes`. Reports from anyone who runs them
are welcome.

## Teaching material

| Material | Level | Where |
|---|---|---|
| Teaching kit: three lab sheets with worked answers, for MATLAB, LabVIEW and Python | first calls to a parameter sweep and a receiver log | [`teaching/`](teaching/README.md) |
| Tutorials: an orbit, clock holdover, quantum against classical resilience | beginner to intermediate | [`tutorials/`](tutorials/README.md) |
| Course notebooks: jamming, spoofing, holdover, integrity, OSNMA, interference map | intermediate | [`notebooks/course/`](../notebooks/course/README.md) |
| Concepts primer and glossary | background | [`CONCEPTS.md`](CONCEPTS.md), [`GLOSSARY.md`](GLOSSARY.md) |

All of it runs on shipped scenarios and synthetic or illustrative data, offline from a clone. The
answers in the lab sheets, the tutorials and the notebooks are checked against the engine by tests,
so they move with the engine rather than going stale.

## Research

**Cite the version you used**, with the scenario and the seed. [`CITATION.cff`](../CITATION.cff)
holds the metadata (GitHub shows a "Cite this repository" button from it), and every release is
archived on Zenodo under the concept DOI
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627). The README's
[Cite](../README.md#cite) section gives the reference and the papers built on the engine.

**Make it reproducible.** The engine has no unseeded randomness: the same scenario and seed on the
same version give the same result document. Every command-line run writes a reproducibility record
(engine version, SHA-256 of the scenario and of the result, seed, platform, command) into its report.
What is guaranteed across platforms, and what is not, is in [`REPRODUCIBILITY.md`](REPRODUCIBILITY.md).
Publish the scenario file with the paper.

**Say what the evidence is.** Results carry evidence labels: MODELLED for a model run from stated
inputs, VALIDATED only where a test compares the model with an independent reference
([`VALIDATION.md`](VALIDATION.md), [`MODELLED-RATIONALE.md`](MODELLED-RATIONALE.md)). Keep the label
when you quote a number. Kshana is a research and engineering tool, not type-approved navigation or
timing equipment, and a modelled result is not a finding about any product or standard.

## Student projects and contributions

Theses, course projects and contributions are welcome. [`CONTRIBUTING.md`](../CONTRIBUTING.md) says
how to propose a change; [`ROADMAP.md`](../ROADMAP.md) lists open work. A new scenario, a new
oracle test against a published reference, a further language wrapper over the C interface, or a
lab sheet in the style of [`teaching/`](teaching/README.md) are all good first pieces.

## Questions

For a use the AGPL does not fit (for example a closed-source product built on the engine), read
[`LICENSING.md`](../LICENSING.md), which also gives the contact address. This page changes nothing in
either licence.
