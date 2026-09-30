<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Using real constellation TLEs

The bundled `scenarios/orbit-sgp4-gps.toml` already carries **real TLEs** (two-line
element sets): the Celestrak `gps-ops` snapshot of the operational GPS (Global Positioning
System) constellation catalogued on 2021-07-28, 30 satellites, with
`strict_checksum = true`. Each satellite is propagated with SGP4/SDP4 (Simplified General
Perturbations 4 / Simplified Deep-space Perturbations 4), which is validated against the
official AIAA (American Institute of Aeronautics and Astronautics) 2006-6753 vectors. The
same snapshot is vendored as `tests/fixtures/celestrak/gps-ops_2021-07-28.txt`, and
`scripts/fetch_tles.sh` fetches a fresh one. Read section 3 before quoting a geometry
number from it: that scenario propagates each satellite from its own epoch.

For a synthetic, self-contained example, `scenarios/orbit-real-tle.toml` gives six GPS-like
satellites as bare line-2 records, propagated as analytic Keplerian elements, and every
`orbit` scenario without a `tle` block builds a Walker constellation.

To study the **current** GPS constellation (or any other), drop in a fresh snapshot.

## 1. Download a current snapshot

[Celestrak](https://celestrak.org/NORAD/elements/) redistributes the NORAD (North American
Aerospace Defense Command) catalogue element sets, refreshed at least daily. For GPS:

```
curl -o gps-ops.txt "https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle"
```

Other useful groups: `galileo`, `glo-ops` (GLONASS, Russia's Global Navigation Satellite
System), `beidou`, `stations` (the ISS, International Space Station, and other crewed
stations).

The file is a sequence of three-line records (name, line 1, line 2). Kshana's parser
ignores name lines, so you can paste the file as-is.

## 2. Drop it into a scenario

In any orbit scenario, set the constellation `tle` block to the snapshot contents:

```toml
[constellation]
# Paste the Celestrak gps-ops block here (name/line1/line2 triples). Two real records
# from tests/fixtures/celestrak/gps-ops_2026-06-07.txt are shown; a real block has ~30.
strict_checksum = true   # real Celestrak TLEs carry valid checksums; enforce them
tle = """
GPS BIIR-5  (PRN 22)
1 26407U 00040A   26158.26673196  .00000043  00000+0  00000+0 0  9990
2 26407  54.8526 215.5566 0121168 302.4173  18.5084  2.00557626189748
GPS BIIR-8  (PRN 16)
1 27663U 03005A   26157.61055816  .00000039  00000+0  00000+0 0  9995
2 27663  54.8837 215.3893 0147927  53.0597 289.9583  2.00561160171094
"""
```

(PRN is the pseudorandom-noise code number a GPS satellite transmits.)

A line 1 + line 2 pair is propagated with **SGP4/SDP4** (drag and deep-space terms);
a bare line 2 is treated as analytic Keplerian mean elements. The two may be mixed.

`strict_checksum = true` rejects any line whose column-69 modulo-10 checksum is wrong —
a good integrity check on a freshly downloaded file. It defaults to `false` because the
synthetic teaching scenarios use placeholder checksums.

## 3. Notes on epochs — read this before quoting a geometry number

SGP4 propagates each satellite from **its own TLE epoch**, and `parse_propagators`
(in `src/tle.rs`) returns propagators only, so scenario time `t` is applied as `tsince = t` to every
satellite independently. That is the right convention only if all the element sets in
the file share an epoch.

**A Celestrak group file does not give you that.** The file is *downloaded* at one
instant, but each satellite's element set is refreshed on its own cadence, so the
epochs inside it are spread over days. Measured on the sets vendored in this
repository (line 1, columns 19–32):

| fixture | sets | epoch spread |
|---------|-----:|-------------:|
| `tests/fixtures/celestrak/gps-ops_2026-06-07.txt` | 32 | **70.6 h** |
| `tests/fixtures/celestrak/gps-ops_2021-07-28.txt` | 30 | **76.4 h** |
| `tests/fixtures/celestrak/galileo_2026-06-07.txt` | 33 | **335.7 h** |

70.6 h is 5.9 GPS revolutions. Propagated as-is, the in-plane phasing is scrambled:
the satellites are at the right altitudes and inclinations, but not where they were on
any one day, so the visible set, the DOP (dilution of precision) and any availability
computed from them describe a constellation that never existed. Nothing in the parser
measures this spread for you, and the `orbit` and `integrity` kinds do not align epochs:
a TLE block in a scenario is always propagated per-satellite-epoch.

**Do this instead.** Keep the epoch alongside the propagator, pick one reference
instant, and offset each satellite's `tsince` to it. `Tle::epoch_days_1950` is public,
so the parse loop is short; `tests/igs_real_data.rs` (`real_gps_tle_snapshot`) is the
worked example in this tree:

```rust
use kshana::orbit::Propagator;
use kshana::sgp4::wgs72;
use kshana::tle::parse_tle;

/// TEME position (m) of one satellite at `t` seconds after the common reference
/// instant `t_ref_jd` (a Julian date), not after its own TLE epoch.
fn aligned_teme_m(line1: &str, line2: &str, t_ref_jd: f64, t: f64) -> Result<[f64; 3], String> {
    let tle = parse_tle(line1, line2)?;
    let jd_epoch = 2_433_281.5 + tle.epoch_days_1950;
    let prop = Propagator::Sgp4(Box::new(tle.to_sgp4(wgs72(), false)));
    let tsince_s = (t_ref_jd - jd_epoch) * 86_400.0 + t;
    Ok(prop.position_eci(tsince_s))
}
```

TEME is the true-equator, mean-equinox frame SGP4 works in; `tests/igs_real_data.rs`
rotates it to Earth-fixed coordinates with `teme_to_ecef`.

If you do not align, say so when you report the number: it is a statement about orbital
*shells*, not about a real sky.

How much this matters is measured in `tests/araim_dual_real_data.rs`, which applies the
same offsets (reference instant: the latest epoch in the combined GPS + Galileo fixtures,
2026-06-07T07:21:04 UTC (Coordinated Universal Time)) through a 24 h
dual-constellation ARAIM (advanced receiver autonomous integrity monitoring) availability
run. Under a 12 m VAL (vertical alert limit) the aligned sky gives GPS-only 0.993, pooled GPS+Galileo 1.000 and
constellation-fault-robust dual 0.990; the unaligned per-satellite-epoch convention gives
0.208, 0.671 and 0.031 for the same inputs — a different conclusion, not a small error.

## See also

- [`README.md`](../README.md) — the orbit scenarios.
- [`SCENARIOS.md`](SCENARIOS.md#orbit) — the `orbit` kind's fields; the `integrity`,
  `gnss-sim`, `jamming` and `constellation-design` kinds take the same `constellation`
  table, and [`ephemeris`](SCENARIOS.md#ephemeris) takes a single `tle`.
- [`INTEGRITY.md`](INTEGRITY.md) — the ARAIM engine the real-sky test drives.
- `src/tle.rs` — the parser (`parse_propagators`, `ParseOpts { strict_checksum }`).
