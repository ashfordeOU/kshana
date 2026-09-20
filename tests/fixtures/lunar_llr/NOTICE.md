# Lunar laser ranging fixtures — provenance & checksums

These are the files the `lunar-llr-datum` scenario reads. They exist so the lunar frame
datum — the seven-parameter Helmert covariance `kshana::lunar_frame_campaign` publishes from
a *simulated* observing campaign — can be recomputed from an observing campaign that
actually happened, and so a reader can tell which links of the chain are measured and which
are still modelled without taking anyone's word for it.

Every number in every file here comes from one of exactly four places, each recorded below
with a URL, a retrieval date and a SHA-256, and each regenerable by a committed generator
that verifies its source before it writes anything. Nothing is transcribed from memory and
nothing is interpolated from a description.

## 1. The measurement — ILRS lunar normal points (`normal_points/*.npt`)

- **Product:** Consolidated Laser Ranging Data (CRD) **normal points** for the five lunar
  retroreflector arrays, 2015-04 .. 2015-06 — 349 normal points, from three stations, to
  five targets. A normal point is a genuinely measured quantity: the round-trip time of
  flight of the photons that came back from a corner-cube array on the Moon, compressed over
  a short bin, with the bin's own scatter and return count archived beside it.
- **Source (open, no login):** EUROLAS Data Center (EDC), DGFI-TUM — one of the two ILRS
  data centres.
  `https://edc.dgfi.tum.de/pub/slr/data/npt_crd/<target>/2015/<target>_2015<mm>.npt`
  for `<target>` in `apollo11`, `apollo14`, `apollo15`, `luna17` (Lunokhod 1), `luna21`
  (Lunokhod 2) and `<mm>` in `04`, `05`, `06`.
- **Retrieved:** 2026-09-20
- **Slice:** the upstream monthly files, **verbatim, byte for byte**. No record was removed,
  reformatted or re-ordered; the reader in `kshana::realdata::llr_crd` does the selecting and
  reports what it dropped.
- **Format specification:** R. L. Ricklefs (UT Austin / CSR) and C. J. Moore (EOS Space
  Systems), *Consolidated Laser Ranging Data Format (CRD)* v1.01, 27 October 2009, for the
  ILRS Data Formats and Procedures Working Group,
  `https://ilrs.gsfc.nasa.gov/docs/2009/crd_v1.01.pdf`. The reader's field positions, the
  epoch-event code (`2` = ground transmit time at the system reference point, two-way), the
  accepted epoch time scales (`3` UTC(USNO), `4` UTC(GPS), `7` UTC(BIH)) and the meaning of
  the bin RMS and raw-range count are taken from that document, not from inspection of the
  files.
- **Checksums:** `normal_points/SHA256SUMS`, one line per file, in `shasum -a 256` format.
- **Generator / verifier:** `fetch_llr_normal_points.sh` re-downloads all fifteen files from
  the URLs above and runs `shasum -a 256 -c` against that list. It never overwrites a
  committed file: if an upstream digest has moved it says so and exits non-zero.
  `tests/lunar_llr_real_data.rs` re-checks the same digests offline, so a fixture edited in
  the working tree fails the suite.
- **Total size:** 172 kB across 15 files.
- **Stations present, and what happens to each:**
  - `GRSM` / **7845** Grasse (OCA) MeO, France — 321 points, used.
  - `MATM` / **7941** Matera (MLRO), Italy — 16 points, used.
  - `APOL` / **7045** Apache Point, New Mexico — 12 points, **skipped**. ITRF2020 SLR does
    not carry this lunar-only station (§2), and substituting a lower-grade coordinate for it
    would put an unsourced number into a provenance story. The engine counts the skip and
    emits it as `data.skipped_station_not_in_catalogue`.
- **Licensing / credit:** ILRS data are openly distributed. The underlying observations are
  the property of, and courtesy of, the contributing stations — Observatoire de la Côte
  d'Azur (Grasse MeO), Agenzia Spaziale Italiana (Matera MLRO) and the Apache Point
  Observatory Lunar Laser-ranging Operation — and of the International Laser Ranging Service
  and the EUROLAS Data Center. See `https://ilrs.gsfc.nasa.gov` for the ILRS data use terms.
  Pearlman, Noll, Pavlis et al., "The ILRS: approaching 20 years and planning for the
  future", *Journal of Geodesy* 93, 2161–2180 (2019).

## 2. The stations — IERS ITRF2020 (`itrf2020_llr_stations.csv`)

- **Product:** ITRF2020 SLR station positions at epoch **2015.0** and linear velocities,
  sliced to the two stations above.
- **Source (open, no login):** ITRF Product Centre (IGN, France),
  `https://itrf.ign.fr/ftp/pub/itrf/itrf2020/ITRF2020_SLR.SSC.txt`
- **Retrieved:** 2026-09-20
- **Source SHA-256:**
  `d0f7afc0111eec3ccb292c496884d98c8aeafade44abdc7a475735f546809b4d`
- **Slice / transformation:** the position and velocity rows for DOMES `10002S002` (7845)
  and `12734S008` (7941), carried through as the solution's own digit strings. Nothing is
  re-rounded; the engine applies the velocity to the observation epoch and nothing else.
- **Generator:** `generate_itrf2020_llr_stations.py` — hash-verifies the solution, requires
  the header line stating the 2015.0 position epoch (so a future release at a different
  epoch aborts rather than silently shifting every coordinate by a decade of plate motion),
  and requires exactly one position/velocity pair per requested station.
- **SHA-256:** `a386df145a7e635ad67a2824f6181a074b6a3cded1f703d9b0166634b9714682`
- **Stated caveat, carried in the file:** these are SLR *reference-point* coordinates. The
  station eccentricity from the reference point to the telescope's intersection of axes is
  **not** applied, and neither is any tidal or loading displacement.

## 3. The targets — JPL DE430 retroreflector coordinates (`de430_retroreflectors_mer.csv`)

- **Product:** Table 7, "Lunar laser retroreflector array coordinates using a frame based on
  mean Earth/mean rotation axes and center of mass" — the five arrays (Apollo 11, Apollo 14,
  Apollo 15, Lunokhod 1, Lunokhod 2) in the **MER** frame, which is the frame the IAU/WGCCRE
  lunar rotation model in `kshana::lunar_frame` realises.
- **Source (open, no login):** J. G. Williams, D. H. Boggs and W. M. Folkner, *DE430 Lunar
  Orbit, Physical Librations, and Surface Coordinates*, JPL IOM 335-JW,DB,WF-20130722-016,
  22 July 2013, published by NASA/JPL NAIF.
  PDF: `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430_moon_coord.pdf`
- **Retrieved:** 2026-09-20
- **Source SHA-256:**
  `98fb33fb0a13da9087ce180c8f3868464d03e357ee07309ed407e62ec3d04d0f`
- **Slice / transformation:** the five Table 7 rows, as the source's own digit strings. The
  generator additionally re-derives radius, longitude and latitude from the published X/Y/Z
  and refuses to write if the round trip disagrees with the published columns — the document
  checked against itself. The reader repeats the radius check, so a hand-edited row is caught
  offline too.
- **Generator:** `generate_de430_retroreflectors.py` — hash-verifies the PDF, requires the
  **full Table 7 caption verbatim** (Table 6 is the *principal-axis* frame and would parse
  identically, so a renumbered edition must abort rather than emit the wrong frame),
  extracts the text layer with `pdftotext -layout` (poppler), and parses with a strict regex.
- **SHA-256:** `28d514aa24ca5df26761f285b719edb05614605a0c5b6de77600d3f50ce2006e`
- **Stated caveats, carried in the file:** the constant tidal displacements of the source's
  Table 8 are **not** included in these coordinates, exactly as the source states; the source
  states the MER frame rotation is uncertain by 0.2″ (1.7 m on the equator) and the
  principal-axis coordinates by 0.12–0.27 m.
- **Why these are measured, not assumed:** the source determined them *from lunar laser
  ranging* in the solution leading to DE430, and calls them "the most accurately known
  positions on the Moon". They are used here for **geometry** — the partials and the Helmert
  design — not as an oracle for the covariance the scenario reports.

## 4. The ephemeris cross-check — JPL Horizons (`horizons_moon_geocentric_2015.csv`)

- **Product:** twelve weekly geometric geocentric Moon state vectors spanning the
  normal-point slice, ICRF, no light time and no aberration.
- **Source (open, no login):** JPL Horizons (NASA/JPL Solar System Dynamics),
  `https://ssd.jpl.nasa.gov/api/horizons.api` — `COMMAND='301'`, `CENTER='500@399'`,
  `EPHEM_TYPE='VECTORS'`, `VEC_TABLE='1'`, `REF_PLANE='FRAME'`, `REF_SYSTEM='ICRF'`,
  `OUT_UNITS='KM-S'`, `TIME_TYPE='TT'`, epochs as a JD list.
- **Retrieved:** 2026-09-20
- **Generator:** `fetch_horizons_moon.py`. Horizons is a service and has no stable document
  hash to pin, so the check is structural: the script requires the `$$SOE`/`$$EOE` block,
  exactly one state per requested epoch, each returned epoch equal to the requested one, and
  every distance inside the real lunar perigee/apogee envelope. It writes nothing otherwise.
- **SHA-256:** `6a83ab7ad40ba4c37438220a99817f700ddffdeda6672f6ec892e7c79ed8df8b`
- **What it is for, and what it is not for.** It is **not** an input to the datum: nothing in
  the scenario reads it. It exists so the report's central honesty claim can be tested a
  second way. The scenario says its observed-minus-computed range residual is the error of
  the engine's analytic Moon series; this file lets the test compare that series against JPL
  directly, over the same span, with no laser ranging involved. The two numbers are
  **156 494 m RMS** (from 337 measured normal points) and **195 655 m RMS** (against
  Horizons) — two independent handles on the same modelled link, agreeing to 1.25×.

## What is measured here and what is not

| link | class |
|------|-------|
| observation epochs, which station saw which array when | **measured** (§1) |
| every observation weight, `bin_rms / sqrt(n_raw)` | **measured** (§1) |
| station coordinates and velocities | **published** (§2) |
| retroreflector body-fixed coordinates | **published** (§3) |
| Earth rotation / CIO chain, IAU 2006/2000A | modelled (validated separately against SOFA) |
| Moon-centre position | **modelled** — an analytic series, error measured at ~1.6·10⁵ m RMS |
| lunar body orientation (IAU 2015 WGCCRE) | **modelled** |
| troposphere, solid-body tides, station eccentricity, polar motion, UT1−UTC, relativistic delay, station clocks | **absent**, and inside the reported residual |

The seven-parameter figures the scenario emits are a Cramér–Rao bound for that reduced
parameter set on a real schedule. They are not a solved datum, not an LLR analysis, and not
a geodetic product.
