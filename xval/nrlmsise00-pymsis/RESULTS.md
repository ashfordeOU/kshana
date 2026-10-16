# Results: NRLMSISE-00 port against pymsis, the C port and the published C test output

Pre-registration: `PREREGISTRATION.md`, commit e90ae26a (alone, before the port existed).
Test: `tests/nrlmsise00_reference.rs` (`cargo test --test nrlmsise00_reference -- --nocapture`).
Port: `src/nrlmsise00.rs` + `src/nrlmsise00_data.rs`.

| # | comparison | bar | measured (worst point) | verdict |
|---|---|---|---|---|
| B1 | relative total mass density vs pymsis 0.13.0 `version=0`, 720 points | ≤ 1e-5 | 1.866e-6 | pass |
| B2 | temperature vs pymsis, 720 points | ≤ 1e-3 K | 1.971e-4 K | pass |
| B3 | relative total mass density vs the C port (20190709, double), 720 points | ≤ 1e-12 | 0 (bit-identical) | pass |
| B4 | temperature vs the C port, 720 points | ≤ 1e-9 K | 0 (bit-identical) | pass |
| B5 | 17 published C test cases × 11 values (9 densities, 2 temperatures; CGS; cases 16–17 in the ap-array mode) | ≤ 0.5 unit of the 7th significant figure | 0.496 units; every printed zero exactly 0 | pass |

Reading:

- Against the C port the kshana port is bit-identical at every grid point (density and
  temperature), so the port is faithful to the C operation order and its coefficient tables.
- Against pymsis (the NRL Fortran in single precision) the worst difference, 1.87e-6, is the
  same as the C port's own difference from pymsis measured before kshana existed (1.87e-6,
  `PREREGISTRATION.md`): it is the Fortran's single-precision floor, not a port error.
- B5 at 0.496 units is the printed rounding of the C output (the port reproduces the C
  values exactly, and the C printed them rounded to 7 figures).

Not validated here: NRLMSISE-00's own accuracy against measured thermospheric density (order
15 % 1σ by the model's authors), `GHP7` (not ported), and the propagator drag tier, whose
wiring is MODELLED (unit tests in `src/forces.rs` and `src/propagator.rs`); its orbit-level
cross-check is a separate item.
