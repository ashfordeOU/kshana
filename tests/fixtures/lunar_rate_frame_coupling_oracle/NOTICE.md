# Provenance: lunar clock-rate to frame coupling oracle

`reference.txt` holds seven numbers printed in one publication. Nothing is computed here.

- **Publication:** N. Ashby and B. R. Patla, "A relativistic framework to establish coordinate
  time on the Moon and beyond", *The Astronomical Journal* 167:149 (2024),
  doi:10.3847/1538-3881/ad643a. National Institute of Standards and Technology work.
- **Copy read:** the arXiv preprint, `https://arxiv.org/pdf/2402.11150`, retrieved 2026-10-01,
  SHA-256 `4a0bc4dec56d185add3ba112c1b2dc8e1cd87f18e1ab43e745595804cd47984b`, 11 pages, dated
  20 February 2024. The PDF is not redistributed here.
- **Values:** Eq. (10) and Table I give L_m = -Phi0m/c^2 = 3.13881(15) x 10^-11 and
  GM_moon = 4.90280031(44) x 10^12 m^3 s^-2. Section 2.2 gives the degree-350 lunar potential on
  the equator, Phi_m = -2.82101(7) x 10^6 m^2/s^2, and the equatorial radius a_m = 1738140(123) m,
  from which Eq. (10) forms L_m (with the rotation term omega_m^2 a_m^2 / 2 = 10.70118(14) m^2/s^2,
  omega_m = 2.661621 x 10^-6 /s; these two were added in round 2, 2026-10-01, from the same copy).
- **Licence:** the numbers are facts quoted with citation; no text or figure is reproduced.
- **Consumed by:** `tests/lunar_rate_frame_coupling_oracle.rs`.
