# ins_coast_schuler_navego_oracle fixture

Used by `tests/ins_coast_schuler_navego_oracle.rs` (matrix row "INS/TRN coasting error growth
& threshold crossings", round-2 amendment).

## Source

NaveGo v1.4, https://github.com/rodralez/NaveGo (git tag `v1.4`, commit 24d9488), retrieved
2026-09-30, licence **GNU LGPL-3.0**, run as a tool under GNU Octave 8.4.0. The generator calls
NaveGo's strapdown mechanization (`ins/att_update.m` in quaternion mode, `vel_update.m`,
`pos_update.m`, `earth_rate.m`, `transport_rate.m`, `gravity.m`, `radius.m`),
`simulation/coriolis.m` and `conversions/imu_si_errors.m`. None of NaveGo's code is linked into
or copied into the crate or this directory; `navego_schuler_coast_errors.csv` is NaveGo's
output, redistributed under the same licence (https://www.gnu.org/licenses/lgpl-3.0.txt).

The one change from the round-1 generator: at run time the generator reads NaveGo's own
`ins/qua_update.m`, replaces its dead-band guard `if wnorm < 1.E-8` (which leaves the attitude
unchanged for body-to-navigation rates below 1e-8 rad/s) by `if wnorm == 0`, writes that copy to a
temporary directory and puts it first on the Octave path. The modified copy is not kept.

## Files

| File | What it is |
|---|---|
| `gen_ins_coast_schuler_navego.m` | the generator (one Octave call per term and seed range) |
| `navego_schuler_coast_errors.csv` | `term,seed,t_s,dn_m,de_m`: north and east free-inertial position difference between the run with one error source and the error-free run, at 30, 60, 120, 300, 600, 1200, 1800 and 3600 s; T1-T4 one deterministic run each, T5 and T6 seeds 1-300 |

Regenerate (about 80 minutes on two cores) after `source ~/Code/kshana-oracles/env.sh`, from
this directory:

```sh
octave --no-gui -q --eval "gen_ins_coast_schuler_navego('T1', 0, 0, 'T1.csv')"     # likewise T2, T3, T4
octave --no-gui -q --eval "gen_ins_coast_schuler_navego('T5', 1, 150, 'T5a.csv')"  # and 151..300; likewise T6
```

then concatenate under the header line `term,seed,t_s,dn_m,de_m` in the order T1..T6, seeds
ascending. Octave's `randn("seed", k)` makes the stochastic rows reproducible on the same Octave
version (8.4.0 here).

SHA-256 of the committed `navego_schuler_coast_errors.csv`: 4d945025fcf81853e36e5eecfb6d7042506498631857f4250760e91f24269da0.
