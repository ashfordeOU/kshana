# Python wheel platform tags

Kshana's optional Python extension (`pip install kshana`, from the Python Package Index, PyPI) ships **abi3** wheels — one wheel per
platform, valid across CPython ≥ 3.9 — built by `.github/workflows/wheels.yml`, the one source of
the shipped wheels. The release pipeline calls it on every `v*` tag once the tagged commit has
passed verification (it can also be dispatched by hand for a build without a release). The build
matrix and the resulting platform tags:

| Platform | Runner | maturin `--target` | Wheel platform tag |
|----------|--------|--------------------|--------------------|
| Linux x86_64 | `ubuntu-latest` | `x86_64` | `manylinux_2_28_x86_64` |
| **Linux aarch64** | `ubuntu-latest` (QEMU, the Quick Emulator, in the manylinux container) | `aarch64` | `manylinux_2_28_aarch64` |
| **macOS arm64** | `macos-latest` (Apple-silicon runner) | `aarch64` | `macosx_*_arm64` |
| macOS x86_64 | `macos-latest` (cross-compiled from Apple-silicon, avoiding the scarce `macos-13` Intel runner) | `x86_64` | `macosx_*_x86_64` |
| Windows x64 | `windows-latest` | `x64` | `win_amd64` |
| **Windows arm64** | `windows-11-arm` (native) | `aarch64` | `win_arm64` |

The Python ABI (application binary interface) tag is `cp39-abi3` everywhere (PyO3 `abi3-py39`), so a single wheel per row covers
all supported interpreter versions.

## ABI floor (Linux)

The Linux wheels are pinned to the **`manylinux_2_28`** container (GLIBC, the GNU C library, 2.28 — RHEL (Red Hat Enterprise Linux) 8 / Ubuntu
20.04 era). `auditwheel show` (the reference tool of the Python Packaging Authority, PyPA) is run in continuous integration (CI) on each Linux wheel and the
job **fails** unless the wheel is tagged `manylinux_2_28_<arch>`, so the ABI floor is enforced
independently of Kshana for both x86_64 and aarch64.

## ARM verification

- The **aarch64 Linux** wheel cross-builds under QEMU inside the manylinux
  container, and a best-effort `arm-install-smoke` job (`runs-on: ubuntu-24.04-arm`, its steps
  marked `continue-on-error` so it can never hold a release) `pip install`s it on a native ARM64
  runner `--only-binary :all:` (no source build) and imports the module — proving the wheel is
  installable on real ARM hardware.
- The **macOS arm64** wheel builds natively on the Apple-silicon `macos-latest` runner.
- The **Windows arm64** wheel builds **natively** on a GitHub-hosted `windows-11-arm` runner
  (target `aarch64-pc-windows-msvc`); building on the runner's own architecture avoids the
  abi3 cross-build platform-tag mismatch that skips the wheel on an x86-64 host.

## Producing the release assets

The wheels this workflow builds are the wheels PyPI receives: `publish.yml` calls it, and its PyPI
job uploads exactly the `wheels-*` artifacts it produced. Until 0.27.2 `publish.yml` carried its own
hand-copied six-target matrix, so the auditwheel tag gate and the rebuild-and-diff check graded a
second set of wheels that were never uploaded. Now both checks run on the shipped wheels, before
any registry is touched: a Linux wheel with the wrong tag, or a wheel that does not rebuild
byte-identically, stops the whole release, not just PyPI. After publishing, the release pipeline's
`parity` job confirms PyPI serves the source distribution and one wheel for each of the six
platforms above ([`docs/RELEASING.md`](RELEASING.md)).
