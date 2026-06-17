<!-- SPDX-License-Identifier: Apache-2.0 -->
# Standards & interoperability

Kshana speaks the standard interchange formats of the GNSS, flight-dynamics, and
timing communities so it can sit alongside RTKLIB, gLAB, Ginan, GMAT, Orekit, and
the IGS analysis-centre tooling rather than on a private island. This page maps
every standard the engine reads or writes to the module that implements it and
to the authoritative specification.

## Formats the engine speaks

| Standard | Direction | Module | Spec / authority | Notes |
|----------|-----------|--------|------------------|-------|
| **CCSDS OEM** (Orbit Ephemeris Message) | read **and** write | [`src/oem.rs`](../src/oem.rs) | CCSDS 502.0-B Orbit Data Messages, KVN form | Tabulated state-vector ephemeris ingested by GMAT, Orekit, STK. `parse_oem` reads it back; **validated by recovering the verbatim CCSDS 502.0-B-3 Figure G-11 Blue Book example** ([`tests/ccsds_reference.rs`](../tests/ccsds_reference.rs)). |
| **CCSDS OMM** (Orbit Mean-Elements Message) | write | [`src/omm.rs`](../src/omm.rs) | CCSDS 502.0-B-2, KVN form | Standards-track publication of SGP4/TLE mean elements (mean motion, e, i, Ω, ω, M, BSTAR). CLI-reachable on an `orbit` scenario via `--export-omm <out.omm>` or `export_omm = true` (one OMM per TLE-defined satellite, with its real NORAD id, COSPAR designator, and epoch; [`tests/sp3_export_roundtrip.rs`](../tests/sp3_export_roundtrip.rs)). XML form and a reader are follow-ons. |
| **CCSDS TDM** (Tracking Data Message) | read **and** write | [`src/ccsds_tdm.rs`](../src/ccsds_tdm.rs) | CCSDS 503.0-B Tracking Data Message, KVN form | Range / Doppler / angle tracking records a DSN/ESTRACK pass delivers to an OD system. **Validated by recovering the verbatim CCSDS 503.0-B-2 Figure E-9 Blue Book example** ([`tests/ccsds_reference.rs`](../tests/ccsds_reference.rs)). |
| **CCSDS Space Packet** (133.0) | read **and** write | [`src/space_packet.rs`](../src/space_packet.rs) | CCSDS 133.0-B-2 Space Packet Protocol | The 6-octet TM/TC primary-header framing ground systems exchange. **Encoder reproduces the independent `spacepackets-py` library's published byte-level test vectors** ([`src/space_packet.rs`](../src/space_packet.rs) tests). |
| **SP3-c / SP3-d** (precise ephemeris) | read **and** write | [`src/sp3.rs`](../src/sp3.rs) | IGS Standard Product 3 (c/d) | Earth-fixed (ECEF) position + clock time series. Round-trip validated to < 0.5 m on a real `gps-ops` snapshot ([`tests/sp3_export_roundtrip.rs`](../tests/sp3_export_roundtrip.rs)). |
| **RINEX 3** (broadcast navigation) | read | [`src/rinex.rs`](../src/rinex.rs) | RINEX 3.x NAV (IS-GPS-200, Galileo ICD, BeiDou ICD, GLONASS ICD) | Multi-GNSS NAV ingestion (GPS LNAV, Galileo F/NAV, QZSS, BeiDou MEO/IGSO, GLONASS state vector); usable as a first-class `Propagator` source. |
| **TLE / 3LE** (two-/three-line elements) | read | [`src/tle.rs`](../src/tle.rs) | NORAD / Celestrak, AIAA 2006-6753 | Propagated by the validated SGP4/SDP4 core (4.12 mm vs the 666 official AIAA vectors). |

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

- OEM, TDM, and Space Packet are **read and write**; OMM is a **writer** (an OMM reader and the XML serialization are follow-ons).
- The CCSDS/IGS field mapping above is documentation, not a certified conformance
  statement; formal conformance (and registration in the ESA ESSR / NASA open
  catalogue) is tracked separately and is founder-gated.
- A live SPICE/ANISE numerical cross-check of the frame reduction to the < 10 m
  level is a planned follow-on (needs SPICE kernels).
