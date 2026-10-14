#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent Monte Carlo of the ADC quantiser loss behind an AGC (CAP-06 (c), bar G2 and finding G4).

Shares no code with the engine. For each ADC resolution it finds, by its own numerical
integration and search, the uniform mid-rise step that minimises the weak-signal loss of a
Gaussian input. At that step (scaled by the AGC to the measured total input RMS) it estimates
the loss by Monte Carlo:
- G2, Gaussian input (noise alone, or noise plus a Gaussian jammer):
  -10 log10( E[x q(x)]^2 / (sigma^2 E[q(x)^2]) ), with sigma^2 the measured total power;
- G4, noise plus a CW jammer A cos(theta), theta uniform per sample: the weak-signal gain
  g = E[q(x + eps s) s] / eps (s = +-1, eps = 0.05 sigma_noise), and the loss
  -10 log10( g^2 sigma^2 / E[q(x)^2] ) against an unquantised receiver with the same total power.

Usage: python3 -I quantiser_mc.py expected.json
"""
import json
import math
import sys

import numpy as np

N = 1 << 22
SEED = 20261014


def quantise(x, bits, step):
    levels = 1 << (bits - 1)
    k = np.clip(np.floor(x / step), -levels, levels - 1)
    return (k + 0.5) * step


def gaussian_loss_db(bits, step):
    """Weak-signal loss of a unit Gaussian input, by trapezoidal integration on a fine grid."""
    x = np.linspace(-12.0, 12.0, 480_001)
    pdf = np.exp(-0.5 * x * x) / math.sqrt(2 * math.pi)
    q = quantise(x, bits, step)
    exq = np.trapezoid(x * q * pdf, x)
    eq2 = np.trapezoid(q * q * pdf, x)
    return -10 * math.log10(exq * exq / eq2)


def optimum_step(bits):
    if bits == 1:
        return 1.0
    lo, hi = math.log(1e-3), math.log(4.0 / ((1 << (bits - 1)) - 1))
    g = (math.sqrt(5) - 1) / 2
    for _ in range(120):
        c, d = hi - g * (hi - lo), lo + g * (hi - lo)
        if gaussian_loss_db(bits, math.exp(c)) < gaussian_loss_db(bits, math.exp(d)):
            hi = d
        else:
            lo = c
    return math.exp(0.5 * (lo + hi))


rng = np.random.default_rng(SEED)
out = {"numpy": np.__version__, "samples": N, "seed": SEED, "gaussian": [], "cw": []}
for bits in (1, 2, 3, 4):
    s_opt = optimum_step(bits)
    for jn_db in (None, 20.0, 40.0):
        x = rng.standard_normal(N)
        if jn_db is not None:
            x = x + math.sqrt(10 ** (jn_db / 10)) * rng.standard_normal(N)
        sigma2 = float(np.mean(x * x))  # the AGC's measured total power
        q = quantise(x, bits, s_opt * math.sqrt(sigma2))
        loss = -10 * math.log10(float(np.mean(x * q)) ** 2 / (sigma2 * float(np.mean(q * q))))
        out["gaussian"].append({"adc_bits": bits, "jn_db": jn_db, "step_sigma": s_opt,
                                "integrated_loss_db": gaussian_loss_db(bits, s_opt),
                                "mc_loss_db": loss})
    for jn_db in (0.0, 10.0, 20.0, 30.0, 40.0):
        n = rng.standard_normal(N)
        amp = math.sqrt(2 * 10 ** (jn_db / 10))
        x = n + amp * np.cos(rng.uniform(0, 2 * math.pi, N))
        sigma2 = float(np.mean(x * x))
        step = s_opt * math.sqrt(sigma2)
        s = rng.choice([-1.0, 1.0], N)
        eps = 0.05
        g = float(np.mean((quantise(x + eps * s, bits, step) - quantise(x, bits, step)) * s)) / eps
        q = quantise(x, bits, step)
        loss = -10 * math.log10(g * g * sigma2 / float(np.mean(q * q)))
        out["cw"].append({"adc_bits": bits, "jn_db": jn_db, "mc_loss_db": loss})
json.dump(out, open(sys.argv[1], "w"), indent=1)
for r in out["gaussian"]:
    print("gauss", r["adc_bits"], r["jn_db"], f"{r['integrated_loss_db']:.4f}", f"{r['mc_loss_db']:.4f}")
for r in out["cw"]:
    print("cw   ", r["adc_bits"], r["jn_db"], f"{r['mc_loss_db']:.3f}")
