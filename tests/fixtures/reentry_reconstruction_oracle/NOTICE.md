# reentry_reconstruction_oracle fixture

Used only by `tests/reentry_reconstruction_oracle.rs`; not shipped in any published package.

## What is here

- `reconstructed_entries.txt`: four numbers printed in the text of one public NASA paper (the
  Stardust entry-interface speed and flight-path angle, and the best-estimated-trajectory maximum
  deceleration). SHA-256 c0dc1ce5b9f755efd089a42279742790b0d63032b504a813284a3599e79e6ffe.

## Source

P. N. Desai and G. D. Qualls, "Stardust Entry Reconstruction", AIAA 2008-1198, 46th AIAA
Aerospace Sciences Meeting, 2008. Public copy: NASA Technical Reports Server 20080008567
(distribution: public), https://ntrs.nasa.gov/api/citations/20080008567/downloads/20080008567.pdf,
retrieved 2026-10-01, PDF SHA-256 f4e0741ec7b44ee84a34c8fb82f4de6ffe6b589a7d97e51f81464de2dd8e6c3e.
Section II: entry interface at radius 6503.14 km, inertial entry velocity 12.9 km/s, inertial
flight-path angle -8.2 deg. Section V: maximum deceleration of the best estimated trajectory
32.89 Earth g. Facts cited with attribution; the paper is not copied.

Caveat recorded with the result: Stardust carried no accelerometer. The best estimated trajectory
is the project's entry simulation with a 0.83 % drag multiplier fitted to the navigation state at
entry and to radar tracking at drogue deployment.

## Tolerance, fixed before any value was read, and the result

Peak deceleration within 15 % relative. First run (2026-10-01): DISAGREES, 61.8 g against
32.89 g (+88 %).
