# Pre-registration: NRLMSISE-00 port (`src/nrlmsise00.rs`) against pymsis and the C port

Committed alone, before any kshana NRLMSISE-00 output is compared with an oracle (the kshana
port does not exist yet at this commit). The bars below may later be tightened, never loosened.
A miss is recorded with its numbers in `RESULTS.md`.

## What is compared

The kshana port of NRLMSISE-00 `GTD7`/`GTD7D` (total mass density in kg/m³ and the temperature
at altitude in K), against:

1. **pymsis 0.13.0** (MIT; PyPI wheel `pymsis-0.13.0-cp313-cp313-manylinux_2_27_x86_64...whl`,
   SHA-256 `2205b194a5479ceb0f7ebd8ff17f4b0873bcd06a7fa692c08257097191220e12`), `version=0`,
   which wraps the NRL Fortran `NRLMSISE-00.FOR` (single precision `REAL`) and calls `GTD7D` with
   `METERS(.TRUE.)`, all 25 switches 1 (daily-Ap mode) and local solar time
   `utsec/3600 + lon/15`. kshana is called the same way (`gtd7d`, switches all on, daily Ap,
   the same local time).
2. **The public-domain NRLMSISE-00 C port, release 20190709** (as shipped in the PyPI sdist
   `nrlmsise00-0.1.2.tar.gz`, SHA-256
   `db963744986f560e8270f83f9a627485c12e52b199fc4cf532e91984940114fb`; `nrlmsise-00.c` SHA-256
   `a20d6523420188241963f095ad0b65df44ac0a6fa6db52d2e1df823c366f0285`), double precision,
   `gtd7d`, same switches and inputs, compiled by `xval/nrlmsise00-pymsis/gen_c_oracle.sh`.
3. **The published test-driver output of that C distribution** (its `DOCUMENTATION`, section 7,
   SHA-256 `e7db72964c22861e446d4b61931a22a58c32eeaa7f9bb23b45d887751b4ecae3`): the 17 standard
   `GTD7` cases (cases 1 to 15 daily-Ap mode, 16 and 17 the 7-element ap-array mode `sw[9] = -1`
   with every ap = 100; switch 0 off, i.e. CGS units), all nine densities and both
   temperatures, printed to 7 significant figures.

## Grid (oracles 1 and 2)

`xval/nrlmsise00-pymsis/grid.py`: 720 points, every input an integer.

- altitude 90, 100, 120, 150, 200, 300, 400, 500, 700, 1000 km;
- geodetic latitude −70, −20, 25, 65°;
- (UT s, east longitude °) = (10800, 300) and (50400, 45), local solar time 23 h and 17 h;
- day of year 1, 172, 280;
- activity (F10.7 81-day mean, F10.7 previous day, daily Ap) = low (70, 68, 4),
  moderate (150, 160, 15), high (230, 250, 80).

## Oracle floor measured before kshana exists

Oracle 2 against oracle 1 on the grid (double C against single-precision Fortran): maximum
relative total-density difference 1.87e-6 (median 3.0e-7), maximum temperature difference
2.0e-4 K. This is the single-precision floor of pymsis, so a faithful double-precision port
cannot be held tighter than it against pymsis.

## Bars

| # | comparison | quantity | bar (every point) |
|---|---|---|---|
| B1 | kshana vs pymsis (720 points) | relative total mass density `|ρ_k/ρ_p − 1|` | ≤ 1e-5 |
| B2 | kshana vs pymsis (720 points) | temperature at altitude `|T_k − T_p|` | ≤ 1e-3 K |
| B3 | kshana vs C port (720 points) | relative total mass density | ≤ 1e-12 |
| B4 | kshana vs C port (720 points) | temperature at altitude | ≤ 1e-9 K |
| B5 | kshana vs published C test output (17 cases × 11 values) | each printed value `x` with exponent `e` (`x = m·10^e`, 1 ≤ m < 10) | `|x_k − x| ≤ 0.5e-6·10^e·(1 + 1e-9)` (half a unit in the 7th significant figure); printed zeros must be exactly 0 |

B1/B2 sit about five times above the measured oracle floor. B3/B4 are double-precision
roundoff: the port follows the same operation order as the C reference.

## Out of scope here

- The opt-in drag-density tier in the propagator (MODELLED wiring; its orbit cross-check is a
  later item).
- NRLMSISE-00's accuracy against measured density (the model's own error, ~15 % 1σ, is not
  tested here); this item validates the port, not the model.
- `GHP7` (pressure-level output) is not ported.
