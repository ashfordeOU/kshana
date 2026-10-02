# SPDX-License-Identifier: AGPL-3.0-only
"""Run a wasm32-wasip1 test binary under wasmtime: wasi_run.py <module.wasm> [test args]."""
import sys, wasmtime
eng = wasmtime.Engine(); store = wasmtime.Store(eng)
cfg = wasmtime.WasiConfig(); cfg.argv = sys.argv[1:]; cfg.inherit_stdout(); cfg.inherit_stderr(); cfg.inherit_env()
store.set_wasi(cfg)
linker = wasmtime.Linker(eng); linker.define_wasi()
mod = wasmtime.Module.from_file(eng, sys.argv[1])
inst = linker.instantiate(store, mod)
try:
    inst.exports(store)["_start"](store)
except wasmtime.ExitTrap as e:
    sys.exit(e.code)
