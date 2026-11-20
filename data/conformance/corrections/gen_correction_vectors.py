#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the correction-decoder test vectors (kshana.correction-vectors/1).

An independent encoder: it shares no code with the Rust decoders (src/corrections/). From
field values chosen here it builds the broadcast frames bit by bit, following its own reading
of the interface documents:

* Galileo HAS SIS ICD, Issue 1.0, May 2022: C/NAV page (section 2.3), HAS page header
  (section 3), RS(255,32) outer code over GF(256) (section 6, encoded here by polynomial
  division, Eq. 11), message type 1 (section 5).
* BDS-SIS-ICD-PPP-B2b-1.0 (July 2020), section 6: message types 1 to 7 and 63, CRC-24Q.
* IS-QZSS-L6-008 (CLAS) section 4.1 and IS-QZSS-MDC-005 (MADOCA-PPP) sections 4.2 and 6.3:
  L6 header, Compact SSR sub types 1 to 12, the MADOCA-PPP ionospheric messages.

The expected values are the chosen field values times the scale factors of those documents.
These are SELF-DERIVED round-trip vectors: they show that two implementations of one
reading agree, not that the reading matches the services. No interface-document example or
recorded signal is stored here.

Usage:  python3 gen_correction_vectors.py          (rewrite has.json, b2b.json, l6.json)
        python3 gen_correction_vectors.py --check  (exit 1 when a committed file differs)
Python standard library only.
"""

import json
import os
import sys

FORMAT = "kshana.correction-vectors/1"
VERSION = "1.0.0"
GENERATOR = "data/conformance/corrections/gen_correction_vectors.py"
PROVENANCE = ("self-derived: frames encoded by this generator from field values it chose, "
              "following its own reading of the interface document; a second implementation "
              "of the same reading, not an independent reference")


# ---------------------------------------------------------------- bits

class W:
    """Bit writer, most significant bit first."""

    def __init__(self):
        self.b = []

    def u(self, v, n):
        assert 0 <= v < (1 << n), (v, n)
        self.b += [(v >> (n - 1 - i)) & 1 for i in range(n)]
        return self

    def s(self, v, n):
        assert -(1 << (n - 1)) <= v < (1 << (n - 1)), (v, n)
        return self.u(v & ((1 << n) - 1), n)

    def bits(self, bs):
        self.b += list(bs)
        return self


def hexof(bits):
    bits = list(bits) + [0] * (-len(bits) % 8)
    return bytes(int("".join(map(str, bits[i:i + 8])), 2) for i in range(0, len(bits), 8)).hex()


def crc24q(bits):
    crc = 0
    for b in bits:
        fb = ((crc >> 23) & 1) ^ b
        crc = (crc << 1) & 0xFFFFFF
        if fb:
            crc ^= 0x864CFB
    return crc


def na(n):
    """The most negative code of an n-bit field: 'data not available'."""
    return -(1 << (n - 1))


def sc(raw, lsb):
    return None if raw is None else raw * lsb


# ---------------------------------------------------------------- HAS (GF(256), RS(255,32))

EXP = [0] * 512
LOG = [0] * 256
_x = 1
for _i in range(255):
    EXP[_i] = _x
    LOG[_x] = _i
    _x <<= 1
    if _x & 0x100:
        _x ^= 0x11D
for _i in range(255, 512):
    EXP[_i] = EXP[_i - 255]


def gmul(a, b):
    return 0 if a == 0 or b == 0 else EXP[LOG[a] + LOG[b]]


def gpoly():
    g = [1]
    for i in range(1, 224):
        r = EXP[i]
        nxt = [0] * (len(g) + 1)
        for j, c in enumerate(g):
            nxt[j + 1] ^= c
            nxt[j] ^= gmul(c, r)
        g = nxt
    return g


G_POLY = gpoly()


def rs_codeword(info):
    """info = [c31, ..., c0] (page 1 first); returns the 255 code octets, page 1 first
    (Eq. 11 and 12): c(x) x^223 mod g(x) gives the parity gamma_222 .. gamma_0."""
    c = list(reversed(info))  # c[j] = c_j
    rem = [0] * 223
    for j in range(31, -1, -1):  # long division of c(x) x^223, highest degree first
        fb = c[j] ^ rem[222]
        rem = [0] + rem[:222]
        if fb:
            for t in range(223):
                rem[t] ^= gmul(fb, G_POLY[t])
    return list(info) + [rem[k] for k in range(222, -1, -1)]


def has_encode(msg_bits):
    """Split into 424-bit pages with 0101.. padding, RS-encode column by column."""
    bits = list(msg_bits)
    pad = (-len(bits)) % 424
    bits += [i % 2 for i in range(pad)]
    k = len(bits) // 424
    assert 1 <= k <= 32
    pages = [hexof(bits[p * 424:(p + 1) * 424]) for p in range(k)]
    octs = [bytes.fromhex(p) for p in pages]
    enc = [[0] * 53 for _ in range(255)]
    for j in range(53):
        info = [octs[p][j] if p < k else 0 for p in range(32)]
        cw = rs_codeword(info)
        for p in range(255):
            enc[p][j] = cw[p]
    return k, enc, len(bits) - len(msg_bits)


def has_page(hass, mt, mid, ms, pid, octets, cnav=True):
    h = W().u(hass, 2).u(0, 2).u(mt, 2).u(mid, 5).u(ms - 1, 5).u(pid, 8)
    page = h.b + [(o >> (7 - i)) & 1 for o in octets for i in range(8)]
    if not cnav:
        return hexof(page)
    body = [1] * 14 + page
    crc = crc24q(body)
    full = body + [(crc >> (23 - i)) & 1 for i in range(24)] + [0] * 6
    return hexof(full)


HAS_VI = [5, 10, 15, 20, 30, 60, 90, 120, 180, 240, 300, 600, 900, 1800, 3600]
HAS_SIG = {0: ["L1 C/A", None, None, "L1C(D)", "L1C(P)", "L1C(D+P)", "L2 CM", "L2 CL",
               "L2 CM+CL", "L2 P", None, "L5 I", "L5 Q", "L5 I+Q", None],
           2: ["E1-B", "E1-C", "E1-B+C", "E5a-I", "E5a-Q", "E5a-I+Q", "E5b-I", "E5b-Q",
               "E5b-I+Q", "E5-I", "E5-Q", "E5-I+Q", "E6-B", "E6-C", "E6-B+C"]}
LETTER = {0: "G", 2: "E"}


def has_mask_bits(w, mask):
    w.u(len(mask), 4)
    for g in mask:
        w.u(g["gnss"], 4)
        w.bits([1 if (i + 1) in g["sats"] else 0 for i in range(40)])
        w.bits([1 if i in g["sigs"] else 0 for i in range(16)])
        w.u(1 if g.get("cell") else 0, 1)
        if g.get("cell"):
            for row in g["cell"]:
                w.bits(row)
        w.u(g.get("nm", 0), 3)
    w.u(0, 6)


def has_mask_expect(mask):
    out = []
    for g in mask:
        out.append({
            "gnss_id": g["gnss"],
            "satellites": ["%s%02d" % (LETTER[g["gnss"]], s) for s in sorted(g["sats"])],
            "signals": sorted(g["sigs"]),
            "signal_names": [HAS_SIG[g["gnss"]][s] or "reserved" for s in sorted(g["sigs"])],
            "cell_mask": g.get("cell"),
            "nav_message": g.get("nm", 0),
        })
    return out


def has_cells(g, i):
    sigs = sorted(g["sigs"])
    if g.get("cell"):
        return [s for s, c in zip(sigs, g["cell"][i]) if c]
    return sigs


def has_mt1(toh, mask_id, iod, mask, send_mask=False, orbit=None, clock=None, subset=None,
            code=None, phase=None):
    """Build an MT1 and its expected decoding. Values are raw integers; None = not sent."""
    w = W().u(toh, 12)
    flags = [send_mask, orbit is not None, clock is not None, subset is not None,
             code is not None, phase is not None]
    for f in flags:
        w.u(1 if f else 0, 1)
    w.u(0, 4).u(mask_id, 5).u(iod, 5)
    exp = {"header": {"toh": toh, "mask": flags[0], "orbit": flags[1], "clock_full": flags[2],
                      "clock_subset": flags[3], "code_bias": flags[4], "phase_bias": flags[5],
                      "mask_id": mask_id, "iod_set_id": iod}, "error": None}
    if send_mask:
        has_mask_bits(w, mask)
        exp["mask"] = has_mask_expect(mask)
    else:
        exp["mask"] = None
    sats = [(g, i, "%s%02d" % (LETTER[g["gnss"]], s))
            for g in mask for i, s in enumerate(sorted(g["sats"]))]
    if orbit is not None:
        vi, rows = orbit
        w.u(vi, 4)
        es = []
        for (g, _, lab), (iod_ref, dr, dit, dct) in zip(sats, rows):
            w.u(iod_ref, 8 if g["gnss"] == 0 else 10)
            w.s(dr, 13).s(dit, 12).s(dct, 12)
            es.append({"sat": lab, "iod_ref": iod_ref,
                       "radial_m": None if dr == na(13) else dr * 0.0025,
                       "in_track_m": None if dit == na(12) else dit * 0.008,
                       "cross_track_m": None if dct == na(12) else dct * 0.008})
        exp["orbit"] = {"validity_index": vi, "validity_s": HAS_VI[vi], "sats": es}
    if clock is not None:
        vi, dcm, rows = clock
        w.u(vi, 4)
        for d in dcm:
            w.u(d - 1, 2)
        es = []
        k = 0
        for gi, g in enumerate(mask):
            for s in sorted(g["sats"]):
                raw = rows[k]
                k += 1
                w.s(raw, 13)
                es.append(has_clock_expect("%s%02d" % (LETTER[g["gnss"]], s), raw, dcm[gi]))
        exp["clock_full"] = {"validity_index": vi, "validity_s": HAS_VI[vi],
                             "multipliers": dcm, "sats": es}
    if subset is not None:
        vi, systems = subset
        w.u(vi, 4).u(len(systems), 4)
        es = []
        for gnss, mult, picks in systems:
            g = next(x for x in mask if x["gnss"] == gnss)
            w.u(gnss, 4).u(mult - 1, 2)
            ss = sorted(g["sats"])
            w.bits([1 if s in picks else 0 for s in ss])
            cs = []
            for s in ss:
                if s in picks:
                    w.s(picks[s], 13)
                    cs.append(has_clock_expect("%s%02d" % (LETTER[gnss], s), picks[s], mult))
            es.append({"gnss_id": gnss, "multiplier": mult, "sats": cs})
        exp["clock_subset"] = {"validity_index": vi, "validity_s": HAS_VI[vi], "systems": es}
    for key, blk in (("code_bias", code), ("phase_bias", phase)):
        if blk is None:
            exp[key] = None
            continue
        vi, rows = blk
        w.u(vi, 4)
        es = []
        for (g, i, lab), row in zip(sats, rows):
            cells = has_cells(g, i)
            assert len(cells) == len(row)
            bs = []
            for sig, val in zip(cells, row):
                if key == "code_bias":
                    w.s(val, 11)
                    bs.append({"signal": sig, "bias": None if val == na(11) else val * 0.02})
                else:
                    pb, pdi = val
                    w.s(pb, 11).u(pdi, 2)
                    bs.append({"signal": sig, "bias": None if pb == na(11) else pb * 0.01,
                               "pdi": pdi})
            es.append({"sat": lab, "biases": bs})
        exp[key] = {"validity_index": vi, "validity_s": HAS_VI[vi], "sats": es}
    for key in ("orbit", "clock_full", "clock_subset"):
        exp.setdefault(key, None)
    return w.b, exp


def has_clock_expect(lab, raw, mult):
    if raw == -4096:
        return {"sat": lab, "dcc_m": None, "correction_m": None, "status": "not_available"}
    if raw == 4095:
        return {"sat": lab, "dcc_m": None, "correction_m": None, "status": "do_not_use"}
    return {"sat": lab, "dcc_m": raw * 0.0025, "correction_m": raw * 0.0025 * mult,
            "status": "ok"}


MASK_A = [
    {"gnss": 0, "sats": [3, 7, 30], "sigs": [0, 7, 11],
     "cell": [[1, 1, 0], [1, 0, 1], [1, 1, 1]], "nm": 0},
    {"gnss": 2, "sats": [1, 36], "sigs": [1, 7, 12], "nm": 0},
]


def has_vectors():
    vs = []
    full_bits, full_exp = has_mt1(
        1234, 3, 17, MASK_A, send_mask=True,
        orbit=(10, [(45, 120, -300, 25), (201, -7, 4, -2047), (9, 4095, 2047, -1),
                    (1023, -4095, -2047, 33), (512, na(13), na(12), na(12))]),
        clock=(5, [2, 1], [-2564, 100, 4095, 0, -4096]),
        code=(14, [[187, -219], [10, -1023], [1, 2, 3], [-5, 6, 7], [na(11), 1023, -1]]),
        phase=(4, [[(-1024 + 1, 0), (5, 3)], [(0, 1), (1023, 2)], [(1, 0), (2, 0), (3, 0)],
                   [(-1, 1), (-2, 2), (-3, 3)], [(na(11), 0), (7, 1), (8, 2)]]))
    k, enc, padn = has_encode(full_bits)
    assert k == 2, k
    pids = [200, 2]
    frames = [has_page(1, 1, 9, k, p, enc[p - 1]) for p in pids]
    exp = dict(full_exp, mid=9, ms=k, mt=1, hass=1, pids=pids, trailing_bits=padn,
               trailing_is_padding=True)
    vs.append(vec("has-mt1-all-blocks-from-two-cnav-pages", "has", frames,
                  {"frames": 2, "bad_crc": 0, "messages": [exp], "incomplete": []},
                  "mask with a cell mask, orbit, clock full-set, code and phase biases; "
                  "pages from the parity part and the systematic part"))

    # The same message from 448-bit HAS pages (no C/NAV CRC).
    frames448 = [has_page(1, 1, 9, k, p, enc[p - 1], cnav=False) for p in (255, 33)]
    vs.append(vec("has-mt1-from-448-bit-has-pages", "has", frames448,
                  {"messages": [dict(exp, pids=[255, 33])]},
                  "the same message read from bare HAS pages, highest PIDs"))

    # Redundant pages, a dummy page, a corrupted page.
    bad = bytearray.fromhex(has_page(1, 1, 9, k, 5, enc[4]))
    bad[20] ^= 0x10
    more = ([has_page(1, 1, 9, k, p, enc[p - 1]) for p in (150, 11)] + [bad.hex()]
            + [dummy_page()]
            + [has_page(1, 1, 9, k, p, enc[p - 1]) for p in (40, 1)])
    vs.append(vec("has-redundant-dummy-and-bad-crc", "has", more,
                  {"frames": 6, "bad_crc": 1, "dummy": 1, "zero_pid": 1, "redundant": 1,
                   "messages": [dict(exp, pids=[150, 40])]},
                  "PID 11 of a two-page message carries only zeros and is skipped; the page after the "
                  "message is complete re-encodes to it and is redundant"))

    # Clock-only message using the mask of an earlier one; a subset message.
    clk_bits, clk_exp = has_mt1(1240, 3, 17, MASK_A,
                                clock=(1, [4, 3], [1, -1, 2, -2, 4094]))
    sub_bits, sub_exp = has_mt1(1241, 3, 17, MASK_A,
                                subset=(0, [(2, 2, {36: -100}), (0, 1, {3: 50, 30: -4096})]))
    frames2 = list(frames)
    msgs = [exp]
    for mid, (b, e) in ((10, (clk_bits, clk_exp)), (11, (sub_bits, sub_exp))):
        kk, ee, pn = has_encode(b)
        frames2.append(has_page(0, 1, mid, kk, 60, ee[59]))
        msgs.append(dict(e, mid=mid, ms=kk, hass=0, pids=[60], trailing_bits=pn,
                         trailing_is_padding=True))
    vs.append(vec("has-clock-and-subset-use-the-earlier-mask", "has", frames2,
                  {"messages": msgs},
                  "Mask ID 3 defined by the first message; multipliers 4 and 3, 2 and 1"))

    # Clock-only message with no mask received: no_mask.
    kk, ee, pn = has_encode(clk_bits)
    vs.append(vec("has-clock-without-mask", "has", [has_page(1, 1, 4, kk, 1, ee[0])],
                  {"messages": [{"mid": 4, "error": "no_mask", "clock_full": None,
                                 "header": clk_exp["header"]}]},
                  "a message whose Mask ID was never defined is not read further"))

    # Incomplete message and MID reuse with new content.
    other_bits, other_exp = has_mt1(5, 1, 2, MASK_A[:1], send_mask=True)
    k2, e2, p2 = has_encode(other_bits)
    vs.append(vec("has-incomplete-message", "has",
                  [has_page(1, 1, 9, k, 200, enc[199])],
                  {"messages": [], "incomplete": [[9, 2, 1]]},
                  "one page of a two-page message"))
    vs.append(vec("has-mid-reused-with-new-content", "has",
                  frames + [has_page(1, 1, 9, k2, 1, e2[0])],
                  {"messages": [exp, dict(other_exp, mid=9, ms=k2, hass=1, pids=[1],
                                          trailing_bits=p2, trailing_is_padding=True)]},
                  "a page of MID 9 that does not re-encode to the decoded message starts a "
                  "new one"))
    vs.append(vec("has-reserved-pid-and-short-frame", "has",
                  [has_page(1, 1, 9, k, 0, enc[0]), "00ff"],
                  {"reserved_pid": 1, "bad_length": 1, "messages": []}, None))
    return doc("has", "Galileo HAS SIS ICD Issue 1.0 (May 2022), sections 2 to 7", vs)


def dummy_page():
    bits = W().u(0xAF3BC3, 24).b + [0] * 424
    body = [1] * 14 + bits
    crc = crc24q(body)
    return hexof(body + [(crc >> (23 - i)) & 1 for i in range(24)] + [0] * 6)


# ---------------------------------------------------------------- B2b

def b2b_frame(w):
    assert len(w.b) <= 462, len(w.b)
    bits = w.b + [0] * (462 - len(w.b))
    crc = crc24q(bits)
    return hexof(bits + [(crc >> (23 - i)) & 1 for i in range(24)])


def slot_label(s):
    if 1 <= s <= 63:
        return "C%02d" % s
    if 64 <= s <= 100:
        return "G%02d" % (s - 63)
    if 101 <= s <= 137:
        return "E%02d" % (s - 100)
    if 138 <= s <= 174:
        return "R%02d" % (s - 137)
    return "slot%d" % s


def ura(u):
    if u == 0 or u >= 63:
        return None
    return 3 ** (u >> 3) * (1 + 0.25 * (u & 7)) - 1


def b2b_orbit(w, slot, iodn, iodc, r, a, c, u):
    w.u(slot, 9).u(iodn, 10).u(iodc, 3).s(r, 15).s(a, 13).s(c, 13).u(u, 6)
    return {"sat": slot_label(slot), "slot": slot, "iodn": iodn, "iod_corr": iodc,
            "radial_m": None if r == na(15) else r * 0.0016,
            "along_m": None if a == na(13) else a * 0.0064,
            "cross_m": None if c == na(13) else c * 0.0064, "urai": u, "ura_mm": ura(u)}


B2B_SIG = {"C": ["B1I", "B1C(D)", "B1C(P)", None, "B2a(D)", "B2a(P)", None, "B2b-I", "B2b-Q",
                 None, None, None, "B3 I", None, None, None],
           "G": ["L1 C/A", "L1 P", None, None, "L1C(P)", "L1C(D+P)", None, "L2C(L)",
                 "L2C(M+L)", None, None, "L5 I", "L5 Q", "L5 I+Q", None, None],
           "E": [None, "E1 B", "E1 C", None, "E5a Q", "E5a I", None, "E5b I", "E5b Q", None,
                 None, "E6 C", None, None, None, None]}


def b2b_vectors():
    vs = []
    slots = [1, 19, 46, 64, 70, 101, 112, 140]
    w = W().u(1, 6).u(34567, 17).u(0, 4).u(2, 2).u(5, 4)
    w.bits([1 if (i + 1) in slots else 0 for i in range(255)])
    mask = b2b_frame(w)
    mexp = {"type": 1, "epoch_s": 34567, "iod_ssr": 2, "iodp": 5,
            "mask": [slot_label(s) for s in slots], "note": None}
    vs.append(vec("b2b-mt1-mask", "b2b", [mask],
                  {"frames": 1, "bad_crc": 0, "messages": [mexp]}, None))

    w = W().u(2, 6).u(34570, 17).u(0, 4).u(2, 2)
    orbs = [b2b_orbit(w, 19, 600, 3, 1000, -200, 77, 0b010_011),
            b2b_orbit(w, 64, 77, 0, na(15), 4095, -4095, 0),
            b2b_orbit(w, 112, 1023, 7, -16383, na(13), 1, 63)]
    for _ in range(3):
        w.u(0, 69)
    vs.append(vec("b2b-mt2-orbit-and-urai", "b2b", [b2b_frame(w)],
                  {"messages": [{"type": 2, "epoch_s": 34570, "iod_ssr": 2, "orbits": orbs,
                                 "note": None}]},
                  "three of six entries used; empty entries (slot 0) are dropped; "
                  "not-available sentinels and URAI 0 and 63"))

    w = W().u(3, 6).u(34500, 17).u(0, 4).u(2, 2).u(2, 5)
    cb = []
    for slot, items in ((19, [(0, 100), (8, -2047)]), (101, [(1, 5), (11, -1), (4, 2047)])):
        w.u(slot, 9).u(len(items), 4)
        bs = []
        lab = slot_label(slot)
        for mode, v in items:
            w.u(mode, 4).s(v, 12)
            bs.append({"mode": mode, "name": B2B_SIG[lab[0]][mode], "bias_m": v * 0.017})
        cb.append({"sat": lab, "slot": slot, "biases": bs})
    vs.append(vec("b2b-mt3-code-biases", "b2b", [b2b_frame(w)],
                  {"messages": [{"type": 3, "code_biases": cb}]}, None))

    def mt4(iodp, vals):
        w = W().u(4, 6).u(34571, 17).u(0, 4).u(2, 2).u(iodp, 4).u(0, 5)
        for iodc, c0 in vals:
            w.u(iodc, 3).s(c0, 15)
        for _ in range(23 - len(vals)):
            w.u(0, 18)
        return b2b_frame(w)

    vals = [(1, 10), (2, -10), (3, na(15)), (4, 16383), (5, 0), (6, 1), (7, -1), (0, 2)]
    clocks = [{"sat": slot_label(s), "index": i + 1, "iod_corr": v[0],
               "c0_m": None if v[1] == na(15) else v[1] * 0.0016}
              for i, (s, v) in enumerate(zip(slots, vals))]
    vs.append(vec("b2b-mt4-clock-with-mask", "b2b", [mask, mt4(5, vals)],
                  {"messages": [mexp, {"type": 4, "iodp": 5, "subtype": 0,
                                       "clocks": clocks, "note": None}]},
                  "entries past the eight masked satellites are dropped"))
    raw = [{"sat": None, "index": i + 1} for i in range(23)]
    vs.append(vec("b2b-mt4-clock-without-mask", "b2b", [mt4(9, vals)],
                  {"messages": [{"type": 4, "iodp": 9, "clocks": raw, "note": "no_mask"}]},
                  "no type 1 with IODP 9: the 23 entries keep their mask positions"))

    w = W().u(5, 6).u(34572, 17).u(0, 4).u(2, 2).u(5, 4).u(0, 3)
    urais = [9, 0, 63, 1, 2, 3, 4, 5]
    for u in urais:
        w.u(u, 6)
    for _ in range(70 - len(urais)):
        w.u(0, 6)
    uras = [{"sat": slot_label(s), "index": i + 1, "urai": u, "ura_mm": ura(u)}
            for i, (s, u) in enumerate(zip(slots, urais))]
    vs.append(vec("b2b-mt5-urai", "b2b", [mask, b2b_frame(w)],
                  {"messages": [mexp, {"type": 5, "subtype": 0, "uras": uras}]}, None))

    w = W().u(6, 6).u(2, 5).u(1, 3)
    w.u(34575, 17).u(0, 4).u(2, 2).u(5, 4).u(7, 9)
    w.u(3, 3).s(-500, 15).u(4, 3).s(501, 15)
    w.u(34560, 17).u(0, 4).u(2, 2)
    o6 = b2b_orbit(w, 138, 12, 3, 5, 6, 7, 20)
    c6 = [{"sat": slot_label(slots[6]), "index": 7, "iod_corr": 3, "c0_m": -500 * 0.0016},
          {"sat": slot_label(slots[7]), "index": 8, "iod_corr": 4, "c0_m": 501 * 0.0016}]
    vs.append(vec("b2b-mt6-clock-and-orbit", "b2b", [mask, b2b_frame(w)],
                  {"messages": [mexp, {"type": 6, "epoch_s": 34575, "orbit_epoch_s": 34560,
                                       "iodp": 5, "clocks": c6, "orbits": [o6]}]},
                  "Slot_S 7: the seventh and eighth masked satellites"))

    w = W().u(7, 6).u(1, 5).u(1, 3)
    w.u(34576, 17).u(0, 4).u(1, 2)
    w.u(46, 9).u(2, 3).s(-3, 15)
    w.u(34561, 17).u(0, 4).u(1, 2)
    o7 = b2b_orbit(w, 70, 13, 2, -5, -6, -7, 9)
    vs.append(vec("b2b-mt7-clock-by-slot", "b2b", [b2b_frame(w)],
                  {"messages": [{"type": 7, "iod_ssr": 1, "iodp": None,
                                 "clocks": [{"sat": "C46", "index": 46, "iod_corr": 2,
                                             "c0_m": -3 * 0.0016}],
                                 "orbits": [o7]}]}, None))

    corrupt = bytearray.fromhex(mask)
    corrupt[10] ^= 1
    null = b2b_frame(W().u(63, 6))
    vs.append(vec("b2b-null-bad-crc-and-reserved", "b2b",
                  [null, corrupt.hex(), b2b_frame(W().u(20, 6)), "abcd"],
                  {"frames": 4, "null": 1, "bad_crc": 1, "bad_length": 1,
                   "messages": [{"type": 20, "note": "reserved_type"}]}, None))
    return doc("b2b", "BDS-SIS-ICD-PPP-B2b-1.0 (July 2020), section 6", vs)


# ---------------------------------------------------------------- QZSS L6 / Compact SSR

def l6_frames(prn, type_id, data_bits, alert=False):
    """Split data bits over consecutive data parts; the first carries the subframe start."""
    parts = []
    n = max(1, -(-len(data_bits) // 1695))
    for p in range(n):
        chunk = data_bits[p * 1695:(p + 1) * 1695]
        chunk = chunk + [0] * (1695 - len(chunk))
        tid = type_id | (1 if p == 0 else 0)
        hdr = W().u(0x1ACFFC1D, 32).u(prn, 8).u(tid, 8).u(1 if alert else 0, 1).b
        parts.append(hexof(hdr + chunk + [0] * 256))
    return parts


CSSR_SIG = {
    "clas": {0: ["L1 C/A", "L1 P", "L1 Z", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2C(M)", "L2C(L)",
                 "L2C(M+L)", "L2 P", "L2 Z", "L5 I", "L5 Q", "L5 I+Q"],
             2: ["E1 B", "E1 C", "E1 B+C", "E5a I", "E5a Q", "E5a I+Q", "E5b I", "E5b Q",
                 "E5b I+Q", "E5 I", "E5 Q", "E5 I+Q", "service 1", "service 2", "service 3"],
             4: ["L1 C/A", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2C(M)", "L2C(L)", "L2C(M+L)",
                 "L5 I", "L5 Q", "L5 I+Q"]},
    "madoca": {0: ["L1 C/A", "L1 P", "L1 Z", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2C(M)",
                   "L2C(L)", "L2C(M+L)", "L2 P", "L2 Z", "L5 I", "L5 Q", "L5 I+Q"],
               2: ["E1 B", "E1 C", "E1 B+C", "E5a I", "E5a Q", "E5a I+Q", "E5b I", "E5b Q",
                   "E5b I+Q", "E5 I", "E5 Q", "E5 I+Q", "E6 B", "E6 C"],
               7: ["B1 I", "B1 Q", "B1 I+Q", "B3 I", "B3 Q", "B3 I+Q", "B2/B2b I", "B2/B2b Q",
                   "B2/B2b I+Q", "B1C(D)", "B1C(P)", "B1C(D+P)", "B2a(D)", "B2a(P)",
                   "B2a(D+P)"]},
}


def cssr_label(flav, gnss, n):
    if gnss == 7 and flav == "madoca":
        return "C%02d" % (n + 18)
    return "%s%02d" % ({0: "G", 1: "R", 2: "E", 3: "C", 4: "J"}[gnss], n)


def cssr_mask(flav, tow, iod, systems):
    w = W().u(4073, 12).u(1, 4).u(tow, 20).u(5, 4).u(0, 1).u(iod, 4).u(len(systems), 4)
    exp_sys = []
    for g in systems:
        w.u(g["gnss"], 4)
        w.bits([1 if (i + 1) in g["sats"] else 0 for i in range(40)])
        w.bits([1 if i in g["sigs"] else 0 for i in range(16)])
        w.u(1 if g.get("cell") else 0, 1)
        if g.get("cell"):
            for row in g["cell"]:
                w.bits(row)
        exp_sys.append({"gnss_id": g["gnss"],
                        "satellites": [cssr_label(flav, g["gnss"], s) for s in g["sats"]],
                        "signals": g["sigs"],
                        "signal_names": [CSSR_SIG[flav][g["gnss"]][s] for s in g["sigs"]],
                        "cell_mask": g.get("cell")})
    return w, {"subtype": 1, "epoch_s": tow, "update_interval": 5, "multiple": False,
               "iod_ssr": iod, "mask": exp_sys}


def cssr_head(w, st, epoch, iod, mm=0):
    w.u(4073, 12).u(st, 4).u(epoch, 12).u(2, 4).u(mm, 1).u(iod, 4)
    return {"subtype": st, "epoch_s": epoch, "update_interval": 2, "multiple": bool(mm),
            "iod_ssr": iod}


def sats_of(flav, systems):
    out = []
    for g in systems:
        for i, s in enumerate(g["sats"]):
            cells = g["sigs"] if not g.get("cell") else [
                x for x, c in zip(g["sigs"], g["cell"][i]) if c]
            out.append((cssr_label(flav, g["gnss"], s), g["gnss"], cells))
    return out


def opt(raw, n, lsb):
    return None if raw == na(n) else raw * lsb


CLAS_SYS = [
    {"gnss": 0, "sats": [2, 5, 31], "sigs": [0, 7, 11], "cell": [[1, 1, 1], [1, 0, 1], [0, 1, 1]]},
    {"gnss": 2, "sats": [4, 33], "sigs": [0, 3]},
    {"gnss": 4, "sats": [1, 3], "sigs": [0, 5, 7]},
]


def stec_poly(w, ty, vals):
    spec = [(14, 0.05), (12, 0.02), (12, 0.02), (10, 0.02), (8, 0.005), (8, 0.005)]
    n = [1, 3, 4, 6][ty]
    out = []
    for (bits, lsb), v in zip(spec[:n], vals[:n]):
        w.s(v, bits)
        out.append(opt(v, bits, lsb))
    return out


def clas_vectors():
    flav = "clas"
    sats = sats_of(flav, CLAS_SYS)
    ns = len(sats)
    w, m1 = cssr_mask(flav, 345600, 6, CLAS_SYS)
    msgs = [m1]
    # ST2 orbit
    e = cssr_head(w, 2, 1800, 6)
    orbs = []
    for i, (lab, g, _) in enumerate(sats):
        iode = 300 + i if g == 2 else 10 + i
        r, a, c = (100 * (i + 1), -50 * i, na(13) if i == 3 else 7 * i)
        w.u(iode, 10 if g == 2 else 8).s(r, 15).s(a, 13).s(c, 13)
        orbs.append({"sat": lab, "iode": iode, "radial_m": r * 0.0016, "along_m": a * 0.0064,
                     "cross_m": opt(c, 13, 0.0064)})
    msgs.append(dict(e, orbits=orbs))
    # ST3 clock
    e = cssr_head(w, 3, 1805, 6)
    clks = []
    for i, (lab, _, _) in enumerate(sats):
        v = na(15) if i == 0 else 16383 - 1000 * i
        w.s(v, 15)
        clks.append({"sat": lab, "c0_m": opt(v, 15, 0.0016)})
    msgs.append(dict(e, clocks=clks))
    # ST4 code bias
    e = cssr_head(w, 4, 1800, 6)
    bs = []
    for i, (lab, _, cells) in enumerate(sats):
        row = []
        for j, sig in enumerate(cells):
            v = (i * 37 + j * 11) % 900 - 450
            w.s(v, 11)
            row.append({"signal": sig, "code_bias_m": v * 0.02})
        bs.append({"sat": lab, "biases": row})
    msgs.append(dict(e, biases=bs))
    # ST5 phase bias
    e = cssr_head(w, 5, 1800, 6)
    bs = []
    for i, (lab, _, cells) in enumerate(sats):
        row = []
        for j, sig in enumerate(cells):
            v = na(15) if (i, j) == (1, 0) else (i * 997 - j * 313) % 30000 - 15000
            w.s(v, 15).u((i + j) % 4, 2)
            row.append({"signal": sig, "phase_bias_m": opt(v, 15, 0.001),
                        "discontinuity": (i + j) % 4})
        bs.append({"sat": lab, "biases": row})
    msgs.append(dict(e, biases=bs))
    # ST7 URA
    e = cssr_head(w, 7, 1800, 6)
    us = []
    for i, (lab, _, _) in enumerate(sats):
        u = [0, 9, 63, 18, 27, 36, 1][i % 7]
        w.u(u, 6)
        us.append({"sat": lab, "ura": u, "ura_mm": ura(u)})
    msgs.append(dict(e, uras=us))
    # ST6 code and phase bias, network
    e = cssr_head(w, 6, 1810, 6)
    net = [0, 2, 5]
    w.u(1, 1).u(1, 1).u(1, 1).u(12, 5).bits([1 if i in net else 0 for i in range(ns)])
    bs = []
    for i in net:
        lab, _, cells = sats[i]
        row = []
        for j, sig in enumerate(cells):
            cbv, pbv = 3 * i - j, -(5 * i + j)
            w.s(cbv, 11).s(pbv, 15).u(1, 2)
            row.append({"signal": sig, "code_bias_m": cbv * 0.02, "phase_bias_m": pbv * 0.001,
                        "discontinuity": 1})
        bs.append({"sat": lab, "biases": row})
    msgs.append(dict(e, network_id=12, network_sats=[sats[i][0] for i in net], biases=bs))
    # ST11 combined, network, orbit and clock
    e = cssr_head(w, 11, 1810, 6)
    net = [1, 4, 6]
    w.u(1, 1).u(1, 1).u(1, 1).u(2, 5).bits([1 if i in net else 0 for i in range(ns)])
    orbs, clks = [], []
    for i in net:
        lab, g, _ = sats[i]
        iode = 1000 if g == 2 else 200
        w.u(iode, 10 if g == 2 else 8).s(-i, 15).s(i, 13).s(2 * i, 13).s(-3 * i, 15)
        orbs.append({"sat": lab, "iode": iode, "radial_m": -i * 0.0016, "along_m": i * 0.0064,
                     "cross_m": 2 * i * 0.0064})
        clks.append({"sat": lab, "c0_m": -3 * i * 0.0016})
    msgs.append(dict(e, network_id=2, network_sats=[sats[i][0] for i in net], orbits=orbs,
                     clocks=clks))
    # ST8 STEC type 3
    e = cssr_head(w, 8, 1815, 6)
    net = [0, 3, 6]
    w.u(3, 2).u(5, 5).bits([1 if i in net else 0 for i in range(ns)])
    st = []
    for i in net:
        w.u(9 + i, 6)
        co = stec_poly(w, 3, [100 * i - 8000, -2047 + i, 2047, na(10), 127, -127])
        st.append({"sat": sats[i][0], "quality": 9 + i, "correction_type": 3,
                   "coefficients": co})
    msgs.append(dict(e, network_id=5, network_sats=[sats[i][0] for i in net], stec=st))
    # ST9 gridded, 16-bit residuals, 2 grids
    e = cssr_head(w, 9, 1815, 6)
    net = [2, 3]
    w.u(1, 2).u(1, 1).u(7, 5).bits([1 if i in net else 0 for i in range(ns)])
    w.u(0b010_001, 6).u(2, 6)
    grids = []
    for gi in range(2):
        h, wt = 200 - gi * 400, na(8) if gi else 100
        w.s(h, 9).s(wt, 8)
        res = []
        for k in net:
            v = na(16) if (gi, k) == (1, 3) else 30000 - 7000 * k - gi
            w.s(v, 16)
            res.append(opt(v, 16, 0.04))
        grids.append({"hydrostatic_m": opt(h, 9, 0.004), "wet_m": opt(wt, 8, 0.004),
                      "stec_residuals_tecu": res})
    msgs.append(dict(e, network_id=7, network_sats=[sats[i][0] for i in net],
                     grid_header=[1, 1, 0b010_001], grids=grids))
    # ST12 atmospheric, troposphere type 2 and STEC with residuals, 3 grids
    e = cssr_head(w, 12, 1820, 6)
    w.u(3, 2).u(3, 2).u(4, 5).u(3, 6)
    w.u(17, 6).u(2, 2).s(-200, 9).s(30, 7).s(-30, 7).s(na(7), 7)
    w.u(1, 1).u(15, 4)
    tres = [-128, 0, 127]
    for v in tres:
        w.s(v, 8)
    trop = {"quality": 17, "correction_type": 2,
            "coefficients": [-200 * 0.004, 30 * 0.002, -30 * 0.002, None],
            "residual_size": 1, "residual_offset_m": 15 * 0.02,
            "residuals_m": [None, 0.0, 127 * 0.004]}
    net = [1, 5]
    w.bits([1 if i in net else 0 for i in range(ns)])
    st = []
    sizes = {1: (2, 5, 0.16), 5: (3, 7, 0.24)}
    for i in net:
        ty = 1 if i == 1 else 0
        w.u(30 + i, 6).u(ty, 2)
        co = stec_poly(w, ty, [-100 * i, 55, -55, 0, 0, 0])
        size, bits, lsb = sizes[i]
        w.u(size, 2)
        res = []
        for k in range(3):
            v = na(bits) if k == 2 else k - 2
            w.s(v, bits)
            res.append(opt(v, bits, lsb))
        st.append({"sat": sats[i][0], "quality": 30 + i, "correction_type": ty,
                   "coefficients": co, "residual_size": size, "residuals_tecu": res})
    msgs.append(dict(e, network_id=4, network_sats=[sats[i][0] for i in net],
                     troposphere=trop, stec=st))
    # ST10 service information
    w.u(4073, 12).u(10, 4).u(0, 1).u(5, 3).u(1, 2)
    aux = [0xA5, 0x01, 0x02, 0x03, 0x04, 0xFF, 0x00, 0x10, 0x20, 0x30]
    for b in aux:
        w.u(b, 8)
    msgs.append({"subtype": 10, "multiple": False,
                 "service_info": [5, 1, bytes(aux).hex()]})
    data = w.b
    frames = l6_frames(199, 0b101_01_00_0, data)
    for m in msgs:
        m.update(prn=199, service="clas", facility=1)
    vs = [vec("l6-clas-subframe-all-subtypes", "l6", frames,
              {"frames": len(frames), "subframes": 1, "orphan": 0, "stopped": [],
               "messages": msgs, "unknown_gnss_ids": []},
              "sub types 1 to 12 in one subframe of %d data parts; messages cross data-part "
              "boundaries" % len(frames))]
    # Alert flag; a second subframe of ST3 using the stored mask.
    w2 = W()
    e = cssr_head(w2, 3, 1830, 6)
    clks = []
    for i, (lab, _, _) in enumerate(sats):
        w2.s(i, 15)
        clks.append({"sat": lab, "c0_m": i * 0.0016})
    f2 = l6_frames(199, 0b101_01_00_0, w2.b, alert=True)
    vs.append(vec("l6-clas-mask-carried-to-next-subframe", "l6", frames + f2,
                  {"subframes": 2, "alert": 1,
                   "messages": msgs + [dict(e, clocks=clks, prn=199, service="clas",
                                            facility=1)]},
                  "a clock-only subframe uses the mask of the previous subframe"))
    # Errors: no mask; IOD mismatch.
    w3 = W()
    cssr_head(w3, 3, 1, 6)
    w3.u(0, 15)
    vs.append(vec("l6-clas-no-mask", "l6", l6_frames(194, 0b101_00_01_0, w3.b),
                  {"messages": [], "stopped": [{"prn": 194, "service": "clas",
                                                "reason": "no_mask"}]}, None))
    w4 = W()
    cssr_head(w4, 3, 1, 7)
    vs.append(vec("l6-clas-iod-ssr-mismatch", "l6", frames[:1] + l6_frames(199, 0b101_01_00_0,
                                                                             w4.b),
                  {"stopped": [{"prn": 199, "service": "clas", "reason": "truncated"},
                               {"prn": 199, "service": "clas",
                                "reason": "iod_ssr_mismatch"}]},
                  "the first subframe is cut after one data part (truncated), the next has "
                  "IOD SSR 7 against the mask's 6"))
    return vs


MDC_SYS = [
    {"gnss": 0, "sats": [1, 32], "sigs": [0, 11]},
    {"gnss": 2, "sats": [2], "sigs": [12, 13]},
    {"gnss": 7, "sats": [1, 27], "sigs": [6, 12]},
]


def madoca_vectors():
    flav = "madoca"
    sats = sats_of(flav, MDC_SYS)
    w, m1 = cssr_mask(flav, 1000, 3, MDC_SYS)
    msgs = [m1]
    e = cssr_head(w, 2, 900, 3)
    orbs = []
    for i, (lab, g, _) in enumerate(sats):
        iode = 1023 if g == 2 else 255 - i
        w.u(iode, 10 if g == 2 else 8).s(i - 2, 15).s(2 - i, 13).s(i, 13)
        orbs.append({"sat": lab, "iode": iode, "radial_m": (i - 2) * 0.0016,
                     "along_m": (2 - i) * 0.0064, "cross_m": i * 0.0064})
    msgs.append(dict(e, orbits=orbs))
    e = cssr_head(w, 3, 905, 3, mm=1)
    clks = []
    for i, (lab, _, _) in enumerate(sats):
        w.s(-i * 100, 15)
        clks.append({"sat": lab, "c0_m": -i * 100 * 0.0016})
    msgs.append(dict(e, clocks=clks))
    e = cssr_head(w, 4, 900, 3)
    bs = []
    for i, (lab, _, cells) in enumerate(sats):
        row = []
        for j, sig in enumerate(cells):
            w.s(i - j, 11)
            row.append({"signal": sig, "code_bias_m": (i - j) * 0.02})
        bs.append({"sat": lab, "biases": row})
    msgs.append(dict(e, biases=bs))
    for m in msgs:
        m.update(prn=195, service="madoca", facility=2)
    frames = l6_frames(195, 0b010_10_00_0, w.b)
    return [vec("l6-madoca-bds3-gnss-id-7-and-e6", "l6", frames,
                {"messages": msgs, "unknown_gnss_ids": []},
                "IS-QZSS-MDC-005 GNSS ID 7 (BDS-3, mask position 1 = C19) and Galileo E6 B/C "
                "signal names")]


def iono_vectors():
    w = W().u(1, 12).u(0, 4).u(345600, 20).u(6, 4).u(0, 1).u(2, 4).u(10, 8).u(0, 1)
    w.u(1234, 16).u(2, 5)
    w.u(1, 5).u(0, 1).s(355, 11).u(1395, 12).u(50, 8).u(70, 8)
    w.u(2, 5).u(1, 1).s(-1250, 15).u(14012, 16).u(30, 8)
    cov = {"message": 1, "epoch_s": 345600, "update_interval": 6, "multiple": False,
           "iod_ssr": 2, "region_id": 10, "region_alert": False, "correction_bits": 1234,
           "areas": [{"number": 1, "shape": 0, "lat_deg": 35.5, "lon_deg": 139.5,
                      "span_deg": [5.0, 7.0]},
                     {"number": 2, "shape": 1, "lat_deg": -12.5, "lon_deg": 140.12,
                      "range_km": 300.0}]}
    w.u(2, 12).u(0, 4).u(60, 12).u(6, 4).u(0, 1).u(2, 4).u(10, 8).u(1, 5).u(2, 2)
    counts = [2, 0, 1, 0, 1]
    for n in counts:
        w.u(n, 5)
    stec = []
    for sys, ids in (("G", [5, 31]), ("E", [11]), ("J", [2])):
        for sid in ids:
            w.u(sid, 6).u(10, 6)
            co = stec_poly(w, 2, [sid * 10, -sid, sid, na(10), 0, 0])
            stec.append({"sat": "%s%02d" % (sys, sid), "quality": 10, "correction_type": 2,
                         "coefficients": co})
    corr = {"message": 2, "epoch_s": 60, "update_interval": 6, "iod_ssr": 2, "region_id": 10,
            "area": 1, "stec": stec}
    for m in (cov, corr):
        m.update(prn=196, service="madoca-iono", facility=0)
    frames = l6_frames(196, 0b010_00_10_0, w.b)
    return [vec("l6-madoca-ionospheric-coverage-and-correction", "l6", frames,
                {"messages": [cov, corr]}, "IS-QZSS-MDC-005 section 6.3.2, messages 1 and 2")]


def l6_misc():
    good = l6_frames(194, 0b101_00_00_0, [])[0]
    qznma = l6_frames(194, 0b011_00_00_0, [])[0]
    orphan = l6_frames(194, 0b101_11_00_0, [])[0]
    orphan = bytearray.fromhex(orphan)
    orphan[5] &= 0xFE  # clear the subframe indicator (last bit of the type ID)
    bad = bytearray.fromhex(good)
    bad[0] ^= 0x80
    return [vec("l6-vendors-orphans-and-preamble", "l6",
                [qznma, orphan.hex(), bad.hex(), "00" * 10, good],
                {"frames": 5, "other_vendor": 1, "orphan": 1, "bad_preamble": 1,
                 "bad_length": 1, "subframes": 1, "messages": []},
                "QZNMA skipped, a data part before any subframe start, a wrong preamble, a "
                "short frame; an all-zero subframe holds no message")]


def l6_doc():
    return doc("l6", "IS-QZSS-L6-008 (CLAS) section 4.1; IS-QZSS-MDC-005 (MADOCA-PPP) "
               "sections 4.2 and 6.3",
               clas_vectors() + madoca_vectors() + iono_vectors() + l6_misc())


# ---------------------------------------------------------------- output

def vec(i, decoder, frames, expect, note):
    v = {"id": i, "decoder": decoder, "frames": frames, "expect": expect}
    if note:
        v["note"] = note
    return v


def doc(name, source, vectors):
    return {"format": FORMAT, "set": name, "version": VERSION, "source": source,
            "provenance": PROVENANCE, "generator": GENERATOR, "vectors": vectors}


def render(d):
    return json.dumps(d, indent=1, ensure_ascii=False) + "\n"


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    docs = {"has.json": has_vectors(), "b2b.json": b2b_vectors(), "l6.json": l6_doc()}
    check = "--check" in sys.argv[1:]
    bad = []
    for name, d in docs.items():
        path = os.path.join(here, name)
        text = render(d)
        if check:
            try:
                with open(path, encoding="utf-8") as f:
                    if f.read() != text:
                        bad.append(name)
            except OSError:
                bad.append(name)
        else:
            with open(path, "w", encoding="utf-8") as f:
                f.write(text)
    if bad:
        print("differs from the generator: " + ", ".join(bad), file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
