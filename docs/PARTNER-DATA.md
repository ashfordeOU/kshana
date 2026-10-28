<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Partner data: what measured data could promote a MODELLED row

Kshana labels every capability in a machine-checked ledger ([verification matrix](VERIFICATION-MATRIX.md)). Most
timing and sensor rows are **MODELLED**: they rest on stated models, published datasheets and internal checks, and
no measured record of the device class has been compared with them. A holder of such a record can change that. This page
says which rows, what to send, how a submission is checked, how it is scored and how it is credited. It is written
for a laboratory, a manufacturer or a university group; it is not an offer of work and it claims no endorsement
by anyone. Advisory only: Kshana is a study instrument, not type-approved navigation or timing equipment.

## What the labels mean

| Label | Meaning |
|---|---|
| **VALIDATED** | an independent external oracle agrees with the capability under a bar fixed before the comparison. A measured record from a partner can be that oracle for the sub-claim it covers; the matrix invariants forbid the label without one |
| **MODELLED** | internally consistent and said out loud; no external oracle covers the claim. A MODELLED row that is compared with measured data and misses stays MODELLED, and the miss is published |
| **PARTNER** | a discipline the run relies on that a hardware partner owns and Kshana does not provide, for example the figures that describe a partner's own clock or interferometer. Kshana models what such a device would do to a navigation or timing chain; it does not vouch for the device |

A submission can move a row to VALIDATED only for the claim the data actually tests, and only if the comparison meets its
bar. It cannot make a device's own figures Kshana's to vouch for: those stay the partner's (PARTNER). Whether a row's label
changes is the owner's decision, recorded in the commit that changes it, with the oracle text saying exactly what was
compared with what.

## Rows a partner's data could promote

Each row below is the exact `requirement` text of a MODELLED row of the matrix (a test keeps this page and the matrix in
step). "Could change" says what a pre-registered comparison with measured data would support if the bar is met; it is
never a promise.

| Row | Data that would test it | Could change |
|---|---|---|
| `GNSS-denied clock holdover` | a record of days of a clock of a named class, free-running after its last discipline, compared with a better reference, at a sample interval of a minute or less | the per-class red-noise floors that bound holdover figures stay MODELLED today; a measured long-averaging-time stability could be compared with the floor of that class, for that class only |
| `Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)` | the measured Allan deviation, as a table or as the phase record, of a partner's clock or atom interferometer | the trade figures quantify (never validate) the partner device, so they would be labelled as the partner's figures (PARTNER); the ingest of measured Allan data into a noise model is already matched to an independent solver |
| `Oscillator holdover presets from public datasheets` | a phase record of an oscillator of one of the four preset models, over at least a day | whether the preset's datasheet-derived noise model reproduces a measured unit's stability at the datasheet's own averaging times |
| `Measured clock device cards (held-out prediction)` | a phase record of a clock class not yet carded (an OCXO, a rubidium, a caesium, a maser, an optical clock) | a card fitted on the first third and predicting the Allan deviation of the rest within the pre-registered factor, as already done for GNSS satellite clocks and one receiver |
| `Clock-log formats linuxptp (ptp4l, phc2sys, ts2phc) and chrony (tracking, statistics) read to a normalised phase series` | a log from a real installation (any daemon version) with the daemon's own summary lines | the readers were built from public line layouts and fixtures; a real log compared with an independent reader would be the first external check |
| `Clock-log formats (RINEX clock, TimeLab ASCII, TAPR TICC) read to a normalised phase series` | a real counter or analysis-software export | the same, for those formats |
| `Holdover test scored from an operator-supplied time-error record` | a real holdover test: the record, the times the operator removed and restored the reference, and the laboratory's own MTIE, TDEV and mask verdicts from its analysis software | an independent computation of the same quantities to compare with the engine's |
| `IMU log ingest, gyro heading input and Allan fit of hybrid sensor parameters` | a stationary log from an inertial unit whose noise parameters are published or measured by someone else | the fit recovered within a stated factor of the independent parameters |
| `Quantum inertial dead-reckoning resilience` | a static log or the noise parameters of a partner's cold-atom inertial sensor | the device figures are the partner's (PARTNER); the position-error budget that composes them stays Kshana's model |

Start with the first two: they decide whether the per-class holdover floors and the quantum-versus-classical trade
rest on any measured data of their own.

## What to send

A submission is two files in one folder: the data and a small description of it, a TOML file
(`kshana.partner-submission/1`; a worked, made-up example is `examples/partner-submission/submission.toml`).

**Clock data.** One of the formats Kshana reads (see [clock-log formats](CLOCK-LOG-FORMATS.md)): TAPR TICC logs,
TimeLab-style ASCII phase or frequency, RINEX clock, linuxptp `ptp4l`, `phc2sys` and `ts2phc` logs, chrony tracking and
statistics logs. Phase is preferred over frequency; state the units and the sample interval. Give the longest
uninterrupted record you have: stability at long averaging times needs days, and a record under a day is accepted
but warned about.

**Inertial data.** A named-column CSV (`t_s, gx, gy, gz, ax, ay, az`, rad/s and m/s^2) or the EuRoC layout, from a
stationary device, long enough for the fit (at least 2000 samples; hours is better).

**The description** says, and the checker verifies where it can:

- the type of organisation (a type such as "a national timing laboratory", not a name; a name is optional and only for credit);
- the device (kind, class, and a model for class `other`);
- how the data was taken: what it was compared against, the start time (UTC), the environment, and whether it is raw or
  processed (and what was done to it);
- the SHA-256 of the data file, so the file scored is the file described;
- the MODELLED rows it is offered against, by the exact requirement text above;
- the licence (an SPDX identifier or words) and how the data may be used in the repository: `public` (committed, with
  attribution), `hash-only` (only its hash and the scores are published) or `private` (the score is shared with the
  submitter alone);
- three statements: it is a measurement and not a simulation, the submitter may license it for this use, and the files
  hold no personal data.

**Not to send.** Anything personal or with contact details (the checker refuses an email address or telephone number in the
description), anything under export control or restricted by agreement, and any simulated data presented as measured.

## How a submission is checked

1. **Format and metadata, by you or us, before anything runs.**

   ```sh
   kshana partner check <submission.toml>          # add --json for a machine-readable report
   ```

   It confirms the schema, the required fields, the hash, the licence and attribution rules, that the target rows exist and
   are MODELLED, that the data reads with the engine's own reader, and it reports what it read (samples, interval, span,
   gaps) and warns about records that are short. Exit status 0 means complete and readable; 1 lists what to fix. **It
   does not score the data, validate a row or promise it will be used.**
2. **A pre-registration, before any scored run.** For each row, a document in `xval/<name>/` fixes, and is committed
   before the data is run: the row, the data file's SHA-256, which part of the data is held out (nothing fitted may see
   it), the metric, and the bar. For clock cards the existing template is the held-out prediction used for the IGS and
   receiver records: fit on the first third of the record, predict the Allan deviation of the rest, and require the
   predicted over measured ratio within a stated factor at every fitted averaging time. A bar is never loosened after a
   run.
3. **One scored run.** The result, every number and every miss included, is published with the command and the commit,
   and a test pins it. A miss is a finding, not a failure to hide: the row stays MODELLED and the page says so.
4. **The ledger decision is the owner's**, in writing, in the commit that changes the row. The oracle text of a promoted
   row names the dataset, its licence and credit, what was compared and what was not.

## Credit and rights

- The data stays yours under the licence you state. `hash-only` and `private` keep the file out of the repository.
- A `public` submission is credited by the attribution line you give, in the row's oracle text and in the result file.
- Nothing is published under your name without your written consent; an organisation named as a source is cited as a source,
  never as an endorser. No claim of approval or endorsement is made by or about a partner.
- You can withdraw a submission before its result is published. After that the result stays as recorded; if you withdraw
  the data licence, the file is removed from the repository and the hash and the scores remain.
- Kshana transmits nothing and drives no hardware. A submission is files in, a report out.

## Outreach

A one-page note for a laboratory is drafted for the owner in [`docs/drafts/PARTNER-OUTREACH.md`](drafts/PARTNER-OUTREACH.md).
It is a draft: nothing is sent, and nobody is contacted, until the owner decides.
