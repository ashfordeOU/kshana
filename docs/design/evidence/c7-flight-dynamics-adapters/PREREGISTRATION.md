<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C7 (0.41): adapters and notebooks for flight-dynamics tools: no pre-registered bar needed

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**

## Why no bar

Roadmap item C7 adds adapters and notebooks so that GMAT, Orekit, Basilisk and file-based flight-dynamics tools of the
kind the roadmap calls "TMPL-class" can exchange trajectories and scenarios with Kshana through its existing surfaces
(MCP, Python, Rust). It makes no claim about accuracy, physics or performance. Each adapter either moves the data through
correctly or it does not, and that is decided by an integration test, not by a measured quantity with a threshold that
could be tuned after seeing it. There is no evidence question for a pre-registered bar to protect.

Accuracy claims that involve these tools stay where they are already registered (for example `xval/odm-orekit/`,
`xval/drag-exponential-gmat/`, `xval/aocs-basilisk/`) or belong to item C1 (load tests in GMAT and STK). C7 does not
change any ledger label.

## The acceptance test that decides it

C7 is done when the **flight-dynamics reference integration** of the roadmap's section 3 passes in CI:

1. A public trajectory (the Artemis I or CAPSTONE JPL Horizons states already used by the mission thread) is written by
   Kshana as OEM, OPM and SPK.
2. Each adapter loads the file into the tool itself (GMAT, Orekit, Basilisk; a scripted file-based tool for the fourth
   class) and reads back the states at the file's own epochs.
3. A difference report compares the states read back with the states Kshana wrote. The test passes when every state
   read back equals the written state to the precision the format carries (the number of digits written for text
   formats; bit for bit for SPK Type 13 records read by SPICE-based paths), and the report names any tool that rounds
   further.
4. The general rules of the integration layer hold: `kshana connect check` is green; zero code changes in either
   repository are needed to run it; the same integration runs through every surface (CLI, Python, WASM, MCP); and the
   notebook for each tool runs top to bottom in CI.

A failure is a defect to fix, not a result to publish against a bar.

## What passing would and would not mean

Passing means the adapters carry the data faithfully. It says nothing about whether Kshana's propagation agrees with
the tool's propagation; that is a separate comparison with its own registration.

## Owner decisions at sign-off

1. Which tool stands for the fourth, file-based class in CI (proposed: one open-source tool, named at sign-off).
2. Whether STK is part of this test or stays only in C1 (proposed: C1 only, since it is not open source).

## Sign-off (3 November 2026)

No bar. The reference integrations are Orekit, GMAT, Basilisk and one further open tool, named before its adapter is written; STK stays only in C1.
