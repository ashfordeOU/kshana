# Constellation-claim verification datasets

`kshana claim-check` reads datasets of public claims about a navigation constellation and checks
each one, where kshana can compute the same quantity, against its own closed-form models. Source:
`src/claim_check.rs`; datasets in `data/claims/`. MODELLED.

```
kshana claim-check                       # the shipped public-claims dataset
kshana claim-check my-claims.json --out verdicts.json
kshana claim-check --template > my-claims.json
```

## The dataset (`kshana.claims/1`)

Each claim has an `id`, a `subject`, the `claim` in words, a `value` (a number or a `[low, high]`
range, or `null`) and `unit`, and its evidence: `source_url` (`https`), `retrieved` (the date the
page was read, `YYYY-MM-DD`), a short verbatim `quote` and its `quote_location` (heading or
paragraph). **A claim missing any of the four is refused**: it gets verdict `refused` and is never
checked. A claim may carry a `check`:

| `check.kind` | computed | consistent when |
|---|---|---|
| `consistent_with` | — | the value agrees with claim `other` (same unit) within `tolerance` |
| `quasi_polar` | J2 sun-synchronous inclination over the claimed altitude(s) | it lies within `tolerance_deg` (10) of 90° |
| `orbit_period` | two-body period at `altitude_km` | the claimed period agrees within `tolerance` (min) |
| `max_doppler` | horizon range rate `v·R/(R+h)` of a circular orbit on `frequency_hz` (Earth rotation neglected) | the claimed Doppler agrees within `tolerance` (Hz) |
| `link_cn0` | free-space C/N0 from `eirp_dbw`, `frequency_hz`, `range_km`, `rx_gain_dbi`, `noise_temp_k` | the claimed C/N0 agrees within `tolerance` (dB-Hz) |

Verdicts: `consistent`, `inconsistent`, `recorded` (sourced, nothing to check), `not_checkable`
(unknown check or missing inputs), `refused`. Every verdict lists the sources it rests on, the
computed value and the label. Exit 1 when any claim is inconsistent.

## The shipped dataset

`data/claims/celeste.json` holds seven claims about ESA's Celeste LEO-PNT demonstration, quoted
from ESA's *Celeste IOD - Facts and figures* page and the Thales Alenia Space press release of
28 March 2026, read on 20 November 2026: fleet size, orbit (quasi polar, 500 to 600 km; checked:
the sun-synchronous inclination there is 97.4° to 97.8°, within 10° of polar), the two first
satellites' masses (the builder's "around 30 kg" checked against ESA's 30 kg), bands and launcher.
Nothing else is shipped: the band plan, signal power and anything presented only at the ESA NAVISP
workshop stay in the separately withholdable workshop preset (`src/celeste_iod.rs`), which this
dataset neither reads nor repeats.

`data/claims/template.json` gives one claim of each check kind with empty evidence; every claim in
it is refused until its source fields are filled.

A consistent verdict says the claim agrees with the model; it does not prove the claim.
