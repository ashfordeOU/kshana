# SPDX-License-Identifier: AGPL-3.0-only
"""The flight-dynamics reference integration (roadmap C7): Kshana writes a trajectory as OEM, OPM
and SPK, a tool reads the files back, and this module compares what the tool read with what was
written.

The comparison follows docs/design/evidence/c7-flight-dynamics-adapters/PREREGISTRATION.md: every
state the tool reads back must equal the state written to the precision the format carries. For a
text format that is the digits written. Kshana writes each double in shortest round-trip form, so a
reader that parses the text as an IEEE double gets the written bits back; a tool that then converts
units (Orekit holds metres, the OEM carries kilometres) is checked against its own conversion of the
written value, and the report names it as a tool that rounds further than the digits written. For
SPK the stored records must be the same bits.

Used by the notebooks next to this file; nothing here needs a tool installed.
"""
from __future__ import annotations

import base64
import json
import math
import os
from dataclasses import dataclass, field
from decimal import Decimal, getcontext
from pathlib import Path

getcontext().prec = 60

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
CAPSTONE = REPO / "tests" / "fixtures" / "capstone_horizons" / "capstone_2023-03_moon_icrf.txt"
PINNED = REPO / "tests" / "fixtures" / "capstone_horizons" / "ephem_export.sha256"
FORMATS = ("oem", "opm", "spk")
SUFFIX = {"oem": "oem", "opm": "opm", "spk": "bsp"}


def write_files(out_dir: str | os.PathLike, table: Path = CAPSTONE) -> dict[str, Path]:
    """Write the table as OEM, OPM and SPK through the Python binding (`kshana.ephem_export`) and
    return the paths. Each file's SHA-256 must be the one the command line, Python and MCP are held
    to (tests/fixtures/capstone_horizons/ephem_export.sha256) when the table is the CAPSTONE one.
    When KSHANA_FD_CLI_DIR names a directory the command line wrote the same files into, each file
    must be byte for byte the command line's."""
    import hashlib

    import kshana

    out = Path(out_dir)
    out.mkdir(parents=True, exist_ok=True)
    pinned = dict(reversed(line.split()) for line in PINNED.read_text().splitlines())
    cli_dir = os.environ.get("KSHANA_FD_CLI_DIR")
    paths = {}
    text = Path(table).read_text()
    for fmt in FORMATS:
        rep = json.loads(kshana.ephem_export(text, fmt))
        raw = base64.b64decode(rep["content"]) if rep["encoding"] == "base64" else rep["content"].encode()
        rb = rep["read_back"]
        assert rb["identical"] == rb["states"] and rb["epoch_mismatches"] == 0, (fmt, rb)
        if Path(table) == CAPSTONE:
            assert hashlib.sha256(raw).hexdigest() == pinned[fmt], f"{fmt}: not the pinned bytes"
        p = out / f"{Path(table).stem}.{SUFFIX[fmt]}"
        p.write_bytes(raw)
        if cli_dir:
            cli = Path(cli_dir) / p.name
            assert cli.read_bytes() == raw, f"{fmt}: the command line wrote other bytes ({cli})"
        paths[fmt] = p
    return paths


@dataclass
class Written:
    """The states as written: the calendar epoch label (TDB) and the six values as text."""

    epochs: list[str]
    text: list[list[str]]

    @property
    def values(self) -> list[list[float]]:
        return [[float(t) for t in row] for row in self.text]


def written_states(path: str | os.PathLike) -> Written:
    """The epochs and values as written in a Kshana OEM (every data line) or OPM (the state)."""
    text = Path(path).read_text()
    if "CCSDS_OPM_VERS" in text:
        kv = {}
        for line in text.splitlines():
            if "=" in line:
                k, v = line.split("=", 1)
                kv[k.strip()] = v.strip()
        keys = ["X", "Y", "Z", "X_DOT", "Y_DOT", "Z_DOT"]
        return Written([kv["EPOCH"]], [[kv[k] for k in keys]])
    body = text.split("META_STOP", 1)[1]
    epochs, rows = [], []
    for line in body.splitlines():
        f = line.split()
        if len(f) == 7:
            epochs.append(f[0])
            rows.append(f[1:])
    return Written(epochs, rows)


def half_unit(t: str) -> Decimal:
    """Half a unit in the last digit written."""
    return Decimal(1).scaleb(Decimal(t).as_tuple().exponent) / 2


@dataclass
class Comparison:
    """One tool's reading of one file, compared value by value with what was written."""

    tool: str
    fmt: str
    how: str
    states: int = 0
    values: int = 0
    same_bits: int | None = 0
    tool_conversion_exact: int = 0
    correctly_rounded: int = 0
    worst_half_units: float = 0.0
    worst_ulps: float = 0.0
    epochs_equal: int = 0
    #: For a tool that evaluates an SPK rather than handing back its records: the largest
    #: position and velocity differences at the node epochs, and SPICE's own on the same kernel.
    evaluated: bool = False
    eval_max_km: float = 0.0
    eval_max_km_s: float = 0.0
    spice_max_km: float = 0.0
    spice_max_km_s: float = 0.0
    notes: list[str] = field(default_factory=list)

    @property
    def carried(self) -> bool:
        """Every value is the written double, or the tool's own conversion of it, and every epoch
        is the written one. For a tool that evaluates an SPK at the node epochs: every epoch is the
        written one and no value is further from the written state than SPICE's own evaluation of
        the same kernel is."""
        if self.evaluated:
            return (
                self.states > 0
                and self.epochs_equal == self.states
                and self.eval_max_km <= self.spice_max_km
                and self.eval_max_km_s <= self.spice_max_km_s
            )
        return (
            self.states > 0
            and self.tool_conversion_exact == self.values
            and self.epochs_equal == self.states
        )

    @property
    def within_digits(self) -> bool:
        """Every value is the written double, or within half a unit of the last digit written."""
        return self.states > 0 and (self.same_bits == self.values or self.worst_half_units <= 1.0)

    @property
    def rounds_further(self) -> bool:
        """The tool's own representation moves a value past the digits written."""
        return not self.within_digits

    def row(self) -> dict:
        d = {k: v for k, v in self.__dict__.items() if k != "notes"}
        d.update(carried=self.carried, within_digits=self.within_digits,
                 rounds_further=self.rounds_further, notes=self.notes)
        return d


def compare(tool: str, fmt: str, written: Written, read: list[list[float]], epochs_equal: list[bool],
            scale: float = 1.0, how: str = "") -> Comparison:
    """Compare a tool's values (`read`, in the tool's units: the written value times `scale`) and
    its epoch checks with what was written."""
    c = Comparison(tool, fmt, how)
    if len(read) != len(written.text):
        c.notes.append(f"{len(read)} states read, {len(written.text)} written")
        return c
    for row_t, row_r in zip(written.text, read):
        c.states += 1
        for t, r in zip(row_t, row_r):
            c.values += 1
            w = float(t)
            if scale == 1.0:
                c.same_bits += r == w
            c.tool_conversion_exact += r == w * scale
            exact = Decimal(t) * Decimal(repr(scale))
            c.correctly_rounded += r == float(exact)
            err = abs(Decimal(r) - exact)
            c.worst_half_units = max(c.worst_half_units, float(err / (half_unit(t) * Decimal(repr(scale)))))
            cr = float(exact)  # the correctly rounded double of the written value in tool units
            c.worst_ulps = max(c.worst_ulps, abs(r - cr) / math.ulp(cr))
    if scale != 1.0:
        c.same_bits = None  # the tool holds other units; its conversion is checked instead
    c.epochs_equal = sum(1 for e in epochs_equal if e)
    return c


def records_compare(tool: str, written: Written, records: list[list[float]], epochs: list[float],
                    want_epochs: list[float], how: str = "") -> Comparison:
    """An SPK's stored records (km, km/s) and epochs (TDB seconds past J2000) as a tool reads them,
    compared bit for bit with the written states."""
    c = compare(tool, "spk", written, records, [a == b for a, b in zip(epochs, want_epochs)], how=how)
    return c


def evaluated_compare(tool: str, fmt: str, written: Written, evaluated: list[list[float]],
                      epochs_equal: list[bool], spice: list[list[float]], how: str = "") -> Comparison:
    """A tool that evaluates a kernel at the node epochs (it does not hand back the stored
    records): its states compared with the written ones, beside SPICE's own evaluation (`spice`) of
    Kshana's SPK of the same states at the same epochs."""
    c = compare(tool, fmt, written, evaluated, epochs_equal, how=how)
    c.evaluated = True

    def worst(rows: list[list[float]]) -> tuple[float, float]:
        dp = max(max(abs(a - b) for a, b in zip(r[:3], w[:3])) for r, w in zip(rows, written.values))
        dv = max(max(abs(a - b) for a, b in zip(r[3:], w[3:])) for r, w in zip(rows, written.values))
        return dp, dv

    if len(evaluated) == len(written.values) == len(spice):
        c.eval_max_km, c.eval_max_km_s = (float(x) for x in worst(evaluated))
        c.spice_max_km, c.spice_max_km_s = (float(x) for x in worst(spice))
        c.notes.append(
            f"evaluated at the nodes: within {c.eval_max_km:.3g} km and {c.eval_max_km_s:.3g} km/s "
            f"of the written state (SPICE on the same states: {c.spice_max_km:.3g} km, "
            f"{c.spice_max_km_s:.3g} km/s)"
        )
    return c


def et_of_label(label: str) -> float:
    """TDB seconds past J2000 of a TDB calendar label `YYYY-MM-DDTHH:MM:SS[.f]`, computed exactly."""
    import datetime as dt

    date, time = label.split("T")
    y, m, d = (int(x) for x in date.split("-"))
    hh, mm, ss = time.split(":")
    days = (dt.date(y, m, d) - dt.date(2000, 1, 1)).days
    whole = days * 86400 + int(hh) * 3600 + int(mm) * 60 - 43200
    return float(whole) + float(ss)


def report(comparisons: list[Comparison], out_dir: str | os.PathLike | None = None) -> str:
    """The difference report as Markdown (and JSON beside it when `out_dir` is given)."""
    lines = [
        "| Tool | File | Read with | States | Values with the written bits | Values equal to the tool's own conversion | Epochs equal | Worst, half-units of the last digit written | Worst, ulps from the correctly rounded value | Result |",
        "|---|---|---|---|---|---|---|---|---|---|",
    ]
    for c in comparisons:
        bits = "n/a (other units)" if c.same_bits is None else f"{c.same_bits} of {c.values}"
        worst = ("n/a (evaluated) | n/a (evaluated)" if c.evaluated
                 else f"{c.worst_half_units:.3g} | {c.worst_ulps:.3g}")
        if not c.carried:
            result = "FAIL: " + ("; ".join(c.notes) or "a value or an epoch differs")
        elif c.evaluated:
            result = ("carried; evaluated, not read: " + "; ".join(c.notes)
                      + ("; the tool rounds further than the digits written" if c.rounds_further else ""))
        elif c.rounds_further:
            result = "carried; the tool rounds further than the digits written"
        else:
            result = "carried, to the digits written"
        lines.append(
            f"| {c.tool} | {c.fmt} | {c.how} | {c.states} | {bits} | "
            f"{c.tool_conversion_exact} of {c.values} | {c.epochs_equal} of {c.states} | "
            f"{worst} | {result} |"
        )
    md = "\n".join(lines) + "\n"
    if out_dir:
        out = Path(out_dir)
        out.mkdir(parents=True, exist_ok=True)
        tools = sorted({c.tool for c in comparisons})
        stem = "difference-report-" + "-".join(t.lower() for t in tools)
        (out / f"{stem}.md").write_text(md)
        (out / f"{stem}.json").write_text(json.dumps([c.row() for c in comparisons], indent=1) + "\n")
    return md
