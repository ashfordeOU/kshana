# Provenance: lunar VLBI ANISE oracle

`anise_delays.csv` is the output of `xval/anise-lunar-od/src/bin/lunar_vlbi_oracle.rs`, run once
on 2026-10-01. It holds, for 25 hourly epochs of 2024-01-01 UTC and three Earth baselines, the
two converged light times from a lunar-surface beacon, their difference (the near-field VLBI
delay), and the central-difference partial of that delay with respect to the beacon position.

- **Tool:** ANISE 0.10.1, `https://github.com/nyx-space/anise`, MPL-2.0. Run as a separate,
  workspace-excluded crate; nothing from it is linked into or copied into kshana.
- **Kernels** (public-domain NASA/JPL data, read from `~/Code/kshana-oracles/data/naif/`, not
  redistributed; SHA-256 also in the CSV header):
  - `de440s.bsp`, `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp`,
    `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`
  - `moon_pa_de440_200625.bpc`,
    `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/moon_pa_de440_200625.bpc`,
    `60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f`
  - `earth_latest_high_prec.bpc` (the copy fetched 2026-09-30; upstream changes in place),
    `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/earth_latest_high_prec.bpc`,
    `df5510d1995ec56af62c2682affc38781e3aa4fda37722d2fa0a10e531b90b1d`
- **UT1-UTC** (column `dut1_s`): IERS `finals2000A.all`, Bulletin A column, linearly interpolated
  (copy fetched 2026-09-30, SHA-256
  `cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18`). It is an input to
  Kshana's Earth-rotation chain only; ANISE uses its own Earth orientation kernel.
- **Inputs** (in the generator and the CSV header): stations Goldstone (40.4256, -116.8893,
  1000 m), Canberra (-35.4014, 148.9819, 688 m), Madrid (40.4314, -4.2481, 830 m), WGS-84;
  beacon at selenographic (0, 0, 0) on a 1737.4 km sphere, placed in MOON_PA_DE440.
- **Reproduce:** `source ~/Code/kshana-oracles/env.sh`, then in `xval/anise-lunar-od`:
  `cargo run --release --bin lunar_vlbi_oracle > ../../tests/fixtures/lunar_vlbi_anise_oracle/anise_delays.csv`.
- **Consumed by:** `tests/lunar_vlbi_anise_oracle.rs`.
