#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the measured-range reference for tests/lunar_llr_geometry_range_oracle.rs.

For every ILRS lunar normal point in two slices it writes one CSV row carrying what the Rust test
needs to predict that normal point's range with the `lunar_llr_geometry` substrate:

* the measurement, parsed here from the CRD files (Ricklefs and Moore, CRD v1.01 and v2.01):
  station, target, transmit epoch (UTC), two-way time of flight, wavelength, and the pass's
  meteorological record nearest in time (pressure hPa, temperature K, relative humidity %);
* UT1-UTC at the transmit epoch from IERS finals2000A.all (Bulletin A column, linear), an input to
  Kshana's Earth-rotation chain; and (round 2, the last two columns) the Bulletin A polar motion
  x_p, y_p (arcsec) at the same epoch, linear in time;
* DIAGNOSTIC ONLY (never the promotion basis): the MOON_PA_DE440 -> J2000 rotation at the bounce
  epoch evaluated directly from moon_pa_de440_200625.bpc with the NAIF frame kernel
  moon_de440_250416.tf (`pxform`), so the test can show how much of the residual the module's
  interpolated orientation series contributes;
* (third amendment, the last 24 columns) the BCRS inputs of the IERS Conventions 2010 Section 11.2
  light-time model from DE440 through SPICE, J2000, geometric, metres and metres per second:
  the measured TT round-trip interval converted to TDB (`unitim`), the barycentric Earth state at
  transmit t0 and at receive t2 = t0 + TOF(TDB), the barycentric Moon state and the Sun position
  at the bounce epoch, and U/c^2 at the geocentre (all DE440 bodies but the Earth) and at the
  selenocentre (all but the Moon), GM from gm_de440.tpc;
* the geocentric Moon centre at the bounce epoch t0 + TOF/2, J2000 (ICRF-aligned) metres, from JPL
  DE440 (de440s.bsp) through NAIF SPICE (spiceypy 8.2.0, MIT; CSPICE N0067), `spkpos('MOON', et,
  'J2000', 'NONE', 'EARTH')`, with the UTC-to-TDB conversion by `str2et` and naif0012.tls.

Slices:
  2024: normal_points_2024/*.np2 (CRD v2), 2024-04..06, five targets, fetched 2026-10-01 from
        https://edc.dgfi.tum.de/pub/slr/data/npt_crd_v2/<target>/2024/<target>_2024<mm>.np2
  2015: ../lunar_llr/normal_points/*.npt (CRD v1), the slice already committed (2015-04..06).

Every input file is hash-verified before anything is written. Run from this directory:

  source ~/Code/kshana-oracles/env.sh
  $ORACLE_PY generate_reference.py > reference.csv
"""

import hashlib
import os
import sys
from pathlib import Path

import spiceypy as spice

HERE = Path(__file__).resolve().parent
ORACLES = Path(os.environ.get("KSHANA_ORACLES", str(Path.home() / "Code/kshana-oracles")))
DE440S = ORACLES / "data/naif/de440s.bsp"
LSK = ORACLES / "data/naif/naif0012.tls"
MOON_PA_BPC = ORACLES / "data/naif/moon_pa_de440_200625.bpc"
MOON_FK = ORACLES / "data/naif/moon_de440_250416.tf"
GM_TPC = ORACLES / "data/naif/gm_de440.tpc"
C_M_S = 299792458.0
# Bodies whose potential enters U (IERS Conventions 2010 Eq. 11.19): the Sun, the planetary-system
# barycentres other than the Earth-Moon one, and the other member of the Earth-Moon pair.
U_BODIES = ["10", "1", "2", "4", "5", "6", "7", "8", "9"]
FINALS = ORACLES / "data/iers/finals2000A.all"

SLICES = [
    ("2024", HERE / "normal_points_2024", "*.np2"),
    ("2015", HERE.parent / "lunar_llr" / "normal_points", "*.npt"),
]


def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def verify_slice(directory):
    sums = (directory / "SHA256SUMS").read_text().splitlines()
    for line in sums:
        want, name = line.split("  ", 1)
        got = sha256(directory / name)
        if got != want:
            sys.exit(f"{directory / name}: SHA-256 {got} != recorded {want}")
    return len(sums)


def load_finals():
    rows = []
    for line in FINALS.read_text().splitlines():
        if len(line) < 68:
            continue
        try:
            mjd = float(line[7:15])
            dut1 = float(line[58:68])
            # Bulletin A polar motion (arcsec), columns 19-27 and 38-46 (round 2 addition).
            xp = float(line[18:27])
            yp = float(line[37:46])
        except ValueError:
            continue
        rows.append((mjd, dut1, xp, yp))
    return rows


def polar_motion_at(finals, mjd):
    """Bulletin A x_p, y_p (arcsec), linear in time, as for UT1-UTC."""
    for r0, r1 in zip(finals, finals[1:]):
        if r0[0] <= mjd <= r1[0]:
            f = (mjd - r0[0]) / (r1[0] - r0[0])
            return r0[2] + (r1[2] - r0[2]) * f, r0[3] + (r1[3] - r0[3]) * f
    sys.exit(f"MJD {mjd} not in finals2000A.all")


def dut1_at(finals, mjd):
    for (m0, d0, *_), (m1, d1, *_) in zip(finals, finals[1:]):
        if m0 <= mjd <= m1:
            if abs(d1 - d0) > 0.5:
                sys.exit(f"leap second inside the UT1 interpolation interval at MJD {mjd}")
            return d0 + (d1 - d0) * (mjd - m0) / (m1 - m0)
    sys.exit(f"MJD {mjd} not in finals2000A.all")


def mjd_of(y, mo, d):
    # Fliegel-Van Flandern civil date to MJD.
    a = (14 - mo) // 12
    yy = y + 4800 - a
    mm = mo + 12 * a - 3
    jdn = d + (153 * mm + 2) // 5 + 365 * yy + yy // 4 - yy // 100 + yy // 400 - 32045
    return jdn - 2400001


def parse_crd(path):
    """Yield one dict per normal point (record 11) with the pass's met record nearest in time."""
    station = code = target = None
    start = None
    wavelength = None
    nps, mets = [], []

    def flush():
        for n in nps:
            if not mets:
                n["met"] = None
            else:
                n["met"] = min(mets, key=lambda m: abs(m[0] - n["sod_raw"]))[1:]
            yield n

    for raw in Path(path).read_text().splitlines():
        f = raw.split()
        if not f:
            continue
        rec = f[0].lower()
        if rec == "h2":
            code, station = f[1], int(f[2])
        elif rec == "h3":
            target = f[1]
        elif rec == "h4":
            start = (int(f[2]), int(f[3]), int(f[4]), int(f[5]) * 3600 + int(f[6]) * 60 + int(f[7]))
            nps, mets = [], []
        elif rec == "c0":
            wavelength = float(f[2])
        elif rec == "20":
            mets.append((float(f[1]), float(f[2]), float(f[3]), float(f[4])))
        elif rec == "11":
            if int(f[4]) != 2:
                sys.exit(f"{path}: epoch event {f[4]} is not 2 (ground transmit time)")
            nps.append(
                {
                    "station": station,
                    "code": code,
                    "target": target,
                    "start": start,
                    "sod_raw": float(f[1]),
                    "tof_str": f[2],
                    "wavelength_nm": wavelength,
                }
            )
        elif rec == "h8":
            yield from flush()
            nps, mets = [], []
    yield from flush()


def main():
    for p in (DE440S, LSK, FINALS, MOON_PA_BPC, MOON_FK, GM_TPC):
        if not p.exists():
            sys.exit(f"missing {p}: run ~/Code/kshana-oracles/setup.sh")
    spice.furnsh(str(LSK))
    spice.furnsh(str(DE440S))
    spice.furnsh(str(MOON_FK))
    spice.furnsh(str(MOON_PA_BPC))
    spice.furnsh(str(GM_TPC))
    finals = load_finals()
    gm = {b: spice.bodvrd(b, "GM", 1)[1][0] * 1e9 for b in U_BODIES + ["301", "399"]}

    def ssb(body, et):
        st, _ = spice.spkezr(body, et, "J2000", "NONE", "SOLAR SYSTEM BARYCENTER")
        return [x * 1e3 for x in st]

    def u_over_c2(at, others, et):
        total = 0.0
        for b in others:
            p = ssb(b, et)[:3]
            total += gm[b] / sum((at[i] - p[i]) ** 2 for i in range(3)) ** 0.5
        return total / (C_M_S * C_M_S)

    print("# Measured-range reference for tests/lunar_llr_geometry_range_oracle.rs (generate_reference.py)")
    print(f"# de440s.bsp {sha256(DE440S)}")
    print(f"# naif0012.tls {sha256(LSK)}")
    print(f"# finals2000A.all {sha256(FINALS)}")
    print(f"# moon_pa_de440_200625.bpc {sha256(MOON_PA_BPC)} (diagnostic columns only)")
    print(f"# moon_de440_250416.tf {sha256(MOON_FK)} (diagnostic columns only)")
    print(f"# gm_de440.tpc {sha256(GM_TPC)} (third-amendment columns only)")
    print(f"# spiceypy {spice.__version__}, {spice.tkvrsn('TOOLKIT')}")
    print(
        "# slice,station,code,target,mjd_utc,sod_utc,tof_s,wavelength_nm,pressure_hpa,temperature_k,"
        "humidity_pct,dut1_s,moon_x_m,moon_y_m,moon_z_m,diag_pa_to_j2000_r11..r33 (row-major),"
        "xp_arcsec,yp_arcsec,tof_tdb_s,earth_t0_x,y,z,vx,vy,vz,earth_t2_x,y,z,vx,vy,vz,"
        "moon_b_x,y,z,vx,vy,vz,sun_b_x,y,z,u_earth_c2,u_moon_c2"
    )
    for name, directory, pattern in SLICES:
        n_files = verify_slice(directory)
        n = 0
        for path in sorted(directory.glob(pattern)):
            for np_ in parse_crd(path):
                y, mo, d, start_sod = np_["start"]
                mjd = mjd_of(y, mo, d)
                sod = np_["sod_raw"]
                # A pass that crosses midnight restarts seconds-of-day at zero.
                if sod < start_sod - 3600.0:
                    mjd += 1
                if np_["met"] is None:
                    sys.exit(f"{path}: normal point at {sod} has no meteorological record")
                p_hpa, t_k, rh = np_["met"]
                tof = float(np_["tof_str"])
                dut1 = dut1_at(finals, mjd + sod / 86400.0)
                xp, yp = polar_motion_at(finals, mjd + sod / 86400.0)
                # UTC calendar string for SPICE.
                yy, mm_, dd = y, mo, d
                if mjd != mjd_of(y, mo, d):
                    # Next civil day: let SPICE do the calendar arithmetic.
                    et0 = spice.str2et(f"{yy:04d}-{mm_:02d}-{dd:02d} 00:00:00 UTC")
                    yy, mm_, dd = (int(x) for x in spice.et2utc(et0 + 86400.0 + 1.0, "ISOC", 0)[:10].split("-"))
                hh = int(sod // 3600)
                mi = int((sod - hh * 3600) // 60)
                ss = sod - hh * 3600 - mi * 60
                et_t0 = spice.str2et(f"{yy:04d}-{mm_:02d}-{dd:02d} {hh:02d}:{mi:02d}:{ss:013.10f} UTC")
                et_b = et_t0 + 0.5 * tof
                moon_km, _ = spice.spkpos("MOON", et_b, "J2000", "NONE", "EARTH")
                rot = spice.pxform("MOON_PA_DE440", "J2000", et_b)
                rot_s = ",".join(f"{rot[i][j]:.15e}" for i in range(3) for j in range(3))
                # Third amendment: BCRS inputs.
                # TDB - TT varies by at most about 3e-10 s/s, so the interval scales by the local
                # rate, taken over one day so that the 1e-7 s resolution of a double-precision
                # epoch near 7.7e8 s does not enter (a direct difference of epochs would).
                def tdb_minus_tt(et):
                    return et - spice.unitim(et, "TDB", "TT")

                rate = (tdb_minus_tt(et_t0 + 43200.0) - tdb_minus_tt(et_t0 - 43200.0)) / 86400.0
                tof_tdb = tof * (1.0 + rate)
                et_t2 = et_t0 + tof_tdb
                e0 = ssb("EARTH", et_t0)
                e2 = ssb("EARTH", et_t2)
                mb = ssb("MOON", et_b)
                sb = ssb("SUN", et_b)[:3]
                eb = ssb("EARTH", et_b)[:3]
                u_e = u_over_c2(eb, U_BODIES + ["301"], et_b)
                u_m = u_over_c2(mb[:3], U_BODIES + ["399"], et_b)
                bcrs = ",".join(
                    [f"{tof_tdb:.13f}"]
                    + [f"{x:.4f}" if i % 6 < 3 else f"{x:.7f}" for i, x in enumerate(e0 + e2 + mb)]
                    + [f"{x:.4f}" for x in sb]
                    + [f"{u_e:.12e}", f"{u_m:.12e}"]
                )
                print(
                    f"{name},{np_['station']},{np_['code']},{np_['target']},{mjd},{sod:.7f},{np_['tof_str']},"
                    f"{np_['wavelength_nm']},{p_hpa},{t_k},{rh},{dut1:.7f},"
                    f"{moon_km[0] * 1e3:.4f},{moon_km[1] * 1e3:.4f},{moon_km[2] * 1e3:.4f},{rot_s},"
                    f"{xp:.7f},{yp:.7f},{bcrs}"
                )
                n += 1
        print(f"# slice {name}: {n_files} files, {n} normal points", file=sys.stderr)


if __name__ == "__main__":
    main()
