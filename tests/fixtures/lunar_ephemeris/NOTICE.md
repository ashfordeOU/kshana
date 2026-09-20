# Lunar constellation geometry fixtures — provenance & checksums

These are the files `moonlight-service-volume`'s `ephemeris_path` reads. They exist so the
lunar service-volume figures — coverage, DOP, the protection-level envelope, and the σ_URE
ranging requirement derived from them — can rest on geometry that came from somewhere real
instead of only on the engine's illustrative LCNS-class Keplerian set, and so that a reader
can tell which is which from the emitted provenance class alone.

Every number in every file here comes from one of exactly two places, both recorded below
with a URL, a retrieval date and a SHA-256, and both regenerable by a committed generator.
Nothing is transcribed from memory and nothing is interpolated from a description.

## What is NOT here, and why

**No real lunar navigation constellation ephemeris exists in public.** No agency has
published an SPK/BSP kernel, an almanac or a state table for Moonlight/LCNS, LCRNS or LNSS
— those systems are not flying. Searched and not found: NASA NAIF's public kernel archive
(`naif.jpl.nasa.gov/pub/naif/`, which carries no lunar-navigation mission at all), JPL
Horizons (which carries real lunar *spacecraft*, and those are used below, but no
navigation constellation), and ESA/Telespazio Moonlight material (programme descriptions,
no orbital parameters). What *is* published is a constellation **definition** — element
tables in an agency conference paper and in a peer-reviewed journal article — and those
are the first two fixtures below.

There is also **no binary-kernel parser in this crate, deliberately.** The repository's
SPICE reader is ANISE, which is MPL-2.0 and Rust edition 2024 and is therefore confined to
the workspace-excluded `xval/` crates: pulling it into the main graph would break both the
`cargo deny` licence gate and the MSRV job (see `xval/anise-frames/Cargo.toml`). Rather
than hand-roll a second, unvalidated DAF/SPK reader in the middle of a provenance story,
the fixture is the kernel **as evaluated by its publisher**, with the evaluator and the
exact query recorded in the file header — the same choice `tests/fixtures/agency/lro/`
already makes.

## Published candidate constellation, primary agency source (`published-elements`)

### `lans_demo_ntrs20250009447.csv`

- **Product:** Table 3, "Assumptions for the simulation of the LANS satellites" — the five
  satellites of the joint ESA / NASA / JAXA **Lunar Augmented Navigation Service (LANS)
  interoperability demonstration**: one ESA Moonlight/LCNS navigation satellite, one JAXA
  LNSS demonstration satellite and three NASA LCRNS satellites, as classical elements in
  the **ICRF** frame at epoch 2027-01-01 00:00:00.000 TDB.
- **Source (open, no login):** F. T. Melman, R. D. Swinden, J. S. Oduber, Y. Audet,
  C. Stallo, C. J. Gramling, J. M. Crenshaw, M. Murata, S. Okamoto, J. Ventura-Traveset
  and S. Molli, "Lunar Augmented Navigation Service Interoperability Demonstration —
  Reference Products and Expected PVT Accuracy", ION GNSS+ 2025, Baltimore MD,
  8–12 September 2025. NASA NTRS record **20250009447**.
  PDF: `https://ntrs.nasa.gov/api/citations/20250009447/downloads/LANS_Demo_ION_Paper_v1_3.pdf`
- **Retrieved:** 2026-09-20
- **Source SHA-256 (the NTRS PDF):**
  `d1b916be31afad8ff6fc535cff2df1a0c3233c2123830f792e5e1cf439c6ce05`
- **Slice / transformation:** the six element rows of Table 3, carried through as the
  source's own digit strings (`11999.2626`, not a re-formatted `11999.3`), including the
  **true** anomaly as published — the reader converts it to the mean anomaly with
  `lunar_ephemeris::true_to_mean_anomaly_deg`, so every field of the fixture can be
  checked against the page. The epoch's Julian date is computed arithmetically by the
  generator, not quoted.
- **Generator:** `generate_lans_demo_ntrs.py` — hash-verifies the PDF, parses the six rows
  with a strict regex, and additionally asserts that all five column labels and the stated
  epoch really appear in the document before writing anything.
- **Frame:** ICRF, as stated. The elements are propagated in that same inertial frame and
  reduced to Moon-fixed by the IAU 2015 / WGCCRE lunar orientation
  (`lunar_frame::icrf_to_iau_moon`) at each epoch, so **no frame approximation is
  involved** and no tie angle is reported for this fixture.
- **The source's own caveat travels with the numbers**, verbatim in the file header and in
  the emitted `ephemeris.source_caveat`: the paper states that these orbits are *notional
  and are only applicable for a preliminary performance analysis within the context of
  that publication*.
- **SHA-256:** `493eee9693853bd731eed821065e2494b8a84ef44d0dd74c74e7bd9d8e75d4cf`
- **What it shows:** five satellites can never put the six in view that the single-fault
  ARAIM hypothesis set needs, so over the south-polar service volume this constellation
  gives 23.6 % coverage, 2–5 satellites in view, and **no protection level at all** — the
  σ_URE requirement comes back *absent*, not manufactured. The source reaches the same
  conclusion by a different route, attributing its high DOP to "the low number of
  satellites and the non-exhaustive optimization of the orbits".

## Published candidate constellation, full N-satellite design (`published-elements`)

### `lncss_case_a_navi613.csv`, `lncss_case_b_navi613.csv`, `lncss_case_c_navi613.csv`

- **Product:** Table 1, "Orbital Parameters Represented in the OP Frame for the Three
  LNCSS Constellation Case Studies" — the three case studies (8, 12 and 16 satellites) of
  a lunar navigation and communication satellite system on an elliptical lunar frozen
  orbit, each satellite sharing `a = 6143 km`, `e = 0.6`, `i = 51.7°`, `ω = 90°` and
  differing only in RAAN and mean anomaly.
- **Source (open access, CC BY):** S. Bhamidipati, T. Mina, A. Sanchez and G. Gao,
  "Satellite Constellation Design for a Lunar Navigation and Communication System",
  *NAVIGATION: Journal of the Institute of Navigation* **70**(4), navi.613, 2023.
  DOI [10.33012/navi.613](https://doi.org/10.33012/navi.613).
  PDF: `https://navi.ion.org/content/navi/70/4/navi.613.full.pdf`
- **Retrieved:** 2026-09-20
- **Source SHA-256 (the publisher PDF):**
  `4e2946873f1b62f98615f500f894cfe05c128444f9770235095bd4606df35162`
- **Slice / transformation:** the three Table 1 rows, with each row's `x:y:z` RAAN and
  mean-anomaly short-hand expanded into the explicit per-satellite set the table's own
  caption enumerates (case A: `[0,0] [0,90] [0,180] [0,270] [180,0] [180,90] [180,180]
  [180,270]`). No value is altered, rounded or added.
- **Generator:** `generate_lncss_navi613.py` — downloads the PDF, refuses to proceed if
  its SHA-256 has moved, extracts the text layer with `pdftotext -layout` (poppler),
  parses the rows with a strict regex, and fails rather than emitting a number if the
  table cannot be found. `python3 generate_lncss_navi613.py` regenerates all three files
  byte-for-byte.
- **Frame caveat, stated not absorbed:** the source states the elements in the **OP**
  (Earth orbital plane) frame of Ely (2005) / Ely and Lieb (2006), whose `z` axis is the
  Moon's orbit normal about the Earth. This engine's Moon-centred inertial frame has the
  lunar spin axis for `z`. Reading the published elements as MCI therefore tilts the
  constellation by the angle between those two axes; the report emits that angle as
  `ephemeris.published_frame_tie_angle_deg`, **computed** at run time by
  `lunar_ephemeris::published_frame_tie_angle_deg` from the crate's own lunar ephemeris
  and IAU 2015 pole (≈ 6.81° at J2000), never quoted. It is a bounded, reported
  approximation — not a correction.
- **SHA-256:**
  - `lncss_case_a_navi613.csv` —
    `3c65d26ff2a2f65694e97cab5fc75db565fd6d706d2c9a38e2452034e339aed3`
  - `lncss_case_b_navi613.csv` —
    `5426f8b83b78aabdad45511fbe8e14a893ee291a1a8458894cf5d4c0b3593fde`
  - `lncss_case_c_navi613.csv` —
    `9df7726a7c3ac83c99b21cd95d2b9dda8c00a1272847de3e59acba379b63622d`

## Real flown lunar spacecraft (`published-ephemeris`)

### `horizons_lunar_orbiters_2023001_12h.csv`

- **Product:** geometric Moon-centred state vectors for the four spacecraft that were
  actually in lunar orbit on 2023-01-01, evaluated by NASA/JPL from its own reconstructed
  SPK kernels — `-85` LRO (NASA/GSFC), `-155` Danuri/KPLO (KARI), `-152` Chandrayaan-2
  orbiter (ISRO), `-1176` CAPSTONE (NASA, 9:2 lunar NRHO).
- **Source (open, no login):** JPL Horizons API (NASA/JPL Solar System Dynamics),
  `https://ssd.jpl.nasa.gov/api/horizons.api` — `CENTER='@301'` (Moon body centre),
  `REF_PLANE='FRAME'`, `REF_SYSTEM='ICRF'`, `EPHEM_TYPE='VECTORS'`, `VEC_TABLE='1'`,
  `OUT_UNITS='KM-S'`. Geometric states, no aberration or light-time. The same service and
  frame convention `tests/fixtures/agency/lro/LRO_2022001_Moon_ICRF_4h.csv` already uses.
- **Retrieved:** 2026-09-20
- **Slice:** 2023-01-01 00:00 .. 12:00 TDB, 5-minute step (145 epochs × 4 spacecraft =
  580 rows), epoch column rewritten as seconds past the header's
  `epoch_jd_tdb = 2459945.5`.
- **Generator:** `fetch_horizons_lunar_orbiters.py` — one query per NAIF id, strict
  parsing of the `$$SOE`/`$$EOE` block, and a refusal if the four targets return different
  epoch counts.
- **SHA-256:** `8b3e6ad17c623b24371170e2fb5cb5f45a73200299a73349908341f128a834a5`
- **This is NOT a navigation constellation** and is not presented as one. It is the real
  lunar-orbit population, used to prove that the `states` path really does eat an agency
  ephemeris, and to show what that population can and cannot do geometrically: over the
  south-polar service volume it puts 1–2 satellites in view, gives zero coverage, and
  admits no ARAIM protection level at all — so the σ_URE requirement is reported as
  **absent**, not invented from an empty envelope.

## Licensing

The NAVIGATION article is open access under a Creative Commons Attribution (CC BY)
licence; the Table 1 values are reproduced here with the attribution above. The LANS
demonstration paper is distributed publicly through the NASA Technical Reports Server; its
Table 3 element values are reproduced here with the full author and venue attribution
above and with the source's own "notional" caveat attached. NASA/JPL Horizons products are
published for open use with attribution. These slices are
redistributed solely so Kshana's lunar service-volume geometry is independently
reproducible; all credit for the underlying work remains with the authors and with
NASA/JPL Solar System Dynamics and the LRO, Danuri/KPLO, Chandrayaan-2 and CAPSTONE
missions.
