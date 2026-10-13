# Fixture for tests/ionex_code_gim_oracle.rs

## Files

- `synthetic/map.18i`: a synthetic IONEX 1.0 file written by `gen_synthetic.py` (pure arithmetic,
  no third-party data) with the structure of the CODE GIM crop the test was designed on.
- `synthetic/reference_vtec.csv.gz` (gzip, mtime 0, reproducible): output of
  `python3 -I reference_interp.py synthetic/map.18i synthetic/reference_vtec.csv.gz`.
- `fetch.sh`, `make_fixture.py`, `reference_interp.py`: fetch the real map at test time (pinned
  SHA-256 below), cut the latitude crop and compute its formula reference OUTSIDE the
  repository; `KSHANA_IONEX_CODE_GIM_DIR` points the test at them.
- `PREREGISTRATION.md`: the bars, committed alone (e4d8b1f) before any comparison.

The real map is NOT vendored (changed 2026-10-13): its licence could not be confirmed from a
primary source (see Terms), and the repository's rule is not to vendor data whose licence is
unclear. The crop first committed in 0901cca was removed; the crop `fetch.sh` rebuilds is
byte-identical to it (SHA-256 44dcdbd425323f168e7e26aed8e33d9599bab0f4549c4d651ec72f13746d90f1;
its reference 1726acaf589d747a96b69af8bdb860639107d5fa0d970407a2fbadbd6240da6b).

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
