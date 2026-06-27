#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the space_weather capability.

This fixture has TWO independent parts, with two DIFFERENT honesty levels:

PART (a) — TEMPERATURE PARITY (validatable to < 1 K)
----------------------------------------------------
Oracle: the PUBLISHED Jacchia-1971 closed form for the nighttime global-minimum
exospheric temperature and its geomagnetic increment.

  Jacchia, L. G. (1971), "Revised Static Models of the Thermosphere and
  Exosphere with Empirical Temperature Profiles", SAO Special Report 332,
  Smithsonian Astrophysical Observatory.
  As collated in Montenbruck & Gill, "Satellite Orbits: Models, Methods and
  Applications" (Springer, 2000, corr. 2nd printing), Section 3.5.2,
  Eqs. (3.42)-(3.45):

     T_c    = 379.0 + 3.24*Fbar + 1.3*(F - Fbar)        nighttime global minimum
     dT_inf = 28.0*Kp + 0.03*exp(Kp)                    geomagnetic increment (Kp form, h >= 200 km)
     T_inf  = T_c + dT_inf

  where F is the daily 10.7 cm solar flux (sfu), Fbar the 81-day average (sfu),
  and Kp the planetary geomagnetic index (0-9).

These published equations are recomputed here from first principles (the
coefficients are typed in literally from the citation above, NOT read from any
kshana code), evaluated on the requested
  F107 in {70,100,150,200,230}  x  Kp in {0,2,4,6,8}
grid with Fbar = F107 (the nighttime-minimum / steady-flux case the published
anchors are quoted for). kshana's space_weather::exospheric_temperature is then
required to reproduce each value to < 1 K (tests/space_weather_reference.rs).

  HONEST SCOPE OF PART (a): kshana implements exactly this published closed form,
  so this is a PARITY / transcription-fidelity check against the published
  Jacchia-1971 equations + their canonical published anchor magnitudes (606 /
  865 / 1124 K at the solar min/mean/max F10.7). It catches a transposed
  coefficient, a sign error, or a units slip, and it pins kshana to a named,
  citable authority -- the same class of check as klobuchar vs the IS-GPS-200
  worked example. It is NOT an independent re-derivation of the thermosphere
  physics. The cross-check against NRLMSISE-00's own exospheric temperature
  (printed as MSISCMP rows, FOR DOCUMENTATION ONLY, never gated) shows the two
  empirical models differ by tens to ~100+ K -- that divergence is exactly why
  only the published-J71 PARITY is gated to < 1 K, and the absolute thermosphere
  state stays a modelled quantity.

PART (b) — DENSITY CHARACTERISATION (proves density stays MODELLED)
------------------------------------------------------------------
Oracle: pymsis 0.12.0 (Greer et al.), the NRL NRLMSISE-00 empirical model
(MSIS version 0), Fortran wrapped in Python. License: pymsis is MIT; the
underlying NRL MSIS source is released by the U.S. Naval Research Laboratory.

  Emmert, J. T., et al. (2021/2022), "NRLMSIS 2.0..." and the classic
  Picone, J. M., et al. (2002), "NRLMSISE-00 empirical model of the
  atmosphere", J. Geophys. Res. 107(A12), 1468. (NRLMSISE-00 == MSIS v0.)

We sample NRLMSISE-00 total mass density at 300/400/500/800 km for
solar-min / mean / max x quiet / storm states (a fixed equatorial midnight epoch
and location, so only the activity drivers vary), and emit:
  * the raw NRLMSISE-00 mass densities, and
  * the NRLMSISE-00 solar-cycle and storm density RATIOS at each altitude.

kshana's space_weather::density_activity_factor is then checked only for
DIRECTION and ORDER OF MAGNITUDE against these (tests/space_weather_reference.rs):
sign (hotter thermosphere => denser), monotonicity in T_inf, and the 400 km
solar-cycle swing within 2x of the NRLMSISE-00 ratio. The 300/500/800 km
divergences are recorded, NOT gated.

  HONEST SCOPE OF PART (b): kshana's density correction is a single-coefficient
  calibrated scale-height coupling, NOT NRLMSISE-00 absolute density. This part
  is a CHARACTERISATION that documents how far the modelled factor sits from the
  Fortran reference; the density row stays MODELLED.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/kshana-oracles/.venv
    /tmp/kshana-oracles/.venv/bin/pip install pymsis numpy
    /tmp/kshana-oracles/.venv/bin/python generate_space_weather_reference.py \
        > space_weather_reference.txt

Generated with pymsis 0.12.0 (NRLMSISE-00 / MSIS v0) + numpy; published
Jacchia-1971 anchors recomputed from the citation above.
"""

import math

import numpy as np
import pymsis

# ---------------------------------------------------------------------------
# PART (a): published Jacchia-1971 closed form (coefficients typed from the
# citation, independent of any kshana code).
# ---------------------------------------------------------------------------

# Jacchia-1971 nighttime global-minimum exospheric temperature.
J71_T_OFFSET = 379.0  # K
J71_FBAR_COEFF = 3.24  # K / sfu
J71_DELTA_F_COEFF = 1.3  # K / sfu
# Jacchia-1971 geomagnetic increment (Kp form, h >= 200 km).
J71_GEO_LIN = 28.0  # K / Kp
J71_GEO_EXP = 0.03  # K


def j71_t_c(f107: float, f107a: float) -> float:
    """Published J71 nighttime global-minimum exospheric temperature T_c (K)."""
    return J71_T_OFFSET + J71_FBAR_COEFF * f107a + J71_DELTA_F_COEFF * (f107 - f107a)


def j71_dt_geo(kp: float) -> float:
    """Published J71 geomagnetic exospheric-temperature increment (K)."""
    return J71_GEO_LIN * kp + J71_GEO_EXP * math.exp(kp)


def j71_t_inf(f107: float, f107a: float, kp: float) -> float:
    return j71_t_c(f107, f107a) + j71_dt_geo(kp)


F107_GRID = [70.0, 100.0, 150.0, 200.0, 230.0]
KP_GRID = [0.0, 2.0, 4.0, 6.0, 8.0]

# ---------------------------------------------------------------------------
# PART (b): NRLMSISE-00 density via pymsis (MSIS version 0).
# ---------------------------------------------------------------------------

# A single fixed epoch + location so ONLY the activity drivers move between
# cases. Equatorial, midnight UT, near a solar-moderate day of year. The choice
# of epoch/location is immaterial to the RATIOS we characterise (it cancels in
# the solar-cycle / storm comparisons) but is pinned for reproducibility.
EPOCH = np.datetime64("2010-06-21T00:00")
LON_DEG = 0.0
LAT_DEG = 0.0
ALTS_KM = [300.0, 400.0, 500.0, 800.0]

# Solar / geomagnetic states. (label, F107, F107a, Kp). Quiet = Kp 0, storm = Kp 6.
SW_STATES = [
    ("solarmin_quiet", 70.0, 70.0, 0.0),
    ("solarmin_storm", 70.0, 70.0, 6.0),
    ("solarmean_quiet", 150.0, 150.0, 0.0),
    ("solarmean_storm", 150.0, 150.0, 6.0),
    ("solarmax_quiet", 230.0, 230.0, 0.0),
    ("solarmax_storm", 230.0, 230.0, 6.0),
]

# IAGA/GFZ Kp -> ap conversion (the 28-step quasi-log table, indexed by Kp*3).
# Used only to feed NRLMSISE-00 a consistent daily ap for each Kp; identical to
# kshana's definitional AP_TABLE, but transcribed here independently for the
# oracle generator.
AP_TABLE = [
    0.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 9.0, 12.0, 15.0, 18.0, 22.0, 27.0, 32.0,
    39.0, 48.0, 56.0, 67.0, 80.0, 94.0, 111.0, 132.0, 154.0, 179.0, 207.0, 236.0,
    300.0, 400.0,
]


def ap_from_kp(kp: float) -> float:
    idx = int(round(kp * 3.0))
    idx = max(0, min(idx, len(AP_TABLE) - 1))
    return AP_TABLE[idx]


def msis_mass_density(f107: float, f107a: float, kp: float, alt_km: float) -> float:
    """NRLMSISE-00 total mass density (kg/m^3) at the fixed epoch/location."""
    ap_daily = ap_from_kp(kp)
    # Fly-through mode wants a length-7 ap vector per point; use the daily Ap in
    # all slots (steady-state activity). geomagnetic_activity defaults to using
    # the daily Ap (slot 0); the 3-hourly slots only matter with the -1 option.
    aps = [[ap_daily] * 7]
    out = pymsis.calculate(
        EPOCH, LON_DEG, LAT_DEG, alt_km,
        f107s=f107, f107as=f107a, aps=aps, version=0,
    )
    return float(out[0, pymsis.Variable.MASS_DENSITY])


def msis_temperature(f107: float, f107a: float, kp: float, alt_km: float) -> float:
    ap_daily = ap_from_kp(kp)
    aps = [[ap_daily] * 7]
    out = pymsis.calculate(
        EPOCH, LON_DEG, LAT_DEG, alt_km,
        f107s=f107, f107as=f107a, aps=aps, version=0,
    )
    return float(out[0, pymsis.Variable.TEMPERATURE])


# ---------------------------------------------------------------------------
# Emit the committed reference.
# ---------------------------------------------------------------------------

print("# space_weather reference vectors. Consumed by tests/space_weather_reference.rs.")
print("# See generate_space_weather_reference.py for full provenance + honest scope.")
print("#")
print("# PART (a) — gated PARITY, published Jacchia-1971 (SAO SR-332; Montenbruck&Gill 3.42-3.45):")
print("#   J71TEMP f107 f107a kp t_c dt_geo t_inf      [K]")
print("# PART (b) — DOCUMENTATION ONLY, NRLMSISE-00 exospheric-T cross-check (NOT gated):")
print("#   MSISCMP label f107 f107a kp alt_km msis_temp_K j71_t_inf_K   [K]")
print("# PART (b) — CHARACTERISATION, NRLMSISE-00 mass density (pymsis 0.12.0, MSIS v0):")
print("#   MSISDEN label f107 f107a kp alt_km mass_density_kg_m3")
print("# PART (b) — NRLMSISE-00 RATIOS (directional/order-of-magnitude targets, NOT tight-gated):")
print("#   MSISRATIO solarcycle alt_km ratio_max_over_min   (solarmax_quiet / solarmin_quiet)")
print("#   MSISRATIO storm_<solar> alt_km ratio_storm_over_quiet")

# --- Part (a): published J71 temperature anchors on the grid ---
for f107 in F107_GRID:
    for kp in KP_GRID:
        f107a = f107  # nighttime-minimum / steady-flux anchor case
        tc = j71_t_c(f107, f107a)
        dt = j71_dt_geo(kp)
        ti = tc + dt
        print(f"J71TEMP {f107!r} {f107a!r} {kp!r} {tc!r} {dt!r} {ti!r}")

# --- Part (b): NRLMSISE-00 exospheric-temperature cross-check (documentation) ---
for label, f107, f107a, kp in SW_STATES:
    ti_j71 = j71_t_inf(f107, f107a, kp)
    for alt in ALTS_KM:
        tmsis = msis_temperature(f107, f107a, kp, alt)
        print(f"MSISCMP {label} {f107!r} {f107a!r} {kp!r} {alt!r} {tmsis!r} {ti_j71!r}")

# --- Part (b): NRLMSISE-00 mass density grid ---
den = {}
for label, f107, f107a, kp in SW_STATES:
    for alt in ALTS_KM:
        rho = msis_mass_density(f107, f107a, kp, alt)
        den[(label, alt)] = rho
        print(f"MSISDEN {label} {f107!r} {f107a!r} {kp!r} {alt!r} {rho!r}")

# --- Part (b): NRLMSISE-00 ratios ---
for alt in ALTS_KM:
    r_cycle = den[("solarmax_quiet", alt)] / den[("solarmin_quiet", alt)]
    print(f"MSISRATIO solarcycle {alt!r} {r_cycle!r}")
for solar in ("solarmin", "solarmean", "solarmax"):
    for alt in ALTS_KM:
        r_storm = den[(f"{solar}_storm", alt)] / den[(f"{solar}_quiet", alt)]
        print(f"MSISRATIO storm_{solar} {alt!r} {r_storm!r}")
