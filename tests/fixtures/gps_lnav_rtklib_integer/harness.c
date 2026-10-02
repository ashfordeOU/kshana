/* SPDX-License-Identifier: BSD-2-Clause */
/* Oracle harness for tests/gps_lnav_rtklib_integer_oracle.rs, built against RTKLIB v2.4.2-p13
 * (commit 71db0ffa, BSD-2-Clause) as a separate program.
 *   harness parse <rinex nav>   : RTKLIB readrnx; for GPS PRN 1-32 the ephemeris with the
 *                                 earliest t_oe; prints the values RTKLIB parsed as JSON.
 *   harness decode < words      : as tests/fixtures/gps_lnav_rtklib_decode/harness.c, plus each
 *                                 decoded field as the integer RTKLIB's value represents:
 *                                 round(value / RTKLIB's own scale constant). */
#include <math.h>
#include <stdio.h>
#include <string.h>
#include "rtklib.h"

static void parse(const char *file)
{
    static obs_t obs; static nav_t nav; static sta_t sta;
    if (readrnx(file, 0, "", &obs, &nav, &sta) <= 0) { fprintf(stderr, "readrnx failed\n"); return; }
    printf("{\"oracle\": \"RTKLIB v2.4.2-p13 readrnx\", \"sats\": [\n");
    int first = 1;
    for (int prn = 1; prn <= 32; prn++) {
        int sat = satno(SYS_GPS, prn), best = -1;
        for (int i = 0; i < nav.n; i++)
            if (nav.eph[i].sat == sat && (best < 0 || timediff(nav.eph[i].toe, nav.eph[best].toe) < 0)) best = i;
        if (best < 0) continue;
        eph_t *e = &nav.eph[best];
        int week; double toe = time2gpst(e->toe, &week), toc = time2gpst(e->toc, NULL);
        printf("%s {\"prn\": %d, \"week\": %d, \"toe\": %.17g, \"toc\": %.17g, \"iode\": %d, \"iodc\": %d, \"svh\": %d, \"code\": %d,\n",
               first ? "" : ",", prn, week, toe, toc, e->iode, e->iodc, e->svh, e->code);
        printf("  \"f0\": %.17g, \"f1\": %.17g, \"f2\": %.17g, \"tgd\": %.17g, \"crs\": %.17g, \"deln\": %.17g, \"M0\": %.17g, \"cuc\": %.17g, \"e\": %.17g,\n",
               e->f0, e->f1, e->f2, e->tgd[0], e->crs, e->deln, e->M0, e->cuc, e->e);
        printf("  \"cus\": %.17g, \"sqrtA\": %.17g, \"cic\": %.17g, \"OMG0\": %.17g, \"cis\": %.17g, \"i0\": %.17g, \"crc\": %.17g, \"omg\": %.17g, \"OMGd\": %.17g, \"idot\": %.17g}\n",
               e->cus, sqrt(e->A), e->cic, e->OMG0, e->cis, e->i0, e->crc, e->omg, e->OMGd, e->idot);
        first = 0;
    }
    printf("]}\n");
}

static void decode(void)
{
    int prn, first = 1;
    unsigned int prev, w[30];
    printf("{\"oracle\": \"RTKLIB v2.4.2-p13 decode_word/decode_frame\", \"sats\": [\n");
    while (scanf("%d %u", &prn, &prev) == 2) {
        for (int k = 0; k < 30; k++) if (scanf("%u", &w[k]) != 1) return;
        unsigned char buff[90];
        int parity_ok = 0, ret[3];
        unsigned int last = prev;
        memset(buff, 0, sizeof(buff));
        for (int k = 0; k < 30; k++) {
            parity_ok += decode_word(((last & 3u) << 30) | (w[k] & 0x3FFFFFFFu), buff + 3 * k);
            last = w[k];
        }
        eph_t e = {0};
        for (int sf = 0; sf < 3; sf++) ret[sf] = decode_frame(buff + 30 * sf, &e, NULL, NULL, NULL, NULL);
        int week;
        double toc = time2gpst(e.toc, &week);
        printf("%s {\"prn\": %d, \"parity_ok\": %d, \"ret\": [%d, %d, %d], \"week\": %d, \"toc\": %.17g, \"toes\": %.17g, \"iode\": %d, \"iodc\": %d, \"svh\": %d, \"code\": %d,\n",
               first ? "" : ",", prn, parity_ok, ret[0], ret[1], ret[2], e.week, toc, e.toes, e.iode, e.iodc, e.svh, e.code);
        printf("  \"tgd\": %.0f, \"af2\": %.0f, \"af1\": %.0f, \"af0\": %.0f, \"crs\": %.0f, \"delta_n\": %.0f, \"m0\": %.0f, \"cuc\": %.0f, \"e\": %.0f,\n",
               round(e.tgd[0] / P2_31), round(e.f2 / P2_55), round(e.f1 / P2_43), round(e.f0 / P2_31), round(e.crs / P2_5),
               round(e.deln / (P2_43 * SC2RAD)), round(e.M0 / (P2_31 * SC2RAD)), round(e.cuc / P2_29), round(e.e / P2_33));
        printf("  \"cus\": %.0f, \"sqrt_a\": %.0f, \"cic\": %.0f, \"omega0\": %.0f, \"cis\": %.0f, \"i0\": %.0f, \"crc\": %.0f, \"omega\": %.0f, \"omega_dot\": %.0f, \"idot\": %.0f}\n",
               round(e.cus / P2_29), round(sqrt(e.A) / P2_19), round(e.cic / P2_29), round(e.OMG0 / (P2_31 * SC2RAD)), round(e.cis / P2_29),
               round(e.i0 / (P2_31 * SC2RAD)), round(e.crc / P2_5), round(e.omg / (P2_31 * SC2RAD)), round(e.OMGd / (P2_43 * SC2RAD)),
               round(e.idot / (P2_43 * SC2RAD)));
        first = 0;
    }
    printf("]}\n");
}

int main(int argc, char **argv)
{
    if (argc == 3 && !strcmp(argv[1], "parse")) parse(argv[2]);
    else if (argc == 2 && !strcmp(argv[1], "decode")) decode();
    else { fprintf(stderr, "usage: harness parse <nav> | harness decode < words\n"); return 2; }
    return 0;
}
