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


def test_iq_acq_surface_peak_matches_iq_acquire():
    scene = kshana.iq_scene(
        fs_hz=2_046_000, duration_s=0.05, signal="gps-l1ca", prns=[5], dopplers=[1200.0], seed=2
    )
    args = (scene["samples_i"], scene["samples_q"], 2_046_000, "gps-l1ca")
    det = kshana.iq_acquire(*args, [5], coherent=4, doppler_max=4000.0)[0]
    surf = kshana.iq_acq_surface(*args, 5, coherent=4, doppler_max=4000.0)
    h = surf["header"]
    assert h["schema"] == "kshana.acq-surface/1"
    assert h["peak"]["doppler_hz"] == det["doppler_hz"]
    assert h["peak"]["delay_samples"] == det["delay_samples"]
    rows = surf["rows"]
    assert len(rows) == len(h["doppler_bins_hz"])
    assert len(rows[0]) == h["samples_per_period"]
    assert rows[h["peak"]["doppler_index"]][h["peak"]["delay_samples"]] == det["statistic"]
    assert abs(h["fine_search"]["correction_hz"]) <= h["doppler_step_hz"]


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


def test_iq_scene_cn0_profile_sets_the_truth_cn0():
    import pytest

    prof = "[[segment]]\nkind = \"step\"\nat_s = 0.2\ndelta_db = -6.0\n"
    scene = kshana.iq_scene(
        fs_hz=2_046_000, duration_s=0.4, signal="gps-l1ca", prns=[9],
        cn0_dbhz=45.0, noise=False, cn0_profile=prof,
    )
    cn0 = {round(r["t_s"], 6): r["cn0_dbhz"] for r in scene["truth"]}
    assert all(abs(v - (39.0 if t >= 0.2 else 45.0)) < 1e-9 for t, v in cn0.items())
    with pytest.raises(ValueError):
        kshana.iq_scene(
            fs_hz=2_046_000, duration_s=0.1, signal="gps-l1ca", prns=[9],
            cn0_profile="[[segment]]\nkind = \"fade\"\ns4 = 3.0\ntau_s = 1.0\n",
        )

def test_iq_monitor_reads_a_recording_file_and_reports_series(tmp_path):
    import numpy as np
    import pytest

    scene = kshana.iq_scene(
        fs_hz=2_046_000, duration_s=1.5, signal="gps-l1ca", prns=[9],
        dopplers=[1200.0], cn0_dbhz=47.0, seed=3,
    )
    x = np.empty(2 * len(scene["samples_i"]), dtype="<f4")
    x[0::2] = scene["samples_i"]
    x[1::2] = scene["samples_q"]
    path = tmp_path / "s.bin"
    x.tofile(path)
    settings = (
        "[power]\nbaseline_s = 0.5\n[spectral]\nbaseline_s = 0.5\n"
        "[epoch.cn0]\nbaseline_s = 0.5\n[epoch.sqm]\nbaseline_s = 0.5\n"
    )
    rep = kshana.iq_monitor(
        str(path), format="cf32_le", rate=2_046_000, signal="gps-l1ca", prns=[9],
        settings=settings,
    )
    names = {s["name"] for s in rep["series"]}
    assert {"power_db", "kurtosis", "cn0_dbhz", "sqm_ratio", "pli"} <= names
    assert rep["events"] == []
    only_power = kshana.iq_monitor(str(path), format="cf32_le", rate=2_046_000, power=True)
    assert {s["name"] for s in only_power["series"]} == {"power_db", "agc_gain_db"}
    with pytest.raises(ValueError):
        kshana.iq_monitor(str(tmp_path / "missing.bin"))


def test_iq_campaign_runs_resumes_and_reports(tmp_path):
    # One synthetic recording stands in for a lab capture: a 3 s scene written as raw
    # interleaved float32 with its sample description in the test-condition file.
    import numpy as np
    import pytest

    fs = 2_046_000
    scene = kshana.iq_scene(
        fs_hz=fs, duration_s=3.0, signal="gps-l1ca", prns=[9], dopplers=[1200.0], cn0_dbhz=45.0
    )
    iq = np.empty(2 * len(scene["samples_i"]), dtype="<f4")
    iq[0::2] = scene["samples_i"]
    iq[1::2] = scene["samples_q"]
    iq.tofile(tmp_path / "rec.cf32")
    (tmp_path / "rec.toml").write_text(
        'schema = "kshana.test-conditions/1"\n'
        '[recording]\nid = "rec"\npath = "rec.cf32"\nformat = "cf32_le"\n'
        f"sample_rate_hz = {fs}.0\nsettle_s = 1.0\n"
        '[[expected]]\nsignal = "gps-l1ca"\nids = [9]\n'
        '[[event]]\nid = "e1"\nkind = "interference"\ntype = "cw"\n'
        "onset_s = 2.0\noffset_s = 2.5\n"
        '[event.power]\nquantity = "js_db"\npoints = [[2.0, 10.0]]\n'
    )
    tc = kshana.iq_test_conditions(str(tmp_path / "rec.toml"))
    assert tc["recording"]["id"] == "rec" and len(tc["hash"]) == 64
    with pytest.raises(ValueError):
        kshana.iq_test_conditions('schema = "kshana.test-conditions/1"\n')

    campaign = tmp_path / "c.toml"
    campaign.write_text(
        'schema = "kshana.campaign/1"\nname = "py"\ndata_class = "synthetic"\n[inputs]\nconditions = ["rec.toml"]\n'
    )
    out = str(tmp_path / "out")
    first = kshana.iq_campaign(str(campaign), out, workers=1)
    assert first["cells_total"] == 1 and first["cells_run"] == 1, first
    assert first["cells_failed"] == [] and len(first["digest"]) == 64
    again = kshana.iq_campaign(str(campaign), out)
    assert again["cells_run"] == 0 and again["cells_skipped"] == 1
    assert again["digest"] == first["digest"]
    rep = kshana.iq_campaign_report(out)
    assert rep["digest"] == first["digest"] and rep["rows"] == 2
    assert (tmp_path / "out" / "report.html").read_text().count("MODELLED") >= 1


def _custom():
    return dict(
        licence="CC0-1.0",
        licence_url="https://creativecommons.org/publicdomain/zero/1.0/",
        attribution="Synthetic data generated for Kshana documentation. Not real observations.",
    )


def test_interference_map_matches_the_committed_synthetic_sample():
    root = REPO / "examples" / "interference-map"
    days = kshana.interference_map(
        "adsb", (root / "input" / "adsb.csv").read_text(), "custom", **_custom()
    )
    assert len(days) == 1 and days[0]["date"] == "2026-03-01"
    doc = json.loads(days[0]["geojson"])
    assert doc["kshana_interference_map"]["schema"] == "kshana-interference-map/v1"
    sample = json.loads((root / "output" / "adsb-2026-03-01.geojson").read_text())
    doc["kshana_interference_map"]["kshana_version"] = "X"
    sample["kshana_interference_map"]["kshana_version"] = "X"
    assert doc == sample
    assert days[0]["cells_flagged"] >= 1


def test_interference_map_and_route_exposure_reject_bad_input():
    import pytest

    with pytest.raises(ValueError):
        kshana.interference_map("radar", "", "custom")
    with pytest.raises(ValueError, match="custom"):
        kshana.interference_map("adsb", "x", "custom")
    with pytest.raises(ValueError):
        kshana.route_exposure('{"type":"LineString","coordinates":[[0,0],[1,1]]}', [])


def test_route_exposure_reports_on_a_map_built_in_memory():
    root = REPO / "examples" / "interference-map"
    day = kshana.interference_map(
        "adsb", (root / "input" / "adsb.csv").read_text(), "custom", **_custom()
    )[0]
    route = '{"type":"LineString","coordinates":[[-50.0,30.2],[-47.0,30.2]]}'
    report = json.loads(kshana.route_exposure(route, [day["geojson"]]))
    assert isinstance(report, dict)


def test_nmea_training_is_deterministic_and_carries_an_instructor_log():
    toml = (REPO / "scenarios" / "training" / "open-sea-jamming.toml").read_text()
    a = kshana.nmea_training(toml)
    assert a == kshana.nmea_training(toml)
    assert a["nmea"] != kshana.nmea_training(toml, seed=7)["nmea"]
    assert "\r\n" in a["nmea"]
    assert json.loads(a["log_json"])["schema"] == "kshana-nmea-training/1"


def test_receiver_trust_scores_a_vessel_log_inline():
    ex = REPO / "examples" / "maritime-trust"
    toml = (ex / "session.toml").read_text().replace(
        'path = "tallinn-helsinki.nmea"',
        "text = '''" + (ex / "tallinn-helsinki.nmea").read_text() + "'''",
    )
    out = kshana.receiver_trust(toml)
    assert "trust" in out.summary.lower() or out.summary
    assert out.data()


def test_receiver_trust_replay_returns_the_gated_stream_for_an_excerpt():
    ex = REPO / "examples" / "maritime-trust"
    session = (ex / "session.toml").read_text().replace(
        'path = "tallinn-helsinki.nmea"', ""
    ).replace("calibration_s = 300.0", "calibration_s = 60.0")
    lines = (ex / "tallinn-helsinki.nmea").read_text().splitlines(keepends=True)
    excerpt = "".join(lines[len(lines) * 1400 // 3000 : len(lines) * 1800 // 3000])
    r = kshana.receiver_trust_replay(session, excerpt, gate=True)
    assert r["epochs"] > 300 and r["untrusted"] > 0 and r["withheld"] > 0
    assert r["gated_nmea"] and kshana.receiver_trust_replay(session, excerpt)["gated_nmea"] is None
    import pytest

    with pytest.raises(ValueError):
        kshana.receiver_trust_replay('[platform]\nkind = "static"', excerpt)
