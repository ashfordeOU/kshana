<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# R1.4: ocean tide loading and the solid Earth tide: results

**No scored comparison has been run.** The pre-registration (`PREREGISTRATION.md`) is proposed and
waits for the owner's sign-off; bars B1 to B3 are not evaluated here.

## Implementation record (before the scored run)

- **Solid Earth tide:** `src/solid_tide.rs`, written from the text of the IERS Conventions (2010),
  chapter 7, section 7.1.1 (the 2015-06-19 version of the chapter): Step 1 eqs (5), (6), (8) to (11)
  and Step 2 eqs (12) and (13) with Tables 7.3a and 7.3b. The IERS reference routine was not read or
  ported.
- **Disclosure:** the expected output of the DEHANTTIDEINEL test case (bar B1) was seen while its
  licence was being checked, before this code was written. It was not used to write or tune the code,
  and no test in the repository uses it before the sign-off.
- **Choices the text leaves open, fixed in the code before any comparison:**
  - eq. (6) is summed over the Moon and the Sun, as written (the text notes the Sun's term is
    negligible);
  - `θ_g` is Greenwich mean sidereal time, IAU 1982, from UT1; the Delaunay arguments are the linear
    IAU 2000B expressions at TT;
  - `GM_⊕ = 3.986004418e14 m³/s²`, Moon/Earth mass ratio `0.0123000371`,
    `GM_⊙ = 1.32712442099e20 m³/s²`, `R_e = 6378136.6 m` (Conventions Table 1.1);
  - the station latitude is geocentric, as the text defines `φ`.
- **Internal checks (MODELLED):** the degree 2 part equals the existing PPP path
  (`ppp_real::solid_tide_ecef`) to the relative difference of its constants; every tidal argument's
  Delaunay form equals its Doodson form (a check of the table transcription); every term stays within
  the magnitudes the text states. The text's degree 3 figures (1.7 mm radial, 0.2 mm transverse) hold at
  the Moon's mean distance; at perigee eq. (6) gives about 2.4 mm and 0.27 mm, which the run reaches.
- **Not yet in the PPP path:** `ppp_real` still applies its degree 2 displacement; switching it waits
  for the scored comparison.
- **Ocean tide loading:** not implemented yet.
