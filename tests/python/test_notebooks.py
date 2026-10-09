# SPDX-License-Identifier: AGPL-3.0-only
"""Execute the code cells of the 0.35 notebooks on the repository's synthetic data.

Only the notebooks listed here are run (the older one builds a day-long orbit scenario and is
exercised elsewhere). The cells run from the repository root, so the data helper reads the
clone and never touches the network.
"""
import json
import os
from pathlib import Path

import pytest

REPO = Path(__file__).resolve().parents[2]
NOTEBOOKS = ["vessel-trust-and-training", "interference-map-route-exposure"]


@pytest.mark.parametrize("name", NOTEBOOKS)
def test_notebook_code_cells_run(name, monkeypatch):
    nb = json.loads((REPO / "notebooks" / f"{name}.ipynb").read_text())
    monkeypatch.chdir(REPO)
    env: dict = {"__name__": "__notebook__"}
    for i, cell in enumerate(nb["cells"]):
        if cell["cell_type"] != "code":
            continue
        exec(compile("".join(cell["source"]), f"{name}[cell {i}]", "exec"), env)
    assert os.getcwd() == str(REPO)
