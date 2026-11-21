# LunaNet AFS receiver verification kit

`kshana lunar-afs-kit` collects what a team building an Augmented Forward Signal (AFS) receiver
can test against: bit-true code vectors, a PRN and code allocation registry with a collision
checker, and a real-time output message profile. It builds on the AFS generator
(`src/lunar_afs/`, [LUNANET-AFS.md](LUNANET-AFS.md)), the lunar time scales and frames
([LUNAR-REF.md](LUNAR-REF.md)). MODELLED: nothing here is a statement of conformance to LSIS or of
a receiver's performance.

```
kshana lunar-afs-kit vectors
kshana lunar-afs-kit registry                       # LSIS V1.0 Table 11, with correlations
kshana lunar-afs-kit registry my-nodes.toml --limit-db -24
kshana lunar-afs-kit output-example --n 60 > stream.jsonl
kshana lunar-afs-kit output-check stream.jsonl
kshana lunar-afs-kit output-reexpress stream.jsonl --scale tt --frame ICRF
```

## Bit-true vectors

`data/conformance/lunar-afs/afs-q-vectors.json` (`kshana.afs-vectors/1`) holds, for every AFS-Q
primary PRN 1 to 210, the length, the number of ones, the first and last 24 chips in octal and the
SHA-256 of the 10,230 chips (bytes of value 0 or 1); the four secondary codes; CRC-24Q of four byte
strings; and the SB1 codeword of the standard's Figure 8 worked example. They were computed by an
independent generator (`gen_afs_vectors.py`, Python standard library only) from the IS-GPS-800J
Weil indices and the LSIS V1.0 construction, never by kshana. `vectors` runs them against kshana
(exit 1 on any failure); another team can run the same file against its own generator.

**Agreement with `kshana lunanet-afs-check spec`.** The test
`the_vectors_agree_with_the_tables_lunanet_afs_check_spec_checks` compares the first and last 24
chips of all 210 vectors with the printed values the spec check's bar B3 uses (210 of 210), and
checks that bars B3, B5, B6 and B7 are met. AFS-I codes, tertiary codes and LDPC need the LSIS
attachments and are not in the vector file.

## PRN and code allocation registry

A registry is a list of `[[node]]` allocations (TOML or JSON): `node_id`, `i_prn`, `q_prn`,
`secondary` (0-3 for S0-S3), `tertiary_prn`, `tertiary_phase`, with a `provider` and `status`.
Without a file the registry is LSIS V1.0's interim Table 11 (nodes 1 to 12). The checker reports
range errors, collisions (same node identifier, AFS-I PRN, AFS-Q primary PRN, or tertiary PRN and
phase) and, unless `--no-correlation`, the largest even periodic cross-correlation of every pair of
AFS-Q primary codes and each code's largest out-of-phase autocorrelation over all 10,230 phases,
against a limit (default −20 dB, a choice of this tool, not of the standard). Doppler-shifted
correlation is not computed.

## Real-time output message profile

`kshana.lunar-pnt-output/1` is one JSON object per line per solution epoch:

| field | rule |
|---|---|
| `profile` | `kshana.lunar-pnt-output/1` |
| `seq` | increases by one |
| `epoch` | `{"scale": TT\|TDB\|TCB\|TCG\|TCL\|LTC, "jd0": day + 0.5, "s": seconds in [0, 86400)}`, increasing |
| `frame` | `ICRF`, `MOON_PA_DE440`, `MOON_PA`, `MOON_ME` or `ILURF`, lunar-centred |
| `position_m` | three numbers, magnitude 1,600 km to 1,000,000 km |
| `velocity_m_s` | optional, under 20 km/s |
| `clock_bias_s`, `clock_drift` | optional finite numbers |
| `covariance_upper` | optional, 6 or 21 numbers (upper triangle, row by row), positive semi-definite |
| `sources` | optional `{"node_id", "q_prn" 1-210 distinct, "cn0_dbhz" 0-60}` |
| `solution` | `fix`, `float`, `propagated` or `none` |
| `integrity` | optional `{"status": nominal\|degraded\|unmonitored, "hpl_m", "vpl_m"}`, levels positive |

The epoch carries its scale and the position its frame, so a consumer re-expresses a stream in the
scale and frame it needs (`output-reexpress`, through the lunar time-scale converter and frame
transformations; a covariance is dropped rather than carried unrotated). `output-check` names every
broken field by line. `output-example` writes a synthetic stream (a user at rest on the surface) for
testing decoders. The profile is kshana's own; no lunar output message standard was read for it.

Not built: an interoperability study and a user-equipment register (optional in the item).
