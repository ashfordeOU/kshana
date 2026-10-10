# Interference map: data source licence review

Status: **APPROVED by the coordinator on 2026-10-09 with the decisions recorded at the end.** Reviewed 2026-10-09 from the publishers' own pages where reachable. This is an
engineering review, not legal advice; items marked *unverified* must be confirmed
against the live licence text before any ingest helper is written.

## Test applied

Kshana is AGPL-3.0 with commercial editions. A source passes only if all hold:

1. Commercial use is allowed (no "non-commercial only", no "internal evaluation only").
2. Derived aggregate maps (per-cell, per-day counts and flags, no per-aircraft or
   per-vessel records) may be redistributed.
3. The attribution obligation is one we can embed in every output file.

Outputs of Kshana never contain per-aircraft or per-vessel identifiers (ICAO hex, MMSI,
callsign, name). Aggregation is the only output form.

## ADS-B candidates

| Source | Licence | Commercial use | Derived-map redistribution | Attribution | Rate limits | Verdict |
|---|---|---|---|---|---|---|
| adsb.lol daily history archives (`globe_history_YYYY`, readsb gzip JSON, GitHub releases) | ODbL 1.0 for the database; contributor feed data dedicated CC0 | Yes (ODbL permits commercial use) | Yes, with a condition: a *Produced Work* (a rendered map image) may carry any licence with attribution; a *Derived Database* (a published per-cell GeoJSON table) must be offered under ODbL | ODbL notice: credit adsb.lol as source and link the licence; suggested text below. The repository states no further format | None stated for the GitHub release downloads | **Conditional pass.** Needs a coordinator decision on the share-alike condition (see Open questions) |
| OpenSky Network (historical and live) | OpenSky data licence agreement | No. Licence covers non-profit research, non-profit education, internal commercial testing and evaluation, and government purposes only | Not granted | n/a | Account tiers apply | **Excluded** (non-commercial) |
| ADS-B Exchange (historical, API) | Proprietary terms | No for free access. Commercial use, including internal, needs a paid written agreement | No bulk redistribution without consent | n/a | Paid tiers | **Excluded** |
| airplanes.live | Page returned HTTP 403 to the review, terms not read | *unverified* | *unverified* | *unverified* | *unverified* | **Excluded pending review** |
| Other national or research ADS-B archives | Not reviewed | | | | | Out of scope until proposed |

Suggested attribution (adsb.lol): "Contains aircraft position data from adsb.lol, made
available under the Open Database License (ODbL 1.0), https://opendatacommons.org/licenses/odbl/1-0/".

## AIS candidates

| Source | Licence | Commercial use | Derived-map redistribution | Attribution | Rate limits | Verdict |
|---|---|---|---|---|---|---|
| NOAA / BOEM MarineCadastre AIS (US waters, bulk files and AccessAIS) | US federal public domain; the project repository states CC0 1.0 | Yes | Yes | Not required; courtesy credit "Source: NOAA Office for Coastal Management and BOEM, MarineCadastre.gov". Users must not claim the data as their own | Custom extract orders about 2 GB each; bulk files unlimited | **Pass.** Note: one catalogue entry marks access "non-public" (likely a metadata error); confirm with the publisher |
| Kystverket (Norwegian Coastal Administration) open AIS | NLOD 2.0 (Norwegian Licence for Open Government Data) | Yes (NLOD permits commercial use) | Yes | NLOD 2.0 requires naming the source and linking the licence; text below | None stated | **Pass.** Coverage excludes fishing vessels under 15 m and recreational craft under 45 m, which biases the map towards larger ships. Do not use the closed component |
| Danish Maritime Authority historical AIS (aisdata.ais.dk) | Not stated on the download page; access governed by the Danish PSI act | *unverified* | *unverified* | *unverified* | Not stated | **Excluded pending clarification** from the publisher |
| Fintraffic Digitraffic (Finland) | Believed CC BY 4.0 | *unverified* | *unverified* | Believed "Source: Fintraffic / digitraffic.fi, CC BY 4.0" | Documented per-API limits | **Excluded pending review**: the licence page was not reachable in this review |
| Commercial AIS aggregators and satellite AIS vendors | Proprietary | No | No | n/a | n/a | **Excluded** |

Suggested attribution (Kystverket): "Contains data under the Norwegian Licence for Open
Government Data (NLOD) made available by the Norwegian Coastal Administration,
https://data.norge.no/nlod/en/2.0".

## Coastline for the on-land detector

| Source | Licence | Verdict |
|---|---|---|
| Natural Earth (coastline and land polygons, 1:10m) | Public domain; credit optional ("Made with Natural Earth"); commercial use invited | **Pass.** Preferred |
| OpenStreetMap coastline / water polygons | ODbL, share-alike on derived databases | Not needed; avoid mixing with the other sources |
| GSHHG | LGPL (underlying sources public domain), notice requested for commercial changes | Not needed |

Natural Earth 1:10m is coarse (nominal accuracy of the order of a kilometre). The
on-land detector must therefore use a stated coastal buffer (a position counts as on land
only when it lies more than the buffer inland). That is a method decision recorded in the
method document, not a licence matter. The land polygons would be vendored only if the
coordinator approves the size; otherwise the CLI takes a user-supplied file.

## Rate limits and fetch helpers

None of the passing sources states a rate limit on bulk files. Default tests use only
synthetic fixtures and no network. Optional fetch helpers, if approved, sit behind an
explicit flag, send an identifying User-Agent, and download one file at a time.

## Open questions for the coordinator

1. **ODbL share-alike (adsb.lol).** Published per-cell day files are probably a Derived
   Database. Options: (a) approve, and release interference-map GeoJSON that uses adsb.lol
   under ODbL 1.0 (the embedded attribution and licence field would say so; Kshana's own
   code stays AGPL); (b) restrict public outputs to rendered images (Produced Works);
   (c) drop adsb.lol, leaving no ADS-B source. Recommended: (a), as the outputs are
   aggregate data that we want others to reuse. Commercial editions would need to carry
   the same ODbL notice on any such file.
2. **Mixed-source outputs.** ADS-B days (ODbL) and AIS days (public domain / NLOD) must
   stay in separate files, each carrying its own licence, so that the ODbL does not attach
   to the AIS layer.
3. **Sources marked "pending".** Do you want me to chase airplanes.live, the Danish
   authority and Digitraffic (read live terms or contact the publisher), or leave them out
   of 0.35.0? Recommended: leave out.
4. **Coastline file.** Vendor Natural Earth 1:10m land polygons (about 10 MB as
   GeoJSON, so I would simplify to the area needed), or take it as user input only?
5. **Identifiers.** Confirm that readers may parse MMSI and ICAO hex in memory for
   "distinct aircraft or vessel" counting but must never write or log them. Counting uses
   a per-run salted hash that is not persisted.

## Verdict summary

- Approved-candidate ADS-B: adsb.lol (conditional on question 1).
- Approved-candidate AIS: NOAA MarineCadastre, Kystverket open data.
- Coastline: Natural Earth.
- Excluded: OpenSky, ADS-B Exchange, commercial AIS vendors; pending: airplanes.live,
  Danish Maritime Authority, Digitraffic.

## Decisions (coordinator, 2026-10-09)

1. adsb.lol approved. Published per-cell ADS-B GeoJSON is released under ODbL 1.0 with the
   licence and attribution embedded in the file; Kshana code stays AGPL; commercial editions
   carry the same notice on such files.
2. ADS-B and AIS outputs are separate files, each with its own licence field, never merged.
3. Approved AIS: NOAA MarineCadastre and Kystverket (coverage bias stated in the output).
   airplanes.live and the Danish Maritime Authority are out of 0.35. Digitraffic: a second
   attempt read its published API instructions (rate limits and a request for an identifying
   `Digitraffic-User` header) but no licence text or attribution wording, so it is **left
   out**; it can be added once its licence is read and cited.
4. The Natural Earth land file is not vendored. The CLI takes a user-supplied land polygon
   file; an opt-in helper (`interference-map fetch-land --allow-network`) downloads it.
5. Identifiers are parsed in memory only, hashed with a per-run salt, never written or logged.
6. Added rule: a cell with fewer than 5 distinct aircraft or vessels is not published.
