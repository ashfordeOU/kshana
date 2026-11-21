# AFS interoperability planning and the lunar user-equipment register

`kshana afs-interop` is planning tooling for the LunaNet Augmented Forward Signal (AFS): how far
the AFS-Q code family sits from the GPS L1 C/A and Galileo E1 families and from itself, and a
register of the user equipment that depends on AFS PRNs. Source: `src/afs_interop.rs`. MODELLED,
planning only.

```
kshana afs-interop study
kshana afs-interop study --afs-prns 1-12 --gps-prns 1-32 --max-doppler 10000 --doppler-step 500 --sweep-pairs 5
kshana afs-interop ue-register --template > register.json
kshana afs-interop ue-register register.json
```

## Code-family study

Every code is sampled at `--fs` (10.23 MHz: two samples per AFS-Q chip, ten per C/A chip) over
`--integration-ms` (2 ms: one AFS-Q period, two C/A periods) as ±1 values. The window repeats, so
with whole periods in it the figures are periodic correlations; Galileo E1 (4 ms period, CBOC
reduced to its sign) is cut to the window, stated.

* **Zero Doppler**, exact: the largest |cross-correlation| over every sample lag for every AFS-Q
  pair and every AFS-Q / GPS (and AFS-Q / Galileo) pair, by XOR and population count, per family
  pair (worst and mean) and the worst pairs; and each family's largest out-of-phase
  autocorrelation (lags within one chip of a code-period multiple excluded).
* **Doppler sweep** within `±--max-doppler` in `--doppler-step`, for the `--sweep-pairs` worst
  pairs, from 64-sample partial sums rotated by the Doppler phase at each word's centre; the
  largest small-angle loss of that method (`1 − sinc` at the bound, 0.6 % at 10 kHz) is reported.

Check: the GPS C/A out-of-phase autocorrelation comes out at −23.94 dB, the Gold-code bound
`20·log10(65/1023)`. With the defaults, the worst AFS-Q pair among PRNs 1 to 12 is −28.0 dB and
the worst AFS-Q / GPS C/A pair −26.0 dB.

**What it is not.** The AFS is at 2492.028 MHz and GPS L1 / Galileo E1 at 1575.42 MHz; any
receiver separates them by RF filtering. The figures are code-family separation as if the codes
were co-channel, the worst case for a multi-system design or a reuse of the families, not a
prediction of interference between the broadcasts. Galileo E1 memory codes are not bundled (their
terms allow use, not redistribution); the family is included when the user supplies the tables
(`KSHANA_GALILEO_E1B`) and listed as unavailable otherwise. AFS-I needs the LSIS attachments and is
not included.

## User-equipment register (`kshana.lunar-ue-register/1`)

One entry per piece of user equipment: `ue_id` (unique), `organisation`, `mission`, `platform`
(lander, rover, orbiter, relay, surface-station, crewed-vehicle, suit, other), `status` (planned,
in-development, active, retired), `signals` (afs-i, afs-q, gps-l1ca, gps-l1c, galileo-e1, other),
`afs_q_prns` (1 to 210), `time_scale`, `frame`, optional `receiver` and `notes`. Fields that would
hold personal contact details (email, phone, contact, person) are refused: a register names
organisations, never people. The check reports every violation by entry and field and how many
entries use each AFS-Q PRN, the input a provider needs before changing an allocation. The
template holds two synthetic entries.
