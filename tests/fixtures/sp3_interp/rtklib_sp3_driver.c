/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * RTKLIB external-oracle driver for kshana SP3 precise-ephemeris interpolation
 * (Sp3Interpolator) validation.
 *
 * Oracle:  RTKLIB (T. Takasu) library version "2.4.2", patch level p13,
 *          git tag v2.4.2-p13, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807
 *          (2018-01-30). github.com/tomojitakasu/RTKLIB. BSD-2-Clause + two
 *          non-commercial/non-exclusivity clauses (see NOTICE).
 *
 * This driver links against RTKLIB's ACTUAL C functions:
 *   - readsp3()  (src/preceph.c)  : parse an SP3-c precise-ephemeris file into a
 *                                    nav_t of peph_t tabulated ECEF positions,
 *                                    using RTKLIB's own SP3 reader.
 *   - peph2pos() (src/preceph.c)  : the de-facto IGS reference precise-ephemeris
 *                                    interpolator. Internally pephpos() fits an
 *                                    11-point (NMAX=10) polynomial by Neville's
 *                                    algorithm over the epochs bracketing the
 *                                    query time, AFTER rotating each tabulated
 *                                    node about +Z by OMGE*(t_node - t_eval) so
 *                                    every node is expressed in the Earth-fixed
 *                                    frame at the SAME evaluation instant
 *                                    ("correction for earth rotation ver.2.4.0",
 *                                    preceph.c). It is THIS Earth-rotation node
 *                                    correction that kshana's Sp3Interpolator is
 *                                    validated against.
 *   - gpst2time()/timeadd()/satno()/satno2id() : time and satellite-id
 *     primitives (src/rtkcmn.c).
 *
 * Compiled with -ULAPACK so the pure-C path is used (no BLAS/LAPACK).
 *
 * INDEPENDENCE / WHAT IS VALIDATED:
 *   Both sides read the IDENTICAL vendored SP3 file (igs16296_sp3_slice.sp3).
 *   RTKLIB parses it with its own SP3 reader and interpolates with peph2pos()
 *   (with its Earth-rotation per-node correction + 11-point Neville fit). kshana
 *   parses the same bytes with kshana::sp3::parse_sp3 and interpolates with
 *   kshana::sp3::Sp3Interpolator::position_ecef. Agreement is a genuine
 *   cross-implementation check of the precise-ephemeris interpolation algorithm,
 *   specifically the Earth-rotation node correction that this task adds to kshana.
 *
 * peph2pos() returns rs[0..2] = the satellite ECEF position (m) at `time`
 * (opt=0, no antenna-phase-center offset), i.e. exactly the interpolated node
 * position. That is the quantity emitted and compared.
 *
 * TIME BASE:
 *   The SP3 file is on the GPS time scale (its %c header line says GPS), and
 *   RTKLIB's readsp3b keeps the epochs in GPST. The file's first epoch is GPS
 *   week 1629, second-of-week 518400.0 (2011-04-02 00:00:00 GPST), 15-minute
 *   (900 s) grid, 96 epochs. We sample at OFF-NODE instants t = 518400 + 900*k
 *   + frac, for several k and several fractional offsets `frac` inside the grid
 *   step, so the polynomial interpolation (not mere node lookup) is exercised.
 *   The Rust side drives kshana at the matching seconds-from-file-start
 *   t_s = 900*k + frac (the SP3 file start is t_s = 0), so both compute the same
 *   query instant relative to the same tabulated grid.
 *
 * Emits one fixture line per (sat, k, frac):
 *   <satid> <k> <frac> <t_s> <X> <Y> <Z>
 * where satid is the SP3 satellite id (e.g. G05), k the grid index of the
 * preceding node, frac the fractional offset (s) past that node, t_s the seconds
 * from the SP3 file start (= 900*k + frac, the value kshana is queried at), and
 * X,Y,Z the RTKLIB peph2pos ECEF position (m) to 17 significant digits.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "rtklib.h"

/* RTKLIB requires these globals to be defined by the application. */
int    showmsg(char *format, ...)        { (void)format; return 0; }
void   settspan(gtime_t ts, gtime_t te)  { (void)ts; (void)te; }
void   settime (gtime_t time)            { (void)time; }

/* SP3 file grid (read from the file's header line 2): GPS week and start
 * second-of-week, grid step. Kept here as constants for the query construction;
 * they describe the vendored igs16296 slice. */
#define SP3_WEEK   1629
#define SP3_SEC0   518400.0   /* second-of-week of epoch 0 (GPST) */
#define SP3_STEP   900.0      /* epoch spacing (s) */

/* Satellites to validate (a spread of GPS PRNs present in the file). */
static const char *SATS[] = {
    "G01", "G05", "G11", "G17", "G24", "G31"
};
static const int NSATS = (int)(sizeof(SATS) / sizeof(SATS[0]));

/* Grid indices of the node PRECEDING each query (interior, so the 11-point
 * window is fully populated on both sides; the file has 96 epochs 0..95). */
static const int KIDX[] = { 20, 40, 60, 80 };
static const int NKIDX = (int)(sizeof(KIDX) / sizeof(KIDX[0]));

/* Fractional offsets (s) past the preceding node, strictly inside one 900 s
 * step, so every query is OFF-NODE (interpolated, not a tabulated value). */
static const double FRAC[] = { 112.5, 450.0, 675.0 };
static const int NFRAC = (int)(sizeof(FRAC) / sizeof(FRAC[0]));

int main(int argc, char **argv)
{
    if (argc < 2) {
        fprintf(stderr, "usage: %s <sp3_file>\n", argv[0]);
        return 2;
    }
    nav_t nav = {0};

    readsp3(argv[1], &nav, 0);
    if (nav.ne <= 0) {
        fprintf(stderr, "no precise ephemerides read from %s\n", argv[1]);
        return 3;
    }

    for (int s = 0; s < NSATS; s++) {
        int sat = satid2no((char *)SATS[s]);
        if (sat <= 0) {
            fprintf(stderr, "unknown sat id %s\n", SATS[s]);
            continue;
        }
        for (int ik = 0; ik < NKIDX; ik++) {
            for (int jf = 0; jf < NFRAC; jf++) {
                int    k    = KIDX[ik];
                double frac = FRAC[jf];
                double sow  = SP3_SEC0 + SP3_STEP * (double)k + frac;
                gtime_t t   = gpst2time(SP3_WEEK, sow);
                double  ts  = SP3_STEP * (double)k + frac; /* s from file start */

                double rs[6] = {0}, dts[2] = {0}, var = 0.0;
                if (!peph2pos(t, sat, &nav, 0, rs, dts, &var)) {
                    fprintf(stderr, "peph2pos failed for %s k=%d frac=%.1f\n",
                            SATS[s], k, frac);
                    continue;
                }
                printf("%s %d %.6f %.6f %.17e %.17e %.17e\n",
                       SATS[s], k, frac, ts, rs[0], rs[1], rs[2]);
            }
        }
    }

    free(nav.peph);
    return 0;
}
