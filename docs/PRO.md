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
| AltBOC | alternative binary offset carrier (the Galileo E5 wideband signal) |
| C/A | coarse/acquisition (the GPS L1 civil signal) |
| C/N0 | carrier-to-noise density ratio |
| CSV | comma-separated values |
| dB | decibel |
| dB-Hz | decibel-hertz (the unit of C/N0) |
| dBW | decibels relative to one watt |
| EIRP | effective isotropic radiated power |
| GNSS | global navigation satellite system |
| GPS | Global Positioning System |
| HTML | HyperText Markup Language |
| HTTP | Hypertext Transfer Protocol |
| JSON | JavaScript Object Notation |
| km | kilometre |
| min | minute |
| MBSE | model-based systems engineering |
| NSGA-II | non-dominated sorting genetic algorithm II |
| ns | nanosecond |
| PDF | Portable Document Format |
| PNT | positioning, navigation and timing |
| ReqIF | Requirements Interchange Format |
| SHA-256 | Secure Hash Algorithm, 256-bit |
| SVG | Scalable Vector Graphics |
| SysML v2 | Systems Modeling Language, version 2 |
| TLS | Transport Layer Security |
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
- **Honest labels carried through.** Every Pro result is labelled MODELLED: the result
  document of each Pro scenario kind, and of each command on this page, carries a label
  that starts with MODELLED. Files that hold no computed figure carry no label: imported
  requirement lists, the SysML v2 model text, manifests, ledgers, checkpoints and job
  lists. Every figure keeps the tier the open engine gave it (VALIDATED, MODELLED or
  PARTNER, see the [verification matrix](VERIFICATION-MATRIX.md)), never a higher one. An
  input whose uncertainty is assumed rather than sourced is printed as ASSUMED on the
  uncertainty study's result, charts and report.

## What Pro answers

| The programme's question | Pro capability | What you get |
|---|---|---|
| Which design should we fly? | [Design optimiser](#design-optimiser) | the Pareto front of a design space, its knee, and each front design as a plain scenario file |
| How sure are we, and what drives the result? | [Uncertainty and sensitivity](#uncertainty-and-sensitivity) | confidence bands, the probability of meeting a limit, and a ranking of the inputs that drive the result |
| Does the mission meet its requirements, and can we hand that over? | [Mission dossier](#mission-dossier) | one dossier (PDF, HTML, JSON) with a verification matrix, open items and a reproducibility record |
| Did the last change make a figure we care about worse? | [Campaign watch](#campaign-watch) | a pass or fail on named figures and requirements, a hash-chained history of every run, a trend page and a figure-by-figure diff |
| Will our signal plan interfere with GNSS, or suffer from it? | [Spectrum coexistence](#spectrum-coexistence) | a verdict per candidate plan and GNSS signal, in both directions, over a worldwide grid, with the plans ranked |
| Can the team queue studies on its own network and prove what was delivered? | [On-premises job service](#on-premises-job-service) | a job queue that survives a restart, a stored result per job and a hash-chained delivery ledger |
| Which requirements does this run verify, and what changes if a design changes? | [Requirements and traceability](#requirements-and-traceability) | a VCRM, a SysML v2 model, a change-impact report and an offline evidence pack |
| Which architecture wins, and on what evidence? | [Trade studies](#trade-studies) | the options ranked on a figure of merit, with an evidence pack of reproducible scenario hashes |
| Does it still pass after the next engine release? | [Scenario regression check](#scenario-regression-check) | a pass or fail verdict against the previous run's figures, and an HTML report |
| Does a twin of our clock behave like the real device? | [Clock digital twin](#clock-digital-twin) | a twin calibrated to the device's published Allan deviation, checked with the open estimator |
| Can one run be written up as a technical note? | [Study dossier](#study-dossier) | an HTML and JSON note with a result hash |
| Can the team run it on its own network? | [On-premises service](#on-premises-service) | a small HTTP service in front of the engine and the Pro features |

The numbers below come from real runs of the worked examples that ship with Pro. Each one
is a modelled result of an illustrative study, not a statement about any real mission. The
design, uncertainty and mission-dossier examples were run with Pro 0.1.0, a development
build, on open engine 0.28.0, and so were the campaign-watch, spectrum-coexistence and
job-service examples. Each design and uncertainty result records a digest of its
runs: the SHA-256 over the SHA-256 of every run's result document, in order.

| Worked example | Open-engine runs | Run digest (SHA-256) |
|---|---|---|
| Design optimiser, whole Moon | 609 | `df81aad45cce5bc7cfa93485bdebfb947ecd746a858afe32956c4b757f0b0d3f` |
| Design optimiser, south polar cap | 609 | `53dcc9c44290f737453ca6af04968e8f54bce291783fa788e3bd569ee5fb9c39` |
| Uncertainty, clock holdover | 2,000 | `159d2e1d37b4443bcb58bc8f068643478cac2c0fb9dc39e02d8ba8b1294d4138` |
| Sensitivity, low-Earth-orbit positioning chain | 6,144 | `2f2c4572d8dc085df3eca2f552fdca71a77e947cd41fc79278a36925ba417b24` |

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

**Worked examples.** A lunar navigation constellation, fewest satellites against
availability over the whole Moon: 608 designs, all run, give a front of 12 designs at six
points, from 8 satellites at 19.5446 % availability to 24 satellites at 100 %, with the
knee at 16 satellites and 85.0404 %. The six points are 8 satellites at 19.5446 %, 12 at
55.4222 %, 14 at 73.5637 %, 16 at 85.0404 %, 20 at 93.2496 % and 24 at 100 % (seven front
designs reach 100 %). The knee design is 16 satellites in 2 orbital planes at 8,000 km
altitude and 45° inclination, with phasing 1. The bundled lunar relay design
(8 + 6 satellites), scored as the reference, reaches 21.3286 % with 14 satellites, and 2
front designs are at least as good on both objectives and better on one. Scored over the
south polar cap instead, the same 608 designs give a front of 9 designs at four points,
from 8 satellites at 24.5261 % to 16 satellites at 100 %, with the knee at 14 satellites
and 91.6739 % (2 planes at 8,000 km and 75° inclination, phasing 0); the four points are
8 satellites at 24.5261 %, 12 at 69.5825 %, 14 at 91.6739 % and 16 at 100 %. There the bundled
design reaches 96.7241 % with 14 satellites: no front design dominates it, because it lies
outside the stated design space. Each study made 609 open-engine runs (the 608 designs and
the reference). Every front design was re-run in the free engine (open Kshana 0.28.0),
and 12 of 12 and 9 of 9 gave a result whose SHA-256 equals the one in the index. For the
whole-Moon knee design that SHA-256 is
`89882372b381f75bd091e6acaed01e17a979a14723294c10e4a55fca4936a61f`.

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
least 91 dB, and the transmitter's EIRP as the main driver (total Sobol' index 0.669).

A clock-holdover study (the member scenario of the open campaign
`campaign-monte-carlo-clock-holdover`) with one assumed input, the clock's
white-frequency-noise level (`q_wf`), uniform from 4.5e-20 to 2.7e-19 (half to three times
the datasheet value): at the end of the 60-minute run, 1,366 of 2,000 runs stayed within
±20 ns, a probability of 0.683 (95 % interval 0.6623 to 0.703). With one input, the
ranking of inputs is flagged as not reliable. The same study stopped after 700 of its
2,000 runs and resumed ended with the same six files, byte for byte, as the study run
without a stop.

A low-Earth-orbit positioning chain (the open `leo-pnt-chain` kind) with four assumed
input uncertainties, ranked by Sobol' indices: 6,144 runs (1,024 × (4 + 2)). With the
low-Earth-orbit layer, the fused position error has a mean of 0.4312 m (5th to 95th
percentile 0.2465 to 0.6041 m), and the orbit and clock error of the low-Earth-orbit
satellites drives it (total Sobol' index 0.99). With GNSS alone, the position error has a
mean of 1.6041 m (1.5389 to 1.6739 m), driven by the GPS signal-in-space range error
(0.68) and the Galileo one (0.32). The peak C/N0 of the pass has a mean of 60.7336 dB-Hz
(59.0898 to 62.3719 dB-Hz), driven by the transmit power (1.01: a total index is an
estimate, and its 95 % interval, 0.9467 to 1.0659, contains 1). Every other input's total
index is below 0.01.

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
re-check repeated the five runs and the trade study and got the same result bytes. The
dossier's SHA-256 is
`c37799f792d6e47fe78ad57d2a7b91164272c8603b09f443b73206256c4eea03` (Pro 0.1.0, a
development build, on open engine 0.28.0, with the issue time fixed on the command line).
The verification matrix, as the dossier checked it (values rounded to four decimals; a
field written without a unit has the unit 1):

| Requirement | Method | Criterion checked | Value the run wrote | Verdict | Basis |
|---|---|---|---|---|---|
| LEO-001 | analysis | `ppp.cases[1].median_convergence_min <= 10 min` | 7.5 min | met | MODELLED |
| LEO-002 | analysis | `ppp.cases[0].median_convergence_min <= 10 min` | 11.5 min | not met | MODELLED |
| LEO-003 | test | `fusion.fused.rms_error_3d_m <= 0.5 m` | 0.4349 m | met (stays open: test) | MODELLED |
| LUN-001 | analysis | `global.availability_pct >= 95 %` | 21.3286 % | not met | MODELLED |
| LUN-002 | analysis | `global.pdop.median <= 6` | 5.22 | met | MODELLED |
| SPC-001 | analysis | `timeline.bands[3].min_cn0_dbhz >= 25 dB-Hz` | 44.0752 dB-Hz | met | PARTNER |
| SPC-002 | analysis | `timeline.bands[0].min_cn0_dbhz >= 25 dB-Hz` | 3.2329 dB-Hz | not met | PARTNER |
| CMP-001 | analysis | time error at or below the guard at every step | 51.7825 ns against a 50 ns guard at element 214 of the series; 275 of 458 elements within | not met | PARTNER |
| CMP-002 | demonstration | first campaign event within 30 min | 1,200 s | met (stays open: demonstration) | PARTNER |
| MARS-001 | analysis | `fom.rms_error_relays_m <= 5 m` | 1.8827 m | met | MODELLED |
| MARS-002 | analysis | `fom.availability_relays >= 99 %` | 1 (100 %) | met | MODELLED |
| OPS-001 | inspection | none: verified by hand | no run traced | not verified | none |

The field names are the open engine's own result fields (`ppp` is precise point
positioning, `rms` root mean square, `pdop` position dilution of precision and `fom`
figure of merit). The requirement identifiers name what they cover: LEO low Earth orbit,
LUN lunar, SPC spectrum, CMP campaign, MARS the Mars orbiter and OPS operations.

**What it does not do.** The dossier's hashes prove that its files agree with each other;
they are not a signature and do not prove who issued it. Simulation evidence counts as
analysis and does not replace a test, an inspection or a demonstration. A dossier is not a
certification, a qualification or an acceptance by any authority.

## Campaign watch

**The question.** A free user runs a campaign and reads the result. A Pro user names the
figures that matter in a set of scenarios, says what worse means for each, and gets a
pipeline that fails when a change to a scenario, a model or the engine makes one of them
worse, or stops meeting its requirement.

**How it works.** It extends the [scenario regression check](#scenario-regression-check).
A pack of scenarios of any open kind carries watch tables. Each watch names a figure (a
result field, an aggregate such as the largest value of a time series, a campaign figure
such as a channel's value at the end of a phase, or the point where a sweep crosses a
threshold), says whether higher, lower or a target value is better, and sets a tolerance
and, optionally, a requirement checked with its unit. A Monte Carlo figure is judged with
statistics instead of a tolerance: a Welch t-test on the means and an F-test on the spreads,
at a significance level fixed before the first run (0.01 by default), so a new set of
random seeds is not called a regression and a doubled spread is. Every run is appended to a
history in which each record carries the hash of the one before, and a check reports
whether that chain is intact. A pack without watch tables runs exactly as before.

**What it produces.** A JSON file with every figure, every watch and its verdict (the next
run's baseline); an HTML report; the hash-chained history; a trend page with one small
chart per watched figure; a figure-by-figure diff of any two runs; and an exit code of 0
when every watch holds and 1 otherwise, so a continuous-integration pipeline can stop on it.

**Worked examples.** The campaign pack watches three open campaigns (a chained jamming,
spoofing, holdover and integrity mission, a 200-seed Monte Carlo clock ensemble and a
jammer-power sweep) on 10 figures, with the requirements taken from the open campaign
documentation. Run twice, it passed both times; the second run found 0 changed results, the
history check reported 2 records with the chain intact, and the diff reported 0 of 125
figures moved. For the clock ensemble the statistical gate reported t = 0.000 and p = 1.0,
as it must for the same seeds. A six-revision demonstration sequence of the chained mission
shows a regression caught. A revision that changed only a comment moved no watched figure,
and a weaker jammer was reported as an improvement of C/N0. Then raising the jammer from
-33 to -24 dBW drops C/N0 at the end of the jamming phase from 30.60 to 21.82 dB-Hz, below
the 25 dB-Hz floor, and the satellites
tracking from 8 to 0; three watches regressed, the requirement was not met, and the run
exited 1. Withdrawing that revision passed again, and a faster spoofer was detected at
310 s instead of 370 s and reported as an improvement, as was the smaller share of the
mission under alarm, while two time-error figures moved within their tolerances. The
history of the six runs checked intact; its last record's hash is
`71397c3eee5b8822cf4b2109e135576fda9fef44c63201d049835d48dac67c2c`.

**What it does not do.** A watch proves that a MODELLED figure stayed stable or moved; it
does not prove the figure is true. The statistical gate uses the ensemble's mean, standard
deviation and count only: it has no test for correlated runs or for percentiles, and the
F-test assumes roughly normal samples. A figure with no stated direction is reported and
never fails a run. Requirements compare values; there is no arithmetic between fields.

## Spectrum coexistence

**The question.** A free user checks one satellite's signal against one GNSS signal. A Pro
user tests one or more candidate signal plans, each a signal design and a constellation,
against every open-service GNSS signal the engine models, with every satellite of the plan
in view at once, and gets a verdict per plan and signal against a limit the study states.

**How it works.** The victim signals are GPS L1 C/A and L5, and Galileo E1, E5a, E5b and
E5 AltBOC. Both directions are tested: the loss of C/N0 each plan causes to each GNSS
signal, and the loss the GNSS signals cause to the plan. Every physical number comes from
open-engine runs (the signal model of the open `leo-signal` kind and the coverage grid of
the open `constellation-design` kind); Pro adds only the sum over the satellites in view
at each cell of a worldwide grid and the ranking of the plans. The limit and its source are
inputs; no limit is built in. The plans are ranked on ranging accuracy, worst loss caused
and number of satellites with the open engine's Pareto routine.

**What it produces.** A result file that gives every open run with the SHA-256 of its
scenario and result and a unit for every number; a matrix chart of plans against signals;
a world map of the worst loss; a chart of the ranked plans (all three SVG); and a
self-contained HTML report.

**Worked example.** Four illustrative plans on the open engine's generic signal designs,
against an illustrative limit of 0.1 dB chosen for the example only: an L-band signal on
Walker constellations of 288 and 144 satellites at 1,000 km, and two C-band signals on
288 satellites. The study ran 10 open-engine runs, and all 4 plans were compatible. The
worst loss caused was 0.00544 dB, by the 288-satellite L-band plan to the Galileo E5 AltBOC
signal at a cell with 17 of its satellites in view, a margin of 0.0946 dB to the limit.
The 144-satellite plan caused at most 0.00288 dB, with 9 in view. Neither C-band plan
overlaps any GNSS signal in frequency. In the other direction, the GNSS signals cost the
L-band plans at most 0.00908 dB. Two plans form the ranked front: the 144-satellite L-band
plan and the wide C-band plan. The study's scenario hash (the SHA-256 of its canonical
JSON) is `479364bde54004a2300562d7468c9accb53b87ac7408982de86d810aadf985d4`.

**What it does not do.** The result is an upper bound: every satellite in view is taken at
the maximum received power, with no power that varies with elevation and no receive-antenna
pattern. Only the open-service signals the open engine models are covered (not GPS L2C),
with smooth spectra and no spreading-code lines. Other systems are left out of the sum:
other GNSS, other low-Earth-orbit systems and services on the ground. It is not a
coordination filing and not a regulatory finding.

## On-premises job service

**The question.** A free user runs one scenario at a time on one machine. A Pro team queues
studies on its own network, lets them run while no one watches, and can show afterwards
exactly which result was delivered for which request.

**How it works.** It extends the [on-premises service](#on-premises-service). Started with a
data directory, the service keeps a queue of jobs on disk and runs them on a set number of
workers. Three operations ship: run a scenario of any open or Pro kind, build a study
dossier, and run a scenario regression check. A job's identifier is the SHA-256 of the
operation and the request, so the same request is the same job and is not run twice. Each
delivery is recorded in a ledger in which each record carries the hash of the one before,
and a route re-checks the chain and the stored results against it. After a stop or a
crash, every unfinished job is queued again and no finished job is run again. The
licence is checked when a job is submitted and again when it runs. The interface is
described by an OpenAPI 3.1 document generated from the service's own route table, and a
job board page lists the jobs. The service contains no network client: its only outbound
connection is a health probe to its own address.

**What it produces.** For each job, the request, its status, its result and its files,
under the data directory; the delivery ledger; the ledger check; the OpenAPI document; and
the job board page.

**Worked example.** A service with two workers took a link-budget run: the submission was
accepted and queued (HTTP status 202), and the job succeeded on its first attempt. Its
identifier was `fb6e50fffa53fc97135885c9a42f8de0c175d803181af99dcc94e14de5aa0004`. Its
result is the same JSON document as the command-line run of the same file (the command line prints it formatted, so
the bytes differ). Submitting the same request again returned the same job, already
finished. The ledger check verified 3 records and 1 delivered job with no mismatch, the
OpenAPI document listed 13 paths, and the job board page loaded nothing from outside.
After a restart the finished job still showed one attempt. In a second test three jobs were
queued on one worker and the service was killed while the third was running; after the
restart that job ran again and succeeded, the two finished jobs were not run again, and the
ledger verified 9 records and 3 delivered jobs. Without a licence, a job for a Pro scenario
was refused on submission (status 403) and nothing was queued, while an open scenario was
accepted (status 202). The status, result, repeated submission, ledger check, OpenAPI
document and job board requests were answered with status 200.

**What it does not do.** One request per connection, with no streaming: a client polls. One
licence for the whole service and one shared access token, not user management. Plain HTTP
only: encryption with TLS belongs in the site's own reverse proxy. One service per data
directory, and nothing locks it. No cancellation, time limit, priority or retention policy.
The data directory is the only copy of the results and the ledger, so it must be backed up.

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
- **Nothing Pro produces is a certification.** Every result is modelled, and says so.
