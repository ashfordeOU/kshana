# DE421 ME->PA offset sign: results

Pre-registration: `PREREGISTRATION.md` (e1ead19b). Oracle fixture:
`tests/fixtures/lunar_me_pa_offset_spice/` (SPICE `pxform('MOON_ME', 'MOON_PA')` on
`moon_080317.tf` and `moon_pa_de421_1900-2050.bpc`). Test:
`tests/lunar_me_pa_offset_spice_oracle.rs`.

## Run 1 (2026-10-13): NOT MET

| Quantity | Shipped code | Pre-registered change (transpose dropped) | Bar |
|---|---|---|---|
| PA<-ME factor vs SPICE (3 epochs) | 1.007e-3 rad (207.70") | 1.254e-7 rad (0.026") | 1e-12 rad |
| `icrf_to_moon_pa` vs DE440 PA, 2014-12 / 2022-01 / 2025-12 / 2028-09 | 211.20" / 209.31" / 208.78" / 209.21" | 8.30" / 7.21" / 5.96" / 7.59" | 30" |

The shipped error is confirmed: the offset is applied in the wrong direction (207.70" = 2 x
103.85"). The pre-registered change fixes the direction, but it leaves a second-order residual
of 1.25e-7 rad, about the product of the two large Euler angles (3.3e-4 x 3.8e-4 rad). That
points to the composition order. Bar 1 is not met, so under the outcome rule the engine is
left as shipped and the strict test is ignored.

SPICE's Frames Required Reading (`frames.req`, "Defining a TK Frame Using Euler Angles") states
that the matrix converting vectors from the TK frame to the RELATIVE frame is
`M = [angle_1]_axis_1 [angle_2]_axis_2 [angle_3]_axis_3`. For `TKFRAME_31007` (TK = ME,
RELATIVE = PA, angles 67.92", 78.56", 0.30", axes 3, 2, 1) that is
`PA<-ME = [67.92"]_3 [78.56"]_2 [0.30"]_1 = Rz(a) Ry(b) Rx(c)`, with SPICE's elementary
rotations equal to the frame rotations `rz`, `ry`, `rx` of `lunar_frame.rs`. The shipped code
built `Rx(c) Ry(b) Rz(a)`, read it as PA->ME and applied its transpose: both the direction and
the order were wrong. The fix is re-registered in `REREGISTRATION.md`.

## Run 2 (2026-10-13, under `REREGISTRATION.md`, be33382e): both bars hold

| Quantity | Result | Bar |
|---|---|---|
| PA<-ME factor vs SPICE at 2000-01-01 / 2022-01-01 / 2030-01-01 | 1.99e-16 / 1.98e-16 / 2.56e-16 rad | 1e-12 rad |
| `icrf_to_moon_pa` vs DE440 PA, 2014-12 / 2022-01 / 2025-12 / 2028-09 | 8.30" / 7.21" / 5.93" / 7.58" | 30" |

The change is committed with the strict test un-ignored.

## Outputs that moved (recorded, bars not moved)

`tests/agency_lro.rs` (GRGM660PRIM d/o 100, 241 epochs): raw overlap 53.8 -> 39.9 m, dynamic
12.6 -> 12.049 m (RTN 2.909, 10.107, 5.881 m), reduced-dynamic 6.65 -> 6.668 m (RTN 3.413,
4.577, 3.444 m). Both bars (25 m, 12 m) hold. The ANISE DE-grade cross-validation gave 12.0 and
6.67 m, so the analytic and DE-grade fits now agree on both tiers. Its earlier dynamic-tier
"improvement" (12.6 -> 12.0 m) was this error, not the DE-grade inputs. `tests/mars_lmo_od.rs`
and the lunar_frame, lunar and lunar_od unit tests pass unchanged. Updated:
`docs/AGENCY-ORBIT-VALIDATION.md`, `docs/VALIDATION.md`, the README LRO line (6.6 -> 6.67 m),
`CHANGELOG.md`. Not updated: `paper/` (a dated technical report of an earlier version).
