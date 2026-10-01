/* SPDX-License-Identifier: AGPL-3.0-only
 *
 * RTKLIB external-oracle driver for kshana LAMBDA integer ambiguity resolution.
 *
 * Oracle:  RTKLIB v2.4.2-p13 (T. Takasu), BSD-2-Clause,
 *          https://github.com/tomojitakasu/RTKLIB (tag v2.4.2-p13, commit 71db0ffa).
 *          src/lambda.c lambda(n, m, a, Q, F, s): LD factorisation, LAMBDA reduction
 *          (integer Gauss transformations and permutations) and the MLAMBDA search of
 *          Chang, Yang and Zhou (2005), returning the m best integer candidates and their
 *          squared norms (a - F)' Q^-1 (a - F).
 * Licence: RTKLIB is compiled separately as a tool; nothing of it is vendored into the
 *          crate. Only the numeric output of this driver is committed.
 *
 * The driver generates 300 problems from a fixed xorshift64 seed. For each problem:
 *   n  uniform in 2..=10;
 *   A  (n x n) and G (n x 3) integer matrices with entries in [-9, 9];
 *   Q  = (A A' + 64 G G' + I) / 256, every entry an exact binary fraction, so the Rust
 *        test rebuilds a bit-identical Q from the printed integers;
 *   a  float ambiguities uniform in [-50, 50] cycles, printed with %.17g (exact round trip).
 * It calls lambda(n, 2, a, Q, F, s) and prints one record per problem:
 *   P <n> <info>
 *   A <n*n integers, row-major>
 *   G <n*3 integers, row-major>
 *   a <n floats>
 *   F1 <n integers: best candidate>      (only when info == 0)
 *   F2 <n integers: second candidate>
 *   s <s[0]> <s[1]>
 *
 * Reproduce (from the repository root, with the oracle toolchain of ~/Code/kshana-oracles):
 *   cc -O2 -ffp-contract=off -D_DARWIN_C_SOURCE -I"$RTKLIB/src" \
 *      tests/fixtures/lambda_rtklib_oracle/rtklib_lambda_driver.c \
 *      "$RTKLIB/src/lambda.c" "$RTKLIB/src/rtkcmn.c" -lm -lpthread \
 *      -o <scratch>/rtklib_lambda_driver
 *   <scratch>/rtklib_lambda_driver > tests/fixtures/lambda_rtklib_oracle/rtklib_lambda_reference.txt
 */
#include <stdio.h>
#include <stdlib.h>
#include "rtklib.h"

#define NPROB 300

static unsigned long long rng_state = 0x9E3779B97F4A7C15ULL;

static unsigned long long xorshift64(void)
{
    unsigned long long x = rng_state;
    x ^= x << 13;
    x ^= x >> 7;
    x ^= x << 17;
    rng_state = x;
    return x;
}

/* integer uniform in [lo, hi] */
static int rand_int(int lo, int hi)
{
    return lo + (int)(xorshift64() % (unsigned long long)(hi - lo + 1));
}

/* double uniform in [0, 1) from the top 53 bits */
static double rand_unit(void)
{
    return (double)(xorshift64() >> 11) * (1.0 / 9007199254740992.0);
}

int main(void)
{
    int k, i, j, l, n, info, nfail = 0;
    int A[100], G[30];
    double Q[100], a[10], F[20], s[2];

    printf("# RTKLIB v2.4.2-p13 lambda() on %d problems; see rtklib_lambda_driver.c\n", NPROB);
    for (k = 0; k < NPROB; k++) {
        n = rand_int(2, 10);
        for (i = 0; i < n * n; i++) A[i] = rand_int(-9, 9);
        for (i = 0; i < n * 3; i++) G[i] = rand_int(-9, 9);
        for (i = 0; i < n; i++) a[i] = -50.0 + 100.0 * rand_unit();
        for (i = 0; i < n; i++) {
            for (j = 0; j < n; j++) {
                long acc = (i == j) ? 1 : 0;
                for (l = 0; l < n; l++) acc += (long)A[i * n + l] * A[j * n + l];
                for (l = 0; l < 3; l++) acc += 64L * G[i * 3 + l] * G[j * 3 + l];
                /* column-major and row-major coincide: Q is symmetric */
                Q[i + j * n] = (double)acc / 256.0;
            }
        }
        info = lambda(n, 2, a, Q, F, s);
        if (info) nfail++;
        printf("P %d %d\nA", n, info);
        for (i = 0; i < n * n; i++) printf(" %d", A[i]);
        printf("\nG");
        for (i = 0; i < n * 3; i++) printf(" %d", G[i]);
        printf("\na");
        for (i = 0; i < n; i++) printf(" %.17g", a[i]);
        printf("\n");
        if (!info) {
            printf("F1");
            for (i = 0; i < n; i++) printf(" %.0f", F[i]);
            printf("\nF2");
            for (i = 0; i < n; i++) printf(" %.0f", F[i + n]);
            printf("\ns %.17g %.17g\n", s[0], s[1]);
        }
    }
    printf("# rtklib_failures %d\n", nfail);
    return 0;
}
