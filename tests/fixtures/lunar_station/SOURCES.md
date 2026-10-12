# Lunar reference station: public sources register

The public sources for the 0.36 lunar reference-station study (`lunar-station-coverage` and the comparison
in `tests/fixtures/lunar_station_published/`). Each was downloaded on the date shown and hashed as
downloaded. No PDF is committed (see `NOTICE.md`). The numbers used from them are transcribed, with page,
table or figure references, in `tests/fixtures/lunar_station_published/CLAIMS.md`.

Sources are cited by title, identifier, URL and publisher only. Personal names are left out on purpose,
including the names of presenters and authors printed in the documents. Where a direct file URL carries
a personal name in its file name, this register gives the publisher's index page and the item's position
on it instead.

"NovaMoon" is the name the sources use for the public mission concept. Kshana does not use it as a name
for anything it computes. It models a *lunar differential reference station of the class publicly
described in these sources*. It is not affiliated with or endorsed by any agency, and nothing here is a
statement about the performance of any real system.

| id | title | identifier / URL | publisher | date of document | retrieved | bytes | pages | SHA-256 | licence |
|---|---|---|---|---|---|---|---|---|---|
| S1 | "NovaMoon: A Strategic Lunar Reference Station for Positioning, Timing, and Largely Enhanced Science in the Earth–Moon System" (white paper), version 3 | arXiv:2602.08432v3, <https://arxiv.org/abs/2602.08432v3>, PDF <https://arxiv.org/pdf/2602.08432v3> | arXiv (authors' white paper; affiliations include ESA/ESOC, ESA/ESTEC and about 40 European institutions) | v1 2026-02-09, v2 2026-02-10, v3 2026-02-16 (latest on the retrieval date) | 2026-10-12 | 1,884,871 | 64 | `a7d1db8b7faf373c73d630b1c8a45ba24d581defefbab539b9b442ffa36ae40d` | arXiv non-exclusive licence to distribute, 1.0 (<http://arxiv.org/licenses/nonexclusive-distrib/1.0/>). It grants arXiv, not third parties, the right to distribute. Not redistributed here |
| S2 | "NOVAMOON – Lunar local Differential PNT and Selenodetic Reference Station" (27 slides; the workshop index lists it as "NOVAMOON_A LANS Monitoring and Local Differential Station") | Index page <https://ioag.org/meetings/cislunar/>, section "6. Lunar PNT User, Test Equipment & Technologies", item 07 (the direct file name carries a personal name and is not reproduced) | ICG-IOAG Workshop on Cislunar PNT, Vienna, February 2025; slides by the European Space Agency, hosted by IOAG | 2025-02 (PDF creation 2025-02-27) | 2026-10-12 | 9,215,099 | 27 | `47a55d3e4bd795a1f9b3bdf6da286318c8bb0d5fd5bb62b6e11a4159fd123b66` | No licence stated. Slide 1 is marked "ESA UNCLASSIFIED – Limited Distribution" and slides 3 onward "ESA UNCLASSIFIED – Releasable to the Public". Not redistributed here |
| S3 | "Moonlight: LCNS, and Lunar Pathfinder – European contribution to lunar Communication and Navigation Services" (28 slides) | <https://www.unoosa.org/documents/pdf/icg/2024/WG-B_Lunar_PNT_Jun24/LunarPNT_Jun24_01_04.pdf>; session page <https://www.unoosa.org/oosa/en/ourwork/icg/working-groups/b/LunarPNT_Jun24.html> | UNOOSA, ICG Intersessional Meeting, Joint Working Group Session on Lunar PNT, 25–26 June 2024; slides by the European Space Agency | 2024-06-25 | 2026-10-12 | 6,734,184 | 28 | `143699e5112935d8471328e168024dfe420e2334666d8327edabb11fda09e77b` | No licence stated; marked "ESA UNCLASSIFIED – Releasable to the Public". Not redistributed here |
| S4 | "Moonlight Programme Development Status" (16 slides) | <https://ioag.org/Cislunar2026/Tuesday/02%20Lunar/1110%20Moonlight%20Programme%20Development%20Status_ESA%20TPZ_final.pdf>; index <https://ioag.org/meetings/cislunar2026/> | 2nd Joint ICG-IOAG Multilateral Cislunar PNT Workshop, Vienna, 10 February 2026; slides by the European Space Agency and Telespazio, hosted by IOAG | 2026-02-10 | 2026-10-12 | 5,646,504 | 16 | `ce2fecde1be90408a9b80dd9ccfc0921d24cd53e942f117786eda821baf51058` | No licence stated; marked "ESA UNCLASSIFIED – Releasable to the Public". Not redistributed here |
| S5 | "Lunar Reference Time: ESA's Views" (9 slides) | <https://ioag.org/Cislunar2026/Wednesday/04b%20Sub-session%20Lunar%20Time/1430b%20Lunar%20Reference%20Time%20ESA%E2%80%99s%20Views.pdf>; index <https://ioag.org/meetings/cislunar2026/> | Workshop on Cislunar PNT, Vienna, 10–13 February 2026 (session of 11 February 2026); slides by the European Space Agency (D/OPS, D/NAV, D/TEC), hosted by IOAG | 2026-02-11 | 2026-10-12 | 606,893 | 9 | `5e0efef4a77523b89e12033685174835c7df282ee9a6a479be7db52c49807213` | No licence stated; marked "ESA UNCLASSIFIED – Releasable to the Public". Not redistributed here |
| S6 | LunaNet Signal-In-Space Recommended Standard – Augmented Forward Signal (LSIS) V1.0, plus `LUNAR_SIGMA_URE_M` in `src/lunar.rs` | already in the tree: see `tests/fixtures/lunar_afs_*` and the `lunar_afs` module docs | as recorded there | as recorded there | not re-retrieved | | | as recorded there | as recorded there |

## Notes on the sources

- Page numbers are PDF page numbers (1-based), which for the slide decks equal the slide numbers.
- The plan named S3 as "LunarPNT_Jun24_01_04.pdf" under a `WG-B/` path. That path returns 404. The file is
  served from the `WG-B_Lunar_PNT_Jun24/` folder given above.
- S1 states (p3) that navigation performance and service design are "addressed in full in a dedicated
  publication". That publication was not among the plan's sources and was not retrieved. S1 itself gives
  no navigation-accuracy figure beyond the qualitative "sub-metre" statements transcribed in CLAIMS.md.
- The sources disagree on dates: Argonaut-1 launch "by the end of 2030" (S1 p3) against 2031 (S2 p2, p6,
  p26), and "~ 2031" (S3 p21). Moonlight FOC is 2030 in S2 p3 and S3 p8, and "2031+" in S4 p3. These are
  recorded and not resolved. Nothing in the study depends on them.
- The sources also disagree on the corrected accuracy of the code-only differential service. S1, S2 and
  S3 p20 say "sub-metre"; S3 p22 and S5 p5 say "decimeter level". This is recorded in CLAIMS.md.

## How to re-check a hash

```sh
curl -sSL -o s1.pdf https://arxiv.org/pdf/2602.08432v3 && sha256sum s1.pdf
```

The same works for S3 to S5 with the URLs above. For S2, open the index page and download item 07 of
section 6. A publisher may re-issue a file at the same URL. A different hash then means a different
document, and this register records the one that was read.
