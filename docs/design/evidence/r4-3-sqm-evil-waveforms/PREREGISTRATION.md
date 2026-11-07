<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R4.3: signal-quality monitoring metrics and evil waveforms

**Status: proposed, committed before any engine code and before any published oracle value is read.**
The bars below become binding when the owner signs them. They may be tightened after a run, never
loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the
miss. Advisory software, not type-approved navigation equipment.

## Why this row

Kshana's IQ layer has SQM monitors (delta, ratio and symmetric-pair tests, `src/iq/monitor/sqm.rs`)
whose false-alarm rate is checked against its closed form, but no model of the signal deformations
they exist to catch. R4.3 adds the ICAO "evil waveform" threat models for GPS L1 C/A (threat model A:
digital lead or lag Δ; B: analogue second-order ringing with resonance `f_d` and damping `σ`; C: both)
in the correlation domain, the SQM metrics and the code tracking error they cause, and scores them
against published values.

## Scope and safety

The deformations are fault models of a legitimate satellite signal, used to compute correlation
functions and to test monitors in simulation. They are not interference or spoofing waveforms. They
are evaluated in memory; writing a deformed signal into an IQ scene file meant for playback is out of
scope for this item and would need its own decision (`docs/HARDWARE-SAFETY.md`). No transmit code.

## The model (fixed now)

- Chip waveform: the ideal ±1 chip; TM-A delays the falling edge by Δ chips (lead for Δ < 0); TM-B
  passes the chip through the second-order step response with natural frequency `2π f_d` and damping
  `σ`; TM-C does both. Correlation against the ideal replica over one PRN period, normalised to the
  undistorted prompt.
- Discriminator: early-minus-late (coherent) at spacing `d`; tracking error is the code offset that
  zeroes it. SQM metrics: delta and ratio at the receiver's spacing, and the symmetric pairs at
  ±0.05, ±0.075, ±0.1 chips.

## Oracles

1. **Published values (external).** Chosen by this rule: an openly accessible publication that states,
   for GPS L1 C/A, numeric tracking errors or correlation-function values for stated TM-A, TM-B or TM-C
   parameters and a stated correlator spacing and front-end bandwidth (or none). Every such value in
   the chosen publication is used; none is dropped after reading. Candidates found while writing this
   (values not read): the Stanford doctoral thesis on multicorrelator SQM (Phelts, 2001) and the
   open-access master's thesis on the second-order step model for new GNSS signals (Instituto
   Superior Técnico, Lisbon; its L1 C/A results only). **The owner confirms the publication at
   sign-off.** Values read from a figure rather than a table are not used.
2. **Closed forms (internal, not external).** TM-A has an exact piecewise-linear correlation function;
   TM-B's chip response integrates in closed form. These check the implementation and cannot make
   the row VALIDATED.

## Bars (proposed)

- **B1 Closed forms.** For TM-A at Δ ∈ {−0.12, −0.06, 0.06, 0.12} chips and TM-B at
  `f_d` ∈ {4, 8, 12, 17} MHz × `σ` ∈ {0.8, 4.0, 8.8} Mneper/s, the correlation function at 2 001
  offsets in [−1.5, 1.5] chips is within 1e-9 of the closed form, and the tracking error at
  d ∈ {0.1, 0.2, 0.5, 1.0} chips within 1e-6 chips.
- **B2 Published values.** Every value of the chosen publication is reproduced within the larger of
  2 % of the value and half the last printed digit.
- **B3 Monitor in simulation.** On IQ simulated at C/N0 45 dB-Hz with the existing monitor
  (`avg_epochs`, `k_sigma` and `min_count` as shipped), the false-alarm fraction on undistorted signals
  stays within a factor of 2 of `2Q(k)`, as the shipped test requires, and TM-A with |Δ| = 0.12 chips is
  detected in ≥ 95 % of 200 seeded runs within 10 s.

The row becomes VALIDATED only if B1, B2 and B3 are met with an external publication confirmed for B2.
Without one, or if B2 is missed, the row stays MODELLED (B1 and B3 are internal checks) and the miss is
published.
