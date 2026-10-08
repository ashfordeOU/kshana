# SPDX-License-Identifier: AGPL-3.0-only
"""Smoke tests for the Python bindings (built with `maturin develop --features python`).

Covers the full public surface: version(), __version__, run() -> JSON string, and
run_full() -> (json, svg, summary), plus a JSON-parse round-trip. Run in CI by the
`test-python-bindings` job.
"""
import json
from pathlib import Path

import kshana

REPO = Path(__file__).resolve().parents[2]

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


CONFLICT_SCENARIO = """
kind = "conflict-resilience"
trials = 1500
seed = 20260709
[[layers]]
name = "GNSS L1 C/A"
availability = 0.99
sigma_m = 4.0
vulnerability = 0.90
vector_weight = 0.58
[layers.vector_profile]
jamming = 0.98
spoofing = 0.85
kinetic = 0.12
cyber = 0.18
[[layers]]
name = "Inertial"
availability = 0.999
sigma_m = 30.0
vulnerability = 0.03
vector_weight = 0.10
[layers.vector_profile]
jamming = 0.0
spoofing = 0.0
kinetic = 0.20
cyber = 0.10
"""


def test_conflict_resilience_per_vector_survival_reachable_from_python():
    # P7-G5: the layered-PNT conflict-resilience analysis and its §4.2 per-vector survival
    # breakdown must be reachable through the Python binding, not only a Rust unit test.
    result = json.loads(kshana.run(CONFLICT_SCENARIO))
    assert result["kind"] == "conflict-resilience"
    pvs = result["per_vector_survival"]
    vectors = {v["vector"] for v in pvs["vectors"]}
    assert vectors == {"jamming", "spoofing", "kinetic", "cyber"}
    # A diverse stack (RF layer + RF-immune inertial) keeps usable PNT under jamming.
    survival = {v["vector"]: v["survival_at_reference"] for v in pvs["vectors"]}
    assert survival["jamming"] > 0.9, "the RF-immune inertial layer carries PNT through jam"
    # The catalogue advertises the scenario.
    names = {k["name"] for k in kshana.scenario_kinds()}
    assert "conflict-resilience" in names


def test_csv_table_matches_the_golden_bytes_and_write_csv_returns_bytes_written(tmp_path):
    # A kind that publishes a reproducibility table: `.csv` must be the exact golden-pinned
    # bytes the CLI writes as `<scenario>.table.csv`, and `write_csv` returns the number of
    # BYTES written (the Rust `RunOutput::write_csv` contract), not characters or rows.
    toml = (REPO / "scenarios" / "realtime-frame-eop.toml").read_text()
    golden = (REPO / "tests" / "golden" / "realtime-frame-eop.csv").read_text()
    out = kshana.run_typed(toml)
    assert out.csv == golden
    dest = tmp_path / "table.csv"
    written = out.write_csv(str(dest))
    assert written == len(golden.encode("utf-8")) == dest.stat().st_size
    assert dest.read_text() == golden
    assert "csv=" in repr(out)


def test_csv_is_none_and_write_csv_is_a_no_op_for_a_kind_without_a_table(tmp_path):
    out = kshana.run_typed(CLOCK_SCENARIO)
    assert out.csv is None
    dest = tmp_path / "table.csv"
    assert out.write_csv(str(dest)) == 0
    assert not dest.exists(), "no file may be created when the kind emits no table"


def test_shipped_moonlight_scenario_emits_no_csv_without_an_export_site():
    # moonlight-service-volume publishes its per-satellite table only when BOTH
    # export_site_lat_deg and export_site_lon_deg are set; the shipped scenario leaves
    # them commented out, so a plain run has no table.
    toml = (REPO / "scenarios" / "moonlight-service-volume.toml").read_text()
    assert kshana.run_typed(toml).csv is None


# --- GNSS IQ layer (src/iq) ---------------------------------------------------------


def test_iq_signals_lists_the_supported_names():
    names = kshana.iq_signals()
    assert isinstance(names, list) and "gps-l1ca" in names
    assert all(isinstance(n, str) for n in names)


def test_iq_scene_then_acquire_recovers_the_injected_signals():
    # A noise-free two-satellite scene; acquisition must recover both PRNs, with the
    # scene's own truth sidecar as the oracle for the Doppler.
    scene = kshana.iq_scene(
        fs_hz=2_046_000,
        duration_s=0.05,
        signal="gps-l1ca",
        prns=[5, 12],
        dopplers=[1000.0, -1500.0],
        cn0_dbhz=50.0,
        noise=False,
    )
    assert len(scene["samples_i"]) == len(scene["samples_q"]) == int(0.05 * 2_046_000)
    truth0 = {r["sat_id"]: r for r in scene["truth"] if r["t_s"] == 0.0}
    assert set(truth0) == {5, 12}
    dets = kshana.iq_acquire(
        scene["samples_i"], scene["samples_q"], 2_046_000, "gps-l1ca", [5, 12],
        doppler_step=250.0, doppler_max=4000.0,
    )
    assert len(dets) == 2
    for det, prn in zip(dets, (5, 12)):
        assert det["acquired"], det
        assert abs(det["doppler_hz"] - truth0[prn]["doppler_hz"]) <= 250.0


def test_iq_scene_arrays_are_numpy_float64_and_finite():
    import numpy as np

    scene = kshana.iq_scene(
        fs_hz=2_046_000, duration_s=0.02, signal="gps-l1ca", prns=[1], noise=False
    )
    i = np.asarray(scene["samples_i"])
    q = np.asarray(scene["samples_q"])
    assert i.dtype == np.float64 and q.dtype == np.float64
    assert i.ndim == 1 and i.shape == q.shape
    assert np.isfinite(i).all() and np.isfinite(q).all()


def test_iq_track_converges_to_the_injected_doppler_and_locks():
    scene = kshana.iq_scene(
        fs_hz=2_046_000, duration_s=0.8, signal="gps-l1ca", prns=[9],
        dopplers=[1200.0], cn0_dbhz=50.0, noise=False,
    )
    out = kshana.iq_track(scene["samples_i"], scene["samples_q"], 2_046_000, "gps-l1ca", [9])
    epochs = out["channels"][0]["epochs"]
    assert len(epochs) > 500
    last = epochs[-1]
    assert abs(last["doppler_hz"] - 1200.0) < 5.0
    assert last["phase_lock"] is True


DESIGNS = """
schema = "kshana.loop-design/1"
[[design]]
name = "narrow"
[design.carrier]
pll_bw_hz = 8.0
[[design]]
name = "fll-only"
[design.carrier]
kind = "fll"
fll_bw_hz = 5.0
"""


def test_iq_loop_designs_resolves_every_field_and_hashes():
    designs = kshana.iq_loop_designs(DESIGNS)
    assert [d["name"] for d in designs] == ["narrow", "fll-only"]
    assert designs[0]["carrier"]["pll_bw_hz"] == 8.0
    assert designs[1]["carrier"]["pll_order"] is None
    assert len(designs[0]["hash"]) == 64 and designs[0]["hash"] != designs[1]["hash"]
    assert designs[0]["lock"]["reacquire"] is False


def test_iq_track_takes_a_design_and_reports_states_and_the_design():
    import pytest

    scene = kshana.iq_scene(
        fs_hz=2_046_000, duration_s=0.8, signal="gps-l1ca", prns=[9],
        dopplers=[1200.0], cn0_dbhz=50.0, noise=False,
    )
    out = kshana.iq_track(
        scene["samples_i"], scene["samples_q"], 2_046_000, "gps-l1ca", [9],
        design=DESIGNS, design_name="narrow", dll_bw=3.0,
    )
    assert out["design"]["name"] == "narrow"
    assert out["design"]["carrier"]["pll_bw_hz"] == 8.0
    assert out["design"]["code"]["bw_hz"] == 3.0  # the argument overrides the design
    epochs = out["channels"][0]["epochs"]
    assert epochs[0]["state"] == "PULL_IN"
    assert {"i_early", "q_late", "carrier_phase_cycles"} <= set(epochs[0])
    assert abs(epochs[-1]["doppler_hz"] - 1200.0) < 5.0
    # 2.046 MHz is exactly 2 samples per chip: the result warns.
    assert out["warnings"][0]["kind"] == "commensurate_sampling"
    with pytest.raises(ValueError):
        kshana.iq_track(
            scene["samples_i"], scene["samples_q"], 2_046_000, "gps-l1ca", [9],
            design=DESIGNS, design_name="missing",
        )


def test_iq_read_epochs_refuses_a_file_that_is_not_one(tmp_path):
    import pytest

    p = tmp_path / "x.bin"
    p.write_bytes(b"not an epoch file\n")
    with pytest.raises(ValueError):
        kshana.iq_read_epochs(str(p))


def test_iq_acquire_raises_on_an_unknown_signal():
    import pytest

    with pytest.raises(ValueError):
        kshana.iq_acquire([0.0, 0.0], [0.0, 0.0], 2_046_000, "not-a-signal", [1])
