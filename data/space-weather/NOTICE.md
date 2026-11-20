# data/space-weather

`storms.json` is the storm library of `kshana space-weather` (`src/space_weather_pnt/storms.rs`
embeds it). It is built by `make_storms.py` here:

```
curl -O https://kp.gfz.de/app/files/Kp_ap_Ap_SN_F107_since_1932.txt
python3 -I data/space-weather/make_storms.py Kp_ap_Ap_SN_F107_since_1932.txt > data/space-weather/storms.json
```

## Source and licence

- Kp, ap, Ap and observed F10.7: GFZ German Research Centre for Geosciences,
  `Kp_ap_Ap_SN_F107_since_1932.txt` (https://kp.gfz.de/), retrieved 2026-11-20, SHA-256
  5f479a3d98019dbe2324e9dd744932bfb894380ca1b3e9911307b497f890d884 (the file grows daily; the
  hash is also in `storms.json`). Licence: CC BY 4.0. Citation: Matzka, J., Stolle, C.,
  Yamazaki, Y., Bronkalla, O. and Morschhauser, A. (2021), The geomagnetic Kp index and derived
  indices of geomagnetic activity, Space Weather 19, e2020SW002641, doi:10.1029/2020SW002641.
  The F10.7 series in the file is the Dominion Radio Astrophysical Observatory (NRC Canada) flux.
- Changes made: only the days of the listed storm windows are kept; the centred 81-day mean of
  the observed F10.7 is added (computed from the file); the record `synthetic-extreme` is
  constructed by the script and is not data.
- The `context` notes cite their own sources (FAA, SpaceX, RNTF, Emmert et al. 2010); they are
  short factual summaries, not copied text.
