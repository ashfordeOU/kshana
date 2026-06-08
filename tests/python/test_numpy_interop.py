# SPDX-License-Identifier: Apache-2.0
"""NumPy-interop tests for the Python bindings (built with `maturin develop --features python`).

These run beside `test_bindings.py` in the same `test-python-bindings` CI job and
prove two things a NumPy user relies on: (1) the numeric columns returned by
`RunOutput.data()` round-trip into real `float64` ndarrays (no object dtype, all
finite), and (2) the engine's classical Allan-deviation curve obeys the *external*
white-FM power law, not a Kshana-internal reference.

The correctness oracle is non-circular. For white frequency-modulation (white FM)
noise the overlapping Allan deviation follows the IEEE-1139 / NIST SP 1065 power law

    sigma_y(tau) = sigma_y(1 s) * tau^(-1/2)        (defining -1/2 log-log slope)

Sources: IEEE Std 1139-2008, "Standard Definitions of Physical Quantities for
Fundamental Frequency and Time Metrology," power-law noise model (Table 2); and
W. J. Riley, NIST Special Publication 1065, "Handbook of Frequency Stability
Analysis" (2008), Ch. 5 / Table 3 -- the same SP1065 the Rust `allan` module cites.
The committed scenario `scenarios/clock-holdover.toml` calibrates the classical
clock as pure white FM (q_rw = 0) with sigma_y(1 s) = 3.0e-10, the published
Microchip SA65 / SA.45s CSAC short-term stability. The analytic line is therefore
sigma_y(tau) = 3.0e-10 / sqrt(tau), and the engine output must lie on it.

numpy is a test-only dependency: the extension itself has zero runtime NumPy
dependency, so numpy is deliberately kept out of the package's runtime
requirements (declared only under the `test` extra / installed inline in CI).
"""
from pathlib import Path

import numpy as np

import kshana

# Use the EXACT committed reference scenario (duration 7200 s, step 10 s, classical
# sigma_y(1 s) = 3.0e-10) so the analytic CSAC oracle below is guaranteed to apply.
# parents[2] == repo root: <root>/tests/python/test_numpy_interop.py.
REPO_ROOT = Path(__file__).resolve().parents[2]
SCENARIO = (REPO_ROOT / "scenarios" / "clock-holdover.toml").read_text()

# Microchip SA65 / SA.45s CSAC datasheet short-term stability (sets the magnitude).
CSAC_SIGMA_Y_1S = 3.0e-10
# Same 25% band the Rust calibration test `csac_white_fm_adev_curve` uses
# (tests/calibration.rs). Measured engine rel-err over tau <= 320 s is 1.7%-10.6%.
ADEV_REL_TOL = 0.25
# Restrict the analytic checks to short tau where the finite-record (721-sample)
# Allan estimate is tight; long-tau bins scatter 15-19% and would flake.
SHORT_TAU_S = 320.0


def _run_data():
    return kshana.run_typed(SCENARIO).data()


def test_data_arrays_are_numpy_convertible_and_finite():
    """The classical adev_curve columns wrap into 1-D float64 ndarrays, all finite."""
    curve = _run_data()["classical"]["adev_curve"]
    assert curve, "adev_curve is empty"
    adev = np.asarray([p["adev"] for p in curve], dtype=float)
    tau = np.asarray([p["tau_s"] for p in curve], dtype=float)
    assert adev.dtype == np.float64
    assert tau.dtype == np.float64
    assert adev.ndim == 1 and tau.ndim == 1
    assert adev.shape == tau.shape
    assert np.all(np.isfinite(adev))
    assert np.all(np.isfinite(tau))


def test_series_error_column_is_a_numeric_ndarray():
    """The timing-error series is a finite numeric ndarray of the expected length."""
    series = _run_data()["classical"]["series"]
    err = np.asarray([s["error_ns"] for s in series])
    assert err.dtype.kind == "f"
    # 7200 s duration / 10 s step + endpoint = 721 samples.
    assert len(err) == 721
    assert np.isfinite(err).all()


def test_classical_adev_matches_white_fm_power_law():
    """Headline non-circular oracle: IEEE-1139 / SP1065 white-FM law sigma_y(tau)=3e-10*tau^(-1/2)."""
    curve = _run_data()["classical"]["adev_curve"]
    taus = np.asarray([p["tau_s"] for p in curve], dtype=float)
    adev = np.asarray([p["adev"] for p in curve], dtype=float)

    # (a) Magnitude band against the analytic line over the short-tau region.
    mask = taus <= SHORT_TAU_S
    assert mask.sum() >= 3, "need several short-tau points for a meaningful band check"
    analytic = CSAC_SIGMA_Y_1S / np.sqrt(taus[mask])
    rel_err = np.abs(adev[mask] - analytic) / analytic
    assert np.all(rel_err < ADEV_REL_TOL), f"max rel-err {rel_err.max():.3f} exceeds {ADEV_REL_TOL}"

    # (b) Log-log slope: white FM has the defining -1/2 slope (IEEE-1139). A wrong
    # noise model would give a different slope, so this is the strongest external check.
    slope = np.polyfit(np.log10(taus[mask]), np.log10(adev[mask]), 1)[0]
    assert -0.65 < slope < -0.35, f"log-log slope {slope:.3f} not consistent with white-FM -1/2"


def test_quantum_holds_over_at_least_as_long_as_classical():
    """Physics oracle: the ~1e6x quieter quantum clock must coast at least as long."""
    data = _run_data()
    q = data["quantum"]["fom"]["holdover_s"]
    c = data["classical"]["fom"]["holdover_s"]
    assert q >= c
