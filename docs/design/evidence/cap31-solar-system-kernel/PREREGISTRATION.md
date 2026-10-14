# Pre-registration: the kernel-backed `solar-system` kind against SPICE (CAP-31)

Written 2026-10-13 and committed alone, before the code exists and before the comparison runs.

## What is built (opt-in; the default report is unchanged)

`solar-system` gains `planetary_kernel_path`. When it is set, each reported body whose own
NAIF code the SPK holds (with `de440s.bsp`: the Sun, Mercury 199, Venus 299, the Earth 399 and
the Moon 301; the other planets only as barycentres, which are not substituted) takes its
heliocentric J2000 position and velocity from the kernel through `KernelEphemeris`. A link
whose two ends are both in the kernel is computed on the kernel (`link_on`). Everything else
stays analytic with its label. The report gains a `kernel` block (path, SHA-256, the bodies and
links taken from it) only when the option is set, and those bodies' `label` reads `KERNEL`.

## Comparison (fixed now)

Epochs `epoch_jd_tdb` = 2461041.5, 2462668.0 and 2466519.5 (2026-01-01, 2030-06-15 12:00 and
2040-12-31). Kernel `de440s.bsp` (SHA-256 `c1c7feea...`); the engine reads a bit-for-bit cut
of segments 10, 1, 199, 2, 299, 3, 399 and 301 at those dates, made with the existing cutting
script. Oracle: SPICE `spkezr(body, et, 'J2000', 'NONE', 'SUN')` (CSPICE N0067 through spiceypy
8.3.0) on the full `de440s.bsp`, in a separate program.

Bars, for Mercury, Venus, the Earth and the Moon at each epoch:

1. position within **1 mm**;
2. velocity within **1e-6 m/s**;
3. the `kernel` block lists exactly these four bodies (and the Sun as the origin), and every
   other body keeps its analytic label.

## Outcome rule

All hold: the `solar-system` row records the kernel option as VALIDATED in a new row "Solar-system
kind on a JPL kernel (planetary_kernel_path)", a Library check of the wiring against SPICE.
DE440 itself is not validated, nor are the analytic bodies. Any fails: a finding, and no row.
No bar is moved.
