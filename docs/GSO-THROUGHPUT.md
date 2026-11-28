<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# FCC 26-26 GSO protection criteria: `kshana gso-throughput`

In FCC 26-26 the US Federal Communications Commission replaced, as a US alternative to the
equivalent power-flux density (EPFD) limits, the way non-geostationary (NGSO) systems show that
they protect geostationary (GSO) networks in the 10.7-12.7, 17.3-18.6 and 19.7-20.2 GHz bands:
by a degraded-throughput showing against a published set of GSO reference links.
`kshana gso-throughput` ships that reference-link set, checks it against its own legend, and
evaluates the four criteria of the order on time samples you give it, writing a run record with
the SHA-256 of every input.

**Evidence: MODELLED.** The report evaluates the criteria on the samples and the
spectral-efficiency table you supply. It is not a compatibility showing, not a finding of the
Commission or its Space Bureau, and says nothing about operations the samples do not describe.
The run record is not signed; it can be placed in a signed [`kshana evidence`](EVIDENCE-PACKS.md)
pack.

```
kshana gso-throughput links [--links <links.csv>] [--json]
kshana gso-throughput check-links [--links <links.csv>] [--json] [--out <check.json>]
kshana gso-throughput evaluate <input.json> [--links <links.csv>] [--json] [--out <run.json>]
kshana gso-throughput template
```

Exit codes: `check-links` 0 when every recomputed value is within tolerance, 1 otherwise;
`evaluate` 0 when no criterion is exceeded, 1 when one is; 2 a usage or input error. The command
reads files only and makes no network request.

## The source

**FCC 26-26**, *Modernizing Spectrum Sharing for Satellite Broadband*, Report and Order,
SB Docket No. 25-157, adopted 30 April 2026, released 1 May 2026.

- Text: <https://docs.fcc.gov/public/attachments/FCC-26-26A1.txt> (fetched 2026-11-28).
- Appendix B (the reference links) is a spreadsheet embedded in the Word version,
  <https://docs.fcc.gov/public/attachments/FCC-26-26A1.docx> (fetched 2026-11-28), at
  `word/embeddings/ooxmlPackage1.xlsx`, sheets `links` (328 rows) and `legend`; the PDF prints
  the same table on pages 46-47.
- Federal Register: 91 FR 26948, 13 May 2026,
  <https://www.govinfo.gov/content/pkg/FR-2026-05-13/pdf/2026-09565.pdf>.

**Status.** The new 47 CFR § 25.146(a)(3), which holds the criteria, and § 25.289(a)(2) are
"delayed indefinitely" pending Paperwork Reduction Act review (order para. 90; the eCFR version of 2026-11-20, read on
2026-11-28, still shows § 25.289(a)(2) as "[Reserved]" with a link to the delayed amendment).
The other rule changes took effect on 13 July 2026. Para. 69 delegates to the Space Bureau the
revision of the reference-link set; a revised set can be given with `--links` and is reported
by its hash.

## What the order specifies, and what it does not

| From FCC 26-26 | Where |
|---|---|
| (A) no more than **3 % time-weighted average degraded throughput** of any GSO reference link that uses adaptive coding and modulation (ACM) | App. A, § 25.146(a)(3)(i)(A); paras. 14, 50 |
| (B) no more than **0.1 % absolute change in link availability** to any GSO reference link | § 25.146(a)(3)(i)(B); para. 54 |
| (C) no more than **−10.5 dB I/N for 80 % of time** for any reference link without ACM | § 25.146(a)(3)(i)(C); paras. 58-61 |
| (D) a minimum **GSO-arc avoidance angle of 3 degrees** | § 25.146(a)(3)(i)(D); paras. 62-65 |
| the C/N threshold of the NGSO-NGSO framework for ACM links (0 dB, § 25.261(d)(1)) and the C/(N+I) threshold of the reference-link database for links without ACM | para. 78 |
| the **328 GSO reference links** and the definition of each column | para. 67, App. B |

The order prints **no formula** for the time-weighted average degraded throughput, **no
spectral-efficiency curve** (C/N to throughput), no rain-fade or interference time-series model,
and no NGSO geometry; para. 78 points to the NGSO FSS Inter-Round Sharing Second Report and Order
(39 FCC Rcd 12657) for those, which kshana does not implement. They are therefore **inputs**:
you give the time samples and the efficiency table, and the report repeats them by hash.

## The reference-link set

`data/gso-reference-links/fcc-26-26-appendix-b.csv` is Appendix B as stored in the spreadsheet
(the extraction script `extract_appendix_b.py` sits beside it), SHA-256
`73bde6f5edbfa1d6b07e5b28e6dc5fb2bb5c072b06c0892435de884300fed423`. 328 links: 300 without ACM
and 28 with; 229 carriers in 10.7-12.7 GHz, 28 in 17.3-18.6 GHz, 35 in 19.7-20.2 GHz and 36 at
other frequencies (12.75 GHz and 18.675-19.6 GHz, reported as outside the three bands, not
judged). Every report names the link set, its hash and whether that hash is the pinned FCC 26-26
one.

`check-links` is the set of test vectors the document gives: every column the Appendix B legend
defines from other columns, recomputed for every link.

| Column | Recomputed from | Tolerance |
|---|---|---|
| `calc_cni_clearsky_dB` | C/N and internal C/I, power sum (legend; 40 dB when no C/I is given) | 0.01 dB |
| `calc_cni_clearsky_margin_dB` | C/(N+I) − unavailability threshold (legend) | 1e-9 |
| `calc_cni_rain_margin_dB` | clear-sky margin − rain margin (legend) | 1e-9 |
| `UT or GW` | GW when the antenna is at least 3.5 m (legend) | exact |
| `pass_rain_only` | 100 − baseline unavailability ≥ availability objective (legend; 300 links that give one) | exact |
| ACM threshold | 0 dB for each of the 28 ACM links (para. 78) | 1e-9 |
| `calc_gso_elevation_deg` | kshana's geometry: spherical Earth 6378.137 km, GSO radius 42164 km | 0.001 deg |
| `calc_cn_clearsky_dB` | kshana's link budget: EIRP + G − 20 log10(4πdf/c) − (−228.6 + 10 log10 T + 10 log10 B) | 0.01 dB |

The last two rows use constants the order does not state; on the shipped set they reproduce the
elevation within 3e-5 deg and the C/N within 0.008 dB. Not reproduced: the baseline
unavailability and rain margin (ITU-R P.618 and S.1323 Procedure D) and rain rates computed with
ITU-R P.837; the order names those methods but not their parameters.

## Evaluating the criteria

`kshana gso-throughput template` prints an input (`kshana.gso-throughput-input/1`; abridged here):

```json
{
  "format": "kshana.gso-throughput-input/1",
  "system": "example NGSO system",
  "samples_provenance": "describe the simulation that produced the samples",
  "declared_min_avoidance_angle_deg": 4.0,
  "spectral_efficiency": [{"cni_db": 0.0, "bps_per_hz": 1.0}, {"cni_db": 5.0, "bps_per_hz": 2.0}],
  "links": [
    {"carrier_num": 5310, "samples": [
      {"weight": 0.9, "cn_db": 22.0, "i_n_db": -12.0},
      {"weight": 0.1, "cn_db": 6.0, "i_n_db": -8.0, "avoidance_angle_deg": 3.5}]}
  ]
}
```

Each sample stands for a share of time (`weight`, normalised per link); `cn_db` is the link's C/N
in that sample without the NGSO system (clear sky or faded), `i_n_db` the NGSO system's aggregate
I/N (absent: none). The arithmetic, written into every report as `method`:

1. C/(N+I) without the NGSO system: power sum of C/N and the link's internal C/I.
2. C/(N+I) with it: the same plus the NGSO interference, I/C = (I/N)/(C/N).
3. Unavailability: the weight share of samples below the link's threshold. (B) is the
   difference with minus without, at most 0.1 percentage point.
4. ACM links: degraded throughput = 1 − Σ w·η(C/(N+I) with) / Σ w·η(C/(N+I) without), η from
   the efficiency table as a step (the efficiency of the highest row whose threshold is met, zero
   below the first). (A): at most 3 %.
5. Links without ACM: the weight share of samples with I/N at or below −10.5 dB (no NGSO
   interference counts as below). (C): at least 80 %.
6. (D): the smallest of the declared avoidance angle and the per-sample angles, at least 3°.

The report (`kshana.gso-throughput-report/1`) lists, per evaluated link, each criterion with its
provision, value, limit and whether it is met; the reference links not evaluated (the rule
applies to *any* reference link, so a showing covers all of them); the SHA-256 of the input and
of the link set; the source and its status; and the disclaimer.

## Limits

- The samples are yours: the result is only as good as the simulation that produced them, and
  kshana does not model the NGSO system, rain, or antenna patterns for this command.
- The step efficiency table is an input choice; the order does not fix one.
- (D) is checked against the angles you declare, not computed from geometry.
- Not a compatibility showing and not a Commission finding. 47 CFR § 25.146(a)(3) is not yet
  effective.

Tests: `tests/gso_throughput.rs` (the Appendix B checks on all 328 links and hand-derived
evaluations on `tests/fixtures/gso-throughput/`).
