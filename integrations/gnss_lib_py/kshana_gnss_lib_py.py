# SPDX-License-Identifier: AGPL-3.0-only
"""Bridge between gnss_lib_py (MIT licence, optional dependency) and Kshana receiver-trust.

``fix_to_rtklib_pos`` writes a gnss_lib_py ``NavData`` of position fixes in RTKLIB ``.pos``
form (GPS week and seconds of week), the format Kshana reads with ``format = "rtklib-pos"``;
``assess_fixes`` runs the ``receiver-trust`` kind on it through the Python binding and returns
the result document as a dict. Read-only: nothing is written to a receiver.

Only position and satellite count reach Kshana this way: a ``.pos`` file has no carrier-to-noise
density, so the C/N0 monitors have no data (the result lists the monitors that ran). Advisory
software, not type-approved navigation equipment.

Column names are gnss_lib_py's: ``gps_millis`` and ``lat_<src>_deg``, ``lon_<src>_deg``,
``alt_<src>_m`` where ``<src>`` is ``rx_wls`` (default, a receiver's WLS state estimate) or
``rx_gt`` (ground truth).
"""
import json
import math

WEEK_MS = 604_800_000


def fix_to_rtklib_pos(navdata, source="rx_wls", n_sats=None):
    """RTKLIB ``.pos`` text from a NavData of fixes. Rows with a non-finite value are skipped."""
    t = navdata["gps_millis"]
    lat = navdata["lat_%s_deg" % source]
    lon = navdata["lon_%s_deg" % source]
    alt = navdata["alt_%s_m" % source]
    lines = ["% GPST latitude(deg) longitude(deg) height(m) Q ns"]
    for i in range(len(t)):
        vals = (float(t[i]), float(lat[i]), float(lon[i]), float(alt[i]))
        if not all(math.isfinite(v) for v in vals):
            continue
        week, ms = divmod(int(round(vals[0])), WEEK_MS)
        lines.append("%d %.3f %.9f %.9f %.4f 1 %d" % (
            week, ms / 1000.0, vals[1], vals[2], vals[3], n_sats if n_sats is not None else 0))
    return "\n".join(lines) + "\n"


def scenario_toml(pos_text, calibration_s=60.0):
    """A ``receiver-trust`` scenario carrying ``pos_text`` inline."""
    return (
        '[log]\nformat = "rtklib-pos"\ntext = %s\n[monitors]\ncalibration_s = %r\n'
        % (json.dumps(pos_text), float(calibration_s))
    )


def assess_fixes(navdata, source="rx_wls", calibration_s=60.0):
    """Assess a NavData of fixes with Kshana receiver-trust; returns the result document."""
    import kshana  # imported late: the text helpers above work without the wheel

    out = kshana.receiver_trust(scenario_toml(fix_to_rtklib_pos(navdata, source), calibration_s))
    return json.loads(out.json)
