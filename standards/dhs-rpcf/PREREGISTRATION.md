<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: DHS RPCF test profiles, levels 1 to 4

Committed before any scored run of `kshana standards-pack run dhs-rpcf`. The bars are the
`[[test.bar]]` tables of `pack.toml` in the same directory, reproduced as a summary below.
Nothing in `pack.toml` may be changed after the first scored run; a miss is recorded as
NOT MET and pinned by a test (`tests/standards_packs.rs`), never edited away.

The framework states no pass or fail values (section 8.6 leaves them to the assessor), so
every bar is this pack's own stated profile, with its reason in the bar's `why`.

| Test | Scenario | Bar |
|---|---|---|
| L1-T1 | `l1-repeatable-spoof-detect` | result byte-identical on a second run |
| L1-T2 | none | needs a receiver log (not scored) |
| L2-T1 | `l2-spoof-position-push` | `/decision/fused/alert` = true and `/decision/raim/alert` = true |
| L2-T2 | `l2-jammer-1km` | `/jammer_present` = true and availability under jamming < nominal |
| L2-T3 | none | needs a receiver log (not scored) |
| L3-T1 | `l3-clock-holdover` | quantum clock timing p95 <= `threshold_ns` |
| L3-T2 | `l3-clock-holdover` | classical clock timing p95 <= `threshold_ns` |
| L3-T3 | `l3-combined-altpnt` | combined error <= free inertial and <= each single channel |
| L4-T1 | `l4-conflict-resilience` | minimum layered-to-single ratio over the correlation grid >= 2.0 |

Status: every result is MODELLED. A MET bar says a modelled scenario met a stated bar, not
that any product meets a level.
