# Kernel-backed solar-system kind: results

Pre-registration: `PREREGISTRATION.md` (f8e946ea). Run 2026-10-13,
`cargo test --release --test solar_system_kernel_oracle -- --nocapture`.

| Bar | Result |
|---|---|
| position within 1 mm (Mercury, Venus, Earth, Moon at 3 epochs; 12 states) | **holds**: worst 3.3e-5 m |
| velocity within 1e-6 m/s | **holds**: worst 1.0e-11 m/s |
| kernel block lists exactly those four; other labels analytic | **holds** |

Outcome: the new row "Solar-system kind on a JPL kernel (planetary_kernel_path)" is VALIDATED as
a Library check of the wiring. Without the option the report has no kernel block, so the
default output is unchanged.
