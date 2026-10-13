# Pre-registration: real gravity reference field (WP-10, RM-17)

Committed alone, before any ICGEM grid is fetched and before the real-field scenario below
is run for the first time. The bars are not loosened after the run. A miss is recorded with
its numbers and pinned by a test that asserts it.

There are two comparisons. Part A checks Kshana's gravity-anomaly synthesis against an
external service. Part B is a benchmark outcome on the real field: it has no external oracle
and can never be VALIDATED.

## Part A: anomaly synthesis against ICGEM

**Under test:** `SphericalHarmonicField::gravity_anomaly_sa_parallel_mgal`
(`src/gravity_sh.rs`): Barthelmes, STR09/02, eq. 126 with eq. 111 rescaling. It runs on the
bundled EGM2008 coefficients truncated to degree and order 70
(`SphericalHarmonicField::egm2008_truncated(70)`), with the WGS84 level ellipsoid
(`WGS84_ELLIPSOID`), the zero-degree term on, at ellipsoidal height 0. Each node's geodetic
latitude and longitude come from the oracle file.

**Oracle (external):** the ICGEM Calculation Service (GFZ, `icgem.gfz.de/calcsrvgrid`). It is
an independent implementation. The grids are requested by `tools/fetch_icgem_grid.sh` with
these settings:

| setting | value |
|---|---|
| model | EGM2008 (longtime), `trunc_gentle = trunc_max = 70` (no filter) |
| functional | `gravity_anomaly_sa` |
| reference system | WGS84 |
| tide system | `unmodified`, i.e. the model's own (EGM2008 is tide-free) |
| zero-degree term | on |
| grid height | 0 m |
| grid step | 0.25 deg |
| region C (Chad) | 9..15 N, 19..25 E (25 x 25 = 625 nodes) |
| region D (Death Valley) | 35..38 N, 242..245 E (13 x 13 = 169 nodes) |

The service output has no explicit licence, so the grids are not vendored. They are fetched
to the git-ignored `tools/icgem/`. The SHA-256 of each grid's numeric body (the
latitude/longitude/value rows, header excluded because it carries job metadata) is pinned in
the test at the first fetch. The test is `#[ignore]`-gated on the fetched files.

**Bars (per region, over every node):**

- A1: RMS of (Kshana - ICGEM) <= 0.005 mGal
- A2: max |Kshana - ICGEM| <= 0.02 mGal

If the GDF prints fewer decimals than these bars resolve, the rounding half-unit is reported
next to the result. The bars do not change.

**Decision:** both bars met in both regions means the ledger may cite the synthesis as
checked against ICGEM (an external oracle). Any miss is recorded with the region, the worst
node and the RMS, and is pinned by a test that asserts the recorded miss.

## Part B: the 60-minute GPS-denied benchmark on the real field

**Scenario (new, bundled):** `scenarios/gps-denied-gravity-nav-egm2008.toml`. It is
`scenarios/gps-denied-gravity-nav.toml` with every parameter unchanged (track, 90 waypoints,
drift 0.5 / -0.4 deg, gravimeter ASD and averaging, `map_sigma_mgal = 2.0`, search and
refinement, `noise_seed = 1`), except that the synthetic `coeffs` and `mascons` are removed
and the field is
`[reference] model = "egm2008", nmax = 70, ellipsoid = "wgs84", zero_degree = true,
grid_step_deg = 0.02`. The stored map equals the truth, so there is no map error.

**Bars:**

- B1: `map_matched_error_m` < 500 m (the GPS-denied target that the synthetic benchmark
  meets with 144 m).
- B2: `map_matched_error_m` < `free_inertial_drift_m` / 10 (a tenfold cut on the about 70 km
  drift).

**Prediction (stated before the run):** at degree 70 the shortest resolved half-wavelength
is about 285 km. The field over the box is smooth compared with the synthetic mascons, which
have a sigma of about 30 km. So the drift is expected to be only weakly observable. B1 is
expected NOT MET. B2 is uncertain.

**Decision:** the outcome is recorded as it falls. It is pinned by a unit test that asserts
the recorded value's side of each bar (MET or NOT MET). Its ledger status is Modelled, never
Validated: the field is real but the navigation outcome has no external oracle.
