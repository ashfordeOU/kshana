/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * External oracle for kshana lunar_dpnt: single-difference range residual + WLS
 * position-error magnitude, computed with RTKLIB 2.4.3 primitives.
 *
 * Links against RTKLIB's rtkcmn.c (compiled with -ULAPACK so the pure-C
 * matmul/matinv/ludcmp/lubksb path is used; no BLAS/LAPACK dependency). The
 * line-of-sight unit vectors use RTKLIB's dot()/norm(); the 4-parameter
 * (x,y,z,clk) weighted-least-squares solve uses RTKLIB's lsq() exactly as
 * pntpos.c's estpos() does (x = (A A^T)^-1 A y, A built column-major as the
 * transposed design matrix, m measurements x n=4 params).
 *
 * Reads the kshana-dumped geometry on stdin (one block per case):
 *   CASE <seed> <baseline_km> <n>
 *   REF  rx ry rz
 *   USER ux uy uz
 *   SAT  sx sy sz OE ex ey ez CE c        (n lines)
 * Emits one fixture line per case:
 *   <seed> <baseline_km> <n> <poserr_corrected_m> <max_abs_sd_residual_m> <sd0..sd{n-1}>
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* RTKLIB primitives we use (defined in rtkcmn.c, compiled -ULAPACK). */
extern double dot(const double *a, const double *b, int n);
extern double norm(const double *a, int n);
extern int lsq(const double *A, const double *y, int n, int m, double *x, double *Q);

/* LOS unit vector from observer o to sat s, via RTKLIB dot/norm. */
static void los_unit(const double *o, const double *s, double *e)
{
    double d[3];
    int i;
    for (i = 0; i < 3; i++) d[i] = s[i] - o[i];
    double r = norm(d, 3);
    if (r == 0.0) { e[0] = e[1] = e[2] = 0.0; return; }
    for (i = 0; i < 3; i++) e[i] = d[i] / r;
}

int main(void)
{
    char tag[16];
    int seed, n;
    double baseline;

    while (scanf("%15s", tag) == 1) {
        if (strcmp(tag, "CASE") != 0) {
            /* skip stray token */
            continue;
        }
        if (scanf("%d %lf %d", &seed, &baseline, &n) != 3) break;

        double ref[3], usr[3];
        if (scanf("%15s %lf %lf %lf", tag, &ref[0], &ref[1], &ref[2]) != 4) break; /* REF */
        if (scanf("%15s %lf %lf %lf", tag, &usr[0], &usr[1], &usr[2]) != 4) break; /* USER */

        double *sx = malloc(sizeof(double) * 3 * n);
        double *oe = malloc(sizeof(double) * 3 * n);
        double *ce = malloc(sizeof(double) * n);
        for (int i = 0; i < n; i++) {
            char t1[16], t2[16];
            if (scanf("%15s %lf %lf %lf %15s %lf %lf %lf %15s %lf",
                      t1, &sx[3*i], &sx[3*i+1], &sx[3*i+2],
                      t2, &oe[3*i], &oe[3*i+1], &oe[3*i+2],
                      tag, &ce[i]) != 10) { fprintf(stderr, "parse fail\n"); return 2; }
        }

        /* Single-difference corrected range residual per satellite:
         *   corr_i = -e_i . u_ref  + c_i        (reference station residual)
         *   raw_i  = -e_i . u_user + c_i
         *   sd_i   = raw_i - corr_i = -e_i . (u_user - u_ref)   (clock cancels)
         * and build the WLS design rows g_i = [-ux,-uy,-uz, 1] about the user. */
        double *A = malloc(sizeof(double) * 4 * n); /* column-major: A[param + 4*meas] */
        double *y = malloc(sizeof(double) * n);
        double *sd = malloc(sizeof(double) * n);
        double max_abs = 0.0;

        for (int i = 0; i < n; i++) {
            double eu[3], er[3];
            los_unit(usr, &sx[3*i], eu);
            los_unit(ref, &sx[3*i], er);
            double corr = -dot(&oe[3*i], er, 3) + ce[i];
            double raw  = -dot(&oe[3*i], eu, 3) + ce[i];
            sd[i] = raw - corr;
            y[i] = sd[i];
            if (fabs(sd[i]) > max_abs) max_abs = fabs(sd[i]);
            /* design matrix row (transposed, column-major n=4 params): */
            A[0 + 4*i] = -eu[0];
            A[1 + 4*i] = -eu[1];
            A[2 + 4*i] = -eu[2];
            A[3 + 4*i] = 1.0;
        }

        /* WLS solve via RTKLIB lsq(): x = (A A^T)^-1 A y, params=4, meas=n. */
        double x[4], Q[16];
        double poserr = 0.0;
        int info = lsq(A, y, 4, n, x, Q);
        if (info == 0) poserr = sqrt(x[0]*x[0] + x[1]*x[1] + x[2]*x[2]);
        else poserr = -1.0; /* singular */

        printf("%d %g %d %.17e %.17e", seed, baseline, n, poserr, max_abs);
        for (int i = 0; i < n; i++) printf(" %.17e", sd[i]);
        printf("\n");

        free(sx); free(oe); free(ce); free(A); free(y); free(sd);
    }
    return 0;
}
