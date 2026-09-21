# Fault-Observability Anchor — Provenance Notice

This directory holds the **single Validated row** for the fault-observability module
(`src/lunar_faultobs.rs`), reproduced by `tests/lunar_faultobs_reference.rs`.

## Decision: independent numpy/scipy oracle (not a published RAIM/ARAIM case)

The build-time decision was to FIRST attempt reproducing a published RAIM/ARAIM worked
numeric example (Brown 1992 parity/slope; Blanch et al. 2015 MHSS protection level) as
an external published-vector oracle. Those papers specify the **method** but do **not**
publish a complete, reproducible numeric case — the exact geometry matrix, weights, and
output values to the precision (`< 1e-3`) an honest external-vector check requires.
Rather than fabricate or approximate a "published" value (which would make the external
oracle hollow), this anchor uses the **proven P3/P4 pattern**: an **independent
numpy/scipy linear-algebra reproduction** of the pipeline on real-DE440 rows, with the
oracle computing every quantity by a genuinely different numerical route than the crate.

## What is Validated (read carefully)

The **only** Validated claim here is that kshana's fault-observability **linear-algebra
pipeline** reproduces an **independent numpy/scipy computation** of the same pipeline to
**relative error < 1e-3 AND absolute error < 1e-3** (integer counts exactly), on the
same real-DE440-derived observation rows. The four quantities:

1. **Parity projector** `P⊥ = I − G(GᵀWG)⁺GᵀW` (`parity_projector`) — full `84×84`
   matrix, element-wise (achieved max abs `1.4e-12`, max rel `6.6e-10`).
2. **Detectability** `‖P⊥·b‖` for in-range (undetectable) and generic (detectable)
   faults (`is_detectable`).
3. **MDB non-centrality quadratic form** `cᵀWP⊥c` — the correct single-`P⊥` Baarda form
   — and `MDB = √(λ₀/cᵀWP⊥c)` (`mdb`).
4. **Byzantine block-spark** detect/identify counts of the stacked effective peer
   signatures `P⊥·B_T` (`byzantine_bound`).

## What is NOT Validated (scope guard)

This Validates the **numerical pipeline on these specific rows only**. It is emphatically
**not**:

- an operational integrity guarantee, a protection-level certification, or any RAIM/ARAIM
  availability claim;
- a Byzantine-fault-tolerance **mission guarantee**. The block-spark **bound**
  (`detect > f`, `identify > 2f`) is **Cited** (Fawzi–Tabuada–Diggavi 2014;
  Shoukry–Tabuada 2016; block-wise spark of Donoho–Elad 2003) and **Proven-instantiation**
  in code; the specific tolerated-fault **count** for this network is **Modelled**, not an
  externally certified resilience figure;
- certified, flight-validated, or derived from actual mission data.

The node **geometry** (which nodes, where) is **Modelled** (documented, deterministic).
The external ingredient is the **real DE440 Moon PA-frame orientation** carried in every
inter-node line of sight (see below).

## The network (Modelled geometry, real-DE440 line of sight)

- **Nodes (`M = 8`):** the five near-side reflectors (`lunar_llr_geometry::reflectors`) plus three
  relay nodes at `[1.6e6, 0.7e6, 0.9e6]`, `[-1.2e6, 1.0e6, -0.8e6]`,
  `[0.3e6, -1.5e6, 1.1e6]` (PA-body metres). `state_dim = 5·M = 40`.
- **Rows (`n = 84`):** one differential inter-node one-way range per (node-pair, elapsed
  window) — `C(8,2) = 28` pairs × 3 windows `{21600, 43200, 86400}` s.
- **Weights:** per-measurement `σ ∈ {0.5, 1.0, 2.0}` cycled by row index, so `W ≠ I`.
  This is deliberate: it is what distinguishes the **correct** `cᵀWP⊥c` from the wrong
  double-`P⊥` form `cᵀP⊥WP⊥c` (which differs from `cᵀWP⊥c` only when `W ≠ I`, since
  `P⊥ ≠ P⊥ᵀ` there). Note `(P⊥c)ᵀW(P⊥c)` is **not** the counterexample — it equals
  `cᵀWP⊥c` for any `W` by W-self-adjointness.
- **Real DE440 ingredient:** each line of sight `û_ab` is formed from
  `lunar_orientation::de440_moon_pa_body_to_inertial` at epoch
  `T0 = (JD 2460310.5 − J2000)/36525` JC (2024-01-01 TT), so the physical libration is
  baked into `G`. This is the genuine external data ingredient.

The eight-dimensional datum⊕timescale gauge is the entire null space of `GᵀWG`, so
`rank(G) = 32` and the parity space is `84 − 32 = 52`-dimensional (`trace(P⊥) = 52`).

## Independence of the oracle (why the tag is meaningful)

`scripts/gen_faultobs_ref.py` imports **only** `numpy`, `scipy`, and `json` (plus stdlib
`os`/`itertools` for paths and coalition enumeration) — **no kshana, no subprocess, no
Rust callout**. It recomputes each quantity by a **different numerical route**:

| quantity | crate (`lunar_faultobs`) | oracle (numpy/scipy) |
|----------|--------------------------|----------------------|
| `P⊥` | cyclic-Jacobi eigendecomposition of `N = GᵀWG`, spectral `λ⁻¹` pseudo-inverse (`fim::crlb`) | **SVD of the whitened design matrix** `W^{1/2}G` (`np.linalg.svd`); `P⊥ = I − W^{-1/2}Ũ_rŨ_rᵀW^{1/2}`; `scipy.linalg.null_space` parity cross-check |
| MDB non-centrality | explicit double sum `cᵀWP⊥c` over its `P⊥` | **textbook Baarda parity-subspace form** `‖Ũ_parityᵀ(W^{1/2}c)‖²` (Baarda 1968; Teunissen 2006) |
| block-spark rank | Gram-eigenvalue count via Jacobi (`sym_eig`) | **numpy SVD singular-value count** with matched cutoff |

Agreement of two independent routes is what makes the Validated tag meaningful — and a
wrong MDB form would not survive it.

## Matched, unambiguous rank cutoff

The crate ranks with `rel_tol = 1e-9` on the eigenvalues of `N` (= the squared singular
values of `W^{1/2}G`). The oracle applies the **identical** relative threshold on `σ²`
(and, for the `scipy.linalg.null_space` cross-check, the matched `rcond = √(1e-9)` on
`σ`). The case is spectrally well separated: the weakest **observable** whitened
direction is at `σ²/σ²_max ≈ 6.3e-6` (retained), while the gauge nulls are at `≲ 1.6e-14`
(discarded) — a `~10⁸` gap — so `rank(G) = 32` and `parity_dim = 52` are unambiguous
under both solvers. (This addresses the M3 rank-ambiguity finding: the network's one
weakly-conditioned direction is far above the cutoff and never straddles it.)

## Byte-consistency

Row/vector floats are written by `examples/gen_faultobs_rows.rs` rounded to 6 decimal
places (`round_decimals: 6`, matching the P3/P4 anchors); serde_json's formatting and
Python's `json.load` parse the written text to the **same doubles**, so the crate and the
oracle operate on identical inputs. The 6-dp rounding lifts the exact gauge-null
directions only to `σ²/σ²_max ≲ 1.6e-14` (from machine precision `~1e-16`), still `~5`
orders below the `1e-9` rank cutoff and `~8` orders below the weakest observable direction
(`≈ 6.3e-6`), so the `rank(G) = 32` / `parity_dim = 52` decomposition is preserved and
unambiguous under both solvers.

## Regenerate

```
cargo run --example gen_faultobs_rows
python3 scripts/gen_faultobs_ref.py
cargo test --test lunar_faultobs_reference
```

Both `network.json` and `reference.json` regenerate **byte-identically**.
