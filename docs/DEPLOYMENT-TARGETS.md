# Where Kshana runs, and where it does not

A scope boundary, written down so that nobody discovers it as a commitment in a meeting.

Abbreviations: CPU, central processing unit; GPU, graphics processing unit; NPU, neural
processing unit; FPGA, field-programmable gate array; MCU, microcontroller unit; RTOS,
real-time operating system; OPS-SAT, the European Space Agency's in-orbit software
laboratory satellite.

## Runs

| Target | How | Notes |
|---|---|---|
| Linux, macOS and Windows workstations and servers, x86-64 and 64-bit ARM | the `kshana` binary, or the Rust crate | the release binaries and the channel-parity check cover these |
| Python 3 | the `kshana` wheel on PyPI (`--features python`) | wheels for Linux, macOS and Windows, x86-64 and 64-bit ARM |
| Browsers and JavaScript runtimes | the WebAssembly package on npm (`--features wasm`) | the same engine, compiled to WebAssembly |
| Linux-class payload computers | the Rust crate or the binary, cross-compiled | OPS-SAT-class payload computers and similar |
| Edge nodes with a GPU, NPU or FPGA beside a Linux CPU | on the Linux CPU | Kshana uses none of the accelerators; it runs beside them |

## Does not run

**A bare-metal flight MCU or a small RTOS without the Rust standard library.** Kshana is
a `std` crate throughout: it allocates on the heap, reads files, formats JSON, and uses
the standard library's floating-point functions. There is no `no_std` build and no
feature that produces one.

**Decision: we do not offer a `no_std` flight core.** Building one would be a separate
product with its own verification burden, and it would put Kshana into flight software,
where qualification is a programme of its own that we have no route through.

## What to do instead

- **Run Kshana on the ground or on a payload computer, and upload its results.** The
  `slot-timing` kind produces exactly the numbers a flight computer needs: a fix
  cadence, a breach time, a guard. A table of them is a few bytes.
- **Port a closed form, if one is all that is needed.** The holdover inversion is a
  short monotone root-find over a polynomial variance, documented with its equations in
  [`SLOT-TIMING.md`](SLOT-TIMING.md). Re-implementing it in flight code is
  straightforward; code derived from Kshana stays under Kshana's licence.

## Also out of scope

Hard real-time guarantees (Kshana allocates and makes no worst-case execution-time
claim); flight qualification of anything; and a synchronisation protocol, a controller
or a routing stack. Kshana supplies the timing evidence those systems are designed
against. It is not one of them.
