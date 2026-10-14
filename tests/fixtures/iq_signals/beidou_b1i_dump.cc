// SPDX-License-Identifier: AGPL-3.0-only
// Harness: print the B1I code of PRN 1..63 from GNSS-SDR's beidou_b1i_code_gen_int,
// one line per PRN: "<prn> <2046 chars of 0/1>", logic bit = (value == +1).
#include "beidou_b1i_signal_replica.h"
#include <array>
#include <cstdio>
int main() {
    for (int prn = 1; prn <= 63; ++prn) {
        std::array<int32_t, 2046> c{};
        beidou_b1i_code_gen_int(own::span<int32_t>(c.data(), c.size()), prn, 0);
        std::printf("%d ", prn);
        for (auto v : c) {
            if (v != 1 && v != -1) { std::fprintf(stderr, "bad value %d\n", v); return 1; }
            std::putchar(v == 1 ? '1' : '0');
        }
        std::putchar('\n');
    }
}
