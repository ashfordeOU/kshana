/* SPDX-License-Identifier: AGPL-3.0-only
 * RTKLIB oracle for the GLONASS broadcast clock and orbit (tests/glonass_broadcast_rtklib_oracle.rs).
 * Reads a RINEX 3 navigation file with RTKLIB's own reader (readrnx) and, for every GLONASS
 * ephemeris and every offset of the pre-registered grid, prints RTKLIB's geph2clk (the satellite
 * clock bias at a time read on the satellite clock) and geph2pos (the PZ-90 position).
 * Output: prn,toe_utc (y m d h m s),dt_s,clk_s,x_m,y_m,z_m with %.17g. */
#include "rtklib.h"

static const double GRID[] = {
    -900, -870, -840, -810, -780, -750, -720, -690, -660, -630, -600, -570, -540, -510, -480,
    -450, -420, -390, -360, -330, -300, -270, -240, -210, -180, -150, -120, -90, -60, -30, 0,
    30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330, 360, 390, 420, 450, 480, 510, 540, 570,
    600, 630, 660, 690, 720, 750, 780, 810, 840, 870, 900,
    -0.5, 0.5, -7.25, 7.25, -59.9, 59.9, -60.1, 60.1, -451.3, 451.3, 899.99, -899.99};

int main(int argc, char **argv)
{
    obs_t obs = {0};
    nav_t nav = {0};
    sta_t sta = {{0}};
    int i, k, n = (int)(sizeof(GRID) / sizeof(GRID[0]));
    if (argc < 2) { fprintf(stderr, "usage: %s nav.rnx\n", argv[0]); return 2; }
    if (readrnx(argv[1], 0, "", &obs, &nav, &sta) <= 0) { fprintf(stderr, "readrnx failed\n"); return 1; }
    printf("prn,year,month,day,hour,minute,second,dt_s,clk_s,x_m,y_m,z_m\n");
    for (i = 0; i < nav.ng; i++) {
        const geph_t *g = nav.geph + i;
        int prn;
        double ep[6], rs[3], dts, var;
        satsys(g->sat, &prn);
        time2epoch(gpst2utc(g->toe), ep);
        for (k = 0; k < n; k++) {
            gtime_t t = timeadd(g->toe, GRID[k]);
            double clk = geph2clk(t, g);
            geph2pos(t, g, rs, &dts, &var);
            printf("%d,%d,%d,%d,%d,%d,%.6f,%.17g,%.17g,%.17g,%.17g,%.17g\n", prn, (int)ep[0],
                   (int)ep[1], (int)ep[2], (int)ep[3], (int)ep[4], ep[5], GRID[k], clk, rs[0],
                   rs[1], rs[2]);
        }
    }
    return 0;
}
