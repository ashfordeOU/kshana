<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# First-72-hours breakup exposure: `kshana breakup-exposure`

After an on-orbit breakup, operators often wait days for the fragments to be catalogued.
`kshana breakup-exposure` gives an earlier, modelled answer to one question: which tracked
objects fly through the region a standard breakup model says the fragments occupy, and for
how long, over the next 72 hours. It takes a breakup event and a public element-set catalogue
as files, and produces a ranked exposure table.

```
kshana breakup-exposure <event.toml> <elements.json|elements.tle> ... [--json] [--out <report.json>]
```

Exit codes: 0 report written; 2 a usage or input error. No network.

**Evidence: MODELLED.** This is a screening estimate from a statistical breakup model and
public element sets. It is not a conjunction assessment and not a collision probability, and
it says nothing about any individual fragment. When catalogued fragments appear, use them:
`kshana orbit-data` and a CDM-based assessment apply to real objects.

## The fragment-cloud model

The model is the **NASA Standard Breakup Model** (Johnson, Krisko, Liou and Anz-Meador,
*NASA's new breakup model of EVOLVE 4.0*, Adv. Space Res. 28(9), 1377-1384, 2001). The original
paper was not read. The equations below are taken from two open restatements, both fetched
2026-11-28:

- P. Krisko, *Proper Implementation of the 1998 NASA Breakup Model*, NASA Orbital Debris
  Quarterly News 15(4), October 2011, equations 1-4
  (<https://orbitaldebris.jsc.nasa.gov/quarterly-news/pdfs/odqnv15i4.pdf>);
- *Threat Level Estimation From Possible Break-Up Events In LEO*, arXiv:2407.18197,
  equations 21, 22 and 29 (<https://arxiv.org/abs/2407.18197>).

| Quantity | Law | Used for |
|---|---|---|
| fragments of length `Lc` or larger, explosion | `N = 6 S Lc^-1.6`, S between 0.1 and 1 | the count in the report |
| fragments, collision | `N = 0.1 M^0.75 Lc^-1.71`; `M = Mt + Mp` when catastrophic, `M = Mp vimp²` (vimp in km/s) otherwise | the count |
| catastrophic collision | `Mp vimp² / (2 Mt)` at least 40 J/g | the regime |
| ejection speed | `log10(Δv)` normal, mean `0.2 χ + 1.85` (explosion) or `0.9 χ + 2.9` (collision), standard deviation 0.4, `χ = log10(A/m)`, Δv in m/s; directions spherically symmetric | the shell |

### Assumptions

These are written into every report.

- **The area-to-mass distribution is not sampled.** You give the largest `A/m` the shell
  should cover (`area_to_mass_max_m2_kg`, default 1 m²/kg) and a percentile (default 99).
  The shell is bounded by the ejection speed at that percentile, at that `A/m`.
- **The shell is static.** The parent's state comes from SGP4 at the event epoch. Every
  two-body orbit reachable from that state by a kick up to `Δv_max`, in any direction
  (sampled on a Fibonacci sphere, default 2000 directions), contributes a perigee, an apogee
  and an inclination. The shell is the spherical layer from the lowest perigee to the
  highest apogee, within the latitude band of the highest inclination. Over the window it
  does not move, spread or decay: there is no drag and no J2 on the shell.
- **The cloud centre is the parent's pre-event orbit, propagated.** Along-track spreading of
  the cloud is not modelled.
- **Objects are propagated with SGP4** from their latest element set in the input files. An
  object is inside the shell at a step when its radius lies within the shell and its
  latitude within the band.

At high percentiles the shell is wide, because the fastest fragments reach very different
orbits. This is the model's tail, not a sign that those orbits are crowded.

## Input

```toml
[event]
name = "fictional upper-stage explosion"
epoch = "2026-11-20T06:00:00Z"
kind = "explosion"            # or "collision"
parent_norad = 99001          # its latest element set in the catalogue files is used
scaling_factor = 1.0          # explosion S
# collision: target_mass_kg, projectile_mass_kg, impact_speed_km_s

[model]                       # all optional; defaults shown
min_characteristic_length_m = 0.1
area_to_mass_max_m2_kg = 1.0
delta_v_percentile = 99.0
hours = 72.0
step_s = 60.0
directions = 2000
```

Catalogue files are OMM JSON (CelesTrak or Space-Track GP records, one record or an array),
or two- and three-line element sets. The command reads only the files it is given.

## Output

The report (`kshana.breakup-exposure/1`) contains:

- the model fragment count at or above `Lc`, and the collision regime;
- the shell: Δv bound and median, lowest perigee, highest apogee, latitude band, and the
  parent's altitude;
- the sources, the assumptions, and the SHA-256 of every input;
- the number of objects screened and the number that intersect;
- the objects SGP4 could not propagate, each with the reason;
- the **ranked exposure table**: every object whose mean perigee-apogee range overlaps the
  shell, ordered by hours inside the shell, then by closest distance to the cloud centre. Each
  row gives the object's perigee and apogee, inclination, hours and percentage of the window
  inside the shell, first entry time, and the closest distance to the centre and when it
  occurs.

The text output is a summary line and the table.

Tests: `tests/breakup_exposure.rs`, on the fictional catalogue in
`tests/fixtures/breakup-exposure/`. The fragment counts, collision regimes, ejection speeds,
normal quantiles, the shell extremes (checked against vis-viva tangential kicks), and which
objects intersect are all derived by hand.
