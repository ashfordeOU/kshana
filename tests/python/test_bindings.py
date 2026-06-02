# SPDX-License-Identifier: Apache-2.0
"""Smoke tests for the Python bindings (built with `maturin develop --features python`).

Covers the full public surface: version(), __version__, run() -> JSON string, and
run_full() -> (json, svg, summary), plus a JSON-parse round-trip. Run in CI by the
`test-python-bindings` job.
"""
import json

import kshana

CLOCK_SCENARIO = """
seed = 42
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 600.0
[gnss]
windows = [ {t0=0.0,t1=120.0,state="nominal"}, {t0=120.0,t1=600.0,state="denied"} ]
[clock_quantum]
id = "optical"
provenance = "test"
y0 = 1.0e-13
q_wf = 1.0e-26
q_rw = 1.0e-34
[clock_classical]
id = "csac"
provenance = "test"
y0 = 1.0e-11
q_wf = 1.0e-24
q_rw = 1.0e-32
"""


def test_version_is_nonempty_semver():
    v = kshana.version()
    assert isinstance(v, str) and v.count(".") == 2
    assert kshana.__version__ == v


def test_run_returns_parseable_json_with_expected_keys():
    out = kshana.run(CLOCK_SCENARIO)
    assert isinstance(out, str) and out
    result = json.loads(out)
    for key in ("schema_version", "engine_version", "scenario_hash", "quantum", "classical"):
        assert key in result, f"missing key {key}"
    # The quieter quantum clock should hold over at least as long as the classical one.
    assert result["quantum"]["fom"]["holdover_s"] >= result["classical"]["fom"]["holdover_s"]
    # ADEV curve is exposed.
    assert len(result["quantum"]["adev_curve"]) > 0


def test_run_full_returns_json_svg_summary():
    j, svg, summary = kshana.run_full(CLOCK_SCENARIO)
    assert json.loads(j)["schema_version"]
    assert svg.lstrip().startswith("<svg")
    assert "scenario" in summary


def test_invalid_scenario_raises():
    import pytest

    with pytest.raises(Exception):
        kshana.run("this = is not a valid scenario")
