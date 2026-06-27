#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate an external reference for the lunar reference-frame realisation
(7-parameter Helmert / similarity-transform fit).

ORACLE
------
An **independent closed-form weighted Umeyama (Horn) similarity-transform
solution**, implemented from scratch in numpy/scipy (numpy 2.4.6, scipy 1.18.0).
This is the classic SVD-based least-squares estimator for the rigid+scale
transform `q = t + s * R * p`:

  * Umeyama, S. (1991), "Least-squares estimation of transformation parameters
    between two point patterns", IEEE TPAMI 13(4):376-380, eqns (34)-(42).
  * Horn, B.K.P. (1987), "Closed-form solution of absolute orientation using
    unit quaternions", JOSA A 4(4):629-642 (the equivalent absolute-orientation
    problem).

Algorithm (no iteration, pure linear algebra):

  mu_p = mean(p); mu_q = mean(q)
  P = p - mu_p; Q = q - mu_q
  Sigma = (1/N) * Q^T @ P                       (cross-covariance, q<-p)
  U, D, Vt = svd(Sigma)
  S = diag(1,1,1) but last entry -> -1 if det(U)*det(Vt) < 0   (reflection fix)
  R = U @ S @ Vt                                (proper rotation, det = +1)
  var_p = (1/N) * sum |P|^2
  s = trace(diag(D) @ S) / var_p                (optimal scale)
  t = mu_q - s * R @ mu_p

This is a GENUINELY DIFFERENT algorithm from kshana's estimator. kshana solves
the same fit with an *iterative finite-difference Gauss-Newton* over the explicit
forward model `q = t + (1+s)*R(theta)*p`, with `R(theta)=rz(tz)*ry(ty)*rx(tx)`
(SOFA Rx/Ry/Rz convention) and a centroid-shift conditioning step. The oracle
here never touches kshana code, uses a closed-form SVD (not Gauss-Newton, not
finite differences), and recovers R/s/t analytically. The two must agree.

The oracle returns the rotation as an orthogonal matrix; we convert it to
kshana's 3-angle parameterisation `[theta_x, theta_y, theta_z]` by inverting the
SOFA composition `R = rz(tz)*ry(ty)*rx(tx)` in closed form:

  theta_y = asin(R[2,0]);  theta_x = atan2(-R[2,1], R[2,2]);
  theta_z = atan2(-R[1,0], R[0,0])

(verified exact to ~1e-16 rad over random angles). The reported quantities are
the 7 Helmert parameters [tx,ty,tz (m), theta_x,theta_y,theta_z (rad), s
(dimensionless)] and the post-fit per-coordinate RMS residual (m).

INPUTS
------
The point networks are built to be byte-identical to kshana's
`lunar_frame_realise::point_network(n)`:

  for k in 0..n:
    f   = k / n
    lat = (-80 + 160*f) degrees
    lon = (k * 137.508) degrees
    alt = 0 if k%3==0 else 50000 * (k%5)   metres
    p_k = selenographic_to_mcmf(lat, lon, alt)        # spherical Moon, R=1737400 m

with R_MOON_M = 1737400.0 m and
  selenographic_to_mcmf: x=r*cos(lat)*cos(lon), y=r*cos(lat)*sin(lon), z=r*sin(lat).

A known Helmert datum is injected with kshana's SOFA rotation convention, then
seeded Gaussian noise (numpy default_rng, per-case seed) is added to q. BOTH the
clean p and the noisy q are emitted in the fixture, so the Rust test feeds
kshana the IDENTICAL points the oracle saw (no RNG agreement needed between
languages -- the comparison is purely solver-vs-solver on shared data).

HONEST SCOPE
------------
This validates the *estimator* -- that kshana's iterative Gauss-Newton Helmert
fit recovers the same 7 parameters and post-fit RMS as an independent closed-form
SVD Umeyama solution, on identical synthetic noisy point networks. It does NOT
validate frame realisation against real lunar tracking / VLBI data, and carries
no claim of absolute lunar-frame accuracy. It is a library-vs-library numerical
agreement check (the same class as the lambert/scipy/klobuchar fixtures).

REPRODUCE (offline, no kshana code involved)
--------------------------------------------
    /tmp/kshana-oracles/.venv/bin/python \
        generate_lunar_reference_frame_realisation_reference.py \
        > lunar_reference_frame_realisation_reference.txt

Generated with numpy 2.4.6 + scipy 1.18.0.
"""

import numpy as np

R_MOON_M = 1_737_400.0  # kshana lunar::R_MOON_M
URAD = 1.0e-6
PPB = 1.0e-9


# --- kshana SOFA rotation convention (for INJECTING the known truth only) ----
def rx(a):
    s, c = np.sin(a), np.cos(a)
    return np.array([[1.0, 0.0, 0.0], [0.0, c, s], [0.0, -s, c]])


def ry(b):
    s, c = np.sin(b), np.cos(b)
    return np.array([[c, 0.0, -s], [0.0, 1.0, 0.0], [s, 0.0, c]])


def rz(g):
    s, c = np.sin(g), np.cos(g)
    return np.array([[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]])


def kshana_rotation(theta):
    """R(theta) = rz(tz)*ry(ty)*rx(tx) -- kshana's composition."""
    tx, ty, tz = theta
    return rz(tz) @ ry(ty) @ rx(tx)


def extract_angles(R):
    """Invert R = rz(tz)*ry(ty)*rx(tx) (SOFA) -> [tx, ty, tz] in closed form."""
    ty = np.arcsin(np.clip(R[2, 0], -1.0, 1.0))
    tx = np.arctan2(-R[2, 1], R[2, 2])
    tz = np.arctan2(-R[1, 0], R[0, 0])
    return np.array([tx, ty, tz])


def selenographic_to_mcmf(lat_rad, lon_rad, alt_m):
    r = R_MOON_M + alt_m
    return np.array(
        [
            r * np.cos(lat_rad) * np.cos(lon_rad),
            r * np.cos(lat_rad) * np.sin(lon_rad),
            r * np.sin(lat_rad),
        ]
    )


def point_network(n):
    """Byte-identical to kshana lunar_frame_realise::point_network(n)."""
    n = max(n, 3)
    pts = []
    for k in range(n):
        f = k / n
        lat = np.radians(-80.0 + 160.0 * f)
        lon = np.radians(k * 137.508)
        alt = 0.0 if k % 3 == 0 else 50_000.0 * (k % 5)
        pts.append(selenographic_to_mcmf(lat, lon, alt))
    return np.array(pts)


# --- the independent ORACLE: closed-form weighted Umeyama similarity fit ------
def umeyama(p, q):
    """Closed-form least-squares similarity transform q ~= t + s*R*p.

    Returns (t (3,), R (3,3) proper rotation, s scalar).
    Equal weights (isotropic, matching kshana's single-sigma fit -> identical
    weighted normal equations as ordinary LS).
    """
    n = p.shape[0]
    mu_p = p.mean(axis=0)
    mu_q = q.mean(axis=0)
    P = p - mu_p
    Q = q - mu_q
    sigma = (Q.T @ P) / n  # cross-covariance, maps p -> q
    U, Dvals, Vt = np.linalg.svd(sigma)
    S = np.eye(3)
    if np.linalg.det(U) * np.linalg.det(Vt) < 0:
        S[2, 2] = -1.0
    R = U @ S @ Vt
    var_p = (P * P).sum() / n
    s = np.trace(np.diag(Dvals) @ S) / var_p
    t = mu_q - s * (R @ mu_p)
    return t, R, s


def post_fit_rms(p, q, t, R, s):
    pred = (s * (R @ p.T)).T + t  # N x 3
    resid = q - pred
    return np.sqrt((resid * resid).sum() / (p.shape[0] * 3))


# --- cases: 4 seeds x 3 geometries (8/16/40 pts) noisy + 2 noiseless ---------
# Injected truth datum (one fixed datum; each case re-injects + re-noises).
INJ_T = np.array([25.0, -40.0, 15.0])  # m
INJ_THETA = np.array([3.0 * URAD, -2.0 * URAD, 5.0 * URAD])  # rad
INJ_SCALE_PPB = 100.0  # 1e-7
INJ_S = 1.0 + INJ_SCALE_PPB * PPB

SEEDS = [42, 7, 1234, 99]
GEOMS = [8, 16, 40]


def fmt(xs):
    return ",".join(repr(float(x)) for x in xs)


def build_case(name, n, sigma_m, seed):
    p = point_network(n)
    R_inj = kshana_rotation(INJ_THETA)
    q_clean = (INJ_S * (R_inj @ p.T)).T + INJ_T
    if sigma_m > 0.0:
        rng = np.random.default_rng(seed)
        noise = rng.normal(0.0, sigma_m, size=q_clean.shape)
        q = q_clean + noise
    else:
        q = q_clean.copy()

    t, R, s = umeyama(p, q)
    theta = extract_angles(R)
    rms = post_fit_rms(p, q, t, R, s)
    scale_ppb = (s - 1.0) / PPB

    # Emit p and q (flattened row-major: x0,y0,z0,x1,y1,z1,...) so the Rust test
    # feeds kshana the IDENTICAL points.
    p_flat = p.reshape(-1)
    q_flat = q.reshape(-1)
    return (
        name,
        n,
        sigma_m,
        t,
        theta,
        scale_ppb,
        rms,
        p_flat,
        q_flat,
    )


def main():
    print("# Lunar reference-frame realisation (7-parameter Helmert) external reference.")
    print("# Oracle: independent closed-form weighted Umeyama (Horn) similarity fit,")
    print("#         numpy 2.4.6 + scipy 1.18.0 (SVD-based, NOT Gauss-Newton).")
    print("# Umeyama (1991) IEEE TPAMI 13(4):376-380; Horn (1987) JOSA A 4(4):629-642.")
    print("# Consumed by tests/lunar_reference_frame_realisation_reference.rs.")
    print("# See generate_lunar_reference_frame_realisation_reference.py for provenance + honest scope.")
    print("# Injected truth: t=[25,-40,15] m, theta=[3,-2,5] urad, scale=100 ppb.")
    print("#")
    print("# CASE name | n | sigma_m | tx,ty,tz [m] | thx,thy,thz [rad] | scale_ppb | rms_m")
    print("# PTS  name | x0,y0,z0,x1,y1,z1,... [m]   (estimated-frame points p)")
    print("# QTS  name | x0,y0,z0,x1,y1,z1,... [m]   (datum-frame points q = noisy q)")

    cases = []
    # 2 noiseless cases (two geometries).
    cases.append(("noiseless_8", 8, 0.0, 42))
    cases.append(("noiseless_40", 40, 0.0, 7))
    # 4 seeds x 3 geometries noisy (sigma = 1 m).
    for seed in SEEDS:
        for n in GEOMS:
            cases.append((f"noisy_n{n}_s{seed}", n, 1.0, seed))

    for name, n, sigma, seed in cases:
        (nm, nn, sg, t, theta, scale_ppb, rms, p_flat, q_flat) = build_case(
            name, n, sigma, seed
        )
        print(
            f"CASE {nm} | {nn} | {float(sg)!r} | {fmt(t)} | {fmt(theta)} | "
            f"{float(scale_ppb)!r} | {float(rms)!r}"
        )
        print(f"PTS {nm} | {fmt(p_flat)}")
        print(f"QTS {nm} | {fmt(q_flat)}")


if __name__ == "__main__":
    main()
