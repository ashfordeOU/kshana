# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the multilateration + clock geometries (inputs) for the lunar joint
multi-technique OD + clock batch-LS cross-validation.

WHAT THIS VALIDATES
-------------------
kshana's `batch_ls::gauss_newton` is the estimation core under the
`lunar_combination` joint OD + clock capability: it forms and solves the
WEIGHTED normal equations of a multilateration + clock-offset network and
iterates to convergence. This generator emits, on a fixed grid of seeds, a
representative joint geometry of the SAME structure `lunar_combination` builds:

    state x = [ station_pos(3), {sat_pos(3)} x N_sat,
                station_clock(c.dt, m), {sat_clock(c.dt, m)} x N_sat ]

observed by, deterministically:
    0. one absolute station-clock anchor                  h = clk_st
    1. reference-anchor -> station ranges  (full-3D obs)  h = ||station - anchor_a||
    2. reference-anchor -> sat   ranges    (multilat sat) h = ||sat_k - anchor_a|| + clk_sat_k
    3. station -> sat ranges    (ties sat + clock diff)   h = ||sat_k - station|| + (clk_sat_k - clk_st)
    4. inter-satellite ranges  (ISL mesh, clock diff)     h = ||sat_i - sat_j|| + (clk_sat_i - clk_sat_j)

The state layout, the clock-as-range-metres convention, the differenced clock
term in each range, and the single absolute-clock anchor are IDENTICAL to
`src/lunar_combination.rs` (only the frame plumbing — selenographic <-> MCMF
<-> geocentric-inertial and the VLBI near-field delay formula — is replaced by
plain Cartesian ranges from well-spread external anchors, so the geometry is
byte-reproducible across numpy / Java-hipparchus / Rust-kshana without any
frame model. The externally-truthable PRIMITIVE is the weighted-LS solver, not
the lunar VLBI delay model, which has its own check).

This file writes ONLY the inputs (geometry, a-priori, noisy observations,
weights) to `cases.txt` (a flat, line-oriented format both Java and Rust parse
with plain string splits -- no JSON dependency on either side). The
OREKIT/hipparchus oracle output is produced by `OrekitBatchLs.java` (committed
`..._reference.txt`). The Rust test reads both and runs kshana on the
byte-identical observations.

HONEST SCOPE
-----------
This validates the BATCH-LS ESTIMATOR PRIMITIVE (`batch_ls::gauss_newton`):
that kshana's solver reaches the same weighted-least-squares optimum and the
same formal 1-sigma covariance as an INDEPENDENT solver (hipparchus
GaussNewtonOptimizer, QR path) on byte-identical observations + weights from a
common a-priori. It does NOT validate the lunar frame realisation, the VLBI
delay model, real VLBI/ranging data, or any force model. It gates the
`lunar_combination` capability AT THE SOLVER LEVEL ONLY.

REPRODUCE
--------
  1. /tmp/kshana-oracles/.venv/bin/python generate_lunar_joint_multi_technique_od_reference.py
       (writes cases.txt next to this file)
  2. source /tmp/kshana-oracles/orekit/cp.sh
     javac -cp "$OREKIT_CP" OrekitBatchLs.java
     java -cp ".:$OREKIT_CP" OrekitBatchLs cases.txt > lunar_joint_multi_technique_od_reference.txt
  3. commit cases.txt + lunar_joint_multi_technique_od_reference.txt
  4. cargo test --test lunar_joint_multi_technique_od_reference -- --nocapture
"""

import numpy as np

C = 299_792_458.0  # m/s, == kshana::timegeo::C_M_PER_S

# A small constellation + one surface station, mirroring lunar_combination's
# default network size (n_sat = 3) but with extra geometry diversity over seeds.
N_SAT = 3

# Well-spread EXTERNAL reference anchors (stand-ins for the Earth-baseline VLBI
# + radiometric stations) positioned so the station's full 3-D position and the
# constellation are observable -- the role VLBI plays in lunar_combination, here
# reduced to plain Cartesian ranges so the geometry is model-free and portable.
# Units: metres, in a single Cartesian (MCI-like) frame.
ANCHORS = np.array(
    [
        [3.0e6, 0.0, 0.0],
        [-3.0e6, 0.0, 0.0],
        [0.0, 3.0e6, 0.0],
        [0.0, -3.0e6, 0.0],
        [0.0, 0.0, 3.0e6],
        [2.0e6, 2.0e6, 2.0e6],
    ]
)

# Nominal a-priori geometry (the "design" positions the solve starts from).
# Station near a lunar pole at ~R_moon; sats on a representative ~6000 km orbit.
R_MOON = 1_737_400.0
STATION_NOM = np.array([0.0, 0.0, -R_MOON])  # near south pole

ORBIT_R = 6.0e6


def sat_nom(k):
    frac = k / N_SAT
    nu = np.deg2rad(-55.0 + 110.0 * frac)
    inc = np.deg2rad(60.0 + 8.0 * np.sin(k))
    return np.array(
        [ORBIT_R * np.cos(nu) * np.sin(inc),
         ORBIT_R * np.sin(nu) * np.sin(inc),
         ORBIT_R * np.cos(inc)]
    )


SAT_NOM = np.array([sat_nom(k) for k in range(N_SAT)])

# Per-observable noise sigmas (mirroring lunar_combination defaults).
SIGMA_CLK_S = 1.0e-9          # station-clock sync (s)
SIGMA_RANGE_M = 0.1           # range precision (m)
SIGMA_ISL_M = 0.1            # inter-satellite range precision (m)
SIGMA_CLK_ANCHOR_M = C * SIGMA_CLK_S  # clock anchor in range-metres


def n_params():
    return 3 + 3 * N_SAT + 1 + N_SAT


def isl_pairs():
    return [(i, j) for i in range(N_SAT) for j in range(i + 1, N_SAT)]


def unpack(x):
    """x -> (station_pos[3], sats[N_SAT,3], clk_st, clk_sat[N_SAT]) in metres."""
    station = np.array(x[0:3])
    sats = np.array([x[3 + 3 * k: 3 + 3 * k + 3] for k in range(N_SAT)])
    clk_st = x[3 + 3 * N_SAT]
    clk_sat = np.array([x[3 + 3 * N_SAT + 1 + k] for k in range(N_SAT)])
    return station, sats, clk_st, clk_sat


def forward(x):
    """The observable model h(x). Order is IDENTICAL across numpy / Java / Rust.

    All positions are ABSOLUTE metres (NOT corrections-to-nominal): the cross-
    check is of the solver, so the model is the simplest exact one. Clocks are
    range-equivalent metres (c*dt)."""
    station, sats, clk_st, clk_sat = unpack(x)
    h = []
    # 0. absolute station-clock anchor
    h.append(clk_st)
    # 1. anchor -> station ranges (make station 3-D fully observable)
    for a in ANCHORS:
        h.append(float(np.linalg.norm(station - a)))
    # 2. anchor -> sat ranges (multilaterate sats) + sat clock term
    for k in range(N_SAT):
        for a in ANCHORS:
            h.append(float(np.linalg.norm(sats[k] - a)) + clk_sat[k])
    # 3. station -> sat ranges + differenced clock
    for k in range(N_SAT):
        h.append(float(np.linalg.norm(sats[k] - station)) + (clk_sat[k] - clk_st))
    # 4. inter-satellite ranges + differenced clock
    for (i, j) in isl_pairs():
        h.append(float(np.linalg.norm(sats[i] - sats[j])) + (clk_sat[i] - clk_sat[j]))
    return np.array(h)


def sigmas():
    s = [max(SIGMA_CLK_ANCHOR_M, 1e-12)]                      # 0
    s += [SIGMA_RANGE_M] * len(ANCHORS)                       # 1
    s += [SIGMA_RANGE_M] * (N_SAT * len(ANCHORS))            # 2
    s += [SIGMA_RANGE_M] * N_SAT                              # 3
    s += [SIGMA_ISL_M] * len(isl_pairs())                    # 4
    return np.array(s)


def truth_state(rng):
    """Injected truth: nominal + small corrections + seeded jitter (absolute m)."""
    x = np.zeros(n_params())
    # station: nominal + ~50 m/axis correction
    x[0:3] = STATION_NOM + np.array([50.0, -50.0, 40.0]) + 5.0 * rng.standard_normal(3)
    # sats: nominal + ~30 m/axis correction
    for k in range(N_SAT):
        b = 3 + 3 * k
        signs = np.array([1.0 if (k + a) % 2 == 0 else -1.0 for a in range(3)])
        x[b:b + 3] = SAT_NOM[k] + 30.0 * signs + 3.0 * rng.standard_normal(3)
    # station clock ~1e-7 s as range-metres
    x[3 + 3 * N_SAT] = C * (1.0e-7 + 1.0e-8 * rng.standard_normal())
    # sat clocks ~1e-7 s alternating
    for k in range(N_SAT):
        sign = 1.0 if k % 2 == 0 else -1.0
        x[3 + 3 * N_SAT + 1 + k] = C * (sign * 1.0e-7 + 1.0e-8 * rng.standard_normal())
    return x


def fmt(arr):
    """Flatten a 1-D float array to a space-separated string of full-precision reprs."""
    return " ".join(repr(float(v)) for v in np.asarray(arr).ravel())


def main():
    sig = sigmas()
    weights = 1.0 / (sig * sig)

    n_obs = len(forward(np.zeros(n_params())))
    np_ = n_params()
    n_anchor = len(ANCHORS)
    pairs = isl_pairs()

    lines = []
    # Header (parsed by Java + Rust; lines beginning '#' are comments).
    lines.append("# lunar_joint_multi_technique_od batch-LS cross-validation INPUTS")
    lines.append("# multilateration + clock geometry; consumed by OrekitBatchLs.java and the Rust test")
    lines.append(f"C {C!r}")
    lines.append(f"N_SAT {N_SAT}")
    lines.append(f"N_ANCHOR {n_anchor}")
    lines.append(f"N_PARAMS {np_}")
    lines.append(f"N_OBS {n_obs}")
    lines.append(f"N_PAIRS {len(pairs)}")
    # Static geometry shared by every case.
    lines.append("ANCHORS " + fmt(ANCHORS))           # n_anchor*3 floats, row-major
    lines.append("PAIRS " + " ".join(f"{i} {j}" for (i, j) in pairs))  # 2*n_pairs ints
    lines.append("SIGMA " + fmt(sig))                 # n_obs floats
    lines.append("WEIGHT " + fmt(weights))            # n_obs floats

    cases = []
    for seed in range(6):
        rng = np.random.default_rng(1000 + seed)
        x_true = truth_state(rng)
        z_clean = forward(x_true)
        noise = sig * rng.standard_normal(len(z_clean))
        z = z_clean + noise

        x0 = np.zeros(np_)
        x0[0:3] = STATION_NOM
        for k in range(N_SAT):
            x0[3 + 3 * k: 3 + 3 * k + 3] = SAT_NOM[k]

        lines.append(f"CASE {seed}")
        lines.append("XTRUE " + fmt(x_true))          # np_ floats
        lines.append("X0 " + fmt(x0))                 # np_ floats
        lines.append("Z " + fmt(z))                   # n_obs floats
        cases.append(seed)

    with open("cases.txt", "w") as f:
        f.write("\n".join(lines) + "\n")
    print(
        f"wrote cases.txt: {len(cases)} cases, "
        f"n_obs={n_obs}, n_params={np_}, n_anchor={n_anchor}, n_pairs={len(pairs)}"
    )


if __name__ == "__main__":
    main()
