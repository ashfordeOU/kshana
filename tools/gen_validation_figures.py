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
    ("validated", "Validated", "#1b7837"),  # external-oracle checked
    ("modelled", "Modelled", "#b8860b"),  # honestly labelled simulation
    ("partner_owned", "Partner", "#4a4a8a"),  # partner-owned evidence
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
        'font-family="Helvetica, Arial, sans-serif">'
    )
    a(
        '  <title>kshana verification status breakdown across all '
        f'{total} capabilities</title>'
    )
    a('  <desc>Generated from src/verification.rs via web/data/verification-matrix.json '
      'by tools/gen_validation_figures.py. Do not edit by hand.</desc>')
    a(f'  <rect x="0" y="0" width="{WIDTH}" height="{HEIGHT}" fill="#ffffff"/>')

    # Heading + total.
    a(
        f'  <text x="{MARGIN_X}" y="56" font-size="26" font-weight="700" '
        f'fill="#212121">Verification status</text>'
    )
    a(
        f'  <text x="{MARGIN_X}" y="86" font-size="16" fill="#555555">'
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
                f'font-weight="700" fill="#ffffff" text-anchor="middle">{count}</text>'
            )
        x += seg_w

    # Outline so adjacent segments read as one bar.
    a(
        f'  <rect x="{MARGIN_X}" y="{BAR_Y}" width="{BAR_W}" height="{BAR_H}" '
        f'fill="none" stroke="#212121" stroke-width="1"/>'
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
            f'fill="#212121"><tspan font-weight="700">{count}</tspan> {label}</text>'
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
    ("ExternalDataset", "#1b7837"),
    ("ReferenceImpl", "#b8860b"),
    ("InternalConsistency", "#cd853f"),
    ("NoneKind", "#4a4a8a"),
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
        'font-family="Helvetica, Arial, sans-serif">'
    )
    a('  <title>kshana verification status by oracle kind</title>')
    a('  <desc>Generated from src/verification.rs via web/data/verification-matrix.json '
      'by tools/gen_validation_figures.py. Do not edit by hand.</desc>')
    a(f'  <rect x="0" y="0" width="{OWIDTH}" height="{OHEIGHT}" fill="#ffffff"/>')

    # Heading + subtitle (the subtitle carries the validated invariant + the total).
    a(
        f'  <text x="{OMARGIN}" y="50" font-size="24" font-weight="700" '
        f'fill="#212121">Validated means external oracle &#8212; by construction</text>'
    )
    a(
        f'  <text x="{OMARGIN}" y="78" font-size="15" fill="#555555">'
        f'Status &#215; oracle kind from verification-matrix.json (n={total}). '
        f'Validated = {validated}/{validated} ExternalDataset &#8212; CI-enforced.</text>'
    )

    # One horizontal stacked bar per status, split by oracle kind.
    for i, (status, label) in enumerate(STATUS_ROWS):
        y = OROW_Y0 + i * OROW_STEP
        a(
            f'  <text x="{OMARGIN}" y="{fmt(y + OBAR_H / 2 + 5)}" font-size="17" '
            f'font-weight="700" fill="#212121">{label}</text>'
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
                    f'font-size="18" font-weight="700" fill="#ffffff" '
                    f'text-anchor="middle">{count}</text>'
                )
            x += seg_w
        # Row total just past the bar's right end.
        a(
            f'  <text x="{fmt(x + 12)}" y="{fmt(y + OBAR_H / 2 + 6)}" font-size="18" '
            f'font-weight="700" fill="#212121">{row_totals[status]}</text>'
        )

    # Caption: the Modelled oracle-kind split (greppable, pinned by the doc-sync test).
    cap_y = OROW_Y0 + len(STATUS_ROWS) * OROW_STEP + 10
    a(
        f'  <text x="{OMARGIN}" y="{cap_y}" font-size="14" fill="#555555">'
        f'Modelled oracle kinds: {modelled["ExternalDataset"]} ExternalDataset, '
        f'{modelled["ReferenceImpl"]} ReferenceImpl, '
        f'{modelled["InternalConsistency"]} InternalConsistency '
        f'(total {modelled_total} Modelled).</text>'
    )

    # Legend: oracle-kind colour key (fixed order → fixed bytes).
    legend_y = cap_y + 36
    swatch = 16
    slot = (OWIDTH - 2 * OMARGIN) / len(ORACLE_KINDS)
    for i, (kind, colour) in enumerate(ORACLE_KINDS):
        sx = OMARGIN + i * slot
        a(
            f'  <rect x="{fmt(sx)}" y="{legend_y - swatch + 3}" width="{swatch}" '
            f'height="{swatch}" fill="{colour}"/>'
        )
        a(
            f'  <text x="{fmt(sx + swatch + 6)}" y="{fmt(legend_y)}" font-size="13" '
            f'fill="#212121">{kind}</text>'
        )

    # Status totals line (same idiom as validation-breakdown's legend → greppable).
    totals_y = legend_y + 34
    a(
        f'  <text x="{OMARGIN}" y="{totals_y}" font-size="15" fill="#212121">'
        f'<tspan font-weight="700">{validated}</tspan> Validated &#183; '
        f'<tspan font-weight="700">{modelled_total}</tspan> Modelled &#183; '
        f'<tspan font-weight="700">{partner}</tspan> Partner &#183; '
        f'<tspan font-weight="700">{total}</tspan> total</text>'
    )

    a('</svg>')
    return "\n".join(lines) + "\n"


def main(argv):
    counts = load_counts()
    svg_text = build_svg(counts)
    bd, bd_total = load_breakdown()
    oracle_svg_text = build_oracle_svg(bd, bd_total)

    if "--check" in argv:
        rc = 0
        for out, text, name in (
            (SVG_OUT, svg_text, "validation-breakdown.svg"),
            (ORACLE_SVG_OUT, oracle_svg_text, "oracle-kind-stacked.svg"),
        ):
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
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
