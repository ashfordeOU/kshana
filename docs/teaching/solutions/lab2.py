# SPDX-License-Identifier: AGPL-3.0-only
"""Lab 2 solution (Python track): a link-budget sweep. python3 -I lab2.py <libkshana_capi>"""
import math

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # -I leaves the script's folder off the path
import kit  # noqa: E402

k = kit.engine()
sheet = kit.Sheet("docs/teaching/lab-2-link-budget-sweep.md")
base = kit.text("scenarios/link-budget.toml")


def margin(**changes):
    toml = base
    for key, value in changes.items():
        toml = kit.set_value(toml, key, value)
    return kit.run(k, toml)


# 1. Range: ten times farther costs 20 dB.
m2k = margin(range_km="2000.0")["margin_db"]
m20k = margin(range_km="20000.0")["margin_db"]
sheet.answer("1a margin at 2,000 km", f"{m2k:.2f} dB", True)
sheet.answer("1b margin at 20,000 km", f"{m20k:.2f} dB", True)
sheet.answer("1c the difference", f"{m2k - m20k:.2f} dB", abs(m2k - m20k - 20.0) < 1e-9)

# 2. The longest range at which the link still closes: margin falls 20 log10(d / 2000 km).
d_max = 2000.0 * 10 ** (m2k / 20)
sheet.answer("2a the longest range", f"{d_max:,.0f} km", True)
at = margin(range_km=f"{d_max:.1f}")["margin_db"]
sheet.answer("2b margin there", f"{abs(at):.3f} dB", abs(at) < 1e-3)

# 3. One astronomical unit (1.496e8 km) at 1 Mbit/s, then the highest rate that closes.
au = margin(range_km="1.496e8")
sheet.answer("3a margin at 1 AU", f"{au['margin_db']:.2f} dB", au["closes"] is False)
r_max = 1e6 * 10 ** (au["margin_db"] / 10)
sheet.answer("3b the highest rate", f"{r_max / 1e3:.1f} kbit/s", True)
at = margin(range_km="1.496e8", data_rate_bps="2.9e5")
sheet.answer("3c 290 kbit/s closes", f"{at['margin_db']:+.2f} dB", at["closes"] is True)

# 4. The band sets the carrier frequency, and the loss grows 20 log10 of it.
by_band = {b: margin(band=f'"{b}"') for b in ("s", "x", "ka")}
for b in ("s", "x", "ka"):
    sheet.answer(f"4a margin in band {b}", f"{by_band[b]['margin_db']:.2f} dB", True)
fx = by_band["x"]["link_constants"]["carrier_frequency_hz"]
fka = by_band["ka"]["link_constants"]["carrier_frequency_hz"]
step = by_band["ka"]["free_space_loss_db"] - by_band["x"]["free_space_loss_db"]
sheet.answer("4b Ka minus X loss", f"{step:.2f} dB", abs(step - 20 * math.log10(fka / fx)) < 1e-9)
sheet.done()
