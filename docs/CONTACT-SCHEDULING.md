<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Ground-contact scheduling and DVB-S2 ACM

Two scenario kinds plan satellite downlinks:

- `acm-link`: one satellite over one station.
- `contact-schedule`: several satellites over several stations.

Both are MODELLED. Every bundled input is illustrative, not any operator's orbit, station or
link budget.

```sh
kshana scenarios/acm-link.toml
kshana scenarios/contact-schedule.toml
```

## What is computed

1. **Access.** The `passes` kind's predictor gives the visibility windows of each
   satellite–station pair. That predictor is VALIDATED against Orekit: SGP4, the IAU
   2006/2000A Earth-fixed frame, ITU-R P.834-9 refraction and light time. A satellite is a
   circular orbit given by altitude, inclination, right ascension of the ascending node and
   argument of latitude.
2. **ACM along each pass.** The downlink `Es/N0` is evaluated every `link.acm_step_s` from:
   - EIRP;
   - free-space loss at the slant range;
   - a cosecant-law atmospheric loss;
   - other losses;
   - the station's `G/T`;
   - Boltzmann's constant;
   - the symbol rate.

   At each step the run picks the most efficient DVB-S2 MODCOD that clears its quasi-error-free
   threshold, ETSI EN 302 307-1 V1.4.1 Table 13 (ideal AWGN, normal frames), plus
   `link.implementation_margin_db`. The spectral efficiency is computed from Table 5a and the
   frame lengths. The constant-coding (CCM) baseline is the single MODCOD that closes at the
   mask elevation and the longest range, and the ACM gain over it is reported per pass.
3. **Scheduling** (`contact-schedule`). Each pass becomes a candidate contact carrying its ACM
   volume. Two contacts conflict when:
   - one station antenna would serve two satellites without its turnaround (`setup_s`)
     between them; or
   - one satellite would downlink to two stations at once.

   The objective is the priority-weighted delivered volume, with each satellite's delivery
   capped at its backlog. Three plans are reported:
   - a marginal-value greedy;
   - a first-come chronological baseline;
   - the exact optimum by branch and bound, run when there are at most 26 candidates.

   The output gives the greedy's optimality gap whenever the exact solver ran.

The output's `units` block gives the unit and provenance of every field.

## What is not modelled

- Rain fade statistics (ITU-R P.618), pointing loss along the pass, pilots.
- The CCSDS 131.2 SCCC tables.
- Uplink and onboard storage limits.
- Data generated during the window: the backlog is fixed at the start.
- Contact splitting: a contact is taken whole.
- Antenna slew time beyond the fixed turnaround.

## Evidence

The ledger rows "DVB-S2 adaptive coding and modulation along a LEO downlink pass" and
"Multi-satellite, multi-station ground-contact scheduling with conflict resolution" are
MODELLED. Their checks are internal:

- the closed-form efficiencies against Table 13's printed values;
- the link-budget closed forms;
- monotone MODCOD selection;
- the exact solver against brute force on 60 random sets;
- feasibility of every plan;
- the greedy never exceeding the optimum.

No external scheduler, modem or measured link has been compared.
