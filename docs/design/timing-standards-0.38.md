<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# 0.38 WS-C timing, standards and hardware safety (W55): handover and release text

Branch `feat/timing-standards-0.38`, from `origin/main` (v0.37.0, `c0c7770`). Items C1 to C6 and D1, D3
and D4 of `docs/plans/0.38-PLAN.md` (kshana-pro, `ws/coordination`).

## What was done

| Item | What | Evidence tier |
|---|---|---|
| C1 | `clock_log` formats `ptp4l`, `phc2sys`, `ts2phc`, `chrony-tracking`, `chrony-statistics` (`src/clock_log.rs`, `docs/CLOCK-LOG-FORMATS.md`); fixtures written for Kshana (no real log, no copied text) | MODELLED; parser tests only |
| C2 | `holdover-test` scenario kind (`src/holdover_test.rs`, `docs/TIMING-HIL.md`, `scenarios/holdover-test-*.toml`): baseline, GNSS removed by the operator, holdover, recovery, measured against the existing transcribed ITU-T masks; no new limit was transcribed | MODELLED; hand-computed records |
| C3 | NIST IR 8323r1 crosswalk in `compliance-report`: 15 paraphrased rows, `docs/compliance/nist-ir-8323r1.md`, citation index extended (`scripts/gen_compliance_refs.py --only-nist`) | a mapping, a judgement; the references resolve in the PDF read on 2026-10-18 |
| C4 | `iq scene --format sdrx[:ci16_le]`: ION GNSS SDR metadata writer (`realdata::ion_sdr::write_sdrx`), CLI and MCP | round trip with the reader and sample equality with the plain file; no third-party reader run |
| C5 | `iq monitor --follow [--idle-timeout s]` on a growing single-capture SigMF file (`iq::io::follow`), read-only | tested with a file that grows during the run |
| C6 | `docs/HARDWARE-SAFETY.md`: stages 0 to 4, legal notes, the `lab-attestation` field (specified, not enforced) | **owner legal review pending** |
| D1 | README: six rows of the evidence table that no matrix row names as an external oracle (GCRS to ITRS against ANISE, Galileo and Swarm-A precise-orbit fits, LRO, Sun-central Mars against DE440, dual-constellation ARAIM) are shown MODELLED, with the figures kept; the sentence that called the LRO miss VALIDATED is corrected | |
| D3 | `docs/CAPABILITY.md`: RTK on real data and static float PPP on real data are in the GNSS row, from the matrix (both VALIDATED against ITRF2020 station coordinates); PPP ambiguity fixing and kinematic or network RTK stay absent | |
| D4 | e2e-live listener race: the gate logs when it registers a client (`kshana live: tcp client connected`), the test waits for that line and paces the feed on the consumer, and fails with a clear message if the gate drops a consumer; the byte comparison is unchanged | 40 of 40 runs green after the fix; before it, a run failed within three |

VALIDATED rows added: **none**. MODELLED rows added: two (`Clock-log formats linuxptp ... and chrony ...`,
`Holdover test scored from an operator-supplied time-error record`). NOT MET: none; no pre-registered bar
was set because no external oracle was compared.

## Findings worth knowing

- **D4's cause** was not only the registration race. After it was fixed, one run in ~15 still lost bytes
  because the feed (a fixed 2 ms pace) outran a briefly slow consumer and the gate dropped it
  (`CLIENT_QUEUE` of 256 messages). The test now waits for the consumer between chunks.
- **D1** found no overclaim in the lunar, spectrum, solar-system, constellation, LEO or MCDA README text:
  each names a VALIDATED matrix row. The six table rows above did not.
- **C3** keeps the DHS, IMO, EASA, NIS2 and EN 16803 rows as they were. The word rule (the stems listed in
  `tests/compliance_report.rs` are forbidden in mapping text, even negated) is why the new text and the
  new kind's report avoid them entirely.
- **ION metadata**: the metadata standard has no float coding, so `iq scene --format sdrx` writes only
  `ci8` or `ci16_le`.

## For the coordinator

- **Counts and generated files are not regenerated on this branch** except where noted below. The new
  kind (`holdover-test`) and the two ledger rows change the kind count (84 to 85) and the matrix rows
  (364 to 366). Regenerate once at integration with `cargo run --release --bin gen_validation_artifacts`
  and the figure and og-card scripts. Until then the doc-sync tests that pin those counts fail on this
  branch by design.
- Surfaces: `holdover-test` is a kind, so it reaches CLI, Rust, Python, WASM, MCP, plugin and JetBrains
  through `run`/`run_scenario`; Studio has no view of its own (`pending`, like `optical-atmosphere`). New
  flags: `iq scene --format sdrx` (CLI, MCP; Python N/A, in-memory) and `iq monitor --follow` (CLI and
  Rust only; N/A for Python and MCP with the reason in `docs/SURFACES.md`).
- **Not done / owner decisions**: the `lab-attestation` check is a specification only; `docs/HARDWARE-SAFETY.md`
  needs legal review; the Studio view of `holdover-test` is pending; `docs/IQ-FOLLOW.md` carries no
  tool-specific capture recipe (the memo's "capture recipe doc" is left to a later release, because a
  recipe names third-party tools whose flags were not checked).
- Release-text draft (CHANGELOG / README "What's new in 0.38"):
  - **Timing**: the `holdover-test` kind scores a holdover test of a timing system ("pull the antenna")
    from a measured time-error record, split at the two times the operator states, measured against
    the ITU-T masks. New clock-log formats read linuxptp `ptp4l`, `phc2sys` and `ts2phc` logs and
    chrony `tracking` and `statistics` logs. See `docs/TIMING-HIL.md`.
  - **Standards**: `compliance-report` gains the NIST IR 8323r1 Foundational PNT Profile (15 rows, supports
    evidence for, paraphrased).
  - **Receive-only IQ**: `iq scene` can write ION GNSS SDR metadata (`.sdrx`); `iq monitor --follow`
    monitors a SigMF recording while it is written.
  - **Hardware safety**: `docs/HARDWARE-SAFETY.md` states what Kshana does with hardware and never does
    (no transmit path), with the stage table and the `lab-attestation` field.
  - **Fixes**: README no longer labels six comparisons VALIDATED that the matrix does not; CAPABILITY states
    RTK and PPP on real data; the marine integrations end-to-end test no longer races the TCP consumer.
