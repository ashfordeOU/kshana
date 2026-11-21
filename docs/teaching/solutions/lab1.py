# SPDX-License-Identifier: AGPL-3.0-only
"""Lab 1 solution (Python track): first calls. python3 -I lab1.py <libkshana_capi>"""
import json
import math

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # -I leaves the script's folder off the path
import kit  # noqa: E402

k = kit.engine()
sheet = kit.Sheet("docs/teaching/lab-1-first-calls.md")
toml = kit.text("scenarios/link-budget.toml")

# 1. Validate the shipped scenario, then a copy with the kind misspelt.
problems = json.loads(k.validate(toml.encode()))
sheet.answer("1a problems in the shipped scenario", "0 problems", problems == [])
typo = json.loads(k.validate(toml.replace('kind = "link-budget"', 'kind = "link-budgt"').encode()))
sheet.answer("1b the misspelt kind", 'did you mean "link-budget"?', len(typo) == 1 and 'did you mean "link-budget"?' in typo[0])

# 2. Run it and read four figures.
r = kit.run(k, toml)
sheet.answer("2a free-space loss", f"{r['free_space_loss_db']:.2f} dB", True)
sheet.answer("2b Eb/N0", f"{r['eb_n0_db']:.2f} dB", True)
sheet.answer("2c margin", f"{r['margin_db']:.2f} dB", r["closes"] is True)
sheet.answer("2d required G/T", f"{r['required_g_over_t_db']:.2f} dB/K", abs(r["required_g_over_t_db"] - (53.0 - r["margin_db"])) < 1e-9)

# 3. Check the free-space loss by hand: 20 log10(4 pi d f / c).
f = r["link_constants"]["carrier_frequency_hz"]
by_hand = 20 * math.log10(4 * math.pi * r["range_km"] * 1e3 * f / 299_792_458.0)
sheet.answer("3 hand-computed loss", f"{by_hand:.2f} dB", abs(by_hand - r["free_space_loss_db"]) < 1e-6)

# 4. A value the model refuses: validation passes, the run fails with KSHANA_ERROR.
bad = kit.set_value(toml, "range_km", "-5.0")
sheet.answer("4a validate of a negative range", "[]", json.loads(k.validate(bad.encode())) == [])
try:
    k.run(bad.encode())
    raise SystemExit("FAIL 4b: a negative range ran")
except RuntimeError as e:
    sheet.answer("4b the refusal", "range_km must be finite and positive", "kshana error 1: range_km must be finite and positive" in str(e))
sheet.done()
