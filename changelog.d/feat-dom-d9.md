### Added

- **Measured clock library (`clock_library`).** Device cards (white phase, white, flicker and
  random-walk frequency modulation plus a linear frequency drift) fitted to a named measured
  clock record and scored on held-out data; gap-aware Allan and Hadamard variances; a
  conditioning detector that logs every gap, phase outlier, phase step, burst and frequency
  step; conversion of a card to the slot-timing noise model, the extended Kalman clock model
  and the spoofing monitor's noise levels.
- **Lag-1 autocorrelation noise identification** (`allan::lag1_noise_id`, Riley and Greenhall
  2004), used for the cards' degrees of freedom.
- **Clock-record readers** (`realdata::clk`): RINEX and IGS clock files to gridded records,
  BIPM per-laboratory `[UTC - UTC(k)]` files and Circular T Section 1.
- **Pooled ageing bound for UTC(k)** (`utck_bound`), an engine for a prospective comparison;
  not scored.

### Validation

- New row, VALIDATED: power-law noise identification by lag-1 autocorrelation agrees with
  allantools 2024.6 on 140 cases (integers identical, worst difference 9.6e-13 against a
  pre-registered 1e-9).
- New row, MODELLED (a finding): measured device cards with held-out prediction. On a fresh IGS
  window (2026-03-01 to 14) 10 of 11 GPS Block IIF cards predict their held-out Allan deviation
  within a factor of 1.5; G27 is optimistic at the two-hour scale (worst factor 1.510). The
  receiver TCXO card is blocked (167 training epochs against 3600); the Galileo maser and Deep
  Space Atomic Clock cards are blocked.
- M010 round 3 (receiver-TCXO card in the clock-aided spoofing monitor): blocked by the same
  training minimum; nothing scored, the row stays MODELLED.

### Revisions

- No published figure, golden or docs number changes. Matrix totals change only if both new
  rows are adopted: 226 rows, 110 validated -> 228 rows, 111 validated.
