#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate an EXTERNAL, independent reference for Wahba/TRIAD/QUEST attitude.

Oracle: **scipy** (Virtanen et al., *Nature Methods* 17, 2020),
`scipy.spatial.transform.Rotation.align_vectors`. That routine solves Wahba's
problem by the **Kabsch / Markley SVD** method — it forms the attitude profile
matrix and takes its singular-value decomposition to read off the optimal proper
rotation. This is a GENUINELY DIFFERENT algorithm and codebase from kshana's
solvers, which use Davenport's 4x4 K-matrix with a self-contained symmetric
**Jacobi eigen**-solve (`solve_davenport`), a derivative-free root solve of
Davenport's characteristic polynomial plus a Gibbs-vector recovery (`solve_quest`,
QUEST, Shuster & Oh 1981), and the closed-form deterministic **TRIAD** (Black
1964). All of them compute the SAME uniquely-defined quantity — the Wahba-optimal
reference->body attitude for a weighted set of unit-vector observations — so scipy
is a valid independent oracle for the noiseless deterministic case.

Convention pin (verified empirically before use, see below): kshana's attitude
matrix `A` maps reference->body, i.e. `A @ r = b`. scipy's
`Rotation.align_vectors(a, b, weights)` returns the rotation `R` minimising
`sum_i w_i || a_i - R b_i ||^2`, i.e. `R @ b ~ a`. Feeding `a = body` and
`b = reference` therefore yields EXACTLY kshana's `A` (confirmed to ~3e-16 against
a known ground-truth rotation for the noiseless case). We emit that scipy DCM as
the reference; the .rs test compares it to kshana's DCM via the frame-agnostic
attitude-error angle (the rotation angle of `A_kshana @ A_scipy^T`), which is
immune to quaternion sign ambiguity and to any body<->nav quaternion convention.

Honest scope: this validates the NOISELESS, deterministic Wahba-optimal attitude
(TRIAD / Davenport q-method / QUEST) against an independent SVD oracle. The noisy
Monte-Carlo "q-method beats TRIAD in RMS" STATISTICAL efficiency claim is NOT
touched here and stays honestly MODELLED (see src/verification.rs).

Reproduce (offline, no Kshana code involved):

    python3 -m venv /tmp/wahbavenv
    /tmp/wahbavenv/bin/pip install scipy numpy
    /tmp/wahbavenv/bin/python generate_p4_wahba_reference.py > p4_wahba_reference.txt

Generated with scipy 1.13.1 + numpy 1.26.4 (regenerable offline).
"""

import numpy as np
from scipy.spatial.transform import Rotation as R


def unit(v):
    v = np.asarray(v, float)
    return v / np.linalg.norm(v)


def rotvec_matrix(axis, angle):
    """Ground-truth reference->body rotation matrix from an axis and angle."""
    return R.from_rotvec(angle * unit(axis)).as_matrix()


def fmt(x):
    return repr(float(x))


def emit_case(name, kind, refs, weights, axis, angle):
    """Emit one noiseless Wahba case solved by the scipy SVD oracle.

    refs:    list of reference-frame directions (need not be unit; normalised here)
    weights: per-observation non-negative weights
    axis, angle: the ground-truth reference->body rotation applied to build body.
    kind:    'quest' if the geometry is safe for QUEST (rotation well below 180
             deg so the Gibbs vector is finite), else 'davenport' only.
    """
    refs = np.array([unit(r) for r in refs], float)
    weights = np.asarray(weights, float)
    a_true = rotvec_matrix(axis, angle)
    body = (a_true @ refs.T).T  # b_i = A r_i, exactly (noiseless)

    # Independent oracle: scipy Kabsch/Markley SVD. a=body(first), b=reference.
    rot, rssd = R.align_vectors(body, refs, weights=weights)
    a_scipy = rot.as_matrix()  # == kshana's reference->body A

    # Sanity: noiseless => rssd ~ 0 and scipy recovers the truth exactly.
    # (rssd is the residual root-sum-of-squared misfit; for a noiseless fit it is
    # a few 1e-8 of accumulated SVD round-off at large angles, not real misfit.)
    assert rssd < 1e-7, f"{name}: expected noiseless rssd~0, got {rssd}"
    err = np.abs(a_scipy - a_true).max()
    assert err < 1e-9, f"{name}: scipy did not recover the truth ({err})"
    # Proper rotation.
    assert abs(np.linalg.det(a_scipy) - 1.0) < 1e-12

    n = len(refs)
    print(f"CASE {name} {kind} {n}")
    for r, w in zip(refs, weights):
        print(f"OBS {fmt(r[0])} {fmt(r[1])} {fmt(r[2])} {fmt(w)}")
    for b in body:
        print(f"BODY {fmt(b[0])} {fmt(b[1])} {fmt(b[2])}")
    # scipy optimal DCM, row-major (this is the reference kshana must match).
    for i in range(3):
        print(f"DCM {fmt(a_scipy[i, 0])} {fmt(a_scipy[i, 1])} {fmt(a_scipy[i, 2])}")
    print(f"RSSD {fmt(rssd)}")
    print(f"ANGLE {fmt(angle)}")
    print("ENDCASE")


def main():
    print("# EXTERNAL Wahba reference — oracle: scipy 1.13.1 "
          "Rotation.align_vectors (Kabsch/Markley SVD).")
    print("# Consumed by tests/wahba_reference.rs. Regenerable offline via "
          "generate_p4_wahba_reference.py.")
    print("# scipy align_vectors(a=body, b=reference, weights) returns kshana's "
          "reference->body DCM A (A r = b).")
    print("# CASE <name> <kind> <n> ; OBS rx ry rz w ; BODY bx by bz ; "
          "DCM row(3) ; RSSD ; ANGLE ; ENDCASE")

    # --- Multi-vector optimal cases (Davenport + QUEST) --------------------
    refs4 = [
        [1.0, 0.2, -0.3],
        [0.1, 1.0, 0.4],
        [-0.5, 0.3, 1.0],
        [0.7, -0.8, 0.2],
    ]
    emit_case("dav_equal4", "quest", refs4, [0.25, 0.25, 0.25, 0.25],
              [0.2, 0.4, -0.9], 1.7)
    emit_case("dav_weighted4", "quest", refs4, [0.4, 0.3, 0.2, 0.1],
              [-0.6, 0.1, 0.8], 0.9)
    emit_case("dav_three", "quest", refs4[:3], [0.5, 0.3, 0.2],
              [0.5, -0.2, 0.4], 1.1)
    # A large-angle case (still < 180 deg) to stress the solvers away from small
    # rotations; QUEST is fine here (Gibbs vector finite).
    emit_case("dav_bigangle", "quest", refs4, [0.3, 0.3, 0.2, 0.2],
              [0.3, -0.7, 0.5], 2.8)
    # A five-vector, unequal-weight case.
    refs5 = refs4 + [[0.2, 0.5, 0.9]]
    emit_case("dav_five", "quest", refs5, [0.30, 0.25, 0.20, 0.15, 0.10],
              [-0.2, 0.9, 0.3], 1.25)

    # --- Two-vector cases (TRIAD is exact & optimal in the noiseless limit) --
    # For NOISELESS two-vector observations the optimal (SVD) attitude, the
    # Davenport q-method, and closed-form TRIAD all recover the identical true
    # rotation, so scipy is a valid oracle for TRIAD here too. TRIAD ignores
    # weights, so we use equal weights for the scipy solve on these cases.
    emit_case("triad_a", "quest", refs4[:2], [0.5, 0.5], [0.3, -0.7, 0.5], 0.9)
    emit_case("triad_b", "quest", [[0.0, 0.0, 1.0], [0.0, 1.0, 0.2]],
              [0.5, 0.5], [1.0, 0.0, 0.0], 0.6)

    print("# end")


if __name__ == "__main__":
    main()
