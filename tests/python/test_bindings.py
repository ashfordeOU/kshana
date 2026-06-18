# SPDX-License-Identifier: AGPL-3.0-only
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


def test_run_typed_exposes_strings_and_parsed_dict():
    out = kshana.run_typed(CLOCK_SCENARIO)
    # Typed string accessors mirror run_full().
    assert json.loads(out.json)["schema_version"]
    assert out.svg.lstrip().startswith("<svg")
    assert "scenario" in out.summary
    # .data() returns a parsed dict, not a string — no re-parsing needed.
    data = out.data()
    assert isinstance(data, dict)
    assert data["scenario_hash"] == json.loads(out.json)["scenario_hash"]
    assert data["quantum"]["fom"]["holdover_s"] >= data["classical"]["fom"]["holdover_s"]
    # A numeric list from the result is NumPy-wrappable.
    adev = data["quantum"]["adev_curve"]
    assert isinstance(adev, list) and len(adev) > 0
    assert repr(out).startswith("RunOutput(")


def test_scenario_kinds_is_a_list_of_dicts():
    kinds = kshana.scenario_kinds()
    assert isinstance(kinds, list) and len(kinds) > 0
    assert all(isinstance(k, dict) and "name" in k for k in kinds)
    # Same content as the JSON-string form.
    assert len(kinds) == len(json.loads(kshana.list_kinds()))


def test_validate_toml_reports_errors_without_raising():
    assert kshana.validate_toml(CLOCK_SCENARIO) == []
    errs = kshana.validate_toml("this = is not a valid scenario")
    assert isinstance(errs, list) and len(errs) >= 1 and isinstance(errs[0], str)
