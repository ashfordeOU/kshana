# Results: PDS SHADR gravity (GMM-3, GL0660B) against pyshtools

Pre-registration: `PREREGISTRATION.md`, commit 32c5b50 (committed alone, before any comparison).
Run 2026-10-12, `cargo test --test planetary_gravity_pds -- --include-ignored --nocapture`, with
`KSHANA_GMM3_SHA`, `KSHANA_GRAIL_SHA` and `KSHANA_GL0660B_GFC` set to the files fetched by
`fetch_data.sh` (SHA-256 verified). Oracle: pyshtools 4.14.1, numpy 2.3.5
(`tests/fixtures/planetary_gravity/oracle_crop20.txt`, `oracle_full.txt`, from `gen_oracle.py`).

`e_tot = |a - g| / |g|`, `e_pert = |a - g| / |g - g_pm|` (see the pre-registration).

## Verdict

| case | points | bars (`e_tot`, `e_pert`) | worst `e_tot` | worst `e_pert` | verdict |
|---|---|---|---|---|---|
| A. crop d/o 20, Mars | M1..M9 | 1e-12, 1e-9 | 9.7e-16 (M4) | 6.3e-12 (M7) | PASS |
| A. crop d/o 20, Moon | L1..L10 | 1e-12, 1e-9 | 8.7e-16 (L1) | 3.4e-11 (L9) | PASS |
| B. full GMM-3 d/o 120 | M1..M9 | 1e-12, 1e-8 | 3.7e-15 (M9) | 6.3e-12 (M7) | PASS |
| C. full GL0660B d/o 660, abs lat <= 60 | L1..L4, L9, L10 | 1e-11, 1e-6 | 5.0e-14 (L2) | 1.0e-10 (L2) | PASS |

Published-value checks: PASS. GMM-3 GM/Re equal the header record exactly (and the label's GM to
<= 1e-15), 7380 records, degree/order 120; GL0660B GM/Re exact, `C20 = -0.9088083466222001E-04`
bit for bit, 218790 records, degree/order 660; selected `C`, `S` records bit for bit in both.
ICGEM `GL0660B.gfc` read by `from_gfc` equals the SHADR reading coefficient for coefficient to
d/o 660, with the same GM and radius (a reader cross-check, not an oracle; ICGEM's header labels this
file's `modelname` as `GRGM660PRIM`, but its GM 4.9028003055554e12 and coefficients are GL0660B's).

## Every point

```
A GMM-3 d/o 20    M1  e_tot=8.251e-16  e_pert=3.582e-13
A GMM-3 d/o 20    M2  e_tot=1.945e-16  e_pert=7.997e-14
A GMM-3 d/o 20    M3  e_tot=5.540e-16  e_pert=1.337e-13
A GMM-3 d/o 20    M4  e_tot=9.698e-16  e_pert=1.918e-13
A GMM-3 d/o 20    M5  e_tot=2.967e-16  e_pert=6.105e-14
A GMM-3 d/o 20    M6  e_tot=7.032e-16  e_pert=1.377e-13
A GMM-3 d/o 20    M7  e_tot=5.454e-16  e_pert=6.267e-12
A GMM-3 d/o 20    M8  e_tot=4.142e-16  e_pert=4.527e-12
A GMM-3 d/o 20    M9  e_tot=1.920e-16  e_pert=2.610e-13
A GL0660B d/o 20  L1  e_tot=8.683e-16  e_pert=1.671e-12
A GL0660B d/o 20  L2  e_tot=3.128e-16  e_pert=6.594e-13
A GL0660B d/o 20  L3  e_tot=1.393e-17  e_pert=2.212e-14
A GL0660B d/o 20  L4  e_tot=4.426e-16  e_pert=6.309e-13
A GL0660B d/o 20  L5  e_tot=7.239e-17  e_pert=9.985e-14
A GL0660B d/o 20  L6  e_tot=1.449e-16  e_pert=2.828e-13
A GL0660B d/o 20  L7  e_tot=4.421e-16  e_pert=9.074e-13
A GL0660B d/o 20  L8  e_tot=6.644e-16  e_pert=1.016e-12
A GL0660B d/o 20  L9  e_tot=6.362e-16  e_pert=3.396e-11
A GL0660B d/o 20  L10 e_tot=4.618e-16  e_pert=1.210e-12
B GMM-3 d/o 120   M1  e_tot=1.100e-15  e_pert=4.766e-13
B GMM-3 d/o 120   M2  e_tot=2.758e-15  e_pert=1.137e-12
B GMM-3 d/o 120   M3  e_tot=3.459e-15  e_pert=8.365e-13
B GMM-3 d/o 120   M4  e_tot=3.186e-15  e_pert=6.291e-13
B GMM-3 d/o 120   M5  e_tot=5.634e-16  e_pert=1.160e-13
B GMM-3 d/o 120   M6  e_tot=7.688e-16  e_pert=1.509e-13
B GMM-3 d/o 120   M7  e_tot=5.454e-16  e_pert=6.267e-12
B GMM-3 d/o 120   M8  e_tot=4.142e-16  e_pert=4.527e-12
B GMM-3 d/o 120   M9  e_tot=3.732e-15  e_pert=5.073e-12
C GL0660B d/o 660 L1  e_tot=1.186e-14  e_pert=1.645e-11
C GL0660B d/o 660 L2  e_tot=5.038e-14  e_pert=1.045e-10
C GL0660B d/o 660 L3  e_tot=6.662e-15  e_pert=1.159e-11
C GL0660B d/o 660 L4  e_tot=7.389e-15  e_pert=1.042e-11
C GL0660B d/o 660 L9  e_tot=1.146e-15  e_pert=6.117e-11
C GL0660B d/o 660 L10 e_tot=3.827e-15  e_pert=1.022e-11
```

## Informational (no claim; outside the pre-registered latitude band)

```
C-info GL0660B d/o 660  L5 lat=70.0   e_tot=7.968e-15  e_pert=1.409e-11
C-info GL0660B d/o 660  L6 lat=85.0   e_tot=1.173e-14  e_pert=2.347e-11
C-info GL0660B d/o 660  L7 lat=-89.5  e_tot=3.188e-15  e_pert=8.921e-12
C-info GL0660B d/o 660  L8 lat=89.9   e_tot=4.120e-15  e_pert=6.447e-12
```

At these four points the existing evaluator also agrees with pyshtools. The sectoral terms that
underflow there are themselves below double precision at 50 km altitude, so the underflow costs
nothing at these points. That is an observation at four points, not a claim for every high-latitude
point or every altitude. The underflow-safe evaluator (`acceleration_hf`, on another branch) is the
route for degree 660 at high latitude.

## Not covered

- The frame the field is attached in. GMM-3 uses the Konopliv et al. (2006) Mars frame and GL0660B
  the DE421 lunar principal-axis frame. `Body::with_gravity_field` evaluates the field in the
  body's IAU frame (`mars_frame`). The offset between them is not modelled, so this part stays
  MODELLED.
- Orbits propagated through these fields. No orbit-level oracle is compared here.
- Coefficient uncertainties: they are read past and not used.
