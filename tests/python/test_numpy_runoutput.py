# SPDX-License-Identifier: AGPL-3.0-only
"""FUT-26: the NumPy accessors of `RunOutput` (`array`, `columns`, `series`).

Oracle: equality with the list path. Every array these return must be exactly
`numpy.asarray(...)` of the same values read from `RunOutput.data()`: same dtype,
same shape, bit-identical values (`np.array_equal`, no tolerance).
"""
from pathlib import Path

import numpy as np
import pytest

import kshana

REPO_ROOT = Path(__file__).resolve().parents[2]
CLOCK = (REPO_ROOT / "scenarios" / "clock-holdover.toml").read_text()


def _same(a, b):
    assert a.dtype == b.dtype
    assert a.shape == b.shape
    assert np.array_equal(a, b, equal_nan=a.dtype.kind == "f")


@pytest.fixture(scope="module")
def out():
    return kshana.run_typed(CLOCK)


def test_columns_equal_the_list_path(out):
    records = out.data()["classical"]["series"]
    cols = out.columns("classical.series")
    assert cols, "no numeric columns"
    assert set(cols) == {
        k for k, v in records[0].items()
        if all(isinstance(r.get(k), (int, float)) and not isinstance(r.get(k), bool) for r in records)
    }
    for name, arr in cols.items():
        _same(arr, np.asarray([r[name] for r in records]))
    assert len(cols["error_ns"]) == 721


def test_json_pointer_and_dotted_paths_agree(out):
    a = out.columns("classical.adev_curve")
    b = out.columns("/classical/adev_curve")
    assert a.keys() == b.keys()
    for k in a:
        _same(a[k], b[k])


def test_array_of_numbers_equals_the_list_path():
    sweep = kshana.run_typed((REPO_ROOT / "scenarios" / "sweep-nd-inertial.toml").read_text())
    data = sweep.data()
    _same(sweep.array("shape"), np.asarray(data["shape"]))
    for i, p in enumerate(data["points"]):
        _same(sweep.array(f"points.{i}.coords"), np.asarray(p["coords"]))
        _same(sweep.array(f"/points/{i}/metrics"), np.asarray(p["metrics"]))
    assert sweep.array("shape").dtype.kind == "i"
    assert sweep.array("points.0.coords").dtype == np.float64


def test_series_covers_every_record_list(out):
    s = out.series()
    assert "classical.series" in s and "classical.adev_curve" in s
    for path, cols in s.items():
        direct = out.columns(path)
        assert cols.keys() == direct.keys()
        for k in cols:
            _same(cols[k], direct[k])


def test_errors(out):
    with pytest.raises(KeyError):
        out.array("no.such.path")
    with pytest.raises(ValueError):
        out.array("classical.series")  # records, not numbers
    with pytest.raises(ValueError):
        out.columns("classical.adev_curve.0")  # an object, not a list
