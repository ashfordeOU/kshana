"""Generate the pymsis (NRLMSISE-00, version=0) reference densities on the committed grid.

Run with the oracle venv (pymsis 0.13.0 pinned), from the repository root:
    /root/kshana-oracles/.venv/bin/python -I xval/nrlmsise00-pymsis/gen_pymsis.py \
        > tests/fixtures/nrlmsise00/pymsis_grid.txt

pymsis 0.13.0 (MIT) wraps the NRL Fortran NRLMSISE-00.FOR; for version=0 it calls GTD7D (the
effective total mass density including anomalous oxygen) in METERS(.TRUE.) units (kg/m^3), with
the switches all on and, for the default geomagnetic_activity=1, the daily-Ap mode. The local
solar time it passes is utsec/3600 + lon/15.
"""

import sys
from pathlib import Path

import numpy as np
import pymsis

sys.path.insert(0, str(Path(__file__).resolve().parent))
from grid import points  # noqa: E402


def main():
    print(f"# pymsis {pymsis.__version__} version=0 (NRLMSISE-00 GTD7D, daily Ap, all switches 1)")
    print("# doy ut_s alt_km lat_deg lon_deg f107a f107 ap rho_kg_m3 t_k")
    for doy, ut, alt, lat, lon, f107a, f107, ap, _ in points():
        date = (
            np.datetime64("2001-01-01T00:00:00")
            + np.timedelta64(doy - 1, "D")
            + np.timedelta64(ut, "s")
        )
        out = pymsis.calculate(
            date, lon, lat, alt, f107s=[f107], f107as=[f107a], aps=[[ap] * 7], version=0
        ).reshape(-1)
        rho, t = float(out[0]), float(out[10])
        print(f"{doy} {ut} {alt} {lat} {lon} {f107a} {f107} {ap} {rho:.9e} {t:.7e}")


if __name__ == "__main__":
    main()
