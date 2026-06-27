#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for kshana's launch-window / ascent geometry.

ORACLE (published-vectors, no runtime library):
    Vallado, David A. *Fundamentals of Astrodynamics and Applications*, 4th ed.,
    Microcosm Press / Springer, 2013. ISBN 978-1881883180. (Book, not software —
    transcribed published numbers + the published closed-form relations.)

    - Launch azimuth: §6.4 "Launch-Window Determination", Algorithm 37, the
      *auxiliary* (inertial / geometric) launch azimuth before the rotating-Earth
      velocity-triangle correction:
            sin(beta_inertial) = cos(i) / cos(phi_gc)
      Worked anchors reproduced from the text and the classic shuttle/ISS
      mission-analysis literature: KSC (28.5 deg N) -> ISS (51.6 deg) gives the
      textbook ~45 deg inertial azimuth; a due-east launch (i = lat) gives exactly
      90 deg; a polar target (i = 90 deg) gives exactly 0 deg (due north).

    - Plane-change Delta-v: §6.3 "Inclination-Only Change" / Example 6-2. A
      circular orbit at v = 5.892311 km/s undergoing a 15 deg inclination change
      needs Delta-v = 2 v sin(Di/2) = 1.5382 km/s (Vallado's published answer).

    - Circular velocity: v_circ = sqrt(mu / r). Pinned at the geostationary radius
      r_GEO = 42164.1696 km, where Vallado (Table inside the back cover / the GEO
      worked values) and essentially every astrodynamics reference publish
      v_GEO = 3.074660 km/s, using the standard GGM/EGM constant
      mu = 398600.4418 km^3/s^2. (HONEST: this is the same closed form and the same
      standard constant kshana uses; it confirms kshana reproduces the published
      worked number, but it is a closed-form-vs-same-closed-form check, NOT an
      algorithm-independent one. See the HONEST SCOPE below.)

VALIDATES (kshana::launch):
    launch_azimuth(lat, i)   -> the geometric/inertial azimuth (deg).
    plane_change_dv(v, Di)   -> inclination-change Delta-v (m/s).
    circular_velocity(alt)   -> LEO/GEO circular speed (m/s).

HONEST SCOPE:
    Only the INERTIAL / geometric launch azimuth is pinned to Vallado. kshana's
    launch_azimuth deliberately returns this geometric relation and does NOT apply
    the rotating-Earth velocity-triangle correction that turns the inertial azimuth
    into the operational ground-track azimuth (that correction is reported
    separately as site_rotation_speed and stays MODELLED). The plane-change Delta-v
    and circular velocity are exact closed forms (2 v sin(Di/2), sqrt(mu/r))
    evaluated with the standard constants; matching Vallado's worked numbers
    confirms the formulae + constants, not an independent integration.

REPRODUCE (offline, no kshana code involved):

    /tmp/kshana-oracles/.venv/bin/python \
        generate_launch_window_ascent_geometry_reference.py \
        > launch_window_ascent_geometry_reference.txt

    (Only the Python standard library `math` is used — the numbers are the
    published Vallado values and the published spherical-trig / vis-viva closed
    forms, so any Python reproduces them bit-for-bit.)
"""

import math

# Standard astrodynamics constants Vallado uses (EGM / GGM; also kshana's literals).
MU_EARTH = 3.986004418e14  # m^3/s^2  (= 398600.4418 km^3/s^2)
R_EARTH_EQ = 6378137.0  # m          (= 6378.137 km, WGS-84 equatorial radius)


def inertial_launch_azimuth_deg(lat_deg, i_deg):
    """Vallado Alg. 37 auxiliary (inertial/geometric) azimuth, in kshana's
    convention: degrees clockwise from north in [0, 360). For a retrograde target
    (i > 90 deg) cos(i) < 0 so the raw asin is negative and wraps to the NW
    quadrant (~350 deg), exactly as kshana's rem_euclid(2*pi) does."""
    s = math.cos(math.radians(i_deg)) / math.cos(math.radians(lat_deg))
    beta = math.degrees(math.asin(s))  # in [-90, 90]
    return beta % 360.0


def emit_azimuth():
    # name | lat_deg | i_deg | inertial_azimuth_deg
    # >=3 (lat, i) cases as planned: KSC->ISS, due-east (i=lat), near-polar, plus
    # a retrograde SSO and a high-latitude case to exercise the wrap + cos(lat).
    cases = [
        ("ksc_to_iss", 28.5, 51.6),  # textbook ~45 deg inertial azimuth
        ("due_east_i_eq_lat", 28.5, 28.5),  # exactly 90 deg (due east)
        ("polar_from_ksc", 28.5, 90.0),  # exactly 0 deg (due north)
        ("vandenberg_sso", 34.7, 98.2),  # retrograde -> wraps to ~350 deg
        ("baikonur_to_iss", 45.6, 51.6),  # high-latitude site
    ]
    for name, lat, i in cases:
        az = inertial_launch_azimuth_deg(lat, i)
        print(f"AZIMUTH {name} | {lat:.6f} | {i:.6f} | {az:.10f}")


def emit_plane_change():
    # name | v_orbit_m_s | delta_i_deg | dv_m_s
    # Vallado Example 6-2: v = 5.892311 km/s, Di = 15 deg -> Dv = 1.5382 km/s.
    v = 5892.311  # m/s, Vallado Ex 6-2 circular speed (published)
    cases = [
        ("vallado_ex6_2", v, 15.0),  # published 1.5382 km/s
        ("plane_change_10deg_leo", 7700.0, 10.0),  # standard ~1.342 km/s anchor
        ("full_reversal_180", v, 180.0),  # exactly 2 v
        ("zero_change", v, 0.0),  # exactly 0
    ]
    for name, vv, di in cases:
        dv = 2.0 * vv * math.sin(math.radians(di) / 2.0)
        print(f"PLANECHANGE {name} | {vv:.6f} | {di:.6f} | {dv:.10f}")


def emit_circular_velocity():
    # name | altitude_m | v_circ_m_s
    # GEO: r = 42164.1696 km -> alt = r - R_eq. Published v_GEO ~ 3.074660 km/s.
    r_geo = 42164169.6  # m  (Vallado geostationary radius)
    alt_geo = r_geo - R_EARTH_EQ
    cases = [
        ("geo", alt_geo),
    ]
    for name, alt in cases:
        v = math.sqrt(MU_EARTH / (R_EARTH_EQ + alt))
        print(f"CIRCVEL {name} | {alt:.6f} | {v:.10f}")
    # Independent published GEO anchor (book value, not derived from mu here):
    # printed as a comment so the test can also assert against the literal 3074.66.
    print("# PUBLISHED v_GEO (Vallado / standard tables) = 3074.660 m/s at r_GEO=42164.1696 km")


def main():
    print("# Launch-window / ascent-geometry reference for kshana::launch.")
    print("# Oracle: Vallado, Fundamentals of Astrodynamics & Applications, 4th ed.")
    print("#   (Alg. 37 inertial launch azimuth; Ex 6-2 plane-change Dv; vis-viva v_circ).")
    print("# Consumed by tests/launch_window_ascent_geometry_reference.rs.")
    print("# See generate_launch_window_ascent_geometry_reference.py for full provenance/scope.")
    print("# Units: deg, m, m/s. HONEST: only the geometric/inertial azimuth is an")
    print("#   external pin; plane-change Dv and v_circ are closed-form-vs-published-number.")
    emit_azimuth()
    emit_plane_change()
    emit_circular_velocity()


if __name__ == "__main__":
    main()
