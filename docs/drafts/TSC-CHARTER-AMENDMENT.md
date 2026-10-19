<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# DRAFT: Technical Steering Committee amendment to GOVERNANCE.md

**Status: DRAFT for owner approval. Not adopted. The live `GOVERNANCE.md` is unchanged.**

Intent: give the project a path from "one maintainer decides" to a small committee that
owns the technical bar and the oracle registry, without weakening the bar in
`GOVERNANCE.md` ("The technical bar (non-negotiable)").

## Proposed text (to be inserted after "Roles")

### Technical Steering Committee (TSC)

**Purpose.** The TSC keeps the technical bar, the validation ledger and the oracle
registry honest. It does not set commercial terms, which stay with the maintainer
(Ashforde OÜ), and it cannot lower the bar.

**Size and seats.** Three to seven seats, an odd number. Seats are individual and
are held by named people recorded in a `TSC.md` file that this amendment does not
create. Until the owner appoints members there is no TSC, and `GOVERNANCE.md`
continues to describe the real decision process.

**Who can be seated.** People with a sustained, reviewed contribution record or
recognised standing in a relevant field (GNSS, timing, integrity, space geodesy).
No more than two seats may be held by people with the same employer or the same
commercial interest. Seats are by appointment of the maintainer on the TSC's
recommendation, for renewable two-year terms.

**What the TSC decides.**
1. Admission, demotion and retirement of validation oracles (see ORACLE-REGISTRY).
2. Whether a pre-registered bar was correctly applied and whether a result may be
   labelled VALIDATED.
3. Changes to the interchange schemas and published specs (test-conditions,
   benchmark) by lazy consensus, objection period 14 days.

**What it cannot do.** Loosen a pre-registered bar after a run, relabel MODELLED as
VALIDATED without an external oracle, accept export-controlled depth, accept
copyleft dependencies, or change the licence.

**Decisions.** Lazy consensus; if a member objects, a simple majority of seats
decides and the reason is recorded. A member with a conflict of interest abstains.
Votes and reasons are public in the issue tracker.

**Conflicts of interest.** Members disclose employer and commercial ties relevant
to a decision. A scored result about a member's own product is decided without
that member.

**Removal.** A seat ends on resignation, at term end, or by the maintainer after
a majority recommendation of the other seats for repeated absence or breach of the
Code of Conduct.

**Bootstrap.** Appointment of the first members, and any contact with prospective
members or their organisations, is an owner action outside this repository. No
endorsement by any person or organisation is claimed or implied by this text.

**Amendment.** As for the rest of `GOVERNANCE.md`: a pull request, decided by the
process above; this section cannot be used to shorten its own objection period.
