# SPDX-License-Identifier: AGPL-3.0-only
"""Against the real engine: skipped when the kshana wheel is not installed."""
import os
import sys

import pytest

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
kshana = pytest.importorskip("kshana")

from kshana_trust import bridge  # noqa: E402


def _run(n, jump_after=None):
    e = bridge.TrustEngine(window_s=600, calibration_s=30)
    for i in range(n):
        lat = 59.0 + (0.01 if jump_after is not None and i >= jump_after else 0.0)
        e.push_satellites([
            dict(gnss_id=0, sv_id=k, cno=44, elev=20 + 8 * k, azim=45 * k) for k in range(1, 9)
        ])
        e.push_fix(1709294400.0 + i, lat, 10.0, 5.0, n_used=8)
    return e.evaluate()


def test_a_steady_fix_scores_and_carries_the_advisory():
    doc = _run(120)
    assert doc["state"] in ("nominal", "degraded", "untrusted", "calibrating"), doc
    assert "Advisory software" in doc["advisory"]


def test_too_short_a_window_is_waiting_not_a_crash():
    e = bridge.TrustEngine(window_s=600, calibration_s=300)
    e.push_fix(1709294400.0, 59.0, 10.0, 5.0)
    assert e.evaluate()["state"] in ("waiting", "calibrating")


def test_a_position_jump_is_untrusted_through_the_kinematic_monitor():
    steady = _run(120)
    jumped = _run(120, jump_after=90)
    assert steady["state"] == "nominal" and steady["score"] == 100.0
    assert jumped["state"] == "untrusted"
    assert "kinematic" in jumped["alarms"]
