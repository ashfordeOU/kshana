# Kshana Pro

Open Kshana tells you what one scenario gives. **Kshana Pro** is the professional edition for
teams that have to make a decision and defend it: which design to fly, how sure the answer is,
whether the mission meets its requirements, and a deliverable that a review board or a
customer can check. It runs the same engine and the same scenario files, so nothing you built
with open Kshana is lost.

Pro is proprietary and available under contract from Ashforde® OÜ. There are no prices here:
every route starts with a message to [contact@ashforde.org](mailto:contact@ashforde.org).

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| CI | continuous integration |
| CSV | comma-separated values |
| GNSS | global navigation satellite system |
| HTML | HyperText Markup Language |
| JSON | JavaScript Object Notation |
| PDF | Portable Document Format |
| PNT | positioning, navigation and timing |
| ReqIF | Requirements Interchange Format |
| SysML v2 | Systems Modeling Language, version 2 |

## Who it is for

- **Mission and programme teams** who must choose an architecture and show why.
- **Systems engineers** who own requirements, verification and the hand-over to a review board.
- **Receiver, clock and payload makers** who need to know how their product behaves when GNSS
  is jammed, spoofed or lost, and to show it to their customers.
- **Signal and constellation designers** planning a new positioning, navigation or timing
  service alongside the existing GNSS signals.
- **Operators and integrators** who must run studies on their own network and keep a record of
  what was delivered.

## Why upgrade

| With open Kshana you can | With Kshana Pro you can |
|---|---|
| run one design and read its figures | explore a whole design space and get the best trade-offs, each candidate as a scenario file |
| repeat a run over random seeds | get confidence bands, the probability of meeting a limit and the inputs that drive the result |
| read a report per run | check your requirements against runs and hand over one mission dossier |
| compare two runs by hand | let your pipeline fail when a figure you care about gets worse |
| check one signal against one GNSS signal | test whole signal plans against the open GNSS signals, in both directions |
| run on your own computer | run on your own network, with a queue and a record of every delivery |
| ask the community | get direct support from the team that builds the engine |

## What you can do with Kshana Pro

### Choose the design to fly

State a design space (each variable a scenario setting with its allowed values), the
constraints and two or three objectives. Pro returns the designs that no other design beats on
every objective at once, marks the balanced choice, shows where your current design sits, and
writes each candidate as a plain scenario file that the free engine runs. It works on any open
scenario kind: a constellation around the Earth, the Moon or Mars, a link budget, a clock
choice. A front that was not searched exhaustively says so; it is never called optimal.

### Know how sure the answer is

Say how uncertain each input is and where that figure comes from. Pro gives the mean and spread
of every output, confidence bands over time, the probability of meeting a limit, and a ranking
of the inputs that drive the result, flagged when the ranking is not reliable. An input whose
uncertainty is assumed rather than sourced is marked ASSUMED in every output. Long studies can
be stopped and resumed with the same result.

### Show that the mission meets its requirements

Import your requirements as CSV, ReqIF or SysML v2 text, each with an acceptance criterion and
its unit. Pro checks them against the runs and produces a verification matrix with open items,
a SysML v2 model, a change-impact report that lists what to re-verify when a design changes,
and a mission dossier in PDF, HTML and JSON. A requirement met only on a MODELLED or PARTNER
basis is flagged, and a requirement to be verified by test, inspection or demonstration stays
open however the run went. A delivered dossier can be re-checked with one command.

### Trade architectures on evidence

Run every option of an architecture trade on the same footing, rank the options on the
figures that matter to you, and keep an evidence pack in which every number can be traced to
the scenario that produced it.

### Catch a regression before it ships

Name the figures you care about in a set of scenarios and say what worse means for each, with
a tolerance or a requirement. Pro fails your pipeline when a change to a scenario, a model or
the engine makes one of them worse, keeps a tamper-evident history of every run, and shows a
trend page and a figure-by-figure difference between any two runs. A new set of random seeds is
not reported as a regression.

### Check spectrum coexistence

Test one or more candidate signal plans, each a signal design and a constellation, against the
open-service GNSS signals the engine models, in both directions: what your plan costs GNSS
users, and what GNSS costs your plan. You get a verdict per plan and signal against a limit you
state, a world map of the worst case and the plans ranked. It is a planning study, not a
coordination filing or a regulatory finding.

### Twin your own clocks

A digital twin of a clock that behaves like the device's published stability, checked before
it is used. A twin of your own device is built with you, from your characterisation data,
under contract and a non-disclosure agreement.

### Turn one run into a technical note

One scenario becomes a reproducible technical note in HTML and JSON: scope, method, results
with an evidence label on every figure, limitations and the exact scenario run.

### Run it on your own network

Pro runs as a service on your own network. Your team queues studies and lets them run
unattended; a finished job is never run twice, unfinished jobs resume after a restart, and a
record shows which result was delivered for which request. The service makes no outbound
connection of its own.

### Hand over signed evidence

Pro signs its evidence packs and dossiers. Whoever receives one can check that nothing was
changed since it was signed, and with which key, without a Pro licence.

## What you can count on

- **Everything you have keeps working.** Every open scenario runs in Pro unchanged, and an open
  scenario runs in Pro with no licence at all.
- **Open physics stays open; Pro physics is labelled.** Pro never changes a physical model of
  the open engine. Where Pro has models of its own, each carries its own evidence label
  (VALIDATED only where an independent external reference backs it, MODELLED otherwise).
- **Honest labels carried through.** Every figure keeps the tier the open engine's ledger gives
  it (VALIDATED, MODELLED or PARTNER, see the [verification matrix](VERIFICATION-MATRIX.md)),
  never a higher one, and every Pro result is labelled MODELLED.
- **Reproducible in the free engine.** A Pro deliverable lists the open scenario files it ran,
  with their hashes, so anyone with open Kshana can re-run them and get the same figures.
- **Not a certification.** A dossier, a verification matrix or a signed pack is analysis
  evidence. It does not replace a test, an inspection or a demonstration, and it is not a
  certification, a qualification or an acceptance by any authority.

## Support and services

A Pro contract includes direct support from the team that builds the engine. Ashforde® OÜ also
offers:

- **Onboarding and integration**: Kshana in your toolchain, your scenarios and your pipeline.
- **Custom scenarios and priority fixes.**
- **Custom sensor and clock models** calibrated to your hardware, under contract with your data.
- **Custom studies**: a MODELLED PNT-resilience study of your system, done for you.
- **Training and consulting** on PNT resilience and sensor performance.

Export-controlled work is done only under the appropriate clearance and a non-disclosure
agreement, and is not offered publicly.

## How to start

- **Ask for an evaluation** at
  [contact@ashforde.org](mailto:contact@ashforde.org?subject=Kshana%20Pro%20evaluation). Tell us
  the question your programme needs answered, and we will show you Pro on it.
- **Pro needs a licence.** Without one, Pro runs open scenarios only and says which licence a
  Pro feature needs.
- **Pro is not open source.** It is not part of this repository and is not offered under the
  AGPL-3.0 (GNU Affero General Public License, version 3). See
  [LICENSING.md](../LICENSING.md).
