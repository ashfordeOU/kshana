# SPDX-License-Identifier: AGPL-3.0-only
"""Runs without ROS and without the kshana wheel: the engine call is a mock."""
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from kshana_trust import bridge  # noqa: E402


def test_checksum_matches_nmea_example():
    # The classic NMEA 0183 example sentence body and its checksum.
    body = "GPGLL,4916.45,N,12311.12,W,225444,A,*"[:-1]
    assert bridge.checksum(body) == "1D"


def test_fix_sentences_have_valid_checksums_and_format():
    text = bridge.fix_sentences(1709294400.25, 59.9115, -10.7579, 12.0, n_used=9)
    lines = text.strip().split("\r\n")
    assert [l[:6] for l in lines] == ["$GPGGA", "$GPRMC"]
    for l in lines:
        body, cs = l[1:].rsplit("*", 1)
        assert bridge.checksum(body) == cs
    assert "12:00:00" not in text and ",120000.25," in text
    assert "5954.6900,N,01045.4740,W" in lines[0]
    assert ",010324,,,A*" in lines[1]


def test_minutes_never_print_sixty():
    assert bridge._ddm(10.99999999, "N", "S", 2).startswith("1100.0000")


def test_invalid_fix_is_flagged():
    text = bridge.fix_sentences(1709294400.0, 1.0, 1.0, 0.0, valid=False)
    assert ",0,00," in text and ",V," in text


def test_gsv_groups_by_talker_and_pages_of_four():
    sats = [dict(gnss_id=0, sv_id=i, cno=40 + i, elev=30, azim=100 + i) for i in range(1, 6)]
    sats.append(dict(gnss_id=6, sv_id=3, cno=0, elev=10, azim=5))
    sats.append(dict(gnss_id=4, sv_id=1, cno=30, elev=1, azim=1))  # unknown system: skipped
    lines = bridge.gsv_sentences(sats).strip().split("\r\n")
    assert len(lines) == 3  # GPS: 2 pages, GLONASS: 1
    assert lines[0].startswith("$GPGSV,2,1,5,")
    assert lines[1].startswith("$GPGSV,2,2,5,")
    assert lines[2].startswith("$GLGSV,1,1,1,67,10,005,*")  # slot 3 -> 67, no SNR


def test_engine_window_and_assess_call():
    calls = []

    def fake(session, text):
        calls.append((session, text))
        return {"epochs": [{"state": "nominal", "score": 91.0}]}

    e = bridge.TrustEngine(window_s=10, calibration_s=5, assess=fake)
    assert e.evaluate()["state"] == "waiting"
    for i in range(30):
        e.push_satellites([dict(gnss_id=0, sv_id=1, cno=42, elev=40, azim=90)])
        e.push_fix(1709294400.0 + i, 59.0, 10.0, 5.0)
    assert e.epochs == 11  # window_s = 10 keeps 11 one-second epochs
    doc = e.evaluate()
    assert doc["state"] == "nominal" and doc["score"] == 91.0
    assert "Advisory software" in doc["advisory"]
    assert "calibration_s = 5.0" in calls[0][0]
    assert calls[0][1].count("$GPGGA") == 11 and calls[0][1].count("$GPGSV") == 11


def test_engine_reports_waiting_when_the_engine_refuses():
    def refuse(session, text):
        raise ValueError("the excerpt must hold the calibration window")

    e = bridge.TrustEngine(assess=refuse)
    e.push_fix(1709294400.0, 1.0, 1.0, 0.0)
    doc = e.evaluate()
    assert doc["state"] == "waiting" and "calibration" in doc["reason"]
