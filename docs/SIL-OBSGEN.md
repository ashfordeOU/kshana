# Software-in-the-loop observation generator

`kshana sil-obsgen` writes a RINEX 3.04 observation file (GPS-like `C1C L1C D1C S1C`) from a
scenario, the same bytes every time, so a receiver's positioning engine, an RTK or PPP pipeline or
a quality checker can run against it in continuous integration. With `--truth` it also writes, per
satellite and epoch, how the signal was received and the error the model added. Source:
`src/sil_obsgen.rs`; example: `examples/sil-obsgen/urban-canyon.toml`. MODELLED.

```
kshana sil-obsgen examples/sil-obsgen/urban-canyon.toml --out canyon.obs --truth canyon-truth.json
```

## Scenario

A `gnss-sim` scenario (Walker constellation by SGP4, receiver, `[iono]` Klobuchar, `[tropo]`
Saastamoinen/Niell, clocks, seeded noise; see the `gnss-sim` kind) with two optional tables:

* `[urban]`: `street_az_deg`, `width_m`, `height_left_m`, `height_right_m` (looking along the
  street azimuth), `antenna_m` (1.5), `reflection_loss_db` (6, an assumption);
* `[rinex]`: `marker` (the MARKER NAME).

The pseudorange, Doppler and C/N0 come from the `gnss-sim` measurement model; the carrier is
`λ·L = ρ − 2I + λN` with a fixed integer `N` per satellite. Time stamps run from the Walker
constellation's epoch and are written as GPS time.

## Urban canyon: LOS, multipath and NLOS

The street's two façades are vertical planes at ±w/2. For a satellite at azimuth `a`, elevation `θ`,
and `Δ` the angle between `a` and the far façade's normal:

| class | when | effect |
|---|---|---|
| `los` | the near façade is below the line of sight, no reflection | none |
| `los-multipath` | line of sight and a reflection off the far façade below its top | code `α·δ·cos φ/(1 + α·cos φ)` for `δ` under one C/A chip (0 beyond), carrier `λ/2π·atan2(α sin φ, 1 + α cos φ)`, `φ = 2πδ/λ` |
| `nlos` | the near façade blocks the direct ray, the far façade's reflection arrives over it | code and carrier `+δ`, C/N0 `− reflection_loss_db` |
| `blocked` | neither | not written |

with the reflection's excess path `δ = 2·d·cos θ·cos Δ` (`d = w/2`), computed by the image-source
construction, and `α = 10^(−loss/20)`.

**Published model.** For a reflector broadside to the satellite (`Δ = 0`), `δ` reduces to
`d·sec θ·(1 + cos 2θ)`, the NLOS delay model of L.-T. Hsu, *Analysis and modeling GPS NLOS effect
in highly urbanized area*, GPS Solutions 22, 7 (2018), doi:10.1007/s10291-017-0667-9. The model is
cited from its published form; its full text was not read for this work (to confirm). The unit
tests check the 3-D image construction against that closed form at six elevations and three
distances. This is a check of the delay geometry. The canyon's statistics (how often each class
occurs, the error distribution) have not been compared with field measurements, and nothing here
is a calibrated urban channel model.
