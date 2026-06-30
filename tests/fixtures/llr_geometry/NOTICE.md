# LLR Geometry Fixtures — Provenance Notice

## Retroreflector PA-frame coordinates (`reflectors.csv`)

**Source:** Park, R. S. et al. (2021) "The JPL Planetary and Lunar Ephemerides DE440 and
DE441", *The Astronomical Journal*, 161, 105. doi:10.3847/1538-3881/abd414
(DE440 LLR retroreflector solution, Table 4 — principal-axis body-frame positions).

**Secondary survey reference:** Williams, J. G. et al. (2008), "Lunar laser ranging
science: Gravitational physics and lunar interior and geodesy", *Advances in Space
Research*, 37(1), 67–71. doi:10.1016/j.asr.2005.05.013

**Coordinate values:** PA body-frame Cartesian positions taken directly from Table 1
of the DE440 paper (Park et al. 2021). Values are in metres.

| Site        |        X (m)   |       Y (m)   |        Z (m)  |
|-------------|----------------|---------------|---------------|
| Apollo 11   |  1 591 967.049 |   690 698.573 |    21 004.461 |
| Apollo 14   |  1 652 689.369 |  −520 998.431 |  −109 729.869 |
| Apollo 15   |  1 554 678.104 |    98 094.498 |   765 005.863 |
| Lunokhod 1  |  1 114 291.452 |  −781 299.273 | 1 076 059.049 |
| Lunokhod 2  |  1 339 363.598 |   801 870.995 |   756 359.260 |

The sites lie at radii 1 734–1 737 km, within ~3 km of the mean lunar radius (1 737.4 km).
The test tolerance |r − 1737.4 km| < 10 km checks genuine topography, not a sphere.

**License note:** Published scientific coordinates are factual constants and are not
copyrightable; cited per good scholarly practice.

## Station geodetic coordinates (`stations.csv`)

**Source:** ILRS (International Laser Ranging Service) station logs and site reports.
Coordinates are ITRF-aligned geodetic (WGS84 compatible):
- Grasse OCA (France):           43.7546°N, 6.9215°E, 1320 m
- APOLLO/APO (New Mexico, USA):  32.780°N, 105.820°W, 2780 m
- Wettzell WLRS (Germany):       49.1450°N, 12.8780°E,  665 m
- Matera MLRO (Italy):           40.6486°N, 16.7046°E,  537 m

## Oracle anchor for downstream analysis

**Sośnica, K. et al. (2025)**, "Definition and Realization of the International Lunar
Reference Frame", arXiv:2510.15484.
Reports lunocenter-X ↔ scale correlation r ≈ −0.97 and a centre-of-mass origin X-floor
~12 cm from LLR normal-point analysis. Used as the external oracle for validating the
Fisher-information datum-defect results produced by `src/lunar_llr.rs`.

## DE440 lunar principal-axis orientation time series (`de440_moon_pa.csv`)

**Source:** JPL Development Ephemeris DE440 binary PCK kernel
`moon_pa_de440_200625.bpc` — the numerically-integrated MOON_PA_DE440 physical libration.

**Primary citation:** Park, R. S. et al. (2021) "The JPL Planetary and Lunar Ephemerides
DE440 and DE441", *The Astronomical Journal*, 161, 105. doi:10.3847/1538-3881/abd414

**Kernel file:** `moon_pa_de440_200625.bpc` (NAIF/JPL, 2021-06-25); frame ID 31008
(MOON_PA_DE440 in SPICE/NAIF conventions).

**Companion kernels fetched from NAIF generic_kernels (not vendored):**
- `naif0012.tls` (leapseconds kernel)
- `pck00011.tpc` (planetary body constants — text PCK, loaded before BPC so binary overrides)
- `moon_de440_200625.tf` — minimal frame kernel (constructed at generation time to register
  MOON_PA_DE440 as frame 31008 pointing to the binary PCK segment; the standard NAIF companion
  for this BPC was not publicly available via generic_kernels at generation time)

**Toolkit:** spiceypy 8.1.2 (wrapping CSPICE N0067).

**Generation script:** `scripts/gen_de440_moon_pa.py` (committed; run with the venv at
`/tmp/kshana-oracles/.venv/bin/python` to reproduce).

**Window and cadence:** 2024-01-01 00:00:00 TDB through 2025-12-31 00:00:00 TDB, 1-day
cadence, 731 rows.

**Columns:** `t_tt_jc, r00, r01, r02, r10, r11, r12, r20, r21, r22` where `t_tt_jc =
(JD_TDB − 2 451 545.0) / 36 525.0` (Julian centuries from J2000 in TDB) and `r{i}{j}` is
element (i,j) of the 3×3 MOON_PA_DE440 → J2000 rotation matrix (body PA → inertial).

**TT ≈ TDB assumption:** The `t_tt_jc` column is labelled in TT but computed from TDB epochs.
TT and TDB differ by at most ~2 ms (periodic, bounded); at libration rates of ~µrad/s this
introduces <1 nrad of orientation error, which is immaterial to the LLR Fisher analysis.
Documented here as a Modelled (not Validated) assumption.

**Libration amplitude (generation sanity check):**  
Sub-Earth longitude amplitude ±7.786°; latitude amplitude ±6.797° (measured over the window
by projecting the Earth direction from de440s.bsp into the MOON_PA_DE440 body frame).
Both values match the known optical libration amplitude (±7.9° lon / ±6.7° lat), confirming
real physical libration is embedded rather than a mean/fixed rotation.

**License note:** NASA/JPL publicly released kernel data; factual scientific constants are
not copyrightable. Cited per good scholarly practice.

## File integrity

| File                | SHA-256                                                          |
|---------------------|------------------------------------------------------------------|
| reflectors.csv      | 760b8a9b846b5d142add68381a5e92ac219094c4ef03f9ae349b9b06b904a8d1 |
| stations.csv        | 945cdc3c5c2c5f1721df2f59bf4549005f152a98a9cf86936d2abe880295f416 |
| de440_moon_pa.csv   | 3076f81ef95d83f5efa240ed4c7ccb422f109407dde841fcf28d42dc63586eb7 |

## Multi-technique OED — Modelled assumptions (P1 Part C)

This section records the Modelled inputs to the cost/degeneracy Pareto frontier
computed by `src/lunar_oed.rs::representative_lunar_menu` and `pareto_frontier`.

### Beacon selenographic locations (body-frame PA coordinates; R = 1 737 400 m)

| Block            | Body-frame X (m)   | Body-frame Y (m)  | Body-frame Z (m)  | Description                          |
|------------------|--------------------|-------------------|-------------------|--------------------------------------|
| LLR              | (DE440 reflectors) | (DE440)           | (DE440)           | 5 real retroreflectors (Park+ 2021)  |
| VLBI-limb        | +0.5 R ≈ +868 700  | +0.866 R ≈ +1 505 000 | 0           | Limb beacon, selenographic lon ~60°  |
| Orbiter-nearside | +0.9 R ≈ +1 563 660 | +0.2 R ≈ +347 480 | +0.2 R ≈ +347 480 | Near-side beacon (positive X body)   |
| Orbiter-farside  | −0.9 R ≈ −1 563 660 | +0.2 R ≈ +347 480 | +0.2 R ≈ +347 480 | Far-side beacon (negative X body; primary radial-diversity breaker) |

### Orbiter geometry

- Altitude: 100 km above mean lunar radius
- Inclination: 88° (near-polar)
- RAAN: 30°
- Argument of latitude at t0: advances 13° per step (representative sampling)
- Line-of-sight gate: `dot(beacon_inertial − moon, orbiter − moon) > 0` (beacon on orbiter-facing hemisphere)

### Per-technique measurement precision (σ)

| Technique        | σ                     | Notes                                                                      |
|------------------|-----------------------|----------------------------------------------------------------------------|
| LLR              | 3 mm (0.003 m)        | Representative of current normal-point precision; Modelled                 |
| VLBI-limb        | 1×10⁻¹¹ s            | Same-beam differential delay; ≈ 3 mm path-equivalent (c·σ); Modelled      |
| Orbiter ranging  | 5 cm (0.05 m)         | Representative cm–dm one-way range precision for a lunar orbiter; Modelled |

### Relative costs

| Block            | Relative cost | Rationale                                                        |
|------------------|---------------|------------------------------------------------------------------|
| LLR              | 1.0           | Established infrastructure; cheapest marginal campaign           |
| VLBI-limb        | 3.0           | Requires coordinated multi-station VLBI network + beacon         |
| Orbiter-nearside | 4.0           | Dedicated lunar orbiter campaign; near-side beacon               |
| Orbiter-farside  | 5.0           | As above but with relay or direct-to-Earth link for far-side beacon |

### Schedule

- Epoch t0: 2024-01-01 TT (JD 2 460 310.5, inside the DE440 fixture window)
- Duration: ≈ 1 synodic month (29.5 days)
- Cadence: 6 h step
- LLR: uses the full multi-reflector geometry and station-elevation gate from `llr_datum_rows`
- VLBI: gated to Earth-facing epochs (beacon on near-Earth hemisphere)
- Orbiter: same cadence; LOS gate per epoch

### Honesty statement

All inputs above are **representative, not mission values**. They were chosen to be
physically plausible (lunar-scale geometry, realistic noise floors, sensible relative
economics) and to exercise the mathematical structure of the datum problem. The
deliverable is the **shape and ordering of the cost/accuracy trade frontier** and the
finding that **radial/depth diversity (orbiter far-side ranging) breaks the
lunocenter-X ↔ scale degeneracy approximately 8× more efficiently per unit cost than
transverse VLBI**, not a single recommended budget or a claim about any real mission.
The CRLB figures, degeneracy-metric magnitudes, and relative cost ratios all carry
**Modelled** status (see `src/lunar_identifiability.rs` honesty note).
