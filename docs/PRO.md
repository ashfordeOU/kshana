# Kshana Pro

Open Kshana runs one scenario and tells you what it gives. Kshana Pro answers the questions a
programme asks next, over the same engine and the same scenario files: which design to fly,
how sure the answer is, and whether the mission meets its requirements in a form a review
board can check.

This page says what Pro is, what each part of it does today, what it produces, and what it
does not do. Pro is proprietary and available under contract. There are no prices here:
every route starts with a message to [contact@ashforde.org](mailto:contact@ashforde.org).

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| CSV | comma-separated values |
| EIRP | effective isotropic radiated power |
| HTML | HyperText Markup Language |
| HTTP | Hypertext Transfer Protocol |
| JSON | JavaScript Object Notation |
| MBSE | model-based systems engineering |
| NSGA-II | non-dominated sorting genetic algorithm II |
| PDF | Portable Document Format |
| PNT | positioning, navigation and timing |
| ReqIF | Requirements Interchange Format |
| SHA-256 | Secure Hash Algorithm, 256-bit |
| SysML v2 | Systems Modeling Language, version 2 |
| TOML | Tom's Obvious, Minimal Language (the scenario file format) |
| VCRM | verification cross-reference matrix |

## What Pro is: the same engine, amplified

- **A strict superset of open Kshana.** Pro depends on the open engine as a library and
  never forks it. Every open scenario kind runs in Pro unchanged, and an open scenario runs
  in Pro with no licence at all. A Pro test runs a scenario file of every open kind through
  Pro and requires the open engine's result, byte for byte.
- **No new physics.** Pro adds no physical model and changes none. Every Pro number comes
  from runs of the open engine, so a Pro figure is as trustworthy as the open scenario kind
  it came from, and never more.
- **Reproducible in the free engine.** The design optimiser, the mission dossier and the
  study dossier write out the scenario files they ran, with their hashes. Anyone with open
  Kshana can re-run one and get the same figure.
- **Honest labels carried through.** Every Pro output is labelled MODELLED, and every
  figure keeps the tier the open engine gave it (VALIDATED, MODELLED or PARTNER, see the
  [verification matrix](VERIFICATION-MATRIX.md)), never a higher one. An input whose
  uncertainty is assumed rather than sourced is printed as ASSUMED on every output.

## What Pro answers

| The programme's question | Pro capability | What you get |
|---|---|---|
| Which design should we fly? | [Design optimiser](#design-optimiser) | the Pareto front of a design space, its knee, and each front design as a plain scenario file |
| How sure are we, and what drives the result? | [Uncertainty and sensitivity](#uncertainty-and-sensitivity) | confidence bands, the probability of meeting a limit, and a ranking of the inputs that drive the result |
| Does the mission meet its requirements, and can we hand that over? | [Mission dossier](#mission-dossier) | one dossier (PDF, HTML, JSON) with a verification matrix, open items and a reproducibility record |
| Which requirements does this run verify, and what changes if a design changes? | [Requirements and traceability](#requirements-and-traceability) | a VCRM, a SysML v2 model, a change-impact report and an offline evidence pack |
| Which architecture wins, and on what evidence? | [Trade studies](#trade-studies) | the options ranked on a figure of merit, with an evidence pack of reproducible scenario hashes |
| Does it still pass after the next engine release? | [Scenario regression check](#scenario-regression-check) | a pass or fail verdict against the previous run's figures, and an HTML report |
| Does a twin of our clock behave like the real device? | [Clock digital twin](#clock-digital-twin) | a twin calibrated to the device's published Allan deviation, checked with the open estimator |
| Can one run be written up as a technical note? | [Study dossier](#study-dossier) | an HTML and JSON note with a result hash |
| Can the team run it on its own network? | [On-premises service](#on-premises-service) | a small HTTP service in front of the engine and the Pro features |

The numbers below come from real runs of the worked examples that ship with Pro. Each one
is a modelled result of an illustrative study, not a statement about any real mission.

## Design optimiser

**The question.** A free user scores one design they wrote by hand. A Pro user states the
design space (each variable a scenario setting with its allowed values), the constraints
and two or three objectives, and gets the whole Pareto front: the designs that no other
design beats on every objective at once.

**How it works.** The base scenario can be of any open kind, so the same tool designs a
constellation around the Earth, the Moon or Mars, or trades a link budget. Every design is
one run of the open engine. The search is exhaustive when the space fits the run budget,
and a seeded NSGA-II search otherwise; a front that is not exhaustive is labelled "best
found in N runs", never "optimal". The same study and seed give the same output for any
number of threads.

**What it produces.** A result file with every evaluated design, the front, its knee and
where a reference design sits; a chart of the front; a self-contained HTML report; and
each front design as a plain open scenario file, with an index that lists the SHA-256 of
the result the free engine gives for it.

**Worked example.** A lunar navigation constellation, fewest satellites against
availability over the whole Moon: 608 designs, all run, give a front of 12 designs at six
points, from 8 satellites at 19.5446 % availability to 24 satellites at 100 %, with the
knee at 16 satellites and 85.0404 %. Re-running front designs in the free engine gave
results whose SHA-256 equals the one in the index.

**What it does not do.** It has no cost model, so a variable no objective penalises drifts
to the edge of its range. Constellation studies score geometry only: no signal power,
satellite health or terrain. Each design is one run with no uncertainty attached; use the
uncertainty study on a chosen design.

## Uncertainty and sensitivity

**The question.** A free user gets one number, or a spread over random seeds. A Pro user
states how uncertain each input is and gets confidence bands, the probability of meeting a
limit, and a ranking of the inputs that drive the result.

**How it works.** It works on any open scenario. Each uncertain input takes a distribution
(normal, uniform, lognormal, triangular or discrete) with its source. The open engine runs
over a seeded sample of the inputs, thousands of times if needed. For each output you get
the mean, the spread, the 5th, 50th and 95th percentiles with an interval on the mean, the
probability of meeting a limit with its interval, the band of a time series at every step,
and how the estimates settled as runs accumulated. Inputs are ranked by Sobol' sensitivity
indices or by standardised regression coefficients, and a ranking that is not reliable is
flagged as such. A long study can be stopped and resumed.

**What it produces.** A result file, a band chart, a sensitivity chart, a convergence
chart, a self-contained HTML report, and a checkpoint file with one line per finished run.

**Worked examples.** An X-band link margin with three assumed input uncertainties: 40,960
runs give a mean margin of 92.12 dB with a 5th to 95th percentile range of 90.12 to
94.12 dB, a probability of 0.8198 (95 % interval 0.8114 to 0.8280) that the margin is at
least 91 dB, and the transmitter's EIRP as the main driver (total Sobol' index 0.669). A
clock-holdover study stopped after 700 of its 2,000 runs and resumed ended with the same
six files, byte for byte, as the same study run without a stop.

**What it does not do.** Inputs are treated as independent. The result holds only for the
stated input distributions, which the tool cannot check. More runs narrow the sampling
error, not the model error: a MODELLED kind stays MODELLED.

## Mission dossier

**The question.** A free user gets one report per run. A Pro user gets one mission dossier
in one command: requirements checked against real runs, a verification matrix with its
open items, and a PDF in which every number can be re-derived with the free engine.

**How it works.** One programme file names a requirements file (CSV in the worked
example; ReqIF and SysML v2 text go through the same requirements import described
below), a list of scenarios of any kind, an optional trade study and the sign-off rows.
Every scenario is run; every requirement is checked, with its unit, against the values the
run wrote. A requirement met on a MODELLED or PARTNER basis is flagged. Requirements to be
verified by test, inspection or demonstration stay open items however the run went. A
second command re-checks a delivered dossier: it re-hashes every file and, on request,
runs every scenario again and compares.

**What it produces.** A PDF (cover, a MODELLED banner, verdict summary, verification
matrix, one sheet per run with its charts, open items, reproducibility record, sign-off
table and limitations), the same content as a self-contained HTML page and as JSON, every
run's scenario and result, the evidence pack, and a manifest of every file with its
SHA-256.

**Worked example.** Twelve illustrative requirements over five runs (a low-Earth-orbit
positioning chain, a lunar relay constellation, the L band under jamming, a jamming,
spoofing and holdover campaign, and a Mars orbiter) and one trade study: 7 met, all on a
MODELLED or PARTNER basis, 4 not met, 1 not verified, 15 open items, in a 21-page PDF. The
re-check repeated the five runs and the trade study and got the same result bytes.

**What it does not do.** The dossier's hashes prove that its files agree with each other;
they are not a signature and do not prove who issued it. Simulation evidence counts as
analysis and does not replace a test, an inspection or a demonstration. A dossier is not a
certification, a qualification or an acceptance by any authority.

## Requirements and traceability

Pro's model-based systems-engineering (MBSE) tooling checks requirements against runs of
the open engine. It imports requirements as CSV, or as a documented subset of ReqIF or of
SysML v2 text, each with a machine-checkable acceptance criterion and its unit. It produces
a verification cross-reference matrix (VCRM) whose evidence for each verdict is the run's
scenario hash, seed, engine version and the values it read; a SysML v2 model; a
change-impact report listing the requirements to re-verify when a trace or a scenario
changes; and an offline HTML and JSON evidence pack. It re-runs and recomputes nothing. The
[README](../README.md#editions) lists exactly which open-engine outputs it reads.

## Trade studies

A trade study runs every architecture option as an unchanged open-engine scenario, ranks
the options on a figure of merit read from each run's result, and writes an evidence pack
that records each option's scenario hash, so any figure in it can be reproduced by
re-running that scenario.

## Scenario regression check

A manifest lists the scenarios to watch. Pro runs them, reads the figures of merit from
each result, and compares every figure with the previous run's baseline within a relative
tolerance you can set per figure (the JSON it writes is the next run's baseline). It
writes an HTML report and exits with a non-zero code when a figure regresses, so a
continuous-integration pipeline can stop on it.

## Clock digital twin

A clock twin is calibrated to a device's published Allan-deviation budget, then checked by
estimating the twin's own Allan deviation with the open engine's estimator and comparing
the two within a stated tolerance. The worked example uses a representative chip-scale
atomic clock. A twin of your own device needs your characterisation data and is built
under contract and a non-disclosure agreement.

## Study dossier

One scenario becomes a reproducible technical note in HTML and JSON: scope, method,
results with a tier on every figure, limitations, and the exact scenario text run. The
same scenario gives the same result hash.

## On-premises service

Pro can run as a small HTTP service on your own network: it reports its health, its
version and the kinds it can run, and runs a scenario posted to it. Without a licence it
serves the open engine only and refuses every Pro feature.

## What needs a contract, and what is not offered

- **Pro needs a licence.** Without one, Pro runs open scenarios only and refuses every Pro
  feature with a message naming what is required. Evaluations start at
  [contact@ashforde.org](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation).
- **Some work needs a signed customer.** A clock twin of your own device, and sensor or
  resilience models calibrated to your hardware, are built only under contract with your
  data.
- **Export-controlled resilience models are not publicly offered.** Such work is done only
  under the appropriate clearance and a non-disclosure agreement.
- **Pro is not open source.** It is not part of this repository and is not offered under
  the AGPL-3.0 (GNU Affero General Public License, version 3). See
  [LICENSING.md](../LICENSING.md).
- **Nothing Pro produces is a certification.** Every output is modelled, and says so.
