#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for kshana's EO payload coverage geometry.

Two INDEPENDENT external oracles, each fed inputs with NO kshana code involved:

  ORACLE A -- Equatorial ascending-node spacing.
    Skyfield 1.54 (B. Rhodes, MIT) driving sgp4 2.26 (B. Rhodes / the AIAA SGP4
    reference, MIT). A real near-circular LEO TLE is propagated with the full SGP4
    model (which INCLUDES the J2 nodal regression and the WGS-72 gravity field),
    the WGS-84 sub-satellite ground track is taken with skyfield.wgs84.subpoint,
    and the equatorial ascending-node crossings are found by zero-latitude
    interpolation. The mean great-circle longitude shift between >=5 consecutive
    ascending nodes, times the WGS-84 equatorial radius, is the SGP4 ground node
    spacing. We ALSO measure the SGP4 nodal period (mean time between ascending
    nodes) and pass THAT identical period to kshana, so the only thing the test
    isolates in kshana's `ground_track_spacing_equator(T) = R_e*omega*T` is its
    OMISSION of the J2 nodal-regression term -- not a period mismatch.

  ORACLE B -- Nadir-to-horizon limb angle / maximum ground range.
    A WGS-84 ray-to-ellipsoid tangent computed in closed form (numpy). The
    satellite sits at geodetic altitude h over an equatorial OR a polar
    sub-point; the ray from the satellite tangent to the WGS-84 ellipsoid
    (a=6378137 m, f=1/298.257223563) is solved exactly and the angle between the
    nadir direction and that tangent ray is the ellipsoid limb (horizon) angle.
    kshana's spherical `earth_angular_radius(h) = asin(R_e/(R_e+h))` is compared
    to it. The residual is precisely the physical sphere-vs-ellipsoid difference.

HONEST SCOPE
  - Oracle A is a GENUINE independent dynamical model (SGP4 != kshana's analytic
    nodal formula). For sun-synchronous EO orbits (the dominant EO regime) the
    J2 regression kshana omits is small and the agreement is well within 1%. For
    a mid-inclination orbit (the ISS, i=51.6 deg) the omitted regression grows to
    ~1.3%, which the reference EXPOSES rather than hides: the ISS row is tagged
    CHARACTERISATION and the test asserts it stays in a directional 0.8-2.0% band
    (kshana UNDER-estimates because prograde regression adds to the relative spin).
  - Oracle B is a closed-form ellipsoid geometry, not a numerical re-derivation of
    kshana's own formula: it solves the ellipse-tangent problem, which the sphere
    formula only approximates. The two agree to <0.1 deg across 400 km..GEO.
  - This validates the GEOMETRY (limb angle, max ground range, node spacing). It
    does NOT validate radiometry, MTF, atmospheric refraction, pointing jitter or
    sun-glint -- kshana models none of those and neither does the oracle.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/eovenv
    /tmp/eovenv/bin/pip install skyfield sgp4 numpy
    /tmp/eovenv/bin/python generate_eo_payload_coverage_reference.py > eo_payload_coverage_reference.txt

Generated with skyfield 1.54 + sgp4 2.26 + numpy. The committed .txt is the
pinned oracle output; tests/eo_payload_coverage_reference.rs reads it, so CI needs
no python.
"""

import numpy as np
from skyfield.api import load, EarthSatellite, wgs84

# WGS-84 ellipsoid, identical to kshana orbit::R_EARTH_EQUATORIAL_M for the
# equatorial radius. The full ellipsoid adds the flattening kshana omits.
A_WGS84 = 6378137.0  # m, semi-major (== kshana R_EARTH_EQUATORIAL_M)
F_WGS84 = 1.0 / 298.257223563
B_WGS84 = A_WGS84 * (1.0 - F_WGS84)  # m, semi-minor

# kshana forces::EARTH_ROTATION_RATE (sidereal), used to feed kshana the SAME
# nodal period the oracle measures so the test isolates the regression omission.
OMEGA_EARTH = 7.2921151467e-5  # rad/s

# --- Real near-circular LEO TLEs (archived; epoch 2021-275). SGP4 propagation is
# deterministic from the TLE, so the oracle is fully reproducible. The first three
# are sun-synchronous EO workhorses (the EO regime this capability targets); the
# ISS is included to EXPOSE the mid-inclination regression gap, not to pass <1%.
TLES = [
    # (name, line1, line2, role) role: "validate" (<1%) or "characterise" (gap)
    ("SENTINEL-2A",
     "1 40697U 15028A   21275.51782528  .00000037  00000-0  21934-4 0  9991",
     "2 40697  98.5683 350.4282 0001275  85.5687 274.5663 14.30824289328325",
     "validate"),
    ("LANDSAT-8",
     "1 39084U 13008A   21275.18789277  .00000074  00000-0  20566-4 0  9992",
     "2 39084  98.2213 343.6017 0001270  90.6320 269.5026 14.57117484460693",
     "validate"),
    ("SENTINEL-1A",
     "1 39634U 14016A   21275.49622685  .00000089  00000-0  25896-4 0  9990",
     "2 39634  98.1819 268.1452 0001345  86.4506 273.6855 14.59198940394987",
     "validate"),
    ("ISS-ZARYA",
     "1 25544U 98067A   21275.48773148  .00002182  00000-0  47591-4 0  9992",
     "2 25544  51.6442 251.2783 0002836 117.4583 242.6909 15.48975918305000",
     "characterise"),
]


def node_spacing_and_period(name, l1, l2):
    """Return (mean ground node spacing [km], mean nodal period [s], n_nodes)."""
    ts = load.timescale()
    es = EarthSatellite(l1, l2, name, ts)
    sat = es.model
    period_s = 2.0 * np.pi / sat.no_kozai * 60.0  # no_kozai is rad/min
    ep = es.epoch
    step = 1.0  # s, fine enough that linear lat interpolation is sub-metre
    n_samples = int(7.0 * period_s / step)
    times = ts.tt_jd(ep.tt + np.arange(n_samples) * step / 86400.0)
    geo = es.at(times)
    sp = wgs84.subpoint(geo)
    lats = sp.latitude.degrees
    lons = sp.longitude.degrees

    node_lons = []
    node_ts = []
    for i in range(1, len(lats)):
        if lats[i - 1] < 0.0 <= lats[i]:  # ascending equator crossing
            frac = (0.0 - lats[i - 1]) / (lats[i] - lats[i - 1])
            dlon = ((lons[i] - lons[i - 1] + 540.0) % 360.0) - 180.0
            lon0 = lons[i - 1] + frac * dlon
            t0 = (times[i - 1].tt + frac * step / 86400.0) * 86400.0
            node_lons.append(lon0)
            node_ts.append(t0)

    diffs_deg = [
        (((node_lons[i] - node_lons[i - 1] + 540.0) % 360.0) - 180.0)
        for i in range(1, len(node_lons))
    ]
    nodal_periods = [node_ts[i] - node_ts[i - 1] for i in range(1, len(node_ts))]
    spacing_km = float(np.mean([abs(d) * np.pi / 180.0 * (A_WGS84 / 1000.0)
                                for d in diffs_deg]))
    nodal_period_s = float(np.mean(nodal_periods))
    return spacing_km, nodal_period_s, len(node_lons)


def ellipsoid_limb_angle_deg(h_m, geometry):
    """Exact WGS-84 ray-to-ellipsoid tangent limb angle (deg) for a satellite at
    geodetic altitude h_m over an equatorial ('eq') or polar ('pole') sub-point.

    Ellipse in the meridian plane: x^2/a^2 + z^2/b^2 = 1.
    Tangent at parameter t is (a cos t, b sin t) with tangent line
        x cos t / a + z sin t / b = 1.
    For an equatorial sub-point P=(a+h, 0): cos t = a/(a+h).
    For a polar      sub-point P=(0, b+h): sin t = b/(b+h).
    The limb angle is the angle between the nadir direction and the tangent ray.
    """
    if geometry == "eq":
        ct = A_WGS84 / (A_WGS84 + h_m)
        st = np.sqrt(1.0 - ct * ct)
        tangent = np.array([A_WGS84 * ct, B_WGS84 * st])
        sat = np.array([A_WGS84 + h_m, 0.0])
        nadir = np.array([-1.0, 0.0])
    elif geometry == "pole":
        st = B_WGS84 / (B_WGS84 + h_m)
        ct = np.sqrt(1.0 - st * st)
        tangent = np.array([A_WGS84 * ct, B_WGS84 * st])
        sat = np.array([0.0, B_WGS84 + h_m])
        nadir = np.array([0.0, -1.0])
    else:
        raise ValueError(geometry)
    ray = tangent - sat
    cos_ang = np.dot(ray, nadir) / np.linalg.norm(ray)
    return float(np.degrees(np.arccos(cos_ang)))


def ellipsoid_max_ground_range_km(h_m, geometry):
    """Great-circle-style max ground arc from the sub-satellite point to the limb,
    measured along the WGS-84 ellipsoid meridian as the geocentric central angle
    between the sub-point and the tangent point, times the local radius. We report
    the geocentric arc using the tangent-point geocentric angle so it is directly
    comparable to kshana's R_e*lambda at the horizon (a spherical surface arc)."""
    if geometry == "eq":
        ct = A_WGS84 / (A_WGS84 + h_m)
        st = np.sqrt(1.0 - ct * ct)
        Tx, Tz = A_WGS84 * ct, B_WGS84 * st
        # geocentric angle of the tangent point from the +X (sub-point) axis
        central = np.arctan2(Tz, Tx)
    else:
        st = B_WGS84 / (B_WGS84 + h_m)
        ct = np.sqrt(1.0 - st * st)
        Tx, Tz = A_WGS84 * ct, B_WGS84 * st
        central = np.arctan2(Tx, Tz)  # from +Z (polar sub-point) axis
    # surface arc along a sphere of the WGS-84 equatorial radius, for comparison
    return float(A_WGS84 / 1000.0 * central)


print("# kshana EO payload coverage-geometry external reference.")
print("# Oracle A: skyfield 1.54 + sgp4 2.26 (B. Rhodes, MIT) WGS-84 ground-track"
      " ascending-node spacing.")
print("# Oracle B: closed-form WGS-84 ray-to-ellipsoid limb angle (numpy);"
      " a=6378137 m, f=1/298.257223563.")
print("# Consumed by tests/eo_payload_coverage_reference.rs."
      " See generate_eo_payload_coverage_reference.py.")
print("#")
print("# NODE name | nodal_period_s | sgp4_spacing_km | n_nodes | role")
for name, l1, l2, role in TLES:
    spacing_km, period_s, n_nodes = node_spacing_and_period(name, l1, l2)
    print(f"NODE {name} | {period_s!r} | {spacing_km!r} | {n_nodes} | {role}")

print("#")
print("# LIMB altitude_m | geometry | ellipsoid_limb_deg | ellipsoid_max_ground_range_km")
LIMB_ALTS = [400e3, 500e3, 600e3, 700e3, 786e3, 800e3, 1000e3, 1336e3, 35786e3]
for h in LIMB_ALTS:
    for geom in ("eq", "pole"):
        rho = ellipsoid_limb_angle_deg(h, geom)
        gr = ellipsoid_max_ground_range_km(h, geom)
        print(f"LIMB {h!r} | {geom} | {rho!r} | {gr!r}")
