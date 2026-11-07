<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Monitoring-network planner

`kshana planner` answers the siting questions for a fixed interference-monitoring network before it is built:
from where on a site a source of a given power would be detected, how well it would be located, and which
stations to build. It is row B1a of 0.41. Its maps are **MODELLED**: predictions from a geometry and a link
budget in free space, not measurements.

```
kshana planner map   spec.json > map.json
kshana planner place spec.json > placement.json
```

## Input: `kshana.planner/1`

`xval/planner/layout_circle.json` is a complete example. It holds:
- the site grid (`site`: a latitude and longitude box and the number of rows and columns);
- the source (`source`: EIRP in dBW, height, frequency);
- the stations' detector (`receiver`: noise figure, bandwidth, integration time, false-alarm probability);
- the TDOA standard deviation (`sigma_tau_s`);
- the locating `mode`: `surface` for a source on the ground, which needs 3 stations; `3d` needs 4;
- the gate (`gate_pd`, the detection probability at which a station counts toward the accuracy);
- the accuracy requirement of the placement objective (`d_req_m`);
- the `stations` for a map, or the `candidates` and `m` for a placement.

## What it computes

For the source at each cell:
- each station's received power and detection probability (an energy detector over the bandwidth and
  integration time);
- the network's detection probability;
- the probability that at least `k` stations detect;
- from the stations that detect with probability at least `gate_pd`, the Cramér–Rao bound on the
  horizontal position, given as DRMS and the 95 % ellipse.

A placement chooses the `m` candidates that cover the most cells where `P_k ≥ 0.9` and the DRMS meets the
requirement. Ties go to the lower median DRMS, then to the lower candidate indices. The search is
exhaustive up to 10 000 subsets and greedy beyond that.

The same JSON comes from Python and WebAssembly (`planner(kind, spec_json)`) and from the Rust API
(`kshana::planner`).

## Limits

- Free-space propagation only. The terrain, multipath and clutter terms are not in this version.
- The accuracy is a lower bound. Where the geometry is poor, the noise is large, or only three stations
  detect, an estimator can do worse than the bound.
- The greedy placement is a heuristic. In its pre-registered check it did not beat the best of 1 000 random
  subsets (`docs/design/evidence/b1a-planner/RESULTS.md`).
