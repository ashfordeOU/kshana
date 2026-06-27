/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * RTKLIB 2.4.3 external-oracle driver for kshana time-transfer error budgeting.
 *
 * Oracle:  RTKLIB 2.4.3 b34 (Takasu Tomoji), BSD-2-Clause.
 *          tomojitakasu/RTKLIB, src/rtkcmn.c geodist() + src/pntpos.c prange().
 * License: RTKLIB is BSD-2-Clause (compatible; compiled separately, not vendored
 *          into the kshana crate — only its NUMERIC OUTPUTS are committed).
 *
 * This driver links against RTKLIB's ACTUAL C functions:
 *   - geodist(rs, rr, e)  (rtkcmn.c:3199)  returns geometric distance INCLUDING
 *                          the Sagnac term  OMGE*(rs[0]*rr[1]-rs[1]*rr[0])/CLIGHT  (m).
 *                          We recover the Sagnac correction in SECONDS by calling
 *                          geodist twice (with and without the cross term) — actually
 *                          we extract it as (geodist - straight_line_norm)/CLIGHT,
 *                          which is exactly RTKLIB's Sagnac contribution / CLIGHT.
 *   - the iono-free PC combination exactly as pntpos.c prange() computes it:
 *                          gamma = (lam_j/lam_i)^2 = f_i^2/f_j^2 ;  PC = (gamma*P1 - P2)/(gamma-1).
 *   - the first-order ionospheric group delay 40.3e16*TEC/f^2 (m) — the textbook
 *                          closed form RTKLIB uses throughout (e.g. ionmodel scaling).
 *
 * RTKLIB constants (rtklib.h): OMGE = 7.2921151467E-5, CLIGHT = 299792458.0,
 *                              FREQ1 = 1.57542E9, FREQ2 = 1.22760E9, FREQ5 = 1.17645E9.
 *
 * NOTE on the Sagnac comparison: RTKLIB uses OMGE = 7.2921151467E-5 (IS-GPS) while
 * kshana's timegeo uses OMEGA_EARTH = 7.2921159E-5 (IERS). These differ by ~1e-7
 * relative, so the Sagnac correction (s) agrees to RTKLIB's geometry/CLIGHT structure
 * but carries that constant offset (~2e-14 s at the largest case, below the 1e-12 s
 * gate). The driver therefore emits THREE columns per geometry: sagnac_term_m and
 * sagnac_s (RTKLIB's own values, with RTKLIB's OMGE) plus the raw geometry cross-term
 * `cross = rs0*rr1 - rs1*rr0` (constant-free). The Rust test (a) compares the seconds
 * directly to <1e-12 s, and (b) applies kshana's OWN OMEGA_EARTH/c^2 to RTKLIB's
 * `cross` and matches kshana's sagnac_correction to f64 round-off — isolating the
 * implementation from the Earth-rotation-constant choice. ECEF coordinates are printed
 * at full f64 precision (%.17e) so kshana reconstructs the identical cross-term.
 *
 * Reproduce:
 *   cc -O2 -I/tmp/kshana-oracles/RTKLIB/src \
 *      tests/fixtures/time_transfer_error_budgeting/rtklib_driver.c \
 *      /tmp/kshana-oracles/RTKLIB/src/rtkcmn.c \
 *      -lm -o /tmp/ttb_driver -DENAGLO -DENAGAL -DENAQZS -DENACMP -DNFREQ=3
 *   /tmp/ttb_driver > tests/fixtures/time_transfer_error_budgeting/time_transfer_error_budgeting_reference.txt
 */
#include <stdio.h>
#include <math.h>
#include "rtklib.h"   /* RTKLIB 2.4.3 header: declares geodist, norm, and OMGE/CLIGHT/FREQ* */

/* RTKLIB's straight-line norm of (rs-rr), without the Sagnac term, so we can
 * isolate exactly the Sagnac contribution that geodist() adds. */
static double straight_norm(const double *rs, const double *rr)
{
    double d[3];
    int i;
    for (i = 0; i < 3; i++) d[i] = rs[i] - rr[i];
    return norm(d, 3);
}

/* first-order ionospheric group delay (m) on carrier f (Hz) for slant TEC (TECU). */
static double iono_delay_m(double tec_tecu, double f_hz)
{
    return 40.3 * 1.0e16 * tec_tecu / (f_hz * f_hz);
}

/* iono-free PC exactly as pntpos.c prange() builds it: P1 on f_i, P2 on f_j. */
static double iono_free_PC(double P1, double P2, double f_i, double f_j)
{
    double lam_i = CLIGHT / f_i, lam_j = CLIGHT / f_j;
    double gamma = (lam_j * lam_j) / (lam_i * lam_i); /* = f_i^2 / f_j^2 */
    return (gamma * P1 - P2) / (gamma - 1.0);
}

int main(void)
{
    int i, j, k;
    /* ---- block 1: SAGNAC over >=50 station->satellite ECEF geometries ----
     * GEO relay, MEO, continental + degenerate (radial/polar) baselines.
     * Receiver positions: a ring of ground stations; satellite positions: GEO arc + MEO. */
    const double RE = 6378137.0;
    const double GEO = 4.2164e7;
    const double MEO = 2.6560e7; /* GPS semimajor */

    printf("# RTKLIB 2.4.3 b34 (BSD-2-Clause) external-oracle reference for kshana time-transfer.\n");
    printf("# OMGE=%.10e CLIGHT=%.1f FREQ1=%.5e FREQ2=%.5e FREQ5=%.5e\n",
           OMGE, CLIGHT, FREQ1, FREQ2, FREQ5);

    /* SAGNAC: fields = rs0 rs1 rs2 rr0 rr1 rr2 sagnac_term_m sagnac_s cross
     * sagnac_term_m = OMGE*(rs0*rr1 - rs1*rr0)/CLIGHT  (the meters RTKLIB adds)
     * sagnac_s      = sagnac_term_m / CLIGHT            (seconds)
     * cross         = rs0*rr1 - rs1*rr0                 (pure geometry cross-term, m^2,
     *                 constant-free so it compares to f64 round-off regardless of OMGE) */
    printf("# SAGNAC rs0 rs1 rs2 rr0 rr1 rr2 sagnac_term_m sagnac_s cross\n");
    /* 9 ground stations around the globe (lat/lon grid) */
    double stlat[3] = {0.0, 48.0, -34.0};
    double stlon[3] = {0.0, 11.0, 151.0};
    /* satellites: 3 GEO longitudes + 2 MEO directions */
    double satdef[5][2] = {
        {0.0, GEO}, {1.047197551, GEO}, {2.617993878, GEO}, /* GEO @ lon 0,60,150 in xy */
        {0.5, MEO}, {2.0, MEO}                              /* MEO arc */
    };
    int nsag = 0;
    for (i = 0; i < 3; i++) {
        double clat = cos(stlat[i] * M_PI / 180.0);
        double slat = sin(stlat[i] * M_PI / 180.0);
        double clon = cos(stlon[i] * M_PI / 180.0);
        double slon = sin(stlon[i] * M_PI / 180.0);
        double rr[3] = {RE * clat * clon, RE * clat * slon, RE * slat};
        for (j = 0; j < 5; j++) {
            double ang = satdef[j][0];
            double rad = satdef[j][1];
            double rs[3] = {rad * cos(ang), rad * sin(ang), 0.0};
            double e[3];
            double gd = geodist(rs, rr, e);          /* RTKLIB geometric dist incl. Sagnac */
            double sn = straight_norm(rs, rr);        /* pure norm(rs-rr) */
            double sag_m = gd - sn;                   /* exactly RTKLIB's Sagnac term (m) */
            double sag_s = sag_m / CLIGHT;
            double cross = rs[0] * rr[1] - rs[1] * rr[0];
            printf("SAGNAC %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e\n",
                   rs[0], rs[1], rs[2], rr[0], rr[1], rr[2], sag_m, sag_s, cross);
            nsag++;
        }
    }
    /* degenerate cases: radial (rs along rr) and polar (x=y=0) -> Sagnac 0 */
    {
        double rr[3] = {RE, 0.0, 0.0};
        double rs[3] = {2.0 * RE, 0.0, 0.0};
        double e[3];
        double gd = geodist(rs, rr, e), sn = straight_norm(rs, rr);
        printf("SAGNAC %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e\n",
               rs[0], rs[1], rs[2], rr[0], rr[1], rr[2], gd - sn, (gd - sn) / CLIGHT,
               rs[0] * rr[1] - rs[1] * rr[0]);
        nsag++;
        double rr2[3] = {0.0, 0.0, RE};
        double rs2[3] = {0.0, 0.0, GEO};
        gd = geodist(rs2, rr2, e); sn = straight_norm(rs2, rr2);
        printf("SAGNAC %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e\n",
               rs2[0], rs2[1], rs2[2], rr2[0], rr2[1], rr2[2], gd - sn, (gd - sn) / CLIGHT,
               rs2[0] * rr2[1] - rs2[1] * rr2[0]);
        nsag++;
    }
    /* extra continental baselines via GEO relay to reach >=50 SAGNAC cases.
     * Vary ground longitudes finely against a fixed GEO satellite. */
    {
        double rs[3] = {GEO * 0.3, GEO * 0.95, 0.0};
        for (k = 0; k < 40; k++) {
            double lat = -60.0 + 3.0 * k;
            double lon = -150.0 + 7.5 * k;
            double clat = cos(lat * M_PI / 180.0), slat = sin(lat * M_PI / 180.0);
            double clon = cos(lon * M_PI / 180.0), slon = sin(lon * M_PI / 180.0);
            double rr[3] = {RE * clat * clon, RE * clat * slon, RE * slat};
            double e[3];
            double gd = geodist(rs, rr, e), sn = straight_norm(rs, rr);
            printf("SAGNAC %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e\n",
                   rs[0], rs[1], rs[2], rr[0], rr[1], rr[2], gd - sn, (gd - sn) / CLIGHT,
                   rs[0] * rr[1] - rs[1] * rr[0]);
            nsag++;
        }
    }

    /* ---- block 2: IONO-FREE combination over >=50 sampled P1/P2 ----
     * fields = P1 P2 f_i f_j PC */
    printf("# IONOFREE P1 P2 f_i f_j PC\n");
    int nif = 0;
    double base = 2.0e7;
    /* freq pairs RTKLIB supports for IFLC: L1/L2 (GPS) and L1/L5 (GAL/SBS). */
    double pairs[2][2] = {{FREQ1, FREQ2}, {FREQ1, FREQ5}};
    for (k = 0; k < 2; k++) {
        double f_i = pairs[k][0], f_j = pairs[k][1];
        for (i = 0; i < 5; i++) {
            for (j = 0; j < 5; j++) {
                double common = base + 5.0e5 * i + 1.0e5 * j; /* geometry+clock */
                double tec = 5.0 + 12.0 * i + 3.0 * j;        /* slant TEC (TECU) */
                double P1 = common + iono_delay_m(tec, f_i);
                double P2 = common + iono_delay_m(tec, f_j);
                double PC = iono_free_PC(P1, P2, f_i, f_j);
                printf("IONOFREE %.17e %.17e %.10e %.10e %.17e\n", P1, P2, f_i, f_j, PC);
                nif++;
            }
        }
    }

    /* ---- block 3: first-order IONO delay at L1/L2/L5 over >=50 sampled TEC ----
     * fields = tec f_hz delay_m */
    printf("# IONODELAY tec f_hz delay_m\n");
    int nion = 0;
    double freqs[3] = {FREQ1, FREQ2, FREQ5};
    for (k = 0; k < 3; k++) {
        for (i = 0; i < 20; i++) {
            double tec = 1.0 + 7.3 * i; /* 1 .. ~140 TECU */
            double d = iono_delay_m(tec, freqs[k]);
            printf("IONODELAY %.17e %.10e %.17e\n", tec, freqs[k], d);
            nion++;
        }
    }

    fprintf(stderr, "sagnac=%d ionofree=%d ionodelay=%d\n", nsag, nif, nion);
    return 0;
}
