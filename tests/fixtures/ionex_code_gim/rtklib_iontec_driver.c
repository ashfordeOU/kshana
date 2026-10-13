/* SPDX-License-Identifier: AGPL-3.0-only
 * Vertical TEC of an IONEX file by RTKLIB v2.4.2-p13 iontec(), for the data-gated B6 check of
 * tests/ionex_code_gim_oracle.rs. Reads query rows "t_s,lat_deg,lon_deg" (t in seconds after the
 * first map's day start, UT) from stdin, writes "time,lat,lon,vtec" (TECU). The zenith query
 * (elevation 90 deg) makes RTKLIB's mapping factor 1, so vtec = delay / (40.3e16 / f1^2).
 * opt = 1: RTKLIB's sun-fixed (rotated-map) interpolation; opt = 0: earth-fixed.
 * Usage: driver <ionex file> <opt> < queries.csv > out.csv   (built by run_rtklib.sh)
 */
#include <stdio.h>
#include <stdlib.h>
#include "rtklib.h"

int main(int argc, char **argv)
{
    nav_t nav = {0};
    double ep0[6] = {2018, 5, 13, 0, 0, 0}, pos[3], azel[2] = {0.0, PI / 2.0}, delay, var;
    const double fact = 40.30E16 / FREQ1 / FREQ1;
    double t, lat, lon;
    char line[256];
    int opt;
    if (argc < 3) return 2;
    opt = atoi(argv[2]);
    readtec(argv[1], &nav, 0);
    if (nav.nt <= 0) { fprintf(stderr, "no TEC maps read\n"); return 1; }
    printf("time,lat,lon,vtec\n");
    while (fgets(line, sizeof line, stdin)) {
        if (sscanf(line, "%lf,%lf,%lf", &t, &lat, &lon) != 3) continue;
        pos[0] = lat * D2R; pos[1] = lon * D2R; pos[2] = 0.0;
        if (!iontec(timeadd(epoch2time(ep0), t), &nav, pos, azel, opt, &delay, &var)) {
            printf("%.6f,%.6f,%.6f,nan\n", t, lat, lon);
            continue;
        }
        printf("%.6f,%.6f,%.6f,%.12f\n", t, lat, lon, delay / fact);
    }
    return 0;
}
