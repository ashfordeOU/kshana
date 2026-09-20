/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * External oracle (part 1 of 2) for kshana's lunar ARAIM protection level:
 * the GEOMETRY -> COVARIANCE step, computed by RTKLIB primitives compiled from C
 * source.
 *
 * Oracle: RTKLIB, T. Takasu. Library version string "2.4.2", patch level "p13"
 *         (git tag v2.4.2-p13), commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807.
 *         BSD 2-Clause + two non-exclusivity clauses; see the NOTICE beside this
 *         file. RTKLIB source is NOT vendored here -- the generator script fetches
 *         and compiles it.
 *
 * Functions used, all from src/rtkcmn.c compiled with -ULAPACK so the pure-C path
 * is selected (no BLAS/LAPACK is linked):
 *   norm()   : Euclidean norm, used for the line-of-sight unit vectors.
 *   lsq()    : the normal-equations least-squares solve RTKLIB's pntpos.c::estpos()
 *              drives. It forms Q = A*A' (= G^T G for a column-major transposed
 *              design matrix A) and inverts it IN PLACE, so on return Q holds
 *              (G^T G)^-1 -- exactly the unit-variance covariance factor kshana's
 *              raim.rs lsq_solution() builds.
 *   matinv() -> ludcmp()/lubksb() : Crout LU decomposition with partial pivoting,
 *              an algorithm distinct from kshana's hand-written Gauss-Jordan
 *              invert4() in src/orbit.rs.
 *
 * WHAT IS AND IS NOT INDEPENDENT HERE:
 *   The satellite and user positions are kshana's own illustrative Moonlight/LCNS-
 *   class geometry, handed to this driver as plain numbers on stdin. They are a
 *   MODELLED input, shared by both sides on purpose -- re-deriving them in C would
 *   only re-implement kshana. What is independent is the COMPUTATION on that
 *   geometry: RTKLIB's own line-of-sight normalisation, its own normal-matrix
 *   accumulation and its own LU inverse.
 *
 * Protocol -- stdin (one block per case, as dumped by the Rust side):
 *   CASE <label> <m> <sigma_ure_m> <p_hmi_vert> <p_hmi_horz> <p_fa>
 *   USER <ux> <uy> <uz>                     (MCMF metres)
 *   SAT  <sx> <sy> <sz>                     (MCMF metres; m lines)
 *
 * Protocol -- stdout (one line per hypothesis geometry):
 *   Q <label> <k> <q00> <q01> ... <q33>
 * where k = -1 is the all-in-view geometry and k = 0..m-1 is the geometry with
 * satellite k removed (the ARAIM single-fault sub-solutions). The 16 values are the
 * row-major 4x4 (G^T G)^-1 in the SAME Moon-fixed Cartesian frame the positions
 * arrive in -- no East/North/Up convention is applied here, so none is shared.
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

/* RTKLIB primitives (defined in rtkcmn.c, compiled with -ULAPACK). */
extern double norm(const double *a, int n);
extern int lsq(const double *A, const double *y, int n, int m, double *x, double *Q);

#define NPAR 4

/* One hypothesis geometry: rows [-e_x, -e_y, -e_z, 1] for the kept satellites,
 * packed column-major as RTKLIB's lsq() wants (A[param + NPAR*meas]), solved, and
 * printed. Returns 0 on success, non-zero if RTKLIB reported a singular normal
 * matrix. */
static int emit(const char *label, int k, const double *e, int m, const int *keep)
{
    double *A = (double *)malloc(sizeof(double) * NPAR * m);
    double *y = (double *)calloc(m, sizeof(double));
    double x[NPAR], Q[NPAR * NPAR];
    int kept = 0, i, info;

    for (i = 0; i < m; i++) {
        if (!keep[i]) continue;
        A[0 + NPAR * kept] = -e[3 * i + 0];
        A[1 + NPAR * kept] = -e[3 * i + 1];
        A[2 + NPAR * kept] = -e[3 * i + 2];
        A[3 + NPAR * kept] = 1.0;
        kept++;
    }
    info = lsq(A, y, NPAR, kept, x, Q);
    if (info == 0) {
        printf("Q %s %d", label, k);
        /* Q is column-major n x n but symmetric, so row-major output is the same. */
        for (i = 0; i < NPAR * NPAR; i++) printf(" %.17e", Q[i]);
        printf("\n");
    } else {
        fprintf(stderr, "lsq failed: case %s hypothesis %d info %d\n", label, k, info);
    }
    free(A);
    free(y);
    return info;
}

int main(void)
{
    char tag[32], label[64];
    int m, i, k, rc = 0;
    double sigma, phv, phh, pfa;

    while (scanf("%31s", tag) == 1) {
        if (strcmp(tag, "CASE") != 0) continue;
        if (scanf("%63s %d %lf %lf %lf %lf", label, &m, &sigma, &phv, &phh, &pfa) != 6) break;

        double usr[3];
        if (scanf("%31s %lf %lf %lf", tag, &usr[0], &usr[1], &usr[2]) != 4) break;

        double *sat = (double *)malloc(sizeof(double) * 3 * m);
        double *e = (double *)malloc(sizeof(double) * 3 * m);
        int *keep = (int *)malloc(sizeof(int) * m);
        for (i = 0; i < m; i++) {
            if (scanf("%31s %lf %lf %lf", tag, &sat[3 * i], &sat[3 * i + 1], &sat[3 * i + 2]) != 4) {
                fprintf(stderr, "parse failure in case %s\n", label);
                return 2;
            }
            double d[3];
            int j;
            for (j = 0; j < 3; j++) d[j] = sat[3 * i + j] - usr[j];
            double r = norm(d, 3); /* RTKLIB's own norm */
            for (j = 0; j < 3; j++) e[3 * i + j] = d[j] / r;
        }

        for (i = 0; i < m; i++) keep[i] = 1;
        rc |= emit(label, -1, e, m, keep);
        for (k = 0; k < m; k++) {
            keep[k] = 0;
            rc |= emit(label, k, e, m, keep);
            keep[k] = 1;
        }

        free(sat);
        free(e);
        free(keep);
    }
    return rc ? 1 : 0;
}
