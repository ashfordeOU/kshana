#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent oracle for beacon-augmented lunar DOP (row "Lunar surface-beacon DOP
augmentation"). Pre-registered in ``tests/validate_lunar_beacon_anise_visibility_dop.rs``.

Nothing here calls Kshana. The shared inputs are only the stated scenario numbers: user
and beacon selenographic sites and heights, the illustrative constellation's Keplerian
elements and the Moon GM the engine states, and the 5 deg mask.

Oracle
------
* ANISE (Nyx Space, MPL-2.0), Python bindings, version printed into the output:
  - satellite Cartesian states from the stated elements with
    ``Orbit.from_keplerian_mean_anomaly`` (ANISE's own element conversion);
  - azimuth / elevation / range of every satellite and beacon from the user with
    ``Almanac.azimuth_elevation_range_sez`` (south-east-zenith frame of the user);
  - beacon line of sight with ``Almanac.line_of_sight_obstructed``, obstructing body the
    Moon, frame ``IAU_MOON`` whose shape (1737.4 km sphere) comes from NAIF
    ``pck00011.tpc`` converted by ``anise.utils.convert_tpc``.
* numpy (BSD-3-Clause): DOP = sqrt of the diagonal blocks of ``inv(G^T G)``, G rows
  ``[-e, 1]`` with ``e`` the unit line of sight rebuilt from ANISE's azimuth and
  elevation in the user's south-east-zenith frame.

Convention stated by the engine for the illustrative constellation: its Moon-fixed frame
equals its inertial frame at t = 0 (rotation angle 0), so the t = 0 inertial Cartesian
positions are used directly as Moon-fixed positions.

Reproduce (ANISE is not in the shared oracle venv)::

    uv venv /tmp/anvenv && uv pip install --python /tmp/anvenv/bin/python anise==0.10.6 numpy
    /tmp/anvenv/bin/python tests/fixtures/lunar_beacon_anise/gen_lunar_beacon_anise.py

Writes ``reference.txt`` next to this file.
"""

import hashlib
import math
import os
import tempfile

import anise
import numpy as np
from anise import Almanac
from anise.astro import Frame, Orbit
from anise.constants import Frames
from anise.time import Epoch
from anise.utils import convert_tpc

HERE = os.path.dirname(os.path.abspath(__file__))
NAIF = os.environ.get("KSHANA_NAIF_DIR",
                      os.path.join(os.path.expanduser("~"), "Code", "kshana-oracles", "data", "naif"))

R_MOON_KM = 1737.4                 # stated by the engine (R_MOON_M = 1 737 400 m)
GM_MOON_KM3_S2 = 4902.800118       # stated by the engine (MOON_GM_M3_S2 / 1e9)
MASK_DEG = 5.0
EPOCH = Epoch("2000-01-01T12:00:00 TDB")   # arbitrary: every state is evaluated at one instant


def sha256(path):
    with open(path, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()


def almanac():
    tmp = tempfile.mkdtemp()
    pca = os.path.join(tmp, "pck00011.pca")
    convert_tpc(os.path.join(NAIF, "pck00011.tpc"), os.path.join(NAIF, "gm_de440.tpc"), pca, True)
    alm = Almanac(pca)
    moon = alm.frame_info(Frames.IAU_MOON_FRAME)
    assert abs(moon.mean_equatorial_radius_km() - R_MOON_KM) < 1e-9, moon
    return alm, moon


def site_km(lat_deg, lon_deg, alt_m):
    # The stated site definition: a point at height alt above the 1737.4 km sphere.
    r = R_MOON_KM + alt_m / 1000.0
    la, lo = math.radians(lat_deg), math.radians(lon_deg)
    return np.array([r * math.cos(la) * math.cos(lo), r * math.cos(la) * math.sin(lo), r * math.sin(la)])


def orbit(moon, pos_km):
    return Orbit.from_cartesian(float(pos_km[0]), float(pos_km[1]), float(pos_km[2]),
                                0.0, 0.0, 0.0, EPOCH, moon)


def lcns_positions_km(n):
    """The illustrative constellation's stated elements, converted by ANISE."""
    inertial = Frame(301, 1, mu_km3_s2=GM_MOON_KM3_S2)   # Moon centre, J2000 axes, stated GM
    out = []
    for k in range(n):
        o = Orbit.from_keplerian_mean_anomaly(R_MOON_KM + 8000.0, 0.6, 57.7,
                                              360.0 * k / n, 90.0, 360.0 * k / n,
                                              EPOCH, inertial)
        out.append(np.array([o.x_km, o.y_km, o.z_km]))
    return out


def azel(alm, moon, user_km, target_km):
    aer = alm.azimuth_elevation_range_sez(orbit(moon, target_km), orbit(moon, user_km), None, None)
    return aer.azimuth_deg, aer.elevation_deg


def visible_sats(alm, moon, user_km, sats_km):
    return [i for i, s in enumerate(sats_km) if azel(alm, moon, user_km, s)[1] >= MASK_DEG]


def visible_beacons(alm, moon, user_km, beacons_km):
    return [i for i, b in enumerate(beacons_km)
            if not alm.line_of_sight_obstructed(orbit(moon, user_km), orbit(moon, b), moon, None)]


def dop(alm, moon, user_km, sources_km):
    rows = []
    for s in sources_km:
        az, el = (math.radians(x) for x in azel(alm, moon, user_km, s))
        e = np.array([-math.cos(el) * math.cos(az), math.cos(el) * math.sin(az), math.sin(el)])
        rows.append([-e[0], -e[1], -e[2], 1.0])
    g = np.array(rows)
    q = np.linalg.inv(g.T @ g)
    return {"gdop": math.sqrt(np.trace(q)), "pdop": math.sqrt(q[0, 0] + q[1, 1] + q[2, 2]),
            "hdop": math.sqrt(q[0, 0] + q[1, 1]), "vdop": math.sqrt(q[2, 2]),
            "tdop": math.sqrt(q[3, 3])}


def destination(lat_deg, lon_deg, az_deg, ang_rad):
    """Point at central angle ``ang`` from (lat, lon) along initial azimuth ``az`` (input
    construction only)."""
    la, lo, az = math.radians(lat_deg), math.radians(lon_deg), math.radians(az_deg)
    la2 = math.asin(math.sin(la) * math.cos(ang_rad) + math.cos(la) * math.sin(ang_rad) * math.cos(az))
    lo2 = lo + math.atan2(math.sin(az) * math.sin(ang_rad) * math.cos(la),
                          math.cos(ang_rad) - math.sin(la) * math.sin(la2))
    return math.degrees(la2), math.degrees(lo2)


def fmt(x):
    return "%.17e" % x


def main():
    alm, moon = almanac()
    lines = ["# Independent oracle for tests/validate_lunar_beacon_anise_visibility_dop.rs",
             "# generator: gen_lunar_beacon_anise.py",
             "# anise %s, numpy %s" % (anise.__version__, np.__version__),
             "# kernel pck00011.tpc sha256 %s" % sha256(os.path.join(NAIF, "pck00011.tpc")),
             "# kernel gm_de440.tpc sha256 %s" % sha256(os.path.join(NAIF, "gm_de440.tpc")),
             "# lines: GOLDEN <n_sats> <vis sat idx|-> <vis beacon idx|-> <dop sats only x5> <dop sats+beacons x5|none>",
             "#        HORIZON <user lat lon alt_m> <beacon lat lon alt_m> <delta_m> <visible 0|1>",
             "#        MASK <user lat lon alt_m> <sat x y z m> <elevation_deg> <visible 0|1>",
             "#        THREE <n_sats> <beacon lat lon alt_m;...> <vis beacon idx> <dop sats+beacons x5>",
             "# DOP order: gdop pdop hdop vdop tdop"]
    order = ["gdop", "pdop", "hdop", "vdop", "tdop"]

    # ---- Golden geometry. ----
    user = (-80.0, 0.0, 2.0)
    beacons = [(-80.0, 0.0, 2000.0), (-79.0, 60.0, 2000.0), (-79.0, -60.0, 2000.0)]
    u_km = site_km(*user)
    b_km = [site_km(*b) for b in beacons]
    for n in (6, 24):
        sats = lcns_positions_km(n)
        vs = visible_sats(alm, moon, u_km, sats)
        vb = visible_beacons(alm, moon, u_km, b_km) if n == 6 else []
        d0 = dop(alm, moon, u_km, [sats[i] for i in vs])
        d1 = dop(alm, moon, u_km, [sats[i] for i in vs] + [b_km[i] for i in vb]) if n == 6 else None
        lines.append("GOLDEN %d %s %s %s %s" % (
            n, "|".join(map(str, vs)) or "-", "|".join(map(str, vb)) or "-",
            " ".join(fmt(d0[k]) for k in order),
            " ".join(fmt(d1[k]) for k in order) if d1 else "none"))

    # ---- Near-horizon beacons. ----
    for ua in (2.0, 50.0):
        for ba in (10.0, 2000.0):
            ru, rb = R_MOON_KM * 1000.0 + ua, R_MOON_KM * 1000.0 + ba
            horizon = (math.sqrt(2 * R_MOON_KM * 1000.0 * ua + ua * ua)
                       + math.sqrt(2 * R_MOON_KM * 1000.0 * ba + ba * ba))
            for az in (0.0, 90.0, 200.0):
                for delta in (-1000.0, -100.0, -10.0, 10.0, 100.0, 1000.0):
                    d = horizon + delta
                    ang = math.acos((ru * ru + rb * rb - d * d) / (2 * ru * rb))
                    lat, lon = destination(-80.0, 0.0, az, ang)
                    vis = visible_beacons(alm, moon, site_km(-80.0, 0.0, ua),
                                          [site_km(lat, lon, ba)])
                    lines.append("HORIZON -80 0 %r %s %s %r %r %d" % (
                        ua, fmt(lat), fmt(lon), ba, delta, 1 if vis else 0))

    # ---- Near-mask satellites. ----
    for (la, lo, al) in ((-80.0, 0.0, 2.0), (-45.0, 30.0, 2.0)):
        up_km = site_km(la, lo, al)
        phi, lam = math.radians(la), math.radians(lo)
        east = np.array([-math.sin(lam), math.cos(lam), 0.0])
        north = np.array([-math.sin(phi) * math.cos(lam), -math.sin(phi) * math.sin(lam), math.cos(phi)])
        upv = np.array([math.cos(phi) * math.cos(lam), math.cos(phi) * math.sin(lam), math.sin(phi)])
        for az in (10.0, 130.0, 250.0):
            for el in (4.0, 4.9, 4.99, 4.999, 5.001, 5.01, 5.1, 6.0):
                a, e = math.radians(az), math.radians(el)
                los = math.cos(e) * math.sin(a) * east + math.cos(e) * math.cos(a) * north + math.sin(e) * upv
                s_km = up_km + 5000.0 * los
                _, el_anise = azel(alm, moon, up_km, s_km)
                lines.append("MASK %r %r %r %s %s %s %s %d" % (
                    la, lo, al, fmt(s_km[0] * 1000.0), fmt(s_km[1] * 1000.0), fmt(s_km[2] * 1000.0),
                    fmt(el_anise), 1 if el_anise >= MASK_DEG else 0))

    # ---- Three low-elevation beacons that add horizontal geometry. ----
    sats = lcns_positions_km(6)
    vs = visible_sats(alm, moon, u_km, sats)
    ru, rb = R_MOON_KM * 1000.0 + 2.0, R_MOON_KM * 1000.0 + 2000.0
    three = []
    for az in (0.0, 120.0, 240.0):
        ang = math.acos((ru * ru + rb * rb - 60000.0 ** 2) / (2 * ru * rb))
        lat, lon = destination(-80.0, 0.0, az, ang)
        three.append((lat, lon, 2000.0))
    t_km = [site_km(*b) for b in three]
    vb = visible_beacons(alm, moon, u_km, t_km)
    d3 = dop(alm, moon, u_km, [sats[i] for i in vs] + [t_km[i] for i in vb])
    lines.append("THREE 6 %s %s %s" % (
        ";".join("%s:%s:%r" % (fmt(a), fmt(b), c) for a, b, c in three),
        "|".join(map(str, vb)) or "-", " ".join(fmt(d3[k]) for k in order)))

    with open(os.path.join(HERE, "reference.txt"), "w") as f:
        f.write("\n".join(lines) + "\n")
    print("\n".join(l for l in lines if l.startswith(("GOLDEN", "THREE"))))


if __name__ == "__main__":
    main()
