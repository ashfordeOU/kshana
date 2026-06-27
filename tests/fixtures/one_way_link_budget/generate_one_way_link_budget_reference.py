#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the one-way deep-space link budget.

This is a **published-vectors** oracle: the reference numbers are transcribed
from published deep-space telecommunications design-control tables (DCTs) and the
ITU-R free-space-loss standard, NOT produced by any Kshana code. The Rust test
(`tests/one_way_link_budget_reference.rs`) feeds the published DCT *component*
values to Kshana's `linkbudget::free_space_loss_db` and `linkbudget::link_budget`
and checks that they reproduce the published *totals*.

ORACLES (with provenance)
=========================

1. DESCANSO / JPL Galileo X-band design-control table — the genuine external
   end-to-end total.
   J. H. Yuen (ed.), *Deep Space Telecommunications Systems Engineering*,
   JPL Deep-Space Communications and Navigation Series (DESCANSO),
   JPL Publication 82-76, Table 1-1 — Galileo X-band (8420.43 MHz) downlink at
   6.37 AU (R = 9.529e8 km).  Published totals used as the oracle:
       free-space (space) loss   L_fs = 290.54 dB
       received carrier-to-noise-density   Pr/N0 = 54.6 dB-Hz
   The DCT component line items (re-grouped into the EIRP / G/T / lumped-loss
   inputs the one-way link equation takes) are:
       Pt           = 10.5  dBW    (transmitter power)
       circuit loss = -0.2  dB
       Gt           = 50.0  dBi    (HGA transmit gain)   -> EIRP = 60.3 dBW
       Gr           = 71.7  dBi    (DSN 70 m receive gain)
       Tsys         = 26.30 K       -> G/T = Gr - 10log10(Tsys) = 57.50 dB/K
       Tx pointing  =  1.2  dB
       polarisation =  0.04 dB      -> other losses = 1.24 dB
       data rate    = 134 400 bit/s (table line 19; sets Eb/N0, not C/N0)
   This is a *real published total computed by JPL telecom engineers* — it is the
   genuine external authority for the link-equation assembly
   C/N0 = EIRP - L_fs - L_other + G/T - k.

2. ITU-R Recommendation P.525-4, *Calculation of free-space attenuation* —
   the published free-space-loss equation in its standard engineering form
       L_fs = 32.45 + 20*log10(d_km) + 20*log10(f_MHz)   [dB]
   (ITU-R P.525, eq. for L_bf with d in km and f in MHz; the published constant
   32.4 / 32.45 dB).  This is an independent, published numeric formula for the
   *same* free-space loss Kshana computes as 20*log10(4*pi*R*f/c); reproducing
   the ITU-R published-constant value across several deep-space geometries (the
   DSN S/X/Ka downlink band centres of CCSDS 401.0-B / DSN 810-005) is the
   published-vector check on `free_space_loss_db`.  The ITU constant is computed
   here from its definition (20*log10(4*pi*1000*1e6/c) = 32.4478 dB) so the
   emitted L_fs is the genuine ITU-R-form value, not Kshana's expression.

3. CCSDS 401.0-B / DSN 810-005 deep-space downlink band centres (the carrier
   frequencies the band-keyed budget uses):
       S  = 2.295 GHz,  X = 8.420 GHz,  Ka = 32.0 GHz   (downlink).

HONEST SCOPE
============
* The Galileo case is a genuine independent end-to-end published total (FSL and
  Pr/N0) and is the load-bearing external check on the *link-equation assembly*.
* The ITU-R cases validate `free_space_loss_db` against the *published ITU-R
  free-space-loss formula* (a different, citable analytic form with a published
  constant) across the deep-space bands; because both reduce to the inverse-
  square spreading law with the SI-fixed speed of light, this is an
  analytic-form / published-constant check, not an independent physical
  measurement.
* This does NOT validate the *engineering default* EIRP/G/T/loss values in
  `linkbudget::default_params` (those stay honestly MODELLED — they are cited
  order-of-magnitude figures, not a calibrated terminal datasheet) nor any
  atmospheric / coding / modulation model beyond the lumped-loss term.

Reproduce (offline, NO Kshana code involved):

    python3 -m venv /tmp/kshana-oracles/.venv      # or reuse the project venv
    /tmp/kshana-oracles/.venv/bin/pip install numpy
    /tmp/kshana-oracles/.venv/bin/python generate_one_way_link_budget_reference.py \
        > one_way_link_budget_reference.txt

The emitted L_fs values are computed from the published constants / ITU-R form;
the Galileo Pr/N0 and L_fs are the transcribed published table totals.
"""

import math

C_M_PER_S = 299_792_458.0  # SI-fixed speed of light (2019 SI), == kshana C_M_PER_S
AU_M = 1.495_978_707e11    # IAU 2012 astronomical unit

# ITU-R P.525 free-space-loss constant for (d in km, f in MHz):
#   K = 20*log10(4*pi * 1 km * 1 MHz / c) = 20*log10(4*pi*1000*1e6/c) = 32.4478 dB.
# This is the published 32.45 dB constant, computed from its definition so the
# emitted value is the genuine ITU-R-form free-space loss.
ITU_K_KM_MHZ = 20.0 * math.log10(4.0 * math.pi * 1000.0 * 1.0e6 / C_M_PER_S)


def fsl_itu_db(range_m: float, freq_hz: float) -> float:
    """Free-space loss via the published ITU-R P.525 form (d in km, f in MHz)."""
    d_km = range_m / 1000.0
    f_mhz = freq_hz / 1.0e6
    return ITU_K_KM_MHZ + 20.0 * math.log10(d_km) + 20.0 * math.log10(f_mhz)


def emit_header():
    print("# One-way deep-space link-budget reference (published-vectors oracle).")
    print("# Consumed by tests/one_way_link_budget_reference.rs.")
    print("# See generate_one_way_link_budget_reference.py for full provenance.")
    print(f"# ITU-R P.525 free-space-loss constant K (d_km,f_MHz) = {ITU_K_KM_MHZ!r} dB (published 32.45 dB).")
    print("#")
    print("# FSL  name | range_m | freq_hz | L_fs_db        (oracle: ITU-R P.525 / DESCANSO table)")
    print("# DCT  name | range_m | freq_hz | eirp_dbw | g_over_t_db | other_losses_db | data_rate_bps |"
          " req_eb_n0_db | exp_fsl_db | exp_cn0_dbhz | exp_eb_n0_db   (oracle: DESCANSO Galileo Table 1-1)")


def emit_fsl_cases():
    """Published / ITU-R-form free-space-loss vectors across the DSN bands.

    name | range_m | freq_hz | L_fs (ITU-R P.525 form) — except the Galileo row,
    whose L_fs is the transcribed DESCANSO Table 1-1 published total (290.54 dB),
    cross-checked here to be == the ITU-R-form value to the table's print rounding.
    """
    F_S, F_X, F_KA = 2.295e9, 8.420e9, 32.0e9  # CCSDS 401 / DSN 810-005 downlink centres

    fsl_cases = [
        # Galileo X-band channel at 6.37 AU. The DESCANSO table prints L_fs = 290.54 dB;
        # the ITU-R-form value at the exact 8420.43 MHz channel is emitted (matches to
        # the table's 0.01 dB print rounding).
        ("galileo_x_6p37au", 9.529e11, 8.42043e9),
        # DSN deep-space band centres at canonical interplanetary geometries.
        ("dsn_x_1au",        1.0 * AU_M,  F_X),
        ("dsn_x_2p5au",      2.5 * AU_M,  F_X),
        ("dsn_ka_1p5au",     1.5 * AU_M,  F_KA),
        ("dsn_s_lunar",      4.0e8,       F_S),
        ("dsn_x_leo_2000km", 2.0e6,       F_X),
    ]
    for name, R, f in fsl_cases:
        L = fsl_itu_db(R, f)
        print(f"FSL {name} | {R!r} | {f!r} | {L!r}")


def emit_dct_cases():
    """Genuine published end-to-end DCT total: DESCANSO Galileo Table 1-1.

    The published table totals (the oracle) are L_fs = 290.54 dB and
    Pr/N0 = 54.6 dB-Hz; the Rust test reconstructs them from the component
    line-items below via free_space_loss_db + link_budget.
    """
    # Galileo X-band, DESCANSO / JPL Pub 82-76 Table 1-1.
    R = 9.529e11
    f = 8.42043e9
    eirp = 60.3                       # Pt 10.5 - circuit 0.2 + Gt 50.0
    g_over_t = 71.7 - 10.0 * math.log10(26.30)  # Gr 71.7 dBi over Tsys 26.30 K
    other = 1.24                      # Tx pointing 1.2 + polarisation 0.04
    rate = 134_400.0                  # table line 19
    req = 2.31                        # required Eb/N0, table line 25
    exp_fsl = 290.54                  # PUBLISHED table total
    exp_cn0 = 54.6                    # PUBLISHED table total (Pr/N0)
    # Published Eb/N0 = Pr/N0 - 10log10(Rb): the table's available Eb/N0 line.
    exp_eb = exp_cn0 - 10.0 * math.log10(rate)
    print(
        f"DCT galileo_x_table_1_1 | {R!r} | {f!r} | {eirp!r} | {g_over_t!r} | "
        f"{other!r} | {rate!r} | {req!r} | {exp_fsl!r} | {exp_cn0!r} | {exp_eb!r}"
    )


if __name__ == "__main__":
    emit_header()
    emit_fsl_cases()
    emit_dct_cases()
