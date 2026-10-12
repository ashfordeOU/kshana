# Fixture for tests/ionex_code_gim_oracle.rs

## Files

- `codg1330_crop.18i` (315 118 bytes, SHA-256
  44dcdbd425323f168e7e26aed8e33d9599bab0f4549c4d651ec72f13746d90f1): a latitude crop of the
  CODE final global ionosphere map for 2018-05-13 (day 133). Built by `make_fixture.py` (Python
  standard library; its docstring has the commands). Transform: every header record verbatim
  except `LAT1 / LAT2 / DLAT` (now `30.0 5.0 -2.5`) and three added `COMMENT` records stating the
  crop; in every one of the 25 TEC maps and 25 RMS maps only the 11 latitude bands 30.0 to 5.0
  deg are kept (all 73 longitudes -180 to 180), band and value records verbatim. Still a valid
  IONEX 1.0 file. The header's peak-TEC comment refers to the global maps.
- `reference_vtec.csv.gz` (gzip, mtime 0, reproducible byte for byte): output of
  `python3 -I reference_interp.py codg1330_crop.18i reference_vtec.csv.gz`, the formula
  reference (an independent Python re-implementation of the IONEX 1.0 interpolation formulas;
  not third-party output). Row formats are in the script's docstring.
- `PREREGISTRATION.md`: the bars, committed alone (e4d8b1f) before any comparison.

## Source

`CODG1330.18I.Z`, retrieved 2026-10-12 from
https://www.aiub.unibe.ch/download/CODE/2018/CODG1330.18I.Z (redirects to the AIUB archive at
https://zhw-b.s3.cloud.switch.ch/aiub/CODE/2018/CODG1330.18I.Z).
SHA-256 as downloaded (compressed): 6f2ef96d339ff0e6fa9ef42f337d9a7ab6ee5c3cc5c8cf94c21080c77ca235c1
(the same file `tests/fixtures/geometry_free_tec_gim_oracle/` used).
SHA-256 after `gzip -dc`: 95a0ea0d046f20e4fbded109295ae76cfa7fe2f75004883b1baef47c5d3151c4.
Producer: CODE (Center for Orbit Determination in Europe), Astronomical Institute, University of
Bern (AIUB), an analysis centre of the International GNSS Service (IGS).

## Terms

- CODE / AIUB: the AIUB CODE pages (https://www.aiub.unibe.ch/research/code___analysis_center/
  and its IGS page, checked 2026-10-12) state the products are available at
  www.aiub.unibe.ch/download and give no separate licence. The product series' DataCite record
  (DOI 10.7892/boris.75876.4, "CODE final product series for the IGS", University of Bern,
  queried 2026-10-12 via api.datacite.org) lists rights "open.access"
  (http://purl.org/coar/access_right/c_abf2) and no licence text.
- IGS: CODE's global ionosphere maps are IGS products. The IGS Data and Product Disclaimer and
  Terms of Use (https://igs.org/wp-content/uploads/2020/09/IGS-Data-and-Product-Disclaimer-and-Terms-of-Use-200805.pdf,
  SHA-256 7b4e253c24073af930c38ac65b30ae5208850c4a5681a0e2c6bbf388e72f8226) make IGS data and
  products openly available for use without restriction, free of cost or obligation, with
  attribution to the IGS and the contributing organisations. Not CC BY.
- Attribution: global ionosphere map by CODE, AIUB, University of Bern, for the International
  GNSS Service (IGS); CODE final product series for the IGS, Astronomical Institute, University
  of Bern, doi:10.7892/boris.75876.4.

## Format reference

Schaer, S., Gurtner, W., Feltens, J. (1998): IONEX: The IONosphere Map EXchange Format Version
1, Proceedings of the 1998 IGS Analysis Centers Workshop, ESOC, Darmstadt (interpolation
section: 4-point bilinear formula; equations 1 to 3 in time).
