# Planetary gravity fixtures (PDS SHADR crops and pyshtools oracle values)

## `gmm3_120_sha_to20.tab`

- **Product:** GMM-3, the Goddard Mars gravity model to degree/order 120 (Genova et al., *Seasonal
  and static gravity field of Mars from MGS, Mars Odyssey and MRO radio science*, Icarus 272,
  2016), PDS data set `MRO-M-RSS-5-SDP-V1.0`, product `GMM3_120_SHA.TAB` (released 2016-01-21).
  Fully normalized; reference radius 3396.0 km; GM 4.2828372854187757e4 km³/s². Body-fixed frame:
  Konopliv et al. (2006), which the PDS label states is not the IAU Mars system.
- **Source:** NASA PDS Geosciences Node,
  `https://pds-geosciences.wustl.edu/mro/mro-m-rss-5-sdp-v1/mrors_1xxx/data/shadr/gmm3_120_sha.tab`
  (label `gmm3_120_sha.lbl` beside it).
- **SHA-256 of the original file (900 604 bytes):**
  `eb4913b1afb6682406e6a9dad5be7918a162fa8462473c9a2e7aae258d4c2c9c`
  (label: `097f9989fc87bc9adbf04be754734349160228de940f9a242164f3be1b80bb7d`).
- **SHA-256 of this crop:** `6ea45c4f53d4b6c5a11fd9aab2d8c23cf76cb27bb9cc1b7124c063826eedc7ba`

## `jggrx_0660b_sha_to20.tab`

- **Product:** GL0660B, the JPL GRAIL primary-mission lunar gravity field to degree/order 660
  (Konopliv et al., *The JPL lunar gravity field to spherical harmonic degree 660 from the GRAIL
  Primary Mission*, JGR Planets 118, 2013), PDS data set `GRAIL-L-LGRS-5-RDR-V1.0`, product
  `JGGRX_0660B_SHA.TAB` (released 2013-02-05). Fully normalized; reference radius 1738.0 km;
  GM 4.9028003055554e3 km³/s²; body-fixed frame defined by DE421 (lunar principal axes);
  degree-2 terms without the permanent tide.
- **Source:** NASA PDS Geosciences Node,
  `https://pds-geosciences.wustl.edu/grail/grail-l-lgrs-5-rdr-v1/grail_1001/shadr/jggrx_0660b_sha.tab`
  (label `jggrx_0660b_sha.lbl` beside it).
- **SHA-256 of the original file (26 692 624 bytes):**
  `500e47e0ae2fa32d30615ea4af9ed6cca3a60e05c332d918692596a425708534`
  (label: `57637dfbb1cc93743fb080405c217840d396dd9712c3aacfcdc1da4d753b398c`).
- **SHA-256 of this crop:** `9ee9b3a0c53f2b2cc93e9c4be21028d0e6dd8092b2a961931020e49378b3a3a6`

## Crop transform (both files; `crop_shadr.py <in> 20 <out>`)

- The header record is kept verbatim except that its DEGREE OF FIELD and ORDER OF FIELD columns are
  replaced by 20 (same column width).
- Every coefficient record of degree n <= 20 is kept verbatim (230 records, degrees 1..20); higher
  degrees are dropped. No coefficient value is altered.
- The fixed-length record padding (trailing blanks) and the CR of the CR/LF terminators are
  stripped; records end in LF.

## `oracle_crop20.txt`, `oracle_full.txt`

Gravity vectors computed by pyshtools 4.14.1 (BSD-3-Clause) with numpy 2.3.5 from the files above
(the crops, and the full original files respectively) at the points pre-registered in
`xval/planetary-gravity-pyshtools/PREREGISTRATION.md`, by
`xval/planetary-gravity-pyshtools/gen_oracle.py`. Derived numbers, not PDS data.

## Licence and terms

- PDS Geosciences Node, "Are there any restrictions on the use of PDS data?"
  (`https://pds-geosciences.wustl.edu/faq.html`): "PDS data sets are classified TSPA (Technology and
  Software Publicly Available) by the U.S. Department of Commerce, Bureau of Export Administration,
  and may be exported outside the United States as public open literature. When PDS data sets are
  used in published literature or other applications, they should be cited appropriately."
  The PDS FAQ (`https://search-pdsppi.igpp.ucla.edu/faq.jsp`): "Data sets archived in the PDS are in
  the public domain."
- GL0660B is a JPL product; the JPL Data and Documentation Use Policy for PDS
  (`https://pds-geosciences.wustl.edu/jplcopyright.html`) states that data supplied to the PDS by JPL
  "may be used by any person for any purpose without prior permission", subject to no warranty, a
  reference/credit line, and no claimed or implied endorsement by Caltech, JPL or NASA.
- GMM-3 was produced at NASA Goddard Space Flight Center (a work of the U.S. Government).

Citations: Genova, A., et al. (2016), GMM-3, NASA Planetary Data System, MRO-M-RSS-5-SDP-V1.0;
Konopliv, A. S., et al. (2013), GL0660B, NASA Planetary Data System, GRAIL-L-LGRS-5-RDR-V1.0.
No endorsement by NASA, JPL or GSFC is claimed or implied.
