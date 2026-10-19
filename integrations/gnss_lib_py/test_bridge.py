# SPDX-License-Identifier: AGPL-3.0-only
import os
import sys

import pytest

sys.path.insert(0, os.path.dirname(__file__))
np = pytest.importorskip("numpy")
glp = pytest.importorskip("gnss_lib_py")
import kshana_gnss_lib_py as br  # noqa: E402


def _navdata(n=120, jump_after=None):
    import pandas as pd

    t0 = 1_400_000_000_000  # GPS milliseconds, week 2314-ish
    lat = 59.0 + np.where(np.arange(n) >= (jump_after or n + 1), 0.01, 0.0)
    df = pd.DataFrame({
        "gps_millis": t0 + 1000 * np.arange(n),
        "lat_rx_wls_deg": lat,
        "lon_rx_wls_deg": np.full(n, 10.0),
        "alt_rx_wls_m": np.full(n, 5.0),
    })
    return glp.NavData(pandas_df=df)


def test_pos_text_is_week_tow():
    text = br.fix_to_rtklib_pos(_navdata(3))
    lines = text.strip().split("\n")
    assert lines[0].startswith("% GPST")
    week, tow = divmod(1_400_000_000_000, br.WEEK_MS)
    assert lines[1].startswith("%d %.3f 59.000000000 10.000000000 5.0000 1 0" % (week, tow / 1000.0))
    assert len(lines) == 4


def test_assess_through_the_binding():
    pytest.importorskip("kshana")
    steady = br.assess_fixes(_navdata(), calibration_s=30)
    jumped = br.assess_fixes(_navdata(jump_after=90), calibration_s=30)
    assert steady["log"]["format"] == "rtklib-pos"
    assert steady["first_alarm_s"] is None
    assert jumped["first_alarm_s"] is not None and jumped["first_alarm_s"] >= 90
