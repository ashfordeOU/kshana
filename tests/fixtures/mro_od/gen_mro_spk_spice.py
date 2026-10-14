# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle for the SPK type-1 reader: MRO (-74) relative to the Mars barycentre (4), J2000,
from CSPICE (via SpiceyPy 6.0.0, CSPICE N0067) on mro_psp5.bsp.

Run: python gen_mro_spk_spice.py <dir holding mro_psp5.bsp> > mro_psp5_spice_states.txt
SpiceyPy is oracle-only; it is not a dependency of the crate.
"""
import sys

import spiceypy as sp

sp.furnsh(sys.argv[1] + "/mro_psp5.bsp")
# 100 epochs every 15 min across the ODF span (2007-10-31T14:24 to 2007-11-01T14:45 UTC),
# shifted by fractions of a minute so they fall between record boundaries.
print("# et_tdb_s x_km y_km z_km vx_km_s vy_km_s vz_km_s  (MRO wrt Mars barycentre, J2000)")
print("# CSPICE", sp.tkvrsn("TOOLKIT"))
for k in range(100):
    et = 247_110_000.0 + 900.0 * k + 37.123 * (k % 7)
    st, _ = sp.spkgeo(-74, et, "J2000", 4)
    print(f"{et:.6f} " + " ".join(f"{v:.12e}" for v in st))
