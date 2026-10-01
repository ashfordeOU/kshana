# Fixture: B-plane oracle (General Mission Analysis Tool)

Used by `tests/bplane_gmat_oracle.rs`.

| File | Content | SHA-256 |
|---|---|---|
| `states.txt` | 192 hyperbolic Earth-centred Cartesian states (km, km/s), written by `make_fixture.py` from a grid of elements | 71f36a781f9801027f67116e8eed22b2988a1b7e5d245fcab295380e2c145ae4 |
| `bplane_grid.script` | the GMAT input script `make_fixture.py` wrote (one spacecraft per state, one statement per line) | 14df92f0681fff150762ea8eedb3d1bb011feac48e6391aeceaa0829556b6b29 |
| `gmat_bplane_report.txt` | GMAT's printed BdotT, BdotR, BVectorMag (km) and IncomingRHA/DHA, OutgoingRHA/DHA (deg) in EarthMJ2000Eq, 16 significant digits | 985fe20fb3e1a49ceec943bb42734f6ae0229d48c790e98c1d9036f3daaa0d73 |
| `make_fixture.py` | generator: builds the grid, writes the script, runs GMAT headless | (this repository) |

Oracle: NASA General Mission Analysis Tool (GMAT) R2026a, console build of 30 March 2026
(`GmatConsole-R2026a`, SHA-256 f7cf5b3188902353ed4245bb21c22c1afa0451efdd221b7e19f6a74dc7ed1d93),
Apache License 2.0, https://sourceforge.net/projects/gmat/. Run as a separate program; no GMAT
source or binary is vendored, only the numbers it printed. Generated 2026-10-01.

Regenerate: `source ~/Code/kshana-oracles/env.sh && python3 tests/fixtures/bplane_gmat_oracle/make_fixture.py`
(the state grid is deterministic; GMAT's output is reproducible bit for bit on the same build).
