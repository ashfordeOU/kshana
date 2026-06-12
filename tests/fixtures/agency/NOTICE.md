# Agency ephemeris-fitting validation fixtures — provenance & checksums

These are small, verbatim slices of openly-published agency data products,
vendored so the force-model validation by ephemeris fitting runs reproducibly in CI
with no network access or login. The full-arc online fetch runs under a separate
`workflow_dispatch` job. Every residual reported in `docs/AGENCY-ORBIT-VALIDATION.md`
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

## Swarm-A LEO (W4a)

### `swarm/SW_OPER_SP3ACOM_2_L47_2022001_3h.sp3`
- **Product:** `SW_OPER_SP3ACOM_2__20211231T235942_20220101T235942_0201.ZIP` →
  `…_0201.sp3` — ESA Swarm Level-2 **reduced-dynamic precise science orbit**
  (`RDOD_AR`, GPS-derived, ITRF / IGb14, 10-second sampling), satellite
  **Swarm-A** (SP3 id `L47`). Center-of-mass position in the Earth-fixed frame;
  processed by TU Delft for ESA. The product header states ~2 cm orbit accuracy.
- **Source (open, no login):** ESA Swarm dissemination server,
  `https://swarm-diss.eo.esa.int/` →
  `swarm/Level2daily/Latest_baselines/POD/RD/Sat_A/` (the `?do=download&file=…`
  endpoint behind the file browser). Access is governed by the ESA Data Policy
  and the Terms & Conditions for the use of ESA Data (open, attribution).
- **Slice:** epochs `2022-01-01 00:00:00` through `03:00:00` GPS time,
  down-sampled 10 s → 60 s (181 records, 3 h, ~1.94 revolutions at the ~94-min
  Swarm-A period). Other epochs removed; the original SP3 header is retained
  (its epoch count updated to 181). Same UTC day as the Galileo fixture, so the
  `eop/finals2000A_2022001.txt` series above also covers this arc.
- **SHA-256:** `6cd84b78c32eb30fc527194a4fd9d9b1a34b17cc028aeb43db6a19c09acb733e`

## LRO lunar (W4b — truth foundation)

### `lro/LRO_2022001_Moon_ICRF_4h.csv`
- **Product:** NASA/JPL reconstructed trajectory of the **Lunar Reconnaissance Orbiter**
  (NAIF id **−85**, `LRO_merged`), as geometric Moon-centered state vectors.
- **Source (open, no login):** JPL Horizons API (NASA/JPL Solar System Dynamics),
  `https://ssd.jpl.nasa.gov/api/horizons.api` — `COMMAND='-85'`, `CENTER='@301'`
  (Moon body center), `REF_PLANE=FRAME`, `REF_SYSTEM=ICRF`, `EPHEM_TYPE=VECTORS`,
  `VEC_TABLE=2`, `OUT_UNITS=KM-S`. Geometric states (no aberration/light-time).
- **Slice:** 2022-01-01 00:00..04:00 **TDB**, 1-minute step (241 epochs, ~2 revolutions at
  the ~118-min, ~98-km orbit). Columns `JDTDB,X,Y,Z(km),VX,VY,VZ(km/s)`; frame is
  Moon-centered inertial, ICRF (= J2000 to ~0.02″). Using Horizons text vectors avoids any
  SPK/SPICE reader dependency — the same definitive reconstructed orbit, in a usable frame.
- **SHA-256:** `574e35180b0961a411f0b33de65719af6665386a9b89ffcdf7326bd478d100f0`

### `lro/GRGM660PRIM_to150.gfc`
- **Product:** `GRGM660PRIM` — the NASA GSFC GRAIL primary-mission lunar gravity field
  (degree/order 660, fully-normalized spherical harmonics; reference radius 1738.0 km;
  `GM = 4.902799806931690e12 m³/s²`; tide-free; the body-fixed coordinate system is the
  DE421 lunar **principal-axis (PA)** frame). Derived from the entire nominal GRAIL mission
  (2012-03-01 .. 2012-05-29). Konopliv et al., *The JPL lunar gravity field to spherical
  harmonic degree 660 from the GRAIL Primary Mission*, JGR Planets 118 (2013).
- **Source (open, no login):** ICGEM (GFZ Potsdam) celestial-models archive,
  `http://icgem.gfz-potsdam.de/tom_celestial` →
  `getmodel/gfc/.../GRGM660PRIM.gfc` (ICGEM-format conversion, F. Barthelmes, 2013).
- **Slice:** the verbatim ICGEM header (with `max_degree` updated to reflect the truncation)
  plus every `gfc` coefficient line of degree **n ≤ 150** (11 476 coefficients); higher
  degrees removed and trailing padding whitespace stripped — no coefficient value altered.
  Degree 150 is ample for a ~98 km-altitude lunar orbit over a few-revolution arc; the
  truncated high-degree (mascon) tail is a documented residual the empirical tier absorbs.
- **SHA-256:** `0ff04184adf4884e8fc1d42b56eabf9112ff355e7720098c3263be6f029977ae`

## Licensing

IERS, IGS/MGEX/ESOC, ESA Swarm, NASA/JPL Horizons, and the NASA GSFC GRAIL gravity
products (GRGM660PRIM, distributed via ICGEM/GFZ Potsdam) are published for open
scientific use with attribution (the Swarm products under the ESA Data Policy and
Terms & Conditions for the use of ESA Data). These verbatim slices are
redistributed solely to make Kshana's force-model validation by ephemeris fitting
independently reproducible; all credit for the underlying products remains with
IERS, the IGS, ESA/ESOC, the ESA Swarm mission (TU Delft processing), NASA/JPL
Solar System Dynamics (Horizons / the LRO project), and the NASA GRAIL mission
(GSFC gravity field, Konopliv et al. 2013; ICGEM distribution).
