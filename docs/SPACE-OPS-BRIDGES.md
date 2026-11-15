# Space operations: CCSDS messages and mission control bridges (0.42 I8)

## What was already there

| Format | Module | Read | Write |
|---|---|---|---|
| CCSDS OEM (502.0-B-3) | `kshana::oem` | yes | yes |
| CCSDS OPM, OMM, OCM (502.0-B-3, KVN and XML) | `kshana::odm` | yes | yes |
| CCSDS OMM KVN from a TLE | `kshana::omm` | | yes |
| CCSDS TDM (503.0-B-2) | `kshana::ccsds_tdm` | yes | yes |
| CCSDS ADM: AEM and APM (504.0-B-2, KVN and XML) | `kshana::adm` | yes | yes |
| IGS SP3 | `kshana::sp3` | yes | yes (`Sp3File::to_sp3_string`, `orbit` export) |
| CCSDS Space Packet (133.0-B-2) with CUC/CDS secondary headers | `kshana::space_packet` | yes | yes |

The ODM and ADM readers and writers are checked against Orekit (see [INTEROP.md](INTEROP.md) and
[FLIGHT-DYNAMICS-EXPORT.md](FLIGHT-DYNAMICS-EXPORT.md)). Wave 2 adds no new orbit or attitude
message: each listed above was present.

## The trust stream as telemetry (new)

`kshana::tm_bridge` turns each epoch of the trust stream into one CCSDS Space Packet (version 1,
telemetry, no secondary header, unsegmented) and writes the packet's definition for the ground
systems:

```sh
kshana connect tm xtce --apid 100 > kshana.xtce.xml        # XTCE 1.2: Yamcs mission database, other XTCE tools
kshana connect tm cosmos --name KSHANA > kshana_tlm.txt    # OpenC3 COSMOS cmd_tlm telemetry definition
kshana connect tm openmct > kshana-dictionary.json          # Open MCT telemetry dictionary
kshana trust-telemetry ... | kshana connect tm-stream - --to packets --udp 127.0.0.1:10015   # to a Yamcs UDP TM link
kshana connect tm-stream trust.jsonl --to openmct --epoch-unix 1763078400                  # Open MCT realtime datums
```

User data, big-endian: `T_S` (double, seconds since the first epoch), `SCORE` (single, NaN when the
source gives none), `BAND` (unsigned 8: 0 calibrating, 1 nominal, 2 degraded, 3 untrusted, 4
unknown), `N_REASONS` (unsigned 8), `LAT_DEG`, `LON_DEG`, `HEIGHT_M` (doubles, NaN without a
position). The XTCE file declares the CCSDS primary header as an abstract container and the trust
packet inheriting it with a restriction on the APID, the pattern Yamcs reads. The COSMOS file names
the APID as the `ID_ITEM` and the band states. The Open MCT dictionary follows the shape of Open
MCT's telemetry tutorial (each measurement with a `value` range and a `utc` domain); `tm-stream --to
openmct` prints `{timestamp, value, id}` datums, one JSON object a line, for an Open MCT realtime
adapter to forward.

## Tests

`tests/connect_042_w2.rs`: packets round trip through `tm_bridge::decode`, and are decoded again by
a reader of the COSMOS definition and by the XTCE entry list with its type sizes, giving the same
values; the XTCE document is checked against the OMG XTCE 1.2 schema with `xmllint` when the schema
is present (`scripts/fetch_042_w2_schemas.sh`; `KSHANA_REQUIRE_REALDATA=1` makes a missing schema an
error). A round trip through a running Yamcs or Orekit in CI is not part of this wave.

## Not built yet

- A Yamcs, COSMOS or Open MCT plugin; the bridges here are files and a UDP packet stream.
- Telecommands: nothing is ever commanded.
- XTCE import of a third-party mission database.
