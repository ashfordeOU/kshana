# Portable FFT on a second architecture

The fast Fourier transform (FFT) in `src/portable_math.rs` claims the same output bits on
every platform. The unit test `portable_math::tests::fft_output_bits_are_pinned_on_every_platform`
pins a SHA-256 digest of the forward and inverse transforms at the GPS L1 one-millisecond
lengths (8000 and 24000 points). This folder holds the runner that executes the same test
compiled for WebAssembly (wasm32-wasip1) under the wasmtime runtime (Apache-2.0 licence, run
through its Python binding), so the pinned digest is checked on a second instruction set,
not argued.

```sh
rustup target add wasm32-wasip1
python3 -m venv .venv && .venv/bin/pip install wasmtime
CARGO_TARGET_WASM32_WASIP1_RUNNER=".venv/bin/python xval/portable-fft-wasm/wasi_run.py" \
  cargo test --target wasm32-wasip1 --lib portable_math -- --test-threads=1
```

Recorded run (2026-10-02, wasmtime 49.0.0 Python binding, Rust 1.93.0): 8 of 8
`portable_math` tests pass on wasm32-wasip1, including the pinned FFT digests, which are the
digests the x86_64 build produces. The Node.js 22 WASI runner crashed on the 49 MB debug test
module, which is why wasmtime is used.
