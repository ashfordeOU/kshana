#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Independent numpy/scipy oracle for the P5 fault-observability Validated anchor.

Reads ``tests/fixtures/faultobs/network.json`` (the measurement Jacobian G, weights,
fault vectors, MDB directions and peer coalitions built by
``examples/gen_faultobs_rows.rs`` on the real-DE440 per-node lunar network) and
INDEPENDENTLY recomputes the fault-observability linear-algebra pipeline of
``kshana::lunar_faultobs`` with numpy/scipy, writing
``tests/fixtures/faultobs/reference.json``.

INDEPENDENCE (this is what makes the Validated tag meaningful)
--------------------------------------------------------------
This oracle imports ONLY ``json`` + ``numpy`` + ``scipy`` (no kshana, no subprocess,
no Rust callout), and computes every quantity by a DIFFERENT numerical route than the
crate:

  * Parity projector P⊥.  The crate forms the normal matrix N = GᵀWG and takes its
    Moore–Penrose pseudo-inverse by a cyclic-Jacobi *eigendecomposition of N* plus a
    spectral λ⁻¹ sum (``fim::crlb``).  This oracle instead takes the *SVD of the
    whitened design matrix* G̃ = W^{1/2}·G directly (``numpy.linalg.svd``) and builds
    the orthogonal projector onto range(G̃) from its left-singular vectors, then maps
    back:  P⊥ = I − W^{-1/2}·(Ũ_r Ũ_rᵀ)·W^{1/2}.  A ``scipy.linalg.null_space`` basis
    of the whitened parity space is used as an independent cross-check.  Never the
    crate's Jacobi-on-N route.

  * MDB non-centrality quadratic form.  The crate evaluates q = cᵀWP⊥c as an explicit
    double sum over its P⊥.  This oracle uses the TEXTBOOK Baarda / DIA form: the
    non-centrality is the squared norm of the fault direction in the *whitened parity
    subspace*,  q = ‖Ũ_parityᵀ · (W^{1/2} c)‖²  (Baarda 1968; Teunissen, Testing
    Theory), computed from the SVD parity basis — not transcribed from the Rust
    expression.  MDB = sqrt(λ₀ / q).

  * Block-spark rank.  The crate counts eigenvalues of the Gram matrix ColsᵀCols via
    its Jacobi solver.  This oracle counts singular values of the stacked effective
    columns via ``numpy.linalg.svd``, with a rank cutoff matched to the crate's
    (σ² > rel_tol·σ²_max ⟺ Gram-eigenvalue > rel_tol·λ_max).

MATCHED, UNAMBIGUOUS RANK CUTOFF
--------------------------------
The crate uses rel_tol = 1e-9 on the eigenvalues of N (= the squared singular values
of G̃).  This oracle applies the identical relative threshold on σ².  The network is
spectrally well separated: the weakest *observable* direction sits at σ²/σ²_max ≈
6.3e-6 (safely retained above 1e-9) while the gauge nulls sit at ≲ 1.6e-14 (the 6-dp
row rounding lifts them from machine precision; still safely discarded), so rank(G) = 32
and parity_dim = 52 are unambiguous under both solvers.

BYTE-CONSISTENCY
----------------
Every row/vector float was rounded to 6 dp in the Rust generator before being written;
this oracle reads the identical JSON doubles.  The only Rust-vs-oracle difference is
the linear-algebra route above; the results agree far inside 1e-3.

Usage::

    python3 scripts/gen_faultobs_ref.py
"""
import itertools
import json
import os

import numpy as np
import scipy.linalg

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.join(HERE, "..")
FIXTURE_DIR = os.path.join(ROOT, "tests", "fixtures", "faultobs")
NETWORK_JSON = os.path.join(FIXTURE_DIR, "network.json")
REF_JSON = os.path.join(FIXTURE_DIR, "reference.json")

# Matches the crate's spectral pseudo-inverse / rank threshold (fim::crlb rel_tol).
REL_TOL = 1e-9
# Detectability tolerance (mirrors the Rust tests' is_detectable tol).
DET_TOL = 1e-8


def whitened_svd(G, w):
    """SVD of the whitened design matrix G̃ = W^{1/2} G (INDEPENDENT of the crate's
    eigendecomposition of N = GᵀWG). Returns (U, s, rank) with s descending."""
    sw = np.sqrt(w)                      # W^{1/2} diagonal
    G_tilde = G * sw[:, None]            # n x p
    U, s, _Vt = np.linalg.svd(G_tilde, full_matrices=True)
    smax2 = float(s[0]) ** 2 if s.size else 0.0
    rank = int(np.sum(s**2 > REL_TOL * smax2))
    return U, s, rank, sw


def parity_projector(G, w):
    """P⊥ = I − W^{-1/2}·(Ũ_r Ũ_rᵀ)·W^{1/2}, built from the SVD of the whitened design
    matrix. Returns (P⊥, U, rank, sw)."""
    n = G.shape[0]
    U, _s, rank, sw = whitened_svd(G, w)
    U_range = U[:, :rank]                        # orthonormal basis of range(G̃)
    P_tilde_G = U_range @ U_range.T              # orthogonal projector (whitened)
    inv_sw = 1.0 / sw
    # P⊥ = I − W^{-1/2} P̃_G W^{1/2}
    P_perp = np.eye(n) - inv_sw[:, None] * P_tilde_G * sw[None, :]

    # Independent cross-check: the whitened parity projector I − P̃_G must equal Q Qᵀ
    # for an orthonormal parity basis Q from scipy.linalg.null_space (SVD-based). Its
    # rcond acts on singular values σ, so the crate's σ²-threshold rel_tol maps to
    # rcond = sqrt(rel_tol) (the matched cutoff); the default rcond would be far tighter
    # and miscount the rounding-lifted gauge directions.
    Q = scipy.linalg.null_space((G * sw[:, None]).T, rcond=float(np.sqrt(REL_TOL)))
    assert Q.shape[1] == n - rank, (
        f"parity dim mismatch: null_space gave {Q.shape[1]}, expected {n - rank}"
    )
    P_tilde_perp = Q @ Q.T
    cross = float(np.max(np.abs(P_tilde_perp - (np.eye(n) - P_tilde_G))))
    assert cross < 1e-9, f"SVD vs null_space parity projector disagree: {cross:.3e}"

    return P_perp, U, rank, sw


def parity_basis(U, rank):
    """Orthonormal basis of the whitened parity subspace (left-singular vectors of G̃
    with singular value below the rank cutoff)."""
    return U[:, rank:]


def eff_col_rank(cols):
    """Column rank of a stacked column list via numpy SVD, with the rank cutoff matched
    to the crate's Gram-eigenvalue threshold (σ² > REL_TOL·σ²_max)."""
    if cols.shape[1] == 0:
        return 0
    s = np.linalg.svd(cols, compute_uv=False)
    smax2 = float(s[0]) ** 2
    if smax2 <= 0.0:
        return 0
    return int(np.sum(s**2 > REL_TOL * smax2))


def peer_signature(n_meas, incidence):
    """B_j: column k is the unit vector e_{incidence[k]} in measurement space."""
    B = np.zeros((n_meas, len(incidence)))
    for k, i in enumerate(incidence):
        B[i, k] = 1.0
    return B


def block_spark(peers, P_perp, n_meas, cap=12):
    """Smallest coalition size whose stacked effective columns Ḡ_j = P⊥·B_j are
    column-rank-deficient; if none up to the cap, returns cap+1 (matches the crate)."""
    eff = [P_perp @ peer_signature(n_meas, inc) for inc in peers]
    M = len(peers)
    kmax = min(M, cap)
    for k in range(1, kmax + 1):
        for subset in itertools.combinations(range(M), k):
            cols = np.hstack([eff[j] for j in subset])
            total = cols.shape[1]
            if total == 0:
                continue
            if eff_col_rank(cols) < total:
                return k
    return kmax + 1


def main():
    with open(NETWORK_JSON) as fh:
        net = json.load(fh)

    G = np.array(net["rows"], dtype=np.float64)          # n x p
    sigma = np.array(net["sigma"], dtype=np.float64)     # n
    w = 1.0 / sigma**2                                   # per-measurement weights
    n_meas, state_dim = G.shape

    P_perp, U, rank, sw = parity_projector(G, w)
    U_parity = parity_basis(U, rank)                     # n x (n - rank)
    parity_dim = n_meas - rank

    # ── Detectability: ‖P⊥ b‖₂ for each fault vector ────────────────────────────────
    detectability = {}
    for name, b in net["fault_vectors"].items():
        b = np.array(b, dtype=np.float64)
        pb = P_perp @ b
        norm = float(np.linalg.norm(pb))
        detectability[name] = {"norm": norm, "detectable": bool(norm > DET_TOL)}

    # ── MDB non-centrality quadratic form (textbook Baarda, via parity subspace) ─────
    mdb_out = []
    for d in net["mdb_directions"]:
        c = np.array(d["c"], dtype=np.float64)
        ncp = float(d["ncp"])
        # q = ‖Ũ_parityᵀ (W^{1/2} c)‖²  ==  cᵀ W P⊥ c  (Baarda 1968; Teunissen 2006)
        w_tilde = sw * c
        q = float(np.sum((U_parity.T @ w_tilde) ** 2))
        # Independent consistency: the textbook parity form equals cᵀWP⊥c on our own P⊥.
        q_direct = float(c @ (w * (P_perp @ c)))
        assert abs(q - q_direct) < 1e-9 * max(1.0, abs(q_direct)), (
            f"{d['name']}: Baarda parity form {q:.6e} != cᵀWP⊥c {q_direct:.6e}"
        )
        mdb_val = float(np.sqrt(ncp / q)) if q > 1e-12 else None
        mdb_out.append({"name": d["name"], "q": q, "mdb": mdb_val})

    # ── Byzantine block-spark bound for each peer coalition ──────────────────────────
    block = {}
    for name, peers in net["peer_coalitions"].items():
        bs = block_spark(peers, P_perp, n_meas)
        block[name] = {
            "block_spark": bs,
            "f_detect": bs - 1,
            "f_identify": (bs - 1) // 2,
        }

    reference = {
        "description": (
            "Validated-anchor reference for `tests/lunar_faultobs_reference.rs`. "
            "Computed independently by numpy/scipy (SVD of the whitened design matrix "
            "for P⊥; textbook Baarda parity-subspace form for the MDB non-centrality; "
            "numpy SVD rank for the block spark) from the rows in `network.json` "
            "(real-DE440 per-node network built by `examples/gen_faultobs_rows.rs`). "
            "Validated claim: kshana's lunar_faultobs LA pipeline reproduces these "
            "values to rel<1e-3 AND abs<1e-3 (integer counts exactly)."
        ),
        "oracle": (
            "numpy/scipy: np.linalg.svd (whitened design matrix), "
            "scipy.linalg.null_space (parity cross-check), np.linalg.svd (block rank)"
        ),
        "rel_tol": REL_TOL,
        "det_tol": DET_TOL,
        "n_meas": n_meas,
        "state_dim": state_dim,
        "rank_G": rank,
        "parity_dim": parity_dim,
        "pperp_trace": float(np.trace(P_perp)),
        "pperp_fro": float(np.linalg.norm(P_perp, "fro")),
        "pperp": [[float(x) for x in row] for row in P_perp],
        "detectability": detectability,
        "mdb": mdb_out,
        "block_spark": block,
    }

    os.makedirs(FIXTURE_DIR, exist_ok=True)
    with open(REF_JSON, "w") as fh:
        json.dump(reference, fh, indent=1)

    print(f"n_meas={n_meas} state_dim={state_dim} rank(G)={rank} parity_dim={parity_dim}")
    print(f"pperp_trace={reference['pperp_trace']:.6f} (== parity_dim) "
          f"pperp_fro={reference['pperp_fro']:.6f}")
    for name, d in detectability.items():
        print(f"  detect {name}: ‖P⊥b‖={d['norm']:.6e} detectable={d['detectable']}")
    for d in mdb_out:
        print(f"  mdb {d['name']}: q={d['q']:.6e} mdb={d['mdb']}")
    for name, d in block.items():
        print(f"  block_spark {name}: {d}")
    print(f"wrote {REF_JSON}")


if __name__ == "__main__":
    main()
