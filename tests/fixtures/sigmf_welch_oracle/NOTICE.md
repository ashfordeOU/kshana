# sigmf_welch_oracle fixture

Used only by `tests/sigmf_welch_oracle.rs`; not shipped in any published package.

## What is here

- `third_party/*.sigmf-meta`, `third_party/*.sigmf-data`: five recordings written by
  sigmf-python 1.13.0 from seeded synthetic IQ (cf32_le, ci16_le and ci8; one with two capture
  segments and two annotations; one whose first capture starts at sample 100). The samples are
  synthetic; the files are the output of a tool, and no part of the tool is included.
- `kshana_written/*`: three recordings written by this crate's `sigmf::write`. The test requires
  today's output to be byte-identical to them, so the files sigmf-python read back and the
  schema validated are the ones the crate produces.
- `reference.json`: what the oracles reported. For each third-party recording: the SHA-256 of
  sigmf-python's decoded samples (little-endian f64 I, Q stream), the metadata fields
  sigmf-python wrote, and the scipy Welch PSD for nfft 64, 256, 512 at overlap 0, 0.5, 0.75. For
  each crate-written recording: the number of SigMF v1.2.6 schema errors, sigmf-python's
  `validate()` result, the SHA-256 of sigmf-python's decoded samples and the fields it read.
- `gen_sigmf_welch_oracle.py`: the generator (run order in its docstring).

## Oracles (run as tools, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| SciPy `scipy.signal.welch` | 1.18.1 | BSD-3-Clause | https://scipy.org |
| sigmf-python | 1.13.0 | LGPL-3.0 | https://github.com/sigmf/sigmf-python/archive/refs/tags/v1.13.0.tar.gz, SHA-256 119af3d9268745ef7635001c456cd91a10351725195718a9b0f71a9c4a695709 |
| SigMF specification, `sigmf-schema.json` | v1.2.6 | CC BY-SA 4.0 | https://github.com/sigmf/SigMF/archive/refs/tags/v1.2.6.tar.gz, SHA-256 2cfb7c67ec155d5a3235019020aacf99c503c8b7a28cabd6bec6d6916c6a1a18 (the schema itself is not copied here; its SHA-256 is in `reference.json`) |
| jsonschema | 4.26.0 | MIT | https://github.com/python-jsonschema/jsonschema |
| NumPy | 2.3.5 | BSD-3-Clause | https://numpy.org |

Generated 2026-10-01 with the oracle toolchain's Python 3.12.12 environment.

## Tolerances, fixed before the first comparison

Welch PSD every bin within 1e-12 relative of SciPy, bin frequencies within 1e-12 of the sample
rate, equal segment counts; decoded samples bit-identical; modelled metadata fields identical;
zero schema errors. First run (2026-10-01): all met, worst per-bin PSD difference 6.0e-14
relative over 27 cases.
