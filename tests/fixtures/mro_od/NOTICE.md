# mro_od fixture

Used by `tests/mro_odf_short_arc_od_oracle.rs` (CAP-30 stage 2, pre-registered in
`xval/mro-od/PREREGISTRATION.md`).

| File | Source | SHA-256 |
|---|---|---|
| `finals2000A_54401_54408.txt` | eight verbatim rows (MJD 54401-54408, 2007-10-28 to 2007-11-04) of the IERS `finals2000A.all`, https://datacenter.iers.org/data/9/finals2000A.all, fetched 2026-10-14 (whole-file SHA-256 0baf00f67a39ab362a3e4f07d2a1f084842178523f56bcf5a861e7ac084d411a). IERS products: free use with citation. | 7c672ff206aea2755ccdd733662c7567b38b772273d7b6130694b020af9c8a1c |

The larger inputs (the MRO reconstruction `mro_psp5.bsp`, `de440s.bsp`, the DSN station
coordinates and the GMM-3 gravity field) are not vendored; `scripts/fetch_mro_od.sh` fetches
them into `realdata-cache/mro/` and checks their SHA-256s.
