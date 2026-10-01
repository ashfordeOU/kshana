# Provenance: lunar LLR geometry range oracle

## 1. The measurement: ILRS lunar normal points, 2024-04 to 2024-06 (`normal_points_2024/*.np2`)

- **Product:** Consolidated Laser Ranging Data (CRD) version 2 normal points for the five legacy
  lunar retroreflector arrays (Apollo 11, Apollo 14, Apollo 15, Lunokhod 1 = `luna17`,
  Lunokhod 2 = `luna21`), the monthly files for April, May and June 2024: 192 normal points from
  Grasse MeO (7845, 151), Apache Point APOLLO (7045, 32) and Matera MLRO (7941, 9).
- **Source (open, no login):** EUROLAS Data Center (EDC), DGFI-TUM, an ILRS data centre:
  `https://edc.dgfi.tum.de/pub/slr/data/npt_crd_v2/<target>/2024/<target>_2024<mm>.np2`.
  (The CRD v1 tree `npt_crd/` used for the 2015 slice ends at 2023.)
- **Retrieved:** 2026-10-01.
- **Slice:** the fifteen upstream monthly files, verbatim, byte for byte (168 kB).
  `normal_points_2024/SHA256SUMS` lists their SHA-256 digests; `generate_reference.py` refuses
  to run if any file differs.
- **Format:** R. L. Ricklefs and C. J. Moore, *Consolidated Laser Ranging Data Format (CRD)*,
  versions 1.01 and 2.01, ILRS Data Formats and Procedures Working Group,
  `https://ilrs.gsfc.nasa.gov/data_and_products/formats/crd.html`. Record 11 gives the transmit
  epoch (epoch event 2) and the two-way time of flight; record 20 the station pressure,
  temperature and humidity; record c0 the wavelength.
- **Licence and credit:** ILRS data are openly distributed under the ILRS data policy
  (`https://ilrs.gsfc.nasa.gov/data_and_products/data/policy.html`), with credit to the
  contributing stations: Observatoire de la Côte d'Azur (Grasse MeO), the Apache Point
  Observatory Lunar Laser-ranging Operation (APOLLO), Agenzia Spaziale Italiana (Matera MLRO),
  the International Laser Ranging Service and the EUROLAS Data Center. Pearlman, Noll, Pavlis et
  al., "The ILRS: approaching 20 years and planning for the future", *Journal of Geodesy* 93,
  2161-2180 (2019).

The 2015 slice the test also reads (as a finding only) is `../lunar_llr/normal_points/`, with
its own `NOTICE.md` and `SHA256SUMS`.

## 2. The derived reference (`reference.csv`)

Written by `generate_reference.py` (run 2026-10-01 with `~/Code/kshana-oracles/.venv`, spiceypy
8.2.0 / CSPICE N0067). One row per normal point of both slices:

- the CRD fields above, parsed by the generator (independently of kshana's own CRD reader);
- UT1-UTC at the transmit epoch from IERS `finals2000A.all` (Bulletin A column, linear;
  the copy fetched 2026-09-30, SHA-256
  `cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18`);
- the geocentric Moon centre at the bounce epoch, J2000 (ICRF-aligned), from JPL DE440
  (`de440s.bsp`, SHA-256 `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`)
  with `naif0012.tls` (`678e32bdb5a744117a467cd9601cd6b373f0e9bc9bbde1371d5eee39600a039b`);
- diagnostic columns only: the MOON_PA_DE440 to J2000 rotation at the bounce epoch from
  `moon_pa_de440_200625.bpc` (`60cd55aa401ea2ea97360636f567554bfe4e37bb829f901b4460a455dfaf783f`)
  and the NAIF frame kernel `moon_de440_250416.tf`
  (`a47c71e9c9f33796bdafb2c9d69a7ee447b6016ecad80f71cd6f3e479f9cf768`).

NAIF kernels are public-domain NASA/JPL data and are not redistributed here. Reproduce with
`source ~/Code/kshana-oracles/env.sh && $ORACLE_PY generate_reference.py > reference.csv`.

**Consumed by:** `tests/lunar_llr_geometry_range_oracle.rs`.

## 3. Round 2 (2026-10-01)

- `reference.csv` regenerated with two new last columns, `xp_arcsec,yp_arcsec` (IERS Bulletin A
  polar motion from the same `finals2000A.all`, linear in time). Every measurement, UT1-UTC and
  Moon column is byte-identical to the first generation; the nine diagnostic `pxform` columns
  moved by at most 3.9e-13 between the two runs (same toolkit version and kernel hashes).
- Station coordinates used by `lunar_llr_geometry::stations_itrf()` (cited in the source, not
  vendored), both retrieved 2026-10-01 without a login:
  - ITRF2020 SLR station positions and velocities, IGN:
    `https://itrf.ign.fr/ftp/pub/itrf/itrf2020/ITRF2020_SLR.SSC.txt`, SHA-256
    `d0f7afc0111eec3ccb292c496884d98c8aeafade44abdc7a475735f546809b4d` (free use with citation:
    Altamimi, Rebischung, Collilieux, Métivier and Chanard, "ITRF2020: an augmented reference
    frame refining the modeling of nonlinear station motions", Journal of Geodesy 97, 47, 2023).
    Grasse 7845 (10002S002) and Matera 7941 (12734S008).
  - ILRS SLRF2020: `https://ilrs.cddis.eosdis.nasa.gov/docs/2025/SLRF2020_POS+VEL_2025.02.05.snx`,
    SHA-256 `fd669e0a028bb12ccf01cccbbf0573cc42b89e8c35b22328fcda7296d114c3de`: the same values
    for 7845 and 7941; it does not contain APOLLO 7045.
  - APOLLO 7045 is in neither file. Its only open position is the ILRS station page's
    approximate one, 32.780361 N, 105.820417 W, 2788 m
    (`https://ilrs.gsfc.nasa.gov/network/stations/active/APOL_station_info.html`).


## 4. Round 2, third amendment (2026-10-01)

- `reference.csv` regenerated with 24 new last columns, the barycentric celestial reference
  system (BCRS) inputs of the IERS Conventions 2010 Section 11.2 light-time model, from the same
  DE440 kernel through SPICE (geometric, J2000, metres and metres per second): `tof_tdb_s` (the
  measured Terrestrial Time round trip converted to Barycentric Dynamical Time with the local
  rate of TDB - TT from `unitim`), the barycentric Earth state at transmit and at receive, the
  barycentric Moon state and the Sun position at the bounce epoch, and U/c^2 at the geocentre and
  at the selenocentre. GM values: NAIF `gm_de440.tpc` (public domain, NASA/JPL), SHA-256
  `924ddf4fb9ead9fe8a1aa55780bcabde40b09d00065d58226e24b68d8092f140`, not vendored. Every one of
  the earlier 25 columns of all 541 rows regenerated byte for byte.
- APOLLO 7045 coordinates: the operator's published geocentric coordinates, Apache Point
  Observatory APOLLO normal-point page `https://newapo.apo.nmsu.edu/mainpage/apollo/normalpoints/`,
  retrieved 2026-10-01 (HTML SHA-256
  `a097fed456e5f0ad9f2dba9c66a80f78c5b8def5a90a9a34acebd72a985f7a49`): "The geocentric (careful:
  not geodetic) coordinates for the APOLLO telescope are approximately: (6374.69213 km radius;
  32.6054889 deg latitude; 254.1795778 deg longitude)". Numbers cited, page not vendored. Also
  checked without finding an APOLLO solution: the ILRS site log `apol_20250116.log` (EUROLAS
  Data Center, SHA-256 `c3aa7a670ce041abd99e97dbd91ac31ae0afc147c2685cf137475c2285f62cf2`, the
  same approximate geodetic position, no Cartesian values), the JPL DE421, DE430 and DE440
  reports, and Pavlov, Williams and Suvorkin (2016), which fits the position and prints none.
- Light-time model: IERS Conventions 2010 (Technical Note 36) Chapter 11, `tn36_c11.pdf`,
  SHA-256 `ca147e67fd88e924b5603cea217541a53612493fa12f65bd485409ba2879ea2a`, Eqs. 11.17 and 11.19.
