# Agency precise-orbit validation fixtures — provenance & checksums

These are small, verbatim slices of openly-published agency data products,
vendored so the precise-orbit-determination validation runs reproducibly in CI
with no network access or login. The full-arc online fetch runs under a separate
`workflow_dispatch` job. Every residual reported in `docs/REFERENCE-GRADE-OD.md`
is tied to the exact bytes below by SHA-256.

## Galileo MEO (W3)

### `galileo/ESA0MGNFIN_E11_2022001_8h.sp3`
- **Product:** `ESA0MGNFIN_20220010000_01D_05M_ORB.SP3` — ESA/ESOC final
  multi-GNSS precise orbits, ITRF, 5-minute sampling.
- **Source (open, no login):** ESA Navigation Office GNSS product mirror,
  `http://navigation-office.esa.int/products/gnss-products/2190/`
  (GPS week 2190; CDDIS MGEX is the login-gated exact-named equivalent).
- **Slice:** satellite **E11** (GSAT0101, Galileo IOV, nominal MEO orbit),
  epochs `2022-01-01 00:00:00` through `08:00:00` GPS time (97 records, 8 h,
  ~0.57 revolution). Other satellites and epochs removed; the original SP3
  header is retained unmodified as metadata.
- **SHA-256:** `e7297f4ce6ca21bcc37fc858067261f4b2e3026b57a30d2b1e2f69977d3a24a3`

### `eop/finals2000A_2022001.txt`
- **Product:** IERS `finals2000A.all` (`finals.all.iau2000.txt`), Bulletin A
  FINAL values (flag `I`) — UT1−UTC and the polar-motion pole (xₚ, yₚ).
- **Source (open, no login):** IERS Data Centre,
  `https://datacenter.iers.org/data/9/finals2000A.all`.
- **Slice:** MJD 59578..59582 (2021-12-30 .. 2022-01-03), verbatim, bracketing
  the E11 arc (which crosses UTC midnight) for per-epoch interpolation. FINAL
  values for past dates never change.
- **SHA-256:** `6b781d3619550a4a404806f0ce6074a8516ea9ba18ddf111ac23f0e2cb2ed00f`

## Licensing

IERS and IGS/MGEX/ESOC products are published for open scientific use with
attribution. These verbatim slices are redistributed solely to make Kshana's
orbit-determination validation independently reproducible; all credit for the
underlying products remains with IERS, the IGS, and ESA/ESOC.
