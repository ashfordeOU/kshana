<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Running the external-oracle tests on your own machine

About a dozen tests that compare Kshana with an external oracle (Orekit, mpmath, numpy, SPICE and
the lunar frame packs) failed on a local macOS (Apple silicon) checkout while CI was green
([issue #36](https://github.com/ashfordeOU/kshana/issues/36)). This page says why that can
happen, how to see exactly which tests fail on your machine, and what to do about each.

## Why CI was green

CI runs every oracle comparison on **Linux x86-64** (`ci.yml`, job `check`). Its only macOS job,
`reproducibility-matrix`, runs four targets chosen because they are platform independent
(`cross_platform_golden`, `golden`, `determinism`, `sgp4_verification`). So "CI macOS is green" never
covered the oracle comparisons: on a Mac they run, for the first time, on a developer's machine.

## Why they can differ on a Mac

Rust emits IEEE-754 add, multiply, divide and square root identically everywhere. The
transcendentals (`sin`, `cos`, `exp`, `ln`, `powf`, `atan2`) are not correctly rounded, and each
platform's maths library rounds them its own way, so anything downstream of a trig call can
differ in the last place or two between Apple silicon and Linux. An optimised macOS build also
merges a sine and a cosine of one argument into a single library call that differs from the lone
`sin` for a few arguments in a thousand, so a debug and a release build on one Mac can differ too
(`src/portable_math.rs`, `src/test_support.rs` give the measurements). A comparison that is tighter
than that noise, or that an iterative solve or a rank decision amplifies, can pass on one host and
fail on the other with nothing wrong in either.

That is the first hypothesis, not a finding about every failing test: each one is one of

- **(a)** a missing or different local data file or tool (a fixture not checked out, an optional oracle
  tool not installed): the test names the file, and the fix is the fetch script or the setup;
- **(b)** a platform floating-point difference beyond the test's own tolerance: the fix is to change
  *what* is compared (compare the committed inputs within a scale of the fixture, or evaluate the
  graded comparison on the committed inputs instead of locally rebuilt ones), never the pre-registered
  bar, and a mutation test must show the comparison still fails when it should;
- **(c)** a real defect: fix the code.

## See your own failures

```sh
scripts/oracle-triage.sh                 # debug profile, the one `cargo test` uses
scripts/oracle-triage.sh --release       # the optimised profile, which differs on macOS
```

It prints the host and toolchain (and warns when `rustc` is not the pinned version, since a
different compiler can move the last digits), runs every `*_oracle` and `*_reference` target with
`--no-fail-fast`, writes `oracle-triage.log` and `oracle-triage.summary.md`, and lists each failing test
with its kind (a), (b) or (c) from the first line of its message. Exit status: 0 all passed, 1 a failure,
2 the host is not set up. To summarise a log you already have: `scripts/oracle-triage.sh --summarise <log>`.

The same script runs on a macOS arm64 runner in `.github/workflows/oracle-macos.yml` (manual and
weekly; a diagnostic, not a gate), which keeps its log as an artifact, so the list can be read
without a Mac.

## The oracle tools themselves

Most oracle comparisons run against **committed fixtures** that an oracle produced once; they need no
oracle tool installed. Regenerating a fixture needs the toolchain in
[`xval/oracles/README.md`](../xval/oracles/README.md) (JDK 17+, Orekit, a Python environment with the
pinned numpy and mpmath, RTKLIB, ANISE). A test that needs data it cannot find prints a skip notice
and stays green (the data-gated tests, listed in the README's verification-matrix section); it does
not fail.

## What must not change

Nothing in this page permits loosening a pre-registered bar, skipping a test, or re-taking a pin
to make a red turn green. A platform tolerance needs evidence (the measured divergence on the host)
and a comparison that still discriminates.
