/* SPDX-License-Identifier: BSD-2-Clause */
/* Oracle harness for tests/gps_lnav_rtklib_decode_oracle.rs: decode Kshana-encoded GPS LNAV
 * subframes 1-3 with RTKLIB v2.4.2-p13 (commit 71db0ffa, BSD-2-Clause), a separate program.
 * Input (stdin): one line per satellite, "prn prev w1 ... w30", decimal 30-bit transmitted
 * words and the word sent before subframe 1. For every word RTKLIB's decode_word checks the
 * parity (given the previous word's D29*, D30*) and extracts the 24 data bits; decode_frame
 * then decodes subframes 1, 2 and 3 into an eph_t. Output: JSON, one object per satellite. */
#include <stdio.h>
#include <string.h>
#include "rtklib.h"

int main(void)
{
    int prn, first = 1;
    unsigned int prev, w[30];
    printf("{\"oracle\": \"RTKLIB v2.4.2-p13 decode_word/decode_frame\", \"sats\": [\n");
    while (scanf("%d %u", &prn, &prev) == 2) {
        for (int k = 0; k < 30; k++) if (scanf("%u", &w[k]) != 1) return 1;
        unsigned char buff[90];
        int parity_ok = 0, ret[3];
        unsigned int last = prev;
        memset(buff, 0, sizeof(buff));
        for (int k = 0; k < 30; k++) {
            unsigned int word = ((last & 3u) << 30) | (w[k] & 0x3FFFFFFFu);
            parity_ok += decode_word(word, buff + 3 * k);
            last = w[k];
        }
        eph_t eph = {0};
        for (int sf = 0; sf < 3; sf++) ret[sf] = decode_frame(buff + 30 * sf, &eph, NULL, NULL, NULL, NULL);
        int week;
        double toc = time2gpst(eph.toc, &week), ttr = time2gpst(eph.ttr, NULL);
        printf("%s {\"prn\": %d, \"parity_ok\": %d, \"ret\": [%d, %d, %d], \"week\": %d, \"code\": %d, \"sva\": %d, \"svh\": %d, \"iodc\": %d, \"iode\": %d, \"flag\": %d,\n",
               first ? "" : ",", prn, parity_ok, ret[0], ret[1], ret[2], eph.week, eph.code, eph.sva, eph.svh, eph.iodc, eph.iode, eph.flag);
        printf("  \"tgd\": %.17g, \"toc\": %.17g, \"ttr\": %.17g, \"f0\": %.17g, \"f1\": %.17g, \"f2\": %.17g, \"crs\": %.17g, \"deln\": %.17g, \"M0\": %.17g,\n",
               eph.tgd[0], toc, ttr, eph.f0, eph.f1, eph.f2, eph.crs, eph.deln, eph.M0);
        printf("  \"cuc\": %.17g, \"e\": %.17g, \"cus\": %.17g, \"A\": %.17g, \"toes\": %.17g, \"fit\": %.17g, \"cic\": %.17g, \"OMG0\": %.17g,\n",
               eph.cuc, eph.e, eph.cus, eph.A, eph.toes, eph.fit, eph.cic, eph.OMG0);
        printf("  \"cis\": %.17g, \"i0\": %.17g, \"crc\": %.17g, \"omg\": %.17g, \"OMGd\": %.17g, \"idot\": %.17g}\n",
               eph.cis, eph.i0, eph.crc, eph.omg, eph.OMGd, eph.idot);
        first = 0;
    }
    printf("]}\n");
    return 0;
}
