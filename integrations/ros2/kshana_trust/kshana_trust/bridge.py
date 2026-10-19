# SPDX-License-Identifier: AGPL-3.0-only
"""ROS-free core: turn fix and satellite messages into NMEA 0183 text, keep a rolling window,
and ask the kshana engine (``kshana.receiver_trust_replay``) to score it.

Nothing here imports ROS, so it is tested without a ROS install. The node
(``trust_node.py``) only moves messages in and out.
"""
import json
import math
from collections import deque

ADVISORY = (
    "Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): "
    "the operator remains responsible for the navigation of the vessel."
)

DEFAULT_SESSION = '[platform]\nkind = "vessel"\n[monitors]\ncalibration_s = {cal}\n'

# UBX gnssId -> NMEA talker (0 GPS, 1 SBAS, 2 Galileo, 3 BeiDou, 5 QZSS, 6 GLONASS).
_TALKER = {0: "GP", 2: "GA", 3: "GB", 5: "GQ", 6: "GL"}


def checksum(body):
    c = 0
    for ch in body:
        c ^= ord(ch)
    return "%02X" % c


def sentence(body):
    return "$%s*%s\r\n" % (body, checksum(body))


def _ddm(value, pos, neg, width):
    hemi = pos if value >= 0 else neg
    v = abs(value)
    deg = int(v)
    minutes = (v - deg) * 60.0
    if minutes >= 59.99995:  # rounding must not print 60.0000 minutes
        deg, minutes = deg + 1, 0.0
    return "%0*d%07.4f,%s" % (width, deg, minutes, hemi)


def _utc(sec):
    t = int(math.floor(sec))
    frac = sec - t
    days, rem = divmod(t, 86400)
    # civil date from days since 1970-01-01 (proleptic Gregorian)
    z = days + 719468
    era = z // 146097
    doe = z - era * 146097
    yoe = (doe - doe // 1460 + doe // 36524 - doe // 146096) // 365
    doy = doe - (365 * yoe + yoe // 4 - yoe // 100)
    mp = (5 * doy + 2) // 153
    d = doy - (153 * mp + 2) // 5 + 1
    m = mp + 3 if mp < 10 else mp - 9
    y = yoe + era * 400 + (1 if m <= 2 else 0)
    hh, r2 = divmod(rem, 3600)
    mm, ss = divmod(r2, 60)
    return "%02d%02d%05.2f" % (hh, mm, ss + frac), "%02d%02d%02d" % (d, m, y % 100)


def fix_sentences(stamp_s, lat, lon, alt, valid=True, n_used=0, hdop=1.0, sog_kn=0.0, cog=0.0):
    """GGA and RMC for one fix. ``valid`` False writes quality 0 / status V, which the engine
    reads as a receiver that does not call its own fix valid."""
    ts, date = _utc(stamp_s)
    q = 1 if valid else 0
    gga = "GPGGA,%s,%s,%s,%d,%02d,%.1f,%.1f,M,0.0,M,," % (
        ts, _ddm(lat, "N", "S", 2), _ddm(lon, "E", "W", 3), q, n_used, hdop, alt)
    rmc = "GPRMC,%s,%s,%s,%s,%.2f,%.1f,%s,,,A" % (
        ts, "A" if valid else "V", _ddm(lat, "N", "S", 2), _ddm(lon, "E", "W", 3), sog_kn, cog, date)
    return sentence(gga) + sentence(rmc)


def gsv_sentences(sats):
    """GSV sentences for ``sats``, a list of dicts ``gnss_id, sv_id, cno, elev, azim``, grouped by
    talker, four satellites per sentence. cno of 0 is written as an empty SNR (not tracked)."""
    out = []
    by = {}
    for s in sats:
        t = _TALKER.get(int(s["gnss_id"]))
        if t is None:
            continue
        prn = int(s["sv_id"])
        if t == "GL":
            prn += 64  # NMEA 4.10 numbers GLONASS slots from 65
        by.setdefault(t, []).append((prn, s))
    for t, items in by.items():
        n = len(items)
        pages = (n + 3) // 4
        for p in range(pages):
            body = "%sGSV,%d,%d,%d" % (t, pages, p + 1, n)
            for prn, s in items[p * 4:(p + 1) * 4]:
                cno = int(s.get("cno", 0))
                body += ",%02d,%02d,%03d,%s" % (
                    prn, max(-90, min(90, int(s.get("elev", 0)))), int(s.get("azim", 0)) % 360,
                    "%02d" % cno if cno > 0 else "")
            out.append(sentence(body))
    return "".join(out)


def _default_assess():
    import kshana  # imported late so the module loads without the wheel
    return kshana.receiver_trust_replay


class TrustEngine:
    """Rolling NMEA window scored on demand."""

    def __init__(self, window_s=900.0, calibration_s=120.0, session_toml=None, assess=None):
        self.window_s = float(window_s)
        self.session = session_toml or DEFAULT_SESSION.format(cal=float(calibration_s))
        self._assess = assess
        self._epochs = deque()  # (stamp_s, text)
        self._pending_sats = ""

    def push_satellites(self, sats):
        """Satellites for the next fix (GSV follows its GGA/RMC in the stream, so it is held
        until the fix of the same epoch is pushed)."""
        self._pending_sats = gsv_sentences(sats)

    def push_fix(self, stamp_s, lat, lon, alt, **kw):
        text = fix_sentences(stamp_s, lat, lon, alt, **kw) + self._pending_sats
        self._pending_sats = ""
        self._epochs.append((stamp_s, text))
        while self._epochs and stamp_s - self._epochs[0][0] > self.window_s:
            self._epochs.popleft()

    @property
    def epochs(self):
        return len(self._epochs)

    def evaluate(self):
        """Score the window. Returns the last epoch's state document, or ``{"state": "waiting"}``
        until the window holds more than the calibration time, or ``{"state": "error", ...}``."""
        if not self._epochs:
            return {"state": "waiting", "reason": "no fix yet", "advisory": ADVISORY}
        assess = self._assess or _default_assess()
        text = "".join(t for _, t in self._epochs)
        try:
            r = assess(self.session, text)
        except Exception as e:  # engine refuses short windows, bad sessions
            return {"state": "waiting", "reason": str(e), "advisory": ADVISORY}
        eps = r.get("epochs") or []
        if not eps:
            return {"state": "waiting", "reason": "no scored epoch", "advisory": ADVISORY}
        last = dict(eps[-1])
        last.setdefault("advisory", ADVISORY)
        return last


def state_json(doc):
    return json.dumps(doc, sort_keys=True)
