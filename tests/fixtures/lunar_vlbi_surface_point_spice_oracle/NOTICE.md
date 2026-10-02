# Provenance: lunar VLBI surface-point covariance, kernel path, SPICE oracle

Fixture of `tests/lunar_vlbi_surface_point_spice_oracle.rs`, generated on 2026-10-02 after that
comparison was pre-registered (commit 4a51256).

- `inputs.json`: written by the test file's ignored emitter `zzz_emit_inputs`: the stated
  scenario inputs, the engine's 16 observations and its 16 x 3 beacon Jacobian and weights, and
  the kernel the engine read (`tests/fixtures/lunar_vlbi_anise_oracle/kernels/de440s_2024-01-01.bsp`,
  SHA-256 `8f7986fcc8e2987c9d94efa86e02a2a578631b2cb939d497a395f1c58c3b739e`). Engine output,
  used only by the P2 leg; the strict test asserts the engine still builds it.
- `reference.json`: the output of `gen_reference.py inputs.json`, run once:
  - NAIF SPICE Toolkit CSPICE N0067 through spiceypy 8.2.0 (MIT licence), run as a separate
    program; NumPy 2.3.5 and SciPy 1.18.1 (BSD-3-Clause), Python 3.12.3.
  - It imports the light-time, Jacobian-row and analysis functions of
    `tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py` (oracle code calling only
    SPICE and NumPy/SciPy).
  - Kernels (United States government work, public; retrieved 2026-10-02 from
    `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/`, not redistributed), SHA-256 also in
    the reference header: `naif0012.tls` `678e32bd...`, `de440s.bsp` `c1c7feea...`,
    `earth_latest_high_prec.bpc` `54cdfdd1db54250bb60df84dd56b89c5b102dcd2fe31d7c0c26e60ec2ef8fda0`
    (this file is updated in place upstream; the copy used is the 2026-10-02 one),
    `moon_pa_de440_200625.bpc` `60cd55aa...`, `moon_de440_250416.tf` `a47c71e9...`.
- `gen_reference.py`: the generator.
- SHA-256 of the committed files: `gen_reference.py`
  `af04c077ac9443561d21eee47d54f992b3bc3c7114b249ff3bc1c25630c65919`, `inputs.json`
  `44370726e8c651e4e303d1380b07e9b6a0607368ae8f0015f7aa639e97fd2e58`, `reference.json`
  `8e56eccedf8cd84d4b9cd676c94c9301da6e92bf150dac8b1283cbb0ea4c57ed`.
- **Reproduce:** `cargo test --test lunar_vlbi_surface_point_spice_oracle zzz_emit_inputs --
  --ignored`, then with the kernels in `$KSHANA_ORACLES/data/naif`:
  `cd tests/fixtures/lunar_vlbi_surface_point_spice_oracle && $ORACLE_PY gen_reference.py
  inputs.json > reference.json`.
