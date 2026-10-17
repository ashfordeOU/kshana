<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Design note: optical PNT through the atmosphere (0.37)

Status: design, before any code or scored run. Branch `feat/optical-atmosphere-0.37`, cut from
the 0.36.0 candidate. Software and analysis only; Kshana models and predicts, it does not run a
physical optical-ground-station experiment. The advisory statement stays on every surface.

## 1. What exists today (extend, do not duplicate)

- `src/optical_linkbudget.rs`: one-way budget with a **lumped** `atmospheric_loss_db` input
  (MODELLED allocation) plus geometric, pointing and detector terms; photon-limited ToA/range CRLB.
- `src/optical_availability.rs`: per-site availability = clear-sky probability x pointing factor;
  independent and correlated (`N_eff = 1 + (N-1)(1-rho)`) network union. Clear-sky inputs are
  `data/optical_site_climatology.csv` (Cavazzani et al. 2011, GOES12 clear-night fractions).
- `src/holdover.rs`: closed-form coast variance `q_wf t + q_rw t^3/3 + q_drift t^5/20`, holdover
  to a threshold, deterministic TIE, `phase_to_range_m`.
- `hybrid_integrity` consumes the first two; its report text already says optical availability is
  weather/climatology limited and probabilistic.

The 0.37 work replaces the lumped dB with a physical, wavelength-dependent atmosphere, turns
"clear-sky fraction" into a distribution of outages, and couples outages to holdover.

## 2. Module plan (all new numeric code via `PortableFloat` / `portable_distr`)

| # | Module | Content |
|---|---|---|
| 1 | `optical_atmosphere` | slant-path clear-air extinction (Beer-Lambert, aerosol Angstrom model, molecular Rayleigh, wavelength 850/1064/1550 nm tabulated windows); cloud attenuation from columnar liquid water L (kg/m^2): optical extinction from liquid water content and effective radius (geometric-optics limit, Q_ext = 2), with the ITU-R P.840 liquid-water-column statistics used for the *amount*, not for RF specific attenuation (P.840 is a microwave method; see 3.1); Hufnagel-Valley 5/7 Cn^2(h) with ground-level and wind variants; Rytov variance for a slant path, scintillation index (weak to strong, Andrews-Phillips form), log-normal / gamma-gamma fade probability, fade margin for a target outage. |
| 2 | `optical_linkbudget` (extended) | optional `atmosphere: Option<AtmosphereParams>`; when `None` the lumped `atmospheric_loss_db` path is byte-identical (no existing pin moves). When `Some`, atmospheric loss = extinction + cloud + (turbulence fade margin at the requested availability). |
| 3 | `optical_weather` | per-site cloud statistics -> availability %, outage-duration distribution, fade margin vs availability. Input is a small per-site table of (cloud-free fraction, liquid-water exceedance curve, mean dwell time), not raw reanalysis, so the repo ships no large data. |
| 4 | `optical_sitediv` | N-site availability with a spatial-correlation model rho(d) = exp(-d/d0) between station pairs (d0 from the cloud-field decorrelation length, stated and cited), reusing `correlated_union_availability`'s limits (rho=0 -> independent union, rho=1 -> one site); distance-based rather than a single scalar rho. |
| 5 | `optical_techniques` | parameterised gains: aperture averaging factor (Andrews-Phillips), adaptive-optics Strehl / scintillation reduction as a single stated fractional-reduction parameter, wavelength choice (re-evaluates modules 1-3), fade margin. A candidate technique is a named set of parameters, so its predicted availability gain is `A(with) - A(without)` with the assumptions printed. All gains are MODELLED inputs. |
| 6 | `optical_outage_holdover` | outage-duration distribution x `holdover::coast_phase_sigma` => timing-error and range-error growth per outage, and the fraction of outages (and of time) whose error stays under a stated threshold; also "required clock class for X ns at availability A". Uses the existing `ClockClass` PSDs, no new clock model. |

Scenario kind `optical-atmosphere` (single kind; sub-tables for site, atmosphere, network,
technique, clock), 1-2 bundled scenarios (a 3-site European network at 1550 nm; a wavelength
and AO trade), CLI / MCP / wasm through the same registry path as other kinds, docs page
`docs/OPTICAL-ATMOSPHERE.md`. New fields that read files go into `surface::FILE_SOURCE_KEYS`;
bundled scenarios stay sorted, repo-only ones in `REPO_ONLY` and `tests/cli_first_run.rs`.

## 3. Method choices and the questions they raise

3.1 **ITU-R P.840.** P.840 gives the *cloud liquid-water column* statistics and a Rayleigh-regime
specific attenuation for radio frequencies. Its attenuation law does not apply at 0.85-1.55 um,
where cloud droplets are geometric scatterers. So P.840 supplies the liquid-water-column
exceedance (the amount of cloud) and an optical extinction law supplies the attenuation. The brief
lists P.840 for the method; this is the honest reading of it and the note records the deviation.
P.1814 / P.1817 are terrestrial FSO methods (clear-air attenuation, scintillation, fog); the
scintillation and fade-statistic parts are used, implemented from the published method, with no
ITU text or table vendored. Coefficient tables that the method needs (if any) are re-derived from
the underlying physics or from open papers, not copied from the ITU document.

3.2 **Turbulence.** Hufnagel-Valley Cn^2 integrated along the slant path for the Rytov variance
`sigma_R^2 = 2.25 k^(7/6) sec^(11/6)(zeta) Int Cn^2(h) (h-h0)^(5/6) dh` (downlink/uplink forms
differ; both are exposed, uplink is the PNT-relevant one). Gamma-gamma for moderate-to-strong.

3.3 **Closed-form checks** (VALIDATED-type identities, no external oracle needed): rho=0/1 limits
of the diversity union; Beer-Lambert additivity; `Cn^2 = 0` => scintillation index 0; weak-turbulence
plane/spherical-wave Rytov closed forms against hand integrals of HV 5/7; outage-holdover reduces
to `holdover::coast_phase_sigma` exactly; lumped-loss path unchanged byte for byte.

## 4. Data, with licences (record before use)

| Source | Use | Licence status |
|---|---|---|
| `data/optical_site_climatology.csv` (Cavazzani 2011, already in repo) | per-site clear-night fraction anchor | already vendored, provenance in file header |
| Copernicus ERA5 (total cloud cover, total column cloud liquid water, hourly) | liquid-water exceedance, dwell times | Copernicus licence terms **to be re-read at fetch time and recorded here before any use**; believed free with attribution, but not assumed |
| NASA MODIS (MOD08/MYD08 cloud fraction, liquid water path) | cross-check cloud fraction | NASA open data; terms to be recorded at fetch time |
| ISCCP-H (NOAA NCEI) | long-term cloud climatology cross-check | open; terms to be recorded at fetch time |

Rules applied: nothing is vendored whose licence is unclear; raw reanalysis is **fetched at test
time** with a pinned SHA-256 (hard failure on mismatch) and a CI / reproduce path; any row that
depends on it states the data gating. Only a small derived per-site table (a handful of numbers
per site, with the source, version and extraction script in the header) may be committed, and only
after the licence check above is written into this note. Until then bundled scenarios use the
existing Cavazzani anchor plus explicitly ILLUSTRATIVE exceedance curves labelled as such.

## 5. External oracle and pre-registration

Bars are pre-registered in `xval/optical-atmosphere/PREREGISTRATION.md`, committed alone **before**
any scored run, and never loosened afterwards. A miss is recorded NOT MET with a test that asserts
the miss. Candidate oracles (none selected yet; nothing is promised):

- **O1 ITU-R worked examples** (P.840 / P.1814 / P.1817 validation examples published by ITU-R
  Study Group 3): would be the cleanest external oracle for the amount-of-cloud and scintillation
  statistics. **Open question (see 6): the terms for using the published validation numbers.**
  If unclear, the numbers stay out of the repo and the row stays MODELLED.
- **O2 Published measured availability**: e.g. measured optical-ground-station or lunar optical
  link availability / cloud-free-line-of-sight statistics from peer-reviewed papers. Each candidate
  gets a citation, the measurement period and site, and a statement of whether the figure can be
  reproduced from public inputs. Selected and pinned in the pre-registration, not here.
- **O3 Published turbulence / scintillation measurements** (e.g. slant-path log-amplitude
  variance against Rytov prediction) for the scintillation module.

Planned bar shape (numbers fixed only in the pre-registration, from the oracle's own stated
uncertainty, before running): scintillation index within the oracle's published tolerance;
modelled availability for a named site within a stated band of the measured value. Modules 4
and 6 are closed-form compositions of validated pieces and carry MODELLED weather inputs, so their
rows are MODELLED unless an external availability record is matched under a registered bar.
Expected outcome if O1 and O2 both fall through: closed-form identity rows only (VALIDATED as
identities, the repo's existing convention) and everything weather- or technique-dependent
MODELLED. That is acceptable and will be stated plainly.

## 6. Open questions for the coordinator / owner (none blocks the start)

1. **ITU-R validation examples:** may the published validation values be used as test numbers?
   Default until answered: implement the methods, cite, keep ITU numbers out of the repo, no
   VALIDATED row from O1.
2. **ERA5 / MODIS / ISCCP licence confirmation** at fetch time (I will record the exact terms in
   section 4 and stop at any doubt).
3. Whether a physical-experiment partner statement belongs in the docs page. Default: no partner is
   named; the page says Kshana is the analysis side only.

## 7. Order and gates

Pre-registration commit -> modules 1-2 -> 3-4 -> 5 -> 6 -> scenario + surfaces -> scored runs ->
ledger rows and docs. Per push: fmt, clippy -D warnings, `cargo test --lib`, affected integration
tests, `cli_first_run`, MCP `round_trip`, wasm check, `scripts/check-no-attribution.sh`.

## 8. ITU-R validation numbers: licence check (17 Oct 2026)

Question: may values from ITU-R Recommendations (P.840 and its validation examples) be reproduced
as test vectors in this public AGPL repository? Status: **not cleared. The numbers stay out of the
repository until the owner decides.**

What was found, with sources:

- ITU's general terms for its documents oblige users "not to duplicate the document or parts
  thereof for distribution or sale external to the user's organization", while internal use to
  support product development is permitted (<https://www.itu.int/itudoc/about/copyrght.txt>).
  Publishing values in a public repository is distribution outside the organisation. The page is
  a general statement, not a ruling on numerical values or on validation spreadsheets.
- ITU publications may not be reproduced without prior written authorisation (ITU publications
  licence, <https://itu.int/en/publications/Documents/ITU_Licence-e.pdf>). The ITU-T software
  licence listed at <https://scancode-licensedb.aboutcode.org/itu-t.html> grants a licence to
  implement an ITU-T Recommendation in code; it is ITU-T, not ITU-R, and covers code, not test
  tables.
- The ITU-R Study Group 3 validation examples are distributed as spreadsheets. The ITU-Rpy project
  (MIT licence, <https://github.com/iportillo/ITU-Rpy>) tests against "ITU Validation examples
  rev 5.1" (<https://itu-rpy.readthedocs.io/en/latest/validation.html>). That a third project
  publishes such values is not evidence that doing so is permitted, and its documentation does not
  state the terms of the ITU file.
- I could not locate the official P.840 validation spreadsheet or its terms on itu.int in this
  session; related Working Party 3M contribution pages are restricted to ITU-R TIES users. So the
  terms of the validation examples specifically are **unknown**, not cleared.

What this means for the work:

- P.840 supplies here only the integrated cloud liquid-water *amount*; its attenuation law is a
  microwave law and is not used. The validation examples that would apply are the liquid-water
  statistics at stated coordinates, not the attenuation coefficient.
- The method is implemented from the published form (log-normal liquid-water column and
  probability of cloud as inputs). No ITU table or validation value has been copied into the
  repository.
- Options for the owner: (a) request written authorisation from ITU to reproduce the validation
  values as test vectors; (b) keep the numbers outside the repository in a data-gated test that
  fetches the file from itu.int with a pinned SHA-256, if ITU permits that access; (c) use no ITU
  values and rely on cited measured records for the weather side.
- Until the owner decides, section B of the pre-registration stays empty and no ITU-based
  VALIDATED row is added.
