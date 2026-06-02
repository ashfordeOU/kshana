<!-- SPDX-License-Identifier: Apache-2.0 -->
# Using real constellation TLEs

The bundled `scenarios/orbit-sgp4-gps.toml` uses **synthetic GPS-like Walker TLEs**
(placeholder NORAD catalogue IDs starting at 80001) so the repository ships a
self-contained, checksum-valid SGP4 example with no external dependency. The SGP4/SDP4
propagator itself is validated against the official AIAA 2006-6753 vectors — but the
*geometry* in that scenario is invented, not the live constellation.

To study the **real** GPS constellation (or any other), drop in a current two-line
element snapshot.

## 1. Download a current snapshot

[Celestrak](https://celestrak.org/NORAD/elements/) publishes daily TLE sets. For GPS:

```
curl -o gps-ops.txt "https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle"
```

Other useful groups: `galileo`, `glo-ops` (GLONASS), `beidou`, `stations` (ISS, etc.).

The file is a sequence of three-line records (name, line 1, line 2). Kshana's parser
ignores name lines, so you can paste the file as-is.

## 2. Drop it into a scenario

In any orbit scenario, set the constellation `tle` block to the snapshot contents:

```toml
[constellation]
# Paste the Celestrak gps-ops block here (name/line1/line2 triples).
strict_checksum = true   # real Celestrak TLEs carry valid checksums; enforce them
tle = """
GPS BIIR-2  (PRN 13)
1 24876U 97035A   24001.50000000  .00000027  00000-0  00000+0 0  9990
2 24876  55.4° ...
...
"""
```

A line 1 + line 2 pair is propagated with **SGP4/SDP4** (drag and deep-space terms);
a bare line 2 is treated as analytic Keplerian mean elements. The two may be mixed.

`strict_checksum = true` rejects any line whose column-69 modulo-10 checksum is wrong —
a good integrity check on a freshly downloaded file. It defaults to `false` because the
synthetic teaching scenarios use placeholder checksums.

## 3. Notes on epochs

SGP4 propagates each satellite from **its own TLE epoch**. For a meaningful snapshot
study, use a set downloaded close together in time (Celestrak group files are), and
interpret the scenario time as seconds from that common epoch.

## See also

- [`README.md`](../README.md) — the orbit scenarios and the `constellation` schema.
- `src/tle.rs` — the parser (`parse_propagators`, `ParseOpts { strict_checksum }`).
