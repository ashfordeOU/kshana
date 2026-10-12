#!/usr/bin/env python3
"""Generate docs/assets/figures/validation-breakdown.{svg,png} from the matrix.

The verification status breakdown (how many capabilities are VALIDATED against an
external oracle, MODELLED, or PARTNER-owned) is the single most honesty-sensitive
number in the project, so the figure that visualises it must be derived from the
single source of truth — `src/verification.rs::verification_matrix()` — not drawn by
hand. This script reads the already-generated ledger `web/data/verification-matrix.json`
(itself pinned byte-for-byte to the matrix by `tests/verification_artifacts_doc_sync.rs`)
and emits a SMALL, DETERMINISTIC, TEXT-BASED SVG: the counts are real `<text>` elements
(greppable, not path glyphs) over a simple stacked bar. There are no embedded timestamps
and element order is fixed, so running it twice yields a byte-identical SVG. The PNG is
then rendered from that SVG by cairosvg.

A previous version of this figure was ad-hoc Matplotlib output with no committed
generator, so the baked-in counts could silently drift from the matrix. Now the SVG
ships real numbers and `tests/figures_doc_sync.rs` recomputes the matrix counts and
fails the build if the committed SVG no longer contains each one.

It also draws the three README result figures that once had no committed generator:
domain-coverage-map (from web/capabilities.json), sgp4-regime-bars (from
tests/fixtures/sgp4_comparison.md) and scenario-fom (from the clock-holdover result;
run `cargo run --release -- scenarios/clock-holdover.toml` first). Every colour and the
font stack come from docs/assets/palette.json, which src/palette.rs generates, so the
figures follow the site's Observatory theme. PNG text is rasterised with the Geist
fonts in tools/readme-fonts installed (as for tools/gen_readme_assets.py).

Usage:
  python3 tools/gen_validation_figures.py
    reads  web/data/verification-matrix.json  (relative to the repo root)
    writes docs/assets/figures/validation-breakdown.svg
    writes docs/assets/figures/validation-breakdown.png  (via cairosvg)

  python3 tools/gen_validation_figures.py --check
    regenerate into a temp buffer and fail (non-zero exit) if the committed SVG
    differs — handy for a quick local check; the Rust test is the CI guard.

Determinism notes: no datetime, no RNG, no dict-iteration-order dependence; all
geometry is computed from the integer counts with fixed rounding.
"""
import json
import os
import sys

# Repo root = parent of this tools/ directory, so the script is location-independent.
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
LEDGER = os.path.join(ROOT, "web", "data", "verification-matrix.json")
SVG_OUT = os.path.join(ROOT, "docs", "assets", "figures", "validation-breakdown.svg")
PNG_OUT = os.path.join(ROOT, "docs", "assets", "figures", "validation-breakdown.png")
ORACLE_SVG_OUT = os.path.join(ROOT, "docs", "assets", "figures", "oracle-kind-stacked.svg")
ORACLE_PNG_OUT = os.path.join(ROOT, "docs", "assets", "figures", "oracle-kind-stacked.png")

# --- Observatory theme -----------------------------------------------------------
# Every docs figure is drawn instrument-dark on the site's Observatory palette, read
# from docs/assets/palette.json (generated from src/palette.rs and held to
# web/theme.css by tests/palette_sync.rs), so no colour is chosen here.
PALETTE_JSON = os.path.join(ROOT, "docs", "assets", "palette.json")
with open(PALETTE_JSON, encoding="utf-8") as _fh:
    _PAL = json.load(_fh)
_D = _PAL["dark"]
FONT = _PAL["font_sans"]
BG = _D["bg"]  # chart ground
TITLE = _D["ink"]  # heading
SUBTLE = _D["ink3"]  # muted subtitle / caption / ticks
INK = _D["ink2"]  # body text (row labels, legend, totals line)
TOTAL = _D["ink"]  # row total to the right of a bar
INBAR = _D["bg"]  # dark count text inside a coloured bar
OUTLINE = _D["axis"]  # faint bar outline and axes
GRID = _D["grid"]  # gridlines
GREEN = _D["lime"]  # Validated / ExternalDataset
TAN = _D["amber"]  # Modelled / InternalConsistency
AMBER = _D["cyan"]  # ReferenceImpl
BLUE = _D["blue"]  # IntegrationRun (Modelled only)
SLATE = _D["magenta"]  # Partner / NoneKind
FAULT = _D["coral"]  # a tolerance or threshold line
NEUTRAL = _D["ink4"]  # the comparison baseline (classical)

# Fixed canvas geometry (no auto-layout → deterministic across runs/machines).
WIDTH = 780
HEIGHT = 300
MARGIN_X = 40
BAR_Y = 150
BAR_H = 64
BAR_W = WIDTH - 2 * MARGIN_X  # full-width stacked bar

# Segment styling. Order is FIXED (Validated, Modelled, Partner) so the emitted
# element order — and therefore the bytes — never changes.
SEGMENTS = [
    ("validated", "Validated", GREEN),  # external-oracle checked
    ("modelled", "Modelled", TAN),  # honestly labelled simulation
    ("partner_owned", "Partner", SLATE),  # partner-owned evidence
]


def load_counts():
    """Read the summary counts from the generated ledger (source of truth)."""
    with open(LEDGER, encoding="utf-8") as fh:
        data = json.load(fh)
    s = data["summary"]
    counts = {
        "validated": int(s["validated"]),
        "modelled": int(s["modelled"]),
        "partner_owned": int(s["partner_owned"]),
        "total": int(s["total"]),
    }
    seg_sum = counts["validated"] + counts["modelled"] + counts["partner_owned"]
    if seg_sum != counts["total"]:
        raise SystemExit(
            f"ledger summary inconsistent: {seg_sum} segments != {counts['total']} total"
        )
    return counts


def fmt(x):
    """Format a coordinate with stable rounding (no locale/float jitter)."""
    return f"{round(x, 2):g}"


def build_svg(counts):
    """Build the deterministic, text-based stacked-bar SVG as a string."""
    total = counts["total"]
    lines = []
    a = lines.append
    a('<?xml version="1.0" encoding="UTF-8"?>')
    a(
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{WIDTH}" '
        f'height="{HEIGHT}" viewBox="0 0 {WIDTH} {HEIGHT}" '
        f'font-family="{FONT}">'
    )
    a(
        '  <title>kshana verification status breakdown across all '
        f'{total} capabilities</title>'
    )
    a('  <desc>Generated from src/verification.rs via web/data/verification-matrix.json '
      'by tools/gen_validation_figures.py. Do not edit by hand.</desc>')
    a(f'  <rect x="0" y="0" width="{WIDTH}" height="{HEIGHT}" fill="{BG}"/>')

    # Heading + total.
    a(
        f'  <text x="{MARGIN_X}" y="56" font-size="26" font-weight="700" '
        f'fill="{TITLE}">Verification status</text>'
    )
    a(
        f'  <text x="{MARGIN_X}" y="86" font-size="16" fill="{SUBTLE}">'
        f'{total} capabilities &#183; one row per requirement in the matrix</text>'
    )

    # Stacked bar. Segment widths are proportional to the counts; the last segment
    # is snapped to the right edge so rounding never leaves a sliver gap, keeping the
    # bar exactly BAR_W wide regardless of the integer split.
    x = float(MARGIN_X)
    n = len(SEGMENTS)
    for i, (key, _label, colour) in enumerate(SEGMENTS):
        count = counts[key]
        if i == n - 1:
            seg_w = (MARGIN_X + BAR_W) - x
        else:
            seg_w = BAR_W * count / total if total else 0.0
        a(
            f'  <rect x="{fmt(x)}" y="{BAR_Y}" width="{fmt(seg_w)}" '
            f'height="{BAR_H}" fill="{colour}"/>'
        )
        # In-bar count, only if the segment is wide enough to hold the digits.
        if seg_w >= 34:
            cx = x + seg_w / 2
            cy = BAR_Y + BAR_H / 2 + 8
            a(
                f'  <text x="{fmt(cx)}" y="{fmt(cy)}" font-size="24" '
                f'font-weight="700" fill="{INBAR}" text-anchor="middle">{count}</text>'
            )
        x += seg_w

    # Outline so adjacent segments read as one bar.
    a(
        f'  <rect x="{MARGIN_X}" y="{BAR_Y}" width="{BAR_W}" height="{BAR_H}" '
        f'fill="none" stroke="{OUTLINE}" stroke-width="1"/>'
    )

    # Legend row: a swatch + "<count> <Label>" per segment, evenly spaced. Order is
    # fixed, so the bytes are fixed.
    legend_y = BAR_Y + BAR_H + 52
    swatch = 18
    slot = BAR_W / n
    for i, (key, label, colour) in enumerate(SEGMENTS):
        count = counts[key]
        sx = MARGIN_X + i * slot
        a(
            f'  <rect x="{fmt(sx)}" y="{legend_y - swatch + 3}" width="{swatch}" '
            f'height="{swatch}" fill="{colour}"/>'
        )
        a(
            f'  <text x="{fmt(sx + swatch + 8)}" y="{legend_y}" font-size="17" '
            f'fill="{INK}"><tspan font-weight="700">{count}</tspan> {label}</text>'
        )

    a('</svg>')
    return "\n".join(lines) + "\n"


def write_png(svg_text, png_out, width, height):
    """Render the SVG to PNG via cairosvg (no timestamps, deterministic)."""
    try:
        import cairosvg
    except ImportError as exc:  # pragma: no cover - environment guard
        raise SystemExit(
            "cairosvg is required to render the PNG: pip install cairosvg "
            f"(import failed: {exc})"
        )
    cairosvg.svg2png(
        bytestring=svg_text.encode("utf-8"),
        write_to=png_out,
        output_width=width,
        output_height=height,
    )


# --- oracle-kind-stacked figure -------------------------------------------------
# A second honesty figure: how each STATUS is backed, split by OracleKind. It makes
# the core invariant visible — every Validated row is ExternalDataset by construction
# (the CI-enforced guard), Modelled rows are honestly tagged across the three weaker
# oracle kinds, and Partner rows have no Kshana oracle. Same text-based, deterministic,
# greppable-counts discipline as validation-breakdown so it cannot silently drift.

OWIDTH = 820
OHEIGHT = 400
OMARGIN = 40
OBAR_X = 168  # bars start after the status row label
OBAR_MAX_W = OWIDTH - OBAR_X - 70  # leave room for the row total at the right
OROW_Y0 = 120
OROW_STEP = 62
OBAR_H = 42

# Fixed oracle-kind order + colours (matches the validated-green of the other figure).
ORACLE_KINDS = [
    ("ExternalDataset", GREEN),
    ("ReferenceImpl", AMBER),
    ("InternalConsistency", TAN),
    ("IntegrationRun", BLUE),
    ("NoneKind", SLATE),
]
# Fixed status-row order (matrix JSON status string -> display label).
STATUS_ROWS = [
    ("VALIDATED", "Validated"),
    ("MODELLED", "Modelled"),
    ("PARTNER", "Partner"),
]


def load_breakdown():
    """Read per-row status x oracle_kind counts from the ledger (source of truth)."""
    with open(LEDGER, encoding="utf-8") as fh:
        data = json.load(fh)
    rows = data["rows"]
    bd = {s: {k: 0 for k, _ in ORACLE_KINDS} for s, _ in STATUS_ROWS}
    for r in rows:
        status = r["status"]
        kind = r["oracle_kind"]
        if status in bd and kind in bd[status]:
            bd[status][kind] += 1
        else:
            raise SystemExit(f"unexpected status/oracle_kind: {status!r}/{kind!r}")
    return bd, len(rows)


def build_oracle_svg(bd, total):
    """Build the deterministic, text-based status x oracle-kind figure as a string."""
    validated = sum(bd["VALIDATED"].values())
    modelled = bd["MODELLED"]
    modelled_total = sum(modelled.values())
    partner = sum(bd["PARTNER"].values())
    row_totals = {s: sum(bd[s].values()) for s, _ in STATUS_ROWS}
    max_total = max(row_totals.values()) or 1
    scale = OBAR_MAX_W / max_total

    lines = []
    a = lines.append
    a('<?xml version="1.0" encoding="UTF-8"?>')
    a(
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{OWIDTH}" '
        f'height="{OHEIGHT}" viewBox="0 0 {OWIDTH} {OHEIGHT}" '
        f'font-family="{FONT}">'
    )
    a('  <title>kshana verification status by oracle kind</title>')
    a('  <desc>Generated from src/verification.rs via web/data/verification-matrix.json '
      'by tools/gen_validation_figures.py. Do not edit by hand.</desc>')
    a(f'  <rect x="0" y="0" width="{OWIDTH}" height="{OHEIGHT}" fill="{BG}"/>')

    # Heading + subtitle (the subtitle carries the validated invariant + the total).
    a(
        f'  <text x="{OMARGIN}" y="50" font-size="24" font-weight="700" '
        f'fill="{TITLE}">Validated means external oracle &#8212; by construction</text>'
    )
    a(
        f'  <text x="{OMARGIN}" y="78" font-size="14" fill="{SUBTLE}">'
        f'Status &#215; oracle kind from verification-matrix.json (n={total}). '
        f'Validated = {validated}/{validated} ExternalDataset &#8212; CI-enforced.</text>'
    )

    # One horizontal stacked bar per status, split by oracle kind.
    for i, (status, label) in enumerate(STATUS_ROWS):
        y = OROW_Y0 + i * OROW_STEP
        a(
            f'  <text x="{OMARGIN}" y="{fmt(y + OBAR_H / 2 + 5)}" font-size="17" '
            f'font-weight="700" fill="{INK}">{label}</text>'
        )
        x = float(OBAR_X)
        for kind, colour in ORACLE_KINDS:
            count = bd[status][kind]
            if count == 0:
                continue
            seg_w = count * scale
            a(
                f'  <rect x="{fmt(x)}" y="{y}" width="{fmt(seg_w)}" '
                f'height="{OBAR_H}" fill="{colour}"/>'
            )
            if seg_w >= 22:
                a(
                    f'  <text x="{fmt(x + seg_w / 2)}" y="{fmt(y + OBAR_H / 2 + 6)}" '
                    f'font-size="18" font-weight="700" fill="{INBAR}" '
                    f'text-anchor="middle">{count}</text>'
                )
            x += seg_w
        # Row total just past the bar's right end.
        a(
            f'  <text x="{fmt(x + 12)}" y="{fmt(y + OBAR_H / 2 + 6)}" font-size="18" '
            f'font-weight="700" fill="{TOTAL}">{row_totals[status]}</text>'
        )

    # Caption: the Modelled oracle-kind split (greppable, pinned by the doc-sync test).
    cap_y = OROW_Y0 + len(STATUS_ROWS) * OROW_STEP + 10
    a(
        f'  <text x="{OMARGIN}" y="{cap_y}" font-size="13" fill="{SUBTLE}">'
        f'Modelled oracle kinds: {modelled["ExternalDataset"]} ExternalDataset, '
        f'{modelled["ReferenceImpl"]} ReferenceImpl, '
        f'{modelled["InternalConsistency"]} InternalConsistency, '
        f'{modelled["IntegrationRun"]} IntegrationRun '
        f'(total {modelled_total} Modelled).</text>'
    )

    # Legend: oracle-kind colour key (fixed order → fixed bytes).
    legend_y = cap_y + 36
    swatch = 16
    # Slots are sized to their label (a fixed average glyph width), so five kinds fit the canvas
    # without the longer labels running into the next swatch; fixed arithmetic, fixed bytes.
    sx = float(OMARGIN)
    for kind, colour in ORACLE_KINDS:
        a(
            f'  <rect x="{fmt(sx)}" y="{legend_y - swatch + 3}" width="{swatch}" '
            f'height="{swatch}" fill="{colour}"/>'
        )
        a(
            f'  <text x="{fmt(sx + swatch + 6)}" y="{fmt(legend_y)}" font-size="13" '
            f'fill="{INK}">{kind}</text>'
        )
        sx += swatch + 6 + len(kind) * 6.8 + 18

    # Status totals line (same idiom as validation-breakdown's legend → greppable).
    totals_y = legend_y + 34
    a(
        f'  <text x="{OMARGIN}" y="{totals_y}" font-size="15" fill="{INK}">'
        f'<tspan font-weight="700">{validated}</tspan> Validated &#183; '
        f'<tspan font-weight="700">{modelled_total}</tspan> Modelled &#183; '
        f'<tspan font-weight="700">{partner}</tspan> Partner &#183; '
        f'<tspan font-weight="700">{total}</tspan> total</text>'
    )

    a('</svg>')
    return "\n".join(lines) + "\n"


# --- shared helpers for the three README result figures ---------------------------
# domain-coverage-map, scenario-fom and sgp4-regime-bars were once ad-hoc Matplotlib
# output with no committed generator. They are now drawn here, from committed sources,
# with the same discipline as the two figures above: real <text> elements, fixed layout,
# no timestamps, byte-identical on every run.

FIGURES = os.path.join(ROOT, "docs", "assets", "figures")
CAPABILITIES = os.path.join(ROOT, "web", "capabilities.json")
SGP4_TABLE = os.path.join(ROOT, "tests", "fixtures", "sgp4_comparison.md")
# Written by `cargo run --release -- scenarios/clock-holdover.toml` (gitignored).
CLOCK_RESULT = os.path.join(ROOT, "scenarios", "clock-holdover.result.json")


def esc(t):
    return t.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")


def head(a, w, h, title, desc):
    a('<?xml version="1.0" encoding="UTF-8"?>')
    a(
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" '
        f'viewBox="0 0 {w} {h}" font-family="{FONT}">'
    )
    a(f"  <title>{esc(title)}</title>")
    a(f"  <desc>{esc(desc)} Generated by tools/gen_validation_figures.py. Do not edit by hand.</desc>")
    a(f'  <rect x="0" y="0" width="{w}" height="{h}" fill="{BG}"/>')


def text(a, x, y, s, size, fill, weight=None, anchor=None, extra=""):
    w = f' font-weight="{weight}"' if weight else ""
    an = f' text-anchor="{anchor}"' if anchor else ""
    a(f'  <text x="{fmt(x)}" y="{fmt(y)}" font-size="{size}"{w}{an} fill="{fill}"{extra}>{s}</text>')


def pow10(a, x, y, e, size, fill, anchor="middle"):
    """A `10^e` tick label as two text runs (Geist has no superscript digits)."""
    shift = {"middle": 4, "end": -size * 0.45, "start": size * 1.2}[anchor]
    text(a, x + shift, y, "10", size, fill, anchor="end")
    text(a, x + shift + 1, y - size * 0.45, str(e).replace("-", "&#8722;"), size * 0.7, fill)


def log10(v):
    import math

    return math.log10(v)


# --- domain-coverage-map ---------------------------------------------------------


def load_coverage():
    with open(CAPABILITIES, encoding="utf-8") as fh:
        caps = json.load(fh)["capabilities"]
    groups = {}
    for c in caps:
        g = groups.setdefault(c["group"], {"validated": 0, "modelled": 0})
        if c["status"] not in g:
            raise SystemExit(f"unexpected capability status {c['status']!r}")
        g[c["status"]] += 1
    rows = sorted(groups.items(), key=lambda kv: (-(kv[1]["validated"] + kv[1]["modelled"]), kv[0]))
    return rows, len(caps)


def build_coverage_svg(rows, total):
    w, ml, mr, top, step, bh = 820, 130, 60, 112, 44, 28
    h = top + step * len(rows) + 64
    pw = w - ml - mr
    vmax = max(g["validated"] + g["modelled"] for _, g in rows)
    scale = pw / (vmax + 1)
    nv = sum(g["validated"] for _, g in rows)
    nm = sum(g["modelled"] for _, g in rows)
    lines = []
    a = lines.append
    head(a, w, h, "Kshana capabilities by domain and maturity",
         "Validated and modelled public capabilities per domain, from web/capabilities.json.")
    text(a, 40, 46, "Breadth across the PNT stack &#8212; and honest maturity per domain", 22, TITLE, 700)
    text(a, 40, 72,
         f"{total} public capabilities across {len(rows)} domains &#183; {nv} validated &#183; "
         f"{nm} modelled &#183; source: web/capabilities.json", 14, SUBTLE)
    axis_y = top + step * len(rows) - (step - bh) / 2 + 6
    for k in range(vmax + 1):
        x = ml + k * scale
        a(f'  <line x1="{fmt(x)}" y1="{top - 10}" x2="{fmt(x)}" y2="{fmt(axis_y)}" stroke="{GRID}"/>')
        text(a, x, axis_y + 18, str(k), 12, SUBTLE, anchor="middle")
    a(f'  <line x1="{ml}" y1="{fmt(axis_y)}" x2="{w - mr}" y2="{fmt(axis_y)}" stroke="{OUTLINE}"/>')
    text(a, ml + pw / 2, axis_y + 40, "capabilities", 13, SUBTLE, anchor="middle")
    for i, (name, g) in enumerate(rows):
        y = top + i * step
        text(a, ml - 12, y + bh / 2 + 5, esc(name), 15, INK, anchor="end")
        x = float(ml)
        for key, colour in (("validated", GREEN), ("modelled", TAN)):
            n = g[key]
            if n == 0:
                continue
            a(f'  <rect x="{fmt(x)}" y="{y}" width="{fmt(n * scale)}" height="{bh}" fill="{colour}" stroke="{BG}"/>')
            text(a, x + n * scale / 2, y + bh / 2 + 5, str(n), 14, INBAR, 700, "middle")
            x += n * scale
        text(a, x + 12, y + bh / 2 + 5, str(g["validated"] + g["modelled"]), 14, TOTAL, 700)
    lx = w - mr - 230
    ly = top + step * len(rows) - 40
    for j, (label, colour) in enumerate((("Validated", GREEN), ("Modelled", TAN))):
        sx = lx + j * 120
        a(f'  <rect x="{sx}" y="{ly - 12}" width="14" height="14" fill="{colour}"/>')
        text(a, sx + 20, ly, label, 13, INK)
    a("</svg>")
    return "\n".join(lines) + "\n", w, h


# --- sgp4-regime-bars ---------------------------------------------------------------

SGP4_ORDER = [
    ("deep-space (non-resonant)", "Deep-space (non-resonant)"),
    ("deep-space resonance (1-day)", "Deep-space resonance (1-day)"),
    ("deep-space resonance (1/2-day)", "Deep-space resonance (1/2-day)"),
    ("near-earth (LEO/MEO)", "Near-earth (LEO/MEO)"),
]


def load_sgp4():
    import re

    with open(SGP4_TABLE, encoding="utf-8") as fh:
        md = fh.read()
    worst = {}
    for line in md.splitlines():
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if len(cells) == 7 and cells[0] in dict(SGP4_ORDER):
            worst[cells[0]] = float(cells[4])
    missing = [k for k, _ in SGP4_ORDER if k not in worst]
    if missing:
        raise SystemExit(f"{SGP4_TABLE}: no row for {missing}")
    m = re.search(r"within ([0-9.eE+-]+) km of the reference", md)
    if not m:
        raise SystemExit(f"{SGP4_TABLE}: tolerance sentence not found")
    return [(label, worst[key]) for key, label in SGP4_ORDER], float(m.group(1))


def build_sgp4_svg(rows, tol):
    w, ml, mr, top, step, bh = 900, 250, 150, 112, 64, 36
    h = top + step * len(rows) + 70
    pw = w - ml - mr
    lo, hi = -9, -4
    xs = lambda v: ml + (log10(v) - lo) / (hi - lo) * pw
    worst = max(v for _, v in rows)
    lines = []
    a = lines.append
    head(a, w, h, "SGP4 worst-case position error against the AIAA 2006-6753 reference",
         "Worst-case position error per regime, log scale, from tests/fixtures/sgp4_comparison.md.")
    text(a, 40, 44, "SGP4 matches the official reference in every regime", 22, TITLE, 700)
    text(a, 40, 70,
         "Worst-case position error vs AIAA 2006-6753 verification vectors &#183; log scale &#183; "
         "source: tests/fixtures/sgp4_comparison.md", 13, SUBTLE)
    axis_y = top + step * len(rows) - (step - bh) / 2 + 4
    for e in range(lo, hi + 1):
        x = ml + (e - lo) / (hi - lo) * pw
        a(f'  <line x1="{fmt(x)}" y1="{top - 12}" x2="{fmt(x)}" y2="{fmt(axis_y)}" stroke="{GRID}"/>')
        pow10(a, x, axis_y + 22, e, 13, SUBTLE)
    a(f'  <line x1="{ml}" y1="{fmt(axis_y)}" x2="{w - mr}" y2="{fmt(axis_y)}" stroke="{OUTLINE}"/>')
    text(a, ml + pw / 2, axis_y + 46, "worst-case kshana vs reference position error (km, log scale)", 13, SUBTLE, anchor="middle")
    for i, (label, v) in enumerate(rows):
        y = top + i * step
        colour = TAN if v == worst else GREEN
        text(a, ml - 12, y + bh / 2 + 5, esc(label), 14, INK, anchor="end")
        x1 = xs(v)
        a(f'  <rect x="{ml}" y="{y}" width="{fmt(x1 - ml)}" height="{bh}" fill="{colour}"/>')
        if v == worst:
            text(a, ml + (x1 - ml) / 2, y + bh / 2 + 6, f"{v * 1e6:.2f} mm ({v:.2e} km)", 15, INBAR, 700, "middle")
        else:
            text(a, x1 + 10, y + bh / 2 + 5, f"{v:.2e} km", 13, INK)
    xt = xs(tol)
    a(f'  <line x1="{fmt(xt)}" y1="{top - 12}" x2="{fmt(xt)}" y2="{fmt(axis_y)}" stroke="{FAULT}" stroke-width="2" stroke-dasharray="6 4"/>')
    text(a, xt + 8, top - 20, "AIAA tolerance", 13, FAULT, 700)
    mant, ex = f"{tol:.0e}".split("e")
    text(a, xt + 8, top - 4, f"{mant}e{int(ex)} km", 13, FAULT, 700)
    a("</svg>")
    return "\n".join(lines) + "\n", w, h


# --- scenario-fom -------------------------------------------------------------------


def load_fom():
    if not os.path.exists(CLOCK_RESULT):
        raise SystemExit(
            f"{os.path.relpath(CLOCK_RESULT, ROOT)} not found: run "
            "`cargo run --release -- scenarios/clock-holdover.toml` first"
        )
    with open(CLOCK_RESULT, encoding="utf-8") as fh:
        r = json.load(fh)
    return {
        "engine": r["engine_version"],
        "seed": r["seed"],
        "q": r["quantum"]["fom"],
        "c": r["classical"]["fom"],
    }


def sig(v):
    if v >= 100:
        return f"{v:,.0f}"
    if v >= 1:
        return f"{v:.3g}"
    return f"{v:.2g}"


def build_fom_svg(f):
    w, h = 1000, 400
    lines = []
    a = lines.append
    head(a, w, h, "What quantum sensors buy when GNSS is gone",
         "Holdover, p95 timing error and availability for the clock-holdover scenario, "
         "from its result.json.")
    text(a, 40, 44, "What quantum sensors buy when GNSS is gone", 24, TITLE, 700)
    text(a, 40, 70,
         f"scenario: clock-holdover &#183; seed {f['seed']} &#183; engine {esc(f['engine'])} &#183; "
         "Modelled (reproducible simulation FoM, single seed &#8212; not flight data)", 13, SUBTLE)
    panels = [
        ("Holdover autonomy", "seconds", "holdover_s", "lin", lambda v: f"{v:,.0f}"),
        ("Timing error (p95)", "nanoseconds, log", "timing_p95_ns", "log", sig),
        ("Availability", "fraction", "availability", "frac", lambda v: f"{v:.3f}"),
    ]
    pw, ph, top, gap, x0 = 250, 230, 130, 80, 90
    for k, (title, unit, key, mode, show) in enumerate(panels):
        ml = x0 + k * (pw + gap)
        base = top + ph
        vals = [f["q"][key], f["c"][key]]
        if mode == "lin":
            step = 1000
            vmax = (int(max(vals) * 1.15 / step) + 1) * step
            ticks = [(t, f"{t}") for t in range(0, vmax + 1, step)]
            ys = lambda v: base - v / vmax * ph
        elif mode == "frac":
            vmax = 1.2
            ticks = [(t / 5, f"{t / 5:.1f}") for t in range(0, 6)]
            ys = lambda v: base - v / vmax * ph
        else:
            import math

            lo = math.floor(log10(min(vals))) - 0.3
            hi = math.ceil(log10(max(vals))) + 0.3
            ticks = [(10.0 ** e, e) for e in range(math.ceil(lo), math.floor(hi) + 1)]
            ys = lambda v: base - (log10(v) - lo) / (hi - lo) * ph
        text(a, ml - 50, top - 22, title, 17, TITLE, 700)
        for tv, tl in ticks:
            y = ys(tv)
            a(f'  <line x1="{ml}" y1="{fmt(y)}" x2="{ml + pw}" y2="{fmt(y)}" stroke="{GRID}"/>')
            if mode == "log":
                pow10(a, ml - 8, y + 4, tl, 12, SUBTLE, anchor="end")
            else:
                text(a, ml - 8, y + 4, tl, 12, SUBTLE, anchor="end")
        a(f'  <line x1="{ml}" y1="{base}" x2="{ml + pw}" y2="{base}" stroke="{OUTLINE}"/>')
        a(f'  <line x1="{ml}" y1="{top}" x2="{ml}" y2="{base}" stroke="{OUTLINE}"/>')
        text(a, ml - 54, top + ph / 2, unit, 12, SUBTLE, anchor="middle",
             extra=f' transform="rotate(-90 {fmt(ml - 54)} {fmt(top + ph / 2)})"')
        for j, (label, v, colour) in enumerate((("Quantum", vals[0], GREEN), ("Classical", vals[1], NEUTRAL))):
            bx = ml + 25 + j * 115
            y = ys(v)
            a(f'  <rect x="{bx}" y="{fmt(y)}" width="85" height="{fmt(base - y)}" fill="{colour}"/>')
            text(a, bx + 42.5, y - 8, show(v), 15, TITLE, 700, "middle")
            text(a, bx + 42.5, base + 22, label, 14, INK, anchor="middle")
    a("</svg>")
    return "\n".join(lines) + "\n", w, h


def result_figures():
    """(name, svg, width, height) for the three result figures."""
    cov, n = load_coverage()
    sg, tol = load_sgp4()
    out = [
        ("domain-coverage-map",) + build_coverage_svg(cov, n),
        ("sgp4-regime-bars",) + build_sgp4_svg(sg, tol),
    ]
    if os.path.exists(CLOCK_RESULT) or "--check" not in sys.argv:
        out.append(("scenario-fom",) + build_fom_svg(load_fom()))
    return out


def main(argv):
    counts = load_counts()
    svg_text = build_svg(counts)
    bd, bd_total = load_breakdown()
    oracle_svg_text = build_oracle_svg(bd, bd_total)

    results = result_figures()

    if "--check" in argv:
        rc = 0
        for out, text, name in (
            (SVG_OUT, svg_text, "validation-breakdown.svg"),
            (ORACLE_SVG_OUT, oracle_svg_text, "oracle-kind-stacked.svg"),
        ) + tuple((os.path.join(FIGURES, f"{n}.svg"), t, f"{n}.svg") for n, t, _, _ in results):
            with open(out, encoding="utf-8") as fh:
                committed = fh.read()
            if committed != text:
                print(
                    f"{name} is out of sync with the matrix; "
                    "run: python3 tools/gen_validation_figures.py",
                    file=sys.stderr,
                )
                rc = 1
            else:
                print(f"{name} is in sync.")
        return rc

    with open(SVG_OUT, "w", encoding="utf-8") as fh:
        fh.write(svg_text)
    write_png(svg_text, PNG_OUT, WIDTH, HEIGHT)
    print(
        f"wrote {os.path.relpath(SVG_OUT, ROOT)} and "
        f"{os.path.relpath(PNG_OUT, ROOT)}: "
        f"{counts['validated']} Validated / {counts['modelled']} Modelled / "
        f"{counts['partner_owned']} Partner of {counts['total']}"
    )

    with open(ORACLE_SVG_OUT, "w", encoding="utf-8") as fh:
        fh.write(oracle_svg_text)
    write_png(oracle_svg_text, ORACLE_PNG_OUT, OWIDTH, OHEIGHT)
    print(
        f"wrote {os.path.relpath(ORACLE_SVG_OUT, ROOT)} and "
        f"{os.path.relpath(ORACLE_PNG_OUT, ROOT)}: "
        f"{sum(bd['VALIDATED'].values())} Validated / "
        f"{sum(bd['MODELLED'].values())} Modelled / "
        f"{sum(bd['PARTNER'].values())} Partner of {bd_total}"
    )

    for name, text, w, h in results:
        with open(os.path.join(FIGURES, f"{name}.svg"), "w", encoding="utf-8") as fh:
            fh.write(text)
        write_png(text, os.path.join(FIGURES, f"{name}.png"), 2 * w, 2 * h)
        print(f"wrote docs/assets/figures/{name}.svg and .png")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
