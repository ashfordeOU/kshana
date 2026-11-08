# SPDX-License-Identifier: AGPL-3.0-only
"""Run the code cells of the flight-dynamics notebooks top to bottom, as CI does.

    python integrations/flight-dynamics/run_notebooks.py orekit [gmat ...]

Each notebook runs in this directory, with KSHANA_FD_OUT (default: a temporary directory) for the
files it writes and the difference report. A failing assertion fails the run.
"""
import json
import os
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent


def run(name: str) -> None:
    nb = json.loads((HERE / f"{name}.ipynb").read_text())
    md = (HERE / f"{name}.md").read_text()
    code = ["".join(c["source"]) for c in nb["cells"] if c["cell_type"] == "code"]
    for i, src in enumerate(code):
        assert src.strip() in md, f"{name}.ipynb cell {i} is not in {name}.md: regenerate it with jupytext"
    os.chdir(HERE)
    env: dict = {"__name__": "__notebook__"}
    for i, src in enumerate(code):
        print(f"--- {name} [cell {i}]", flush=True)
        exec(compile(src, f"{name}[cell {i}]", "exec"), env)


if __name__ == "__main__":
    for n in sys.argv[1:] or ["orekit"]:
        run(n)
    print("notebooks: OK")
