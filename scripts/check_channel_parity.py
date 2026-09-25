#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Wait until every distribution channel serves one release version, or fail.

    scripts/check_channel_parity.py 0.27.3

Run by release.yml after the publishes, and runnable by hand against any version
(it only reads public registry pages). Exit 0 when every REQUIRED channel serves the
version; exit 1 when the deadline passes first.

WHY THIS EXISTS
  A publish job that reports success is not the same thing as a channel that serves the
  version. v0.27.0 reached npm and the Python Package Index (PyPI) but not crates.io,
  and PyPI is missing 0.22.0 and 0.23.0 altogether. Nothing looked at the channels
  afterwards, so each gap was found by hand, later. This asks each registry directly.

REQUIRED channels (the run fails without them):
  crates.io  kshana and kshana-mcp, at the version and not yanked
  npm        kshana at the version
  PyPI       kshana at the version, with the source distribution AND a wheel for each
             of the six platforms the release builds (docs/WHEEL_TAGS.md), so a
             release that lost one platform does not read as complete
  ghcr.io    the kshana-mcp container image tagged with the version

BEST-EFFORT channels (reported, never fatal):
  docs.rs       builds documentation on its own queue, which can take hours
  MCP registry  publishing there is opt-in (the MCP_REGISTRY_PUBLISH repository variable)

Knobs (environment): PARITY_TIMEOUT_SECONDS (default 2700), PARITY_INTERVAL_SECONDS
(default 30). A registry that cannot be reached counts as "not yet", never as a pass.
"""

from __future__ import annotations

import json
import os
import re
import sys
import time
import urllib.error
import urllib.request

# crates.io rejects requests without an identifying User-Agent (its crawler policy).
USER_AGENT = "kshana-release-parity (https://github.com/ashfordeOU/kshana)"
GHCR_IMAGE = "ashfordeou/kshana-mcp"
MCP_SERVER = "io.github.ashfordeOU%2Fkshana-mcp"

# One pattern per platform wheel the release builds (wheels.yml matrix).
PYPI_WHEELS = {
    "Linux x86_64": r"-manylinux_2_28_x86_64\.whl$",
    "Linux aarch64": r"-manylinux_2_28_aarch64\.whl$",
    "macOS arm64": r"-macosx_\d+_\d+_arm64\.whl$",
    "macOS x86_64": r"-macosx_\d+_\d+_x86_64\.whl$",
    "Windows x86_64": r"-win_amd64\.whl$",
    "Windows arm64": r"-win_arm64\.whl$",
}


def fetch(url: str, headers: dict[str, str] | None = None) -> tuple[int, bytes]:
    """GET a URL; return (status, body). Network failure is status 0."""
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, **(headers or {})})
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            return resp.status, resp.read()
    except urllib.error.HTTPError as err:
        return err.code, b""
    except (urllib.error.URLError, TimeoutError, OSError) as err:
        return 0, str(err).encode()


def fetch_json(url: str) -> tuple[int, object]:
    status, body = fetch(url)
    if status != 200:
        return status, None
    try:
        return status, json.loads(body)
    except ValueError:
        return 0, None


def crates(name: str, version: str) -> tuple[bool, str]:
    status, doc = fetch_json(f"https://crates.io/api/v1/crates/{name}/{version}")
    if doc is None:
        return False, f"HTTP {status}"
    v = doc.get("version") or {}
    if v.get("num") != version:
        return False, f"serves {v.get('num')!r}"
    if v.get("yanked"):
        return False, "version is yanked"
    return True, "served"


def npm(version: str) -> tuple[bool, str]:
    status, doc = fetch_json(f"https://registry.npmjs.org/kshana/{version}")
    if doc is None:
        return False, f"HTTP {status}"
    if doc.get("version") != version:
        return False, f"serves {doc.get('version')!r}"
    return True, "served"


def pypi(version: str) -> tuple[bool, str]:
    status, doc = fetch_json(f"https://pypi.org/pypi/kshana/{version}/json")
    if doc is None:
        return False, f"HTTP {status}"
    if (doc.get("info") or {}).get("version") != version:
        return False, f"serves {(doc.get('info') or {}).get('version')!r}"
    files = [u.get("filename", "") for u in doc.get("urls") or []]
    missing = [
        label
        for label, pattern in PYPI_WHEELS.items()
        if not any(re.search(pattern, f) for f in files)
    ]
    if f"kshana-{version}.tar.gz" not in files:
        missing.append("source distribution")
    if missing:
        return False, "missing " + ", ".join(missing)
    return True, f"served ({len(files)} files)"


def ghcr(version: str) -> tuple[bool, str]:
    status, body = fetch(f"https://ghcr.io/token?scope=repository:{GHCR_IMAGE}:pull")
    if status != 200:
        return False, f"token HTTP {status}"
    try:
        token = json.loads(body)["token"]
    except (ValueError, KeyError):
        return False, "no anonymous pull token (is the package public?)"
    accept = ", ".join(
        [
            "application/vnd.oci.image.index.v1+json",
            "application/vnd.docker.distribution.manifest.list.v2+json",
            "application/vnd.oci.image.manifest.v1+json",
            "application/vnd.docker.distribution.manifest.v2+json",
        ]
    )
    status, _ = fetch(
        f"https://ghcr.io/v2/{GHCR_IMAGE}/manifests/{version}",
        {"Authorization": f"Bearer {token}", "Accept": accept},
    )
    return (status == 200), ("served" if status == 200 else f"HTTP {status}")


def docs_rs(version: str) -> tuple[bool, str]:
    status, doc = fetch_json(f"https://docs.rs/crate/kshana/{version}/status.json")
    if doc is None:
        return False, f"HTTP {status}"
    return (doc.get("doc_status") is True), f"doc_status={doc.get('doc_status')}"


def mcp_registry(version: str) -> tuple[bool, str]:
    status, _ = fetch(
        f"https://registry.modelcontextprotocol.io/v0/servers/{MCP_SERVER}/versions/{version}"
    )
    return (status == 200), ("served" if status == 200 else f"HTTP {status}")


def main(argv: list[str]) -> int:
    if len(argv) != 2 or not re.fullmatch(r"\d+\.\d+\.\d+", argv[1]):
        print("usage: check_channel_parity.py <X.Y.Z>", file=sys.stderr)
        return 2
    version = argv[1]
    timeout = int(os.environ.get("PARITY_TIMEOUT_SECONDS", "2700"))
    interval = int(os.environ.get("PARITY_INTERVAL_SECONDS", "30"))

    checks = {
        # name: (probe, required)
        "crates.io kshana": (lambda: crates("kshana", version), True),
        "crates.io kshana-mcp": (lambda: crates("kshana-mcp", version), True),
        "npm kshana": (lambda: npm(version), True),
        "PyPI kshana": (lambda: pypi(version), True),
        "ghcr.io kshana-mcp": (lambda: ghcr(version), True),
        "docs.rs kshana": (lambda: docs_rs(version), False),
        "MCP registry kshana-mcp": (lambda: mcp_registry(version), False),
    }
    state: dict[str, tuple[bool, str]] = {name: (False, "not checked") for name in checks}
    deadline = time.monotonic() + timeout
    round_no = 0
    while True:
        round_no += 1
        for name, (probe, _required) in checks.items():
            if not state[name][0]:
                state[name] = probe()
        print(f"-- round {round_no} --")
        for name, (ok, detail) in state.items():
            tag = "required" if checks[name][1] else "best-effort"
            print(f"  {'OK  ' if ok else 'WAIT'} {name:<26} {detail} [{tag}]")
        pending = [n for n, (ok, _) in state.items() if not ok and checks[n][1]]
        optional = [n for n, (ok, _) in state.items() if not ok and not checks[n][1]]
        if not pending and not optional:
            break
        if time.monotonic() + interval > deadline:
            break
        if not pending and round_no > 1:
            # Every required channel is in; do not hold the run hostage to docs.rs.
            break
        sys.stdout.flush()
        time.sleep(interval)

    for name in (n for n, (ok, _) in state.items() if not ok and not checks[n][1]):
        print(f"::warning::{name} does not serve {version} yet: {state[name][1]}")
    pending = [n for n, (ok, _) in state.items() if not ok and checks[n][1]]
    if pending:
        for name in pending:
            print(f"::error::{name} does not serve {version}: {state[name][1]}")
        print(f"FAIL: {len(pending)} required channel(s) never served {version} "
              f"within {timeout} s.")
        return 1
    print(f"OK: every required channel serves {version}.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
