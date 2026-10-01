# ins_coast_navego_montecarlo_oracle fixture

Used by `tests/ins_coast_navego_montecarlo_oracle.rs` (matrix row "INS/TRN coasting error growth
& threshold crossings").

## Source

NaveGo v1.4, https://github.com/rodralez/NaveGo (git tag `v1.4`, commit 24d9488), retrieved
2026-09-30, licence **GNU LGPL-3.0**. NaveGo is run as a tool under GNU Octave 11.1.0: the
generator calls its strapdown mechanization (`ins/att_update.m`, `vel_update.m`, `pos_update.m`,
`earth_rate.m`, `transport_rate.m`, `gravity.m`, `radius.m`), `simulation/coriolis.m` and
`conversions/imu_si_errors.m`. None of NaveGo's code is linked into or copied into the crate;
`navego_coast_errors.csv` is NaveGo's output, redistributed under the same licence
(https://www.gnu.org/licenses/lgpl-3.0.txt).

## Files

| File | What it is |
|---|---|
| `gen_ins_coast_navego.m` | the generator (one Octave call per term and seed range) |
| `navego_coast_errors.csv` | `term,seed,t_s,dn_m,de_m`: north and east free-inertial position difference between the run with one error source and the error-free run, at 30, 60, 120, 300, 600, 1200, 1800 and 3600 s; T1-T4 one deterministic run each, T5 and T6 seeds 1-300 |

Regenerate (about an hour on four cores) after `source ~/Code/kshana-oracles/env.sh`, from this
directory:

```sh
octave --no-gui -q --eval "gen_ins_coast_navego('T1', 0, 0, 'T1.csv')"   # likewise T2, T3, T4
octave --no-gui -q --eval "gen_ins_coast_navego('T5', 1, 150, 'T5a.csv')" # and 151..300; likewise T6
```

then concatenate under the header line `term,seed,t_s,dn_m,de_m` in the order T1..T6, seeds
ascending. Octave's `randn("seed", k)` generator makes the stochastic rows reproducible on the same
Octave version.

SHA-256 of the committed `navego_coast_errors.csv`: 1790ad6bea8accfeba22fd99e5227cfeba5cfe3713e069000ecd6637546301bc.

Correction, disclosed: the first generator run placed the T3 acceleration burst one sample early
(the mechanization never integrates sample 1), so its cruise speed was 9 m/s instead of 10. The
generator was corrected and T3 re-run after the first comparison had been seen; the committed T3
rows are the corrected ones (first-run file SHA-256
83b7e0e4c375e7bac9ce5033a8dbd130741713572f025577da6d8ec46bf45ee6, kept outside the repository).
T4 is bit-identical under the correction; T1, T2, T5, T6 do not use the burst.
