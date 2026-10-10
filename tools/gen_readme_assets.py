#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the README's themed images from real engine runs.

Every picture under docs/assets/readme/ is written by this script, in a light and a dark
variant, in the visual system of the kshana.dev site (the "Observatory" theme): the same
colour tokens, the same three typefaces (Unbounded for the wordmark, Geist for text, Geist
Mono for labels) and the same founder's mark, recoloured the way the site recolours it.

What each image is drawn from:

* the logo: the founder's mark as an alpha mask (tools/readme-src/kshana-mark-mask.png,
  the exact file the site masks), painted ink with cyan at the hub and the star;
* the hero, the campaign timeline, the L-band waterfall, the coverage map, the solar-system
  view and the LEO pass: the result.json of a run of the engine on a committed scenario,
  made by this script in a temporary directory (nothing is read from a previous run);
* the 0.35 figures (trust-timeline, interference-map, training-track, evidence-pack): real runs
  of the engine on the committed synthetic inputs in examples/ and scenarios/training/ (the
  receiver-trust session, the interference-map sample days with their routes, a training
  scenario's instructor log), and the pack's file list as docs/EVIDENCE-PACKS.md states it. Their
  alt text is the SVG's own <desc>, and --check fails if the README or a doc carries a different one;
* the four flowcharts: the engine's own facts (the scenario-kind count from `kshana kinds`,
  the matrix split from web/data/verification-matrix.json, the LEO chain's hand-off values
  from its run), laid out as vector diagrams.

GitHub strips web fonts, CSS classes and scripts from a README, so every word in every SVG is
converted to outlines here, from the OFL fonts in tools/readme-fonts/, and each SVG is
self-contained. Text shaping is simple: glyph advances plus the fonts' pair kerning.

Usage:
    python3 tools/gen_readme_assets.py [--kshana PATH] [--out docs/assets/readme]
    python3 tools/gen_readme_assets.py --check   # regenerate in memory, fail if a file differs

`--kshana` defaults to $KSHANA_BIN, then `target/release/kshana`, then `kshana` on PATH.
Requires Python 3.10+, fontTools, numpy and Pillow; matplotlib is used only for its
point-in-polygon test when drawing land.
"""
from __future__ import annotations

import argparse
import base64
import csv
import hashlib
import io
import json
import math
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

import numpy as np
from fontTools.pens.svgPathPen import SVGPathPen
from fontTools.ttLib import TTFont
from fontTools.varLib import instancer
from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
FONT_DIR = ROOT / "tools" / "readme-fonts"
DEFAULT_OUT = ROOT / "docs" / "assets" / "readme"
MASK = ROOT / "tools" / "readme-src" / "kshana-mark-mask.png"
LAND = ROOT / "tools" / "ne_110m_land.geojson"
MATRIX = ROOT / "web" / "data" / "verification-matrix.json"
STUDIO_DIR = DEFAULT_OUT / "studio"

# --------------------------------------------------------------------------------------
# Theme: the site's Observatory tokens (web/theme.css via docs/assets/palette.json), both themes.
# --------------------------------------------------------------------------------------


def _hex(c: str) -> tuple[int, int, int]:
    c = c.lstrip("#")
    return int(c[0:2], 16), int(c[2:4], 16), int(c[4:6], 16)


def blend(fg: str, bg: str, a: float) -> str:
    """Solid colour of `fg` at opacity `a` over `bg` (the site's rgba() tokens, flattened)."""
    f, b = _hex(fg), _hex(bg)
    return "#%02X%02X%02X" % tuple(round(f[i] * a + b[i] * (1 - a)) for i in range(3))


# The theme tokens come from docs/assets/palette.json (generated from src/palette.rs and
# held to web/theme.css by tests/palette_sync.rs); only the README art's own extras
# (globe, map, ramps, modelled-tier tint) are set here.
_PAL = json.loads((ROOT / "docs" / "assets" / "palette.json").read_text(encoding="utf-8"))
_TOKENS = ("bg", "bg2", "bg3", "panel", "panel2", "ink", "ink2", "ink3", "ink4",
           "cyan", "magenta", "lime", "amber", "coral")


def _theme(name: str, extras: dict) -> dict:
    p = _PAL[name]
    t = {"name": name, **{k: p[k] for k in _TOKENS}}
    t.update(tim=p["blue"], line_rgb=p["line_rgb"], line_a=tuple(p["line_alpha"]), btn_bg=p["ink"])
    t.update(extras)
    return t


LIGHT = _theme("light", {
    "modelled": "#7F96CC", "globe_rim": "#6C9BFF", "globe_line": "#6F88C0",
    "dot_a": 0.07, "btn_ink": "#FFFFFF",
    "ocean": "#0B1733", "ocean2": "#16284F", "land": "#6F88C0", "land_back": "#243A66",
    # the site's light waterfall ramp (js/home-waterfall.mjs RAMP_LIGHT)
    "ramp": ["#E3E9F5", "#BFDCD3", "#6CC3A8", "#2A8C8C", "#33508A", "#3A0E5C"],
    "soft_a": 0.10,
})
DARK = _theme("dark", {
    "modelled": "#4F6FB0", "globe_rim": "#3F7BFF", "globe_line": "#5A7FD0",
    "dot_a": 0.075, "btn_ink": "#070B16",
    "ocean": "#081229", "ocean2": "#10214A", "land": "#3F63AE", "land_back": "#1A2C57",
    # viridis, the site's dark waterfall ramp (RAMP_DARK)
    "ramp": ["#151C48", "#3B2F7A", "#3B528B", "#21918C", "#5EC962", "#FDE725"],
    "soft_a": 0.14,
})
THEMES = (LIGHT, DARK)


def line(t: dict, level: int = 0, on: str | None = None) -> str:
    return blend(t["line_rgb"], on or t["bg"], t["line_a"][level])


def soft(t: dict, key: str, on: str | None = None, a: float | None = None) -> str:
    return blend(t[key], on or t["bg"], t["soft_a"] if a is None else a)


# --------------------------------------------------------------------------------------
# Fonts: variable OFL fonts instanced per weight; glyph outlines become SVG paths.
# --------------------------------------------------------------------------------------

FONT_FILES = {
    "display": "Unbounded-wght.ttf",
    "sans": "Geist-wght.ttf",
    "mono": "GeistMono-wght.ttf",
}


class Face:
    """One family at one weight: advances, pair kerning and outlines in font units."""

    _cache: dict[tuple[str, int], "Face"] = {}

    @classmethod
    def get(cls, family: str, weight: int) -> "Face":
        key = (family, weight)
        if key not in cls._cache:
            cls._cache[key] = Face(family, weight)
        return cls._cache[key]

    def __init__(self, family: str, weight: int):
        vf = TTFont(FONT_FILES[family] if os.path.isabs(FONT_FILES[family]) else FONT_DIR / FONT_FILES[family])
        self.font = instancer.instantiateVariableFont(vf, {"wght": weight})
        self.id = f"{family[0]}{weight // 100}"
        self.upm = self.font["head"].unitsPerEm
        self.cmap = self.font.getBestCmap()
        self.hmtx = self.font["hmtx"].metrics
        self.glyphset = self.font.getGlyphSet()
        self.paths: dict[str, str] = {}
        self._pairs: dict[tuple[str, str], int] = {}
        self._class_tables: list = []
        self._read_kerning()

    def _read_kerning(self) -> None:
        if "GPOS" not in self.font:
            return
        gpos = self.font["GPOS"].table
        if not gpos.LookupList:
            return
        for lookup in gpos.LookupList.Lookup:
            for st in lookup.SubTable:
                ltype = lookup.LookupType
                if ltype == 9:
                    ltype, st = st.ExtensionLookupType, st.ExtSubTable
                if ltype != 2:
                    continue
                if st.Format == 1:
                    for i, g1 in enumerate(st.Coverage.glyphs):
                        for pvr in st.PairSet[i].PairValueRecord:
                            v = getattr(pvr.Value1, "XAdvance", 0) if pvr.Value1 else 0
                            if v and (g1, pvr.SecondGlyph) not in self._pairs:
                                self._pairs[(g1, pvr.SecondGlyph)] = v
                elif st.Format == 2:
                    self._class_tables.append((
                        set(st.Coverage.glyphs),
                        st.ClassDef1.classDefs if st.ClassDef1 else {},
                        st.ClassDef2.classDefs if st.ClassDef2 else {},
                        st.Class1Record,
                    ))

    def kern(self, a: str, b: str) -> int:
        if (a, b) in self._pairs:
            return self._pairs[(a, b)]
        for cov, cd1, cd2, rec in self._class_tables:
            if a not in cov:
                continue
            c1, c2 = cd1.get(a, 0), cd2.get(b, 0)
            v = rec[c1].Class2Record[c2].Value1
            x = getattr(v, "XAdvance", 0) if v else 0
            if x:
                return x
        return 0

    def glyph(self, ch: str) -> str:
        g = self.cmap.get(ord(ch))
        if g is None:
            raise ValueError(f"{self.id}: no glyph for {ch!r} (U+{ord(ch):04X})")
        return g

    def path(self, gname: str) -> str:
        if gname not in self.paths:
            pen = SVGPathPen(self.glyphset, ntos=lambda v: str(round(v)))
            self.glyphset[gname].draw(pen)
            self.paths[gname] = pen.getCommands()
        return self.paths[gname]

    def layout(self, text: str, size: float, ls_em: float = 0.0) -> tuple[list[tuple[str, float]], float]:
        """Glyph names with x offsets in font units, and the advance width in user units."""
        out, x, prev = [], 0.0, None
        track = ls_em * self.upm
        for ch in text:
            g = self.glyph(ch)
            if prev is not None:
                x += self.kern(prev, g)
            out.append((g, x))
            x += self.hmtx[g][0] + track
            prev = g
        width = (x - (track if text else 0)) * size / self.upm
        return out, width

    def width(self, text: str, size: float, ls_em: float = 0.0) -> float:
        return self.layout(text, size, ls_em)[1]


# --------------------------------------------------------------------------------------
# SVG builder
# --------------------------------------------------------------------------------------


def f(v: float) -> str:
    """A compact number: at most two decimals, no trailing zeros."""
    s = f"{v:.2f}".rstrip("0").rstrip(".")
    return "0" if s in ("-0", "") else s


def _r1(v: float) -> int:
    return int(round(v * 10))


def _n(v10: int) -> str:
    """A tenths-integer as the shortest decimal string ("-0.5" -> "-.5")."""
    s = f"{v10 / 10:.1f}".rstrip("0").rstrip(".")
    if s.startswith("0."):
        s = s[1:]
    elif s.startswith("-0."):
        s = "-" + s[2:]
    return s or "0"


def _pair(a: int, b: int) -> str:
    sa, sb = _n(a), _n(b)
    return sa + ("" if sb.startswith("-") or (sb.startswith(".") and "." in sa) else " ") + sb


def enc(pts, close: bool = False) -> str:
    """Points as a compact relative path at 0.1 px: m/l/h/v, repeated points dropped."""
    cmds: list[list] = []  # [op, a, b]
    last = None
    for x, y in pts:
        X, Y = _r1(x), _r1(y)
        if last is None:
            cmds.append(["M", X, Y])
        else:
            dx, dy = X - last[0], Y - last[1]
            if dx == 0 and dy == 0:
                continue
            op = "h" if dy == 0 else "v" if dx == 0 else "l"
            prev = cmds[-1]
            if op == "h" and prev[0] == "h" and (prev[1] > 0) == (dx > 0):
                prev[1] += dx
            elif op == "v" and prev[0] == "v" and (prev[1] > 0) == (dy > 0):
                prev[1] += dy
            elif op == "l" and prev[0] == "l" and prev[1] * dy == prev[2] * dx and prev[1] * dx >= 0 and prev[2] * dy >= 0:
                prev[1] += dx
                prev[2] += dy
            else:
                cmds.append([op, dx if op != "v" else dy, dy])
        last = (X, Y)
    out = []
    for op, a, b in cmds:
        out.append(op + (_pair(a, b) if op in "Ml" else _n(a)))
    return "".join(out) + ("z" if close else "")


def enc_dots(pts) -> str:
    """Round dots as zero-length strokes: M x y h0 m dx dy h0 ..."""
    out, last = [], None
    for x, y in pts:
        X, Y = _r1(x), _r1(y)
        out.append(("M" + _pair(X, Y)) if last is None else ("m" + _pair(X - last[0], Y - last[1])))
        out.append("h0")
        last = (X, Y)
    return "".join(out)


class Svg:
    def __init__(self, w: float, h: float, title: str, desc: str = ""):
        self.w, self.h = w, h
        self.title, self.desc = title, desc
        self.body: list[str] = []
        self.defs: list[str] = []
        self.glyph_ids: dict[tuple[str, str], str] = {}
        self._n = 0

    def uid(self, p: str) -> str:
        self._n += 1
        return f"{p}{self._n}"

    def add(self, s: str) -> None:
        self.body.append(s)

    def rect(self, x, y, w, h, fill="none", stroke=None, sw=1.0, r=0, extra=""):
        s = f'<rect x="{f(x)}" y="{f(y)}" width="{f(w)}" height="{f(h)}"'
        if r:
            s += f' rx="{f(r)}"'
        s += f' fill="{fill}"'
        if stroke:
            s += f' stroke="{stroke}" stroke-width="{f(sw)}"'
        self.add(s + (f" {extra}" if extra else "") + "/>")

    def line(self, x1, y1, x2, y2, stroke, sw=1.0, dash=None, extra=""):
        s = f'<path d="M{f(x1)} {f(y1)}L{f(x2)} {f(y2)}" stroke="{stroke}" stroke-width="{f(sw)}" fill="none"'
        if dash:
            s += f' stroke-dasharray="{dash}"'
        self.add(s + (f" {extra}" if extra else "") + "/>")

    def poly(self, pts, stroke="none", sw=1.0, fill="none", close=False, dash=None, extra="", join="round"):
        if len(pts) < 2:
            return
        d = enc(pts, close)
        s = f'<path d="{d}" fill="{fill}" stroke="{stroke}" stroke-width="{f(sw)}" stroke-linejoin="{join}" stroke-linecap="round"'
        if dash:
            s += f' stroke-dasharray="{dash}"'
        self.add(s + (f" {extra}" if extra else "") + "/>")

    def circle(self, cx, cy, r, fill="none", stroke=None, sw=1.0, extra=""):
        s = f'<circle cx="{f(cx)}" cy="{f(cy)}" r="{f(r)}" fill="{fill}"'
        if stroke:
            s += f' stroke="{stroke}" stroke-width="{f(sw)}"'
        self.add(s + (f" {extra}" if extra else "") + "/>")

    def text(self, s: str, x: float, y: float, size: float, fill: str, family: str = "sans",
             weight: int = 400, anchor: str = "start", ls: float = 0.0, upper: bool = False,
             opacity: float | None = None) -> float:
        """Draw `s` as outlines with its baseline at y. Returns the advance width."""
        if upper:
            s = s.upper()
        face = Face.get(family, weight)
        glyphs, width = face.layout(s, size, ls)
        if anchor == "middle":
            x -= width / 2
        elif anchor == "end":
            x -= width
        k = size / face.upm
        uses = []
        for g, gx in glyphs:
            if not face.path(g):
                continue  # space
            key = (face.id, g)
            if key not in self.glyph_ids:
                gid = f"{face.id}{len(self.glyph_ids):x}"
                self.glyph_ids[key] = gid
                self.defs.append(f'<path id="{gid}" d="{face.path(g)}"/>')
            uses.append(f'<use href="#{self.glyph_ids[key]}" x="{round(gx)}"/>')
        if uses:
            op = f' opacity="{f(opacity)}"' if opacity is not None else ""
            self.add(f'<g fill="{fill}"{op} transform="translate({f(x)} {f(y)}) scale({k:.5f} {-k:.5f})">{"".join(uses)}</g>')
        return width

    def render(self) -> str:
        head = (f'<svg xmlns="http://www.w3.org/2000/svg" width="{f(self.w)}" height="{f(self.h)}" '
                f'viewBox="0 0 {f(self.w)} {f(self.h)}" role="img" aria-labelledby="t d">'
                f'<title id="t">{esc(self.title)}</title><desc id="d">{esc(self.desc or self.title)}</desc>')
        defs = f'<defs>{"".join(self.defs)}</defs>' if self.defs else ""
        return head + defs + "".join(self.body) + "</svg>\n"


def esc(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace('"', "&quot;")


def png_data_uri(img: Image.Image) -> str:
    buf = io.BytesIO()
    img.save(buf, format="PNG", optimize=True)
    return "data:image/png;base64," + base64.b64encode(buf.getvalue()).decode()


# --------------------------------------------------------------------------------------
# Shared pieces of the site's look
# --------------------------------------------------------------------------------------


def card(s: Svg, t: dict, dots: bool = True, r: float = 22) -> None:
    """The page ground: the theme background, rounded, with the site's faint dot grid."""
    s.rect(0, 0, s.w, s.h, fill=t["bg"], r=r)
    if dots:
        pid = s.uid("dots")
        s.defs.append(f'<pattern id="{pid}" width="22" height="22" patternUnits="userSpaceOnUse">'
                      f'<circle cx="11" cy="11" r="1.1" fill="{blend(t["line_rgb"], t["bg"], t["dot_a"] * 1.6)}"/></pattern>')
        s.rect(0, 0, s.w, s.h, fill=f"url(#{pid})", r=r)
    s.rect(0.5, 0.5, s.w - 1, s.h - 1, stroke=line(t, 0), sw=1, r=r)


def glass(s: Svg, t: dict, x, y, w, h, r=14, fill=None) -> None:
    s.rect(x, y, w, h, fill=fill or t["panel"], stroke=line(t, 1, t["panel"]), sw=1, r=r)


def eyebrow(s: Svg, t: dict, x, y, label: str, color: str | None = None, idx: str | None = None, size=13) -> float:
    """The site's eyebrow: a small square in the domain colour, then mono uppercase."""
    cx = x
    if idx:
        cx += s.text(idx, cx, y, size * 0.92, t["cyan"], "display", 500) + 12
    else:
        s.rect(cx, y - size * 0.62, 8, 8, fill=color or t["cyan"], r=2)
        cx += 18
    cx += s.text(label, cx, y, size, t["ink3"], "mono", 500, ls=0.14, upper=True)
    return cx - x


def window(s: Svg, t: dict, x, y, w, h, title_bits: list[tuple[str, str]], tag: str = "Real run") -> float:
    """The site's instrument window: traffic-light dots, a centred mono title, a status tag."""
    glass(s, t, x, y, w, h, r=16)
    hh = 44
    s.line(x, y + hh, x + w, y + hh, line(t, 0, t["panel"]))
    for i, c in enumerate(("#FF5F57", "#FEBC2E", "#28C840")):
        s.circle(x + 22 + i * 18, y + hh / 2, 5.5, fill=c)
    # centred title from parts
    faces = [(txt, t["ink"] if kind == "b" else t["ink3"], 500 if kind == "b" else 400) for txt, kind in title_bits]
    tw = sum(Face.get("mono", wt).width(txt, 13) for txt, _, wt in faces) + 10 * (len(faces) - 1)
    cx = x + w / 2 - tw / 2
    for txt, col, wt in faces:
        cx += s.text(txt, cx, y + hh / 2 + 4.5, 13, col, "mono", wt) + 10
    if tag:
        tagw = Face.get("mono", 500).width(tag.upper(), 11, 0.08) + 34
        tx = x + w - 14 - tagw
        s.rect(tx, y + hh / 2 - 12, tagw, 24, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=12)
        s.circle(tx + 13, y + hh / 2, 3, fill=t["lime"])
        s.text(tag, tx + 22, y + hh / 2 + 4, 11, t["ink2"], "mono", 500, ls=0.08, upper=True)
    return y + hh


def provenance(s: Svg, t: dict, x, y, text: str, size=12) -> None:
    s.text(text, x, y, size, t["ink3"], "mono", 400)


def nice_ticks(lo: float, hi: float, n: int = 5) -> list[float]:
    span = hi - lo
    if span <= 0:
        return [lo]
    raw = span / n
    mag = 10 ** math.floor(math.log10(raw))
    step = min((m * mag for m in (1, 2, 2.5, 5, 10)), key=lambda st: abs(span / st - n))
    start = math.ceil(lo / step) * step
    out, v = [], start
    while v <= hi + 1e-9:
        out.append(round(v, 10))
        v += step
    return out


def fmt_num(v: float, nd: int = 1) -> str:
    return f"{v:.{nd}f}"


def mission_time(sec: float) -> str:
    sec = int(round(sec))
    return f"T+{sec // 3600:02d}:{sec % 3600 // 60:02d}:{sec % 60:02d}"


# --------------------------------------------------------------------------------------
# Engine
# --------------------------------------------------------------------------------------


class Engine:
    def __init__(self, exe: str, work: Path):
        self.exe, self.work = exe, work
        out = subprocess.run([exe, "--version"], capture_output=True, text=True, check=True).stdout.strip()
        self.version = out.split()[-1]
        self._kinds: list | None = None

    def run(self, scenario: str) -> dict:
        src = ROOT / "scenarios" / f"{scenario}.toml"
        dst = self.work / src.name
        shutil.copyfile(src, dst)
        subprocess.run([self.exe, dst.name], cwd=self.work, capture_output=True, text=True, check=True)
        with open(self.work / f"{scenario}.result.json") as fh:
            return json.load(fh)

    def kinds(self) -> list:
        if self._kinds is None:
            out = subprocess.run([self.exe, "kinds", "--json"], capture_output=True, text=True, check=True).stdout
            self._kinds = json.loads(out)
        return self._kinds


def find_engine(arg: str | None) -> str:
    for cand in (arg, os.environ.get("KSHANA_BIN"), str(ROOT / "target" / "release" / "kshana"), shutil.which("kshana")):
        if cand and Path(cand).exists():
            return cand
    sys.exit("gen_readme_assets: no kshana binary; pass --kshana, set KSHANA_BIN or `cargo build --release`")


def repo_version() -> str:
    for ln in (ROOT / "Cargo.toml").read_text().splitlines():
        if ln.startswith("version"):
            return ln.split('"')[1]
    raise SystemExit("no version in Cargo.toml")


# --------------------------------------------------------------------------------------
# 1. Logo: the exact mark shape, recoloured like the site's .brand-mark
# --------------------------------------------------------------------------------------

# The site paints the mask with two radial gradients over --ink (site.css .brand-mark):
#   radial-gradient(circle at 46.5% 49.5%, var(--cyan) 0 5%, transparent 11%)   the hub
#   radial-gradient(circle at 87.5% 12%,   var(--cyan) 0 4%, transparent 8%)    the star
# A `circle` gradient with no size is `farthest-corner`, so the percentages are of the
# distance from the centre to the farthest corner of the box. Reproduced per pixel.
ACCENTS = ((0.465, 0.495, 0.05, 0.11), (0.875, 0.12, 0.04, 0.08))


def mark_image(t: dict, size: int | None = None) -> Image.Image:
    mask = Image.open(MASK).getchannel("A")
    w, h = mask.size
    yy, xx = np.mgrid[0:h, 0:w].astype(float)
    xx, yy = (xx + 0.5) / w, (yy + 0.5) / h
    accent = np.zeros((h, w))
    for cx, cy, solid, fade in ACCENTS:
        ray = max(math.hypot(ex - cx, ey - cy) for ex in (0, 1) for ey in (0, 1))
        d = np.hypot(xx - cx, yy - cy) / ray
        a = np.clip((fade - d) / (fade - solid), 0, 1)
        accent = accent + a * (1 - accent)  # the first-listed layer sits on top; both are cyan
    ink, cyan = np.array(_hex(t["ink"]), float), np.array(_hex(t["cyan"]), float)
    rgb = ink[None, None, :] * (1 - accent[..., None]) + cyan[None, None, :] * accent[..., None]
    rgba = np.dstack([rgb, np.array(mask, float)]).round().astype(np.uint8)
    img = Image.fromarray(rgba, "RGBA")
    if size and size != w:
        img = img.resize((size, size), Image.LANCZOS)
    return img


def logo_lockup(t: dict) -> Svg:
    """The mark and the word `kshana` in Unbounded 500, the site's nav lockup, as one SVG."""
    mark_h = 132
    size = 64
    face = Face.get("display", 500)
    word_w = face.width("kshana", size, -0.01)
    gap = -12  # the site pulls the text into the mark's transparent margin (margin:-6px -4px ...)
    w = mark_h + gap + word_w + 8
    s = Svg(round(w), mark_h, "Kshana", "The Kshana mark, a compass reticle marking the precise instant, beside the wordmark kshana.")
    s.add(f'<image href="{png_data_uri(mark_image(t))}" x="0" y="0" width="{mark_h}" height="{mark_h}"/>')
    # optical centre: Unbounded's x-height sits on the mark's horizontal axis (49.5 %)
    s.text("kshana", mark_h + gap, mark_h * 0.495 + size * 0.36, size, t["ink"], "display", 500, ls=-0.01)
    return s


# --------------------------------------------------------------------------------------
# Text and chart helpers
# --------------------------------------------------------------------------------------


def wrap(text: str, width: float, size: float, family="sans", weight=400, ls=0.0) -> list[str]:
    face = Face.get(family, weight)
    lines, cur = [], ""
    for word in text.split():
        trial = f"{cur} {word}".strip()
        if cur and face.width(trial, size, ls) > width:
            lines.append(cur)
            cur = word
        else:
            cur = trial
    if cur:
        lines.append(cur)
    return lines


def fit_text(text: str, width: float, size: float, family="sans", weight=400) -> str:
    """Shorten at a word boundary, with an ellipsis, until it fits."""
    face = Face.get(family, weight)
    if face.width(text, size) <= width:
        return text
    words = text.split()
    while words and face.width(" ".join(words) + " …", size) > width:
        words.pop()
    return " ".join(words) + " …"


def paragraph(s: Svg, text: str, x, y, width, size, fill, lh=1.5, family="sans", weight=400) -> float:
    for i, ln in enumerate(wrap(text, width, size, family, weight)):
        s.text(ln, x, y + i * size * lh, size, fill, family, weight)
    return y + len(wrap(text, width, size, family, weight)) * size * lh


PHASE_KEYS = {"nominal": "lime", "jamming": "amber", "spoofing": "magenta", "holdover": "cyan",
              "integrity-alarm": "coral", "recovery": "lime"}


def phase_label(name: str) -> str:
    return name.replace("-", " ").capitalize()


def series_segments(ts, vs):
    """Split a series at None values into runs of (t, v)."""
    runs, cur = [], []
    for tt, v in zip(ts, vs):
        if v is None:
            if cur:
                runs.append(cur)
            cur = []
        else:
            cur.append((tt, v))
    if cur:
        runs.append(cur)
    return runs


def step_points(run, X, Y):
    """A sample-and-hold trace, as the campaign timeline defines it (latest sample at or before)."""
    pts = []
    for i, (tt, v) in enumerate(run):
        if i:
            pts.append((X(tt), Y(run[i - 1][1])))
        pts.append((X(tt), Y(v)))
    return pts


def mini_chart(s: Svg, t: dict, x, y, w, h, ts, vs, lo, hi, limit, bad_above: bool, color: str,
               t0: float, t1: float, log: bool = False) -> None:
    """A telemetry trace in the site's chart-panel style: area, line, dashed limit, bad part in coral."""
    def X(tt):
        return x + (tt - t0) / (t1 - t0) * w

    def Y(v):
        if log:
            v = math.log10(max(v, 10 ** lo))
        return y + h - (min(max(v, lo), hi) - lo) / (hi - lo) * h

    ylim = Y(limit)
    for run in series_segments(ts, vs):
        pts = step_points(run, X, Y)
        area = pts + [(pts[-1][0], y + h), (pts[0][0], y + h)]
        s.poly(area, fill=soft(t, "lime" if color == t["lime"] else ("cyan" if color == t["cyan"] else "amber"), t["panel"], 0.16), close=True, sw=0)
        s.poly(pts, stroke=color, sw=1.8)
        # the part past the limit, redrawn in coral, clipped to the bad side of the limit line
        cid = s.uid("c")
        if bad_above:
            s.defs.append(f'<clipPath id="{cid}"><rect x="{f(x)}" y="{f(y - 4)}" width="{f(w)}" height="{f(ylim - y + 4)}"/></clipPath>')
        else:
            s.defs.append(f'<clipPath id="{cid}"><rect x="{f(x)}" y="{f(ylim)}" width="{f(w)}" height="{f(y + h - ylim + 4)}"/></clipPath>')
        s.poly(pts, stroke=t["coral"], sw=1.8, extra=f'clip-path="url(#{cid})"')
    # gaps (no value): hatched, as the site marks epochs with no protection level
    prev_end = None
    for run in series_segments(ts, vs):
        if prev_end is not None and run[0][0] - prev_end > 0:
            gx0, gx1 = X(prev_end), X(run[0][0])
            s.rect(gx0, y, gx1 - gx0, h, fill=soft(t, "ink4", t["panel"], 0.12))
        prev_end = run[-1][0]
    s.line(x, ylim, x + w, ylim, t["coral"], 1.1, dash="4 4")


# --------------------------------------------------------------------------------------
# Globe: the real constellation, recovered from the engine's ground tracks
# --------------------------------------------------------------------------------------

MU_EARTH = 398600.4418  # km^3/s^2, the run's own body.mu_km3_s2 is used when present


def unit(lat, lon):
    la, lo = math.radians(lat), math.radians(lon)
    return np.array([math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)])


def fit_orbits(cov: dict) -> list[dict]:
    """Each satellite's orbit as a circular two-body orbit: the plane from its ground track
    (rotated into the inertial frame by the body's rotation rate), the radius from the mean
    motion of the track. The worst angular residual is returned so the fit can be stated."""
    body = cov["body"]
    mu = body.get("mu_km3_s2", MU_EARTH)
    rate = body["rotation_rate_deg_s"]
    times = cov["tracks"]["times_s"]
    out = []
    for sat in cov["tracks"]["satellites"]:
        U = np.array([unit(la, lo + rate * tt) for la, lo, tt in zip(sat["lat_deg"], sat["lon_deg"], times)])
        _, _, vt = np.linalg.svd(U)
        n = vt[-1]
        if np.dot(np.cross(U[0], U[1]), n) < 0:
            n = -n
        p1 = U[0] - np.dot(U[0], n) * n
        p1 /= np.linalg.norm(p1)
        p2 = np.cross(n, p1)
        ang = np.unwrap(np.arctan2(U @ p2, U @ p1))
        mm = (ang[-1] - ang[0]) / (times[-1] - times[0])  # rad/s
        a = (mu / mm ** 2) ** (1 / 3)
        resid = float(np.degrees(np.max(np.abs(np.arcsin(np.clip(U @ n, -1, 1))))))
        out.append({"id": sat["id"], "constellation": sat["constellation"], "n": n, "p1": p1, "p2": p2,
                    "a_km": a, "u0": U[0], "resid_deg": resid})
    return out


def land_polygons() -> list[np.ndarray]:
    gj = json.loads(LAND.read_text())
    polys = []
    for feat in gj["features"]:
        geom = feat["geometry"]
        rings = [geom["coordinates"]] if geom["type"] == "Polygon" else geom["coordinates"]
        for poly in rings:
            polys.append(np.array(poly[0]))
    return polys


_LAND_CACHE: dict[float, np.ndarray] = {}


def land_points(step: float) -> np.ndarray:
    """(lat, lon) points on land on a roughly equal-area grid."""
    if step in _LAND_CACHE:
        return _LAND_CACHE[step]
    from matplotlib.path import Path as MPath
    pts = []
    for lat in np.arange(-88 + step / 2, 88, step):
        dl = step / max(0.2, math.cos(math.radians(lat)))
        for lon in np.arange(-180 + dl / 2, 180, dl):
            pts.append((lon, lat))
    pts = np.array(pts)
    inside = np.zeros(len(pts), bool)
    for poly in land_polygons():
        bb = (pts[:, 0] >= poly[:, 0].min()) & (pts[:, 0] <= poly[:, 0].max()) & \
             (pts[:, 1] >= poly[:, 1].min()) & (pts[:, 1] <= poly[:, 1].max())
        if bb.any():
            idx = np.where(bb)[0]
            inside[idx] |= MPath(poly).contains_points(pts[idx])
    _LAND_CACHE[step] = pts[inside][:, ::-1]
    return _LAND_CACHE[step]


class Camera:
    def __init__(self, lat0, lon0, cx, cy, R):
        la, lo = math.radians(lat0), math.radians(lon0)
        self.fwd = unit(lat0, lon0)
        self.east = np.array([-math.sin(lo), math.cos(lo), 0.0])
        self.north = np.array([-math.sin(la) * math.cos(lo), -math.sin(la) * math.sin(lo), math.cos(la)])
        self.cx, self.cy, self.R = cx, cy, R

    def project(self, p):
        """p in Earth radii -> (x, y, depth); depth > 0 faces the viewer."""
        return (self.cx + self.R * float(np.dot(p, self.east)),
                self.cy - self.R * float(np.dot(p, self.north)),
                float(np.dot(p, self.fwd)))

    def occluded(self, p) -> bool:
        x, y, z = self.project(p)
        return z < 0 and math.hypot(x - self.cx, y - self.cy) < self.R


def disp_radius(a_km: float, re_km: float) -> float:
    """Orbit radius in Earth radii, compressed for display (MEO ~1.8, GEO ~2.2)."""
    return (a_km / re_km) ** 0.42


def ellipse_arcs(C, A, B, spans) -> str:
    """Cubic Beziers for the parametric ellipse C + A cos(th) + B sin(th) over each (th0, th1).
    The projected orbit is an affine image of a circle, so the circle's cubic approximation
    maps to the ellipse with the same (sub-pixel) accuracy."""
    def E(th):
        return C + A * math.cos(th) + B * math.sin(th)

    def dE(th):
        return -A * math.sin(th) + B * math.cos(th)

    out = []
    for th0, th1 in spans:
        n = max(1, math.ceil(abs(th1 - th0) / (math.pi / 2)))
        p0 = E(th0)
        seg = [f"M{_pair(_r1(p0[0]), _r1(p0[1]))}"]
        for i in range(n):
            a0 = th0 + (th1 - th0) * i / n
            a1 = th0 + (th1 - th0) * (i + 1) / n
            k = 4 / 3 * math.tan((a1 - a0) / 4)
            q0, q3 = E(a0), E(a1)
            q1, q2 = q0 + k * dE(a0), q3 - k * dE(a1)
            base = (_r1(q0[0]), _r1(q0[1]))
            c = [(_r1(v[0]) - base[0], _r1(v[1]) - base[1]) for v in (q1, q2, q3)]
            seg.append("c" + " ".join(_pair(*xy) for xy in c))
        out.append("".join(seg))
    return "".join(out)


def draw_globe(s: Svg, t: dict, cam: Camera, orbits: list[dict], re_km: float, rx_latlon, mask_deg: float,
               orbit_op=0.55, clip_id: str | None = None) -> dict:
    cx, cy, R = cam.cx, cam.cy, cam.R
    clip = f' clip-path="url(#{clip_id})"' if clip_id else ""
    orbit_col = t["globe_line"] if t["name"] == "dark" else t["ink3"]
    sat_col = t["ink"] if t["name"] == "light" else "#CFE9FF"
    back, front, sats = [], [], []
    C = np.array([cx, cy])
    for o in orbits:
        r = disp_radius(o["a_km"], re_km)
        A = np.array([cam.R * r * float(np.dot(o["p1"], cam.east)), -cam.R * r * float(np.dot(o["p1"], cam.north))])
        B = np.array([cam.R * r * float(np.dot(o["p2"], cam.east)), -cam.R * r * float(np.dot(o["p2"], cam.north))])
        th = np.linspace(0, 2 * math.pi, 721)
        hid = [cam.occluded(r * (o["p1"] * math.cos(a) + o["p2"] * math.sin(a))) for a in th]
        start = 0
        for i in range(1, len(th)):
            if hid[i] != hid[start] or i == len(th) - 1:
                (back if hid[start] else front).append((o, (th[start], th[i])))
                start = i
        sats.append((o, r * o["u0"], (A, B)))
        o["_AB"] = (A, B)
    # glow behind the globe
    gid = s.uid("glow")
    s.defs.append(f'<radialGradient id="{gid}"><stop offset="0.55" stop-color="{t["cyan"]}" stop-opacity="0.16"/>'
                  f'<stop offset="1" stop-color="{t["cyan"]}" stop-opacity="0"/></radialGradient>')
    s.circle(cx, cy, R * 1.55, fill=f"url(#{gid})")

    def rings(spans):
        return "".join(ellipse_arcs(C, *o["_AB"], [sp]) for o, sp in spans)

    back_d = rings(back)
    s.add(f'<path d="{back_d}" fill="none" stroke="{orbit_col}" stroke-width="0.8" opacity="{f(orbit_op * 0.35)}"{clip}/>')
    # the Earth
    oid = s.uid("ocean")
    s.defs.append(f'<radialGradient id="{oid}" cx="0.36" cy="0.32" r="0.78"><stop offset="0" stop-color="{t["ocean2"]}"/>'
                  f'<stop offset="1" stop-color="{t["ocean"]}"/></radialGradient>')
    s.circle(cx, cy, R, fill=f"url(#{oid})")
    # graticule
    grat = []
    for lat in range(-60, 90, 30):
        seg = []
        for lon in range(-180, 181, 5):
            x, y, z = cam.project(unit(lat, lon))
            if z > 0:
                seg.append((x, y))
            elif seg:
                grat.append(seg)
                seg = []
        if seg:
            grat.append(seg)
    for lon in range(-180, 180, 30):
        seg = []
        for lat in range(-90, 91, 5):
            x, y, z = cam.project(unit(lat, lon))
            if z > 0:
                seg.append((x, y))
            elif seg:
                grat.append(seg)
                seg = []
        if seg:
            grat.append(seg)
    d = "".join(enc(sg) for sg in grat if len(sg) > 1)
    s.add(f'<path d="{d}" fill="none" stroke="{t["globe_line"]}" stroke-width="0.6" opacity="0.35"/>')
    # land as dots, dimmer toward the limb
    bins: dict[int, list] = {0: [], 1: [], 2: []}
    for la, lo in land_points(2.1):
        x, y, z = cam.project(unit(la, lo))
        if z <= 0.03:
            continue
        bins[0 if z < 0.35 else 1 if z < 0.7 else 2].append((x, y))
    for b, op in ((0, 0.45), (1, 0.75), (2, 1.0)):
        if bins[b]:
            s.add(f'<path d="{enc_dots(bins[b])}" stroke="{t["land"]}" stroke-width="2.3" stroke-linecap="round" opacity="{op}"/>')
    s.circle(cx, cy, R, stroke=t["globe_rim"], sw=1.6, extra='opacity="0.9"')
    # links from the receiver to satellites above the mask (real geometry, real radii)
    rx_u = unit(*rx_latlon)
    rxx, rxy, _ = cam.project(rx_u)
    rx_km = re_km * rx_u
    links = []
    for o, pd, _ab in sats:
        los = o["a_km"] * o["u0"] - rx_km
        el = math.degrees(math.asin(float(np.dot(los / np.linalg.norm(los), rx_u))))
        if el > mask_deg:
            x, y, z = cam.project(pd)
            links.append(enc([(rxx, rxy), (x, y)]))
    if links:
        s.add(f'<path d="{"".join(links)}" stroke="{t["cyan"]}" stroke-width="1" opacity="0.55" fill="none"{clip}/>')
    front_d = rings(front)
    s.add(f'<path d="{front_d}" fill="none" stroke="{orbit_col}" stroke-width="0.9" opacity="{f(orbit_op)}"{clip}/>')
    dots = [cam.project(pd)[:2] for o, pd, _ab in sats if not cam.occluded(pd)]
    s.add(f'<path d="{enc_dots(dots)}" stroke="{sat_col}" stroke-width="4.2" stroke-linecap="round"{clip}/>')
    s.circle(rxx, rxy, 13, stroke=t["coral"], sw=1.2, extra='opacity="0.85"')
    s.circle(rxx, rxy, 3.6, fill=t["coral"])
    return {"rx": (rxx, rxy), "links": len(links)}


# --------------------------------------------------------------------------------------
# 2. Hero: the site's Home mission console
# --------------------------------------------------------------------------------------


def telemetry_panel(s: Svg, t: dict, x, y, w, h, title, sub, value, unit_, vcol, tl, key, limit_key,
                    lo, hi, bad_above, color, foot_mid) -> None:
    glass(s, t, x, y, w, h)
    s.text(title, x + 16, y + 27, 14, t["ink"], "sans", 500)
    s.text(sub, x + 16, y + 45, 10, t["ink3"], "mono", 500, ls=0.06, upper=True)
    uw = s.text(unit_, x + w - 16, y + 28, 11, t["ink3"], "mono", 400, anchor="end")
    s.text(value, x + w - 20 - uw, y + 30, 23, vcol, "mono", 500, anchor="end")
    ts = tl["t_s"]
    ch = tl["channels"]
    limit = next(v for v in ch[limit_key]["values"] if v is not None)
    cx0, cy0, cw, chh = x + 16, y + 58, w - 32, h - 58 - 34
    s.line(cx0, cy0 + chh, cx0 + cw, cy0 + chh, line(t, 0, t["panel"]))
    mini_chart(s, t, cx0, cy0, cw, chh, ts, ch[key]["values"], lo, hi, limit, bad_above, color, ts[0], ts[-1])
    # phase strip
    for ph in tl["phases"]:
        px0 = cx0 + (ph["t0_s"] - ts[0]) / (ts[-1] - ts[0]) * cw
        px1 = cx0 + (ph["t1_s"] - ts[0]) / (ts[-1] - ts[0]) * cw
        s.rect(px0, cy0 + chh + 5, px1 - px0 - 1, 3, fill=t[PHASE_KEYS.get(ph["name"], "ink4")])
    s.text("T+0", cx0, y + h - 12, 10.5, t["ink3"], "mono")
    s.text(foot_mid, cx0 + cw / 2, y + h - 12, 10.5, t["ink2"], "mono", anchor="middle")
    s.text(f"T+{round(ts[-1] / 60)} min", cx0 + cw, y + h - 12, 10.5, t["ink3"], "mono", anchor="end")


def hero(t: dict, camp: dict, cov: dict, version: str) -> Svg:
    W, H = 1280, 700
    tl = camp["timeline"]
    ch = tl["channels"]
    te = [v for v in ch["time_error_ns"]["values"] if v is not None]
    cn = [v for v in ch["cn0_dbhz"]["values"] if v is not None]
    pl = [v for v in ch["protection_level_m"]["values"] if v is not None]
    guard = ch["guard_ns"]["values"][0]
    floor = ch["cn0_floor_dbhz"]["values"][0]
    al = ch["alert_limit_m"]["values"][0]
    n_ph, n_runs = len(tl["phases"]), camp["reproducibility"]["runs_total"]
    desc = (f"Rehearse the minute GNSS goes dark. Kshana's mission console, drawn from a real run of "
            f"engine v{version}: the chained campaign campaign-jam-spoof-holdover-integrity (seed {camp['seed']}, "
            f"{n_ph} phases, {n_runs} member runs over {mission_time(tl['duration_s'])}) and the "
            f"{cov['total_satellites']} satellites of GPS, Galileo, BeiDou and GLONASS from "
            f"constellation-multi-gnss-coverage, each drawn on the circular two-body orbit recovered from the engine's "
            f"ground track, radii compressed for display. Clock time error peaks at {max(te):.1f} ns against a "
            f"{guard:.0f} ns guard, carrier-to-noise density falls to {min(cn):.1f} dB-Hz against a {floor:.0f} dB-Hz floor, "
            f"and the vertical protection level reaches {max(pl):.1f} m against a {al:.0f} m alert limit.")
    NAV = 64
    s = Svg(W, H + NAV, "Rehearse the minute GNSS goes dark.", desc)
    card(s, t)
    site_nav(s, t, version, NAV)
    s.add(f'<g transform="translate(0 {NAV})">')
    cid = s.uid("clip")
    s.defs.append(f'<clipPath id="{cid}"><rect x="1" y="0" width="{W - 2}" height="{H - 1}" rx="22"/></clipPath>')
    # globe first, so the copy and panels sit over its orbit cloud (as on the site)
    orbits = fit_orbits(cov)
    cam = Camera(24, 8, 770, 382, 136)
    rx = (52.0, 4.0)  # the campaign's receiver (its jamming and integrity phases)
    s.add(f'<g clip-path="url(#{cid})">')
    draw_globe(s, t, cam, orbits, cov["body"]["radius_km"], rx, cov["inputs"]["mask_deg"])
    s.add("</g>")
    # a scrim behind the copy column so the orbits never cross the headline
    gid = s.uid("scrim")
    s.defs.append(f'<linearGradient id="{gid}" x1="0" x2="1"><stop offset="0.55" stop-color="{t["bg"]}" stop-opacity="0.96"/>'
                  f'<stop offset="1" stop-color="{t["bg"]}" stop-opacity="0"/></linearGradient>')
    s.rect(1, 70, 600, H - 71, fill=f"url(#{gid})")

    # console bar
    y0 = 40
    s.line(40, 64, W - 40, 64, line(t, 0))
    x = 40
    s.circle(x + 5, y0 - 4, 4, fill=t["lime"])
    x += 16
    x += s.text("Replay", x, y0, 11.5, t["ink2"], "mono", 500, ls=0.08, upper=True) + 18
    for lab, val in (("Mission", mission_time(tl["duration_s"])), ("Scenario", "campaign-jam-spoof-holdover-integrity")):
        s.line(x - 9, y0 - 12, x - 9, y0 + 2, line(t, 1))
        x += s.text(lab, x, y0, 11.5, t["ink3"], "mono", 400, ls=0.08, upper=True) + 7
        x += s.text(val, x, y0, 12, t["ink"], "mono", 500) + 18
    right = f"Engine v{version} · seed {camp['seed']}"
    tagw = Face.get("mono", 500).width("REAL RUN", 10.5, 0.08) + 30
    s.rect(W - 40 - tagw, y0 - 15, tagw, 22, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=11)
    s.circle(W - 40 - tagw + 12, y0 - 4, 3, fill=t["lime"])
    s.text("Real run", W - 40 - tagw + 20, y0, 10.5, t["ink2"], "mono", 500, ls=0.08, upper=True)
    s.text(right, W - 52 - tagw, y0, 11.5, t["ink3"], "mono", 400, ls=0.06, anchor="end", upper=True)

    # copy column
    x0 = 56
    pill_y = 104
    chip = f"v{version}"
    chipw = Face.get("mono", 500).width(chip, 12) + 16
    rest = "Open source · AGPL-3.0 · by Ashforde"
    restw = Face.get("mono", 400).width(rest, 12)
    s.rect(x0, pill_y - 18, chipw + restw + 30, 30, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=15)
    s.rect(x0 + 5, pill_y - 13, chipw, 20, fill=soft(t, "cyan", t["panel"]), r=10)
    s.text(chip, x0 + 13, pill_y + 1, 12, t["cyan"], "mono", 500)
    s.text(rest, x0 + chipw + 16, pill_y + 1, 12, t["ink2"], "mono", 400)
    size = 68
    lh = size * 0.98
    hy = 196
    for i, parts in enumerate(((("Rehearse the", "ink"),), (("minute ", "ink"), ("GNSS", "ink3")), (("goes dark.", "ink3"),))):
        cx = x0 - 3
        for txt, col in parts:
            cx += s.text(txt, cx, hy + i * lh, size, t[col], "sans", 600, ls=-0.045)
    lede = ("Kshana is an open-source simulator for PNT (positioning, navigation and timing) resilience. "
            "Replay jamming, spoofing and clock holdover when GNSS (Global Navigation Satellite System) "
            "signals fail, and see exactly which results were checked against independent references.")
    ly = paragraph(s, lede, x0, hy + 2 * lh + 52, 480, 16.5, t["ink2"], lh=1.55)
    # the site's two calls to action: the Studio, then the one-line install
    by = ly + 14
    cta = "Launch Kshana Studio  →"
    ctw = Face.get("sans", 500).width(cta, 15.5) + 40
    s.rect(x0, by, ctw, 42, fill=t["btn_bg"], r=12)
    s.text(cta, x0 + 20, by + 26.5, 15.5, t["btn_ink"], "sans", 500)
    cmd = "cargo install kshana"
    cw_ = Face.get("mono", 500).width(cmd, 15)
    ix = x0 + ctw + 12
    s.rect(ix, by, cw_ + 52, 42, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=12)
    s.text("$", ix + 16, by + 26.5, 15, t["ink3"], "mono", 500)
    s.text(cmd, ix + 34, by + 26.5, 15, t["ink"], "mono", 500)
    # event log: the run's own alarm events
    lx, lyy, lw = x0, by + 62, 500
    evs = tl["events"]
    lh2 = 22
    lg_h = 40 + lh2 * len(evs) + 8
    glass(s, t, lx, lyy, lw, lg_h, r=12)
    for i, c in enumerate(("#FF5F57", "#FEBC2E", "#28C840")):
        s.circle(lx + 16 + i * 13, lyy + 18, 4, fill=blend(t["ink4"], t["panel"], 0.5))
    s.text("Event log · the run's own alarms", lx + 62, lyy + 22, 11, t["ink3"], "mono", 400)
    s.line(lx, lyy + 34, lx + lw, lyy + 34, line(t, 0, t["panel"]))
    for i, ev in enumerate(evs):
        yy = lyy + 34 + 22 + i * lh2
        s.text(mission_time(ev["t_s"]), lx + 16, yy, 11.5, t["ink3"], "mono")
        s.text("ALARM" if ev["alarm"] else "EVENT", lx + 104, yy, 11.5, t["coral"] if ev["alarm"] else t["ink2"], "mono", 500)
        s.text(fit_text(ev["label"], lw - 170, 11.5, "mono"), lx + 156, yy, 11.5, t["ink"], "mono")

    # telemetry panels
    px, pw, ph_, gap = 996, 250, 170, 16
    py = 96
    over = sum(1 for v in te if v > guard)
    telemetry_panel(s, t, px, py, pw, ph_, "Clock time error", f"peak · vs {guard:.0f} ns guard", f"{max(te):.1f}", "ns",
                    t["coral"] if max(te) > guard else t["lime"], tl, "time_error_ns", "guard_ns", 0,
                    max(te) * 1.15, True, t["lime"], "outside guard" if over else "inside guard")
    telemetry_panel(s, t, px, py + ph_ + gap, pw, ph_, "C/N0, effective", f"minimum · floor {floor:.0f} dB-Hz",
                    f"{min(cn):.1f}", "dB-Hz", t["cyan"], tl, "cn0_dbhz", "cn0_floor_dbhz", min(0, min(cn) - 2),
                    max(cn) + 4, False, t["cyan"], f"{int(min(ch['tracking']['values']))} of {int(max(ch['tracking']['values']))} tracking")
    telemetry_panel(s, t, px, py + 2 * (ph_ + gap), pw, ph_, "Protection level", f"peak · vertical, AL {al:.0f} m",
                    f"{max(pl):.1f}", "m", t["coral"] if max(pl) > al else t["amber"], tl, "protection_level_m",
                    "alert_limit_m", 0, max(pl) * 1.1, True, t["amber"], "PL above AL" if max(pl) > al else "PL under AL")
    # receiver label near the globe
    rxp = cam.project(unit(*rx))
    lab = "Receiver · 52° N, 4° E"
    lw_ = Face.get("mono", 500).width(lab.upper(), 10.5, 0.08) + 16
    lx_, ly_ = rxp[0] - lw_ - 22, rxp[1] - 11
    s.rect(lx_, ly_, lw_, 22, fill=blend(t["panel"], t["bg"], 0.85), stroke=line(t, 1, t["panel"]), r=6)
    s.text(lab, lx_ + 8, ly_ + 15, 10.5, t["lime"], "mono", 500, ls=0.08, upper=True)
    s.add("</g>")
    return s


NAV_ITEMS = ("Missions", "Capabilities", "Evidence", "Developers", "Docs", "Editions")


def site_nav(s: Svg, t: dict, version: str, nav_h: float) -> None:
    """The site's top bar: the mark and wordmark, the version, the page links, the Studio button."""
    cy = nav_h / 2 + 6
    mk = 40
    s.add(f'<image href="{png_data_uri(mark_image(t, 96))}" x="36" y="{f(cy - mk / 2)}" width="{mk}" height="{mk}"/>')
    x = 36 + mk - 2
    x += s.text("kshana", x, cy + 7, 20, t["ink"], "display", 500, ls=-0.01) + 12
    x += s.text(f"v{version}", x, cy + 4, 11.5, t["ink3"], "mono", 400) + 40
    for item in NAV_ITEMS:
        x += s.text(item, x, cy + 5, 14, t["ink2"], "sans", 400) + 26
    lab = "Launch Kshana Studio"
    bw = Face.get("sans", 500).width(lab, 13.5) + 30
    s.rect(s.w - 40 - bw, cy - 17, bw, 34, fill=t["btn_bg"], r=9)
    s.text(lab, s.w - 40 - bw + 15, cy + 5, 13.5, t["btn_ink"], "sans", 500)


# --------------------------------------------------------------------------------------
# 3a. Campaign timeline: jam -> spoof -> holdover -> integrity
# --------------------------------------------------------------------------------------


def campaign_timeline(t: dict, camp: dict) -> Svg:
    W, H = 1280, 600
    tl = camp["timeline"]
    ch = tl["channels"]
    ts = tl["t_s"]
    T0, T1 = ts[0], tl["duration_s"]
    phases = tl["phases"]
    te = [v for v in ch["time_error_ns"]["values"] if v is not None]
    cn = [v for v in ch["cn0_dbhz"]["values"] if v is not None]
    pl = [v for v in ch["protection_level_m"]["values"] if v is not None]
    guard, floor, al = ch["guard_ns"]["values"][0], ch["cn0_floor_dbhz"]["values"][0], ch["alert_limit_m"]["values"][0]
    names = " → ".join(phase_label(p["name"]) for p in phases)
    desc = (f"The chained campaign campaign-jam-spoof-holdover-integrity, one real run of engine "
            f"(seed {camp['seed']}): {len(phases)} phases ({names}) and {camp['reproducibility']['runs_total']} member runs "
            f"on a {tl['step_s']:.0f} s grid over {mission_time(T1)}. Three lanes: clock time error against a {guard:.0f} ns guard "
            f"(peak {max(te):.1f} ns), effective carrier-to-noise density against a {floor:.0f} dB-Hz floor (minimum {min(cn):.1f} dB-Hz), "
            f"and vertical protection level against a {al:.0f} m alert limit (peak {max(pl):.1f} m), with the run's alarm events: "
            + "; ".join(f"{mission_time(e['t_s'])} {e['label']}" for e in tl["events"]) + ".")
    s = Svg(W, H, "Campaign timeline: jam, spoof, holdover, integrity", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Mission timeline · one chained run")
    s.text("Jam, spoof, hold over, raise the alarm.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{len(phases)} phases · {camp['reproducibility']['runs_total']} member runs · "
           f"{tl['step_s']:.0f} s grid · {mission_time(T1)}", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    wx, wy, ww, wh = 40, 120, W - 80, H - 160
    top = window(s, t, wx, wy, ww, wh, [("kshana", "b"), ("campaign", "n"), ("·", "n"),
                                        ("campaign-jam-spoof-holdover-integrity.toml", "n"), ("·", "n"), (f"seed {camp['seed']}", "n")])
    lx, lw = wx + 150, ww - 150 - 24
    def X(tt):
        return lx + (tt - T0) / (T1 - T0) * lw
    # phase band
    py = top + 18
    for ph in phases:
        x0, x1 = X(ph["t0_s"]), X(ph["t1_s"])
        col = t[PHASE_KEYS.get(ph["name"], "ink4")]
        s.rect(x0, py + 22, x1 - x0 - 2, 5, fill=col, r=1)
        lab = phase_label(ph["name"])
        if Face.get("mono", 500).width(lab.upper(), 11, 0.06) < x1 - x0 - 8:
            s.text(lab, x0 + 2, py + 14, 11, t["ink2"], "mono", 500, ls=0.06, upper=True)
    s.text("Phases", wx + 20, py + 22, 11, t["ink3"], "mono", 500, ls=0.1, upper=True)
    lanes = [
        ("Clock time error", "ns", "time_error_ns", "guard_ns", 0, max(te) * 1.15, True, t["lime"], f"guard {guard:.0f} ns", f"peak {max(te):.1f} ns"),
        ("C/N0, effective", "dB-Hz", "cn0_dbhz", "cn0_floor_dbhz", min(0, min(cn) - 2), max(cn) + 4, False, t["cyan"], f"floor {floor:.0f} dB-Hz", f"min {min(cn):.1f} dB-Hz"),
        ("Protection level", "m", "protection_level_m", "alert_limit_m", 0, max(pl) * 1.1, True, t["amber"], f"alert limit {al:.0f} m", f"peak {max(pl):.1f} m"),
    ]
    ly = py + 44
    lane_bottom = wy + wh - 64
    lane_h = (lane_bottom - ly) / 3
    for i, (title, unit_, key, lim, lo, hi, bad_above, col, limtxt, valtxt) in enumerate(lanes):
        y0 = ly + i * lane_h
        s.line(wx, y0, wx + ww, y0, line(t, 0, t["panel"]))
        s.text(title, wx + 20, y0 + 26, 14, t["ink"], "sans", 500)
        s.text(unit_, wx + 20, y0 + 44, 11, t["ink3"], "mono")
        s.text(valtxt, wx + 20, y0 + lane_h - 16, 12, col if not (bad_above and "peak" in valtxt and max(ch[key]["values"], key=lambda v: v or 0) > ch[lim]["values"][0]) else t["coral"], "mono", 500)
        cy0, chh = y0 + 12, lane_h - 24
        for ph in phases:
            if ph["name"] in ("spoofing", "integrity-alarm"):
                s.rect(X(ph["t0_s"]), cy0, X(ph["t1_s"]) - X(ph["t0_s"]), chh, fill=soft(t, PHASE_KEYS[ph["name"]], t["panel"], 0.06))
        mini_chart(s, t, lx, cy0, lw, chh, ts, ch[key]["values"], lo, hi, ch[lim]["values"][0], bad_above, col, T0, T1)
        s.text(limtxt, lx + lw - 4, (cy0 + chh - (ch[lim]["values"][0] - lo) / (hi - lo) * chh) - 6, 10.5, t["coral"], "mono", anchor="end")
    # events, labelled with the run's own words (staggered so neighbours never collide)
    for i, ev in enumerate(tl["events"]):
        ex = X(ev["t_s"])
        s.line(ex, ly, ex, lane_bottom + 8, t["coral"], 1, dash="2 3")
        short = ev["label"].split(" alarms")[0].split(" (")[0] + " alarm"
        first = i == 0 and len(tl["events"]) > 1
        s.text(short, ex - 6 if first else ex + 6, lane_bottom + 22, 10.5, t["coral"], "mono", 500,
               anchor="end" if first else "start")
    # gaps in the protection level: the run could not form one
    pl_runs = series_segments(ts, ch["protection_level_m"]["values"])
    y2 = ly + 2 * lane_h
    for a_, b_ in zip(pl_runs, pl_runs[1:]):
        gx0, gx1 = X(a_[-1][0]), X(b_[0][0])
        msg = "no protection level formed"
        if gx1 - gx0 > Face.get("mono", 400).width(msg, 10.5) + 20:
            s.text(msg, (gx0 + gx1) / 2, y2 + lane_h / 2 + 4, 10.5, t["ink3"], "mono", anchor="middle")
    # time axis
    ay = wy + wh - 16
    for sec in range(0, int(T1) + 1, 900):
        if T1 - sec < 400:
            continue
        s.text(mission_time(sec), X(sec), ay, 10.5, t["ink3"], "mono", anchor="middle" if sec else "start")
    s.text(mission_time(T1), X(T1), ay, 10.5, t["ink2"], "mono", 500, anchor="end")
    provenance(s, t, 40, H - 16, f"Engine v{camp['engine_version']} · campaign-jam-spoof-holdover-integrity.toml · seed {camp['seed']} · "
               f"run digest {camp['reproducibility']['run_digest'][:12]} · MODELLED composition of existing kinds")
    return s


# --------------------------------------------------------------------------------------
# 3b. L-band waterfall: the spectrum kind, as the site's L-band console
# --------------------------------------------------------------------------------------

BAND_NAMES = {"gps-l1ca": "GPS L1 C/A", "galileo-e1": "Galileo E1", "gps-l2c": "GPS L2C", "gps-l5": "GPS L5",
              "galileo-e5a": "Galileo E5a", "beidou-b1i": "BeiDou B1I", "glonass-l1of": "GLONASS L1OF"}


def band_name(n: str) -> str:
    return BAND_NAMES.get(n, n)


def ramp_rgb(ramp: list[str], x: float) -> tuple[int, int, int]:
    r = [_hex(c) for c in ramp]
    p = min(0.9999, max(0.0, x)) * (len(r) - 1)
    i, fr = int(p), p - int(p)
    return tuple(round(r[i][k] + (r[i + 1][k] - r[i][k]) * fr) for k in range(3))


def waterfall(t: dict, spec: dict) -> Svg:
    W, H = 1280, 640
    wf = spec["waterfall"]
    P = np.array(wf["psd_dbw_per_hz"], float)
    fz = np.array(wf["freq_hz"]) / 1e6
    floor, peak = wf["noise_floor_dbw_per_hz"], wf["peak_dbw_per_hz"]
    above = peak - floor
    gamma = 0.35  # the site's GAMMA: spreads the weak jammers across the ramp
    tlb = {b["name"]: b for b in spec["timeline"]["bands"]}
    thr = spec["receiver"]["tracking_threshold_dbhz"]
    # frequency windows around the bands, merged where they overlap
    wins = []
    for b in spec["bands"]:
        half = max(b["rx_bandwidth_hz"] / 2e6, 3) + 6
        wins.append([b["centre_hz"] / 1e6 - half, b["centre_hz"] / 1e6 + half, [b["name"]]])
    wins.sort()
    merged = []
    for w in wins:
        if merged and w[0] <= merged[-1][1]:
            merged[-1][1] = max(merged[-1][1], w[1])
            merged[-1][2] += w[2]
        else:
            merged.append(w)
    worst = min(spec["timeline"]["bands"], key=lambda b: b["min_cn0_dbhz"])
    jam_txt = "; ".join(f"{j['name']} ({j['waveform']}, on at {j['on_s']:.0f} s" + (f", off at {j['off_s']:.0f} s)" if j.get("off_s") else ")")
                        for j in spec["jammers"])
    desc = (f"The GNSS L band as one power spectral density over {spec['duration_s']:.0f} s, from a real run of the spectrum kind "
            f"(l-band-waterfall-jamming.toml, seed {spec['seed']}, engine v{spec['engine_version']}): frequency across, time down, "
            f"colour for power above the {floor:.1f} dBW/Hz noise floor. Jammers: {jam_txt}. Worst band {band_name(worst['name'])}: "
            f"minimum effective C/N0 {worst['min_cn0_dbhz']:.1f} dB-Hz at {worst['min_cn0_t_s']:.0f} s against a {thr:.0f} dB-Hz tracking floor. "
            + "; ".join(f"{band_name(b['name'])} minimum {b['min_cn0_dbhz']:.1f} dB-Hz" for b in spec["timeline"]["bands"]) + ".")
    s = Svg(W, H, "L-band waterfall: watch a jammer take the band", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "L-band console · the spectrum kind", color=t["amber"])
    s.text("Watch a jammer take the band.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{len(spec['bands'])} bands · {len(spec['jammers'])} jammers · {wf['bin_width_hz'] / 1e6:.0f} MHz × {wf['row_duration_s']:.0f} s cells",
           W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    wx, wy, ww, wh = 40, 120, W - 80, H - 160
    top = window(s, t, wx, wy, ww, wh, [("kshana", "b"), ("spectrum", "n"), ("·", "n"), ("l-band-waterfall-jamming.toml", "n"),
                                        ("·", "n"), (f"seed {spec['seed']}", "n")])
    side_w = 300
    ax_w = 64
    gx0, gx1 = wx + ax_w, wx + ww - side_w - 18
    gy0, gy1 = top + 58, wy + wh - 44
    gap = 22
    spans = [w[1] - w[0] for w in merged]
    avail = gx1 - gx0 - gap * (len(merged) - 1)
    widths = [max(avail * math.sqrt(sp) / sum(math.sqrt(q) for q in spans), 150) for sp in spans]
    k = avail / sum(widths)
    widths = [w_ * k for w_ in widths]
    n_t = P.shape[0]
    t_s = wf["t_s"]
    x = gx0
    for (f0, f1, names), pw in zip(merged, widths):
        cols = np.where((fz >= f0) & (fz <= f1))[0]
        sub = P[:, cols]
        v = np.clip((sub - floor) / above, 0, 1) ** gamma
        img = np.zeros(sub.shape + (3,), np.uint8)
        for i in range(sub.shape[0]):
            for j in range(sub.shape[1]):
                img[i, j] = ramp_rgb(t["ramp"], v[i, j])
        ph = gy1 - gy0
        im = Image.fromarray(img, "RGB").resize((round(pw * 2), round(ph * 2)), Image.NEAREST)
        s.add(f'<image href="{png_data_uri(im.quantize(64, dither=Image.Dither.NONE).convert("RGB"))}" x="{f(x)}" y="{f(gy0)}" '
              f'width="{f(pw)}" height="{f(ph)}" preserveAspectRatio="none"/>')
        s.rect(x, gy0, pw, ph, stroke=line(t, 1, t["panel"]), sw=1)
        fa, fb = fz[cols[0]] - wf["bin_width_hz"] / 2e6, fz[cols[-1]] + wf["bin_width_hz"] / 2e6

        def FX(mhz, x=x, pw=pw, fa=fa, fb=fb):
            return x + (mhz - fa) / (fb - fa) * pw
        # band chips
        cx = x
        seen = []
        for nm in names:
            b = next(bb for bb in spec["bands"] if bb["name"] == nm)
            lab = band_name(nm)
            lw_ = Face.get("mono", 500).width(lab, 11) + 16
            s.rect(cx, gy0 - 36, lw_, 24, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=6)
            s.text(lab, cx + 8, gy0 - 19.5, 11, t["ink"], "mono", 500)
            cx += lw_ + 6
            if b["centre_hz"] not in seen:
                seen.append(b["centre_hz"])
                s.line(FX(b["centre_hz"] / 1e6), gy0, FX(b["centre_hz"] / 1e6), gy1, blend(t["ink"], t["panel"], 0.35), 0.8, dash="2 4")
        for tick in nice_ticks(fa, fb, max(2, int(pw / 70))):
            if fa < tick < fb and FX(tick) - x > 16 and x + pw - FX(tick) > 16:
                s.line(FX(tick), gy1, FX(tick), gy1 + 5, t["ink4"], 1)
                s.text(f"{tick:g}", FX(tick), gy1 + 18, 10.5, t["ink3"], "mono", anchor="middle")
        # jammer switching lines and labels, in the panel that holds the jammer's centre
        for j in spec["jammers"]:
            if not (fa <= j["centre_hz"] / 1e6 <= fb):
                continue
            for when, verb in ((j.get("on_s"), "on"), (j.get("off_s"), "off")):
                if when is None:
                    continue
                yy = gy0 + (when - t_s[0]) / (t_s[-1] + wf["row_duration_s"] - t_s[0]) * ph
                s.line(x, yy, x + pw, yy, "#FFFFFF" if t["name"] == "dark" else t["ink"], 0.9, dash="4 3", extra='opacity="0.8"')
                lab = f"{j['waveform'] if j['waveform'] != 'cw' else 'CW tone'} {verb}"
                lw_ = Face.get("mono", 500).width(lab, 10.5) + 12
                s.rect(x + 6, yy - 20, lw_, 17, fill=t["panel"], r=4, extra='opacity="0.92"')
                s.text(lab, x + 12, yy - 7.5, 10.5, t["ink"], "mono", 500)
        x += pw + gap
        if x < gx1:
            s.text("//", x - gap / 2, gy1 + 18, 10.5, t["ink4"], "mono", anchor="middle")
    # time axis
    for sec in range(0, int(t_s[-1]) + 2, 10):
        yy = gy0 + (sec - t_s[0]) / (t_s[-1] + wf["row_duration_s"] - t_s[0]) * (gy1 - gy0)
        s.line(gx0 - 5, yy, gx0, yy, t["ink4"], 1)
        s.text(f"{sec} s", gx0 - 9, yy + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.text("MHz", gx0 - 9, gy1 + 18, 10.5, t["ink3"], "mono", anchor="end")
    s.text("time", gx0 - 9, gy0 - 19.5, 10.5, t["ink3"], "mono", anchor="end")
    # side panel: every band's worst effective C/N0
    sx = wx + ww - side_w
    s.line(sx, top, sx, wy + wh, line(t, 0, t["panel"]))
    sx += 18
    sw_ = side_w - 36
    s.text("Worst band", sx, top + 30, 11, t["ink3"], "mono", 500, ls=0.1, upper=True)
    s.text(f"min at {worst['min_cn0_t_s']:.0f} s", sx + sw_, top + 30, 11, t["ink3"], "mono", 500, ls=0.1, anchor="end", upper=True)
    vw = s.text(f"{worst['min_cn0_dbhz']:.1f}", sx, top + 80, 44, t["coral"], "mono", 500)
    s.text("dB-Hz", sx + vw + 6, top + 80, 12, t["ink3"], "mono")
    s.text(band_name(worst["name"]), sx + sw_, top + 64, 14, t["ink"], "sans", 500, anchor="end")
    s.text(f"J/S {worst['worst_js_db']:.1f} dB", sx + sw_, top + 82, 11, t["ink3"], "mono", anchor="end")
    by = top + 116
    scale_max = max(b["nominal_cn0_dbhz"] for b in spec["bands"]) + 5
    for b in spec["bands"]:
        tb = tlb[b["name"]]
        lost = tb["min_cn0_dbhz"] < thr
        col = t["coral"] if lost else t["lime"]
        s.text(band_name(b["name"]), sx, by + 4, 11.5, t["ink"], "mono", 500)
        bx, bw = sx + 104, 78
        s.rect(bx, by - 4, bw, 7, fill=soft(t, "ink4", t["panel"], 0.25), r=3.5)
        s.rect(bx, by - 4, max(3, bw * max(0, tb["min_cn0_dbhz"]) / scale_max), 7, fill=col, r=3.5)
        s.line(bx + bw * thr / scale_max, by - 7, bx + bw * thr / scale_max, by + 6, t["ink2"], 1)
        s.text(f"{tb['min_cn0_dbhz']:.1f}", sx + sw_ - 44, by + 4, 11.5, t["ink"], "mono", anchor="end")
        s.text("lost" if lost else "track", sx + sw_, by + 4, 10.5, col, "mono", 500, anchor="end", upper=True)
        by += 30
    s.text("bar: minimum effective C/N0", sx, by + 4, 10, t["ink3"], "mono")
    s.text(f"tick: the {thr:.0f} dB-Hz tracking floor", sx, by + 20, 10, t["ink3"], "mono")
    # colour scale
    ry = by + 52
    s.text("floor", sx, ry + 4, 10.5, t["ink3"], "mono")
    rx0, rw = sx + 44, sw_ - 44 - 60
    gid = s.uid("ramp")
    stops = "".join(f'<stop offset="{i / 10:.1f}" stop-color="#%02X%02X%02X"/>' % ramp_rgb(t["ramp"], (i / 10) ** gamma) for i in range(11))
    s.defs.append(f'<linearGradient id="{gid}">{stops}</linearGradient>')
    s.rect(rx0, ry - 5, rw, 10, fill=f"url(#{gid})", r=3)
    s.text(f"+{above:.0f} dB", sx + sw_, ry + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.text(f"PSD above the {floor:.1f} dBW/Hz floor", sx, ry + 26, 10, t["ink3"], "mono")
    provenance(s, t, 40, H - 16, f"Engine v{spec['engine_version']} · l-band-waterfall-jamming.toml · seed {spec['seed']} · "
               f"MODELLED spectrum from closed-form signal and jammer spectra")
    return s


# --------------------------------------------------------------------------------------
# 3c. Constellation coverage map
# --------------------------------------------------------------------------------------

CONST_KEYS = {"GPS": "cyan", "Galileo": "lime", "BeiDou": "amber", "GLONASS": "magenta"}


def coverage_map(t: dict, cov: dict) -> Svg:
    W, H = 1280, 700
    g = cov["global"]
    grid = cov["grid"]
    mv = np.array(grid["mean_visible"], float)
    lats, lons = grid["lat_deg"], grid["lon_deg"]
    step = cov["inputs"]["grid_step_deg"]
    names = ", ".join(f"{c['name']} {c['satellites']}" for c in cov["constellations"])
    desc = (f"Satellites in view over the whole Earth for one day, from a real run of constellation-design "
            f"(constellation-multi-gnss-coverage.toml, engine run by this generator): {cov['total_satellites']} satellites ({names}). "
            f"Each {step:.0f}-degree cell is shaded by the mean number of satellites above the {cov['inputs']['mask_deg']:.0f}-degree mask "
            f"({mv.min():.1f} to {mv.max():.1f}); the dots are the engine's ground-track samples, one per hour per satellite. "
            f"Global availability {g['availability_pct']:.2f} % at PDOP at or below {cov['inputs']['pdop_threshold']:.0f}, median PDOP {g['pdop']['median']:.2f}, "
            f"mean {g['mean_visible']:.1f} and minimum {g['min_visible']} satellites in view.")
    s = Svg(W, H, "Constellation coverage map: four GNSS constellations over one day", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Constellation design · coverage", color=t["cyan"])
    s.text("Four constellations, one sky.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{cov['total_satellites']} satellites · {len(lats) * len(lons)} cells × {cov['inputs']['epochs']} epochs · "
           f"{cov['inputs']['mask_deg']:.0f}° mask", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    wx, wy, ww, wh = 40, 120, W - 80, H - 160
    top = window(s, t, wx, wy, ww, wh, [("kshana", "b"), ("constellation-design", "n"), ("·", "n"),
                                        ("constellation-multi-gnss-coverage.toml", "n")])
    side_w = 260
    mx0, my0 = wx + 20, top + 20
    mw = ww - side_w - 40
    mh = mw / 2
    if my0 + mh > wy + wh - 36:
        mh = wy + wh - 36 - my0
        mw = mh * 2

    def MX(lon):
        return mx0 + (lon + 180) / 360 * mw

    def MY(lat):
        return my0 + (90 - lat) / 180 * mh
    lo_v, hi_v = math.floor(mv.min()), math.ceil(mv.max())
    img = np.zeros((len(lats), len(lons), 3), np.uint8)
    for i, la in enumerate(lats):
        for j, lo in enumerate(lons):
            img[len(lats) - 1 - i, j] = ramp_rgb(t["ramp"], 0.12 + 0.62 * (mv[i, j] - lo_v) / (hi_v - lo_v))
    im = Image.fromarray(img, "RGB").resize((len(lons) * 8, len(lats) * 8), Image.NEAREST)
    s.add(f'<image href="{png_data_uri(im)}" x="{f(mx0)}" y="{f(my0)}" width="{f(mw)}" height="{f(mh)}" preserveAspectRatio="none"/>')
    # land
    d = "".join(enc([(MX(p[0]), MY(p[1])) for p in poly], close=True) for poly in land_polygons())
    land_fill = "#FFFFFF" if t["name"] == "light" else t["ink"]
    s.add(f'<path d="{d}" fill="{land_fill}" fill-opacity="{0.28 if t["name"] == "light" else 0.12}" '
          f'stroke="{t["ink"] if t["name"] == "light" else t["ink2"]}" stroke-opacity="0.45" stroke-width="0.7"/>')
    # graticule
    for la in range(-60, 90, 30):
        s.line(mx0, MY(la), mx0 + mw, MY(la), t["ink"] if t["name"] == "light" else t["ink2"], 0.5, extra='opacity="0.18"')
    for lo in range(-150, 180, 30):
        s.line(MX(lo), my0, MX(lo), my0 + mh, t["ink"] if t["name"] == "light" else t["ink2"], 0.5, extra='opacity="0.18"')
    s.rect(mx0, my0, mw, mh, stroke=line(t, 1, t["panel"]))
    # ground-track samples
    by_c: dict[str, list] = {}
    for sat in cov["tracks"]["satellites"]:
        by_c.setdefault(sat["constellation"], []).extend(zip(sat["lon_deg"], sat["lat_deg"]))
    halo = t["panel"]
    for cname, pts in by_c.items():
        xy = [(MX(lo), MY(la)) for lo, la in pts]
        s.add(f'<path d="{enc_dots(xy)}" stroke="{halo}" stroke-width="6" stroke-linecap="round" opacity="0.7"/>')
        s.add(f'<path d="{enc_dots(xy)}" stroke="{t[CONST_KEYS.get(cname, "ink")]}" stroke-width="3.6" stroke-linecap="round"/>')
    for la in (-60, 0, 60):
        s.text(f"{abs(la)}°{'N' if la > 0 else 'S' if la < 0 else ''}", mx0 - 6, MY(la) + 4, 10, t["ink3"], "mono", anchor="end")
    # side panel
    sx = wx + ww - side_w
    s.line(sx, top, sx, wy + wh, line(t, 0, t["panel"]))
    sx += 20
    sw_ = side_w - 40
    y = top + 34
    s.text("Constellations", sx, y, 11, t["ink3"], "mono", 500, ls=0.1, upper=True)
    s.text("sats · mean", sx + sw_, y, 10, t["ink4"], "mono", anchor="end")
    y += 26
    for c in cov["constellations"]:
        s.circle(sx + 5, y - 4, 5, fill=t[CONST_KEYS.get(c["name"], "ink")])
        s.text(c["name"], sx + 18, y, 13, t["ink"], "sans", 500)
        s.text(f"{c['satellites']} · {c['mean_visible']:.1f} in view", sx + sw_, y, 11, t["ink3"], "mono", anchor="end")
        y += 26
    y += 12
    s.text("Global, one day", sx, y, 11, t["ink3"], "mono", 500, ls=0.1, upper=True)
    y += 12
    for lab, val in (("availability", f"{g['availability_pct']:.2f} %"), ("median PDOP", f"{g['pdop']['median']:.2f}"),
                     ("mean in view", f"{g['mean_visible']:.1f}"), ("fewest in view", f"{g['min_visible']}")):
        y += 34
        s.text(val, sx, y, 24, t["ink"], "mono", 500)
        s.text(lab, sx + sw_, y, 11, t["ink3"], "mono", anchor="end")
    y += 40
    s.text("cell shade: mean satellites in view", sx, y, 10, t["ink3"], "mono")
    y += 16
    gid = s.uid("ramp")
    stops = "".join(f'<stop offset="{i / 10:.1f}" stop-color="#%02X%02X%02X"/>' % ramp_rgb(t["ramp"], 0.12 + 0.062 * i) for i in range(11))
    s.defs.append(f'<linearGradient id="{gid}">{stops}</linearGradient>')
    s.rect(sx, y, sw_, 9, fill=f"url(#{gid})", r=3)
    s.text(f"{lo_v}", sx, y + 24, 10.5, t["ink3"], "mono")
    s.text(f"{hi_v}", sx + sw_, y + 24, 10.5, t["ink3"], "mono", anchor="end")
    provenance(s, t, 40, H - 16, f"Engine run · constellation-multi-gnss-coverage.toml · deterministic, no seed · MODELLED: two-body orbits, "
               f"spherical Earth, geometry only")
    return s


# --------------------------------------------------------------------------------------
# 3d. Solar-system view
# --------------------------------------------------------------------------------------

def _overlap(a, b) -> bool:
    return not (a[2] <= b[0] or b[2] <= a[0] or a[3] <= b[1] or b[3] <= a[1])


ECL = math.radians(23.4392911)  # IAU J2000 obliquity, to turn the run's equatorial frame to the ecliptic


def solar_system(t: dict, sol: dict) -> Svg:
    W, H = 1280, 700
    bodies = {b["name"]: b for b in sol["bodies"]}
    planets = [b for b in sol["bodies"] if b["class"] in ("planet", "dwarf-planet")]
    au = 149597870700.0
    rmax = max(b["heliocentric_distance_au"] for b in planets)
    moons = [b for b in sol["bodies"] if b["class"] == "moon"]
    n_val = sum(1 for b in planets if b["label"].startswith("VALIDATED"))
    desc = (f"The solar system at the scenario's epoch {sol['epoch']['input']}, from a real run of the solar-system kind "
            f"(solar-system-tour.toml): the Sun, {len(planets)} planets and dwarf planet Pluto seen from above the ecliptic, "
            f"distances compressed logarithmically for display, with each body's one-way light time from the Earth. "
            + "; ".join(f"{b['name']} {b['heliocentric_distance_au']:.2f} au, {b['observer_link']['one_way_light_time_s'] / 60:.1f} light-minutes, {b['label'].split(':')[0].split(' ')[0]}"
                        for b in planets if b["name"] != "Earth")
            + ". Links: " + "; ".join(f"{l['from']} to {l['to']} one-way {l['one_way_light_time_s']:.1f} s" for l in sol["links"]) + ".")
    s = Svg(W, H, "Solar-system view: planets, light times and links", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Solar system · deep-space links", color=t["amber"])
    s.text("Every light-minute, accounted for.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"epoch {sol['epoch']['input'][:10]} · observer {sol['observer']} · {len(sol['bodies'])} bodies", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    wx, wy, ww, wh = 40, 120, W - 80, H - 160
    top = window(s, t, wx, wy, ww, wh, [("kshana", "b"), ("solar-system", "n"), ("·", "n"), ("solar-system-tour.toml", "n")])
    side_w = 430
    cx, cy = wx + (ww - side_w) / 2, top + (wy + wh - top) / 2
    Rmax = min((ww - side_w) / 2, (wy + wh - top) / 2) - 26

    def rad(r_au):
        return Rmax * math.log10(1 + r_au / 0.25) / math.log10(1 + rmax / 0.25)

    def ecl(p):
        x, y, z = p
        return x, y * math.cos(ECL) + z * math.sin(ECL)

    def P(p):
        x, y = ecl(p)
        r = math.hypot(x, y) / au
        if r == 0:
            return cx, cy
        k = rad(r) / r
        return cx + x / au * k, cy - y / au * k

    for ring in (1, 5, 10, 30):
        s.circle(cx, cy, rad(ring), stroke=line(t, 0, t["panel"]), sw=1, extra='stroke-dasharray="2 5"')
        s.text(f"{ring} au", cx + rad(ring) * 0.707 + 4, cy + rad(ring) * 0.707 + 12, 10, t["ink4"], "mono")
    for b in planets:
        pts = [P(p) for p in b["track_m"]]
        s.poly(pts, stroke=blend(t["ink2"], t["panel"], 0.5), sw=1)
    s.circle(cx, cy, 9, fill=t["amber"])
    s.circle(cx, cy, 16, fill=t["amber"], extra='opacity="0.18"')
    boxes = []  # placed label boxes, so no two labels overlap
    for b in planets:
        x, y = P(b["position_m"])
        boxes.append((x - 7, y - 7, x + 7, y + 7))
    link_labels = []
    for l in sol["links"]:
        a, b = bodies[l["from"]], bodies[l["to"]]
        (x1, y1), (x2, y2) = P(a["position_m"]), P(b["position_m"])
        if math.hypot(x2 - x1, y2 - y1) > 20:
            s.line(x1, y1, x2, y2, t["cyan"], 1.4, dash="5 4")
            lab = f"{l['one_way_light_time_s'] / 60:.1f} min"
            lw_ = Face.get("mono", 500).width(lab, 10.5) + 12
            for frac in (0.5, 0.35, 0.65, 0.25, 0.75):
                mx_, my_ = x1 + (x2 - x1) * frac, y1 + (y2 - y1) * frac
                bx_ = (mx_ - lw_ / 2, my_ - 10, mx_ + lw_ / 2, my_ + 8)
                if not any(_overlap(bx_, o) for o in boxes):
                    break
            boxes.append(bx_)
            link_labels.append((mx_, my_, lw_, lab))
    for mx_, my_, lw_, lab in link_labels:
        s.rect(mx_ - lw_ / 2, my_ - 10, lw_, 18, fill=t["panel"], stroke=soft(t, "cyan", t["panel"], 0.5), r=5)
        s.text(lab, mx_, my_ + 3.5, 10.5, t["cyan"], "mono", 500, anchor="middle")
    for b in planets:
        x, y = P(b["position_m"])
        val = b["label"].startswith("VALIDATED")
        col = t["lime"] if val else t["modelled"]
        s.circle(x, y, 6 if b["name"] in ("Jupiter", "Saturn") else 4.5, fill=t["ink"], stroke=col, sw=2)
        tw_ = Face.get("sans", 500).width(b["name"], 12)
        for dx, dy in ((10, -7), (10, 16), (-10 - tw_, -7), (-10 - tw_, 16), (-tw_ / 2, -14), (-tw_ / 2, 24)):
            bx_ = (x + dx, y + dy - 11, x + dx + tw_, y + dy + 3)
            if not any(_overlap(bx_, o) for o in boxes[:-0 or None] if o != (x - 7, y - 7, x + 7, y + 7)):
                break
        boxes.append(bx_)
        s.text(b["name"], x + dx, y + dy, 12, t["ink"], "sans", 500)
    # side panel: light-time table
    sx = wx + ww - side_w
    s.line(sx, top, sx, wy + wh, line(t, 0, t["panel"]))
    sx += 22
    sw_ = side_w - 44
    y = top + 34
    s.text("Body", sx, y, 10.5, t["ink3"], "mono", 500, ls=0.1, upper=True)
    s.text("Distance", sx + 170, y, 10.5, t["ink3"], "mono", 500, ls=0.1, upper=True, anchor="end")
    s.text("Light time", sx + 280, y, 10.5, t["ink3"], "mono", 500, ls=0.1, upper=True, anchor="end")
    s.text("Label", sx + sw_, y, 10.5, t["ink3"], "mono", 500, ls=0.1, upper=True, anchor="end")
    y += 10
    for b in planets:
        y += 27
        s.line(sx, y - 18, sx + sw_, y - 18, line(t, 0, t["panel"]))
        s.text(b["name"], sx, y, 13, t["ink"], "sans", 500)
        s.text(f"{b['heliocentric_distance_au']:.2f} au", sx + 170, y, 12, t["ink2"], "mono", anchor="end")
        lt = b["observer_link"]["one_way_light_time_s"] if b["name"] != "Earth" else None
        s.text("observer" if lt is None else (f"{lt / 60:.1f} min" if lt < 3600 else f"{lt / 3600:.2f} h"), sx + 280, y, 12, t["ink2"], "mono", anchor="end")
        val = b["label"].startswith("VALIDATED")
        tag = "VALIDATED" if val else "MODELLED"
        col = t["lime"] if val else t["modelled"]
        tw_ = Face.get("mono", 500).width(tag, 9.5, 0.06) + 12
        s.rect(sx + sw_ - tw_, y - 12, tw_, 16, fill=soft(t, "lime" if val else "modelled", t["panel"], 0.14), r=4)
        s.text(tag, sx + sw_ - 6, y, 9.5, col, "mono", 500, ls=0.06, anchor="end")
    y += 30
    s.text(f"{n_val} of {len(planets)} bodies here VALIDATED against JPL Horizons", sx, y, 10.5, t["ink3"], "mono")
    y += 16
    s.text(f"(Standish tables); {len(moons)} moons also in the run.", sx, y, 10.5, t["ink3"], "mono")
    provenance(s, t, 40, H - 16, f"Engine run · solar-system-tour.toml · deterministic, no seed · distances drawn on a log scale, "
               f"light times as computed")
    return s


# --------------------------------------------------------------------------------------
# 3e. A LEO pass against the GNSS sky
# --------------------------------------------------------------------------------------


def leo_pass(t: dict, lp: dict) -> Svg:
    W, H = 1280, 640
    sat = lp["satellites"][0]
    band = sat["bands"][0]
    cmp_ = lp["comparison"]
    gn = lp["gnss"]
    ps = sat["pass"]
    series = sat["series"]
    desc = (f"One low-Earth-orbit (LEO) pass from a real run of the leo-pass kind (leo-pass-iridium.toml, engine run by this generator): "
            f"{sat['id']} at {sat['altitude_m'] / 1000:.0f} km, {band['name']} band at {band['frequency_hz'] / 1e6:.0f} MHz, seen by an air user "
            f"at {lp['user']['lat_deg']:.0f}° N {abs(lp['user']['lon_deg']):.0f}° W. Above the {lp['user']['mask_deg']:.0f}° mask for "
            f"{ps['duration_above_mask_s']:.0f} s, maximum elevation {ps['max_elevation_deg']:.1f}° at {ps['tca_s']:.0f} s. Carrier-to-noise density "
            f"peaks at {band['peak_cn0_dbhz']:.1f} dB-Hz (median {band['median_cn0_dbhz']:.1f}), {cmp_['leo_peak_above_gnss_median_db']:.1f} dB above the "
            f"GNSS median of {gn['median_cn0_dbhz']:.1f} dB-Hz from {gn['satellites_in_view']} GPS satellites in view ({gn['min_cn0_dbhz']:.1f} to "
            f"{gn['max_cn0_dbhz']:.1f} dB-Hz); Doppler reaches {band['max_abs_doppler_hz'] / 1000:.1f} kHz.")
    s = Svg(W, H, "A LEO pass: carrier-to-noise density against the GNSS sky", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "LEO PNT · one pass, link budget", color=t["magenta"])
    s.text("A LEO pass shouts where GNSS whispers.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{sat['id']} · {sat['altitude_m'] / 1000:.0f} km · {band['name']} {band['frequency_hz'] / 1e6:.0f} MHz · {lp['step_s']:.0f} s steps",
           W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    wx, wy, ww, wh = 40, 120, W - 80, H - 160
    top = window(s, t, wx, wy, ww, wh, [("kshana", "b"), ("leo-pass", "n"), ("·", "n"), ("leo-pass-iridium.toml", "n")])
    side_w = 280
    cx0, cx1 = wx + 70, wx + ww - side_w - 30
    cy0, cy1 = top + 30, top + 260
    ey0, ey1 = cy1 + 46, wy + wh - 44
    T = lp["duration_s"]

    def X(tt):
        return cx0 + tt / T * (cx1 - cx0)
    lo, hi = 30, 90

    def Y(v):
        return cy1 - (v - lo) / (hi - lo) * (cy1 - cy0)
    for v in range(lo, hi + 1, 10):
        s.line(cx0, Y(v), cx1, Y(v), line(t, 0, t["panel"]))
        s.text(f"{v}", cx0 - 8, Y(v) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.text("C/N0 dB-Hz", cx0 - 8, cy0 - 14, 10.5, t["ink3"], "mono", anchor="start")
    # the LEO pass: area first, so the GNSS traces stay visible over it
    pts = [(X(p["t_s"]), Y(p["bands"][0]["cn0_dbhz"])) for p in series if p["visible"] and p["bands"]]
    area = pts + [(pts[-1][0], cy1), (pts[0][0], cy1)]
    s.poly(area, fill=soft(t, "magenta", t["panel"], 0.08), close=True)
    # the GNSS sky: every GPS satellite in view
    gcol = t["ink3"]
    for g in gn["satellites"]:
        pts = [(X(p["t_s"]), Y(p["cn0_dbhz"])) for p in g["series"] if p.get("cn0_dbhz") is not None]
        s.poly(pts, stroke=gcol, sw=1, extra='opacity="0.7"')
    s.line(cx0, Y(gn["median_cn0_dbhz"]), cx1, Y(gn["median_cn0_dbhz"]), gcol, 1, dash="4 4")
    s.text(f"GNSS median {gn['median_cn0_dbhz']:.1f}", cx1 - 4, Y(gn["median_cn0_dbhz"]) + 16, 10.5, t["ink2"], "mono", anchor="end")
    s.text(f"{gn['satellites_in_view']} GPS L1 satellites", cx0 + 8, Y(gn["max_cn0_dbhz"]) - 8, 10.5, t["ink2"], "mono")
    s.poly(pts, stroke=t["magenta"], sw=2.4)
    px_, py_ = X(ps["tca_s"]), Y(band["peak_cn0_dbhz"])
    s.circle(px_, py_, 4.5, fill=t["magenta"])
    s.text(f"peak {band['peak_cn0_dbhz']:.1f} dB-Hz at {ps['tca_s']:.0f} s", px_ + 10, py_ - 6, 11.5, t["magenta"], "mono", 500)
    # the gap to the GNSS median at the peak
    s.line(px_, py_ + 8, px_, Y(gn["median_cn0_dbhz"]) - 2, t["magenta"], 1, dash="2 3")
    s.text(f"+{cmp_['leo_peak_above_gnss_median_db']:.1f} dB", px_ + 8, (py_ + Y(gn["median_cn0_dbhz"])) / 2 + 4, 11, t["magenta"], "mono", 500)
    # AOS / LOS
    for tt, lab in ((ps["aos_s"], "AOS"), (ps["los_s"], "LOS")):
        s.line(X(tt), cy0, X(tt), ey1, t["ink4"], 1, dash="2 4")
        s.text(lab, X(tt) + 4, cy0 + 10, 10, t["ink3"], "mono", 500)
    # elevation and Doppler lane
    s.text("elevation °", cx0 - 8, ey0 - 12, 10.5, t["ink3"], "mono")
    s.text("Doppler kHz", cx1, ey0 - 12, 10.5, t["cyan"], "mono", anchor="end")
    s.line(cx0, ey1, cx1, ey1, line(t, 1, t["panel"]))
    emax = 90

    def YE(v):
        return ey1 - v / emax * (ey1 - ey0)
    dmax = band["doppler_envelope_hz"] / 1000 * 1.05

    def YD(v):
        return (ey0 + ey1) / 2 - v / dmax * (ey1 - ey0) / 2
    s.line(cx0, YD(0), cx1, YD(0), line(t, 0, t["panel"]))
    el = [(X(p["t_s"]), YE(max(0, p["elevation_deg"]))) for p in series]
    s.poly(el, stroke=t["ink2"], sw=1.6)
    s.line(cx0, YE(lp["user"]["mask_deg"]), cx1, YE(lp["user"]["mask_deg"]), t["coral"], 1, dash="3 3")
    s.text(f"mask {lp['user']['mask_deg']:.0f}°", cx0 + 6, YE(lp["user"]["mask_deg"]) - 4, 10, t["coral"], "mono")
    dp = [(X(p["t_s"]), YD(p["bands"][0]["doppler_hz"] / 1000)) for p in series if p["visible"] and p["bands"]]
    s.poly(dp, stroke=t["cyan"], sw=1.6)
    for v in (0, 30, 60, 90):
        s.text(f"{v}", cx0 - 8, YE(v) + 4, 10, t["ink3"], "mono", anchor="end")
    for v in (-30, 0, 30):
        if abs(v) < dmax:
            s.text(f"{v:+d}" if v else "0", cx1 + 8, YD(v) + 4, 10, t["cyan"], "mono")
    for tt in range(0, int(T) + 1, 150):
        s.text(f"{tt} s", X(tt), ey1 + 18, 10.5, t["ink3"], "mono", anchor="middle" if 0 < tt < T else ("start" if tt == 0 else "end"))
    # side panel
    sx = wx + ww - side_w
    s.line(sx, top, sx, wy + wh, line(t, 0, t["panel"]))
    sx += 20
    sw_ = side_w - 40
    y = top + 34
    s.text("This pass", sx, y, 11, t["ink3"], "mono", 500, ls=0.1, upper=True)
    for lab, val in (("above the mask", f"{ps['duration_above_mask_s']:.0f} s"),
                     ("max elevation", f"{ps['max_elevation_deg']:.1f}°"),
                     ("peak C/N0", f"{band['peak_cn0_dbhz']:.1f}"),
                     ("above GNSS max", f"{cmp_['leo_seconds_above_gnss_max']:.0f} s"),
                     ("max |Doppler|", f"{band['max_abs_doppler_hz'] / 1000:.1f} kHz"),
                     ("iono at peak", f"{band['iono_delay_at_peak_m']:.2f} m")):
        y += 44
        s.text(val, sx, y, 24, t["ink"], "mono", 500)
        s.text(lab, sx + sw_, y, 11, t["ink3"], "mono", anchor="end")
    y += 36
    s.text(f"{band['source']}", sx, y, 10, t["ink3"], "mono")
    provenance(s, t, 40, H - 16, f"Engine run · leo-pass-iridium.toml · deterministic, no seed · MODELLED: pass geometry and per-band link budget "
               f"from stated EIRPs")
    return s


# --------------------------------------------------------------------------------------
# 4. Flowcharts, as vector diagrams in the site's style
# --------------------------------------------------------------------------------------


def node(s: Svg, t: dict, x, y, w, h, kicker: str, title: str, lines: list[str], color: str,
         mono: bool = True, strong: bool = False) -> None:
    glass(s, t, x, y, w, h, r=14, fill=soft(t, _key_of(t, color), t["panel"], 0.07) if strong else None)
    if strong:
        s.rect(x, y, w, h, stroke=color, sw=1.3, r=14)
    s.rect(x + 16, y + 17, 8, 8, fill=color, r=2)
    s.text(kicker, x + 32, y + 25, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    s.text(title, x + 16, y + 52, 17, t["ink"], "sans", 600, ls=-0.01)
    yy = y + 76
    for ln in lines:
        if ln == "":
            yy += 8
            continue
        s.text(ln, x + 16, yy, 12 if mono else 13.5, t["ink2"], "mono" if mono else "sans", 400)
        yy += 19


def _key_of(t: dict, color: str) -> str:
    for k in ("cyan", "magenta", "lime", "amber", "coral", "modelled"):
        if t[k] == color:
            return k
    return "cyan"


def arrow(s: Svg, t: dict, pts, color: str | None = None, sw: float = 1.4, dash: str | None = None) -> None:
    color = color or t["ink3"]
    s.poly(pts, stroke=color, sw=sw, dash=dash)
    (x1, y1), (x2, y2) = pts[-2], pts[-1]
    ang = math.atan2(y2 - y1, x2 - x1)
    a, L = math.radians(26), 9
    p1 = (x2 - L * math.cos(ang - a), y2 - L * math.sin(ang - a))
    p2 = (x2 - L * math.cos(ang + a), y2 - L * math.sin(ang + a))
    s.poly([p1, (x2, y2), p2], fill=color, close=True, stroke=color, sw=1)


def chip(s: Svg, t: dict, x, y, label: str, color: str | None = None, size=11.5, family="mono", h=26) -> float:
    w = Face.get(family, 500).width(label, size) + (30 if color else 20)
    s.rect(x, y, w, h, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=h / 2)
    tx = x + 10
    if color:
        s.circle(x + 13, y + h / 2, 3.5, fill=color)
        tx = x + 22
    s.text(label, tx, y + h / 2 + size * 0.36, size, t["ink"], family, 500)
    return w


def flow_pipeline(t: dict, n_kinds: int, version: str) -> Svg:
    W, H = 1280, 636
    desc = (f"How a run flows. A scenario TOML file (a kind, a seed and its parameters) goes into the engine, kshana {version}, "
            f"through the api::run_toml dispatch over {n_kinds} scenario kinds, deterministic from scenario, seed and engine version. "
            "The engine writes result.json, chart.svg, report.html and report.json, a table.csv for the kinds that define one, "
            "and on request SP3, CCSDS OMM and OEM, CZML, KML, GeoJSON, STK and SigMF exports; a suite writes study.json and study.html. "
            "Those files feed Kshana Studio in the browser, an AI assistant through the kshana-mcp server, and continuous integration.")
    s = Svg(W, H, "How a run flows: scenario, engine, outputs, consumers", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "How a run flows")
    s.text("One scenario in. Evidence out.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    y0 = 136
    # front doors
    doors = ["Command line", "Python", "JavaScript + WebAssembly", "MCP server", "JetBrains plugin"]
    s.text("Front doors, one engine", 330, y0 + 17, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    cx = 330
    for d in doors:
        cx += chip(s, t, cx, y0 + 28, d, size=11) + 8
    ny = y0 + 84
    nh = 336
    node(s, t, 40, ny, 250, nh, "Input · .toml", "Scenario", [
        "clock-holdover.toml:", "seed = 42", "threshold_ns = 20.0", "", "[gnss]", "windows = [", "  nominal 0-600 s,", "  denied 600-7200 s ]",
        "", "[clock_quantum]", "[clock_classical]"], t["amber"])
    node(s, t, 330, ny, 260, nh, f"Engine · v{version}", "kshana", [
        "api::run_toml", f"typed dispatch over {n_kinds} kinds", "", "error models, estimators,", "figures of merit", "",
        "deterministic:", "scenario + seed + version", "→ the same bytes, every run"], t["cyan"], strong=True)
    outs = [("result.json", "every figure, its unit and provenance"), ("chart.svg", "the run's chart"),
            ("report.html · report.json", "the printable report"), ("table.csv", "for the kinds that define one"),
            ("exports", "SP3 · OMM · OEM · CZML · KML"), ("", "GeoJSON · STK .e · SigMF"), ("suite", "study.json + study.html")]
    ox, ow = 632, 300
    glass(s, t, ox, ny, ow, nh, r=14)
    s.rect(ox + 16, ny + 17, 8, 8, fill=t["lime"], r=2)
    s.text("Output · files", ox + 32, ny + 25, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    s.text("Beside the scenario", ox + 16, ny + 52, 17, t["ink"], "sans", 600, ls=-0.01)
    yy = ny + 84
    for name, what in outs:
        if name:
            s.text(name, ox + 16, yy, 12.5, t["ink"], "mono", 500)
            yy += 17
        s.text(what, ox + 16, yy, 11.5, t["ink3"], "mono")
        yy += 21
    cons = [("Kshana Studio", "in the browser, as WebAssembly;", "nothing is uploaded", t["cyan"]),
            ("kshana-mcp", "your AI assistant runs the engine", "over MCP and reads the JSON", t["magenta"]),
            ("CI", "rerun and diff the result:", "a moved number fails the build", t["lime"])]
    cx0, cw = 974, 266
    ch_ = (nh - 2 * 14) / 3
    for i, (nm, l1, l2, col) in enumerate(cons):
        yy = ny + i * (ch_ + 14)
        glass(s, t, cx0, yy, cw, ch_, r=14)
        s.rect(cx0 + 16, yy + 17, 8, 8, fill=col, r=2)
        s.text("Consumer", cx0 + 32, yy + 25, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
        s.text(nm, cx0 + 16, yy + 50, 16, t["ink"], "sans", 600)
        s.text(l1, cx0 + 16, yy + 70, 11.5, t["ink2"], "mono")
        s.text(l2, cx0 + 16, yy + 86, 11.5, t["ink2"], "mono")
        arrow(s, t, [(ox + ow, ny + nh / 2), (ox + ow + 20, ny + nh / 2), (ox + ow + 20, yy + ch_ / 2), (cx0 - 2, yy + ch_ / 2)])
    arrow(s, t, [(290, ny + nh / 2), (328, ny + nh / 2)], t["cyan"], 1.8)
    arrow(s, t, [(590, ny + nh / 2), (630, ny + nh / 2)], t["cyan"], 1.8)
    arrow(s, t, [(460, y0 + 56), (460, ny - 2)], t["ink3"])
    s.text("MCP: Model Context Protocol · CI: continuous integration · SP3: Standard Product 3 · OMM / OEM: CCSDS Orbit Mean-elements / Ephemeris Message",
           40, H - 34, 11, t["ink3"], "mono")
    s.text("CZML / KML: Cesium / Keyhole Markup Language · STK: Systems Tool Kit · SigMF: Signal Metadata Format · CCSDS: Consultative Committee for Space Data Systems",
           40, H - 16, 11, t["ink3"], "mono")
    return s


def flow_architecture(t: dict, n_kinds: int, summary: dict) -> Svg:
    W, H = 1280, 620
    layers = [
        ("Time and frames", "timescales · jd2 · precession", "nutation · cio · frames · eop", t["cyan"]),
        ("Clocks and timing", "allan · clock_state · holdover", "telecom_timing · slot_timing", t["cyan"]),
        ("Inertial and fusion", "inertial · fusion · kalman", "mapmatch · gravimeter · altpnt", t["lime"]),
        ("GNSS and integrity", "gnss_sim · pvt · raim · sbas", "jamming · spectrum · spoof_*", t["amber"]),
        ("Astrodynamics", "sgp4 · tle · propagator · forces", "orbit_determination · maneuver", t["magenta"]),
        ("LEO PNT", "leo_signal · leo_pass", "leo_navmsg · leo_fusion · chain", t["magenta"]),
        ("Moon, Mars, deep space", "lunar_* · mars_pnt · radiometric", "deepspace_od · ccsds_tdm", t["modelled"]),
        ("Missions and studies", "campaign · constellation", "passes · resilience · study", t["coral"]),
    ]
    desc = (f"Kshana's architecture in layers. Five front doors (command line, Python, JavaScript and WebAssembly, the MCP server and the "
            f"JetBrains plugin) reach one api::run_toml, a typed dispatch over {n_kinds} kinds. Beneath it sit eight domain layers: "
            + "; ".join(f"{a} ({b}, {c})" for a, b, c, _ in layers)
            + f". All of them rest on a shared core (types, scenario, the run record) and are cross-referenced by the verification module, "
            f"the machine-checked matrix of {summary['total']} capabilities that is the single source of truth for every VALIDATED, "
            f"MODELLED or PARTNER label.")
    s = Svg(W, H, "Architecture: front doors, one dispatch, eight layers, one ledger", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Architecture")
    s.text("One engine, many front doors.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    x0, x1 = 40, W - 40 - 250
    y = 130
    s.text("Front doors", x0, y + 18, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    cx = x0 + 120
    centres = []
    for d in ("Command line", "Python wheel", "JavaScript + WebAssembly", "MCP server", "JetBrains plugin"):
        w_ = chip(s, t, cx, y, d, size=11.5, h=28)
        centres.append(cx + w_ / 2)
        cx += w_ + 8
    y += 50
    for xx in centres:
        arrow(s, t, [(xx, y - 18), (xx, y + 8)], t["ink4"], 1)
    y += 12
    glass(s, t, x0, y, x1 - x0, 60, r=14, fill=soft(t, "cyan", t["panel"], 0.08))
    s.rect(x0, y, x1 - x0, 60, stroke=t["cyan"], sw=1.2, r=14)
    s.text("api::run_toml", x0 + 20, y + 37, 20, t["ink"], "mono", 500)
    s.text(f"typed dispatch over {n_kinds} kinds · one TOML in, one RunOutput out (json, svg, summary, csv)",
           x0 + 210, y + 36, 13, t["ink2"], "mono")
    y += 76
    cols, gap = 4, 12
    grid_y = y
    cw = (x1 - x0 - gap * (cols - 1)) / cols
    chh = 104
    for i, (name, l1, l2, col) in enumerate(layers):
        r_, c_ = divmod(i, cols)
        xx, yy = x0 + c_ * (cw + gap), y + r_ * (chh + gap)
        glass(s, t, xx, yy, cw, chh, r=12)
        s.rect(xx + 14, yy + 16, 8, 8, fill=col, r=2)
        s.text(name, xx + 30, yy + 25, 14.5, t["ink"], "sans", 600)
        s.text(l1, xx + 14, yy + 56, 11, t["ink2"], "mono")
        s.text(l2, xx + 14, yy + 76, 11, t["ink2"], "mono")
    y += 2 * chh + gap + 14
    glass(s, t, x0, y, x1 - x0, 54, r=12)
    s.text("Shared core", x0 + 20, y + 33, 14.5, t["ink"], "sans", 600)
    s.text("types · scenario · reproducible: scenario + seed + engine version → the same bytes", x0 + 150, y + 33, 12, t["ink2"], "mono")
    y_end = y + 54
    # the ledger, beside everything
    lx = x1 + 18
    ly0 = 192
    glass(s, t, lx, ly0, W - 40 - lx, y_end - ly0, r=14, fill=soft(t, "lime", t["panel"], 0.06))
    s.rect(lx, ly0, W - 40 - lx, y_end - ly0, stroke=t["lime"], sw=1.2, r=14)
    s.rect(lx + 16, ly0 + 17, 8, 8, fill=t["lime"], r=2)
    s.text("verification.rs", lx + 32, ly0 + 25, 10.5, t["ink3"], "mono", 500, ls=0.06)
    s.text("The ledger", lx + 16, ly0 + 54, 20, t["ink"], "sans", 600)
    yy = ly0 + 84
    for ln in ("one machine-checked", "matrix, the single", "source of truth for", "every label", ""):
        if ln:
            s.text(ln, lx + 16, yy, 12.5, t["ink2"], "mono")
        yy += 20
    for lab, key, col in (("VALIDATED", "validated", t["lime"]), ("MODELLED", "modelled", t["modelled"]), ("PARTNER", "partner_owned", t["amber"])):
        yy += 34
        s.text(f"{summary[key]}", lx + 16, yy, 28, col, "mono", 500)
        s.text(lab, lx + 96, yy - 2, 11, t["ink2"], "mono", 500, ls=0.1)
    yy += 30
    s.text(f"of {summary['total']} capabilities", lx + 16, yy, 12, t["ink3"], "mono")
    for i in range(2):
        rowy = grid_y + i * (chh + gap) + chh / 2
        arrow(s, t, [(x1 + 2, rowy), (lx - 2, rowy)], t["lime"], 1, dash="3 3")
    s.text(f"Module names are the crate's own (src/). {summary['validated']} VALIDATED, {summary['modelled']} MODELLED, "
           f"{summary['partner_owned']} PARTNER: web/data/verification-matrix.json", 40, H - 18, 11, t["ink3"], "mono")
    return s


def flow_leo_chain(t: dict, chain: dict) -> Svg:
    W, H = 1280, 560
    sig, ps, nm, fu, pp = chain["signal"], chain["pass"], chain["navmsg"], chain["fusion"], chain["ppp"]
    ho = chain["handoffs"]
    g_only = next(c for c in pp["cases"] if c["n_leo"] == 0)
    w_leo = next(c for c in pp["cases"] if c["n_leo"] > 0)
    desc = (f"The LEO PNT chain from a real run of leo-pnt-chain (leo-pnt-end-to-end.toml): the signal stage ({sig['design']} at "
            f"{sig['centre_hz'] / 1e6:.3f} MHz, {sig['tracked_component']} tracked at {sig['chip_rate_hz'] / 1e6:.2f} Mchip/s) hands to the pass stage "
            f"({ps['altitude_km']:.0f} km, tracked C/N0 peak {ps['peak_tracked_cn0_dbhz']:.1f} dB-Hz), which hands to the navigation message "
            f"({nm['model']}, {nm['fit_interval_s']:.0f} s fit, representation SISRE {nm['representation_sisre_rms_m'] * 1000:.2f} mm RMS, "
            f"{nm['sisre_rms_m']:.3f} m with orbit determination), which feeds the fused fix (GNSS only {fu['gnss']['rms_error_3d_m']:.2f} m RMS 3D, "
            f"GNSS plus LEO {fu['fused']['rms_error_3d_m']:.2f} m) and precise point positioning (convergence {g_only['median_convergence_min']:.1f} min "
            f"GNSS only, {w_leo['median_convergence_min']:.1f} min with {w_leo['n_leo']} LEO satellites). {len(ho)} values are handed between stages.")
    s = Svg(W, H, "The LEO chain: signal, pass, navigation message, fused PVT and PPP", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "LEO PNT · leo-pnt-end-to-end", color=t["magenta"])
    s.text("From a signal to a fix, every value handed on.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{len(ho)} values handed between stages · MODELLED", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    stages = [
        ("leo-signal", "Signal", [f"{sig['design']}", f"{sig['centre_hz'] / 1e6:.3f} MHz", f"{sig['tracked_component']} at {sig['chip_rate_hz'] / 1e6:.2f} Mchip/s",
                                  f"{sig['in_band_fraction'] * 100:.1f} % power in band"], t["amber"]),
        ("leo-pass", "Pass", [f"LEO at {ps['altitude_km']:.0f} km, {ps['inclination_deg']:.1f}°", f"max elevation {ps['max_elevation_deg']:.0f}°",
                              f"tracked C/N0 peak {ps['peak_tracked_cn0_dbhz']:.1f}", f"code jitter {ps['median_code_jitter_m']:.3f} m median"], t["cyan"]),
        ("leo-navmsg", "Navigation message", [f"{nm['model']}", f"{nm['fit_interval_s']:.0f} s fit, {nm['update_period_s']:.0f} s update",
                                              f"representation {nm['representation_sisre_rms_m'] * 1000:.2f} mm RMS", f"with OD: SISRE {nm['sisre_rms_m']:.3f} m"], t["magenta"]),
        ("leo-pvt · leo-ppp", "Fused PVT and PPP", [f"RMS 3D {fu['gnss']['rms_error_3d_m']:.2f} → {fu['fused']['rms_error_3d_m']:.2f} m",
                                                    f"PDOP {fu['gnss']['median_pdop']:.2f} → {fu['fused']['median_pdop']:.2f}",
                                                    f"PPP {g_only['median_convergence_min']:.1f} → {w_leo['median_convergence_min']:.1f} min",
                                                    f"(GNSS only → + {w_leo['n_leo']} LEO)"], t["lime"]),
    ]
    n = len(stages)
    gap = 56
    x0, y0 = 40, 150
    w_ = (W - 80 - gap * (n - 1)) / n
    h_ = 190
    for i, (k, title, lines, col) in enumerate(stages):
        x = x0 + i * (w_ + gap)
        node(s, t, x, y0, w_, h_, k, title, lines, col, strong=(i == n - 1))
        if i < n - 1:
            arrow(s, t, [(x + w_ + 4, y0 + h_ / 2), (x + w_ + gap - 4, y0 + h_ / 2)], t["ink3"], 1.6)
    # the hand-offs, grouped by edge, from the run's own list
    edges: dict[tuple[str, str], list] = {}
    for h in ho:
        edges.setdefault((h["from"], h["to"]), []).append(h)
    y = y0 + h_ + 40
    s.text("Hand-offs, read from the run", x0, y, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    y += 12
    colw = (W - 80) / 2
    for i, ((a, b), hs) in enumerate(edges.items()):
        cx = x0 + (i % 2) * colw
        cy = y + (i // 2) * 88
        s.text(f"{a} → {b}", cx, cy + 20, 12, t["ink"], "mono", 500)
        for j, h in enumerate(hs[:3]):
            v = h["value"]
            unit_ = h["unit"]
            if unit_ == "Hz":
                vs = f"{v / 1e6:.3f} MHz"
            elif unit_ == "chip/s":
                vs = f"{v / 1e6:.2f} Mchip/s"
            elif unit_ == "1":
                vs = f"{v:.3f}"
            else:
                vs = f"{v:.3f} {unit_}" if abs(v) < 100 else f"{v:.1f} {unit_}"
            q = fit_text(h["quantity"], colw - 150, 11, "mono")
            s.text(q, cx + 12, cy + 40 + j * 16, 11, t["ink3"], "mono")
            s.text(vs, cx + colw - 30, cy + 40 + j * 16, 11, t["ink2"], "mono", 500, anchor="end")
    return s


def flow_verification(t: dict, matrix: dict) -> Svg:
    W, H = 1280, 560
    sm = matrix["summary"]
    row = next(r for r in matrix["rows"] if "sgp4_verification" in (r.get("tests") or ""))
    kinds: dict[tuple[str, str], int] = {}
    for r in matrix["rows"]:
        kinds[(r["status"], r["oracle_kind"])] = kinds.get((r["status"], r["oracle_kind"]), 0) + 1
    desc = (f"How a capability earns its label. Each row of the verification matrix names a capability, the oracle it is checked "
            f"against, the test that runs the check in continuous integration, and the label that follows. A row may be VALIDATED only with "
            f"an independent external oracle; otherwise it is MODELLED, or PARTNER when a hardware partner owns it. Example: "
            f"{row['capability']}, oracle {row['oracle']}, test tests/sgp4_verification.rs, label {row['status']}. Live counts: "
            f"{sm['validated']} VALIDATED, {sm['modelled']} MODELLED, {sm['partner_owned']} PARTNER of {sm['total']} rows.")
    s = Svg(W, H, "The verification flow: capability, oracle, test, ledger label", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Evidence · the verification matrix")
    s.text("Validated, not asserted.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{sm['total']} rows · generated from src/verification.rs", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    stages = [
        ("1 · capability", "What the engine claims", ["a requirement, a module,", "a stated capability", "", "e.g. SGP4/SDP4 propagation", "(src/sgp4.rs)"], t["cyan"]),
        ("2 · oracle", "What it is checked against", ["real data, an independent", "implementation or published", "reference vectors", "", "e.g. AIAA 2006-6753 vectors"], t["amber"]),
        ("3 · test", "Where the check runs", ["a test in tests/, run in", "CI on every change", "", "e.g. tests/sgp4_verification.rs", "666 vectors, worst 4.12 mm"], t["magenta"]),
        ("4 · ledger label", "What a reader sees", ["VALIDATED: independent", "external oracle agrees", "MODELLED: said out loud", "PARTNER: a partner owns it", "", ], t["lime"]),
    ]
    n = len(stages)
    gap = 44
    x0, y0 = 40, 136
    w_ = (W - 80 - gap * (n - 1)) / n
    h_ = 196
    for i, (k, title, lines, col) in enumerate(stages):
        x = x0 + i * (w_ + gap)
        node(s, t, x, y0, w_, h_, k, title, lines, col, strong=(i == n - 1))
        if i < n - 1:
            arrow(s, t, [(x + w_ + 4, y0 + h_ / 2), (x + w_ + gap - 4, y0 + h_ / 2)], t["ink3"], 1.6)
    # the invariant
    y = y0 + h_ + 34
    glass(s, t, x0, y, W - 80, 52, r=12)
    s.rect(x0 + 16, y + 22, 8, 8, fill=t["coral"], r=2)
    s.text("The rule CI enforces: a row may be VALIDATED only with an independent external oracle. "
           f"Every one of the {sm['validated']} VALIDATED rows is ExternalDataset.", x0 + 34, y + 31, 13, t["ink"], "sans", 500)
    # the split
    y += 82
    s.text("The ledger today", x0, y, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    y += 16
    bw = W - 80
    xx = x0
    for lab, key, col in (("VALIDATED", "validated", t["lime"]), ("MODELLED", "modelled", t["modelled"]), ("PARTNER", "partner_owned", t["amber"])):
        w = bw * sm[key] / sm["total"]
        s.rect(xx, y, max(w - 3, 2), 16, fill=col, r=4)
        xx += w
    y += 44
    xx = x0
    for lab, key, col in (("VALIDATED", "validated", t["lime"]), ("MODELLED", "modelled", t["modelled"]), ("PARTNER", "partner_owned", t["amber"])):
        vw = s.text(f"{sm[key]}", xx, y, 26, col, "mono", 500)
        xx += vw + 10
        xx += s.text(lab, xx, y - 3, 11, t["ink2"], "mono", 500, ls=0.1) + 44
    s.text(f"of {sm['total']} capabilities", W - 40, y - 3, 12, t["ink3"], "mono", anchor="end")
    return s


def mcp_tools() -> list[str]:
    """The tools the MCP server serves: each `fn` after a `#[tool(` attribute in its source."""
    names, in_attr = [], False
    for ln in (ROOT / "mcp" / "kshana-mcp" / "src" / "server.rs").read_text().splitlines():
        tt = ln.strip()
        if tt.startswith("#[tool("):
            in_attr = True
        elif in_attr and tt.startswith("fn "):
            names.append(tt[3:].split("(")[0])
            in_attr = False
    return sorted(names)


def surface_card(s: Svg, t: dict, x, y, w, h, kicker: str, title: str, cmd: str, note: str, color: str) -> None:
    glass(s, t, x, y, w, h, r=14)
    s.rect(x + 16, y + 17, 8, 8, fill=color, r=2)
    s.text(kicker, x + 32, y + 25, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    s.text(title, x + 16, y + 50, 16, t["ink"], "sans", 600, ls=-0.01)
    s.text(fit_text(cmd, w - 32, 11.5, "mono"), x + 16, y + 72, 11.5, t["cyan"], "mono", 500)
    s.text(fit_text(note, w - 32, 11.5, "mono"), x + 16, y + 90, 11.5, t["ink3"], "mono")


def architecture(t: dict, n_kinds: int, summary: dict, n_tools: int, version: str) -> Svg:
    """The open engine at the centre, every surface around it, the Pro overlay depending on it."""
    W, H = 1280, 840
    left = [
        ("Terminal", "Command line", "cargo install kshana", "kshana scenario.toml", t["cyan"]),
        ("Rust", "Rust library", "cargo add kshana", "kshana::api::run_toml", t["cyan"]),
        ("Notebooks", "Python", "pip install kshana", "kshana.run(toml)", t["lime"]),
        ("Browser", "WebAssembly + Kshana Studio", "npm install kshana", "Studio: kshana.dev, nothing uploaded", t["lime"]),
    ]
    right = [
        ("AI assistant", "MCP server", "cargo install kshana-mcp", f"{n_tools} tools over the same library", t["magenta"]),
        ("Container", "Docker image", "ghcr.io/ashfordeou/kshana-mcp", "the MCP server, no Rust toolchain", t["magenta"]),
        ("IDE", "JetBrains plugin", "Marketplace: \"Kshana\"", "right-click a .toml, run it", t["amber"]),
    ]
    domains = ["Signals and spectrum", "Clocks and timing", "Inertial and fusion", "GNSS and integrity",
               "Orbits and constellations", "Low-Earth-orbit PNT", "Moon, Mars, deep space", "Campaigns and studies"]
    desc = (f"Kshana's architecture: one open engine at the centre, kshana {version} under the AGPL-3.0, with api::run_toml, a "
            f"typed dispatch over {n_kinds} kinds, and the verification ledger of {summary['total']} capabilities "
            f"({summary['validated']} VALIDATED, {summary['modelled']} MODELLED, {summary['partner_owned']} PARTNER). Around it, every "
            "surface runs the same engine: " + "; ".join(f"{b} ({c})" for _, b, c, _, _ in left + right)
            + ". Below it, Kshana Pro, a proprietary overlay that depends on the open engine as a library and never forks it, "
            "and adds no physical model.")
    s = Svg(W, H, "Architecture: one open engine, every surface around it, Pro on top", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Architecture")
    s.text("One open engine. Every surface runs it.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    cw_, ch_, gap = 300, 104, 14
    y0 = 136
    ex0, ex1 = 40 + cw_ + 60, W - 40 - cw_ - 60
    ey0, ey1 = y0, y0 + 4 * ch_ + 3 * gap
    # engine
    glass(s, t, ex0, ey0, ex1 - ex0, ey1 - ey0, r=16, fill=soft(t, "cyan", t["panel"], 0.07))
    s.rect(ex0, ey0, ex1 - ex0, ey1 - ey0, stroke=t["cyan"], sw=1.4, r=16)
    s.rect(ex0 + 18, ey0 + 19, 8, 8, fill=t["cyan"], r=2)
    s.text("Open engine · AGPL-3.0", ex0 + 34, ey0 + 27, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    s.text("kshana", ex0 + 18, ey0 + 68, 30, t["ink"], "display", 500, ls=-0.01)
    s.text(f"v{version}", ex1 - 18, ey0 + 27, 11.5, t["ink3"], "mono", anchor="end")
    yy = ey0 + 100
    for ln, col in ((f"api::run_toml", t["ink"]), (f"typed dispatch over {n_kinds} kinds", t["ink2"]),
                    ("scenario + seed + version → the same bytes", t["ink2"])):
        s.text(ln, ex0 + 18, yy, 12.5, col, "mono", 500 if col == t["ink"] else 400)
        yy += 20
    # domain chips, two columns
    yy += 8
    dw = (ex1 - ex0 - 36 - 8) / 2
    for i, d in enumerate(domains):
        r_, c_ = divmod(i, 2)
        dx, dy = ex0 + 18 + c_ * (dw + 8), yy + r_ * 32
        s.rect(dx, dy, dw, 26, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=8)
        s.text(fit_text(d, dw - 16, 11, "mono"), dx + 10, dy + 17, 11, t["ink2"], "mono", 400)
    yy += 4 * 32 + 10
    s.line(ex0 + 18, yy, ex1 - 18, yy, line(t, 0, t["panel"]))
    yy += 24
    x = ex0 + 18
    for lab, key, col in (("VALIDATED", "validated", t["lime"]), ("MODELLED", "modelled", t["modelled"]), ("PARTNER", "partner_owned", t["amber"])):
        x += s.text(f"{summary[key]}", x, yy + 4, 20, col, "mono", 500) + 6
        x += s.text(lab, x, yy + 2, 10, t["ink2"], "mono", 500, ls=0.1) + 16
    s.text(f"ledger of {summary['total']}", ex1 - 18, yy + 2, 11, t["ink3"], "mono", anchor="end")
    # surfaces
    for i, (k, ti, cmd, note, col) in enumerate(left):
        y = y0 + i * (ch_ + gap)
        surface_card(s, t, 40, y, cw_, ch_, k, ti, cmd, note, col)
        arrow(s, t, [(40 + cw_ + 2, y + ch_ / 2), (ex0 - 3, y + ch_ / 2)], t["ink4"], 1.2)
    rx0 = W - 40 - cw_
    for i, (k, ti, cmd, note, col) in enumerate(right):
        y = y0 + i * (ch_ + gap)
        surface_card(s, t, rx0, y, cw_, ch_, k, ti, cmd, note, col)
        arrow(s, t, [(rx0 - 2, y + ch_ / 2), (ex1 + 3, y + ch_ / 2)], t["ink4"], 1.2)
    # the fourth right slot: scenario files, the one input every surface shares
    y = y0 + 3 * (ch_ + gap)
    glass(s, t, rx0, y, cw_, ch_, r=14)
    s.rect(rx0, y, cw_, ch_, stroke=line(t, 2, t["panel"]), sw=1, r=14, extra='stroke-dasharray="4 4"')
    s.rect(rx0 + 16, y + 17, 8, 8, fill=t["ink3"], r=2)
    s.text("One input", rx0 + 32, y + 25, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    s.text("Scenario files", rx0 + 16, y + 50, 16, t["ink"], "sans", 600, ls=-0.01)
    s.text("the same .toml runs on", rx0 + 16, y + 72, 11.5, t["ink2"], "mono")
    s.text("every surface, same bytes out", rx0 + 16, y + 90, 11.5, t["ink2"], "mono")
    # Pro overlay, below, depending on the engine
    py0 = ey1 + 56
    ph = 150
    px0, px1 = 40, W - 40
    glass(s, t, px0, py0, px1 - px0, ph, r=16, fill=soft(t, "magenta", t["panel"], 0.05))
    s.rect(px0, py0, px1 - px0, ph, stroke=t["magenta"], sw=1.2, r=16, extra='stroke-dasharray="6 5"')
    s.rect(px0 + 18, py0 + 19, 8, 8, fill=t["magenta"], r=2)
    s.text("Proprietary overlay · under contract", px0 + 34, py0 + 27, 10.5, t["ink3"], "mono", 500, ls=0.12, upper=True)
    s.text("Kshana Pro: the same engine, amplified", px0 + 18, py0 + 60, 20, t["ink"], "sans", 600, ls=-0.02)
    pro = [("Depends on the open engine", "as a library; never forks it"),
           ("No new physics", "adds no physical model, changes none"),
           ("Re-derivable", "every Pro number from open runs")]
    cw3 = (px1 - px0 - 36 - 24) / 3
    for i, (a, b) in enumerate(pro):
        bx = px0 + 18 + i * (cw3 + 12)
        s.rect(bx, py0 + 80, cw3, 52, fill=t["panel"], stroke=line(t, 1, t["panel"]), r=10)
        s.text(a, bx + 14, py0 + 101, 13, t["ink"], "sans", 500)
        s.text(b, bx + 14, py0 + 121, 11, t["ink3"], "mono")
    mid = (ex0 + ex1) / 2
    arrow(s, t, [(mid, py0 - 2), (mid, ey1 + 4)], t["magenta"], 1.6)
    s.text("depends on, never forks", mid + 12, (py0 + ey1) / 2 + 4, 11, t["magenta"], "mono", 500)
    s.text("MCP: Model Context Protocol · PNT: positioning, navigation and timing · AGPL-3.0: GNU Affero General Public License v3 · "
           "Pro wording from docs/PRO.md", 40, H - 18, 11, t["ink3"], "mono")
    return s


# The five papers live on arXiv (checked against export.arxiv.org/api/query on 2026-09-30),
# each with the engine command behind it: the study example that regenerates its artifact, or
# the scenario kind the paper is built on. Titles, dates and categories are arXiv's.
PAPERS = [
    ("2606.22054", "2026-06-20", "eess.SP", "Anticipating the Optimism Gap: Predicting Distribution-Shift Degradation of "
     "RF-Impairment Detectors from In-Distribution Statistics", "cargo run --release --example optimism_study", "amber", "Regenerate"),
    ("2606.24210", "2026-06-23", "eess.SP", "A Conditional Timing Protection Level: Holdover-Limited Undetected Time Error "
     "Under GNSS Spoofing", "cargo run --release --example tpl_jammertest", "coral", "Regenerate"),
    ("2607.05415", "2026-06-22", "cs.CR", "How Stable Is a PNT Resilience Score? Decision-Instability of Single-Number "
     "Resilience Ratings under Framework-Aligned Weighting", "cargo run --release --example resilience_report", "lime", "Regenerate"),
    ("2607.02566", "2026-06-29", "eess.SP", "Earth-baseline VLBI restores the observability of a lunar surface station in "
     "joint orbit-and-clock determination", "kshana example lunar-joint-od-clock", "modelled", "Engine kind"),
    ("2607.06212", "2026-07-07", "astro-ph.EP", "The Cost of Lunar South-Polar Geometry, and Surface Beacons as the Efficient "
     "Fix: A Dilution-of-Precision Analysis", "kshana example lunar-beacon", "cyan", "Engine kind"),
]


def research(t: dict) -> Svg:
    W = 1280
    desc = ("Research built on the open engine: five papers on arXiv, each with the command that regenerates its numbers. "
            + " ".join(f"arXiv:{i} ({d}, {c}): {ti}; {lab.lower()}: {cmd}." for i, d, c, ti, cmd, _, lab in PAPERS))
    gap = 16
    cols = [3, 2]
    heights, i = [], 0
    for n in cols:
        cw = (W - 80 - gap * (n - 1)) / n
        heights.append(56 + 22 * max(len(wrap(PAPERS[i + c][3], cw - 32, 16, "sans", 600)) for c in range(n)) + 78)
        i += n
    H = 128 + sum(heights) + gap * (len(cols) - 1) + 50
    s = Svg(W, H, "Research: five papers on arXiv, each with the engine command behind it", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Research")
    s.text("Published, and built on the open engine.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{len(PAPERS)} papers on arXiv", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    y = 128
    i = 0
    for n, chh in zip(cols, heights):
        cw = (W - 80 - gap * (n - 1)) / n
        for c in range(n):
            aid, date, cat, title, cmd, key, lab = PAPERS[i]
            x = 40 + c * (cw + gap)
            glass(s, t, x, y, cw, chh, r=14)
            s.rect(x + 16, y + 17, 8, 8, fill=t[key], r=2)
            s.text(f"arXiv:{aid}", x + 32, y + 25, 11, t["ink2"], "mono", 500, ls=0.04)
            s.text(f"{cat} · {date}", x + cw - 16, y + 25, 10.5, t["ink3"], "mono", anchor="end")
            yy = y + 56
            for ln in wrap(title, cw - 32, 16, "sans", 600)[:4]:
                s.text(ln, x + 16, yy, 16, t["ink"], "sans", 600, ls=-0.01)
                yy += 22
            s.line(x + 16, y + chh - 58, x + cw - 16, y + chh - 58, line(t, 0, t["panel"]))
            s.text(lab, x + 16, y + chh - 36, 10, t["ink3"], "mono", 500, ls=0.12, upper=True)
            s.text(fit_text(cmd, cw - 32, 11.5, "mono"), x + 16, y + chh - 16, 11.5, t["cyan"], "mono", 500)
            i += 1
        y += chh + gap
    s.text("DOI 10.48550/arXiv.<id> for each · titles as listed on arXiv · VLBI: very-long-baseline interferometry",
           40, H - 18, 11, t["ink3"], "mono")
    return s


# --------------------------------------------------------------------------------------
# 0.35 figures: trust timeline, interference map with route exposure, training track.
# Drawn from committed synthetic inputs (examples/, scenarios/training/) and real runs of the
# engine. Everything here is made-up data; nothing is a measurement, and no figure states how
# any receiver or system performs against interference.
# --------------------------------------------------------------------------------------

BAND_KEYS = {"calibrating": "ink4", "nominal": "lime", "degraded": "amber", "untrusted": "coral"}
STATE_LABELS = (("degraded", "Degraded or anomalous"), ("not_degraded", "Not degraded"),
                ("unassessed", "Unassessed"), ("not_observed", "Not observed"))


def sha256_file(rel: str) -> str:
    return hashlib.sha256((ROOT / rel).read_bytes()).hexdigest()


def hatch(s: Svg, color: str, bg: str, gap: float = 6.0) -> str:
    """A diagonal hatch fill (the texture for 'seen, but no call'), as a pattern id."""
    pid = s.uid("hat")
    s.defs.append(f'<pattern id="{pid}" width="{f(gap)}" height="{f(gap)}" patternUnits="userSpaceOnUse" '
                  f'patternTransform="rotate(45)"><rect width="{f(gap)}" height="{f(gap)}" fill="{bg}"/>'
                  f'<path d="M0 {f(gap / 2)}H{f(gap)}" stroke="{color}" stroke-width="1.4"/></pattern>')
    return pid


def legend_item(s: Svg, t: dict, x, y, label: str, swatch) -> float:
    swatch(x, y - 11)
    return 22 + s.text(label, x + 22, y, 12, t["ink2"], "mono", 400)


def time_axis(s: Svg, t: dict, X, y, t1: float, step: float, unit_div: float = 60.0, unit: str = "min") -> None:
    sec = 0.0
    while sec <= t1 + 1e-6:
        s.text(f"{sec / unit_div:g}", X(sec), y, 10.5, t["ink3"], "mono", anchor="middle")
        sec += step
    s.text(f"time, {unit}", X(0) - 24, y, 10.5, t["ink3"], "mono", anchor="end")


def advisory_block(s: Svg, t: dict, x, y, width, lines: list[tuple[str, str]], size=12.5) -> float:
    """Caption lines: (kind, text) with kind 'warn' in coral, 'adv' and 'note' in ink."""
    for kind, text in lines:
        col = t["coral"] if kind == "warn" else (t["ink"] if kind == "adv" else t["ink2"])
        wt = 500 if kind in ("warn", "adv") else 400
        for ln in wrap(text, width, size, "sans", wt):
            s.text(ln, x, y, size, col, "sans", wt)
            y += size * 1.5
        y += 4
    return y


# ---------- 1. Trust-score timeline ----------

def load_trust(engine: "Engine") -> dict:
    d = engine.work / "trust"
    d.mkdir(exist_ok=True)
    src = ROOT / "examples" / "maritime-trust"
    for fn in ("session.toml", "tallinn-helsinki.nmea"):
        shutil.copyfile(src / fn, d / fn)
    subprocess.run([engine.exe, "receiver-trust", "session.toml"], cwd=d, capture_output=True, text=True, check=True)
    res = json.loads((d / "session.result.json").read_text())
    truth = [(float(r["t_s"]), float(r["true_lat_deg"]), float(r["true_lon_deg"]))
             for r in csv.DictReader((src / "tallinn-helsinki.truth.csv").open())]
    rep = []
    for ln in (src / "tallinn-helsinki.nmea").read_text().splitlines():
        p = ln.split(",")
        if p[0].endswith("GGA") and p[2] and p[4]:
            if p[6] != "1":
                sys.exit("gen_readme_assets: the demo log no longer reports a valid fix throughout (GGA quality 1); the trust figure says it does")
            la = float(p[2][:2]) + float(p[2][2:]) / 60
            lo = float(p[4][:3]) + float(p[4][3:]) / 60
            rep.append((-la if p[3] == "S" else la, -lo if p[5] == "W" else lo))
    err = []
    for (_, la0, lo0), (la1, lo1) in zip(truth, rep):
        err.append(math.hypot((la1 - la0) * 111195.0, (lo1 - lo0) * 111195.0 * math.cos(math.radians(la0))))
    return {"result": res, "err_m": err, "version": engine.version}


def trust_timeline(t: dict, d: dict) -> Svg:
    W, H = 1280, 800
    res, err = d["result"], d["err_m"]
    eps = res["epochs"]
    T1 = eps[-1]["t_s"]
    cal = res["baseline"]["calibration_epochs"]
    nom, deg = res["score_model"]["nominal_min"], res["score_model"]["degraded_min"]
    # the first time after which the reported position stays more than 30 m from the true one
    onset = next(i for i in range(len(err)) if all(e > 30.0 for e in err[i:]))
    desc = (f"Trust score over one synthetic passage, from a real run of engine v{d['version']} on "
            f"examples/maritime-trust (a made-up NMEA log of a ferry on a Tallinn to Helsinki route, {len(eps)} epochs at 1 Hz). "
            f"Three lanes share one time axis. Top: the distance between the position the receiver reports and the vessel's real position, "
            f"which stays within a few metres until about {onset} s, when the log's scripted position drag-off pulls it away, "
            f"while the receiver keeps reporting a valid fix. Middle: the trust score from 0 to 100, not computed during the first {cal} s of calibration, "
            f"in the nominal band (at least {nom:g}) until the drag-off, then falling through the degraded band (at least {deg:g}) into the untrusted band. "
            f"Bottom: the band of each epoch as a coloured ribbon with its name. The score is advisory. {res['advisory']} "
            f"The log is made up to show the format and the monitors; it is not a measurement and says nothing about how any receiver would perform.")
    s = Svg(W, H, "Trust score timeline on a synthetic passage", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Receiver trust · one synthetic passage")
    s.text("A valid fix, a falling trust score.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"{len(eps):,} epochs · 1 Hz · {T1 / 60:.0f} min · made-up log", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    wx, wy, ww, wh = 40, 120, W - 80, 560
    top = window(s, t, wx, wy, ww, wh, [("kshana", "b"), ("receiver-trust", "n"), ("·", "n"),
                                        ("examples/maritime-trust/session.toml", "n")])
    lx, lw = wx + 250, ww - 250 - 40

    def X(tt):
        return lx + tt / T1 * lw

    l1y, l1h = top + 20, 130
    l2y, l2h = l1y + l1h + 34, 210
    l3y, l3h = l2y + l2h + 18, 24

    # lane 1: reported minus true position
    s.text("Reported minus true", wx + 20, l1y + 22, 14, t["ink"], "sans", 500)
    s.text("position, m · truth file", wx + 20, l1y + 40, 11, t["ink3"], "mono")
    emax = max(err) * 1.08
    for v in nice_ticks(0, emax, 3):
        y = l1y + l1h - v / emax * l1h
        s.line(lx, y, lx + lw, y, line(t, 0, t["panel"]), 1)
        s.text(f"{v:,.0f}", lx - 10, y + 4, 10.5, t["ink3"], "mono", anchor="end")
    pts = [(X(i), l1y + l1h - min(e, emax) / emax * l1h) for i, e in enumerate(err)]
    s.poly(pts, stroke=t["magenta"], sw=1.6)
    # where the reported position has left the true one for good, across the lanes
    s.line(X(onset), l1y, X(onset), l3y + l3h + 6, t["magenta"], 1, dash="2 3")
    s.text("position error passes 30 m", X(onset) - 8, l1y + 16, 10.5, t["magenta"], "mono", 500, anchor="end")

    # lane 2: the score and its bands
    s.text("Trust score", wx + 20, l2y + 22, 14, t["ink"], "sans", 500)
    s.text("0 to 100 · advisory", wx + 20, l2y + 40, 11, t["ink3"], "mono")

    def Y2(v):
        return l2y + l2h - v / 100.0 * l2h

    for lo, hi, key in ((0, deg, "coral"), (deg, nom, "amber"), (nom, 100, "lime")):
        s.rect(lx, Y2(hi), lw, Y2(lo) - Y2(hi), fill=soft(t, key, t["panel"], 0.13))
    for v in (0, deg, nom, 100):
        s.line(lx, Y2(v), lx + lw, Y2(v), line(t, 1, t["panel"]), 1)
        s.text(f"{v:g}", lx - 10, Y2(v) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.text(f"nominal ≥ {nom:g}", lx + lw - 8, Y2(nom) - 6, 10.5, t["lime"], "mono", 500, anchor="end")
    s.text(f"degraded ≥ {deg:g}", lx + lw - 8, Y2(deg) - 6, 10.5, t["amber"], "mono", 500, anchor="end")
    s.text(f"untrusted < {deg:g}", lx + lw - 8, Y2(deg) + 16, 10.5, t["coral"], "mono", 500, anchor="end")
    # calibration, not scored: shaded over the lanes the baseline covers
    for y0, h0 in ((l1y, l1h), (l2y, l2h)):
        s.rect(X(0), y0, X(cal) - X(0), h0, fill=soft(t, "ink4", t["panel"], 0.30))
    s.text("calibration", X(cal / 2), l2y + l2h / 2 - 4, 10.5, t["ink2"], "mono", 500, anchor="middle")
    s.text("not scored", X(cal / 2), l2y + l2h / 2 + 11, 10.5, t["ink2"], "mono", 500, anchor="middle")
    sc = [(X(e["t_s"]), Y2(e["score"]["score"])) for e in eps if e.get("score")]
    s.poly(sc, stroke=t["ink"], sw=1.8)

    # lane 3: the band of each epoch
    s.text("Band", wx + 20, l3y + 17, 14, t["ink"], "sans", 500)
    runs, cur = [], None
    for e in eps:
        b = e["score"]["band"] if e.get("score") else "calibrating"
        if cur and cur[0] == b:
            cur[2] = e["t_s"]
        else:
            cur = [b, e["t_s"], e["t_s"]]
            runs.append(cur)
    for i, (b, t0, t1) in enumerate(runs):
        x0 = X(t0)
        x1 = X(runs[i + 1][1]) if i + 1 < len(runs) else X(T1)
        s.rect(x0, l3y, max(x1 - x0 - 1, 1), l3h, fill=soft(t, BAND_KEYS[b], t["panel"], 0.55 if b != "calibrating" else 0.3), r=3)
        lab = b.capitalize()
        if Face.get("mono", 500).width(lab.upper(), 10.5, 0.06) < x1 - x0 - 10:
            s.text(lab, (x0 + x1) / 2, l3y + 16, 10.5, t["ink"], "mono", 500, anchor="middle", ls=0.06, upper=True)
    ay = l3y + l3h + 22
    time_axis(s, t, X, ay, T1, 300)
    # legend
    gy = wy + wh - 22
    gx = lx
    for lab, key in (("Calibrating", "ink4"), ("Nominal", "lime"), ("Degraded", "amber"), ("Untrusted", "coral")):
        gx += legend_item(s, t, gx, gy, lab, lambda x, y, k=key: s.rect(x, y, 12, 12, fill=soft(t, k, t["panel"], 0.55), r=3)) + 22
    gx += legend_item(s, t, gx, gy, "Reported minus true position", lambda x, y: s.line(x, y + 6, x + 14, y + 6, t["magenta"], 2)) + 22
    gx += legend_item(s, t, gx, gy, "Trust score", lambda x, y: s.line(x, y + 6, x + 14, y + 6, t["ink"], 2))
    # caption: the advisory statement, in the words the software writes
    cy = wy + wh + 30
    advisory_block(s, t, 40, cy, W - 80, [
        ("adv", res["advisory"]),
        ("note", "The log is made up to show the format and the monitors. It is not a measurement, and the figure says nothing about how "
                 "any real receiver or attack would behave. The receiver reports a valid fix throughout; the score is what falls."),
    ])
    provenance(s, t, 40, H - 16, f"Engine v{d['version']} · examples/maritime-trust/session.toml + tallinn-helsinki.nmea · "
               f"scenario hash {res['scenario_hash'][:12]} · MODELLED, advisory")
    return s


# ---------- 2. Interference map with route exposure ----------

def load_imap(engine: "Engine") -> dict:
    ex = ROOT / "examples" / "interference-map"
    out = {}
    for kind in ("adsb", "ais"):
        mp = ex / "output" / f"{kind}-custom-2026-03-01.geojson"
        m = json.loads(mp.read_text())
        meta = m["kshana_interference_map"]
        cell = meta["grid"]["cell_deg"]
        cells = []
        for ft in m["features"]:
            p = ft["properties"]
            cells.append({"i": p["cell_i"], "j": p["cell_j"], "status": p["status"], "props": p,
                          "s": p["cell_i"] * cell - 90.0, "w": p["cell_j"] * cell - 180.0})
        rp = ex / "input" / f"route-{kind}.geojson"
        route = [(c[1], c[0]) for c in json.loads(rp.read_text())["geometry"]["coordinates"]]
        r = subprocess.run([engine.exe, "route-exposure", "--route", str(rp), "--map", str(mp), "--json"],
                           capture_output=True, text=True, check=True)
        row = json.loads(r.stdout)["kshana_route_exposure"]["rows"][0]
        out[kind] = {"version": engine.version, "meta": meta, "cell": cell, "cells": cells, "route": route, "row": row,
                     "files": [str(mp.relative_to(ROOT)), str(rp.relative_to(ROOT))]}
    return out


def cell_state(status: str) -> str:
    if status in ("degraded", "anomalous"):
        return "degraded"
    if status in ("not_degraded", "not_anomalous"):
        return "not_degraded"
    return "unassessed"


def state_swatch(s: Svg, t: dict, state: str, hat: str):
    def draw(x, y, w=14, h=14):
        if state == "degraded":
            s.rect(x, y, w, h, fill=soft(t, "coral", t["panel"], 0.6), stroke=t["coral"], sw=1, r=2)
        elif state == "not_degraded":
            s.rect(x, y, w, h, fill=soft(t, "lime", t["panel"], 0.3), stroke=t["lime"], sw=1, r=2)
        elif state == "unassessed":
            s.rect(x, y, w, h, fill=f"url(#{hat})", stroke=t["amber"], sw=1, r=2)
        else:
            s.rect(x, y, w, h, fill="none", stroke=t["ink4"], sw=1, r=2, extra='stroke-dasharray="3 3"')
    return draw


def imap_panel(s: Svg, t: dict, x, y, w, h, p: dict, hat: str, title: str) -> None:
    meta, cell, cells, route, row = p["meta"], p["cell"], p["cells"], p["route"], p["row"]
    top = window(s, t, x, y, w, h, [("kshana", "b"), ("interference-map", "n"), ("·", "n"), (title, "n")], tag="Synthetic")
    core = [c for c in cells if c["s"] > 25.0]
    lat0 = min(min(c["s"] for c in core), min(r[0] for r in route)) - 0.25
    lat1 = max(max(c["s"] + cell for c in core), max(r[0] for r in route)) + 0.25
    lon0 = min(min(c["w"] for c in core), min(r[1] for r in route)) - 0.25
    lon1 = max(max(c["w"] + cell for c in core), max(r[1] for r in route)) + 0.25
    k = math.cos(math.radians((lat0 + lat1) / 2))
    mx, my, mw, mh = x + 24, top + 22, w - 48, 400
    sc = min(mw / ((lon1 - lon0) * k), mh / (lat1 - lat0))
    ox = mx + (mw - (lon1 - lon0) * k * sc) / 2
    oy = my + (mh - (lat1 - lat0) * sc) / 2

    def PX(lon):
        return ox + (lon - lon0) * k * sc

    def PY(lat):
        return oy + (lat1 - lat) * sc

    s.rect(PX(lon0), PY(lat1), PX(lon1) - PX(lon0), PY(lat0) - PY(lat1), fill=t["bg2"], r=6)
    # the grid: every cell in frame, so an empty one reads as empty
    i0, i1 = int(math.floor((lat0 + 90) / cell)), int(math.ceil((lat1 + 90) / cell))
    j0, j1 = int(math.floor((lon0 + 180) / cell)), int(math.ceil((lon1 + 180) / cell))
    have = {(c["i"], c["j"]): c for c in cells}
    for i in range(i0, i1):
        for j in range(j0, j1):
            cs, cw = i * cell - 90.0, j * cell - 180.0
            if cs < lat0 - 1e-9 or cs + cell > lat1 + 1e-9 or cw < lon0 - 1e-9 or cw + cell > lon1 + 1e-9:
                continue
            rx, ry, rw, rh = PX(cw), PY(cs + cell), cell * k * sc, cell * sc
            c = have.get((i, j))
            if c is None:
                s.rect(rx, ry, rw, rh, fill="none", stroke=line(t, 1, t["bg2"]), sw=1, extra='stroke-dasharray="2 4"')
                continue
            st = cell_state(c["status"])
            if st == "degraded":
                s.rect(rx, ry, rw, rh, fill=soft(t, "coral", t["bg2"], 0.6), stroke=t["coral"], sw=1.2)
            elif st == "not_degraded":
                s.rect(rx, ry, rw, rh, fill=soft(t, "lime", t["bg2"], 0.3), stroke=t["lime"], sw=1)
            else:
                s.rect(rx, ry, rw, rh, fill=f"url(#{hat})", stroke=t["amber"], sw=1)
            if st == "degraded":
                det = c["props"].get("detectors")
                lab = (det[0].replace("_", " ") if det else "degraded")
                if Face.get("mono", 500).width(lab, 9) < rw - 4:
                    s.text(lab, rx + rw / 2, ry + 13, 9, t["ink"], "mono", 500, anchor="middle")
    # the route, over the cells
    pts = [(PX(lo), PY(la)) for la, lo in route]
    s.poly(pts, stroke=t["bg2"], sw=6)
    s.poly(pts, stroke=t["ink"], sw=2.6)
    s.circle(pts[0][0], pts[0][1], 5, fill=t["ink"], stroke=t["bg2"], sw=2)
    s.circle(pts[-1][0], pts[-1][1], 5, fill=t["bg2"], stroke=t["ink"], sw=2.4)
    s.text("start", pts[0][0] + 9, pts[0][1] - 8, 10.5, t["ink"], "mono", 500)
    outside = sum(1 for c in cells if c["s"] <= 25.0)
    if outside:
        s.text(f"{outside} further published cells lie outside this frame", mx + 8, my + mh - 8, 10, t["ink3"], "mono")
    # route exposure: the engine's own numbers, as a stacked bar
    by = my + mh + 34
    s.text(f"Route exposure · {row['route_km']:.0f} km · {row['date']}", x + 24, by - 12, 12.5, t["ink"], "mono", 500)
    segs = [("degraded", row["share_degraded"]), ("not_degraded", row["share_not_degraded"]),
            ("unassessed", row["share_unassessed"]), ("not_observed", row["share_not_observed"])]
    bw = w - 48
    bx = x + 24
    for st, sh in segs:
        if sh <= 0:
            continue
        sw_ = max(bw * sh - 2, 1)
        if st == "degraded":
            s.rect(bx, by, sw_, 16, fill=soft(t, "coral", t["panel"], 0.6), stroke=t["coral"], sw=1, r=2)
        elif st == "not_degraded":
            s.rect(bx, by, sw_, 16, fill=soft(t, "lime", t["panel"], 0.3), stroke=t["lime"], sw=1, r=2)
        elif st == "unassessed":
            s.rect(bx, by, sw_, 16, fill=f"url(#{hat})", stroke=t["amber"], sw=1, r=2)
        else:
            s.rect(bx, by, sw_, 16, fill="none", stroke=t["ink4"], sw=1, r=2, extra='stroke-dasharray="3 3"')
        bx += bw * sh
    names = {"degraded": "degraded", "not_degraded": "not degraded", "unassessed": "unassessed", "not_observed": "not observed"}
    tx = x + 24
    for st, sh in segs:
        tx += s.text(f"{names[st]} {sh * 100:.1f}%", tx, by + 38, 11.5, t["ink2"], "mono", 400) + 18
    # per-file licence and attribution, as the format requires
    data = meta["data"]
    s.text(fit_text(f"{data['licence']} · {data['attribution']}", w - 48, 10.5, "mono"), x + 24, y + h - 14, 10.5, t["ink3"], "mono")


def interference_map(t: dict, d: dict) -> Svg:
    W, H = 1280, 880
    a, b = d["adsb"], d["ais"]
    desc = ("Two synthetic interference-map days drawn from the committed samples in examples/interference-map/output, each with its own "
            "synthetic route and the route-exposure shares the engine reports. Left, an ADS-B day: "
            f"{sum(1 for c in a['cells'] if cell_state(c['status']) == 'degraded')} degraded cell, "
            f"{sum(1 for c in a['cells'] if cell_state(c['status']) == 'not_degraded')} not degraded, "
            f"{sum(1 for c in a['cells'] if cell_state(c['status']) == 'unassessed')} unassessed (hatched) and cells with no entry, drawn empty, which were not observed. "
            f"The route is {a['row']['route_km']:.0f} km: {a['row']['share_degraded'] * 100:.1f}% of its length in degraded cells, "
            f"{a['row']['share_not_degraded'] * 100:.1f}% not degraded, {a['row']['share_unassessed'] * 100:.1f}% unassessed and "
            f"{a['row']['share_not_observed'] * 100:.1f}% not observed. Right, an AIS day: cells flagged by the circle and on-land detectors, not-anomalous cells and empty cells; "
            f"the route is {b['row']['route_km']:.0f} km with {b['row']['share_degraded'] * 100:.1f}% in anomalous cells, {b['row']['share_not_degraded'] * 100:.1f}% not anomalous, "
            f"{b['row']['share_unassessed'] * 100:.1f}% unassessed and {b['row']['share_not_observed'] * 100:.1f}% not observed. "
            "ADS-B and AIS are separate layers, never combined. A flagged cell is not a finding of interference, and a cell with no colour was not observed, "
            "which is not the same as clear. All data are made up, in the open mid-Atlantic, and not a measurement.")
    s = Svg(W, H, "Interference map and route exposure, synthetic sample days", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Interference map · synthetic sample days")
    s.text("Where reports looked degraded, and how much of a route crosses it.", 40, 92, 30, t["ink"], "sans", 600, ls=-0.03)
    hat = hatch(s, t["amber"], blend(t["amber"], t["bg2"], 0.14))
    pw, ph = 600, 580
    imap_panel(s, t, 40, 120, pw, ph, a, hat, "adsb · 2026-03-01")
    imap_panel(s, t, W - 40 - pw, 120, pw, ph, b, hat, "ais · 2026-03-01")
    gy = 120 + ph + 30
    gx = 40
    for st, lab in STATE_LABELS:
        gx += legend_item(s, t, gx, gy, lab, state_swatch(s, t, st, hat)) + 26
    gx += legend_item(s, t, gx, gy, "Route", lambda x, y: s.line(x, y + 7, x + 16, y + 7, t["ink"], 2.6))
    advisory_block(s, t, 40, gy + 30, W - 80, [
        ("adv", "A degraded or anomalous cell is a statement about reported accuracy fields or implausible positions, not a finding of interference. "
                "A cell with no colour was not observed by enough aircraft or vessels, which is not the same as clear. ADS-B and AIS are separate layers and are never combined."),
        ("note", "Synthetic data, made up in the open mid-Atlantic: nothing here is a real place, aircraft or vessel, and the figure says nothing about how any receiver performs. "
                 "Route exposure is a past-day description, not a forecast."),
    ])
    provenance(s, t, 40, H - 16, f"Engine v{a['version']} · {a['meta']['method']['id']} · {b['meta']['method']['id']} · "
               f"cell {a['cell']:g}° · route-exposure/v1")
    return s


# ---------- 3. Training NMEA: true against reported track ----------

def load_training(engine: "Engine") -> dict:
    d = engine.work / "training"
    d.mkdir(exist_ok=True)
    shutil.copyfile(ROOT / "scenarios" / "training" / "coastal-drag-off.toml", d / "coastal-drag-off.toml")
    subprocess.run([engine.exe, "nmea-scenario", "coastal-drag-off.toml", "--out", "drag.nmea"], cwd=d, capture_output=True, text=True, check=True)
    out = json.loads((d / "drag.instructor.json").read_text())
    out["version"] = engine.version
    return out


def training_track(t: dict, d: dict, advisory: str) -> Svg:
    W, H = 1280, 820
    tr = d["track"]
    T1 = tr[-1]["t_s"]
    tl = {e["what"]: e["t_s"] for e in d["timeline"] if e["event"] == 1}
    ev = d["events"][0]
    desc = (f"Training stream from the scenario {d['scenario']} (engine v{d['version']}, seed {d['seed']}, {T1 / 60:.0f} minutes at one fix per "
            f"{tr[1]['t_s'] - tr[0]['t_s']:.0f} s of the instructor log). A map shows the vessel's true track and the track the receiver reports: they "
            f"agree until a scripted position drag-off begins at {tl.get('onset', 0):.0f} s, the reported track then walks away from the true one while the receiver keeps a valid fix, and "
            f"it steps back when the event ends at {tl.get('recovered', 0):.0f} s. Beside it, the distance between the two tracks over time, and the mean carrier-to-noise density the receiver "
            f"reports, which rises to one raised level while the event lasts. {d['warning']} {advisory} Positions, dates and tracks are invented.")
    s = Svg(W, H, "Training NMEA: true track against reported track", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, f"NMEA training · {d['scenario']}", color=t["coral"])
    s.text("The true track, and the one the receiver reports.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    s.text(f"seed {d['seed']} · {T1 / 60:.0f} min · invented positions", W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
    # the warning, first and unmissable
    s.rect(40, 114, W - 80, 36, fill=soft(t, "coral", t["bg"], 0.16), stroke=t["coral"], sw=1, r=10)
    s.text("TRAINING ONLY", 58, 137, 12.5, t["coral"], "mono", 500, ls=0.1)
    s.text("Never feed this stream to a vessel's live navigation systems.", 190, 137, 14, t["ink"], "sans", 500)
    wy, wh = 168, 530
    # left: the map
    lw_ = 560
    top = window(s, t, 40, wy, lw_, wh, [("nmea-scenario", "b"), (d["scenario"], "n")], tag="Synthetic")
    la = [r["true_lat_deg"] for r in tr] + [r["reported_lat_deg"] for r in tr if r["reported_lat_deg"] is not None]
    lo = [r["true_lon_deg"] for r in tr] + [r["reported_lon_deg"] for r in tr if r["reported_lon_deg"] is not None]
    lat0, lat1, lon0, lon1 = min(la), max(la), min(lo), max(lo)
    k = math.cos(math.radians((lat0 + lat1) / 2))
    mx, my, mw, mh = 40 + 24, top + 22, lw_ - 48, wh - 44 - 110
    sc = min(mw / ((lon1 - lon0) * k), mh / (lat1 - lat0)) * 0.9
    ox = mx + (mw - (lon1 - lon0) * k * sc) / 2
    oy = my + (mh - (lat1 - lat0) * sc) / 2

    def P(la_, lo_):
        return (ox + (lo_ - lon0) * k * sc, oy + (lat1 - la_) * sc)

    s.rect(mx, my, mw, mh, fill=t["bg2"], r=6)
    true_pts = [P(r["true_lat_deg"], r["true_lon_deg"]) for r in tr]
    rep = [r for r in tr if r["reported_lat_deg"] is not None]
    rep_pts = [P(r["reported_lat_deg"], r["reported_lon_deg"]) for r in rep]
    # displacement ticks while the event is active
    for r in tr:
        if r["active_events"] and r["reported_lat_deg"] is not None and int(r["t_s"]) % 60 == 0:
            a_, b_ = P(r["true_lat_deg"], r["true_lon_deg"]), P(r["reported_lat_deg"], r["reported_lon_deg"])
            s.line(a_[0], a_[1], b_[0], b_[1], soft(t, "coral", t["bg2"], 0.55), 1)
    s.poly(true_pts, stroke=t["ink"], sw=2.2)
    s.poly(rep_pts, stroke=t["coral"], sw=2, dash="6 4")
    s.circle(true_pts[0][0], true_pts[0][1], 5, fill=t["ink"], stroke=t["bg2"], sw=2)
    s.text("start", true_pts[0][0] + 9, true_pts[0][1] + 16, 10.5, t["ink"], "mono", 500)
    s.circle(true_pts[-1][0], true_pts[-1][1], 5, fill=t["bg2"], stroke=t["ink"], sw=2.4)
    for what, lab in (("onset", "drag-off begins"), ("recovered", "event ends")):
        if what in tl:
            r = min(tr, key=lambda q: abs(q["t_s"] - tl[what]))
            p = P(r["true_lat_deg"], r["true_lon_deg"])
            s.circle(p[0], p[1], 4, fill=t["coral"], stroke=t["bg2"], sw=2)
            s.text(lab, p[0] - 10, p[1] + 5, 10.5, t["coral"], "mono", 500, anchor="end")
    gy = wy + wh - 62
    gx = 40 + 24
    gx += legend_item(s, t, gx, gy, "True track", lambda x, y: s.line(x, y + 6, x + 18, y + 6, t["ink"], 2.2)) + 24
    legend_item(s, t, gx, gy, "Reported by the receiver", lambda x, y: s.line(x, y + 6, x + 18, y + 6, t["coral"], 2, dash="6 4"))
    if all(r["fix_valid"] for r in tr):
        s.text("Fix valid throughout: the receiver does not flag the event.", 40 + 24, gy + 26, 11.5, t["ink3"], "mono")
    # right: error and C/N0 lanes
    rx, rw = 40 + lw_ + 24, W - 80 - lw_ - 24
    top2 = window(s, t, rx, wy, rw, wh, [("instructor log", "b"), ("·", "n"), ("debrief view", "n")], tag="Synthetic")
    px, pw = rx + 230, rw - 230 - 36

    def X(tt):
        return px + tt / T1 * pw

    def lane(y0, h0, title, unit_, vals, lo_, hi_, col, ticks):
        s.text(title, rx + 20, y0 + 20, 14, t["ink"], "sans", 500)
        s.text(unit_, rx + 20, y0 + 38, 11, t["ink3"], "mono")
        if "onset" in tl and "recovered" in tl:
            s.rect(X(tl["onset"]), y0, X(tl["recovered"]) - X(tl["onset"]), h0, fill=soft(t, "coral", t["panel"], 0.10))
        for v in ticks:
            y = y0 + h0 - (v - lo_) / (hi_ - lo_) * h0
            s.line(px, y, px + pw, y, line(t, 0, t["panel"]), 1)
            s.text(f"{v:,.0f}", px - 10, y + 4, 10.5, t["ink3"], "mono", anchor="end")
        pts_ = [(X(r["t_s"]), y0 + h0 - (v - lo_) / (hi_ - lo_) * h0) for r, v in zip(tr, vals) if v is not None]
        s.poly(pts_, stroke=col, sw=1.9)

    err = [r["position_error_m"] for r in tr]
    cn = [r["mean_cn0_dbhz"] for r in tr]
    l1y, l1h = top2 + 20, 170
    lane(l1y, l1h, "Reported minus true", "position, m", err, 0, max(e for e in err if e is not None) * 1.08, t["coral"],
         nice_ticks(0, max(e for e in err if e is not None), 3))
    l2y, l2h = l1y + l1h + 36, 170
    cmin, cmax = min(c for c in cn if c is not None) - 2, max(c for c in cn if c is not None) + 2
    lane(l2y, l2h, "Mean C/N0 reported", "dB-Hz", cn, cmin, cmax, t["cyan"], nice_ticks(cmin, cmax, 3))
    if "onset" in tl:
        s.text("event active", (X(tl["onset"]) + X(tl["recovered"])) / 2, l1y + l1h - 10, 10.5, t["coral"], "mono", 500, anchor="middle")
    time_axis(s, t, X, l2y + l2h + 22, T1, 300)
    s.text(fit_text("The raised, uniform C/N0 is one clue the trainer note names; the rest are in the log.", rw - 40, 10.5, "mono"),
           rx + 20, wy + wh - 20, 10.5, t["ink3"], "mono")
    cy = wy + wh + 28
    advisory_block(s, t, 40, cy, W - 80, [
        ("warn", d["warning"]),
        ("adv", advisory),
        ("note", "Positions, dates and tracks are invented: the library carries no real vessel, operator or recording, and makes no statement "
                 "about how any receiver or system would perform against interference."),
    ])
    provenance(s, t, 40, H - 16, f"Engine v{d['version']} · scenarios/training/{d['scenario']}.toml · seed {d['seed']} · schema {d['schema']}")
    return s



# ---------- 4. Evidence pack structure ----------

PACK_FILES = (
    ("log-slice.bin", "the raw log bytes for the window", "cyan"),
    ("config.json", "the scenario as run: thresholds, baseline, hash", "cyan"),
    ("epochs.json", "every epoch: statistics, alarms, trust state", "cyan"),
    ("summary.html", "script-free summary and the limits of the record", "cyan"),
    ("manifest.json", "engine version, window, SHA-256 of the log and of every file, hash chain", "lime"),
    ("manifest.sig", "Ed25519 signature over manifest.json", "lime"),
    ("timestamp.tsr", "optional RFC 3161 timestamp token", "ink4"),
)


def pack_files_in_doc() -> list[str]:
    """The pack's file names as docs/EVIDENCE-PACKS.md lists them, so the figure cannot drift from the page."""
    names, on = [], False
    for ln in (ROOT / "docs" / "EVIDENCE-PACKS.md").read_text().splitlines():
        if ln.startswith("## "):
            on = ln.strip() == "## What is in a pack"
        elif on and ln.startswith("| `"):
            names.append(ln.split("`")[1])
    return names


def evidence_pack(t: dict, version: str) -> Svg:
    names = pack_files_in_doc()
    if names != [n for n, _, _ in PACK_FILES]:
        sys.exit(f"gen_readme_assets: docs/EVIDENCE-PACKS.md lists {names}, the figure draws {[n for n, _, _ in PACK_FILES]}")
    W, H = 1280, 800
    desc = ("The structure of an evidence pack. A receiver log (NMEA, u-blox UBX, RINEX 3 or an Android log) and a time window go into "
            "kshana receiver-trust evidence, which writes seven files: log-slice.bin, config.json, epochs.json, summary.html, manifest.json, "
            "manifest.sig and an optional timestamp.tsr. The manifest records the SHA-256 of the whole log and of every file and a hash chain over the files; "
            "the signature covers the manifest. kshana evidence verify checks the signature, every file's hash, the chain and that no unlisted file is present, "
            "and exits 0 when verified, 1 when something failed and 3 when the signer was not pinned. A pack is a technical record, not a legal opinion.")
    s = Svg(W, H, "Evidence pack structure", desc)
    card(s, t)
    eyebrow(s, t, 40, 50, "Evidence packs · what is in one")
    s.text("A signed record, checkable by anyone.", 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
    # input and engine
    node(s, t, 40, 190, 230, 150, "Input", "Receiver log", ["NMEA · u-blox UBX", "RINEX 3 · Android", "", "a window: --from, --to"], t["cyan"])
    node(s, t, 330, 190, 270, 150, "Make", "receiver-trust evidence", ["scenario as run", "epochs, alarms, trust state", "", "signed with your key"], t["magenta"], strong=True)
    arrow(s, t, [(270, 265), (330, 265)], t["ink3"])
    # the files
    fx, fw, fh, gap = 700, 330, 62, 12
    fy0 = 130
    s.text("PACK", fx, fy0 - 10, 10.5, t["ink3"], "mono", 500, ls=0.12)
    ys = []
    for i, (n, d_, key) in enumerate(PACK_FILES):
        y = fy0 + i * (fh + gap)
        ys.append(y)
        glass(s, t, fx, y, fw, fh, r=12, fill=soft(t, key, t["panel"], 0.07) if key != "ink4" else None)
        s.rect(fx + 14, y + 16, 8, 8, fill=t[key], r=2)
        s.text(n, fx + 32, y + 24, 13.5, t["ink"], "mono", 500)
        for j, ln in enumerate(wrap(d_, fw - 32, 12, "sans")):
            s.text(ln, fx + 32, y + 42 + j * 15, 12, t["ink3"], "sans")
    mid = (ys[0] + ys[-1] + fh) / 2
    bx = 650
    s.line(bx, ys[0] + fh / 2, bx, ys[-1] + fh / 2, t["ink3"], 1.4)
    for y in ys:
        arrow(s, t, [(bx, y + fh / 2), (fx - 2, y + fh / 2)], t["ink3"], 1.2)
    s.poly([(600, 265), (bx, 265)], stroke=t["ink3"], sw=1.4)
    # verify
    vx = 1090
    node(s, t, vx, 150, 150, 300, "Check", "evidence verify", [], t["lime"], strong=True)
    for i, ln in enumerate(("signature", "file hashes", "hash chain", "no extra file")):
        s.text(ln, vx + 16, 222 + i * 19, 12, t["ink2"], "mono")
    for i, ln in enumerate(("exit 0", "verified", "", "exit 1", "failed", "", "exit 3", "intact, signer", "not pinned")):
        if ln:
            s.text(ln, vx + 16, 318 + i * 15, 11, t["ink3"], "mono")
    rx_ = fx + fw + 28
    s.line(rx_, ys[0] + fh / 2, rx_, ys[-1] + fh / 2, t["ink3"], 1.4)
    for y in ys:
        s.line(fx + fw + 2, y + fh / 2, rx_, y + fh / 2, t["ink3"], 1.2)
    arrow(s, t, [(rx_, 265), (vx - 2, 265)], t["ink3"])
    # the limit, in the docs' words
    cy = ys[-1] + fh + 44
    s.rect(40, cy - 22, W - 80, 2, fill=line(t, 0))
    advisory_block(s, t, 40, cy + 8, W - 80, [
        ("adv", "A pack is a technical record, not a legal opinion."),
        ("note", "It states what the Kshana engine computed from a stated receiver log under a stated configuration, and lets anyone check that nothing in it was changed "
                 "afterwards. It does not say what caused an event, who was responsible, whether any obligation was met, or that the log shows what the receiver really received."),
    ], size=13)
    provenance(s, t, 40, H - 16, f"Engine v{version} · docs/EVIDENCE-PACKS.md · kshana receiver-trust evidence · kshana evidence verify")
    return s

# --------------------------------------------------------------------------------------
# Driver
# --------------------------------------------------------------------------------------

SCENARIOS = {
    "campaign": "campaign-jam-spoof-holdover-integrity",
    "coverage": "constellation-multi-gnss-coverage",
    "spectrum": "l-band-waterfall-jamming",
    "solar": "solar-system-tour",
    "leo_pass": "leo-pass-iridium",
    "leo_chain": "leo-pnt-end-to-end",
}


def build(engine: Engine) -> dict[str, bytes]:
    """Every asset, keyed by file name, plus a manifest naming what each was drawn from."""
    version = engine.version
    if version != repo_version():
        sys.exit(f"gen_readme_assets: engine is {version} but Cargo.toml says {repo_version()}; build the engine from this tree")
    runs = {k: engine.run(v) for k, v in SCENARIOS.items()}
    n_kinds = len(engine.kinds())
    matrix = json.loads(MATRIX.read_text())
    out: dict[str, bytes] = {}
    manifest: dict = {"generator": "tools/gen_readme_assets.py", "engine_version": version,
                      "scenario_kinds": n_kinds, "matrix": matrix["summary"], "assets": {}}

    def put(name: str, svg: Svg | None, sources: list[str], png: Image.Image | None = None, files: tuple = ()):
        for t in THEMES:
            fn = f"{name}-{t['name']}.{'png' if png is not None else 'svg'}"
            if png is not None:
                buf = io.BytesIO()
                png_t = png(t)
                png_t.save(buf, format="PNG", optimize=True)
                out[fn] = buf.getvalue()
            else:
                out[fn] = svg(t).render().encode()
        manifest["assets"][name] = {
            "files": [f"{name}-{t['name']}.{'png' if png is not None else 'svg'}" for t in THEMES],
            "drawn_from": [
                {"scenario": f"scenarios/{SCENARIOS[k]}.toml", "kind": runs[k].get("kind"),
                 "scenario_hash": runs[k].get("scenario_hash"), "seed": runs[k].get("seed")} if k in runs else {"source": k}
                for k in sources],
        }
        if files:
            manifest["assets"][name]["input_files"] = {fn: sha256_file(fn) for fn in files}

    put("kshana-mark", None, ["tools/readme-src/kshana-mark-mask.png"], png=lambda t: mark_image(t))
    put("kshana-logo", lambda t: logo_lockup(t), ["tools/readme-src/kshana-mark-mask.png", "tools/readme-fonts/Unbounded-wght.ttf"])
    put("hero", lambda t: hero(t, runs["campaign"], runs["coverage"], version), ["campaign", "coverage"])
    put("campaign-timeline", lambda t: campaign_timeline(t, runs["campaign"]), ["campaign"])
    put("lband-waterfall", lambda t: waterfall(t, runs["spectrum"]), ["spectrum"])
    put("coverage-map", lambda t: coverage_map(t, runs["coverage"]), ["coverage"])
    put("solar-system", lambda t: solar_system(t, runs["solar"]), ["solar"])
    put("leo-pass", lambda t: leo_pass(t, runs["leo_pass"]), ["leo_pass"])
    put("flow-pipeline", lambda t: flow_pipeline(t, n_kinds, version), ["kshana kinds --json"])
    put("flow-architecture", lambda t: flow_architecture(t, n_kinds, matrix["summary"]), ["kshana kinds --json", "web/data/verification-matrix.json"])
    put("flow-leo-chain", lambda t: flow_leo_chain(t, runs["leo_chain"]), ["leo_chain"])
    put("flow-verification", lambda t: flow_verification(t, matrix), ["web/data/verification-matrix.json"])
    tools = mcp_tools()
    put("architecture", lambda t: architecture(t, n_kinds, matrix["summary"], len(tools), version),
        ["kshana kinds --json", "web/data/verification-matrix.json", "mcp/kshana-mcp/src/server.rs", "docs/PRO.md"])
    put("research", lambda t: research(t), ["export.arxiv.org/api/query (titles, dates, categories, 2026-09-30)"])
    # The 0.35 figures: committed synthetic inputs and real runs of this engine.
    trust = load_trust(engine)
    imap = load_imap(engine)
    training = load_training(engine)
    advisory = trust["result"]["advisory"]
    put("trust-timeline", lambda t: trust_timeline(t, trust),
        ["kshana receiver-trust examples/maritime-trust/session.toml"],
        files=("examples/maritime-trust/session.toml", "examples/maritime-trust/tallinn-helsinki.nmea",
               "examples/maritime-trust/tallinn-helsinki.truth.csv"))
    put("interference-map", lambda t: interference_map(t, imap),
        ["kshana route-exposure examples/interference-map (two sample days, two synthetic routes)"],
        files=tuple(imap["adsb"]["files"] + imap["ais"]["files"]))
    put("training-track", lambda t: training_track(t, training, advisory),
        ["kshana nmea-scenario scenarios/training/coastal-drag-off.toml"],
        files=("scenarios/training/coastal-drag-off.toml",))
    # The page embeds this figure, so it is not hashed here; the file list it states is what is drawn.
    put("evidence-pack", lambda t: evidence_pack(t, version),
        ["docs/EVIDENCE-PACKS.md, section 'What is in a pack': " + ", ".join(pack_files_in_doc())])
    manifest["mcp_tools"] = tools
    # Kshana Studio screenshots: taken from the running Studio by tools/capture_studio_shots.mjs,
    # not drawn here. They are recorded (hash and the capture record in studio/SHOTS.json) so a
    # changed or missing screenshot changes this manifest and fails --check.
    shots = STUDIO_DIR / "SHOTS.json"
    if shots.exists():
        rec = json.loads(shots.read_text())
        entries = rec.get("shots", rec) if isinstance(rec, dict) else rec
        manifest["studio_screenshots"] = {
            "captured_by": "tools/capture_studio_shots.mjs", "record": "studio/SHOTS.json",
            "files": {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(STUDIO_DIR.glob("*.jpg")) + sorted(STUDIO_DIR.glob("*.png"))},
        }
    # kshana.dev screenshots for the README's site strip: taken from the site build by
    # tools/capture_site_shots.mjs, composed by tools/readme_shots.py, recorded the same way.
    site_dir = DEFAULT_OUT / "site"
    if (site_dir / "SHOTS.json").exists():
        manifest["site_screenshots"] = {
            "captured_by": "tools/capture_site_shots.mjs", "composed_by": "tools/readme_shots.py", "record": "site/SHOTS.json",
            "files": {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(site_dir.glob("*.jpg"))},
        }
    out["MANIFEST.json"] = (json.dumps(manifest, indent=2, ensure_ascii=False) + "\n").encode()
    return out


# Where each 0.35 figure is embedded. The alt text there must be the SVG's own <desc>, so what a
# reader who cannot see the figure is told is what the figure shows, number for number.
FIGURE_PAGES = {
    "trust-timeline": ("README.md", "docs/MARITIME-TRUST.md", "docs/RECEIVER-TRUST.md"),
    "interference-map": ("README.md", "docs/INTERFERENCE-MAP.md"),
    "training-track": ("README.md", "docs/NMEA-TRAINING.md"),
    "evidence-pack": ("README.md", "docs/EVIDENCE-PACKS.md"),
}


def svg_desc(svg: bytes) -> str:
    m = re.search(r'<desc id="d">(.*?)</desc>', svg.decode(), re.S)
    return m.group(1) if m else ""


def check_alt_text(assets: dict[str, bytes]) -> list[tuple[str, str]]:
    bad = []
    for name, pages in FIGURE_PAGES.items():
        want = f'alt="{svg_desc(assets[f"{name}-light.svg"])}"'
        for page in pages:
            path = ROOT / page
            if path.exists() and f"{name}-light.svg" in path.read_text() and want not in path.read_text():
                bad.append((page, name))
    return bad


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--kshana", help="the kshana binary (default: $KSHANA_BIN, target/release/kshana, PATH)")
    ap.add_argument("--out", default=str(DEFAULT_OUT), help="output directory (default: docs/assets/readme)")
    ap.add_argument("--check", action="store_true", help="regenerate in memory and fail if any committed file differs")
    args = ap.parse_args()
    exe = find_engine(args.kshana)
    with tempfile.TemporaryDirectory(prefix="kshana-readme-") as work:
        assets = build(Engine(exe, Path(work)))
    out = Path(args.out)
    if args.check:
        stale = [n for n, b in assets.items() if not (out / n).exists() or (out / n).read_bytes() != b]
        extra = sorted(p.name for p in out.glob("*") if p.is_file() and p.name not in assets)
        for n in stale:
            print(f"stale: {out / n}")
        for n in extra:
            print(f"not generated by this script: {out / n}")
        bad_alt = check_alt_text(assets)
        for page, name in bad_alt:
            print(f"alt text of {name} in {page} is not the figure's own description")
        return 1 if stale or extra or bad_alt else 0
    out.mkdir(parents=True, exist_ok=True)
    total = 0
    for n, b in sorted(assets.items()):
        (out / n).write_bytes(b)
        total += len(b)
        print(f"{len(b):>9,}  {out / n}")
    print(f"{total:>9,}  total")
    return 0


if __name__ == "__main__":
    sys.exit(main())
