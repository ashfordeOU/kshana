# Pre-registration: high-degree Mars and Moon gravity read from PDS SHADR tables, against pyshtools

Committed, alone, before Kshana's acceleration is compared with the oracle at any point. It fixes
the data, the evaluation points, the oracle, the comparison and the numeric bars. Bars may later be
tightened, never loosened. A miss is recorded in `RESULTS.md` with its numbers.

## What is under test

`SphericalHarmonicField::from_shadr` (new, `src/gravity_pds.rs`): a reader for the Planetary Data
System (PDS) SHADR ASCII spherical-harmonic table, followed by the existing
`SphericalHarmonicField::acceleration` (body-fixed gravitational acceleration, central term
included). The reader converts the header's reference radius (km) and GM (km^3/s^2) to SI and sets
`C00 = 1` when the table carries no degree-0 record.

## Data (public, PDS Geosciences Node)

| field | product | file | SHA-256 of the original |
|---|---|---|---|
| Mars, d/o 120 | GMM-3 (MRO-M-RSS-5-SDP-V1.0) | `mrors_1xxx/data/shadr/gmm3_120_sha.tab` | `eb4913b1afb6682406e6a9dad5be7918a162fa8462473c9a2e7aae258d4c2c9c` |
| Moon, d/o 660 | GL0660B (GRAIL-L-LGRS-5-RDR-V1.0) | `grail_1001/shadr/jggrx_0660b_sha.tab` | `500e47e0ae2fa32d30615ea4af9ed6cca3a60e05c332d918692596a425708534` |

Two inputs per field:

* **crop**: the committed degree-20 crops `tests/fixtures/planetary_gravity/gmm3_120_sha_to20.tab`
  and `jggrx_0660b_sha_to20.tab` (transform in the NOTICE.md beside them). Ungated test.
* **full**: the original files, located by `KSHANA_GMM3_SHA` and `KSHANA_GRAIL_SHA`. Gated test
  (skips with a message when the variable is unset).

## Oracle

pyshtools 4.14.1 (BSD-3-Clause; `pip install pyshtools==4.14.1` in the oracle virtual environment,
numpy 2.3.5), an independent spherical-harmonic implementation. It reads the same SHADR file itself
(`SHGravCoeffs.from_file(path, format='shtools', header=True, errors=True, header_units='km',
r0_index=0, gm_index=1)`, which also sets `C00 = 1`), and evaluates the gravity vector at a point
with `SHGravCoeffs.expand(lat=..., lon=..., r=..., omega=0.0)` (no centrifugal term), returning the
spherical components `(g_r, g_theta, g_phi)`: radial, south (increasing colatitude) and east.
Kshana's Cartesian body-fixed acceleration is projected on the same local unit vectors at the same
geocentric latitude/longitude/radius. Fixtures are written by `gen_oracle.py` to `oracle_crop20.txt`
and `oracle_full.txt` with 17 significant digits.

## Evaluation points (body-fixed, geocentric latitude/longitude in degrees, radius r)

Mars (reference radius 3396.0 km):

| id | r | lat | lon |
|---|---|---|---|
| M1 | 3646 km (250 km above Re) | 0 | 0 |
| M2 | 3646 km | 37.5 | 137.4 |
| M3 | 3646 km | -63 | 251 |
| M4 | 3646 km | 85 | 30 |
| M5 | 3646 km | -89.5 | 200 |
| M6 | 3646 km | 89.9 | 315 |
| M7 | 20428 km (areostationary) | 0 | 290 |
| M8 | 20428 km | 45 | 75 |
| M9 | 6000 km | -20 | 160 |

Moon (reference radius 1738.0 km):

| id | r | lat | lon |
|---|---|---|---|
| L1 | 1788 km (50 km above Re) | 0 | 0 |
| L2 | 1788 km | 26.1 | 3.6 |
| L3 | 1788 km | -45 | 200 |
| L4 | 1788 km | 60 | 100 |
| L5 | 1788 km | 70 | 150 |
| L6 | 1788 km | 85 | 30 |
| L7 | 1788 km | -89.5 | 200 |
| L8 | 1788 km | 89.9 | 315 |
| L9 | 4738 km (3000 km above Re) | 10 | 290 |
| L10 | 1838 km (100 km above Re) | -60 | 60 |

## Metrics

For each point, with `g` the oracle vector and `a` Kshana's vector (both in `(r, south, east)`
components) and `g_pm = (-GM/r^2, 0, 0)` the point-mass term:

* `e_tot = |a - g| / |g|` (relative to the total gravity);
* `e_pert = |a - g| / |g - g_pm|` (relative to the non-central part, the part the field adds).

## Bars (pass = every listed point within both bars)

| case | points | `e_tot` | `e_pert` |
|---|---|---|---|
| A. crop d/o 20, Mars | M1..M9 | <= 1e-12 | <= 1e-9 |
| A. crop d/o 20, Moon | L1..L10 | <= 1e-12 | <= 1e-9 |
| B. full GMM-3 d/o 120 | M1..M9 | <= 1e-12 | <= 1e-8 |
| C. full GL0660B d/o 660 | L1, L2, L3, L4, L9, L10 (abs latitude <= 60 deg) | <= 1e-11 | <= 1e-6 |

Case C is limited to |latitude| <= 60 deg because the existing evaluator's sectoral recurrence
`P_mm ~ cos(lat)^m` is unscaled and underflows double precision at degree 660 above about 70 deg.
L5..L8 at d/o 660 are **informational**: their numbers are recorded in RESULTS.md and carry no
claim either way.

## Published-value checks (exact)

From the parsed tables, against the values printed in the PDS products:

* GMM-3: `GM = 4.2828372854187757e4 km^3/s^2` and `Re = 3396.0 km` from the header record, converted
  to SI by `x 1e9` and `x 1e3` exactly as an f64 multiplication; the PDS label's stated
  `GM = 0.4282837285418775E+05 km**3/s**2` agrees to <= 1e-15 relative; `C20` and `C22, S22` equal the
  table's records bit for bit; the full table has 7380 coefficient records (label `ROWS = 7380`).
* GL0660B: `GM = 4.9028003055554e3 km^3/s^2`, `Re = 1738.0 km` (label: "The reference radius = 1738.0
  km"); `C20 = -0.9088083466222001E-04` bit for bit; full table 218790 coefficient records
  (degrees 1..660).
* GL0660B also loads from the ICGEM `.gfc` conversion (`GL0660B.gfc`, gated by
  `KSHANA_GL0660B_GFC`): every coefficient to d/o 660 equals the SHADR reading bit for bit, and GM
  and Re agree. This checks the readers against each other; it is not an independent oracle.

## Decision rule

All of A and B pass and the published-value checks pass: the SHADR reader plus evaluator for these
fields is VALIDATED against pyshtools to degree 120 (Mars) and degree 20 (Moon, ungated). C passing
extends the Moon claim to degree 660 within |latitude| <= 60 deg. Any miss is reported with its
numbers; nothing is re-tuned. The body orientation (which frame the field is attached in) is not
part of this test: GMM-3 is referenced to the Konopliv et al. (2006) Mars frame, not the IAU frame
`mars_frame` realizes, and GL0660B to the DE421 lunar principal-axis frame. Those stay MODELLED.
