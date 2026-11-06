# Safety review: kshana-capi

The `kshana` library forbids unsafe code (`#![forbid(unsafe_code)]` in `src/lib.rs`). A C interface
cannot be written without it, so the unsafe code it needs lives in this crate alone, in one file
(`src/lib.rs`), and this note is its review. Reviewed 6 Nov 2026, against kshana-capi 0.40.0.

## The unsafe operations

| Where | Operation | Why it is sound |
|---|---|---|
| `arg` | `CStr::from_ptr(p)` | Only after a null check. The caller's contract (the header and each function's `# Safety`) is a NUL-terminated string that stays valid for the call. The length is checked against `KSHANA_MAX_INPUT_BYTES` before any use, and the bytes are read as UTF-8 or refused. |
| `set` | `*p = v` | Only after a null check. The contract makes every out-pointer null or valid for one write. When the out-pointer is null, the string is freed here instead, so nothing leaks. |
| `set` | `CString::from_raw(v)` | `v` came from `CString::into_raw` in `out` a moment before and was never handed out. |
| `kshana_string_free` | `CString::from_raw(s)` | The contract: `s` is null (ignored) or a pointer this library returned and not yet freed. This is the one rule a C caller can break (a double free, or a foreign pointer), as with any C allocator. |

Nothing else is unsafe. `#![deny(unsafe_op_in_unsafe_fn)]` makes every operation inside an
`unsafe fn` carry its own `unsafe` block and `SAFETY` comment.

## The boundary

- **No unwinding into C.** Every entry point runs its work inside `catch_unwind`, and a panic becomes
  `KSHANA_INTERNAL` with a message. The engine's own code is `forbid(unsafe_code)`, so a panic there
  cannot leave memory in an unsafe state.
- **No global state.** Each call owns everything it allocates, so the functions may run on many
  threads at once (`tests/c_api.rs`, `calls_from_many_threads_at_once`).
- **Out strings.** Each is written once, is NUL-terminated and comes from Rust's allocator. It must
  go back through `kshana_string_free` (never `free`). An interior NUL, which the engine never
  produces, would be replaced so the string cannot be cut short.
- **Input cap.** 64 MiB a string, stated in the header.

## Checks

`tests/c_api.rs`, run in CI by the `capi-check` job:

- Each entry point, called through the C convention, gives the library's own results. A null
  pointer and non-UTF-8 text each give `KSHANA_BAD_ARGUMENT`, and null out-pointers are allowed.
- The header declares exactly the exported functions and the same constants.
- The C example (`examples/c/run_and_map.c`) builds with `-Wall -Wextra -Werror` against the static
  and the shared library, and runs.
- A fuzz pass sends random bytes, and real inputs with bytes changed, into `kshana_validate_scenario`
  and `kshana_connect_map`. Every call must return a documented code, never crash, and never report
  an internal failure. Set `KSHANA_CAPI_FUZZ_ITERATIONS` for a longer run. `kshana_run_scenario` is
  left out of the fuzz pass on purpose: a changed scenario can validly ask for a very long run.
  Validation covers the same parser.

Not done yet: a sanitizer run (AddressSanitizer) of the C example in CI, and the C++, Go, Java,
MATLAB and LabVIEW examples the plan lists.
