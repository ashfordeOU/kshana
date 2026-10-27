# Results: the mission thread's cislunar arc against the Horizons -1023 trajectory

Advisory software, not certified navigation equipment.

Pre-registration: [`PREREGISTRATION.md`](PREREGISTRATION.md), committed (a1d621b0) before any comparison run, with Amendment 1
(the request span, 74768e4a) made before any state vector had been seen. Nothing was changed after the result.

## Verdict

| Row | What | Bar (fixed before the run) | Result | Verdict |
|---|---|---|---|---|
| C1a | largest 3-D position difference, six epochs over 72 h | 5 km | **45.3 km** (9.1 times the bar) | **NOT MET** |
| C1b | velocity difference at 72 h | 0.05 m/s | **0.249 m/s** (5.0 times the bar) | **NOT MET** |

C1 is **NOT MET** and the row stays **MODELLED**. The miss is published as it came out; no bar was loosened and no window was
re-chosen.

## The numbers

Window 2022-11-16 18:00 to 2022-11-19 18:00 TDB; the shipped `tli-and-cruise` phase (zero burn, a stated start state) run for
12, 24, ... 72 h from the Horizons state at 18:00; Horizons file SHA-256 `9494dc81cc8599a6519bf92d4198f2ffe5d149acf496788713b863a0b34029f9`.

| Hours | Position difference, km (kernel Moon) | Velocity difference, m/s | Position difference, km (analytic Moon, no bar) |
|---|---|---|---|
| 12 | 3.74 | 0.095 | 3.73 |
| 24 | 12.04 | 0.294 | 12.04 |
| 36 | 21.36 | 0.245 | 21.33 |
| 48 | 32.11 | 0.253 | 32.04 |
| 60 | 35.78 | 0.223 | 35.36 |
| 72 | 45.33 | 0.249 | 44.52 |

The analytic Moon gives nearly the same numbers, as the pre-registration expected: the Moon is not what separates the model
from the reference here.

## Why it missed: five impulsive events in the reference, not the force model

The pre-registration chose the window on the reading that the target's description lists one outbound correction burn, before
the window, and no other. **That reading was wrong for the as-flown data.** The data carry at least five small impulsive
changes of velocity inside the window, which a propagator with no burns cannot reproduce. The pre-registration said the row
would record the miss and say so if the data showed a burn, and it does.

The diagnostic ([`results_diagnostic.json`](results_diagnostic.json), `cargo run --example mission_thread_oracle -- <dir>
diagnose`) propagates each tabulated state one hour with the same phase and compares it with the next tabulated state. It was
written after the verdict, to locate the miss, and is not part of the verdict. Over the 67 hours without an event the model
reproduces the next hour to a median of 0.38 m and 0.21 mm/s (worst 0.4 m and
0.2 mm/s). In five hours it does not:

| Hour of the arc (from 18:00 TDB) | Velocity residual, m/s | Position residual, m |
|---|---|---|
| 1 | 0.091 | 598 |
| 17 | 0.221 | 347 |
| 23 | 0.160 | 3639 |
| 34 | 0.094 | 6870 |
| 57 | 0.150 | 13091 |

Their velocity residuals add (as vectors, partly cancelling) to the 0.25 m/s at the end, and each one grows into a position
difference of its size times the time left, which together give the tens of kilometres. The reference is a navigation
reconstruction of a flown vehicle: small trajectory corrections, attitude-control firings or the reconstruction's own
steps are all consistent with the residuals, and nothing here says which. This analysis does not say the model would meet the
bar on an event-free arc; that would be a new row with its own pre-registered bar, chosen without this result in view, and
none is claimed.

## What this does and does not say

* The force model (Earth point mass and J2, the Sun and Moon as third bodies, the Moon from the DE440 cut and the Sun from the
  analytic series) reproduces a flown cislunar state to sub-metre accuracy hour by hour between events, which is a statement
  about hours, not about the 72 h arc the row registered.
* The registered row as written is not met. No sentence in any document may say the cislunar propagation is validated
  against Artemis I.
* The row tests the mean-state propagation of one coast arc only: not the covariance, the filters, the updates, the burn error
  model, the ground-network overlay, the entry analysis or any other phase.

## Reproduce

```sh
bash xval/mission-thread/fetch_data.sh <dir>
cargo run --release --example mission_thread_oracle -- <dir> > xval/mission-thread/results_oracle.json
cargo run --release --example mission_thread_oracle -- <dir> diagnose > xval/mission-thread/results_diagnostic.json
KSHANA_MISSION_THREAD_ORACLE_DATA=<dir> cargo test --test mission_thread_oracle
```
