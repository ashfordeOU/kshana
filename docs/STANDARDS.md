<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Standards & interoperability

Kshana speaks the standard interchange formats of the GNSS, flight-dynamics, and
timing communities so it can sit alongside RTKLIB, gLAB, Ginan, GMAT, Orekit, and
the IGS analysis-centre tooling rather than on a private island. This page maps the
**interchange formats** the engine parses or emits to the module that implements each
one and to the authoritative specification.

It is scoped to formats — things with a read/write direction. The signal and algorithm
standards the engine *implements* rather than parses (IS-GPS-200, IEEE 1139,
RTCA DO-229E, IGRF-14, the ARAIM WG-C reference, CCSDS 401/DSN) are evidenced row by
row in [`VERIFICATION-MATRIX.md`](VERIFICATION-MATRIX.md) instead.

## Formats the engine speaks

| Standard | Direction | Module | Spec / authority | Notes |
|----------|-----------|--------|------------------|-------|
| **CCSDS OEM** (Orbit Ephemeris Message) | read **and** write | [`src/oem.rs`](../src/oem.rs) | CCSDS 502.0-B Orbit Data Messages, KVN form | Tabulated state-vector ephemeris ingested by GMAT, Orekit, STK. `parse_oem` reads it back; **validated by recovering the verbatim CCSDS 502.0-B-3 Figure G-11 Blue Book example** ([`tests/ccsds_reference.rs`](../tests/ccsds_reference.rs)). The optional 6×6 position/velocity **covariance block** (`COVARIANCE_START … COVARIANCE_STOP`, the 21-element lower-triangle KVN serialization with an optional `COV_REF_FRAME`) is both written (`covariance_block_kvn`) and read (`parse_covariance_block`), round-trip-symmetric ([`src/oem.rs`](../src/oem.rs) tests). |
| **CCSDS OMM** (Orbit Mean-Elements Message) | write | [`src/omm.rs`](../src/omm.rs) | CCSDS 502.0-B-2, KVN form | Standards-track publication of SGP4/TLE mean elements (mean motion, e, i, Ω, ω, M, BSTAR). CLI-reachable on an `orbit` scenario via `--export-omm <out.omm>` or `export_omm = true` (one OMM per TLE-defined satellite, with its real NORAD id, COSPAR designator, and epoch; [`tests/sp3_export_roundtrip.rs`](../tests/sp3_export_roundtrip.rs)). XML form and a reader are follow-ons. |
| **CCSDS TDM** (Tracking Data Message) | read **and** write | [`src/ccsds_tdm.rs`](../src/ccsds_tdm.rs) | CCSDS 503.0-B Tracking Data Message, KVN form | Range / Doppler / angle tracking records a DSN/ESTRACK pass delivers to an OD system. **Validated by recovering the verbatim CCSDS 503.0-B-2 Figure E-9 Blue Book example** ([`tests/ccsds_reference.rs`](../tests/ccsds_reference.rs)). |
| **CCSDS Space Packet** (133.0) | read **and** write | [`src/space_packet.rs`](../src/space_packet.rs) | CCSDS 133.0-B-2 Space Packet Protocol | The 6-octet TM/TC primary-header framing ground systems exchange. **Encoder reproduces the independent `spacepackets-py` library's published byte-level test vectors** ([`src/space_packet.rs`](../src/space_packet.rs) tests). |
| **SP3-c / SP3-d** (precise ephemeris) | read **and** write | [`src/sp3.rs`](../src/sp3.rs) | IGS Standard Product 3 (c/d) | Earth-fixed (ECEF) position + clock time series. Round-trip validated to < 0.5 m on a real `gps-ops` snapshot ([`tests/sp3_export_roundtrip.rs`](../tests/sp3_export_roundtrip.rs)). |
| **RINEX 3** (broadcast navigation) | read | [`src/rinex.rs`](../src/rinex.rs) | RINEX 3.x NAV (IS-GPS-200, Galileo ICD, BeiDou ICD, GLONASS ICD) | Multi-GNSS NAV ingestion (GPS LNAV, Galileo F/NAV, QZSS, BeiDou MEO/IGSO, GLONASS state vector); usable as a first-class `Propagator` source. |
| **TLE / 3LE** (two-/three-line elements) | read | [`src/tle.rs`](../src/tle.rs) | NORAD / Celestrak, AIAA 2006-6753 | Propagated by the validated SGP4/SDP4 core (4.12 mm vs the 666 official AIAA vectors). |
| **RINEX 3.0x** (observation) | read | [`src/rinex_obs.rs`](../src/rinex_obs.rs) | RINEX 3.0x OBS (4.00 expected to parse, never exercised on a 4.00 file) | The other half of RINEX: the receiver's own code/carrier/Doppler/SNR records (`parse_obs`). This is the input the `pvt` single-point-positioning solver consumes alongside the broadcast navigation file ([`tests/pvt_abmf.rs`](../tests/pvt_abmf.rs), real IGS station ABMF). |
| **IONEX** (global TEC maps) | read | [`src/ionex.rs`](../src/ionex.rs) | IONEX 1.x (IGS ionosphere product) | `parse_ionex` reads the IGS global total-electron-content grids — the *measured* alternative to the broadcast Klobuchar correction — with bilinear spatial and temporal interpolation and the obliquity mapping to slant delay. |
| **IERS `finals2000A` / Bulletin B** (Earth orientation) | read | [`src/eop.rs`](../src/eop.rs), [`src/frame_eop.rs`](../src/frame_eop.rs) | IERS Conventions; IERS EOP 14 C04 / `finals2000A.all` | UT1−UTC and polar motion from the official product, including the **predicted** rows, so the frame reduction can be run in real time and its prediction-error growth budgeted ([`tests/operational_eop_predictor_reference.rs`](../tests/operational_eop_predictor_reference.rs)). |
| **KIF** (Kshana Interchange Format) | read **and** write | [`src/interchange.rs`](../src/interchange.rs) | this repository — see the envelope table above | The neutral, versioned envelope every artifact can be wrapped in: `format` / `schema_version` / `kind` / `engine_version` / `payload`, with an explicit major-minor compatibility verdict for a consumer. Not an external standard; documented here because a foreign tool has to recognise it. |
| **LunaNet / IOAG lunar interchange** | write (time metadata also read) | [`src/lunar_interop.rs`](../src/lunar_interop.rs) | LunaNet interoperability specification / IOAG lunar communications architecture, over CCSDS 502.0 | The lunar frame, lunar time scale and lunar ephemeris emitted in LunaNet/IOAG-aligned CCSDS forms (`export_lunar_oem`, `export_kif_lunar`, `export_lunar_time_metadata`), with a field-conformance check on the emitted OEM ([`tests/lunar_interoperability_export_reference.rs`](../tests/lunar_interoperability_export_reference.rs)). |

## Reference frames & time

The frame the engine emits is explicit, not implicit. The CIO-based IAU
2006/2000A reduction ([`src/cio.rs`](../src/cio.rs)) and the equinox/GMST TEME
reduction ([`src/frames.rs`](../src/frames.rs), [`src/nutation.rs`](../src/nutation.rs))
are validated bit-for-bit against the SOFA/ERFA reference vectors (see
[`VALIDATION.md`](VALIDATION.md)).

| Frame | Realization | Notes |
|-------|-------------|-------|
| **TEME** | SGP4 native | True equator, mean equinox — the SGP4/SDP4 output frame. |
| **GCRS / J2000** | IAU 2006 precession + IAU 2000A/2000B nutation | `teme_to_gcrs` (equinox chain). |
| **CIRS** | IAU 2006/2000A CIO (X, Y, s) | `gcrs_to_cirs_matrix` (`eraC2ixys`). |
| **ITRS / ECEF** | ERA + IERS polar motion (CIO) or GMST + polar motion (equinox) | `gcrs_to_itrs_matrix` (CIO, `eraC2tcio`) / `teme_to_itrf` (equinox). |
| **WGS-84 geodetic** | exact + iterative inverse | `ecef_to_geodetic` / `geodetic_to_ecef`. |

| Time scale | Use |
|------------|-----|
| **TT** | Precession/nutation/CIO argument evaluation (`jd_tt`). |
| **UT1** | Earth rotation angle / GMST (`jd_ut1`). |
| **Two-part JD** | [`src/jd2.rs`](../src/jd2.rs) `Jd2` for sub-µs epoch resolution. |

## Output-field → standard mapping (CCSDS 502.0)

For an orbit scenario, the result JSON / OEM correspondence is:

| Kshana field | CCSDS ODM (502.0) | Unit |
|--------------|-------------------|------|
| epoch (UTC/TT) | `EPOCH` | ISO-8601 |
| `coordinate_system` (TEME/ECEF/ITRF/GCRS) | `REF_FRAME` | — |
| `time_scale` | `TIME_SYSTEM` | — |
| position `x,y,z` | `X / Y / Z` | km |
| velocity `vx,vy,vz` | `X_DOT / Y_DOT / Z_DOT` | km/s |
| mean elements (OMM) | `MEAN_MOTION / ECCENTRICITY / INCLINATION / RA_OF_ASC_NODE / ARG_OF_PERICENTER / MEAN_ANOMALY` | rev/day, –, deg |

## Honest scope

- OEM, TDM, Space Packet and KIF are **read and write**; OMM is a **writer** (an OMM
  reader and the XML serialization are follow-ons); RINEX NAV, RINEX OBS, IONEX, the
  IERS EOP products and TLE are **readers**; the LunaNet/IOAG lunar export is a writer
  whose time metadata round-trips.
- The CCSDS/IGS field mapping above is documentation, not a certified conformance
  statement; formal conformance (and registration in the ESA ESSR / NASA open
  catalogue) is tracked separately and is founder-gated.
- A live SPICE/ANISE numerical cross-check of the frame reduction to the < 10 m
  level is a planned follow-on (needs SPICE kernels).
