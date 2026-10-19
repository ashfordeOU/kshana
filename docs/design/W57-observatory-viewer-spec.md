# Spec: observatory viewer page (site or Studio), for W53 via the coordinator

A page that shows the observatory's daily product. It computes nothing: it reads the three files
`kshana interference-map daily` writes, plus the manifest, and shows what they say. Source of truth for the
formats and rules: `docs/observatory/METHOD.md`.

## Inputs (static files, same origin, no runtime fetch from a third party)

| File | Schema | Used for |
|---|---|---|
| `observatory-adsb-<dataset>-<day>.geojson` | `kshana-observatory-day/1` | the cells (Polygon features) and the day's metadata |
| `observatory-adsb-<dataset>-<day>.png` | PNG | the picture; also the fallback when the map cannot draw |
| `observatory-adsb-<dataset>-<day>.incidents.json` | `kshana-incident-report/1` | incident list (touching degraded cells) |
| `observatory-adsb-<dataset>-<day>.manifest.json` | `kshana-observatory-manifest/1` | byte counts and SHA-256 per file, input counters |

A day index (`days.json`: the list of dates available) is the site's own file; the observatory does not write one.

## What each feature carries

`properties.state` is exactly one of `degraded`, `not_degraded`, `not_observed`. `not_observed` cells also carry
`reason` (`insufficient_sample`, `no_day_background`, `day_wide_effect`). Counts (`aircraft_observed`,
`aircraft_sampled`, `aircraft_affected`, `affected_share`) are `null` when below the publication minimum of 5:
show `null` as "withheld", never as 0. Cells not in the file were not observed: draw nothing there.

## Display rules (must hold)

1. Three states only, with the wording above and these accessible encodings: degraded (red, solid), not degraded
   (blue, solid), not observed (grey diagonal hatch). Colour is never the only cue (the hatch and the legend text
   carry the difference). Light and dark per the site tokens; the picture's palette is the light one.
2. **"Not observed is not clear"** appears in the legend, on the page, in plain words, and with the same sentence
   in the PNG's text.
3. **No cause, no actor.** The page never labels a cell or an incident with a cause, a country, a force or a
   source. It shows `cause: not attributed` from the incident file if it shows the field at all. No headline
   such as "jamming detected".
4. The page states the **release rule**: products are published at least 24 h after the day ends
   (`release.not_before_utc`), on 0.5-degree cells. It is not a live view and never says "now".
5. The advisory statement (`notice` in the files) is on the page. The dataset block is shown with its licence and
   attribution (ODbL-1.0 and the adsb.lol credit for ADS-B); the licence link is the file's `licence_url`.
6. Numbers come from the files only; the page invents no totals. The summary (`summary.degraded`,
   `not_degraded`, `not_observed_published`, `day_wide_effect`) is shown as written. A `day_wide_effect` day says
   that no cell could be called that day, not that the sky was clean.
7. A day with no incidents says "no degraded cells this day", not "no interference".

## Layout

- Day picker (keyboard operable, previous and next day), the PNG as the primary image with a text alternative
  built from the summary ("N cells degraded, M not degraded, K not observed, on <date>").
- Optional interactive map from the GeoJSON (cells only; no base map tiles fetched from a third party; an offline
  coastline from Natural Earth is allowed as in the Studio's map page). Hover or focus on a cell shows its state,
  reason and the published counts. The table of cells is the accessible equivalent.
- Incident list (id, bounding box, cell count) beside the map; each row selects its cells.
- A "files" block: the four file names with their SHA-256 from the manifest and the method id, so a reader can
  check a download.
- Works at 390 px and 1440 px, light and dark; no horizontal page scroll (tables scroll inside their container).
- Class names prefixed (for example `ko-`) and one scoped inline style, as the leaderboard fragment does
  (`bench/site/leaderboard.html`).

## Not in scope

No real-time feed, no alerts, no push, no attribution, no comparison between regions or states, no AIS layer on
the same map (ADS-B and AIS are never combined), no OpenSky data.

## Data for the first build

The 30-day Baltic back-catalogue (2026-09-15 to 2026-10-14) is in the owner's hands as files (the products are
not in git); `docs/observatory/RESULTS.md` has the per-day summary. Anything published from it is the owner's
decision.
