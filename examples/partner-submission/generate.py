#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the synthetic example record and its submission file.

The numbers are MADE UP (a linear congruential generator, white frequency noise on a slow drift). They show the format of a
partner submission and give `kshana partner check` something to read; they are not a measurement and say nothing about any
clock. Usage: python3 generate.py   (rewrites clock-phase-synthetic.txt and submission.toml in this directory)
"""
import hashlib
from pathlib import Path

here = Path(__file__).resolve().parent
state = 20261024


def rnd():
    global state
    state = (1103515245 * state + 12345) % (2 ** 31)
    return state / 2 ** 31 - 0.5


n, tau0 = 2400, 60.0  # 40 hours at one reading a minute
x, y = 0.0, 1.0e-12
lines = [
    "# SYNTHETIC EXAMPLE, made up for the format only: not a measurement of any clock",
    f"# tau0 = {tau0:g}",
    "# units = ns",
    "# data = phase",
]
for _ in range(n):
    lines.append(f"{x * 1e9:.4f}")
    y += rnd() * 2e-13
    x += y * tau0 + rnd() * 2e-11
text = "\n".join(lines) + "\n"
(here / "clock-phase-synthetic.txt").write_text(text)
sha = hashlib.sha256(text.encode()).hexdigest()
(here / "submission.toml").write_text(f'''# A data-partner submission: kshana.partner-submission/1. SYNTHETIC EXAMPLE, see NOTICE.md.
# Check it with:  kshana partner check examples/partner-submission/submission.toml
schema = "kshana.partner-submission/1"

[submitter]
organisation_type = "a national timing laboratory"   # a type; a name is optional and only for credit
# organisation = "..."
# credit_as = "..."

[device]
kind = "clock"          # clock or imu
class = "rubidium"      # tcxo, ocxo, rubidium, caesium, csac, hydrogen-maser, optical, other
# model = "..."         # required when class is "other"

[data]
path = "clock-phase-synthetic.txt"
sha256 = "{sha}"
format = "timelab"      # ticc, timelab, rinex-clk, ptp4l, phc2sys, ts2phc, chrony-tracking, chrony-statistics (a clock); csv, euroc (an imu)

[measurement]
reference = "a second, identical unit"
start_utc = "2026-03-01T00:00:00Z"
environment = "a temperature-controlled laboratory"
processing = "raw"      # raw or processed (then processing_note is required)
instruments = "a time-interval counter"

[rows]
targets = ["Oscillator holdover presets from public datasheets"]   # the requirement text of MODELLED rows, see docs/PARTNER-DATA.md

[licence]
spdx = "CC-BY-4.0"
use_in_repository = "public"      # public, hash-only or private
attribution = "Synthetic example, Kshana"

[statements]
measured_not_simulated = true     # (the real file must be a measurement; this example is not, and says so)
permission_to_use = true
no_personal_data = true
''')
print("wrote", n, "readings, sha256", sha)
