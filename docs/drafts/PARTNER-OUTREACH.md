<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# DRAFT: a note to a data partner (one page, for the owner)

**DRAFT for the owner. Not sent, and nobody has been contacted. The owner decides whether, when and to whom it goes, and fills in the
sender and contact line; this draft names no person and no organisation.** It is written for "a national timing laboratory", "a
university metrology group" or "an oscillator or quantum-sensor maker"; change the first paragraph for the type.

---

**Subject: A request for a measured clock record, and what we would do with it**

Kshana is an open-source simulator of the resilience of positioning, navigation and timing, published by Ashforde OÜ under the
AGPL-3.0. Its results carry a label, in a public ledger: VALIDATED where an independent external oracle agrees under a bar fixed
before the comparison, MODELLED where it does not. The per-clock-class holdover floors and the quantum-versus-classical timing
trade are MODELLED today because we hold no measured record of those device classes of our own. We would like to compare the models with
yours, if you have a record you are free to share.

**What we ask for.** One measured record: a clock's phase (or frequency) against a better reference over days, at a sample interval
of a minute or less, or a stationary log from an inertial unit. Any of the common formats is fine (TAPR TICC, TimeLab ASCII, RINEX
clock, linuxptp or chrony logs, a named-column CSV); a short description of how it was taken; and a licence you choose. No personal
data, nothing restricted, nothing simulated.

**What we would do.** Before the data is run, we publish a pre-registration that fixes the row, the file's hash, the part held out from
any fitting, the metric and the bar, and we never loosen it. We run it once and publish every number, including a miss. A miss leaves
the row as it is and says so. Whether a ledger label changes is the owner's decision, in writing, and the row's text says exactly what was compared with what.

**What you keep.** The data stays under your licence. You can choose `public` (with your attribution), `hash-only` (only its hash and
the scores are published) or `private` (the score goes to you alone), and you can withdraw before a result is published. We make no
claim that anyone approved or endorsed anything, and we name no organisation as a source without written consent. Kshana
transmits nothing and drives no hardware: files in, a report out.

**How to start.** The page `docs/PARTNER-DATA.md` lists the rows, the formats and the steps, and `kshana partner check submission.toml`
checks a submission's format and metadata on your own machine before you send anything; it scores nothing and sends nothing.

[Sender and contact: owner to fill in.]

---

Notes for the owner (not part of the message):

- Send nothing that implies the laboratory's participation before it agrees in writing.
- A reply that offers data starts step 1 of `docs/PARTNER-DATA.md`; nothing is scored until a pre-registration is signed off.
- The first two rows in `docs/PARTNER-DATA.md` (per-class holdover floors, the quantum-versus-classical trade) are the ones this note is about.
